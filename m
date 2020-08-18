Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CAD52487CA
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 16:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727914AbgHROhc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 10:37:32 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:47035 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727889AbgHROhY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 10:37:24 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 82jnkV8V2uuXO82jpkcevI; Tue, 18 Aug 2020 16:37:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597761441; bh=ICjYQB5FN5Nvomnsn6jeL/MFVzy5wXXFX1aa0mKUaHU=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=wXrutl/h40P/V0P7UKP7cXWsIFqSnmuGpKko5pWIomd967LB0ybWLC5yvsGyC5uxo
         EbK34WJhdA95+/MQDlAAsFGP5ar5KDj4p7tbr6g9CWtt8TfIkAdb3RlEwLv/uzJiP1
         9i8LJ0mLqlSHcCSAC3SGrR6KOsZvX4gNQNIk+cVW95OTnQWoqdgAJ8WsCcLuSJEyWB
         E7BqAWtZBLpFuHekPONGisD7s03mPABUlrJ+vOJf4jVfKz+BNbYQj8bzWPOdySH1G2
         V/KGHhTn+08CdxQtDlElrVhck94u750N4hbYYsAv0Abc8JgFixqRCfi9zjCYsxx//K
         vhPPn8PGAY+OA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 01/12] media/mc: keep track of outstanding requests
Date:   Tue, 18 Aug 2020 16:37:08 +0200
Message-Id: <20200818143719.102128-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200818143719.102128-1-hverkuil-cisco@xs4all.nl>
References: <20200818143719.102128-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfCuwSrPvT4fumm6uq5Q5WMyOX6OnYFqvqUTKnnAc42oTX5UrWuzWMQXEHZ0Xwab3bjAqBvapkeMtcnah8py0+THUdibAVA3JlkwbJKBA3FfrJVRuZCf9
 MutHBxYoEallZtP/q0OB2XnCJYFdu6h4EqCQrwiCWra8okfqXdZAkac5bbCbmkYM4fe4xJG4EgawT0xEbOL5+hT3oI9SgWjgRVgJ29iPievIqXhZJd6d629a
 vLCVQBuRiPUnJBSOtzjJGfW8g2/2zvya2zTX+mLp3FNEr3SVaCewyR1Wov6ClyHz5BVDVJeeN6e+zXNlMbcW5xoP9uhUmaOfWpjS5OYLoWNoNuaLH/wbAw26
 Wji31XDc
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It can be hard to debug if all requests and request objects are correctly
cleaned up when all related filehandles are closed.

This patch adds a new 'requests' debugfs entry if CONFIG_VIDEO_ADV_DEBUG
is set to report the number of open requests and request objects for a
given media device node.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/mc/mc-device.c  | 27 +++++++++++++++++++++++++++
 drivers/media/mc/mc-devnode.c | 13 +++++++++++++
 drivers/media/mc/mc-request.c |  5 +++++
 include/media/media-device.h  |  9 +++++++++
 include/media/media-devnode.h |  4 ++++
 include/media/media-request.h |  2 ++
 6 files changed, 60 insertions(+)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index da8088351135..6953e86b59bf 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -690,6 +690,23 @@ void media_device_unregister_entity(struct media_entity *entity)
 }
 EXPORT_SYMBOL_GPL(media_device_unregister_entity);
 
+#if IS_ENABLED(CONFIG_DEBUG_FS) && IS_ENABLED(CONFIG_VIDEO_ADV_DEBUG)
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
 /**
  * media_device_init() - initialize a media device
  * @mdev:	The media device
@@ -713,6 +730,8 @@ void media_device_init(struct media_device *mdev)
 	ida_init(&mdev->entity_internal_idx);
 
 	atomic_set(&mdev->request_id, 0);
+	atomic_set(&mdev->num_requests, 0);
+	atomic_set(&mdev->num_request_objects, 0);
 
 	dev_dbg(mdev->dev, "Media device initialized\n");
 }
@@ -765,6 +784,13 @@ int __must_check __media_device_register(struct media_device *mdev,
 
 	dev_dbg(mdev->dev, "Media device registered\n");
 
+#if IS_ENABLED(CONFIG_DEBUG_FS) && IS_ENABLED(CONFIG_VIDEO_ADV_DEBUG)
+	mdev->media_dir = debugfs_create_dir(dev_name(&devnode->dev),
+					     media_top_dir);
+	debugfs_create_devm_seqfile(&devnode->dev, "requests",
+				    mdev->media_dir, media_device_requests);
+#endif
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(__media_device_register);
@@ -842,6 +868,7 @@ void media_device_unregister(struct media_device *mdev)
 
 	dev_dbg(mdev->dev, "Media device unregistered\n");
 
+	debugfs_remove_recursive(mdev->media_dir);
 	device_remove_file(&mdev->devnode->dev, &dev_attr_model);
 	media_devnode_unregister(mdev->devnode);
 	/* devnode free is handled in media_devnode_*() */
diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index f11382afe23b..cb229556c989 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -45,6 +45,12 @@ static dev_t media_dev_t;
 static DEFINE_MUTEX(media_devnode_lock);
 static DECLARE_BITMAP(media_devnode_nums, MEDIA_NUM_DEVICES);
 
+/*
+ * debugfs
+ */
+struct dentry *media_top_dir;
+
+
 /* Called when the last user of the media device exits. */
 static void media_devnode_release(struct device *cd)
 {
@@ -252,6 +258,8 @@ int __must_check media_devnode_register(struct media_device *mdev,
 		goto cdev_add_error;
 	}
 
+	dev_set_drvdata(&devnode->dev, mdev);
+
 	/* Part 4: Activate this minor. The char device can now be used. */
 	set_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
 
@@ -304,6 +312,10 @@ static int __init media_devnode_init(void)
 		return ret;
 	}
 
+#if IS_ENABLED(CONFIG_DEBUG_FS) && IS_ENABLED(CONFIG_VIDEO_ADV_DEBUG)
+	media_top_dir = debugfs_create_dir("media", NULL);
+#endif
+
 	ret = bus_register(&media_bus_type);
 	if (ret < 0) {
 		unregister_chrdev_region(media_dev_t, MEDIA_NUM_DEVICES);
@@ -316,6 +328,7 @@ static int __init media_devnode_init(void)
 
 static void __exit media_devnode_exit(void)
 {
+	debugfs_remove_recursive(media_top_dir);
 	bus_unregister(&media_bus_type);
 	unregister_chrdev_region(media_dev_t, MEDIA_NUM_DEVICES);
 }
diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
index c0782fd96c59..3b013deaeb06 100644
--- a/drivers/media/mc/mc-request.c
+++ b/drivers/media/mc/mc-request.c
@@ -74,6 +74,7 @@ static void media_request_release(struct kref *kref)
 		mdev->ops->req_free(req);
 	else
 		kfree(req);
+	atomic_dec(&mdev->num_requests);
 }
 
 void media_request_put(struct media_request *req)
@@ -330,6 +331,7 @@ int media_request_alloc(struct media_device *mdev, int *alloc_fd)
 
 	snprintf(req->debug_str, sizeof(req->debug_str), "%u:%d",
 		 atomic_inc_return(&mdev->request_id), fd);
+	atomic_inc(&mdev->num_requests);
 	dev_dbg(mdev->dev, "request: allocated %s\n", req->debug_str);
 
 	fd_install(fd, filp);
@@ -357,6 +359,7 @@ static void media_request_object_release(struct kref *kref)
 	if (WARN_ON(req))
 		media_request_object_unbind(obj);
 	obj->ops->release(obj);
+	atomic_dec(&obj->mdev->num_request_objects);
 }
 
 struct media_request_object *
@@ -420,6 +423,7 @@ int media_request_object_bind(struct media_request *req,
 	obj->req = req;
 	obj->ops = ops;
 	obj->priv = priv;
+	obj->mdev = req->mdev;
 
 	if (is_buffer)
 		list_add_tail(&obj->list, &req->objects);
@@ -427,6 +431,7 @@ int media_request_object_bind(struct media_request *req,
 		list_add(&obj->list, &req->objects);
 	req->num_incomplete_objects++;
 	ret = 0;
+	atomic_inc(&obj->mdev->num_request_objects);
 
 unlock:
 	spin_unlock_irqrestore(&req->lock, flags);
diff --git a/include/media/media-device.h b/include/media/media-device.h
index 1345e6da688a..d95d2b2ef619 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -13,6 +13,7 @@
 
 #include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/atomic.h>
 
 #include <media/media-devnode.h>
 #include <media/media-entity.h>
@@ -106,6 +107,9 @@ struct media_device_ops {
  * @req_queue_mutex: Serialise the MEDIA_REQUEST_IOC_QUEUE ioctl w.r.t.
  *		     other operations that stop or start streaming.
  * @request_id: Used to generate unique request IDs
+ * @num_requests: number of associated requests
+ * @num_request_objects: number of associated request objects
+ * @media_dir:	DebugFS media directory
  *
  * This structure represents an abstract high-level media device. It allows easy
  * access to entities and provides basic media device-level support. The
@@ -179,6 +183,11 @@ struct media_device {
 
 	struct mutex req_queue_mutex;
 	atomic_t request_id;
+	atomic_t num_requests;
+	atomic_t num_request_objects;
+
+	/* debugfs */
+	struct dentry *media_dir;
 };
 
 /* We don't need to include pci.h or usb.h here */
diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
index d27c1c646c28..ec47216420c7 100644
--- a/include/media/media-devnode.h
+++ b/include/media/media-devnode.h
@@ -20,9 +20,13 @@
 #include <linux/fs.h>
 #include <linux/device.h>
 #include <linux/cdev.h>
+#include <linux/debugfs.h>
 
 struct media_device;
 
+/* DebugFS top-level media directory */
+extern struct dentry *media_top_dir;
+
 /*
  * Flag to mark the media_devnode struct as registered. Drivers must not touch
  * this flag directly, it will be set and cleared by media_devnode_register and
diff --git a/include/media/media-request.h b/include/media/media-request.h
index 3cd25a2717ce..580594c9398d 100644
--- a/include/media/media-request.h
+++ b/include/media/media-request.h
@@ -256,6 +256,7 @@ struct media_request_object_ops {
  * struct media_request_object - An opaque object that belongs to a media
  *				 request
  *
+ * @mdev: Media device this object belongs to
  * @ops: object's operations
  * @priv: object's priv pointer
  * @req: the request this object belongs to (can be NULL)
@@ -267,6 +268,7 @@ struct media_request_object_ops {
  * another struct that contains the actual data for this request object.
  */
 struct media_request_object {
+	struct media_device *mdev;
 	const struct media_request_object_ops *ops;
 	void *priv;
 	struct media_request *req;
-- 
2.27.0

