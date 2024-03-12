Return-Path: <linux-media+bounces-6883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AD8879228
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:35:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C12871F21D64
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 10:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E349279B9A;
	Tue, 12 Mar 2024 10:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UYuUANrW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F4779B85
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 10:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239679; cv=none; b=ICimNKvCTPBk01G5pEP9DGqjNRMSBzt/wAdAzJL7DJaZJ4J5hkWTmR4Nh6vhWIKXss/98SYMVBlcC1LoEY4tAf9DgPVGeH31vEDZZtBENXCC/v1wWmV0Ze0PN48lm4NaQj5BpIuse377iwrDOVfaasx7epdYvLpm457dVVNht2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239679; c=relaxed/simple;
	bh=tZamopol//gjvxe0Jk3bDem0g/gPKnP+1lObBx5EELg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IbASJPFYuD/LPZiAF9oviKv5xI4tcaUbmcGekT2qFip1+BM8ZswqOJFsLaZXe9vgmxmNP5CA5lbqdhf5LqutA9zmqNDf7umTlMEPURzQPNihdb9HiHYo4g7s9cCH+chChdMnlzw1AYU3Ts3y7AwxyAgDLalzHOODK/wWruZ3+BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UYuUANrW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239678; x=1741775678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tZamopol//gjvxe0Jk3bDem0g/gPKnP+1lObBx5EELg=;
  b=UYuUANrWSmWUxAUTkbEDdA6D8a2g40TSLcw207Ap42P9wsS6PBWm3/MH
   t0Pqa2neQpk5na90ocFgQLd8GzFvplwaU2ZjH1eS30Y18Kk87tkX+bCuJ
   DwvR9t1Fthyv6fTNhFgPDSyIRNYLx2+0SxrQivnXQY1d6nDrhfWuAt0RO
   ZVZl/6r+QtLh52DQ2Hg7YWzhGyPmIBi9LmGQEHOlLv1VW1UZsd9QjlBod
   U1mOP54lLAkyCJEN/t39xIr4v+apidZ80DuBFTiD15o72LEymA/RWZ2aH
   3yHm4tcddL92lAHquntxidgUMx+QnuG70Y58ntzKvzqXeGvnDEU2nKJNG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4794314"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4794314"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16194095"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:36 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B79B6120619;
	Tue, 12 Mar 2024 12:34:33 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v3 15/26] media: v4l: Acquire a reference to the media device for every video device
Date: Tue, 12 Mar 2024 12:34:11 +0200
Message-Id: <20240312103422.216484-16-sakari.ailus@linux.intel.com>
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

The video device depends on the existence of its media device --- if there
is one. Acquire a reference to it.

Note that when the media device release callback is used, then the V4L2
device release callback is ignored and a warning is issued if both are
set.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-dev.c | 50 +++++++++++++++++++-----------
 1 file changed, 32 insertions(+), 18 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index d13954bd31fd..ba0bfcbe7136 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -176,6 +176,11 @@ static void v4l2_device_release(struct device *cd)
 {
 	struct video_device *vdev = to_video_device(cd);
 	struct v4l2_device *v4l2_dev = vdev->v4l2_dev;
+	bool v4l2_dev_call_release = v4l2_dev->release;
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
@@ -207,23 +212,28 @@ static void v4l2_device_release(struct device *cd)
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
+	if (WARN_ON(v4l2_dev_call_release && mdev_has_release))
+		v4l2_dev_call_release = false;
+#endif
+
+	/*
+	 * Decrease v4l2_device refcount, but only if the media device doesn't
+	 * have a release callback.
+	 */
+	if (v4l2_dev_call_release)
 		v4l2_device_put(v4l2_dev);
 }
 
@@ -792,11 +802,14 @@ static int video_register_media_controller(struct video_device *vdev)
 	u32 intf_type;
 	int ret;
 
-	/* Memory-to-memory devices are more complex and use
-	 * their own function to register its mc entities.
+	/*
+	 * Memory-to-memory devices are more complex and use their own function
+	 * to register its mc entities.
 	 */
-	if (!vdev->v4l2_dev->mdev || vdev->vfl_dir == VFL_DIR_M2M)
+	if (!vdev->v4l2_dev->mdev || vdev->vfl_dir == VFL_DIR_M2M) {
+		media_device_get(vdev->v4l2_dev->mdev);
 		return 0;
+	}
 
 	vdev->entity.obj_type = MEDIA_ENTITY_TYPE_VIDEO_DEVICE;
 	vdev->entity.function = MEDIA_ENT_F_UNKNOWN;
@@ -875,6 +888,7 @@ static int video_register_media_controller(struct video_device *vdev)
 
 	/* FIXME: how to create the other interface links? */
 
+	media_device_get(vdev->v4l2_dev->mdev);
 #endif
 	return 0;
 }
-- 
2.39.2


