Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF7B9196EFB
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2020 19:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728474AbgC2RkY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Mar 2020 13:40:24 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33584 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728461AbgC2RkY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Mar 2020 13:40:24 -0400
Received: by mail-pl1-f195.google.com with SMTP id g18so5778001plq.0
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2020 10:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ml/BZ3+EzOb+wiPBn+JlPv4MuJ1Ay5R+hGTw435LtZo=;
        b=SRRdOX1br6Ken2D4fLjqJEfgHAFM9WsdsLHtmfbktAA6gZKHB9EdQ2JZWWPye4VqTN
         98f/YpDmNJosrz7ZVmmMrmQ06h1U6S+V2b4URebJRG0EWUUqqmVuOT+SniWyfkM1nT9S
         b4UNd+thMIJGwzF+bQKrnf5kvaTIcfn8g42vysBc2LUCjJMg7Slldg6PnTWeQUdIIXry
         vPhOaIGvSPHZEc7GqclKzKPDNOfQS0xRYL93/oZUuHfYxQBBG4yz37BzT6+0fSZ21EHv
         wlveiS7KRI0+qJkUl/j474iJAyI7NRbRhnumapNAwWO81b/cfdMRTekP6nu4o7TUIE5a
         J8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ml/BZ3+EzOb+wiPBn+JlPv4MuJ1Ay5R+hGTw435LtZo=;
        b=r4vd/GTur29LCSccFsp5v9HQXknLFfSJSE4P74O3mEGkqb6Xs8uWWadWJ4nytkxtEm
         WKO+JFn6JbEl99zrvDq905ohhRAmdKPvbDoirwQXtUaWwiH+C61+uiWKTjsekqYBrT7W
         3BrTXbdikqmQSyXULR/1wNxssICmUXUCWMAYvVSlNhuRssNP8GV8WLCvJHTpyEp5p7y6
         j6rBNXXCt/LVlEvuFiktdzuK9bYlww57E3KBr9gG8PPm3s9Hx5RL6H088anftwxHJqEz
         /posMyTlE0omCykp2j+z4UiPJJV89vDk9JOYd1ldaGfUXt0xDHK93zsBks5p7eFGO5Ac
         lEaQ==
X-Gm-Message-State: ANhLgQ1Kte6TgN8RoEgtJ4Tk9ohhHuX5/8EDCLHhSGPsSXihnxWyhtVk
        capRAuZvZHaCT9cgByBCVf3EE7TMA3Y=
X-Google-Smtp-Source: ADFU+vvSAfWlLVe+CFiJOu3K9y0NEYCILm5Fui6MlHwfcmufmWpJQ0B7Os019gkJyjDCA5FSTYeY+w==
X-Received: by 2002:a17:90a:1788:: with SMTP id q8mr12072597pja.120.1585503622803;
        Sun, 29 Mar 2020 10:40:22 -0700 (PDT)
Received: from mappy.nv.charter.com ([2600:6c4e:200:e053:a0c5:5fbc:c28e:f91f])
        by smtp.gmail.com with ESMTPSA id b133sm7031253pfb.180.2020.03.29.10.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 10:40:22 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v3 05/10] media: imx: utils: Simplify IPU format lookup and enumeration
Date:   Sun, 29 Mar 2020 10:40:05 -0700
Message-Id: <20200329174010.12304-6-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200329174010.12304-1-slongerbeam@gmail.com>
References: <20200329174010.12304-1-slongerbeam@gmail.com>
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

