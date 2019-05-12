---
layout: post
title: Android build, bison file not found
comments: false
categories:
  - build_system
  - lib32
tags:
  - linux
---

I'm trying to build the LineageOS for my Asus ZenPhone Max Pro M1.

    % brunch X00TD

gives me a weird error:

> prebuilts/misc/linux-x86/bison/bison: No such file or directory

But, the file is there.
While I'm trying to run that binary from the interactive session,
`bash` keep insisting to tell me the file isn't there!

Fortunately, from my experience with other libc implementations,
I know that dynamic-linked-binary in Linux doesn't magically run,
it's _interpretted_ by the libc.

    % ldd ./prebuilts/misc/linux-x86/bison/bison
         not a dynamic executable

In this case, this binary doesn't have its _interpretter_ installed.
The _interpretter_ in question is the **i386** version of _libc_.

Here is the fix: Pull my package manager and install the _libc_.

    % ldd ./prebuilts/misc/linux-x86/bison/bison
        linux-gate.so.1 (0xf7f9f000)
        libstdc++.so.6 => not found
        libm.so.6 => /usr/lib32/libm.so.6 (0xf7ea4000)
        libgcc_s.so.1 => not found
        libc.so.6 => /usr/lib32/libc.so.6 (0xf7cc7000)
        /lib/ld-linux.so.2 => /usr/lib/ld-linux.so.2 (0xf7fa0000)

---

UPDATE: 2019-05-12:

Not all binary in Linux needed to be interpretted.
Only the dynamically linked one is needed to be interpretted by its libc.
The static linked executable one is ready to run without the interpretter.
It's useful for a clean room environment like initrd, emergency shell,
package maker, containers, etc...

In fact, I always keep static busybox somewhere to fix my mess.
