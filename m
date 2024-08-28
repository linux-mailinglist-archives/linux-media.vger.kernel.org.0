Return-Path: <linux-media+bounces-17021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E3396279A
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 14:46:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD2081F277A3
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 12:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F219017C9BA;
	Wed, 28 Aug 2024 12:46:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9805417BEB8
	for <linux-media@vger.kernel.org>; Wed, 28 Aug 2024 12:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724849166; cv=none; b=Ko1tggD96qmIa6INLmtaN9+4Iki4DojFNgPp11WgZGo5uu+nqXhuXW74LLOx3OhYa5RC9j6mn46h7u4dGX+qKs+5im38N+nhhbcJLAC81oDrbdWGLrflnJV8hPnLegvkd565LNAzTavNHLGzUuFAG3UNSF9699Psb5+pti+DShQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724849166; c=relaxed/simple;
	bh=gfmREX0d0IMvyhFq/V7B7EpWHKiNOBQyM8CbzKnsFDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dVUmQB0Yl6NyuLPPKc4/2O23XPZ8Rzi8q/HgNnQrayXuQju2ZQQi+nmPwiIE2vMXNpepnEbcI6XbrZYYzb2p3Xi+3ntl55FBKN4u1FPWq3mG/ZSfJeCRywnSNIsVAJKgUVe3mf3AAV6HYpFnsM2nScXk2D5WDqw2+AIdgDIrl6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2148FC4AF54;
	Wed, 28 Aug 2024 12:46:04 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 4/4] media: mc: add debugfs node to keep track of requests
Date: Wed, 28 Aug 2024 14:37:40 +0200
Message-ID: <16093a7e75882e375526796829581cc94389e7e9.1724848660.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1724848660.git.hverkuil-cisco@xs4all.nl>
References: <cover.1724848660.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Keep track of the number of requests and request objects of a media
device. Helps to verify that all request-related memory is freed.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/mc/mc-device.c  | 28 ++++++++++++++++++++++++++++
 drivers/media/mc/mc-devnode.c |  1 +
 drivers/media/mc/mc-request.c |  5 +++++
 include/media/media-device.h  |  9 +++++++++
 include/media/media-devnode.h |  1 +
 include/media/media-request.h |  2 ++
 6 files changed, 46 insertions(+)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index c0dd4ae57227..954e20eaa158 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -679,6 +679,23 @@ void media_device_unregister_entity(struct media_entity *entity)
 }
 EXPORT_SYMBOL_GPL(media_device_unregister_entity);
 
+#ifdef CONFIG_DEBUG_FS
+/*
+ * Log the state of media requests.
+ * Very useful for debugging.
+ */
+static int media_device_requests(struct seq_file *file, void *priv)
+{
+	struct media_device *dev = dev_get_drvdata(file->private);
+
+	seq_printf(file, "number of requests: %d\n",
+		   atomic_read(&dev->num_requests));
+	seq_printf(file, "number of request objects: %d\n",
+		   atomic_read(&dev->num_request_objects));
+	return 0;
+}
+#endif
+
 void media_device_init(struct media_device *mdev)
 {
 	INIT_LIST_HEAD(&mdev->entities);
@@ -697,6 +714,9 @@ void media_device_init(struct media_device *mdev)
 		media_set_bus_info(mdev->bus_info, sizeof(mdev->bus_info),
 				   mdev->dev);
 
+	atomic_set(&mdev->num_requests, 0);
+	atomic_set(&mdev->num_request_objects, 0);
+
 	dev_dbg(mdev->dev, "Media device initialized\n");
 }
 EXPORT_SYMBOL_GPL(media_device_init);
@@ -748,6 +768,13 @@ int __must_check __media_device_register(struct media_device *mdev,
 
 	dev_dbg(mdev->dev, "Media device registered\n");
 
+#ifdef CONFIG_DEBUG_FS
+	mdev->media_dir = debugfs_create_dir(dev_name(&devnode->dev),
+					     media_debugfs_root());
+	debugfs_create_devm_seqfile(&devnode->dev,
+		"requests", mdev->media_dir, media_device_requests);
+#endif
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(__media_device_register);
@@ -824,6 +851,7 @@ void media_device_unregister(struct media_device *mdev)
 
 	dev_dbg(mdev->dev, "Media device unregistered\n");
 
+	debugfs_remove_recursive(mdev->media_dir);
 	device_remove_file(&mdev->devnode->dev, &dev_attr_model);
 	media_devnode_unregister(mdev->devnode);
 	/* devnode free is handled in media_devnode_*() */
diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 906c10fe26f0..758651b43eeb 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -250,6 +250,7 @@ int __must_check media_devnode_register(struct media_device *mdev,
 	if (devnode->parent)
 		devnode->dev.parent = devnode->parent;
 	dev_set_name(&devnode->dev, "media%d", devnode->minor);
+	dev_set_drvdata(&devnode->dev, mdev);
 	device_initialize(&devnode->dev);
 
 	/* Part 2: Initialize the character device */
diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
index 1ad725522a7d..7f3d84e60ef8 100644
--- a/drivers/media/mc/mc-request.c
+++ b/drivers/media/mc/mc-request.c
@@ -75,6 +75,7 @@ static void media_request_release(struct kref *kref)
 		mdev->ops->req_free(req);
 	else
 		kfree(req);
+	atomic_dec(&mdev->num_requests);
 }
 
 void media_request_put(struct media_request *req)
@@ -332,6 +333,7 @@ int media_request_alloc(struct media_device *mdev, int *alloc_fd)
 
 	snprintf(req->debug_str, sizeof(req->debug_str), "%u:%d",
 		 atomic_inc_return(&mdev->request_id), fd);
+	atomic_inc(&mdev->num_requests);
 	dev_dbg(mdev->dev, "request: allocated %s\n", req->debug_str);
 
 	fd_install(fd, filp);
@@ -359,6 +361,7 @@ static void media_request_object_release(struct kref *kref)
 	if (WARN_ON(req))
 		media_request_object_unbind(obj);
 	obj->ops->release(obj);
+	atomic_dec(&obj->mdev->num_request_objects);
 }
 
 struct media_request_object *
@@ -423,6 +426,7 @@ int media_request_object_bind(struct media_request *req,
 	obj->req = req;
 	obj->ops = ops;
 	obj->priv = priv;
+	obj->mdev = req->mdev;
 
 	if (is_buffer)
 		list_add_tail(&obj->list, &req->objects);
@@ -430,6 +434,7 @@ int media_request_object_bind(struct media_request *req,
 		list_add(&obj->list, &req->objects);
 	req->num_incomplete_objects++;
 	ret = 0;
+	atomic_inc(&obj->mdev->num_request_objects);
 
 unlock:
 	spin_unlock_irqrestore(&req->lock, flags);
diff --git a/include/media/media-device.h b/include/media/media-device.h
index 53d2a16a70b0..749c327e3c58 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -11,6 +11,7 @@
 #ifndef _MEDIA_DEVICE_H
 #define _MEDIA_DEVICE_H
 
+#include <linux/atomic.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
@@ -106,6 +107,9 @@ struct media_device_ops {
  * @ops:	Operation handler callbacks
  * @req_queue_mutex: Serialise the MEDIA_REQUEST_IOC_QUEUE ioctl w.r.t.
  *		     other operations that stop or start streaming.
+ * @num_requests: number of associated requests
+ * @num_request_objects: number of associated request objects
+ * @media_dir:	DebugFS media directory
  * @request_id: Used to generate unique request IDs
  *
  * This structure represents an abstract high-level media device. It allows easy
@@ -179,6 +183,11 @@ struct media_device {
 	const struct media_device_ops *ops;
 
 	struct mutex req_queue_mutex;
+	atomic_t num_requests;
+	atomic_t num_request_objects;
+
+	/* debugfs */
+	struct dentry *media_dir;
 	atomic_t request_id;
 };
 
diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
index e9f272ebd3d0..deeec079151e 100644
--- a/include/media/media-devnode.h
+++ b/include/media/media-devnode.h
@@ -20,6 +20,7 @@
 #include <linux/fs.h>
 #include <linux/device.h>
 #include <linux/cdev.h>
+#include <linux/debugfs.h>
 
 struct media_device;
 
diff --git a/include/media/media-request.h b/include/media/media-request.h
index 6434758ab597..db0d9edfb38f 100644
--- a/include/media/media-request.h
+++ b/include/media/media-request.h
@@ -290,6 +290,7 @@ struct media_request_object_ops {
  * struct media_request_object - An opaque object that belongs to a media
  *				 request
  *
+ * @mdev: Media device this object belongs to
  * @ops: object's operations
  * @priv: object's priv pointer
  * @req: the request this object belongs to (can be NULL)
@@ -301,6 +302,7 @@ struct media_request_object_ops {
  * another struct that contains the actual data for this request object.
  */
 struct media_request_object {
+	struct media_device *mdev;
 	const struct media_request_object_ops *ops;
 	void *priv;
 	struct media_request *req;
-- 
2.43.0


