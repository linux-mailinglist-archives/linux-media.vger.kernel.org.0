Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBAF7194B44
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 23:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbgCZWJB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 18:09:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42062 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgCZWJB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 18:09:01 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1EFC197A;
        Thu, 26 Mar 2020 23:08:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1585260537;
        bh=2vkTvHi42sxRNIUv//ym4M0uGcAsV+ECG5Etu87cfkM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GwQRRs4jjE7b5Gwj9crOHnuYP3NdAfHKuAObuq7FzLLwZAVrwnPLppVL7xQ3sNftP
         DiNKfyABoDlJZavoOkM2IwScY1zfTa7rxw6v9j8bKt2Ub+BLFNxiNhszzEq7HCCA1n
         y9rRdQGG8uo32W8b94Z1hbR0Crh6puNDYhq+FASc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v2 10/11] media: imx: utils: Decouple mbus- and pixel-based format lookup and enum
Date:   Fri, 27 Mar 2020 00:08:39 +0200
Message-Id: <20200326220840.18540-11-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200326220840.18540-1-laurent.pinchart@ideasonboard.com>
References: <20200326220840.18540-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function that lookup or enumerate formats based on a media bus code
or a pixel format share the same backend. The backend code has become
too complex due to the need to support both types of formats. Decouple
the two categories of functions by inlining the backend code and
simplifying it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 116 +++++++++++---------
 1 file changed, 65 insertions(+), 51 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index c22e222866e8..ff2202e95a48 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -193,10 +193,8 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 	},
 };
 
-static const
-struct imx_media_pixfmt *find_format(u32 fourcc,
-				     u32 code,
-				     enum codespace_sel cs_sel)
+const struct imx_media_pixfmt *
+imx_media_find_pixel_format(u32 fourcc, enum codespace_sel cs_sel)
 {
 	bool allow_bayer = cs_sel & CS_SEL_BAYER;
 	unsigned int i;
@@ -206,33 +204,53 @@ struct imx_media_pixfmt *find_format(u32 fourcc,
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
 		enum codespace_sel fmt_cs_sel;
-		unsigned int j;
 
 		fmt_cs_sel = fmt->cs == IPUV3_COLORSPACE_YUV
 			   ? CS_SEL_YUV : CS_SEL_RGB;
 
-		if ((cs_sel != CS_SEL_ANY && fmt_cs_sel != cs_sel) ||
-		    (!fourcc && !fmt->codes) ||
-		    (!allow_bayer && fmt->bayer))
+		if (!(cs_sel & fmt_cs_sel) || (!allow_bayer && fmt->bayer))
 			continue;
 
-		if (fourcc && fmt->fourcc == fourcc)
+		if (fmt->fourcc == fourcc)
 			return fmt;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(imx_media_find_pixel_format);
+
+int imx_media_enum_pixel_formats(u32 *fourcc, u32 index,
+				 enum codespace_sel cs_sel)
+{
+	bool allow_bayer = cs_sel & CS_SEL_BAYER;
+	unsigned int i;
+
+	cs_sel &= CS_SEL_YUV | CS_SEL_RGB;
+
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
+		enum codespace_sel fmt_cs_sel;
+
+		fmt_cs_sel = fmt->cs == IPUV3_COLORSPACE_YUV
+			   ? CS_SEL_YUV : CS_SEL_RGB;
 
-		if (!code)
+		if (!(cs_sel & fmt_cs_sel) || (!allow_bayer && fmt->bayer))
 			continue;
 
-		for (j = 0; fmt->codes[j]; j++) {
-			if (code == fmt->codes[j])
-				return fmt;
+		if (index == 0) {
+			*fourcc = fmt->fourcc;
+			return 0;
 		}
+
+		index--;
 	}
 
-	return NULL;
+	return -EINVAL;
 }
+EXPORT_SYMBOL_GPL(imx_media_enum_pixel_formats);
 
-static int enum_formats(u32 *fourcc, u32 *code, u32 index,
-			enum codespace_sel cs_sel)
+const struct imx_media_pixfmt *
+imx_media_find_mbus_format(u32 code, enum codespace_sel cs_sel)
 {
 	bool allow_bayer = cs_sel & CS_SEL_BAYER;
 	unsigned int i;
@@ -244,23 +262,45 @@ static int enum_formats(u32 *fourcc, u32 *code, u32 index,
 		enum codespace_sel fmt_cs_sel;
 		unsigned int j;
 
+		if (!fmt->codes)
+			continue;
+
 		fmt_cs_sel = fmt->cs == IPUV3_COLORSPACE_YUV
 			   ? CS_SEL_YUV : CS_SEL_RGB;
 
-		if ((cs_sel != CS_SEL_ANY && fmt_cs_sel != cs_sel) ||
-		    (!fourcc && !fmt->codes) ||
-		    (!allow_bayer && fmt->bayer))
+		if (!(cs_sel & fmt_cs_sel) || (!allow_bayer && fmt->bayer))
 			continue;
 
-		if (fourcc && index == 0) {
-			*fourcc = fmt->fourcc;
-			return 0;
+		for (j = 0; fmt->codes[j]; j++) {
+			if (code == fmt->codes[j])
+				return fmt;
 		}
+	}
 
-		if (!code) {
-			index--;
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(imx_media_find_mbus_format);
+
+int imx_media_enum_mbus_formats(u32 *code, u32 index, enum codespace_sel cs_sel)
+{
+	bool allow_bayer = cs_sel & CS_SEL_BAYER;
+	unsigned int i;
+
+	cs_sel &= CS_SEL_YUV | CS_SEL_RGB;
+
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
+		enum codespace_sel fmt_cs_sel;
+		unsigned int j;
+
+		if (!fmt->codes)
+			continue;
+
+		fmt_cs_sel = fmt->cs == IPUV3_COLORSPACE_YUV
+			   ? CS_SEL_YUV : CS_SEL_RGB;
+
+		if (!(cs_sel & fmt_cs_sel) || (!allow_bayer && fmt->bayer))
 			continue;
-		}
 
 		for (j = 0; fmt->codes[j]; j++) {
 			if (index == 0) {
@@ -274,32 +314,6 @@ static int enum_formats(u32 *fourcc, u32 *code, u32 index,
 
 	return -EINVAL;
 }
-
-const struct imx_media_pixfmt *
-imx_media_find_pixel_format(u32 fourcc, enum codespace_sel cs_sel)
-{
-	return find_format(fourcc, 0, cs_sel);
-}
-EXPORT_SYMBOL_GPL(imx_media_find_pixel_format);
-
-int imx_media_enum_pixel_formats(u32 *fourcc, u32 index,
-				 enum codespace_sel cs_sel)
-{
-	return enum_formats(fourcc, NULL, index, cs_sel);
-}
-EXPORT_SYMBOL_GPL(imx_media_enum_pixel_formats);
-
-const struct imx_media_pixfmt *
-imx_media_find_mbus_format(u32 code, enum codespace_sel cs_sel)
-{
-	return find_format(0, code, cs_sel);
-}
-EXPORT_SYMBOL_GPL(imx_media_find_mbus_format);
-
-int imx_media_enum_mbus_formats(u32 *code, u32 index, enum codespace_sel cs_sel)
-{
-	return enum_formats(NULL, code, index, cs_sel);
-}
 EXPORT_SYMBOL_GPL(imx_media_enum_mbus_formats);
 
 /* -----------------------------------------------------------------------------
-- 
Regards,

Laurent Pinchart

