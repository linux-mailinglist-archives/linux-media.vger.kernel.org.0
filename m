Return-Path: <linux-media+bounces-38199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 691E9B0D3E0
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 09:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C019175EF1
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 07:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E922DEA65;
	Tue, 22 Jul 2025 07:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YNXiMSix"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB0C2DE703
	for <linux-media@vger.kernel.org>; Tue, 22 Jul 2025 07:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753170022; cv=none; b=ZlRGNTRegOBnInZP/nozZKpeaWCjNXw776ZYlwWlW2xAF0Ammw/kr2aBvFFJv6Kjb4bUzhf9325MiiWc0scnL7nVl3mGJU7T9LaIJS58AG+BmcJrJ+FfNofg+StfzAAxHXihQvr+ezv4ezMosWM4hFy3SHYwTwccmwxnb4G01+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753170022; c=relaxed/simple;
	bh=H0BPsjYnk1RNfGQnzszwlKM6bk/EX0bFen/xFxGoyUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XpoXHJCv59mWcQA0iwf3GjVrAIquAoZ5kw0FqPMVVAEALAw/3M8Z+JNnzL4M0jac/SJ3PkQArQIwNAHRCVbwqEqf3bmMMjCBhDSJ5vyVDb2cZ4gfdPSzLd+ht33iFHVaPk4KOLZ8axyN+IkQ8zT+LIV4+Nkomw8xbynFcAT7CpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YNXiMSix; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA9CFC4CEF4;
	Tue, 22 Jul 2025 07:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753170021;
	bh=H0BPsjYnk1RNfGQnzszwlKM6bk/EX0bFen/xFxGoyUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YNXiMSixMOa6sNsd8z6Ge5IKHDy2Wp2PzK5i3ANzp3NX1/MpKwSRFxW7A4dnfs+hG
	 CzC73qwAhvqSBESJsXx6/e5W8kbZKB25rzCDrpr2YLK5unxwPecYDnlrTCiba1bPTt
	 vM+u+6ytfBFhtAeC6sEyqKhWBmUF8VE9IF8qx1c+BH/lWxAOOcXbuPH1vfww1Z/eqb
	 foF+/aPq2t8sFOODZP8KTTpQZLcShO9yhydEmicO6IGPhJf7YsmnVKjWKw5rqxZ+xk
	 jaCjL0Tz6kadgWPxx5U3ZJbhC3YiqhnsYh76ykFTOy1BasvrjFneI7yAhPq87CzfiM
	 kqoZXl32FYuCg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 1/2] media: v4l2-core: v4l2-dv-timings: support DRM IFs
Date: Tue, 22 Jul 2025 09:34:35 +0200
Message-ID: <79873bc6ba654bfd6901d615e223b10f367e0401.1753169676.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1753169676.git.hverkuil+cisco@kernel.org>
References: <cover.1753169676.git.hverkuil+cisco@kernel.org>
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


