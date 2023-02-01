Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52188687090
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 22:45:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbjBAVpw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 16:45:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbjBAVpr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 16:45:47 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29C1965346
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675287945; x=1706823945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2XOxk44DL1NJEhniZ2VaMl9pEjAT0XcPLoBwJ0UWIM0=;
  b=KIl0YnLRIdYcrr+RG6J0w5Nuu72KItWAtEtkE92+wXForV6yCqvdAmh/
   sNS6a/hGH6EqPrAnJDclXeUJDtYvW7LdkOhAYzKbuazQEUd+Lpw/mvPPc
   JF9Sf+uYHD88/e5gPxxhUMq2Po34m9i3/Xlo4dLqUXKhGK2sw345uAO1A
   khZhXwFbRHoUkOqqZGqxsec9CwF+Qna4XrF5cmPlASQSMxBd6oNmkuPoC
   dsyvy4IjrzS1mi/SzgfVc+ZgT4SLXf1bQWJ6z4GGo8DBgg17Yoo+nUzNA
   rooQ5Gvl9mvgolGJpgGvRwcK7a7uLlODvv1F1EhPucSaLZmaPL7jSFvOA
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330415614"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="330415614"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695527293"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="695527293"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:41 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id ACA8C12279A;
        Wed,  1 Feb 2023 23:45:38 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 03/26] Revert "[media] media: fix use-after-free in cdev_put() when app exits after driver unbind"
Date:   Wed,  1 Feb 2023 23:45:12 +0200
Message-Id: <20230201214535.347075-4-sakari.ailus@linux.intel.com>
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

This reverts commit 5b28dde51d0c ("[media] media: fix use-after-free in
cdev_put() when app exits after driver unbind"). The commit was part of an
original patchset to avoid crashes when an unregistering device is in use.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-device.c  |  6 ++---
 drivers/media/mc/mc-devnode.c | 48 ++++++++++++++---------------------
 2 files changed, 21 insertions(+), 33 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index 013d54e1a55a..b6640e2c8a4c 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -736,16 +736,16 @@ int __must_check __media_device_register(struct media_device *mdev,
 
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
 
@@ -829,8 +829,6 @@ void media_device_unregister(struct media_device *mdev)
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
2.30.2

