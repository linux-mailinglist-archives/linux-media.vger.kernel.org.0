Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6902C52B626
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 11:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234113AbiERJUu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 05:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234080AbiERJUs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 05:20:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED2EDB35
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 02:20:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 78003616F9
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 09:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7F5C385AA
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 09:20:44 +0000 (UTC)
Message-ID: <5911870d-e73c-92fc-d89b-fc4da07d0fa8@xs4all.nl>
Date:   Wed, 18 May 2022 11:20:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2] media: stkwebcam: deprecate driver, move to staging
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a very old driver for very old hardware and it is one of
the very few remaining that does not use the vb2 framework (or
even the older videobuf framework), so deprecate this driver
and move it to staging with the intent to removing it altogether
by the end of 2022.

If someone wants to keep this driver, then it has to be converted
to use vb2.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Changes since v1:
- Change config name to VIDEO_STKWEBCAM as suggested by Ricardo
- Mention in the Kconfig that the driver is deprecated.
---
 drivers/media/usb/Kconfig                            |  1 -
 drivers/media/usb/Makefile                           |  1 -
 drivers/staging/media/Kconfig                        | 12 +++++++-----
 drivers/staging/media/Makefile                       |  1 +
 .../{media/usb => staging/media}/stkwebcam/Kconfig   |  7 +++++--
 .../{media/usb => staging/media}/stkwebcam/Makefile  |  2 +-
 drivers/staging/media/stkwebcam/TODO                 | 12 ++++++++++++
 .../usb => staging/media}/stkwebcam/stk-sensor.c     |  0
 .../usb => staging/media}/stkwebcam/stk-webcam.c     |  0
 .../usb => staging/media}/stkwebcam/stk-webcam.h     |  0
 10 files changed, 26 insertions(+), 10 deletions(-)
 rename drivers/{media/usb => staging/media}/stkwebcam/Kconfig (69%)
 rename drivers/{media/usb => staging/media}/stkwebcam/Makefile (63%)
 create mode 100644 drivers/staging/media/stkwebcam/TODO
 rename drivers/{media/usb => staging/media}/stkwebcam/stk-sensor.c (100%)
 rename drivers/{media/usb => staging/media}/stkwebcam/stk-webcam.c (100%)
 rename drivers/{media/usb => staging/media}/stkwebcam/stk-webcam.h (100%)

diff --git a/drivers/media/usb/Kconfig b/drivers/media/usb/Kconfig
index 8de08704f8e4..af88e0766388 100644
--- a/drivers/media/usb/Kconfig
+++ b/drivers/media/usb/Kconfig
@@ -17,7 +17,6 @@ source "drivers/media/usb/cpia2/Kconfig"
 source "drivers/media/usb/gspca/Kconfig"
 source "drivers/media/usb/pwc/Kconfig"
 source "drivers/media/usb/s2255/Kconfig"
-source "drivers/media/usb/stkwebcam/Kconfig"
 source "drivers/media/usb/usbtv/Kconfig"
 source "drivers/media/usb/uvc/Kconfig"
 source "drivers/media/usb/zr364xx/Kconfig"
diff --git a/drivers/media/usb/Makefile b/drivers/media/usb/Makefile
index 044bd46c799c..25fa2015b179 100644
--- a/drivers/media/usb/Makefile
+++ b/drivers/media/usb/Makefile
@@ -10,7 +10,6 @@ obj-y += dvb-usb/
 obj-y += dvb-usb-v2/
 obj-y += s2255/
 obj-y += siano/
-obj-y += stkwebcam/
 obj-y += ttusb-budget/
 obj-y += ttusb-dec/
 obj-y += zr364xx/
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index 1fd6a0c6e1d8..421ce9dbf44c 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -22,10 +22,14 @@ if STAGING_MEDIA && MEDIA_SUPPORT
 # Please keep them in alphabetic order
 source "drivers/staging/media/atomisp/Kconfig"
 
+source "drivers/staging/media/av7110/Kconfig"
+
 source "drivers/staging/media/hantro/Kconfig"
 
 source "drivers/staging/media/imx/Kconfig"
 
+source "drivers/staging/media/ipu3/Kconfig"
+
 source "drivers/staging/media/max96712/Kconfig"
 
 source "drivers/staging/media/meson/vdec/Kconfig"
@@ -34,14 +38,12 @@ source "drivers/staging/media/omap4iss/Kconfig"
 
 source "drivers/staging/media/rkvdec/Kconfig"
 
-source "drivers/staging/media/sunxi/Kconfig"
+source "drivers/staging/media/stkwebcam/Kconfig"
 
-source "drivers/staging/media/zoran/Kconfig"
+source "drivers/staging/media/sunxi/Kconfig"
 
 source "drivers/staging/media/tegra-video/Kconfig"
 
-source "drivers/staging/media/ipu3/Kconfig"
-
-source "drivers/staging/media/av7110/Kconfig"
+source "drivers/staging/media/zoran/Kconfig"
 
 endif
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 66d6f6d51c86..950e96f10aad 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_VIDEO_MAX96712)	+= max96712/
 obj-$(CONFIG_VIDEO_MESON_VDEC)	+= meson/vdec/
 obj-$(CONFIG_VIDEO_OMAP4)	+= omap4iss/
 obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC)	+= rkvdec/
+obj-$(CONFIG_VIDEO_STKWEBCAM)	+= stkwebcam/
 obj-$(CONFIG_VIDEO_SUNXI)	+= sunxi/
 obj-$(CONFIG_VIDEO_TEGRA)	+= tegra-video/
 obj-$(CONFIG_VIDEO_HANTRO)	+= hantro/
diff --git a/drivers/media/usb/stkwebcam/Kconfig b/drivers/staging/media/stkwebcam/Kconfig
similarity index 69%
rename from drivers/media/usb/stkwebcam/Kconfig
rename to drivers/staging/media/stkwebcam/Kconfig
index d94d023f1aa0..e0d7e1227bb4 100644
--- a/drivers/media/usb/stkwebcam/Kconfig
+++ b/drivers/staging/media/stkwebcam/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config USB_STKWEBCAM
-	tristate "USB Syntek DC1125 Camera support"
+config VIDEO_STKWEBCAM
+	tristate "USB Syntek DC1125 Camera support (DEPRECATED)"
 	depends on VIDEO_DEV
 	help
 	  Say Y here if you want to use this type of camera.
@@ -9,6 +9,9 @@ config USB_STKWEBCAM
 	  may be supported by the stk11xx driver, from which this is
 	  derived, see <http://sourceforge.net/projects/syntekdriver/>
 
+	  This driver is deprecated and is scheduled for removal by
+	  the end of 2022. See the TODO file for more information.
+
 	  To compile this driver as a module, choose M here: the
 	  module will be called stkwebcam.
 
diff --git a/drivers/media/usb/stkwebcam/Makefile b/drivers/staging/media/stkwebcam/Makefile
similarity index 63%
rename from drivers/media/usb/stkwebcam/Makefile
rename to drivers/staging/media/stkwebcam/Makefile
index daa9ae6d48c2..17ad7b6f43d0 100644
--- a/drivers/media/usb/stkwebcam/Makefile
+++ b/drivers/staging/media/stkwebcam/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 stkwebcam-objs	:=	stk-webcam.o stk-sensor.o
 
-obj-$(CONFIG_USB_STKWEBCAM)     += stkwebcam.o
+obj-$(CONFIG_VIDEO_STKWEBCAM)     += stkwebcam.o
 
diff --git a/drivers/staging/media/stkwebcam/TODO b/drivers/staging/media/stkwebcam/TODO
new file mode 100644
index 000000000000..735304a72729
--- /dev/null
+++ b/drivers/staging/media/stkwebcam/TODO
@@ -0,0 +1,12 @@
+This is a very old driver for very old hardware (specifically
+laptops that use this sensor). In addition according to reports
+the picture quality is quite bad.
+
+This is also one of the few drivers still not using the vb2
+framework (or even the old videobuf framework!), so this driver
+is now deprecated with the intent of removing it altogether by
+the end of 2022.
+
+In order to keep this driver it has to be converted to vb2.
+If someone is interested in doing this work, then contact the
+linux-media mailinglist (https://linuxtv.org/lists.php).
diff --git a/drivers/media/usb/stkwebcam/stk-sensor.c b/drivers/staging/media/stkwebcam/stk-sensor.c
similarity index 100%
rename from drivers/media/usb/stkwebcam/stk-sensor.c
rename to drivers/staging/media/stkwebcam/stk-sensor.c
diff --git a/drivers/media/usb/stkwebcam/stk-webcam.c b/drivers/staging/media/stkwebcam/stk-webcam.c
similarity index 100%
rename from drivers/media/usb/stkwebcam/stk-webcam.c
rename to drivers/staging/media/stkwebcam/stk-webcam.c
diff --git a/drivers/media/usb/stkwebcam/stk-webcam.h b/drivers/staging/media/stkwebcam/stk-webcam.h
similarity index 100%
rename from drivers/media/usb/stkwebcam/stk-webcam.h
rename to drivers/staging/media/stkwebcam/stk-webcam.h
-- 
2.34.1

