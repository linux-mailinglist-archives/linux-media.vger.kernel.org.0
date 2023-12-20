Return-Path: <linux-media+bounces-2763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AE4819CEA
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA0EFB21B61
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E249B20B29;
	Wed, 20 Dec 2023 10:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n08vFq4d"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B2B208DF
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 10:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703068641; x=1734604641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fn5vdqTgrAwxvRPY8aEkpwtLLDHNckvF5vsntZp7xeE=;
  b=n08vFq4dquIqyXkwV4tARzvC2JBNbMinLia5xRRa9+xjkyq1SxPbhtIA
   sJklQJCrQokicqv//C2b4Pn1RZAEt6YPNLtGbCUagi9/Q+QkIZo8X1w3O
   kyAKiQJ01Zno/WQxNi4AymHNvMs8ZUlpj0BUufh8lY2dzG+0a0pho+s06
   OYaVQTQM3Mt9nOJrlZZS1SFMLJ2JdtIGKFVBFFn1osWBluSE/NLFhru23
   00kYaBe4f8Y77cZJLlBqKyPP0FwXg0weYrRW5clgb1E/wTdSBFDRg78UH
   IR43X/YYY2JPX2H18/g1b+G4uINCl7ENyQmR8tKzFGxkOzasUVCijWSfN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9174301"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9174301"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769544226"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769544226"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:17 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 947F811FC49;
	Wed, 20 Dec 2023 12:37:14 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 01/29] Revert "[media] media: fix media devnode ioctl/syscall and unregister race"
Date: Wed, 20 Dec 2023 12:36:45 +0200
Message-Id: <20231220103713.113386-2-sakari.ailus@linux.intel.com>
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

This reverts commit 6f0dd24a084a ("[media] media: fix media devnode
ioctl/syscall and unregister race"). The commit was part of an original
patchset to avoid crashes when an unregistering device is in use.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/mc/mc-device.c  | 15 +++++++--------
 drivers/media/mc/mc-devnode.c |  8 +-------
 include/media/media-devnode.h | 16 ++--------------
 3 files changed, 10 insertions(+), 29 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index c0dd4ae57227..6c569ecd4b3d 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -741,7 +741,6 @@ int __must_check __media_device_register(struct media_device *mdev,
 	if (ret < 0) {
 		/* devnode free is handled in media_devnode_*() */
 		mdev->devnode = NULL;
-		media_devnode_unregister_prepare(devnode);
 		media_devnode_unregister(devnode);
 		return ret;
 	}
@@ -797,9 +796,6 @@ void media_device_unregister(struct media_device *mdev)
 		return;
 	}
 
-	/* Clear the devnode register bit to avoid races with media dev open */
-	media_devnode_unregister_prepare(mdev->devnode);
-
 	/* Remove all entities from the media device */
 	list_for_each_entry_safe(entity, next, &mdev->entities, graph_obj.list)
 		__media_device_unregister_entity(entity);
@@ -824,10 +820,13 @@ void media_device_unregister(struct media_device *mdev)
 
 	dev_dbg(mdev->dev, "Media device unregistered\n");
 
-	device_remove_file(&mdev->devnode->dev, &dev_attr_model);
-	media_devnode_unregister(mdev->devnode);
-	/* devnode free is handled in media_devnode_*() */
-	mdev->devnode = NULL;
+	/* Check if mdev devnode was registered */
+	if (media_devnode_is_registered(mdev->devnode)) {
+		device_remove_file(&mdev->devnode->dev, &dev_attr_model);
+		media_devnode_unregister(mdev->devnode);
+		/* devnode free is handled in media_devnode_*() */
+		mdev->devnode = NULL;
+	}
 }
 EXPORT_SYMBOL_GPL(media_device_unregister);
 
diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 680fbb3a9340..0ab33214d243 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -267,7 +267,7 @@ int __must_check media_devnode_register(struct media_device *mdev,
 	return ret;
 }
 
-void media_devnode_unregister_prepare(struct media_devnode *devnode)
+void media_devnode_unregister(struct media_devnode *devnode)
 {
 	/* Check if devnode was ever registered at all */
 	if (!media_devnode_is_registered(devnode))
@@ -275,12 +275,6 @@ void media_devnode_unregister_prepare(struct media_devnode *devnode)
 
 	mutex_lock(&media_devnode_lock);
 	clear_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
-	mutex_unlock(&media_devnode_lock);
-}
-
-void media_devnode_unregister(struct media_devnode *devnode)
-{
-	mutex_lock(&media_devnode_lock);
 	/* Delete the cdev on this minor as well */
 	cdev_device_del(&devnode->cdev, &devnode->dev);
 	devnode->media_dev = NULL;
diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
index d27c1c646c28..46f0d3ae44d1 100644
--- a/include/media/media-devnode.h
+++ b/include/media/media-devnode.h
@@ -115,19 +115,6 @@ int __must_check media_devnode_register(struct media_device *mdev,
 					struct media_devnode *devnode,
 					struct module *owner);
 
-/**
- * media_devnode_unregister_prepare - clear the media device node register bit
- * @devnode: the device node to prepare for unregister
- *
- * This clears the passed device register bit. Future open calls will be met
- * with errors. Should be called before media_devnode_unregister() to avoid
- * races with unregister and device file open calls.
- *
- * This function can safely be called if the device node has never been
- * registered or has already been unregistered.
- */
-void media_devnode_unregister_prepare(struct media_devnode *devnode);
-
 /**
  * media_devnode_unregister - unregister a media device node
  * @devnode: the device node to unregister
@@ -135,7 +122,8 @@ void media_devnode_unregister_prepare(struct media_devnode *devnode);
  * This unregisters the passed device. Future open calls will be met with
  * errors.
  *
- * Should be called after media_devnode_unregister_prepare()
+ * This function can safely be called if the device node has never been
+ * registered or has already been unregistered.
  */
 void media_devnode_unregister(struct media_devnode *devnode);
 
-- 
2.39.2


