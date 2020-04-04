Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F72719E7EE
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2020 00:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbgDDWls (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Apr 2020 18:41:48 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:54259 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbgDDWls (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Apr 2020 18:41:48 -0400
Received: by mail-pj1-f66.google.com with SMTP id l36so4777115pjb.3
        for <linux-media@vger.kernel.org>; Sat, 04 Apr 2020 15:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EcTDLFhvGpvi6g8cUCv+01OFktX8xLdGrm4JHbsNcWY=;
        b=YBqz+f2gsGcI3B2HE/Kpwn9jV/s40rTHCn1QsndGnOzOwr4NJ5Y+9mpwV1ngRrxHYa
         P698uA92gFWvFIb13cIt2EBfiFGFvut9gbUN0+HOFP3TWtLNiBnFP+E+gw93CJ1ixm9j
         TyEM4XTtDRJddxhbVJ3vPDRWLnF9A6sqW7phnwBequM1b+tQe+RXFR3LH5PQvUPCbzyJ
         SphpZkWv1m9vUY8KTb+O+0XV58nmKYScl3MjECXw4xuc2mkDQnFxKepLinziKFvSsmcq
         WAD402gEXuomltycW3L2o/mQt0J2EqDO5uxvnJ9+MEQRmt2/GpFfX+RgeMdmHZ+i6+lw
         zjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EcTDLFhvGpvi6g8cUCv+01OFktX8xLdGrm4JHbsNcWY=;
        b=slgMsTjLAJ97trXqonQzJ1d2+VIuR/Cr+p0803p67cSTLPuZ3P4mTFBfjGsiPIiJFU
         UBaP7wUWAiuiUrK4C7Eh8A+QMkaC4fAyv+uhN0/sS9Wr2hK+TToXhZ0kAMksSAAhNuvn
         4JxZwpqT0l68sUCtkSnKU28jMett3clGypB8e/deSY80yB2tNj4XlRLW/giLgTPXgCnC
         H503oXslnCg5vp1Wva88Nwx+Tr/ROkUKYgY8OrT8mq460xfBxvSXBOPOgM48pbZITBKm
         NtZuBItpHw+/GBT9T/4VyKv9dEoy7T48eaCrv6UKIdFAajPsXo/IC+/DP2MxCXoIBqcW
         rZDg==
X-Gm-Message-State: AGi0PuZDppmjBECpDqUfzrD8qOcxoyjecDqpHj1EQd1kCD5Flw7uNz6U
        GcaE2OqAfttJCsXLsXJpGg/Ig4qdqwM=
X-Google-Smtp-Source: APiQypIZ4AlkZux17oJrc3OO0Z0wusDGm3aflACFcrcCBcfnFVscfPiv+DWiJ9THE4npQxztaCrRRg==
X-Received: by 2002:a17:90a:f0c6:: with SMTP id fa6mr17925897pjb.5.1586040106260;
        Sat, 04 Apr 2020 15:41:46 -0700 (PDT)
Received: from mappy.world.mentorg.com (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id o11sm8690989pjb.18.2020.04.04.15.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 15:41:45 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 06/11] media: imx: utils: Introduce PIXFMT_SEL_IPU
Date:   Sat,  4 Apr 2020 15:41:25 -0700
Message-Id: <20200404224130.23118-7-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404224130.23118-1-slongerbeam@gmail.com>
References: <20200404224130.23118-1-slongerbeam@gmail.com>
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
---
 drivers/staging/media/imx/imx-media-utils.c | 118 +++++---------------
 drivers/staging/media/imx/imx-media.h       |   1 +
 2 files changed, 27 insertions(+), 92 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index beaa920d7ac7..873fdcee7d37 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -53,7 +53,13 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 		.cs     = IPUV3_COLORSPACE_YUV,
 		.bpp    = 16,
 		.planar = true,
-	},
+	}, {
+		.fourcc = V4L2_PIX_FMT_YUV32,
+		.codes  = {MEDIA_BUS_FMT_AYUV8_1X32},
+		.cs     = IPUV3_COLORSPACE_YUV,
+		.bpp    = 32,
+		.ipufmt = true,
+        },
 	/*** RGB formats start here ***/
 	{
 		.fourcc	= V4L2_PIX_FMT_RGB565,
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

