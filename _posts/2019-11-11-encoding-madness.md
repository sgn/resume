---
layout: post
title: Encoding madness
comments: false
categories:
  - encoding
tags:
  - encoding
---

UCS-2
-----

- This is what Windows API, (old) Java originally told you about Unicode,
their `wchar_t` (in Windows) and `char` (in Java) was told to handle all
Unicode codepoint. And it's incorrect.

- UCS-2 is a fixed-width 16-bit encoding that is capable to encode 65536
characters.

- But not so fast, because of BOM, and its reversed order. We couldn't archive
that much.

UTF-16:
-------

- Extended version of UCS-2, basicly UCS-2 with U+D800-U+DFFF reserved for
surrogate pairs to form high-codepoint characters.

- UTF-16's highest codepoint would be `U+10FFFF`, so they could encode about
1'112'06x' characters.

- Endianess:
    - UTF-16 text can be serialised in either Big Endian (Network Byte Order)
    or Little Endian.
    - UTF-16 text can be labeled as UTF-16BE, UTF-16LE or UTF-16.
    - If the text is labeled UTF-16, things started getting funny
        - If the text begin with BOM (0xFEFF), everything will be fine.
	- if no BOM is detected, text SHOULD be interpretted as utf16-be,
	  [RFC-2781, section #4.3][rfc-2781-4.3]
	- Yes, that's a SHOULD, and literally noone respect that, because most
	  of software out there (especially Windows's) is broken, and people
	  couldn't fix all the broken. Then, just follow suites.

UTF-8
-----

- The encoding that works.

- But, people have a lot of legacy to support.
Moving to utf-8 may break their system (looking at you, Windows).

- Because of broken legacy system, Windows people invented BOM for utf-8,
which isn't necessary (because utf-8 doesn't have the byte order to begin
with). UTF-8 with BOM also breaks POSIX script, which requires `#!` as 2 first
character in the script.

- But, without BOM, Windows and a lot of Microsoft's tools will consider your
  file encoded in some weird 8-bit-encoding, just try to compile your
  utf-8-w/o-BOM-encoded C code in Windows with Microsoft Visual Studio for fun.

ISO-2022 (the madness)
----------------------

- Yes, the madness one.
- Imagine you're working with a legacy system with Korean/Japanese (There're
  ISO-2022 for Chinese, but it's rarely used).
- There's this person in your database named (this name is invented) `miyuki`,
  written in utf-8: `みゆき`, but it's stored in ISO-2022-JP instead of utf-8.
- The question: check if a name encoded in ISO-2022-JP and provided by user is
  existed in our database, part of the name is OK, no need to do any fancy
  thing (fuzzy finding, etc...).
- That is: `みゆき` (input) would match:
    - `みゆき`,
    - `みゆきちゃん`,
    - `なおこみゆき`,
    - `なおこみゆきさま`
- Easy question! You would say! Just use `strncmp` for an exact match, or
  `strstr` for the occurence of substring.
###### Hell, no!!
- The nature of ISO-2022 is ISO-2022 tried to keep it compatible as much as
  possible with ASCII.
- ISO-2022 employs a special sequences of characters known as Escape sequences
  to switch between 8-bit encoding character with multibyte encoding characters.
- ISO-2022 doesn't require how often it should switch between ASCII and
  multibyte encoding.
- Thus, those 2 sequences of 8-bit-bytes are considered
  the same representation of `みゆき`:

      S1:
      00000000: 1b24 4224 5f1b 2842 1b24 4224 661b 2842  .$B$_.(B.$B$f.(B
      00000010: 1b24 4224 2d1b 2842                      .$B$-.(B

      S2:
      00000000: 1b24 4224 5f24 6624 2d1b 2842            .$B$_$f$-.(B

- What is the difference?
    - S1 uses a lazy, mostly stateless representation, whenever it wants to
      encode a non-ASCII character, it switches to multibyte encoding with
      `\x1b\x24\x42` (ESC $ B), shout the characters (2 bytes each), then
      switches back to ASCII with `\x1b\x28\x42`.
    - S1 uses a stateful representation, it only switches back to ASCII when
      it encounters ASCII character or end-of-string.
    - arguably, it's correct representation of empty string by just switch on
      and switch off multibyte mode, but it's too insane to come up with such
      representation.

- What should we do with this?
    - just convert to utf-8, it's the one that works.
    - or filters out continous switch on and off.


Just some random thought after being driven by this madness.

[rfc-2781-4.3]: https://tools.ietf.org/html/rfc2781#section-4.3
