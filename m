Return-Path: <linux-media+bounces-12839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE09901EDD
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45D1828260C
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8951A7AE5D;
	Mon, 10 Jun 2024 10:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2+IPRri"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A627BB0A
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013958; cv=none; b=eSPi+f0eQwybDAVmAi2vXS1GD1AvOC4/um6Bv6jslEf5V/zMKxjs1GUasVZ89++2EzFYbsxyYHRp0n/+k5kCm9YBu27ID0+XcMmEn4svQXZ0HY2I+aT8pYokCGhk1BuXT84JMibipIkV5xLojXDDvzaHng1lRTHUk633jeLfE+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013958; c=relaxed/simple;
	bh=K2/wxLLlNsYl2dcQwp+2q7FJblVGtsb+ULyd3kdCsSc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qvbh4nAyTjDC9r8axSLA5MZunCEWMA1/5WW1r03i8B9EUhb0B2p5zMSjSwiHXk9GqpQom8gBIrvacHLUCILejP2MoE/ZIIeitJjPHsA3rYrXcjjsIK5vtyMJxa0GjEtY1m8a31PVyoV7c4G7mSD6jhpr5c0GZLeOfxoKtmMOXrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2+IPRri; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013957; x=1749549957;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K2/wxLLlNsYl2dcQwp+2q7FJblVGtsb+ULyd3kdCsSc=;
  b=Q2+IPRriWkJ6Igy78EwWjcqYq6GovDNzoNx6PbeGecC/+kn7ICjq2KcR
   wwWwbI9vrJ81hZqBzx8He03MKoIDcrjmg+FIAu/1zZM3fsLJNvTMkvC8w
   I8ilrwG8ywI3LXmSFr6IqPHy7eID67awriGYtWgjaRBve/o7+pWh+C9dp
   pc48mfzkc9QoRAWSIAAryG6vEJkdAvJkZu8RrrqLnzpQEpdcTrFLEG5IX
   rdsUU95SHY+N62eJMf3gUVUUPo0dGsX4h6iX+4WknWKjkLpV4Aq7SUOcM
   9S2jLO+/RI0ohYrBvtGrBJ4UQk3k7YSvucx2ofXaPQzpdR7EA+L1dYqgb
   g==;
X-CSE-ConnectionGUID: lWs6KlplT+OidWPdkSFDgQ==
X-CSE-MsgGUID: tQkPRs6jSSOM9DMrAFEaUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819948"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819948"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:52 -0700
X-CSE-ConnectionGUID: X6XinmKWQfy+2e2Ya4rYcw==
X-CSE-MsgGUID: 8dyxWG/cRRmVjDhfyToW3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137362"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:50 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 53754120BFE;
	Mon, 10 Jun 2024 13:05:41 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuH-004eE5-11;
	Mon, 10 Jun 2024 13:05:41 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 22/26] media: mc: Maintain a list of open file handles in a media device
Date: Mon, 10 Jun 2024 13:05:26 +0300
Message-Id: <20240610100530.1107771-23-sakari.ailus@linux.intel.com>
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

The list of file handles is needed to deliver media events as well as for
other purposes in the future.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-device.c  | 19 ++++++++++++++++++-
 drivers/media/mc/mc-devnode.c |  2 +-
 include/media/media-devnode.h |  4 +++-
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index a9505ab4412d..46d1b0c9d8be 100644
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
@@ -830,6 +843,10 @@ void media_device_unregister(struct media_device *mdev)
 	if (!media_devnode_is_registered(&mdev->devnode))
 		return;
 
+	spin_lock_irq(&mdev->fh_list_lock);
+	list_del_init(&mdev->fh_list);
+	spin_unlock_irq(&mdev->fh_list_lock);
+
 	device_remove_file(&mdev->devnode.dev, &dev_attr_model);
 	dev_dbg(mdev->dev, "Media device unregistering\n");
 	media_devnode_unregister(&mdev->devnode);
diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 26491daaba96..617156963911 100644
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


