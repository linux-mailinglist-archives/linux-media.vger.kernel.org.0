Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D06D067D97E
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 00:15:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233418AbjAZXPW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 18:15:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233217AbjAZXPR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 18:15:17 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F8DE2E811
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 15:15:16 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pLBSX-0004JE-HN; Fri, 27 Jan 2023 00:15:09 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1pLBSX-000fEu-Qq; Fri, 27 Jan 2023 00:15:08 +0100
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1pLBSV-00EH8B-MW; Fri, 27 Jan 2023 00:15:07 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     laurent.pinchart@ideasonboard.com
Cc:     gregkh@linuxfoundation.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v3 5/5] usb: uvc: use v4l2_fill_fmtdesc instead of open coded format name
Date:   Fri, 27 Jan 2023 00:14:56 +0100
Message-Id: <20230126231456.3402323-6-m.grzeschik@pengutronix.de>
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

Since v4l2_fill_fmtdesc will be called in the ioctl v4l_enum_fmt anyway.
We can set the format description and compressed flag from v4l_fill_fmtdesc
and can remove the extra name field in uvc_format_desc.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Tested-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2: - added reviewed and tested tags
v2 -> v3: - removed corresponding code in uvc_driver
          - using call from v4l_enum_fmt in uvc_v4l2.c

 drivers/media/common/uvc.c             | 38 --------------------------
 drivers/usb/gadget/function/uvc_v4l2.c |  6 ----
 include/linux/usb/uvc.h                |  1 -
 3 files changed, 45 deletions(-)

diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
index 2b4df3e8f48aa6..9c0ba7a6c185b1 100644
--- a/drivers/media/common/uvc.c
+++ b/drivers/media/common/uvc.c
@@ -13,192 +13,154 @@
 
 static const struct uvc_format_desc uvc_fmts[] = {
 	{
-		.name		= "YUV 4:2:2 (YUYV)",
 		.guid		= UVC_GUID_FORMAT_YUY2,
 		.fcc		= V4L2_PIX_FMT_YUYV,
 	},
 	{
-		.name		= "YUV 4:2:2 (YUYV)",
 		.guid		= UVC_GUID_FORMAT_YUY2_ISIGHT,
 		.fcc		= V4L2_PIX_FMT_YUYV,
 	},
 	{
-		.name		= "YUV 4:2:0 (NV12)",
 		.guid		= UVC_GUID_FORMAT_NV12,
 		.fcc		= V4L2_PIX_FMT_NV12,
 	},
 	{
-		.name		= "MJPEG",
 		.guid		= UVC_GUID_FORMAT_MJPEG,
 		.fcc		= V4L2_PIX_FMT_MJPEG,
 	},
 	{
-		.name		= "YVU 4:2:0 (YV12)",
 		.guid		= UVC_GUID_FORMAT_YV12,
 		.fcc		= V4L2_PIX_FMT_YVU420,
 	},
 	{
-		.name		= "YUV 4:2:0 (I420)",
 		.guid		= UVC_GUID_FORMAT_I420,
 		.fcc		= V4L2_PIX_FMT_YUV420,
 	},
 	{
-		.name		= "YUV 4:2:0 (M420)",
 		.guid		= UVC_GUID_FORMAT_M420,
 		.fcc		= V4L2_PIX_FMT_M420,
 	},
 	{
-		.name		= "YUV 4:2:2 (UYVY)",
 		.guid		= UVC_GUID_FORMAT_UYVY,
 		.fcc		= V4L2_PIX_FMT_UYVY,
 	},
 	{
-		.name		= "Greyscale 8-bit (Y800)",
 		.guid		= UVC_GUID_FORMAT_Y800,
 		.fcc		= V4L2_PIX_FMT_GREY,
 	},
 	{
-		.name		= "Greyscale 8-bit (Y8  )",
 		.guid		= UVC_GUID_FORMAT_Y8,
 		.fcc		= V4L2_PIX_FMT_GREY,
 	},
 	{
-		.name		= "Greyscale 8-bit (D3DFMT_L8)",
 		.guid		= UVC_GUID_FORMAT_D3DFMT_L8,
 		.fcc		= V4L2_PIX_FMT_GREY,
 	},
 	{
-		.name		= "IR 8-bit (L8_IR)",
 		.guid		= UVC_GUID_FORMAT_KSMEDIA_L8_IR,
 		.fcc		= V4L2_PIX_FMT_GREY,
 	},
 	{
-		.name		= "Greyscale 10-bit (Y10 )",
 		.guid		= UVC_GUID_FORMAT_Y10,
 		.fcc		= V4L2_PIX_FMT_Y10,
 	},
 	{
-		.name		= "Greyscale 12-bit (Y12 )",
 		.guid		= UVC_GUID_FORMAT_Y12,
 		.fcc		= V4L2_PIX_FMT_Y12,
 	},
 	{
-		.name		= "Greyscale 16-bit (Y16 )",
 		.guid		= UVC_GUID_FORMAT_Y16,
 		.fcc		= V4L2_PIX_FMT_Y16,
 	},
 	{
-		.name		= "BGGR Bayer (BY8 )",
 		.guid		= UVC_GUID_FORMAT_BY8,
 		.fcc		= V4L2_PIX_FMT_SBGGR8,
 	},
 	{
-		.name		= "BGGR Bayer (BA81)",
 		.guid		= UVC_GUID_FORMAT_BA81,
 		.fcc		= V4L2_PIX_FMT_SBGGR8,
 	},
 	{
-		.name		= "GBRG Bayer (GBRG)",
 		.guid		= UVC_GUID_FORMAT_GBRG,
 		.fcc		= V4L2_PIX_FMT_SGBRG8,
 	},
 	{
-		.name		= "GRBG Bayer (GRBG)",
 		.guid		= UVC_GUID_FORMAT_GRBG,
 		.fcc		= V4L2_PIX_FMT_SGRBG8,
 	},
 	{
-		.name		= "RGGB Bayer (RGGB)",
 		.guid		= UVC_GUID_FORMAT_RGGB,
 		.fcc		= V4L2_PIX_FMT_SRGGB8,
 	},
 	{
-		.name		= "RGB565",
 		.guid		= UVC_GUID_FORMAT_RGBP,
 		.fcc		= V4L2_PIX_FMT_RGB565,
 	},
 	{
-		.name		= "BGR 8:8:8 (BGR3)",
 		.guid		= UVC_GUID_FORMAT_BGR3,
 		.fcc		= V4L2_PIX_FMT_BGR24,
 	},
 	{
-		.name		= "BGRA/X 8:8:8:8 (BGR4)",
 		.guid		= UVC_GUID_FORMAT_BGR4,
 		.fcc		= V4L2_PIX_FMT_XBGR32,
 	},
 	{
-		.name		= "H.264",
 		.guid		= UVC_GUID_FORMAT_H264,
 		.fcc		= V4L2_PIX_FMT_H264,
 	},
 	{
-		.name		= "H.265",
 		.guid		= UVC_GUID_FORMAT_H265,
 		.fcc		= V4L2_PIX_FMT_HEVC,
 	},
 	{
-		.name		= "Greyscale 8 L/R (Y8I)",
 		.guid		= UVC_GUID_FORMAT_Y8I,
 		.fcc		= V4L2_PIX_FMT_Y8I,
 	},
 	{
-		.name		= "Greyscale 12 L/R (Y12I)",
 		.guid		= UVC_GUID_FORMAT_Y12I,
 		.fcc		= V4L2_PIX_FMT_Y12I,
 	},
 	{
-		.name		= "Depth data 16-bit (Z16)",
 		.guid		= UVC_GUID_FORMAT_Z16,
 		.fcc		= V4L2_PIX_FMT_Z16,
 	},
 	{
-		.name		= "Bayer 10-bit (SRGGB10P)",
 		.guid		= UVC_GUID_FORMAT_RW10,
 		.fcc		= V4L2_PIX_FMT_SRGGB10P,
 	},
 	{
-		.name		= "Bayer 16-bit (SBGGR16)",
 		.guid		= UVC_GUID_FORMAT_BG16,
 		.fcc		= V4L2_PIX_FMT_SBGGR16,
 	},
 	{
-		.name		= "Bayer 16-bit (SGBRG16)",
 		.guid		= UVC_GUID_FORMAT_GB16,
 		.fcc		= V4L2_PIX_FMT_SGBRG16,
 	},
 	{
-		.name		= "Bayer 16-bit (SRGGB16)",
 		.guid		= UVC_GUID_FORMAT_RG16,
 		.fcc		= V4L2_PIX_FMT_SRGGB16,
 	},
 	{
-		.name		= "Bayer 16-bit (SGRBG16)",
 		.guid		= UVC_GUID_FORMAT_GR16,
 		.fcc		= V4L2_PIX_FMT_SGRBG16,
 	},
 	{
-		.name		= "Depth data 16-bit (Z16)",
 		.guid		= UVC_GUID_FORMAT_INVZ,
 		.fcc		= V4L2_PIX_FMT_Z16,
 	},
 	{
-		.name		= "Greyscale 10-bit (Y10 )",
 		.guid		= UVC_GUID_FORMAT_INVI,
 		.fcc		= V4L2_PIX_FMT_Y10,
 	},
 	{
-		.name		= "IR:Depth 26-bit (INZI)",
 		.guid		= UVC_GUID_FORMAT_INZI,
 		.fcc		= V4L2_PIX_FMT_INZI,
 	},
 	{
-		.name		= "4-bit Depth Confidence (Packed)",
 		.guid		= UVC_GUID_FORMAT_CNF4,
 		.fcc		= V4L2_PIX_FMT_CNF4,
 	},
 	{
-		.name		= "HEVC",
 		.guid		= UVC_GUID_FORMAT_HEVC,
 		.fcc		= V4L2_PIX_FMT_HEVC,
 	},
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 21e573e628f4e7..3f0a9795c0d45d 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -374,15 +374,9 @@ uvc_v4l2_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 	if (!uformat)
 		return -EINVAL;
 
-	if (uformat->type != UVCG_UNCOMPRESSED)
-		f->flags |= V4L2_FMT_FLAG_COMPRESSED;
-
 	fmtdesc = to_uvc_format(uformat);
 	f->pixelformat = fmtdesc->fcc;
 
-	strscpy(f->description, fmtdesc->name, sizeof(f->description));
-	f->description[strlen(fmtdesc->name) - 1] = 0;
-
 	return 0;
 }
 
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index b0210c5c5406b3..88d96095bcb163 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -149,7 +149,6 @@
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
 
 struct uvc_format_desc {
-	char *name;
 	u8 guid[16];
 	u32 fcc;
 };
-- 
2.30.2

