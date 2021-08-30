Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 597133FB43D
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 13:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236471AbhH3LD0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 07:03:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43936 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236438AbhH3LDX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 07:03:23 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4C2DBBB0;
        Mon, 30 Aug 2021 13:02:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630321342;
        bh=21acosLBBzJ12iVmNqt3LLlMgHX9qPkmyp3yuIQ7dNs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=T3cMVgrR280wcGJj6vO1VQ2//DiELtihMdHnFDBsDe1JGlnTk6NhRABOU7wwMqLAQ
         A9dfoPcCGB6VfH/Mzk4l9oysHnWZ9FEXluIBtPFY69ninO2sTWqa5q6/ZycpnZIQON
         6bpvQ7AlDIRbLjHNT6zCxtil9S5GlJCl7YYyXNo0=
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
Subject: [PATCH v8 13/36] media: entity: Move the pipeline from entity to pads
Date:   Mon, 30 Aug 2021 14:00:53 +0300
Message-Id: <20210830110116.488338-14-tomi.valkeinen@ideasonboard.com>
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

This moves the pipe and stream_count fields from struct media_entity to
struct media_pad. Effectively streams become pad-specific rather than
being entity specific, allowing several independent streams to traverse a
single entity and an entity to be part of several streams.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

- Update documentation to use 'pads'
- Use the media pad iterator in media_entity.c
- Update rcar-dma.c to use the new per-pad stream count
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

- Fix cleanup in the error path of __media_pipeline_start()
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c                  | 68 +++++++++++--------
 drivers/media/platform/exynos4-is/fimc-isp.c  |  2 +-
 drivers/media/platform/exynos4-is/fimc-lite.c |  2 +-
 drivers/media/platform/omap3isp/isp.c         |  2 +-
 drivers/media/platform/omap3isp/ispvideo.c    |  2 +-
 drivers/media/platform/omap3isp/ispvideo.h    |  2 +-
 drivers/media/platform/rcar-vin/rcar-core.c   | 16 +++--
 drivers/media/platform/rcar-vin/rcar-dma.c    |  2 +-
 drivers/media/platform/xilinx/xilinx-dma.c    |  2 +-
 drivers/media/platform/xilinx/xilinx-dma.h    |  2 +-
 drivers/staging/media/imx/imx-media-utils.c   |  2 +-
 drivers/staging/media/omap4iss/iss.c          |  2 +-
 drivers/staging/media/omap4iss/iss_video.c    |  2 +-
 drivers/staging/media/omap4iss/iss_video.h    |  2 +-
 include/media/media-entity.h                  | 21 +++---
 15 files changed, 74 insertions(+), 55 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 2b438c481812..8ad4cb845f4a 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -424,24 +424,30 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
 
 	while ((pad = media_graph_walk_next(graph))) {
 		struct media_entity *entity = pad->entity;
+		bool skip_validation = pad->pipe != NULL;
+		struct media_pad *iter;
 
 		DECLARE_BITMAP(active, MEDIA_ENTITY_MAX_PADS);
 		DECLARE_BITMAP(has_no_links, MEDIA_ENTITY_MAX_PADS);
 
-		entity->stream_count++;
+		ret = 0;
 
-		if (entity->pipe && entity->pipe != pipe) {
-			pr_err("Pipe active for %s. Can't start for %s\n",
-				entity->name,
-				pad_err->entity->name);
-			ret = -EBUSY;
-			goto error;
+		media_entity_for_each_pad(entity, iter) {
+			if (iter->pipe && iter->pipe != pipe) {
+				pr_err("Pipe active for %s. Can't start for %s\n",
+				       entity->name, iter->entity->name);
+				ret = -EBUSY;
+			} else {
+				iter->pipe = pipe;
+			}
+			iter->stream_count++;
 		}
 
-		entity->pipe = pipe;
+		if (ret)
+			goto error;
 
-		/* Already streaming --- no need to check. */
-		if (entity->stream_count > 1)
+		/* Already part of the pipeline, skip validation. */
+		if (skip_validation)
 			continue;
 
 		if (!entity->ops || !entity->ops->link_validate)
@@ -510,20 +516,23 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
 	media_graph_walk_start(graph, pad_err);
 
 	while ((pad_err = media_graph_walk_next(graph))) {
-		struct media_entity *entity_err = pad_err->entity;
-
-		/* Sanity check for negative stream_count */
-		if (!WARN_ON_ONCE(entity_err->stream_count <= 0)) {
-			entity_err->stream_count--;
-			if (entity_err->stream_count == 0)
-				entity_err->pipe = NULL;
+		struct media_entity *entity = pad_err->entity;
+		struct media_pad *iter;
+
+		media_entity_for_each_pad(entity, iter) {
+			/* Sanity check for negative stream_count */
+			if (!WARN_ON_ONCE(iter->stream_count <= 0)) {
+				--iter->stream_count;
+				if (iter->stream_count == 0)
+					iter->pipe = NULL;
+			}
 		}
 
 		/*
 		 * We haven't increased stream_count further than this
 		 * so we quit here.
 		 */
-		if (pad_err == pad)
+		if (pad_err->entity == pad->entity)
 			break;
 	}
 
@@ -550,7 +559,7 @@ EXPORT_SYMBOL_GPL(media_pipeline_start);
 
 void __media_pipeline_stop(struct media_entity *entity)
 {
-	struct media_pipeline *pipe = entity->pipe;
+	struct media_pipeline *pipe = entity->pads->pipe;
 	struct media_graph *graph = &pipe->graph;
 	struct media_pad *pad;
 
@@ -565,12 +574,15 @@ void __media_pipeline_stop(struct media_entity *entity)
 
 	while ((pad = media_graph_walk_next(graph))) {
 		struct media_entity *entity = pad->entity;
-
-		/* Sanity check for negative stream_count */
-		if (!WARN_ON_ONCE(entity->stream_count <= 0)) {
-			entity->stream_count--;
-			if (entity->stream_count == 0)
-				entity->pipe = NULL;
+		struct media_pad *iter;
+
+		media_entity_for_each_pad(entity, iter) {
+			/* Sanity check for negative stream_count */
+			if (!WARN_ON_ONCE(iter->stream_count <= 0)) {
+				iter->stream_count--;
+				if (iter->stream_count == 0)
+					iter->pipe = NULL;
+			}
 		}
 	}
 
@@ -840,7 +852,7 @@ int __media_entity_setup_link(struct media_link *link, u32 flags)
 {
 	const u32 mask = MEDIA_LNK_FL_ENABLED;
 	struct media_device *mdev;
-	struct media_entity *source, *sink;
+	struct media_pad *source, *sink;
 	int ret = -EBUSY;
 
 	if (link == NULL)
@@ -856,8 +868,8 @@ int __media_entity_setup_link(struct media_link *link, u32 flags)
 	if (link->flags == flags)
 		return 0;
 
-	source = link->source->entity;
-	sink = link->sink->entity;
+	source = link->source;
+	sink = link->sink;
 
 	if (!(link->flags & MEDIA_LNK_FL_DYNAMIC) &&
 	    (source->stream_count || sink->stream_count))
diff --git a/drivers/media/platform/exynos4-is/fimc-isp.c b/drivers/media/platform/exynos4-is/fimc-isp.c
index 855235bea46d..80274e29ccc5 100644
--- a/drivers/media/platform/exynos4-is/fimc-isp.c
+++ b/drivers/media/platform/exynos4-is/fimc-isp.c
@@ -226,7 +226,7 @@ static int fimc_isp_subdev_set_fmt(struct v4l2_subdev *sd,
 			}
 		}
 	} else {
-		if (sd->entity.stream_count == 0) {
+		if (sd->entity.pads->stream_count == 0) {
 			if (fmt->pad == FIMC_ISP_SD_PAD_SINK) {
 				struct v4l2_subdev_format format = *fmt;
 
diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/media/platform/exynos4-is/fimc-lite.c
index aaa3af0493ce..67bfb1ad2ba2 100644
--- a/drivers/media/platform/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/exynos4-is/fimc-lite.c
@@ -1073,7 +1073,7 @@ static int fimc_lite_subdev_set_fmt(struct v4l2_subdev *sd,
 	mutex_lock(&fimc->lock);
 
 	if ((atomic_read(&fimc->out_path) == FIMC_IO_ISP &&
-	    sd->entity.stream_count > 0) ||
+	    sd->entity.pads->stream_count > 0) ||
 	    (atomic_read(&fimc->out_path) == FIMC_IO_DMA &&
 	    vb2_is_busy(&fimc->vb_queue))) {
 		mutex_unlock(&fimc->lock);
diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
index 20f59c59ff8a..28aab16d7662 100644
--- a/drivers/media/platform/omap3isp/isp.c
+++ b/drivers/media/platform/omap3isp/isp.c
@@ -936,7 +936,7 @@ static int isp_pipeline_is_last(struct media_entity *me)
 	struct isp_pipeline *pipe;
 	struct media_pad *pad;
 
-	if (!me->pipe)
+	if (!me->pads->pipe)
 		return 0;
 	pipe = to_isp_pipeline(me);
 	if (pipe->stream_state == ISP_PIPELINE_STREAM_STOPPED)
diff --git a/drivers/media/platform/omap3isp/ispvideo.c b/drivers/media/platform/omap3isp/ispvideo.c
index 5c1cbb1a9003..a8438040c4aa 100644
--- a/drivers/media/platform/omap3isp/ispvideo.c
+++ b/drivers/media/platform/omap3isp/ispvideo.c
@@ -1094,7 +1094,7 @@ isp_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 	/* Start streaming on the pipeline. No link touching an entity in the
 	 * pipeline can be activated or deactivated once streaming is started.
 	 */
-	pipe = video->video.entity.pipe
+	pipe = video->video.entity.pads->pipe
 	     ? to_isp_pipeline(&video->video.entity) : &video->pipe;
 
 	ret = media_entity_enum_init(&pipe->ent_enum, &video->isp->media_dev);
diff --git a/drivers/media/platform/omap3isp/ispvideo.h b/drivers/media/platform/omap3isp/ispvideo.h
index a0908670c0cf..4c9c5b719ec5 100644
--- a/drivers/media/platform/omap3isp/ispvideo.h
+++ b/drivers/media/platform/omap3isp/ispvideo.h
@@ -100,7 +100,7 @@ struct isp_pipeline {
 };
 
 #define to_isp_pipeline(__e) \
-	container_of((__e)->pipe, struct isp_pipeline, pipe)
+	container_of((__e)->pads->pipe, struct isp_pipeline, pipe)
 
 static inline int isp_pipeline_ready(struct isp_pipeline *pipe)
 {
diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 33957cc9118c..e59453d6b7c3 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -132,13 +132,17 @@ static int rvin_group_link_notify(struct media_link *link, u32 flags,
 		return 0;
 
 	/*
-	 * Don't allow link changes if any entity in the graph is
-	 * streaming, modifying the CHSEL register fields can disrupt
-	 * running streams.
+	 * Don't allow link changes if any stream in the graph is active as
+	 * modifying the CHSEL register fields can disrupt running streams.
 	 */
-	media_device_for_each_entity(entity, &group->mdev)
-		if (entity->stream_count)
-			return -EBUSY;
+	media_device_for_each_entity(entity, &group->mdev) {
+		struct media_pad *iter;
+
+		media_entity_for_each_pad(entity, iter) {
+			if (iter->stream_count)
+				return -EBUSY;
+		}
+	}
 
 	mutex_lock(&group->lock);
 
diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index f5f722ab1d4e..80b7ae47d165 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -1231,7 +1231,7 @@ static int rvin_set_stream(struct rvin_dev *vin, int on)
 	 */
 	mdev = vin->vdev.entity.graph_obj.mdev;
 	mutex_lock(&mdev->graph_mutex);
-	pipe = sd->entity.pipe ? sd->entity.pipe : &vin->vdev.pipe;
+	pipe = sd->entity.pads->pipe ? sd->entity.pads->pipe : &vin->vdev.pipe;
 	ret = __media_pipeline_start(&vin->vdev.entity, pipe);
 	mutex_unlock(&mdev->graph_mutex);
 	if (ret)
diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
index d33f99c6ffa4..03ee19d00041 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -402,7 +402,7 @@ static int xvip_dma_start_streaming(struct vb2_queue *vq, unsigned int count)
 	 * Use the pipeline object embedded in the first DMA object that starts
 	 * streaming.
 	 */
-	pipe = dma->video.entity.pipe
+	pipe = dma->video.entity.pads->pipe
 	     ? to_xvip_pipeline(&dma->video.entity) : &dma->pipe;
 
 	ret = media_pipeline_start(&dma->video.entity, &pipe->pipe);
diff --git a/drivers/media/platform/xilinx/xilinx-dma.h b/drivers/media/platform/xilinx/xilinx-dma.h
index 2378bdae57ae..69ced71a5696 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.h
+++ b/drivers/media/platform/xilinx/xilinx-dma.h
@@ -47,7 +47,7 @@ struct xvip_pipeline {
 
 static inline struct xvip_pipeline *to_xvip_pipeline(struct media_entity *e)
 {
-	return container_of(e->pipe, struct xvip_pipeline, pipe);
+	return container_of(e->pads->pipe, struct xvip_pipeline, pipe);
 }
 
 /**
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 6f90acf9c725..535da4dda3c6 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -913,7 +913,7 @@ int imx_media_pipeline_set_stream(struct imx_media_dev *imxmd,
 			__media_pipeline_stop(entity);
 	} else {
 		v4l2_subdev_call(sd, video, s_stream, 0);
-		if (entity->pipe)
+		if (entity->pads->pipe)
 			__media_pipeline_stop(entity);
 	}
 
diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
index 68588e9dab0b..4c6f25aa8b57 100644
--- a/drivers/staging/media/omap4iss/iss.c
+++ b/drivers/staging/media/omap4iss/iss.c
@@ -548,7 +548,7 @@ static int iss_pipeline_is_last(struct media_entity *me)
 	struct iss_pipeline *pipe;
 	struct media_pad *pad;
 
-	if (!me->pipe)
+	if (!me->pads->pipe)
 		return 0;
 	pipe = to_iss_pipeline(me);
 	if (pipe->stream_state == ISS_PIPELINE_STREAM_STOPPED)
diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
index 8c25ad73a81e..b74f7891711d 100644
--- a/drivers/staging/media/omap4iss/iss_video.c
+++ b/drivers/staging/media/omap4iss/iss_video.c
@@ -871,7 +871,7 @@ iss_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 	 * Start streaming on the pipeline. No link touching an entity in the
 	 * pipeline can be activated or deactivated once streaming is started.
 	 */
-	pipe = pad->entity->pipe
+	pipe = pad->pipe
 	     ? to_iss_pipeline(pad->entity) : &video->pipe;
 	pipe->external = NULL;
 	pipe->external_rate = 0;
diff --git a/drivers/staging/media/omap4iss/iss_video.h b/drivers/staging/media/omap4iss/iss_video.h
index 526281bf0051..9b8ec27bf87d 100644
--- a/drivers/staging/media/omap4iss/iss_video.h
+++ b/drivers/staging/media/omap4iss/iss_video.h
@@ -91,7 +91,7 @@ struct iss_pipeline {
 };
 
 #define to_iss_pipeline(__e) \
-	container_of((__e)->pipe, struct iss_pipeline, pipe)
+	container_of((__e)->pads->pipe, struct iss_pipeline, pipe)
 
 static inline int iss_pipeline_ready(struct iss_pipeline *pipe)
 {
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 5f6eed24e63f..c9d97c902d05 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -180,15 +180,24 @@ enum media_pad_signal_type {
  *
  * @graph_obj:	Embedded structure containing the media object common data
  * @entity:	Entity this pad belongs to
+ * @pipe:	Pipeline this pad belongs to
+ * @stream_count: Stream count for the pad
  * @index:	Pad index in the entity pads array, numbered from 0 to n
  * @sig_type:	Type of the signal inside a media pad
  * @flags:	Pad flags, as defined in
  *		:ref:`include/uapi/linux/media.h <media_header>`
  *		(seek for ``MEDIA_PAD_FL_*``)
+ * .. note::
+ *
+ *    @stream_count reference count must never be negative, but is a signed
+ *    integer on purpose: a simple ``WARN_ON(<0)`` check can be used to
+ *    detect reference count bugs that would make it negative.
  */
 struct media_pad {
 	struct media_gobj graph_obj;	/* must be first field in struct */
 	struct media_entity *entity;
+	struct media_pipeline *pipe;
+	int stream_count;
 	u16 index;
 	enum media_pad_signal_type sig_type;
 	unsigned long flags;
@@ -267,9 +276,7 @@ enum media_entity_type {
  * @pads:	Pads array with the size defined by @num_pads.
  * @links:	List of data links.
  * @ops:	Entity operations.
- * @stream_count: Stream count for the entity.
  * @use_count:	Use count for the entity.
- * @pipe:	Pipeline this entity belongs to.
  * @info:	Union with devnode information.  Kept just for backward
  *		compatibility.
  * @info.dev:	Contains device major and minor info.
@@ -282,10 +289,9 @@ enum media_entity_type {
  *
  * .. note::
  *
- *    @stream_count and @use_count reference counts must never be
- *    negative, but are signed integers on purpose: a simple ``WARN_ON(<0)``
- *    check can be used to detect reference count bugs that would make them
- *    negative.
+ *    @use_count reference count must never be negative, but is a signed
+ *    integer on purpose: a simple ``WARN_ON(<0)`` check can be used to
+ *    detect reference count bugs that would make it negative.
  */
 struct media_entity {
 	struct media_gobj graph_obj;	/* must be first field in struct */
@@ -304,11 +310,8 @@ struct media_entity {
 
 	const struct media_entity_operations *ops;
 
-	int stream_count;
 	int use_count;
 
-	struct media_pipeline *pipe;
-
 	union {
 		struct {
 			u32 major;
-- 
2.25.1

