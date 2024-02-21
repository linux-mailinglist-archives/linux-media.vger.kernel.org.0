Return-Path: <linux-media+bounces-5583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B2785E232
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 16:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8B7D1F256F2
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 15:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7F481726;
	Wed, 21 Feb 2024 15:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="rurRLuez"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D8C8062F
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 15:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708530956; cv=none; b=UlIlWVUcqTy3mND8WbYg4YzMlDous4KvH1OefOfFGVf4VcS/FPuF5AyAB3IpdS27ENLj//TpprQzy+/3fP7L0dQcd0WcC5uIx413w3BC6eeXBnhcDncxG115zAz00qzN80QFVoQHnVqBbMmnYMumDaGpSePfgCuGyHGSvZSx4Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708530956; c=relaxed/simple;
	bh=pcOQjZ4LVdwdiO+qHgH6rVC6Hhvx9OK5Hn/Y4aD6RcY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cosrQ2js7T/2B3xRNpo/KTQ4D2O7HULcWFmXJJEu5E4AOya3DOtThdxtkOsH/OYn+QHtIQos0rZGxdhQz4yXSdTJ1hZgq+ObQIUDtgBubvotofFaIGjiVUXvZ/hLrAO0uU3rXsIhdQjrRfg8iJ5JE8Nd5Y+vTksHd849Sb94XxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=rurRLuez; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708530953;
	bh=pcOQjZ4LVdwdiO+qHgH6rVC6Hhvx9OK5Hn/Y4aD6RcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rurRLuezEUYEhC/UMCsAFtE6II4GwbAF43Zf6idar8r7hf9ZxbwSdrqf+kV8AZTG8
	 6oZBSlXOt0ME4qoE9MnVjnjtclKq9vBVgFke5OzxKfB2m6ciCmTogiJcKN3d3VkYKc
	 iTXVGL/eysQv5jXOqyFO9lhzU4goOKdCz5PVxkH+ig96bJzbvOMdqXD1njeNqUFUVc
	 4nmTkEHKL2+HH+w1GaLPlPjfupc4qbAZ1yKgkyf781GGGp5izc6NbuEmkpqKezCtc8
	 0bZcStGyj38Y2EUdF9OeRJXH4jgK+IktVCqOwsZPc6KMTSxdh/lnpoBq89zyzA9WbR
	 A6MG7L1/MGiVg==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 756D23780C13;
	Wed, 21 Feb 2024 15:55:53 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v8 1/2] v4l2-utils: Add VIDIOC_REMOVE_BUFS ioctl
Date: Wed, 21 Feb 2024 16:55:50 +0100
Message-Id: <20240221155551.100156-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240221155551.100156-1-benjamin.gaignard@collabora.com>
References: <20240221155551.100156-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add VIDIOC_REMOVE_BUFS ioctl and it associated structure.
Define V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS to signal that queue support
feature.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 include/linux/videodev2.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index 397a99e3..a4eb1afd 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -992,6 +992,7 @@ struct v4l2_requestbuffers {
 #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
 #define V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS		(1 << 6)
 #define V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS		(1 << 7)
+#define V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS		(1 << 8)
 
 /**
  * struct v4l2_plane - plane info for multi-planar buffers
@@ -2564,6 +2565,20 @@ struct v4l2_create_buffers {
 	__u32			reserved[5];
 };
 
+/**
+ * struct v4l2_remove_buffers - VIDIOC_REMOVE_BUFS argument
+ * @index:	the first buffer to be removed
+ * @count:	number of buffers to removed
+ * @type:	enum v4l2_buf_type
+ * @reserved:	future extensions
+ */
+struct v4l2_remove_buffers {
+	__u32			index;
+	__u32			count;
+	__u32			type;
+	__u32			reserved[13];
+};
+
 /*
  *	I O C T L   C O D E S   F O R   V I D E O   D E V I C E S
  *
@@ -2663,6 +2678,7 @@ struct v4l2_create_buffers {
 #define VIDIOC_DBG_G_CHIP_INFO  _IOWR('V', 102, struct v4l2_dbg_chip_info)
 
 #define VIDIOC_QUERY_EXT_CTRL	_IOWR('V', 103, struct v4l2_query_ext_ctrl)
+#define VIDIOC_REMOVE_BUFS	_IOWR('V', 104, struct v4l2_remove_buffers)
 
 /* Reminder: when adding new ioctls please add support for them to
    drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
-- 
2.40.1


