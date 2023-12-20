Return-Path: <linux-media+bounces-2778-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D88F4819CF9
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:38:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 655661F22348
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566FA2137F;
	Wed, 20 Dec 2023 10:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GP4LYJcI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D96C21358
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 10:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703068649; x=1734604649;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DljlbCt0FSsT8kkZ5/vM2Z0AgTD0mlbqYy7HsNaKVdY=;
  b=GP4LYJcIKRyp5Fyuh20xlywB9m0CKXXbmu/nmXmkZdcQBSTwVF7bFqsT
   JPow+QEMfZJI1A20nl+KRnghlK1YYFVD/I3Q2sftfLdnLF7RbMrul9zQ+
   jvPy8a6hH78XGrrNUJwGyqsaKHpkSZ866cgeyUzY6KzAutNZPlFVUS6QV
   QYcUvSp9jWUp7SwZoRG+zM4uqkgem1Q2NxnUpQpC0AAo9ba5FOn9YtsdY
   KVCLToPD8tJLiyQOqXeRB309JjxgvzmWvk35OpC5bku1dJEv2gdMpjMD7
   tsD2w89Zs7KChZkozzC80eR47MJ/8oMQNCzfMO60xrHg+wDB59bMoZlBF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9174364"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9174364"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769544265"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769544265"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:27 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 05FA01201D0;
	Wed, 20 Dec 2023 12:37:24 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 17/29] media: v4l: Acquire a reference to the media device for every video device
Date: Wed, 20 Dec 2023 12:37:01 +0200
Message-Id: <20231220103713.113386-18-sakari.ailus@linux.intel.com>
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

The video device depends on the existence of its media device --- if there
is one. Acquire a reference to it.

Note that when the media device release callback is used, then the V4L2
device release callback is ignored and a warning is issued if both are
set.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-dev.c | 51 ++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index d13954bd31fd..c1e4995eaf5c 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -176,6 +176,11 @@ static void v4l2_device_release(struct device *cd)
 {
 	struct video_device *vdev = to_video_device(cd);
 	struct v4l2_device *v4l2_dev = vdev->v4l2_dev;
+	bool v4l2_dev_has_release = v4l2_dev->release;
+#ifdef CONFIG_MEDIA_CONTROLLER
+	struct media_device *mdev = v4l2_dev->mdev;
+	bool mdev_has_release = mdev && mdev->ops && mdev->ops->release;
+#endif
 
 	mutex_lock(&videodev_lock);
 	if (WARN_ON(video_devices[vdev->minor] != vdev)) {
@@ -198,8 +203,8 @@ static void v4l2_device_release(struct device *cd)
 
 	mutex_unlock(&videodev_lock);
 
-#if defined(CONFIG_MEDIA_CONTROLLER)
-	if (v4l2_dev->mdev && vdev->vfl_dir != VFL_DIR_M2M) {
+#ifdef CONFIG_MEDIA_CONTROLLER
+	if (mdev && vdev->vfl_dir != VFL_DIR_M2M) {
 		/* Remove interfaces and interface links */
 		media_devnode_remove(vdev->intf_devnode);
 		if (vdev->entity.function != MEDIA_ENT_F_UNKNOWN)
@@ -207,23 +212,31 @@ static void v4l2_device_release(struct device *cd)
 	}
 #endif
 
-	/* Do not call v4l2_device_put if there is no release callback set.
-	 * Drivers that have no v4l2_device release callback might free the
-	 * v4l2_dev instance in the video_device release callback below, so we
-	 * must perform this check here.
-	 *
-	 * TODO: In the long run all drivers that use v4l2_device should use the
-	 * v4l2_device release callback. This check will then be unnecessary.
-	 */
-	if (v4l2_dev->release == NULL)
-		v4l2_dev = NULL;
-
 	/* Release video_device and perform other
 	   cleanups as needed. */
 	vdev->release(vdev);
 
-	/* Decrease v4l2_device refcount */
-	if (v4l2_dev)
+#ifdef CONFIG_MEDIA_CONTROLLER
+	if (mdev)
+		media_device_put(mdev);
+
+	/*
+	 * Generally both struct media_device and struct v4l2_device are
+	 * embedded in the same driver's context struct so having a release
+	 * callback in both is a bug.
+	 */
+	WARN_ON(v4l2_dev_has_release && mdev_has_release);
+#endif
+
+	/*
+	 * Decrease v4l2_device refcount, but only if the media device doesn't
+	 * have a release callback.
+	 */
+	if (v4l2_dev_has_release
+#ifdef CONFIG_MEDIA_CONTROLLER
+	    && !mdev_has_release
+#endif
+	    )
 		v4l2_device_put(v4l2_dev);
 }
 
@@ -792,11 +805,14 @@ static int video_register_media_controller(struct video_device *vdev)
 	u32 intf_type;
 	int ret;
 
-	/* Memory-to-memory devices are more complex and use
+	/*
+	 * Memory-to-memory devices are more complex and use
 	 * their own function to register its mc entities.
 	 */
-	if (!vdev->v4l2_dev->mdev || vdev->vfl_dir == VFL_DIR_M2M)
+	if (!vdev->v4l2_dev->mdev || vdev->vfl_dir == VFL_DIR_M2M) {
+		media_device_get(vdev->v4l2_dev->mdev);
 		return 0;
+	}
 
 	vdev->entity.obj_type = MEDIA_ENTITY_TYPE_VIDEO_DEVICE;
 	vdev->entity.function = MEDIA_ENT_F_UNKNOWN;
@@ -875,6 +891,7 @@ static int video_register_media_controller(struct video_device *vdev)
 
 	/* FIXME: how to create the other interface links? */
 
+	media_device_get(vdev->v4l2_dev->mdev);
 #endif
 	return 0;
 }
-- 
2.39.2


