Return-Path: <linux-media+bounces-12847-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B064901EE5
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87D2C1C211B3
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40657F48A;
	Mon, 10 Jun 2024 10:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eKvNotGE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0797E567
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013962; cv=none; b=m8E6I3NHOjERqgUlXC+OY24sB6PdXgOK3g5KKT0mb5wpYZcByDhsvzppeZj0SA2KqE9s6jUe9ZrDy7RAdYO5SQ/EJPs/9AQu4EN6ZtsQcN5iCilNnPYxfrX5V2xDYPB5ktJqzBieJvXJHo7iDvCs9Xmlmh0OtEtok13Bzn04jMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013962; c=relaxed/simple;
	bh=LHLQKg3cEBmf6Z/PCGQwI9WkreeyPZoVX5RsiFeOur8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CvHJt9E85Fl/oHx/4Br7g4IzES+Bnq9SrZOvGKdAsxb8Z+qaPRTUilXJ/KmbcZJLT44JWgDnmI4BkCnlMSDY+hiGz7YHXCG2lb1S1V1QlQa/rPjr/zzDnF0QuPl0odAsQRV/nqYqqBv2kCB9dFcwu8vFIvawk7AbqA5z8ek7BaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eKvNotGE; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013961; x=1749549961;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LHLQKg3cEBmf6Z/PCGQwI9WkreeyPZoVX5RsiFeOur8=;
  b=eKvNotGERJZDnECOdohtBOeuyvGXuYz48fCIVFyPXWdqMguYXggHW1Zh
   Ox1cL1ZJWAcBH3AWPlcWquLZ7Dp8p+aVxNVljE+n72HquQKvqpPWjMSyy
   7Vb7+RxD/ixvoTqduI/sxHy2sF0N8S9MMoXVBkAqG5udVXihqGFmcT3n8
   6abk5EH7CBdkWTmSV+FDoQpD/hYzLqBi9BfnKyB+qRpm5FtK7KQ/KHR+K
   teTPseoVgVrqfVmuZ3xihmhpHnjFxTBxwetgcRHrJB2XFlIg7P8n5ElAO
   BPNML0tk+lVBuAMr4BfXsJ4a5Ri2jg1aBCge1wTdREYi++nGUrYCScQOq
   A==;
X-CSE-ConnectionGUID: 8emCkd+TQyq+9X63cQ4MRA==
X-CSE-MsgGUID: IA8ZLxrESHmvPBPnLD0Hng==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819966"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819966"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:53 -0700
X-CSE-ConnectionGUID: 52EzcAkRQTSt5wkZcNXZpw==
X-CSE-MsgGUID: v/GQ2P+qRKas44F3NAcccg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137363"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:50 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5A08E120C71;
	Mon, 10 Jun 2024 13:05:41 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuH-004eEA-16;
	Mon, 10 Jun 2024 13:05:41 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 23/26] media: mc: Implement best effort media device removal safety sans refcount
Date: Mon, 10 Jun 2024 13:05:27 +0300
Message-Id: <20240610100530.1107771-24-sakari.ailus@linux.intel.com>
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

Add a new helper data structures media_devnode_compat_ref and
media_devnode_cdev. The latter is used to prevent user space from calling
IOCTLs or other system calls to the media device that has been already
unregistered and the former to help with obtaining the container struct
(either media_devnode_compat_ref or media_devnode) in media_open().

The media device's memory may of course still be released during the call
but there is only so much that can be done to this without the driver
managing the lifetime of the resources it needs somehow.

This patch should be reverted once all drivers have been converted to manage
their resources' lifetime.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-device.c       |  49 +++++++++---
 drivers/media/mc/mc-devnode.c      | 118 ++++++++++++++++++++++-------
 drivers/media/v4l2-core/v4l2-dev.c |  26 +++++--
 include/media/media-device.h       |   8 +-
 include/media/media-devnode.h      |  65 ++++++++++++++--
 5 files changed, 210 insertions(+), 56 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index 46d1b0c9d8be..8cdd0d46e865 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -54,6 +54,8 @@ static int media_device_open(struct media_devnode *devnode, struct file *filp)
 	if (!fh)
 		return -ENOMEM;
 
+	fh->fh.ref = devnode->ref;
+
 	filp->private_data = &fh->fh;
 
 	spin_lock_irq(&mdev->fh_list_lock);
@@ -65,13 +67,16 @@ static int media_device_open(struct media_devnode *devnode, struct file *filp)
 
 static int media_device_close(struct file *filp)
 {
-	struct media_devnode *devnode = media_devnode_data(filp);
-	struct media_device *mdev = to_media_device(devnode);
 	struct media_device_fh *fh = media_device_fh(filp);
 
-	spin_lock_irq(&mdev->fh_list_lock);
-	list_del(&fh->mdev_list);
-	spin_unlock_irq(&mdev->fh_list_lock);
+	if (!fh->fh.ref || atomic_read(&fh->fh.ref->registered)) {
+		struct media_devnode *devnode = media_devnode_data(filp);
+		struct media_device *mdev = to_media_device(devnode);
+
+		spin_lock_irq(&mdev->fh_list_lock);
+		list_del(&fh->mdev_list);
+		spin_unlock_irq(&mdev->fh_list_lock);
+	}
 
 	kfree(fh);
 
@@ -810,28 +815,45 @@ EXPORT_SYMBOL_GPL(media_device_cleanup);
 int __must_check __media_device_register(struct media_device *mdev,
 					 struct module *owner)
 {
+	struct media_devnode_compat_ref *ref = NULL;
 	int ret;
 
+	if (!mdev->ops || !mdev->ops->release) {
+		ref = kzalloc(sizeof(*mdev->devnode.ref), GFP_KERNEL);
+		if (!ref)
+			return -ENOMEM;
+	}
+
 	/* Register the device node. */
 	mdev->devnode.fops = &media_device_fops;
 	mdev->devnode.parent = mdev->dev;
+	mdev->devnode.ref = ref;
 
 	/* Set version 0 to indicate user-space that the graph is static */
 	mdev->topology_version = 0;
 
 	ret = media_devnode_register(&mdev->devnode, owner);
 	if (ret < 0)
-		return ret;
+		goto out_put_ref;
+
+	ret = device_create_file(media_devnode_dev(&mdev->devnode),
+				 &dev_attr_model);
+	if (ret < 0)
+		goto out_devnode_unregister;
 
-	ret = device_create_file(&mdev->devnode.dev, &dev_attr_model);
-	if (ret < 0) {
-		media_devnode_unregister(&mdev->devnode);
-		return ret;
-	}
 
 	dev_dbg(mdev->dev, "Media device registered\n");
 
 	return 0;
+
+out_devnode_unregister:
+	media_devnode_unregister(&mdev->devnode);
+
+out_put_ref:
+	if (ref)
+		put_device(&ref->dev);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(__media_device_register);
 
@@ -847,9 +869,12 @@ void media_device_unregister(struct media_device *mdev)
 	list_del_init(&mdev->fh_list);
 	spin_unlock_irq(&mdev->fh_list_lock);
 
-	device_remove_file(&mdev->devnode.dev, &dev_attr_model);
+	device_remove_file(media_devnode_dev(&mdev->devnode), &dev_attr_model);
 	dev_dbg(mdev->dev, "Media device unregistering\n");
 	media_devnode_unregister(&mdev->devnode);
+
+	if (mdev->devnode.ref)
+		put_device(&mdev->devnode.ref->dev);
 }
 EXPORT_SYMBOL_GPL(media_device_unregister);
 
diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 617156963911..8cb4e0eec17f 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -49,24 +49,52 @@ static void media_devnode_release(struct device *cd)
 {
 	struct media_devnode *devnode = to_media_devnode(cd);
 
+	/* If the devnode has a ref, it is simply released by the user. */
+	if (devnode->ref)
+		return;
+
 	/* Release media_devnode and perform other cleanups as needed. */
 	if (devnode->release)
 		devnode->release(devnode);
 }
 
+static void media_devnode_ref_release(struct device *cd)
+{
+	struct media_devnode_compat_ref *ref =
+		container_of_const(cd, struct media_devnode_compat_ref, dev);
+
+	kfree(ref);
+}
+
+struct media_devnode *to_media_devnode(struct device *dev)
+{
+	if (dev->release == media_devnode_release)
+		return container_of(dev, struct media_devnode, dev);
+
+	return container_of(dev, struct media_devnode_compat_ref, dev)->devnode;
+}
+
 static const struct bus_type media_bus_type = {
 	.name = MEDIA_NAME,
 };
 
+static bool media_devnode_is_registered_compat(struct media_devnode_fh *fh)
+{
+	if (fh->ref)
+		return atomic_read(&fh->ref->registered);
+
+	return media_devnode_is_registered(fh->devnode);
+}
+
 static ssize_t media_read(struct file *filp, char __user *buf,
 		size_t sz, loff_t *off)
 {
 	struct media_devnode *devnode = media_devnode_data(filp);
 
+	if (!media_devnode_is_registered_compat(filp->private_data))
+		return -EIO;
 	if (!devnode->fops->read)
 		return -EINVAL;
-	if (!media_devnode_is_registered(devnode))
-		return -EIO;
 	return devnode->fops->read(filp, buf, sz, off);
 }
 
@@ -75,10 +103,10 @@ static ssize_t media_write(struct file *filp, const char __user *buf,
 {
 	struct media_devnode *devnode = media_devnode_data(filp);
 
+	if (!media_devnode_is_registered_compat(filp->private_data))
+		return -EIO;
 	if (!devnode->fops->write)
 		return -EINVAL;
-	if (!media_devnode_is_registered(devnode))
-		return -EIO;
 	return devnode->fops->write(filp, buf, sz, off);
 }
 
@@ -87,7 +115,7 @@ static __poll_t media_poll(struct file *filp,
 {
 	struct media_devnode *devnode = media_devnode_data(filp);
 
-	if (!media_devnode_is_registered(devnode))
+	if (!media_devnode_is_registered_compat(filp->private_data))
 		return EPOLLERR | EPOLLHUP;
 	if (!devnode->fops->poll)
 		return DEFAULT_POLLMASK;
@@ -99,14 +127,9 @@ __media_ioctl(struct file *filp, unsigned int cmd, unsigned long arg,
 	      long (*ioctl_func)(struct file *filp, unsigned int cmd,
 				 unsigned long arg))
 {
-	struct media_devnode *devnode = media_devnode_data(filp);
-
 	if (!ioctl_func)
 		return -ENOTTY;
 
-	if (!media_devnode_is_registered(devnode))
-		return -EIO;
-
 	return ioctl_func(filp, cmd, arg);
 }
 
@@ -114,6 +137,9 @@ static long media_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	struct media_devnode *devnode = media_devnode_data(filp);
 
+	if (!media_devnode_is_registered_compat(filp->private_data))
+		return -EIO;
+
 	return __media_ioctl(filp, cmd, arg, devnode->fops->ioctl);
 }
 
@@ -124,6 +150,9 @@ static long media_compat_ioctl(struct file *filp, unsigned int cmd,
 {
 	struct media_devnode *devnode = media_devnode_data(filp);
 
+	if (!media_devnode_is_registered_compat(filp->private_data))
+		return -EIO;
+
 	return __media_ioctl(filp, cmd, arg, devnode->fops->compat_ioctl);
 }
 
@@ -132,6 +161,7 @@ static long media_compat_ioctl(struct file *filp, unsigned int cmd,
 /* Override for the open function */
 static int media_open(struct inode *inode, struct file *filp)
 {
+	struct media_devnode_cdev *mcdev;
 	struct media_devnode *devnode;
 	struct media_devnode_fh *fh;
 	int ret;
@@ -143,7 +173,12 @@ static int media_open(struct inode *inode, struct file *filp)
 	 * a crash.
 	 */
 	mutex_lock(&media_devnode_lock);
-	devnode = container_of(inode->i_cdev, struct media_devnode, cdev);
+	mcdev = container_of(inode->i_cdev, struct media_devnode_cdev, cdev);
+	if (mcdev->is_compat_ref)
+		devnode = container_of(mcdev, struct media_devnode_compat_ref,
+				       mcdev)->devnode;
+	else
+		devnode = container_of(mcdev, struct media_devnode, mcdev);
 	/* return ENXIO if the media device has been removed
 	   already or if it is not registered anymore. */
 	if (!media_devnode_is_registered(devnode)) {
@@ -151,12 +186,12 @@ static int media_open(struct inode *inode, struct file *filp)
 		return -ENXIO;
 	}
 	/* and increase the device refcount */
-	get_device(&devnode->dev);
+	get_device(media_devnode_dev(devnode));
 	mutex_unlock(&media_devnode_lock);
 
 	ret = devnode->fops->open(devnode, filp);
 	if (ret) {
-		put_device(&devnode->dev);
+		put_device(media_devnode_dev(devnode));
 		return ret;
 	}
 
@@ -169,15 +204,21 @@ static int media_open(struct inode *inode, struct file *filp)
 /* Override for the release function */
 static int media_release(struct inode *inode, struct file *filp)
 {
-	struct media_devnode *devnode = media_devnode_data(filp);
-
-	devnode->fops->release(filp);
+	struct media_devnode_fh *fh = filp->private_data;
+	struct device *dev;
+
+	if (!fh->ref) {
+		dev = &fh->devnode->dev;
+		fh->devnode->fops->release(filp);
+	} else {
+		dev = &fh->ref->dev;
+		fh->ref->release(filp);
+	}
 
 	filp->private_data = NULL;
 
-	/* decrease the refcount unconditionally since the release()
-	   return value is ignored. */
-	put_device(&devnode->dev);
+	put_device(dev);
+
 	return 0;
 }
 
@@ -204,6 +245,9 @@ void media_devnode_init(struct media_devnode *devnode)
 int __must_check media_devnode_register(struct media_devnode *devnode,
 					struct module *owner)
 {
+	struct media_devnode_compat_ref *ref = devnode->ref;
+	struct cdev *cdev;
+	struct device *dev;
 	int minor;
 	int ret;
 
@@ -222,19 +266,31 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
 	devnode->minor = minor;
 
 	/* Part 2: Initialize the media and character devices */
-	cdev_init(&devnode->cdev, &media_devnode_fops);
-	devnode->cdev.owner = owner;
-	kobject_set_name(&devnode->cdev.kobj, "media%d", devnode->minor);
-
-	devnode->dev.bus = &media_bus_type;
-	devnode->dev.devt = MKDEV(MAJOR(media_dev_t), devnode->minor);
+	cdev = ref ? &ref->mcdev.cdev : &devnode->mcdev.cdev;
+	cdev_init(cdev, &media_devnode_fops);
+	cdev->owner = owner;
+	kobject_set_name(&cdev->kobj, "media%d", devnode->minor);
+
+	if (!ref) {
+		dev = &devnode->dev;
+	} else {
+		ref->mcdev.is_compat_ref = true;
+		device_initialize(&ref->dev);
+		atomic_set(&ref->registered, 1);
+		ref->devnode = devnode;
+		ref->release = devnode->fops->release;
+		dev = &ref->dev;
+		dev->release = media_devnode_ref_release;
+	}
+	dev->bus = &media_bus_type;
+	dev->devt = MKDEV(MAJOR(media_dev_t), devnode->minor);
 	if (devnode->parent)
-		devnode->dev.parent = devnode->parent;
-	dev_set_name(&devnode->dev, "media%d", devnode->minor);
+		dev->parent = devnode->parent;
+	dev_set_name(dev, "media%d", devnode->minor);
 
 	/* Part 3: Add the media and character devices */
 	set_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
-	ret = cdev_device_add(&devnode->cdev, &devnode->dev);
+	ret = cdev_device_add(cdev, dev);
 	if (ret < 0) {
 		pr_err("%s: cdev_device_add failed\n", __func__);
 		goto cdev_add_error;
@@ -256,11 +312,15 @@ void media_devnode_unregister(struct media_devnode *devnode)
 	if (!media_devnode_is_registered(devnode))
 		return;
 
+	if (devnode->ref)
+		atomic_set(&devnode->ref->registered, 0);
+
 	mutex_lock(&media_devnode_lock);
 	clear_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
 	mutex_unlock(&media_devnode_lock);
 
-	cdev_device_del(&devnode->cdev, &devnode->dev);
+	cdev_device_del(devnode->ref ? &devnode->ref->mcdev.cdev :
+			&devnode->mcdev.cdev, media_devnode_dev(devnode));
 
 	mutex_lock(&media_devnode_lock);
 	clear_bit(devnode->minor, media_devnode_nums);
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 4bf4398fd2fe..2b19a845c3a4 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -179,7 +179,7 @@ static void v4l2_device_release(struct device *cd)
 	bool v4l2_dev_call_release = v4l2_dev->release;
 #ifdef CONFIG_MEDIA_CONTROLLER
 	struct media_device *mdev = v4l2_dev->mdev;
-	bool mdev_has_release = mdev && mdev->ops && mdev->ops->release;
+	bool mdev_has_ref = mdev && mdev->devnode.ref;
 #endif
 
 	mutex_lock(&videodev_lock);
@@ -212,12 +212,24 @@ static void v4l2_device_release(struct device *cd)
 	}
 #endif
 
-	/* Release video_device and perform other
-	   cleanups as needed. */
+	/*
+	 * Put struct media_devnode_compat_ref here as indicated by
+	 * mdev_has_ref. mdev may be released by vdev->release() below.
+	 */
+#ifdef CONFIG_MEDIA_CONTROLLER
+	if (mdev && mdev_has_ref)
+		media_device_put(mdev);
+#endif
+
+	/* Release video_device and perform other cleanups as needed. */
 	vdev->release(vdev);
 
 #ifdef CONFIG_MEDIA_CONTROLLER
-	if (mdev)
+	/*
+	 * Put a reference to struct media_device acquired in
+	 * video_register_media_controller().
+	 */
+	if (mdev && !mdev_has_ref)
 		media_device_put(mdev);
 
 	/*
@@ -225,13 +237,15 @@ static void v4l2_device_release(struct device *cd)
 	 * embedded in the same driver's context struct so having a release
 	 * callback in both is a bug.
 	 */
-	if (WARN_ON(v4l2_dev_call_release && mdev_has_release))
+	if (WARN_ON(v4l2_dev_call_release && !mdev_has_ref))
 		v4l2_dev_call_release = false;
 #endif
 
 	/*
 	 * Decrease v4l2_device refcount, but only if the media device doesn't
-	 * have a release callback.
+	 * have a release callback. Otherwise one could expect accessing
+	 * released memory --- driver's context struct refcounted already via
+	 * struct media_device.
 	 */
 	if (v4l2_dev_call_release)
 		v4l2_device_put(v4l2_dev);
diff --git a/include/media/media-device.h b/include/media/media-device.h
index f9f7c37e7d57..30f9b78d1ce7 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -259,10 +259,10 @@ static inline void media_device_put(struct media_device *mdev)
  *
  * @mdev:	pointer to struct &media_device
  *
- * This function that will destroy the graph_mutex that is initialized in
- * media_device_init(). Note that *only* drivers that do not manage releasing
- * the memory of th media device itself call this function. This function is
- * thus effectively DEPRECATED.
+ * This function will destroy the graph_mutex that is initialized in
+ * media_device_init(). Note that only drivers that do not have a proper release
+ * callback of the struct media_device call this function. This function is thus
+ * effectively DEPRECATED.
  */
 void media_device_cleanup(struct media_device *mdev);
 
diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
index 898fa67ca090..5dee1acbc3f7 100644
--- a/include/media/media-devnode.h
+++ b/include/media/media-devnode.h
@@ -41,8 +41,7 @@ struct media_devnode;
  * @compat_ioctl: pointer to the function that will handle 32 bits userspace
  *	calls to the ioctl() syscall on a Kernel compiled with 64 bits.
  * @open: pointer to the function that implements open() syscall
- * @release: pointer to the function that will release the resources allocated
- *	by the @open function.
+ * @release: pointer to the function that implements release() syscall
  */
 struct media_file_operations {
 	struct module *owner;
@@ -55,9 +54,54 @@ struct media_file_operations {
 	int (*release) (struct file *);
 };
 
+/**
+ * struct media_devnode_cdev - Workaround for drivers not managing media device
+ *			       lifetime - character device
+ *
+ * Store the characeter device and whether this is a compatibility reference or
+ * not. struct media_devnode_cdev is embedded in either struct
+ * media_devnode_compat_ref or struct media_devnode.
+ *
+ * @cdev: the chracter device
+ * @is_compat_ref: Is this a compatibility reference or not?
+ */
+struct media_devnode_cdev {
+	struct cdev cdev;
+	bool is_compat_ref;
+};
+
+/**
+ * struct media_devnode_compat_ref - Workaround for drivers not managing media
+ *				     device lifetime - reference
+ *
+ * The purpose if this struct is to support drivers that do not manage the
+ * lifetime of their respective media devices to avoid the worst effects of
+ * this, namely an IOCTL call on an open file handle to a device that has been
+ * unbound causing a kernel oops systematically. This is not a fix. The proper,
+ * reliable way to handle this is to manage the resources used by the
+ * driver. This struct and its use can be removed once all drivers have been
+ * converted.
+ *
+ * @dev: struct device that remains in place as long as any reference remains
+ * @mcdev: the related character device
+ * @devnode: a pointer back to the devnode
+ * @release:	pointer to the function that will release the resources
+ *		allocated by the @open function.
+ * @registered: is this device registered?
+ */
+struct media_devnode_compat_ref {
+	struct device dev;
+	struct media_devnode_cdev mcdev;
+	struct media_devnode *devnode;
+	int (*release)(struct file *);
+	atomic_t registered;
+};
+
 /**
  * struct media_devnode_fh - Media device node file handle
  * @devnode:	pointer to the media device node
+ * @ref:	media device compat ref, if the driver does not manage media
+ *		device lifetime
  *
  * This structure serves as a base for per-file-handle data storage. Media
  * device node users embed media_devnode_fh in their custom file handle data
@@ -67,18 +111,21 @@ struct media_file_operations {
  */
 struct media_devnode_fh {
 	struct media_devnode *devnode;
+	struct media_devnode_compat_ref *ref;
 };
 
 /**
  * struct media_devnode - Media device node
  * @fops:	pointer to struct &media_file_operations with media device ops
  * @dev:	pointer to struct &device containing the media controller device
- * @cdev:	struct cdev pointer character device
+ * @mcdev:	related to the character device
  * @parent:	parent device
  * @minor:	device node minor number
  * @flags:	flags, combination of the ``MEDIA_FLAG_*`` constants
  * @release:	release callback called at the end of ``media_devnode_release()``
  *		routine at media-device.c.
+ * @ref:	reference for providing best effort memory safety in device
+ *		removal
  *
  * This structure represents a media-related device node.
  *
@@ -91,7 +138,7 @@ struct media_devnode {
 
 	/* sysfs */
 	struct device dev;		/* media device */
-	struct cdev cdev;		/* character device */
+	struct media_devnode_cdev mcdev; /* character device + compat status */
 	struct device *parent;		/* device parent */
 
 	/* device info */
@@ -100,10 +147,18 @@ struct media_devnode {
 
 	/* callbacks */
 	void (*release)(struct media_devnode *devnode);
+
+	/* compat reference */
+	struct media_devnode_compat_ref *ref;
 };
 
+static inline struct device *media_devnode_dev(struct media_devnode *devnode)
+{
+	return devnode->ref ? &devnode->ref->dev : &devnode->dev;
+}
+
 /* dev to media_devnode */
-#define to_media_devnode(cd) container_of(cd, struct media_devnode, dev)
+struct media_devnode *to_media_devnode(struct device *dev);
 
 /**
  * media_devnode_init - initialise a media devnode
-- 
2.39.2


