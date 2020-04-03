Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7D1319DFF5
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 22:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728525AbgDCU67 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 16:58:59 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:36032 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728469AbgDCU67 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 16:58:59 -0400
Received: by mail-pj1-f65.google.com with SMTP id nu11so3521330pjb.1
        for <linux-media@vger.kernel.org>; Fri, 03 Apr 2020 13:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=G7hamsD7QHbpm2j5LilfxDpsn908nyRYJojn5MUxvok=;
        b=c3kdN0eTp3kiXowsV0IeNSDOylscJWdNfG4Dx451qyM2aJzJXCCG0bpUIn3HbhQoeC
         Tdio2V1Bm0z4n+17ddlq2RWT1yxvTIhmp8RmaxaAvd5Rowk2ZLl8C2l4+5s98xImWSHw
         vpfe8SFNtSObJz/CUhDz1CID6Slu/DFEfREl+4/CoeKY7aL0GK7asaGpOGXXCYtTPzUM
         0Ti5/OIrNp6blKC+9yfCsPbIe2oih/AqPxHj9rQZlIFP/ipL+cqRHx9UqysscYirWL5M
         9BWO3ke3oQO1hrBULedaKDOxTieYpW8qQb+LI4M+nYVVjyCpqYkJNn6oHOokOY4cuhTY
         stCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=G7hamsD7QHbpm2j5LilfxDpsn908nyRYJojn5MUxvok=;
        b=mDPyn4PCc/zmRsDa9AIUIYspmKs/p5jv2m2xh715ZhQFAldI8VUQL51ulscRZYFzhT
         ENL9g6GvvqP8JAXEuAo3MQhv/sb2euy4RVSC5SnPKdpjkzL2dBOv+6h0jAM154NIfgTY
         JRYt3YL7CYx3LZPnVuX1I/UD0EOIZMj0hAIRlcsPbf5T9NUAhMiewU02N14eZySCue2Y
         w0vUeEB1ZiNatQHKuyyHdZYrnSu7jrAcaeFFyOcluW96WPvJei8UeVYzzTMd/gQ+CKlA
         iIS1xy5hdXQBF1JJ9qXWXcV6Iuy3YZ7wjjnc1Zhk9bffzVhB8i1AeU4j2yeJ0XOqbJxa
         GXwA==
X-Gm-Message-State: AGi0PuYIBBUphiQ4y3APUGolOmO8f/9QaHwPna8bpSfyXrKph7MyGm8t
        pAex0y0ywnJbx6zPdsDDXKS/wBXZAfk=
X-Google-Smtp-Source: APiQypLfRg9jUUWwZRQ4GNpuBpJV9STMa2oRkCaDIXAuJeaPn8Ohx1bkLaL/+3T5DieGmev9Vlyy1Q==
X-Received: by 2002:a17:90b:1b01:: with SMTP id nu1mr11780720pjb.129.1585947535270;
        Fri, 03 Apr 2020 13:58:55 -0700 (PDT)
Received: from mappy.world.mentorg.com (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id s39sm6521266pjb.10.2020.04.03.13.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 13:58:54 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 07/12] media: imx: utils: Make imx_media_pixfmt handle variable number of codes
Date:   Fri,  3 Apr 2020 13:58:34 -0700
Message-Id: <20200403205839.4531-8-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200403205839.4531-1-slongerbeam@gmail.com>
References: <20200403205839.4531-1-slongerbeam@gmail.com>
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
index 00a10bbd9a2d..95913ab6d5b6 100644
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

