Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 713DF67D97D
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 00:15:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233414AbjAZXPX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 18:15:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233262AbjAZXPS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 18:15:18 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 636CF2ED64
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 15:15:16 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pLBSX-0004J7-Gu; Fri, 27 Jan 2023 00:15:09 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1pLBSX-000fEm-An; Fri, 27 Jan 2023 00:15:08 +0100
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1pLBSV-00EH85-Lg; Fri, 27 Jan 2023 00:15:07 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     laurent.pinchart@ideasonboard.com
Cc:     gregkh@linuxfoundation.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v3 3/5] usb: uvc: move uvc_fmts and uvc_format_by_guid to own compile unit
Date:   Fri, 27 Jan 2023 00:14:54 +0100
Message-Id: <20230126231456.3402323-4-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230126231456.3402323-1-m.grzeschik@pengutronix.de>
References: <20230126231456.3402323-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The media driver USB_VIDEO_CLASS and USB_F_UVC are using the same
function uvc_format_by_guid. Since the function is inline, every user
will get a copy of the used uvc_fmts array and the function. This patch
moves the code to an own compile unit and add this dependency as
UVC_COMMON to both users.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Tested-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2: - added reviewed and tested tags
          - added string.h and kernel.h
v2 -> v3: - no changes

 drivers/media/common/Kconfig  |   3 +
 drivers/media/common/Makefile |   1 +
 drivers/media/common/uvc.c    | 221 ++++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/Kconfig |   1 +
 drivers/usb/gadget/Kconfig    |   1 +
 include/linux/usb/uvc.h       | 210 +-------------------------------
 6 files changed, 228 insertions(+), 209 deletions(-)
 create mode 100644 drivers/media/common/uvc.c

diff --git a/drivers/media/common/Kconfig b/drivers/media/common/Kconfig
index 852b7d92fbdd93..b1bc58da27fcdd 100644
--- a/drivers/media/common/Kconfig
+++ b/drivers/media/common/Kconfig
@@ -14,6 +14,9 @@ config TTPCI_EEPROM
         tristate
         depends on I2C
 
+config UVC_COMMON
+	tristate
+
 config VIDEO_CX2341X
 	tristate
 
diff --git a/drivers/media/common/Makefile b/drivers/media/common/Makefile
index d78a0df154783a..3f17d696feb24c 100644
--- a/drivers/media/common/Makefile
+++ b/drivers/media/common/Makefile
@@ -5,5 +5,6 @@ obj-y += b2c2/ siano/ v4l2-tpg/ videobuf2/
 # (e. g. LC_ALL=C sort Makefile)
 obj-$(CONFIG_CYPRESS_FIRMWARE) += cypress_firmware.o
 obj-$(CONFIG_TTPCI_EEPROM) += ttpci-eeprom.o
+obj-$(CONFIG_UVC_COMMON) += uvc.o
 obj-$(CONFIG_VIDEO_CX2341X) += cx2341x.o
 obj-$(CONFIG_VIDEO_TVEEPROM) += tveeprom.o
diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
new file mode 100644
index 00000000000000..bb96d9e26d8019
--- /dev/null
+++ b/drivers/media/common/uvc.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/usb/uvc.h>
+#include <linux/videodev2.h>
+
+/* ------------------------------------------------------------------------
+ * Video formats
+ */
+
+static struct uvc_format_desc uvc_fmts[] = {
+	{
+		.name		= "YUV 4:2:2 (YUYV)",
+		.guid		= UVC_GUID_FORMAT_YUY2,
+		.fcc		= V4L2_PIX_FMT_YUYV,
+	},
+	{
+		.name		= "YUV 4:2:2 (YUYV)",
+		.guid		= UVC_GUID_FORMAT_YUY2_ISIGHT,
+		.fcc		= V4L2_PIX_FMT_YUYV,
+	},
+	{
+		.name		= "YUV 4:2:0 (NV12)",
+		.guid		= UVC_GUID_FORMAT_NV12,
+		.fcc		= V4L2_PIX_FMT_NV12,
+	},
+	{
+		.name		= "MJPEG",
+		.guid		= UVC_GUID_FORMAT_MJPEG,
+		.fcc		= V4L2_PIX_FMT_MJPEG,
+	},
+	{
+		.name		= "YVU 4:2:0 (YV12)",
+		.guid		= UVC_GUID_FORMAT_YV12,
+		.fcc		= V4L2_PIX_FMT_YVU420,
+	},
+	{
+		.name		= "YUV 4:2:0 (I420)",
+		.guid		= UVC_GUID_FORMAT_I420,
+		.fcc		= V4L2_PIX_FMT_YUV420,
+	},
+	{
+		.name		= "YUV 4:2:0 (M420)",
+		.guid		= UVC_GUID_FORMAT_M420,
+		.fcc		= V4L2_PIX_FMT_M420,
+	},
+	{
+		.name		= "YUV 4:2:2 (UYVY)",
+		.guid		= UVC_GUID_FORMAT_UYVY,
+		.fcc		= V4L2_PIX_FMT_UYVY,
+	},
+	{
+		.name		= "Greyscale 8-bit (Y800)",
+		.guid		= UVC_GUID_FORMAT_Y800,
+		.fcc		= V4L2_PIX_FMT_GREY,
+	},
+	{
+		.name		= "Greyscale 8-bit (Y8  )",
+		.guid		= UVC_GUID_FORMAT_Y8,
+		.fcc		= V4L2_PIX_FMT_GREY,
+	},
+	{
+		.name		= "Greyscale 8-bit (D3DFMT_L8)",
+		.guid		= UVC_GUID_FORMAT_D3DFMT_L8,
+		.fcc		= V4L2_PIX_FMT_GREY,
+	},
+	{
+		.name		= "IR 8-bit (L8_IR)",
+		.guid		= UVC_GUID_FORMAT_KSMEDIA_L8_IR,
+		.fcc		= V4L2_PIX_FMT_GREY,
+	},
+	{
+		.name		= "Greyscale 10-bit (Y10 )",
+		.guid		= UVC_GUID_FORMAT_Y10,
+		.fcc		= V4L2_PIX_FMT_Y10,
+	},
+	{
+		.name		= "Greyscale 12-bit (Y12 )",
+		.guid		= UVC_GUID_FORMAT_Y12,
+		.fcc		= V4L2_PIX_FMT_Y12,
+	},
+	{
+		.name		= "Greyscale 16-bit (Y16 )",
+		.guid		= UVC_GUID_FORMAT_Y16,
+		.fcc		= V4L2_PIX_FMT_Y16,
+	},
+	{
+		.name		= "BGGR Bayer (BY8 )",
+		.guid		= UVC_GUID_FORMAT_BY8,
+		.fcc		= V4L2_PIX_FMT_SBGGR8,
+	},
+	{
+		.name		= "BGGR Bayer (BA81)",
+		.guid		= UVC_GUID_FORMAT_BA81,
+		.fcc		= V4L2_PIX_FMT_SBGGR8,
+	},
+	{
+		.name		= "GBRG Bayer (GBRG)",
+		.guid		= UVC_GUID_FORMAT_GBRG,
+		.fcc		= V4L2_PIX_FMT_SGBRG8,
+	},
+	{
+		.name		= "GRBG Bayer (GRBG)",
+		.guid		= UVC_GUID_FORMAT_GRBG,
+		.fcc		= V4L2_PIX_FMT_SGRBG8,
+	},
+	{
+		.name		= "RGGB Bayer (RGGB)",
+		.guid		= UVC_GUID_FORMAT_RGGB,
+		.fcc		= V4L2_PIX_FMT_SRGGB8,
+	},
+	{
+		.name		= "RGB565",
+		.guid		= UVC_GUID_FORMAT_RGBP,
+		.fcc		= V4L2_PIX_FMT_RGB565,
+	},
+	{
+		.name		= "BGR 8:8:8 (BGR3)",
+		.guid		= UVC_GUID_FORMAT_BGR3,
+		.fcc		= V4L2_PIX_FMT_BGR24,
+	},
+	{
+		.name		= "BGRA/X 8:8:8:8 (BGR4)",
+		.guid		= UVC_GUID_FORMAT_BGR4,
+		.fcc		= V4L2_PIX_FMT_XBGR32,
+	},
+	{
+		.name		= "H.264",
+		.guid		= UVC_GUID_FORMAT_H264,
+		.fcc		= V4L2_PIX_FMT_H264,
+	},
+	{
+		.name		= "H.265",
+		.guid		= UVC_GUID_FORMAT_H265,
+		.fcc		= V4L2_PIX_FMT_HEVC,
+	},
+	{
+		.name		= "Greyscale 8 L/R (Y8I)",
+		.guid		= UVC_GUID_FORMAT_Y8I,
+		.fcc		= V4L2_PIX_FMT_Y8I,
+	},
+	{
+		.name		= "Greyscale 12 L/R (Y12I)",
+		.guid		= UVC_GUID_FORMAT_Y12I,
+		.fcc		= V4L2_PIX_FMT_Y12I,
+	},
+	{
+		.name		= "Depth data 16-bit (Z16)",
+		.guid		= UVC_GUID_FORMAT_Z16,
+		.fcc		= V4L2_PIX_FMT_Z16,
+	},
+	{
+		.name		= "Bayer 10-bit (SRGGB10P)",
+		.guid		= UVC_GUID_FORMAT_RW10,
+		.fcc		= V4L2_PIX_FMT_SRGGB10P,
+	},
+	{
+		.name		= "Bayer 16-bit (SBGGR16)",
+		.guid		= UVC_GUID_FORMAT_BG16,
+		.fcc		= V4L2_PIX_FMT_SBGGR16,
+	},
+	{
+		.name		= "Bayer 16-bit (SGBRG16)",
+		.guid		= UVC_GUID_FORMAT_GB16,
+		.fcc		= V4L2_PIX_FMT_SGBRG16,
+	},
+	{
+		.name		= "Bayer 16-bit (SRGGB16)",
+		.guid		= UVC_GUID_FORMAT_RG16,
+		.fcc		= V4L2_PIX_FMT_SRGGB16,
+	},
+	{
+		.name		= "Bayer 16-bit (SGRBG16)",
+		.guid		= UVC_GUID_FORMAT_GR16,
+		.fcc		= V4L2_PIX_FMT_SGRBG16,
+	},
+	{
+		.name		= "Depth data 16-bit (Z16)",
+		.guid		= UVC_GUID_FORMAT_INVZ,
+		.fcc		= V4L2_PIX_FMT_Z16,
+	},
+	{
+		.name		= "Greyscale 10-bit (Y10 )",
+		.guid		= UVC_GUID_FORMAT_INVI,
+		.fcc		= V4L2_PIX_FMT_Y10,
+	},
+	{
+		.name		= "IR:Depth 26-bit (INZI)",
+		.guid		= UVC_GUID_FORMAT_INZI,
+		.fcc		= V4L2_PIX_FMT_INZI,
+	},
+	{
+		.name		= "4-bit Depth Confidence (Packed)",
+		.guid		= UVC_GUID_FORMAT_CNF4,
+		.fcc		= V4L2_PIX_FMT_CNF4,
+	},
+	{
+		.name		= "HEVC",
+		.guid		= UVC_GUID_FORMAT_HEVC,
+		.fcc		= V4L2_PIX_FMT_HEVC,
+	},
+};
+
+struct uvc_format_desc *uvc_format_by_guid(const u8 guid[16])
+{
+	unsigned int len = ARRAY_SIZE(uvc_fmts);
+	unsigned int i;
+
+	for (i = 0; i < len; ++i) {
+		if (memcmp(guid, uvc_fmts[i].guid, 16) == 0)
+			return &uvc_fmts[i];
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(uvc_format_by_guid);
+
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/usb/uvc/Kconfig b/drivers/media/usb/uvc/Kconfig
index ca51ee8e45f39c..579532272fd6d7 100644
--- a/drivers/media/usb/uvc/Kconfig
+++ b/drivers/media/usb/uvc/Kconfig
@@ -3,6 +3,7 @@ config USB_VIDEO_CLASS
 	tristate "USB Video Class (UVC)"
 	depends on VIDEO_DEV
 	select VIDEOBUF2_VMALLOC
+	select UVC_COMMON
 	help
 	  Support for the USB Video Class (UVC).  Currently only video
 	  input devices, such as webcams, are supported.
diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
index 4fa2ddf322b48d..336db8f92afa6a 100644
--- a/drivers/usb/gadget/Kconfig
+++ b/drivers/usb/gadget/Kconfig
@@ -203,6 +203,7 @@ config USB_F_UAC2
 
 config USB_F_UVC
 	tristate
+	select UVC_COMMON
 
 config USB_F_MIDI
 	tristate
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index b010a36fc1d951..8cebb46602a118 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -148,220 +148,12 @@
 	{ 'H',  'E',  'V',  'C', 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
 
-/* ------------------------------------------------------------------------
- * Video formats
- */
-
 struct uvc_format_desc {
 	char *name;
 	u8 guid[16];
 	u32 fcc;
 };
 
-static struct uvc_format_desc uvc_fmts[] = {
-	{
-		.name		= "YUV 4:2:2 (YUYV)",
-		.guid		= UVC_GUID_FORMAT_YUY2,
-		.fcc		= V4L2_PIX_FMT_YUYV,
-	},
-	{
-		.name		= "YUV 4:2:2 (YUYV)",
-		.guid		= UVC_GUID_FORMAT_YUY2_ISIGHT,
-		.fcc		= V4L2_PIX_FMT_YUYV,
-	},
-	{
-		.name		= "YUV 4:2:0 (NV12)",
-		.guid		= UVC_GUID_FORMAT_NV12,
-		.fcc		= V4L2_PIX_FMT_NV12,
-	},
-	{
-		.name		= "MJPEG",
-		.guid		= UVC_GUID_FORMAT_MJPEG,
-		.fcc		= V4L2_PIX_FMT_MJPEG,
-	},
-	{
-		.name		= "YVU 4:2:0 (YV12)",
-		.guid		= UVC_GUID_FORMAT_YV12,
-		.fcc		= V4L2_PIX_FMT_YVU420,
-	},
-	{
-		.name		= "YUV 4:2:0 (I420)",
-		.guid		= UVC_GUID_FORMAT_I420,
-		.fcc		= V4L2_PIX_FMT_YUV420,
-	},
-	{
-		.name		= "YUV 4:2:0 (M420)",
-		.guid		= UVC_GUID_FORMAT_M420,
-		.fcc		= V4L2_PIX_FMT_M420,
-	},
-	{
-		.name		= "YUV 4:2:2 (UYVY)",
-		.guid		= UVC_GUID_FORMAT_UYVY,
-		.fcc		= V4L2_PIX_FMT_UYVY,
-	},
-	{
-		.name		= "Greyscale 8-bit (Y800)",
-		.guid		= UVC_GUID_FORMAT_Y800,
-		.fcc		= V4L2_PIX_FMT_GREY,
-	},
-	{
-		.name		= "Greyscale 8-bit (Y8  )",
-		.guid		= UVC_GUID_FORMAT_Y8,
-		.fcc		= V4L2_PIX_FMT_GREY,
-	},
-	{
-		.name		= "Greyscale 8-bit (D3DFMT_L8)",
-		.guid		= UVC_GUID_FORMAT_D3DFMT_L8,
-		.fcc		= V4L2_PIX_FMT_GREY,
-	},
-	{
-		.name		= "IR 8-bit (L8_IR)",
-		.guid		= UVC_GUID_FORMAT_KSMEDIA_L8_IR,
-		.fcc		= V4L2_PIX_FMT_GREY,
-	},
-	{
-		.name		= "Greyscale 10-bit (Y10 )",
-		.guid		= UVC_GUID_FORMAT_Y10,
-		.fcc		= V4L2_PIX_FMT_Y10,
-	},
-	{
-		.name		= "Greyscale 12-bit (Y12 )",
-		.guid		= UVC_GUID_FORMAT_Y12,
-		.fcc		= V4L2_PIX_FMT_Y12,
-	},
-	{
-		.name		= "Greyscale 16-bit (Y16 )",
-		.guid		= UVC_GUID_FORMAT_Y16,
-		.fcc		= V4L2_PIX_FMT_Y16,
-	},
-	{
-		.name		= "BGGR Bayer (BY8 )",
-		.guid		= UVC_GUID_FORMAT_BY8,
-		.fcc		= V4L2_PIX_FMT_SBGGR8,
-	},
-	{
-		.name		= "BGGR Bayer (BA81)",
-		.guid		= UVC_GUID_FORMAT_BA81,
-		.fcc		= V4L2_PIX_FMT_SBGGR8,
-	},
-	{
-		.name		= "GBRG Bayer (GBRG)",
-		.guid		= UVC_GUID_FORMAT_GBRG,
-		.fcc		= V4L2_PIX_FMT_SGBRG8,
-	},
-	{
-		.name		= "GRBG Bayer (GRBG)",
-		.guid		= UVC_GUID_FORMAT_GRBG,
-		.fcc		= V4L2_PIX_FMT_SGRBG8,
-	},
-	{
-		.name		= "RGGB Bayer (RGGB)",
-		.guid		= UVC_GUID_FORMAT_RGGB,
-		.fcc		= V4L2_PIX_FMT_SRGGB8,
-	},
-	{
-		.name		= "RGB565",
-		.guid		= UVC_GUID_FORMAT_RGBP,
-		.fcc		= V4L2_PIX_FMT_RGB565,
-	},
-	{
-		.name		= "BGR 8:8:8 (BGR3)",
-		.guid		= UVC_GUID_FORMAT_BGR3,
-		.fcc		= V4L2_PIX_FMT_BGR24,
-	},
-	{
-		.name		= "BGRA/X 8:8:8:8 (BGR4)",
-		.guid		= UVC_GUID_FORMAT_BGR4,
-		.fcc		= V4L2_PIX_FMT_XBGR32,
-	},
-	{
-		.name		= "H.264",
-		.guid		= UVC_GUID_FORMAT_H264,
-		.fcc		= V4L2_PIX_FMT_H264,
-	},
-	{
-		.name		= "H.265",
-		.guid		= UVC_GUID_FORMAT_H265,
-		.fcc		= V4L2_PIX_FMT_HEVC,
-	},
-	{
-		.name		= "Greyscale 8 L/R (Y8I)",
-		.guid		= UVC_GUID_FORMAT_Y8I,
-		.fcc		= V4L2_PIX_FMT_Y8I,
-	},
-	{
-		.name		= "Greyscale 12 L/R (Y12I)",
-		.guid		= UVC_GUID_FORMAT_Y12I,
-		.fcc		= V4L2_PIX_FMT_Y12I,
-	},
-	{
-		.name		= "Depth data 16-bit (Z16)",
-		.guid		= UVC_GUID_FORMAT_Z16,
-		.fcc		= V4L2_PIX_FMT_Z16,
-	},
-	{
-		.name		= "Bayer 10-bit (SRGGB10P)",
-		.guid		= UVC_GUID_FORMAT_RW10,
-		.fcc		= V4L2_PIX_FMT_SRGGB10P,
-	},
-	{
-		.name		= "Bayer 16-bit (SBGGR16)",
-		.guid		= UVC_GUID_FORMAT_BG16,
-		.fcc		= V4L2_PIX_FMT_SBGGR16,
-	},
-	{
-		.name		= "Bayer 16-bit (SGBRG16)",
-		.guid		= UVC_GUID_FORMAT_GB16,
-		.fcc		= V4L2_PIX_FMT_SGBRG16,
-	},
-	{
-		.name		= "Bayer 16-bit (SRGGB16)",
-		.guid		= UVC_GUID_FORMAT_RG16,
-		.fcc		= V4L2_PIX_FMT_SRGGB16,
-	},
-	{
-		.name		= "Bayer 16-bit (SGRBG16)",
-		.guid		= UVC_GUID_FORMAT_GR16,
-		.fcc		= V4L2_PIX_FMT_SGRBG16,
-	},
-	{
-		.name		= "Depth data 16-bit (Z16)",
-		.guid		= UVC_GUID_FORMAT_INVZ,
-		.fcc		= V4L2_PIX_FMT_Z16,
-	},
-	{
-		.name		= "Greyscale 10-bit (Y10 )",
-		.guid		= UVC_GUID_FORMAT_INVI,
-		.fcc		= V4L2_PIX_FMT_Y10,
-	},
-	{
-		.name		= "IR:Depth 26-bit (INZI)",
-		.guid		= UVC_GUID_FORMAT_INZI,
-		.fcc		= V4L2_PIX_FMT_INZI,
-	},
-	{
-		.name		= "4-bit Depth Confidence (Packed)",
-		.guid		= UVC_GUID_FORMAT_CNF4,
-		.fcc		= V4L2_PIX_FMT_CNF4,
-	},
-	{
-		.name		= "HEVC",
-		.guid		= UVC_GUID_FORMAT_HEVC,
-		.fcc		= V4L2_PIX_FMT_HEVC,
-	},
-};
-
-static inline struct uvc_format_desc *uvc_format_by_guid(const u8 guid[16])
-{
-	unsigned int len = ARRAY_SIZE(uvc_fmts);
-	unsigned int i;
-
-	for (i = 0; i < len; ++i) {
-		if (memcmp(guid, uvc_fmts[i].guid, 16) == 0)
-			return &uvc_fmts[i];
-	}
-
-	return NULL;
-}
+struct uvc_format_desc *uvc_format_by_guid(const u8 guid[16]);
 
 #endif /* __LINUX_V4L2_UVC_H */
-- 
2.30.2

