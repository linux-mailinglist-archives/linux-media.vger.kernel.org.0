Return-Path: <linux-media+bounces-6870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4A4879217
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:34:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55F541C2119B
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 10:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D39EF58207;
	Tue, 12 Mar 2024 10:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hX3pizxb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4A835F18
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 10:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239671; cv=none; b=gm+J0IYoeQ/SqxuZEKWMGa8TJ1MNrJEvOZoj+jynzuTeiLnG51SHQdyblGrAWoN/haagqD8cvEc1Y+5Iqt85eb3//Dt6+hrvCdkpmzRe0jXIIOgmVo/HhBjdqYRkvxgaqnhbUud4yW8wb8+Oeu94BDqMmrvj5cEGO575aZHMkUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239671; c=relaxed/simple;
	bh=wt5TpGLUjA2yafUJ8E8ZxwHU8bMfsj7s2Wy4iVnixqM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q6kAyCu0tutRam/nuFa9Q1pdWiQ5RBCMPPT0w8KRYTocApyRh6wCVIIxwi7tAFbH8WegCGH2S96MFDxXWR248zK687KAUjNJTXdr2pvtjuGrN3joZTFW7/VDE7UQ2Y7HrOmljyEQiP0d3dFA3tO2ol+i0Fe8e1cD7pGf6W3hUCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hX3pizxb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239670; x=1741775670;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wt5TpGLUjA2yafUJ8E8ZxwHU8bMfsj7s2Wy4iVnixqM=;
  b=hX3pizxbznMvvqGYcVGj09J24H6/6V1C07sXz78sHTIZi2+P3tE61+1O
   h+AUp1IyQ0gcF+vlkXqmLedfk/4HAh9ix2K+Loqp5lxYPu8FXxfFLMOR1
   8OEqbq0KVdtCGh1pu4rhHb5XIEYoRzV4EfTprxgpLvM2UxjfR0VY+hZyT
   Z3E2KtEUANlqSqI8A5jerpnHihnmm++M3f8kGFofizQuLK485aDkq2KmS
   2jzg4AlklZn3RD87KQtrlOB2CXOiTZBfcsSveWfNwieUdTSpHoUJ1A9g2
   UoXRndGUFHEqfWpBNqkaJd97HNZp4RAJeyaafUe0Ifhrey18La/xEck0H
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4794255"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4794255"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16194055"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:27 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0592B11F81D;
	Tue, 12 Mar 2024 12:34:23 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v3 01/26] Revert "[media] media: fix media devnode ioctl/syscall and unregister race"
Date: Tue, 12 Mar 2024 12:33:57 +0200
Message-Id: <20240312103422.216484-2-sakari.ailus@linux.intel.com>
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
index 7f67825c8757..302328f51417 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -266,7 +266,7 @@ int __must_check media_devnode_register(struct media_device *mdev,
 	return ret;
 }
 
-void media_devnode_unregister_prepare(struct media_devnode *devnode)
+void media_devnode_unregister(struct media_devnode *devnode)
 {
 	/* Check if devnode was ever registered at all */
 	if (!media_devnode_is_registered(devnode))
@@ -274,12 +274,6 @@ void media_devnode_unregister_prepare(struct media_devnode *devnode)
 
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


