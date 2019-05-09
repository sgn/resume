---
layout: post
title: The saga of my GnuPG key
comments: false
categories:
  - tips
tags:
  - unix
  - gnupg
---

In the last 12 months, my most active time with FLOSS.
I've used 4 GnuPG keys (5 if you wanna count the 0x10BD5567).

[The first one][1] was revoked since I think 2048 bits for master key is too small.

[The second one][2] was revoked within 6 hours
since I created it when I was too sleepy,
and I couldn't recall its password in the next morning.

[The third one][3] was intended to be my permanent key,
but I hadn't taken my backup lesson seriously.

I was free in that day,
and I decided to package something new for Void Linux project.
Something weird was blocked me when packaging them,
and after consulting `xbps-src`'s documentation, I naively run:

    ./xbps-src -m void-packages/masterdir zap

Turn out, there's [a bug with this option][xbps],
and that command tried to erase my `/`.

No need to say, I'm a lazy person, I didn't backup my main computer,
and I didn't save my master key in safe vault.

I lost all my GnuPG keys in the process.
Luckily, I have all sub-secret-keys in my phone
for password decryption and email verification.

I couldn't find anyway to sign [my fourth one][4] with [my third one][3],
hence, please find this blog and verify my ownership with both 2 keys by:
[my fourth public key exported here][5] and its [signature signed by my third key][6]

P/S: Lesson for me, always have backup.

[1]: http://keys.gnupg.net/pks/lookup?op=vindex&fingerprint=on&search=0xE01C514ED3A44E7A
[2]: http://keys.gnupg.net/pks/lookup?op=vindex&fingerprint=on&search=0x1C668DE30F63F2AE
[3]: http://keys.gnupg.net/pks/lookup?op=vindex&fingerprint=on&search=0x554961070A88B964
[4]: http://keys.gnupg.net/pks/lookup?op=vindex&fingerprint=on&search=0x7D953879560F17C2
[5]: DFB608D858E0F4F8.asc
[6]: DFB608D858E0F4F8.asc.gpg
[xbps]: https://github.com/void-linux/void-packages/pull/11005
