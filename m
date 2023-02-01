Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65D946870A5
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 22:46:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231509AbjBAVqT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 16:46:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbjBAVqP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 16:46:15 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACB6D6951B
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675287969; x=1706823969;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0G5EzL3hGZG7GuSZqgsovIfSzRNc32QP7+mtegUJga4=;
  b=Ie7iFFx006PkgKfqurdon1f2dJqb9EC1dkUTWe4o3Pau+kGx82l7GNBu
   D+TvSXq56NwYEKPKnSd2qZXKz16B0BZ/sxh5rpzpDBp6tphBZDe+jK8Os
   5UN2AWi91OriNBANzNkWgvEeRohVmYiSDFPg8tu5XeLWSUDSWYGvpP2mb
   0Rs+5aY5jQR39uGPwidL9BrBo3Wwv8nqZSt6rHWCAv9H7jUYWLBgL81be
   Kcqj34sjzBqWnN6csDlZ2DBShpxlHcFch4MiMS6u1TmOMCSFPtu2rAB45
   6rU8XAUoLjwKLDIdggjjfUItE1Wf5rPYK54RlyYRkgfA/pJpb7g2s5RGK
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330415702"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="330415702"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:59 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695527335"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="695527335"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:58 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 3FC58120339;
        Wed,  1 Feb 2023 23:45:55 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 25/26] media: Implement best effort media device removal safety sans refcounting
Date:   Wed,  1 Feb 2023 23:45:34 +0200
Message-Id: <20230201214535.347075-26-sakari.ailus@linux.intel.com>
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

Add a new helper data structure media_devnode_compat_ref, which is used to
prevent user space from calling IOCTLs or other system calls to the media
device that has been already unregistered.

The media device's memory may of course still be released during the call
but there is only so much that can be done to this without the driver
managing the lifetime of the resources it needs somehow.

This patch should be reverted once all drivers have been converted to manage
their resources' lifetime.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-device.c  | 60 ++++++++++++++++++++++++++++++-----
 drivers/media/mc/mc-devnode.c | 21 ++++++++----
 include/media/media-devnode.h | 29 +++++++++++++++++
 3 files changed, 96 insertions(+), 14 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index 3a1db5fdbba7..22fdaa6370ea 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -45,18 +45,34 @@ static inline void __user *media_get_uptr(__u64 arg)
 	return (void __user *)(uintptr_t)arg;
 }
 
+static void compat_ref_release(struct kref *kref)
+{
+	struct media_devnode_compat_ref *ref =
+		container_of_const(kref, struct media_devnode_compat_ref, kref);
+
+	kfree(ref);
+}
+
 static int media_device_open(struct media_devnode *devnode, struct file *filp)
 {
 	struct media_device *mdev = to_media_device(devnode);
 	struct media_device_fh *fh;
 	unsigned long flags;
 
+	if (devnode->ref && (!atomic_read(&devnode->ref->registered) ||
+			     !kref_get_unless_zero(&devnode->ref->kref)))
+		return -ENXIO;
+
 	fh = kzalloc(sizeof(*fh), GFP_KERNEL);
-	if (!fh)
+	if (!fh) {
+		if (devnode->ref)
+			kref_put(&devnode->ref->kref, compat_ref_release);
 		return -ENOMEM;
+	}
 
-	filp->private_data = &fh->fh;
+	fh->fh.ref = devnode->ref;
 
+	filp->private_data = &fh->fh;
 	spin_lock_irqsave(&mdev->fh_list_lock, flags);
 	list_add(&fh->mdev_list, &mdev->fh_list);
 	spin_unlock_irqrestore(&mdev->fh_list_lock, flags);
@@ -71,9 +87,14 @@ static int media_device_close(struct file *filp)
 	struct media_device_fh *fh = media_device_fh(filp);
 	unsigned long flags;
 
-	spin_lock_irqsave(&mdev->fh_list_lock, flags);
-	list_del(&fh->mdev_list);
-	spin_unlock_irqrestore(&mdev->fh_list_lock, flags);
+	if (!fh->fh.ref || atomic_read(&fh->fh.ref->registered)) {
+		spin_lock_irqsave(&mdev->fh_list_lock, flags);
+		list_del(&fh->mdev_list);
+		spin_unlock_irqrestore(&mdev->fh_list_lock, flags);
+	}
+
+	if (fh->fh.ref)
+		kref_put(&fh->fh.ref->kref, compat_ref_release);
 
 	kfree(fh);
 
@@ -816,6 +837,8 @@ EXPORT_SYMBOL_GPL(media_device_init);
 
 void media_device_cleanup(struct media_device *mdev)
 {
+	if (mdev->devnode.ref)
+		kref_put(&mdev->devnode.ref->kref, compat_ref_release);
 	__media_device_release(mdev);
 	media_device_put(mdev);
 }
@@ -824,6 +847,7 @@ EXPORT_SYMBOL_GPL(media_device_cleanup);
 int __must_check __media_device_register(struct media_device *mdev,
 					 struct module *owner)
 {
+	struct media_devnode_compat_ref *ref = NULL;
 	int ret;
 
 	/* Register the device node. */
@@ -833,19 +857,39 @@ int __must_check __media_device_register(struct media_device *mdev,
 	/* Set version 0 to indicate user-space that the graph is static */
 	mdev->topology_version = 0;
 
+	if (!mdev->ops || !mdev->ops->release) {
+		ref = kzalloc(sizeof(*mdev->devnode.ref), GFP_KERNEL);
+		if (!ref)
+			return -ENOMEM;
+
+		kref_init(&ref->kref);
+		atomic_set(&ref->registered, 1);
+		mdev->devnode.ref = ref;
+	}
+
 	ret = media_devnode_register(&mdev->devnode, owner);
 	if (ret < 0)
-		return ret;
+		goto err_release_ref;
 
 	ret = device_create_file(&mdev->devnode.dev, &dev_attr_model);
 	if (ret < 0) {
-		media_devnode_unregister(&mdev->devnode);
-		return ret;
+		goto err_devnode_unregister;
 	}
 
 	dev_dbg(mdev->dev, "Media device registered\n");
 
 	return 0;
+
+err_devnode_unregister:
+	media_devnode_unregister(&mdev->devnode);
+
+err_release_ref:
+	if (ref) {
+		kref_put(&ref->kref, compat_ref_release);
+		mdev->devnode.ref = NULL;
+	}
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(__media_device_register);
 
diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 760314dd22e1..f2cb3617df02 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -65,6 +65,14 @@ static struct bus_type media_bus_type = {
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
@@ -72,7 +80,7 @@ static ssize_t media_read(struct file *filp, char __user *buf,
 
 	if (!devnode->fops->read)
 		return -EINVAL;
-	if (!media_devnode_is_registered(devnode))
+	if (!media_devnode_is_registered_compat(filp->private_data))
 		return -EIO;
 	return devnode->fops->read(filp, buf, sz, off);
 }
@@ -84,7 +92,7 @@ static ssize_t media_write(struct file *filp, const char __user *buf,
 
 	if (!devnode->fops->write)
 		return -EINVAL;
-	if (!media_devnode_is_registered(devnode))
+	if (!media_devnode_is_registered_compat(filp->private_data))
 		return -EIO;
 	return devnode->fops->write(filp, buf, sz, off);
 }
@@ -94,7 +102,7 @@ static __poll_t media_poll(struct file *filp,
 {
 	struct media_devnode *devnode = media_devnode_data(filp);
 
-	if (!media_devnode_is_registered(devnode))
+	if (!media_devnode_is_registered_compat(filp->private_data))
 		return EPOLLERR | EPOLLHUP;
 	if (!devnode->fops->poll)
 		return DEFAULT_POLLMASK;
@@ -106,12 +114,10 @@ __media_ioctl(struct file *filp, unsigned int cmd, unsigned long arg,
 	      long (*ioctl_func)(struct file *filp, unsigned int cmd,
 				 unsigned long arg))
 {
-	struct media_devnode *devnode = media_devnode_data(filp);
-
 	if (!ioctl_func)
 		return -ENOTTY;
 
-	if (!media_devnode_is_registered(devnode))
+	if (!media_devnode_is_registered_compat(filp->private_data))
 		return -EIO;
 
 	return ioctl_func(filp, cmd, arg);
@@ -265,6 +271,9 @@ void media_devnode_unregister(struct media_devnode *devnode)
 	if (!media_devnode_is_registered(devnode))
 		return;
 
+	if (devnode->ref)
+		atomic_set(&devnode->ref->registered, 0);
+
 	mutex_lock(&media_devnode_lock);
 	clear_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
 	mutex_unlock(&media_devnode_lock);
diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
index d21c13829072..9ea55c53e5cb 100644
--- a/include/media/media-devnode.h
+++ b/include/media/media-devnode.h
@@ -20,6 +20,7 @@
 #include <linux/fs.h>
 #include <linux/device.h>
 #include <linux/cdev.h>
+#include <linux/kref.h>
 
 struct media_devnode;
 
@@ -55,9 +56,31 @@ struct media_file_operations {
 	int (*release) (struct file *);
 };
 
+/**
+ * struct media_devnode_compat_ref - Workaround for drivers not managing media
+ *				     device lifetime
+ *
+ * The purpose if this struct is to support drivers that do not manage the
+ * lifetime of their respective media devices to avoid the worst effects of
+ * this, namely an IOCTL call on an open file handle to a device that has been
+ * unbound causing a kernel oops systematically. This is not a fix, the proper,
+ * reliable way to handle this is to manage the resources used by the
+ * driver. This struct and its use can be removed once all drivers have been
+ * converted.
+ *
+ * @kref: kref for the memory of this struct
+ * @registered: is this device registered?
+ */
+struct media_devnode_compat_ref {
+	struct kref kref;
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
@@ -67,6 +90,7 @@ struct media_file_operations {
  */
 struct media_devnode_fh {
 	struct media_devnode *devnode;
+	struct media_devnode_compat_ref *ref;
 };
 
 /**
@@ -80,6 +104,8 @@ struct media_devnode_fh {
  * @flags:	flags, combination of the ``MEDIA_FLAG_*`` constants
  * @release:	release callback called at the end of ``media_devnode_release()``
  *		routine at media-device.c.
+ * @ref:	reference for providing best effort system call safety in device
+ *		removal
  *
  * This structure represents a media-related device node.
  *
@@ -101,6 +127,9 @@ struct media_devnode {
 
 	/* callbacks */
 	void (*release)(struct media_devnode *devnode);
+
+	/* compat reference */
+	struct media_devnode_compat_ref *ref;
 };
 
 /* dev to media_devnode */
-- 
2.30.2

