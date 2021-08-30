Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A230F3FB43E
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 13:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236478AbhH3LD1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 07:03:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43892 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236448AbhH3LDY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 07:03:24 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52AC41279;
        Mon, 30 Aug 2021 13:02:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630321343;
        bh=OtkiYhMX9wv8B2uWuvjDzZHZSxgct8eAzkN4lfpMidY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qFGDvwhszWSk+5ewNbhT+NFYVH371Iq3gX0WLKyHsp95NwqZL3GxmNltVOWUxlZwp
         9uVfxCIFykS4xvqEFnm6N0awOmVZlBEYKvhqJqizb0JlgtmghVfyi86JVaK3Jcwcb3
         cibRjMjdkA0bHSCiQFDLp9XtoSyHxFDqgJSAfgxo=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v8 14/36] media: entity: Use pad as the starting point for a pipeline
Date:   Mon, 30 Aug 2021 14:00:54 +0300
Message-Id: <20210830110116.488338-15-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sakari Ailus <sakari.ailus@linux.intel.com>

The pipeline has been moved from the entity to the pads; reflect this in
the media pipeline function API.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 Documentation/driver-api/media/mc-core.rst    |  9 +++--
 drivers/media/mc/mc-entity.c                  | 24 ++++++-------
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  6 ++--
 .../media/platform/exynos4-is/fimc-capture.c  |  8 ++---
 .../platform/exynos4-is/fimc-isp-video.c      |  8 ++---
 drivers/media/platform/exynos4-is/fimc-lite.c |  8 ++---
 drivers/media/platform/omap3isp/ispvideo.c    |  6 ++--
 .../media/platform/qcom/camss/camss-video.c   |  6 ++--
 drivers/media/platform/rcar-vin/rcar-dma.c    |  6 ++--
 .../platform/rockchip/rkisp1/rkisp1-capture.c |  6 ++--
 .../media/platform/s3c-camif/camif-capture.c  |  6 ++--
 drivers/media/platform/stm32/stm32-dcmi.c     |  6 ++--
 .../platform/sunxi/sun4i-csi/sun4i_dma.c      |  6 ++--
 .../platform/sunxi/sun6i-csi/sun6i_video.c    |  6 ++--
 drivers/media/platform/ti-vpe/cal-video.c     |  6 ++--
 drivers/media/platform/vsp1/vsp1_video.c      |  6 ++--
 drivers/media/platform/xilinx/xilinx-dma.c    |  6 ++--
 .../media/test-drivers/vimc/vimc-capture.c    |  6 ++--
 drivers/media/usb/au0828/au0828-core.c        |  8 ++---
 drivers/staging/media/imx/imx-media-utils.c   |  6 ++--
 drivers/staging/media/ipu3/ipu3-v4l2.c        |  6 ++--
 drivers/staging/media/omap4iss/iss_video.c    |  6 ++--
 drivers/staging/media/tegra-video/tegra210.c  |  6 ++--
 include/media/media-entity.h                  | 34 +++++++++----------
 24 files changed, 99 insertions(+), 102 deletions(-)

diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
index 8a13640bed56..136047a22744 100644
--- a/Documentation/driver-api/media/mc-core.rst
+++ b/Documentation/driver-api/media/mc-core.rst
@@ -213,15 +213,14 @@ When starting streaming, drivers must notify all entities in the pipeline to
 prevent link states from being modified during streaming by calling
 :c:func:`media_pipeline_start()`.
 
-The function will mark all entities connected to the given entity through
-enabled links, either directly or indirectly, as streaming.
+The function will mark all the pads connected to the given pad through
+enabled routes and links, either directly or indirectly, as streaming.
 
 The struct media_pipeline instance pointed to by
-the pipe argument will be stored in every entity in the pipeline.
+the pipe argument will be stored in every pad in the pipeline.
 Drivers should embed the struct media_pipeline
 in higher-level pipeline structures and can then access the
-pipeline through the struct media_entity
-pipe field.
+pipeline through the struct media_pad pipe field.
 
 Calls to :c:func:`media_pipeline_start()` can be nested.
 The pipeline pointer must be identical for all nested calls to the function.
diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 8ad4cb845f4a..b44ab423b49b 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -404,12 +404,11 @@ EXPORT_SYMBOL_GPL(media_entity_get_fwnode_pad);
  * Pipeline management
  */
 
-__must_check int __media_pipeline_start(struct media_entity *entity,
+__must_check int __media_pipeline_start(struct media_pad *pad,
 					struct media_pipeline *pipe)
 {
-	struct media_device *mdev = entity->graph_obj.mdev;
+	struct media_device *mdev = pad->graph_obj.mdev;
 	struct media_graph *graph = &pipe->graph;
-	struct media_pad *pad = entity->pads;
 	struct media_pad *pad_err = pad;
 	struct media_link *link;
 	int ret;
@@ -544,24 +543,23 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
 }
 EXPORT_SYMBOL_GPL(__media_pipeline_start);
 
-__must_check int media_pipeline_start(struct media_entity *entity,
+__must_check int media_pipeline_start(struct media_pad *pad,
 				      struct media_pipeline *pipe)
 {
-	struct media_device *mdev = entity->graph_obj.mdev;
+	struct media_device *mdev = pad->graph_obj.mdev;
 	int ret;
 
 	mutex_lock(&mdev->graph_mutex);
-	ret = __media_pipeline_start(entity, pipe);
+	ret = __media_pipeline_start(pad, pipe);
 	mutex_unlock(&mdev->graph_mutex);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(media_pipeline_start);
 
-void __media_pipeline_stop(struct media_entity *entity)
+void __media_pipeline_stop(struct media_pad *pad)
 {
-	struct media_pipeline *pipe = entity->pads->pipe;
+	struct media_pipeline *pipe = pad->pipe;
 	struct media_graph *graph = &pipe->graph;
-	struct media_pad *pad;
 
 	/*
 	 * If the following check fails, the driver has performed an
@@ -570,7 +568,7 @@ void __media_pipeline_stop(struct media_entity *entity)
 	if (WARN_ON(!pipe))
 		return;
 
-	media_graph_walk_start(graph, entity->pads);
+	media_graph_walk_start(graph, pad);
 
 	while ((pad = media_graph_walk_next(graph))) {
 		struct media_entity *entity = pad->entity;
@@ -592,12 +590,12 @@ void __media_pipeline_stop(struct media_entity *entity)
 }
 EXPORT_SYMBOL_GPL(__media_pipeline_stop);
 
-void media_pipeline_stop(struct media_entity *entity)
+void media_pipeline_stop(struct media_pad *pad)
 {
-	struct media_device *mdev = entity->graph_obj.mdev;
+	struct media_device *mdev = pad->graph_obj.mdev;
 
 	mutex_lock(&mdev->graph_mutex);
-	__media_pipeline_stop(entity);
+	__media_pipeline_stop(pad);
 	mutex_unlock(&mdev->graph_mutex);
 }
 EXPORT_SYMBOL_GPL(media_pipeline_stop);
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 47db0ee0fcbf..74db79b2990f 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -981,7 +981,7 @@ static int cio2_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
 		return r;
 	}
 
-	r = media_pipeline_start(&q->vdev.entity, &q->pipe);
+	r = media_pipeline_start(q->vdev.entity.pads, &q->pipe);
 	if (r)
 		goto fail_pipeline;
 
@@ -1001,7 +1001,7 @@ static int cio2_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
 fail_csi2_subdev:
 	cio2_hw_exit(cio2, q);
 fail_hw:
-	media_pipeline_stop(&q->vdev.entity);
+	media_pipeline_stop(q->vdev.entity.pads);
 fail_pipeline:
 	dev_dbg(&cio2->pci_dev->dev, "failed to start streaming (%d)\n", r);
 	cio2_vb2_return_all_buffers(q, VB2_BUF_STATE_QUEUED);
@@ -1022,7 +1022,7 @@ static void cio2_vb2_stop_streaming(struct vb2_queue *vq)
 	cio2_hw_exit(cio2, q);
 	synchronize_irq(cio2->pci_dev->irq);
 	cio2_vb2_return_all_buffers(q, VB2_BUF_STATE_ERROR);
-	media_pipeline_stop(&q->vdev.entity);
+	media_pipeline_stop(q->vdev.entity.pads);
 	pm_runtime_put(&cio2->pci_dev->dev);
 	cio2->streaming = false;
 }
diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers/media/platform/exynos4-is/fimc-capture.c
index 7ff4024003f4..eaac0ac4e406 100644
--- a/drivers/media/platform/exynos4-is/fimc-capture.c
+++ b/drivers/media/platform/exynos4-is/fimc-capture.c
@@ -524,7 +524,7 @@ static int fimc_capture_release(struct file *file)
 	mutex_lock(&fimc->lock);
 
 	if (close && vc->streaming) {
-		media_pipeline_stop(&vc->ve.vdev.entity);
+		media_pipeline_stop(vc->ve.vdev.entity.pads);
 		vc->streaming = false;
 	}
 
@@ -1184,7 +1184,7 @@ static int fimc_cap_streamon(struct file *file, void *priv,
 	if (fimc_capture_active(fimc))
 		return -EBUSY;
 
-	ret = media_pipeline_start(entity, &vc->ve.pipe->mp);
+	ret = media_pipeline_start(entity->pads, &vc->ve.pipe->mp);
 	if (ret < 0)
 		return ret;
 
@@ -1218,7 +1218,7 @@ static int fimc_cap_streamon(struct file *file, void *priv,
 	}
 
 err_p_stop:
-	media_pipeline_stop(entity);
+	media_pipeline_stop(entity->pads);
 	return ret;
 }
 
@@ -1234,7 +1234,7 @@ static int fimc_cap_streamoff(struct file *file, void *priv,
 		return ret;
 
 	if (vc->streaming) {
-		media_pipeline_stop(&vc->ve.vdev.entity);
+		media_pipeline_stop(vc->ve.vdev.entity.pads);
 		vc->streaming = false;
 	}
 
diff --git a/drivers/media/platform/exynos4-is/fimc-isp-video.c b/drivers/media/platform/exynos4-is/fimc-isp-video.c
index 83688a7982f7..e2862b3dcdfc 100644
--- a/drivers/media/platform/exynos4-is/fimc-isp-video.c
+++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
@@ -312,7 +312,7 @@ static int isp_video_release(struct file *file)
 	is_singular_file = v4l2_fh_is_singular_file(file);
 
 	if (is_singular_file && ivc->streaming) {
-		media_pipeline_stop(entity);
+		media_pipeline_stop(entity->pads);
 		ivc->streaming = 0;
 	}
 
@@ -493,7 +493,7 @@ static int isp_video_streamon(struct file *file, void *priv,
 	struct media_entity *me = &ve->vdev.entity;
 	int ret;
 
-	ret = media_pipeline_start(me, &ve->pipe->mp);
+	ret = media_pipeline_start(me->pads, &ve->pipe->mp);
 	if (ret < 0)
 		return ret;
 
@@ -508,7 +508,7 @@ static int isp_video_streamon(struct file *file, void *priv,
 	isp->video_capture.streaming = 1;
 	return 0;
 p_stop:
-	media_pipeline_stop(me);
+	media_pipeline_stop(me->pads);
 	return ret;
 }
 
@@ -523,7 +523,7 @@ static int isp_video_streamoff(struct file *file, void *priv,
 	if (ret < 0)
 		return ret;
 
-	media_pipeline_stop(&video->ve.vdev.entity);
+	media_pipeline_stop(video->ve.vdev.entity.pads);
 	video->streaming = 0;
 	return 0;
 }
diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/media/platform/exynos4-is/fimc-lite.c
index 67bfb1ad2ba2..a979600ff6e6 100644
--- a/drivers/media/platform/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/exynos4-is/fimc-lite.c
@@ -516,7 +516,7 @@ static int fimc_lite_release(struct file *file)
 	if (v4l2_fh_is_singular_file(file) &&
 	    atomic_read(&fimc->out_path) == FIMC_IO_DMA) {
 		if (fimc->streaming) {
-			media_pipeline_stop(entity);
+			media_pipeline_stop(entity->pads);
 			fimc->streaming = false;
 		}
 		fimc_lite_stop_capture(fimc, false);
@@ -822,7 +822,7 @@ static int fimc_lite_streamon(struct file *file, void *priv,
 	if (fimc_lite_active(fimc))
 		return -EBUSY;
 
-	ret = media_pipeline_start(entity, &fimc->ve.pipe->mp);
+	ret = media_pipeline_start(entity->pads, &fimc->ve.pipe->mp);
 	if (ret < 0)
 		return ret;
 
@@ -839,7 +839,7 @@ static int fimc_lite_streamon(struct file *file, void *priv,
 	}
 
 err_p_stop:
-	media_pipeline_stop(entity);
+	media_pipeline_stop(entity->pads);
 	return 0;
 }
 
@@ -853,7 +853,7 @@ static int fimc_lite_streamoff(struct file *file, void *priv,
 	if (ret < 0)
 		return ret;
 
-	media_pipeline_stop(&fimc->ve.vdev.entity);
+	media_pipeline_stop(fimc->ve.vdev.entity.pads);
 	fimc->streaming = false;
 	return 0;
 }
diff --git a/drivers/media/platform/omap3isp/ispvideo.c b/drivers/media/platform/omap3isp/ispvideo.c
index a8438040c4aa..87334477f223 100644
--- a/drivers/media/platform/omap3isp/ispvideo.c
+++ b/drivers/media/platform/omap3isp/ispvideo.c
@@ -1105,7 +1105,7 @@ isp_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 	pipe->l3_ick = clk_get_rate(video->isp->clock[ISP_CLK_L3_ICK]);
 	pipe->max_rate = pipe->l3_ick;
 
-	ret = media_pipeline_start(&video->video.entity, &pipe->pipe);
+	ret = media_pipeline_start(video->video.entity.pads, &pipe->pipe);
 	if (ret < 0)
 		goto err_pipeline_start;
 
@@ -1162,7 +1162,7 @@ isp_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 	return 0;
 
 err_check_format:
-	media_pipeline_stop(&video->video.entity);
+	media_pipeline_stop(video->video.entity.pads);
 err_pipeline_start:
 	/* TODO: Implement PM QoS */
 	/* The DMA queue must be emptied here, otherwise CCDC interrupts that
@@ -1229,7 +1229,7 @@ isp_video_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 	video->error = false;
 
 	/* TODO: Implement PM QoS */
-	media_pipeline_stop(&video->video.entity);
+	media_pipeline_stop(video->video.entity.pads);
 
 	media_entity_enum_cleanup(&pipe->ent_enum);
 
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index f282275af626..5cd494f17589 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -491,7 +491,7 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct v4l2_subdev *subdev;
 	int ret;
 
-	ret = media_pipeline_start(&vdev->entity, &video->pipe);
+	ret = media_pipeline_start(vdev->entity.pads, &video->pipe);
 	if (ret < 0)
 		return ret;
 
@@ -520,7 +520,7 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 	return 0;
 
 error:
-	media_pipeline_stop(&vdev->entity);
+	media_pipeline_stop(vdev->entity.pads);
 
 	video->ops->flush_buffers(video, VB2_BUF_STATE_QUEUED);
 
@@ -551,7 +551,7 @@ static void video_stop_streaming(struct vb2_queue *q)
 		v4l2_subdev_call(subdev, video, s_stream, 0);
 	}
 
-	media_pipeline_stop(&vdev->entity);
+	media_pipeline_stop(vdev->entity.pads);
 
 	video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
 }
diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 80b7ae47d165..83b2f923cf98 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -1215,7 +1215,7 @@ static int rvin_set_stream(struct rvin_dev *vin, int on)
 	sd = media_entity_to_v4l2_subdev(pad->entity);
 
 	if (!on) {
-		media_pipeline_stop(&vin->vdev.entity);
+		media_pipeline_stop(vin->vdev.entity.pads);
 		return v4l2_subdev_call(sd, video, s_stream, 0);
 	}
 
@@ -1232,7 +1232,7 @@ static int rvin_set_stream(struct rvin_dev *vin, int on)
 	mdev = vin->vdev.entity.graph_obj.mdev;
 	mutex_lock(&mdev->graph_mutex);
 	pipe = sd->entity.pads->pipe ? sd->entity.pads->pipe : &vin->vdev.pipe;
-	ret = __media_pipeline_start(&vin->vdev.entity, pipe);
+	ret = __media_pipeline_start(vin->vdev.entity.pads, pipe);
 	mutex_unlock(&mdev->graph_mutex);
 	if (ret)
 		return ret;
@@ -1241,7 +1241,7 @@ static int rvin_set_stream(struct rvin_dev *vin, int on)
 	if (ret == -ENOIOCTLCMD)
 		ret = 0;
 	if (ret)
-		media_pipeline_stop(&vin->vdev.entity);
+		media_pipeline_stop(vin->vdev.entity.pads);
 
 	return ret;
 }
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 41988eb0ec0a..2efbe181b6f1 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -988,7 +988,7 @@ static void rkisp1_vb2_stop_streaming(struct vb2_queue *queue)
 
 	rkisp1_dummy_buf_destroy(cap);
 
-	media_pipeline_stop(&node->vdev.entity);
+	media_pipeline_stop(node->vdev.entity.pads);
 
 	mutex_unlock(&cap->rkisp1->stream_lock);
 }
@@ -1002,7 +1002,7 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 
 	mutex_lock(&cap->rkisp1->stream_lock);
 
-	ret = media_pipeline_start(entity, &cap->rkisp1->pipe);
+	ret = media_pipeline_start(entity->pads, &cap->rkisp1->pipe);
 	if (ret) {
 		dev_err(cap->rkisp1->dev, "start pipeline failed %d\n", ret);
 		goto err_ret_buffers;
@@ -1038,7 +1038,7 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 err_destroy_dummy:
 	rkisp1_dummy_buf_destroy(cap);
 err_pipeline_stop:
-	media_pipeline_stop(entity);
+	media_pipeline_stop(entity->pads);
 err_ret_buffers:
 	rkisp1_return_all_buffers(cap, VB2_BUF_STATE_QUEUED);
 	mutex_unlock(&cap->rkisp1->stream_lock);
diff --git a/drivers/media/platform/s3c-camif/camif-capture.c b/drivers/media/platform/s3c-camif/camif-capture.c
index 140854ab4dd8..0189b8a33032 100644
--- a/drivers/media/platform/s3c-camif/camif-capture.c
+++ b/drivers/media/platform/s3c-camif/camif-capture.c
@@ -848,13 +848,13 @@ static int s3c_camif_streamon(struct file *file, void *priv,
 	if (s3c_vp_active(vp))
 		return 0;
 
-	ret = media_pipeline_start(sensor, camif->m_pipeline);
+	ret = media_pipeline_start(sensor->pads, camif->m_pipeline);
 	if (ret < 0)
 		return ret;
 
 	ret = camif_pipeline_validate(camif);
 	if (ret < 0) {
-		media_pipeline_stop(sensor);
+		media_pipeline_stop(sensor->pads);
 		return ret;
 	}
 
@@ -878,7 +878,7 @@ static int s3c_camif_streamoff(struct file *file, void *priv,
 
 	ret = vb2_streamoff(&vp->vb_queue, type);
 	if (ret == 0)
-		media_pipeline_stop(&camif->sensor.sd->entity);
+		media_pipeline_stop(camif->sensor.sd->entity.pads);
 	return ret;
 }
 
diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index d914ccef9831..457bc838bb73 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -730,7 +730,7 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 		goto err_unlocked;
 	}
 
-	ret = media_pipeline_start(&dcmi->vdev->entity, &dcmi->pipeline);
+	ret = media_pipeline_start(dcmi->vdev->entity.pads, &dcmi->pipeline);
 	if (ret < 0) {
 		dev_err(dcmi->dev, "%s: Failed to start streaming, media pipeline start error (%d)\n",
 			__func__, ret);
@@ -844,7 +844,7 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	dcmi_pipeline_stop(dcmi);
 
 err_media_pipeline_stop:
-	media_pipeline_stop(&dcmi->vdev->entity);
+	media_pipeline_stop(dcmi->vdev->entity.pads);
 
 err_pm_put:
 	pm_runtime_put(dcmi->dev);
@@ -871,7 +871,7 @@ static void dcmi_stop_streaming(struct vb2_queue *vq)
 
 	dcmi_pipeline_stop(dcmi);
 
-	media_pipeline_stop(&dcmi->vdev->entity);
+	media_pipeline_stop(dcmi->vdev->entity.pads);
 
 	spin_lock_irq(&dcmi->irqlock);
 
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
index 2c39cd7f2862..be0defdf74f1 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
@@ -266,7 +266,7 @@ static int sun4i_csi_start_streaming(struct vb2_queue *vq, unsigned int count)
 		goto err_clear_dma_queue;
 	}
 
-	ret = media_pipeline_start(&csi->vdev.entity, &csi->vdev.pipe);
+	ret = media_pipeline_start(csi->vdev.entity.pads, &csi->vdev.pipe);
 	if (ret < 0)
 		goto err_free_scratch_buffer;
 
@@ -330,7 +330,7 @@ static int sun4i_csi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	sun4i_csi_capture_stop(csi);
 
 err_disable_pipeline:
-	media_pipeline_stop(&csi->vdev.entity);
+	media_pipeline_stop(csi->vdev.entity.pads);
 
 err_free_scratch_buffer:
 	dma_free_coherent(csi->dev, csi->scratch.size, csi->scratch.vaddr,
@@ -359,7 +359,7 @@ static void sun4i_csi_stop_streaming(struct vb2_queue *vq)
 	return_all_buffers(csi, VB2_BUF_STATE_ERROR);
 	spin_unlock_irqrestore(&csi->qlock, flags);
 
-	media_pipeline_stop(&csi->vdev.entity);
+	media_pipeline_stop(csi->vdev.entity.pads);
 
 	dma_free_coherent(csi->dev, csi->scratch.size, csi->scratch.vaddr,
 			  csi->scratch.paddr);
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
index 07b2161392d2..6baa597a4dad 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
@@ -141,7 +141,7 @@ static int sun6i_video_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	video->sequence = 0;
 
-	ret = media_pipeline_start(&video->vdev.entity, &video->vdev.pipe);
+	ret = media_pipeline_start(video->vdev.entity.pads, &video->vdev.pipe);
 	if (ret < 0)
 		goto clear_dma_queue;
 
@@ -207,7 +207,7 @@ static int sun6i_video_start_streaming(struct vb2_queue *vq, unsigned int count)
 stop_csi_stream:
 	sun6i_csi_set_stream(video->csi, false);
 stop_media_pipeline:
-	media_pipeline_stop(&video->vdev.entity);
+	media_pipeline_stop(video->vdev.entity.pads);
 clear_dma_queue:
 	spin_lock_irqsave(&video->dma_queue_lock, flags);
 	list_for_each_entry(buf, &video->dma_queue, list)
@@ -231,7 +231,7 @@ static void sun6i_video_stop_streaming(struct vb2_queue *vq)
 
 	sun6i_csi_set_stream(video->csi, false);
 
-	media_pipeline_stop(&video->vdev.entity);
+	media_pipeline_stop(video->vdev.entity.pads);
 
 	/* Release all active buffers */
 	spin_lock_irqsave(&video->dma_queue_lock, flags);
diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 7799da1cc261..861a20ee6885 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -711,7 +711,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	dma_addr_t addr;
 	int ret;
 
-	ret = media_pipeline_start(&ctx->vdev.entity, &ctx->phy->pipe);
+	ret = media_pipeline_start(ctx->vdev.entity.pads, &ctx->phy->pipe);
 	if (ret < 0) {
 		ctx_err(ctx, "Failed to start media pipeline: %d\n", ret);
 		goto error_release_buffers;
@@ -764,7 +764,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	cal_ctx_unprepare(ctx);
 
 error_pipeline:
-	media_pipeline_stop(&ctx->vdev.entity);
+	media_pipeline_stop(ctx->vdev.entity.pads);
 error_release_buffers:
 	cal_release_buffers(ctx, VB2_BUF_STATE_QUEUED);
 
@@ -785,7 +785,7 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 
 	cal_release_buffers(ctx, VB2_BUF_STATE_ERROR);
 
-	media_pipeline_stop(&ctx->vdev.entity);
+	media_pipeline_stop(ctx->vdev.entity.pads);
 }
 
 static const struct vb2_ops cal_video_qops = {
diff --git a/drivers/media/platform/vsp1/vsp1_video.c b/drivers/media/platform/vsp1/vsp1_video.c
index f2c36f2fdf53..978f820b0f34 100644
--- a/drivers/media/platform/vsp1/vsp1_video.c
+++ b/drivers/media/platform/vsp1/vsp1_video.c
@@ -927,7 +927,7 @@ static void vsp1_video_stop_streaming(struct vb2_queue *vq)
 	}
 	mutex_unlock(&pipe->lock);
 
-	media_pipeline_stop(&video->video.entity);
+	media_pipeline_stop(video->video.entity.pads);
 	vsp1_video_release_buffers(video);
 	vsp1_video_pipeline_put(pipe);
 }
@@ -1048,7 +1048,7 @@ vsp1_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 		return PTR_ERR(pipe);
 	}
 
-	ret = __media_pipeline_start(&video->video.entity, &pipe->pipe);
+	ret = __media_pipeline_start(video->video.entity.pads, &pipe->pipe);
 	if (ret < 0) {
 		mutex_unlock(&mdev->graph_mutex);
 		goto err_pipe;
@@ -1072,7 +1072,7 @@ vsp1_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 	return 0;
 
 err_stop:
-	media_pipeline_stop(&video->video.entity);
+	media_pipeline_stop(video->video.entity.pads);
 err_pipe:
 	vsp1_video_pipeline_put(pipe);
 	return ret;
diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
index 03ee19d00041..f04b3d190562 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -405,7 +405,7 @@ static int xvip_dma_start_streaming(struct vb2_queue *vq, unsigned int count)
 	pipe = dma->video.entity.pads->pipe
 	     ? to_xvip_pipeline(&dma->video.entity) : &dma->pipe;
 
-	ret = media_pipeline_start(&dma->video.entity, &pipe->pipe);
+	ret = media_pipeline_start(dma->video.entity.pads, &pipe->pipe);
 	if (ret < 0)
 		goto error;
 
@@ -431,7 +431,7 @@ static int xvip_dma_start_streaming(struct vb2_queue *vq, unsigned int count)
 	return 0;
 
 error_stop:
-	media_pipeline_stop(&dma->video.entity);
+	media_pipeline_stop(dma->video.entity.pads);
 
 error:
 	/* Give back all queued buffers to videobuf2. */
@@ -459,7 +459,7 @@ static void xvip_dma_stop_streaming(struct vb2_queue *vq)
 
 	/* Cleanup the pipeline and mark it as being stopped. */
 	xvip_pipeline_cleanup(pipe);
-	media_pipeline_stop(&dma->video.entity);
+	media_pipeline_stop(dma->video.entity.pads);
 
 	/* Give back all queued buffers to videobuf2. */
 	spin_lock_irq(&dma->queued_lock);
diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index 5e9fd902cd37..10724b0a868c 100644
--- a/drivers/media/test-drivers/vimc/vimc-capture.c
+++ b/drivers/media/test-drivers/vimc/vimc-capture.c
@@ -246,7 +246,7 @@ static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
 	vcap->sequence = 0;
 
 	/* Start the media pipeline */
-	ret = media_pipeline_start(entity, &vcap->stream.pipe);
+	ret = media_pipeline_start(entity->pads, &vcap->stream.pipe);
 	if (ret) {
 		vimc_cap_return_all_buffers(vcap, VB2_BUF_STATE_QUEUED);
 		return ret;
@@ -254,7 +254,7 @@ static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	ret = vimc_streamer_s_stream(&vcap->stream, &vcap->ved, 1);
 	if (ret) {
-		media_pipeline_stop(entity);
+		media_pipeline_stop(entity->pads);
 		vimc_cap_return_all_buffers(vcap, VB2_BUF_STATE_QUEUED);
 		return ret;
 	}
@@ -273,7 +273,7 @@ static void vimc_cap_stop_streaming(struct vb2_queue *vq)
 	vimc_streamer_s_stream(&vcap->stream, &vcap->ved, 0);
 
 	/* Stop the media pipeline */
-	media_pipeline_stop(&vcap->vdev.entity);
+	media_pipeline_stop(vcap->vdev.entity.pads);
 
 	/* Release all active buffers */
 	vimc_cap_return_all_buffers(vcap, VB2_BUF_STATE_ERROR);
diff --git a/drivers/media/usb/au0828/au0828-core.c b/drivers/media/usb/au0828/au0828-core.c
index caefac07af92..877e85a451cb 100644
--- a/drivers/media/usb/au0828/au0828-core.c
+++ b/drivers/media/usb/au0828/au0828-core.c
@@ -410,7 +410,7 @@ static int au0828_enable_source(struct media_entity *entity,
 		goto end;
 	}
 
-	ret = __media_pipeline_start(entity, pipe);
+	ret = __media_pipeline_start(entity->pads, pipe);
 	if (ret) {
 		pr_err("Start Pipeline: %s->%s Error %d\n",
 			source->name, entity->name, ret);
@@ -501,12 +501,12 @@ static void au0828_disable_source(struct media_entity *entity)
 				return;
 
 			/* stop pipeline */
-			__media_pipeline_stop(dev->active_link_owner);
+			__media_pipeline_stop(dev->active_link_owner->pads);
 			pr_debug("Pipeline stop for %s\n",
 				dev->active_link_owner->name);
 
 			ret = __media_pipeline_start(
-					dev->active_link_user,
+					dev->active_link_user->pads,
 					dev->active_link_user_pipe);
 			if (ret) {
 				pr_err("Start Pipeline: %s->%s %d\n",
@@ -532,7 +532,7 @@ static void au0828_disable_source(struct media_entity *entity)
 			return;
 
 		/* stop pipeline */
-		__media_pipeline_stop(dev->active_link_owner);
+		__media_pipeline_stop(dev->active_link_owner->pads);
 		pr_debug("Pipeline stop for %s\n",
 			dev->active_link_owner->name);
 
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 535da4dda3c6..74218af45551 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -905,16 +905,16 @@ int imx_media_pipeline_set_stream(struct imx_media_dev *imxmd,
 	mutex_lock(&imxmd->md.graph_mutex);
 
 	if (on) {
-		ret = __media_pipeline_start(entity, &imxmd->pipe);
+		ret = __media_pipeline_start(entity->pads, &imxmd->pipe);
 		if (ret)
 			goto out;
 		ret = v4l2_subdev_call(sd, video, s_stream, 1);
 		if (ret)
-			__media_pipeline_stop(entity);
+			__media_pipeline_stop(entity->pads);
 	} else {
 		v4l2_subdev_call(sd, video, s_stream, 0);
 		if (entity->pads->pipe)
-			__media_pipeline_stop(entity);
+			__media_pipeline_stop(entity->pads);
 	}
 
 out:
diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 38a240764509..db5867da3f11 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -485,7 +485,7 @@ static int imgu_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	pipe = node->pipe;
 	imgu_pipe = &imgu->imgu_pipe[pipe];
-	r = media_pipeline_start(&node->vdev.entity, &imgu_pipe->pipeline);
+	r = media_pipeline_start(node->vdev.entity.pads, &imgu_pipe->pipeline);
 	if (r < 0)
 		goto fail_return_bufs;
 
@@ -510,7 +510,7 @@ static int imgu_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
 	return 0;
 
 fail_stop_pipeline:
-	media_pipeline_stop(&node->vdev.entity);
+	media_pipeline_stop(node->vdev.entity.pads);
 fail_return_bufs:
 	imgu_return_all_buffers(imgu, node, VB2_BUF_STATE_QUEUED);
 
@@ -550,7 +550,7 @@ static void imgu_vb2_stop_streaming(struct vb2_queue *vq)
 	imgu_return_all_buffers(imgu, node, VB2_BUF_STATE_ERROR);
 	mutex_unlock(&imgu->streaming_lock);
 
-	media_pipeline_stop(&node->vdev.entity);
+	media_pipeline_stop(node->vdev.entity.pads);
 }
 
 /******************** v4l2_ioctl_ops ********************/
diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
index b74f7891711d..20fac40581c6 100644
--- a/drivers/staging/media/omap4iss/iss_video.c
+++ b/drivers/staging/media/omap4iss/iss_video.c
@@ -889,7 +889,7 @@ iss_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 	if (video->iss->pdata->set_constraints)
 		video->iss->pdata->set_constraints(video->iss, true);
 
-	ret = media_pipeline_start(pad->entity, &pipe->pipe);
+	ret = media_pipeline_start(pad, &pipe->pipe);
 	if (ret < 0)
 		goto err_media_pipeline_start;
 
@@ -980,7 +980,7 @@ iss_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 err_omap4iss_set_stream:
 	vb2_streamoff(&vfh->queue, type);
 err_iss_video_check_format:
-	media_pipeline_stop(&video->video.entity);
+	media_pipeline_stop(video->video.entity.pads);
 err_media_pipeline_start:
 	if (video->iss->pdata->set_constraints)
 		video->iss->pdata->set_constraints(video->iss, false);
@@ -1034,7 +1034,7 @@ iss_video_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 
 	if (video->iss->pdata->set_constraints)
 		video->iss->pdata->set_constraints(video->iss, false);
-	media_pipeline_stop(&video->video.entity);
+	media_pipeline_stop(video->video.entity.pads);
 
 done:
 	mutex_unlock(&video->stream_lock);
diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index f10a041e3e6c..d2d7dd0e8624 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -547,7 +547,7 @@ static int tegra210_vi_start_streaming(struct vb2_queue *vq, u32 count)
 		       VI_INCR_SYNCPT_NO_STALL);
 
 	/* start the pipeline */
-	ret = media_pipeline_start(&chan->video.entity, pipe);
+	ret = media_pipeline_start(chan->video.entity.pads, pipe);
 	if (ret < 0)
 		goto error_pipeline_start;
 
@@ -595,7 +595,7 @@ static int tegra210_vi_start_streaming(struct vb2_queue *vq, u32 count)
 error_kthread_start:
 	tegra_channel_set_stream(chan, false);
 error_set_stream:
-	media_pipeline_stop(&chan->video.entity);
+	media_pipeline_stop(chan->video.entity.pads);
 error_pipeline_start:
 	tegra_channel_release_buffers(chan, VB2_BUF_STATE_QUEUED);
 	return ret;
@@ -617,7 +617,7 @@ static void tegra210_vi_stop_streaming(struct vb2_queue *vq)
 
 	tegra_channel_release_buffers(chan, VB2_BUF_STATE_ERROR);
 	tegra_channel_set_stream(chan, false);
-	media_pipeline_stop(&chan->video.entity);
+	media_pipeline_stop(chan->video.entity.pads);
 }
 
 /*
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index c9d97c902d05..516d73a2941e 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -937,53 +937,53 @@ struct media_pad *media_graph_walk_next(struct media_graph *graph);
 
 /**
  * media_pipeline_start - Mark a pipeline as streaming
- * @entity: Starting entity
- * @pipe: Media pipeline to be assigned to all entities in the pipeline.
+ * @pad: Starting pad
+ * @pipe: Media pipeline to be assigned to all pads in the pipeline.
  *
- * Mark all entities connected to a given entity through enabled links, either
- * directly or indirectly, as streaming. The given pipeline object is assigned
- * to every entity in the pipeline and stored in the media_entity pipe field.
+ * Mark all pads connected to a given pad through enabled routes or links,
+ * either directly or indirectly, as streaming. The given pipeline object is
+ * assigned to every pad in the pipeline and stored in the media_pad pipe
+ * field.
  *
  * Calls to this function can be nested, in which case the same number of
  * media_pipeline_stop() calls will be required to stop streaming. The
  * pipeline pointer must be identical for all nested calls to
  * media_pipeline_start().
  */
-__must_check int media_pipeline_start(struct media_entity *entity,
+__must_check int media_pipeline_start(struct media_pad *pad,
 				      struct media_pipeline *pipe);
 /**
  * __media_pipeline_start - Mark a pipeline as streaming
  *
- * @entity: Starting entity
- * @pipe: Media pipeline to be assigned to all entities in the pipeline.
+ * @pad: Starting pad
+ * @pipe: Media pipeline to be assigned to all pads in the pipeline.
  *
  * ..note:: This is the non-locking version of media_pipeline_start()
  */
-__must_check int __media_pipeline_start(struct media_entity *entity,
+__must_check int __media_pipeline_start(struct media_pad *pad,
 					struct media_pipeline *pipe);
 
 /**
  * media_pipeline_stop - Mark a pipeline as not streaming
- * @entity: Starting entity
+ * @pad: Starting pad
  *
- * Mark all entities connected to a given entity through enabled links, either
- * directly or indirectly, as not streaming. The media_entity pipe field is
- * reset to %NULL.
+ * Mark all pads connected to a given pad through enabled routes or links,
+ * either directly or indirectly, as not streaming.
  *
  * If multiple calls to media_pipeline_start() have been made, the same
  * number of calls to this function are required to mark the pipeline as not
- * streaming.
+ * streaming and reset the media_pad pipe field to %NULL.
  */
-void media_pipeline_stop(struct media_entity *entity);
+void media_pipeline_stop(struct media_pad *pad);
 
 /**
  * __media_pipeline_stop - Mark a pipeline as not streaming
  *
- * @entity: Starting entity
+ * @pad: Starting pad
  *
  * .. note:: This is the non-locking version of media_pipeline_stop()
  */
-void __media_pipeline_stop(struct media_entity *entity);
+void __media_pipeline_stop(struct media_pad *pad);
 
 /**
  * media_devnode_create() - creates and initializes a device node interface
-- 
2.25.1

