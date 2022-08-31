Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 168E85A7FCB
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 16:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232111AbiHaOQP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 10:16:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232069AbiHaOPw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 10:15:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5CD811158
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 07:15:00 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6779FD86;
        Wed, 31 Aug 2022 16:14:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661955264;
        bh=+rhsBnfhLyX8a7m+twyoOVXbTE3kRiEzhGGSgKCxF/s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=h/W7m2IeBNDXrIzFTC+N0CIomBUqPwkHkFavf6gee098uKNm2ZwAqh5hCJ5Ie+R+T
         UvGyTY6KzlVvMz076AyEfB1ATWdRc5C9F+vm7umz+dE7L+IyJsX6drjv32B3uEvZIr
         6IJDmXWKHqXRbZ1xlXjHniy2/i/Wfqz9AXYVvPDc=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v14 10/34] media: drivers: use video device pipeline start/stop
Date:   Wed, 31 Aug 2022 17:13:33 +0300
Message-Id: <20220831141357.1396081-11-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
References: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the media drivers to use video device based pipeline start/stop
where possible.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c          |  6 +++---
 drivers/media/platform/qcom/camss/camss-video.c        |  6 +++---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c     |  6 +++---
 drivers/media/platform/renesas/vsp1/vsp1_video.c       |  6 +++---
 .../media/platform/rockchip/rkisp1/rkisp1-capture.c    | 10 +++++-----
 .../media/platform/samsung/exynos4-is/fimc-capture.c   |  9 ++++-----
 .../media/platform/samsung/exynos4-is/fimc-isp-video.c |  9 ++++-----
 drivers/media/platform/samsung/exynos4-is/fimc-lite.c  |  9 ++++-----
 drivers/media/platform/st/stm32/stm32-dcmi.c           |  6 +++---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c     |  6 +++---
 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c   |  6 +++---
 drivers/media/platform/ti/cal/cal-video.c              |  6 +++---
 drivers/media/platform/ti/omap3isp/ispvideo.c          |  6 +++---
 drivers/media/platform/xilinx/xilinx-dma.c             |  6 +++---
 drivers/media/test-drivers/vimc/vimc-capture.c         |  7 +++----
 drivers/staging/media/imx/imx7-media-csi.c             |  6 +++---
 drivers/staging/media/ipu3/ipu3-v4l2.c                 |  6 +++---
 drivers/staging/media/omap4iss/iss_video.c             |  6 +++---
 drivers/staging/media/tegra-video/tegra210.c           |  6 +++---
 19 files changed, 62 insertions(+), 66 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index a3fe547b7fce..390bd5ea3472 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -989,7 +989,7 @@ static int cio2_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
 		return r;
 	}
 
-	r = media_pipeline_start(&q->vdev.entity, &q->pipe);
+	r = video_device_pipeline_start(&q->vdev, &q->pipe);
 	if (r)
 		goto fail_pipeline;
 
@@ -1009,7 +1009,7 @@ static int cio2_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
 fail_csi2_subdev:
 	cio2_hw_exit(cio2, q);
 fail_hw:
-	media_pipeline_stop(&q->vdev.entity);
+	video_device_pipeline_stop(&q->vdev);
 fail_pipeline:
 	dev_dbg(dev, "failed to start streaming (%d)\n", r);
 	cio2_vb2_return_all_buffers(q, VB2_BUF_STATE_QUEUED);
@@ -1030,7 +1030,7 @@ static void cio2_vb2_stop_streaming(struct vb2_queue *vq)
 	cio2_hw_exit(cio2, q);
 	synchronize_irq(cio2->pci_dev->irq);
 	cio2_vb2_return_all_buffers(q, VB2_BUF_STATE_ERROR);
-	media_pipeline_stop(&q->vdev.entity);
+	video_device_pipeline_stop(&q->vdev);
 	pm_runtime_put(dev);
 	cio2->streaming = false;
 }
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 290df04c4d02..81fb3a5bc1d5 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -493,7 +493,7 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct v4l2_subdev *subdev;
 	int ret;
 
-	ret = media_pipeline_start(&vdev->entity, &video->pipe);
+	ret = video_device_pipeline_start(vdev, &video->pipe);
 	if (ret < 0)
 		return ret;
 
@@ -522,7 +522,7 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 	return 0;
 
 error:
-	media_pipeline_stop(&vdev->entity);
+	video_device_pipeline_stop(vdev);
 
 	video->ops->flush_buffers(video, VB2_BUF_STATE_QUEUED);
 
@@ -553,7 +553,7 @@ static void video_stop_streaming(struct vb2_queue *q)
 		v4l2_subdev_call(subdev, video, s_stream, 0);
 	}
 
-	media_pipeline_stop(&vdev->entity);
+	video_device_pipeline_stop(vdev);
 
 	video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
 }
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index e72bc6fa049f..879dd02bbb55 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -1265,7 +1265,7 @@ static int rvin_set_stream(struct rvin_dev *vin, int on)
 	sd = media_entity_to_v4l2_subdev(pad->entity);
 
 	if (!on) {
-		media_pipeline_stop(&vin->vdev.entity);
+		video_device_pipeline_stop(&vin->vdev);
 		return v4l2_subdev_call(sd, video, s_stream, 0);
 	}
 
@@ -1282,7 +1282,7 @@ static int rvin_set_stream(struct rvin_dev *vin, int on)
 	mdev = vin->vdev.entity.graph_obj.mdev;
 	mutex_lock(&mdev->graph_mutex);
 	pipe = media_entity_pipeline(&sd->entity) ? : &vin->vdev.pipe;
-	ret = __media_pipeline_start(&vin->vdev.entity, pipe);
+	ret = __video_device_pipeline_start(&vin->vdev, pipe);
 	mutex_unlock(&mdev->graph_mutex);
 	if (ret)
 		return ret;
@@ -1291,7 +1291,7 @@ static int rvin_set_stream(struct rvin_dev *vin, int on)
 	if (ret == -ENOIOCTLCMD)
 		ret = 0;
 	if (ret)
-		media_pipeline_stop(&vin->vdev.entity);
+		video_device_pipeline_stop(&vin->vdev);
 
 	return ret;
 }
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index e8e0ee5f2277..f8e4ee1c60ab 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -927,7 +927,7 @@ static void vsp1_video_stop_streaming(struct vb2_queue *vq)
 	}
 	mutex_unlock(&pipe->lock);
 
-	media_pipeline_stop(&video->video.entity);
+	video_device_pipeline_stop(&video->video);
 	vsp1_video_release_buffers(video);
 	vsp1_video_pipeline_put(pipe);
 }
@@ -1046,7 +1046,7 @@ vsp1_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 		return PTR_ERR(pipe);
 	}
 
-	ret = __media_pipeline_start(&video->video.entity, &pipe->pipe);
+	ret = __video_device_pipeline_start(&video->video, &pipe->pipe);
 	if (ret < 0) {
 		mutex_unlock(&mdev->graph_mutex);
 		goto err_pipe;
@@ -1070,7 +1070,7 @@ vsp1_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 	return 0;
 
 err_stop:
-	media_pipeline_stop(&video->video.entity);
+	video_device_pipeline_stop(&video->video);
 err_pipe:
 	vsp1_video_pipeline_put(pipe);
 	return ret;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index bf0d4789374c..677b65e273d0 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -913,7 +913,7 @@ static void rkisp1_cap_stream_disable(struct rkisp1_capture *cap)
  *
  * Call s_stream(false) in the reverse order from
  * rkisp1_pipeline_stream_enable() and disable the DMA engine.
- * Should be called before media_pipeline_stop()
+ * Should be called before video_device_pipeline_stop()
  */
 static void rkisp1_pipeline_stream_disable(struct rkisp1_capture *cap)
 	__must_hold(&cap->rkisp1->stream_lock)
@@ -937,7 +937,7 @@ static void rkisp1_pipeline_stream_disable(struct rkisp1_capture *cap)
  * rkisp1_pipeline_stream_enable - enable nodes in the pipeline
  *
  * Enable the DMA Engine and call s_stream(true) through the pipeline.
- * Should be called after media_pipeline_start()
+ * Should be called after video_device_pipeline_start()
  */
 static int rkisp1_pipeline_stream_enable(struct rkisp1_capture *cap)
 	__must_hold(&cap->rkisp1->stream_lock)
@@ -994,7 +994,7 @@ static void rkisp1_vb2_stop_streaming(struct vb2_queue *queue)
 
 	rkisp1_dummy_buf_destroy(cap);
 
-	media_pipeline_stop(&node->vdev.entity);
+	video_device_pipeline_stop(&node->vdev);
 
 	mutex_unlock(&cap->rkisp1->stream_lock);
 }
@@ -1008,7 +1008,7 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 
 	mutex_lock(&cap->rkisp1->stream_lock);
 
-	ret = media_pipeline_start(entity, &cap->rkisp1->pipe);
+	ret = video_device_pipeline_start(&cap->vnode.vdev, &cap->rkisp1->pipe);
 	if (ret) {
 		dev_err(cap->rkisp1->dev, "start pipeline failed %d\n", ret);
 		goto err_ret_buffers;
@@ -1044,7 +1044,7 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 err_destroy_dummy:
 	rkisp1_dummy_buf_destroy(cap);
 err_pipeline_stop:
-	media_pipeline_stop(entity);
+	video_device_pipeline_stop(&cap->vnode.vdev);
 err_ret_buffers:
 	rkisp1_return_all_buffers(cap, VB2_BUF_STATE_QUEUED);
 	mutex_unlock(&cap->rkisp1->stream_lock);
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
index 03638c8f772d..e3b95a2b7e04 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
@@ -524,7 +524,7 @@ static int fimc_capture_release(struct file *file)
 	mutex_lock(&fimc->lock);
 
 	if (close && vc->streaming) {
-		media_pipeline_stop(&vc->ve.vdev.entity);
+		video_device_pipeline_stop(&vc->ve.vdev);
 		vc->streaming = false;
 	}
 
@@ -1176,7 +1176,6 @@ static int fimc_cap_streamon(struct file *file, void *priv,
 {
 	struct fimc_dev *fimc = video_drvdata(file);
 	struct fimc_vid_cap *vc = &fimc->vid_cap;
-	struct media_entity *entity = &vc->ve.vdev.entity;
 	struct fimc_source_info *si = NULL;
 	struct v4l2_subdev *sd;
 	int ret;
@@ -1184,7 +1183,7 @@ static int fimc_cap_streamon(struct file *file, void *priv,
 	if (fimc_capture_active(fimc))
 		return -EBUSY;
 
-	ret = media_pipeline_start(entity, &vc->ve.pipe->mp);
+	ret = video_device_pipeline_start(&vc->ve.vdev, &vc->ve.pipe->mp);
 	if (ret < 0)
 		return ret;
 
@@ -1218,7 +1217,7 @@ static int fimc_cap_streamon(struct file *file, void *priv,
 	}
 
 err_p_stop:
-	media_pipeline_stop(entity);
+	video_device_pipeline_stop(&vc->ve.vdev);
 	return ret;
 }
 
@@ -1234,7 +1233,7 @@ static int fimc_cap_streamoff(struct file *file, void *priv,
 		return ret;
 
 	if (vc->streaming) {
-		media_pipeline_stop(&vc->ve.vdev.entity);
+		video_device_pipeline_stop(&vc->ve.vdev);
 		vc->streaming = false;
 	}
 
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c b/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c
index 8f12240b0eb7..f6a302fa8d37 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c
@@ -312,7 +312,7 @@ static int isp_video_release(struct file *file)
 	is_singular_file = v4l2_fh_is_singular_file(file);
 
 	if (is_singular_file && ivc->streaming) {
-		media_pipeline_stop(entity);
+		video_device_pipeline_stop(&ivc->ve.vdev);
 		ivc->streaming = 0;
 	}
 
@@ -490,10 +490,9 @@ static int isp_video_streamon(struct file *file, void *priv,
 {
 	struct fimc_isp *isp = video_drvdata(file);
 	struct exynos_video_entity *ve = &isp->video_capture.ve;
-	struct media_entity *me = &ve->vdev.entity;
 	int ret;
 
-	ret = media_pipeline_start(me, &ve->pipe->mp);
+	ret = video_device_pipeline_start(&ve->vdev, &ve->pipe->mp);
 	if (ret < 0)
 		return ret;
 
@@ -508,7 +507,7 @@ static int isp_video_streamon(struct file *file, void *priv,
 	isp->video_capture.streaming = 1;
 	return 0;
 p_stop:
-	media_pipeline_stop(me);
+	video_device_pipeline_stop(&ve->vdev);
 	return ret;
 }
 
@@ -523,7 +522,7 @@ static int isp_video_streamoff(struct file *file, void *priv,
 	if (ret < 0)
 		return ret;
 
-	media_pipeline_stop(&video->ve.vdev.entity);
+	video_device_pipeline_stop(&video->ve.vdev);
 	video->streaming = 0;
 	return 0;
 }
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
index 41b0a4a5929a..e185a40305a8 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
@@ -516,7 +516,7 @@ static int fimc_lite_release(struct file *file)
 	if (v4l2_fh_is_singular_file(file) &&
 	    atomic_read(&fimc->out_path) == FIMC_IO_DMA) {
 		if (fimc->streaming) {
-			media_pipeline_stop(entity);
+			video_device_pipeline_stop(&fimc->ve.vdev);
 			fimc->streaming = false;
 		}
 		fimc_lite_stop_capture(fimc, false);
@@ -812,13 +812,12 @@ static int fimc_lite_streamon(struct file *file, void *priv,
 			      enum v4l2_buf_type type)
 {
 	struct fimc_lite *fimc = video_drvdata(file);
-	struct media_entity *entity = &fimc->ve.vdev.entity;
 	int ret;
 
 	if (fimc_lite_active(fimc))
 		return -EBUSY;
 
-	ret = media_pipeline_start(entity, &fimc->ve.pipe->mp);
+	ret = video_device_pipeline_start(&fimc->ve.vdev, &fimc->ve.pipe->mp);
 	if (ret < 0)
 		return ret;
 
@@ -835,7 +834,7 @@ static int fimc_lite_streamon(struct file *file, void *priv,
 	}
 
 err_p_stop:
-	media_pipeline_stop(entity);
+	video_device_pipeline_stop(&fimc->ve.vdev);
 	return 0;
 }
 
@@ -849,7 +848,7 @@ static int fimc_lite_streamoff(struct file *file, void *priv,
 	if (ret < 0)
 		return ret;
 
-	media_pipeline_stop(&fimc->ve.vdev.entity);
+	video_device_pipeline_stop(&fimc->ve.vdev);
 	fimc->streaming = false;
 	return 0;
 }
diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 2ca95ab2b0fe..37458d4d9564 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -751,7 +751,7 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 		goto err_unlocked;
 	}
 
-	ret = media_pipeline_start(&dcmi->vdev->entity, &dcmi->pipeline);
+	ret = video_device_pipeline_start(dcmi->vdev, &dcmi->pipeline);
 	if (ret < 0) {
 		dev_err(dcmi->dev, "%s: Failed to start streaming, media pipeline start error (%d)\n",
 			__func__, ret);
@@ -865,7 +865,7 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	dcmi_pipeline_stop(dcmi);
 
 err_media_pipeline_stop:
-	media_pipeline_stop(&dcmi->vdev->entity);
+	video_device_pipeline_stop(dcmi->vdev);
 
 err_pm_put:
 	pm_runtime_put(dcmi->dev);
@@ -892,7 +892,7 @@ static void dcmi_stop_streaming(struct vb2_queue *vq)
 
 	dcmi_pipeline_stop(dcmi);
 
-	media_pipeline_stop(&dcmi->vdev->entity);
+	video_device_pipeline_stop(dcmi->vdev);
 
 	spin_lock_irq(&dcmi->irqlock);
 
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
index 0912a1b6d525..17ad9a3caaa5 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
@@ -266,7 +266,7 @@ static int sun4i_csi_start_streaming(struct vb2_queue *vq, unsigned int count)
 		goto err_clear_dma_queue;
 	}
 
-	ret = media_pipeline_start(&csi->vdev.entity, &csi->vdev.pipe);
+	ret = video_device_pipeline_start(&csi->vdev, &csi->vdev.pipe);
 	if (ret < 0)
 		goto err_free_scratch_buffer;
 
@@ -330,7 +330,7 @@ static int sun4i_csi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	sun4i_csi_capture_stop(csi);
 
 err_disable_pipeline:
-	media_pipeline_stop(&csi->vdev.entity);
+	video_device_pipeline_stop(&csi->vdev);
 
 err_free_scratch_buffer:
 	dma_free_coherent(csi->dev, csi->scratch.size, csi->scratch.vaddr,
@@ -359,7 +359,7 @@ static void sun4i_csi_stop_streaming(struct vb2_queue *vq)
 	return_all_buffers(csi, VB2_BUF_STATE_ERROR);
 	spin_unlock_irqrestore(&csi->qlock, flags);
 
-	media_pipeline_stop(&csi->vdev.entity);
+	video_device_pipeline_stop(&csi->vdev);
 
 	dma_free_coherent(csi->dev, csi->scratch.size, csi->scratch.vaddr,
 			  csi->scratch.paddr);
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
index 1d46e113d01d..21a6b92494ba 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
@@ -141,7 +141,7 @@ static int sun6i_video_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	video->sequence = 0;
 
-	ret = media_pipeline_start(&video->vdev.entity, &video->vdev.pipe);
+	ret = video_device_pipeline_start(&video->vdev, &video->vdev.pipe);
 	if (ret < 0)
 		goto clear_dma_queue;
 
@@ -207,7 +207,7 @@ static int sun6i_video_start_streaming(struct vb2_queue *vq, unsigned int count)
 stop_csi_stream:
 	sun6i_csi_set_stream(video->csi, false);
 stop_media_pipeline:
-	media_pipeline_stop(&video->vdev.entity);
+	video_device_pipeline_stop(&video->vdev);
 clear_dma_queue:
 	spin_lock_irqsave(&video->dma_queue_lock, flags);
 	list_for_each_entry(buf, &video->dma_queue, list)
@@ -231,7 +231,7 @@ static void sun6i_video_stop_streaming(struct vb2_queue *vq)
 
 	sun6i_csi_set_stream(video->csi, false);
 
-	media_pipeline_stop(&video->vdev.entity);
+	video_device_pipeline_stop(&video->vdev);
 
 	/* Release all active buffers */
 	spin_lock_irqsave(&video->dma_queue_lock, flags);
diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index 776da0cfcdbe..6a57efb0ed91 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -707,7 +707,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	dma_addr_t addr;
 	int ret;
 
-	ret = media_pipeline_start(&ctx->vdev.entity, &ctx->phy->pipe);
+	ret = video_device_pipeline_start(&ctx->vdev, &ctx->phy->pipe);
 	if (ret < 0) {
 		ctx_err(ctx, "Failed to start media pipeline: %d\n", ret);
 		goto error_release_buffers;
@@ -760,7 +760,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	cal_ctx_unprepare(ctx);
 
 error_pipeline:
-	media_pipeline_stop(&ctx->vdev.entity);
+	video_device_pipeline_stop(&ctx->vdev);
 error_release_buffers:
 	cal_release_buffers(ctx, VB2_BUF_STATE_QUEUED);
 
@@ -781,7 +781,7 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 
 	cal_release_buffers(ctx, VB2_BUF_STATE_ERROR);
 
-	media_pipeline_stop(&ctx->vdev.entity);
+	video_device_pipeline_stop(&ctx->vdev);
 }
 
 static const struct vb2_ops cal_video_qops = {
diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index 5746cac4e046..9b352660cbdc 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -1103,7 +1103,7 @@ isp_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 	pipe->l3_ick = clk_get_rate(video->isp->clock[ISP_CLK_L3_ICK]);
 	pipe->max_rate = pipe->l3_ick;
 
-	ret = media_pipeline_start(&video->video.entity, &pipe->pipe);
+	ret = video_device_pipeline_start(&video->video, &pipe->pipe);
 	if (ret < 0)
 		goto err_pipeline_start;
 
@@ -1160,7 +1160,7 @@ isp_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 	return 0;
 
 err_check_format:
-	media_pipeline_stop(&video->video.entity);
+	video_device_pipeline_stop(&video->video);
 err_pipeline_start:
 	/* TODO: Implement PM QoS */
 	/* The DMA queue must be emptied here, otherwise CCDC interrupts that
@@ -1227,7 +1227,7 @@ isp_video_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 	video->error = false;
 
 	/* TODO: Implement PM QoS */
-	media_pipeline_stop(&video->video.entity);
+	video_device_pipeline_stop(&video->video);
 
 	media_entity_enum_cleanup(&pipe->ent_enum);
 
diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
index 3a4d62be0f27..9a177337e934 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -404,7 +404,7 @@ static int xvip_dma_start_streaming(struct vb2_queue *vq, unsigned int count)
 	 */
 	pipe = to_xvip_pipeline(&dma->video.entity) ? : &dma->pipe;
 
-	ret = media_pipeline_start(&dma->video.entity, &pipe->pipe);
+	ret = video_device_pipeline_start(&dma->video, &pipe->pipe);
 	if (ret < 0)
 		goto error;
 
@@ -430,7 +430,7 @@ static int xvip_dma_start_streaming(struct vb2_queue *vq, unsigned int count)
 	return 0;
 
 error_stop:
-	media_pipeline_stop(&dma->video.entity);
+	video_device_pipeline_stop(&dma->video);
 
 error:
 	/* Give back all queued buffers to videobuf2. */
@@ -458,7 +458,7 @@ static void xvip_dma_stop_streaming(struct vb2_queue *vq)
 
 	/* Cleanup the pipeline and mark it as being stopped. */
 	xvip_pipeline_cleanup(pipe);
-	media_pipeline_stop(&dma->video.entity);
+	video_device_pipeline_stop(&dma->video);
 
 	/* Give back all queued buffers to videobuf2. */
 	spin_lock_irq(&dma->queued_lock);
diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index 6c437802f91f..aa944270e716 100644
--- a/drivers/media/test-drivers/vimc/vimc-capture.c
+++ b/drivers/media/test-drivers/vimc/vimc-capture.c
@@ -241,13 +241,12 @@ static void vimc_capture_return_all_buffers(struct vimc_capture_device *vcapture
 static int vimc_capture_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct vimc_capture_device *vcapture = vb2_get_drv_priv(vq);
-	struct media_entity *entity = &vcapture->vdev.entity;
 	int ret;
 
 	vcapture->sequence = 0;
 
 	/* Start the media pipeline */
-	ret = media_pipeline_start(entity, &vcapture->stream.pipe);
+	ret = video_device_pipeline_start(&vcapture->vdev, &vcapture->stream.pipe);
 	if (ret) {
 		vimc_capture_return_all_buffers(vcapture, VB2_BUF_STATE_QUEUED);
 		return ret;
@@ -255,7 +254,7 @@ static int vimc_capture_start_streaming(struct vb2_queue *vq, unsigned int count
 
 	ret = vimc_streamer_s_stream(&vcapture->stream, &vcapture->ved, 1);
 	if (ret) {
-		media_pipeline_stop(entity);
+		video_device_pipeline_stop(&vcapture->vdev);
 		vimc_capture_return_all_buffers(vcapture, VB2_BUF_STATE_QUEUED);
 		return ret;
 	}
@@ -274,7 +273,7 @@ static void vimc_capture_stop_streaming(struct vb2_queue *vq)
 	vimc_streamer_s_stream(&vcapture->stream, &vcapture->ved, 0);
 
 	/* Stop the media pipeline */
-	media_pipeline_stop(&vcapture->vdev.entity);
+	video_device_pipeline_stop(&vcapture->vdev);
 
 	/* Release all active buffers */
 	vimc_capture_return_all_buffers(vcapture, VB2_BUF_STATE_ERROR);
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index a0553c24cce4..45f27a855255 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1360,7 +1360,7 @@ static int imx7_csi_video_start_streaming(struct vb2_queue *vq,
 
 	mutex_lock(&csi->mdev.graph_mutex);
 
-	ret = __media_pipeline_start(&csi->sd.entity, &csi->pipe);
+	ret = __video_device_pipeline_start(csi->vdev, &csi->pipe);
 	if (ret)
 		goto err_unlock;
 
@@ -1373,7 +1373,7 @@ static int imx7_csi_video_start_streaming(struct vb2_queue *vq,
 	return 0;
 
 err_stop:
-	__media_pipeline_stop(&csi->sd.entity);
+	__video_device_pipeline_stop(csi->vdev);
 err_unlock:
 	mutex_unlock(&csi->mdev.graph_mutex);
 	dev_err(csi->dev, "pipeline start failed with %d\n", ret);
@@ -1396,7 +1396,7 @@ static void imx7_csi_video_stop_streaming(struct vb2_queue *vq)
 
 	mutex_lock(&csi->mdev.graph_mutex);
 	v4l2_subdev_call(&csi->sd, video, s_stream, 0);
-	__media_pipeline_stop(&csi->sd.entity);
+	__video_device_pipeline_stop(csi->vdev);
 	mutex_unlock(&csi->mdev.graph_mutex);
 
 	/* release all active buffers */
diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index d1c539cefba8..e06d2012a4ef 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -486,7 +486,7 @@ static int imgu_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
 	pipe = node->pipe;
 	imgu_pipe = &imgu->imgu_pipe[pipe];
 	atomic_set(&node->sequence, 0);
-	r = media_pipeline_start(&node->vdev.entity, &imgu_pipe->pipeline);
+	r = video_device_pipeline_start(&node->vdev, &imgu_pipe->pipeline);
 	if (r < 0)
 		goto fail_return_bufs;
 
@@ -511,7 +511,7 @@ static int imgu_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
 	return 0;
 
 fail_stop_pipeline:
-	media_pipeline_stop(&node->vdev.entity);
+	video_device_pipeline_stop(&node->vdev);
 fail_return_bufs:
 	imgu_return_all_buffers(imgu, node, VB2_BUF_STATE_QUEUED);
 
@@ -551,7 +551,7 @@ static void imgu_vb2_stop_streaming(struct vb2_queue *vq)
 	imgu_return_all_buffers(imgu, node, VB2_BUF_STATE_ERROR);
 	mutex_unlock(&imgu->streaming_lock);
 
-	media_pipeline_stop(&node->vdev.entity);
+	video_device_pipeline_stop(&node->vdev);
 }
 
 /******************** v4l2_ioctl_ops ********************/
diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
index abadaf13c0e1..a0a43dbda16c 100644
--- a/drivers/staging/media/omap4iss/iss_video.c
+++ b/drivers/staging/media/omap4iss/iss_video.c
@@ -886,7 +886,7 @@ iss_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 	if (video->iss->pdata->set_constraints)
 		video->iss->pdata->set_constraints(video->iss, true);
 
-	ret = media_pipeline_start(entity, &pipe->pipe);
+	ret = video_device_pipeline_start(&video->video, &pipe->pipe);
 	if (ret < 0)
 		goto err_media_pipeline_start;
 
@@ -977,7 +977,7 @@ iss_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 err_omap4iss_set_stream:
 	vb2_streamoff(&vfh->queue, type);
 err_iss_video_check_format:
-	media_pipeline_stop(&video->video.entity);
+	video_device_pipeline_stop(&video->video);
 err_media_pipeline_start:
 	if (video->iss->pdata->set_constraints)
 		video->iss->pdata->set_constraints(video->iss, false);
@@ -1031,7 +1031,7 @@ iss_video_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 
 	if (video->iss->pdata->set_constraints)
 		video->iss->pdata->set_constraints(video->iss, false);
-	media_pipeline_stop(&video->video.entity);
+	video_device_pipeline_stop(&video->video);
 
 done:
 	mutex_unlock(&video->stream_lock);
diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index f10a041e3e6c..d58370a84737 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -547,7 +547,7 @@ static int tegra210_vi_start_streaming(struct vb2_queue *vq, u32 count)
 		       VI_INCR_SYNCPT_NO_STALL);
 
 	/* start the pipeline */
-	ret = media_pipeline_start(&chan->video.entity, pipe);
+	ret = video_device_pipeline_start(&chan->video, pipe);
 	if (ret < 0)
 		goto error_pipeline_start;
 
@@ -595,7 +595,7 @@ static int tegra210_vi_start_streaming(struct vb2_queue *vq, u32 count)
 error_kthread_start:
 	tegra_channel_set_stream(chan, false);
 error_set_stream:
-	media_pipeline_stop(&chan->video.entity);
+	video_device_pipeline_stop(&chan->video);
 error_pipeline_start:
 	tegra_channel_release_buffers(chan, VB2_BUF_STATE_QUEUED);
 	return ret;
@@ -617,7 +617,7 @@ static void tegra210_vi_stop_streaming(struct vb2_queue *vq)
 
 	tegra_channel_release_buffers(chan, VB2_BUF_STATE_ERROR);
 	tegra_channel_set_stream(chan, false);
-	media_pipeline_stop(&chan->video.entity);
+	video_device_pipeline_stop(&chan->video);
 }
 
 /*
-- 
2.34.1

