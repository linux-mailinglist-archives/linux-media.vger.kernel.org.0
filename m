Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0758F67FC5D
	for <lists+linux-media@lfdr.de>; Sun, 29 Jan 2023 03:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232476AbjA2Cek (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Jan 2023 21:34:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231586AbjA2Cei (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Jan 2023 21:34:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F37D523339
        for <linux-media@vger.kernel.org>; Sat, 28 Jan 2023 18:34:36 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B319FE8;
        Sun, 29 Jan 2023 03:34:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674959675;
        bh=dMAlKlMwP3uRWVKuP3Bn/3FUxCHVX2P2kXJjmNMTRgY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TYNhd+RkxjpO3pNvVM0BJUWOjLlHeZDv2IzhIMWyz1ZnZdw45q9U9S/lHIuVCllfp
         /H0SSpHVQ5Y5NbZ/efWFqgoohm61VV7b9Wm8Iw7CPtnjFKXdq5zNe7q1nyf9yMn0FF
         5l03GceRwzYj4Lm6Jm72hWHigdJNpxTFr34F0XyU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Adam Ford <aford173@gmail.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v2 1/8] media: imx: imx7-media-csi: Drop imx7_csi.cc field
Date:   Sun, 29 Jan 2023 04:34:22 +0200
Message-Id: <20230129023429.22467-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230129023429.22467-1-laurent.pinchart@ideasonboard.com>
References: <20230129023429.22467-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx7_csi.cc field is set but never used. Drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 1ef92c8c0098..f1d7da7763d5 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -228,7 +228,6 @@ struct imx7_csi {
 	struct media_pad pad[IMX7_CSI_PADS_NUM];
 
 	struct v4l2_mbus_framefmt format_mbus[IMX7_CSI_PADS_NUM];
-	const struct imx7_csi_pixfmt *cc[IMX7_CSI_PADS_NUM];
 
 	/* Video device */
 	struct video_device *vdev;		/* Video device */
@@ -1807,8 +1806,6 @@ static int imx7_csi_init_cfg(struct v4l2_subdev *sd,
 		mf->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(mf->colorspace);
 		mf->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(!cc->yuv,
 					mf->colorspace, mf->ycbcr_enc);
-
-		csi->cc[i] = cc;
 	}
 
 	return 0;
@@ -2016,14 +2013,8 @@ static int imx7_csi_set_fmt(struct v4l2_subdev *sd,
 		outfmt = imx7_csi_get_format(csi, sd_state, IMX7_CSI_PAD_SRC,
 					     sdformat->which);
 		*outfmt = format.format;
-
-		if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-			csi->cc[IMX7_CSI_PAD_SRC] = outcc;
 	}
 
-	if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		csi->cc[sdformat->pad] = cc;
-
 out_unlock:
 	mutex_unlock(&csi->lock);
 
-- 
Regards,

Laurent Pinchart

