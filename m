Return-Path: <linux-media+bounces-38389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC6AB10CD7
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 16:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D41B81C26972
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 14:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55762E4256;
	Thu, 24 Jul 2025 14:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uPq0K00G"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3915F2E2660;
	Thu, 24 Jul 2025 14:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366241; cv=none; b=tXo2jueWYic9zaIPNxlfZIqdaYi4kLE0bfgWRtNifF09+zoixxH6hLcQQURJd7ISdq9FucYhz4k7hG48160eeyWWLbf+4wS52ZIkJUZZgLZg8rlwgbfGdzLLmSJvwMUx71IkYw8l4xVn5h2eT0MINPtODCjSea7C4Fx/lHkylBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366241; c=relaxed/simple;
	bh=Qd19apeMZFSiMBZkqVWpWcHh8AbZaZrN82RvB+0JkQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZvMghb3Fb9AhJbIA6aW3CcXq7Md9951/xNVhDJYaxO+glZ9whc2sLGy17Jv7N6VQZ2/jnJtf4Rny0htnXi6tJ5NcXfJUuRQiSl5zW78nrmpNJUpEzWnq9V3aTugRatnrZxQF4CB4HkdA2563OA4mE5AMxL4xG1yHOkuoDuJZn9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uPq0K00G; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CEC95C64;
	Thu, 24 Jul 2025 16:09:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366192;
	bh=Qd19apeMZFSiMBZkqVWpWcHh8AbZaZrN82RvB+0JkQY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uPq0K00GYoCid+3GFeHyIglCljgmKUiETJmOzxmYqhRyVy8JZVfDBcxhaikVtN5jT
	 x/wMe4nzr8G8FghKujYA7xOAU+zt+hf+IPtkI+uv7u8R1+gvaTtEvDZ4ydgP+fPsQq
	 g5EnIUUC/OjOg5x8XLf2GN9wugxgafmJlCcyRrrA=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:11 +0200
Subject: [PATCH v2 04/27] media: media-device: Introduce media device
 context
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-4-c9b316773486@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=18790;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Qd19apeMZFSiMBZkqVWpWcHh8AbZaZrN82RvB+0JkQY=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7O7REzI7+GYnqeAUxYhCmMOPfdqAzKHVik1
 LnkyuWUSFaJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+zgAKCRByNAaPFqFW
 PCTrD/0fiyOFhnYABbwTW4zzwr3uJNFAXK877jmO2zOiv9RpYlfsK1FiuIs9BopFcl+TN3WzwTB
 E0x8BkWpIaoL3BKomzZi5wpkql1+c8EQHHIpAWeiCnb5cmVHMJMwye8kFRI7uyYkOUbimYPY/y7
 i67YR4AHfldhw8nuCY8kFGdc2oqnO/pf9SZLxfpvu3nWV2OEjFHoK/mgpgt1kx5n5lfyLLXHbcI
 KJnv4VipV1knu4Sr1261wwqhyb6jO5r/3Nj2LHvOYFg2mjkEsgcALduCDWJ+0E/riQJ3h1K55q5
 Rh3pwhAxRT3JsMPEO98I31td9LPmv5WkgCQB9Tyv8HeG1pRHim1NfvLOWgwMrq3K5haXDX4IyCY
 uhRj1mFr9j1CYjf6EUB01sMyxr7BLCwZPrB6j5FkKSMeMrQuj/bMyqoASkgB+rTk2UlLFBYxcEi
 NCZbi5wV5B9qZmCGJQg/c2ejNTjbF1Eci8Tu2s8lr+fE9zCBuFzyrpOlbuTC0I3MuWSUnb7GSd5
 cYeD3jTX3L36IfIGbn9L2gqRco/jma5pddrMCzi0DlD470z1oVuV4qTvhfwA0A8EI3lTutNvBG2
 XzFeUj+k2hg66k15g2Ka/IQtJ17bAF+LXzLhT+kRcZ5gKmyLjbHiQjNSvrMk8glxGXz2Wm+n71g
 9O/+blcEZNvpCvQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Introduce a new type in the media-fh.h header that represent a media
device context.

A media device context is allocated when the media device is open
and released when the last reference to it is put. A new pair of
media_device_ops is added to allow device drivers to allocate and
release a media context.

The media context groups together the media entity contexts that are
associated with it to form an isolated execution context.

Provide helpers in mc-device.c for drivers and for the v4l2-core to
handle media device contexts and to bind/unbind entity contexts
to it. Once an entity context has been bound to a media device
context it is possible to retrieve it by using a pointer to the entity
the device is represented by.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/mc/mc-device.c | 168 ++++++++++++++++++++++++++++++++++
 drivers/media/mc/mc-entity.c |   1 +
 include/media/media-device.h | 211 +++++++++++++++++++++++++++++++++++++++++++
 include/media/media-fh.h     |   5 +
 4 files changed, 385 insertions(+)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index e0cad87087d3863bf14207049a54e5e4dea1cdd4..d8f12db933d22ae7466051698d853f4bdc599400 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -12,7 +12,9 @@
 #include <linux/export.h>
 #include <linux/idr.h>
 #include <linux/ioctl.h>
+#include <linux/kref.h>
 #include <linux/media.h>
+#include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/pci.h>
@@ -49,11 +51,31 @@ static int media_device_open(struct media_devnode *devnode, struct file *filp)
 {
 	struct media_device *mdev = devnode->media_dev;
 	struct media_device_fh *fh;
+	int ret;
 
 	fh = kzalloc(sizeof(*fh), GFP_KERNEL);
 	if (!fh)
 		return -ENOMEM;
 
+	if (mdev->ops && mdev->ops->alloc_context) {
+		if (WARN_ON(!mdev->ops->destroy_context)) {
+			kfree(fh);
+			return -EINVAL;
+		}
+
+		ret = mdev->ops->alloc_context(mdev, &fh->context);
+		if (ret) {
+			kfree(fh);
+			return ret;
+		}
+
+		/*
+		 * Make sure the driver implementing alloc_context has
+		 * called media_device_init_context()
+		 */
+		WARN_ON(!fh->context->initialized);
+	}
+
 	filp->private_data = &fh->fh;
 
 	spin_lock_irq(&mdev->fh_list_lock);
@@ -73,6 +95,8 @@ static int media_device_close(struct file *filp)
 	list_del(&fh->mdev_list);
 	spin_unlock_irq(&mdev->fh_list_lock);
 
+	media_device_context_put(fh->context);
+
 	kfree(fh);
 
 	return 0;
@@ -860,6 +884,150 @@ void media_device_unregister(struct media_device *mdev)
 }
 EXPORT_SYMBOL_GPL(media_device_unregister);
 
+/* -----------------------------------------------------------------------------
+ * Context handling
+ */
+
+static void media_device_release_context(struct kref *refcount)
+{
+	struct media_device_context *context =
+		container_of(refcount, struct media_device_context, refcount);
+
+	/*
+	 * All the associated entity contexts should have been released if we
+	 * get here.
+	 */
+	WARN_ON(!list_empty(&context->contexts));
+
+	context->mdev->ops->destroy_context(context);
+}
+
+struct media_device_context *
+media_device_context_get(struct media_device_context *ctx)
+{
+	if (!ctx)
+		return ERR_PTR(-EINVAL);
+
+	kref_get(&ctx->refcount);
+
+	return ctx;
+}
+EXPORT_SYMBOL_GPL(media_device_context_get);
+
+void media_device_context_put(struct media_device_context *ctx)
+{
+	if (!ctx)
+		return;
+
+	kref_put(&ctx->refcount, media_device_release_context);
+}
+EXPORT_SYMBOL_GPL(media_device_context_put);
+
+struct media_device_context *media_device_context_get_from_fd(unsigned int fd)
+{
+	struct media_device_context *ctx;
+	struct file *filp = fget(fd);
+	struct media_device_fh *fh;
+
+	if (!filp)
+		return NULL;
+
+	fh = media_device_fh(filp);
+	ctx = media_device_context_get(fh->context);
+	fput(filp);
+
+	return ctx;
+}
+EXPORT_SYMBOL_GPL(media_device_context_get_from_fd);
+
+int media_device_init_context(struct media_device *mdev,
+			      struct media_device_context *ctx)
+{
+	ctx->mdev = mdev;
+	INIT_LIST_HEAD(&ctx->contexts);
+	mutex_init(&ctx->lock);
+	kref_init(&ctx->refcount);
+
+	ctx->initialized = true;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(media_device_init_context);
+
+void media_device_cleanup_context(struct media_device_context *ctx)
+{
+	mutex_destroy(&ctx->lock);
+	list_del_init(&ctx->contexts);
+}
+EXPORT_SYMBOL_GPL(media_device_cleanup_context);
+
+int media_device_bind_context(struct media_device_context *mdev_context,
+			      struct media_entity_context *context)
+{
+	struct media_entity_context *entry;
+
+	if (WARN_ON(!mdev_context || !context))
+		return -EINVAL;
+
+	guard(mutex)(&mdev_context->lock);
+
+	/* Make sure the entity has not been bound already. */
+	list_for_each_entry(entry, &mdev_context->contexts, list) {
+		if (entry == context)
+			return -EINVAL;
+	}
+
+	list_add_tail(&context->list, &mdev_context->contexts);
+	context->mdev_context = media_device_context_get(mdev_context);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(media_device_bind_context);
+
+int media_device_unbind_context(struct media_entity_context *context)
+{
+	struct media_device_context *mdev_context = context->mdev_context;
+	struct media_entity_context *entry;
+	struct media_entity_context *tmp;
+
+	if (WARN_ON(!mdev_context || !context))
+		return -EINVAL;
+
+	guard(mutex)(&mdev_context->lock);
+	list_for_each_entry_safe(entry, tmp, &mdev_context->contexts, list) {
+		if (entry != context)
+			continue;
+
+		list_del(&entry->list);
+		media_device_context_put(mdev_context);
+		entry->mdev_context = NULL;
+
+		return 0;
+	}
+
+	WARN(true, "Media entity context is not bound to any media context\n");
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(media_device_unbind_context);
+
+struct media_entity_context *
+media_device_get_entity_context(struct media_device_context *mdev_context,
+				struct media_entity *entity)
+{
+	struct media_entity_context *entry;
+
+	guard(mutex)(&mdev_context->lock);
+
+	list_for_each_entry(entry, &mdev_context->contexts, list) {
+		if (entry->entity == entity)
+			return media_entity_context_get(entry);
+	}
+
+	return ERR_PTR(-EINVAL);
+}
+EXPORT_SYMBOL(media_device_get_entity_context);
+
 #if IS_ENABLED(CONFIG_PCI)
 void media_device_pci_init(struct media_device *mdev,
 			   struct pci_dev *pci_dev,
diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index b4a9f0a0aa7353d7a3333f20903980956b3df4a7..7bc276c725f974539ea06e3882d004b81be1de68 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -1717,5 +1717,6 @@ EXPORT_SYMBOL_GPL(media_entity_init_context);
 
 void media_entity_cleanup_context(struct media_entity_context *ctx)
 {
+	media_device_unbind_context(ctx);
 }
 EXPORT_SYMBOL_GPL(media_entity_cleanup_context);
diff --git a/include/media/media-device.h b/include/media/media-device.h
index 2fc750efef7c43814f019f12078e9c96c1bd6bf9..2ea8fce9ba75700286961f1622584372a954cb8a 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -18,10 +18,73 @@
 
 #include <media/media-devnode.h>
 #include <media/media-entity.h>
+#include <media/media-fh.h>
 
 struct ida;
 struct media_device;
 
+/**
+ * struct media_device_context - Media device context
+ * @mdev: The media device this context is associated with
+ * @refcount: The kref reference counter
+ * @lock: Protects the entities contexts list
+ * @contexts: List of entity contexts associated with this media device context
+ * @initialized: Flag set to true by media_device_init_context()
+ *
+ * A media device context is created every time the media device gets opened by
+ * userspace. It is then uniquely identified for applications by the numerical
+ * file descriptor returned by a successful call to open() and is associated
+ * with an instance of :c:type:`media_device_fh`.
+ *
+ * Media device contexts are ref-counted and thus freed once the last reference
+ * to them is released.
+ *
+ * A media device context groups together the media entity contexts registered
+ * on a video device or v4l2 subdevice that has been associated with a media
+ * device context. The association between a media entity context and media
+ * device context is called 'bounding', and the result of bounding is to create
+ * an 'execution context' independent from other execution contexts.
+ *
+ * An entity context is bound to a media device context by a call to the
+ * VIDIOC_BIND_CONTEXT ioctl on video devices and by a call to
+ * VIDIOC_SUBDEV_BIND_CONTEXT on subdevices by userspace. The bounding operation
+ * groups together entity contexts to the same media device context. As video
+ * devices and v4l2 subdevices devnodes can be opened multiple times, each file
+ * descriptor resulting from a successful open() call can be bound to a
+ * different media device context.
+ *
+ * Creating execution contexts by bounding video entity contexts to a media
+ * device context allows userspace to effectively multiplex the usage of a
+ * media graph and of the device nodes that are part of it.
+ *
+ * In order to create an execution context userspace should:
+ *
+ * 1) Open the media device to create a media device context identified by the
+ * file descriptor returned by a successful 'open()' call
+ * 2) Open the video device or v4l2 subdevice and bind the file descriptors to
+ * the media device context by calling the VIDIOC_BIND_CONTEXT and
+ * VIDIOC_SUBDEV_BIND_CONTEXT ioctls
+ *
+ * All devices bound to the same media device context are now part of the same
+ * execution context. From this point on all the operations performed on a file
+ * descriptor bound to a media device context are independent from operations
+ * performed on a file descriptor bound to a different execution context.
+ *
+ * Binding an entity context to a media device context increases the media
+ * device context reference count. This guarantees that references to media
+ * device context are valid as long as there are valid entity contexts that
+ * refers to it. Symmetrically, unbinding an entity context from a media
+ * device context decreases the media device context reference count.
+ */
+struct media_device_context {
+	struct media_device *mdev;
+	struct kref refcount;
+	/* Protects the 'contexts' list */
+	struct mutex lock;
+	struct list_head contexts;
+	bool initialized;
+};
+
 /**
  * struct media_entity_notify - Media Entity Notify
  *
@@ -62,6 +125,13 @@ struct media_entity_notify {
  *	       request (and thus the buffer) must be available to the driver.
  *	       And once a buffer is queued, then the driver can complete
  *	       or delete objects from the request before req_queue exits.
+ * @alloc_context: Allocate a media device context. The operation allows drivers to
+ *		   allocate a driver-specific structure that embeds a
+ *		   media_device_context instance as first member where to store
+ *		   driver-specific information that are global to all device
+ *		   contexts part of media device context. Returns 0 on success a
+ *		   negative error code otherwise.
+ * @destroy_context: Release a media device context.
  */
 struct media_device_ops {
 	int (*link_notify)(struct media_link *link, u32 flags,
@@ -70,6 +140,9 @@ struct media_device_ops {
 	void (*req_free)(struct media_request *req);
 	int (*req_validate)(struct media_request *req);
 	void (*req_queue)(struct media_request *req);
+	int (*alloc_context)(struct media_device *mdev,
+			     struct media_device_context **ctx);
+	void (*destroy_context)(struct media_device_context *ctx);
 };
 
 /**
@@ -298,6 +371,144 @@ int __must_check __media_device_register(struct media_device *mdev,
  */
 void media_device_unregister(struct media_device *mdev);
 
+/* -----------------------------------------------------------------------------
+ * media device context handling
+ */
+
+/**
+ * media_device_context_get - Increase the media device context reference count
+ *			      and return a reference to it
+ * @ctx: The media device context
+ */
+struct media_device_context *
+media_device_context_get(struct media_device_context *ctx);
+
+/**
+ * media_device_context_put - Decrease the media device context reference count
+ * @ctx: The media device context
+ */
+void media_device_context_put(struct media_device_context *ctx);
+
+/**
+ * media_device_context_get_from_fd - Get the media device context associated with a
+ *				      numerical file descriptor
+ *
+ * @fd: the numerical file descriptor
+ *
+ * A media device context is created whenever the media device devnode is opened
+ * by userspace. It is then associated uniquely with a numerical file descriptor
+ * which is unique in the userspace process context.
+ *
+ * This function allows to retrieve the media device associated with such
+ * numerical file descriptor and increases the media device context reference
+ * count to guarantee the returned reference stays valid at least until the
+ * caller does not call media_device_context_put().
+ *
+ * Caller of this function are required to put the returned media device context
+ * once they are done with it.
+ *
+ * The intended caller of this function is the VIDIOC_BIND_CONTEXT ioctl handler
+ * which need to get the media device contexts associated to a numerical file
+ * descriptor.
+ */
+struct media_device_context *media_device_context_get_from_fd(unsigned int fd);
+
+/**
+ * media_device_init_context - Initialize the media device context
+ *
+ * @mdev: The media device this context belongs to
+ * @ctx: The media device context to initialize
+ *
+ * Initialize the fields of a media device context. Device drivers that support
+ * multi context operations shall call this function in their implementation of
+ * media_device_operations.alloc_context()
+ */
+int media_device_init_context(struct media_device *mdev,
+			      struct media_device_context *ctx);
+
+/**
+ * media_device_cleanup_context - Cleanup the media device context
+ *
+ * @ctx: The media device context to clean up
+ *
+ * Cleanup a media device context. Device drivers that support multi context
+ * operations shall call this function in their implementation of
+ * media_device_operations.destroy_context() before releasing the memory allocated
+ * by media_device_operations.alloc_context().
+ */
+void media_device_cleanup_context(struct media_device_context *ctx);
+
+/**
+ * media_device_bind_context - Bind an entity context to a media device context
+ *
+ * @mdev_context: pointer to struct &media_device_context
+ * @context: the entity context to bind
+ *
+ * This function creates a mapping entry in the media device context that
+ * associates an entity context to the media entity it belongs to and stores it
+ * in a linked list so that they can be retrieved later.
+ *
+ * Binding an entity context to a media device context increases the media
+ * device context refcount.
+ *
+ * The intended caller of this function is the VIDIOC_BIND_CONTEXT ioctl handler
+ * that binds a newly created context to a media device context.
+ */
+int media_device_bind_context(struct media_device_context *mdev_context,
+			      struct media_entity_context *context);
+
+/**
+ * media_device_unbind_context - Unbind an entity context from a media device
+ *				 context
+ *
+ * @context: the entity context to unbind
+ *
+ * An entity context is unbound from a media device context when the file handle
+ * it is associated with gets closed.
+ *
+ * Unbinding an entity context from a media device context decreases the media
+ * device context refcount.
+ *
+ * Returns 0 if the context was bound to a media device context, -EINVAL
+ * otherwise.
+ */
+int media_device_unbind_context(struct media_entity_context *context);
+
+/**
+ * media_device_get_entity_context - Get the entity context associated with
+ *				     a media entity in a media device context
+ *
+ * @mdev_context: pointer to struct &media_device_context
+ * @entity: pointer to struct &media_entity that the entity context is
+ *	    associated with
+ *
+ * An entity context is uniquely associated with a media device context after it
+ * has been bound to it by a call to the VIDIOC_BIND_CONTEXT ioctl. This helper
+ * function retrieves the entity context associated with a media device context
+ * for a specific entity that represents a video device or a v4l2 subdevice.
+ *
+ * The reference count of the returned entity context is increased to guarantee
+ * the returned reference stays valid until the caller does not call
+ * media_entity_context_put().
+ *
+ * Drivers are not expected to call this function directly but should instead
+ * use the helpers provided by the video_device and v4l2_subdevice layers,
+ * video_device_context_get() and v4l2_subdev_get_context() respectively.
+ * Drivers are always required to decrease the returned context reference count
+ * by calling video_device_context_put() and v4l2_subdev_put_context().
+ *
+ * If no entity context has been associated with the media device context
+ * provided as first argument an error  pointer is returned. Drivers are
+ * required to always check the value returned by this function.
+ */
+struct media_entity_context *
+media_device_get_entity_context(struct media_device_context *mdev_context,
+				struct media_entity *entity);
+
+/*------------------------------------------------------------------------------
+ * Media entity handling
+ */
+
 /**
  * media_device_register_entity() - registers a media entity inside a
  *	previously registered media device.
diff --git a/include/media/media-fh.h b/include/media/media-fh.h
index 6f00744b81d6000a4b0c503fe6968dd7adcbb1c3..48ec266416dd288a008bc5f93db5eb7ec6b8859c 100644
--- a/include/media/media-fh.h
+++ b/include/media/media-fh.h
@@ -13,15 +13,20 @@
 
 #include <media/media-devnode.h>
 
+struct media_device_context;
+
 /**
  * struct media_device_fh - File handle specific information on MC
  *
  * @fh: The media device file handle
  * @mdev_list: This file handle in media device's list of file handles
+ * @context: The media device context associated with the file handle
  */
 struct media_device_fh {
 	struct media_devnode_fh fh;
 	struct list_head mdev_list;
+
+	struct media_device_context *context;
 };
 
 static inline struct media_device_fh *media_device_fh(struct file *filp)

-- 
2.49.0


