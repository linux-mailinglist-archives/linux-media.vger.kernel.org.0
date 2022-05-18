Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B732252B429
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 10:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232632AbiERH4w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 03:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232606AbiERH4v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 03:56:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A979CD63
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 00:56:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 44E626130F
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 07:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7148FC385A5
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 07:56:45 +0000 (UTC)
Message-ID: <e0227850-f54d-3ee9-78f2-1af7cccb0f8c@xs4all.nl>
Date:   Wed, 18 May 2022 09:56:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: stkwebcam: deprecate driver, move to staging
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
 drivers/media/usb/Kconfig                            |  1 -
 drivers/media/usb/Makefile                           |  1 -
 drivers/staging/media/Kconfig                        | 12 +++++++-----
 drivers/staging/media/Makefile                       |  1 +
 .../{media/usb => staging/media}/stkwebcam/Kconfig   |  0
 .../{media/usb => staging/media}/stkwebcam/Makefile  |  0
 drivers/staging/media/stkwebcam/TODO                 | 12 ++++++++++++
 .../usb => staging/media}/stkwebcam/stk-sensor.c     |  0
 .../usb => staging/media}/stkwebcam/stk-webcam.c     |  0
 .../usb => staging/media}/stkwebcam/stk-webcam.h     |  0
 10 files changed, 20 insertions(+), 7 deletions(-)
 rename drivers/{media/usb => staging/media}/stkwebcam/Kconfig (100%)
 rename drivers/{media/usb => staging/media}/stkwebcam/Makefile (100%)
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
index 66d6f6d51c86..59eddc857184 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_VIDEO_MAX96712)	+= max96712/
 obj-$(CONFIG_VIDEO_MESON_VDEC)	+= meson/vdec/
 obj-$(CONFIG_VIDEO_OMAP4)	+= omap4iss/
 obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC)	+= rkvdec/
+obj-$(CONFIG_USB_STKWEBCAM)	+= stkwebcam/
 obj-$(CONFIG_VIDEO_SUNXI)	+= sunxi/
 obj-$(CONFIG_VIDEO_TEGRA)	+= tegra-video/
 obj-$(CONFIG_VIDEO_HANTRO)	+= hantro/
diff --git a/drivers/media/usb/stkwebcam/Kconfig b/drivers/staging/media/stkwebcam/Kconfig
similarity index 100%
rename from drivers/media/usb/stkwebcam/Kconfig
rename to drivers/staging/media/stkwebcam/Kconfig
diff --git a/drivers/media/usb/stkwebcam/Makefile b/drivers/staging/media/stkwebcam/Makefile
similarity index 100%
rename from drivers/media/usb/stkwebcam/Makefile
rename to drivers/staging/media/stkwebcam/Makefile
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

