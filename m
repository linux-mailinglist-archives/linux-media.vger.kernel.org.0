Return-Path: <linux-media+bounces-18278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 081D6978AD9
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 23:47:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CA391C23219
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 21:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CE1176FC5;
	Fri, 13 Sep 2024 21:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ESxg6pjh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872FD155321
	for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 21:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726264051; cv=none; b=PdII1cQIN2uGcpBn2/fnSXQsZc90/Hxdbr66wvVHYNH1aSI3Mg7zxdTLi3tRDifdbOvVU4Kz6cF70dgS4qyMTqAK83Y13Bz5x8JOlz3pHO5fhIENCImjAebrLcWWMGA95SstIgXbpSBPzCN/Mnu5OinzX2RNAOsb+Zm0hGpa550=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726264051; c=relaxed/simple;
	bh=GUHZucC0wAGj+SaY2ua/nwT8wz9U+p/L2rERLawE1qE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hROIQzFoc9XmHvvJhQ/OUI0jBU4rpm8HxSEEOaA43VHXerLEx6oPU40LI1Uv95nQ2308q8nvroSqMRKLQLksruz3GrFsqVfTzPHYBFuFV6TE2C0Xr3AzQrOl4eBaYSKAjNAP1QqnD6jqCxlz+OdTxp9i8POhs36Uc9i1W1n8LMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ESxg6pjh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F17D2593;
	Fri, 13 Sep 2024 23:45:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726263951;
	bh=GUHZucC0wAGj+SaY2ua/nwT8wz9U+p/L2rERLawE1qE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ESxg6pjhxMQ361CAXULysldLS4y/N5zK9qFERL3rV09WgiGb7ioPQIeOCtHwO2hU3
	 cP4GyYwSR1boJOdtgpCCCCmbACMyngMV5HlxqmhMF/OxXQKk5V0jF9Xo+vfNtJV84V
	 0yAgTztnWbbPz+Yzisofb2ywU94r6aUfvubvYxTY=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 09/10] media: media-entity: Validate context in pipeline start
Date: Fri, 13 Sep 2024 23:46:54 +0200
Message-ID: <20240913214657.1502838-10-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913214657.1502838-1-jacopo.mondi@ideasonboard.com>
References: <20240913214657.1502838-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add helpers to validate the an execution context when starting the media
pipeline. Validating an execution context implies that when creating
the streaming pipeline all the entities part of the pipeline shall
have a valid context associated with the media context in use.

When creating the media pipeline increase the device context use
count to guarantee that during the streaming phase drivers will
always operate with valid contexts.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c       | 89 +++++++++++++++++++++++++++---
 drivers/media/v4l2-core/v4l2-dev.c | 30 ++++++++++
 include/media/media-entity.h       | 42 +++++++++++++-
 include/media/v4l2-dev.h           | 42 ++++++++++++++
 4 files changed, 194 insertions(+), 9 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 4108d3da4cb0..b1932e3ddbdc 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -755,8 +755,51 @@ static int media_pipeline_populate(struct media_pipeline *pipe,
 	return ret;
 }
 
-__must_check int __media_pipeline_start(struct media_pad *pad,
-					struct media_pipeline *pipe)
+static int
+media_pipeline_validate_context(struct media_device_context *mdev_context,
+				struct media_entity *entity,
+				struct media_pipeline_pad *ppad)
+{
+	struct media_entity_context *context;
+
+	if (!mdev_context)
+		return 0;
+
+	/*
+	 * It's not mandatory for all entities in the pipeline to support
+	 * contexts.
+	 */
+	if (!entity->ops || !entity->ops->alloc_context ||
+	    !entity->ops->destroy_context)
+		return 0;
+
+	/*
+	 * But if they do they should be bound to the same media device context
+	 * as all other entities.
+	 */
+	context = media_device_get_entity_context(mdev_context, entity);
+
+	/*
+	 * Fail validation if no context is associated with this media context.
+	 */
+	if (!context)
+		return -EINVAL;
+
+	/*
+	 * Increase the ref-counting of the context. Store a reference in the
+	 * ppad for later decreasing the reference count when the pipeline is
+	 * stopped.
+	 */
+	media_entity_context_get(context);
+	ppad->context = context;
+
+	return 0;
+}
+
+__must_check int
+__media_pipeline_start_context(struct media_pad *pad,
+			       struct media_pipeline *pipe,
+			       struct media_device_context *mdev_context)
 {
 	struct media_device *mdev = pad->graph_obj.mdev;
 	struct media_pipeline_pad *err_ppad;
@@ -816,7 +859,15 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
 		}
 
 		/*
-		 * 2. Validate all active links whose sink is the current pad.
+		 * 2. If we have a media context, ensure the entity has a device
+		 * context associated with it.
+		 */
+		ret = media_pipeline_validate_context(mdev_context, entity, ppad);
+		if (ret)
+			goto error;
+
+		/*
+		 * 3. Validate all active links whose sink is the current pad.
 		 * Validation of the source pads is performed in the context of
 		 * the connected sink pad to avoid duplicating checks.
 		 */
@@ -862,7 +913,7 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
 		}
 
 		/*
-		 * 3. If the pad has the MEDIA_PAD_FL_MUST_CONNECT flag set,
+		 * 4. If the pad has the MEDIA_PAD_FL_MUST_CONNECT flag set,
 		 * ensure that it has either no link or an enabled link.
 		 */
 		if ((pad->flags & MEDIA_PAD_FL_MUST_CONNECT) &&
@@ -892,6 +943,9 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
 		if (err_ppad == ppad)
 			break;
 
+		if (err_ppad->context)
+			media_entity_context_put(err_ppad->context);
+
 		err_ppad->pad->pipe = NULL;
 	}
 
@@ -899,19 +953,35 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(__media_pipeline_start_context);
+
+__must_check int __media_pipeline_start(struct media_pad *pad,
+					struct media_pipeline *pipe)
+{
+	return __media_pipeline_start_context(pad, pipe, NULL);
+}
 EXPORT_SYMBOL_GPL(__media_pipeline_start);
 
-__must_check int media_pipeline_start(struct media_pad *pad,
-				      struct media_pipeline *pipe)
+__must_check int
+media_pipeline_start_context(struct media_pad *pad,
+			     struct media_pipeline *pipe,
+			     struct media_device_context *context)
 {
 	struct media_device *mdev = pad->graph_obj.mdev;
 	int ret;
 
 	mutex_lock(&mdev->graph_mutex);
-	ret = __media_pipeline_start(pad, pipe);
+	ret = __media_pipeline_start_context(pad, pipe, context);
 	mutex_unlock(&mdev->graph_mutex);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(media_pipeline_start_context);
+
+__must_check int media_pipeline_start(struct media_pad *pad,
+				      struct media_pipeline *pipe)
+{
+	return media_pipeline_start_context(pad, pipe, NULL);
+}
 EXPORT_SYMBOL_GPL(media_pipeline_start);
 
 void __media_pipeline_stop(struct media_pad *pad)
@@ -929,8 +999,11 @@ void __media_pipeline_stop(struct media_pad *pad)
 	if (--pipe->start_count)
 		return;
 
-	list_for_each_entry(ppad, &pipe->pads, list)
+	list_for_each_entry(ppad, &pipe->pads, list) {
+		if (ppad->context)
+			media_entity_context_put(ppad->context);
 		ppad->pad->pipe = NULL;
+	}
 
 	media_pipeline_cleanup(pipe);
 
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index d92989d76cf0..791a32cd3fae 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1222,6 +1222,36 @@ __must_check int __video_device_pipeline_start(struct video_device *vdev,
 }
 EXPORT_SYMBOL_GPL(__video_device_pipeline_start);
 
+__must_check int
+video_device_context_pipeline_start(struct video_device_context *context,
+				    struct media_pipeline *pipe)
+{
+	struct video_device *vdev = context->vdev;
+	struct media_entity *entity = &vdev->entity;
+
+	if (entity->num_pads != 1)
+		return -ENODEV;
+
+	return media_pipeline_start_context(&entity->pads[0], pipe,
+					    context->base.mdev_context);
+}
+EXPORT_SYMBOL(video_device_context_pipeline_start);
+
+__must_check int
+__video_device_context_pipeline_start(struct video_device_context *context,
+				      struct media_pipeline *pipe)
+{
+	struct video_device *vdev = context->vdev;
+	struct media_entity *entity = &vdev->entity;
+
+	if (entity->num_pads != 1)
+		return -ENODEV;
+
+	return __media_pipeline_start_context(&entity->pads[0], pipe,
+					      context->base.mdev_context);
+}
+EXPORT_SYMBOL(__video_device_context_pipeline_start);
+
 void video_device_pipeline_stop(struct video_device *vdev)
 {
 	struct media_entity *entity = &vdev->entity;
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 002a326de9b9..7161f8aea3fe 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -21,6 +21,7 @@
 #include <linux/minmax.h>
 #include <linux/types.h>
 
+
 /* Enums used internally at the media controller to represent graphs */
 
 /**
@@ -119,16 +120,20 @@ struct media_pipeline {
  * @list:		Entry in the media_pad pads list
  * @pipe:		The media_pipeline that the pad is part of
  * @pad:		The media pad
+ * @context:		Reference to a video device or subdevice context
  *
  * This structure associate a pad with a media pipeline. Instances of
  * media_pipeline_pad are created by media_pipeline_start() when it builds the
  * pipeline, and stored in the &media_pad.pads list. media_pipeline_stop()
- * removes the entries from the list and deletes them.
+ * removes the entries from the list and deletes them. The context field is
+ * populated only if a valid context has been associated with the pad.
  */
+struct media_entity_context;
 struct media_pipeline_pad {
 	struct list_head list;
 	struct media_pipeline *pipe;
 	struct media_pad *pad;
+	struct media_entity_context *context;
 };
 
 /**
@@ -1205,6 +1210,7 @@ struct media_entity *media_graph_walk_next(struct media_graph *graph);
  */
 __must_check int media_pipeline_start(struct media_pad *pad,
 				      struct media_pipeline *pipe);
+
 /**
  * __media_pipeline_start - Mark a pipeline as streaming
  *
@@ -1216,6 +1222,40 @@ __must_check int media_pipeline_start(struct media_pad *pad,
 __must_check int __media_pipeline_start(struct media_pad *pad,
 					struct media_pipeline *pipe);
 
+/**
+ * media_pipeline_start_context - Mark a pipeline as streaming
+ * @pad: Starting pad
+ * @pipe: Media pipeline to be assigned to all pads in the pipeline.
+ * @context: The media device context the pipeline belongs to
+ *
+ * Mark all pads connected to a given pad through enabled links, either
+ * directly or indirectly, as streaming. The given pipeline object is assigned
+ * to every pad in the pipeline and stored in the media_pad pipe field.
+ *
+ * Calls to this function can be nested, in which case the same number of
+ * media_pipeline_stop() calls will be required to stop streaming. The
+ * pipeline pointer must be identical for all nested calls to
+ * media_pipeline_start().
+ */
+__must_check int
+media_pipeline_start_context(struct media_pad *pad,
+			     struct media_pipeline *pipe,
+			     struct media_device_context *context);
+
+/**
+ * __media_pipeline_start_context - Mark a pipeline as streaming
+ *
+ * @pad: Starting pad
+ * @pipe: Media pipeline to be assigned to all pads in the pipeline.
+ * @context: The media device context the pipeline belongs to
+ *
+ * ..note:: This is the non-locking version of media_pipeline_start()
+ */
+__must_check int
+__media_pipeline_start_context(struct media_pad *pad,
+			       struct media_pipeline *pipe,
+			       struct media_device_context *mdev_context);
+
 /**
  * media_pipeline_stop - Mark a pipeline as not streaming
  * @pad: Starting pad
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 2ef49d0aaf09..1088bcac81a5 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -579,6 +579,48 @@ __must_check int video_device_pipeline_start(struct video_device *vdev,
 __must_check int __video_device_pipeline_start(struct video_device *vdev,
 					       struct media_pipeline *pipe);
 
+/**
+ * video_device_context_pipeline_start - Mark a pipeline as streaming starting
+ *					 from a video device context
+ * @context: The video device context that starts the streaming
+ * @pipe: Media pipeline to be assigned to all entities in the pipeline.
+ *
+ * ..note:: This is the multi-context version of video_device_pipeline_start()
+ *          Documentation of this function only describes specific aspects of
+ *          this version. Refer to the video_device_pipeline_start()
+ *          documentation for a complete reference.
+ *
+ * Validate that all entities connected to a video device through enabled links
+ * by ensuring that a context associated with the same media device context
+ * exists for them. Increase the reference counting of each of the contexts part
+ * of the pipeline to guarantee their lifetime is maintained as long as the
+ * pipeline is streaming.
+ *
+ * Context validation and refcounting of all entities that are part of a
+ * streaming pipeline ensures that device drivers can safely access device
+ * contexts in a media device context during streaming. References to contexts
+ * retried by a call to media_device_get_entity_context(), are guaranteed to be
+ * valid as long as the pipeline is streaming. Likewise, the media device
+ * context that contains the device contexts is guaranteed to be valid as long
+ * as the pipeline is streaming.
+ */
+__must_check int
+video_device_context_pipeline_start(struct video_device_context *context,
+				    struct media_pipeline *pipe);
+
+/**
+ * video_device_context_pipeline_start - Mark a pipeline as streaming starting
+ *					 from a video device context
+ * @context: The video device context that starts the streaming
+ * @pipe: Media pipeline to be assigned to all entities in the pipeline.
+ *
+ * ..note:: This is the non-locking version of
+ *	    __video_device_context_pipeline_start()
+ */
+__must_check int
+__video_device_context_pipeline_start(struct video_device_context *context,
+				      struct media_pipeline *pipe);
+
 /**
  * video_device_pipeline_stop - Mark a pipeline as not streaming
  * @vdev: Starting video device
-- 
2.46.0


