Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF069148F73
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2020 21:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387469AbgAXUle (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jan 2020 15:41:34 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34354 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387395AbgAXUld (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jan 2020 15:41:33 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 1914A2891B8
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2] media: Split v4l2_pipeline_pm_use into v4l2_pipeline_pm_{get, put}
Date:   Fri, 24 Jan 2020 17:35:43 -0300
Message-Id: <20200124203543.22890-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, v4l2_pipeline_pm_use() prototype is:

  int v4l2_pipeline_pm_use(struct media_entity *entity, int use)

Where the 'use' argument shall only be set to '1' for enable/power-on,
or to '0' for disable/power-off. The integer return is specified
as only meaningful when 'use' is set to '1'.

Let's enforce this semantic by splitting the function in two:
v4l2_pipeline_pm_get and v4l2_pipeline_pm_put. This is done
for several reasons.

It makes the API easier to use (or harder to misuse).
It removes the constraint on the values the 'use' argument
shall take. Also, it removes the need to constraint
the return value, by making v4l2_pipeline_pm_put void return.

And last, it's more consistent with other kernel APIs, such
as the runtime pm APIs, which makes the code more symmetric.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
v2:
* Also change recently merged rkisp1.

 Documentation/media/kapi/csi2.rst             |  2 +-
 drivers/media/platform/omap3isp/ispvideo.c    |  4 +-
 .../media/platform/qcom/camss/camss-video.c   |  4 +-
 drivers/media/platform/rcar-vin/rcar-v4l2.c   |  6 +--
 .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |  6 +--
 .../platform/sunxi/sun6i-csi/sun6i_video.c    |  4 +-
 drivers/media/v4l2-core/v4l2-mc.c             | 18 +++++++--
 drivers/staging/media/imx/imx-media-capture.c |  4 +-
 drivers/staging/media/omap4iss/iss_video.c    |  4 +-
 drivers/staging/media/rkisp1/rkisp1-capture.c |  9 ++---
 include/media/v4l2-mc.h                       | 40 ++++++++++++-------
 11 files changed, 60 insertions(+), 41 deletions(-)

diff --git a/Documentation/media/kapi/csi2.rst b/Documentation/media/kapi/csi2.rst
index 030a5c41ec75..e111ff7bfd3d 100644
--- a/Documentation/media/kapi/csi2.rst
+++ b/Documentation/media/kapi/csi2.rst
@@ -74,7 +74,7 @@ Before the receiver driver may enable the CSI-2 transmitter by using
 the :c:type:`v4l2_subdev_video_ops`->s_stream(), it must have powered
 the transmitter up by using the
 :c:type:`v4l2_subdev_core_ops`->s_power() callback. This may take
-place either indirectly by using :c:func:`v4l2_pipeline_pm_use` or
+place either indirectly by using :c:func:`v4l2_pipeline_pm_get` or
 directly.
 
 Formats
diff --git a/drivers/media/platform/omap3isp/ispvideo.c b/drivers/media/platform/omap3isp/ispvideo.c
index ee183c35ff3b..16efd18f1e88 100644
--- a/drivers/media/platform/omap3isp/ispvideo.c
+++ b/drivers/media/platform/omap3isp/ispvideo.c
@@ -1311,7 +1311,7 @@ static int isp_video_open(struct file *file)
 		goto done;
 	}
 
-	ret = v4l2_pipeline_pm_use(&video->video.entity, 1);
+	ret = v4l2_pipeline_pm_get(&video->video.entity);
 	if (ret < 0) {
 		omap3isp_put(video->isp);
 		goto done;
@@ -1363,7 +1363,7 @@ static int isp_video_release(struct file *file)
 	vb2_queue_release(&handle->queue);
 	mutex_unlock(&video->queue_lock);
 
-	v4l2_pipeline_pm_use(&video->video.entity, 0);
+	v4l2_pipeline_pm_put(&video->video.entity);
 
 	/* Release the file handle. */
 	v4l2_fh_del(vfh);
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 1d50dfbbb762..a019dbab5e04 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -745,7 +745,7 @@ static int video_open(struct file *file)
 
 	file->private_data = vfh;
 
-	ret = v4l2_pipeline_pm_use(&vdev->entity, 1);
+	ret = v4l2_pipeline_pm_get(&vdev->entity);
 	if (ret < 0) {
 		dev_err(video->camss->dev, "Failed to power up pipeline: %d\n",
 			ret);
@@ -771,7 +771,7 @@ static int video_release(struct file *file)
 
 	vb2_fop_release(file);
 
-	v4l2_pipeline_pm_use(&vdev->entity, 0);
+	v4l2_pipeline_pm_put(&vdev->entity);
 
 	file->private_data = NULL;
 
diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 5ff565e76bca..cae1bf3a778c 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -826,7 +826,7 @@ static int rvin_open(struct file *file)
 		goto err_unlock;
 
 	if (vin->info->use_mc)
-		ret = v4l2_pipeline_pm_use(&vin->vdev.entity, 1);
+		ret = v4l2_pipeline_pm_get(&vin->vdev.entity);
 	else if (v4l2_fh_is_singular_file(file))
 		ret = rvin_power_parallel(vin, true);
 
@@ -842,7 +842,7 @@ static int rvin_open(struct file *file)
 	return 0;
 err_power:
 	if (vin->info->use_mc)
-		v4l2_pipeline_pm_use(&vin->vdev.entity, 0);
+		v4l2_pipeline_pm_put(&vin->vdev.entity);
 	else if (v4l2_fh_is_singular_file(file))
 		rvin_power_parallel(vin, false);
 err_open:
@@ -870,7 +870,7 @@ static int rvin_release(struct file *file)
 	ret = _vb2_fop_release(file, NULL);
 
 	if (vin->info->use_mc) {
-		v4l2_pipeline_pm_use(&vin->vdev.entity, 0);
+		v4l2_pipeline_pm_put(&vin->vdev.entity);
 	} else {
 		if (fh_singular)
 			rvin_power_parallel(vin, false);
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
index 83a3a0257c7b..8dfc2877d4c6 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
@@ -214,7 +214,7 @@ static int sun4i_csi_open(struct file *file)
 	if (ret < 0)
 		goto err_pm_put;
 
-	ret = v4l2_pipeline_pm_use(&csi->vdev.entity, 1);
+	ret = v4l2_pipeline_pm_get(&csi->vdev.entity);
 	if (ret)
 		goto err_pm_put;
 
@@ -227,7 +227,7 @@ static int sun4i_csi_open(struct file *file)
 	return 0;
 
 err_pipeline_pm_put:
-	v4l2_pipeline_pm_use(&csi->vdev.entity, 0);
+	v4l2_pipeline_pm_put(&csi->vdev.entity);
 
 err_pm_put:
 	pm_runtime_put(csi->dev);
@@ -243,7 +243,7 @@ static int sun4i_csi_release(struct file *file)
 	mutex_lock(&csi->lock);
 
 	v4l2_fh_release(file);
-	v4l2_pipeline_pm_use(&csi->vdev.entity, 0);
+	v4l2_pipeline_pm_put(&csi->vdev.entity);
 	pm_runtime_put(csi->dev);
 
 	mutex_unlock(&csi->lock);
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
index f0dfe68486d1..3d619ad08c9f 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
@@ -474,7 +474,7 @@ static int sun6i_video_open(struct file *file)
 	if (ret < 0)
 		goto unlock;
 
-	ret = v4l2_pipeline_pm_use(&video->vdev.entity, 1);
+	ret = v4l2_pipeline_pm_get(&video->vdev.entity);
 	if (ret < 0)
 		goto fh_release;
 
@@ -507,7 +507,7 @@ static int sun6i_video_close(struct file *file)
 
 	_vb2_fop_release(file, NULL);
 
-	v4l2_pipeline_pm_use(&video->vdev.entity, 0);
+	v4l2_pipeline_pm_put(&video->vdev.entity);
 
 	if (last_fh)
 		sun6i_csi_set_power(video->csi, false);
diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
index 014a2a97cadd..0fffdd3ce6a4 100644
--- a/drivers/media/v4l2-core/v4l2-mc.c
+++ b/drivers/media/v4l2-core/v4l2-mc.c
@@ -321,7 +321,7 @@ EXPORT_SYMBOL_GPL(v4l_vb2q_enable_media_source);
  * use_count field stores the total number of users of all video device nodes
  * in the pipeline.
  *
- * The v4l2_pipeline_pm_use() function must be called in the open() and
+ * The v4l2_pipeline_pm_{get, put}() functions must be called in the open() and
  * close() handlers of video device nodes. It increments or decrements the use
  * count of all subdev entities in the pipeline.
  *
@@ -423,7 +423,7 @@ static int pipeline_pm_power(struct media_entity *entity, int change,
 	return ret;
 }
 
-int v4l2_pipeline_pm_use(struct media_entity *entity, int use)
+static int v4l2_pipeline_pm_use(struct media_entity *entity, unsigned int use)
 {
 	struct media_device *mdev = entity->graph_obj.mdev;
 	int change = use ? 1 : -1;
@@ -444,7 +444,19 @@ int v4l2_pipeline_pm_use(struct media_entity *entity, int use)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(v4l2_pipeline_pm_use);
+
+int v4l2_pipeline_pm_get(struct media_entity *entity)
+{
+	return v4l2_pipeline_pm_use(entity, 1);
+}
+EXPORT_SYMBOL_GPL(v4l2_pipeline_pm_get);
+
+void v4l2_pipeline_pm_put(struct media_entity *entity)
+{
+	/* Powering off entities shouldn't fail. */
+	WARN_ON(v4l2_pipeline_pm_use(entity, 0));
+}
+EXPORT_SYMBOL_GPL(v4l2_pipeline_pm_put);
 
 int v4l2_pipeline_link_notify(struct media_link *link, u32 flags,
 			      unsigned int notification)
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 7712e7be8625..8aac4a3df7ca 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -643,7 +643,7 @@ static int capture_open(struct file *file)
 	if (ret)
 		v4l2_err(priv->src_sd, "v4l2_fh_open failed\n");
 
-	ret = v4l2_pipeline_pm_use(&vfd->entity, 1);
+	ret = v4l2_pipeline_pm_get(&vfd->entity);
 	if (ret)
 		v4l2_fh_release(file);
 
@@ -664,7 +664,7 @@ static int capture_release(struct file *file)
 		vq->owner = NULL;
 	}
 
-	v4l2_pipeline_pm_use(&vfd->entity, 0);
+	v4l2_pipeline_pm_put(&vfd->entity);
 
 	v4l2_fh_release(file);
 	mutex_unlock(&priv->mutex);
diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
index 673aa3a5f2bd..9578b8d22f25 100644
--- a/drivers/staging/media/omap4iss/iss_video.c
+++ b/drivers/staging/media/omap4iss/iss_video.c
@@ -1111,7 +1111,7 @@ static int iss_video_open(struct file *file)
 		goto done;
 	}
 
-	ret = v4l2_pipeline_pm_use(&video->video.entity, 1);
+	ret = v4l2_pipeline_pm_get(&video->video.entity);
 	if (ret < 0) {
 		omap4iss_put(video->iss);
 		goto done;
@@ -1160,7 +1160,7 @@ static int iss_video_release(struct file *file)
 	/* Disable streaming and free the buffers queue resources. */
 	iss_video_streamoff(file, vfh, video->type);
 
-	v4l2_pipeline_pm_use(&video->video.entity, 0);
+	v4l2_pipeline_pm_put(&video->video.entity);
 
 	/* Release the videobuf2 queue */
 	vb2_queue_release(&handle->queue);
diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index 524e0dd38c1b..16424e97c2e0 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -937,10 +937,7 @@ static void rkisp1_vb2_stop_streaming(struct vb2_queue *queue)
 
 	rkisp1_return_all_buffers(cap, VB2_BUF_STATE_ERROR);
 
-	ret = v4l2_pipeline_pm_use(&node->vdev.entity, 0);
-	if (ret)
-		dev_err(rkisp1->dev, "pipeline close failed error:%d\n", ret);
-
+	v4l2_pipeline_pm_put(&node->vdev.entity);
 	ret = pm_runtime_put(rkisp1->dev);
 	if (ret)
 		dev_err(rkisp1->dev, "power down failed error:%d\n", ret);
@@ -999,7 +996,7 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 		dev_err(cap->rkisp1->dev, "power up failed %d\n", ret);
 		goto err_destroy_dummy;
 	}
-	ret = v4l2_pipeline_pm_use(entity, 1);
+	ret = v4l2_pipeline_pm_get(entity);
 	if (ret) {
 		dev_err(cap->rkisp1->dev, "open cif pipeline failed %d\n", ret);
 		goto err_pipe_pm_put;
@@ -1025,7 +1022,7 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 	rkisp1_pipeline_sink_walk(entity, NULL, rkisp1_pipeline_disable_cb);
 err_stop_stream:
 	rkisp1_stream_stop(cap);
-	v4l2_pipeline_pm_use(entity, 0);
+	v4l2_pipeline_pm_put(entity);
 err_pipe_pm_put:
 	pm_runtime_put(cap->rkisp1->dev);
 err_destroy_dummy:
diff --git a/include/media/v4l2-mc.h b/include/media/v4l2-mc.h
index 384960249f01..5e73eb8e28f6 100644
--- a/include/media/v4l2-mc.h
+++ b/include/media/v4l2-mc.h
@@ -86,23 +86,30 @@ int v4l_vb2q_enable_media_source(struct vb2_queue *q);
 
 
 /**
- * v4l2_pipeline_pm_use - Update the use count of an entity
- * @entity: The entity
- * @use: Use (1) or stop using (0) the entity
+ * v4l2_pipeline_pm_get - Increase the use count of a pipeline
+ * @entity: The root entity of a pipeline
  *
- * Update the use count of all entities in the pipeline and power entities on or
- * off accordingly.
+ * Update the use count of all entities in the pipeline and power entities on.
  *
- * This function is intended to be called in video node open (use ==
- * 1) and release (use == 0). It uses struct media_entity.use_count to
- * track the power status. The use of this function should be paired
- * with v4l2_pipeline_link_notify().
+ * This function is intended to be called in video node open. It uses
+ * struct media_entity.use_count to track the power status. The use
+ * of this function should be paired with v4l2_pipeline_link_notify().
  *
- * Return 0 on success or a negative error code on failure. Powering entities
- * off is assumed to never fail. No failure can occur when the use parameter is
- * set to 0.
+ * Return 0 on success or a negative error code on failure.
  */
-int v4l2_pipeline_pm_use(struct media_entity *entity, int use);
+int v4l2_pipeline_pm_get(struct media_entity *entity);
+
+/**
+ * v4l2_pipeline_pm_put - Decrease the use count of a pipeline
+ * @entity: The root entity of a pipeline
+ *
+ * Update the use count of all entities in the pipeline and power entities off.
+ *
+ * This function is intended to be called in video node release. It uses
+ * struct media_entity.use_count to track the power status. The use
+ * of this function should be paired with v4l2_pipeline_link_notify().
+ */
+void v4l2_pipeline_pm_put(struct media_entity *entity);
 
 
 /**
@@ -114,7 +121,7 @@ int v4l2_pipeline_pm_use(struct media_entity *entity, int use);
  * React to link management on powered pipelines by updating the use count of
  * all entities in the source and sink sides of the link. Entities are powered
  * on or off accordingly. The use of this function should be paired
- * with v4l2_pipeline_pm_use().
+ * with v4l2_pipeline_pm_{get,put}().
  *
  * Return 0 on success or a negative error code on failure. Powering entities
  * off is assumed to never fail. This function will not fail for disconnection
@@ -144,11 +151,14 @@ static inline int v4l_vb2q_enable_media_source(struct vb2_queue *q)
 	return 0;
 }
 
-static inline int v4l2_pipeline_pm_use(struct media_entity *entity, int use)
+static inline int v4l2_pipeline_pm_get(struct media_entity *entity)
 {
 	return 0;
 }
 
+static inline void v4l2_pipeline_pm_put(struct media_entity *entity)
+{}
+
 static inline int v4l2_pipeline_link_notify(struct media_link *link, u32 flags,
 					    unsigned int notification)
 {
-- 
2.25.0

