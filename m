Return-Path: <linux-media+bounces-36382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE8DAEEF24
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 08:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DA4E177E0E
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 06:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF3925F962;
	Tue,  1 Jul 2025 06:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ba/WV1Oz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9615B2BCFB
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 06:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751352330; cv=none; b=S8MnMK7WMY/2YeQPRfKwtz3bD5P4b+O9/J8H0SgHCpdcHRI3yYwQ+IbkVQD08LWnaYuafP4sdgsYlRn7OB53WiRh9P3ah7JBxzF93EiuwmWVwGgk5orcD7idpst7SFT2C5uGhe946mkhtumHYzUeX/TReeLZtS8jMQMJ2zcwKQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751352330; c=relaxed/simple;
	bh=ksdsuPOKtC1LX3xTsWx2D7Y+HomI7lOkC104d/s180U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mj4Hs5lIc+cBv7O7LMQx45MCvwGgCu7GhQVlGui01imYtguuc15xcM+Yy4CfdU/1ivTBltnGIToDUAWWX3fQEk57ge6uOkyRazst4RZLosVIyzQZZ5MdFtASCrVsDOOty+PbF6v22owOo0oMsZEO5TGSI3ygqvc7dYacFxymx2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ba/WV1Oz; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54d98aa5981so4326180e87.0
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 23:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751352324; x=1751957124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oAr8Ssh5T1mxHeb8g5LvgIUHQP1PrvIymeg1Z4t2fGg=;
        b=ba/WV1OzZTeiFTBPv7id/p8Y+8fMRR3gpemqnDM8stkzxZtDth0vttPwxh6O11IaMm
         gzjEoEcd2Ckatmtuqt/UtRZBoorOK7Iy+AC2T9hu6UJl1Kplvepa3at852T/xPEEANZw
         DZs0ZSRNtL/1mcV4vL5g6XFfCoP1UtGspjSxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751352324; x=1751957124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAr8Ssh5T1mxHeb8g5LvgIUHQP1PrvIymeg1Z4t2fGg=;
        b=lhkuq/BjRHzdZpabJEKcF/9Rp7BAcIOLDcvMZXSRTWog0Kbs3CPesPg2nMVyuWtDyf
         kxrExsWyFhLUmKZIO1A/Tu1gx1fk6/pCRmxypepjSoFxfY3fknzg1iSrFmofaAFohtcX
         HqCfp6jB0CsV3mn4RBekZNMk/qWlmRBZ/EJGMtCOoLFXRB9J4QuXa9hoshgcHP82H7t3
         OEbJU2IQcjH5i6n57955N1zm4Si2WNXHYM2gYrQAhFJr2gfBiS4Y1wnuJa11D0MVFrKA
         nL0UJnQAJCUhe/+4f7vDNPqFlToqHFaZIsxfeWECt3MgFBdJlHI0ussCUt43AMhfLjhl
         oOFg==
X-Gm-Message-State: AOJu0YznM19JdhodHje7kQvwW55SQYOcF9j0G/XpBlrUV1sJPRRr2k0f
	Smb5T3fEOciRDztx+IswDZax4CA+Osv0o3TBefxLS6ERLcwUJjxh9TivrTaP4XN4jw==
X-Gm-Gg: ASbGncuRj+lWGEXLpppkhcRub8+4iu4T+PgAqMzOUeEN6Ro9PmoVWzje/BlW9pRAaJG
	Xe+Npm15Qf35yfdbzp/Gw+1SCh+2sW6H58BZoC337YkGzJ6a86OCWZ8xGFHAWLDmbtOGRExqShY
	MBpLdBkT+gdY662oftHCnK2LIcgOr5zrubNEWK1bBKwexIWt+JwDdoc3uaiPiWJBhpdFL1JGvYE
	qRv2Sdzx3N3CCJ6xYXyJ+ApGgSuC3omuCYU/1ZJ2Is39myjJF9lk1+Wo8KjZRfNx2ztTzRpr5Og
	JZ06n7P7/NrqLy+uheGwGOc0oW7FPBH0VgHHXsV2577Lkb6yK03ygKGZ2TAREpwTqupkDS8DNzy
	bjIAa2QcCorBww8P99gViJczZrlOGATru4JekUVihO/r2a3GLPAdc
X-Google-Smtp-Source: AGHT+IGKyqF+jMb677mgfV7M01bOGoWj0ty6vFV0pKurbZGn45gqO6qgTCykWm6wG/zFa3SkW/swmw==
X-Received: by 2002:a05:6512:3156:b0:553:34b7:5731 with SMTP id 2adb3069b0e04-5550b7eccf9mr4525970e87.3.1751352324334;
        Mon, 30 Jun 2025 23:45:24 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1704836e87.248.2025.06.30.23.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 23:45:23 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 01 Jul 2025 06:45:13 +0000
Subject: [PATCH v4 1/7] media: uvcvideo: Use vb2 ioctl and fop helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-uvc-grannular-invert-v4-1-8003b9b89f68@chromium.org>
References: <20250701-uvc-grannular-invert-v4-0-8003b9b89f68@chromium.org>
In-Reply-To: <20250701-uvc-grannular-invert-v4-0-8003b9b89f68@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hans@jjverkuil.nl>
X-Mailer: b4 0.14.2

From: Hans Verkuil <hans@jjverkuil.nl>

When uvc was written the vb2 ioctl and file operation helpers didn't exist.

This patch switches uvc over to those helpers, which removes a lot of
boilerplate code and allows us to drop the 'privileges' scheme, since
that's now handled inside the vb2 helpers.

This makes it possible for uvc to fix the v4l2-compliance streaming tests:
 warn: v4l2-test-formats.cpp(1075): Could not set fmt2

This patch introduces a change on behavior on the uvcdriver to be
aligned with the rest of the subsystem. Now S_INPUT, S_PARM and
S_FORMAT do no grant exclusive ownership of the device.

There are other side effects, some better than others:
- Locking is now more coarse than before, the queue is locked for almost
  every ioctl.
- vidioc_querybuf() can now work when the queue is busy.

Future patches should look into the locking architecture of UVC to
remove one of stream->mutex or queue->mutex.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Hans Verkuil <hans@jjverkuil.nl>
Co-developed-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Link: https://lore.kernel.org/r/20250616-uvc-fop-v4-1-250286570ee7@chromium.org
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/usb/uvc/uvc_driver.c   |  37 ++---
 drivers/media/usb/uvc/uvc_metadata.c |   8 +-
 drivers/media/usb/uvc/uvc_queue.c    | 143 --------------------
 drivers/media/usb/uvc/uvc_v4l2.c     | 252 +++--------------------------------
 drivers/media/usb/uvc/uvcvideo.h     |  36 +----
 5 files changed, 34 insertions(+), 442 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 62eb45435d8bec5c955720ecb46fb8936871e6cc..accfb4ca3c72cb899185ddc8ecf4e29143d58fc6 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1961,31 +1961,7 @@ static void uvc_unregister_video(struct uvc_device *dev)
 		if (!video_is_registered(&stream->vdev))
 			continue;
 
-		/*
-		 * For stream->vdev we follow the same logic as:
-		 * vb2_video_unregister_device().
-		 */
-
-		/* 1. Take a reference to vdev */
-		get_device(&stream->vdev.dev);
-
-		/* 2. Ensure that no new ioctls can be called. */
-		video_unregister_device(&stream->vdev);
-
-		/* 3. Wait for old ioctls to finish. */
-		mutex_lock(&stream->mutex);
-
-		/* 4. Stop streaming. */
-		uvc_queue_release(&stream->queue);
-
-		mutex_unlock(&stream->mutex);
-
-		put_device(&stream->vdev.dev);
-
-		/*
-		 * For stream->meta.vdev we can directly call:
-		 * vb2_video_unregister_device().
-		 */
+		vb2_video_unregister_device(&stream->vdev);
 		vb2_video_unregister_device(&stream->meta.vdev);
 
 		/*
@@ -2033,6 +2009,8 @@ int uvc_register_video_device(struct uvc_device *dev,
 	vdev->ioctl_ops = ioctl_ops;
 	vdev->release = uvc_release;
 	vdev->prio = &stream->chain->prio;
+	vdev->queue = &queue->queue;
+	vdev->lock = &queue->mutex;
 	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		vdev->vfl_dir = VFL_DIR_TX;
 	else
@@ -2397,9 +2375,12 @@ static int __uvc_resume(struct usb_interface *intf, int reset)
 	list_for_each_entry(stream, &dev->streams, list) {
 		if (stream->intf == intf) {
 			ret = uvc_video_resume(stream, reset);
-			if (ret < 0)
-				uvc_queue_streamoff(&stream->queue,
-						    stream->queue.queue.type);
+			if (ret < 0) {
+				mutex_lock(&stream->queue.mutex);
+				vb2_streamoff(&stream->queue.queue,
+					      stream->queue.queue.type);
+				mutex_unlock(&stream->queue.mutex);
+			}
 			return ret;
 		}
 	}
diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 82de7781f5b6b70c5ba16bcba9e0741231231904..d3aab22f91cea21aefc56409924dfa1451aec914 100644
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
index 2ee142621042167c2587b6a6fdd51c1a46d31c11..72c5494dee9f46ff61072e7d293bfaddda40e615 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -242,153 +242,10 @@ int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)
 	return 0;
 }
 
-void uvc_queue_release(struct uvc_video_queue *queue)
-{
-	mutex_lock(&queue->mutex);
-	vb2_queue_release(&queue->queue);
-	mutex_unlock(&queue->mutex);
-}
-
-/* -----------------------------------------------------------------------------
- * V4L2 queue operations
- */
-
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
-#ifndef CONFIG_MMU
-unsigned long uvc_queue_get_unmapped_area(struct uvc_video_queue *queue,
-		unsigned long pgoff)
-{
-	return vb2_get_unmapped_area(&queue->queue, 0, 0, pgoff, 0);
-}
-#endif
-
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
index 1abdf1ea39956bbbadd3f166f37bdac518068648..d06ecf3418a988152c6c413568ce32e60040fd87 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -47,8 +47,6 @@ void uvc_pm_put(struct uvc_device *dev)
 	usb_autopm_put_interface(dev->intf);
 }
 
-static int uvc_acquire_privileges(struct uvc_fh *handle);
-
 static int uvc_control_add_xu_mapping(struct uvc_video_chain *chain,
 				      struct uvc_control_mapping *map,
 				      const struct uvc_xu_control_mapping *xmap)
@@ -436,10 +434,6 @@ static int uvc_ioctl_s_fmt(struct file *file, void *fh,
 	const struct uvc_frame *frame;
 	int ret;
 
-	ret = uvc_acquire_privileges(handle);
-	if (ret < 0)
-		return ret;
-
 	if (fmt->type != stream->type)
 		return -EINVAL;
 
@@ -448,8 +442,7 @@ static int uvc_ioctl_s_fmt(struct file *file, void *fh,
 		return ret;
 
 	mutex_lock(&stream->mutex);
-
-	if (uvc_queue_allocated(&stream->queue)) {
+	if (vb2_is_busy(&stream->queue.queue)) {
 		ret = -EBUSY;
 		goto done;
 	}
@@ -513,10 +506,6 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
 	unsigned int i;
 	int ret;
 
-	ret = uvc_acquire_privileges(handle);
-	if (ret < 0)
-		return ret;
-
 	if (parm->type != stream->type)
 		return -EINVAL;
 
@@ -593,63 +582,6 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
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
- * - VIDIOC_CREATE_BUFS
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
@@ -671,7 +603,6 @@ static int uvc_v4l2_open(struct file *file)
 	v4l2_fh_add(&handle->vfh);
 	handle->chain = stream->chain;
 	handle->stream = stream;
-	handle->state = UVC_HANDLE_PASSIVE;
 	file->private_data = handle;
 
 	return 0;
@@ -686,19 +617,11 @@ static int uvc_v4l2_release(struct file *file)
 
 	uvc_ctrl_cleanup_fh(handle);
 
-	/* Only free resources if this is a privileged handle. */
-	if (uvc_has_privileges(handle))
-		uvc_queue_release(&stream->queue);
-
 	if (handle->is_streaming)
 		uvc_pm_put(stream->dev);
 
 	/* Release the file handle. */
-	uvc_dismiss_privileges(handle);
-	v4l2_fh_del(&handle->vfh);
-	v4l2_fh_exit(&handle->vfh);
-	kfree(handle);
-	file->private_data = NULL;
+	vb2_fop_release(file);
 
 	return 0;
 }
@@ -753,91 +676,6 @@ static int uvc_ioctl_try_fmt(struct file *file, void *fh,
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
 static int uvc_ioctl_streamon(struct file *file, void *fh,
 			      enum v4l2_buf_type type)
 {
@@ -845,11 +683,6 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
 	struct uvc_streaming *stream = handle->stream;
 	int ret;
 
-	if (!uvc_has_privileges(handle))
-		return -EBUSY;
-
-	guard(mutex)(&stream->mutex);
-
 	if (handle->is_streaming)
 		return 0;
 
@@ -857,7 +690,7 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
 	if (ret)
 		return ret;
 
-	ret = uvc_queue_streamon(&stream->queue, type);
+	ret = vb2_ioctl_streamon(file, fh, type);
 	if (ret) {
 		uvc_pm_put(stream->dev);
 		return ret;
@@ -873,13 +706,12 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
 {
 	struct uvc_fh *handle = fh;
 	struct uvc_streaming *stream = handle->stream;
+	int ret;
 
-	if (!uvc_has_privileges(handle))
-		return -EBUSY;
-
-	guard(mutex)(&stream->mutex);
+	ret = vb2_ioctl_streamoff(file, fh, type);
+	if (ret)
+		return ret;
 
-	uvc_queue_streamoff(&stream->queue, type);
 	if (handle->is_streaming) {
 		handle->is_streaming = false;
 		uvc_pm_put(stream->dev);
@@ -962,13 +794,13 @@ static int uvc_ioctl_g_input(struct file *file, void *fh, unsigned int *input)
 static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
 {
 	struct uvc_fh *handle = fh;
+	struct uvc_streaming *stream = handle->stream;
 	struct uvc_video_chain *chain = handle->chain;
 	u8 *buf;
 	int ret;
 
-	ret = uvc_acquire_privileges(handle);
-	if (ret < 0)
-		return ret;
+	if (vb2_is_busy(&stream->queue.queue))
+		return -EBUSY;
 
 	if (chain->selector == NULL ||
 	    (chain->dev->quirks & UVC_QUIRK_IGNORE_SELECTOR_UNIT)) {
@@ -1469,50 +1301,6 @@ static long uvc_v4l2_unlocked_ioctl(struct file *file,
 	return ret;
 }
 
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
-#ifndef CONFIG_MMU
-static unsigned long uvc_v4l2_get_unmapped_area(struct file *file,
-		unsigned long addr, unsigned long len, unsigned long pgoff,
-		unsigned long flags)
-{
-	struct uvc_fh *handle = file->private_data;
-	struct uvc_streaming *stream = handle->stream;
-
-	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
-
-	return uvc_queue_get_unmapped_area(&stream->queue, pgoff);
-}
-#endif
-
 const struct v4l2_ioctl_ops uvc_ioctl_ops = {
 	.vidioc_g_fmt_vid_cap = uvc_ioctl_g_fmt,
 	.vidioc_g_fmt_vid_out = uvc_ioctl_g_fmt,
@@ -1525,12 +1313,13 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
 	.vidioc_enum_fmt_vid_out = uvc_ioctl_enum_fmt,
 	.vidioc_try_fmt_vid_cap = uvc_ioctl_try_fmt,
 	.vidioc_try_fmt_vid_out = uvc_ioctl_try_fmt,
-	.vidioc_reqbufs = uvc_ioctl_reqbufs,
-	.vidioc_querybuf = uvc_ioctl_querybuf,
-	.vidioc_qbuf = uvc_ioctl_qbuf,
-	.vidioc_expbuf = uvc_ioctl_expbuf,
-	.vidioc_dqbuf = uvc_ioctl_dqbuf,
-	.vidioc_create_bufs = uvc_ioctl_create_bufs,
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
 	.vidioc_streamon = uvc_ioctl_streamon,
 	.vidioc_streamoff = uvc_ioctl_streamoff,
 	.vidioc_enum_input = uvc_ioctl_enum_input,
@@ -1557,11 +1346,10 @@ const struct v4l2_file_operations uvc_fops = {
 #ifdef CONFIG_COMPAT
 	.compat_ioctl32	= uvc_v4l2_compat_ioctl32,
 #endif
-	.read		= uvc_v4l2_read,
-	.mmap		= uvc_v4l2_mmap,
-	.poll		= uvc_v4l2_poll,
+	.mmap		= vb2_fop_mmap,
+	.poll		= vb2_fop_poll,
 #ifndef CONFIG_MMU
-	.get_unmapped_area = uvc_v4l2_get_unmapped_area,
+	.get_unmapped_area = vb2_fop_get_unmapped_area,
 #endif
 };
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 11d6e3c2ebdfbabd7bbe5722f88ff85f406d9bb6..b300487e6ec9163ac8236803b9e819814233f419 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -328,7 +328,10 @@ struct uvc_buffer {
 
 struct uvc_video_queue {
 	struct vb2_queue queue;
-	struct mutex mutex;			/* Protects queue */
+	struct mutex mutex;			/*
+						 * Serializes vb2_queue and
+						 * fops
+						 */
 
 	unsigned int flags;
 	unsigned int buf_used;
@@ -621,16 +624,10 @@ struct uvc_device {
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
 	unsigned int pending_async_ctrls;
 	bool is_streaming;
 };
@@ -689,36 +686,11 @@ struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
 
 /* Video buffers queue management. */
 int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type);
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
-#ifndef CONFIG_MMU
-unsigned long uvc_queue_get_unmapped_area(struct uvc_video_queue *queue,
-					  unsigned long pgoff);
-#endif
-int uvc_queue_allocated(struct uvc_video_queue *queue);
 static inline int uvc_queue_streaming(struct uvc_video_queue *queue)
 {
 	return vb2_is_streaming(&queue->queue);

-- 
2.50.0.727.gbf7dc18ff4-goog


