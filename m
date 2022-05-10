Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 979295214AF
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241495AbiEJMEA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241485AbiEJMD5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BB0B46673
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:58 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84AB9BA9;
        Tue, 10 May 2022 13:59:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183981;
        bh=Nsc9cQrGdNHUTWWL9yyzYak+ErdyW8aB4BwSgWgEAM0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DEcl7bIDs2ku2bmNhttnO/gdt7kidjNoU0b7bML3rWSz4Y7+IDhwXskc7yBXW5UPk
         wJM2beTI3Rxd1EG1I+8ppF8fdddK3f9Mkt6m7DjS0VQJ8uOgm6SHl9LjJRLLX4/GLU
         u55Q5G2m6AeAuC+Hszr2Usf80plZLGbot9R1qakU=
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
Subject: [PATCH 36/50] staging: media: imx: imx7-media-csi: Drop IPU-only formats
Date:   Tue, 10 May 2022 14:58:45 +0300
Message-Id: <20220510115859.19777-37-laurent.pinchart@ideasonboard.com>
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

The formats specific to the IPUv3 are not supported by the CSI bridge.
Drop them, along with the related code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 98 ++--------------------
 1 file changed, 6 insertions(+), 92 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index c8ff259452b1..17259922a082 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -188,7 +188,6 @@ struct imx7_csi_pixfmt {
 	bool	yuv;
 	bool    planar;  /* is a planar format */
 	bool    bayer;   /* is a raw bayer format */
-	bool    ipufmt;  /* is one of the IPU internal formats */
 };
 
 struct imx7_csi_vb2_buffer {
@@ -811,7 +810,6 @@ enum imx7_csi_pixfmt_sel {
 	IMX7_CSI_PIXFMT_SEL_YUV   = BIT(0), /* select YUV formats */
 	IMX7_CSI_PIXFMT_SEL_RGB   = BIT(1), /* select RGB formats */
 	IMX7_CSI_PIXFMT_SEL_BAYER = BIT(2), /* select BAYER formats */
-	IMX7_CSI_PIXFMT_SEL_IPU   = BIT(3), /* select IPU-internal formats */
 	IMX7_CSI_PIXFMT_SEL_YUV_RGB = IMX7_CSI_PIXFMT_SEL_YUV
 				    | IMX7_CSI_PIXFMT_SEL_RGB,
 	IMX7_CSI_PIXFMT_SEL_ANY = IMX7_CSI_PIXFMT_SEL_YUV
@@ -865,12 +863,6 @@ static const struct imx7_csi_pixfmt pixel_formats[] = {
 		.yuv	= true,
 		.bpp    = 16,
 		.planar = true,
-	}, {
-		.fourcc = V4L2_PIX_FMT_YUV32,
-		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_AYUV8_1X32),
-		.yuv	= true,
-		.bpp    = 32,
-		.ipufmt = true,
 	},
 	/*** RGB formats start here ***/
 	{
@@ -892,11 +884,6 @@ static const struct imx7_csi_pixfmt pixel_formats[] = {
 		.fourcc	= V4L2_PIX_FMT_XRGB32,
 		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_ARGB8888_1X32),
 		.bpp    = 32,
-	}, {
-		.fourcc	= V4L2_PIX_FMT_XRGB32,
-		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_ARGB8888_1X32),
-		.bpp    = 32,
-		.ipufmt = true,
 	}, {
 		.fourcc	= V4L2_PIX_FMT_XBGR32,
 		.bpp    = 32,
@@ -1000,18 +987,12 @@ static const struct imx7_csi_pixfmt pixel_formats[] = {
 static const struct imx7_csi_pixfmt *
 imx7_csi_find_pixel_format(u32 fourcc, enum imx7_csi_pixfmt_sel fmt_sel)
 {
-	bool sel_ipu = fmt_sel & IMX7_CSI_PIXFMT_SEL_IPU;
 	unsigned int i;
 
-	fmt_sel &= ~IMX7_CSI_PIXFMT_SEL_IPU;
-
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		const struct imx7_csi_pixfmt *fmt = &pixel_formats[i];
 		enum imx7_csi_pixfmt_sel sel;
 
-		if (sel_ipu != fmt->ipufmt)
-			continue;
-
 		sel = fmt->bayer ? IMX7_CSI_PIXFMT_SEL_BAYER
 		    : (fmt->yuv ? IMX7_CSI_PIXFMT_SEL_YUV :
 		       IMX7_CSI_PIXFMT_SEL_RGB);
@@ -1033,19 +1014,13 @@ imx7_csi_find_pixel_format(u32 fourcc, enum imx7_csi_pixfmt_sel fmt_sel)
 static const struct imx7_csi_pixfmt *
 imx7_csi_find_mbus_format(u32 code, enum imx7_csi_pixfmt_sel fmt_sel)
 {
-	bool sel_ipu = fmt_sel & IMX7_CSI_PIXFMT_SEL_IPU;
 	unsigned int i;
 
-	fmt_sel &= ~IMX7_CSI_PIXFMT_SEL_IPU;
-
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		const struct imx7_csi_pixfmt *fmt = &pixel_formats[i];
 		enum imx7_csi_pixfmt_sel sel;
 		unsigned int j;
 
-		if (sel_ipu != fmt->ipufmt)
-			continue;
-
 		sel = fmt->bayer ? IMX7_CSI_PIXFMT_SEL_BAYER
 		    : (fmt->yuv ? IMX7_CSI_PIXFMT_SEL_YUV :
 		       IMX7_CSI_PIXFMT_SEL_RGB);
@@ -1062,12 +1037,6 @@ imx7_csi_find_mbus_format(u32 code, enum imx7_csi_pixfmt_sel fmt_sel)
 	return NULL;
 }
 
-static inline const struct imx7_csi_pixfmt *
-imx7_csi_find_ipu_format(u32 code, enum imx7_csi_pixfmt_sel fmt_sel)
-{
-	return imx7_csi_find_mbus_format(code, fmt_sel | IMX7_CSI_PIXFMT_SEL_IPU);
-}
-
 /*
  * Enumerate entries in the pixel_formats[] array that match the
  * requested selection criteria. Return the fourcc that matches the
@@ -1085,18 +1054,12 @@ static int imx7_csi_enum_pixel_formats(u32 *fourcc, u32 index,
 				       enum imx7_csi_pixfmt_sel fmt_sel,
 				       u32 code)
 {
-	bool sel_ipu = fmt_sel & IMX7_CSI_PIXFMT_SEL_IPU;
 	unsigned int i;
 
-	fmt_sel &= ~IMX7_CSI_PIXFMT_SEL_IPU;
-
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		const struct imx7_csi_pixfmt *fmt = &pixel_formats[i];
 		enum imx7_csi_pixfmt_sel sel;
 
-		if (sel_ipu != fmt->ipufmt)
-			continue;
-
 		sel = fmt->bayer ? IMX7_CSI_PIXFMT_SEL_BAYER
 		    : (fmt->yuv ? IMX7_CSI_PIXFMT_SEL_YUV :
 		       IMX7_CSI_PIXFMT_SEL_RGB);
@@ -1148,19 +1111,13 @@ static int imx7_csi_enum_pixel_formats(u32 *fourcc, u32 index,
 static int imx7_csi_enum_mbus_formats(u32 *code, u32 index,
 				      enum imx7_csi_pixfmt_sel fmt_sel)
 {
-	bool sel_ipu = fmt_sel & IMX7_CSI_PIXFMT_SEL_IPU;
 	unsigned int i;
 
-	fmt_sel &= ~IMX7_CSI_PIXFMT_SEL_IPU;
-
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		const struct imx7_csi_pixfmt *fmt = &pixel_formats[i];
 		enum imx7_csi_pixfmt_sel sel;
 		unsigned int j;
 
-		if (sel_ipu != fmt->ipufmt)
-			continue;
-
 		sel = fmt->bayer ? IMX7_CSI_PIXFMT_SEL_BAYER
 		    : (fmt->yuv ? IMX7_CSI_PIXFMT_SEL_YUV :
 		       IMX7_CSI_PIXFMT_SEL_RGB);
@@ -1195,11 +1152,8 @@ static int imx7_csi_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 		imx7_csi_enum_mbus_formats(&code, 0, IMX7_CSI_PIXFMT_SEL_YUV);
 
 	lcc = imx7_csi_find_mbus_format(code, IMX7_CSI_PIXFMT_SEL_ANY);
-	if (!lcc) {
-		lcc = imx7_csi_find_ipu_format(code, IMX7_CSI_PIXFMT_SEL_YUV_RGB);
-		if (!lcc)
-			return -EINVAL;
-	}
+	if (!lcc)
+		return -EINVAL;
 
 	mbus->code = code;
 
@@ -1225,26 +1179,12 @@ static int imx7_csi_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 	u32 stride;
 
 	if (!cc) {
-		cc = imx7_csi_find_ipu_format(mbus->code,
-					      IMX7_CSI_PIXFMT_SEL_YUV_RGB);
-		if (!cc)
-			cc = imx7_csi_find_mbus_format(mbus->code,
-						       IMX7_CSI_PIXFMT_SEL_ANY);
+		cc = imx7_csi_find_mbus_format(mbus->code,
+					       IMX7_CSI_PIXFMT_SEL_ANY);
 		if (!cc)
 			return -EINVAL;
 	}
 
-	/*
-	 * TODO: the IPU currently does not support the AYUV32 format,
-	 * so until it does convert to a supported YUV format.
-	 */
-	if (cc->ipufmt && cc->yuv) {
-		u32 code;
-
-		imx7_csi_enum_mbus_formats(&code, 0, IMX7_CSI_PIXFMT_SEL_YUV);
-		cc = imx7_csi_find_mbus_format(code, IMX7_CSI_PIXFMT_SEL_YUV);
-	}
-
 	/* Round up width for minimum burst size */
 	width = round_up(mbus->width, 8);
 
@@ -1273,29 +1213,6 @@ static int imx7_csi_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
  * Video Capture Device - IOCTLs
  */
 
-static const struct imx7_csi_pixfmt *
-imx7_csi_video_find_format(u32 code, u32 fourcc)
-{
-	const struct imx7_csi_pixfmt *cc;
-
-	cc = imx7_csi_find_ipu_format(code, IMX7_CSI_PIXFMT_SEL_YUV_RGB);
-	if (cc) {
-		enum imx7_csi_pixfmt_sel fmt_sel = cc->yuv
-						 ? IMX7_CSI_PIXFMT_SEL_YUV
-						 : IMX7_CSI_PIXFMT_SEL_RGB;
-
-		cc = imx7_csi_find_pixel_format(fourcc, fmt_sel);
-		if (!cc) {
-			imx7_csi_enum_pixel_formats(&fourcc, 0, fmt_sel, 0);
-			cc = imx7_csi_find_pixel_format(fourcc, fmt_sel);
-		}
-
-		return cc;
-	}
-
-	return imx7_csi_find_mbus_format(code, IMX7_CSI_PIXFMT_SEL_ANY);
-}
-
 static int imx7_csi_video_querycap(struct file *file, void *fh,
 				   struct v4l2_capability *cap)
 {
@@ -1598,7 +1515,8 @@ static int imx7_csi_video_validate_fmt(struct imx7_csi *csi)
 	 * Verify that the media bus code is compatible with the pixel format
 	 * set on the video node.
 	 */
-	cc = imx7_csi_video_find_format(fmt_src.format.code, 0);
+	cc = imx7_csi_find_mbus_format(fmt_src.format.code,
+				       IMX7_CSI_PIXFMT_SEL_ANY);
 	if (!cc || csi->vdev_cc->yuv != cc->yuv)
 		return -EPIPE;
 
@@ -2038,10 +1956,6 @@ static void imx7_csi_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt)
 	bool is_rgb = false;
 
 	cc = imx7_csi_find_mbus_format(tryfmt->code, IMX7_CSI_PIXFMT_SEL_ANY);
-	if (!cc)
-		cc = imx7_csi_find_ipu_format(tryfmt->code,
-					      IMX7_CSI_PIXFMT_SEL_YUV_RGB);
-
 	if (cc && !cc->yuv)
 		is_rgb = true;
 
-- 
Regards,

Laurent Pinchart

