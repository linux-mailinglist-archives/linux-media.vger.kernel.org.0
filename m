Return-Path: <linux-media+bounces-17037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DC1962A2D
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 16:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 458431C23FB0
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 14:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F90199FCE;
	Wed, 28 Aug 2024 14:26:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83DB189900
	for <linux-media@vger.kernel.org>; Wed, 28 Aug 2024 14:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724855180; cv=none; b=DAjKE1hMeNvWIdBBm+WPq9C6sHVo/Vap+wDSxdt+VdV0ZnXma73K9iKU/gIdizaRRcvdgerKS+Lt+QtFa7pN1iup7xoKHF4jE6cfAM3P8G3FV8kTzvqPi1iiio02or/i3I94iNourYHrPMAxLYsBF3GQvLW15NDZpAhSL7u+/1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724855180; c=relaxed/simple;
	bh=x4NPBqvgAgxZJKJuLMQEFczIcYUzF9/TyUkKvcf6gFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nIs/27EH8Bo+I8XSsSNOeST4VNVgZhgGOYpKBlTgEwp+fBlmIPyLt8IOpqYY6IjOHOQ3WENhcdAZ8xhjBrHDqDE3wnLGOL+0nVX9WYWUNdp+i/bGcxE0DtwxYnyLc5TSu325Gcqn3aRR8ULUfhrgfPhLHaUVPtsf/UWTkvg9RUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E6C5C4CEE5;
	Wed, 28 Aug 2024 14:26:19 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/7] media: v4l2-core: add v4l2_debugfs_if_alloc/free()
Date: Wed, 28 Aug 2024 16:24:08 +0200
Message-ID: <931a281c72e9c3081eaedc2d76806ebd770a0913.1724855053.git.hverkuil-cisco@xs4all.nl>
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

Add new helpers to export received or transmitted HDMI InfoFrames to
debugfs.

This complements similar code in drm where the transmitted HDMI infoframes
are exported to debugfs.

The same names have been used as in drm, so this is consistent.

The exported infoframes can be parsed with the edid-decode utility.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-dv-timings.c | 63 +++++++++++++++++++++++
 include/media/v4l2-dv-timings.h           | 48 +++++++++++++++++
 2 files changed, 111 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dv-timings.c b/drivers/media/v4l2-core/v4l2-dv-timings.c
index 942d0005c55e..86a8627f4bcc 100644
--- a/drivers/media/v4l2-core/v4l2-dv-timings.c
+++ b/drivers/media/v4l2-core/v4l2-dv-timings.c
@@ -1154,3 +1154,66 @@ int v4l2_phys_addr_validate(u16 phys_addr, u16 *parent, u16 *port)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_phys_addr_validate);
+
+#ifdef CONFIG_DEBUG_FS
+
+#define DEBUGFS_FOPS(type, flag)					\
+static ssize_t								\
+infoframe_read_##type(struct file *filp,				\
+		      char __user *ubuf, size_t count, loff_t *ppos)	\
+{									\
+	struct v4l2_debugfs_if *infoframes = filp->private_data;	\
+									\
+	return infoframes->if_read((flag), infoframes->priv, filp,	\
+				   ubuf, count, ppos);			\
+}									\
+									\
+static const struct file_operations infoframe_##type##_fops = {		\
+	.owner   = THIS_MODULE,						\
+	.open    = simple_open,						\
+	.read    = infoframe_read_##type,				\
+}
+
+DEBUGFS_FOPS(avi, V4L2_DEBUGFS_IF_AVI);
+DEBUGFS_FOPS(audio, V4L2_DEBUGFS_IF_AUDIO);
+DEBUGFS_FOPS(spd, V4L2_DEBUGFS_IF_SPD);
+DEBUGFS_FOPS(hdmi, V4L2_DEBUGFS_IF_HDMI);
+
+struct v4l2_debugfs_if *v4l2_debugfs_if_alloc(struct dentry *root, u32 if_types,
+					      void *priv,
+					      v4l2_debugfs_if_read_t if_read)
+{
+	struct v4l2_debugfs_if *infoframes;
+
+	if (IS_ERR_OR_NULL(root) || !if_types || !if_read)
+		return NULL;
+
+	infoframes = kzalloc(sizeof(*infoframes), GFP_KERNEL);
+	if (!infoframes)
+		return NULL;
+
+	infoframes->if_dir = debugfs_create_dir("infoframes", root);
+	infoframes->priv = priv;
+	infoframes->if_read = if_read;
+	if (if_types & V4L2_DEBUGFS_IF_AVI)
+		debugfs_create_file("avi", 0400, infoframes->if_dir, infoframes, &infoframe_avi_fops);
+	if (if_types & V4L2_DEBUGFS_IF_AUDIO)
+		debugfs_create_file("audio", 0400, infoframes->if_dir, infoframes, &infoframe_audio_fops);
+	if (if_types & V4L2_DEBUGFS_IF_SPD)
+		debugfs_create_file("spd", 0400, infoframes->if_dir, infoframes, &infoframe_spd_fops);
+	if (if_types & V4L2_DEBUGFS_IF_HDMI)
+		debugfs_create_file("hdmi", 0400, infoframes->if_dir, infoframes, &infoframe_hdmi_fops);
+	return infoframes;
+}
+EXPORT_SYMBOL_GPL(v4l2_debugfs_if_alloc);
+
+void v4l2_debugfs_if_free(struct v4l2_debugfs_if *infoframes)
+{
+	if (infoframes) {
+		debugfs_remove_recursive(infoframes->if_dir);
+		kfree(infoframes);
+	}
+}
+EXPORT_SYMBOL_GPL(v4l2_debugfs_if_free);
+
+#endif
diff --git a/include/media/v4l2-dv-timings.h b/include/media/v4l2-dv-timings.h
index 8fa963326bf6..13830411bd6c 100644
--- a/include/media/v4l2-dv-timings.h
+++ b/include/media/v4l2-dv-timings.h
@@ -8,6 +8,7 @@
 #ifndef __V4L2_DV_TIMINGS_H
 #define __V4L2_DV_TIMINGS_H
 
+#include <linux/debugfs.h>
 #include <linux/videodev2.h>
 
 /**
@@ -251,4 +252,51 @@ void v4l2_set_edid_phys_addr(u8 *edid, unsigned int size, u16 phys_addr);
 u16 v4l2_phys_addr_for_input(u16 phys_addr, u8 input);
 int v4l2_phys_addr_validate(u16 phys_addr, u16 *parent, u16 *port);
 
+/* Add support for exporting InfoFrames to debugfs */
+
+/*
+ * HDMI InfoFrames start with a 3 byte header, then a checksum,
+ * followed by the actual IF payload.
+ *
+ * The payload length is limited to 30 bytes according to the HDMI spec,
+ * but since the length is encoded in 5 bits, it can be 31 bytes theoretically.
+ * So set the max length as 31 + 3 (header) + 1 (checksum) = 35.
+ */
+#define V4L2_DEBUGFS_IF_MAX_LEN (35)
+
+#define V4L2_DEBUGFS_IF_AVI	BIT(0)
+#define V4L2_DEBUGFS_IF_AUDIO	BIT(1)
+#define V4L2_DEBUGFS_IF_SPD	BIT(2)
+#define V4L2_DEBUGFS_IF_HDMI	BIT(3)
+
+typedef ssize_t (*v4l2_debugfs_if_read_t)(u32 type, void *priv,
+					  struct file *filp, char __user *ubuf,
+					  size_t count, loff_t *ppos);
+
+struct v4l2_debugfs_if {
+	struct dentry *if_dir;
+	void *priv;
+
+	v4l2_debugfs_if_read_t if_read;
+};
+
+#ifdef CONFIG_DEBUG_FS
+struct v4l2_debugfs_if *v4l2_debugfs_if_alloc(struct dentry *root, u32 if_types,
+					      void *priv,
+					      v4l2_debugfs_if_read_t if_read);
+void v4l2_debugfs_if_free(struct v4l2_debugfs_if *infoframes);
+#else
+static inline
+struct v4l2_debugfs_if *v4l2_debugfs_if_alloc(struct dentry *root, u32 if_types,
+					      void *priv,
+					      v4l2_debugfs_if_read_t if_read)
+{
+	return NULL;
+}
+
+static inline void v4l2_debugfs_if_free(struct v4l2_debugfs_if *infoframes)
+{
+}
+#endif
+
 #endif
-- 
2.43.0


