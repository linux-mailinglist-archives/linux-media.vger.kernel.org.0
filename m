Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10AFA6870A4
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 22:46:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231485AbjBAVqP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 16:46:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230361AbjBAVqN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 16:46:13 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2025369B2A
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675287969; x=1706823969;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CodEgkuIHBS9QKN/y7XdadxqvsBvU6LWKHvmFNJ4lFY=;
  b=kNP3aOzh0d/bVTTbWs6pU685e++1qTj7e+6dTMZH9GI6Ity/Qz+cpptx
   hp4uuBNspMkrtWQa0/kRkF5taledARghYKnIglfhZHF1HX0VGQ6DIjZGU
   yclmzBe9/m7W394YRMuG7g+fhf9EnMH7A7VFnwv7wpjWljgmFYVplzF7t
   gXTa2FMGFdaCJl6PpXmpG4E1df7e1U/pb6+C3Aq7afzWjz57hdulwnH3O
   pv8hXTscFgCZoNsU2uhsWs3r7z3tLK9gjshkGYMA40vCMlB+EywOWKkIV
   Tt+Ms+YQRaoYZicjDRP52SvksqwBs4vsd2h3yUev9FmzyOhk1aTtwDMcO
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330415697"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="330415697"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695527332"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="695527332"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:57 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 7C6141227A0;
        Wed,  1 Feb 2023 23:45:54 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 24/26] media: Maintain a list of open file handles in a media device
Date:   Wed,  1 Feb 2023 23:45:33 +0200
Message-Id: <20230201214535.347075-25-sakari.ailus@linux.intel.com>
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

The list of file handles is needed to deliver media events as well as for
other purposes in the future.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-device.c  | 23 ++++++++++++++++++++++-
 drivers/media/mc/mc-devnode.c |  2 +-
 include/media/media-devnode.h |  4 +++-
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index 0419a7deccc3..3a1db5fdbba7 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -45,9 +45,11 @@ static inline void __user *media_get_uptr(__u64 arg)
 	return (void __user *)(uintptr_t)arg;
 }
 
-static int media_device_open(struct file *filp)
+static int media_device_open(struct media_devnode *devnode, struct file *filp)
 {
+	struct media_device *mdev = to_media_device(devnode);
 	struct media_device_fh *fh;
+	unsigned long flags;
 
 	fh = kzalloc(sizeof(*fh), GFP_KERNEL);
 	if (!fh)
@@ -55,12 +57,23 @@ static int media_device_open(struct file *filp)
 
 	filp->private_data = &fh->fh;
 
+	spin_lock_irqsave(&mdev->fh_list_lock, flags);
+	list_add(&fh->mdev_list, &mdev->fh_list);
+	spin_unlock_irqrestore(&mdev->fh_list_lock, flags);
+
 	return 0;
 }
 
 static int media_device_close(struct file *filp)
 {
+	struct media_devnode *devnode = media_devnode_data(filp);
+	struct media_device *mdev = to_media_device(devnode);
 	struct media_device_fh *fh = media_device_fh(filp);
+	unsigned long flags;
+
+	spin_lock_irqsave(&mdev->fh_list_lock, flags);
+	list_del(&fh->mdev_list);
+	spin_unlock_irqrestore(&mdev->fh_list_lock, flags);
 
 	kfree(fh);
 
@@ -773,11 +786,13 @@ void media_device_init(struct media_device *mdev)
 	INIT_LIST_HEAD(&mdev->pads);
 	INIT_LIST_HEAD(&mdev->links);
 	INIT_LIST_HEAD(&mdev->entity_notify);
+	INIT_LIST_HEAD(&mdev->fh_list);
 
 	mutex_init(&mdev->req_queue_mutex);
 	mutex_init(&mdev->graph_mutex);
 	ida_init(&mdev->entity_internal_idx);
 	atomic_set(&mdev->request_id, 0);
+	spin_lock_init(&mdev->fh_list_lock);
 
 	/*
 	 * Set the release callback to the media device if we have one
@@ -836,6 +851,8 @@ EXPORT_SYMBOL_GPL(__media_device_register);
 
 void media_device_unregister(struct media_device *mdev)
 {
+	unsigned long flags;
+
 	if (mdev == NULL)
 		return;
 
@@ -846,6 +863,10 @@ void media_device_unregister(struct media_device *mdev)
 	}
 	mutex_unlock(&mdev->graph_mutex);
 
+	spin_lock_irqsave(&mdev->fh_list_lock, flags);
+	list_del_init(&mdev->fh_list);
+	spin_unlock_irqrestore(&mdev->fh_list_lock, flags);
+
 	device_remove_file(&mdev->devnode.dev, &dev_attr_model);
 	dev_dbg(mdev->dev, "Media device unregistering\n");
 	media_devnode_unregister(&mdev->devnode);
diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index cb07b3a87bfb..760314dd22e1 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -161,7 +161,7 @@ static int media_open(struct inode *inode, struct file *filp)
 	get_device(&devnode->dev);
 	mutex_unlock(&media_devnode_lock);
 
-	ret = devnode->fops->open(filp);
+	ret = devnode->fops->open(devnode, filp);
 	if (ret) {
 		put_device(&devnode->dev);
 		return ret;
diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
index f22b3835702e..d21c13829072 100644
--- a/include/media/media-devnode.h
+++ b/include/media/media-devnode.h
@@ -21,6 +21,8 @@
 #include <linux/device.h>
 #include <linux/cdev.h>
 
+struct media_devnode;
+
 /*
  * Flag to mark the media_devnode struct as registered. Drivers must not touch
  * this flag directly, it will be set and cleared by media_devnode_register and
@@ -49,7 +51,7 @@ struct media_file_operations {
 	__poll_t (*poll) (struct file *, struct poll_table_struct *);
 	long (*ioctl) (struct file *, unsigned int, unsigned long);
 	long (*compat_ioctl) (struct file *, unsigned int, unsigned long);
-	int (*open) (struct file *);
+	int (*open) (struct media_devnode *, struct file *);
 	int (*release) (struct file *);
 };
 
-- 
2.30.2

