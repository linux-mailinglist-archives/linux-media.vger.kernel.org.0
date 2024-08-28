Return-Path: <linux-media+bounces-17020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 592C8962798
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 14:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FAFD1F275FC
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 12:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6364317BEA2;
	Wed, 28 Aug 2024 12:46:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F11B16EB53
	for <linux-media@vger.kernel.org>; Wed, 28 Aug 2024 12:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724849165; cv=none; b=by0ZAss9C3zC/YVITeIjjIttQo+kWBcIVmFdJy155OVtJXYEwHEuNlxXJlyM+64ubYBZL9OGEaqvJmIauuwi97CWW5Wl+27VRwXE2Oc3764kS+ovrAZ9zPtkMYLhggh3xRgYQFtNcLzf3uA2iFHNuX6Ls+LoKJ8lF8xdeSCE5IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724849165; c=relaxed/simple;
	bh=CIJ6elKb2KCwzSAxvYV+kP0umR+sGAOCkLI2DvkIBSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BiMQNERW2S+u3cBDx/IlQgogkLEYxHkijo8xzNQV+JzDkQdvV1GqdkOFDykpFDIDdzH+GzLMMi/GfsCzXLNkf4G5ebvo8xd5dGt4J5OPu3mzf6zwFyXhvA8S4vaO9ZBuHMKTkB6FKMA+IzTVR+9quk676zRyfgi2eX/hF81Lpug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96533C98ED9;
	Wed, 28 Aug 2024 12:46:03 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/4] media: mc: add media_debugfs_root()
Date: Wed, 28 Aug 2024 14:37:39 +0200
Message-ID: <3d18c4c2dae3a2b4c4156ad791b4dec50dcda96c.1724848660.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1724848660.git.hverkuil-cisco@xs4all.nl>
References: <cover.1724848660.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This new function returns the dentry of the top-level debugfs "media"
directory. If it does not exist yet, then it is created first.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/mc/mc-devnode.c | 15 +++++++++++++++
 include/media/media-devnode.h | 14 ++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 318e267e798e..906c10fe26f0 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -20,6 +20,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/debugfs.h>
 #include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/module.h>
@@ -45,6 +46,18 @@ static dev_t media_dev_t;
 static DEFINE_MUTEX(media_devnode_lock);
 static DECLARE_BITMAP(media_devnode_nums, MEDIA_NUM_DEVICES);
 
+static struct dentry *media_debugfs_root_dir;
+
+#ifdef CONFIG_DEBUG_FS
+struct dentry *media_debugfs_root(void)
+{
+	if (!media_debugfs_root_dir)
+		media_debugfs_root_dir = debugfs_create_dir("media", NULL);
+	return media_debugfs_root_dir;
+}
+EXPORT_SYMBOL_GPL(media_debugfs_root);
+#endif
+
 /* Called when the last user of the media device exits. */
 static void media_devnode_release(struct device *cd)
 {
@@ -316,6 +329,8 @@ static void __exit media_devnode_exit(void)
 {
 	bus_unregister(&media_bus_type);
 	unregister_chrdev_region(media_dev_t, MEDIA_NUM_DEVICES);
+	debugfs_remove_recursive(media_debugfs_root_dir);
+	media_debugfs_root_dir = NULL;
 }
 
 subsys_initcall(media_devnode_init);
diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
index d27c1c646c28..e9f272ebd3d0 100644
--- a/include/media/media-devnode.h
+++ b/include/media/media-devnode.h
@@ -165,4 +165,18 @@ static inline int media_devnode_is_registered(struct media_devnode *devnode)
 	return test_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
 }
 
+/**
+ * media_debugfs_root - returns the dentry of the top-level "media" debugfs dir
+ *
+ * If this directory does not yet exist, then it will be created.
+ */
+#ifdef CONFIG_DEBUG_FS
+struct dentry *media_debugfs_root(void);
+#else
+static inline struct dentry *media_debugfs_root(void)
+{
+	return NULL;
+}
+#endif
+
 #endif /* _MEDIA_DEVNODE_H */
-- 
2.43.0


