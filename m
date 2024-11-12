Return-Path: <linux-media+bounces-21289-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E74739C5218
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 10:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A97252876EC
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 09:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFB220E014;
	Tue, 12 Nov 2024 09:33:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC0220DD7B
	for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 09:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731404004; cv=none; b=k2LRNrruT0BXtAhyoD+DwhuWpcwKtdUyAWI6H6VEw5Er1CVTeLRdocO+vqCn06Hvr0kgN8Nc+vdhfxDRawzpozA/dsHpFmjSEOZYQf578af7Gon6n7J2VY6hzsIczlv4uToK0Umnd/KH5tPvuMZkCsuX+iYY8cTD4uiqB14t2us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731404004; c=relaxed/simple;
	bh=abkNxhvu756EKEqyTAlUBqJDF/3LC8px4lHy1udhM1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BZYVFLEW7eeBwdHHdXgEcE5hDT9cQeEcpl/iTnQk0GvD6CJyRtfQYajZtePxKI712NPtEo2uXENQte7KeYWlaJdS62NnJs0HNJRE+6PhUequSDnuat8q024FCdjI2VUlazfrG+BsnhGXdFoJFa5h6qdnPLYRo9rmAhv9emiy0RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE36AC4CED6;
	Tue, 12 Nov 2024 09:33:22 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [RFC PATCHv2 1/5] media: vb2: add support for min/rec_num_buffers
Date: Tue, 12 Nov 2024 10:22:12 +0100
Message-ID: <f7386ba0708baf64112efe60f25a255851bab6e4.1731403336.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1731403336.git.hverkuil@xs4all.nl>
References: <cover.1731403336.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Report the minimum and recommended number of buffers in
struct v4l2_create_buffers. This is useful for those applications
that want to have more precise control over how many buffers they
want to allocate.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 .../media/common/videobuf2/videobuf2-v4l2.c   | 19 +++++++++++++-----
 include/uapi/linux/videodev2.h                | 20 +++++++++++++++----
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 9201d854dbcc..15394bb4168c 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -672,7 +672,8 @@ int vb2_querybuf(struct vb2_queue *q, struct v4l2_buffer *b)
 EXPORT_SYMBOL(vb2_querybuf);
 
 static void vb2_set_flags_and_caps(struct vb2_queue *q, u32 memory,
-				   u32 *flags, u32 *caps, u32 *max_num_bufs)
+				   u32 *flags, u32 *caps, u32 *max_num_bufs,
+				   u16 *min_num_bufs, u16 *rec_num_bufs)
 {
 	if (!q->allow_cache_hints || memory != V4L2_MEMORY_MMAP) {
 		/*
@@ -702,6 +703,11 @@ static void vb2_set_flags_and_caps(struct vb2_queue *q, u32 memory,
 		*max_num_bufs = q->max_num_buffers;
 		*caps |= V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS;
 	}
+	if (min_num_bufs && rec_num_bufs) {
+		*min_num_bufs = q->min_queued_buffers + 1;
+		*rec_num_bufs = q->min_reqbufs_allocation;
+		*caps |= V4L2_BUF_CAP_SUPPORTS_MIN_REC_NUM_BUFFERS;
+	}
 }
 
 int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
@@ -710,7 +716,7 @@ int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
 	u32 flags = req->flags;
 
 	vb2_set_flags_and_caps(q, req->memory, &flags,
-			       &req->capabilities, NULL);
+			       &req->capabilities, NULL, NULL, NULL);
 	req->flags = flags;
 	return ret ? ret : vb2_core_reqbufs(q, req->memory,
 					    req->flags, &req->count);
@@ -753,7 +759,9 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 
 	create->index = vb2_get_num_buffers(q);
 	vb2_set_flags_and_caps(q, create->memory, &create->flags,
-			       &create->capabilities, &create->max_num_buffers);
+			       &create->capabilities, &create->max_num_buffers,
+			       &create->min_num_buffers,
+			       &create->rec_num_buffers);
 	if (create->count == 0)
 		return ret != -EBUSY ? ret : 0;
 
@@ -1027,7 +1035,7 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
 	u32 flags = p->flags;
 
 	vb2_set_flags_and_caps(vdev->queue, p->memory, &flags,
-			       &p->capabilities, NULL);
+			       &p->capabilities, NULL, NULL, NULL);
 	p->flags = flags;
 	if (res)
 		return res;
@@ -1050,7 +1058,8 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
 
 	p->index = vb2_get_num_buffers(vdev->queue);
 	vb2_set_flags_and_caps(vdev->queue, p->memory, &p->flags,
-			       &p->capabilities, &p->max_num_buffers);
+			       &p->capabilities, &p->max_num_buffers,
+			       &p->min_num_buffers, &p->rec_num_buffers);
 	/*
 	 * If count == 0, then just check if memory and type are valid.
 	 * Any -EBUSY result from vb2_verify_memory_type can be mapped to 0.
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index e7c4dce39007..68cca8dda937 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1079,6 +1079,7 @@ struct v4l2_requestbuffers {
 #define V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS		(1 << 6)
 #define V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS		(1 << 7)
 #define V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS		(1 << 8)
+#define V4L2_BUF_CAP_SUPPORTS_MIN_REC_NUM_BUFFERS	(1 << 9)
 
 /**
  * struct v4l2_plane - plane info for multi-planar buffers
@@ -2660,9 +2661,18 @@ struct v4l2_dbg_chip_info {
  * @flags:	additional buffer management attributes (ignored unless the
  *		queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability
  *		and configured for MMAP streaming I/O).
- * @max_num_buffers: if V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS capability flag is set
- *		this field indicate the maximum possible number of buffers
- *		for this queue.
+ * @max_num_buffers: if the V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS capability
+ *		flag is set, then this field indicates the maximum possible
+ *		number of buffers for this queue.
+ * @min_num_buffers: if the V4L2_BUF_CAP_SUPPORTS_MIN_REC_NUM_BUFFERS capability
+ *		flag is set, then this field indicates the minimum possible
+ *		number of buffers for this queue. Using this value might cause
+ *		dropped frames, but it will be able to stream video. Useful for
+ *		capturing only a single frame.
+ * @rec_num_buffers: if the V4L2_BUF_CAP_SUPPORTS_MIN_REC_NUM_BUFFERS capability
+ *		flag is set, then this field indicates the recommended number
+ *		of buffers for this queue. This is also used when calling
+ *		VIDIOC_REQBUFS to ensure count is at least this value.
  * @reserved:	future extensions
  */
 struct v4l2_create_buffers {
@@ -2673,7 +2683,9 @@ struct v4l2_create_buffers {
 	__u32			capabilities;
 	__u32			flags;
 	__u32			max_num_buffers;
-	__u32			reserved[5];
+	__u16			min_num_buffers;
+	__u16			rec_num_buffers;
+	__u32			reserved[4];
 };
 
 /**
-- 
2.45.2


