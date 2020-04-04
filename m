Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF4919E7EF
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2020 00:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbgDDWlu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Apr 2020 18:41:50 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:54386 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbgDDWlu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Apr 2020 18:41:50 -0400
Received: by mail-pj1-f68.google.com with SMTP id np9so4774318pjb.4
        for <linux-media@vger.kernel.org>; Sat, 04 Apr 2020 15:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+gRbj1EwQ2AuAigFe2j8F+9sCnMZ/tJQWs+Wu7BH92E=;
        b=iPTOMHwROIXuqqLxyHOoHqlvU/UspVXo+qWOtpNH8QO4bSAJ2cZf+rTWbG3ucT9yO0
         ucz2n16JhOxYkD5g7A+L2Qifl3v1Oxk1GrlD/CHYrf1eeC69w7P8kmajAC2liwQPe25c
         ALxikCP4OSpo8QOMMFPObmDUg9js1wWQoz/rz8z6jNohP3sTlPDlirjRoq1LlX9D/MR2
         hAufhf1rERsSSjMFYqNSzo82gcoBWUowM12OD/SBLu9nkNc3YEGd8kMPnicDrG7LZ/aa
         ySVKp3fIMvbEdG04rgy2zT6rFSs8xKZ1iuXnO4bdpoSlg+D3XCNiNvR+WmuJ8f6AjZ7g
         HNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+gRbj1EwQ2AuAigFe2j8F+9sCnMZ/tJQWs+Wu7BH92E=;
        b=asdZm2P/QPTffz1+zxRQkYJdaDqr4wkJp9t3WDKLxvk5wfWDXuZIh5u9X+zO9ICCNF
         K3JurMVjEIEfbfueYh3li40Ll67R3uDMaxhLsTH6ZDF+KSqAZAOq5lt5SUfTki3xXFiI
         R4F6bWrEXTNCIEUjsMTF3POXaziVWC5us6Se0EOZdp6el7FcP3x24Uy+lyacSs8/9oeN
         Wsn1sDG8PwDZirpl3KaBLFaJtsOSE1kuBs97dUJPha+v49qwo60gE4IGbnzaGubEiLdc
         FtOzqlRJqgOvj4tiLP4Z3sjgPykbEBnDdJX5rEjRBIdW2dnf2qNYx/atYIJrxufrI3Om
         Inqg==
X-Gm-Message-State: AGi0PuYjdL7b4HHJcxXyQHP9Z+IHqQnU9y3JiixRHwhuv9hFoBT46aC/
        AzYUrTwUQfbCRLS24WT1vndEFvwMQPU=
X-Google-Smtp-Source: APiQypJlaGI8k6R/+R+N/K2kTqfU6hD9Q6NqP7aJur6EvV751hv+tMZe/MuhPeJY1XfsgMk9J2lzXA==
X-Received: by 2002:a17:90a:3783:: with SMTP id v3mr18547225pjb.31.1586040107529;
        Sat, 04 Apr 2020 15:41:47 -0700 (PDT)
Received: from mappy.world.mentorg.com (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id o11sm8690989pjb.18.2020.04.04.15.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 15:41:46 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 07/11] media: imx: utils: Make imx_media_pixfmt handle variable number of codes
Date:   Sat,  4 Apr 2020 15:41:26 -0700
Message-Id: <20200404224130.23118-8-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404224130.23118-1-slongerbeam@gmail.com>
References: <20200404224130.23118-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The imx_media_pixfmt structures include a codes member that stores
media bus codes as a fixed array of 4 integers. The functions dealing
with the imx_media_pixfmt structures assume that the array of codes is
terminated by a 0 element. This mechanism is fragile, as demonstrated
by several instances of the structure containing 4 non-zero codes.

Fix this by turning the array into a pointer, and providing an
IMX_BUS_FMTS macro to initialize the codes member with a guaranteed 0
element at the end.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[Fixed a NULL deref of the codes pointer in a couple places]
[Added more comments for the struct imx_media_pixfmt members,
 includung a bold NOTE! for future developers that codes pointer
 is NULL for the in-memory-only formats]

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-capture.c |  4 +-
 drivers/staging/media/imx/imx-media-utils.c   | 74 ++++++++++---------
 drivers/staging/media/imx/imx-media.h         |  7 +-
 3 files changed, 46 insertions(+), 39 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index ac48cbe35323..32d5b05097a9 100644
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
index 873fdcee7d37..bd8ebbf0b26d 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -7,6 +7,8 @@
 #include <linux/module.h>
 #include "imx-media.h"
 
+#define IMX_BUS_FMTS(fmt...) (const u32[]) {fmt, 0}
+
 /*
  * List of supported pixel formats for the subdevs.
  */
@@ -14,18 +16,18 @@ static const struct imx_media_pixfmt pixel_formats[] = {
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
@@ -55,7 +57,7 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 		.planar = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_YUV32,
-		.codes  = {MEDIA_BUS_FMT_AYUV8_1X32},
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_AYUV8_1X32),
 		.cs     = IPUV3_COLORSPACE_YUV,
 		.bpp    = 32,
 		.ipufmt = true,
@@ -63,16 +65,16 @@ static const struct imx_media_pixfmt pixel_formats[] = {
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
@@ -81,12 +83,12 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 		.bpp    = 24,
 	}, {
 		.fourcc	= V4L2_PIX_FMT_XRGB32,
-		.codes  = {MEDIA_BUS_FMT_ARGB8888_1X32},
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_ARGB8888_1X32),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 32,
 	}, {
 		.fourcc	= V4L2_PIX_FMT_XRGB32,
-		.codes  = {MEDIA_BUS_FMT_ARGB8888_1X32},
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_ARGB8888_1X32),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 32,
 		.ipufmt = true,
@@ -106,91 +108,91 @@ static const struct imx_media_pixfmt pixel_formats[] = {
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
@@ -220,16 +222,16 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
 			 PIXFMT_SEL_YUV : PIXFMT_SEL_RGB);
 
 		if (!(fmt_sel & sel) ||
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
@@ -260,7 +262,7 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 			 PIXFMT_SEL_YUV : PIXFMT_SEL_RGB);
 
 		if (!(fmt_sel & sel) ||
-		    (!allow_non_mbus && !fmt->codes[0]))
+		    (!allow_non_mbus && !fmt->codes))
 			continue;
 
 		if (fourcc && index == 0) {
@@ -273,7 +275,7 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 			continue;
 		}
 
-		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
+		for (j = 0; fmt->codes[j]; j++) {
 			if (index == 0) {
 				*code = fmt->codes[j];
 				return 0;
@@ -529,7 +531,7 @@ int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 	const struct imx_media_pixfmt *fmt;
 
 	fmt = imx_media_find_format(image->pix.pixelformat, PIXFMT_SEL_ANY);
-	if (!fmt)
+	if (!fmt || !fmt->codes || !fmt->codes[0])
 		return -EINVAL;
 
 	memset(mbus, 0, sizeof(*mbus));
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index c61592750729..459ec15bcdaf 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -68,8 +68,13 @@ enum {
 #define IMX_MEDIA_EOF_TIMEOUT       1000
 
 struct imx_media_pixfmt {
+	/* the in-memory FourCC pixel format */
 	u32     fourcc;
-	u32     codes[4];
+	/*
+	 * the set of equivalent media bus codes for the fourcc.
+	 * NOTE! codes pointer is NULL for in-memory-only formats.
+	 */
+	const u32 *codes;
 	int     bpp;     /* total bpp */
 	/* cycles per pixel for generic (bayer) formats for the parallel bus */
 	int	cycles;
-- 
2.17.1

