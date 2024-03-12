Return-Path: <linux-media+bounces-6872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 110F887921B
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBF712827AA
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 10:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2258469D0C;
	Tue, 12 Mar 2024 10:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="diV7p3y+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8B754FA1
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 10:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239672; cv=none; b=Q3wPaUzVOYVeILq8KIfdVTKYiq5il7uZ2XU5A8HnnsOGytLJ7jfiDptWGwlKU7V7pr4HrtjSf3qcBO8Bw/QxW0++GaV/Q7Ug3rdxwz/vBnFGbZzBy/xSsQPFnEh+iZDPUCL5tKCD3O1DaS754wB3YR0SvWtDQNXz8lNDND1Y/ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239672; c=relaxed/simple;
	bh=o/F1a3xbdz1UyMohzLghpOgV2cZ3kudDlGMs5iGC+IA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N2FF4FXuYW5+G9L8BaQTdT0rV0uEM9Pxg40nMO11bwsG/VI7UPZQrdOC1Kt1zjR02uKXl0owUi/iHXcHdgPfzYctZRfDOFEul+JZ94ZV23wDVYwcQswTVSx2ydyv3FP+TpsJnoFwPgjmUDmLOXatWpiFaN0QPt/qiBFPHER8dr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=diV7p3y+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239671; x=1741775671;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o/F1a3xbdz1UyMohzLghpOgV2cZ3kudDlGMs5iGC+IA=;
  b=diV7p3y+pxDp7WPqiPJOXOwDYz1428P2fc1rYiwt8Kn4hMYf4+a00rU0
   CX8xbYEvKIZ6C2MV9xxdOUeB1f8wKYUgqNJmvITV6LXOz5+A8TRQMKDFI
   7QkfgPQbwf2u7entaZ5qgZM5WbrXoS/f9uqncWHrSjpbMILiz7qBvHAcU
   QGjNUxdxuVsFpxRKkcI8EJA+fEN8aL4TgEav3w2E4Dl/ztBnKrDlwdIFK
   SbPQtrU7VlrJ1/t/V/zU+IaaUe64Z9x1qJPmdvha/O8r9fAb3nGsDnlg9
   Cpv5fq8ZhXJ2ImdinK4zwrwW8eUsQKnCYM0grvqQLZsSyx7EVYWI+wGce
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4794264"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4794264"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16194060"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:29 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D208E11FB89;
	Tue, 12 Mar 2024 12:34:25 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v3 03/26] Revert "[media] media: fix use-after-free in cdev_put() when app exits after driver unbind"
Date: Tue, 12 Mar 2024 12:33:59 +0200
Message-Id: <20240312103422.216484-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312103422.216484-1-sakari.ailus@linux.intel.com>
References: <20240312103422.216484-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 5b28dde51d0c ("[media] media: fix use-after-free in
cdev_put() when app exits after driver unbind"). The commit was part of an
original patchset to avoid crashes when an unregistering device is in use.

This revert is performed to roll back to a state which is more suitable
for the objective: making media device refcountable.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/mc/mc-device.c  |  6 ++---
 drivers/media/mc/mc-devnode.c | 47 ++++++++++++++---------------------
 2 files changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index 6c569ecd4b3d..4772a7f55112 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -732,16 +732,16 @@ int __must_check __media_device_register(struct media_device *mdev,
 
 	ret = media_devnode_register(mdev, devnode, owner);
 	if (ret < 0) {
-		/* devnode free is handled in media_devnode_*() */
 		mdev->devnode = NULL;
+		kfree(devnode);
 		return ret;
 	}
 
 	ret = device_create_file(&devnode->dev, &dev_attr_model);
 	if (ret < 0) {
-		/* devnode free is handled in media_devnode_*() */
 		mdev->devnode = NULL;
 		media_devnode_unregister(devnode);
+		kfree(devnode);
 		return ret;
 	}
 
@@ -824,8 +824,6 @@ void media_device_unregister(struct media_device *mdev)
 	if (media_devnode_is_registered(mdev->devnode)) {
 		device_remove_file(&mdev->devnode->dev, &dev_attr_model);
 		media_devnode_unregister(mdev->devnode);
-		/* devnode free is handled in media_devnode_*() */
-		mdev->devnode = NULL;
 	}
 }
 EXPORT_SYMBOL_GPL(media_device_unregister);
diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 7827e9519382..e6ee1382f27d 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -51,8 +51,13 @@ static void media_devnode_release(struct device *cd)
 	struct media_devnode *devnode = to_media_devnode(cd);
 
 	mutex_lock(&media_devnode_lock);
+
+	/* Delete the cdev on this minor as well */
+	cdev_del(&devnode->cdev);
+
 	/* Mark device node number as free */
 	clear_bit(devnode->minor, media_devnode_nums);
+
 	mutex_unlock(&media_devnode_lock);
 
 	/* Release media_devnode and perform other cleanups as needed. */
@@ -60,7 +65,6 @@ static void media_devnode_release(struct device *cd)
 		devnode->release(devnode);
 
 	kfree(devnode);
-	pr_debug("%s: Media Devnode Deallocated\n", __func__);
 }
 
 static const struct bus_type media_bus_type = {
@@ -189,7 +193,6 @@ static int media_release(struct inode *inode, struct file *filp)
 	/* decrease the refcount unconditionally since the release()
 	   return value is ignored. */
 	put_device(&devnode->dev);
-
 	return 0;
 }
 
@@ -220,7 +223,6 @@ int __must_check media_devnode_register(struct media_device *mdev,
 	if (minor == MEDIA_NUM_DEVICES) {
 		mutex_unlock(&media_devnode_lock);
 		pr_err("could not get a free minor\n");
-		kfree(devnode);
 		return -ENFILE;
 	}
 
@@ -230,33 +232,29 @@ int __must_check media_devnode_register(struct media_device *mdev,
 	devnode->minor = minor;
 	devnode->media_dev = mdev;
 
-	/* Part 1: Initialize dev now to use dev.kobj for cdev.kobj.parent */
-	devnode->dev.bus = &media_bus_type;
-	devnode->dev.devt = MKDEV(MAJOR(media_dev_t), devnode->minor);
-	devnode->dev.release = media_devnode_release;
-	if (devnode->parent)
-		devnode->dev.parent = devnode->parent;
-	dev_set_name(&devnode->dev, "media%d", devnode->minor);
-	device_initialize(&devnode->dev);
-
 	/* Part 2: Initialize and register the character device */
 	cdev_init(&devnode->cdev, &media_devnode_fops);
 	devnode->cdev.owner = owner;
-	devnode->cdev.kobj.parent = &devnode->dev.kobj;
 	kobject_set_name(&devnode->cdev.kobj, "media%d", devnode->minor);
 
 	ret = cdev_add(&devnode->cdev, MKDEV(MAJOR(media_dev_t),
 					     devnode->minor), 1);
 	if (ret < 0) {
 		pr_err("%s: cdev_add failed\n", __func__);
-		goto cdev_add_error;
+		goto error;
 	}
 
-	/* Part 3: Add the media device */
-	ret = device_add(&devnode->dev);
+	/* Part 3: Register the media device */
+	devnode->dev.bus = &media_bus_type;
+	devnode->dev.devt = MKDEV(MAJOR(media_dev_t), devnode->minor);
+	devnode->dev.release = media_devnode_release;
+	if (devnode->parent)
+		devnode->dev.parent = devnode->parent;
+	dev_set_name(&devnode->dev, "media%d", devnode->minor);
+	ret = device_register(&devnode->dev);
 	if (ret < 0) {
-		pr_err("%s: device_add failed\n", __func__);
-		goto device_add_error;
+		pr_err("%s: device_register failed\n", __func__);
+		goto error;
 	}
 
 	/* Part 4: Activate this minor. The char device can now be used. */
@@ -264,15 +262,12 @@ int __must_check media_devnode_register(struct media_device *mdev,
 
 	return 0;
 
-device_add_error:
-	cdev_del(&devnode->cdev);
-cdev_add_error:
+error:
 	mutex_lock(&media_devnode_lock);
+	cdev_del(&devnode->cdev);
 	clear_bit(devnode->minor, media_devnode_nums);
-	devnode->media_dev = NULL;
 	mutex_unlock(&media_devnode_lock);
 
-	put_device(&devnode->dev);
 	return ret;
 }
 
@@ -284,13 +279,9 @@ void media_devnode_unregister(struct media_devnode *devnode)
 
 	mutex_lock(&media_devnode_lock);
 	clear_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
-	/* Delete the cdev on this minor as well */
-	cdev_del(&devnode->cdev);
-	devnode->media_dev = NULL;
 	mutex_unlock(&media_devnode_lock);
-	device_del(&devnode->dev);
 
-	put_device(&devnode->dev);
+	device_unregister(&devnode->dev);
 }
 
 /*
-- 
2.39.2


