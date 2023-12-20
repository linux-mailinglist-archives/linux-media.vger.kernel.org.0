Return-Path: <linux-media+bounces-2764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE83819CEB
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 345451C2279A
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3BA208DF;
	Wed, 20 Dec 2023 10:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dNNVQb1a"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7707820B0A
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 10:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703068642; x=1734604642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2FRHYbaD0qGk5u2qPqy3j4HFfKrb/qZwigaUVNXV8EU=;
  b=dNNVQb1atKQf0vzeL3Qx5UosnBh9RWgrwklLlszqRMK9eqZpIWYoD6kj
   Aqi1zBd4/nOFmxsTCOMe8XHd/FUyDpzu4UqGTObVKgKUr8o0gcJxzGhNr
   zMdEgr4JMfr/B+w5HorwUgCN+qqpBF/izoo9NPEGKJicnbvCH5mQpQCsb
   MKIv6afY3V31fp7wHeD4ZXONnc36KObU907mwldvdAXEvN4s+J2d24x+n
   ZV5NPrpUR8Jt9Mhh71MwRpPQbCZaRjCGbhM1S9imyntuPipZetkce/CnH
   3zzt9OXtH3odEHN2SOFers2JGLAjHoc/WxSIcu3hQ6/C9TYKhAXLVwvio
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9174308"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9174308"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769544230"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769544230"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:18 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B406312068E;
	Wed, 20 Dec 2023 12:37:15 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 03/29] Revert "[media] media: fix use-after-free in cdev_put() when app exits after driver unbind"
Date: Wed, 20 Dec 2023 12:36:47 +0200
Message-Id: <20231220103713.113386-4-sakari.ailus@linux.intel.com>
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

This reverts commit 5b28dde51d0c ("[media] media: fix use-after-free in
cdev_put() when app exits after driver unbind"). The commit was part of an
original patchset to avoid crashes when an unregistering device is in use.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/mc/mc-device.c  |  6 ++---
 drivers/media/mc/mc-devnode.c | 48 ++++++++++++++---------------------
 2 files changed, 21 insertions(+), 33 deletions(-)

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
index 740573552e5d..1e1792c3ae3f 100644
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
 
 static struct bus_type media_bus_type = {
@@ -189,8 +193,6 @@ static int media_release(struct inode *inode, struct file *filp)
 	/* decrease the refcount unconditionally since the release()
 	   return value is ignored. */
 	put_device(&devnode->dev);
-
-	pr_debug("%s: Media Release\n", __func__);
 	return 0;
 }
 
@@ -221,7 +223,6 @@ int __must_check media_devnode_register(struct media_device *mdev,
 	if (minor == MEDIA_NUM_DEVICES) {
 		mutex_unlock(&media_devnode_lock);
 		pr_err("could not get a free minor\n");
-		kfree(devnode);
 		return -ENFILE;
 	}
 
@@ -231,33 +232,29 @@ int __must_check media_devnode_register(struct media_device *mdev,
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
@@ -265,15 +262,12 @@ int __must_check media_devnode_register(struct media_device *mdev,
 
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
 
@@ -285,13 +279,9 @@ void media_devnode_unregister(struct media_devnode *devnode)
 
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


