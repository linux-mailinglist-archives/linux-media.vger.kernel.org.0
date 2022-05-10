Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95E615214A0
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241489AbiEJMDy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241477AbiEJMDw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D2385046D
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:55 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9DE21838;
        Tue, 10 May 2022 13:59:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183979;
        bh=VdbQSy3P82Rsg+gZHdvz8pmd9A0c/1tnz7bkpEBrIAE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P1OQJOaOteI11+YyoyVrjCi1+xkZn97/W1+cOR8p/nNxyXtzcds+GT600hPmwLcBK
         sO/m5NSQgwLllCImSTagudc3ysIX/7411vIhZbGT+7xkDA4He8K5nJHKUSl9m49edx
         jTFDs0Kf5PdAV3vQTVA3qCDa3xv79bOZeNGH20lI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de
Subject: [PATCH 34/50] staging: media: imx: imx7-media-csi: Replace ipu_color_space with bool yuv field
Date:   Tue, 10 May 2022 14:58:43 +0300
Message-Id: <20220510115859.19777-35-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace the enum ipu_color_space cs field in struct imx7_csi_pixfmt with
a bool yuv field. This decouples the driver from the unrelated IPUv3
headers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 71 ++++++++--------------
 1 file changed, 26 insertions(+), 45 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 42f1485b3550..b8ce4fd7c55d 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -185,7 +185,7 @@ struct imx7_csi_pixfmt {
 	int     bpp;     /* total bpp */
 	/* cycles per pixel for generic (bayer) formats for the parallel bus */
 	int	cycles;
-	enum ipu_color_space cs;
+	bool	yuv;
 	bool    planar;  /* is a planar format */
 	bool    bayer;   /* is a raw bayer format */
 	bool    ipufmt;  /* is one of the IPU internal formats */
@@ -830,7 +830,7 @@ static const struct imx7_csi_pixfmt pixel_formats[] = {
 			MEDIA_BUS_FMT_UYVY8_2X8,
 			MEDIA_BUS_FMT_UYVY8_1X16
 		),
-		.cs     = IPUV3_COLORSPACE_YUV,
+		.yuv	= true,
 		.bpp    = 16,
 	}, {
 		.fourcc	= V4L2_PIX_FMT_YUYV,
@@ -838,37 +838,37 @@ static const struct imx7_csi_pixfmt pixel_formats[] = {
 			MEDIA_BUS_FMT_YUYV8_2X8,
 			MEDIA_BUS_FMT_YUYV8_1X16
 		),
-		.cs     = IPUV3_COLORSPACE_YUV,
+		.yuv	= true,
 		.bpp    = 16,
 	}, {
 		.fourcc	= V4L2_PIX_FMT_YUV420,
-		.cs     = IPUV3_COLORSPACE_YUV,
+		.yuv	= true,
 		.bpp    = 12,
 		.planar = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_YVU420,
-		.cs     = IPUV3_COLORSPACE_YUV,
+		.yuv	= true,
 		.bpp    = 12,
 		.planar = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_YUV422P,
-		.cs     = IPUV3_COLORSPACE_YUV,
+		.yuv	= true,
 		.bpp    = 16,
 		.planar = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_NV12,
-		.cs     = IPUV3_COLORSPACE_YUV,
+		.yuv	= true,
 		.bpp    = 12,
 		.planar = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_NV16,
-		.cs     = IPUV3_COLORSPACE_YUV,
+		.yuv	= true,
 		.bpp    = 16,
 		.planar = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_YUV32,
 		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_AYUV8_1X32),
-		.cs     = IPUV3_COLORSPACE_YUV,
+		.yuv	= true,
 		.bpp    = 32,
 		.ipufmt = true,
 	},
@@ -876,7 +876,6 @@ static const struct imx7_csi_pixfmt pixel_formats[] = {
 	{
 		.fourcc	= V4L2_PIX_FMT_RGB565,
 		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_RGB565_2X8_LE),
-		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.cycles = 2,
 	}, {
@@ -885,59 +884,48 @@ static const struct imx7_csi_pixfmt pixel_formats[] = {
 			MEDIA_BUS_FMT_RGB888_1X24,
 			MEDIA_BUS_FMT_RGB888_2X12_LE
 		),
-		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 24,
 	}, {
 		.fourcc	= V4L2_PIX_FMT_BGR24,
-		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 24,
 	}, {
 		.fourcc	= V4L2_PIX_FMT_XRGB32,
 		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_ARGB8888_1X32),
-		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 32,
 	}, {
 		.fourcc	= V4L2_PIX_FMT_XRGB32,
 		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_ARGB8888_1X32),
-		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 32,
 		.ipufmt = true,
 	}, {
 		.fourcc	= V4L2_PIX_FMT_XBGR32,
-		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 32,
 	}, {
 		.fourcc	= V4L2_PIX_FMT_BGRX32,
-		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 32,
 	}, {
 		.fourcc	= V4L2_PIX_FMT_RGBX32,
-		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 32,
 	},
 	/*** raw bayer and grayscale formats start here ***/
 	{
 		.fourcc = V4L2_PIX_FMT_SBGGR8,
 		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SBGGR8_1X8),
-		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 8,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SGBRG8,
 		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGBRG8_1X8),
-		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 8,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SGRBG8,
 		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGRBG8_1X8),
-		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 8,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SRGGB8,
 		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SRGGB8_1X8),
-		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 8,
 		.bayer  = true,
 	}, {
@@ -948,7 +936,6 @@ static const struct imx7_csi_pixfmt pixel_formats[] = {
 			MEDIA_BUS_FMT_SBGGR14_1X14,
 			MEDIA_BUS_FMT_SBGGR16_1X16
 		),
-		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.bayer  = true,
 	}, {
@@ -959,7 +946,6 @@ static const struct imx7_csi_pixfmt pixel_formats[] = {
 			MEDIA_BUS_FMT_SGBRG14_1X14,
 			MEDIA_BUS_FMT_SGBRG16_1X16
 		),
-		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.bayer  = true,
 	}, {
@@ -970,7 +956,6 @@ static const struct imx7_csi_pixfmt pixel_formats[] = {
 			MEDIA_BUS_FMT_SGRBG14_1X14,
 			MEDIA_BUS_FMT_SGRBG16_1X16
 		),
-		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.bayer  = true,
 	}, {
@@ -981,7 +966,6 @@ static const struct imx7_csi_pixfmt pixel_formats[] = {
 			MEDIA_BUS_FMT_SRGGB14_1X14,
 			MEDIA_BUS_FMT_SRGGB16_1X16
 		),
-		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.bayer  = true,
 	}, {
@@ -991,19 +975,16 @@ static const struct imx7_csi_pixfmt pixel_formats[] = {
 			MEDIA_BUS_FMT_Y10_1X10,
 			MEDIA_BUS_FMT_Y12_1X12
 		),
-		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 8,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_Y10,
 		.codes = IMX_BUS_FMTS(MEDIA_BUS_FMT_Y10_1X10),
-		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_Y12,
 		.codes = IMX_BUS_FMTS(MEDIA_BUS_FMT_Y12_1X12),
-		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.bayer  = true,
 	},
@@ -1031,9 +1012,9 @@ imx7_csi_find_pixel_format(u32 fourcc, enum imx7_csi_pixfmt_sel fmt_sel)
 		if (sel_ipu != fmt->ipufmt)
 			continue;
 
-		sel = fmt->bayer ? IMX7_CSI_PIXFMT_SEL_BAYER :
-			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
-			 IMX7_CSI_PIXFMT_SEL_YUV : IMX7_CSI_PIXFMT_SEL_RGB);
+		sel = fmt->bayer ? IMX7_CSI_PIXFMT_SEL_BAYER
+		    : (fmt->yuv ? IMX7_CSI_PIXFMT_SEL_YUV :
+		       IMX7_CSI_PIXFMT_SEL_RGB);
 
 		if ((fmt_sel & sel) && fmt->fourcc == fourcc)
 			return fmt;
@@ -1065,9 +1046,9 @@ imx7_csi_find_mbus_format(u32 code, enum imx7_csi_pixfmt_sel fmt_sel)
 		if (sel_ipu != fmt->ipufmt)
 			continue;
 
-		sel = fmt->bayer ? IMX7_CSI_PIXFMT_SEL_BAYER :
-			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
-			 IMX7_CSI_PIXFMT_SEL_YUV : IMX7_CSI_PIXFMT_SEL_RGB);
+		sel = fmt->bayer ? IMX7_CSI_PIXFMT_SEL_BAYER
+		    : (fmt->yuv ? IMX7_CSI_PIXFMT_SEL_YUV :
+		       IMX7_CSI_PIXFMT_SEL_RGB);
 
 		if (!(fmt_sel & sel) || !fmt->codes)
 			continue;
@@ -1116,9 +1097,9 @@ static int imx7_csi_enum_pixel_formats(u32 *fourcc, u32 index,
 		if (sel_ipu != fmt->ipufmt)
 			continue;
 
-		sel = fmt->bayer ? IMX7_CSI_PIXFMT_SEL_BAYER :
-			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
-			 IMX7_CSI_PIXFMT_SEL_YUV : IMX7_CSI_PIXFMT_SEL_RGB);
+		sel = fmt->bayer ? IMX7_CSI_PIXFMT_SEL_BAYER
+		    : (fmt->yuv ? IMX7_CSI_PIXFMT_SEL_YUV :
+		       IMX7_CSI_PIXFMT_SEL_RGB);
 
 		if (!(fmt_sel & sel))
 			continue;
@@ -1180,9 +1161,9 @@ static int imx7_csi_enum_mbus_formats(u32 *code, u32 index,
 		if (sel_ipu != fmt->ipufmt)
 			continue;
 
-		sel = fmt->bayer ? IMX7_CSI_PIXFMT_SEL_BAYER :
-			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
-			 IMX7_CSI_PIXFMT_SEL_YUV : IMX7_CSI_PIXFMT_SEL_RGB);
+		sel = fmt->bayer ? IMX7_CSI_PIXFMT_SEL_BAYER
+		    : (fmt->yuv ? IMX7_CSI_PIXFMT_SEL_YUV :
+		       IMX7_CSI_PIXFMT_SEL_RGB);
 
 		if (!(fmt_sel & sel) || !fmt->codes)
 			continue;
@@ -1226,7 +1207,7 @@ static int imx7_csi_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 	mbus->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(mbus->colorspace);
 	mbus->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(mbus->colorspace);
 	mbus->quantization =
-		V4L2_MAP_QUANTIZATION_DEFAULT(lcc->cs == IPUV3_COLORSPACE_RGB,
+		V4L2_MAP_QUANTIZATION_DEFAULT(!lcc->yuv,
 					      mbus->colorspace,
 					      mbus->ycbcr_enc);
 
@@ -1257,7 +1238,7 @@ static int imx7_csi_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 	 * TODO: the IPU currently does not support the AYUV32 format,
 	 * so until it does convert to a supported YUV format.
 	 */
-	if (cc->ipufmt && cc->cs == IPUV3_COLORSPACE_YUV) {
+	if (cc->ipufmt && cc->yuv) {
 		u32 code;
 
 		imx7_csi_enum_mbus_formats(&code, 0, IMX7_CSI_PIXFMT_SEL_YUV);
@@ -1299,7 +1280,7 @@ imx7_csi_video_find_format(u32 code, u32 fourcc)
 
 	cc = imx7_csi_find_ipu_format(code, IMX7_CSI_PIXFMT_SEL_YUV_RGB);
 	if (cc) {
-		enum imx7_csi_pixfmt_sel fmt_sel = cc->cs == IPUV3_COLORSPACE_YUV
+		enum imx7_csi_pixfmt_sel fmt_sel = cc->yuv
 						 ? IMX7_CSI_PIXFMT_SEL_YUV
 						 : IMX7_CSI_PIXFMT_SEL_RGB;
 
@@ -1618,7 +1599,7 @@ static int imx7_csi_video_validate_fmt(struct imx7_csi *csi)
 	 * set on the video node.
 	 */
 	cc = imx7_csi_video_find_format(fmt_src.format.code, 0);
-	if (!cc || csi->vdev_cc->cs != cc->cs)
+	if (!cc || csi->vdev_cc->yuv != cc->yuv)
 		return -EPIPE;
 
 	return 0;
@@ -2066,7 +2047,7 @@ static void imx7_csi_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt,
 		cc = imx7_csi_find_ipu_format(tryfmt->code,
 					      IMX7_CSI_PIXFMT_SEL_YUV_RGB);
 
-	if (cc && cc->cs == IPUV3_COLORSPACE_RGB)
+	if (cc && !cc->yuv)
 		is_rgb = true;
 
 	switch (tryfmt->colorspace) {
-- 
Regards,

Laurent Pinchart

