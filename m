Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B32B4687097
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 22:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbjBAVqC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 16:46:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231178AbjBAVqA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 16:46:00 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A93677A3
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675287955; x=1706823955;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I/aBcjDEp1fqulu9MJq2LAagydGpio2YlPMS/J1I0V8=;
  b=RyeDlE3KgHJyHf2yO9MR1yQ82a+8IPfzl9obvNCkMSqGgU2YQAHPP/YN
   vYQN+dDwB7tZdNAfcN/h/jY3PUToFWv81+7KMT4NOTAqWEP/yGRGDqDKD
   zSZ4uj/XZ4zDT/1Xx8FVg3ZORWQNT/to2W9cEf6S8hBWBKU6Tt5aIO5ai
   csyRkBV6mdiJe3gZwYgOrXCXci6dfVSrmCrB9fE40AQe6LyaTNAiITzme
   KK1ZZn8CHuRUx7fviSaIaaJgT0Ly6p9fejhyhSMepnFSMPZLfR6mHsOpu
   tlvzvOMgHWO7TRnoguHow+bZfcHCAUSm6eJr4SKPz3R6uOpKdSqDTjxpX
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330415641"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="330415641"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:49 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695527307"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="695527307"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:47 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 28DEF1227A0;
        Wed,  1 Feb 2023 23:45:44 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 11/26] media: Split initialising and adding media devnode
Date:   Wed,  1 Feb 2023 23:45:20 +0200
Message-Id: <20230201214535.347075-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
References: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As registering a device node of an entity belonging to a media device
will require a reference to the struct device. Taking that reference is
only possible once the device has been initialised, which took place only
when it was registered. Split this in two, and initialise the device when
the media device is allocated.

Don't distribute the effects of these changes yet. Add media_device_get()
and media_device_put() first.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-device.c  | 18 +++++++++++++-----
 drivers/media/mc/mc-devnode.c | 17 ++++++++++-------
 include/media/media-devnode.h | 19 ++++++++++++++-----
 3 files changed, 37 insertions(+), 17 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index 64cc6921a8bc..d63807e85f1c 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -721,19 +721,26 @@ int __must_check __media_device_register(struct media_device *mdev,
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
 
@@ -808,6 +815,7 @@ void media_device_unregister(struct media_device *mdev)
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
2.30.2

