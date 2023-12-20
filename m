Return-Path: <linux-media+bounces-2777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0384D819CF8
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2864B1C21BD9
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF54E2137B;
	Wed, 20 Dec 2023 10:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V6JzCyEM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1565C2134A
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 10:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703068649; x=1734604649;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AuhiUd0lvh2AZG/DF52hVKm1+VmJk7dFMC744uMD+rw=;
  b=V6JzCyEMyb7KIjdAekAi2Sl4Gdj21qllg0KDgHbgot0hahDE7HaqpFEC
   1XlKzOsXGhY71Wp2RHfs664tNrIjfcw0ja4bLpqEHld7v2N8TClNfwTAi
   gVOXW8/iB2ZIHNrx6RRenLOVLVXNAcvdowL0O1+s8DXRldadm62RwdOar
   RzMZtcODlt76BbGy+apf2LDDmhjbEJyyZnJ5uOLy16MtGwa1fPBkC5Qxi
   I0gTy++Ho/qFgIoi7GdE6EN8XwHITDjKAiaMBJTkYKw7vfifdtR/UKhwy
   xDM6xG3wkC9TTIBaNY7OmnGd4+2+FZLp/q4rDi2UVSi88eqfAxnvEbFR/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9174359"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9174359"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769544259"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769544259"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:26 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6EA6E11FC49;
	Wed, 20 Dec 2023 12:37:24 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 16/29] media: mc: Refcount the media device
Date: Wed, 20 Dec 2023 12:37:00 +0200
Message-Id: <20231220103713.113386-17-sakari.ailus@linux.intel.com>
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

As the struct media_device embeds struct media_devnode, the lifetime of
that object must be that same than that of the media_device.

References are obtained by media_device_get() and released by
media_device_put(). In order to use refcounting, the driver must set the
release callback before calling media_device_init() on the media device.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/mc/mc-device.c  | 36 +++++++++++++++++++++++++++++------
 drivers/media/mc/mc-devnode.c |  6 +++++-
 include/media/media-device.h  | 28 +++++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 7 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index e6ac9b066524..bbc233e726d2 100644
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
@@ -712,6 +737,8 @@ void media_device_init(struct media_device *mdev)
 	mutex_init(&mdev->graph_mutex);
 	ida_init(&mdev->entity_internal_idx);
 	atomic_set(&mdev->request_id, 0);
+
+	mdev->devnode.release = media_device_release;
 	media_devnode_init(&mdev->devnode);
 
 	if (!*mdev->bus_info)
@@ -724,12 +751,9 @@ EXPORT_SYMBOL_GPL(media_device_init);
 
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
index 5057c48f8870..4ea05e42dafb 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -59,6 +59,10 @@ static void media_devnode_release(struct device *cd)
 {
 	struct media_devnode *devnode = to_media_devnode(cd);
 
+	/* If the devnode has a ref, it is simply released by the user. */
+	if (devnode->ref)
+		return;
+
 	if (devnode->minor != -1)
 		media_devnode_free_minor(devnode->minor);
 
@@ -213,6 +217,7 @@ static const struct file_operations media_devnode_fops = {
 void media_devnode_init(struct media_devnode *devnode)
 {
 	device_initialize(&devnode->dev);
+	devnode->dev.release = media_devnode_release;
 	devnode->minor = -1;
 }
 
@@ -246,7 +251,6 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
 
 	devnode->dev.bus = &media_bus_type;
 	devnode->dev.devt = MKDEV(MAJOR(media_dev_t), devnode->minor);
-	devnode->dev.release = media_devnode_release;
 	if (devnode->parent)
 		devnode->dev.parent = devnode->parent;
 	dev_set_name(&devnode->dev, "media%d", devnode->minor);
diff --git a/include/media/media-device.h b/include/media/media-device.h
index fb0855b217ce..c6816be0eee8 100644
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
@@ -219,6 +221,30 @@ struct usb_device;
  */
 void media_device_init(struct media_device *mdev);
 
+/**
+ * media_device_get() - Get a reference to a media device
+ *
+ * @mdev: media device
+ */
+#define media_device_get(mdev)						\
+	do {								\
+		dev_dbg((mdev)->dev, "%s: get media device %s\n",	\
+			__func__, (mdev)->bus_info);			\
+		get_device(&(mdev)->devnode.dev);			\
+	} while (0)
+
+/**
+ * media_device_put() - Put a reference to a media device
+ *
+ * @mdev: media device
+ */
+#define media_device_put(mdev)						\
+	do {								\
+		dev_dbg((mdev)->dev, "%s: put media device %s\n",	\
+			__func__, (mdev)->bus_info);			\
+		put_device(&(mdev)->devnode.dev);			\
+	} while (0)
+
 /**
  * media_device_cleanup() - Cleanups a media device element
  *
@@ -432,6 +458,8 @@ void __media_device_usb_init(struct media_device *mdev,
 			     const char *driver_name);
 
 #else
+#define media_device_get(mdev) do { } while (0)
+#define media_device_put(mdev) do { } while (0)
 static inline int media_device_register(struct media_device *mdev)
 {
 	return 0;
-- 
2.39.2


