Return-Path: <linux-media+bounces-37984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B432EB08B21
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:51:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 098BE1C24878
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 10:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91A42D6606;
	Thu, 17 Jul 2025 10:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eIP2rUtv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7192D23BF;
	Thu, 17 Jul 2025 10:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752749176; cv=none; b=lgsmeNhhRLWgxFvL3UTrlPQhI+827QPKwNCHn5nbG2COUdedJBEY2LF4fKPyZGLhNqDmcysfTYkzA39fhzXTr9vjeAoAUpFs7SbtaI+3800n9nbxUn22DOAEszETspT9kiICqGsu3A5XY3RiacUBbdjxCaL86wUxAXQhVm5sYlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752749176; c=relaxed/simple;
	bh=9EOdO/COHzQLny/RumAreucWfszOgExSRSTj6l4Lnxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O166iu89XG6RDBqiGYL0HNQOk/FA/k9mGsqHsFPnOm5PnazrVCwgDEHt4EP0pkMslRpRfgml3i5YyFZdQ04+fOIylTXd//yuc25LiaI2BG6YhkZlXxpYQMNsjcxQJdxX4ffhHnxp/ij0VvvvxLyGTuf2dGzXphpj3p1saOnzOWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eIP2rUtv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4F98198D;
	Thu, 17 Jul 2025 12:45:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749136;
	bh=9EOdO/COHzQLny/RumAreucWfszOgExSRSTj6l4Lnxw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eIP2rUtvj4XVChnhxO73AoC9nZDd8YVYghDb9I11bQi5i95qlcYhJwn09IoxSZoH7
	 n9wN3A6FsY+9TbBSo02dCDhVMeOyItOOEtb6BG5z6DNPGv8WlW/jydJS8C6ab236O3
	 I167KPbt7KRL5ZKZiOTwpyBk03NGceiv5EyCs/YY=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:44 +0200
Subject: [PATCH 18/26] media: media-entity: Support context in
 pipeline_start
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-18-81ac18979c03@ideasonboard.com>
References: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
In-Reply-To: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=17561;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=9EOdO/COHzQLny/RumAreucWfszOgExSRSTj6l4Lnxw=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRQb5XJQ8WaFkazJJHpibRlzjXNaQWnm4wIr
 JvoB8u/knqJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUUAAKCRByNAaPFqFW
 PJCgD/9CjPOsI8BZsR0hoYcEI6pKmdRZt4S+A16gifirJw30MELbX2sLr8usRI9VE/OeBqyUOz9
 VqfqrPS13hkkHVkyrdo5T6WYuaRcmmTgTdiy3J6N61g0Wt8E0OY84fyLKbzRYxsce01paixEXvU
 A+sI/41MS8xW2xLoEAsX7W+ihOLU5ZRw/H3TuU+Mu4F/awBn3Vanb+BdpIp9Sb6XxRH2K2WNUAO
 W+Z8f8db9DLeURXWebXtRhpuoVVjJIHzv1101zhjyHZd7GYL+KgYqszQcoKZ+cX5N4ZBotADm8z
 wRYRHrc/tLZ0vbHdm3Sk8Ii2P8DyC3ADvH2kVjujk4sU1ntxBVKTQwRVXKR7Zl6WxH40rugG3k0
 lqWnWJQJtevHr7q77k70ZXNDUpLBCughWX8fKuJGH45u0ZqNBXXFJy0KgZShS2Y3i6KXU7c6Kkr
 4TpSZCqsNVCTHXd0WFbNnsH8TbT0jXxS45FyvgT9fxowOSCWa1v+x6fuNDRsMFZbVC5VDZWkMB/
 9KUlbzhDmC5wPh2s9B6k8vskNCHyb9hb0nbYQYyw+B2bWSh35cl0x/H6TypRZZr0JrEPu+HVCk9
 Hw9kPZ//6qpcv+y8xnZ1UU9vc5+yuFHzkCY0JpwcZ4TsGPOsPLxJXqjjICj8QQNxMx9FciPuh1Q
 tFlYeUw56tNWxIA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add helpers to propagate an execution context when starting the media
pipeline. Starting a pipeline with an execution context implies that
when creating the streaming pipeline all the entities part of the
pipeline shall have a valid context associated with the media context in
use.

When creating the media pipeline increase the device context use
count to guarantee that during the streaming phase drivers will
always operate with valid contexts.

Add 'overrides' for all the video_device_pipeline_start() and
media_pipeline_start() variants to support contexts.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c       | 150 ++++++++++++++++++++++++++++++++-----
 drivers/media/v4l2-core/v4l2-dev.c |  44 +++++++++++
 include/media/media-entity.h       |  56 +++++++++++++-
 include/media/v4l2-dev.h           |  57 ++++++++++++++
 4 files changed, 287 insertions(+), 20 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 7bc276c725f974539ea06e3882d004b81be1de68..f421d6d74630bb96400d39d805c5db5d3d1ff913 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -768,8 +768,50 @@ static int media_pipeline_populate(struct media_pipeline *pipe,
 	return ret;
 }
 
-__must_check int __media_pipeline_start(struct media_pad *origin,
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
+	 *
+	 * media_device_get_entity_context increases the ref-counting of the
+	 * context. Store a reference in the ppad for later decreasing the
+	 * reference count when the pipeline is stopped.
+	 *
+	 * Fail validation if no context is associated with this media context
+	 * and be loud about that as userspace should be informed it has to
+	 * bind all entities of the pipeline in the same context.
+	 */
+	context = media_device_get_entity_context(mdev_context, entity);
+	if (WARN_ON(IS_ERR(context)))
+		return -EPIPE;
+
+	media_entity_context_get(context);
+	ppad->context = context;
+
+	return 0;
+}
+
+__must_check int
+__media_pipeline_start_context(struct media_pad *origin,
+			       struct media_pipeline *pipe,
+			       struct media_device_context *mdev_context)
 {
 	struct media_device *mdev = origin->graph_obj.mdev;
 	struct media_pipeline_pad *err_ppad;
@@ -829,7 +871,15 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
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
@@ -875,7 +925,7 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
 		}
 
 		/*
-		 * 3. If the pad has the MEDIA_PAD_FL_MUST_CONNECT flag set,
+		 * 4. If the pad has the MEDIA_PAD_FL_MUST_CONNECT flag set,
 		 * ensure that it has either no link or an enabled link.
 		 */
 		if ((pad->flags & MEDIA_PAD_FL_MUST_CONNECT) &&
@@ -905,6 +955,9 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
 		if (err_ppad == ppad)
 			break;
 
+		if (err_ppad->context)
+			media_entity_context_put(err_ppad->context);
+
 		err_ppad->pad->pipe = NULL;
 	}
 
@@ -912,19 +965,35 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(__media_pipeline_start_context);
+
+__must_check int __media_pipeline_start(struct media_pad *origin,
+					struct media_pipeline *pipe)
+{
+	return __media_pipeline_start_context(origin, pipe, NULL);
+}
 EXPORT_SYMBOL_GPL(__media_pipeline_start);
 
-__must_check int media_pipeline_start(struct media_pad *origin,
-				      struct media_pipeline *pipe)
+__must_check int
+media_pipeline_start_context(struct media_pad *origin,
+			     struct media_pipeline *pipe,
+			     struct media_device_context *context)
 {
 	struct media_device *mdev = origin->graph_obj.mdev;
 	int ret;
 
 	mutex_lock(&mdev->graph_mutex);
-	ret = __media_pipeline_start(origin, pipe);
+	ret = __media_pipeline_start_context(origin, pipe, context);
 	mutex_unlock(&mdev->graph_mutex);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(media_pipeline_start_context);
+
+__must_check int media_pipeline_start(struct media_pad *origin,
+				      struct media_pipeline *pipe)
+{
+	return media_pipeline_start_context(origin, pipe, NULL);
+}
 EXPORT_SYMBOL_GPL(media_pipeline_start);
 
 void __media_pipeline_stop(struct media_pad *pad)
@@ -942,8 +1011,11 @@ void __media_pipeline_stop(struct media_pad *pad)
 	if (--pipe->start_count)
 		return;
 
-	list_for_each_entry(ppad, &pipe->pads, list)
+	list_for_each_entry(ppad, &pipe->pads, list) {
+		if (ppad->context)
+			media_entity_context_put(ppad->context);
 		ppad->pad->pipe = NULL;
+	}
 
 	media_pipeline_cleanup(pipe);
 
@@ -962,14 +1034,13 @@ void media_pipeline_stop(struct media_pad *pad)
 }
 EXPORT_SYMBOL_GPL(media_pipeline_stop);
 
-__must_check int media_pipeline_alloc_start(struct media_pad *pad)
+static struct media_pipeline *
+media_pipeline_alloc(struct media_pad *pad)
 {
 	struct media_device *mdev = pad->graph_obj.mdev;
-	struct media_pipeline *new_pipe = NULL;
 	struct media_pipeline *pipe;
-	int ret;
 
-	mutex_lock(&mdev->graph_mutex);
+	lockdep_assert_held(&mdev->graph_mutex);
 
 	/*
 	 * Is the pad already part of a pipeline? If not, we need to allocate
@@ -977,19 +1048,33 @@ __must_check int media_pipeline_alloc_start(struct media_pad *pad)
 	 */
 	pipe = media_pad_pipeline(pad);
 	if (!pipe) {
-		new_pipe = kzalloc(sizeof(*new_pipe), GFP_KERNEL);
-		if (!new_pipe) {
-			ret = -ENOMEM;
-			goto out;
-		}
+		pipe = kzalloc(sizeof(*pipe), GFP_KERNEL);
+		if (!pipe)
+			return ERR_PTR(-ENOMEM);
 
-		pipe = new_pipe;
 		pipe->allocated = true;
 	}
 
+	return pipe;
+}
+
+__must_check int media_pipeline_alloc_start(struct media_pad *pad)
+{
+	struct media_device *mdev = pad->graph_obj.mdev;
+	struct media_pipeline *pipe;
+	int ret;
+
+	mutex_lock(&mdev->graph_mutex);
+
+	pipe = media_pipeline_alloc(pad);
+	if (IS_ERR(pipe)) {
+		ret = PTR_ERR(pipe);
+		goto out;
+	}
+
 	ret = __media_pipeline_start(pad, pipe);
 	if (ret)
-		kfree(new_pipe);
+		kfree(pipe);
 
 out:
 	mutex_unlock(&mdev->graph_mutex);
@@ -998,6 +1083,33 @@ __must_check int media_pipeline_alloc_start(struct media_pad *pad)
 }
 EXPORT_SYMBOL_GPL(media_pipeline_alloc_start);
 
+__must_check
+int media_pipeline_alloc_start_context(struct media_pad *pad,
+				       struct media_device_context *mdev_context)
+{
+	struct media_device *mdev = pad->graph_obj.mdev;
+	struct media_pipeline *pipe;
+	int ret;
+
+	mutex_lock(&mdev->graph_mutex);
+
+	pipe = media_pipeline_alloc(pad);
+	if (IS_ERR(pipe)) {
+		ret = PTR_ERR(pipe);
+		goto out;
+	}
+
+	ret = __media_pipeline_start_context(pad, pipe, mdev_context);
+	if (ret)
+		kfree(pipe);
+
+out:
+	mutex_unlock(&mdev->graph_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(media_pipeline_alloc_start_context);
+
 struct media_pad *
 __media_pipeline_pad_iter_next(struct media_pipeline *pipe,
 			       struct media_pipeline_pad_iter *iter,
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 96696959314abfb1864ea5d96742e579b5a41f6f..d2136f5a84b165cf1f8f7b37cef981d74c3e5ac2 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1221,6 +1221,36 @@ __must_check int __video_device_pipeline_start(struct video_device *vdev,
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
@@ -1254,6 +1284,20 @@ __must_check int video_device_pipeline_alloc_start(struct video_device *vdev)
 }
 EXPORT_SYMBOL_GPL(video_device_pipeline_alloc_start);
 
+__must_check int
+video_device_context_pipeline_alloc_start(struct video_device_context *context)
+{
+	struct video_device *vdev = context->vdev;
+	struct media_entity *entity = &vdev->entity;
+
+	if (entity->num_pads != 1)
+		return -ENODEV;
+
+	return media_pipeline_alloc_start_context(&entity->pads[0],
+						  context->base.mdev_context);
+}
+EXPORT_SYMBOL_GPL(video_device_context_pipeline_alloc_start);
+
 struct media_pipeline *video_device_pipeline(struct video_device *vdev)
 {
 	struct media_entity *entity = &vdev->entity;
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 32298fe8a18c6ee3c1dbcff9ef869548904417a7..b60c311ab390beb6931fe8f2bbe8939e11cda452 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -119,16 +119,20 @@ struct media_pipeline {
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
@@ -1212,6 +1216,39 @@ __must_check int media_pipeline_start(struct media_pad *origin,
 __must_check int __media_pipeline_start(struct media_pad *origin,
 					struct media_pipeline *pipe);
 
+/**
+ * media_pipeline_start_context - Mark a pipeline as streaming
+ * @origin: Starting pad
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
+media_pipeline_start_context(struct media_pad *origin,
+			     struct media_pipeline *pipe,
+			     struct media_device_context *context);
+
+/**
+ * __media_pipeline_start_context - Mark a pipeline as streaming
+ * @origin: Starting pad
+ * @pipe: Media pipeline to be assigned to all pads in the pipeline.
+ * @context: The media device context the pipeline belongs to
+ *
+ * ..note:: This is the non-locking version of media_pipeline_start_context()
+ */
+__must_check int
+__media_pipeline_start_context(struct media_pad *origin,
+			       struct media_pipeline *pipe,
+			       struct media_device_context *context);
+
 /**
  * media_pipeline_stop - Mark a pipeline as not streaming
  * @pad: Starting pad
@@ -1318,6 +1355,23 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
  */
 __must_check int media_pipeline_alloc_start(struct media_pad *pad);
 
+/**
+ * media_pipeline_alloc_start_context - Mark a pipeline as streaming
+ * @pad: Starting pad
+ * @context: The media device context the pipeline belongs to
+ *
+ * media_pipeline_alloc_start_context() is similar to
+ * media_pipeline_start_context() but instead of working on a given pipeline the
+ * function will use an existing pipeline if the pad is already part of a
+ * pipeline, or allocate a new pipeline.
+ *
+ * Calls to media_pipeline_alloc_start_context() must be matched with
+ * media_pipeline_stop().
+ */
+__must_check int
+media_pipeline_alloc_start_context(struct media_pad *pad,
+				   struct media_device_context *context);
+
 /**
  * media_devnode_create() - creates and initializes a device node interface
  *
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index bab4b13b109362bec84d8d16440b6ea895206b60..93095df692e3628d4be003d25843fa744d6b20a4 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -602,6 +602,48 @@ __must_check int video_device_pipeline_start(struct video_device *vdev,
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
+ * __video_device_context_pipeline_start - Mark a pipeline as streaming starting
+ *					   from a video device context
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
@@ -646,6 +688,21 @@ void __video_device_pipeline_stop(struct video_device *vdev);
  */
 __must_check int video_device_pipeline_alloc_start(struct video_device *vdev);
 
+/**
+ * video_device_context_pipeline_alloc_start - Mark a pipeline as streaming
+ * @context: The video device context that starts the streaming
+ *
+ * video_device_context_pipeline_alloc_start() is similar to
+ * video_device_context_pipeline_start() but instead of working on a given
+ * pipeline the function will use an existing pipeline if the video device is
+ * already part of a pipeline, or allocate a new pipeline.
+ *
+ * Calls to video_device_context_pipeline_alloc_start() must be matched with
+ * video_device_pipeline_stop().
+ */
+__must_check int
+video_device_context_pipeline_alloc_start(struct video_device_context *context);
+
 /**
  * video_device_pipeline - Get the media pipeline a video device is part of
  * @vdev: The video device

-- 
2.49.0


