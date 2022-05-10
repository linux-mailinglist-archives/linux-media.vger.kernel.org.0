Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1CC5214A8
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241502AbiEJMEF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241501AbiEJMEE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:04:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0944246673
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 05:00:07 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91F911869;
        Tue, 10 May 2022 13:59:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183986;
        bh=pioge0W9Z06hO1XUA2h1cbvmUn6QLKoWaFjAWPtWIa4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=giyNYlrh+uwQfL4sj9MlbjyHHij/eSbCGl1zmDbIbzqz74EmvyzH4L5Tq3vG+gH+3
         NK/qeLo5iQBxbyQHxOBg0Lj/Ste1/W4MvHG4lShGrIu2+C1hjwyQIrb/zwOiMTRvDt
         U8xXjpT0nrQZcLLzWwk5U7RC1aBOBUMWc+IHey+k=
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
Subject: [PATCH 42/50] staging: media: imx: imx7-media-csi: Drop unneeded imx7_csi_pixfmt fields
Date:   Tue, 10 May 2022 14:58:51 +0300
Message-Id: <20220510115859.19777-43-laurent.pinchart@ideasonboard.com>
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

The imx7_csi_pixfmt cycles field is never used nor set, the bayer field
is never used, and the planar field is never set. Drop them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 23 ++--------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index ab101d82c253..b3fa3e20873b 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -185,11 +185,7 @@ struct imx7_csi_pixfmt {
 	 */
 	const u32 *codes;
 	int     bpp;     /* total bpp */
-	/* cycles per pixel for generic (bayer) formats for the parallel bus */
-	int	cycles;
 	bool	yuv;
-	bool    planar;  /* is a planar format */
-	bool    bayer;   /* is a raw bayer format */
 };
 
 struct imx7_csi_vb2_buffer {
@@ -836,22 +832,18 @@ static const struct imx7_csi_pixfmt pixel_formats[] = {
 		.fourcc = V4L2_PIX_FMT_SBGGR8,
 		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SBGGR8_1X8),
 		.bpp    = 8,
-		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SGBRG8,
 		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGBRG8_1X8),
 		.bpp    = 8,
-		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SGRBG8,
 		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGRBG8_1X8),
 		.bpp    = 8,
-		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SRGGB8,
 		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SRGGB8_1X8),
 		.bpp    = 8,
-		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SBGGR16,
 		.codes  = IMX_BUS_FMTS(
@@ -861,7 +853,6 @@ static const struct imx7_csi_pixfmt pixel_formats[] = {
 			MEDIA_BUS_FMT_SBGGR16_1X16
 		),
 		.bpp    = 16,
-		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SGBRG16,
 		.codes  = IMX_BUS_FMTS(
@@ -871,7 +862,6 @@ static const struct imx7_csi_pixfmt pixel_formats[] = {
 			MEDIA_BUS_FMT_SGBRG16_1X16
 		),
 		.bpp    = 16,
-		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SGRBG16,
 		.codes  = IMX_BUS_FMTS(
@@ -881,7 +871,6 @@ static const struct imx7_csi_pixfmt pixel_formats[] = {
 			MEDIA_BUS_FMT_SGRBG16_1X16
 		),
 		.bpp    = 16,
-		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SRGGB16,
 		.codes  = IMX_BUS_FMTS(
@@ -891,7 +880,6 @@ static const struct imx7_csi_pixfmt pixel_formats[] = {
 			MEDIA_BUS_FMT_SRGGB16_1X16
 		),
 		.bpp    = 16,
-		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_GREY,
 		.codes = IMX_BUS_FMTS(
@@ -900,17 +888,14 @@ static const struct imx7_csi_pixfmt pixel_formats[] = {
 			MEDIA_BUS_FMT_Y12_1X12
 		),
 		.bpp    = 8,
-		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_Y10,
 		.codes = IMX_BUS_FMTS(MEDIA_BUS_FMT_Y10_1X10),
 		.bpp    = 16,
-		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_Y12,
 		.codes = IMX_BUS_FMTS(MEDIA_BUS_FMT_Y12_1X12),
 		.bpp    = 16,
-		.bayer  = true,
 	},
 };
 
@@ -1087,10 +1072,7 @@ static int imx7_csi_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 	width = round_up(mbus->width, 8);
 
 	/* Round up stride for IDMAC line start address alignment */
-	if (cc->planar)
-		stride = round_up(width, 16);
-	else
-		stride = round_up((width * cc->bpp) >> 3, 8);
+	stride = round_up((width * cc->bpp) >> 3, 8);
 
 	pix->width = width;
 	pix->height = mbus->height;
@@ -1101,8 +1083,7 @@ static int imx7_csi_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 	pix->quantization = mbus->quantization;
 	pix->field = mbus->field;
 	pix->bytesperline = stride;
-	pix->sizeimage = cc->planar ? ((stride * pix->height * cc->bpp) >> 3) :
-			 stride * pix->height;
+	pix->sizeimage = stride * pix->height;
 
 	return 0;
 }
-- 
Regards,

Laurent Pinchart

