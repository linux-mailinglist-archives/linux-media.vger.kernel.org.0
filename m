Return-Path: <linux-media+bounces-18270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 774A4978AD1
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 23:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C4E91C2314B
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 21:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94CD1155321;
	Fri, 13 Sep 2024 21:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Pg7hnVNN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2144A6BFD4
	for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 21:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726264038; cv=none; b=hoWfAuDtN4piTjxXpAIubz4vszS/fWEaZZlfXt+xxtfhC5/nko1yVrx95rzP3PJfydeNEZX/sDCtv/Spb5Z01H3AMUPKmYbeweSr7FDnReIp7R05C02OshQM4hNVFl4xqXCTng0HHBeazszSuVJPpjqvEQPR3OlfQh2CQ6SSf/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726264038; c=relaxed/simple;
	bh=LXaWD9KIdKV1BX3OScWS0sAEKTLeBqsNcj+9a5HDpLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pJlVzloA9G9mb2vx5PksrQDYtKGQo7ECJGWsWH4pVRqkgVfr4m00tYPZesVEIz7YTCU5cfDZqa2U8qsTzkEC8vh7xtS7w9wDJnauO9C7pwzFujCn4hSnb8+ROWcU0lQ0NrLVddQhAPZK7BRJhBIiROv814rvmolZDUrlZ+K+xic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Pg7hnVNN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4AE91083;
	Fri, 13 Sep 2024 23:45:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726263948;
	bh=LXaWD9KIdKV1BX3OScWS0sAEKTLeBqsNcj+9a5HDpLQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pg7hnVNN6moh8dJ/g3OHytTz1tJjorOe+/o0fU3TrCilAdFRJi+2LvsnUmzmmuQZE
	 Vi3caaSV2FMtgGyoFdR30X3ccNAfNBrlhtJQTugPdCKXIfg6LfQTJgBjJwN0AFDECJ
	 clT5HUDTx9NnTIYWNiefOfoMn9auf5a7GNL8EsKw=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 01/10] media: media-entity: Introduce media_entity_context
Date: Fri, 13 Sep 2024 23:46:46 +0200
Message-ID: <20240913214657.1502838-2-jacopo.mondi@ideasonboard.com>
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

Introduce the 'struct media_entity_context' type, which serves for
reference counting and introduce two new media entity operations to
allow drivers to allocate and free a media entity context.

The newly introduced type will be used as a base type for the
device context types (video_device_context and v4l2_subdevice_context)
that will be introduced in the next patches.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c | 46 +++++++++++++++++
 include/media/media-entity.h | 99 ++++++++++++++++++++++++++++++++++++
 2 files changed, 145 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 951b79ca125c..8ce72d72bc1d 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -1660,3 +1660,49 @@ struct media_link *__media_entity_next_link(struct media_entity *entity,
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(__media_entity_next_link);
+
+static void media_entity_release_context(struct kref *refcount)
+{
+	struct media_entity_context *ctx =
+		container_of(refcount, struct media_entity_context, refcount);
+
+	ctx->entity->ops->destroy_context(ctx);
+}
+
+struct media_entity_context *
+media_entity_context_get(struct media_entity_context *ctx)
+{
+	if (!ctx)
+		return ERR_PTR(-EINVAL);
+
+	kref_get(&ctx->refcount);
+
+	return ctx;
+}
+EXPORT_SYMBOL_GPL(media_entity_context_get);
+
+void media_entity_context_put(struct media_entity_context *ctx)
+{
+	if (!ctx)
+		return;
+
+	kref_put(&ctx->refcount, media_entity_release_context);
+}
+EXPORT_SYMBOL_GPL(media_entity_context_put);
+
+void media_entity_init_context(struct media_entity *entity,
+			       struct media_entity_context *ctx)
+{
+	if (!ctx)
+		return;
+
+	ctx->entity = entity;
+	kref_init(&ctx->refcount);
+	INIT_LIST_HEAD(&ctx->list);
+}
+EXPORT_SYMBOL_GPL(media_entity_init_context);
+
+void media_entity_cleanup_context(struct media_entity_context *ctx)
+{
+}
+EXPORT_SYMBOL_GPL(media_entity_cleanup_context);
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 4d95893c8984..002a326de9b9 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -15,6 +15,7 @@
 #include <linux/bug.h>
 #include <linux/container_of.h>
 #include <linux/fwnode.h>
+#include <linux/kref.h>
 #include <linux/list.h>
 #include <linux/media.h>
 #include <linux/minmax.h>
@@ -248,6 +249,37 @@ struct media_pad {
 	struct media_pipeline *pipe;
 };
 
+/**
+ * struct media_entity_context - A media entity execution context
+ * @mdev_context: The media device context this media entity is bound to.
+ *		  The field is initialized when the entity is bound to a media
+ *		  device context.
+ * @entity: The media entity this context belongs to
+ * @refcount: The kref reference counter
+ * list: The list entry to link the entity context in the media device context
+ *
+ * This type represent the 'base class' used to implement execution context for
+ * video device contexts and subdevice contexts. Those types embedds an instance
+ * of 'struct media_entity_context' as their first member, allowing the MC core
+ * to implement type polymorphism and handle video device and subdevice contexts
+ * transparently.
+ *
+ * The main function of this type is to provide reference counting for the
+ * 'dervived' device context types. The video device and subdevice core
+ * populates the 'context_release' function pointer that implement specific
+ * clean-up operations, similar to what a 'virtual destructor' would do in C++.
+ *
+ * Drivers are not expected to use this type directly, but only the MC core
+ * will.
+ */
+struct media_device_context;
+struct media_entity_context {
+	struct media_device_context *mdev_context;
+	struct media_entity *entity;
+	struct kref refcount;
+	struct list_head list;
+};
+
 /**
  * struct media_entity_operations - Media entity operations
  * @get_fwnode_pad:	Return the pad number based on a fwnode endpoint or
@@ -269,6 +301,15 @@ struct media_pad {
  *			media_entity_has_pad_interdep().
  *			Optional: If the operation isn't implemented all pads
  *			will be considered as interdependent.
+ * @alloc_context:	Allocate a media entity context. Drivers are allowed to
+ *			sub-class the entity context type by defining a driver
+ *			specific type that embeds an instance of either a
+ *			video_device_context or subdevice_context as first
+ *			member, and allocate the size of a driver-specific type
+ *			in the implementation of this operation. Returns 0 for
+ *			success, or an error code < 0 otherwise.
+ * @destroy_context:	Release a media entity context previously allocated by
+ *			the driver.
  *
  * .. note::
  *
@@ -284,6 +325,9 @@ struct media_entity_operations {
 	int (*link_validate)(struct media_link *link);
 	bool (*has_pad_interdep)(struct media_entity *entity, unsigned int pad0,
 				 unsigned int pad1);
+	int (*alloc_context)(struct media_entity *entity,
+			     struct media_entity_context **context);
+	void (*destroy_context)(struct media_entity_context *context);
 };
 
 /**
@@ -1452,3 +1496,58 @@ struct media_link *__media_entity_next_link(struct media_entity *entity,
 					     MEDIA_LNK_FL_DATA_LINK))
 
 #endif
+
+/**
+ * media_entity_context_get - Increase the media entity context reference count
+ *			      and return a reference to it
+ *
+ * @ctx: the media entity context
+ *
+ * Increase the media entity context reference count. The reference count
+ * is increased by the V4L2 core when:
+ *
+ * - a new context is allocated when bounding a media entity to a media device
+ *   context (by kref_init())
+ * - the media pipeline the context is part of starts streaming
+ *
+ * The entity context gets automatically decreased by the V4L2 core when:
+ * - a context is unbound
+ * - the pipeline stops streaming
+ */
+struct media_entity_context *
+media_entity_context_get(struct media_entity_context *ctx);
+
+/**
+ * media_entity_context_put - Decrease the media entity context reference count
+ *
+ * @ctx: the media entity context
+ *
+ * Decrease the media entity context reference count. The reference count
+ * is decreased by the V4L2 core when:
+ * - the file handle the context is associated with is closed
+ * - the media pipeline the context is part of is stopped
+ */
+void media_entity_context_put(struct media_entity_context *ctx);
+
+/**
+ * media_entity_init_context - Initialize the media entity context
+ *
+ * @entity: the media entity this context belongs to
+ * @ctx: the media entity context
+ *
+ * Initialize the media entity context by initializing the kref reference
+ * counter. The intended caller of this function are the video device context
+ * and subdevic context initialize functions.
+ */
+void media_entity_init_context(struct media_entity *entity,
+			       struct media_entity_context *ctx);
+
+/**
+ * media_entity_cleanup_context - Cleanup the media entity context
+ *
+ * @ctx: the media entity context
+ *
+ * Cleanup the media entity context. The intended caller of this function are
+ * the video device and subdevice context cleanup functions.
+ */
+void media_entity_cleanup_context(struct media_entity_context *ctx);
-- 
2.46.0


