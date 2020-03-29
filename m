Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A563196EFC
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2020 19:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbgC2Rk0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Mar 2020 13:40:26 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44439 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728475AbgC2Rk0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Mar 2020 13:40:26 -0400
Received: by mail-pl1-f194.google.com with SMTP id h11so5747623plr.11
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2020 10:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Fc9nkBNmlN69aB6PR1/+KtZgdwvUBHefZvCKSC9LrUM=;
        b=i+956pAEJgu91BtExVVBYBXsIiX1ISVAVsNN7BanZy8ExSzaCzFZxMOI1iDLFYKgGO
         lDI15IZLC6CgH0ckrb/7xM9s1dslA6RUQd1xOciXLb1wY9E2D3/19fuMMCWD1su2+GQu
         hASVX2qdUsPZuKsMqivdmTobAAVOclJ5nMJOdBCXt6uDGyGAgpRf1XOuefMVQvS8x00u
         szNLYmynTPKwNLqYKYuRp2GwTFK8Rvuh/MZgRI0/SYjlKFI1zTO8OTFTT1ahGSOzASP7
         Qk+ye9HCav+5nHrz7ujbzNksRF5O1A5tmCKF9ZxqEF2avJmMiMU6hgTIs2SbyzeO19yO
         +AFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Fc9nkBNmlN69aB6PR1/+KtZgdwvUBHefZvCKSC9LrUM=;
        b=TxXxRSkcJ8vTyzZSkL80RuAzlMh6rqByWDc5ldii+v5x298WC2bTofcy9n6nj+DPwi
         tG+6umcuSAtXJ3vGOvLJmAbifS6AJ0idJIf4DkYIEP1KA2x2J3YZ5y/u0RjcHlVMyEKH
         2rybX8okbinD3vI2tSHVUeI4MWI8b4MvUMOXvegU/8mq7B4GQC+TexGCsYpUeRzSKoUY
         t6yWFNR3CfIbWNcS6Ir9lcFuTDbcMvHOjZKnh3wOaLaHG7+LPA98nGhVUk8+xzAnwCCR
         Tm2CPik8eCj9/bRP/9XnbUvvgdlI+oJA4/58HMVyxOLUnbgpV2wzg26EJfllI2ni4BsR
         yNIw==
X-Gm-Message-State: ANhLgQ3HY4Qyk+OWqu6w8lGJr78y3zno8qIOIorqs67+rtp39uX2guHi
        it783Y2mEyIkhubneYyw06E+3nWZHqc=
X-Google-Smtp-Source: ADFU+vvZ0tRMPalC2J8ArZPleBdip4apEr92xVoiWrtk/pzN1tDHyoGMf3D8NLsZldSGQjrvKjI55w==
X-Received: by 2002:a17:90a:ca09:: with SMTP id x9mr11379393pjt.91.1585503624143;
        Sun, 29 Mar 2020 10:40:24 -0700 (PDT)
Received: from mappy.nv.charter.com ([2600:6c4e:200:e053:a0c5:5fbc:c28e:f91f])
        by smtp.gmail.com with ESMTPSA id b133sm7031253pfb.180.2020.03.29.10.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 10:40:23 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v3 06/10] media: imx: utils: Make imx_media_pixfmt handle variable number of codes
Date:   Sun, 29 Mar 2020 10:40:06 -0700
Message-Id: <20200329174010.12304-7-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200329174010.12304-1-slongerbeam@gmail.com>
References: <20200329174010.12304-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The imx_media_pixfmt structures includes a codes member that stores
media bus codes as a fixed array of 4 integers. The functions dealing
with the imx_media_pixfmt structures assume that the array of codes is
terminated by a 0 elements. This mechanism is fragile, as demonstrated
by several instances of the structure contained 4 non-zero codes.

Fix this by turning the array into a pointer, and providing an
IMX_BUS_FMTS macro to initialize the codes member with a guaranteed 0
element at the end.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[Fix a NULL deref when derefencing a NULL cc->codes on return from
 several calls to imx_media_find_format()]
Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-capture.c |  4 +-
 drivers/staging/media/imx/imx-media-utils.c   | 89 +++++++++++--------
 drivers/staging/media/imx/imx-media.h         |  2 +-
 3 files changed, 54 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index d60b49ec4fa4..650c53289f6b 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -95,7 +95,7 @@ static int capture_enum_framesizes(struct file *file, void *fh,
 	if (!cc)
 		return -EINVAL;
 
-	fse.code = cc->codes[0];
+	fse.code = cc->codes ? cc->codes[0] : 0;
 
 	ret = v4l2_subdev_call(priv->src_sd, pad, enum_frame_size, NULL, &fse);
 	if (ret)
@@ -137,7 +137,7 @@ static int capture_enum_frameintervals(struct file *file, void *fh,
 	if (!cc)
 		return -EINVAL;
 
-	fie.code = cc->codes[0];
+	fie.code = cc->codes ? cc->codes[0] : 0;
 
 	ret = v4l2_subdev_call(priv->src_sd, pad, enum_frame_interval,
 			       NULL, &fie);
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 981a8b540a3c..ff4f85be6d65 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -7,6 +7,12 @@
 #include <linux/module.h>
 #include "imx-media.h"
 
+#define IMX_BUS_FMTS(fmts...)	\
+	(const u32[]) {		\
+		fmts,		\
+		0		\
+	}
+
 /*
  * List of supported pixel formats for the subdevs.
  */
@@ -14,18 +20,18 @@ static const struct imx_media_pixfmt pixel_formats[] = {
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
@@ -57,16 +63,16 @@ static const struct imx_media_pixfmt pixel_formats[] = {
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
@@ -75,7 +81,7 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 		.bpp    = 24,
 	}, {
 		.fourcc	= V4L2_PIX_FMT_XRGB32,
-		.codes  = {MEDIA_BUS_FMT_ARGB8888_1X32},
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_ARGB8888_1X32),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 32,
 		.ipufmt = true,
@@ -95,91 +101,91 @@ static const struct imx_media_pixfmt pixel_formats[] = {
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
@@ -203,16 +209,16 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
 			 CS_SEL_YUV : CS_SEL_RGB);
 
 		if (!(fmt_cs_sel & cs_sel) ||
-		    (!allow_non_mbus && !fmt->codes[0]))
+		    (!allow_non_mbus && !fmt->codes))
 			continue;
 
 		if (fourcc && fmt->fourcc == fourcc)
 			return fmt;
 
-		if (!code)
+		if (!code || !fmt->codes)
 			continue;
 
-		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
+		for (j = 0; fmt->codes[j]; j++) {
 			if (code == fmt->codes[j])
 				return fmt;
 		}
@@ -237,7 +243,7 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 			 CS_SEL_YUV : CS_SEL_RGB);
 
 		if (!(fmt_cs_sel & cs_sel) ||
-		    (!allow_non_mbus && !fmt->codes[0]))
+		    (!allow_non_mbus && !fmt->codes))
 			continue;
 
 		if (fourcc && index == 0) {
@@ -250,7 +256,7 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 			continue;
 		}
 
-		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
+		for (j = 0; fmt->codes[j]; j++) {
 			if (index == 0) {
 				*code = fmt->codes[j];
 				return 0;
@@ -296,13 +302,13 @@ EXPORT_SYMBOL_GPL(imx_media_enum_mbus_format);
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
@@ -327,7 +333,10 @@ imx_media_find_ipu_format(u32 code, enum codespace_sel cs_sel)
 		    (!accept_rgb && fmt->cs == IPUV3_COLORSPACE_RGB))
 			continue;
 
-		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
+		if (!fmt->codes)
+			continue;
+
+		for (j = 0; fmt->codes[j]; j++) {
 			if (code == fmt->codes[j])
 				return fmt;
 		}
@@ -351,7 +360,10 @@ int imx_media_enum_ipu_format(u32 *code, u32 index, enum codespace_sel cs_sel)
 		    (!accept_rgb && fmt->cs == IPUV3_COLORSPACE_RGB))
 			continue;
 
-		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
+		if (!fmt->codes)
+			continue;
+
+		for (j = 0; fmt->codes[j]; j++) {
 			if (index == 0) {
 				*code = fmt->codes[j];
 				return 0;
@@ -573,7 +585,8 @@ int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 	memset(mbus, 0, sizeof(*mbus));
 	mbus->width = image->pix.width;
 	mbus->height = image->pix.height;
-	mbus->code = fmt->codes[0];
+	if (fmt->codes)
+		mbus->code = fmt->codes[0];
 	mbus->field = image->pix.field;
 	mbus->colorspace = image->pix.colorspace;
 	mbus->xfer_func = image->pix.xfer_func;
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 652673a703cd..917b4db02985 100644
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
2.17.1

