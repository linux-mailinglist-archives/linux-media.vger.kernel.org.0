Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9DF818030B
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 17:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbgCJQTA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 12:19:00 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55460 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgCJQS7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 12:18:59 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC357D09;
        Tue, 10 Mar 2020 17:18:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583857137;
        bh=45WDOgMVDbEIYCdYu57pHUw6CrlzWdfApqjwmsfhmp0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gEnggmxqR1d36SbKCuzetDnnaKmI7oR5M3PXHk/DdFovJmnmbvSa7qlC03lAYX+Uj
         IPCHafIRiQ0abNSLiJjOznYJuiRVIzCorLx0nAvPd4vmjckTGM99MWxA8Dgk5ypcqh
         UbnRF4m5Vl85YpvoumUup+5A/p3E9aFArcIM/OO8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 3/8] media: imx: utils: Inline init_mbus_colorimetry() in its caller
Date:   Tue, 10 Mar 2020 18:18:40 +0200
Message-Id: <20200310161845.1588-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200310161845.1588-1-laurent.pinchart@ideasonboard.com>
References: <20200310161845.1588-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The init_mbus_colorimetry() function is small and used in a single
place. The code becomes easier to follow if it gets inline in its
caller. Do so.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 24 +++++++++------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index fae981698c49..75c4097a9d16 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -233,19 +233,6 @@ static const struct imx_media_pixfmt ipu_rgb_formats[] = {
 
 #define NUM_IPU_RGB_FORMATS ARRAY_SIZE(ipu_rgb_formats)
 
-static void init_mbus_colorimetry(struct v4l2_mbus_framefmt *mbus,
-				  const struct imx_media_pixfmt *fmt)
-{
-	mbus->colorspace = (fmt->cs == IPUV3_COLORSPACE_RGB) ?
-		V4L2_COLORSPACE_SRGB : V4L2_COLORSPACE_SMPTE170M;
-	mbus->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(mbus->colorspace);
-	mbus->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(mbus->colorspace);
-	mbus->quantization =
-		V4L2_MAP_QUANTIZATION_DEFAULT(fmt->cs == IPUV3_COLORSPACE_RGB,
-					      mbus->colorspace,
-					      mbus->ycbcr_enc);
-}
-
 static const
 struct imx_media_pixfmt *__find_format(u32 fourcc,
 				       u32 code,
@@ -488,7 +475,16 @@ int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 	}
 
 	mbus->code = code;
-	init_mbus_colorimetry(mbus, lcc);
+
+	mbus->colorspace = (lcc->cs == IPUV3_COLORSPACE_RGB)
+			? V4L2_COLORSPACE_SRGB : V4L2_COLORSPACE_SMPTE170M;
+	mbus->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(mbus->colorspace);
+	mbus->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(mbus->colorspace);
+	mbus->quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(lcc->cs == IPUV3_COLORSPACE_RGB,
+					      mbus->colorspace,
+					      mbus->ycbcr_enc);
+
 	if (cc)
 		*cc = lcc;
 
-- 
Regards,

Laurent Pinchart

