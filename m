Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45B88194B42
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 23:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbgCZWI7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 18:08:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42062 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727347AbgCZWI7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 18:08:59 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D064144E;
        Thu, 26 Mar 2020 23:08:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1585260534;
        bh=49OTC1NJ6la6Ufglp/I5A1NL0U+4sfONZyx6DxaOOYs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nkyqw43E5INyLZq3BJFy6vFloG3z04BoaaTf1TLVIh1BRNy+r3AdxodBqq7tFkb9k
         fD5nPmX9mkpmt5FoqimghmtIv1zJidiVzY8hZYsljWIXHO7ZA1qU07IhqKapGsPu+2
         hyzQzFH7zneWrFpuseiYNyIs+5IV999aM3YhtaRA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v2 06/11] media: imx: utils: Make imx_media_pixfmt handle variable number of codes
Date:   Fri, 27 Mar 2020 00:08:35 +0200
Message-Id: <20200326220840.18540-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200326220840.18540-1-laurent.pinchart@ideasonboard.com>
References: <20200326220840.18540-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx_media_pixfmt structures includes a codes member that stores
media bus codes as a fixed array of 4 integers. The functions dealing
with the imx_media_pixfmt structures assume that the array of codes is
terminated by a 0 elements. This mechanism is fragile, as demonstrated
by several instances of the structure contained 4 non-zero codes.

Fix this by turning the array into a pointer, and providing an
IMX_BUS_FMTS macro to initialize the codes member with a guaranteed 0
element at the end.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 81 ++++++++++++---------
 drivers/staging/media/imx/imx-media.h       |  2 +-
 2 files changed, 48 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 490f743c4e77..2dcb6285a6c0 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -10,22 +10,29 @@
 /*
  * List of supported pixel formats for the subdevs.
  */
+
+#define IMX_BUS_FMTS(fmts...)	\
+	(const u32[]) {		\
+		fmts,		\
+		0		\
+	}
+
 static const struct imx_media_pixfmt pixel_formats[] = {
 	/*** YUV formats start here ***/
 	{
 		.fourcc	= V4L2_PIX_FMT_UYVY,
-		.codes  = {
+		.codes  = IMX_BUS_FMTS(
 			MEDIA_BUS_FMT_UYVY8_2X8,
 			MEDIA_BUS_FMT_UYVY8_1X16
-		},
+		),
 		.cs     = IPUV3_COLORSPACE_YUV,
 		.bpp    = 16,
 	}, {
 		.fourcc	= V4L2_PIX_FMT_YUYV,
-		.codes  = {
+		.codes  = IMX_BUS_FMTS(
 			MEDIA_BUS_FMT_YUYV8_2X8,
 			MEDIA_BUS_FMT_YUYV8_1X16
-		},
+		),
 		.cs     = IPUV3_COLORSPACE_YUV,
 		.bpp    = 16,
 	}, {
@@ -57,16 +64,16 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 	/*** RGB formats start here ***/
 	{
 		.fourcc	= V4L2_PIX_FMT_RGB565,
-		.codes  = {MEDIA_BUS_FMT_RGB565_2X8_LE},
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_RGB565_2X8_LE),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.cycles = 2,
 	}, {
 		.fourcc	= V4L2_PIX_FMT_RGB24,
-		.codes  = {
+		.codes  = IMX_BUS_FMTS(
 			MEDIA_BUS_FMT_RGB888_1X24,
 			MEDIA_BUS_FMT_RGB888_2X12_LE
-		},
+		),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 24,
 	}, {
@@ -75,7 +82,7 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 		.bpp    = 24,
 	}, {
 		.fourcc	= V4L2_PIX_FMT_XRGB32,
-		.codes  = {MEDIA_BUS_FMT_ARGB8888_1X32},
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_ARGB8888_1X32),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 32,
 		.ipufmt = true,
@@ -95,91 +102,91 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 	/*** raw bayer and grayscale formats start here ***/
 	{
 		.fourcc = V4L2_PIX_FMT_SBGGR8,
-		.codes  = {MEDIA_BUS_FMT_SBGGR8_1X8},
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SBGGR8_1X8),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 8,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SGBRG8,
-		.codes  = {MEDIA_BUS_FMT_SGBRG8_1X8},
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGBRG8_1X8),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 8,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SGRBG8,
-		.codes  = {MEDIA_BUS_FMT_SGRBG8_1X8},
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGRBG8_1X8),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 8,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SRGGB8,
-		.codes  = {MEDIA_BUS_FMT_SRGGB8_1X8},
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SRGGB8_1X8),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 8,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SBGGR16,
-		.codes  = {
+		.codes  = IMX_BUS_FMTS(
 			MEDIA_BUS_FMT_SBGGR10_1X10,
 			MEDIA_BUS_FMT_SBGGR12_1X12,
 			MEDIA_BUS_FMT_SBGGR14_1X14,
 			MEDIA_BUS_FMT_SBGGR16_1X16
-		},
+		),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SGBRG16,
-		.codes  = {
+		.codes  = IMX_BUS_FMTS(
 			MEDIA_BUS_FMT_SGBRG10_1X10,
 			MEDIA_BUS_FMT_SGBRG12_1X12,
 			MEDIA_BUS_FMT_SGBRG14_1X14,
-			MEDIA_BUS_FMT_SGBRG16_1X16,
-		},
+			MEDIA_BUS_FMT_SGBRG16_1X16
+		),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SGRBG16,
-		.codes  = {
+		.codes  = IMX_BUS_FMTS(
 			MEDIA_BUS_FMT_SGRBG10_1X10,
 			MEDIA_BUS_FMT_SGRBG12_1X12,
 			MEDIA_BUS_FMT_SGRBG14_1X14,
-			MEDIA_BUS_FMT_SGRBG16_1X16,
-		},
+			MEDIA_BUS_FMT_SGRBG16_1X16
+		),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SRGGB16,
-		.codes  = {
+		.codes  = IMX_BUS_FMTS(
 			MEDIA_BUS_FMT_SRGGB10_1X10,
 			MEDIA_BUS_FMT_SRGGB12_1X12,
 			MEDIA_BUS_FMT_SRGGB14_1X14,
-			MEDIA_BUS_FMT_SRGGB16_1X16,
-		},
+			MEDIA_BUS_FMT_SRGGB16_1X16
+		),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_GREY,
-		.codes = {
+		.codes = IMX_BUS_FMTS(
 			MEDIA_BUS_FMT_Y8_1X8,
 			MEDIA_BUS_FMT_Y10_1X10,
-			MEDIA_BUS_FMT_Y12_1X12,
-		},
+			MEDIA_BUS_FMT_Y12_1X12
+		),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 8,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_Y10,
-		.codes = {MEDIA_BUS_FMT_Y10_1X10},
+		.codes = IMX_BUS_FMTS(MEDIA_BUS_FMT_Y10_1X10),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_Y12,
-		.codes = {MEDIA_BUS_FMT_Y12_1X12},
+		.codes = IMX_BUS_FMTS(MEDIA_BUS_FMT_Y12_1X12),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.bayer  = true,
@@ -206,7 +213,7 @@ struct imx_media_pixfmt *find_format(u32 fourcc,
 			   ? CS_SEL_YUV : CS_SEL_RGB;
 
 		if ((cs_sel != CS_SEL_ANY && fmt_cs_sel != cs_sel) ||
-		    (!allow_non_mbus && !fmt->codes[0]) ||
+		    (!allow_non_mbus && !fmt->codes) ||
 		    (!allow_bayer && fmt->bayer))
 			continue;
 
@@ -216,7 +223,7 @@ struct imx_media_pixfmt *find_format(u32 fourcc,
 		if (!code)
 			continue;
 
-		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
+		for (j = 0; fmt->codes[j]; j++) {
 			if (code == fmt->codes[j])
 				return fmt;
 		}
@@ -243,7 +250,7 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 			   ? CS_SEL_YUV : CS_SEL_RGB;
 
 		if ((cs_sel != CS_SEL_ANY && fmt_cs_sel != cs_sel) ||
-		    (!allow_non_mbus && !fmt->codes[0]) ||
+		    (!allow_non_mbus && !fmt->codes) ||
 		    (!allow_bayer && fmt->bayer))
 			continue;
 
@@ -257,7 +264,7 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 			continue;
 		}
 
-		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
+		for (j = 0; fmt->codes[j]; j++) {
 			if (index == 0) {
 				*code = fmt->codes[j];
 				return 0;
@@ -303,13 +310,13 @@ EXPORT_SYMBOL_GPL(imx_media_enum_mbus_format);
 static const struct imx_media_pixfmt ipu_formats[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_YUV32,
-		.codes  = {MEDIA_BUS_FMT_AYUV8_1X32},
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_AYUV8_1X32),
 		.cs     = IPUV3_COLORSPACE_YUV,
 		.bpp    = 32,
 		.ipufmt = true,
 	}, {
 		.fourcc	= V4L2_PIX_FMT_XRGB32,
-		.codes  = {MEDIA_BUS_FMT_ARGB8888_1X32},
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_ARGB8888_1X32),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 32,
 		.ipufmt = true,
@@ -333,6 +340,9 @@ imx_media_find_ipu_format(u32 code, enum codespace_sel cs_sel)
 		    (!accept_rgb && fmt->cs == IPUV3_COLORSPACE_RGB))
 			continue;
 
+		if (!fmt->codes)
+			continue;
+
 		for (j = 0; fmt->codes[j]; j++) {
 			if (code == fmt->codes[j])
 				return fmt;
@@ -356,6 +366,9 @@ int imx_media_enum_ipu_format(u32 *code, u32 index, enum codespace_sel cs_sel)
 		    (!accept_rgb && fmt->cs == IPUV3_COLORSPACE_RGB))
 			continue;
 
+		if (!fmt->codes)
+			continue;
+
 		if (index-- == 0) {
 			*code = fmt->codes[0];
 			return 0;
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index dc6f8fe7c66c..9cedc27a6b4a 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -69,7 +69,7 @@ enum {
 
 struct imx_media_pixfmt {
 	u32     fourcc;
-	u32     codes[4];
+	const u32 *codes;
 	int     bpp;     /* total bpp */
 	/* cycles per pixel for generic (bayer) formats for the parallel bus */
 	int	cycles;
-- 
Regards,

Laurent Pinchart

