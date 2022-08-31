Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 841015A7FD4
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 16:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232230AbiHaOQX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 10:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232125AbiHaOPz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 10:15:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 234AA2CDF7
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 07:15:13 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ADDCA18EE;
        Wed, 31 Aug 2022 16:14:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661955269;
        bh=BshlsMubcboy/ab4w++mPkKnYB3yxoO9q0kSxq+NVEo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=T8OL4z8JMAZPfyr8Tc7kkvH14CNpZdh3dKKYQN7j18RSxEUxWnbSzKJlDz6GWEqUY
         2n/cKLqEyZ6vUEAT3FwTtaMeE89MJKzstM+RiepB4ALpO9fyHJ3DH91Sufy/1L3cGx
         WmL/QKLvLw0hK5EszBfpwhxxar4ASZHVCUWcWKr8=
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
Subject: [PATCH v14 16/34] media: mc: convert pipeline funcs to take media_pad
Date:   Wed, 31 Aug 2022 17:13:39 +0300
Message-Id: <20220831141357.1396081-17-tomi.valkeinen@ideasonboard.com>
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

Now that the pipeline is stored into pads instead of entities, we can
change the relevant functions to take pads instead of entities.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c                  | 40 ++++++++-----------
 .../samsung/s3c-camif/camif-capture.c         |  6 +--
 drivers/media/usb/au0828/au0828-core.c        |  8 ++--
 drivers/media/v4l2-core/v4l2-dev.c            | 12 +++---
 drivers/staging/media/imx/imx-media-utils.c   |  8 ++--
 include/media/media-entity.h                  | 34 ++++++++--------
 include/media/v4l2-dev.h                      |  4 +-
 7 files changed, 52 insertions(+), 60 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 831076b36847..b8bcbc734eaf 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -700,29 +700,21 @@ static int media_pipeline_populate(struct media_pipeline *pipe,
 	return ret;
 }
 
-__must_check int __media_pipeline_start(struct media_entity *entity,
+__must_check int __media_pipeline_start(struct media_pad *pad,
 					struct media_pipeline *pipe)
 {
-	struct media_device *mdev = entity->graph_obj.mdev;
+	struct media_device *mdev = pad->entity->graph_obj.mdev;
 	struct media_pipeline_pad *err_ppad;
 	struct media_pipeline_pad *ppad;
 	int ret;
 
 	lockdep_assert_held(&mdev->graph_mutex);
 
-	/*
-	 * media_pipeline_start(entity) only makes sense with entities that have
-	 * a single pad.
-	 */
-
-	if (WARN_ON(entity->num_pads != 1))
-		return -EINVAL;
-
 	/*
 	 * If the entity is already part of a pipeline, that pipeline must
 	 * be the same as the pipe given to media_pipeline_start().
 	 */
-	if (WARN_ON(entity->pads->pipe && entity->pads->pipe != pipe))
+	if (WARN_ON(pad->pipe && pad->pipe != pipe))
 		return -EINVAL;
 
 	/*
@@ -739,7 +731,7 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
 	 * with media_pipeline_pad instances for each pad found during graph
 	 * walk.
 	 */
-	ret = media_pipeline_populate(pipe, entity->pads);
+	ret = media_pipeline_populate(pipe, pad);
 	if (ret)
 		return ret;
 
@@ -856,22 +848,22 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
 }
 EXPORT_SYMBOL_GPL(__media_pipeline_start);
 
-__must_check int media_pipeline_start(struct media_entity *entity,
+__must_check int media_pipeline_start(struct media_pad *pad,
 				      struct media_pipeline *pipe)
 {
-	struct media_device *mdev = entity->graph_obj.mdev;
+	struct media_device *mdev = pad->entity->graph_obj.mdev;
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
 	struct media_pipeline_pad *ppad;
 
 	/*
@@ -894,19 +886,19 @@ void __media_pipeline_stop(struct media_entity *entity)
 }
 EXPORT_SYMBOL_GPL(__media_pipeline_stop);
 
-void media_pipeline_stop(struct media_entity *entity)
+void media_pipeline_stop(struct media_pad *pad)
 {
-	struct media_device *mdev = entity->graph_obj.mdev;
+	struct media_device *mdev = pad->entity->graph_obj.mdev;
 
 	mutex_lock(&mdev->graph_mutex);
-	__media_pipeline_stop(entity);
+	__media_pipeline_stop(pad);
 	mutex_unlock(&mdev->graph_mutex);
 }
 EXPORT_SYMBOL_GPL(media_pipeline_stop);
 
-__must_check int media_pipeline_alloc_start(struct media_entity *entity)
+__must_check int media_pipeline_alloc_start(struct media_pad *pad)
 {
-	struct media_device *mdev = entity->graph_obj.mdev;
+	struct media_device *mdev = pad->entity->graph_obj.mdev;
 	struct media_pipeline *new_pipe = NULL;
 	struct media_pipeline *pipe;
 	int ret;
@@ -917,7 +909,7 @@ __must_check int media_pipeline_alloc_start(struct media_entity *entity)
 	 * Is the entity already part of a pipeline? If not, we need to allocate
 	 * a pipe.
 	 */
-	pipe = media_entity_pipeline(entity);
+	pipe = media_pad_pipeline(pad);
 	if (!pipe) {
 		new_pipe = kzalloc(sizeof(*new_pipe), GFP_KERNEL);
 		if (!new_pipe) {
@@ -929,7 +921,7 @@ __must_check int media_pipeline_alloc_start(struct media_entity *entity)
 		pipe->allocated = true;
 	}
 
-	ret = __media_pipeline_start(entity, pipe);
+	ret = __media_pipeline_start(pad, pipe);
 	if (ret)
 		kfree(new_pipe);
 
diff --git a/drivers/media/platform/samsung/s3c-camif/camif-capture.c b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
index c2d8f1e425d8..db106ebdf870 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-capture.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
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
 
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 945bb867a4c1..397d553177fa 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1105,7 +1105,7 @@ __must_check int video_device_pipeline_start(struct video_device *vdev,
 	if (entity->num_pads != 1)
 		return -ENODEV;
 
-	return media_pipeline_start(entity, pipe);
+	return media_pipeline_start(&entity->pads[0], pipe);
 }
 EXPORT_SYMBOL_GPL(video_device_pipeline_start);
 
@@ -1117,7 +1117,7 @@ __must_check int __video_device_pipeline_start(struct video_device *vdev,
 	if (entity->num_pads != 1)
 		return -ENODEV;
 
-	return __media_pipeline_start(entity, pipe);
+	return __media_pipeline_start(&entity->pads[0], pipe);
 }
 EXPORT_SYMBOL_GPL(__video_device_pipeline_start);
 
@@ -1128,7 +1128,7 @@ void video_device_pipeline_stop(struct video_device *vdev)
 	if (WARN_ON(entity->num_pads != 1))
 		return;
 
-	return media_pipeline_stop(entity);
+	return media_pipeline_stop(&entity->pads[0]);
 }
 EXPORT_SYMBOL_GPL(video_device_pipeline_stop);
 
@@ -1139,7 +1139,7 @@ void __video_device_pipeline_stop(struct video_device *vdev)
 	if (WARN_ON(entity->num_pads != 1))
 		return;
 
-	return __media_pipeline_stop(entity);
+	return __media_pipeline_stop(&entity->pads[0]);
 }
 EXPORT_SYMBOL_GPL(__video_device_pipeline_stop);
 
@@ -1150,7 +1150,7 @@ __must_check int video_device_pipeline_alloc_start(struct video_device *vdev)
 	if (entity->num_pads != 1)
 		return -ENODEV;
 
-	return media_pipeline_alloc_start(entity);
+	return media_pipeline_alloc_start(&entity->pads[0]);
 }
 EXPORT_SYMBOL_GPL(video_device_pipeline_alloc_start);
 
@@ -1161,7 +1161,7 @@ struct media_pipeline *video_device_pipeline(struct video_device *vdev)
 	if (WARN_ON(entity->num_pads != 1))
 		return NULL;
 
-	return media_entity_pipeline(entity);
+	return media_pad_pipeline(&entity->pads[0]);
 }
 EXPORT_SYMBOL_GPL(video_device_pipeline);
 
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index e9a3c6d2c66f..3e7462112649 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -863,16 +863,16 @@ int imx_media_pipeline_set_stream(struct imx_media_dev *imxmd,
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
-		if (media_entity_pipeline(entity))
-			__media_pipeline_stop(entity);
+		if (media_pad_pipeline(entity->pads))
+			__media_pipeline_stop(entity->pads);
 	}
 
 out:
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 8e9fd309aa65..28c9de8a1f34 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -1115,66 +1115,66 @@ struct media_entity *media_graph_walk_next(struct media_graph *graph);
 
 /**
  * media_pipeline_start - Mark a pipeline as streaming
- * @entity: Starting entity
- * @pipe: Media pipeline to be assigned to all entities in the pipeline.
+ * @pad: Starting pad
+ * @pipe: Media pipeline to be assigned to all pads in the pipeline.
  *
- * Mark all entities connected to a given entity through enabled links, either
+ * Mark all pads connected to a given pad through enabled links, either
  * directly or indirectly, as streaming. The given pipeline object is assigned
- * to every entity in the pipeline and stored in the media_entity pipe field.
+ * to every pad in the pipeline and stored in the media_pad pipe field.
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
+ * Mark all pads connected to a given pads through enabled links, either
+ * directly or indirectly, as not streaming. The media_pad pipe field is
  * reset to %NULL.
  *
  * If multiple calls to media_pipeline_start() have been made, the same
  * number of calls to this function are required to mark the pipeline as not
  * streaming.
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
  * media_pipeline_alloc_start - Mark a pipeline as streaming
- * @entity: Starting entity
+ * @pad: Starting pad
  *
  * media_pipeline_alloc_start() is similar to media_pipeline_start() but instead
  * of working on a given pipeline the function will use an existing pipeline if
- * the entity is already part of a pipeline, or allocate a new pipeline.
+ * the pad is already part of a pipeline, or allocate a new pipeline.
  *
  * Calls to media_pipeline_alloc_start() must be matched with
  * media_pipeline_stop().
  */
-__must_check int media_pipeline_alloc_start(struct media_entity *entity);
+__must_check int media_pipeline_alloc_start(struct media_pad *pad);
 
 /**
  * media_devnode_create() - creates and initializes a device node interface
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 643da0740ab0..e0a13505f88d 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -548,7 +548,7 @@ static inline int video_is_registered(struct video_device *vdev)
  *
  * Mark all entities connected to a given video device through enabled links,
  * either directly or indirectly, as streaming. The given pipeline object is
- * assigned to every entity in the pipeline and stored in the media_entity pipe
+ * assigned to every pad in the pipeline and stored in the media_pad pipe
  * field.
  *
  * Calls to this function can be nested, in which case the same number of
@@ -582,7 +582,7 @@ __must_check int __video_device_pipeline_start(struct video_device *vdev,
  * @vdev: Starting video device
  *
  * Mark all entities connected to a given video device through enabled links,
- * either directly or indirectly, as not streaming. The media_entity pipe field
+ * either directly or indirectly, as not streaming. The media_pad pipe field
  * is reset to %NULL.
  *
  * If multiple calls to media_pipeline_start() have been made, the same
-- 
2.34.1

