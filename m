Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3DE031B496
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbhBOEbR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:31:17 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45636 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbhBOEbN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:31:13 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5ED51905;
        Mon, 15 Feb 2021 05:28:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363301;
        bh=OuxtWgsA9ZyOuJR4iHBBz8SMWhE0KLrF7/0nSts/jl8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=re3OwsSLOYPaNgVk1VMyxvuhV4IgG/DivnsmIPRPC5cnzmTfGYjHgtDdG4HdNbgPV
         mhGvjQZBKa+/zCi/zyJvh+gl3fGSf+CBmuyTpSUmt3V6iTz9J7Xj23G70TzdJS9Kyn
         6fY+b7D72GPwzCC28y2bGIN9vEjpJGuEtdr1tDfg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 13/77] media: imx: capture: Move queue and ctrl handler init to init function
Date:   Mon, 15 Feb 2021 06:26:37 +0200
Message-Id: <20210215042741.28850-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the initialization of the vb2 queue and the control handler to the
imx_media_capture_device_init() function. There's no need to delay them
until the registration time.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/media/imx/imx-media-capture.c | 51 ++++++++++---------
 1 file changed, 27 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 4cee7ba55311..88de2eef74d2 100644
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
 
@@ -815,6 +793,7 @@ imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
 {
 	struct capture_priv *priv;
 	struct video_device *vfd;
+	struct vb2_queue *vq;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -826,8 +805,10 @@ imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
 	priv->dev = dev;
 
 	mutex_init(&priv->mutex);
+	INIT_LIST_HEAD(&priv->ready_q);
 	spin_lock_init(&priv->q_lock);
 
+	/* Allocate and initialize the video device. */
 	snprintf(capture_videodev.name, sizeof(capture_videodev.name),
 		 "%s capture", src_sd->name);
 
@@ -838,8 +819,12 @@ imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
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
@@ -847,11 +832,29 @@ imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
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

