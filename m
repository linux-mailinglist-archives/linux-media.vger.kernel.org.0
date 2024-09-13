Return-Path: <linux-media+bounces-18277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCE6978AD8
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 23:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EDC91F25774
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 21:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F97A1714D9;
	Fri, 13 Sep 2024 21:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OYTnzKUZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E6A1494DC
	for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 21:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726264051; cv=none; b=niSgTuNjQAimzTRvqQ/ocS+38nSu7FA71xmuqJeyFUuoOT+RxY3VDwMdeekj8WvpFm88GuplTYoJRD/KXdb+TXxjyhaLmdHYt4SrujKewVUupmgNMihCDaRDrVQ2fGLLCPXdCbrMNb9qFy05Ec61IEmdaKS0RN5bxBVMumcaIww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726264051; c=relaxed/simple;
	bh=JkL1mUCZoVEqCrviXrBtMAXA0r6wMGrZjDYOteOnxVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9OCdJIT+HgRTvHgbjt58yOwEtAmtgDNWafsbCZupwSw2xMHxqOGZbUHMZ/V0WwB7lWnsSbzLwe2Fyq2d73sYCIn2hlyZ3XruMv6iLNeNIg9QQX6ploF8F7Me6l8lanqPrbWmTGh2aTlSQdt3PT6oDPl0d4NntI8sQJdw0rnRgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OYTnzKUZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC7862590;
	Fri, 13 Sep 2024 23:45:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726263950;
	bh=JkL1mUCZoVEqCrviXrBtMAXA0r6wMGrZjDYOteOnxVk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OYTnzKUZSYI7BxfCrL9jdhEHkJs0xV0gCAjWrCLdxZsHdKhN7nBdlv1QAEo22Dg1I
	 IoT1teSLOgzNuzMcqp3YvUAeSjyZEwj7BOH7UCN3I9ExvPjfWECqSKw9ElX0c6gx2o
	 dulyIgWliZFH4feMuqQv+D69M4WhCMKZLF0rZGKE=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 08/10] videobuf2-v4l2: Support vb2_queue embedded in a context
Date: Fri, 13 Sep 2024 23:46:53 +0200
Message-ID: <20240913214657.1502838-9-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913214657.1502838-1-jacopo.mondi@ideasonboard.com>
References: <20240913214657.1502838-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support device drivers that implement multi-context operations in the
videobuf2 core by providing an helper to retrieve the vb2_queue from
the context associated with an open file handle. If no context is
associated with a file handle, retrieve it from the video device
default context, created by the core for multi-context aware drivers.

Fall-back to use the vb2_queue from the video_device to support existing
drivers which are not context aware.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/common/videobuf2/videobuf2-v4l2.c   | 129 +++++++++++-------
 1 file changed, 81 insertions(+), 48 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index c7a54d82a55e..a221436718c2 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -976,27 +976,46 @@ EXPORT_SYMBOL_GPL(vb2_poll);
  * and so they simplify the driver code.
  */
 
+/*
+ * Helper to get the vb2 queue either from:
+ * 1) The video context bound to the open file handle
+ * 2) The default context for context-aware drivers if userspace has not bound
+ *    a context to the file handle
+ * 3) From the video device for non-context aware drivers
+ */
+static struct vb2_queue *get_vb2_queue(struct file *file,
+				       struct video_device *vdev)
+{
+	struct video_device_context *ctx =
+				video_device_context_from_file(file, vdev);
+
+	return ctx ? &ctx->queue
+		   : vdev->default_context ? &vdev->default_context->queue
+		   : vdev->queue;
+}
+
 /* vb2 ioctl helpers */
 
 int vb2_ioctl_reqbufs(struct file *file, void *priv,
 			  struct v4l2_requestbuffers *p)
 {
 	struct video_device *vdev = video_devdata(file);
-	int res = vb2_verify_memory_type(vdev->queue, p->memory, p->type);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
+	int res = vb2_verify_memory_type(q, p->memory, p->type);
 	u32 flags = p->flags;
 
-	fill_buf_caps(vdev->queue, &p->capabilities);
-	validate_memory_flags(vdev->queue, p->memory, &flags);
+	fill_buf_caps(q, &p->capabilities);
+	validate_memory_flags(q, p->memory, &flags);
 	p->flags = flags;
 	if (res)
 		return res;
-	if (vb2_queue_is_busy(vdev->queue, file))
+	if (vb2_queue_is_busy(q, file))
 		return -EBUSY;
-	res = vb2_core_reqbufs(vdev->queue, p->memory, p->flags, &p->count);
+	res = vb2_core_reqbufs(q, p->memory, p->flags, &p->count);
 	/* If count == 0, then the owner has released all buffers and he
 	   is no longer owner of the queue. Otherwise we have a new owner. */
 	if (res == 0)
-		vdev->queue->owner = p->count ? file->private_data : NULL;
+		q->owner = p->count ? file->private_data : NULL;
 	return res;
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_reqbufs);
@@ -1005,12 +1024,13 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
 			  struct v4l2_create_buffers *p)
 {
 	struct video_device *vdev = video_devdata(file);
-	int res = vb2_verify_memory_type(vdev->queue, p->memory,
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
+	int res = vb2_verify_memory_type(q, p->memory,
 			p->format.type);
 
-	p->index = vdev->queue->num_buffers;
-	fill_buf_caps(vdev->queue, &p->capabilities);
-	validate_memory_flags(vdev->queue, p->memory, &p->flags);
+	p->index = q->num_buffers;
+	fill_buf_caps(q, &p->capabilities);
+	validate_memory_flags(q, p->memory, &p->flags);
 	/*
 	 * If count == 0, then just check if memory and type are valid.
 	 * Any -EBUSY result from vb2_verify_memory_type can be mapped to 0.
@@ -1019,12 +1039,12 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
 		return res != -EBUSY ? res : 0;
 	if (res)
 		return res;
-	if (vb2_queue_is_busy(vdev->queue, file))
+	if (vb2_queue_is_busy(q, file))
 		return -EBUSY;
 
-	res = vb2_create_bufs(vdev->queue, p);
+	res = vb2_create_bufs(q, p);
 	if (res == 0)
-		vdev->queue->owner = file->private_data;
+		q->owner = file->private_data;
 	return res;
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_create_bufs);
@@ -1033,69 +1053,76 @@ int vb2_ioctl_prepare_buf(struct file *file, void *priv,
 			  struct v4l2_buffer *p)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
 
-	if (vb2_queue_is_busy(vdev->queue, file))
+	if (vb2_queue_is_busy(q, file))
 		return -EBUSY;
-	return vb2_prepare_buf(vdev->queue, vdev->v4l2_dev->mdev, p);
+	return vb2_prepare_buf(q, vdev->v4l2_dev->mdev, p);
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_prepare_buf);
 
 int vb2_ioctl_querybuf(struct file *file, void *priv, struct v4l2_buffer *p)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
 
 	/* No need to call vb2_queue_is_busy(), anyone can query buffers. */
-	return vb2_querybuf(vdev->queue, p);
+	return vb2_querybuf(q, p);
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_querybuf);
 
 int vb2_ioctl_qbuf(struct file *file, void *priv, struct v4l2_buffer *p)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
 
-	if (vb2_queue_is_busy(vdev->queue, file))
+	if (vb2_queue_is_busy(q, file))
 		return -EBUSY;
-	return vb2_qbuf(vdev->queue, vdev->v4l2_dev->mdev, p);
+	return vb2_qbuf(q, vdev->v4l2_dev->mdev, p);
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_qbuf);
 
 int vb2_ioctl_dqbuf(struct file *file, void *priv, struct v4l2_buffer *p)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
 
-	if (vb2_queue_is_busy(vdev->queue, file))
+	if (vb2_queue_is_busy(q, file))
 		return -EBUSY;
-	return vb2_dqbuf(vdev->queue, p, file->f_flags & O_NONBLOCK);
+	return vb2_dqbuf(q, p, file->f_flags & O_NONBLOCK);
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_dqbuf);
 
 int vb2_ioctl_streamon(struct file *file, void *priv, enum v4l2_buf_type i)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
 
-	if (vb2_queue_is_busy(vdev->queue, file))
+	if (vb2_queue_is_busy(q, file))
 		return -EBUSY;
-	return vb2_streamon(vdev->queue, i);
+	return vb2_streamon(q, i);
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_streamon);
 
 int vb2_ioctl_streamoff(struct file *file, void *priv, enum v4l2_buf_type i)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
 
-	if (vb2_queue_is_busy(vdev->queue, file))
+	if (vb2_queue_is_busy(q, file))
 		return -EBUSY;
-	return vb2_streamoff(vdev->queue, i);
+	return vb2_streamoff(q, i);
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_streamoff);
 
 int vb2_ioctl_expbuf(struct file *file, void *priv, struct v4l2_exportbuffer *p)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
 
-	if (vb2_queue_is_busy(vdev->queue, file))
+	if (vb2_queue_is_busy(q, file))
 		return -EBUSY;
-	return vb2_expbuf(vdev->queue, p);
+	return vb2_expbuf(q, p);
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_expbuf);
 
@@ -1104,20 +1131,22 @@ EXPORT_SYMBOL_GPL(vb2_ioctl_expbuf);
 int vb2_fop_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
 
-	return vb2_mmap(vdev->queue, vma);
+	return vb2_mmap(q, vma);
 }
 EXPORT_SYMBOL_GPL(vb2_fop_mmap);
 
 int _vb2_fop_release(struct file *file, struct mutex *lock)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
 
 	if (lock)
 		mutex_lock(lock);
-	if (file->private_data == vdev->queue->owner) {
-		vb2_queue_release(vdev->queue);
-		vdev->queue->owner = NULL;
+	if (file->private_data == q->owner) {
+		vb2_queue_release(q);
+		q->owner = NULL;
 	}
 	if (lock)
 		mutex_unlock(lock);
@@ -1128,7 +1157,8 @@ EXPORT_SYMBOL_GPL(_vb2_fop_release);
 int vb2_fop_release(struct file *file)
 {
 	struct video_device *vdev = video_devdata(file);
-	struct mutex *lock = vdev->queue->lock ? vdev->queue->lock : vdev->lock;
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
+	struct mutex *lock = q->lock ? q->lock : vdev->lock;
 
 	return _vb2_fop_release(file, lock);
 }
@@ -1138,19 +1168,20 @@ ssize_t vb2_fop_write(struct file *file, const char __user *buf,
 		size_t count, loff_t *ppos)
 {
 	struct video_device *vdev = video_devdata(file);
-	struct mutex *lock = vdev->queue->lock ? vdev->queue->lock : vdev->lock;
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
+	struct mutex *lock = q->lock ? q->lock : vdev->lock;
 	int err = -EBUSY;
 
-	if (!(vdev->queue->io_modes & VB2_WRITE))
+	if (!(q->io_modes & VB2_WRITE))
 		return -EINVAL;
 	if (lock && mutex_lock_interruptible(lock))
 		return -ERESTARTSYS;
-	if (vb2_queue_is_busy(vdev->queue, file))
+	if (vb2_queue_is_busy(q, file))
 		goto exit;
-	err = vb2_write(vdev->queue, buf, count, ppos,
-		       file->f_flags & O_NONBLOCK);
-	if (vdev->queue->fileio)
-		vdev->queue->owner = file->private_data;
+	err = vb2_write(q, buf, count, ppos,
+			file->f_flags & O_NONBLOCK);
+	if (q->fileio)
+		q->owner = file->private_data;
 exit:
 	if (lock)
 		mutex_unlock(lock);
@@ -1162,20 +1193,21 @@ ssize_t vb2_fop_read(struct file *file, char __user *buf,
 		size_t count, loff_t *ppos)
 {
 	struct video_device *vdev = video_devdata(file);
-	struct mutex *lock = vdev->queue->lock ? vdev->queue->lock : vdev->lock;
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
+	struct mutex *lock = q->lock ? q->lock : vdev->lock;
 	int err = -EBUSY;
 
-	if (!(vdev->queue->io_modes & VB2_READ))
+	if (!(q->io_modes & VB2_READ))
 		return -EINVAL;
 	if (lock && mutex_lock_interruptible(lock))
 		return -ERESTARTSYS;
-	if (vb2_queue_is_busy(vdev->queue, file))
+	if (vb2_queue_is_busy(q, file))
 		goto exit;
-	vdev->queue->owner = file->private_data;
-	err = vb2_read(vdev->queue, buf, count, ppos,
+	q->owner = file->private_data;
+	err = vb2_read(q, buf, count, ppos,
 		       file->f_flags & O_NONBLOCK);
-	if (!vdev->queue->fileio)
-		vdev->queue->owner = NULL;
+	if (!q->fileio)
+		q->owner = NULL;
 exit:
 	if (lock)
 		mutex_unlock(lock);
@@ -1186,7 +1218,7 @@ EXPORT_SYMBOL_GPL(vb2_fop_read);
 __poll_t vb2_fop_poll(struct file *file, poll_table *wait)
 {
 	struct video_device *vdev = video_devdata(file);
-	struct vb2_queue *q = vdev->queue;
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
 	struct mutex *lock = q->lock ? q->lock : vdev->lock;
 	__poll_t res;
 	void *fileio;
@@ -1202,7 +1234,7 @@ __poll_t vb2_fop_poll(struct file *file, poll_table *wait)
 
 	fileio = q->fileio;
 
-	res = vb2_poll(vdev->queue, file, wait);
+	res = vb2_poll(q, file, wait);
 
 	/* If fileio was started, then we have a new queue owner. */
 	if (!fileio && q->fileio)
@@ -1218,8 +1250,9 @@ unsigned long vb2_fop_get_unmapped_area(struct file *file, unsigned long addr,
 		unsigned long len, unsigned long pgoff, unsigned long flags)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
 
-	return vb2_get_unmapped_area(vdev->queue, addr, len, pgoff, flags);
+	return vb2_get_unmapped_area(q, addr, len, pgoff, flags);
 }
 EXPORT_SYMBOL_GPL(vb2_fop_get_unmapped_area);
 #endif
-- 
2.46.0


