Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 932F22EAE60
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:32:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbhAEPb3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:31:29 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37698 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727126AbhAEPb2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:31:28 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E95A8AE;
        Tue,  5 Jan 2021 16:29:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860581;
        bh=Q4jhzRRbXGW8DlhinfOCZSDvepDTQTpO+pclPOG4UII=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tMCtRFuBPS9sWAdGXIalzwEoyhmcvwsKnznuf6xYWtgeLmsCeoUJ2pAwXlD1mawmD
         jx2Ow6LD2fVtvq8EM4R12WApfeP8Cgqur2YKhvky20+FHRXapNhB2BNcMd5PBeSZzt
         PUA7Xuq34gtaD+JUHd2QCl7NoceUGwmgrwabLr58=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 08/75] media: imx: capture: Use dev_* instead of v4l2_* to log messages
Date:   Tue,  5 Jan 2021 17:27:45 +0200
Message-Id: <20210105152852.5733-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx-media-capture helpers operate a video device node, but abuse the
v4l2_* subdev print functions to log messages. We have a struct device
pointer available, use it instead with the dev_* functions. This reduces
dependencies from imx-media-capture to the connected subdev.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index eb1453ade571..21f01ec56bd5 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -163,7 +163,7 @@ static int capture_enum_fmt_vid_cap(struct file *file, void *fh,
 	fmt_src.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL, &fmt_src);
 	if (ret) {
-		v4l2_err(priv->src_sd, "failed to get src_sd format\n");
+		dev_err(priv->dev, "failed to get src_sd format\n");
 		return ret;
 	}
 
@@ -289,7 +289,7 @@ static int capture_s_fmt_vid_cap(struct file *file, void *fh,
 	int ret;
 
 	if (vb2_is_busy(&priv->q)) {
-		v4l2_err(priv->src_sd, "%s queue busy\n", __func__);
+		dev_err(priv->dev, "%s queue busy\n", __func__);
 		return -EBUSY;
 	}
 
@@ -510,9 +510,9 @@ static int capture_buf_prepare(struct vb2_buffer *vb)
 	struct v4l2_pix_format *pix = &priv->vdev.fmt.fmt.pix;
 
 	if (vb2_plane_size(vb, 0) < pix->sizeimage) {
-		v4l2_err(priv->src_sd,
-			 "data will not fit into plane (%lu < %lu)\n",
-			 vb2_plane_size(vb, 0), (long)pix->sizeimage);
+		dev_err(priv->dev,
+			"data will not fit into plane (%lu < %lu)\n",
+			vb2_plane_size(vb, 0), (long)pix->sizeimage);
 		return -EINVAL;
 	}
 
@@ -570,14 +570,14 @@ static int capture_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	ret = capture_validate_fmt(priv);
 	if (ret) {
-		v4l2_err(priv->src_sd, "capture format not valid\n");
+		dev_err(priv->dev, "capture format not valid\n");
 		goto return_bufs;
 	}
 
 	ret = imx_media_pipeline_set_stream(priv->md, &priv->src_sd->entity,
 					    true);
 	if (ret) {
-		v4l2_err(priv->src_sd, "pipeline start failed with %d\n", ret);
+		dev_err(priv->dev, "pipeline start failed with %d\n", ret);
 		goto return_bufs;
 	}
 
@@ -610,7 +610,7 @@ static void capture_stop_streaming(struct vb2_queue *vq)
 	ret = imx_media_pipeline_set_stream(priv->md, &priv->src_sd->entity,
 					    false);
 	if (ret)
-		v4l2_warn(priv->src_sd, "pipeline stop failed with %d\n", ret);
+		dev_warn(priv->dev, "pipeline stop failed with %d\n", ret);
 
 	/* release all active buffers */
 	spin_lock_irqsave(&priv->q_lock, flags);
@@ -646,7 +646,7 @@ static int capture_open(struct file *file)
 
 	ret = v4l2_fh_open(file);
 	if (ret)
-		v4l2_err(priv->src_sd, "v4l2_fh_open failed\n");
+		dev_err(priv->dev, "v4l2_fh_open failed\n");
 
 	ret = v4l2_pipeline_pm_get(&vfd->entity);
 	if (ret)
@@ -749,7 +749,7 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
 	if (ret) {
-		v4l2_err(sd, "Failed to register video device\n");
+		dev_err(priv->dev, "Failed to register video device\n");
 		return ret;
 	}
 
@@ -766,7 +766,7 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 
 	ret = vb2_queue_init(vq);
 	if (ret) {
-		v4l2_err(sd, "vb2_queue_init failed\n");
+		dev_err(priv->dev, "vb2_queue_init failed\n");
 		goto unreg;
 	}
 
@@ -776,7 +776,7 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 	ret = media_create_pad_link(&sd->entity, priv->src_sd_pad,
 				    &vfd->entity, 0, 0);
 	if (ret) {
-		v4l2_err(sd, "failed to create link to device node\n");
+		dev_err(priv->dev, "failed to create link to device node\n");
 		goto unreg;
 	}
 
@@ -785,7 +785,7 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 	fmt_src.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt_src);
 	if (ret) {
-		v4l2_err(sd, "failed to get src_sd format\n");
+		dev_err(priv->dev, "failed to get src_sd format\n");
 		goto unreg;
 	}
 
@@ -797,8 +797,8 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 	vdev->cc = imx_media_find_pixel_format(vdev->fmt.fmt.pix.pixelformat,
 					       PIXFMT_SEL_ANY);
 
-	v4l2_info(sd, "Registered %s as /dev/%s\n", vfd->name,
-		  video_device_node_name(vfd));
+	dev_info(priv->dev, "Registered %s as /dev/%s\n", vfd->name,
+		 video_device_node_name(vfd));
 
 	vfd->ctrl_handler = &priv->ctrl_hdlr;
 
-- 
Regards,

Laurent Pinchart

