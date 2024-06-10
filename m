Return-Path: <linux-media+bounces-12838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C857E901EDC
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3667EB25C20
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F8177D088;
	Mon, 10 Jun 2024 10:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JyKDSV9k"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295F77AE5D
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013957; cv=none; b=ayN8z0PPm8aik5lVeHjKTcjTZVYdXE+e6Fl4bdaR0gEDrufRJPB8AaNJVKBJc83cSlrfoG4Rd+jgYrZt3qtlmyfphMzBOtzX247di6v1olhALguTaAaZoekisOun1ubyi6CEvwaZkVax2RUx3rV64p4+lM7pgqFbrWjwXhd0v7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013957; c=relaxed/simple;
	bh=hC52P333pPzROQDSC9Hfo6REC+X34ZlvOLMXLuL2yCc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U8RbdeFlvMEFoK9eWUbpEn2CrsbSZaXxBr1+OezQXGcE0sb2B4cvbD7zjfWGxmkS3jd4+beKQEJhcqPoeu/HXYQOJIYkAbAzDwrM4NLJhtXRzFp4iy5EwU2qs0JIqTuRKIR4kL8hAVinZCLB09JvyQR8UXu/sQnHQlZTmAp2q5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JyKDSV9k; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013957; x=1749549957;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hC52P333pPzROQDSC9Hfo6REC+X34ZlvOLMXLuL2yCc=;
  b=JyKDSV9khtnZHq9/wagqpaE4Q183I1iglAp2joQcjUViv4Ayo4d8i8+d
   BRb/24tf1eSmYfFYX+d/WMwiqUuZDIlxwz3nxQ7COfVEvO3PoXdbxgopZ
   VCMZcMDChz5FhI941WTNWoaU0K23WMbXhkTauBwclrgmpQgTKAVe9J/Bl
   +LHQy+mVVHjWuzgUlyi6W4N7wezFk00N5NTtRdDsenj5IdmG+q19GMIXJ
   ZdAMcGDRTaFA7d/l71a0RwzGN50yAf44Th4/jlZywcW0W0hFwS04F+W22
   QockvNZX14YoZedzrAUXorbgAwdLOwoFHNl1jM0cL/IicZig9StolJ9Kv
   Q==;
X-CSE-ConnectionGUID: zDIEYrJLRDeG5G7o0z2rGA==
X-CSE-MsgGUID: +oo2/kehS7yLw4uTeIqN2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819935"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819935"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:52 -0700
X-CSE-ConnectionGUID: oeh4AEe7RmqxlyZvL3P+ug==
X-CSE-MsgGUID: v1ozZEmeQYKrDAngKh1dfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137357"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:50 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2A632120BB6;
	Mon, 10 Jun 2024 13:05:41 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuH-004eDW-0V;
	Mon, 10 Jun 2024 13:05:41 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 15/26] media: v4l: Acquire a reference to the media device for every video device
Date: Mon, 10 Jun 2024 13:05:19 +0300
Message-Id: <20240610100530.1107771-16-sakari.ailus@linux.intel.com>
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

The video device depends on the existence of its media device --- if there
is one. Acquire a reference to it.

Note that when the media device release callback is used, then the V4L2
device release callback is ignored and a warning is issued if both are
set.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-dev.c | 53 ++++++++++++++++++++----------
 1 file changed, 35 insertions(+), 18 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index be2ba7ca5de2..4bf4398fd2fe 100644
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
 
@@ -795,11 +805,17 @@ static int video_register_media_controller(struct video_device *vdev)
 	u32 intf_type;
 	int ret;
 
-	/* Memory-to-memory devices are more complex and use
-	 * their own function to register its mc entities.
+	if (!vdev->v4l2_dev->mdev)
+		return 0;
+
+	/*
+	 * Memory-to-memory devices are more complex and use their own function
+	 * to register its mc entities.
 	 */
-	if (!vdev->v4l2_dev->mdev || vdev->vfl_dir == VFL_DIR_M2M)
+	if (vdev->vfl_dir == VFL_DIR_M2M) {
+		media_device_get(vdev->v4l2_dev->mdev);
 		return 0;
+	}
 
 	vdev->entity.obj_type = MEDIA_ENTITY_TYPE_VIDEO_DEVICE;
 	vdev->entity.function = MEDIA_ENT_F_UNKNOWN;
@@ -878,6 +894,7 @@ static int video_register_media_controller(struct video_device *vdev)
 
 	/* FIXME: how to create the other interface links? */
 
+	media_device_get(vdev->v4l2_dev->mdev);
 #endif
 	return 0;
 }
-- 
2.39.2


