Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E80F15214A1
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241442AbiEJMDo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241452AbiEJMDn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1DC052E73
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:45 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD517DFF;
        Tue, 10 May 2022 13:59:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183972;
        bh=HbKz4y1G2znjiWeWjvthgfOCUuheE0gfBZq5dYC849s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d7dmKovMwuSeMdFD155VqE1xTNlS0baa4306+chZwyqMonjIx7VbYH+vTQG6geFJ4
         Mqg+mTi0cTUNZfedLF0cz7F+AyIq8CFUwoJDIs3kcKZt79Uirt6sB/vBXe4UbJpC67
         LiNxMumyEd1V142W85/YV8xScXddZs2E/efDLwlU=
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
Subject: [PATCH 26/50] staging: media: imx: imx7-media-csi: Fold imx_media_dev into imx7_csi
Date:   Tue, 10 May 2022 14:58:35 +0300
Message-Id: <20220510115859.19777-27-laurent.pinchart@ideasonboard.com>
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

Now that the driver doesn't use any helper that relies on the
imx_media_dev structure anymore, merge the three fields of the
imx_media_dev structure directly in the imx7_csi structure. Update all
the users accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 61 +++++++++++-----------
 1 file changed, 30 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 44c19c73da97..b116f6ab96f0 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -183,8 +183,10 @@ struct imx7_csi {
 	spinlock_t irqlock; /* Protects last_eof */
 
 	/* Media and V4L2 device */
-	struct imx_media_dev imxmd;
+	struct media_device mdev;
+	struct v4l2_device v4l2_dev;
 	struct v4l2_async_notifier notifier;
+	struct media_pipeline pipe;
 
 	struct v4l2_subdev *src_sd;
 	bool is_csi2;
@@ -1081,9 +1083,9 @@ static int imx7_csi_video_start_streaming(struct vb2_queue *vq,
 		goto err_buffers;
 	}
 
-	mutex_lock(&csi->imxmd.md.graph_mutex);
+	mutex_lock(&csi->mdev.graph_mutex);
 
-	ret = __media_pipeline_start(&csi->sd.entity, &csi->imxmd.pipe);
+	ret = __media_pipeline_start(&csi->sd.entity, &csi->pipe);
 	if (ret)
 		goto err_unlock;
 
@@ -1091,14 +1093,14 @@ static int imx7_csi_video_start_streaming(struct vb2_queue *vq,
 	if (ret)
 		goto err_stop;
 
-	mutex_unlock(&csi->imxmd.md.graph_mutex);
+	mutex_unlock(&csi->mdev.graph_mutex);
 
 	return 0;
 
 err_stop:
 	__media_pipeline_stop(&csi->sd.entity);
 err_unlock:
-	mutex_unlock(&csi->imxmd.md.graph_mutex);
+	mutex_unlock(&csi->mdev.graph_mutex);
 	dev_err(csi->dev, "pipeline start failed with %d\n", ret);
 err_buffers:
 	spin_lock_irqsave(&csi->q_lock, flags);
@@ -1117,10 +1119,10 @@ static void imx7_csi_video_stop_streaming(struct vb2_queue *vq)
 	struct imx_media_buffer *tmp;
 	unsigned long flags;
 
-	mutex_lock(&csi->imxmd.md.graph_mutex);
+	mutex_lock(&csi->mdev.graph_mutex);
 	v4l2_subdev_call(&csi->sd, video, s_stream, 0);
 	__media_pipeline_stop(&csi->sd.entity);
-	mutex_unlock(&csi->imxmd.md.graph_mutex);
+	mutex_unlock(&csi->mdev.graph_mutex);
 
 	/* release all active buffers */
 	spin_lock_irqsave(&csi->q_lock, flags);
@@ -1704,11 +1706,11 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
 	if (ret)
 		return ret;
 
-	ret = v4l2_device_register_subdev_nodes(&csi->imxmd.v4l2_dev);
+	ret = v4l2_device_register_subdev_nodes(&csi->v4l2_dev);
 	if (ret)
 		goto err_unreg;
 
-	ret = media_device_register(&csi->imxmd.md);
+	ret = media_device_register(&csi->mdev);
 	if (ret)
 		goto err_unreg;
 
@@ -1778,7 +1780,7 @@ static int imx7_csi_notify_complete(struct v4l2_async_notifier *notifier)
 {
 	struct imx7_csi *csi = imx7_csi_notifier_to_dev(notifier);
 
-	return v4l2_device_register_subdev_nodes(&csi->imxmd.v4l2_dev);
+	return v4l2_device_register_subdev_nodes(&csi->v4l2_dev);
 }
 
 static const struct v4l2_async_notifier_operations imx7_csi_notify_ops = {
@@ -1812,7 +1814,7 @@ static int imx7_csi_async_register(struct imx7_csi *csi)
 
 	csi->notifier.ops = &imx7_csi_notify_ops;
 
-	ret = v4l2_async_nf_register(&csi->imxmd.v4l2_dev, &csi->notifier);
+	ret = v4l2_async_nf_register(&csi->v4l2_dev, &csi->notifier);
 	if (ret)
 		return ret;
 
@@ -1821,11 +1823,9 @@ static int imx7_csi_async_register(struct imx7_csi *csi)
 
 static void imx7_csi_media_cleanup(struct imx7_csi *csi)
 {
-	struct imx_media_dev *imxmd = &csi->imxmd;
-
-	v4l2_device_unregister(&imxmd->v4l2_dev);
-	media_device_unregister(&imxmd->md);
-	media_device_cleanup(&imxmd->md);
+	v4l2_device_unregister(&csi->v4l2_dev);
+	media_device_unregister(&csi->mdev);
+	media_device_cleanup(&csi->mdev);
 }
 
 static const struct media_device_ops imx7_csi_media_ops = {
@@ -1834,26 +1834,25 @@ static const struct media_device_ops imx7_csi_media_ops = {
 
 static int imx7_csi_media_dev_init(struct imx7_csi *csi)
 {
-	struct imx_media_dev *imxmd = &csi->imxmd;
 	int ret;
 
-	dev_set_drvdata(csi->dev, imxmd);
+	dev_set_drvdata(csi->dev, csi);
 
-	strscpy(imxmd->md.model, "imx-media", sizeof(imxmd->md.model));
-	imxmd->md.ops = &imx7_csi_media_ops;
-	imxmd->md.dev = csi->dev;
+	strscpy(csi->mdev.model, "imx-media", sizeof(csi->mdev.model));
+	csi->mdev.ops = &imx7_csi_media_ops;
+	csi->mdev.dev = csi->dev;
 
-	imxmd->v4l2_dev.mdev = &imxmd->md;
-	strscpy(imxmd->v4l2_dev.name, "imx-media",
-		sizeof(imxmd->v4l2_dev.name));
-	snprintf(imxmd->md.bus_info, sizeof(imxmd->md.bus_info),
-		 "platform:%s", dev_name(imxmd->md.dev));
+	csi->v4l2_dev.mdev = &csi->mdev;
+	strscpy(csi->v4l2_dev.name, "imx-media",
+		sizeof(csi->v4l2_dev.name));
+	snprintf(csi->mdev.bus_info, sizeof(csi->mdev.bus_info),
+		 "platform:%s", dev_name(csi->mdev.dev));
 
-	media_device_init(&imxmd->md);
+	media_device_init(&csi->mdev);
 
-	ret = v4l2_device_register(csi->dev, &imxmd->v4l2_dev);
+	ret = v4l2_device_register(csi->dev, &csi->v4l2_dev);
 	if (ret < 0) {
-		v4l2_err(&imxmd->v4l2_dev,
+		v4l2_err(&csi->v4l2_dev,
 			 "Failed to register v4l2_device: %d\n", ret);
 		goto cleanup;
 	}
@@ -1861,7 +1860,7 @@ static int imx7_csi_media_dev_init(struct imx7_csi *csi)
 	return 0;
 
 cleanup:
-	media_device_cleanup(&imxmd->md);
+	media_device_cleanup(&csi->mdev);
 
 	return ret;
 }
@@ -1894,7 +1893,7 @@ static int imx7_csi_media_init(struct imx7_csi *csi)
 	if (ret < 0)
 		return ret;
 
-	return v4l2_device_register_subdev(&csi->imxmd.v4l2_dev, &csi->sd);
+	return v4l2_device_register_subdev(&csi->v4l2_dev, &csi->sd);
 }
 
 static int imx7_csi_probe(struct platform_device *pdev)
-- 
Regards,

Laurent Pinchart

