Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 639DC3EEC2F
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 14:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237250AbhHQMKH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 17 Aug 2021 08:10:07 -0400
Received: from www.linuxtv.org ([130.149.80.248]:50942 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236113AbhHQMKG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Aug 2021 08:10:06 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mFxuO-002n6k-Jw; Tue, 17 Aug 2021 12:09:32 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mFxuN-0028le-UP; Tue, 17 Aug 2021 12:09:30 +0000
Date:   Tue, 17 Aug 2021 12:09:30 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <493138498.18.1629202170859@builder.linuxtv.org>
In-Reply-To: <1619129671.17.1629201442955@builder.linuxtv.org>
References: <1619129671.17.1629201442955@builder.linuxtv.org>
Subject: Build failed in Jenkins: xawtv4 #27
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: xawtv4
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/xawtv4/27/display/redirect?page=changes>

Changes:

[Mauro Carvalho Chehab] tty: got rid of an undefined function


------------------------------------------
[...truncated 7.32 KB...]
+ make verbose=1
gcc -g -O2 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/X11R6/include/X11/fonts -I/usr/include/lqt -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -I./vbistuff -I./x11 -I./jwz -I./common -I./console -I./x11 -I./structs -I./libng -Llibng -DCONFIGFILE="/etc/X11/xawtvrc" -DLIBDIR="/usr/local/lib/xawtv4" -DDATADIR="/usr/local/share/xawtv" -DLOCALEDIR="/usr/local/share/locale" -DPACKAGE="xawtv" -DVERSION="4.0-pre" -fno-omit-frame-pointer -Wp,-MD,mk/console_streamer.tmp -c -o console/streamer.o console/streamer.c
gcc -g -O2 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/X11R6/include/X11/fonts -I/usr/include/lqt -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -I./vbistuff -I./x11 -I./jwz -I./common -I./console -I./x11 -I./structs -I./libng -Llibng -DCONFIGFILE="/etc/X11/xawtvrc" -DLIBDIR="/usr/local/lib/xawtv4" -DDATADIR="/usr/local/share/xawtv" -DLOCALEDIR="/usr/local/share/locale" -DPACKAGE="xawtv" -DVERSION="4.0-pre" -fno-omit-frame-pointer -Wp,-MD,mk/common_sound.tmp -c -o common/sound.o common/sound.c
gcc -g -O2 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/X11R6/include/X11/fonts -I/usr/include/lqt -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -I./vbistuff -I./x11 -I./jwz -I./common -I./console -I./x11 -I./structs -I./libng -Llibng -DCONFIGFILE="/etc/X11/xawtvrc" -DLIBDIR="/usr/local/lib/xawtv4" -DDATADIR="/usr/local/share/xawtv" -DLOCALEDIR="/usr/local/share/locale" -DPACKAGE="xawtv" -DVERSION="4.0-pre" -fno-omit-frame-pointer -Wp,-MD,mk/common_webcam.tmp -c -o common/webcam.o common/webcam.c
gcc -g -O2 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/X11R6/include/X11/fonts -I/usr/include/lqt -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -I./vbistuff -I./x11 -I./jwz -I./common -I./console -I./x11 -I./structs -I./libng -Llibng -DCONFIGFILE="/etc/X11/xawtvrc" -DLIBDIR="/usr/local/lib/xawtv4" -DDATADIR="/usr/local/share/xawtv" -DLOCALEDIR="/usr/local/share/locale" -DPACKAGE="xawtv" -DVERSION="4.0-pre" -fno-omit-frame-pointer -Wp,-MD,mk/common_tuning.tmp -c -o common/tuning.o common/tuning.c
gcc -g -O2 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/X11R6/include/X11/fonts -I/usr/include/lqt -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -I./vbistuff -I./x11 -I./jwz -I./common -I./console -I./x11 -I./structs -I./libng -Llibng -DCONFIGFILE="/etc/X11/xawtvrc" -DLIBDIR="/usr/local/lib/xawtv4" -DDATADIR="/usr/local/share/xawtv" -DLOCALEDIR="/usr/local/share/locale" -DPACKAGE="xawtv" -DVERSION="4.0-pre" -fno-omit-frame-pointer -Wp,-MD,mk/common_commands.tmp -c -o common/commands.o common/commands.c
gcc -g -O2 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/X11R6/include/X11/fonts -I/usr/include/lqt -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -I./vbistuff -I./x11 -I./jwz -I./common -I./console -I./x11 -I./structs -I./libng -Llibng -DCONFIGFILE="/etc/X11/xawtvrc" -DLIBDIR="/usr/local/lib/xawtv4" -DDATADIR="/usr/local/share/xawtv" -DLOCALEDIR="/usr/local/share/locale" -DPACKAGE="xawtv" -DVERSION="4.0-pre" -fno-omit-frame-pointer -Wp,-MD,mk/common_devs.tmp -c -o common/devs.o common/devs.c
gcc -g -O2 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/X11R6/include/X11/fonts -I/usr/include/lqt -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -I./vbistuff -I./x11 -I./jwz -I./common -I./console -I./x11 -I./structs -I./libng -Llibng -DCONFIGFILE="/etc/X11/xawtvrc" -DLIBDIR="/usr/local/lib/xawtv4" -DDATADIR="/usr/local/share/xawtv" -DLOCALEDIR="/usr/local/share/locale" -DPACKAGE="xawtv" -DVERSION="4.0-pre" -fno-omit-frame-pointer -Wp,-MD,mk/common_capture.tmp -c -o common/capture.o common/capture.c
gcc -g -O2 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/X11R6/include/X11/fonts -I/usr/include/lqt -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -I./vbistuff -I./x11 -I./jwz -I./common -I./console -I./x11 -I./structs -I./libng -Llibng -DCONFIGFILE="/etc/X11/xawtvrc" -DLIBDIR="/usr/local/lib/xawtv4" -DDATADIR="/usr/local/share/xawtv" -DLOCALEDIR="/usr/local/share/locale" -DPACKAGE="xawtv" -DVERSION="4.0-pre" -fno-omit-frame-pointer -Wp,-MD,mk/common_event.tmp -c -o common/event.o common/event.c
gcc -g -O2 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/X11R6/include/X11/fonts -I/usr/include/lqt -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -I./vbistuff -I./x11 -I./jwz -I./common -I./console -I./x11 -I./structs -I./libng -Llibng -DCONFIGFILE="/etc/X11/xawtvrc" -DLIBDIR="/usr/local/lib/xawtv4" -DDATADIR="/usr/local/share/xawtv" -DLOCALEDIR="/usr/local/share/locale" -DPACKAGE="xawtv" -DVERSION="4.0-pre" -fno-omit-frame-pointer -Wp,-MD,mk/common_fifo.tmp -c -o common/fifo.o common/fifo.c
gcc -g -O2 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/X11R6/include/X11/fonts -I/usr/include/lqt -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -I./vbistuff -I./x11 -I./jwz -I./common -I./console -I./x11 -I./structs -I./libng -Llibng -DCONFIGFILE="/etc/X11/xawtvrc" -DLIBDIR="/usr/local/lib/xawtv4" -DDATADIR="/usr/local/share/xawtv" -DLOCALEDIR="/usr/local/share/locale" -DPACKAGE="xawtv" -DVERSION="4.0-pre" -fno-omit-frame-pointer -Wp,-MD,mk/common_tv-config.tmp -c -o common/tv-config.o common/tv-config.c
gcc -g -O2 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/X11R6/include/X11/fonts -I/usr/include/lqt -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -I./vbistuff -I./x11 -I./jwz -I./common -I./console -I./x11 -I./structs -I./libng -Llibng -DCONFIGFILE="/etc/X11/xawtvrc" -DLIBDIR="/usr/local/lib/xawtv4" -DDATADIR="/usr/local/share/xawtv" -DLOCALEDIR="/usr/local/share/locale" -DPACKAGE="xawtv" -DVERSION="4.0-pre" -fno-omit-frame-pointer -Wp,-MD,mk/common_dvb-tuning.tmp -c -o common/dvb-tuning.o common/dvb-tuning.c
gcc -g -O2 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/X11R6/include/X11/fonts -I/usr/include/lqt -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -I./vbistuff -I./x11 -I./jwz -I./common -I./console -I./x11 -I./structs -I./libng -Llibng -DCONFIGFILE="/etc/X11/xawtvrc" -DLIBDIR="/usr/local/lib/xawtv4" -DDATADIR="/usr/local/share/xawtv" -DLOCALEDIR="/usr/local/share/locale" -DPACKAGE="xawtv" -DVERSION="4.0-pre" -fno-omit-frame-pointer -Wp,-MD,mk/libng_grab-ng.tmp -c -o libng/grab-ng.o libng/grab-ng.c
gcc -g -O2 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/X11R6/include/X11/fonts -I/usr/include/lqt -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -I./vbistuff -I./x11 -I./jwz -I./common -I./console -I./x11 -I./structs -I./libng -Llibng -DCONFIGFILE="/etc/X11/xawtvrc" -DLIBDIR="/usr/local/lib/xawtv4" -DDATADIR="/usr/local/share/xawtv" -DLOCALEDIR="/usr/local/share/locale" -DPACKAGE="xawtv" -DVERSION="4.0-pre" -fno-omit-frame-pointer -Wp,-MD,mk/libng_writefile.tmp -c -o libng/writefile.o libng/writefile.c
gcc -g -O2 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/X11R6/include/X11/fonts -I/usr/include/lqt -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -I./vbistuff -I./x11 -I./jwz -I./common -I./console -I./x11 -I./structs -I./libng -Llibng -DCONFIGFILE="/etc/X11/xawtvrc" -DLIBDIR="/usr/local/lib/xawtv4" -DDATADIR="/usr/local/share/xawtv" -DLOCALEDIR="/usr/local/share/locale" -DPACKAGE="xawtv" -DVERSION="4.0-pre" -fno-omit-frame-pointer -Wp,-MD,mk/libng_parse-mpeg.tmp -c -o libng/parse-mpeg.o libng/parse-mpeg.c
gcc -g -O2 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/X11R6/include/X11/fonts -I/usr/include/lqt -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -I./vbistuff -I./x11 -I./jwz -I./common -I./console -I./x11 -I./structs -I./libng -Llibng -DCONFIGFILE="/etc/X11/xawtvrc" -DLIBDIR="/usr/local/lib/xawtv4" -DDATADIR="/usr/local/share/xawtv" -DLOCALEDIR="/usr/local/share/locale" -DPACKAGE="xawtv" -DVERSION="4.0-pre" -fno-omit-frame-pointer -Wp,-MD,mk/libng_parse-dvb.tmp -c -o libng/parse-dvb.o libng/parse-dvb.c
common/devs.c: In function ‘device_probe_video’:
common/devs.c:127:15: warning: variable ‘add’ set but not used [-Wunused-but-set-variable]
  127 |     int err,i,add=0;
      |               ^~~
common/devs.c: In function ‘device_probe_dvb’:
common/devs.c:193:11: warning: variable ‘add’ set but not used [-Wunused-but-set-variable]
  193 |     int i,add = 0;
      |           ^~~
gcc -g -O2 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/X11R6/include/X11/fonts -I/usr/include/lqt -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -I./vbistuff -I./x11 -I./jwz -I./common -I./console -I./x11 -I./structs -I./libng -Llibng -DCONFIGFILE="/etc/X11/xawtvrc" -DLIBDIR="/usr/local/lib/xawtv4" -DDATADIR="/usr/local/share/xawtv" -DLOCALEDIR="/usr/local/share/locale" -DPACKAGE="xawtv" -DVERSION="4.0-pre" -fno-omit-frame-pointer -Wp,-MD,mk/libng_color_common.tmp -c -o libng/color_common.o libng/color_common.c
gcc -g -O2 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/X11R6/include/X11/fonts -I/usr/include/lqt -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -I./vbistuff -I./x11 -I./jwz -I./common -I./console -I./x11 -I./structs -I./libng -Llibng -DCONFIGFILE="/etc/X11/xawtvrc" -DLIBDIR="/usr/local/lib/xawtv4" -DDATADIR="/usr/local/share/xawtv" -DLOCALEDIR="/usr/local/share/locale" -DPACKAGE="xawtv" -DVERSION="4.0-pre" -fno-omit-frame-pointer -Wp,-MD,mk/libng_color_packed.tmp -c -o libng/color_packed.o libng/color_packed.c
gcc -g -O2 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/X11R6/include/X11/fonts -I/usr/include/lqt -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -I./vbistuff -I./x11 -I./jwz -I./common -I./console -I./x11 -I./structs -I./libng -Llibng -DCONFIGFILE="/etc/X11/xawtvrc" -DLIBDIR="/usr/local/lib/xawtv4" -DDATADIR="/usr/local/share/xawtv" -DLOCALEDIR="/usr/local/share/locale" -DPACKAGE="xawtv" -DVERSION="4.0-pre" -fno-omit-frame-pointer -Wp,-MD,mk/libng_color_lut.tmp -c -o libng/color_lut.o libng/color_lut.c
common/commands.c: In function ‘keypad_handler’:
common/commands.c:1184:18: warning: ‘%d’ directive writing between 1 and 10 bytes into a region of size 8 [-Wformat-overflow=]
 1184 |      sprintf(ch,"%d",n);
      |                  ^~
common/commands.c:1184:17: note: directive argument in the range [1, 2147483647]
 1184 |      sprintf(ch,"%d",n);
      |                 ^~~~
common/commands.c:1184:6: note: ‘sprintf’ output between 2 and 11 bytes into a destination of size 8
 1184 |      sprintf(ch,"%d",n);
      |      ^~~~~~~~~~~~~~~~~~
gcc -g -O2 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/X11R6/include/X11/fonts -I/usr/include/lqt -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -I./vbistuff -I./x11 -I./jwz -I./common -I./console -I./x11 -I./structs -I./libng -Llibng -DCONFIGFILE="/etc/X11/xawtvrc" -DLIBDIR="/usr/local/lib/xawtv4" -DDATADIR="/usr/local/share/xawtv" -DLOCALEDIR="/usr/local/share/locale" -DPACKAGE="xawtv" -DVERSION="4.0-pre" -fno-omit-frame-pointer -Wp,-MD,mk/libng_color_yuv2rgb.tmp -c -o libng/color_yuv2rgb.o libng/color_yuv2rgb.c
libng/parse-dvb.c: In function ‘parse_nit_desc_2’:
libng/parse-dvb.c:196:13: warning: variable ‘l’ set but not used [-Wunused-but-set-variable]
  196 |     int i,t,l;
      |             ^
libng/parse-dvb.c: In function ‘parse_sdt_desc’:
libng/parse-dvb.c:239:13: warning: variable ‘l’ set but not used [-Wunused-but-set-variable]
  239 |     int i,t,l;
      |             ^
libng/parse-dvb.c: In function ‘mpeg_parse_psi_nit’:
libng/parse-dvb.c:351:6: warning: the address of ‘network’ will always evaluate as ‘true’ [-Waddress]
  351 |  if (network)
      |      ^~~~~~~
gcc -g -O2 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/X11R6/include/X11/fonts -I/usr/include/lqt -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -I./vbistuff -I./x11 -I./jwz -I./common -I./console -I./x11 -I./structs -I./libng -Llibng -DCONFIGFILE="/etc/X11/xawtvrc" -DLIBDIR="/usr/local/lib/xawtv4" -DDATADIR="/usr/local/share/xawtv" -DLOCALEDIR="/usr/local/share/locale" -DPACKAGE="xawtv" -DVERSION="4.0-pre" -fno-omit-frame-pointer -Wp,-MD,mk/libng_convert.tmp -c -o libng/convert.o libng/convert.c
common/dvb-tuning.c: In function ‘fixup_numbers’:
common/dvb-tuning.c:329:5: warning: enumeration value ‘FE_ATSC’ not handled in switch [-Wswitch]
  329 |     switch (h->info.type) {
      |     ^~~~~~
common/dvb-tuning.c: In function ‘dump_fe_info’:
common/dvb-tuning.c:365:5: warning: enumeration value ‘FE_ATSC’ not handled in switch [-Wswitch]
  365 |     switch (h->info.type) {
      |     ^~~~~~
common/dvb-tuning.c: In function ‘dvb_frontend_tune’:
common/dvb-tuning.c:433:5: warning: enumeration value ‘FE_ATSC’ not handled in switch [-Wswitch]
  433 |     switch (h->info.type) {
      |     ^~~~~~
common/dvb-tuning.c: In function ‘parse_vdr_diseqc.constprop.isra’:
common/dvb-tuning.c:1126:26: warning: ‘%d’ directive writing between 1 and 10 bytes into a region of size 9 [-Wformat-overflow=]
 1126 |  sprintf(section,"diseqc-%d",i++);
      |                          ^~
common/dvb-tuning.c:1126:18: note: directive argument in the range [0, 2147483647]
 1126 |  sprintf(section,"diseqc-%d",i++);
      |                  ^~~~~~~~~~~
common/dvb-tuning.c:1126:2: note: ‘sprintf’ output between 9 and 18 bytes into a destination of size 16
 1126 |  sprintf(section,"diseqc-%d",i++);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
gcc -g -O2 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/X11R6/include/X11/fonts -I/usr/include/lqt -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -I./vbistuff -I./x11 -I./jwz -I./common -I./console -I./x11 -I./structs -I./libng -Llibng -DCONFIGFILE="/etc/X11/xawtvrc" -DLIBDIR="/usr/local/lib/xawtv4" -DDATADIR="/usr/local/share/xawtv" -DLOCALEDIR="/usr/local/share/locale" -DPACKAGE="xawtv" -DVERSION="4.0-pre" -fno-omit-frame-pointer -Wp,-MD,mk/libng_misc.tmp -c -o libng/misc.o libng/misc.c
gcc -g -O2 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/X11R6/include/X11/fonts -I/usr/include/lqt -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -I./vbistuff -I./x11 -I./jwz -I./common -I./console -I./x11 -I./structs -I./libng -Llibng -DCONFIGFILE="/etc/X11/xawtvrc" -DLIBDIR="/usr/local/lib/xawtv4" -DDATADIR="/usr/local/share/xawtv" -DLOCALEDIR="/usr/local/share/locale" -DPACKAGE="xawtv" -DVERSION="4.0-pre" -fno-omit-frame-pointer -Wp,-MD,mk/console_webcam.tmp -c -o console/webcam.o console/webcam.c
gcc -g -O2 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/X11R6/include/X11/fonts -I/usr/include/lqt -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -I./vbistuff -I./x11 -I./jwz -I./common -I./console -I./x11 -I./structs -I./libng -Llibng -DCONFIGFILE="/etc/X11/xawtvrc" -DLIBDIR="/usr/local/lib/xawtv4" -DDATADIR="/usr/local/share/xawtv" -DLOCALEDIR="/usr/local/share/locale" -DPACKAGE="xawtv" -DVERSION="4.0-pre" -fno-omit-frame-pointer -Wp,-MD,mk/console_scantv.tmp -c -o console/scantv.o console/scantv.c
gcc -g -O2 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/X11R6/include/X11/fonts -I/usr/include/lqt -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I. -I./vbistuff -I./x11 -I./jwz -I./common -I./console -I./x11 -I./structs -I./libng -Llibng -DCONFIGFILE="/etc/X11/xawtvrc" -DLIBDIR="/usr/local/lib/xawtv4" -DDATADIR="/usr/local/share/xawtv" -DLOCALEDIR="/usr/local/share/locale" -DPACKAGE="xawtv" -DVERSION="4.0-pre" -fno-omit-frame-pointer -Wp,-MD,mk/console_ttv.tmp -c -o console/ttv.o console/ttv.c
libng/grab-ng.c: In function ‘ng_filter_single’:
libng/grab-ng.c:965:11: warning: variable ‘handle’ set but not used [-Wunused-but-set-variable]
  965 |     void *handle;
      |           ^~~~~~
In file included from console/ttv.c:13:
./common/frequencies.h:82:2: warning: #warning obsolete header file [-Wcpp]
   82 | #warning obsolete header file
      |  ^~~~~~~
console/ttv.c: In function ‘grabber_init’:
console/ttv.c:37:5: error: ‘drv’ undeclared (first use in this function); did you mean ‘div’?
   37 |     drv = ng_vid_open(ng_dev.video,NULL,NULL,0,&h_drv);
      |     ^~~
      |     div
console/ttv.c:37:5: note: each undeclared identifier is reported only once for each function it appears in
console/ttv.c:37:11: warning: implicit declaration of function ‘ng_vid_open’; did you mean ‘ng_dev_open’? [-Wimplicit-function-declaration]
   37 |     drv = ng_vid_open(ng_dev.video,NULL,NULL,0,&h_drv);
      |           ^~~~~~~~~~~
      |           ng_dev_open
console/ttv.c:37:49: error: ‘h_drv’ undeclared (first use in this function)
   37 |     drv = ng_vid_open(ng_dev.video,NULL,NULL,0,&h_drv);
      |                                                 ^~~~~
console/ttv.c:42:5: error: ‘f_drv’ undeclared (first use in this function)
   42 |     f_drv = drv->capabilities(h_drv);
      |     ^~~~~
console/ttv.c:43:5: warning: implicit declaration of function ‘add_attrs’; did you mean ‘aa_attrs’? [-Wimplicit-function-declaration]
   43 |     add_attrs(drv->list_attrs(h_drv));
      |     ^~~~~~~~~
      |     aa_attrs
console/ttv.c: In function ‘do_capture’:
console/ttv.c:63:10: error: ‘CAPTURE_GRABDISPLAY’ undeclared (first use in this function)
   63 |     case CAPTURE_GRABDISPLAY:
      |          ^~~~~~~~~~~~~~~~~~~
console/ttv.c:64:6: error: ‘f_drv’ undeclared (first use in this function)
   64 |  if (f_drv & CAN_CAPTURE)
      |      ^~~~~
console/ttv.c:65:6: error: ‘drv’ undeclared (first use in this function); did you mean ‘div’?
   65 |      drv->stopvideo(h_drv);
      |      ^~~
      |      div
console/ttv.c:65:21: error: ‘h_drv’ undeclared (first use in this function)
   65 |      drv->stopvideo(h_drv);
      |                     ^~~~~
console/ttv.c:76:32: warning: passing argument 1 of ‘ng_grabber_setformat’ from incompatible pointer type [-Wincompatible-pointer-types]
   76 |  if (0 != ng_grabber_setformat(&fmt,1)) {
      |                                ^~~~
      |                                |
      |                                struct ng_video_fmt *
In file included from console/ttv.c:11:
./common/capture.h:6:46: note: expected ‘struct ng_devstate *’ but argument is of type ‘struct ng_video_fmt *’
    6 | int ng_grabber_setformat(struct ng_devstate *dev, struct ng_video_fmt *fmt,
      |                          ~~~~~~~~~~~~~~~~~~~~^~~
console/ttv.c:76:37: warning: passing argument 2 of ‘ng_grabber_setformat’ makes pointer from integer without a cast [-Wint-conversion]
   76 |  if (0 != ng_grabber_setformat(&fmt,1)) {
      |                                     ^
      |                                     |
      |                                     int
In file included from console/ttv.c:11:
./common/capture.h:6:72: note: expected ‘struct ng_video_fmt *’ but argument is of type ‘int’
    6 | int ng_grabber_setformat(struct ng_devstate *dev, struct ng_video_fmt *fmt,
      |                                                   ~~~~~~~~~~~~~~~~~~~~~^~~
console/ttv.c:76:11: error: too few arguments to function ‘ng_grabber_setformat’
   76 |  if (0 != ng_grabber_setformat(&fmt,1)) {
      |           ^~~~~~~~~~~~~~~~~~~~
In file included from console/ttv.c:11:
./common/capture.h:6:5: note: declared here
    6 | int ng_grabber_setformat(struct ng_devstate *dev, struct ng_video_fmt *fmt,
      |     ^~~~~~~~~~~~~~~~~~~~
console/ttv.c:78:46: warning: passing argument 1 of ‘ng_grabber_findconv’ from incompatible pointer type [-Wincompatible-pointer-types]
   78 |      if (NULL == (conv = ng_grabber_findconv(&gfmt,0))) {
      |                                              ^~~~~
      |                                              |
      |                                              struct ng_video_fmt *
In file included from console/ttv.c:11:
./common/capture.h:8:63: note: expected ‘struct ng_devstate *’ but argument is of type ‘struct ng_video_fmt *’
    8 | struct ng_video_conv* ng_grabber_findconv(struct ng_devstate *dev,
      |                                           ~~~~~~~~~~~~~~~~~~~~^~~
console/ttv.c:78:26: error: too few arguments to function ‘ng_grabber_findconv’
   78 |      if (NULL == (conv = ng_grabber_findconv(&gfmt,0))) {
      |                          ^~~~~~~~~~~~~~~~~~~
In file included from console/ttv.c:11:
./common/capture.h:8:23: note: declared here
    8 | struct ng_video_conv* ng_grabber_findconv(struct ng_devstate *dev,
      |                       ^~~~~~~~~~~~~~~~~~~
console/ttv.c:82:11: warning: implicit declaration of function ‘ng_convert_alloc’ [-Wimplicit-function-declaration]
   82 |      ch = ng_convert_alloc(conv,&gfmt,&fmt);
      |           ^~~~~~~~~~~~~~~~
console/ttv.c:82:9: warning: assignment to ‘struct ng_convert_handle *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
   82 |      ch = ng_convert_alloc(conv,&gfmt,&fmt);
      |         ^
console/ttv.c:83:6: warning: implicit declaration of function ‘ng_convert_init’; did you mean ‘ng_conv_init’? [-Wimplicit-function-declaration]
   83 |      ng_convert_init(ch);
      |      ^~~~~~~~~~~~~~~
      |      ng_conv_init
console/ttv.c: In function ‘main’:
console/ttv.c:209:5: warning: implicit declaration of function ‘freq_init’ [-Wimplicit-function-declaration]
  209 |     freq_init();
      |     ^~~~~~~~~
console/ttv.c:210:5: warning: implicit declaration of function ‘read_config’ [-Wimplicit-function-declaration]
  210 |     read_config(NULL,NULL,NULL);
      |     ^~~~~~~~~~~
console/ttv.c:217:21: error: ‘mixerdev’ undeclared (first use in this function)
  217 |     if (0 != strlen(mixerdev)) {
      |                     ^~~~~~~~
console/ttv.c:219:43: error: ‘mixerctl’ undeclared (first use in this function)
  219 |  if (NULL != (attr = ng_mix_init(mixerdev,mixerctl)))
      |                                           ^~~~~~~~
console/ttv.c:219:22: error: too few arguments to function ‘ng_mix_init’
  219 |  if (NULL != (attr = ng_mix_init(mixerdev,mixerctl)))
      |                      ^~~~~~~~~~~
In file included from console/ttv.c:10:
./libng/grab-ng.h:600:5: note: declared here
  600 | int ng_mix_init(struct ng_devstate *dev, char *device, char *control);
      |     ^~~~~~~~~~~
console/ttv.c:226:5: error: ‘set_capture_hook’ undeclared (first use in this function)
  226 |     set_capture_hook  = do_capture;
      |     ^~~~~~~~~~~~~~~~
console/ttv.c:229:5: warning: implicit declaration of function ‘parse_config’ [-Wimplicit-function-declaration]
  229 |     parse_config();
      |     ^~~~~~~~~~~~
console/ttv.c:232:5: error: ‘cur_capture’ undeclared (first use in this function); did you mean ‘do_capture’?
  232 |     cur_capture = 0;
      |     ^~~~~~~~~~~
      |     do_capture
console/ttv.c:237:7: error: ‘f_drv’ undeclared (first use in this function)
  237 |  if ((f_drv & CAN_TUNE) && 0 != (freq = drv->getfreq(h_drv))) {
      |       ^~~~~
console/ttv.c:237:41: error: ‘drv’ undeclared (first use in this function); did you mean ‘div’?
  237 |  if ((f_drv & CAN_TUNE) && 0 != (freq = drv->getfreq(h_drv))) {
      |                                         ^~~
      |                                         div
console/ttv.c:237:54: error: ‘h_drv’ undeclared (first use in this function)
  237 |  if ((f_drv & CAN_TUNE) && 0 != (freq = drv->getfreq(h_drv))) {
      |                                                      ^~~~~
console/ttv.c:244:12: error: ‘cur_channel’ undeclared (first use in this function)
  244 |  if (-1 == cur_channel) {
      |            ^~~~~~~~~~~
console/ttv.c:245:10: error: ‘count’ undeclared (first use in this function)
  245 |      if (count > 0)
      |          ^~~~~
console/ttv.c:248:3: warning: implicit declaration of function ‘set_defaults’ [-Wimplicit-function-declaration]
  248 |   set_defaults();
      |   ^~~~~~~~~~~~
console/ttv.c:272:21: error: too few arguments to function ‘ng_grabber_grab_image’
  272 |  if (NULL == (buf = ng_grabber_grab_image(0))) {
      |                     ^~~~~~~~~~~~~~~~~~~~~
In file included from console/ttv.c:11:
./common/capture.h:11:22: note: declared here
   11 | struct ng_video_buf* ng_grabber_grab_image(struct ng_devstate *dev,
      |                      ^~~~~~~~~~~~~~~~~~~~~
console/ttv.c:277:12: warning: implicit declaration of function ‘ng_convert_single’; did you mean ‘ng_filter_single’? [-Wimplicit-function-declaration]
  277 |      buf = ng_convert_single(ch,buf);
      |            ^~~~~~~~~~~~~~~~~
      |            ng_filter_single
console/ttv.c:277:10: warning: assignment to ‘struct ng_video_buf *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
  277 |      buf = ng_convert_single(ch,buf);
      |          ^
make: *** [mk/Compile.mk:54: console/ttv.o] Error 1
make: *** Waiting for unfinished jobs....
In function ‘do_scan’,
    inlined from ‘main’ at console/scantv.c:399:2:
console/scantv.c:235:7: warning: ‘%s’ directive argument is null [-Wformat-overflow=]
  235 |       sprintf(dummy,"unknown (%s)",fchannel);
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
libng/parse-mpeg.c: In function ‘parse_pmt_desc’:
libng/parse-mpeg.c:680:13: warning: variable ‘l’ set but not used [-Wunused-but-set-variable]
  680 |     int i,t,l;
      |             ^
libng/parse-mpeg.c: In function ‘get_lang_tag’:
libng/parse-mpeg.c:697:13: warning: variable ‘l’ set but not used [-Wunused-but-set-variable]
  697 |     int i,t,l;
      |             ^
Build step 'Execute shell' marked build as failure
