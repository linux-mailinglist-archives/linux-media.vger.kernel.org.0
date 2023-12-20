Return-Path: <linux-media+bounces-2765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59688819CEC
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2BC91F21ECD
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E22720DD5;
	Wed, 20 Dec 2023 10:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bdWa3xPq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B0620B1A
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 10:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703068643; x=1734604643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PhOuyz9RnP0CM07VW5m7jpNcMxocyOzQCNfex26x3Ig=;
  b=bdWa3xPqQahrtOv08oQRukc0CnqwSfUJVeCB7XLkt2nxKy/laftu7HcE
   6xo90iz8XlnQ5fnBqj/mXQT1aAXmrg85aplWugt/5M/AKYa7Mog3QWHSu
   wmgZzDPl9b00vwc6GwqyxsQBmp6kLX1nfN7YUm2w+1vkiRpFkx5dsr1R5
   oNF/jmOPY0+XDb71X1cRFebenfazWj/g8YaZdVZ0UMISfQDLRU58uX9vY
   2le6uUH6bLh8JsaABqSpprMnbHlhe4lzZvkfVv7OhhCN6V6g9Qfpi0Q2i
   DgrIiLHM7NjpeYU08sMq/ZRgHE389YSmeSJ/tIsGGoS80wH8hbMW1NMLf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9174319"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9174319"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769544239"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769544239"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:20 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9685F12098A;
	Wed, 20 Dec 2023 12:37:17 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 06/29] Revert "[media] media-device: dynamically allocate struct media_devnode"
Date: Wed, 20 Dec 2023 12:36:50 +0200
Message-Id: <20231220103713.113386-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit a087ce704b80 ("[media] media-device: dynamically
allocate struct media_devnode"). The commit was part of an original
patchset to avoid crashes when an unregistering device is in use.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/mc/mc-device.c                | 44 +++++++--------------
 drivers/media/mc/mc-devnode.c               |  7 +---
 drivers/media/usb/au0828/au0828-core.c      |  4 +-
 drivers/media/usb/uvc/uvc_driver.c          |  2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c |  2 +-
 include/media/media-device.h                |  5 ++-
 include/media/media-devnode.h               | 15 +------
 7 files changed, 25 insertions(+), 54 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index 4772a7f55112..d4553a3705f5 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -435,7 +435,7 @@ static long media_device_ioctl(struct file *filp, unsigned int cmd,
 			       unsigned long __arg)
 {
 	struct media_devnode *devnode = media_devnode_data(filp);
-	struct media_device *dev = devnode->media_dev;
+	struct media_device *dev = to_media_device(devnode);
 	const struct media_ioctl_info *info;
 	void __user *arg = (void __user *)__arg;
 	char __karg[256], *karg = __karg;
@@ -519,7 +519,7 @@ static long media_device_compat_ioctl(struct file *filp, unsigned int cmd,
 				      unsigned long arg)
 {
 	struct media_devnode *devnode = media_devnode_data(filp);
-	struct media_device *dev = devnode->media_dev;
+	struct media_device *dev = to_media_device(devnode);
 	long ret;
 
 	switch (cmd) {
@@ -555,8 +555,7 @@ static const struct media_file_operations media_device_fops = {
 static ssize_t model_show(struct device *cd,
 			  struct device_attribute *attr, char *buf)
 {
-	struct media_devnode *devnode = to_media_devnode(cd);
-	struct media_device *mdev = devnode->media_dev;
+	struct media_device *mdev = to_media_device(to_media_devnode(cd));
 
 	return sprintf(buf, "%.*s\n", (int)sizeof(mdev->model), mdev->model);
 }
@@ -714,34 +713,23 @@ EXPORT_SYMBOL_GPL(media_device_cleanup);
 int __must_check __media_device_register(struct media_device *mdev,
 					 struct module *owner)
 {
-	struct media_devnode *devnode;
 	int ret;
 
-	devnode = kzalloc(sizeof(*devnode), GFP_KERNEL);
-	if (!devnode)
-		return -ENOMEM;
-
 	/* Register the device node. */
-	mdev->devnode = devnode;
-	devnode->fops = &media_device_fops;
-	devnode->parent = mdev->dev;
-	devnode->release = media_device_release;
+	mdev->devnode.fops = &media_device_fops;
+	mdev->devnode.parent = mdev->dev;
+	mdev->devnode.release = media_device_release;
 
 	/* Set version 0 to indicate user-space that the graph is static */
 	mdev->topology_version = 0;
 
-	ret = media_devnode_register(mdev, devnode, owner);
-	if (ret < 0) {
-		mdev->devnode = NULL;
-		kfree(devnode);
+	ret = media_devnode_register(&mdev->devnode, owner);
+	if (ret < 0)
 		return ret;
-	}
 
-	ret = device_create_file(&devnode->dev, &dev_attr_model);
+	ret = device_create_file(&mdev->devnode.dev, &dev_attr_model);
 	if (ret < 0) {
-		mdev->devnode = NULL;
-		media_devnode_unregister(devnode);
-		kfree(devnode);
+		media_devnode_unregister(&mdev->devnode);
 		return ret;
 	}
 
@@ -791,7 +779,7 @@ void media_device_unregister(struct media_device *mdev)
 	mutex_lock(&mdev->graph_mutex);
 
 	/* Check if mdev was ever registered at all */
-	if (!media_devnode_is_registered(mdev->devnode)) {
+	if (!media_devnode_is_registered(&mdev->devnode)) {
 		mutex_unlock(&mdev->graph_mutex);
 		return;
 	}
@@ -818,13 +806,9 @@ void media_device_unregister(struct media_device *mdev)
 
 	mutex_unlock(&mdev->graph_mutex);
 
-	dev_dbg(mdev->dev, "Media device unregistered\n");
-
-	/* Check if mdev devnode was registered */
-	if (media_devnode_is_registered(mdev->devnode)) {
-		device_remove_file(&mdev->devnode->dev, &dev_attr_model);
-		media_devnode_unregister(mdev->devnode);
-	}
+	device_remove_file(&mdev->devnode.dev, &dev_attr_model);
+	dev_dbg(mdev->dev, "Media device unregistering\n");
+	media_devnode_unregister(&mdev->devnode);
 }
 EXPORT_SYMBOL_GPL(media_device_unregister);
 
diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index fabcd646679b..ce93ab9be676 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -32,7 +32,6 @@
 #include <linux/uaccess.h>
 
 #include <media/media-devnode.h>
-#include <media/media-device.h>
 
 #define MEDIA_NUM_DEVICES	256
 #define MEDIA_NAME		"media"
@@ -63,8 +62,6 @@ static void media_devnode_release(struct device *cd)
 	/* Release media_devnode and perform other cleanups as needed. */
 	if (devnode->release)
 		devnode->release(devnode);
-
-	kfree(devnode);
 }
 
 static struct bus_type media_bus_type = {
@@ -210,8 +207,7 @@ static const struct file_operations media_devnode_fops = {
 	.llseek = no_llseek,
 };
 
-int __must_check media_devnode_register(struct media_device *mdev,
-					struct media_devnode *devnode,
+int __must_check media_devnode_register(struct media_devnode *devnode,
 					struct module *owner)
 {
 	int minor;
@@ -230,7 +226,6 @@ int __must_check media_devnode_register(struct media_device *mdev,
 	mutex_unlock(&media_devnode_lock);
 
 	devnode->minor = minor;
-	devnode->media_dev = mdev;
 
 	/* Part 2: Initialize the media and character devices */
 	cdev_init(&devnode->cdev, &media_devnode_fops);
diff --git a/drivers/media/usb/au0828/au0828-core.c b/drivers/media/usb/au0828/au0828-core.c
index 1e246b47766d..4101e12cda5a 100644
--- a/drivers/media/usb/au0828/au0828-core.c
+++ b/drivers/media/usb/au0828/au0828-core.c
@@ -128,7 +128,7 @@ static void au0828_unregister_media_device(struct au0828_dev *dev)
 	struct media_device *mdev = dev->media_dev;
 	struct media_entity_notify *notify, *nextp;
 
-	if (!mdev || !media_devnode_is_registered(mdev->devnode))
+	if (!mdev || !media_devnode_is_registered(&mdev->devnode))
 		return;
 
 	/* Remove au0828 entity_notify callbacks */
@@ -566,7 +566,7 @@ static int au0828_media_device_register(struct au0828_dev *dev,
 	if (!dev->media_dev)
 		return 0;
 
-	if (!media_devnode_is_registered(dev->media_dev->devnode)) {
+	if (!media_devnode_is_registered(&dev->media_dev->devnode)) {
 
 		/* register media device */
 		ret = media_device_register(dev->media_dev);
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index fe8b251f47e7..1044e13976b5 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1862,7 +1862,7 @@ static void uvc_delete(struct kref *kref)
 	if (dev->vdev.dev)
 		v4l2_device_unregister(&dev->vdev);
 #ifdef CONFIG_MEDIA_CONTROLLER
-	if (media_devnode_is_registered(dev->mdev.devnode))
+	if (media_devnode_is_registered(&dev->mdev.devnode))
 		media_device_unregister(&dev->mdev);
 	media_device_cleanup(&dev->mdev);
 #endif
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index f52df6836045..f8f678835a4c 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -548,7 +548,7 @@ static void cedrus_remove(struct platform_device *pdev)
 	struct cedrus_dev *dev = platform_get_drvdata(pdev);
 
 	cancel_delayed_work_sync(&dev->watchdog_work);
-	if (media_devnode_is_registered(dev->mdev.devnode)) {
+	if (media_devnode_is_registered(&dev->mdev.devnode)) {
 		media_device_unregister(&dev->mdev);
 		v4l2_m2m_unregister_media_controller(dev->m2m_dev);
 		media_device_cleanup(&dev->mdev);
diff --git a/include/media/media-device.h b/include/media/media-device.h
index 2c146d0b2b1c..fb0855b217ce 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -145,7 +145,7 @@ struct media_device_ops {
 struct media_device {
 	/* dev->driver_data points to this struct. */
 	struct device *dev;
-	struct media_devnode *devnode;
+	struct media_devnode devnode;
 
 	char model[32];
 	char driver_name[32];
@@ -191,6 +191,9 @@ struct usb_device;
 #define MEDIA_DEV_NOTIFY_PRE_LINK_CH	0
 #define MEDIA_DEV_NOTIFY_POST_LINK_CH	1
 
+/* media_devnode to media_device */
+#define to_media_device(node) container_of(node, struct media_device, devnode)
+
 /**
  * media_device_init() - Initializes a media device element
  *
diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
index 46f0d3ae44d1..1117d1dfd6bf 100644
--- a/include/media/media-devnode.h
+++ b/include/media/media-devnode.h
@@ -21,8 +21,6 @@
 #include <linux/device.h>
 #include <linux/cdev.h>
 
-struct media_device;
-
 /*
  * Flag to mark the media_devnode struct as registered. Drivers must not touch
  * this flag directly, it will be set and cleared by media_devnode_register and
@@ -73,8 +71,6 @@ struct media_file_operations {
  * before registering the node.
  */
 struct media_devnode {
-	struct media_device *media_dev;
-
 	/* device ops */
 	const struct media_file_operations *fops;
 
@@ -97,8 +93,7 @@ struct media_devnode {
 /**
  * media_devnode_register - register a media device node
  *
- * @mdev: struct media_device we want to register a device node
- * @devnode: media device node structure we want to register
+ * @devnode: struct media_devnode we want to register a device node
  * @owner: should be filled with %THIS_MODULE
  *
  * The registration code assigns minor numbers and registers the new device node
@@ -111,8 +106,7 @@ struct media_devnode {
  * the media_devnode structure is *not* called, so the caller is responsible for
  * freeing any data.
  */
-int __must_check media_devnode_register(struct media_device *mdev,
-					struct media_devnode *devnode,
+int __must_check media_devnode_register(struct media_devnode *devnode,
 					struct module *owner);
 
 /**
@@ -142,14 +136,9 @@ static inline struct media_devnode *media_devnode_data(struct file *filp)
  *	false otherwise.
  *
  * @devnode: pointer to struct &media_devnode.
- *
- * Note: If mdev is NULL, it also returns false.
  */
 static inline int media_devnode_is_registered(struct media_devnode *devnode)
 {
-	if (!devnode)
-		return false;
-
 	return test_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
 }
 
-- 
2.39.2


