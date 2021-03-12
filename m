Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19BBC338949
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 10:54:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232999AbhCLJxx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 04:53:53 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:40917 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232834AbhCLJxY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 04:53:24 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id KeTvl0IRb4ywlKeTyl2dIc; Fri, 12 Mar 2021 10:53:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615542802; bh=KEWQsieeTyxWnpT1S5qFInvJrZR6coUH0t+4vTasy0E=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MbMhGhrGulNANkrQekN/L0S3D9v4DWoTl/F8VO0aC41mNZYBGZfungou4hdwOpyzi
         QN51SwbQoMQ4VQX2veW0sD6Kqp4ovttBPKL9Xn9d5P6h8vdZ0eMpdA5gIziaszFRk2
         OIt7LoBe9Thr0gHqo2kppCTwe9NDdzed/pkEUTAA6BqcLQWLE1SqBGi6wbbcloV9Ko
         HtGU552LdrzWwXT7nM7/ba1wHshmEcX/w8c8d4Mv3qXTdkc0ibrhL2N6QfepPhEe7O
         iiNRlQxo4m7F8v3CSf6KiNhFAga0XxCwTk427HYCO1aO13Q5t5Ofp6AcmMNpVMn/4Z
         P1EMY8RZlUreQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [RFC PATCH] uvc: use vb2 ioctl and fop helpers
Message-ID: <a3d9fd70-c219-de46-8938-ba99da6dd770@xs4all.nl>
Date:   Fri, 12 Mar 2021 10:53:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfL934bnUdPkDBE+egfJLGfmtjDuRld+xtLTMMhdpqfEAw01uGHOyWRuzcpDpMW77RDAnRYhoFpi4maRVP6w4fbI938BOREO8/UrUC+iJt4lz/GWFdwe7
 zluRN2zNPVGkb961c3usfmyIwOwsRtNdB3VmwJRUwtD2sXHfhf9XRg4cyU4aVxVQPyH84AVxpACYwUht7FGmo5s+XmGkuxutlaPALF8i8Ygyoky2PWqgQTuw
 bpwtpFPMTT9GqKi8whOc/2KxTJs/cV3Yi6jOssPtNlA/ecn4Z/YJjmQR2EYH9ciV
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When uvc was written the vb2 ioctl and file operation helpers didn't exist.

This patch switches uvc over to those helpers, which removes a lot of boilerplate
code and simplifies VIDIOC_G/S_PRIORITY handling and allows us to drop the
'privileges' scheme, since that's now handled inside the vb2 helpers.

This makes it possible for uvc to pass the v4l2-compliance streaming tests.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
TODO:
- vb2_fop_get_unmapped_area() should probably be used as well
- verify suspend/resume
- for extra bonus points: test if unbind of the driver works while streaming
---
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 30ef2a3110f7..ef199e309947 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1911,7 +1911,6 @@ static struct uvc_video_chain *uvc_alloc_chain(struct uvc_device *dev)
 	INIT_LIST_HEAD(&chain->entities);
 	mutex_init(&chain->ctrl_mutex);
 	chain->dev = dev;
-	v4l2_prio_init(&chain->prio);

 	return chain;
 }
@@ -2180,7 +2179,7 @@ int uvc_register_video_device(struct uvc_device *dev,
 	vdev->fops = fops;
 	vdev->ioctl_ops = ioctl_ops;
 	vdev->release = uvc_release;
-	vdev->prio = &stream->chain->prio;
+	vdev->queue = &stream->queue.queue;
 	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		vdev->vfl_dir = VFL_DIR_TX;
 	else
@@ -2541,8 +2540,8 @@ static int __uvc_resume(struct usb_interface *intf, int reset)
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
index b6279ad7ac84..16e968b54fe0 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -96,7 +96,7 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *fh,
 	 */
 	mutex_lock(&stream->mutex);

-	if (uvc_queue_allocated(&stream->queue))
+	if (vb2_is_busy(&stream->queue.queue))
 		ret = -EBUSY;
 	else
 		stream->meta.format = fmt->dataformat;
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
index 252136cc885c..13ff1c9590c2 100644
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
@@ -480,62 +476,6 @@ static int uvc_v4l2_set_streamparm(struct uvc_streaming *stream,
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
@@ -578,7 +518,6 @@ static int uvc_v4l2_open(struct file *file)
 	v4l2_fh_add(&handle->vfh);
 	handle->chain = stream->chain;
 	handle->stream = stream;
-	handle->state = UVC_HANDLE_PASSIVE;
 	file->private_data = handle;

 	return 0;
@@ -591,15 +530,8 @@ static int uvc_v4l2_release(struct file *file)

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
@@ -693,11 +625,6 @@ static int uvc_ioctl_s_fmt_vid_cap(struct file *file, void *fh,
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
@@ -707,11 +634,6 @@ static int uvc_ioctl_s_fmt_vid_out(struct file *file, void *fh,
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
@@ -736,124 +658,6 @@ static int uvc_ioctl_try_fmt_vid_out(struct file *file, void *fh,
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
@@ -921,13 +725,12 @@ static int uvc_ioctl_g_input(struct file *file, void *fh, unsigned int *input)
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
@@ -1187,11 +990,6 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
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
@@ -1459,36 +1257,6 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
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
@@ -1513,14 +1281,15 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
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
@@ -1550,9 +1319,8 @@ const struct v4l2_file_operations uvc_fops = {
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
index 97df5ecd66c9..969eb43a597b 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -473,7 +473,6 @@ struct uvc_video_chain {

 	struct mutex ctrl_mutex;		/* Protects ctrl.info */

-	struct v4l2_prio_state prio;		/* V4L2 priority state */
 	u32 caps;				/* V4L2 chain-wide caps */
 };

@@ -709,16 +708,10 @@ struct uvc_device {
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
@@ -783,36 +776,15 @@ struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
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
