---
layout: post
title: simple lock on suspend-hibernate for Void Linux
comments: false
categories:
  - lock
  - X11
tags:
  - linux
---

Void Linux uses a simple script (zzz) to suspend/hibernate the system.

Its job is very simple:
- run suspend's hooks
- write the power state to `/sys/power/state` (every thing in POSIX is a file)
- run resume's hooks upon resuming.

I'm using a very simple mechanism to lock my box.

    xss-lock -- slock

aka run the locker (slock) on screensaver.

And naively use this hook for suspend:

```
#!/bin/sh

if ! command -v xset >/dev/null 2>&1; then
	return
fi

for x in /tmp/.X11-unix/*; do
	[ -S $x ] &&  DISPLAY=":${x#/tmp/.X11-unix/X}" xset s activate
done
```

But it doesn't work as expected.

Well because Xorg is a display server.

Hence, I put this hack on

```
--- a/etc/zzz.d/suspend/01-activate-screensaver.sh
+++ b/etc/zzz.d/suspend/01-activate-screensaver.sh
@@ -7,3 +7,4 @@ fi
 for x in /tmp/.X11-unix/*; do
 	[ -S $x ] &&  DISPLAY=":${x#/tmp/.X11-unix/X}" xset s activate
 done
+sleep 1
```
