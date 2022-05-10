Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD695214AA
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241509AbiEJMEH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241506AbiEJMEG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:04:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4135946163
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 05:00:08 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6908221C5;
        Tue, 10 May 2022 13:59:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183987;
        bh=5+B/KoFU+IuzuNW1IpTkLULIo3A9NnPGy92kR6s1BuE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e8OuSfsJEB5tWHTIEjA9bbo4cgQBRlkKNdyJvi8AFJOmvZHyOIjmuKJAXeukRsqKV
         H3DVBKvgwi3KgTEJ7phlvo51PL1DuqLmNGAMjs2aDvHnLk7tms+6N/fsViGiI5HXWh
         KMHzF1FafkBA4/HbPmJnURqqVcTbAHsaTnDbxz5Q=
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
Subject: [PATCH 43/50] staging: media: imx: imx7-media-csi: Inline imx7_csi_init_mbus_fmt()
Date:   Tue, 10 May 2022 14:58:52 +0300
Message-Id: <20220510115859.19777-44-laurent.pinchart@ideasonboard.com>
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

Inline the imx7_csi_init_mbus_fmt() function in its only caller. This
allows simplifying the code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 54 ++++++----------------
 1 file changed, 15 insertions(+), 39 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index b3fa3e20873b..bc3a87656117 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1022,39 +1022,6 @@ static int imx7_csi_enum_mbus_formats(u32 *code, u32 index)
 	return -EINVAL;
 }
 
-static int imx7_csi_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
-				  u32 width, u32 height, u32 code, u32 field,
-				  const struct imx7_csi_pixfmt **cc)
-{
-	const struct imx7_csi_pixfmt *lcc;
-
-	mbus->width = width;
-	mbus->height = height;
-	mbus->field = field;
-
-	if (code == 0)
-		code = IMX7_CSI_DEF_MBUS_CODE;
-
-	lcc = imx7_csi_find_mbus_format(code);
-	if (!lcc)
-		return -EINVAL;
-
-	mbus->code = code;
-
-	mbus->colorspace = V4L2_COLORSPACE_SRGB;
-	mbus->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(mbus->colorspace);
-	mbus->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(mbus->colorspace);
-	mbus->quantization =
-		V4L2_MAP_QUANTIZATION_DEFAULT(!lcc->yuv,
-					      mbus->colorspace,
-					      mbus->ycbcr_enc);
-
-	if (cc)
-		*cc = lcc;
-
-	return 0;
-}
-
 static int imx7_csi_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 					const struct v4l2_mbus_framefmt *mbus,
 					const struct imx7_csi_pixfmt *cc)
@@ -1738,18 +1705,27 @@ static int imx7_csi_init_cfg(struct v4l2_subdev *sd,
 	const enum v4l2_subdev_format_whence which =
 		sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
-	int ret;
+	const struct imx7_csi_pixfmt *cc;
 	int i;
 
+	cc = imx7_csi_find_mbus_format(IMX7_CSI_DEF_MBUS_CODE);
+
 	for (i = 0; i < IMX7_CSI_PADS_NUM; i++) {
 		struct v4l2_mbus_framefmt *mf =
 			imx7_csi_get_format(csi, sd_state, i, which);
 
-		ret = imx7_csi_init_mbus_fmt(mf, IMX7_CSI_DEF_PIX_WIDTH,
-					     IMX7_CSI_DEF_PIX_HEIGHT, 0,
-					     V4L2_FIELD_NONE, &csi->cc[i]);
-		if (ret < 0)
-			return ret;
+		mf->code = IMX7_CSI_DEF_MBUS_CODE;
+		mf->width = IMX7_CSI_DEF_PIX_WIDTH;
+		mf->height = IMX7_CSI_DEF_PIX_HEIGHT;
+		mf->field = V4L2_FIELD_NONE;
+
+		mf->colorspace = V4L2_COLORSPACE_SRGB;
+		mf->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(mf->colorspace);
+		mf->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(mf->colorspace);
+		mf->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(!cc->yuv,
+					mf->colorspace, mf->ycbcr_enc);
+
+		csi->cc[i] = cc;
 	}
 
 	return 0;
-- 
Regards,

Laurent Pinchart

