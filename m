Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42155194704
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 20:06:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728546AbgCZTF7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 15:05:59 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34605 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727770AbgCZTF6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 15:05:58 -0400
Received: by mail-pf1-f196.google.com with SMTP id 23so3280532pfj.1
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 12:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YAfdVyQGDkm6VWMLTayn65guJF0genzcf3gb/T5u/w4=;
        b=ElGOqKwTsbqdsz8tYWtpmYT/TVny5bA3xiWswtMTolKj6G+DvpYU3tJXfdM8h7AwKw
         ThuGeQfcEkhGxCIK/0cIJsSmDl2fd3gBV6I3RArE/dv79w9bxk8i03dN4lqDCnFEJIAV
         7bO9KGYXABfn3J6AZbd4gBdesIDZ5SSgDkp73jOQUrJX504w5JftEUU4ABSPnqLb5SaP
         1TWrJIV2a/FjcCa5cEPoIWJcg6tyAr20BnNq3gMJIqMaJuFigHPkADUertj/hhwP5cv8
         xtk+E1iPNcSdWv4ha2dls9FvUzFAktGzGaqhbdoo7K+9F6dJE+q3+vhpQY7vBBa2FjA/
         OpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YAfdVyQGDkm6VWMLTayn65guJF0genzcf3gb/T5u/w4=;
        b=poBJljuVO+tUeYjCaPslH97Lj6swrHFxs1cymei8mwi857t+3gf9MIB9b9dPuklMAz
         SgOl8AoNnbCUWcW9ZGU84aRlBkREoclOW6RifQjjSlbAHfnzRZTdGovPeOgLZUTEM5J/
         kAVfLi3rxbhgA9GUknB/QCkLpwNc0vB3H71t77YFXNUuFckL67M6tV/jciSqr/4o+gAl
         c8tNfpSnK7C+7ZudD/VLa4fmeWS+9SGEFBivwQBkF8ZrZgGoNYqGMznfSE9lU3WEXJmt
         tD+oRoduCZF3yLtJAdM9xNCBGCiHAb2mYbdF+VDti0Sa/V1ytwBhM2raWwFClBIBUIMw
         g2EQ==
X-Gm-Message-State: ANhLgQ0HYHzu5qz1SV00cM/XP/yVh9tOapyhL+z4sjMCpgfW3byZw6z0
        2fwTnIUPeYWBSM2q+w/oUJbZ+Ln9V7E=
X-Google-Smtp-Source: ADFU+vsAXFKZULbPZaZ5pSIGGMLRpV2s6z9Iv5caTiYT/Sm9G1iSJLB/RYXY3PrcfZbXWGTbyGUjZQ==
X-Received: by 2002:a63:2360:: with SMTP id u32mr10234253pgm.190.1585249555873;
        Thu, 26 Mar 2020 12:05:55 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q103sm7414623pjc.1.2020.03.26.12.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 12:05:55 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 06/10] media: imx: utils: Make imx_media_pixfmt handle variable number of codes
Date:   Thu, 26 Mar 2020 12:05:40 -0700
Message-Id: <20200326190544.16349-7-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326190544.16349-1-slongerbeam@gmail.com>
References: <20200326190544.16349-1-slongerbeam@gmail.com>
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
---
 drivers/staging/media/imx/imx-media-utils.c | 88 ++++++++++++---------
 drivers/staging/media/imx/imx-media.h       |  2 +-
 2 files changed, 51 insertions(+), 39 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index d27787012ff3..febcf3203cb1 100644
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
@@ -236,7 +242,7 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 			 CS_SEL_YUV : CS_SEL_RGB);
 
 		if (!(fmt_cs_sel & cs_sel) ||
-		    (!allow_non_mbus && !fmt->codes[0]))
+		    (!allow_non_mbus && !fmt->codes))
 			continue;
 
 		if (fourcc && index == match_index)
@@ -247,7 +253,7 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 			continue;
 		}
 
-		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
+		for (j = 0; j < fmt->codes[j]; j++) {
 			if (index == match_index)
 				goto out;
 
@@ -261,7 +267,7 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 	if (fourcc)
 		*fourcc = fmt->fourcc;
 	if (code)
-		*code = fmt->codes[j];
+		*code = fmt->codes ? fmt->codes[j] : 0;
 
 	return 0;
 }
@@ -299,13 +305,13 @@ EXPORT_SYMBOL_GPL(imx_media_enum_mbus_format);
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
@@ -329,7 +335,10 @@ imx_media_find_ipu_format(u32 code, enum codespace_sel cs_sel)
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
@@ -352,7 +361,10 @@ int imx_media_enum_ipu_format(u32 *code, u32 index, enum codespace_sel cs_sel)
 		    (!accept_rgb && fmt->cs == IPUV3_COLORSPACE_RGB))
 			continue;
 
-		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
+		if (!fmt->codes)
+			continue;
+
+		for (j = 0; j < fmt->codes[j]; j++) {
 			if (index == match_index) {
 				*code = fmt->codes[j];
 				return 0;
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

