Return-Path: <linux-media+bounces-12832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED350901ED6
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D509F1C215E6
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE5F979B8E;
	Mon, 10 Jun 2024 10:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fhMyw8gT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E1478B4E
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013954; cv=none; b=P4GN1/lQaD7gYfyj4dGk5RcipQICx/3yd3pxW6TvJoFid6UtjxZK50ipqrpEfvmCTMEiebuUkpVV2t5RQmJSaEifMYsGcCuvq8rTVCWZ975i/q4BVgZl16aQdmYaTDAjfzeithE9Nny8UEnsVjL9oV82M/Cr0FNeViWhPklC6BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013954; c=relaxed/simple;
	bh=OyshibxneKJXcpL1oWiXf+ib9YlW9CyIX+QYfaB0frA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oKhv68j1d7eQYrNy4lpUQvxKGhSgrXHi2SrorlpgUfmHayw54qpODIHfPO8bFrimcSdbH7X5A0Rxhe2d78S8uG2tUiCkuNAwptvkYzRRRR7VhYR0BkLaXMLzRm+YbBrJEkV0KrcEPJa13D80gyPHfpqo6zbTWSQRaMwlNGxhXAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fhMyw8gT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013953; x=1749549953;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OyshibxneKJXcpL1oWiXf+ib9YlW9CyIX+QYfaB0frA=;
  b=fhMyw8gT5525SDj371/CZIw2rQeLKxw0IN0WafeoxYI8wjEwbMPj4F5y
   UogKIP2FpKOG1ansByUt5WmhS/TZx0TWZnTkUfc3+WUDftF3xhvuYaL3z
   t3bVtMZVnvK8tke1mumBsQD7M5PEQMvdKfDTpKTQXBLG39wpYIfaWj/D/
   2MMmZAcShl5Rf2oWNAwqv5LS1zl3EOJnQ/goI6Vxjif1Vx1ADYJHkqGWZ
   Tl9tIo5IxnscvwKLzg0McWDTR/hTjNV0EE/8VyzRa7n3jB/amN0KYYjP7
   fqjXC1EGu53VPhYzlU2QxoqH+ScAzivACC15zxLr5Tp9zrZqyh79mXsMA
   A==;
X-CSE-ConnectionGUID: VCvn4PwdSgC6+6MY0I75gw==
X-CSE-MsgGUID: NDib46fnSeWZ1gBvLCq0Dw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819910"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819910"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:50 -0700
X-CSE-ConnectionGUID: HLHbAiWTQMiZ18IS/UsEqw==
X-CSE-MsgGUID: wRDbkTk1TCqjjyb2kZ9rzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137339"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:47 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E3531120715;
	Mon, 10 Jun 2024 13:05:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuG-004eCi-2x;
	Mon, 10 Jun 2024 13:05:40 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 05/26] Revert "[media] media-device: dynamically allocate struct media_devnode"
Date: Mon, 10 Jun 2024 13:05:09 +0300
Message-Id: <20240610100530.1107771-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
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

This revert is performed to roll back to a state which is more suitable
for the objective: making media device refcountable.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/mc/mc-device.c                  | 44 ++++++-------------
 drivers/media/mc/mc-devnode.c                 |  7 +--
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  2 +-
 drivers/media/test-drivers/visl/visl-core.c   |  2 +-
 drivers/media/usb/au0828/au0828-core.c        |  4 +-
 drivers/media/usb/uvc/uvc_driver.c            |  2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  2 +-
 include/media/media-device.h                  |  5 ++-
 include/media/media-devnode.h                 | 15 +------
 sound/usb/media.c                             |  8 ++--
 10 files changed, 31 insertions(+), 60 deletions(-)

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
index 64bbff0f90cd..2e33c2007f08 100644
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
 
 static const struct bus_type media_bus_type = {
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
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index 2073781ccadb..0fd681b4571d 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -570,7 +570,7 @@ static void mtk_vcodec_dec_remove(struct platform_device *pdev)
 
 	destroy_workqueue(dev->decode_workqueue);
 
-	if (media_devnode_is_registered(dev->mdev_dec.devnode)) {
+	if (media_devnode_is_registered(&dev->mdev_dec.devnode)) {
 		media_device_unregister(&dev->mdev_dec);
 		v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
 		media_device_cleanup(&dev->mdev_dec);
diff --git a/drivers/media/test-drivers/visl/visl-core.c b/drivers/media/test-drivers/visl/visl-core.c
index c46464bcaf2e..151d4a09559c 100644
--- a/drivers/media/test-drivers/visl/visl-core.c
+++ b/drivers/media/test-drivers/visl/visl-core.c
@@ -513,7 +513,7 @@ static void visl_remove(struct platform_device *pdev)
 	v4l2_info(&dev->v4l2_dev, "Removing " VISL_NAME);
 
 #ifdef CONFIG_MEDIA_CONTROLLER
-	if (media_devnode_is_registered(dev->mdev.devnode)) {
+	if (media_devnode_is_registered(&dev->mdev.devnode)) {
 		media_device_unregister(&dev->mdev);
 		v4l2_m2m_unregister_media_controller(dev->m2m_dev);
 	}
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
index 8fe24c98087e..436c1d361906 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1923,7 +1923,7 @@ static void uvc_unregister_video(struct uvc_device *dev)
 	if (dev->vdev.dev)
 		v4l2_device_unregister(&dev->vdev);
 #ifdef CONFIG_MEDIA_CONTROLLER
-	if (media_devnode_is_registered(dev->mdev.devnode))
+	if (media_devnode_is_registered(&dev->mdev.devnode))
 		media_device_unregister(&dev->mdev);
 #endif
 }
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
index 53d2a16a70b0..c791f3d5ad77 100644
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
 
diff --git a/sound/usb/media.c b/sound/usb/media.c
index d48db6f3ae65..f97e937378ee 100644
--- a/sound/usb/media.c
+++ b/sound/usb/media.c
@@ -122,7 +122,7 @@ void snd_media_stream_delete(struct snd_usb_substream *subs)
 		struct media_device *mdev;
 
 		mdev = mctl->media_dev;
-		if (mdev && media_devnode_is_registered(mdev->devnode)) {
+		if (mdev && media_devnode_is_registered(&mdev->devnode)) {
 			media_devnode_remove(mctl->intf_devnode);
 			media_device_unregister_entity(&mctl->media_entity);
 			media_entity_cleanup(&mctl->media_entity);
@@ -239,14 +239,14 @@ static void snd_media_mixer_delete(struct snd_usb_audio *chip)
 		if (!mixer->media_mixer_ctl)
 			continue;
 
-		if (media_devnode_is_registered(mdev->devnode)) {
+		if (media_devnode_is_registered(&mdev->devnode)) {
 			media_device_unregister_entity(&mctl->media_entity);
 			media_entity_cleanup(&mctl->media_entity);
 		}
 		kfree(mctl);
 		mixer->media_mixer_ctl = NULL;
 	}
-	if (media_devnode_is_registered(mdev->devnode))
+	if (media_devnode_is_registered(&mdev->devnode))
 		media_devnode_remove(chip->ctl_intf_media_devnode);
 	chip->ctl_intf_media_devnode = NULL;
 }
@@ -284,7 +284,7 @@ int snd_media_device_create(struct snd_usb_audio *chip,
 			"Couldn't create media mixer entities. Error: %d\n",
 			ret);
 
-	if (!media_devnode_is_registered(mdev->devnode)) {
+	if (!media_devnode_is_registered(&mdev->devnode)) {
 		/* don't register if snd_media_mixer_init() failed */
 		if (ret)
 			goto create_fail;
-- 
2.39.2


