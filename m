Return-Path: <linux-media+bounces-12821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8C6901ECB
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 108141F2637A
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E60E762F7;
	Mon, 10 Jun 2024 10:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AGjAoNhP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED691DA4C
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013946; cv=none; b=qWahvFUwS32BxjMZg6rkGn+Gs6gQIqxgj54raH69Uw60oaj4wecmSXgqf8QAnjcC2TpVU1LGMDajOe0QZ52Kk8FR8QHtbj3oBg5M9IypQn1gs5I86mb1/LP9l0G/a+1beJxFu7RrH31Q0lVHbKHRNhzfGQ9PWc5N6qlms1Ea2BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013946; c=relaxed/simple;
	bh=KsvJRKZ9Llu3UpzHCID3iW6gYGU4lT98FRuSYvLZ5IQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NpmAVl046BwH77/tRa41zr9GdUIiVO4ZZ6hiR+K01DLYokgdhdgUn278ljIFLBpIaY0T82vXEjwZkuu1uISKinrRJiyKBUUDkROPt83mr5eTyB5DsD3p9vN9hHVolPiP4DZS1Prn/lfLoX2ChyfjSOHazK/OzkUADxABX3DgCRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AGjAoNhP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013945; x=1749549945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KsvJRKZ9Llu3UpzHCID3iW6gYGU4lT98FRuSYvLZ5IQ=;
  b=AGjAoNhPYPbLXkuA6k195e6wopdrtAQP4PNkwc7yxuBqVA4z2SMUGler
   osP2tg8t/0UuOjJE+1iTS2V2AJFpSfOtArFxa3CZTl8CpY5VPqRXfCJZb
   33rtnfpqpiGr7MOY6LSUGoRyxRntBikHk1rsa36vKPqtm5Dfv5FzQjZ4J
   cEDZix1MXGn2MxIAiNJ+eJ9HbGKbittu3J4R42b8gltTpswI/Q6v3tjha
   0XWLh98yk/OQhy5zLoL383bcsunUv3liTsF38bOt8oOLB+jF98+pjP5YJ
   zPrFaFd6BO0oLH8RzziTx8OQiWcl86/WaBjuAzImZPqkETp5UYZNNK7jA
   w==;
X-CSE-ConnectionGUID: 70Jp25wLT5yNHZy8sPefSw==
X-CSE-MsgGUID: XmEp34JaQJS4aKCpIaMufw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819864"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819864"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:45 -0700
X-CSE-ConnectionGUID: cXCoFxygS52rAACont8haw==
X-CSE-MsgGUID: Fi9FtNaIRD6mq9sKPWbExg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137329"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:43 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DB48A1205BF;
	Mon, 10 Jun 2024 13:05:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuG-004eCW-2p;
	Mon, 10 Jun 2024 13:05:40 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 03/26] Revert "[media] media: fix use-after-free in cdev_put() when app exits after driver unbind"
Date: Mon, 10 Jun 2024 13:05:07 +0300
Message-Id: <20240610100530.1107771-4-sakari.ailus@linux.intel.com>
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
index d36bc9891f3f..bc223a427020 100644
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
 
@@ -230,19 +232,9 @@ int __must_check media_devnode_register(struct media_device *mdev,
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
 
 	set_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
@@ -250,27 +242,30 @@ int __must_check media_devnode_register(struct media_device *mdev,
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
 
@@ -282,13 +277,9 @@ void media_devnode_unregister(struct media_devnode *devnode)
 
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


