Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 459F719FA42
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 18:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729500AbgDFQjY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 12:39:24 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:32797 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729228AbgDFQjY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 12:39:24 -0400
Received: by mail-pj1-f67.google.com with SMTP id cp9so175916pjb.0
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 09:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ShDp8PiN5zjn18n2gclioeDT1o6FNrS36KwPfFz0rWo=;
        b=jzSOGBtlSwD9HsgPnlUGBiSpW5SS6Od01VNb67Y90HhczzelrJfuo8kj5O4hdNXFCs
         IE37ydHcsSASfyKLC/ELMblSzxVccDkafQ1DzAxp1DrVZ+PFuZyMwztTMuN8XgYjUHkQ
         YCBWXiun/k/Kmk2B8ZgSz1Tqjmm8EfYvDSDb3ZMxjq5tUDO43k1o3T3WUoDwvv8KXXro
         ShK9tMQXuhuJz62etR/aS9vec4eC4Iw9DwMQd6rTIwmY9itsXyfmzkVMVmpbaESILD1L
         KH3dL4YwZ97kNT40S7SMVT7tV6BjoXW0l0UJvp/Fykol8J147ch3rsHhD9Lfpw8bAjZp
         VUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ShDp8PiN5zjn18n2gclioeDT1o6FNrS36KwPfFz0rWo=;
        b=rCKjDS8ZeWyb3ipDS6wnrNzOG4mn7Nza2R7mP+D+3ezqLoIuDSFl56Ig6lESJeiuF0
         /3/Xx/mzbcbwl4WKe15FkRr4J7SheRYi7CRd1tEF+qz62hB/L1y0OhYSbnxbWTEKDLWa
         VM0gTaHaVUwoz/2M9RSleFanpoyAlL/3g9Q6UvxwWlG3F3/dlhhYZ0+XaHFQX2GqEPHh
         HDJCYjqDJZEdg2SFM5I7M9CovLE4aEKw9QNZf3tQeKpnJVyYR/rvWzOU4KQoHSZTpvX8
         PQb4mR9Rg2AvKa0hDQLri96plspNI1NrD/fenwyIFQCchEVHbglkJ5nJ2RXRFqH9gH77
         62tQ==
X-Gm-Message-State: AGi0PuaeNHUOattdUi9/GoYp9xl4T8hDu4AnYVZX9zTsGoCfIZk1ql1m
        PbKLl6m5/RZAlYCdvV7lYpOZPM0unmw=
X-Google-Smtp-Source: APiQypI4FTQb9Zg3DfjMwPnzm29L6wdhNxWGlBO+pRcvkVK8B5vkpHzvc5iJ9GMYDoUZJLkDZuo8pw==
X-Received: by 2002:a17:90b:3606:: with SMTP id ml6mr177974pjb.172.1586191162107;
        Mon, 06 Apr 2020 09:39:22 -0700 (PDT)
Received: from mappy.world.mentorg.com (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id w29sm11165131pge.25.2020.04.06.09.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 09:39:21 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v7 07/11] media: imx: utils: Introduce PIXFMT_SEL_IPU
Date:   Mon,  6 Apr 2020 09:39:01 -0700
Message-Id: <20200406163905.24475-8-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200406163905.24475-1-slongerbeam@gmail.com>
References: <20200406163905.24475-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a PIXFMT_SEL_IPU selection flag, to select only the IPU-internal
pixel formats, and move the single-entry IPU-internal pixel format
arrays into pixel_formats[]. imx_media_find_ipu_format() and
imx_media_enum_ipu_format() can now simply call find_format() and
enum_format().

The RGB32 format is both an IPU-internal format, and an in-memory format
via idmac channels that is supported by the IPUv3 driver, so it appears
twice in pixel_formats[], one with ipufmt=false for the in-memory format,
and again with ipufmt=true for the IPU-internal format.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 116 +++++---------------
 drivers/staging/media/imx/imx-media.h       |   1 +
 2 files changed, 26 insertions(+), 91 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 32acece14a6f..7566e0ae5e81 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -53,6 +53,12 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 		.cs     = IPUV3_COLORSPACE_YUV,
 		.bpp    = 16,
 		.planar = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YUV32,
+		.codes  = {MEDIA_BUS_FMT_AYUV8_1X32},
+		.cs     = IPUV3_COLORSPACE_YUV,
+		.bpp    = 32,
+		.ipufmt = true,
 	},
 	/*** RGB formats start here ***/
 	{
@@ -73,6 +79,11 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 		.fourcc	= V4L2_PIX_FMT_BGR24,
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 24,
+	}, {
+		.fourcc	= V4L2_PIX_FMT_XRGB32,
+		.codes  = {MEDIA_BUS_FMT_ARGB8888_1X32},
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 32,
 	}, {
 		.fourcc	= V4L2_PIX_FMT_XRGB32,
 		.codes  = {MEDIA_BUS_FMT_ARGB8888_1X32},
@@ -186,42 +197,24 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 	},
 };
 
-static const struct imx_media_pixfmt ipu_yuv_formats[] = {
-	{
-		.fourcc = V4L2_PIX_FMT_YUV32,
-		.codes  = {MEDIA_BUS_FMT_AYUV8_1X32},
-		.cs     = IPUV3_COLORSPACE_YUV,
-		.bpp    = 32,
-		.ipufmt = true,
-	},
-};
-
-#define NUM_IPU_YUV_FORMATS ARRAY_SIZE(ipu_yuv_formats)
-
-static const struct imx_media_pixfmt ipu_rgb_formats[] = {
-	{
-		.fourcc	= V4L2_PIX_FMT_XRGB32,
-		.codes  = {MEDIA_BUS_FMT_ARGB8888_1X32},
-		.cs     = IPUV3_COLORSPACE_RGB,
-		.bpp    = 32,
-		.ipufmt = true,
-	},
-};
-
-#define NUM_IPU_RGB_FORMATS ARRAY_SIZE(ipu_rgb_formats)
-
 static const struct imx_media_pixfmt *find_format(u32 fourcc,
 						  u32 code,
 						  enum imx_pixfmt_sel fmt_sel,
 						  bool allow_non_mbus)
 {
+	bool sel_ipu = fmt_sel & PIXFMT_SEL_IPU;
 	unsigned int i;
 
+	fmt_sel &= ~PIXFMT_SEL_IPU;
+
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
 		enum imx_pixfmt_sel sel;
 		unsigned int j;
 
+		if (sel_ipu != fmt->ipufmt)
+			continue;
+
 		sel = fmt->bayer ? PIXFMT_SEL_BAYER :
 			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
 			 PIXFMT_SEL_YUV : PIXFMT_SEL_RGB);
@@ -249,13 +242,19 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 		       enum imx_pixfmt_sel fmt_sel,
 		       bool allow_non_mbus)
 {
+	bool sel_ipu = fmt_sel & PIXFMT_SEL_IPU;
 	unsigned int i;
 
+	fmt_sel &= ~PIXFMT_SEL_IPU;
+
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
 		enum imx_pixfmt_sel sel;
 		unsigned int j;
 
+		if (sel_ipu != fmt->ipufmt)
+			continue;
+
 		sel = fmt->bayer ? PIXFMT_SEL_BAYER :
 			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
 			 PIXFMT_SEL_YUV : PIXFMT_SEL_RGB);
@@ -317,79 +316,14 @@ EXPORT_SYMBOL_GPL(imx_media_enum_mbus_format);
 const struct imx_media_pixfmt *
 imx_media_find_ipu_format(u32 code, enum imx_pixfmt_sel fmt_sel)
 {
-	const struct imx_media_pixfmt *array, *fmt, *ret = NULL;
-	u32 array_size;
-	int i, j;
-
-	fmt_sel &= ~PIXFMT_SEL_BAYER;
-
-	switch (fmt_sel) {
-	case PIXFMT_SEL_YUV:
-		array_size = NUM_IPU_YUV_FORMATS;
-		array = ipu_yuv_formats;
-		break;
-	case PIXFMT_SEL_RGB:
-		array_size = NUM_IPU_RGB_FORMATS;
-		array = ipu_rgb_formats;
-		break;
-	case PIXFMT_SEL_YUV_RGB:
-		array_size = NUM_IPU_YUV_FORMATS + NUM_IPU_RGB_FORMATS;
-		array = ipu_yuv_formats;
-		break;
-	default:
-		return NULL;
-	}
-
-	for (i = 0; i < array_size; i++) {
-		if (fmt_sel == PIXFMT_SEL_YUV_RGB && i >= NUM_IPU_YUV_FORMATS)
-			fmt = &ipu_rgb_formats[i - NUM_IPU_YUV_FORMATS];
-		else
-			fmt = &array[i];
-
-		for (j = 0; code && fmt->codes[j]; j++) {
-			if (code == fmt->codes[j]) {
-				ret = fmt;
-				goto out;
-			}
-		}
-	}
-
-out:
-	return ret;
+	return find_format(0, code, fmt_sel | PIXFMT_SEL_IPU, false);
 }
 EXPORT_SYMBOL_GPL(imx_media_find_ipu_format);
 
 int imx_media_enum_ipu_format(u32 *code, u32 index,
 			      enum imx_pixfmt_sel fmt_sel)
 {
-	fmt_sel &= ~PIXFMT_SEL_BAYER;
-
-	switch (fmt_sel) {
-	case PIXFMT_SEL_YUV:
-		if (index >= NUM_IPU_YUV_FORMATS)
-			return -EINVAL;
-		*code = ipu_yuv_formats[index].codes[0];
-		break;
-	case PIXFMT_SEL_RGB:
-		if (index >= NUM_IPU_RGB_FORMATS)
-			return -EINVAL;
-		*code = ipu_rgb_formats[index].codes[0];
-		break;
-	case PIXFMT_SEL_YUV_RGB:
-		if (index >= NUM_IPU_YUV_FORMATS + NUM_IPU_RGB_FORMATS)
-			return -EINVAL;
-		if (index >= NUM_IPU_YUV_FORMATS) {
-			index -= NUM_IPU_YUV_FORMATS;
-			*code = ipu_rgb_formats[index].codes[0];
-		} else {
-			*code = ipu_yuv_formats[index].codes[0];
-		}
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
+	return enum_format(NULL, code, index, fmt_sel | PIXFMT_SEL_IPU, false);
 }
 EXPORT_SYMBOL_GPL(imx_media_enum_ipu_format);
 
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index ac7c521d8148..c61592750729 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -83,6 +83,7 @@ enum imx_pixfmt_sel {
 	PIXFMT_SEL_YUV   = BIT(0), /* select YUV formats */
 	PIXFMT_SEL_RGB   = BIT(1), /* select RGB formats */
 	PIXFMT_SEL_BAYER = BIT(2), /* select BAYER formats */
+	PIXFMT_SEL_IPU   = BIT(3), /* select IPU-internal formats */
 	PIXFMT_SEL_YUV_RGB = PIXFMT_SEL_YUV | PIXFMT_SEL_RGB,
 	PIXFMT_SEL_ANY = PIXFMT_SEL_YUV | PIXFMT_SEL_RGB | PIXFMT_SEL_BAYER,
 };
-- 
2.17.1

