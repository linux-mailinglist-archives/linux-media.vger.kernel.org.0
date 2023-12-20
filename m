Return-Path: <linux-media+bounces-2787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F37819D02
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 722B7B216DE
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A39F22323;
	Wed, 20 Dec 2023 10:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPs1opUt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6F2208C9
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703068655; x=1734604655;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=na+12loNNkFs8gMbbIPJRpDsi4oBG8NL0QQSFhxlflY=;
  b=ZPs1opUtbqi7YdQ9QR/4oFFGfciBK9JQcnVtNKBXhPhkD7B90jq8zxHu
   6pPaTTHgO1ArESP9L5r44CRMYevKrjSW0WtLzlvmi4hlQrFeZginyREp2
   /ELvcqQG4Nd9YOpPQSZLUSOTIsdmbelRKDy0BMq9r+UMuOohNT2xpAga6
   fn/r/xH3AGzfAP6AP5GHS2stLhfAYybud4AO2haAAKDpIrRJGW2GG4jwq
   dfkYgwcS0iAM29w89bmh/loPI0GqBei3bY7Zq5JNbD1wHm3LKpeRhPcfM
   XFtWQ0Gfw7aPni4H0uxAsSaO0AL2rfq168MkSdGHXtjoq49Q5niOgGs/+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9174408"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9174408"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769544278"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769544278"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:33 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9721B120706;
	Wed, 20 Dec 2023 12:37:30 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 26/29] media: mc: Maintain a list of open file handles in a media device
Date: Wed, 20 Dec 2023 12:37:10 +0200
Message-Id: <20231220103713.113386-27-sakari.ailus@linux.intel.com>
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

The list of file handles is needed to deliver media events as well as for
other purposes in the future.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-device.c  | 23 ++++++++++++++++++++++-
 drivers/media/mc/mc-devnode.c |  2 +-
 include/media/media-devnode.h |  4 +++-
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index 67a39cb63f89..9cc055deeec9 100644
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
 
@@ -769,11 +782,13 @@ void media_device_init(struct media_device *mdev)
 	INIT_LIST_HEAD(&mdev->pads);
 	INIT_LIST_HEAD(&mdev->links);
 	INIT_LIST_HEAD(&mdev->entity_notify);
+	INIT_LIST_HEAD(&mdev->fh_list);
 
 	mutex_init(&mdev->req_queue_mutex);
 	mutex_init(&mdev->graph_mutex);
 	ida_init(&mdev->entity_internal_idx);
 	atomic_set(&mdev->request_id, 0);
+	spin_lock_init(&mdev->fh_list_lock);
 
 	mdev->devnode.release = media_device_release;
 	media_devnode_init(&mdev->devnode);
@@ -824,6 +839,8 @@ EXPORT_SYMBOL_GPL(__media_device_register);
 
 void media_device_unregister(struct media_device *mdev)
 {
+	unsigned long flags;
+
 	if (mdev == NULL)
 		return;
 
@@ -834,6 +851,10 @@ void media_device_unregister(struct media_device *mdev)
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
index 04d376015526..0b5c24828e24 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -171,7 +171,7 @@ static int media_open(struct inode *inode, struct file *filp)
 	get_device(&devnode->dev);
 	mutex_unlock(&media_devnode_lock);
 
-	ret = devnode->fops->open(filp);
+	ret = devnode->fops->open(devnode, filp);
 	if (ret) {
 		put_device(&devnode->dev);
 		return ret;
diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
index b0efdde4ffd8..840f7ae852d3 100644
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
2.39.2


