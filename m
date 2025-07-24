Return-Path: <linux-media+bounces-38388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B62DB10CD6
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 16:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E052D1C26C2A
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 14:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845352E3B1E;
	Thu, 24 Jul 2025 14:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b3tuXXYX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31BB2D8DB7;
	Thu, 24 Jul 2025 14:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366241; cv=none; b=espvQ4vQaLqkHcjuW39RhXyFp6g4G72E9bh/7Y5Q1tgcEf8Z5UApcKUV5HTAze4IyGhXYo+5QbYciLIDhCGopnRU0HGar9TiIKmkuSS7rn13OxvYhFyxamIXNrQAzb3ovHfOcqH0lLINnWURV7spdIKC6yUQWvsm9gkC1+wedZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366241; c=relaxed/simple;
	bh=DnyByKVCK9e8LIByMHqQ/KRM1C+sAIkgyijuQbTd5Yw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZLsJc1qTZpqnS0pL2X3jWw0Ebgvb438Wsl7ggRNartIXHhSVIGV/zxFyVwxitMsKP5EGdOfIlkO4ZuJT/2gYghg5HVSt221CJnfqbq/mwwqQl7E1OKxGVBrBVjmjRQUtxckeuKsrShIU0JPEfLptGwfFJBkd6PcQpnMI5OsNL6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b3tuXXYX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 050DE1A04;
	Thu, 24 Jul 2025 16:09:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366194;
	bh=DnyByKVCK9e8LIByMHqQ/KRM1C+sAIkgyijuQbTd5Yw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b3tuXXYXuouWggunl8jcymqaOR1B8NNCf+TDzx7vIbdx8usDXYLag6kpoGR1DI2/O
	 MKw0rlv0Aqn4FWSol7jr6Kp9JvhbD32uSU3SSZs8QY45KiLbn5yCM1vX1g2aEA1OSP
	 llox/f/LkxVOG/Wkp/OzaIP04E0AU1X1bKWvJS9Y=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:12 +0200
Subject: [PATCH v2 05/27] media: v4l2-dev: Introduce video device context
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-5-c9b316773486@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9358;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=DnyByKVCK9e8LIByMHqQ/KRM1C+sAIkgyijuQbTd5Yw=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7Oi7DOv+2oMd6oHfFjIY+DwIpJibKZ0VUDA
 n5elJfwmGGJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+zgAKCRByNAaPFqFW
 PIKeEACaBYId/cKMoKVepnHcF6swvItlIcef/GgpDlqeARlJvt/FrCHAFlWhJoLeuykGKDzokfh
 Ne15kWRuKWrXwlIp0jq49AUGspJzxuhzIzMyWeSmVB+uyLrq1C9h/9k6SCoVnQssfM+0IF1f6rQ
 lanV6nm66JE3FH+5ZRhyDs/EFKJv4yPs/cp9BP2GnGdK//TUc3ANqFPBlSR+si7MpuGN1J9szBL
 /RVhahVfEyxuspnZO/SVFjMn41RkzwCKnVhFvAM20Raceb4a6Km2PAPUX/w7b9K8+5uBGcI5DbA
 maWK5VoWo3NfQoS6tsXrsuBJROQCHVU9l1ohocJWnCJEETHHg+lUbP7SwEqr2W/q+znrEexUNDS
 4YUsG2c9nck3HkswcWhiQl/KLvOoja3QhOVkjGMQDyY8T+puT7kEpmqmmY9oFj5Cb+RKXGqrqrf
 ci4aXN/LsW47SATVSGGUgwAAO4ppJ6ikvfizP0638jO97ztK9pdzUqcfCu4OZbn+KItQTNo61eE
 NwusXrIxK5V+Rv+NAwC/DZwr73L65NOsZC86vFOHYCmFZIICS41lIrr8bLTCVK1CYbQAVSaXgFl
 MuQhVqcs3MgxYMroNortb9ibtqtCYASuNHmO3Sz0ZNO9MteqiX90OHNPMyedNE42bzxnExMG+Ub
 roQ2H3QBLjEI+1A==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

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
 drivers/media/v4l2-core/v4l2-dev.c |  43 +++++++++++++
 include/media/v4l2-dev.h           | 126 +++++++++++++++++++++++++++++++++++++
 include/media/v4l2-fh.h            |   3 +
 3 files changed, 172 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index c369235113d98ae26c30a1aa386e7d60d541a66e..c83c37843c9e7beb899a4b2bd176273c3dec381b 100644
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
index a69801274800f4f9add723b51fe0a31331e88f97..9276e095fb17414a9eb7845db0aa81572c42ca45 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -18,6 +18,7 @@
 #include <linux/videodev2.h>
 
 #include <media/media-entity.h>
+#include <media/videobuf2-core.h>
 
 #define VIDEO_MAJOR	81
 
@@ -660,6 +661,131 @@ __must_check int video_device_pipeline_alloc_start(struct video_device *vdev);
  */
 struct media_pipeline *video_device_pipeline(struct video_device *vdev);
 
+/**
+ * struct video_device_context - The video device context
+ * @base: The media entity context base class member
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
+	/* Protects the vb2 queue. */
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
index b5b3e00c8e6a0b082d9cd8a0c972a5094adcb6f2..a8de8613a026589ede94dc3e70c8a49ae08f4582 100644
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
2.49.0


