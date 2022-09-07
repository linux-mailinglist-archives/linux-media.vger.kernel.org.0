Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26E605B087B
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 17:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbiIGPYY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 11:24:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230221AbiIGPYQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 11:24:16 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D06AEB8A47
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 08:23:59 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVwuD-0001Gy-6A; Wed, 07 Sep 2022 17:23:57 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVwuA-004SvE-HK; Wed, 07 Sep 2022 17:23:56 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVwuB-00Aq4n-Gb; Wed, 07 Sep 2022 17:23:55 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, paul.elder@ideasonboard.com,
        kernel@pengutronix.de, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v11 2/4] media: uvcvideo: move uvc_format_desc to common header
Date:   Wed,  7 Sep 2022 17:23:52 +0200
Message-Id: <20220907152354.2583258-3-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220907152354.2583258-1-m.grzeschik@pengutronix.de>
References: <20220907152354.2583258-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The uvc_format_desc, GUID defines and the uvc_format_by_guid helper is
also useful for the uvc gadget stack. This patch moves them to a common
header.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v7: -
v7 -> v8: - fixed style comments while rebasing
v8 -> v11: -

 drivers/media/usb/uvc/uvc_ctrl.c   |   1 +
 drivers/media/usb/uvc/uvc_driver.c | 206 +----------------
 drivers/media/usb/uvc/uvcvideo.h   | 144 ------------
 include/media/v4l2-uvc.h           | 359 +++++++++++++++++++++++++++++
 4 files changed, 361 insertions(+), 349 deletions(-)
 create mode 100644 include/media/v4l2-uvc.h

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 8c208db9600b46..b8a00a51679f6d 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -18,6 +18,7 @@
 #include <linux/workqueue.h>
 #include <linux/atomic.h>
 #include <media/v4l2-ctrls.h>
+#include <media/v4l2-uvc.h>
 
 #include "uvcvideo.h"
 
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 0f14dee4b6d794..2891bc9d319280 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -20,6 +20,7 @@
 
 #include <media/v4l2-common.h>
 #include <media/v4l2-ioctl.h>
+#include <media/v4l2-uvc.h>
 
 #include "uvcvideo.h"
 
@@ -34,198 +35,6 @@ static unsigned int uvc_quirks_param = -1;
 unsigned int uvc_dbg_param;
 unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
 
-/* ------------------------------------------------------------------------
- * Video formats
- */
-
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
 /* ------------------------------------------------------------------------
  * Utility functions
  */
@@ -245,19 +54,6 @@ struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
 	return NULL;
 }
 
-static struct uvc_format_desc *uvc_format_by_guid(const u8 guid[16])
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
-
 static enum v4l2_colorspace uvc_colorspace(const u8 primaries)
 {
 	static const enum v4l2_colorspace colorprimaries[] = {
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index ff710bdd38b3fd..df93db259312e7 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -41,144 +41,6 @@
 #define UVC_EXT_GPIO_UNIT		0x7ffe
 #define UVC_EXT_GPIO_UNIT_ID		0x100
 
-/* ------------------------------------------------------------------------
- * GUIDs
- */
-#define UVC_GUID_UVC_CAMERA \
-	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
-	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01}
-#define UVC_GUID_UVC_OUTPUT \
-	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
-	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02}
-#define UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT \
-	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
-	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03}
-#define UVC_GUID_UVC_PROCESSING \
-	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
-	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01}
-#define UVC_GUID_UVC_SELECTOR \
-	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
-	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02}
-#define UVC_GUID_EXT_GPIO_CONTROLLER \
-	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
-	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
-
-#define UVC_GUID_FORMAT_MJPEG \
-	{ 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_YUY2 \
-	{ 'Y',  'U',  'Y',  '2', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_YUY2_ISIGHT \
-	{ 'Y',  'U',  'Y',  '2', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0x00, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_NV12 \
-	{ 'N',  'V',  '1',  '2', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_YV12 \
-	{ 'Y',  'V',  '1',  '2', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_I420 \
-	{ 'I',  '4',  '2',  '0', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_UYVY \
-	{ 'U',  'Y',  'V',  'Y', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_Y800 \
-	{ 'Y',  '8',  '0',  '0', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_Y8 \
-	{ 'Y',  '8',  ' ',  ' ', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_Y10 \
-	{ 'Y',  '1',  '0',  ' ', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_Y12 \
-	{ 'Y',  '1',  '2',  ' ', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_Y16 \
-	{ 'Y',  '1',  '6',  ' ', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_BY8 \
-	{ 'B',  'Y',  '8',  ' ', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_BA81 \
-	{ 'B',  'A',  '8',  '1', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_GBRG \
-	{ 'G',  'B',  'R',  'G', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_GRBG \
-	{ 'G',  'R',  'B',  'G', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_RGGB \
-	{ 'R',  'G',  'G',  'B', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_BG16 \
-	{ 'B',  'G',  '1',  '6', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_GB16 \
-	{ 'G',  'B',  '1',  '6', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_RG16 \
-	{ 'R',  'G',  '1',  '6', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_GR16 \
-	{ 'G',  'R',  '1',  '6', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_RGBP \
-	{ 'R',  'G',  'B',  'P', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_BGR3 \
-	{ 0x7d, 0xeb, 0x36, 0xe4, 0x4f, 0x52, 0xce, 0x11, \
-	 0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70}
-#define UVC_GUID_FORMAT_M420 \
-	{ 'M',  '4',  '2',  '0', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-
-#define UVC_GUID_FORMAT_H264 \
-	{ 'H',  '2',  '6',  '4', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_H265 \
-	{ 'H',  '2',  '6',  '5', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_Y8I \
-	{ 'Y',  '8',  'I',  ' ', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_Y12I \
-	{ 'Y',  '1',  '2',  'I', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_Z16 \
-	{ 'Z',  '1',  '6',  ' ', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_RW10 \
-	{ 'R',  'W',  '1',  '0', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_INVZ \
-	{ 'I',  'N',  'V',  'Z', 0x90, 0x2d, 0x58, 0x4a, \
-	 0x92, 0x0b, 0x77, 0x3f, 0x1f, 0x2c, 0x55, 0x6b}
-#define UVC_GUID_FORMAT_INZI \
-	{ 'I',  'N',  'Z',  'I', 0x66, 0x1a, 0x42, 0xa2, \
-	 0x90, 0x65, 0xd0, 0x18, 0x14, 0xa8, 0xef, 0x8a}
-#define UVC_GUID_FORMAT_INVI \
-	{ 'I',  'N',  'V',  'I', 0xdb, 0x57, 0x49, 0x5e, \
-	 0x8e, 0x3f, 0xf4, 0x79, 0x53, 0x2b, 0x94, 0x6f}
-#define UVC_GUID_FORMAT_CNF4 \
-	{ 'C',  ' ',  ' ',  ' ', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-
-#define UVC_GUID_FORMAT_D3DFMT_L8 \
-	{0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_KSMEDIA_L8_IR \
-	{0x32, 0x00, 0x00, 0x00, 0x02, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-
-#define UVC_GUID_FORMAT_HEVC \
-	{ 'H',  'E',  'V',  'C', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-
-
 /* ------------------------------------------------------------------------
  * Driver specific constants.
  */
@@ -283,12 +145,6 @@ struct uvc_control {
 	struct uvc_fh *handle;	/* File handle that last changed the control. */
 };
 
-struct uvc_format_desc {
-	char *name;
-	u8 guid[16];
-	u32 fcc;
-};
-
 /*
  * The term 'entity' refers to both UVC units and UVC terminals.
  *
diff --git a/include/media/v4l2-uvc.h b/include/media/v4l2-uvc.h
new file mode 100644
index 00000000000000..f83e31661333bb
--- /dev/null
+++ b/include/media/v4l2-uvc.h
@@ -0,0 +1,359 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *  v4l2 uvc internal API header
+ *
+ *  Some commonly needed functions for uvc drivers
+ */
+
+#ifndef __LINUX_V4L2_UVC_H
+#define __LINUX_V4L2_UVC_H
+
+/* ------------------------------------------------------------------------
+ * GUIDs
+ */
+#define UVC_GUID_UVC_CAMERA \
+	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
+	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01}
+#define UVC_GUID_UVC_OUTPUT \
+	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
+	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02}
+#define UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT \
+	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
+	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03}
+#define UVC_GUID_UVC_PROCESSING \
+	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
+	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01}
+#define UVC_GUID_UVC_SELECTOR \
+	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
+	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02}
+#define UVC_GUID_EXT_GPIO_CONTROLLER \
+	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
+	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
+
+#define UVC_GUID_FORMAT_MJPEG \
+	{ 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_YUY2 \
+	{ 'Y',  'U',  'Y',  '2', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_YUY2_ISIGHT \
+	{ 'Y',  'U',  'Y',  '2', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0x00, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_NV12 \
+	{ 'N',  'V',  '1',  '2', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_YV12 \
+	{ 'Y',  'V',  '1',  '2', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_I420 \
+	{ 'I',  '4',  '2',  '0', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_UYVY \
+	{ 'U',  'Y',  'V',  'Y', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_Y800 \
+	{ 'Y',  '8',  '0',  '0', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_Y8 \
+	{ 'Y',  '8',  ' ',  ' ', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_Y10 \
+	{ 'Y',  '1',  '0',  ' ', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_Y12 \
+	{ 'Y',  '1',  '2',  ' ', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_Y16 \
+	{ 'Y',  '1',  '6',  ' ', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_BY8 \
+	{ 'B',  'Y',  '8',  ' ', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_BA81 \
+	{ 'B',  'A',  '8',  '1', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_GBRG \
+	{ 'G',  'B',  'R',  'G', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_GRBG \
+	{ 'G',  'R',  'B',  'G', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_RGGB \
+	{ 'R',  'G',  'G',  'B', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_BG16 \
+	{ 'B',  'G',  '1',  '6', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_GB16 \
+	{ 'G',  'B',  '1',  '6', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_RG16 \
+	{ 'R',  'G',  '1',  '6', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_GR16 \
+	{ 'G',  'R',  '1',  '6', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_RGBP \
+	{ 'R',  'G',  'B',  'P', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_BGR3 \
+	{ 0x7d, 0xeb, 0x36, 0xe4, 0x4f, 0x52, 0xce, 0x11, \
+	 0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70}
+#define UVC_GUID_FORMAT_M420 \
+	{ 'M',  '4',  '2',  '0', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+
+#define UVC_GUID_FORMAT_H264 \
+	{ 'H',  '2',  '6',  '4', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_H265 \
+	{ 'H',  '2',  '6',  '5', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_Y8I \
+	{ 'Y',  '8',  'I',  ' ', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_Y12I \
+	{ 'Y',  '1',  '2',  'I', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_Z16 \
+	{ 'Z',  '1',  '6',  ' ', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_RW10 \
+	{ 'R',  'W',  '1',  '0', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_INVZ \
+	{ 'I',  'N',  'V',  'Z', 0x90, 0x2d, 0x58, 0x4a, \
+	 0x92, 0x0b, 0x77, 0x3f, 0x1f, 0x2c, 0x55, 0x6b}
+#define UVC_GUID_FORMAT_INZI \
+	{ 'I',  'N',  'Z',  'I', 0x66, 0x1a, 0x42, 0xa2, \
+	 0x90, 0x65, 0xd0, 0x18, 0x14, 0xa8, 0xef, 0x8a}
+#define UVC_GUID_FORMAT_INVI \
+	{ 'I',  'N',  'V',  'I', 0xdb, 0x57, 0x49, 0x5e, \
+	 0x8e, 0x3f, 0xf4, 0x79, 0x53, 0x2b, 0x94, 0x6f}
+#define UVC_GUID_FORMAT_CNF4 \
+	{ 'C',  ' ',  ' ',  ' ', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+
+#define UVC_GUID_FORMAT_D3DFMT_L8 \
+	{0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_KSMEDIA_L8_IR \
+	{0x32, 0x00, 0x00, 0x00, 0x02, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+
+#define UVC_GUID_FORMAT_HEVC \
+	{ 'H',  'E',  'V',  'C', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+
+/* ------------------------------------------------------------------------
+ * Video formats
+ */
+
+struct uvc_format_desc {
+	char *name;
+	u8 guid[16];
+	u32 fcc;
+};
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
+static inline struct uvc_format_desc *uvc_format_by_guid(const u8 guid[16])
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
+
+#endif /* __LINUX_V4L2_UVC_H */
-- 
2.30.2

