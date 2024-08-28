Return-Path: <linux-media+bounces-17030-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C589628DE
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 15:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB2EF1C21BEC
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 13:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B79188014;
	Wed, 28 Aug 2024 13:39:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D50218787C
	for <linux-media@vger.kernel.org>; Wed, 28 Aug 2024 13:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724852391; cv=none; b=p/Lc7StSNS1X+Kwc9082AOHYeq2uf11vq1shloEqg1SB0aYw3zeLd/XNCLJM2a+Hivs8i5nHiql3wn9+rH1bzSLVt5vek34lZxKvD1N5QFUqpOHiNWHw7SXitRLNZvASsH5rO2ct2aNZwSbMdb2H3/2970ezYpwig80sewT0oMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724852391; c=relaxed/simple;
	bh=ocwQH3on8Bipv1OsbdDYOURUtphA8l+O1gyIZbeIC2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ut4ONEG8c3c+tpgoXwELjxXTI/0CYC2y/00tZZEOA0z1XU+wHhYqjWcQe5jHsX47A7QeJ2NC/Vj57GjCcVhOE1MoXfXjfxUlxX/ynzSYmzsmQTMYVNy9rpWjmJq/Qbmv4WHlm7pl05Q+Z8Nr49OGhg6/wZk2DuxQOd7JTw2WJPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB30C58108;
	Wed, 28 Aug 2024 13:39:49 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 3/3] media: mc: add debugfs node to keep track of requests
Date: Wed, 28 Aug 2024 15:36:03 +0200
Message-ID: <a80e1ff00a1358c6c423de3d6c2bcff5dee42c2f.1724852163.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1724852163.git.hverkuil-cisco@xs4all.nl>
References: <cover.1724852163.git.hverkuil-cisco@xs4all.nl>
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
 drivers/media/mc/mc-device.c  | 30 ++++++++++++++++++++++++++++++
 drivers/media/mc/mc-devnode.c |  5 +++++
 drivers/media/mc/mc-request.c |  5 +++++
 include/media/media-device.h  |  9 +++++++++
 include/media/media-devnode.h |  4 ++++
 include/media/media-request.h |  2 ++
 6 files changed, 55 insertions(+)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index c0dd4ae57227..cf21bd8e8094 100644
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
@@ -748,6 +768,15 @@ int __must_check __media_device_register(struct media_device *mdev,
 
 	dev_dbg(mdev->dev, "Media device registered\n");
 
+#ifdef CONFIG_DEBUG_FS
+	if (!media_debugfs_root)
+		media_debugfs_root = debugfs_create_dir("media", NULL);
+	mdev->media_dir = debugfs_create_dir(dev_name(&devnode->dev),
+					     media_debugfs_root);
+	debugfs_create_devm_seqfile(&devnode->dev,
+		"requests", mdev->media_dir, media_device_requests);
+#endif
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(__media_device_register);
@@ -824,6 +853,7 @@ void media_device_unregister(struct media_device *mdev)
 
 	dev_dbg(mdev->dev, "Media device unregistered\n");
 
+	debugfs_remove_recursive(mdev->media_dir);
 	device_remove_file(&mdev->devnode->dev, &dev_attr_model);
 	media_devnode_unregister(mdev->devnode);
 	/* devnode free is handled in media_devnode_*() */
diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 318e267e798e..e01764fc1491 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -45,6 +45,9 @@ static dev_t media_dev_t;
 static DEFINE_MUTEX(media_devnode_lock);
 static DECLARE_BITMAP(media_devnode_nums, MEDIA_NUM_DEVICES);
 
+/* debugfs */
+struct dentry *media_debugfs_root;
+
 /* Called when the last user of the media device exits. */
 static void media_devnode_release(struct device *cd)
 {
@@ -237,6 +240,7 @@ int __must_check media_devnode_register(struct media_device *mdev,
 	if (devnode->parent)
 		devnode->dev.parent = devnode->parent;
 	dev_set_name(&devnode->dev, "media%d", devnode->minor);
+	dev_set_drvdata(&devnode->dev, mdev);
 	device_initialize(&devnode->dev);
 
 	/* Part 2: Initialize the character device */
@@ -314,6 +318,7 @@ static int __init media_devnode_init(void)
 
 static void __exit media_devnode_exit(void)
 {
+	debugfs_remove_recursive(media_debugfs_root);
 	bus_unregister(&media_bus_type);
 	unregister_chrdev_region(media_dev_t, MEDIA_NUM_DEVICES);
 }
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
index d27c1c646c28..dbcabeffcb57 100644
--- a/include/media/media-devnode.h
+++ b/include/media/media-devnode.h
@@ -20,9 +20,13 @@
 #include <linux/fs.h>
 #include <linux/device.h>
 #include <linux/cdev.h>
+#include <linux/debugfs.h>
 
 struct media_device;
 
+/* debugfs top-level media directory */
+extern struct dentry *media_debugfs_root;
+
 /*
  * Flag to mark the media_devnode struct as registered. Drivers must not touch
  * this flag directly, it will be set and cleared by media_devnode_register and
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


