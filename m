Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5056BCDAE9
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 06:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbfJGEUb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 00:20:31 -0400
Received: from condef-05.nifty.com ([202.248.20.70]:53781 "EHLO
        condef-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfJGEUb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 00:20:31 -0400
X-Greylist: delayed 386 seconds by postgrey-1.27 at vger.kernel.org; Mon, 07 Oct 2019 00:20:30 EDT
Received: from conuserg-09.nifty.com ([10.126.8.72])by condef-05.nifty.com with ESMTP id x974B08A013841
        for <linux-media@vger.kernel.org>; Mon, 7 Oct 2019 13:11:00 +0900
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x9749g3X018731;
        Mon, 7 Oct 2019 13:09:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x9749g3X018731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570421383;
        bh=Qc7kdQEQSeKLCS/0wAc93VS/IctKNqs8VpX26LsuFE8=;
        h=From:To:Cc:Subject:Date:From;
        b=A/5d4dVIrqN2WaWhbcE02/wOFnI0M06+MISGepHGVg4j0vPmj2QAzi6Ii95u/qmqi
         kCEltsICPi5l3akHJ8G7v/NybUuquWnBddU3XXM/glsFo/ocAbRKjjSBCdYdLr7dg2
         ivepUNDchYZSJAtDPs1xe8jMf4+RrIXn610OdYvCFcVsKrPaEQeEzGoHkZ54DLu51m
         24F0QEn3ZBq6Yu6Ik7V18BCezhTEQS0BwRBSr7KXPRsx8eoTuOGx8EQ1pJIptwTNE3
         knUGeHE9y7FTGFJnXI/IUkhy1RT0Hn433mPRqZNxJ2wM1yMOHqR7549Svb7XGHKdBE
         1vtpSootLRSaA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Subject: [RFC PATCH] media: videodev2.h: include <linux/time.h> instead of <sys/time.h>
Date:   Mon,  7 Oct 2019 13:09:35 +0900
Message-Id: <20191007040935.23436-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, linux/videodev.h is excluded from the UAPI header test since
it is not self-contained. Building it for user-space would fail.

------------------------(build log1 begin)------------------------

  CC      usr/include/linux/videodev2.h.s
In file included from <command-line>:32:0:
./usr/include/linux/videodev2.h:2320:20: error: field ‘timestamp’ has incomplete type
  struct timespec   timestamp;
                    ^~~~~~~~~

-------------------------(build log1 end)-------------------------

The in-kernel timespec definition exists in include/uapi/linux/time.h,
but just including <linux/time.h> causes a lot of redefinition errors.

------------------------(build log2 begin)------------------------

  CC      usr/include/linux/videodev2.h.s
In file included from ./usr/include/linux/videodev2.h:63:0,
                 from <command-line>:32:
./usr/include/linux/time.h:16:8: error: redefinition of ‘struct timeval’
 struct timeval {
        ^~~~~~~
In file included from /usr/include/x86_64-linux-gnu/sys/time.h:25:0,
                 from ./usr/include/linux/videodev2.h:60,
                 from <command-line>:32:
/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h:8:8: note: originally defined here
 struct timeval
        ^~~~~~~
In file included from ./usr/include/linux/videodev2.h:63:0,
                 from <command-line>:32:
./usr/include/linux/time.h:30:0: warning: "ITIMER_REAL" redefined
 #define ITIMER_REAL  0

In file included from ./usr/include/linux/videodev2.h:60:0,
                 from <command-line>:32:
/usr/include/x86_64-linux-gnu/sys/time.h:92:0: note: this is the location of the previous definition
 #define ITIMER_REAL ITIMER_REAL

In file included from ./usr/include/linux/videodev2.h:63:0,
                 from <command-line>:32:
./usr/include/linux/time.h:31:0: warning: "ITIMER_VIRTUAL" redefined
 #define ITIMER_VIRTUAL  1

In file included from ./usr/include/linux/videodev2.h:60:0,
                 from <command-line>:32:
/usr/include/x86_64-linux-gnu/sys/time.h:95:0: note: this is the location of the previous definition
 #define ITIMER_VIRTUAL ITIMER_VIRTUAL

In file included from ./usr/include/linux/videodev2.h:63:0,
                 from <command-line>:32:
./usr/include/linux/time.h:32:0: warning: "ITIMER_PROF" redefined
 #define ITIMER_PROF  2

In file included from ./usr/include/linux/videodev2.h:60:0,
                 from <command-line>:32:
/usr/include/x86_64-linux-gnu/sys/time.h:99:0: note: this is the location of the previous definition
 #define ITIMER_PROF ITIMER_PROF

In file included from ./usr/include/linux/videodev2.h:63:0,
                 from <command-line>:32:
./usr/include/linux/time.h:39:8: error: redefinition of ‘struct itimerval’
 struct itimerval {
        ^~~~~~~~~
In file included from ./usr/include/linux/videodev2.h:60:0,
                 from <command-line>:32:
/usr/include/x86_64-linux-gnu/sys/time.h:104:8: note: originally defined here
 struct itimerval
        ^~~~~~~~~

-------------------------(build log2 end)-------------------------

Replacing <sys/time.h> with <linux/time.h> solves it, and allow more
headers to join the UAPI header test.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

I am not 100% sure about the compatibility
between <sys/time.h> and <linux/time.h>, hence RFC.

But, if they were not compatible,
I guess it would have broken already.

I CCed Arnd Bergmann, who might have a better insight.

A related comment is here:
https://lkml.org/lkml/2019/6/4/1046


 include/uapi/linux/videodev2.h | 4 +---
 usr/include/Makefile           | 7 -------
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 530638dffd93..2571130aa1ca 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -57,11 +57,9 @@
 #ifndef _UAPI__LINUX_VIDEODEV2_H
 #define _UAPI__LINUX_VIDEODEV2_H
 
-#ifndef __KERNEL__
-#include <sys/time.h>
-#endif
 #include <linux/compiler.h>
 #include <linux/ioctl.h>
+#include <linux/time.h>
 #include <linux/types.h>
 #include <linux/v4l2-common.h>
 #include <linux/v4l2-controls.h>
diff --git a/usr/include/Makefile b/usr/include/Makefile
index 57b20f7b6729..dafa6cb9b07e 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -23,7 +23,6 @@ header-test- += asm/shmbuf.h
 header-test- += asm/signal.h
 header-test- += asm/ucontext.h
 header-test- += drm/vmwgfx_drm.h
-header-test- += linux/am437x-vpfe.h
 header-test- += linux/android/binder.h
 header-test- += linux/android/binderfs.h
 header-test-$(CONFIG_CPU_BIG_ENDIAN) += linux/byteorder/big_endian.h
@@ -33,13 +32,10 @@ header-test- += linux/elfcore.h
 header-test- += linux/errqueue.h
 header-test- += linux/fsmap.h
 header-test- += linux/hdlc/ioctl.h
-header-test- += linux/ivtv.h
 header-test- += linux/kexec.h
-header-test- += linux/matroxfb.h
 header-test- += linux/netfilter_ipv4/ipt_LOG.h
 header-test- += linux/netfilter_ipv6/ip6t_LOG.h
 header-test- += linux/nfc.h
-header-test- += linux/omap3isp.h
 header-test- += linux/omapfb.h
 header-test- += linux/patchkey.h
 header-test- += linux/phonet.h
@@ -49,9 +45,6 @@ header-test- += linux/sctp.h
 header-test- += linux/signal.h
 header-test- += linux/sysctl.h
 header-test- += linux/usb/audio.h
-header-test- += linux/v4l2-mediabus.h
-header-test- += linux/v4l2-subdev.h
-header-test- += linux/videodev2.h
 header-test- += linux/vm_sockets.h
 header-test- += sound/asequencer.h
 header-test- += sound/asoc.h
-- 
2.17.1

