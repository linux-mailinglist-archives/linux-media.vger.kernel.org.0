Return-Path: <linux-media+bounces-12822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D72901ECC
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11B3E1F2646B
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF85770E9;
	Mon, 10 Jun 2024 10:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JSNpsAYl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCDE76035
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013948; cv=none; b=k24SZoIfsr6iHfFhoVtaYOIPAQHVYuqA553Ie+/+i6uQz529IPTjwFpC6IUO8zqiP30Ab00eyjsgNEjtWBf0SAWTxGBsgSYPYQkP6MXC5DZFVbkyy2YvimEqzfAR6eAuDhIeTlWf99JTVyyiwYfCcfUvRZiVqTt0feal1by3quQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013948; c=relaxed/simple;
	bh=WtfrCns+W3238IrZ2uqRYRyVGiCImFMTsBciFDRWSZo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LoLP3UGRAmA9q/Cdb/jC0uj9JIQlHTAq6ZZASDozxCiC9LPeJ33I/pKW9auPIQPkIGj5MsHrPCiolXSNgH0F+cIyUFxoF769G6aEGhA3g62nD9CbjqnwzwseiQPy/B2XZH+9alUMgSKBcrEQNtwaEmXRcf50QELM0/EZFZHKz7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JSNpsAYl; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013947; x=1749549947;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WtfrCns+W3238IrZ2uqRYRyVGiCImFMTsBciFDRWSZo=;
  b=JSNpsAYlkGlXgPhgcLVpOFM7XjTfDKy8CjvqgbhwjtskBJR4tIY1L6LK
   jUTJeWRvPGySnRL8BHw+v5+KVjjxDtgwvcZbPRJD6JvAEDSl2yIJlvkY5
   04kFUG/8FOYN6LPPp3Lgapk3YQ/rJvDn2CBTJ5Rv+/hjSPoivlOLH30g7
   rVQl+9qp//qmmj4Xfi1YlyEoOAXOgOvzAR4p+Yt4q4qsZJ2VeGX5Z3ZwP
   zj7OXHGk9GjUv4jqRIpAWnULjQh+S7JZx7CZA7RSkfseIu8eUoVPKBC6J
   Dh7bTv/SvEP4QCTEnf2G0Gz+j3RJjJmQNiebM/cZ+CQXPBrFDTnVmwy9f
   Q==;
X-CSE-ConnectionGUID: a/sVBQD9RziouAhhstol9w==
X-CSE-MsgGUID: T6ZjLAJ4SbabMJWcxmVVNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819867"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819867"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:45 -0700
X-CSE-ConnectionGUID: iU3ikw4PRk2nWXSAf3GMgA==
X-CSE-MsgGUID: w8udnJHjSpC8bXEkuGCypA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137330"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:43 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D4FEC12037A;
	Mon, 10 Jun 2024 13:05:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuG-004eCO-2f;
	Mon, 10 Jun 2024 13:05:40 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 01/26] Revert "[media] media: fix media devnode ioctl/syscall and unregister race"
Date: Mon, 10 Jun 2024 13:05:05 +0300
Message-Id: <20240610100530.1107771-2-sakari.ailus@linux.intel.com>
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
index 318e267e798e..22905c1d86e8 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -265,7 +265,7 @@ int __must_check media_devnode_register(struct media_device *mdev,
 	return ret;
 }
 
-void media_devnode_unregister_prepare(struct media_devnode *devnode)
+void media_devnode_unregister(struct media_devnode *devnode)
 {
 	/* Check if devnode was ever registered at all */
 	if (!media_devnode_is_registered(devnode))
@@ -273,12 +273,6 @@ void media_devnode_unregister_prepare(struct media_devnode *devnode)
 
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


