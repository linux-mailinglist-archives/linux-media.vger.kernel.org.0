Return-Path: <linux-media+bounces-6880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0074C879224
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA80528270D
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 10:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F9279B80;
	Tue, 12 Mar 2024 10:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UYpV0Elb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A22941A85
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 10:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239677; cv=none; b=WRCEeKCvCPJCseHJc615fWSeRYta9reHcwFjxmyjQVwi5wmtoL+j5FJXl2zR99dYyiOkn8xF2udqpeG4SFXZA1ncDZP2PpjWnl7/Kosj7quPX2uua5bfr6ViOFvgVNZmyOfXy8vWxi8O/Po6xBf8oYwTIxm8hs6Wir666xaJAT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239677; c=relaxed/simple;
	bh=NSa1+7HWptkDSUdoc8ftVBAjeDD2R4oqEQa5IQgXMmg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s+E2K/4NTeofz7PtLJJGsB8u0KlGqHrPS70jgpS9xWlA+7kcKPIeZs5wDIY1BFYyWWHVArAh09H8kktsEExCv0O8AvyvOuIGRiLTIsjLmlk0nZhd/dkDPQxZVMmNyZ8+5Pa39Cr9UO0IfMYy9DBwluxCuxx8Cn/gqQkIA+aWj8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UYpV0Elb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239676; x=1741775676;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NSa1+7HWptkDSUdoc8ftVBAjeDD2R4oqEQa5IQgXMmg=;
  b=UYpV0Elbl6hPGIUL3afKBQiCbr4BkAT8hzvO6gPGdgkpjxzXvINfrOc6
   XnHsSkNVl9zAHC+Jda4tDZ9dyrJoF4Nu5nElvu1Fnegfrxml5onzQrrA4
   AawgGwYVeQ3RCXekcrEKtG26/psCRlCnbsYtHZmq7Sy8gQ/ZtFfHpCIag
   FZkuuRB7iy8T3/McPZm0hGVvvsuXPB3UNHp/xKaSHHOJGTm3MbxD5isKc
   l58MQHmO2WII1my2/tTyvEGDKxCWppKpuRBgpdaAiO3cJKuvsggp88OC0
   zWlQxujxnBNMU64YBFfVxWOUrTYRpWIoTdobR4yINOEO0kCjIBGi4y/kc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4794298"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4794298"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16194089"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:34 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0A1101201F7;
	Tue, 12 Mar 2024 12:34:30 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v3 11/26] media: mc: Split initialising and adding media devnode
Date: Tue, 12 Mar 2024 12:34:07 +0200
Message-Id: <20240312103422.216484-12-sakari.ailus@linux.intel.com>
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

Registering a device node of an entity belonging to a media device will
require a reference to the struct device. Taking that reference is only
possible once the device has been initialised, which took place only when
it was registered. Split this in two, and initialise the device when the
media device is allocated.

Don't propagate the effects of these changes to drivers yet, we want to
expose media_device refcounting with media_device_get() and
media_device_put() functions first.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/mc/mc-device.c  | 18 +++++++++++++-----
 drivers/media/mc/mc-devnode.c | 18 ++++++++++--------
 include/media/media-devnode.h | 19 ++++++++++++++-----
 3 files changed, 37 insertions(+), 18 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index c0ea08a8fc31..dd4d589a6701 100644
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
+		goto err_put;
 
 	ret = device_create_file(&mdev->devnode.dev, &dev_attr_model);
-	if (ret < 0) {
-		media_devnode_unregister(&mdev->devnode);
-		return ret;
-	}
+	if (ret < 0)
+		goto err_unregister;
 
 	dev_dbg(mdev->dev, "Media device registered\n");
 
 	return 0;
+
+err_unregister:
+	media_devnode_unregister(&mdev->devnode);
+err_put:
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
index 2538371a90af..64aadc51352b 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -197,6 +197,11 @@ static const struct file_operations media_devnode_fops = {
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
@@ -228,7 +233,6 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
 	if (devnode->parent)
 		devnode->dev.parent = devnode->parent;
 	dev_set_name(&devnode->dev, "media%d", devnode->minor);
-	device_initialize(&devnode->dev);
 
 	/* Part 3: Add the media and character devices */
 	ret = cdev_device_add(&devnode->cdev, &devnode->dev);
@@ -246,7 +250,6 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
 	mutex_lock(&media_devnode_lock);
 	clear_bit(devnode->minor, media_devnode_nums);
 	mutex_unlock(&media_devnode_lock);
-	put_device(&devnode->dev);
 
 	return ret;
 }
@@ -261,8 +264,7 @@ void media_devnode_unregister(struct media_devnode *devnode)
 	clear_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
 	mutex_unlock(&media_devnode_lock);
 
-	cdev_del(&devnode->cdev);
-	device_unregister(&devnode->dev);
+	cdev_device_del(&devnode->cdev, &devnode->dev);
 
 	mutex_lock(&media_devnode_lock);
 	clear_bit(devnode->minor, media_devnode_nums);
@@ -272,7 +274,7 @@ void media_devnode_unregister(struct media_devnode *devnode)
 /*
  *	Initialise media for linux
  */
-static int __init media_devnode_init(void)
+static int __init media_devnode_module_init(void)
 {
 	int ret;
 
@@ -294,14 +296,14 @@ static int __init media_devnode_init(void)
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
index 024dfb98a6fd..113c317e6a0e 100644
--- a/include/media/media-devnode.h
+++ b/include/media/media-devnode.h
@@ -89,6 +89,17 @@ struct media_devnode {
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
@@ -99,11 +110,9 @@ struct media_devnode {
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


