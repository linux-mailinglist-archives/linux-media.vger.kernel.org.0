Return-Path: <linux-media+bounces-37976-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 018C6B08B14
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3980916A821
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 10:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4BA29AB0E;
	Thu, 17 Jul 2025 10:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rH23bMK9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF81F2BD001;
	Thu, 17 Jul 2025 10:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752749163; cv=none; b=bJzyYMUNM+nspPCzuRwceZnfKi1B97XPEKovDxFk+M6vartmJruYGC3UZsADCKoy26tmYOzVJ10hvHadIwquT+pJ67xTEGlHxPU1oVVJMmsaTeDORc7ZQGuXU4aGERj31V9P5Z7ljF55M94JvkhWpQrEglP7yrBMvoCer3tQ62Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752749163; c=relaxed/simple;
	bh=LUe4O1ANeWng4EOxHijMT12GIxXH8Gc6BKlXOjBsYj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KrFke6rr2mwfBxZLnpvKsxRnwUqBuE8sq7HvRyyYr/rOhfMxNneUfNCblW6OYmH9QXl06h7f+hKGlPNZjzkmR40zcq5WGJpiV+AD0qvr4DwfbK/VnFINZR8HIyWvtEuNvMejxQlVDRvimSCgqdUsikAQbr9Ri8zY5rVBQZ85rcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rH23bMK9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 827FF1E74;
	Thu, 17 Jul 2025 12:45:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749122;
	bh=LUe4O1ANeWng4EOxHijMT12GIxXH8Gc6BKlXOjBsYj4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rH23bMK9nY7OM/iczF3S4nT0Nba0tCMv1g9R5gDw9wWpU8rxJtY+zE0IsU+ro1+ET
	 O8Fhs2ZWm8mMb51HJfusHUC9MzsBAOV51UYuiRnFy2IEfCDg0SymK2UxRFjcc7nzMP
	 Yq4Yr9tXIevsrM1H2yoibvRlPhEWOXt0bCRwSLXk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:37 +0200
Subject: [PATCH 11/26] media: videobuf2-v4l2: Support vb2_queue embedded in
 a context
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-11-81ac18979c03@ideasonboard.com>
References: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
In-Reply-To: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12110;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=LUe4O1ANeWng4EOxHijMT12GIxXH8Gc6BKlXOjBsYj4=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRQCFrxdssrnhkAyPfNGVcWPDjHgW3/Vz0Tm
 4uK3GTfrcOJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUUAAKCRByNAaPFqFW
 PCgTD/9Jswu3HUzFc2cgTgBtrlChHcpc9Jg5xvNDYAq8jLmjLi/05jW8jUqe+u3B/8Wly4sCKuA
 +k3bsZChMSsBSxK2FLAdG9El31f72fYmW7nF9lXLM02NkEIKvk46c4LbZ7+/oJSNBhxULxqtxCS
 Qsn0tlmQ3W4ZTnwkSTknPO9GZG8k3CGqI8TZWcUoVae7WXlzW21WZzUDVgiCSU8OtXr7eZbrXvS
 qLQA2pigZUDP0SjbXxm+xNQWAOln0WliT5A1h5Qbc0DSld1+2iXsPKt6kdJ8Pk+Fgv4Pu7A2TrO
 L2RA8Py8hFi4YPiOgWOXRzN7nqi0ruqmqncx8FA4LKoOgb4IYBUcxyLGgSVkWoAHddlGlUEHTeX
 uhYtj1IggdyQn18BHpt/VL50/RxxboD/K64gPmDD/3misMI8hPKwsJiUTCI0NsM9MF6pMlr2b8Y
 +HAH3di5EyAqpuVZyyd2y5NNQGMINqHuOxbIgdacidmQ3QX8I+kjsShGOATN7ESU/5HHjZqaOCv
 o4voQL4M0sJ/h2JWS1fRy8ds4JUxWZhFjUby1ukwOgzN6V9W+6/d/eHEX8PdQAnOzOc9WVcXE7O
 M18Okdi6tOAc7gfG2bAgx/ml4a0zqX5tWe6vThVn9h7FUhY9jz+XERxr5Pztz5nhA9AkEUoD4Gl
 9muJ0jjbwaBNEPw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Support device drivers that implement multi-context operations in the
videobuf2 core by providing an helper to retrieve the vb2_queue from
the context associated with an open file handle. If no context is
associated with a file handle, retrieve it from the video device
default context, created by the core for multi-context aware drivers.

Fall-back to use the vb2_queue from the video_device to support existing
drivers which are not context aware.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 135 +++++++++++++++---------
 1 file changed, 84 insertions(+), 51 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 1cd26faee50338aefeb670c6865da7c2d43f44d3..01269e03102f9ed7731732cc5d3444664eaa7bec 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -998,23 +998,42 @@ EXPORT_SYMBOL_GPL(vb2_poll);
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
 
 int vb2_ioctl_remove_bufs(struct file *file, void *priv,
 			  struct v4l2_remove_buffers *d)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
 
-	if (vdev->queue->type != d->type)
+	if (q->type != d->type)
 		return -EINVAL;
 
 	if (d->count == 0)
 		return 0;
 
-	if (vb2_queue_is_busy(vdev->queue, file))
+	if (vb2_queue_is_busy(q, file))
 		return -EBUSY;
 
-	return vb2_core_remove_bufs(vdev->queue, d->index, d->count);
+	return vb2_core_remove_bufs(q, d->index, d->count);
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_remove_bufs);
 
@@ -1022,21 +1041,21 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
 			  struct v4l2_requestbuffers *p)
 {
 	struct video_device *vdev = video_devdata(file);
-	int res = vb2_verify_memory_type(vdev->queue, p->memory, p->type);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
+	int res = vb2_verify_memory_type(q, p->memory, p->type);
 	u32 flags = p->flags;
 
-	vb2_set_flags_and_caps(vdev->queue, p->memory, &flags,
-			       &p->capabilities, NULL);
+	vb2_set_flags_and_caps(q, p->memory, &flags, &p->capabilities, NULL);
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
@@ -1045,11 +1064,12 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
 			  struct v4l2_create_buffers *p)
 {
 	struct video_device *vdev = video_devdata(file);
-	int res = vb2_verify_memory_type(vdev->queue, p->memory, p->format.type);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
+	int res = vb2_verify_memory_type(q, p->memory, p->format.type);
 
-	p->index = vb2_get_num_buffers(vdev->queue);
-	vb2_set_flags_and_caps(vdev->queue, p->memory, &p->flags,
-			       &p->capabilities, &p->max_num_buffers);
+	p->index = vb2_get_num_buffers(q);
+	vb2_set_flags_and_caps(q, p->memory, &p->flags, &p->capabilities,
+			       &p->max_num_buffers);
 	/*
 	 * If count == 0, then just check if memory and type are valid.
 	 * Any -EBUSY result from vb2_verify_memory_type can be mapped to 0.
@@ -1058,12 +1078,12 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
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
@@ -1072,69 +1092,76 @@ int vb2_ioctl_prepare_buf(struct file *file, void *priv,
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
 
@@ -1143,20 +1170,22 @@ EXPORT_SYMBOL_GPL(vb2_ioctl_expbuf);
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
-	if (!vdev->queue->owner || file->private_data == vdev->queue->owner) {
-		vb2_queue_release(vdev->queue);
-		vdev->queue->owner = NULL;
+	if (!q->owner || file->private_data == q->owner) {
+		vb2_queue_release(q);
+		q->owner = NULL;
 	}
 	if (lock)
 		mutex_unlock(lock);
@@ -1167,7 +1196,8 @@ EXPORT_SYMBOL_GPL(_vb2_fop_release);
 int vb2_fop_release(struct file *file)
 {
 	struct video_device *vdev = video_devdata(file);
-	struct mutex *lock = vdev->queue->lock ? vdev->queue->lock : vdev->lock;
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
+	struct mutex *lock = q->lock ? q->lock : vdev->lock;
 
 	return _vb2_fop_release(file, lock);
 }
@@ -1177,19 +1207,20 @@ ssize_t vb2_fop_write(struct file *file, const char __user *buf,
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
@@ -1201,20 +1232,21 @@ ssize_t vb2_fop_read(struct file *file, char __user *buf,
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
@@ -1225,7 +1257,7 @@ EXPORT_SYMBOL_GPL(vb2_fop_read);
 __poll_t vb2_fop_poll(struct file *file, poll_table *wait)
 {
 	struct video_device *vdev = video_devdata(file);
-	struct vb2_queue *q = vdev->queue;
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
 	struct mutex *lock = q->lock ? q->lock : vdev->lock;
 	__poll_t res;
 	void *fileio;
@@ -1241,7 +1273,7 @@ __poll_t vb2_fop_poll(struct file *file, poll_table *wait)
 
 	fileio = q->fileio;
 
-	res = vb2_poll(vdev->queue, file, wait);
+	res = vb2_poll(q, file, wait);
 
 	/* If fileio was started, then we have a new queue owner. */
 	if (!fileio && q->fileio)
@@ -1257,8 +1289,9 @@ unsigned long vb2_fop_get_unmapped_area(struct file *file, unsigned long addr,
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
2.49.0


