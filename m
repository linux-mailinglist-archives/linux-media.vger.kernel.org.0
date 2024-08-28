Return-Path: <linux-media+bounces-17036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7493D962A2C
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 16:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EBEC1F258D9
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 14:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC8C196C7C;
	Wed, 28 Aug 2024 14:26:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3753F189900
	for <linux-media@vger.kernel.org>; Wed, 28 Aug 2024 14:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724855179; cv=none; b=QaL1qfLWObAKA7xgYw96H1yHXTIXeUXzuJJrWKRYQSM/NXeqtcukYao7o/erlTXJE32RtrU/BNvTVAvt2MZ057l85MKQiLwdXxQThCmENmQolqYNxc3E9yoAZUjZqfZvahdB/FQiCRFOfsyZ7K/HUHRYCeAgR0wY4LXNkgW4EVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724855179; c=relaxed/simple;
	bh=r8zYZXpyIXPIVDD92anbACSdWRG733dOkoyXxU+vm4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QhfTX0XVzfd3Gonw4k3gkgYdEh2ZfYiuUdl4ZCxJWZSS04iRzUA/AWP7FbgciSQyOv21nNnwfFiHHmnNxGZliBV17TpfSja2uA1t1yWh2MFXzhRE1UdPMPAshtuM+4BO5PLzXLx6WwOODASyrTgycMDeFH7oiwXVgVMhG5UbHNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3A3C4CEE3;
	Wed, 28 Aug 2024 14:26:17 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/7] media: v4l2-core: add v4l2_debugfs_root()
Date: Wed, 28 Aug 2024 16:24:07 +0200
Message-ID: <14553ed303f36c8ac6f654a3278c4ed665457e23.1724855053.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1724855053.git.hverkuil-cisco@xs4all.nl>
References: <cover.1724855053.git.hverkuil-cisco@xs4all.nl>
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


