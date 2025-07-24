Return-Path: <linux-media+bounces-38396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D5FB10CFB
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 16:16:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D162D540D1B
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 14:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A338C2E88B6;
	Thu, 24 Jul 2025 14:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tYwCCeD2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D1C18BBB9;
	Thu, 24 Jul 2025 14:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366254; cv=none; b=RLxbIiy8VTyxOsS2Vk7kjLW0060KU0cCpZKNmD2kqaQPOt5tM59OxON/xRRmYCvWnTu5r2GmiDLBY/zXY4iAFy1wNCJBIADduoTu3lkkwSVUyPVsJ+7Z/ptY/PDeWSdSNU4WS4b9DitrY2NSZncpk/GvFcA7OR5fjvM/mZBKs68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366254; c=relaxed/simple;
	bh=7I13wywrt99Sx2g/tHAlEPxkYo6PoehZ9YwsTffq1K4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ljf4pUU+1ywEv1iYquKdpEodBWFBEoLQOPk29Fnrmrcogq2cSnj5YD6g0s12eQAHeIeeu7IlmKciyKy2BHDi98N4ECGpe0mt0m5OI1CK2eVm8fAhxOcqopmRq6USklsN34Ob1NzcHdF+dtajXUhsz9DpsGTLCEuodav7lRPpaZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tYwCCeD2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 068741C0A;
	Thu, 24 Jul 2025 16:10:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366203;
	bh=7I13wywrt99Sx2g/tHAlEPxkYo6PoehZ9YwsTffq1K4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tYwCCeD2RqUwRsIjzK/MrXphoDB/aUZK2i51QbchEsEofYFWAYY9BWRVDRwoQrb0f
	 ZJ4puZMiIqlUpeGTo7a1ewbO8ezql4t78FRdbZiUK+tp6HuhmL0JMe377jIBJvRn4J
	 FqHG72/aODRUtH9z3YgXHA4vGaeirty6Xf/rqx6E=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:19 +0200
Subject: [PATCH v2 12/27] media: v4l2-subdev: Introduce v4l2 subdev context
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-12-c9b316773486@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8677;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=7I13wywrt99Sx2g/tHAlEPxkYo6PoehZ9YwsTffq1K4=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7PHgrGE7vDI9TcLTP8iMB0VR5TMItrWF5wa
 lyRyEwBRYSJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+zwAKCRByNAaPFqFW
 PI2OD/9XBflSxgvDX/sRzW+/cTbUgb+j2/OmOGJWBKOUskoqBrq3JTG3Kf0SemIUwimvXXUO+hP
 Pgl0X+K+rziXGIGT1/0dA/PGsGZNg6emZs7zrpe5KG2yVki1n2WoOUkaftqKDmG/ZEnft615X5K
 3aJbfWBGJsLrnb8XYWf3uu4W5sfVwtvaeGVZuj6t2KB1O/joB5omnNvBJPKm22SLVAILRaDVokX
 jBzBtlCuRwXBVeLvaCkVttjCNiQgP0FVy81CN0xK7P3OCRsb2H4ecff6ebhwqHMhyjFbDKQsOXb
 O2NYMT5Sdh4FbRzoF5t6HlEhJlKbV9P09M2DbUXHGbF5i6tSJbI/kXh6IBAtZGc3AwhhEIj3KPc
 +0rMebILHqugZU7ElmzLzq/feayH3wxmWdqbsds8l3p+/eqvaaR8OT8O2u1gF3mFKtlc7oKpt+j
 SrkwMPmr57FtjLD909hYgR8y01o21uRO8HXxAL7HFOuGf6kHCVrklQ4pg8BLst/pg0lC6ac2WNB
 NM6Nnv+O7CKjyMyceiXuKcbHLvLrA/5sWBv7iIaBHWzOz5qkIog67Krz/CvSsOuepVmSBmudZWh
 663+6udP5m34hl3sSGXzQJXRRQqC3wy5P8zvqavp5rgTqEif0PO1lS+nGgarfd+p6Se/aA48PA1
 8TlhNvKNT4hiIJg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Introduce a new type in v4l2 subdev that represents a v4l2 subdevice
contex. It extends 'struct media_entity_context' and is intended to be
extended by drivers that can store driver-specific information
in their derived types.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c |  39 +++++++++++
 include/media/v4l2-subdev.h           | 126 ++++++++++++++++++++++++++++++++++
 2 files changed, 165 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 4fd25fea3b58477056729665706ddbacc436379c..7307f57439499c8d5360c89f492944828ac23973 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1577,6 +1577,45 @@ bool v4l2_subdev_has_pad_interdep(struct media_entity *entity,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_has_pad_interdep);
 
+struct v4l2_subdev_context *
+v4l2_subdev_context_get(struct media_device_context *mdev_context,
+			struct v4l2_subdev *sd)
+{
+	struct media_entity *entity = &sd->entity;
+	struct media_entity_context *ctx =
+		 media_device_get_entity_context(mdev_context, entity);
+
+	if (!ctx)
+		return NULL;
+
+	return container_of(ctx, struct v4l2_subdev_context, base);
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_context_get);
+
+void v4l2_subdev_context_put(struct v4l2_subdev_context *ctx)
+{
+	if (!ctx)
+		return;
+
+	media_entity_context_put(&ctx->base);
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_context_put);
+
+int v4l2_subdev_init_context(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_context *context)
+{
+	media_entity_init_context(&sd->entity, &context->base);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_init_context);
+
+void v4l2_subdev_cleanup_context(struct v4l2_subdev_context *context)
+{
+	media_entity_cleanup_context(&context->base);
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup_context);
+
 struct v4l2_subdev_state *
 __v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
 			  struct lock_class_key *lock_key)
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 5dcf4065708f32e7d3b5da003771810d5f7973b8..9d257b859acafb11cfe6976e906e7baabd0206f6 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -757,6 +757,78 @@ struct v4l2_subdev_state {
 	struct v4l2_subdev_stream_configs stream_configs;
 };
 
+/**
+ * struct v4l2_subdev_context - The v4l2 subdevice context
+ * @base: The media entity context base class member
+ * @state: The subdevice state associated with this context
+ *
+ * This structure represents an isolated execution context of a subdevice.
+ * This type 'derives' the base 'struct media_entity_context' type which
+ * implements refcounting on our behalf and allows instances of this type to be
+ * linked in the media_device_context contexts list.
+ *
+ * The subdevice context stores the subdev state in a per-file handle context,
+ * userspace is allowed to multiplex the usage of a subdevice devnode by opening
+ * it multiple times and by associating it with a media device context. This
+ * operation is called 'bounding' and is performed using the
+ * VIDIOC_SUBDEV_BIND_CONTEXT ioctl.
+ *
+ * A subdevice context is created and stored in the v4l2_fh file handle
+ * associated with an open file descriptor when a subdevice is 'bound' to a
+ * media device context. The 'bounding' operation realizes a permanent
+ * association valid until the subdevice context is released.
+ *
+ * A subdevice can be bound to the same media device context once only.
+ * Trying to bind the same subdevice to the same media device context a
+ * second time, without releasing the already established context by closing the
+ * bound file descriptor first, will result in an error.
+ *
+ * To create a subdevice context userspace shall use the
+ * VIDIOC_SUBDEV_BIND_CONTEXT ioctl that creates the subdevice context and
+ * uniquely associates it with a media device file descriptor.
+ *
+ * Once a subdevice file descriptor has been bound to a media device context,
+ * all the operations performed on the subdevice file descriptor will be
+ * directed on the just created subdevice context. This means, in example, that
+ * the subdevice state and configuration is isolated from the ones associated
+ * with a different file descriptor obtained by opening again the same subdevice
+ * devnode but bound to a different media device context.
+ *
+ * Drivers that implement multiplexing support have to provide a valid
+ * implementation of the context-related operations in the media entity
+ * operations.
+ *
+ * Drivers are allowed to sub-class the v4l2_subdevice_context structure by
+ * defining a driver-specific type which embeds a struct v4l2_subdevice_context
+ * instance as first member, and allocate the driver-specific structure size in
+ * their implementation of the `alloc_context` operation.
+ *
+ * Subdevice contexts are ref-counted by embedding an instance of 'struct
+ * media_entity_context' and are freed once all the references to it are
+ * released.
+ *
+ * A subdevice context ref-count is increased when:
+ * - The context is created by bounding a video device to a media device context
+ * - The media pipeline it is part of starts streaming
+ * A subdevice context ref-count is decreased when:
+ * - The associated file handle is closed
+ * - The media pipeline it is part of stops streaming
+ *
+ * The ref-count is increased by a call to v4l2_subdev_context_get() and is
+ * reponsibility of the caller to decrease the reference count with a call to
+ * v4l2_subdev_context_put().
+ */
+struct v4l2_subdev_context {
+	struct media_entity_context base;
+	/*
+	 * TODO: active_state should most likely be changed from a pointer to an
+	 * embedded field. For the time being it's kept as a pointer to more
+	 * easily catch uses of active_state in the cases where the driver
+	 * doesn't support it.
+	 */
+	struct v4l2_subdev_state *state;
+};
+
 /**
  * struct v4l2_subdev_pad_ops - v4l2-subdev pad level operations
  *
@@ -1152,6 +1224,7 @@ struct v4l2_subdev_fh {
 	struct module *owner;
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 	struct v4l2_subdev_state *state;
+	struct v4l2_subdev_context *context;
 	u64 client_caps;
 #endif
 };
@@ -1285,6 +1358,59 @@ int v4l2_subdev_link_validate(struct media_link *link);
 bool v4l2_subdev_has_pad_interdep(struct media_entity *entity,
 				  unsigned int pad0, unsigned int pad1);
 
+/**
+ * v4l2_subdev_context_get - Helper to get a v4l2 subdev context from a
+ *			     media device context
+ *
+ * @mdev_context: The media device context
+ * @sd: The V4L2 subdevice the context refers to
+ *
+ * Helper function that wraps media_device_get_entity_context() and returns
+ * the v4l2 subdevice context associated with a subdevice in a media device
+ * context.
+ *
+ * The reference count of the returned v4l2 subdevice context is increased.
+ * Callers of this function are required to decrease the reference count of
+ * the context reference with a call to v4l2_subdev_context_put().
+ */
+struct v4l2_subdev_context *
+v4l2_subdev_context_get(struct media_device_context *mdev_context,
+			struct v4l2_subdev *sd);
+
+/**
+ * v4l2_subdev_context_put - Helper to decrease a v4l2 subdevice context
+ *			     reference count
+ *
+ * @ctx: The v4l2 subdevice context to put
+ */
+void v4l2_subdev_context_put(struct v4l2_subdev_context *ctx);
+
+/**
+ * v4l2_subdev_init_context - Initialize the v4l2 subdevice context
+ *
+ * @sd: The subdevice the context belongs to
+ * @ctx: The context to initialize
+ *
+ * Initialize the v4l2 subdevice context. The intended callers of this function
+ * are driver-specific implementations of the media_entity_ops.alloc_context()
+ * function that allocates their driver specific types that derive from
+ * struct v4l2_subdev_context.
+ */
+int v4l2_subdev_init_context(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_context *ctx);
+
+/**
+ * v4l2_subdev_cleanup_context - Cleanup the v4l2 subdevice context
+ *
+ * @ctx: The context to cleanup.
+ *
+ * Cleanup the v4l2 subdevice context. The intended callers of this function are
+ * driver specific implementation of the media_entity_ops.destroy_context()
+ * function before releasing the memory previously allocated by
+ * media_entity_ops.alloc_context().
+ */
+void v4l2_subdev_cleanup_context(struct v4l2_subdev_context *ctx);
+
 /**
  * __v4l2_subdev_state_alloc - allocate v4l2_subdev_state
  *

-- 
2.49.0


