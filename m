Return-Path: <linux-media+bounces-18272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B00978AD3
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 23:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 434001F233E6
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 21:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F2D1553A1;
	Fri, 13 Sep 2024 21:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jkASImwi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897E66BFD4
	for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 21:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726264041; cv=none; b=IuSxOZjBKZctJH+7AGk4sG/u+2ZsNpPJN1AjZTWVZt9rSmlvocTeod9D9FizOU6Y2KhRgHJlGt/IfBK/fghSg9Gi5GzGX1IHdUH+OC4kLSzE8R/wxWt6DT6XmXUbkCYL0OCwT4ixcDURpLIpqJrLelZg6rGFCckiBdzxQ/vGNY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726264041; c=relaxed/simple;
	bh=0rfsX8AyCcPjFdwHSZwxO5xVQc289O+3Qd7RMdFkYL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fa2UVYfvygsJjjq83EMk+IeVQrdOoqqD94tNCduDxIcXxa3JSbvn3ftJksLeuy7kG+cnd6YVDsnxwCuN1QDuPoZnXaTJZXiTAhH+4J0fffu0KN2b+X43Di3t7z5qSOmgBZA3iJcyZbmmH/sDqMzUM52SkPYEPwQQT7SQG67dxjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jkASImwi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 510DD186C;
	Fri, 13 Sep 2024 23:45:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726263949;
	bh=0rfsX8AyCcPjFdwHSZwxO5xVQc289O+3Qd7RMdFkYL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jkASImwi9a7Fupb9X8Z79aSOKr4RRkRSfHmjJ/WglGdwHM7CFKNqQEP1LaknpauME
	 4O9KSvLyVB06w62iPyuJkkDrRXHWnUh/WmRTy7yOK73f0oJ0NOGHdALj2zHYj/g1c1
	 NCN4XucUGJeup6E+Jz+czAIS63FVNzKXxNIxCwN0=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 03/10] media: v4l2-dev: Introduce video device context
Date: Fri, 13 Sep 2024 23:46:48 +0200
Message-ID: <20240913214657.1502838-4-jacopo.mondi@ideasonboard.com>
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

Introduce a new type in video-device that represents a video device
context. It extends 'struct media_entity_context' to include
video-device specific data and configuration. The new type is intended
to be extended by drivers that can store driver-specific information
in their video device derived types.

The next patch will introduce the VIDIOC_BIND_CONTEXT ioctl that allows
to create a video device context and uniquely associate it with a media
context.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-dev.c |  43 ++++++++++
 include/media/v4l2-dev.h           | 126 +++++++++++++++++++++++++++++
 include/media/v4l2-fh.h            |   3 +
 3 files changed, 172 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index b80010bf3ec3..0fd6ff3f00f6 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1200,6 +1200,49 @@ struct media_pipeline *video_device_pipeline(struct video_device *vdev)
 }
 EXPORT_SYMBOL_GPL(video_device_pipeline);
 
+struct video_device_context *
+video_device_context_get(struct media_device_context *mdev_context,
+			 struct video_device *vdev)
+{
+	struct media_entity *entity = &vdev->entity;
+	struct media_entity_context *ctx =
+		media_device_get_entity_context(mdev_context, entity);
+
+	if (!ctx)
+		return NULL;
+
+	return container_of(ctx, struct video_device_context, base);
+}
+EXPORT_SYMBOL_GPL(video_device_context_get);
+
+void video_device_context_put(struct video_device_context *ctx)
+{
+	if (!ctx)
+		return;
+
+	media_entity_context_put(&ctx->base);
+}
+EXPORT_SYMBOL_GPL(video_device_context_put);
+
+int video_device_init_context(struct video_device *vdev,
+			      struct video_device_context *ctx)
+{
+	media_entity_init_context(&vdev->entity, &ctx->base);
+
+	ctx->vdev = vdev;
+	mutex_init(&ctx->queue_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(video_device_init_context);
+
+void video_device_cleanup_context(struct video_device_context *ctx)
+{
+	mutex_destroy(&ctx->queue_lock);
+	media_entity_cleanup_context(&ctx->base);
+}
+EXPORT_SYMBOL_GPL(video_device_cleanup_context);
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 /*
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index e0a13505f88d..d538f0f32d6d 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -18,6 +18,7 @@
 #include <linux/videodev2.h>
 
 #include <media/media-entity.h>
+#include <media/videobuf2-core.h>
 
 #define VIDEO_MAJOR	81
 
@@ -639,6 +640,131 @@ __must_check int video_device_pipeline_alloc_start(struct video_device *vdev);
  */
 struct media_pipeline *video_device_pipeline(struct video_device *vdev);
 
+/**
+ * struct video_device_context - The video device context
+ * @base: The media entity context base class member
+ * @mdev_context: The media device context this context is associated with
+ * @vdev: The video device this context belongs to
+ * @queue_lock: Protects the vb2 queue
+ * @queue: The vb2 queue
+ *
+ * This structure represents an isolated execution context of a video device.
+ * This type 'derives' the base 'struct media_entity_context' type which
+ * implements refcounting on our behalf and allows instances of this type to be
+ * linked in the media_device_context contexts list.
+ *
+ * By storing the data and the configuration of a video device in a per-file
+ * handle context, userspace is allowed to multiplex the usage of a single video
+ * device devnode by opening it multiple times and by associating it with a
+ * media device context. This operation is called 'bounding' and is performed
+ * using the VIDIOC_BIND_CONTEXT ioctl.
+ *
+ * A video device context is created and stored in the v4l2-fh file handle
+ * associated with an open file descriptor when a video device is 'bound' to a
+ * media device context. The 'bounding' operation realizes a permanent
+ * association valid until the video device context is released.
+ *
+ * A video device can be bound to the same media device context once only.
+ * Trying to bind the same video device to the same media device context a
+ * second time, without releasing the already established context by closing the
+ * bound file descriptor first, will result in an error.
+ *
+ * To create a video device context userspace shall use the VIDIOC_BIND_CONTEXT
+ * ioctl that creates the video device context and uniquely associates it with a
+ * media device file descriptor.
+ *
+ * Once a video device file descriptor has been bound to a media device context,
+ * all the operations performed on the video device file descriptor will be
+ * directed on the just created video device context. This means, in example,
+ * that the video device format and the buffer queue are isolated from the ones
+ * associated with a different file descriptor obtained by opening again the
+ * same video device devnode but bound to a different media device context.
+ *
+ * Drivers that implement multiplexing support have to provide a valid
+ * implementation of the context-related operations in the
+ * media entity operations.
+ *
+ * Drivers are allowed to sub-class the video_device_context structure by
+ * defining a driver-specific type which embeds a struct video_device_context
+ * instance as first member, and allocate the driver-specific structure size in
+ * their implementation of the `alloc_context` operation.
+ *
+ * Video device contexts are ref-counted by embedding an instance of 'struct
+ * media_entity_context' and are freed once all the references to it are
+ * released.
+ *
+ * A video device context ref-count is increased when:
+ * - The context is created by bounding a video device to a media device context
+ * - The media pipeline starts streaming
+ * A video device context ref-count is decreased when:
+ * - The associated file handle is closed
+ * - The media pipeline stops streaming
+ *
+ * The ref-count is increased by a call to video_device_context_get() and is
+ * reponsibility of the caller to decrease the reference count with a call to
+ * video_device_context_put().
+ */
+struct video_device_context {
+	struct media_entity_context base;
+
+	struct video_device *vdev;
+	struct mutex queue_lock;
+	struct vb2_queue queue;
+};
+
+/**
+ * video_device_context_get - Helper to get a video device context from a
+ *			      media device context
+ *
+ * @mdev_context: The media device context
+ * @vdev: The video device the context refers to
+ *
+ * Helper function that wraps media_device_get_entity_context() and returns
+ * the video device context associated with a video device in a media device
+ * context.
+ *
+ * The reference count of the returned video device context is increased.
+ * Callers of this function are required to decrease the reference count of
+ * the context reference with a call to video_device_context_put().
+ */
+struct video_device_context *
+video_device_context_get(struct media_device_context *mdev_context,
+			 struct video_device *vdev);
+
+/**
+ * video_device_context_put - Helper to decrease a video context reference
+ *			      count
+ *
+ * @ctx: The video context to release
+ */
+void video_device_context_put(struct video_device_context *ctx);
+
+/**
+ * video_device_init_context - Initialize the video device context
+ *
+ * @vdev: The video device this context belongs to
+ * @ctx: The context to initialize
+ *
+ * Initialize the video device context. The intended callers of this function
+ * are driver-specific implementations of the media_entity_ops.alloc_context()
+ * function that allocates their driver specific types that derive from
+ * struct video_device_context.
+ */
+int video_device_init_context(struct video_device *vdev,
+			      struct video_device_context *ctx);
+
+/**
+ * video_device_cleanup_context - Cleanup the video device context
+ *
+ * @ctx: The context to cleanup.
+ *
+ * Cleanup the video device context. The intended callers of this function are
+ * driver specific implementation of the media_entity_ops.destroy_context()
+ * function before releasing the memory previously allocated by
+ * media_entity_ops.alloc_context().
+ */
+void video_device_cleanup_context(struct video_device_context *ctx);
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 #endif /* _V4L2_DEV_H */
diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
index b5b3e00c8e6a..a8de8613a026 100644
--- a/include/media/v4l2-fh.h
+++ b/include/media/v4l2-fh.h
@@ -20,6 +20,7 @@
 
 struct video_device;
 struct v4l2_ctrl_handler;
+struct video_device_context;
 
 /**
  * struct v4l2_fh - Describes a V4L2 file handler
@@ -38,6 +39,7 @@ struct v4l2_ctrl_handler;
  * @sequence: event sequence number
  *
  * @m2m_ctx: pointer to &struct v4l2_m2m_ctx
+ * @context: The video device context
  */
 struct v4l2_fh {
 	struct list_head	list;
@@ -54,6 +56,7 @@ struct v4l2_fh {
 	u32			sequence;
 
 	struct v4l2_m2m_ctx	*m2m_ctx;
+	struct video_device_context *context;
 };
 
 /**
-- 
2.46.0


