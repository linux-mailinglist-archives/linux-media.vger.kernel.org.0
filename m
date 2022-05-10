Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 996FA52148B
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241389AbiEJMD0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241388AbiEJMDZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA8F5131E
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:27 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE4141248;
        Tue, 10 May 2022 13:59:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183960;
        bh=fvLlTM3o+3rn3zzOQBxWlaa4ljFoBkY1Y//8BFiskao=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PzIWVaJQb4hX8/rUairbnPSjPdAP7EOCo3lqAeCTBtFJa+LCgUyw4WLr/UB+uiDug
         ykXfv7Gh9gfRVEzc24QjO4gsIONobLHf9X/+l/VDmOFniRX8FRGlR/7gz+tZgtFjlH
         hPL/OgQk0m0IfDb7SQUaK3SGHJg1g7n5LVJ8GqSo=
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
Subject: [PATCH 12/50] staging: media: imx: imx7-media-csi: Drop legacy video device support
Date:   Tue, 10 May 2022 14:58:21 +0300
Message-Id: <20220510115859.19777-13-laurent.pinchart@ideasonboard.com>
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

Drop all the code related to the unused (by this driver) legacy video
device support.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 31 +++++-----------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 63f291684e79..2e314ce961dc 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -746,8 +746,6 @@ struct capture_priv {
 	spinlock_t q_lock;			/* Protect ready_q */
 
 	struct v4l2_ctrl_handler ctrl_hdlr;	/* Controls inherited from subdevs */
-
-	bool legacy_api;			/* Use the legacy (pre-MC) API */
 };
 
 #define to_capture_priv(v) container_of(v, struct capture_priv, vdev)
@@ -1240,20 +1238,10 @@ static int capture_init_format(struct capture_priv *priv)
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
 	struct imx_media_video_dev *vdev = &priv->vdev;
-	int ret;
 
-	if (priv->legacy_api) {
-		ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL,
-				       &fmt_src);
-		if (ret) {
-			dev_err(priv->dev, "failed to get source format\n");
-			return ret;
-		}
-	} else {
-		fmt_src.format.code = MEDIA_BUS_FMT_UYVY8_2X8;
-		fmt_src.format.width = IMX_MEDIA_DEF_PIX_WIDTH;
-		fmt_src.format.height = IMX_MEDIA_DEF_PIX_HEIGHT;
-	}
+	fmt_src.format.code = MEDIA_BUS_FMT_UYVY8_2X8;
+	fmt_src.format.width = IMX_MEDIA_DEF_PIX_WIDTH;
+	fmt_src.format.height = IMX_MEDIA_DEF_PIX_HEIGHT;
 
 	imx_media_mbus_fmt_to_pix_fmt(&vdev->fmt, &fmt_src.format, NULL);
 	vdev->compose.width = fmt_src.format.width;
@@ -1322,7 +1310,7 @@ static void imx7_media_capture_device_unregister(struct imx_media_video_dev *vde
 
 static struct imx_media_video_dev *
 imx7_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
-			       int pad, bool legacy_api)
+			       int pad)
 {
 	struct capture_priv *priv;
 	struct video_device *vfd;
@@ -1336,7 +1324,6 @@ imx7_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
 	priv->src_sd = src_sd;
 	priv->src_sd_pad = pad;
 	priv->dev = dev;
-	priv->legacy_api = legacy_api;
 
 	mutex_init(&priv->mutex);
 	INIT_LIST_HEAD(&priv->ready_q);
@@ -1354,7 +1341,7 @@ imx7_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
 	vfd->vfl_dir = VFL_DIR_RX;
 	vfd->tvnorms = V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM;
 	vfd->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING
-			 | (!legacy_api ? V4L2_CAP_IO_MC : 0);
+			 | V4L2_CAP_IO_MC;
 	vfd->lock = &priv->mutex;
 	vfd->queue = &priv->q;
 
@@ -1392,12 +1379,6 @@ imx7_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
 		return ERR_PTR(ret);
 	}
 
-	if (legacy_api) {
-		/* Initialize the control handler. */
-		v4l2_ctrl_handler_init(&priv->ctrl_hdlr, 0);
-		vfd->ctrl_handler = &priv->ctrl_hdlr;
-	}
-
 	return &priv->vdev;
 }
 
@@ -1742,7 +1723,7 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
 	int ret;
 
 	csi->vdev = imx7_media_capture_device_init(csi->sd.dev, &csi->sd,
-						   IMX7_CSI_PAD_SRC, false);
+						   IMX7_CSI_PAD_SRC);
 	if (IS_ERR(csi->vdev))
 		return PTR_ERR(csi->vdev);
 
-- 
Regards,

Laurent Pinchart

