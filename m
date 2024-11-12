Return-Path: <linux-media+bounces-21292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4709C521C
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 10:33:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F3081F21E19
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 09:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6055520E03D;
	Tue, 12 Nov 2024 09:33:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F7D1ABEC2
	for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 09:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731404008; cv=none; b=UTDYOltmGFokLqpSyTMeSqDISIgbCOLAoiYGYB9ryKxiEdfOvKlLPxxH8qr5X8vE/Lk6bM9FsNlUHbpCklUvjqrp/7zAvznBvF9Rq0wv5v6w+/1ZCsgtw41t/MrU9rbbuRa4ULWVHB/ZDqz52nWLGtgIXf1hfuAW08DzvpyBoz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731404008; c=relaxed/simple;
	bh=bu3D/oQ1wnWfvuqBcAQoBX0km+bNjnKlHL0MK9ZD6Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OAOm34DNksbSOvb2BSMBYcNwZn7doaN2pbWM5hPCN9vZTW2vMs8DARhtBiFtW5XCaRadIefkKTcXBqXmr/nY8qLcmIbcmaIQc4KQE5xeo9CaireXSuNOQkJwxUfsGgzRNlQRyFdA0wxjsnCv9MUuTjap6p/VdcttsanWqvlMtDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA488C4CED4;
	Tue, 12 Nov 2024 09:33:26 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [RFC PATCHv2 4/5] media: vb2: introduce queue_info to replace queue_setup
Date: Tue, 12 Nov 2024 10:22:15 +0100
Message-ID: <541c146568fa67a7acc3aca87001f056751c638c.1731403336.git.hverkuil@xs4all.nl>
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

The new queue_info op just returns the number of planes and
plane sizes for the currently configured format.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 .../media/common/videobuf2/videobuf2-core.c   | 82 ++++++++++++++-----
 include/media/videobuf2-core.h                | 10 +++
 2 files changed, 70 insertions(+), 22 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 4b55280dc8b8..bd241fe9474b 100644
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
@@ -2619,10 +2654,13 @@ int vb2_core_queue_init(struct vb2_queue *q)
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
index 3282b55179a5..89b7600e4cf6 100644
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
@@ -682,6 +691,7 @@ struct vb2_queue {
 	 * called. Used to check for unbalanced ops.
 	 */
 	u32				cnt_queue_setup;
+	u32				cnt_queue_info;
 	u32				cnt_wait_prepare;
 	u32				cnt_wait_finish;
 	u32				cnt_prepare_streaming;
-- 
2.45.2


