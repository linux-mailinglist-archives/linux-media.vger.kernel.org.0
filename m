Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36F40194702
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 20:06:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728524AbgCZTF6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 15:05:58 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46300 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728405AbgCZTF5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 15:05:57 -0400
Received: by mail-pg1-f193.google.com with SMTP id k191so3361787pgc.13
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 12:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PYb7LeVvOeL2a6oZQDOdPyF6X+hLJ7m1n6ZrjzCa1kg=;
        b=QUtE79rtONvO/YU0AAIhDWrTWTIkd2Fgu1RrCkOVhsQ0uOtElmNc+8t95IMShtiPMx
         YkIbln5880fXu0p6cUN6Pga1ogt5dSQfxJP39qFlpJwbpEWMHdRwOvLKTQeTWVH3P3Is
         RrVB4SdffkfB28ad296peGe4RUoGR9lo0A484VIkvj4yaS845ECP0NXQwsDA9gASCWGX
         Zz4xodshT3GPUrfbd5X1oeXg7ESTD0v70a5XJVEQnPQlkqbBYYtr9X9Kb5zsID9bFbO2
         tpS0v2XBXaFPuJnDIEZoifwiPP9EIBz5258t50uuLLSUis27G+kCR7fP2KfiKavqtGLi
         j/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PYb7LeVvOeL2a6oZQDOdPyF6X+hLJ7m1n6ZrjzCa1kg=;
        b=Uk7XIti4Y71JCze22gaX7H6TTICP9hK4YvXxCNNKXzKf+ed6FEXCNGA7Bnc276e/0O
         uAElzpgu5BKSAxixA06OnKxJ6Y9vNHurXEcOSvEaEPo3zw7wyheE5HkyTxfeO7Qv1GzF
         KBLCnek8eGBBp3PmjYIHwVuZgniDRqewb5F9kM89YJ4iZ5hvPpCLaEyCnpaFbNvAKssJ
         gkszONSh9CLBNYuUIElcRM6uyGM+ID1dBnLiN8yVHvfc2UP4WsnyaeTsOZvIw9xNLtXD
         b8aKpwUecEGRvkCr9PIf/M9IY8ufE97eeh+Wv39q60pcwxsjg9C1uTPluLCCMnWMPYBT
         RyQw==
X-Gm-Message-State: ANhLgQ1CjSJI9jkeuL0ngICPO9mHSiv+tIl+IL0H98k5ZTFI2a1wyr+p
        odQ/B8fSQ4yJRhoIeg42esMsKqi4jNQ=
X-Google-Smtp-Source: ADFU+vslWKyrkWJp08MnSi68nkLL2dbYNjt5GCJuxKMIjzsAdI65q7mKO1qecy8Rlvd8ht2eB2tN0Q==
X-Received: by 2002:a63:798a:: with SMTP id u132mr10410681pgc.203.1585249554963;
        Thu, 26 Mar 2020 12:05:54 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q103sm7414623pjc.1.2020.03.26.12.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 12:05:54 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH 05/10] media: imx: utils: Simplify IPU format lookup and enumeration
Date:   Thu, 26 Mar 2020 12:05:39 -0700
Message-Id: <20200326190544.16349-6-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326190544.16349-1-slongerbeam@gmail.com>
References: <20200326190544.16349-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The IPU formats are stored in two separate tables, one for YUV and one
for RGB formats. This complicates the lookup and enumeration function
without really increasing efficiency, as both tables contain a single
element. Merge the two tables and simplify the functions, and move the
resulting table next to the functions that use it.

slongerbeam:
- imx_media_enum_ipu_format() has been modified slightly to make use
  of a local match_index to compare with the requested index, to be
  consistent with the other format enumeration functions.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 132 ++++++++------------
 1 file changed, 52 insertions(+), 80 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 334c9670e481..d27787012ff3 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -186,30 +186,6 @@ static const struct imx_media_pixfmt pixel_formats[] = {
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
 						  enum codespace_sel cs_sel,
@@ -316,81 +292,77 @@ int imx_media_enum_mbus_format(u32 *code, u32 index, enum codespace_sel cs_sel)
 }
 EXPORT_SYMBOL_GPL(imx_media_enum_mbus_format);
 
+/* -----------------------------------------------------------------------------
+ * IPU Formats Lookup and Enumeration
+ */
+
+static const struct imx_media_pixfmt ipu_formats[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_YUV32,
+		.codes  = {MEDIA_BUS_FMT_AYUV8_1X32},
+		.cs     = IPUV3_COLORSPACE_YUV,
+		.bpp    = 32,
+		.ipufmt = true,
+	}, {
+		.fourcc	= V4L2_PIX_FMT_XRGB32,
+		.codes  = {MEDIA_BUS_FMT_ARGB8888_1X32},
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 32,
+		.ipufmt = true,
+	},
+};
+
 const struct imx_media_pixfmt *
 imx_media_find_ipu_format(u32 code, enum codespace_sel cs_sel)
 {
-	const struct imx_media_pixfmt *array, *fmt, *ret = NULL;
-	u32 array_size;
-	int i, j;
-
-	cs_sel &= ~CS_SEL_BAYER;
+	bool accept_yuv = cs_sel & CS_SEL_YUV;
+	bool accept_rgb = cs_sel & CS_SEL_RGB;
+	unsigned int i, j;
 
-	switch (cs_sel) {
-	case CS_SEL_YUV:
-		array_size = NUM_IPU_YUV_FORMATS;
-		array = ipu_yuv_formats;
-		break;
-	case CS_SEL_RGB:
-		array_size = NUM_IPU_RGB_FORMATS;
-		array = ipu_rgb_formats;
-		break;
-	case CS_SEL_YUV_RGB:
-		array_size = NUM_IPU_YUV_FORMATS + NUM_IPU_RGB_FORMATS;
-		array = ipu_yuv_formats;
-		break;
-	default:
+	if (!code)
 		return NULL;
-	}
 
-	for (i = 0; i < array_size; i++) {
-		if (cs_sel == CS_SEL_YUV_RGB && i >= NUM_IPU_YUV_FORMATS)
-			fmt = &ipu_rgb_formats[i - NUM_IPU_YUV_FORMATS];
-		else
-			fmt = &array[i];
+	for (i = 0; i < ARRAY_SIZE(ipu_formats); i++) {
+		const struct imx_media_pixfmt *fmt = &ipu_formats[i];
 
-		for (j = 0; code && fmt->codes[j]; j++) {
-			if (code == fmt->codes[j]) {
-				ret = fmt;
-				goto out;
-			}
+		if ((!accept_yuv && fmt->cs == IPUV3_COLORSPACE_YUV) ||
+		    (!accept_rgb && fmt->cs == IPUV3_COLORSPACE_RGB))
+			continue;
+
+		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
+			if (code == fmt->codes[j])
+				return fmt;
 		}
 	}
 
-out:
-	return ret;
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(imx_media_find_ipu_format);
 
 int imx_media_enum_ipu_format(u32 *code, u32 index, enum codespace_sel cs_sel)
 {
-	cs_sel &= ~CS_SEL_BAYER;
+	bool accept_yuv = cs_sel & CS_SEL_YUV;
+	bool accept_rgb = cs_sel & CS_SEL_RGB;
+	unsigned int i, j = 0, match_index = 0;
 
-	switch (cs_sel) {
-	case CS_SEL_YUV:
-		if (index >= NUM_IPU_YUV_FORMATS)
-			return -EINVAL;
-		*code = ipu_yuv_formats[index].codes[0];
-		break;
-	case CS_SEL_RGB:
-		if (index >= NUM_IPU_RGB_FORMATS)
-			return -EINVAL;
-		*code = ipu_rgb_formats[index].codes[0];
-		break;
-	case CS_SEL_YUV_RGB:
-		if (index >= NUM_IPU_YUV_FORMATS + NUM_IPU_RGB_FORMATS)
-			return -EINVAL;
-		if (index >= NUM_IPU_YUV_FORMATS) {
-			index -= NUM_IPU_YUV_FORMATS;
-			*code = ipu_rgb_formats[index].codes[0];
-		} else {
-			*code = ipu_yuv_formats[index].codes[0];
+	for (i = 0; i < ARRAY_SIZE(ipu_formats); i++) {
+		const struct imx_media_pixfmt *fmt = &ipu_formats[i];
+
+		if ((!accept_yuv && fmt->cs == IPUV3_COLORSPACE_YUV) ||
+		    (!accept_rgb && fmt->cs == IPUV3_COLORSPACE_RGB))
+			continue;
+
+		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
+			if (index == match_index) {
+				*code = fmt->codes[j];
+				return 0;
+			}
+
+			match_index++;
 		}
-		break;
-	default:
-		return -EINVAL;
 	}
 
-	return 0;
+	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(imx_media_enum_ipu_format);
 
-- 
2.17.1

