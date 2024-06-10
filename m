Return-Path: <linux-media+bounces-12836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC764901EDA
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:06:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C8321F26D19
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09775770E1;
	Mon, 10 Jun 2024 10:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GChln0oV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19AA79B9D
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013956; cv=none; b=cWHzX7tOHy7gVnerJPJ7x5wkLzQwijiJDI1HcVWxkNk/21+TZCk9M0sJWAZpxWS8CoXWVzmmRwr3SS8PyHVLiImWcA3+vZ9HC2SelGhRDMaeIPrmwABgHCnTMf7X4tQ91BfmD9mOze1j8Try0Jpv+I7dvHkROxVRYwPyhWaFjJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013956; c=relaxed/simple;
	bh=aPZbu0rnFtTAiE/5+nBd9q8jRDWNE4vfxZZptIecYKY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rLCz0uftx+pekGGYdooLzlCvZGcBlPJ8HnqoQw0dFH0LyqEuHJWJ/STDwQuQ0BKTUftZZSkFo1izamiQB5fHkUBfeeAIWFiqtR46+wQUI55MevLhkPZr1U2iIEYRFL1NTUFWbE2gie/QMuxqISD1Mzddx2SjrHZb10oSwkvIs+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GChln0oV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013955; x=1749549955;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aPZbu0rnFtTAiE/5+nBd9q8jRDWNE4vfxZZptIecYKY=;
  b=GChln0oVV0CAPMr5JEF+dor2/sspRjAvgFime+zUPmBtX9KfITGmfKh9
   OgOAE+CzkCkkLUki/8qiPaOuiHHKe1X+Z1DVKlL00GJ8p59tla0k5FOol
   9sAACqYia3ClSTv1buQnFwR063US2eBPwWRs6w5NnBYVv7gvfRzUkqkYA
   2W53/g6VbiR4rxxkKeVQM+dTA2atOzmhs+a8SOgz2RVyXFSArxs1AKSzO
   l6F8Ie0cuDw+vFa1Umg3Jh154ixMYIjC4JHdddky9mBTtrNe4YwXV3cNm
   v7ysK4VLincK0Mg6k+Z5kiF5AKISbshwqEj3nlRmpxo9K4KRFv0GblRNM
   Q==;
X-CSE-ConnectionGUID: iaFXl3DjTuWc3Ab4/Iaq6Q==
X-CSE-MsgGUID: 9IhP/19uRZCHHd7oOrTLyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819925"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819925"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:50 -0700
X-CSE-ConnectionGUID: 9hMQHRVmQEWkwCduMcbSwQ==
X-CSE-MsgGUID: ofhqrJV7S5K6RRIQg7YtXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137347"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:47 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 259D7120BB0;
	Mon, 10 Jun 2024 13:05:41 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuH-004eDR-0P;
	Mon, 10 Jun 2024 13:05:41 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 14/26] media: mc: Refcount the media device
Date: Mon, 10 Jun 2024 13:05:18 +0300
Message-Id: <20240610100530.1107771-15-sakari.ailus@linux.intel.com>
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
index 214b9b142d90..f27d5d288a38 100644
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


