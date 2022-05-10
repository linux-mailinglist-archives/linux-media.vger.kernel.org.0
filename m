Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F086B521496
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241485AbiEJMEB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241487AbiEJMD5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E7D75131E
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:59 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C2FBB60;
        Tue, 10 May 2022 13:59:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183982;
        bh=pWBNjOCNvJ0L79D+vMPw5/m+XPE3tTaq0Uoqw8TCT0c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gPyj6+lKUzRCgtfCyjwIR8/ZqpWvJZyjjIQDTyypvWx0AHZ5M3PfNmivMntA0m7v2
         ioMR7o3HiSnyv2S3zFxwJwRBBS3Sg5O2TcnCYlLEHNxPTeWRDSBpo54IQhEdNHMjj8
         UpiJL2SAKvLj2Ets2NDQm0Z2WKYD4J5a+cDsBT+4=
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
Subject: [PATCH 37/50] staging: media: imx: imx7-media-csi: Drop unsupported YUV and RGB formats
Date:   Tue, 10 May 2022 14:58:46 +0300
Message-Id: <20220510115859.19777-38-laurent.pinchart@ideasonboard.com>
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

A large number of formats defined in the pixel_formats array are not
supported, as shown by the switch-case check in
imx7_csi_pad_link_validate(). Drop them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 55 ----------------------
 1 file changed, 55 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 17259922a082..6704e5d4d43b 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -838,61 +838,6 @@ static const struct imx7_csi_pixfmt pixel_formats[] = {
 		),
 		.yuv	= true,
 		.bpp    = 16,
-	}, {
-		.fourcc	= V4L2_PIX_FMT_YUV420,
-		.yuv	= true,
-		.bpp    = 12,
-		.planar = true,
-	}, {
-		.fourcc = V4L2_PIX_FMT_YVU420,
-		.yuv	= true,
-		.bpp    = 12,
-		.planar = true,
-	}, {
-		.fourcc = V4L2_PIX_FMT_YUV422P,
-		.yuv	= true,
-		.bpp    = 16,
-		.planar = true,
-	}, {
-		.fourcc = V4L2_PIX_FMT_NV12,
-		.yuv	= true,
-		.bpp    = 12,
-		.planar = true,
-	}, {
-		.fourcc = V4L2_PIX_FMT_NV16,
-		.yuv	= true,
-		.bpp    = 16,
-		.planar = true,
-	},
-	/*** RGB formats start here ***/
-	{
-		.fourcc	= V4L2_PIX_FMT_RGB565,
-		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_RGB565_2X8_LE),
-		.bpp    = 16,
-		.cycles = 2,
-	}, {
-		.fourcc	= V4L2_PIX_FMT_RGB24,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_RGB888_1X24,
-			MEDIA_BUS_FMT_RGB888_2X12_LE
-		),
-		.bpp    = 24,
-	}, {
-		.fourcc	= V4L2_PIX_FMT_BGR24,
-		.bpp    = 24,
-	}, {
-		.fourcc	= V4L2_PIX_FMT_XRGB32,
-		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_ARGB8888_1X32),
-		.bpp    = 32,
-	}, {
-		.fourcc	= V4L2_PIX_FMT_XBGR32,
-		.bpp    = 32,
-	}, {
-		.fourcc	= V4L2_PIX_FMT_BGRX32,
-		.bpp    = 32,
-	}, {
-		.fourcc	= V4L2_PIX_FMT_RGBX32,
-		.bpp    = 32,
 	},
 	/*** raw bayer and grayscale formats start here ***/
 	{
-- 
Regards,

Laurent Pinchart

