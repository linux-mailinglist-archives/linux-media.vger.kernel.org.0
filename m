Return-Path: <linux-media+bounces-41304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8803B3B5D8
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 10:19:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53C627B7F0A
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 08:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A292BFC8F;
	Fri, 29 Aug 2025 08:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rESrrIDn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517BF2848AF
	for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 08:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756455285; cv=none; b=CPwf99P53mG/eTnjJCt9FZhs/q1Jzhd8CS5zIJBmrX5+WoCbEj27YD3AS3GZbPB7XhZuwA6qZ+pMcOGIlesdoiiCzf5tbdofbMz7y6OhvqPE++N5O93hZGVaEyNso0B9GTzyJt/KAu8EUw4m/nfOWQ9pLS9Q2Jc5stbqO6NKSR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756455285; c=relaxed/simple;
	bh=H0BPsjYnk1RNfGQnzszwlKM6bk/EX0bFen/xFxGoyUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EgNvEw1HTephzMDNXlREVh5IvLnQzzr3ygPII/QugItVCbKcUHtB8fWef44eK2TSdtOqJuEtaTOPSH3vOrb2Ns6YeHRcbiQNWBPeriqI5ON/95uCWECkIOv+H7cunGFiIK3fX5vO8+081g5ZUvzeUgiHG8538lRxE1oB15gZ5l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rESrrIDn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7665FC4CEF4;
	Fri, 29 Aug 2025 08:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756455284;
	bh=H0BPsjYnk1RNfGQnzszwlKM6bk/EX0bFen/xFxGoyUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rESrrIDnOEntjroksHROqna7JbpNVfFyNL2A83zsziy2RXDihEGelvA4dBxfS9Jvl
	 B823331r51WxIJgEdv37jAJ1b4dIvw+JrMQExRYK3NsuB0R6s3mqKA8GnSWYT4tGqc
	 Y14dcBmpv+tzuv8vHhWigDltk1DhHFl6nY0651s0dFUUmjans/ftRvb+89KQMWLTR7
	 1ES9iWPWTz2Vpmf6jTeYpG0YuUWJ3hW8T3bObkP4QNbkt7MgDUk7CUHZ3CVPIWnqbk
	 qFnV8rk1FdImLoUAyh+uV2SxwTOjkYzSrvlLdXPeEdygx+dJ8LhOdz4LFZU3LE1HMZ
	 7jtlUlMI1DDuQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 1/2] media: v4l2-core: v4l2-dv-timings: support DRM IFs
Date: Fri, 29 Aug 2025 10:13:32 +0200
Message-ID: <2a1cd4c7ee1cb6661f1e2365796ee249fd3bf37b.1756455213.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1756455213.git.hverkuil+cisco@kernel.org>
References: <cover.1756455213.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for DRM (Dynamic Range and Mastering) InfoFrames.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/v4l2-core/v4l2-dv-timings.c | 4 ++++
 include/media/v4l2-dv-timings.h           | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dv-timings.c b/drivers/media/v4l2-core/v4l2-dv-timings.c
index 7710cb26bea0..346d1b0e10ce 100644
--- a/drivers/media/v4l2-core/v4l2-dv-timings.c
+++ b/drivers/media/v4l2-core/v4l2-dv-timings.c
@@ -1226,6 +1226,7 @@ DEBUGFS_FOPS(avi, V4L2_DEBUGFS_IF_AVI);
 DEBUGFS_FOPS(audio, V4L2_DEBUGFS_IF_AUDIO);
 DEBUGFS_FOPS(spd, V4L2_DEBUGFS_IF_SPD);
 DEBUGFS_FOPS(hdmi, V4L2_DEBUGFS_IF_HDMI);
+DEBUGFS_FOPS(drm, V4L2_DEBUGFS_IF_DRM);
 
 struct v4l2_debugfs_if *v4l2_debugfs_if_alloc(struct dentry *root, u32 if_types,
 					      void *priv,
@@ -1255,6 +1256,9 @@ struct v4l2_debugfs_if *v4l2_debugfs_if_alloc(struct dentry *root, u32 if_types,
 	if (if_types & V4L2_DEBUGFS_IF_HDMI)
 		debugfs_create_file("hdmi", 0400, infoframes->if_dir,
 				    infoframes, &infoframe_hdmi_fops);
+	if (if_types & V4L2_DEBUGFS_IF_DRM)
+		debugfs_create_file("hdr_drm", 0400, infoframes->if_dir,
+				    infoframes, &infoframe_drm_fops);
 	return infoframes;
 }
 EXPORT_SYMBOL_GPL(v4l2_debugfs_if_alloc);
diff --git a/include/media/v4l2-dv-timings.h b/include/media/v4l2-dv-timings.h
index 714075c72f77..2b42e5d81f9e 100644
--- a/include/media/v4l2-dv-timings.h
+++ b/include/media/v4l2-dv-timings.h
@@ -275,6 +275,7 @@ int v4l2_phys_addr_validate(u16 phys_addr, u16 *parent, u16 *port);
 #define V4L2_DEBUGFS_IF_AUDIO	BIT(1)
 #define V4L2_DEBUGFS_IF_SPD	BIT(2)
 #define V4L2_DEBUGFS_IF_HDMI	BIT(3)
+#define V4L2_DEBUGFS_IF_DRM	BIT(4)
 
 typedef ssize_t (*v4l2_debugfs_if_read_t)(u32 type, void *priv,
 					  struct file *filp, char __user *ubuf,
-- 
2.47.2


