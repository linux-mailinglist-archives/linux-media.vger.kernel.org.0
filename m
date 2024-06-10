Return-Path: <linux-media+bounces-12831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BB1901ED5
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F20E1F26A78
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E766579950;
	Mon, 10 Jun 2024 10:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="czSvHTsU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47BD78C66
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013954; cv=none; b=qsRKQMZpbxtrVKQfq9F1C4RKRIAN9snNTOjGMHE8pkRSFes2xsO8pXnSfgRGkyM+plHrRJRJulbwnof21+QUiGy0/ywKpBS7ia7yh8ORcjHVe1ahuEnyqRbM7kopmRB0WpVH/fN1BWgezgW5dcq/mGq01z9QM4DH/2PNb5+FQZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013954; c=relaxed/simple;
	bh=PmCwrMROkTUi8FldAYOCFWn7IoFdAP7YQppK8BOWf4Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TY9WliRL9r7H9jx1WMQuEZUtp+oeDaAW//KcwBOj+NipTjd5LKCfKUYo2z+8aXiZv51bzxYc5GCZ4+cSC9BvEp/vLFf0pnweIFCBlT/GsSDqKMuckbYf8bu+QH+k1I5gc4JIkkLcp/Aar0a4KEH9YboR3BR64y6l01KCa/UkemA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=czSvHTsU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013953; x=1749549953;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PmCwrMROkTUi8FldAYOCFWn7IoFdAP7YQppK8BOWf4Y=;
  b=czSvHTsU/ub1ZnEqD3U9CGX5c9MIVo/4BQ9q+pVujavKTdhbSHCMaYA9
   s9a4ElpolV8axb84U7PN2muBa+n3KIiVduWt0Snc6qDZ0/tbJVW8g8vWf
   2rdlF1n4wWu33ogQ39SzxUOksW1+ViV5e+JIHGTmlZsZqnY5bWWiOmadb
   ET/D8Qpog22apEA8mACMM8BiYQlPrfRcGtbkm3mawpLIO4IFmDXt5rFZH
   h63rD2WhxRry1lu+i/6bojjhJGK42u/ZQKo13NERDaVedUcr7yPKQairl
   PUKr3K3OD5SJ/eESWZWhJ3LZVQ7v/0+ZBn9w/sQJUp7J7ITaoYMIlyqUE
   g==;
X-CSE-ConnectionGUID: RkPtjgPTTHGB+ioLjepneg==
X-CSE-MsgGUID: oXJDVL+cQHyoudfPYpqJzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819915"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819915"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:50 -0700
X-CSE-ConnectionGUID: x6cf/17qQNW7l+lbKU0flw==
X-CSE-MsgGUID: kdUqRprqTUqHDLk9Io7SHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137344"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:47 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 12FB1120B7D;
	Mon, 10 Jun 2024 13:05:41 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuH-004eDC-0B;
	Mon, 10 Jun 2024 13:05:41 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 11/26] media: mc: Split initialising and adding media devnode
Date: Mon, 10 Jun 2024 13:05:15 +0300
Message-Id: <20240610100530.1107771-12-sakari.ailus@linux.intel.com>
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
index f7ecabe469a4..214b9b142d90 100644
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
 	set_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
@@ -244,7 +248,6 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
 	mutex_lock(&media_devnode_lock);
 	clear_bit(devnode->minor, media_devnode_nums);
 	mutex_unlock(&media_devnode_lock);
-	put_device(&devnode->dev);
 
 	return ret;
 }
@@ -259,8 +262,7 @@ void media_devnode_unregister(struct media_devnode *devnode)
 	clear_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
 	mutex_unlock(&media_devnode_lock);
 
-	cdev_del(&devnode->cdev);
-	device_unregister(&devnode->dev);
+	cdev_device_del(&devnode->cdev, &devnode->dev);
 
 	mutex_lock(&media_devnode_lock);
 	clear_bit(devnode->minor, media_devnode_nums);
@@ -270,7 +272,7 @@ void media_devnode_unregister(struct media_devnode *devnode)
 /*
  *	Initialise media for linux
  */
-static int __init media_devnode_init(void)
+static int __init media_devnode_module_init(void)
 {
 	int ret;
 
@@ -292,14 +294,14 @@ static int __init media_devnode_init(void)
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


