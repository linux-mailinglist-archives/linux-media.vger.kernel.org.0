Return-Path: <linux-media+bounces-34089-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D803ACEAA0
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 09:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D599E189279E
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 07:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773141F91F6;
	Thu,  5 Jun 2025 07:05:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2106D2C3242
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 07:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107148; cv=none; b=pY/x2SBsJNXXuy480ZvREBrogcXxTGHi40PlHkitLIPKzXT1ZEGhvIxUx1mLZI+lj7UR5N2vkcTlXq18BLiqsOxKrJ+2+Qv3ELU43yFezCAXGvGMS1CUfnFQz90mBm5Fjp/0CML0lb2H8eI5RpBee0h8uhK050Gckrm1jb0V0bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107148; c=relaxed/simple;
	bh=EYmYVo4AEm8RxucRWieQSmn4EvTr5Bv08Y/gEiQ1o2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hcgRulz380xW698SmZNUcCgyU7QwX+Ix8saQy/ZCp98H7zUYMCMiaUki7lwrt+mY3B8lL968hxNa7/KPfUv37EibsD/qDJe6zDbJ0fsT1cGVnGX4+7bZaIrTWXEUUm/AydnUwXLJI2qeqRvhCzJYzjVT5kCxiNSOVQuspiK7Em8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE97C4AF09;
	Thu,  5 Jun 2025 07:05:46 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 3/5] media: dvb-core: dvb_vb2: drop wait_prepare/finish callbacks
Date: Thu,  5 Jun 2025 08:57:37 +0200
Message-ID: <6f9d2362da168ace5a72da698ffdc23a130e92ae.1749106659.git.hverkuil@xs4all.nl>
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

Since commit 88785982a19d ("media: vb2: use lock if wait_prepare/finish
are NULL") it is no longer needed to set the wait_prepare/finish
vb2_ops callbacks as long as the lock field in vb2_queue is set.

Set the queue lock to &ctx->mutex, which makes it possible to drop
the wait_prepare/finish callbacks.

This simplifies the code and this is a step towards the goal of deleting
these callbacks.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/dvb-core/dmxdev.c  | 15 +++++++++++-
 drivers/media/dvb-core/dvb_vb2.c | 40 +++++++++-----------------------
 include/media/dvb_vb2.h          | 11 ++++-----
 3 files changed, 30 insertions(+), 36 deletions(-)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index ffeedb0c0950..19d168bd6c54 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -171,6 +171,7 @@ static int dvb_dvr_open(struct inode *inode, struct file *file)
 		dvb_ringbuffer_init(&dmxdev->dvr_buffer, mem, DVR_BUFFER_SIZE);
 		if (dmxdev->may_do_mmap)
 			dvb_vb2_init(&dmxdev->dvr_vb2_ctx, "dvr",
+				     &dmxdev->mutex,
 				     file->f_flags & O_NONBLOCK);
 		dvbdev->readers--;
 	}
@@ -814,9 +815,21 @@ static int dvb_demux_open(struct inode *inode, struct file *file)
 	dmxdev->may_do_mmap = 0;
 #endif
 
+	/*
+	 * The mutex passed to dvb_vb2_init is unlocked when a buffer
+	 * is in a blocking wait. However, dmxdevfilter has two mutexes:
+	 * dmxdevfilter->mutex and dmxdev->mutex. So this will not work.
+	 * The solution would be to support unlocking two mutexes in vb2,
+	 * but since this problem has been here since the beginning and
+	 * nobody ever complained, we leave it as-is rather than adding
+	 * that second mutex pointer to vb2.
+	 *
+	 * In the unlikely event that someone complains about this, then
+	 * this comment will hopefully help.
+	 */
 	dvb_ringbuffer_init(&dmxdevfilter->buffer, NULL, 8192);
 	dvb_vb2_init(&dmxdevfilter->vb2_ctx, "demux_filter",
-		     file->f_flags & O_NONBLOCK);
+		     &dmxdevfilter->mutex, file->f_flags & O_NONBLOCK);
 	dmxdevfilter->type = DMXDEV_TYPE_NONE;
 	dvb_dmxdev_filter_state_set(dmxdevfilter, DMXDEV_STATE_ALLOCATED);
 	timer_setup(&dmxdevfilter->timer, dvb_dmxdev_filter_timeout, 0);
diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
index 7444bbc2f24d..672b0efdca21 100644
--- a/drivers/media/dvb-core/dvb_vb2.c
+++ b/drivers/media/dvb-core/dvb_vb2.c
@@ -103,31 +103,12 @@ static void _stop_streaming(struct vb2_queue *vq)
 	spin_unlock_irqrestore(&ctx->slock, flags);
 }
 
-static void _dmxdev_lock(struct vb2_queue *vq)
-{
-	struct dvb_vb2_ctx *ctx = vb2_get_drv_priv(vq);
-
-	mutex_lock(&ctx->mutex);
-	dprintk(3, "[%s]\n", ctx->name);
-}
-
-static void _dmxdev_unlock(struct vb2_queue *vq)
-{
-	struct dvb_vb2_ctx *ctx = vb2_get_drv_priv(vq);
-
-	if (mutex_is_locked(&ctx->mutex))
-		mutex_unlock(&ctx->mutex);
-	dprintk(3, "[%s]\n", ctx->name);
-}
-
 static const struct vb2_ops dvb_vb2_qops = {
 	.queue_setup		= _queue_setup,
 	.buf_prepare		= _buffer_prepare,
 	.buf_queue		= _buffer_queue,
 	.start_streaming	= _start_streaming,
 	.stop_streaming		= _stop_streaming,
-	.wait_prepare		= _dmxdev_unlock,
-	.wait_finish		= _dmxdev_lock,
 };
 
 static void _fill_dmx_buffer(struct vb2_buffer *vb, void *pb)
@@ -158,9 +139,10 @@ static const struct vb2_buf_ops dvb_vb2_buf_ops = {
 };
 
 /*
- * Videobuf operations
+ * vb2 operations
  */
-int dvb_vb2_init(struct dvb_vb2_ctx *ctx, const char *name, int nonblocking)
+int dvb_vb2_init(struct dvb_vb2_ctx *ctx, const char *name,
+		 struct mutex *mutex, int nonblocking)
 {
 	struct vb2_queue *q = &ctx->vb_q;
 	int ret;
@@ -175,14 +157,7 @@ int dvb_vb2_init(struct dvb_vb2_ctx *ctx, const char *name, int nonblocking)
 	q->ops = &dvb_vb2_qops;
 	q->mem_ops = &vb2_vmalloc_memops;
 	q->buf_ops = &dvb_vb2_buf_ops;
-	ret = vb2_core_queue_init(q);
-	if (ret) {
-		ctx->state = DVB_VB2_STATE_NONE;
-		dprintk(1, "[%s] errno=%d\n", ctx->name, ret);
-		return ret;
-	}
-
-	mutex_init(&ctx->mutex);
+	q->lock = mutex;
 	spin_lock_init(&ctx->slock);
 	INIT_LIST_HEAD(&ctx->dvb_q);
 
@@ -190,6 +165,13 @@ int dvb_vb2_init(struct dvb_vb2_ctx *ctx, const char *name, int nonblocking)
 	ctx->nonblocking = nonblocking;
 	ctx->state = DVB_VB2_STATE_INIT;
 
+	ret = vb2_core_queue_init(q);
+	if (ret) {
+		ctx->state = DVB_VB2_STATE_NONE;
+		dprintk(1, "[%s] errno=%d\n", ctx->name, ret);
+		return ret;
+	}
+
 	dprintk(3, "[%s]\n", ctx->name);
 
 	return 0;
diff --git a/include/media/dvb_vb2.h b/include/media/dvb_vb2.h
index 0fbbfc65157e..8932396d2c99 100644
--- a/include/media/dvb_vb2.h
+++ b/include/media/dvb_vb2.h
@@ -72,8 +72,6 @@ struct dvb_buffer {
 /**
  * struct dvb_vb2_ctx - control struct for VB2 handler
  * @vb_q:	pointer to &struct vb2_queue with videobuf2 queue.
- * @mutex:	mutex to serialize vb2 operations. Used by
- *		vb2 core %wait_prepare and %wait_finish operations.
  * @slock:	spin lock used to protect buffer filling at dvb_vb2.c.
  * @dvb_q:	List of buffers that are not filled yet.
  * @buf:	Pointer to the buffer that are currently being filled.
@@ -96,7 +94,6 @@ struct dvb_buffer {
  */
 struct dvb_vb2_ctx {
 	struct vb2_queue	vb_q;
-	struct mutex		mutex;
 	spinlock_t		slock;
 	struct list_head	dvb_q;
 	struct dvb_buffer	*buf;
@@ -114,8 +111,8 @@ struct dvb_vb2_ctx {
 };
 
 #ifndef CONFIG_DVB_MMAP
-static inline int dvb_vb2_init(struct dvb_vb2_ctx *ctx,
-			       const char *name, int non_blocking)
+static inline int dvb_vb2_init(struct dvb_vb2_ctx *ctx, const char *name,
+			       struct mutex *mutex, int non_blocking)
 {
 	return 0;
 };
@@ -138,10 +135,12 @@ static inline __poll_t dvb_vb2_poll(struct dvb_vb2_ctx *ctx,
  *
  * @ctx:	control struct for VB2 handler
  * @name:	name for the VB2 handler
+ * @mutex:	pointer to the mutex that serializes vb2 ioctls
  * @non_blocking:
  *		if not zero, it means that the device is at non-blocking mode
  */
-int dvb_vb2_init(struct dvb_vb2_ctx *ctx, const char *name, int non_blocking);
+int dvb_vb2_init(struct dvb_vb2_ctx *ctx, const char *name,
+		 struct mutex *mutex, int non_blocking);
 
 /**
  * dvb_vb2_release - Releases the VB2 handler allocated resources and
-- 
2.47.2


