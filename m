Return-Path: <linux-media+bounces-20622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0078F9B75F3
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 08:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 240471C20B4E
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 07:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BC414F9F8;
	Thu, 31 Oct 2024 07:59:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6919514EC60
	for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 07:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730361553; cv=none; b=ccq1CoYNTvD7ahAfhgB2soj171PQ/j2EwYXIoeyWeQvV91VlUGkgNU5eaieEN9AfYFkyHxXPZv2lejSNsY5tDSVQ+yHyHC463Q4qWQ3wu1mjR+//o0KXfWbB6dat4LTxUY0VcLAW0pt/84OBKhiro96P8H5ZKoau7Nk3OoVAF4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730361553; c=relaxed/simple;
	bh=3zasLE0ZeNgK32//nCLzKCv++Ca4TGQXhBbqvFgmE4o=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=WFMC0MBNSvU67lXifH+vyZnQmhD80m8acaLbDCDV6fwfADxHCXEL+1vgovu4gX339Ud8qFKBaQsLICZreNuQXiyCxlXVGffRrhN/Pm5clKsKEDqTxemWSFR+js3Ss7Q0Pm8LpK8K6pMORYkgya+EMlIMiJAS3BtWAsn9pWO0gFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D41C4CEC3;
	Thu, 31 Oct 2024 07:59:11 +0000 (UTC)
Message-ID: <6b303108-6ab6-43c9-9c7b-7776ef64fb06@xs4all.nl>
Date: Thu, 31 Oct 2024 08:59:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Tomasz Figa <tfiga@chromium.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [RFC PATCH] media: vb2: add support for min/rec_num_buffers
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Report the minimum and recommended number of buffers in
struct v4l2_create_buffers. This is useful for those applications
that want to have more precise control over how many buffers they
want to allocate.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
This is a follow up to my RFC here:

https://lore.kernel.org/linux-media/126cd76a-6224-483b-a18d-a3cc89e5ff2d@xs4all.nl/T/#u

This patch adds a new buffer capability and new fields for struct
v4l2_create_buffers to report the absolute minimum number of buffers
that you have to allocate to stream, and the recommended number of
buffers.

min_num_buffers equals q->min_queued_buffers + 1 and rec_num_buffers
equals q->min_reqbufs_allocation.

I have one question how this relates to V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OUTPUT
as used by codecs: I think drivers that set those controls should also update
q->min_reqbufs_allocation to the same value. I think that would make sense.

This is an RFC, once we are in agreement on this I will make a proper patch
which also includes updating the documentation.

Regards,

	Hans
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
index e7c4dce39007..e738b7956e58 100644
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
+ *		flag is set, then this field indicate the maximum possible
+ *		number of buffers for this queue.
+ * @min_num_buffers: if the V4L2_BUF_CAP_SUPPORTS_MIN_REC_NUM_BUFFERS capability
+ *		flag is set, then this field indicate the minimum possible
+ *		number of buffers for this queue. Using this value might cause
+ *		dropped frames, but it will be able to stream video. Useful for
+ *		capturing only a single frame.
+ * @rec_num_buffers: if the V4L2_BUF_CAP_SUPPORTS_MIN_REC_NUM_BUFFERS capability
+ *		flag is set, then this field indicates the recommended number
+ *		of buffers for this queue. This is also used when calling
+ *		VIDIOC_REQBUFS with count = 1.
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


