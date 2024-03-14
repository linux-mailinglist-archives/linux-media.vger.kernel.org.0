Return-Path: <linux-media+bounces-7091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BFA87C066
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 16:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81D2A1C20BBF
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 15:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5459B74403;
	Thu, 14 Mar 2024 15:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="W40uvEkS"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FE971B3B
	for <linux-media@vger.kernel.org>; Thu, 14 Mar 2024 15:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710430461; cv=none; b=iOV5IdCUWdedYrXGt1j7uFQzoKOy20DzlPhomeC+/XKoW+NQqQvmAwYDozTVLB75QrECL2xEjk6Ba2A6MKNE/0IWs72BJMvbEWwx1YIOrogryQR6W6lf+yKmB7NIXinjH7BTZarQUjaWiOgEShoKnZMFfQG7SYgub5WNx/5RY+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710430461; c=relaxed/simple;
	bh=pcOQjZ4LVdwdiO+qHgH6rVC6Hhvx9OK5Hn/Y4aD6RcY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z5tVUcVfBzTErOpzyrPnxRySzwrIyIUh9mqzKIbORDsLJgTMDyKbIhlB4v6zYmkLFguioVyA6NTIb655vFoluKlnYR0ZXogYRc8MnbA4CPj/IDTw6/zp+Ng7eylBMeJ7Kq68uBGJCZ6zUnfcybwb0/nkv99pm9vM5ikwfMHLKto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=W40uvEkS; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710430458;
	bh=pcOQjZ4LVdwdiO+qHgH6rVC6Hhvx9OK5Hn/Y4aD6RcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W40uvEkS5OlzfR/SG8s+2f3WQ0ksRV8+HW9V0gNl6BzShSIfyOB9ZvEdNedxgyydw
	 UJLOgSmHyarFrDtPMKD/f9kQgHRG7rkjtA73c2RDAcLeRxnmtwCmhgcZktZRUOFfFP
	 2ycP71tCnm/ezFv5rzDeXzuYafSBvNJYw+Pr5tEVZiW9qFT6ceb/p7CU/0dSduUr9e
	 fXRSk2vtYTH0NgZms7nwHHLNEf0iiV+3ihdm7c/G8HVc3q5QzNfnuHiOIcFSe5DIwu
	 9svHKEb4u0N6yfV+e8+wsD5/iJbdGnPPr98EG+jqs6rVHmoqQjwrKD+sTvAAA3v7s+
	 XfJfKkHwYMQSg==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7EB0D37820F5;
	Thu, 14 Mar 2024 15:34:18 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v9 1/2] v4l2-utils: Add VIDIOC_REMOVE_BUFS ioctl
Date: Thu, 14 Mar 2024 16:34:14 +0100
Message-Id: <20240314153415.197534-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240314153415.197534-1-benjamin.gaignard@collabora.com>
References: <20240314153415.197534-1-benjamin.gaignard@collabora.com>
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


