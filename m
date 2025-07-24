Return-Path: <linux-media+bounces-38403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 437DCB10D0C
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 16:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B1615C0681
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 14:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54A82EAB95;
	Thu, 24 Jul 2025 14:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WHNUdf7V"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138812EA494;
	Thu, 24 Jul 2025 14:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366264; cv=none; b=Vs91ptGVOCcevfPD7z0nyd5++Kv5ubWd/1EJOzJc0LBa6rhO8I7LwAsFsCUKKSi+gFbN7tr7mIB6/+dMnR3+0tyL9PPoehIOqaxIkAbuam6WqXGQqYUETVRjpn8uRfhjt4tzRzpBANJlUYMkYFLSaUQZAroV/gETF4yLAeAXW+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366264; c=relaxed/simple;
	bh=cRd3wiIxy2b+WbPMrfjq8RLbsaBxYWFg+yvih1JD75Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z1KKn8Xs+udYBvK4Yco/5sbw8jChBgj8MwuKvHSJzPUWSfX64PSDw/xrsJMyaX/hQFbkiiVi6U9SE9MihaTdnd5pO7JPwAFm4z9Mqxyk3kfFxZrnvw+TA2VWgCbjE5ktx9YFxJKAzq/ydTk8jBDN52/3q36fT+5+HW0LFIIdnV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WHNUdf7V; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9991E11E6;
	Thu, 24 Jul 2025 16:10:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366210;
	bh=cRd3wiIxy2b+WbPMrfjq8RLbsaBxYWFg+yvih1JD75Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WHNUdf7V6TyInk8Hbrn5slQ5R27N2m1RKmK7K6eC6xcHFCy4sOym1JRmGoNp9t12F
	 q4UO8yA9HlI83e2Sp7CSkdOtGIfktUc5mznHQDOWkrOy5c2ijrH2XITYPKwa4LJfqz
	 7K2dEAzQDtz8OKDHdrA21+8gO9f+eAnqHkmvEax4=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:25 +0200
Subject: [PATCH v2 18/27] media: media-entity: Support context in
 pipeline_start
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-18-c9b316773486@ideasonboard.com>
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
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
 bh=cRd3wiIxy2b+WbPMrfjq8RLbsaBxYWFg+yvih1JD75Q=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7QS2BR9nJ+xLBDuoGX5iktpW8UcGgeZ2bf6
 1iB6v1XDaiJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+0AAKCRByNAaPFqFW
 PB8GD/4+VVfFKJX+xLOD79DsOM6cfe2hQKUSqi3hO4qHCh8nU+c0Y1soBnriouUUxQq9uBis1zr
 XE+LSvdqZJnk/n6noJ3ExuqjHtt6gKTXk2/9PNjqk75EvDKrXJsZ16zv4tYnunsfSj180+kdUaq
 VoB8que+xji3zl+WzEEyXgiCnsyaFJZymr1u1H/ZvfeXMeFIpHrW8MEgNvcn5lW/5LpKvP5f1H0
 xiNEty+wS23y2vrRCD8w3N4/arnQEGUBYP/3/MguFBxRdBm8zCSv6ao0ZuZNCkPHNfv2Dfnt7TW
 js0U1SpxvGxdOiqVQSPzSFXDxn2HN8QFG9S7bfxTGNXPTXegkh8/HoLyDsiSZ0EAbDz89re6lJf
 AX+cSxAcbbDqoLTs4a91DoY0l4FxHs3f5LOQa3QkUUUHdWZQkxImcYWaPHayzfo/FKLfVRLSEXX
 UtWZni67U9sRepn4BDXW6oqcJOVe8Mjy5V0bX59hISEk4r7tx8kIVSq5X2udyUZTVMTIwE2A6kn
 58dzZ/hTPsH42mODlbNkadWeEtjrUbpaKq2yA5dtVr8a2+L4k11gXDlzkSW5VpiQZoGGWGKpKSa
 wpxYFHQnMla7S8QOHpPz8/IoUwDP1B2vsC+To61AS73AybcodeJE16HAS3bfjdj5W54DLOJocbY
 PPHFzddX4LczEZA==
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
index fafd4209e2cab320a6e164d33e9a0f73784d22db..eacaa38cffe8847b66acdeebf2330a072b3be85f 100644
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


