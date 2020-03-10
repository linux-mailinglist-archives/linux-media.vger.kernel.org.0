Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3C818030F
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 17:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbgCJQTC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 12:19:02 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55460 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726901AbgCJQTC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 12:19:02 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C09D0AC3;
        Tue, 10 Mar 2020 17:18:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583857139;
        bh=0DaHBF/B/bhy/7A2Xy5GsJY2PuO8YB9+JHhkfSsPhjQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fStH1sHyOkHRn7nLMom9N5K+eSEsb6S0qn0vVWczUiCXSiqcw3MpdoPscW6zujtm5
         tDHLiJSReo896h0wtjRtt7sdb59UIW9WvbX32HMWavZP4tyWx2SEt1tbb0pmmPa8My
         /zVYnD6ibpwkiGrFVT2QL4/+WGJlLqWhltSwDwJs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 7/8] media: imx: utils: Remove unneeded argument to (find|enum)_format()
Date:   Tue, 10 Mar 2020 18:18:44 +0200
Message-Id: <20200310161845.1588-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200310161845.1588-1-laurent.pinchart@ideasonboard.com>
References: <20200310161845.1588-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The find_format() and enum_format() functions take an argument that
tells whether to take into account formats that don't have associated
media bus codes. The same information can be deduced from the fourcc
argument passed to these functions. Remove the allow_non_mbus argument
and use fourcc instead internally.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 31 ++++++++++-----------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 291d0b781278..c437c0e09108 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -218,7 +218,6 @@ static const struct imx_media_pixfmt rgb_formats[] = {
 static const
 struct imx_media_pixfmt *__find_format(u32 fourcc,
 				       u32 code,
-				       bool allow_non_mbus,
 				       bool allow_bayer,
 				       const struct imx_media_pixfmt *array,
 				       u32 array_size)
@@ -229,7 +228,7 @@ struct imx_media_pixfmt *__find_format(u32 fourcc,
 	for (i = 0; i < array_size; i++) {
 		fmt = &array[i];
 
-		if ((!allow_non_mbus && !fmt->codes) ||
+		if ((!fourcc && !fmt->codes) ||
 		    (!allow_bayer && fmt->bayer))
 			continue;
 
@@ -249,27 +248,26 @@ struct imx_media_pixfmt *__find_format(u32 fourcc,
 
 static const struct imx_media_pixfmt *find_format(u32 fourcc,
 						  u32 code,
-						  enum codespace_sel cs_sel,
-						  bool allow_non_mbus)
+						  enum codespace_sel cs_sel)
 {
 	const struct imx_media_pixfmt *ret;
 
 	switch (cs_sel & (CS_SEL_YUV | CS_SEL_RGB)) {
 	case CS_SEL_YUV:
-		return __find_format(fourcc, code, allow_non_mbus,
+		return __find_format(fourcc, code,
 				     cs_sel & CS_SEL_BAYER,
 				     yuv_formats, NUM_YUV_FORMATS);
 	case CS_SEL_RGB:
-		return __find_format(fourcc, code, allow_non_mbus,
+		return __find_format(fourcc, code,
 				    cs_sel & CS_SEL_BAYER,
 				     rgb_formats, NUM_RGB_FORMATS);
 	case CS_SEL_ANY:
-		ret = __find_format(fourcc, code, allow_non_mbus,
+		ret = __find_format(fourcc, code,
 				    cs_sel & CS_SEL_BAYER,
 				    yuv_formats, NUM_YUV_FORMATS);
 		if (ret)
 			return ret;
-		return __find_format(fourcc, code, allow_non_mbus,
+		return __find_format(fourcc, code,
 				     cs_sel & CS_SEL_BAYER,
 				     rgb_formats, NUM_RGB_FORMATS);
 	default:
@@ -278,8 +276,7 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
 }
 
 static int enum_format(u32 *fourcc, u32 *code, u32 index,
-		       enum codespace_sel cs_sel,
-		       bool allow_non_mbus)
+		       enum codespace_sel cs_sel)
 {
 	const struct imx_media_pixfmt *fmt;
 	u32 mbus_yuv_sz = NUM_MBUS_YUV_FORMATS;
@@ -290,20 +287,20 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 	switch (cs_sel & (CS_SEL_YUV | CS_SEL_RGB)) {
 	case CS_SEL_YUV:
 		if (index >= yuv_sz ||
-		    (!allow_non_mbus && index >= mbus_yuv_sz))
+		    (!fourcc && index >= mbus_yuv_sz))
 			return -EINVAL;
 		fmt = &yuv_formats[index];
 		break;
 	case CS_SEL_RGB:
 		if (index >= rgb_sz ||
-		    (!allow_non_mbus && index >= mbus_rgb_sz))
+		    (!fourcc && index >= mbus_rgb_sz))
 			return -EINVAL;
 		fmt = &rgb_formats[index];
 		if (!(cs_sel & CS_SEL_BAYER) && fmt->bayer)
 			return -EINVAL;
 		break;
 	case CS_SEL_ANY:
-		if (!allow_non_mbus) {
+		if (!fourcc) {
 			if (index >= mbus_yuv_sz) {
 				index -= mbus_yuv_sz;
 				if (index >= mbus_rgb_sz)
@@ -341,26 +338,26 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 const struct imx_media_pixfmt *
 imx_media_find_format(u32 fourcc, enum codespace_sel cs_sel)
 {
-	return find_format(fourcc, 0, cs_sel, true);
+	return find_format(fourcc, 0, cs_sel);
 }
 EXPORT_SYMBOL_GPL(imx_media_find_format);
 
 int imx_media_enum_format(u32 *fourcc, u32 index, enum codespace_sel cs_sel)
 {
-	return enum_format(fourcc, NULL, index, cs_sel, true);
+	return enum_format(fourcc, NULL, index, cs_sel);
 }
 EXPORT_SYMBOL_GPL(imx_media_enum_format);
 
 const struct imx_media_pixfmt *
 imx_media_find_mbus_format(u32 code, enum codespace_sel cs_sel)
 {
-	return find_format(0, code, cs_sel, false);
+	return find_format(0, code, cs_sel);
 }
 EXPORT_SYMBOL_GPL(imx_media_find_mbus_format);
 
 int imx_media_enum_mbus_format(u32 *code, u32 index, enum codespace_sel cs_sel)
 {
-	return enum_format(NULL, code, index, cs_sel, false);
+	return enum_format(NULL, code, index, cs_sel);
 }
 EXPORT_SYMBOL_GPL(imx_media_enum_mbus_format);
 
-- 
Regards,

Laurent Pinchart

