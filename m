Return-Path: <linux-media+bounces-47872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03559C93005
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 20:18:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4CED3AA317
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 19:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB97334C19;
	Fri, 28 Nov 2025 19:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qDjlNXHA"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B3033439C;
	Fri, 28 Nov 2025 19:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764357422; cv=none; b=hnIZQfYVvYvJVZS3PVenIrvDxKCyjp/tGqu5dP6zLwI6MDmVbudFYeHJMewivnUSgvBNdsmhKvqjSzl+ow3sdNy4/MGYAvolWuJlYdCnCnZjv9/ZZyMyc359EiOsVj8ge/lM2Uv4tZb2yc4Lh1VZnag7gXuZ0F5ja4ciAAVqm1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764357422; c=relaxed/simple;
	bh=q3f8HrAQ3LGVUwQFxC7xFKKhaSjndBXfTzQMsPMnXKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jzoc3FLTyCAY6cbk+FCWzqkniEkZXRAMWIy5+qgbH8z3m3/sZQeMRpw0zwRrTJkfAo0MMMMnfiFeyVG9j9r5uROwHzXzCjFA2Fo+4BTuHDQ9hn9+kvXEzZWY++Rq5zRXhqy+KYZal/Wr7O8pAcjDK+SA/6IyOrJll3Wk2lZ55nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qDjlNXHA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764357419;
	bh=q3f8HrAQ3LGVUwQFxC7xFKKhaSjndBXfTzQMsPMnXKg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qDjlNXHAU2S83pfSLMwUcmD9bEIbpU1x2edXzg5+alqx9/j/6qErr8M5fGhwyBY0j
	 w7vdFS43dVfBUidHOq0OPZGtjVBO57Mk3SqUb36LHu/QwWzc2ww+L4lY1+/bnKm6UE
	 CBDcifHxsEJqlzACGujmQycSFklF/tFYijNhcj2dSZX7tKMdwEShDPpThm6yhaptGz
	 taF25q18VtKPJ6bYJNCVj7Q1BnBfYW64lpom0ZujoydPH1K2ik5GsTCFgKdxysNAiy
	 1ZlESZ4YqBWz/4orbK28xso9eukIEL8mw5Yutj5DNTP7UVMCHZBGq67Hbf9HPsmwcJ
	 a51hmx3rlLo6w==
Received: from [192.168.13.3] (unknown [IPv6:2606:6d00:17:7b4b::c73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 733D117E13C1;
	Fri, 28 Nov 2025 20:16:57 +0100 (CET)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Fri, 28 Nov 2025 14:16:14 -0500
Subject: [PATCH v4 3/5] media: mc: add debugfs node to keep track of
 requests
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v4-3-c166bdd4625c@collabora.com>
References: <20251128-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v4-0-c166bdd4625c@collabora.com>
In-Reply-To: <20251128-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v4-0-c166bdd4625c@collabora.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com, 
 linux-media@vger.kernel.org, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
X-Mailer: b4 0.14.2

From: Hans Verkuil <hverkuil@kernel.org>

Keep track of the number of requests and request objects of a media
device. Helps to verify that all request-related memory is freed.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/mc/mc-device.c  | 30 ++++++++++++++++++++++++++++++
 drivers/media/mc/mc-devnode.c |  5 +++++
 drivers/media/mc/mc-request.c |  6 ++++++
 include/media/media-device.h  |  9 +++++++++
 include/media/media-devnode.h |  4 ++++
 include/media/media-request.h |  2 ++
 6 files changed, 56 insertions(+)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index c0dd4ae5722725f1744bc6fd6282d5c765438059..5a4465b290f006fe6da5a38a29b7c911aea6689f 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -679,6 +679,23 @@ void media_device_unregister_entity(struct media_entity *entity)
 }
 EXPORT_SYMBOL_GPL(media_device_unregister_entity);
 
+#ifdef CONFIG_DEBUG_FS
+/*
+ * Log the state of media requests. Very useful for debugging.
+ */
+static int media_device_requests(struct seq_file *file, void *priv)
+{
+	struct media_device *dev = dev_get_drvdata(file->private);
+
+	seq_printf(file, "number of requests: %d\n",
+		   atomic_read(&dev->num_requests));
+	seq_printf(file, "number of request objects: %d\n",
+		   atomic_read(&dev->num_request_objects));
+
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
+	debugfs_create_devm_seqfile(&devnode->dev, "requests",
+				    mdev->media_dir, media_device_requests);
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
index 6daa7aa9944226551c301905b885e9d36cf793a3..51260a7d6921cf030b5d1ccddba124c1e5328685 100644
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
@@ -231,6 +234,7 @@ int __must_check media_devnode_register(struct media_device *mdev,
 	if (devnode->parent)
 		devnode->dev.parent = devnode->parent;
 	dev_set_name(&devnode->dev, "media%d", devnode->minor);
+	dev_set_drvdata(&devnode->dev, mdev);
 	device_initialize(&devnode->dev);
 
 	/* Part 2: Initialize the character device */
@@ -309,6 +313,7 @@ static int __init media_devnode_init(void)
 
 static void __exit media_devnode_exit(void)
 {
+	debugfs_remove_recursive(media_debugfs_root);
 	bus_unregister(&media_bus_type);
 	unregister_chrdev_region(media_dev_t, MEDIA_NUM_DEVICES);
 }
diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
index 512e6969152792558537dd8a0736df82847ae210..ed88a936c28ae13d1316b1b9c940a75ea44ab3c6 100644
--- a/drivers/media/mc/mc-request.c
+++ b/drivers/media/mc/mc-request.c
@@ -75,6 +75,7 @@ static void media_request_release(struct kref *kref)
 		mdev->ops->req_free(req);
 	else
 		kfree(req);
+	atomic_dec(&mdev->num_requests);
 }
 
 void media_request_put(struct media_request *req)
@@ -326,6 +327,7 @@ int media_request_alloc(struct media_device *mdev, int *alloc_fd)
 
 	snprintf(req->debug_str, sizeof(req->debug_str), "%u:%d",
 		 atomic_inc_return(&mdev->request_id), fd);
+	atomic_inc(&mdev->num_requests);
 	dev_dbg(mdev->dev, "request: allocated %s\n", req->debug_str);
 
 	fd_install(fd, filp);
@@ -349,10 +351,12 @@ static void media_request_object_release(struct kref *kref)
 	struct media_request_object *obj =
 		container_of(kref, struct media_request_object, kref);
 	struct media_request *req = obj->req;
+	struct media_device *mdev = obj->mdev;
 
 	if (WARN_ON(req))
 		media_request_object_unbind(obj);
 	obj->ops->release(obj);
+	atomic_dec(&mdev->num_request_objects);
 }
 
 struct media_request_object *
@@ -417,6 +421,7 @@ int media_request_object_bind(struct media_request *req,
 	obj->req = req;
 	obj->ops = ops;
 	obj->priv = priv;
+	obj->mdev = req->mdev;
 
 	if (is_buffer)
 		list_add_tail(&obj->list, &req->objects);
@@ -424,6 +429,7 @@ int media_request_object_bind(struct media_request *req,
 		list_add(&obj->list, &req->objects);
 	req->num_incomplete_objects++;
 	ret = 0;
+	atomic_inc(&obj->mdev->num_request_objects);
 
 unlock:
 	spin_unlock_irqrestore(&req->lock, flags);
diff --git a/include/media/media-device.h b/include/media/media-device.h
index 53d2a16a70b0d9d6e5cc28fe1fc5d5ef384410d5..749c327e3c582c3c583e0394468321ccd6160da5 100644
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
index d27c1c646c2805171be3997d72210dd4d1a38e32..dbcabeffcb572ae707f5fe1f51ff719d451c6784 100644
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
index 3256fcf3709da58878a59d90722bee3224d97af6..43ed18c11b513ae7d4f28406f229abe58cad89ac 100644
--- a/include/media/media-request.h
+++ b/include/media/media-request.h
@@ -292,6 +292,7 @@ struct media_request_object_ops {
  * struct media_request_object - An opaque object that belongs to a media
  *				 request
  *
+ * @mdev: Media device this object belongs to
  * @ops: object's operations
  * @priv: object's priv pointer
  * @req: the request this object belongs to (can be NULL)
@@ -303,6 +304,7 @@ struct media_request_object_ops {
  * another struct that contains the actual data for this request object.
  */
 struct media_request_object {
+	struct media_device *mdev;
 	const struct media_request_object_ops *ops;
 	void *priv;
 	struct media_request *req;

-- 
2.51.0


