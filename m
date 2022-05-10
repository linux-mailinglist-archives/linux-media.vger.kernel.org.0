Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D29852148F
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241415AbiEJMDg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241405AbiEJMDf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB7252E73
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:38 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8382824;
        Tue, 10 May 2022 13:59:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183966;
        bh=FKgYb9k2bmI3Tpr/aEtWZrnecOgXRroi+h/FsMN2epw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hQJjdbwYyZaag/H9pp+vm3eYNgBReA5d/HHMb+qxsJQ5xk2RcEX/xapVntkZw8jcZ
         1bnlDp1j3lmv0hhtB79zXi+kV9nbKAdh9UasUVabRLZxv0eC1IGL5CjJRZYviqMejV
         vrEEbyHw97M1S8dvoAEM99EKYIFgLcSQvInkIIQY=
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
Subject: [PATCH 19/50] staging: media: imx: imx7-media-csi: Embed imx_media_dev in imx7_csi
Date:   Tue, 10 May 2022 14:58:28 +0300
Message-Id: <20220510115859.19777-20-laurent.pinchart@ideasonboard.com>
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

There's no need anymore to allocate the imx_media_dev structure
separately from imx7_csi. Embed it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 47 +++++++++-------------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 8b19792adfc6..891e939d7ea5 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -183,7 +183,7 @@ struct imx7_csi {
 	spinlock_t irqlock; /* Protects last_eof */
 
 	/* Media and V4L2 device */
-	struct imx_media_dev *imxmd;
+	struct imx_media_dev imxmd;
 	struct v4l2_async_notifier notifier;
 
 	struct v4l2_subdev *src_sd;
@@ -1081,7 +1081,7 @@ static int imx7_csi_video_start_streaming(struct vb2_queue *vq,
 		goto return_bufs;
 	}
 
-	ret = imx_media_pipeline_set_stream(csi->imxmd, &csi->sd.entity, true);
+	ret = imx_media_pipeline_set_stream(&csi->imxmd, &csi->sd.entity, true);
 	if (ret) {
 		dev_err(csi->dev, "pipeline start failed with %d\n", ret);
 		goto return_bufs;
@@ -1107,7 +1107,7 @@ static void imx7_csi_video_stop_streaming(struct vb2_queue *vq)
 	unsigned long flags;
 	int ret;
 
-	ret = imx_media_pipeline_set_stream(csi->imxmd, &csi->sd.entity, false);
+	ret = imx_media_pipeline_set_stream(&csi->imxmd, &csi->sd.entity, false);
 	if (ret)
 		dev_warn(csi->dev, "pipeline stop failed with %d\n", ret);
 
@@ -1268,7 +1268,7 @@ static int imx7_csi_video_register(struct imx7_csi *csi)
 	}
 
 	/* Add vdev to the video devices list. */
-	imx_media_add_video_device(csi->imxmd, &csi->vdev);
+	imx_media_add_video_device(&csi->imxmd, &csi->vdev);
 
 	return 0;
 }
@@ -1685,11 +1685,11 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
 	if (ret)
 		return ret;
 
-	ret = v4l2_device_register_subdev_nodes(&csi->imxmd->v4l2_dev);
+	ret = v4l2_device_register_subdev_nodes(&csi->imxmd.v4l2_dev);
 	if (ret)
 		goto err_unreg;
 
-	ret = media_device_register(&csi->imxmd->md);
+	ret = media_device_register(&csi->imxmd.md);
 	if (ret)
 		goto err_unreg;
 
@@ -1759,7 +1759,7 @@ static int imx7_csi_notify_complete(struct v4l2_async_notifier *notifier)
 {
 	struct imx7_csi *csi = imx7_csi_notifier_to_dev(notifier);
 
-	return v4l2_device_register_subdev_nodes(&csi->imxmd->v4l2_dev);
+	return v4l2_device_register_subdev_nodes(&csi->imxmd.v4l2_dev);
 }
 
 static const struct v4l2_async_notifier_operations imx7_csi_notify_ops = {
@@ -1793,7 +1793,7 @@ static int imx7_csi_async_register(struct imx7_csi *csi)
 
 	csi->notifier.ops = &imx7_csi_notify_ops;
 
-	ret = v4l2_async_nf_register(&csi->imxmd->v4l2_dev, &csi->notifier);
+	ret = v4l2_async_nf_register(&csi->imxmd.v4l2_dev, &csi->notifier);
 	if (ret)
 		return ret;
 
@@ -1802,7 +1802,7 @@ static int imx7_csi_async_register(struct imx7_csi *csi)
 
 static void imx7_csi_media_cleanup(struct imx7_csi *csi)
 {
-	struct imx_media_dev *imxmd = csi->imxmd;
+	struct imx_media_dev *imxmd = &csi->imxmd;
 
 	v4l2_device_unregister(&imxmd->v4l2_dev);
 	media_device_unregister(&imxmd->md);
@@ -1813,20 +1813,16 @@ static const struct media_device_ops imx7_csi_media_ops = {
 	.link_notify = v4l2_pipeline_link_notify,
 };
 
-static struct imx_media_dev *imx7_csi_media_dev_init(struct device *dev)
+static int imx7_csi_media_dev_init(struct imx7_csi *csi)
 {
-	struct imx_media_dev *imxmd;
+	struct imx_media_dev *imxmd = &csi->imxmd;
 	int ret;
 
-	imxmd = devm_kzalloc(dev, sizeof(*imxmd), GFP_KERNEL);
-	if (!imxmd)
-		return ERR_PTR(-ENOMEM);
-
-	dev_set_drvdata(dev, imxmd);
+	dev_set_drvdata(csi->dev, imxmd);
 
 	strscpy(imxmd->md.model, "imx-media", sizeof(imxmd->md.model));
 	imxmd->md.ops = &imx7_csi_media_ops;
-	imxmd->md.dev = dev;
+	imxmd->md.dev = csi->dev;
 
 	mutex_init(&imxmd->mutex);
 
@@ -1838,7 +1834,7 @@ static struct imx_media_dev *imx7_csi_media_dev_init(struct device *dev)
 
 	media_device_init(&imxmd->md);
 
-	ret = v4l2_device_register(dev, &imxmd->v4l2_dev);
+	ret = v4l2_device_register(csi->dev, &imxmd->v4l2_dev);
 	if (ret < 0) {
 		v4l2_err(&imxmd->v4l2_dev,
 			 "Failed to register v4l2_device: %d\n", ret);
@@ -1849,25 +1845,22 @@ static struct imx_media_dev *imx7_csi_media_dev_init(struct device *dev)
 
 	v4l2_async_nf_init(&imxmd->notifier);
 
-	return imxmd;
+	return 0;
 
 cleanup:
 	media_device_cleanup(&imxmd->md);
 
-	return ERR_PTR(ret);
+	return ret;
 }
 
 static int imx7_csi_media_init(struct imx7_csi *csi)
 {
-	struct imx_media_dev *imxmd;
 	int i, ret;
 
 	/* add media device */
-	imxmd = imx7_csi_media_dev_init(csi->dev);
-	if (IS_ERR(imxmd))
-		return PTR_ERR(imxmd);
-
-	csi->imxmd = imxmd;
+	ret = imx7_csi_media_dev_init(csi);
+	if (ret)
+		return ret;
 
 	v4l2_subdev_init(&csi->sd, &imx7_csi_subdev_ops);
 	v4l2_set_subdevdata(&csi->sd, csi);
@@ -1888,7 +1881,7 @@ static int imx7_csi_media_init(struct imx7_csi *csi)
 	if (ret < 0)
 		return ret;
 
-	return v4l2_device_register_subdev(&csi->imxmd->v4l2_dev, &csi->sd);
+	return v4l2_device_register_subdev(&csi->imxmd.v4l2_dev, &csi->sd);
 }
 
 static int imx7_csi_probe(struct platform_device *pdev)
-- 
Regards,

Laurent Pinchart

