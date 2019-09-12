Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC57B128A
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 18:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733149AbfILQB2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 12:01:28 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:40015 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbfILQB2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 12:01:28 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i8RXD-0003qW-9g; Thu, 12 Sep 2019 18:01:27 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>, kernel@pengutronix.de
Subject: [PATCH 2/3] media: imx: fix and simplify pixel format enumeration
Date:   Thu, 12 Sep 2019 18:01:21 +0200
Message-Id: <20190912160122.5545-2-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190912160122.5545-1-p.zabel@pengutronix.de>
References: <20190912160122.5545-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Merge yuv_formats and rgb_formats into a single array. Always loop over
all entries, skipping those that are incompatible with the requested
enumeration. This simplifies the code, lets us get rid of the manual
counting of array entries, and stops accidentally ignoring some non-mbus
RGB formats.

Before:

  $ v4l2-ctl -d /dev/video14 --list-formats-out
  ioctl: VIDIOC_ENUM_FMT
	Type: Video Output

	[0]: 'UYVY' (UYVY 4:2:2)
	[1]: 'YUYV' (YUYV 4:2:2)
	[2]: 'YU12' (Planar YUV 4:2:0)
	[3]: 'YV12' (Planar YVU 4:2:0)
	[4]: '422P' (Planar YUV 4:2:2)
	[5]: 'NV12' (Y/CbCr 4:2:0)
	[6]: 'NV16' (Y/CbCr 4:2:2)
	[7]: 'RGBP' (16-bit RGB 5-6-5)
	[8]: 'RGB3' (24-bit RGB 8-8-8)
	[9]: 'BX24' (32-bit XRGB 8-8-8-8)

After:

  $ v4l2-ctl -d /dev/video14 --list-formats-out
  ioctl: VIDIOC_ENUM_FMT
	Type: Video Output

	[0]: 'UYVY' (UYVY 4:2:2)
	[1]: 'YUYV' (YUYV 4:2:2)
	[2]: 'YU12' (Planar YUV 4:2:0)
	[3]: 'YV12' (Planar YVU 4:2:0)
	[4]: '422P' (Planar YUV 4:2:2)
	[5]: 'NV12' (Y/CbCr 4:2:0)
	[6]: 'NV16' (Y/CbCr 4:2:2)
	[7]: 'RGBP' (16-bit RGB 5-6-5)
	[8]: 'RGB3' (24-bit RGB 8-8-8)
	[9]: 'BGR3' (24-bit BGR 8-8-8)
	[10]: 'BX24' (32-bit XRGB 8-8-8-8)
	[11]: 'XR24' (32-bit BGRX 8-8-8-8)
	[12]: 'RX24' (32-bit XBGR 8-8-8-8)
	[13]: 'XB24' (32-bit RGBX 8-8-8-8)

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/media/imx/imx-media-utils.c | 170 ++++++--------------
 1 file changed, 45 insertions(+), 125 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 0788a1874557..d61a8f4533dc 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -9,12 +9,9 @@
 
 /*
  * List of supported pixel formats for the subdevs.
- *
- * In all of these tables, the non-mbus formats (with no
- * mbus codes) must all fall at the end of the table.
  */
-
-static const struct imx_media_pixfmt yuv_formats[] = {
+static const struct imx_media_pixfmt pixel_formats[] = {
+	/*** YUV formats start here ***/
 	{
 		.fourcc	= V4L2_PIX_FMT_UYVY,
 		.codes  = {
@@ -31,12 +28,7 @@ static const struct imx_media_pixfmt yuv_formats[] = {
 		},
 		.cs     = IPUV3_COLORSPACE_YUV,
 		.bpp    = 16,
-	},
-	/***
-	 * non-mbus YUV formats start here. NOTE! when adding non-mbus
-	 * formats, NUM_NON_MBUS_YUV_FORMATS must be updated below.
-	 ***/
-	{
+	}, {
 		.fourcc	= V4L2_PIX_FMT_YUV420,
 		.cs     = IPUV3_COLORSPACE_YUV,
 		.bpp    = 12,
@@ -62,13 +54,7 @@ static const struct imx_media_pixfmt yuv_formats[] = {
 		.bpp    = 16,
 		.planar = true,
 	},
-};
-
-#define NUM_NON_MBUS_YUV_FORMATS 5
-#define NUM_YUV_FORMATS ARRAY_SIZE(yuv_formats)
-#define NUM_MBUS_YUV_FORMATS (NUM_YUV_FORMATS - NUM_NON_MBUS_YUV_FORMATS)
-
-static const struct imx_media_pixfmt rgb_formats[] = {
+	/*** RGB formats start here ***/
 	{
 		.fourcc	= V4L2_PIX_FMT_RGB565,
 		.codes  = {MEDIA_BUS_FMT_RGB565_2X8_LE},
@@ -83,12 +69,28 @@ static const struct imx_media_pixfmt rgb_formats[] = {
 		},
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 24,
+	}, {
+		.fourcc	= V4L2_PIX_FMT_BGR24,
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 24,
 	}, {
 		.fourcc	= V4L2_PIX_FMT_XRGB32,
 		.codes  = {MEDIA_BUS_FMT_ARGB8888_1X32},
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 32,
 		.ipufmt = true,
+	}, {
+		.fourcc	= V4L2_PIX_FMT_XBGR32,
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 32,
+	}, {
+		.fourcc	= V4L2_PIX_FMT_BGRX32,
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 32,
+	}, {
+		.fourcc	= V4L2_PIX_FMT_RGBX32,
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 32,
 	},
 	/*** raw bayer and grayscale formats start here ***/
 	{
@@ -175,33 +177,8 @@ static const struct imx_media_pixfmt rgb_formats[] = {
 		.bpp    = 16,
 		.bayer  = true,
 	},
-	/***
-	 * non-mbus RGB formats start here. NOTE! when adding non-mbus
-	 * formats, NUM_NON_MBUS_RGB_FORMATS must be updated below.
-	 ***/
-	{
-		.fourcc	= V4L2_PIX_FMT_BGR24,
-		.cs     = IPUV3_COLORSPACE_RGB,
-		.bpp    = 24,
-	}, {
-		.fourcc	= V4L2_PIX_FMT_XBGR32,
-		.cs     = IPUV3_COLORSPACE_RGB,
-		.bpp    = 32,
-	}, {
-		.fourcc	= V4L2_PIX_FMT_BGRX32,
-		.cs     = IPUV3_COLORSPACE_RGB,
-		.bpp    = 32,
-	}, {
-		.fourcc	= V4L2_PIX_FMT_RGBX32,
-		.cs     = IPUV3_COLORSPACE_RGB,
-		.bpp    = 32,
-	},
 };
 
-#define NUM_NON_MBUS_RGB_FORMATS 2
-#define NUM_RGB_FORMATS ARRAY_SIZE(rgb_formats)
-#define NUM_MBUS_RGB_FORMATS (NUM_RGB_FORMATS - NUM_NON_MBUS_RGB_FORMATS)
-
 static const struct imx_media_pixfmt ipu_yuv_formats[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_YUV32,
@@ -240,20 +217,20 @@ static void init_mbus_colorimetry(struct v4l2_mbus_framefmt *mbus,
 }
 
 static const
-struct imx_media_pixfmt *__find_format(u32 fourcc,
-				       u32 code,
-				       bool allow_non_mbus,
-				       bool allow_bayer,
-				       const struct imx_media_pixfmt *array,
-				       u32 array_size)
+struct imx_media_pixfmt *find_format(u32 fourcc,
+				     u32 code,
+				     enum codespace_sel cs_sel,
+				     bool allow_non_mbus,
+				     bool allow_bayer)
 {
 	const struct imx_media_pixfmt *fmt;
 	int i, j;
 
-	for (i = 0; i < array_size; i++) {
-		fmt = &array[i];
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		fmt = &pixel_formats[i];
 
-		if ((!allow_non_mbus && !fmt->codes[0]) ||
+		if ((cs_sel != CS_SEL_ANY && fmt->cs != cs_sel) ||
+		    (!allow_non_mbus && !fmt->codes[0]) ||
 		    (!allow_bayer && fmt->bayer))
 			continue;
 
@@ -263,7 +240,7 @@ struct imx_media_pixfmt *__find_format(u32 fourcc,
 		if (!code)
 			continue;
 
-		for (j = 0; fmt->codes[j]; j++) {
+		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
 			if (code == fmt->codes[j])
 				return fmt;
 		}
@@ -271,86 +248,29 @@ struct imx_media_pixfmt *__find_format(u32 fourcc,
 	return NULL;
 }
 
-static const struct imx_media_pixfmt *find_format(u32 fourcc,
-						  u32 code,
-						  enum codespace_sel cs_sel,
-						  bool allow_non_mbus,
-						  bool allow_bayer)
-{
-	const struct imx_media_pixfmt *ret;
-
-	switch (cs_sel) {
-	case CS_SEL_YUV:
-		return __find_format(fourcc, code, allow_non_mbus, allow_bayer,
-				     yuv_formats, NUM_YUV_FORMATS);
-	case CS_SEL_RGB:
-		return __find_format(fourcc, code, allow_non_mbus, allow_bayer,
-				     rgb_formats, NUM_RGB_FORMATS);
-	case CS_SEL_ANY:
-		ret = __find_format(fourcc, code, allow_non_mbus, allow_bayer,
-				    yuv_formats, NUM_YUV_FORMATS);
-		if (ret)
-			return ret;
-		return __find_format(fourcc, code, allow_non_mbus, allow_bayer,
-				     rgb_formats, NUM_RGB_FORMATS);
-	default:
-		return NULL;
-	}
-}
-
 static int enum_format(u32 *fourcc, u32 *code, u32 index,
 		       enum codespace_sel cs_sel,
 		       bool allow_non_mbus,
 		       bool allow_bayer)
 {
 	const struct imx_media_pixfmt *fmt;
-	u32 mbus_yuv_sz = NUM_MBUS_YUV_FORMATS;
-	u32 mbus_rgb_sz = NUM_MBUS_RGB_FORMATS;
-	u32 yuv_sz = NUM_YUV_FORMATS;
-	u32 rgb_sz = NUM_RGB_FORMATS;
+	unsigned int i, j = 0;
 
-	switch (cs_sel) {
-	case CS_SEL_YUV:
-		if (index >= yuv_sz ||
-		    (!allow_non_mbus && index >= mbus_yuv_sz))
-			return -EINVAL;
-		fmt = &yuv_formats[index];
-		break;
-	case CS_SEL_RGB:
-		if (index >= rgb_sz ||
-		    (!allow_non_mbus && index >= mbus_rgb_sz))
-			return -EINVAL;
-		fmt = &rgb_formats[index];
-		if (!allow_bayer && fmt->bayer)
-			return -EINVAL;
-		break;
-	case CS_SEL_ANY:
-		if (!allow_non_mbus) {
-			if (index >= mbus_yuv_sz) {
-				index -= mbus_yuv_sz;
-				if (index >= mbus_rgb_sz)
-					return -EINVAL;
-				fmt = &rgb_formats[index];
-				if (!allow_bayer && fmt->bayer)
-					return -EINVAL;
-			} else {
-				fmt = &yuv_formats[index];
-			}
-		} else {
-			if (index >= yuv_sz + rgb_sz)
-				return -EINVAL;
-			if (index >= yuv_sz) {
-				fmt = &rgb_formats[index - yuv_sz];
-				if (!allow_bayer && fmt->bayer)
-					return -EINVAL;
-			} else {
-				fmt = &yuv_formats[index];
-			}
-		}
-		break;
-	default:
-		return -EINVAL;
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		fmt = &pixel_formats[i];
+
+		if ((cs_sel != CS_SEL_ANY && fmt->cs != cs_sel) ||
+		    (!allow_non_mbus && !fmt->codes[0]) ||
+		    (!allow_bayer && fmt->bayer))
+			continue;
+
+		if (index == j)
+			break;
+
+		j++;
 	}
+	if (i == ARRAY_SIZE(pixel_formats))
+		return -EINVAL;
 
 	if (fourcc)
 		*fourcc = fmt->fourcc;
-- 
2.20.1

