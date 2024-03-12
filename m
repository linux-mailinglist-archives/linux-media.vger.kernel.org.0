Return-Path: <linux-media+bounces-6885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B427987922A
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:35:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 440E81F21CC9
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 10:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C216579DAC;
	Tue, 12 Mar 2024 10:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f58rlD6B"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BB779B75
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 10:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239680; cv=none; b=q6egXGhvKAzsUJkJbLbZ8opdxeTkmqCn2kuRS4LFfSF8K7wR2pgWl5qr6l5Ek6W+LsXa7YDNO5qQ+TygvrzrK73P4SpPZt38hXnNmZde61rg1mw/agd9WaEQkDPskerOEXz2wREFDn0XzggpiYC7LmL1xeEjIXVxU0GXnGRh1yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239680; c=relaxed/simple;
	bh=gHkn3+4ra63kv16zVeXU2Mj2qs4V5THT9bHKSfu2byc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r2Avqk6nbN0wDW+qoBiVRQxIYzaHR3peyw8PV7Vd7qTPXhabGmvbaqQH3KzstEaJJhamw8oHVLeFZKTFzc7IyRmx9IpV+iZLKl1Mcb8q1QNhs+k16d7v4QutAndawsx3Sv/ASK3vJTdbLTXGkvCfPtbMHouQIgMbOpQTQAVkpyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f58rlD6B; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239677; x=1741775677;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gHkn3+4ra63kv16zVeXU2Mj2qs4V5THT9bHKSfu2byc=;
  b=f58rlD6B219iJwq9l+OLQGhil3v700ONkz3ngU5WgiSLi2K/GKZoDgii
   p7PZrmwg5GUA+3ekbeXQulpxtTS961tr9n80oCbLRDpRfCvOsoTXHI840
   1VpDudv5TFeKnDP63gYmRQSM2karNliawColu5R88Mgs0NVuqtzd4qioQ
   YMeSCoLrNYcNTpuVPmzcmQuCtwjbyLeJFnemROfugFz0qp35eo8sLHqjb
   wPPzFha0H3pB4SUmiYX9TUZZ2t3IzhodDdcWLSkH0mux1MB7kaEBdERzc
   77aXagpaYajSvAlN4uZPbpEW4VqC1ufTBH3gV/IJ6g00KEpGrh6HbBENP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4794309"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4794309"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16194094"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:36 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0EA6A11FB11;
	Tue, 12 Mar 2024 12:34:32 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v3 14/26] media: mc: Refcount the media device
Date: Tue, 12 Mar 2024 12:34:10 +0200
Message-Id: <20240312103422.216484-15-sakari.ailus@linux.intel.com>
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

As the struct media_device embeds struct media_devnode, the lifetime of
that object must be that same than that of the media_device.

References are obtained by media_device_get() and released by
media_device_put(). In order to use refcounting, the driver must set the
release callback before calling media_device_init() on the media device.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/mc/mc-device.c  | 35 +++++++++++++++++++++++++++++------
 drivers/media/mc/mc-devnode.c |  2 +-
 include/media/media-device.h  | 35 +++++++++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+), 7 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index f1d89d940fe1..bbc233e726d2 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -700,6 +700,31 @@ void media_device_unregister_entity_notify(struct media_device *mdev,
 }
 EXPORT_SYMBOL_GPL(media_device_unregister_entity_notify);
 
+static void __media_device_release(struct media_device *mdev)
+{
+	dev_dbg(mdev->dev, "Media device released\n");
+
+	ida_destroy(&mdev->entity_internal_idx);
+	mdev->entity_internal_idx_max = 0;
+	media_graph_walk_cleanup(&mdev->pm_count_walk);
+	mutex_destroy(&mdev->graph_mutex);
+	mutex_destroy(&mdev->req_queue_mutex);
+}
+
+static void media_device_release(struct media_devnode *devnode)
+{
+	struct media_device *mdev = to_media_device(devnode);
+
+	if (mdev->ops && mdev->ops->release) {
+		/*
+		 * If release op isn't set, __media_device_release() is called
+		 * via media_device_cleanup().
+		 */
+		__media_device_release(mdev);
+		mdev->ops->release(mdev);
+	}
+}
+
 void media_device_init(struct media_device *mdev)
 {
 	INIT_LIST_HEAD(&mdev->entities);
@@ -713,6 +738,7 @@ void media_device_init(struct media_device *mdev)
 	ida_init(&mdev->entity_internal_idx);
 	atomic_set(&mdev->request_id, 0);
 
+	mdev->devnode.release = media_device_release;
 	media_devnode_init(&mdev->devnode);
 
 	if (!*mdev->bus_info)
@@ -725,12 +751,9 @@ EXPORT_SYMBOL_GPL(media_device_init);
 
 void media_device_cleanup(struct media_device *mdev)
 {
-	ida_destroy(&mdev->entity_internal_idx);
-	mdev->entity_internal_idx_max = 0;
-	media_graph_walk_cleanup(&mdev->pm_count_walk);
-	mutex_destroy(&mdev->graph_mutex);
-	mutex_destroy(&mdev->req_queue_mutex);
-	put_device(&mdev->devnode.dev);
+	WARN_ON(mdev->ops && mdev->ops->release);
+	__media_device_release(mdev);
+	media_device_put(mdev);
 }
 EXPORT_SYMBOL_GPL(media_device_cleanup);
 
diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 64aadc51352b..6fb3a202eb26 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -200,6 +200,7 @@ static const struct file_operations media_devnode_fops = {
 void media_devnode_init(struct media_devnode *devnode)
 {
 	device_initialize(&devnode->dev);
+	devnode->dev.release = media_devnode_release;
 }
 
 int __must_check media_devnode_register(struct media_devnode *devnode,
@@ -229,7 +230,6 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
 
 	devnode->dev.bus = &media_bus_type;
 	devnode->dev.devt = MKDEV(MAJOR(media_dev_t), devnode->minor);
-	devnode->dev.release = media_devnode_release;
 	if (devnode->parent)
 		devnode->dev.parent = devnode->parent;
 	dev_set_name(&devnode->dev, "media%d", devnode->minor);
diff --git a/include/media/media-device.h b/include/media/media-device.h
index c791f3d5ad77..f1afbfc4dca2 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -62,6 +62,7 @@ struct media_entity_notify {
  *	       request (and thus the buffer) must be available to the driver.
  *	       And once a buffer is queued, then the driver can complete
  *	       or delete objects from the request before req_queue exits.
+ * @release: Release the resources of the media device.
  */
 struct media_device_ops {
 	int (*link_notify)(struct media_link *link, u32 flags,
@@ -70,6 +71,7 @@ struct media_device_ops {
 	void (*req_free)(struct media_request *req);
 	int (*req_validate)(struct media_request *req);
 	void (*req_queue)(struct media_request *req);
+	void (*release)(struct media_device *mdev);
 };
 
 /**
@@ -219,6 +221,32 @@ struct usb_device;
  */
 void media_device_init(struct media_device *mdev);
 
+/**
+ * media_device_get() - atomically increment the reference count for the media
+ * device
+ *
+ * Returns: the media device
+ *
+ * @mdev: media device
+ */
+static inline struct media_device *media_device_get(struct media_device *mdev)
+{
+	get_device(&mdev->devnode.dev);
+
+	return mdev;
+}
+
+/**
+ * media_device_put() - atomically decrement the reference count for the media
+ * device
+ *
+ * @mdev: media device
+ */
+static inline void media_device_put(struct media_device *mdev)
+{
+	put_device(&mdev->devnode.dev);
+}
+
 /**
  * media_device_cleanup() - Cleanups a media device element
  *
@@ -435,6 +463,13 @@ void __media_device_usb_init(struct media_device *mdev,
 static inline void media_device_init(struct media_device *mdev)
 {
 }
+static inline struct media_device *media_device_get(struct media_device *mdev)
+{
+	return NULL;
+}
+static inline void media_device_put(struct media_device *mdev)
+{
+}
 static inline int media_device_register(struct media_device *mdev)
 {
 	return 0;
-- 
2.39.2


