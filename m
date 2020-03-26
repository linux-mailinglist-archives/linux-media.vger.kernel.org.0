Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3F1D1946FE
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 20:05:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbgCZTFx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 15:05:53 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37155 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727611AbgCZTFx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 15:05:53 -0400
Received: by mail-pl1-f194.google.com with SMTP id x1so2521508plm.4
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 12:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d56l7K4RFMK3f7UGZXvp+con9YG1dwWpCGo9TcNN64A=;
        b=XAoR2I+udxYKjhz4hwJW/Q8O+q2tBVtAqUi1EXu1YvmaZyh6Gn0W+xPPaBxPVqWEkj
         Zbb1hSxIsHhWZrkWiBv5fhPvF7sK7qlrJTM88kWgqcT0db1aXdfzH4GxcOuzKVXehBNy
         cDxdMYNsMC8u6FeWGcOkzJr+MJ5BNbKzq5mWUbzErwZubKPTIYs/ih0tZ9z2TLbOum1j
         MgBdROo4QiOp9aSfsLhuNo2aFU2PnSNtde5Zyu+M1L8w73XmI0jDGAtSY5GmwKP9XQkk
         QoztGUsnKe7iGFR3akK8678OSVSz8XeVjjvWtr8s8+1+LHYfZjVGgKu1rJh1ty5LNGaP
         c+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d56l7K4RFMK3f7UGZXvp+con9YG1dwWpCGo9TcNN64A=;
        b=UVuiLgq5Zj7fW31cD7RnUoIRmqZFxE7s8M5TftX3MeTF8NdN6mb73kHSZfFyF6aind
         mtI00EP7O3+LWNdab/5haP1MSpAMbbBx3MGGq34HwEY26wX+vZ11dHlou+IBirKF6K46
         6iAlfjZRIhCYyrWZA7t6YpjOVgpRcCN3L9m9+0FVg7LckuqhzpQRpbtSZbURX/oA9mRw
         1NJrPHO0wSXHWY5EABt8B1FiQtIFPXCeQ6s/Tlos2483W0jHmMKJpB0BCSb7r3JA2owN
         0MFllB2fDhqziPNnb+kmOF9mzlwSOHkJhmfE+JrOYiXuiJCyfIvHDtrbVTDw30ouO6qY
         V+zg==
X-Gm-Message-State: ANhLgQ25D3b6f+PZIRgTzrel3eAykSO4AhFs9FgoDu9JxhbtUL3PR5Zi
        UTI85mu2zUZ/PvfA9DlEP3wQHQ/SbWo=
X-Google-Smtp-Source: ADFU+vu2UaGgdqWnrASesCszLK1o/JiRaxt2JVozeap7KtEnf37Zr7rD1LqwP0v8SpZrIJk/IW5A8g==
X-Received: by 2002:a17:90a:1d4:: with SMTP id 20mr1494755pjd.95.1585249551340;
        Thu, 26 Mar 2020 12:05:51 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q103sm7414623pjc.1.2020.03.26.12.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 12:05:50 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH 01/10] media: imx: utils: fix and simplify pixel format enumeration
Date:   Thu, 26 Mar 2020 12:05:35 -0700
Message-Id: <20200326190544.16349-2-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326190544.16349-1-slongerbeam@gmail.com>
References: <20200326190544.16349-1-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Add comment headers that describe functions find_format() and
enum_format() and their arguments.

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

slongerbeam:
- Renamed index j in enum_format() to "match_index", which makes it more
  clear that this is a count of the pixel_formats[] entries that match the
  requested search criteria.

- Fixed compile warnings:
  drivers/staging/media/imx/imx-media-utils.c: In function ‘find_format’:
  drivers/staging/media/imx/imx-media-utils.c:232:40: warning: comparison between ‘const enum ipu_color_space’ and ‘enum codespace_sel’
  [-Wenum-compare]
    232 |   if ((cs_sel != CS_SEL_ANY && fmt->cs != cs_sel) ||
        |                                        ^~

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 179 ++++++--------------
 1 file changed, 53 insertions(+), 126 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index fae981698c49..8ff175b08836 100644
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
 	const struct imx_media_pixfmt *fmt;
 	int i, j;
 
-	for (i = 0; i < array_size; i++) {
-		fmt = &array[i];
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		enum codespace_sel fmt_cs_sel;
 
-		if ((!allow_non_mbus && !fmt->codes[0]) ||
+		fmt = &pixel_formats[i];
+		fmt_cs_sel = (fmt->cs == IPUV3_COLORSPACE_YUV) ?
+			CS_SEL_YUV : CS_SEL_RGB;
+
+		if ((cs_sel != CS_SEL_ANY && fmt_cs_sel != cs_sel) ||
+		    (!allow_non_mbus && !fmt->codes[0]) ||
 		    (!allow_bayer && fmt->bayer))
 			continue;
 
@@ -270,7 +250,7 @@ struct imx_media_pixfmt *__find_format(u32 fourcc,
 		if (!code)
 			continue;
 
-		for (j = 0; fmt->codes[j]; j++) {
+		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
 			if (code == fmt->codes[j])
 				return fmt;
 		}
@@ -278,86 +258,33 @@ struct imx_media_pixfmt *__find_format(u32 fourcc,
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
+	unsigned int i, match_index = 0;
 
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
+		enum codespace_sel fmt_cs_sel;
+
+		fmt = &pixel_formats[i];
+		fmt_cs_sel = (fmt->cs == IPUV3_COLORSPACE_YUV) ?
+			CS_SEL_YUV : CS_SEL_RGB;
+
+		if ((cs_sel != CS_SEL_ANY && fmt_cs_sel != cs_sel) ||
+		    (!allow_non_mbus && !fmt->codes[0]) ||
+		    (!allow_bayer && fmt->bayer))
+			continue;
+
+		if (index == match_index)
+			break;
+
+		match_index++;
 	}
+	if (i == ARRAY_SIZE(pixel_formats))
+		return -EINVAL;
 
 	if (fourcc)
 		*fourcc = fmt->fourcc;
-- 
2.17.1

