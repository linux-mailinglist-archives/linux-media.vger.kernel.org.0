Return-Path: <linux-media+bounces-16576-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C85959F84
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 16:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E08E1C20D60
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 14:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FBB1B1D4B;
	Wed, 21 Aug 2024 14:16:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C19C199FC0
	for <linux-media@vger.kernel.org>; Wed, 21 Aug 2024 14:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724249807; cv=none; b=GjRTZLXnNYSYHWPwJRcFlBG12WTbG/lBPG29tX4t6pEoaljp+Sh7fV74kc0qxJ6cALPUvErkz550q/ozZKE8HJHNaP0nb/tpNOCzXaAmFir8lFHbrOjFw3kb+ejfpcU5bQP9I/y/5b3qnAnMldWXtvkDDVc3QqZ5vcjQ63fETz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724249807; c=relaxed/simple;
	bh=r8zYZXpyIXPIVDD92anbACSdWRG733dOkoyXxU+vm4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=heti3+43Ovv4M2M8KZ1fcDM76FsYSvMOgFhTS8P8WdR9/Kf7Wu+S1ADvj33uymE0DKkTPrJx0kmDhMBDHASFtwhhempHYRRcIQp7nX3JmhTJbkw1P6DzH2pEbB3X4vYoH1ZEVhtGGHoogZlAcw/PGt3t6v8uiA4TeXlo9n/4DRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF5FC4AF09;
	Wed, 21 Aug 2024 14:16:44 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 1/7] media: v4l2-core: add v4l2_debugfs_root()
Date: Wed, 21 Aug 2024 16:10:15 +0200
Message-ID: <7992e2e6f05bcf31ba8b646fbe179f1d3eabfae7.1724249420.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1724249420.git.hverkuil-cisco@xs4all.nl>
References: <cover.1724249420.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This new function returns the dentry of the top-level debugfs "v4l2"
directory. If it does not exist yet, then it is created first.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-dev.c | 14 ++++++++++++++
 include/media/v4l2-dev.h           | 15 +++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index be2ba7ca5de2..4bbf279a0c8b 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -93,6 +93,8 @@ static struct attribute *video_device_attrs[] = {
 };
 ATTRIBUTE_GROUPS(video_device);
 
+static struct dentry *v4l2_debugfs_root_dir;
+
 /*
  *	Active devices
  */
@@ -1104,6 +1106,16 @@ void video_unregister_device(struct video_device *vdev)
 }
 EXPORT_SYMBOL(video_unregister_device);
 
+#ifdef CONFIG_DEBUG_FS
+struct dentry *v4l2_debugfs_root(void)
+{
+	if (!v4l2_debugfs_root_dir)
+		v4l2_debugfs_root_dir = debugfs_create_dir("v4l2", NULL);
+	return v4l2_debugfs_root_dir;
+}
+EXPORT_SYMBOL_GPL(v4l2_debugfs_root);
+#endif
+
 #if defined(CONFIG_MEDIA_CONTROLLER)
 
 __must_check int video_device_pipeline_start(struct video_device *vdev,
@@ -1208,6 +1220,8 @@ static void __exit videodev_exit(void)
 
 	class_unregister(&video_class);
 	unregister_chrdev_region(dev, VIDEO_NUM_DEVICES);
+	debugfs_remove_recursive(v4l2_debugfs_root_dir);
+	v4l2_debugfs_root_dir = NULL;
 }
 
 subsys_initcall(videodev_init);
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index d82dfdbf6e58..1b6222fab24e 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -62,6 +62,7 @@ struct v4l2_ioctl_callbacks;
 struct video_device;
 struct v4l2_device;
 struct v4l2_ctrl_handler;
+struct dentry;
 
 /**
  * enum v4l2_video_device_flags - Flags used by &struct video_device
@@ -539,6 +540,20 @@ static inline int video_is_registered(struct video_device *vdev)
 	return test_bit(V4L2_FL_REGISTERED, &vdev->flags);
 }
 
+/**
+ * v4l2_debugfs_root - returns the dentry of the top-level "v4l2" debugfs dir
+ *
+ * If this directory does not yet exist, then it will be created.
+ */
+#ifdef CONFIG_DEBUG_FS
+struct dentry *v4l2_debugfs_root(void);
+#else
+static inline struct dentry *v4l2_debugfs_root(void)
+{
+	return NULL;
+}
+#endif
+
 #if defined(CONFIG_MEDIA_CONTROLLER)
 
 /**
-- 
2.43.0


