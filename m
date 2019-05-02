Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCAD711A52
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2019 15:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbfEBNfX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 09:35:23 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:50753 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726300AbfEBNfX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 May 2019 09:35:23 -0400
Received: from [IPv6:2001:420:44c1:2579:7549:573e:9131:939b] ([IPv6:2001:420:44c1:2579:7549:573e:9131:939b])
        by smtp-cloud7.xs4all.net with ESMTPA
        id MBrphHcatZVjxMBrsh6TuR; Thu, 02 May 2019 15:35:20 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: move drivers/media/media-* to drivers/media/mc/mc-*
Message-ID: <5046ebfa-d05f-11d6-ade3-e1facb0a4970@xs4all.nl>
Date:   Thu, 2 May 2019 15:35:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEk/aO/QEoeumhgWJ8lTO4/LrBjP3oq8gkDUBfq2/ZXvz/w9Jlje9NQmMCLGJUfoSH8VOC3oUlR5c30Ys+paHUgGf9gbYDTUKAbWsJ/vypHDS/ixxE9t
 vnb7/51COWcAH0fNnxnmAL2FTVE4KLEsLQhL0yf6FZFFpc8k03vAZMTjKVajsdRn7JCKyKe/u/BMOs71KLL4qrUY3Hirdo3FFLI7W41wbwR1roR7gTfP9Zrv
 EHEZaXRXzOI6Uy0CiHE56etkVMuSRnCvJbYqxlST6FzcdGy0ufjuMknkYMsb7tDHJnFbMEewN3dT0pnJl7nzZ3COUSICp2qgnWrZdExbqDvY/qu1249t5VZD
 BNFlipyt
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It is really weird that the media controller sources are all top-level
in drivers/media. It is a bit of a left-over from long ago when most
media sources were all at the top-level. At some point we reorganized
the directory structure, but the media-*.c sources where never moved
to their own directory.

So create a new mc directory and move all sources there. Also rename
the prefix from media- to mc-.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/Kconfig                         | 35 +------------------
 drivers/media/Makefile                        | 13 ++-----
 .../mc-dev-allocator.c}                       |  0
 .../media/{media-device.c => mc/mc-device.c}  |  0
 .../{media-devnode.c => mc/mc-devnode.c}      |  0
 .../media/{media-entity.c => mc/mc-entity.c}  |  0
 .../{media-request.c => mc/mc-request.c}      |  0
 7 files changed, 3 insertions(+), 45 deletions(-)
 rename drivers/media/{media-dev-allocator.c => mc/mc-dev-allocator.c} (100%)
 rename drivers/media/{media-device.c => mc/mc-device.c} (100%)
 rename drivers/media/{media-devnode.c => mc/mc-devnode.c} (100%)
 rename drivers/media/{media-entity.c => mc/mc-entity.c} (100%)
 rename drivers/media/{media-request.c => mc/mc-request.c} (100%)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 8efaf99243e0..dd6622ced2cc 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -88,40 +88,7 @@ config MEDIA_CEC_SUPPORT

 source "drivers/media/cec/Kconfig"

-#
-# Media controller
-#	Selectable only for webcam/grabbers, as other drivers don't use it
-#
-
-config MEDIA_CONTROLLER
-	bool "Media Controller API"
-	depends on MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT
-	help
-	  Enable the media controller API used to query media devices internal
-	  topology and configure it dynamically.
-
-	  This API is mostly used by camera interfaces in embedded platforms.
-
-config MEDIA_CONTROLLER_DVB
-	bool "Enable Media controller for DVB (EXPERIMENTAL)"
-	depends on MEDIA_CONTROLLER && DVB_CORE
-	help
-	  Enable the media controller API support for DVB.
-
-	  This is currently experimental.
-
-config MEDIA_CONTROLLER_REQUEST_API
-	bool "Enable Media controller Request API (EXPERIMENTAL)"
-	depends on MEDIA_CONTROLLER && STAGING_MEDIA
-	default n
-	help
-	  DO NOT ENABLE THIS OPTION UNLESS YOU KNOW WHAT YOU'RE DOING.
-
-	  This option enables the Request API for the Media controller and V4L2
-	  interfaces. It is currently needed by a few stateless codec drivers.
-
-	  There is currently no intention to provide API or ABI stability for
-	  this new API as of yet.
+source "drivers/media/mc/Kconfig"

 #
 # Video4Linux support
diff --git a/drivers/media/Makefile b/drivers/media/Makefile
index 4a330d0e5e40..f215f0a89f9e 100644
--- a/drivers/media/Makefile
+++ b/drivers/media/Makefile
@@ -3,15 +3,6 @@
 # Makefile for the kernel multimedia device drivers.
 #

-media-objs	:= media-device.o media-devnode.o media-entity.o \
-		   media-request.o
-
-ifeq ($(CONFIG_MEDIA_CONTROLLER),y)
-	ifeq ($(CONFIG_USB),y)
-		media-objs += media-dev-allocator.o
-	endif
-endif
-
 #
 # I2C drivers should come before other drivers, otherwise they'll fail
 # when compiled as builtin drivers
@@ -20,10 +11,10 @@ obj-y += i2c/ tuners/
 obj-$(CONFIG_DVB_CORE)  += dvb-frontends/

 #
-# Now, let's link-in the media core
+# Now, let's link-in the media controller core
 #
 ifeq ($(CONFIG_MEDIA_CONTROLLER),y)
-  obj-$(CONFIG_MEDIA_SUPPORT) += media.o
+  obj-$(CONFIG_MEDIA_SUPPORT) += mc/
 endif

 obj-$(CONFIG_VIDEO_DEV) += v4l2-core/
diff --git a/drivers/media/media-dev-allocator.c b/drivers/media/mc/mc-dev-allocator.c
similarity index 100%
rename from drivers/media/media-dev-allocator.c
rename to drivers/media/mc/mc-dev-allocator.c
diff --git a/drivers/media/media-device.c b/drivers/media/mc/mc-device.c
similarity index 100%
rename from drivers/media/media-device.c
rename to drivers/media/mc/mc-device.c
diff --git a/drivers/media/media-devnode.c b/drivers/media/mc/mc-devnode.c
similarity index 100%
rename from drivers/media/media-devnode.c
rename to drivers/media/mc/mc-devnode.c
diff --git a/drivers/media/media-entity.c b/drivers/media/mc/mc-entity.c
similarity index 100%
rename from drivers/media/media-entity.c
rename to drivers/media/mc/mc-entity.c
diff --git a/drivers/media/media-request.c b/drivers/media/mc/mc-request.c
similarity index 100%
rename from drivers/media/media-request.c
rename to drivers/media/mc/mc-request.c
-- 
2.20.1


