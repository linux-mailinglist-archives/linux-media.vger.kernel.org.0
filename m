Return-Path: <linux-media+bounces-2772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63110819CF3
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E77C71F21F09
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0FD20DF3;
	Wed, 20 Dec 2023 10:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bndpTBfE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76A5210E8
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 10:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703068647; x=1734604647;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ij13MlaFCYNiYzoFfrF4YVx9TkIbZLlFYdwK6gFGWqM=;
  b=bndpTBfEapqubYsGHtkmjzSfIHNXK3gfdd2Iiv1QdVTXq7W1oXndlddX
   cCzQKUyY1eF8WErueoozb6y0RdJQMyEuSDtj5Q6JHa49NOwmuJt0XdwGn
   FsQjAuiplhBXazFM3F4JKC+3XYiVrjFWwN65pwiv1ePdgljQx1hswFtc5
   lJI4nXJ4RLScW4MxdIBKOPTFJSXUnf5LcC9TJnnVQijUIFNwbacWjiJro
   KE+JzXtuzyNdd3nwCAQH/esAE2QFiSiRNile0XHcG7KDgBnFT+5cct3Ws
   MfXFMnAVulPGbzUUq151EZUMnOqjaVoRDw/ZVx6lzWGEydqAjaVJ+8u8I
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9174339"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9174339"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769544251"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769544251"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:23 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1B5B312068E;
	Wed, 20 Dec 2023 12:37:21 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 11/29] media: mc: Split initialising and adding media devnode
Date: Wed, 20 Dec 2023 12:36:55 +0200
Message-Id: <20231220103713.113386-12-sakari.ailus@linux.intel.com>
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

As registering a device node of an entity belonging to a media device
will require a reference to the struct device. Taking that reference is
only possible once the device has been initialised, which took place only
when it was registered. Split this in two, and initialise the device when
the media device is allocated.

Don't distribute the effects of these changes yet. Add media_device_get()
and media_device_put() first.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/mc/mc-device.c  | 18 +++++++++++++-----
 drivers/media/mc/mc-devnode.c | 17 ++++++++++-------
 include/media/media-devnode.h | 19 ++++++++++++++-----
 3 files changed, 37 insertions(+), 17 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index c0ea08a8fc31..ebf037cd5f4a 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -717,19 +717,26 @@ int __must_check __media_device_register(struct media_device *mdev,
 	/* Set version 0 to indicate user-space that the graph is static */
 	mdev->topology_version = 0;
 
+	media_devnode_init(&mdev->devnode);
+
 	ret = media_devnode_register(&mdev->devnode, owner);
 	if (ret < 0)
-		return ret;
+		goto out_put;
 
 	ret = device_create_file(&mdev->devnode.dev, &dev_attr_model);
-	if (ret < 0) {
-		media_devnode_unregister(&mdev->devnode);
-		return ret;
-	}
+	if (ret < 0)
+		goto out_unregister;
 
 	dev_dbg(mdev->dev, "Media device registered\n");
 
 	return 0;
+
+out_unregister:
+	media_devnode_unregister(&mdev->devnode);
+out_put:
+	put_device(&mdev->devnode.dev);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(__media_device_register);
 
@@ -803,6 +810,7 @@ void media_device_unregister(struct media_device *mdev)
 	device_remove_file(&mdev->devnode.dev, &dev_attr_model);
 	dev_dbg(mdev->dev, "Media device unregistering\n");
 	media_devnode_unregister(&mdev->devnode);
+	put_device(&mdev->devnode.dev);
 }
 EXPORT_SYMBOL_GPL(media_device_unregister);
 
diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 8bc7450ac144..7b17419050fb 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -204,6 +204,11 @@ static const struct file_operations media_devnode_fops = {
 	.llseek = no_llseek,
 };
 
+void media_devnode_init(struct media_devnode *devnode)
+{
+	device_initialize(&devnode->dev);
+}
+
 int __must_check media_devnode_register(struct media_devnode *devnode,
 					struct module *owner)
 {
@@ -235,7 +240,6 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
 	if (devnode->parent)
 		devnode->dev.parent = devnode->parent;
 	dev_set_name(&devnode->dev, "media%d", devnode->minor);
-	device_initialize(&devnode->dev);
 
 	/* Part 3: Add the media and character devices */
 	ret = cdev_device_add(&devnode->cdev, &devnode->dev);
@@ -267,14 +271,13 @@ void media_devnode_unregister(struct media_devnode *devnode)
 	clear_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
 	mutex_unlock(&media_devnode_lock);
 
-	cdev_del(&devnode->cdev);
-	device_unregister(&devnode->dev);
+	cdev_device_del(&devnode->cdev, &devnode->dev);
 }
 
 /*
  *	Initialise media for linux
  */
-static int __init media_devnode_init(void)
+static int __init media_devnode_module_init(void)
 {
 	int ret;
 
@@ -296,14 +299,14 @@ static int __init media_devnode_init(void)
 	return 0;
 }
 
-static void __exit media_devnode_exit(void)
+static void __exit media_devnode_module_exit(void)
 {
 	bus_unregister(&media_bus_type);
 	unregister_chrdev_region(media_dev_t, MEDIA_NUM_DEVICES);
 }
 
-subsys_initcall(media_devnode_init);
-module_exit(media_devnode_exit)
+subsys_initcall(media_devnode_module_init);
+module_exit(media_devnode_module_exit)
 
 MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
 MODULE_DESCRIPTION("Device node registration for media drivers");
diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
index 1117d1dfd6bf..6d46c658be21 100644
--- a/include/media/media-devnode.h
+++ b/include/media/media-devnode.h
@@ -90,6 +90,17 @@ struct media_devnode {
 /* dev to media_devnode */
 #define to_media_devnode(cd) container_of(cd, struct media_devnode, dev)
 
+/**
+ * media_devnode_init - initialise a media devnode
+ *
+ * @devnode: struct media_devnode we want to initialise
+ *
+ * Initialise a media devnode. Note that after initialising the media
+ * devnode is refcounted. Releasing references to it may be done using
+ * put_device().
+ */
+void media_devnode_init(struct media_devnode *devnode);
+
 /**
  * media_devnode_register - register a media device node
  *
@@ -100,11 +111,9 @@ struct media_devnode {
  * with the kernel. An error is returned if no free minor number can be found,
  * or if the registration of the device node fails.
  *
- * Zero is returned on success.
- *
- * Note that if the media_devnode_register call fails, the release() callback of
- * the media_devnode structure is *not* called, so the caller is responsible for
- * freeing any data.
+ * Zero is returned on success. Note that in case
+ * media_devnode_register() fails, the caller is responsible for
+ * releasing the reference to the device using put_device().
  */
 int __must_check media_devnode_register(struct media_devnode *devnode,
 					struct module *owner);
-- 
2.39.2


