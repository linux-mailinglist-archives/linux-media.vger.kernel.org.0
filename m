Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C29B1969FF
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2020 00:10:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727593AbgC1XKU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Mar 2020 19:10:20 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40297 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727506AbgC1XKT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Mar 2020 19:10:19 -0400
Received: by mail-pl1-f194.google.com with SMTP id h11so5060109plk.7
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2020 16:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ml/BZ3+EzOb+wiPBn+JlPv4MuJ1Ay5R+hGTw435LtZo=;
        b=YTT04pLndCM2qCgsdPdX37+iAKI/rQm2Q5UNATXy0ApiICIntkq4taFFfKix8f0IBE
         a4l7k2furVY6iyBBmJrzrUvn1MER2/gIUNeRYOFnpFd8AJzsBBtGYeAz8u+jQcSRvWD7
         5+L9BQnRtucExClGUdf24qGyduZWxd8pO/eTc7Z11HvyvzMM2jhprInrU8+iBmVO7JIu
         VF8e6mDVZYmmb6iigRPONsoGgxPqD+O0lapUM2hnjlmtEx8LKagF6n50nJB6k59bqbRc
         RiQcQS6VdpQKi28lH8MdDde8/A1LuAU3YxOwOYjvyo23qT2D973NvdHH+0uNy2dp6gfW
         21VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ml/BZ3+EzOb+wiPBn+JlPv4MuJ1Ay5R+hGTw435LtZo=;
        b=hjtYOzS2+53aliCo5bu0vjaHUVP5HN9oWvDRhpi9xa6rjhJSFymaL55bLNKMmNAKce
         mke7Eaivd42Z+Jo6hVIKfHrx2ZGli1R8rW8E7K/ytt9StMuWnCF+H0D3sr+2wNc6GfJx
         1cEaJkmx2mEEC9iTOA1fQO6Rie5u7jgCD44mlrmHHZlI+R/5SKd9yyuqHZsYStLwjXUr
         W0KQbOwnQrRTHdiTQegjv1qZn3b7Rz0Ko6+aFNQhKda3F1QTXeK2L2N2DiJMu16FFr+3
         Rkq7w/RrPR3GgVZBv4Ojf9D+BAAqn8pfP6FrcIdFAxLxI1JHa6o+SDdi6EEdsa/nkNDy
         L/hg==
X-Gm-Message-State: ANhLgQ1F4HWSv+AZEfzHszzLZ2xGw2q1E8nUgf42NMTOiFZSHXq4uMgE
        Fa8MvT3Wts0Q61mFb0yVXAAcB47MQdI=
X-Google-Smtp-Source: ADFU+vvzDpJDt3Fx8YyH1yVhEqYdAiRKnIRPm/5TcVxarC2gHtnWuMRw6As8s0QaApw4pfm9tD1c8g==
X-Received: by 2002:a17:902:ba8e:: with SMTP id k14mr5892030pls.103.1585437018053;
        Sat, 28 Mar 2020 16:10:18 -0700 (PDT)
Received: from mappy.nv.charter.com ([2600:6c4e:200:e053:3081:8132:c81a:db99])
        by smtp.gmail.com with ESMTPSA id w74sm3978602pfd.112.2020.03.28.16.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2020 16:10:17 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v2 05/10] media: imx: utils: Simplify IPU format lookup and enumeration
Date:   Sat, 28 Mar 2020 16:09:57 -0700
Message-Id: <20200328231002.649-6-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200328231002.649-1-slongerbeam@gmail.com>
References: <20200328231002.649-1-slongerbeam@gmail.com>
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

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 134 ++++++++------------
 1 file changed, 54 insertions(+), 80 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 6a3b0b737e5f..981a8b540a3c 100644
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
@@ -313,81 +289,79 @@ int imx_media_enum_mbus_format(u32 *code, u32 index, enum codespace_sel cs_sel)
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
+	unsigned int i;
 
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
+		unsigned int j;
 
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
+	unsigned int i;
 
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
+		unsigned int j;
+
+		if ((!accept_yuv && fmt->cs == IPUV3_COLORSPACE_YUV) ||
+		    (!accept_rgb && fmt->cs == IPUV3_COLORSPACE_RGB))
+			continue;
+
+		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
+			if (index == 0) {
+				*code = fmt->codes[j];
+				return 0;
+			}
+
+			index--;
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

