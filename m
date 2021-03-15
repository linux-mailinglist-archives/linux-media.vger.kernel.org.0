Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAF9433C46B
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 18:37:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236480AbhCORgq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 13:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236348AbhCORgT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 13:36:19 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F056C06175F
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 10:36:19 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id h13so18315669eds.5
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 10:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X07f5oq/2+/mAEWorfOs4s8HMYxxcmoe2RchXf2ZXmg=;
        b=fPYqnCK9/dsqcXrmrwTCai3+TaH5hqi39elSf/cJzSFIMWDVWtMP9iHtI5W8zUjTBy
         HLQF9Ta007Ww8jm+8iv/gHL5U0KcjGCMPj3fe5HnHLBDjPwkQvKIbkqzsGxv7zTxXpJB
         k4MkDW6xXNg5313gQcXnei1ZW0dFhmc/ywEkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X07f5oq/2+/mAEWorfOs4s8HMYxxcmoe2RchXf2ZXmg=;
        b=PZkjAtnyELzjo4IYbzi627jfXv3pAeXO4HtT+Kmv7kihBsIRB6DGYUTG+U/STvzefl
         5lQsT/8nLh/6VRuwZvLUKoWVkRp4cqGej1Q+F/xJbOELmx3eu1xcUzOQ/ywUt+diYU3U
         phSIF8JadmriBFxPzfo7ufrk1S/6OvHW5/dNhQHm6cgYq+d/lBv+dkBSLgMaphUTAel6
         Yj1VlwZpAUr/DInD0aWJ1kCv6v9IWkJb3IrUsTyzY3vEAW6ZTfFzw6bXCPYXtzdKVGRK
         m7N+1+dQtLWkZudsjsVBKYqgYCFHwpt75BuzdvmjiyAxMG6py3uom1bLS4KHpPCJAcWF
         SaHA==
X-Gm-Message-State: AOAM533n4LBVqxN/z1kYLJi9EFiPRMsFUqb6zHs2BO2LEo/IVtSyk7Of
        bSI0x0obxkOmdtmcADQ3la89Qg==
X-Google-Smtp-Source: ABdhPJwlUEseJPjEsFYSSKxwlargQ8n+ZQvC5KRpB8x0bfoRiy6+4fOZvx00VA4blqhCqGSQTF4flg==
X-Received: by 2002:aa7:cf90:: with SMTP id z16mr31248623edx.273.1615829777756;
        Mon, 15 Mar 2021 10:36:17 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id a3sm8109239ejv.40.2021.03.15.10.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 10:36:17 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v4 11/11] uvc: use vb2 ioctl and fop helpers
Date:   Mon, 15 Mar 2021 18:36:09 +0100
Message-Id: <20210315173609.1547857-12-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210315173609.1547857-1-ribalda@chromium.org>
References: <20210315173609.1547857-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil@xs4all.nl>

When uvc was written the vb2 ioctl and file operation helpers didn't exist.

This patch switches uvc over to those helpers, which removes a lot of boilerplate
code and simplifies VIDIOC_G/S_PRIORITY handling and allows us to drop the
'privileges' scheme, since that's now handled inside the vb2 helpers.

This makes it possible for uvc to pass the v4l2-compliance streaming tests.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/uvc/uvc_driver.c   |   7 +-
 drivers/media/usb/uvc/uvc_metadata.c |   8 +-
 drivers/media/usb/uvc/uvc_queue.c    | 131 -------------
 drivers/media/usb/uvc/uvc_v4l2.c     | 272 ++-------------------------
 drivers/media/usb/uvc/uvcvideo.h     |  28 ---
 5 files changed, 24 insertions(+), 422 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 73ab30891845..507b90061bd3 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1911,7 +1911,6 @@ static struct uvc_video_chain *uvc_alloc_chain(struct uvc_device *dev)
 	INIT_LIST_HEAD(&chain->entities);
 	mutex_init(&chain->ctrl_mutex);
 	chain->dev = dev;
-	v4l2_prio_init(&chain->prio);
 
 	return chain;
 }
@@ -2181,7 +2180,7 @@ int uvc_register_video_device(struct uvc_device *dev,
 	vdev->fops = fops;
 	vdev->ioctl_ops = ioctl_ops;
 	vdev->release = uvc_release;
-	vdev->prio = &stream->chain->prio;
+	vdev->queue = &queue->queue;
 	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		vdev->vfl_dir = VFL_DIR_TX;
 	else
@@ -2546,8 +2545,8 @@ static int __uvc_resume(struct usb_interface *intf, int reset)
 		if (stream->intf == intf) {
 			ret = uvc_video_resume(stream, reset);
 			if (ret < 0)
-				uvc_queue_streamoff(&stream->queue,
-						    stream->queue.queue.type);
+				vb2_streamoff(&stream->queue.queue,
+					      stream->queue.queue.type);
 			return ret;
 		}
 	}
diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index b6279ad7ac84..849d8e5ab75d 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -96,7 +96,7 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *fh,
 	 */
 	mutex_lock(&stream->mutex);
 
-	if (uvc_queue_allocated(&stream->queue))
+	if (vb2_is_busy(&stream->meta.queue.queue))
 		ret = -EBUSY;
 	else
 		stream->meta.format = fmt->dataformat;
@@ -164,12 +164,6 @@ int uvc_meta_register(struct uvc_streaming *stream)
 
 	stream->meta.format = V4L2_META_FMT_UVC;
 
-	/*
-	 * The video interface queue uses manual locking and thus does not set
-	 * the queue pointer. Set it manually here.
-	 */
-	vdev->queue = &queue->queue;
-
 	return uvc_register_video_device(dev, stream, vdev, queue,
 					 V4L2_BUF_TYPE_META_CAPTURE,
 					 &uvc_meta_fops, &uvc_meta_ioctl_ops);
diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 21a907d32bb7..fba9646c8ba5 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -247,115 +247,10 @@ int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type,
 	return 0;
 }
 
-void uvc_queue_release(struct uvc_video_queue *queue)
-{
-	mutex_lock(&queue->mutex);
-	vb2_queue_release(&queue->queue);
-	mutex_unlock(&queue->mutex);
-}
-
 /* -----------------------------------------------------------------------------
  * V4L2 queue operations
  */
 
-int uvc_request_buffers(struct uvc_video_queue *queue,
-			struct v4l2_requestbuffers *rb)
-{
-	int ret;
-
-	mutex_lock(&queue->mutex);
-	ret = vb2_reqbufs(&queue->queue, rb);
-	mutex_unlock(&queue->mutex);
-
-	return ret ? ret : rb->count;
-}
-
-int uvc_query_buffer(struct uvc_video_queue *queue, struct v4l2_buffer *buf)
-{
-	int ret;
-
-	mutex_lock(&queue->mutex);
-	ret = vb2_querybuf(&queue->queue, buf);
-	mutex_unlock(&queue->mutex);
-
-	return ret;
-}
-
-int uvc_create_buffers(struct uvc_video_queue *queue,
-		       struct v4l2_create_buffers *cb)
-{
-	int ret;
-
-	mutex_lock(&queue->mutex);
-	ret = vb2_create_bufs(&queue->queue, cb);
-	mutex_unlock(&queue->mutex);
-
-	return ret;
-}
-
-int uvc_queue_buffer(struct uvc_video_queue *queue,
-		     struct media_device *mdev, struct v4l2_buffer *buf)
-{
-	int ret;
-
-	mutex_lock(&queue->mutex);
-	ret = vb2_qbuf(&queue->queue, mdev, buf);
-	mutex_unlock(&queue->mutex);
-
-	return ret;
-}
-
-int uvc_export_buffer(struct uvc_video_queue *queue,
-		      struct v4l2_exportbuffer *exp)
-{
-	int ret;
-
-	mutex_lock(&queue->mutex);
-	ret = vb2_expbuf(&queue->queue, exp);
-	mutex_unlock(&queue->mutex);
-
-	return ret;
-}
-
-int uvc_dequeue_buffer(struct uvc_video_queue *queue, struct v4l2_buffer *buf,
-		       int nonblocking)
-{
-	int ret;
-
-	mutex_lock(&queue->mutex);
-	ret = vb2_dqbuf(&queue->queue, buf, nonblocking);
-	mutex_unlock(&queue->mutex);
-
-	return ret;
-}
-
-int uvc_queue_streamon(struct uvc_video_queue *queue, enum v4l2_buf_type type)
-{
-	int ret;
-
-	mutex_lock(&queue->mutex);
-	ret = vb2_streamon(&queue->queue, type);
-	mutex_unlock(&queue->mutex);
-
-	return ret;
-}
-
-int uvc_queue_streamoff(struct uvc_video_queue *queue, enum v4l2_buf_type type)
-{
-	int ret;
-
-	mutex_lock(&queue->mutex);
-	ret = vb2_streamoff(&queue->queue, type);
-	mutex_unlock(&queue->mutex);
-
-	return ret;
-}
-
-int uvc_queue_mmap(struct uvc_video_queue *queue, struct vm_area_struct *vma)
-{
-	return vb2_mmap(&queue->queue, vma);
-}
-
 #ifndef CONFIG_MMU
 unsigned long uvc_queue_get_unmapped_area(struct uvc_video_queue *queue,
 		unsigned long pgoff)
@@ -364,36 +259,10 @@ unsigned long uvc_queue_get_unmapped_area(struct uvc_video_queue *queue,
 }
 #endif
 
-__poll_t uvc_queue_poll(struct uvc_video_queue *queue, struct file *file,
-			    poll_table *wait)
-{
-	__poll_t ret;
-
-	mutex_lock(&queue->mutex);
-	ret = vb2_poll(&queue->queue, file, wait);
-	mutex_unlock(&queue->mutex);
-
-	return ret;
-}
-
 /* -----------------------------------------------------------------------------
  *
  */
 
-/*
- * Check if buffers have been allocated.
- */
-int uvc_queue_allocated(struct uvc_video_queue *queue)
-{
-	int allocated;
-
-	mutex_lock(&queue->mutex);
-	allocated = vb2_is_busy(&queue->queue);
-	mutex_unlock(&queue->mutex);
-
-	return allocated;
-}
-
 /*
  * Cancel the video buffers queue.
  *
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 6c1b037a751b..348a46637852 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -346,17 +346,13 @@ static int uvc_v4l2_set_format(struct uvc_streaming *stream,
 		return ret;
 
 	mutex_lock(&stream->mutex);
-
-	if (uvc_queue_allocated(&stream->queue)) {
+	if (vb2_is_busy(&stream->queue.queue)) {
 		ret = -EBUSY;
-		goto done;
+	} else {
+		stream->ctrl = probe;
+		stream->cur_format = format;
+		stream->cur_frame = frame;
 	}
-
-	stream->ctrl = probe;
-	stream->cur_format = format;
-	stream->cur_frame = frame;
-
-done:
 	mutex_unlock(&stream->mutex);
 	return ret;
 }
@@ -483,62 +479,6 @@ static int uvc_v4l2_set_streamparm(struct uvc_streaming *stream,
 	return 0;
 }
 
-/* ------------------------------------------------------------------------
- * Privilege management
- */
-
-/*
- * Privilege management is the multiple-open implementation basis. The current
- * implementation is completely transparent for the end-user and doesn't
- * require explicit use of the VIDIOC_G_PRIORITY and VIDIOC_S_PRIORITY ioctls.
- * Those ioctls enable finer control on the device (by making possible for a
- * user to request exclusive access to a device), but are not mature yet.
- * Switching to the V4L2 priority mechanism might be considered in the future
- * if this situation changes.
- *
- * Each open instance of a UVC device can either be in a privileged or
- * unprivileged state. Only a single instance can be in a privileged state at
- * a given time. Trying to perform an operation that requires privileges will
- * automatically acquire the required privileges if possible, or return -EBUSY
- * otherwise. Privileges are dismissed when closing the instance or when
- * freeing the video buffers using VIDIOC_REQBUFS.
- *
- * Operations that require privileges are:
- *
- * - VIDIOC_S_INPUT
- * - VIDIOC_S_PARM
- * - VIDIOC_S_FMT
- * - VIDIOC_REQBUFS
- */
-static int uvc_acquire_privileges(struct uvc_fh *handle)
-{
-	/* Always succeed if the handle is already privileged. */
-	if (handle->state == UVC_HANDLE_ACTIVE)
-		return 0;
-
-	/* Check if the device already has a privileged handle. */
-	if (atomic_inc_return(&handle->stream->active) != 1) {
-		atomic_dec(&handle->stream->active);
-		return -EBUSY;
-	}
-
-	handle->state = UVC_HANDLE_ACTIVE;
-	return 0;
-}
-
-static void uvc_dismiss_privileges(struct uvc_fh *handle)
-{
-	if (handle->state == UVC_HANDLE_ACTIVE)
-		atomic_dec(&handle->stream->active);
-
-	handle->state = UVC_HANDLE_PASSIVE;
-}
-
-static int uvc_has_privileges(struct uvc_fh *handle)
-{
-	return handle->state == UVC_HANDLE_ACTIVE;
-}
-
 /* ------------------------------------------------------------------------
  * V4L2 file operations
  */
@@ -581,7 +521,6 @@ static int uvc_v4l2_open(struct file *file)
 	v4l2_fh_add(&handle->vfh);
 	handle->chain = stream->chain;
 	handle->stream = stream;
-	handle->state = UVC_HANDLE_PASSIVE;
 	file->private_data = handle;
 
 	return 0;
@@ -594,15 +533,8 @@ static int uvc_v4l2_release(struct file *file)
 
 	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
 
-	/* Only free resources if this is a privileged handle. */
-	if (uvc_has_privileges(handle))
-		uvc_queue_release(&stream->queue);
-
 	/* Release the file handle. */
-	uvc_dismiss_privileges(handle);
-	v4l2_fh_del(&handle->vfh);
-	v4l2_fh_exit(&handle->vfh);
-	kfree(handle);
+	vb2_fop_release(file);
 	file->private_data = NULL;
 
 	mutex_lock(&stream->dev->lock);
@@ -695,11 +627,6 @@ static int uvc_ioctl_s_fmt_vid_cap(struct file *file, void *fh,
 {
 	struct uvc_fh *handle = fh;
 	struct uvc_streaming *stream = handle->stream;
-	int ret;
-
-	ret = uvc_acquire_privileges(handle);
-	if (ret < 0)
-		return ret;
 
 	return uvc_v4l2_set_format(stream, fmt);
 }
@@ -709,11 +636,6 @@ static int uvc_ioctl_s_fmt_vid_out(struct file *file, void *fh,
 {
 	struct uvc_fh *handle = fh;
 	struct uvc_streaming *stream = handle->stream;
-	int ret;
-
-	ret = uvc_acquire_privileges(handle);
-	if (ret < 0)
-		return ret;
 
 	return uvc_v4l2_set_format(stream, fmt);
 }
@@ -738,124 +660,6 @@ static int uvc_ioctl_try_fmt_vid_out(struct file *file, void *fh,
 	return uvc_v4l2_try_format(stream, fmt, &probe, NULL, NULL);
 }
 
-static int uvc_ioctl_reqbufs(struct file *file, void *fh,
-			     struct v4l2_requestbuffers *rb)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_streaming *stream = handle->stream;
-	int ret;
-
-	ret = uvc_acquire_privileges(handle);
-	if (ret < 0)
-		return ret;
-
-	mutex_lock(&stream->mutex);
-	ret = uvc_request_buffers(&stream->queue, rb);
-	mutex_unlock(&stream->mutex);
-	if (ret < 0)
-		return ret;
-
-	if (ret == 0)
-		uvc_dismiss_privileges(handle);
-
-	return 0;
-}
-
-static int uvc_ioctl_querybuf(struct file *file, void *fh,
-			      struct v4l2_buffer *buf)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_streaming *stream = handle->stream;
-
-	if (!uvc_has_privileges(handle))
-		return -EBUSY;
-
-	return uvc_query_buffer(&stream->queue, buf);
-}
-
-static int uvc_ioctl_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_streaming *stream = handle->stream;
-
-	if (!uvc_has_privileges(handle))
-		return -EBUSY;
-
-	return uvc_queue_buffer(&stream->queue,
-				stream->vdev.v4l2_dev->mdev, buf);
-}
-
-static int uvc_ioctl_expbuf(struct file *file, void *fh,
-			    struct v4l2_exportbuffer *exp)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_streaming *stream = handle->stream;
-
-	if (!uvc_has_privileges(handle))
-		return -EBUSY;
-
-	return uvc_export_buffer(&stream->queue, exp);
-}
-
-static int uvc_ioctl_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_streaming *stream = handle->stream;
-
-	if (!uvc_has_privileges(handle))
-		return -EBUSY;
-
-	return uvc_dequeue_buffer(&stream->queue, buf,
-				  file->f_flags & O_NONBLOCK);
-}
-
-static int uvc_ioctl_create_bufs(struct file *file, void *fh,
-				  struct v4l2_create_buffers *cb)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_streaming *stream = handle->stream;
-	int ret;
-
-	ret = uvc_acquire_privileges(handle);
-	if (ret < 0)
-		return ret;
-
-	return uvc_create_buffers(&stream->queue, cb);
-}
-
-static int uvc_ioctl_streamon(struct file *file, void *fh,
-			      enum v4l2_buf_type type)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_streaming *stream = handle->stream;
-	int ret;
-
-	if (!uvc_has_privileges(handle))
-		return -EBUSY;
-
-	mutex_lock(&stream->mutex);
-	ret = uvc_queue_streamon(&stream->queue, type);
-	mutex_unlock(&stream->mutex);
-
-	return ret;
-}
-
-static int uvc_ioctl_streamoff(struct file *file, void *fh,
-			       enum v4l2_buf_type type)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_streaming *stream = handle->stream;
-
-	if (!uvc_has_privileges(handle))
-		return -EBUSY;
-
-	mutex_lock(&stream->mutex);
-	uvc_queue_streamoff(&stream->queue, type);
-	mutex_unlock(&stream->mutex);
-
-	return 0;
-}
-
 static int uvc_ioctl_enum_input(struct file *file, void *fh,
 				struct v4l2_input *input)
 {
@@ -923,13 +727,12 @@ static int uvc_ioctl_g_input(struct file *file, void *fh, unsigned int *input)
 static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
 {
 	struct uvc_fh *handle = fh;
+	struct uvc_streaming *stream = handle->stream;
 	struct uvc_video_chain *chain = handle->chain;
-	int ret;
 	u32 i;
 
-	ret = uvc_acquire_privileges(handle);
-	if (ret < 0)
-		return ret;
+	if (vb2_is_busy(&stream->queue.queue))
+		return -EBUSY;
 
 	if (chain->selector == NULL ||
 	    (chain->dev->quirks & UVC_QUIRK_IGNORE_SELECTOR_UNIT)) {
@@ -1190,11 +993,6 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
 {
 	struct uvc_fh *handle = fh;
 	struct uvc_streaming *stream = handle->stream;
-	int ret;
-
-	ret = uvc_acquire_privileges(handle);
-	if (ret < 0)
-		return ret;
 
 	return uvc_v4l2_set_streamparm(stream, parm);
 }
@@ -1462,36 +1260,6 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 }
 #endif
 
-static ssize_t uvc_v4l2_read(struct file *file, char __user *data,
-		    size_t count, loff_t *ppos)
-{
-	struct uvc_fh *handle = file->private_data;
-	struct uvc_streaming *stream = handle->stream;
-
-	uvc_dbg(stream->dev, CALLS, "%s: not implemented\n", __func__);
-	return -EINVAL;
-}
-
-static int uvc_v4l2_mmap(struct file *file, struct vm_area_struct *vma)
-{
-	struct uvc_fh *handle = file->private_data;
-	struct uvc_streaming *stream = handle->stream;
-
-	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
-
-	return uvc_queue_mmap(&stream->queue, vma);
-}
-
-static __poll_t uvc_v4l2_poll(struct file *file, poll_table *wait)
-{
-	struct uvc_fh *handle = file->private_data;
-	struct uvc_streaming *stream = handle->stream;
-
-	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
-
-	return uvc_queue_poll(&stream->queue, file, wait);
-}
-
 #ifndef CONFIG_MMU
 static unsigned long uvc_v4l2_get_unmapped_area(struct file *file,
 		unsigned long addr, unsigned long len, unsigned long pgoff,
@@ -1516,14 +1284,15 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
 	.vidioc_s_fmt_vid_out = uvc_ioctl_s_fmt_vid_out,
 	.vidioc_try_fmt_vid_cap = uvc_ioctl_try_fmt_vid_cap,
 	.vidioc_try_fmt_vid_out = uvc_ioctl_try_fmt_vid_out,
-	.vidioc_reqbufs = uvc_ioctl_reqbufs,
-	.vidioc_querybuf = uvc_ioctl_querybuf,
-	.vidioc_qbuf = uvc_ioctl_qbuf,
-	.vidioc_expbuf = uvc_ioctl_expbuf,
-	.vidioc_dqbuf = uvc_ioctl_dqbuf,
-	.vidioc_create_bufs = uvc_ioctl_create_bufs,
-	.vidioc_streamon = uvc_ioctl_streamon,
-	.vidioc_streamoff = uvc_ioctl_streamoff,
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
 	.vidioc_enum_input = uvc_ioctl_enum_input,
 	.vidioc_g_input = uvc_ioctl_g_input,
 	.vidioc_s_input = uvc_ioctl_s_input,
@@ -1553,9 +1322,8 @@ const struct v4l2_file_operations uvc_fops = {
 #ifdef CONFIG_COMPAT
 	.compat_ioctl32	= uvc_v4l2_compat_ioctl32,
 #endif
-	.read		= uvc_v4l2_read,
-	.mmap		= uvc_v4l2_mmap,
-	.poll		= uvc_v4l2_poll,
+	.mmap		= vb2_fop_mmap,
+	.poll		= vb2_fop_poll,
 #ifndef CONFIG_MMU
 	.get_unmapped_area = uvc_v4l2_get_unmapped_area,
 #endif
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 91fc00ff311b..4e6f0a25b940 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -478,7 +478,6 @@ struct uvc_video_chain {
 
 	struct mutex ctrl_mutex;		/* Protects ctrl.info */
 
-	struct v4l2_prio_state prio;		/* V4L2 priority state */
 	u32 caps;				/* V4L2 chain-wide caps */
 	u8 ctrl_class_bitmap;			/* Bitmap of valid classes */
 };
@@ -715,16 +714,10 @@ struct uvc_device {
 	struct uvc_entity *gpio_unit;
 };
 
-enum uvc_handle_state {
-	UVC_HANDLE_PASSIVE	= 0,
-	UVC_HANDLE_ACTIVE	= 1,
-};
-
 struct uvc_fh {
 	struct v4l2_fh vfh;
 	struct uvc_video_chain *chain;
 	struct uvc_streaming *stream;
-	enum uvc_handle_state state;
 };
 
 struct uvc_driver {
@@ -789,36 +782,15 @@ struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
 /* Video buffers queue management. */
 int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type,
 		   int drop_corrupted);
-void uvc_queue_release(struct uvc_video_queue *queue);
-int uvc_request_buffers(struct uvc_video_queue *queue,
-			struct v4l2_requestbuffers *rb);
-int uvc_query_buffer(struct uvc_video_queue *queue,
-		     struct v4l2_buffer *v4l2_buf);
-int uvc_create_buffers(struct uvc_video_queue *queue,
-		       struct v4l2_create_buffers *v4l2_cb);
-int uvc_queue_buffer(struct uvc_video_queue *queue,
-		     struct media_device *mdev,
-		     struct v4l2_buffer *v4l2_buf);
-int uvc_export_buffer(struct uvc_video_queue *queue,
-		      struct v4l2_exportbuffer *exp);
-int uvc_dequeue_buffer(struct uvc_video_queue *queue,
-		       struct v4l2_buffer *v4l2_buf, int nonblocking);
-int uvc_queue_streamon(struct uvc_video_queue *queue, enum v4l2_buf_type type);
-int uvc_queue_streamoff(struct uvc_video_queue *queue, enum v4l2_buf_type type);
 void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect);
 struct uvc_buffer *uvc_queue_next_buffer(struct uvc_video_queue *queue,
 					 struct uvc_buffer *buf);
 struct uvc_buffer *uvc_queue_get_current_buffer(struct uvc_video_queue *queue);
 void uvc_queue_buffer_release(struct uvc_buffer *buf);
-int uvc_queue_mmap(struct uvc_video_queue *queue,
-		   struct vm_area_struct *vma);
-__poll_t uvc_queue_poll(struct uvc_video_queue *queue, struct file *file,
-			poll_table *wait);
 #ifndef CONFIG_MMU
 unsigned long uvc_queue_get_unmapped_area(struct uvc_video_queue *queue,
 					  unsigned long pgoff);
 #endif
-int uvc_queue_allocated(struct uvc_video_queue *queue);
 static inline int uvc_queue_streaming(struct uvc_video_queue *queue)
 {
 	return vb2_is_streaming(&queue->queue);
-- 
2.31.0.rc2.261.g7f71774620-goog

