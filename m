Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A42D2EAE70
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:33:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727921AbhAEPcS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:32:18 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37698 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727520AbhAEPcS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:32:18 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3367D8C7;
        Tue,  5 Jan 2021 16:29:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860585;
        bh=NUgr9hSWWTriSRDVBB4dUVb/4DY7J2xUZtyjjhr88S4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ks4DVb9hLtJZSbv/k1mH9CKTkyzlPEZZ7K8TWAUtdrTIkjL0WwMX83JmMqjDyih0x
         fgeSludpvzsVdLETP52IG+SzYx/AQhN73nKD/+LHRYPRYofJBUv9SWKS0WfuKZIhVK
         gZDicgqsew9wfAe2fSKayFZsAsupm4n3Z5naCXlk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 14/75] media: imx: capture: Move queue and ctrl handler init to init function
Date:   Tue,  5 Jan 2021 17:27:51 +0200
Message-Id: <20210105152852.5733-15-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the initialization of the vb2 queue and the control handler to the
imx_media_capture_device_init() function. There's no need to delay them
until the registration time.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 51 ++++++++++---------
 1 file changed, 27 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 4f9cff62eb1f..d7cc1423b71e 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -725,7 +725,6 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 	struct v4l2_subdev *sd = priv->src_sd;
 	struct v4l2_device *v4l2_dev = sd->v4l2_dev;
 	struct video_device *vfd = vdev->vfd;
-	struct vb2_queue *vq = &priv->q;
 	struct v4l2_subdev_format fmt_src;
 	int ret;
 
@@ -740,25 +739,6 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 		return ret;
 	}
 
-	vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	vq->io_modes = VB2_MMAP | VB2_DMABUF;
-	vq->drv_priv = priv;
-	vq->buf_struct_size = sizeof(struct imx_media_buffer);
-	vq->ops = &capture_qops;
-	vq->mem_ops = &vb2_dma_contig_memops;
-	vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	vq->lock = &priv->mutex;
-	vq->min_buffers_needed = 2;
-	vq->dev = priv->dev;
-
-	ret = vb2_queue_init(vq);
-	if (ret) {
-		dev_err(priv->dev, "vb2_queue_init failed\n");
-		goto unreg;
-	}
-
-	INIT_LIST_HEAD(&priv->ready_q);
-
 	/* create the link from the src_sd devnode pad to device node */
 	ret = media_create_pad_link(&sd->entity, priv->src_sd_pad,
 				    &vfd->entity, 0, 0);
@@ -787,8 +767,6 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 	dev_info(priv->dev, "Registered %s as /dev/%s\n", vfd->name,
 		 video_device_node_name(vfd));
 
-	vfd->ctrl_handler = &priv->ctrl_hdlr;
-
 	/* add vdev to the video device list */
 	imx_media_add_video_device(priv->md, vdev);
 
@@ -821,6 +799,7 @@ imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
 {
 	struct capture_priv *priv;
 	struct video_device *vfd;
+	struct vb2_queue *vq;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -832,8 +811,10 @@ imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
 	priv->dev = dev;
 
 	mutex_init(&priv->mutex);
+	INIT_LIST_HEAD(&priv->ready_q);
 	spin_lock_init(&priv->q_lock);
 
+	/* Allocate and initialize the video device. */
 	snprintf(capture_videodev.name, sizeof(capture_videodev.name),
 		 "%s capture", src_sd->name);
 
@@ -844,8 +825,12 @@ imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
 	*vfd = capture_videodev;
 	vfd->lock = &priv->mutex;
 	vfd->queue = &priv->q;
+
+	video_set_drvdata(vfd, priv);
 	priv->vdev.vfd = vfd;
+	INIT_LIST_HEAD(&priv->vdev.list);
 
+	/* Initialize the video device pad. */
 	priv->vdev_pad.flags = MEDIA_PAD_FL_SINK;
 	ret = media_entity_pads_init(&vfd->entity, 1, &priv->vdev_pad);
 	if (ret) {
@@ -853,11 +838,29 @@ imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
 		return ERR_PTR(ret);
 	}
 
-	INIT_LIST_HEAD(&priv->vdev.list);
+	/* Initialize the vb2 queue. */
+	vq = &priv->q;
+	vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	vq->drv_priv = priv;
+	vq->buf_struct_size = sizeof(struct imx_media_buffer);
+	vq->ops = &capture_qops;
+	vq->mem_ops = &vb2_dma_contig_memops;
+	vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	vq->lock = &priv->mutex;
+	vq->min_buffers_needed = 2;
+	vq->dev = priv->dev;
 
-	video_set_drvdata(vfd, priv);
+	ret = vb2_queue_init(vq);
+	if (ret) {
+		dev_err(priv->dev, "vb2_queue_init failed\n");
+		video_device_release(vfd);
+		return ERR_PTR(ret);
+	}
 
+	/* Initialize the control handler. */
 	v4l2_ctrl_handler_init(&priv->ctrl_hdlr, 0);
+	vfd->ctrl_handler = &priv->ctrl_hdlr;
 
 	return &priv->vdev;
 }
-- 
Regards,

Laurent Pinchart

