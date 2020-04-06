Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 924D519FA3D
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 18:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729470AbgDFQjQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 12:39:16 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37295 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729184AbgDFQjP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 12:39:15 -0400
Received: by mail-pg1-f196.google.com with SMTP id r4so199546pgg.4
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 09:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ryysd62XzKXqT6N7Bd+7N9GE4k/LSFv+zAgtQQw9MoU=;
        b=J0BdJFvnpUlDgrdCczaaqWeI1Y0ml20hcYA3W4Da2r0oUZLCs8fihL6NHA+lkW8u90
         MUjGf0J8Y+zHReBoSILaqbvz/1Zl0gK+FO1GVPW7nVeL/STKowPEW7CVtTmLRsmnnCLk
         O90lPrvJrspbQzircaXTZSkkJrN903i2oXg3p5P/gW7B89HI+ulOlb6BIAohdXLY4Voc
         /VJteAkJvwnrlYeB0O79clo6ZmuQE5dVfUyvbaqh4aNiFMAh+2bmVPQwi76arNp0jECX
         LLQugoEDs1igGjGV/pi9iYuB5O92l9AcqOOBbgWeZkQ4pOzZOfbE0mMBLsuC0f7/ChS3
         zPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ryysd62XzKXqT6N7Bd+7N9GE4k/LSFv+zAgtQQw9MoU=;
        b=lwNjtP2ot0ifZDDhxMqn9CLh+z/HwJRuB3LQrnmrIwSPvtgzglTlCMM608srefF6Ul
         9tgZ10nuX0D8ZYaZJQuoel8wYdL9d0PZIJGlwDcl4uBQFdbuhoViTAsYAKCbi2dQZpUX
         qZiexOelBXJznGclK6FVgNSu/bFRavAZiL7d176Oq3byqrro8KpVDqUzn/OFAdoTqyRO
         tQhHWjpGPIAmrpyQXMvS8sDxZgjw4edSKVyxxpo9dBXHT3fmO54rSSu0PxEGWLq7abwT
         GY5XxuOJEh3ybwN2CD6dYcMj2pDItMt/dhm1dfWBDwTR7+q72kG21LpyquSW0N9prB57
         B8uA==
X-Gm-Message-State: AGi0PubUiE4xIBFgORDuJJetTLRZDLhu6iUwcoqVlPDpU5oOM2UuXs87
        NGnWAwnBPUJ4uFIxkmG06EHqjX+amRI=
X-Google-Smtp-Source: APiQypJNp6GG7wmvsStr1TnNIR1Xnaz0CjjJB1L9ZhrXS7uJrEW+hRr4Ee/Sb5B75XzWy2qDBzUaOg==
X-Received: by 2002:a65:558a:: with SMTP id j10mr21221784pgs.13.1586191153679;
        Mon, 06 Apr 2020 09:39:13 -0700 (PDT)
Received: from mappy.world.mentorg.com (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id w29sm11165131pge.25.2020.04.06.09.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 09:39:12 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v7 01/11] media: imx: utils: fix and simplify pixel format enumeration
Date:   Mon,  6 Apr 2020 09:38:55 -0700
Message-Id: <20200406163905.24475-2-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200406163905.24475-1-slongerbeam@gmail.com>
References: <20200406163905.24475-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Philipp Zabel <p.zabel@pengutronix.de>

Merge yuv_formats and rgb_formats into a single array. Always loop over
all entries, skipping those that do not match the requested search
criteria. This simplifies the code, lets us get rid of the manual
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

[Make loop counters unsigned]
[Decrement index instead of adding a counter]
[Return directly from within loop instead of breaking]
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[Fix colorspace comparison error]
Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 193 ++++++--------------
 1 file changed, 59 insertions(+), 134 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index fae981698c49..39469031e510 100644
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
@@ -182,33 +184,8 @@ static const struct imx_media_pixfmt rgb_formats[] = {
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
@@ -246,21 +223,24 @@ static void init_mbus_colorimetry(struct v4l2_mbus_framefmt *mbus,
 					      mbus->ycbcr_enc);
 }
 
-static const
-struct imx_media_pixfmt *__find_format(u32 fourcc,
-				       u32 code,
-				       bool allow_non_mbus,
-				       bool allow_bayer,
-				       const struct imx_media_pixfmt *array,
-				       u32 array_size)
+static const struct imx_media_pixfmt *find_format(u32 fourcc,
+						  u32 code,
+						  enum codespace_sel cs_sel,
+						  bool allow_non_mbus,
+						  bool allow_bayer)
 {
-	const struct imx_media_pixfmt *fmt;
-	int i, j;
+	unsigned int i;
 
-	for (i = 0; i < array_size; i++) {
-		fmt = &array[i];
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
+		enum codespace_sel fmt_cs_sel;
+		unsigned int j;
 
-		if ((!allow_non_mbus && !fmt->codes[0]) ||
+		fmt_cs_sel = (fmt->cs == IPUV3_COLORSPACE_YUV) ?
+			CS_SEL_YUV : CS_SEL_RGB;
+
+		if ((cs_sel != CS_SEL_ANY && fmt_cs_sel != cs_sel) ||
+		    (!allow_non_mbus && !fmt->codes[0]) ||
 		    (!allow_bayer && fmt->bayer))
 			continue;
 
@@ -270,39 +250,13 @@ struct imx_media_pixfmt *__find_format(u32 fourcc,
 		if (!code)
 			continue;
 
-		for (j = 0; fmt->codes[j]; j++) {
+		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
 			if (code == fmt->codes[j])
 				return fmt;
 		}
 	}
-	return NULL;
-}
 
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
+	return NULL;
 }
 
 static int enum_format(u32 *fourcc, u32 *code, u32 index,
@@ -310,61 +264,32 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 		       bool allow_non_mbus,
 		       bool allow_bayer)
 {
-	const struct imx_media_pixfmt *fmt;
-	u32 mbus_yuv_sz = NUM_MBUS_YUV_FORMATS;
-	u32 mbus_rgb_sz = NUM_MBUS_RGB_FORMATS;
-	u32 yuv_sz = NUM_YUV_FORMATS;
-	u32 rgb_sz = NUM_RGB_FORMATS;
+	unsigned int i;
 
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
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
+		enum codespace_sel fmt_cs_sel;
+
+		fmt_cs_sel = (fmt->cs == IPUV3_COLORSPACE_YUV) ?
+			CS_SEL_YUV : CS_SEL_RGB;
+
+		if ((cs_sel != CS_SEL_ANY && fmt_cs_sel != cs_sel) ||
+		    (!allow_non_mbus && !fmt->codes[0]) ||
+		    (!allow_bayer && fmt->bayer))
+			continue;
+
+		if (index == 0) {
+			if (fourcc)
+				*fourcc = fmt->fourcc;
+			if (code)
+				*code = fmt->codes[0];
+			return 0;
 		}
-		break;
-	default:
-		return -EINVAL;
-	}
 
-	if (fourcc)
-		*fourcc = fmt->fourcc;
-	if (code)
-		*code = fmt->codes[0];
+		index--;
+	}
 
-	return 0;
+	return -EINVAL;
 }
 
 const struct imx_media_pixfmt *
-- 
2.17.1

