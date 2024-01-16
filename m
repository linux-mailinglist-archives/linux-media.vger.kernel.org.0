Return-Path: <linux-media+bounces-3753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9591B82F03B
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 15:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36756B2321A
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 14:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2F41BDE4;
	Tue, 16 Jan 2024 14:05:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550751BDDC
	for <linux-media@vger.kernel.org>; Tue, 16 Jan 2024 14:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B15C433F1;
	Tue, 16 Jan 2024 14:05:24 +0000 (UTC)
Message-ID: <5df8141c-c0eb-4f55-b380-94cda08bd5ad@xs4all.nl>
Date: Tue, 16 Jan 2024 15:05:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: vb2: refactor setting flags and caps, fix missing cap
To: tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: linux-media@vger.kernel.org, kernel@collabora.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Several functions implementing VIDIOC_REQBUFS and _CREATE_BUFS all use almost
the same code to fill in the flags and capability fields. Refactor this into a
new vb2_set_flags_and_caps() function that replaces the old fill_buf_caps()
and validate_memory_flags() functions.

This also fixes a bug where vb2_ioctl_create_bufs() would not set the
V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS cap and also not fill in the
max_num_buffers field.

Fixes: d055a76c0065 ("media: core: Report the maximum possible number of buffers for the queue")
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/common/videobuf2/videobuf2-v4l2.c   | 55 +++++++++----------
 1 file changed, 26 insertions(+), 29 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 54d572c3b515..c575198e8354 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -671,8 +671,20 @@ int vb2_querybuf(struct vb2_queue *q, struct v4l2_buffer *b)
 }
 EXPORT_SYMBOL(vb2_querybuf);

-static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
+static void vb2_set_flags_and_caps(struct vb2_queue *q, u32 memory,
+				   u32 *flags, u32 *caps, u32 *max_num_bufs)
 {
+	if (!q->allow_cache_hints || memory != V4L2_MEMORY_MMAP) {
+		/*
+		 * This needs to clear V4L2_MEMORY_FLAG_NON_COHERENT only,
+		 * but in order to avoid bugs we zero out all bits.
+		 */
+		*flags = 0;
+	} else {
+		/* Clear all unknown flags. */
+		*flags &= V4L2_MEMORY_FLAG_NON_COHERENT;
+	}
+
 	*caps = V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS;
 	if (q->io_modes & VB2_MMAP)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_MMAP;
@@ -686,21 +698,9 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
 	if (q->supports_requests)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
-}
-
-static void validate_memory_flags(struct vb2_queue *q,
-				  int memory,
-				  u32 *flags)
-{
-	if (!q->allow_cache_hints || memory != V4L2_MEMORY_MMAP) {
-		/*
-		 * This needs to clear V4L2_MEMORY_FLAG_NON_COHERENT only,
-		 * but in order to avoid bugs we zero out all bits.
-		 */
-		*flags = 0;
-	} else {
-		/* Clear all unknown flags. */
-		*flags &= V4L2_MEMORY_FLAG_NON_COHERENT;
+	if (max_num_bufs) {
+		*max_num_bufs = q->max_num_buffers;
+		*caps |= V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS;
 	}
 }

@@ -709,8 +709,8 @@ int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
 	int ret = vb2_verify_memory_type(q, req->memory, req->type);
 	u32 flags = req->flags;

-	fill_buf_caps(q, &req->capabilities);
-	validate_memory_flags(q, req->memory, &flags);
+	vb2_set_flags_and_caps(q, req->memory, &flags,
+			       &req->capabilities, NULL);
 	req->flags = flags;
 	return ret ? ret : vb2_core_reqbufs(q, req->memory,
 					    req->flags, &req->count);
@@ -751,11 +751,9 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 	int ret = vb2_verify_memory_type(q, create->memory, f->type);
 	unsigned i;

-	fill_buf_caps(q, &create->capabilities);
-	validate_memory_flags(q, create->memory, &create->flags);
 	create->index = vb2_get_num_buffers(q);
-	create->max_num_buffers = q->max_num_buffers;
-	create->capabilities |= V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS;
+	vb2_set_flags_and_caps(q, create->memory, &create->flags,
+			       &create->capabilities, &create->max_num_buffers);
 	if (create->count == 0)
 		return ret != -EBUSY ? ret : 0;

@@ -1006,8 +1004,8 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
 	int res = vb2_verify_memory_type(vdev->queue, p->memory, p->type);
 	u32 flags = p->flags;

-	fill_buf_caps(vdev->queue, &p->capabilities);
-	validate_memory_flags(vdev->queue, p->memory, &flags);
+	vb2_set_flags_and_caps(vdev->queue, p->memory, &flags,
+			       &p->capabilities, NULL);
 	p->flags = flags;
 	if (res)
 		return res;
@@ -1026,12 +1024,11 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
 			  struct v4l2_create_buffers *p)
 {
 	struct video_device *vdev = video_devdata(file);
-	int res = vb2_verify_memory_type(vdev->queue, p->memory,
-			p->format.type);
+	int res = vb2_verify_memory_type(vdev->queue, p->memory, p->format.type);

-	p->index = vdev->queue->num_buffers;
-	fill_buf_caps(vdev->queue, &p->capabilities);
-	validate_memory_flags(vdev->queue, p->memory, &p->flags);
+	p->index = vb2_get_num_buffers(vdev->queue);
+	vb2_set_flags_and_caps(vdev->queue, p->memory, &p->flags,
+			       &p->capabilities, &p->max_num_buffers);
 	/*
 	 * If count == 0, then just check if memory and type are valid.
 	 * Any -EBUSY result from vb2_verify_memory_type can be mapped to 0.
-- 
2.42.0



