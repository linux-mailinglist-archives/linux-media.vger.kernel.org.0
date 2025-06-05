Return-Path: <linux-media+bounces-34091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E25ACEAA2
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 09:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1E237A6FC0
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 07:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8701D5AC6;
	Thu,  5 Jun 2025 07:05:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1F32C3242
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 07:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107150; cv=none; b=WXg1ODVCpTttd9ChhMfWpGFVMecGXGMvAy1YQvcGqioAm69KmU8Ceoq2iv/3FeculzhNktjHly0fa+Hf9nCNfOklbfDjps1u5gekdjUEd5ozYShflyMkk4/jJK0MpBDOAiCQNGT0DcNX+bvUJ893DaCvqf/KG/ZhkazBjbArpTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107150; c=relaxed/simple;
	bh=UvBmj6h6qHki60fxhANspIZswZ2ngC3lnT6fBXuypEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N/sSvMQZ1sq4RS8THkDck3dzvkSbdkyKtUVWgO6YkXLUD5f6cAr2rWfud1v5yJrQMx2WqDgfahvYOPLqNmGjnXCtvxZMZnER9CG2wLsfB9W0Jf9vXEN+F2m9/Ny12fpV0HERA2ebJwbAXLQPM+kcg1ewGFrC6/UFAZ7QC05nXZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B22C4CEEB;
	Thu,  5 Jun 2025 07:05:49 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 5/5] media: vb2: drop wait_prepare/finish callbacks
Date: Thu,  5 Jun 2025 08:57:39 +0200
Message-ID: <d2c5e21692652db13d55b3a8ec5c8bd04b308c3c.1749106659.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1749106659.git.hverkuil@xs4all.nl>
References: <cover.1749106659.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the wait_prepare/finish callbacks. Instead require that the vb2_queue
lock field is always set and use that lock when waiting for buffers to
arrive.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 .../userspace-api/media/conf_nitpick.py       |  2 -
 .../media/common/videobuf2/videobuf2-core.c   | 49 ++++---------------
 include/media/videobuf2-core.h                | 23 ++-------
 3 files changed, 15 insertions(+), 59 deletions(-)

diff --git a/Documentation/userspace-api/media/conf_nitpick.py b/Documentation/userspace-api/media/conf_nitpick.py
index 0a8e236d07ab..445a29c01d1b 100644
--- a/Documentation/userspace-api/media/conf_nitpick.py
+++ b/Documentation/userspace-api/media/conf_nitpick.py
@@ -42,8 +42,6 @@ nitpick_ignore = [
     ("c:func", "struct fd_set"),
     ("c:func", "struct pollfd"),
     ("c:func", "usb_make_path"),
-    ("c:func", "wait_finish"),
-    ("c:func", "wait_prepare"),
     ("c:func", "write"),
 
     ("c:type", "atomic_t"),
diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 2df566f409b6..2d1f253b4929 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -605,8 +605,7 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int start, unsigned i
 	 */
 	if (vb2_get_num_buffers(q)) {
 		bool unbalanced = q->cnt_start_streaming != q->cnt_stop_streaming ||
-				  q->cnt_prepare_streaming != q->cnt_unprepare_streaming ||
-				  q->cnt_wait_prepare != q->cnt_wait_finish;
+				  q->cnt_prepare_streaming != q->cnt_unprepare_streaming;
 
 		if (unbalanced) {
 			pr_info("unbalanced counters for queue %p:\n", q);
@@ -617,13 +616,8 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int start, unsigned i
 			if (q->cnt_prepare_streaming != q->cnt_unprepare_streaming)
 				pr_info("     prepare_streaming: %u unprepare_streaming: %u\n",
 					q->cnt_prepare_streaming, q->cnt_unprepare_streaming);
-			if (q->cnt_wait_prepare != q->cnt_wait_finish)
-				pr_info("     wait_prepare: %u wait_finish: %u\n",
-					q->cnt_wait_prepare, q->cnt_wait_finish);
 		}
 		q->cnt_queue_setup = 0;
-		q->cnt_wait_prepare = 0;
-		q->cnt_wait_finish = 0;
 		q->cnt_prepare_streaming = 0;
 		q->cnt_start_streaming = 0;
 		q->cnt_stop_streaming = 0;
@@ -2037,10 +2031,7 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
 		 * become ready or for streamoff. Driver's lock is released to
 		 * allow streamoff or qbuf to be called while waiting.
 		 */
-		if (q->ops->wait_prepare)
-			call_void_qop(q, wait_prepare, q);
-		else if (q->lock)
-			mutex_unlock(q->lock);
+		mutex_unlock(q->lock);
 
 		/*
 		 * All locks have been released, it is safe to sleep now.
@@ -2050,10 +2041,7 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
 				!list_empty(&q->done_list) || !q->streaming ||
 				q->error);
 
-		if (q->ops->wait_finish)
-			call_void_qop(q, wait_finish, q);
-		else if (q->lock)
-			mutex_lock(q->lock);
+		mutex_lock(q->lock);
 
 		q->waiting_in_dqbuf = 0;
 		/*
@@ -2653,12 +2641,8 @@ int vb2_core_queue_init(struct vb2_queue *q)
 	if (WARN_ON(q->min_reqbufs_allocation > q->max_num_buffers))
 		return -EINVAL;
 
-	/* Either both or none are set */
-	if (WARN_ON(!q->ops->wait_prepare ^ !q->ops->wait_finish))
-		return -EINVAL;
-
-	/* Warn if q->lock is NULL and no custom wait_prepare is provided */
-	if (WARN_ON(!q->lock && !q->ops->wait_prepare))
+	/* Warn if q->lock is NULL */
+	if (WARN_ON(!q->lock))
 		return -EINVAL;
 
 	INIT_LIST_HEAD(&q->queued_list);
@@ -3220,17 +3204,10 @@ static int vb2_thread(void *data)
 				continue;
 			prequeue--;
 		} else {
-			if (!threadio->stop) {
-				if (q->ops->wait_finish)
-					call_void_qop(q, wait_finish, q);
-				else if (q->lock)
-					mutex_lock(q->lock);
+			mutex_lock(q->lock);
+			if (!threadio->stop)
 				ret = vb2_core_dqbuf(q, &index, NULL, 0);
-				if (q->ops->wait_prepare)
-					call_void_qop(q, wait_prepare, q);
-				else if (q->lock)
-					mutex_unlock(q->lock);
-			}
+			mutex_unlock(q->lock);
 			dprintk(q, 5, "file io: vb2_dqbuf result: %d\n", ret);
 			if (!ret)
 				vb = vb2_get_buffer(q, index);
@@ -3245,15 +3222,9 @@ static int vb2_thread(void *data)
 		if (copy_timestamp)
 			vb->timestamp = ktime_get_ns();
 		if (!threadio->stop) {
-			if (q->ops->wait_finish)
-				call_void_qop(q, wait_finish, q);
-			else if (q->lock)
-				mutex_lock(q->lock);
+			mutex_lock(q->lock);
 			ret = vb2_core_qbuf(q, vb, NULL, NULL);
-			if (q->ops->wait_prepare)
-				call_void_qop(q, wait_prepare, q);
-			else if (q->lock)
-				mutex_unlock(q->lock);
+			mutex_unlock(q->lock);
 		}
 		if (ret || threadio->stop)
 			break;
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 9b02aeba4108..4424d481d7f7 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -351,13 +351,6 @@ struct vb2_buffer {
  *			\*num_buffers are being allocated additionally to
  *			the buffers already allocated. If either \*num_planes
  *			or the requested sizes are invalid callback must return %-EINVAL.
- * @wait_prepare:	release any locks taken while calling vb2 functions;
- *			it is called before an ioctl needs to wait for a new
- *			buffer to arrive; required to avoid a deadlock in
- *			blocking access type.
- * @wait_finish:	reacquire all locks released in the previous callback;
- *			required to continue operation after sleeping while
- *			waiting for a new buffer to arrive.
  * @buf_out_validate:	called when the output buffer is prepared or queued
  *			to a request; drivers can use this to validate
  *			userspace-provided information; this is required only
@@ -436,9 +429,6 @@ struct vb2_ops {
 			   unsigned int *num_buffers, unsigned int *num_planes,
 			   unsigned int sizes[], struct device *alloc_devs[]);
 
-	void (*wait_prepare)(struct vb2_queue *q);
-	void (*wait_finish)(struct vb2_queue *q);
-
 	int (*buf_out_validate)(struct vb2_buffer *vb);
 	int (*buf_init)(struct vb2_buffer *vb);
 	int (*buf_prepare)(struct vb2_buffer *vb);
@@ -521,10 +511,10 @@ struct vb2_buf_ops {
  * @non_coherent_mem: when set queue will attempt to allocate buffers using
  *		non-coherent memory.
  * @lock:	pointer to a mutex that protects the &struct vb2_queue. The
- *		driver can set this to a mutex to let the v4l2 core serialize
- *		the queuing ioctls. If the driver wants to handle locking
- *		itself, then this should be set to NULL. This lock is not used
- *		by the videobuf2 core API.
+ *		driver must set this to a mutex to let the v4l2 core serialize
+ *		the queuing ioctls. This lock is used when waiting for a new
+ *		buffer to arrive: the lock is released, we wait for the new
+ *		buffer, and then retaken.
  * @owner:	The filehandle that 'owns' the buffers, i.e. the filehandle
  *		that called reqbufs, create_buffers or started fileio.
  *		This field is not used by the videobuf2 core API, but it allows
@@ -680,8 +670,6 @@ struct vb2_queue {
 	 * called. Used to check for unbalanced ops.
 	 */
 	u32				cnt_queue_setup;
-	u32				cnt_wait_prepare;
-	u32				cnt_wait_finish;
 	u32				cnt_prepare_streaming;
 	u32				cnt_start_streaming;
 	u32				cnt_stop_streaming;
@@ -766,8 +754,7 @@ void vb2_discard_done(struct vb2_queue *q);
  * @q:		pointer to &struct vb2_queue with videobuf2 queue.
  *
  * This function will wait until all buffers that have been given to the driver
- * by &vb2_ops->buf_queue are given back to vb2 with vb2_buffer_done(). It
- * doesn't call &vb2_ops->wait_prepare/&vb2_ops->wait_finish pair.
+ * by &vb2_ops->buf_queue are given back to vb2 with vb2_buffer_done().
  * It is intended to be called with all locks taken, for example from
  * &vb2_ops->stop_streaming callback.
  */
-- 
2.47.2


