Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB64918030D
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 17:19:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgCJQTB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 12:19:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55460 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbgCJQTB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 12:19:01 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C07FD580;
        Tue, 10 Mar 2020 17:18:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583857138;
        bh=T6jWgt3fNSOLUOXlUnDLHi3ieH8fc6BKYbyhXVxzx+M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RQ2ZocQTvhO/w82g0z/ih1qCEH7GChIKZPSb21rBhqV+rWDtp0xbinuHoIlJAa5ta
         q36v4hSjxiB+NRKgqEOwkRR8BBqrtpqHyxlWIFGIB+OmXMxntudtHxfTz6uyTBthhA
         2imAkEQAz6cx/Ac5erxh7Cvar6VJdBUHmgo4vPYo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 5/8] media: imx: utils: Simplify IPU format lookup and enumeration
Date:   Tue, 10 Mar 2020 18:18:42 +0200
Message-Id: <20200310161845.1588-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200310161845.1588-1-laurent.pinchart@ideasonboard.com>
References: <20200310161845.1588-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IPU formats are stored in two separate tables, one for YUV and one
for RGB formats. This complicates the lookup and enumeration function
without really increasing efficiency, as both tables contain a single
element. Merge the two tables and simplify the functions, and move the
resulting table next to the functions that use it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 128 ++++++++------------
 1 file changed, 50 insertions(+), 78 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 6cce2e39a0e7..5036a856be95 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -209,30 +209,6 @@ static const struct imx_media_pixfmt rgb_formats[] = {
 #define NUM_RGB_FORMATS ARRAY_SIZE(rgb_formats)
 #define NUM_MBUS_RGB_FORMATS (NUM_RGB_FORMATS - NUM_NON_MBUS_RGB_FORMATS)
 
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
 static const
 struct imx_media_pixfmt *__find_format(u32 fourcc,
 				       u32 code,
@@ -382,77 +358,73 @@ int imx_media_enum_mbus_format(u32 *code, u32 index, enum codespace_sel cs_sel)
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
-	case CS_SEL_ANY:
-		array_size = NUM_IPU_YUV_FORMATS + NUM_IPU_RGB_FORMATS;
-		array = ipu_yuv_formats;
-		break;
-	default:
+	if (!code)
 		return NULL;
-	}
 
-	for (i = 0; i < array_size; i++) {
-		if (cs_sel == CS_SEL_ANY && i >= NUM_IPU_YUV_FORMATS)
-			fmt = &ipu_rgb_formats[i - NUM_IPU_YUV_FORMATS];
-		else
-			fmt = &array[i];
-
-		for (j = 0; code && fmt->codes[j]; j++) {
-			if (code == fmt->codes[j]) {
-				ret = fmt;
-				goto out;
-			}
+	for (i = 0; i < ARRAY_SIZE(ipu_formats); i++) {
+		const struct imx_media_pixfmt *fmt = &ipu_formats[i];
+
+		if ((!accept_yuv && fmt->cs == IPUV3_COLORSPACE_YUV) ||
+		    (!accept_rgb && fmt->cs == IPUV3_COLORSPACE_RGB))
+			continue;
+
+		for (j = 0; fmt->codes[j]; j++) {
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
-	case CS_SEL_ANY:
-		if (index >= NUM_IPU_YUV_FORMATS + NUM_IPU_RGB_FORMATS)
-			return -EINVAL;
-		if (index >= NUM_IPU_YUV_FORMATS) {
-			index -= NUM_IPU_YUV_FORMATS;
-			*code = ipu_rgb_formats[index].codes[0];
-		} else {
-			*code = ipu_yuv_formats[index].codes[0];
+	bool accept_yuv = cs_sel & CS_SEL_YUV;
+	bool accept_rgb = cs_sel & CS_SEL_RGB;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ipu_formats); i++) {
+		const struct imx_media_pixfmt *fmt = &ipu_formats[i];
+
+		if ((!accept_yuv && fmt->cs == IPUV3_COLORSPACE_YUV) ||
+		    (!accept_rgb && fmt->cs == IPUV3_COLORSPACE_RGB))
+			continue;
+
+		if (index-- == 0) {
+			*code = fmt->codes[0];
+			return 0;
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
Regards,

Laurent Pinchart

