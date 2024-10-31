Return-Path: <linux-media+bounces-20624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF829B760C
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 09:08:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0E21B20ED1
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 08:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3FD2153565;
	Thu, 31 Oct 2024 08:08:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9921F14F102
	for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 08:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730362121; cv=none; b=DPEP5zysBG4CUE0Bbur7rHLFOa0XEED2e67QphT982DkruDrFDxqJD4PML5BWONKiQDosqOCrIJnXbFwOLx6LMRnrHNqyZBBon5orZSLtHPMIAAaSMTHocNv/I90DmqNj/pOvv81AGOyfo5VQ6CNW4zprMR0qYZ4v7hoIvff85M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730362121; c=relaxed/simple;
	bh=SaX/76lfcm0gL/4NsW4NOMhKVKnD0W6WwyJtMD5M/Ag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pz/g+XuxnHbQhndCc7hHoBZBDiK9+MnZ1+4v8bMaLgSkeM2odAqw+6YzvAbUpqtrBjfXsie+zt6B4SeiayAFuf2CBwupvQL4PCaav1oO51JoRBGX3DNCdG2KEC3YZ17u9Jjp6Jldt8F1YdFWQOgYrXpzeTELQK1RijsD5VW18OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFAF8C4CED0;
	Thu, 31 Oct 2024 08:08:39 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: nicolas@ndufresne.ca,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [RFC PATCH 1/2] media: vb2: introduce queue_info to replace queue_setup
Date: Thu, 31 Oct 2024 08:59:26 +0100
Message-ID: <dd5ab393232e42c3618055d0d30ada03065bb46d.1730361567.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1730361567.git.hverkuil@xs4all.nl>
References: <cover.1730361567.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new queue_info just returns the number of planes and
plane sizes for the currently configured format.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 .../media/common/videobuf2/videobuf2-core.c   | 82 ++++++++++++++-----
 include/media/videobuf2-core.h                | 10 +++
 2 files changed, 70 insertions(+), 22 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index f07dc53a9d06..3a7303a72202 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -611,9 +611,9 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int start, unsigned i
 		if (unbalanced) {
 			pr_info("unbalanced counters for queue %p:\n", q);
 			if (q->cnt_start_streaming != q->cnt_stop_streaming)
-				pr_info("     setup: %u start_streaming: %u stop_streaming: %u\n",
-					q->cnt_queue_setup, q->cnt_start_streaming,
-					q->cnt_stop_streaming);
+				pr_info("     setup: %u info: %u start_streaming: %u stop_streaming: %u\n",
+					q->cnt_queue_setup, q->cnt_queue_info,
+					q->cnt_start_streaming, q->cnt_stop_streaming);
 			if (q->cnt_prepare_streaming != q->cnt_unprepare_streaming)
 				pr_info("     prepare_streaming: %u unprepare_streaming: %u\n",
 					q->cnt_prepare_streaming, q->cnt_unprepare_streaming);
@@ -622,6 +622,7 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int start, unsigned i
 					q->cnt_wait_prepare, q->cnt_wait_finish);
 		}
 		q->cnt_queue_setup = 0;
+		q->cnt_queue_info = 0;
 		q->cnt_wait_prepare = 0;
 		q->cnt_wait_finish = 0;
 		q->cnt_prepare_streaming = 0;
@@ -914,7 +915,8 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 		q->is_busy = 0;
 		/*
 		 * In case of REQBUFS(0) return immediately without calling
-		 * driver's queue_setup() callback and allocating resources.
+		 * driver's queue_setup() or queue_info() callback and
+		 * allocating resources.
 		 */
 		if (*count == 0)
 			return 0;
@@ -928,7 +930,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
 	/*
 	 * Set this now to ensure that drivers see the correct q->memory value
-	 * in the queue_setup op.
+	 * in the queue_setup/info op.
 	 */
 	mutex_lock(&q->mmap_lock);
 	ret = vb2_core_allocated_buffers_storage(q);
@@ -938,12 +940,18 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 		return ret;
 	set_queue_coherency(q, non_coherent_mem);
 
-	/*
-	 * Ask the driver how many buffers and planes per buffer it requires.
-	 * Driver also sets the size and allocator context for each plane.
-	 */
-	ret = call_qop(q, queue_setup, q, &num_buffers, &num_planes,
-		       plane_sizes, q->alloc_devs);
+	if (q->ops->queue_info) {
+		ret = call_qop(q, queue_info, q, &num_planes,
+			       plane_sizes, q->alloc_devs);
+	} else {
+		/*
+		 * Ask the driver how many buffers and planes per buffer it
+		 * requires. The driver also sets the size and (optionally)
+		 * the allocator context for each plane.
+		 */
+		ret = call_qop(q, queue_setup, q, &num_buffers, &num_planes,
+			       plane_sizes, q->alloc_devs);
+	}
 	if (ret)
 		goto error;
 
@@ -980,7 +988,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	/*
 	 * Check if driver can handle the allocated number of buffers.
 	 */
-	if (!ret && allocated_buffers < num_buffers) {
+	if (!ret && allocated_buffers < num_buffers && q->ops->queue_setup) {
 		num_buffers = allocated_buffers;
 		/*
 		 * num_planes is set by the previous queue_setup(), but since it
@@ -1082,17 +1090,44 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 
 	num_buffers = min(*count, q->max_num_buffers - q_num_bufs);
 
-	if (requested_planes && requested_sizes) {
+	if (q->ops->queue_info) {
+		ret = call_qop(q, queue_info, q, &num_planes,
+			       plane_sizes, q->alloc_devs);
+
+		if (ret)
+			goto error;
+
+		/* Check that driver has set sane values */
+		if (WARN_ON(!num_planes)) {
+			ret = -EINVAL;
+			goto error;
+		}
+		if (num_planes != requested_planes) {
+			ret = -EINVAL;
+			goto error;
+		}
+
+		for (unsigned int i = 0; i < num_planes; i++) {
+			if (WARN_ON(!plane_sizes[i])) {
+				ret = -EINVAL;
+				goto error;
+			}
+			if (plane_sizes[i] > requested_sizes[i]) {
+				ret = -EINVAL;
+				goto error;
+			}
+			plane_sizes[i] = requested_sizes[i];
+		}
+	} else {
 		num_planes = requested_planes;
 		memcpy(plane_sizes, requested_sizes, sizeof(plane_sizes));
+		/*
+		 * Ask the driver, whether the requested number of buffers, planes per
+		 * buffer and their sizes are acceptable
+		 */
+		ret = call_qop(q, queue_setup, q, &num_buffers,
+			       &num_planes, plane_sizes, q->alloc_devs);
 	}
-
-	/*
-	 * Ask the driver, whether the requested number of buffers, planes per
-	 * buffer and their sizes are acceptable
-	 */
-	ret = call_qop(q, queue_setup, q, &num_buffers,
-		       &num_planes, plane_sizes, q->alloc_devs);
 	if (ret)
 		goto error;
 
@@ -1108,7 +1143,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 	/*
 	 * Check if driver can handle the so far allocated number of buffers.
 	 */
-	if (allocated_buffers < num_buffers) {
+	if (allocated_buffers < num_buffers && q->ops->queue_setup) {
 		num_buffers = allocated_buffers;
 
 		/*
@@ -2617,10 +2652,13 @@ int vb2_core_queue_init(struct vb2_queue *q)
 	    WARN_ON(!q->mem_ops)	  ||
 	    WARN_ON(!q->type)		  ||
 	    WARN_ON(!q->io_modes)	  ||
-	    WARN_ON(!q->ops->queue_setup) ||
 	    WARN_ON(!q->ops->buf_queue))
 		return -EINVAL;
 
+	if (WARN_ON(!q->ops->queue_setup && !q->ops->queue_info) ||
+	    WARN_ON(q->ops->queue_setup && q->ops->queue_info))
+		return -EINVAL;
+
 	if (WARN_ON(q->max_num_buffers < VB2_MAX_FRAME) ||
 	    WARN_ON(q->min_queued_buffers > q->max_num_buffers))
 		return -EINVAL;
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 9b02aeba4108..34b6fd6585b9 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -351,6 +351,13 @@ struct vb2_buffer {
  *			\*num_buffers are being allocated additionally to
  *			the buffers already allocated. If either \*num_planes
  *			or the requested sizes are invalid callback must return %-EINVAL.
+ * @queue_info:		called from VIDIOC_REQBUFS() and VIDIOC_CREATE_BUFS()
+ *			handlers before memory allocation.
+ *			The driver must return the required number of planes
+ *			per buffer in \*num_planes, and the size of each plane
+ *			must be set in the sizes\[\] array. Optionally set the
+ *			per-plane allocator specific device in the
+ *			alloc_devs\[\] array.
  * @wait_prepare:	release any locks taken while calling vb2 functions;
  *			it is called before an ioctl needs to wait for a new
  *			buffer to arrive; required to avoid a deadlock in
@@ -435,6 +442,8 @@ struct vb2_ops {
 	int (*queue_setup)(struct vb2_queue *q,
 			   unsigned int *num_buffers, unsigned int *num_planes,
 			   unsigned int sizes[], struct device *alloc_devs[]);
+	int (*queue_info)(struct vb2_queue *q, unsigned int *num_planes,
+			  unsigned int sizes[], struct device *alloc_devs[]);
 
 	void (*wait_prepare)(struct vb2_queue *q);
 	void (*wait_finish)(struct vb2_queue *q);
@@ -680,6 +689,7 @@ struct vb2_queue {
 	 * called. Used to check for unbalanced ops.
 	 */
 	u32				cnt_queue_setup;
+	u32				cnt_queue_info;
 	u32				cnt_wait_prepare;
 	u32				cnt_wait_finish;
 	u32				cnt_prepare_streaming;
-- 
2.45.2


