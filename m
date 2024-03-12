Return-Path: <linux-media+bounces-6891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF444879230
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9597D1F21ECC
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 10:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A8779DB3;
	Tue, 12 Mar 2024 10:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EW0f4VQa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4A879DBF
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 10:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239683; cv=none; b=ii76U1pqUIRQCqMIew+5yrmd3tg/n8IctLg4ao7ytc2U7kdwfHmkzOdeFCX1Vgftb6M0U0mn4P+3v5phsUcgivICb5g34hYh/GRWxpmuHT1pVCHNIL7U69ztK9PY54wNF4xZy2SOQKkBHxcMeFvbFPvk+WZtXyGXm9iiEvWMII8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239683; c=relaxed/simple;
	bh=b52QlhxKu3wE7KEdG0WWrG7Jv7ikslIfdOhydp/Ww+0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nDB2/lZ/Zqu0PONqPVy4htXS7+aKY99tdWcx5vhQWb7ypz9G6MbA9BOdrYDSL1ZrbGj2xX/gxSqVGVxC2UCjXLwazc6O4DFqmfltnvc/OzHoLZvq8bjlnryHu9/CpNHNsnhSpEQXvBB91xQFWq5UDhjTVrKoP6pim3ODJFI36wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EW0f4VQa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239682; x=1741775682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b52QlhxKu3wE7KEdG0WWrG7Jv7ikslIfdOhydp/Ww+0=;
  b=EW0f4VQaN3vb/VI1AWfnMPwPZWjf+C9YkMVkRQshY0hbTSY9os6dohLS
   KZfnzUParUphY+k2cbs1mJwirAQRkay8eBMxtpgGn4qYEmcBiXLmUTE43
   ooEaWJQBxu1tyzYZRX91eup68h2sBZo3EWg4UYb52dCgLqB4YFZ3AwnKc
   IFyZ0utAuX7CkTinQICnPDXpEubvWAz+2AS43xMhSpnLs0dj11U8x8E80
   kPIW091LYYr5U/93XQR5R+Aux6gjdwIUqMyixgZDerYlCPH6tBtOBn88G
   aEM0UXFX8rjPIyugOcurDIoTR3JDDwq/H8FJRV2ogNbYW0cR2/XKb1azh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4794337"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4794337"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16194113"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:40 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C49B4120619;
	Tue, 12 Mar 2024 12:34:37 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v3 22/26] media: mc: Maintain a list of open file handles in a media device
Date: Tue, 12 Mar 2024 12:34:18 +0200
Message-Id: <20240312103422.216484-23-sakari.ailus@linux.intel.com>
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

The list of file handles is needed to deliver media events as well as for
other purposes in the future.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-device.c  | 19 ++++++++++++++++++-
 drivers/media/mc/mc-devnode.c |  2 +-
 include/media/media-devnode.h |  4 +++-
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index 67a39cb63f89..2c7e3ab33e3a 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -45,8 +45,9 @@ static inline void __user *media_get_uptr(__u64 arg)
 	return (void __user *)(uintptr_t)arg;
 }
 
-static int media_device_open(struct file *filp)
+static int media_device_open(struct media_devnode *devnode, struct file *filp)
 {
+	struct media_device *mdev = to_media_device(devnode);
 	struct media_device_fh *fh;
 
 	fh = kzalloc(sizeof(*fh), GFP_KERNEL);
@@ -55,13 +56,23 @@ static int media_device_open(struct file *filp)
 
 	filp->private_data = &fh->fh;
 
+	spin_lock_irq(&mdev->fh_list_lock);
+	list_add(&fh->mdev_list, &mdev->fh_list);
+	spin_unlock_irq(&mdev->fh_list_lock);
+
 	return 0;
 }
 
 static int media_device_close(struct file *filp)
 {
+	struct media_devnode *devnode = media_devnode_data(filp);
+	struct media_device *mdev = to_media_device(devnode);
 	struct media_device_fh *fh = media_device_fh(filp);
 
+	spin_lock_irq(&mdev->fh_list_lock);
+	list_del(&fh->mdev_list);
+	spin_unlock_irq(&mdev->fh_list_lock);
+
 	kfree(fh);
 
 	return 0;
@@ -769,11 +780,13 @@ void media_device_init(struct media_device *mdev)
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
@@ -834,6 +847,10 @@ void media_device_unregister(struct media_device *mdev)
 	}
 	mutex_unlock(&mdev->graph_mutex);
 
+	spin_lock_irq(&mdev->fh_list_lock);
+	list_del_init(&mdev->fh_list);
+	spin_unlock_irq(&mdev->fh_list_lock);
+
 	device_remove_file(&mdev->devnode.dev, &dev_attr_model);
 	dev_dbg(mdev->dev, "Media device unregistering\n");
 	media_devnode_unregister(&mdev->devnode);
diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 4fdb1572ff9b..4c23551012d4 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -154,7 +154,7 @@ static int media_open(struct inode *inode, struct file *filp)
 	get_device(&devnode->dev);
 	mutex_unlock(&media_devnode_lock);
 
-	ret = devnode->fops->open(filp);
+	ret = devnode->fops->open(devnode, filp);
 	if (ret) {
 		put_device(&devnode->dev);
 		return ret;
diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
index e4e8552598eb..898fa67ca090 100644
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


