Return-Path: <linux-media+bounces-29947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBD7A84836
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 17:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A7814C8321
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 15:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6AD81EF37A;
	Thu, 10 Apr 2025 15:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Azi4mOcK"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9111EE017;
	Thu, 10 Apr 2025 15:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744299613; cv=none; b=YfYMzdi5exx/qeot74IyX1L60D4NLh0xDn7oq97S/bn13OafyrEW7M/9A3NcALlaX4T7JsYAyi5b2kU2HngOJZnW+s/FfQGaLW73homb3NsHSJ1PNL9BIK9ZhIW7RQPucWAbEajWOuMd8zSJsytklmSKSdEZ+3ppWj0e1U5WXbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744299613; c=relaxed/simple;
	bh=svcXHG7mzYxuKH0nfv7UTBJY7tAWrQCK9JOpQwcqVZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LRA0M1nBe4rae+Rhul6qRmIgKnnKNcFzWnvdKZT7cDPQYcc6JuUtaSKRbO90DblqlAqDFIeebCwZ7aQbe7YbnGraKmAOqqkpKwsSSSWIe5LW871BQ3zgjinCnPURF1KwMs6JWAoOY1xvseVRKRivH70wGn64pPHaoL4DIlCZw1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Azi4mOcK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744299608;
	bh=svcXHG7mzYxuKH0nfv7UTBJY7tAWrQCK9JOpQwcqVZM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Azi4mOcKV374rBoLegYSIIbRXVNuTunQkhMXhb9M92MwiWus0okEq0aHVDqngxL56
	 tJdysGrou8KUtSdhfdVaNYEflXb80UguvF2KxzGY4TVh3AeUlgH8MKJgi4z86RJbf3
	 hr7o+VU5LZHGo8vPKAZfqxSHog51V42ZEj759o0QPi2+yuBGsgrZWmoftaU1KMs3tQ
	 /YILBdAoYpPlDjyUn5lk/I57owmv/IWD+/fbYrXDQfsI0t0HOFgQV97EO6qB6pZ+L1
	 f71J1pxHAOmOyl4wszMC3lB9QdYmiGosw+Rf+y0Y/QYDwVILvysAQwhcsTIrUeDkaU
	 yjYhdQ+HJS6qg==
Received: from [192.168.13.180] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3786117E1072;
	Thu, 10 Apr 2025 17:40:06 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Thu, 10 Apr 2025 11:39:58 -0400
Subject: [PATCH v2 3/5] media: mc: add debugfs node to keep track of
 requests
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-3-5b99ec0450e6@collabora.com>
References: <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-0-5b99ec0450e6@collabora.com>
In-Reply-To: <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-0-5b99ec0450e6@collabora.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com, 
 linux-media@vger.kernel.org, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2

From: Hans Verkuil <hverkuil@xs4all.nl>

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
index c0dd4ae5722725f1744bc6fd6282d5c765438059..5a458160200afb540d8014fed42d8bf2dab9c8c3 100644
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
index 56444edaf13651874331e7c04e86b0a585067d38..d0a8bcc11dd6350fdbc04add70f62de2c5f01178 100644
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
@@ -236,6 +239,7 @@ int __must_check media_devnode_register(struct media_device *mdev,
 	if (devnode->parent)
 		devnode->dev.parent = devnode->parent;
 	dev_set_name(&devnode->dev, "media%d", devnode->minor);
+	dev_set_drvdata(&devnode->dev, mdev);
 	device_initialize(&devnode->dev);
 
 	/* Part 2: Initialize the character device */
@@ -313,6 +317,7 @@ static int __init media_devnode_init(void)
 
 static void __exit media_devnode_exit(void)
 {
+	debugfs_remove_recursive(media_debugfs_root);
 	bus_unregister(&media_bus_type);
 	unregister_chrdev_region(media_dev_t, MEDIA_NUM_DEVICES);
 }
diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
index 398d0806d1d274eb8c454fc5c37b77476abe1e74..829e35a5d56d41c52cc583cdea1c959bcb4fce60 100644
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
index 645d18907be7148ca50dcc9248ff06bd8ccdf953..c8dad380c40767f192f30dcf1c69b9ad1310f449 100644
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
2.49.0


