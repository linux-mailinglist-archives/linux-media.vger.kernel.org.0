Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7D165D36C
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 17:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbfGBPtE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 11:49:04 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58366 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbfGBPtD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 11:49:03 -0400
Received: from turingmachine.home (unknown [IPv6:2804:431:c7f4:61e7:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6D4BD26056D;
        Tue,  2 Jul 2019 16:48:57 +0100 (BST)
From:   =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, helen.koike@collabora.com,
        kernel@collabora.com, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
Subject: [PATCH 1/7] media: vimc: Create video module
Date:   Tue,  2 Jul 2019 12:47:46 -0300
Message-Id: <20190702154752.14939-2-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190702154752.14939-1-andrealmeid@collabora.com>
References: <20190702154752.14939-1-andrealmeid@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V4L2 video capture and video output devices shares a lot of common code.
To enhance code reuse with future video output, split vimc-capture.c in
three files: vimc-capture.c and vimc-video.{c,h}. Keep strict capture
related functions on vimc-capture.c. This change is meant to the future
addition of a video output device in vimc, as it will make easier for code
reuse and simplicity.

Signed-off-by: André Almeida <andrealmeid@collabora.com>
---
 drivers/media/platform/vimc/Makefile       |   2 +-
 drivers/media/platform/vimc/vimc-capture.c | 341 ++-------------------
 drivers/media/platform/vimc/vimc-video.c   | 264 ++++++++++++++++
 drivers/media/platform/vimc/vimc-video.h   | 127 ++++++++
 4 files changed, 417 insertions(+), 317 deletions(-)
 create mode 100644 drivers/media/platform/vimc/vimc-video.c
 create mode 100644 drivers/media/platform/vimc/vimc-video.h

diff --git a/drivers/media/platform/vimc/Makefile b/drivers/media/platform/vimc/Makefile
index 96d06f030c31..fb90aa0f33a5 100644
--- a/drivers/media/platform/vimc/Makefile
+++ b/drivers/media/platform/vimc/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 vimc-y := vimc-core.o vimc-common.o vimc-streamer.o
 
-obj-$(CONFIG_VIDEO_VIMC) += vimc.o vimc-capture.o vimc-debayer.o \
+obj-$(CONFIG_VIDEO_VIMC) += vimc.o vimc-video.o vimc-capture.o vimc-debayer.o \
                 vimc-scaler.o vimc-sensor.o
diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index 664855708fdf..e80fa1ee3dc1 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -5,231 +5,18 @@
  * Copyright (C) 2015-2017 Helen Koike <helen.fornazier@gmail.com>
  */
 
-#include <linux/component.h>
-#include <linux/module.h>
-#include <linux/mod_devicetable.h>
-#include <linux/platform_device.h>
-#include <media/v4l2-ioctl.h>
-#include <media/videobuf2-core.h>
-#include <media/videobuf2-vmalloc.h>
-
-#include "vimc-common.h"
-#include "vimc-streamer.h"
+#include "vimc-video.h"
 
 #define VIMC_CAP_DRV_NAME "vimc-capture"
 
-static const u32 vimc_cap_supported_pixfmt[] = {
-	V4L2_PIX_FMT_BGR24,
-	V4L2_PIX_FMT_RGB24,
-	V4L2_PIX_FMT_ARGB32,
-	V4L2_PIX_FMT_SBGGR8,
-	V4L2_PIX_FMT_SGBRG8,
-	V4L2_PIX_FMT_SGRBG8,
-	V4L2_PIX_FMT_SRGGB8,
-	V4L2_PIX_FMT_SBGGR10,
-	V4L2_PIX_FMT_SGBRG10,
-	V4L2_PIX_FMT_SGRBG10,
-	V4L2_PIX_FMT_SRGGB10,
-	V4L2_PIX_FMT_SBGGR10ALAW8,
-	V4L2_PIX_FMT_SGBRG10ALAW8,
-	V4L2_PIX_FMT_SGRBG10ALAW8,
-	V4L2_PIX_FMT_SRGGB10ALAW8,
-	V4L2_PIX_FMT_SBGGR10DPCM8,
-	V4L2_PIX_FMT_SGBRG10DPCM8,
-	V4L2_PIX_FMT_SGRBG10DPCM8,
-	V4L2_PIX_FMT_SRGGB10DPCM8,
-	V4L2_PIX_FMT_SBGGR12,
-	V4L2_PIX_FMT_SGBRG12,
-	V4L2_PIX_FMT_SGRBG12,
-	V4L2_PIX_FMT_SRGGB12,
-};
-
-struct vimc_cap_device {
-	struct vimc_ent_device ved;
-	struct video_device vdev;
-	struct device *dev;
-	struct v4l2_pix_format format;
-	struct vb2_queue queue;
-	struct list_head buf_list;
-	/*
-	 * NOTE: in a real driver, a spin lock must be used to access the
-	 * queue because the frames are generated from a hardware interruption
-	 * and the isr is not allowed to sleep.
-	 * Even if it is not necessary a spinlock in the vimc driver, we
-	 * use it here as a code reference
-	 */
-	spinlock_t qlock;
-	struct mutex lock;
-	u32 sequence;
-	struct vimc_stream stream;
-};
-
-static const struct v4l2_pix_format fmt_default = {
-	.width = 640,
-	.height = 480,
-	.pixelformat = V4L2_PIX_FMT_RGB24,
-	.field = V4L2_FIELD_NONE,
-	.colorspace = V4L2_COLORSPACE_DEFAULT,
-};
-
-struct vimc_cap_buffer {
-	/*
-	 * struct vb2_v4l2_buffer must be the first element
-	 * the videobuf2 framework will allocate this struct based on
-	 * buf_struct_size and use the first sizeof(struct vb2_buffer) bytes of
-	 * memory as a vb2_buffer
-	 */
-	struct vb2_v4l2_buffer vb2;
-	struct list_head list;
-};
-
-static int vimc_cap_querycap(struct file *file, void *priv,
-			     struct v4l2_capability *cap)
-{
-	strscpy(cap->driver, VIMC_PDEV_NAME, sizeof(cap->driver));
-	strscpy(cap->card, KBUILD_MODNAME, sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info),
-		 "platform:%s", VIMC_PDEV_NAME);
-
-	return 0;
-}
-
-static void vimc_cap_get_format(struct vimc_ent_device *ved,
-				struct v4l2_pix_format *fmt)
-{
-	struct vimc_cap_device *vcap = container_of(ved, struct vimc_cap_device,
-						    ved);
-
-	*fmt = vcap->format;
-}
-
-static int vimc_cap_g_fmt_vid_cap(struct file *file, void *priv,
-				  struct v4l2_format *f)
-{
-	struct vimc_cap_device *vcap = video_drvdata(file);
-
-	f->fmt.pix = vcap->format;
-
-	return 0;
-}
-
-static int vimc_cap_try_fmt_vid_cap(struct file *file, void *priv,
-				    struct v4l2_format *f)
-{
-	struct v4l2_pix_format *format = &f->fmt.pix;
-
-	format->width = clamp_t(u32, format->width, VIMC_FRAME_MIN_WIDTH,
-				VIMC_FRAME_MAX_WIDTH) & ~1;
-	format->height = clamp_t(u32, format->height, VIMC_FRAME_MIN_HEIGHT,
-				 VIMC_FRAME_MAX_HEIGHT) & ~1;
-
-	vimc_colorimetry_clamp(format);
-
-	if (format->field == V4L2_FIELD_ANY)
-		format->field = fmt_default.field;
-
-	/* TODO: Add support for custom bytesperline values */
-
-	/* Don't accept a pixelformat that is not on the table */
-	if (!v4l2_format_info(format->pixelformat))
-		format->pixelformat = fmt_default.pixelformat;
-
-	return v4l2_fill_pixfmt(format, format->pixelformat,
-				format->width, format->height);
-}
-
-static int vimc_cap_s_fmt_vid_cap(struct file *file, void *priv,
-				  struct v4l2_format *f)
-{
-	struct vimc_cap_device *vcap = video_drvdata(file);
-	int ret;
-
-	/* Do not change the format while stream is on */
-	if (vb2_is_busy(&vcap->queue))
-		return -EBUSY;
-
-	ret = vimc_cap_try_fmt_vid_cap(file, priv, f);
-	if (ret)
-		return ret;
-
-	dev_dbg(vcap->dev, "%s: format update: "
-		"old:%dx%d (0x%x, %d, %d, %d, %d) "
-		"new:%dx%d (0x%x, %d, %d, %d, %d)\n", vcap->vdev.name,
-		/* old */
-		vcap->format.width, vcap->format.height,
-		vcap->format.pixelformat, vcap->format.colorspace,
-		vcap->format.quantization, vcap->format.xfer_func,
-		vcap->format.ycbcr_enc,
-		/* new */
-		f->fmt.pix.width, f->fmt.pix.height,
-		f->fmt.pix.pixelformat,	f->fmt.pix.colorspace,
-		f->fmt.pix.quantization, f->fmt.pix.xfer_func,
-		f->fmt.pix.ycbcr_enc);
-
-	vcap->format = f->fmt.pix;
-
-	return 0;
-}
-
-static int vimc_cap_enum_fmt_vid_cap(struct file *file, void *priv,
-				     struct v4l2_fmtdesc *f)
-{
-	if (f->index >= ARRAY_SIZE(vimc_cap_supported_pixfmt))
-		return -EINVAL;
-
-	f->pixelformat = vimc_cap_supported_pixfmt[f->index];
-
-	return 0;
-}
-
-static bool vimc_cap_is_pixfmt_supported(u32 pixelformat)
-{
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(vimc_cap_supported_pixfmt); i++)
-		if (vimc_cap_supported_pixfmt[i] == pixelformat)
-			return true;
-	return false;
-}
-
-static int vimc_cap_enum_framesizes(struct file *file, void *fh,
-				    struct v4l2_frmsizeenum *fsize)
-{
-	if (fsize->index)
-		return -EINVAL;
-
-	if (!vimc_cap_is_pixfmt_supported(fsize->pixel_format))
-		return -EINVAL;
-
-	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
-	fsize->stepwise.min_width = VIMC_FRAME_MIN_WIDTH;
-	fsize->stepwise.max_width = VIMC_FRAME_MAX_WIDTH;
-	fsize->stepwise.min_height = VIMC_FRAME_MIN_HEIGHT;
-	fsize->stepwise.max_height = VIMC_FRAME_MAX_HEIGHT;
-	fsize->stepwise.step_width = 1;
-	fsize->stepwise.step_height = 1;
-
-	return 0;
-}
-
-static const struct v4l2_file_operations vimc_cap_fops = {
-	.owner		= THIS_MODULE,
-	.open		= v4l2_fh_open,
-	.release	= vb2_fop_release,
-	.read           = vb2_fop_read,
-	.poll		= vb2_fop_poll,
-	.unlocked_ioctl = video_ioctl2,
-	.mmap           = vb2_fop_mmap,
-};
-
 static const struct v4l2_ioctl_ops vimc_cap_ioctl_ops = {
-	.vidioc_querycap = vimc_cap_querycap,
+	.vidioc_querycap = vimc_vid_querycap,
 
-	.vidioc_g_fmt_vid_cap = vimc_cap_g_fmt_vid_cap,
-	.vidioc_s_fmt_vid_cap = vimc_cap_s_fmt_vid_cap,
-	.vidioc_try_fmt_vid_cap = vimc_cap_try_fmt_vid_cap,
-	.vidioc_enum_fmt_vid_cap = vimc_cap_enum_fmt_vid_cap,
-	.vidioc_enum_framesizes = vimc_cap_enum_framesizes,
+	.vidioc_g_fmt_vid_cap = vimc_vid_g_fmt,
+	.vidioc_s_fmt_vid_cap = vimc_vid_s_fmt,
+	.vidioc_try_fmt_vid_cap = vimc_vid_try_fmt,
+	.vidioc_enum_fmt_vid_cap = vimc_vid_enum_fmt,
+	.vidioc_enum_framesizes = vimc_vid_enum_framesizes,
 
 	.vidioc_reqbufs = vb2_ioctl_reqbufs,
 	.vidioc_create_bufs = vb2_ioctl_create_bufs,
@@ -242,24 +29,9 @@ static const struct v4l2_ioctl_ops vimc_cap_ioctl_ops = {
 	.vidioc_streamoff = vb2_ioctl_streamoff,
 };
 
-static void vimc_cap_return_all_buffers(struct vimc_cap_device *vcap,
-					enum vb2_buffer_state state)
-{
-	struct vimc_cap_buffer *vbuf, *node;
-
-	spin_lock(&vcap->qlock);
-
-	list_for_each_entry_safe(vbuf, node, &vcap->buf_list, list) {
-		list_del(&vbuf->list);
-		vb2_buffer_done(&vbuf->vb2.vb2_buf, state);
-	}
-
-	spin_unlock(&vcap->qlock);
-}
-
 static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
-	struct vimc_cap_device *vcap = vb2_get_drv_priv(vq);
+	struct vimc_vid_device *vcap = vb2_get_drv_priv(vq);
 	struct media_entity *entity = &vcap->vdev.entity;
 	int ret;
 
@@ -268,7 +40,7 @@ static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
 	/* Start the media pipeline */
 	ret = media_pipeline_start(entity, &vcap->stream.pipe);
 	if (ret) {
-		vimc_cap_return_all_buffers(vcap, VB2_BUF_STATE_QUEUED);
+		vimc_vid_return_all_buffers(vcap, VB2_BUF_STATE_QUEUED);
 		return ret;
 	}
 
@@ -276,7 +48,7 @@ static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
 	ret = vimc_streamer_s_stream(&vcap->stream, &vcap->ved, 1);
 	if (ret) {
 		media_pipeline_stop(entity);
-		vimc_cap_return_all_buffers(vcap, VB2_BUF_STATE_QUEUED);
+		vimc_vid_return_all_buffers(vcap, VB2_BUF_STATE_QUEUED);
 		return ret;
 	}
 
@@ -287,65 +59,23 @@ static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
  * Stop the stream engine. Any remaining buffers in the stream queue are
  * dequeued and passed on to the vb2 framework marked as STATE_ERROR.
  */
-static void vimc_cap_stop_streaming(struct vb2_queue *vq)
+void vimc_cap_stop_streaming(struct vb2_queue *vq)
 {
-	struct vimc_cap_device *vcap = vb2_get_drv_priv(vq);
+	struct vimc_vid_device *vcap = vb2_get_drv_priv(vq);
 
 	vimc_streamer_s_stream(&vcap->stream, &vcap->ved, 0);
 
-	/* Stop the media pipeline */
 	media_pipeline_stop(&vcap->vdev.entity);
 
-	/* Release all active buffers */
-	vimc_cap_return_all_buffers(vcap, VB2_BUF_STATE_ERROR);
-}
-
-static void vimc_cap_buf_queue(struct vb2_buffer *vb2_buf)
-{
-	struct vimc_cap_device *vcap = vb2_get_drv_priv(vb2_buf->vb2_queue);
-	struct vimc_cap_buffer *buf = container_of(vb2_buf,
-						   struct vimc_cap_buffer,
-						   vb2.vb2_buf);
-
-	spin_lock(&vcap->qlock);
-	list_add_tail(&buf->list, &vcap->buf_list);
-	spin_unlock(&vcap->qlock);
-}
-
-static int vimc_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
-				unsigned int *nplanes, unsigned int sizes[],
-				struct device *alloc_devs[])
-{
-	struct vimc_cap_device *vcap = vb2_get_drv_priv(vq);
-
-	if (*nplanes)
-		return sizes[0] < vcap->format.sizeimage ? -EINVAL : 0;
-	/* We don't support multiplanes for now */
-	*nplanes = 1;
-	sizes[0] = vcap->format.sizeimage;
-
-	return 0;
-}
-
-static int vimc_cap_buffer_prepare(struct vb2_buffer *vb)
-{
-	struct vimc_cap_device *vcap = vb2_get_drv_priv(vb->vb2_queue);
-	unsigned long size = vcap->format.sizeimage;
-
-	if (vb2_plane_size(vb, 0) < size) {
-		dev_err(vcap->dev, "%s: buffer too small (%lu < %lu)\n",
-			vcap->vdev.name, vb2_plane_size(vb, 0), size);
-		return -EINVAL;
-	}
-	return 0;
+	vimc_vid_return_all_buffers(vcap, VB2_BUF_STATE_ERROR);
 }
 
 static const struct vb2_ops vimc_cap_qops = {
 	.start_streaming	= vimc_cap_start_streaming,
 	.stop_streaming		= vimc_cap_stop_streaming,
-	.buf_queue		= vimc_cap_buf_queue,
-	.queue_setup		= vimc_cap_queue_setup,
-	.buf_prepare		= vimc_cap_buffer_prepare,
+	.buf_queue		= vimc_vid_buf_queue,
+	.queue_setup		= vimc_vid_queue_setup,
+	.buf_prepare		= vimc_vid_buffer_prepare,
 	/*
 	 * Since q->lock is set we can use the standard
 	 * vb2_ops_wait_prepare/finish helper functions.
@@ -358,33 +88,12 @@ static const struct media_entity_operations vimc_cap_mops = {
 	.link_validate		= vimc_link_validate,
 };
 
-static void vimc_cap_release(struct video_device *vdev)
-{
-	struct vimc_cap_device *vcap =
-		container_of(vdev, struct vimc_cap_device, vdev);
-
-	vimc_pads_cleanup(vcap->ved.pads);
-	kfree(vcap);
-}
-
-static void vimc_cap_comp_unbind(struct device *comp, struct device *master,
-				 void *master_data)
-{
-	struct vimc_ent_device *ved = dev_get_drvdata(comp);
-	struct vimc_cap_device *vcap = container_of(ved, struct vimc_cap_device,
-						    ved);
-
-	vb2_queue_release(&vcap->queue);
-	media_entity_cleanup(ved->ent);
-	video_unregister_device(&vcap->vdev);
-}
-
 static void *vimc_cap_process_frame(struct vimc_ent_device *ved,
 				    const void *frame)
 {
-	struct vimc_cap_device *vcap = container_of(ved, struct vimc_cap_device,
+	struct vimc_vid_device *vcap = container_of(ved, struct vimc_vid_device,
 						    ved);
-	struct vimc_cap_buffer *vimc_buf;
+	struct vimc_vid_buffer *vimc_buf;
 	void *vbuf;
 
 	spin_lock(&vcap->qlock);
@@ -423,12 +132,12 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
 {
 	struct v4l2_device *v4l2_dev = master_data;
 	struct vimc_platform_data *pdata = comp->platform_data;
-	struct vimc_cap_device *vcap;
+	struct vimc_vid_device *vcap;
 	struct video_device *vdev;
 	struct vb2_queue *q;
 	int ret;
 
-	/* Allocate the vimc_cap_device struct */
+	/* Allocate the vimc_vid_device struct */
 	vcap = kzalloc(sizeof(*vcap), GFP_KERNEL);
 	if (!vcap)
 		return -ENOMEM;
@@ -457,7 +166,7 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
 	q->drv_priv = vcap;
-	q->buf_struct_size = sizeof(struct vimc_cap_buffer);
+	q->buf_struct_size = sizeof(struct vimc_vid_buffer);
 	q->ops = &vimc_cap_qops;
 	q->mem_ops = &vb2_vmalloc_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
@@ -483,7 +192,7 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
 	/* Fill the vimc_ent_device struct */
 	vcap->ved.ent = &vcap->vdev.entity;
 	vcap->ved.process_frame = vimc_cap_process_frame;
-	vcap->ved.vdev_get_format = vimc_cap_get_format;
+	vcap->ved.vdev_get_format = vimc_vid_get_format;
 	dev_set_drvdata(comp, &vcap->ved);
 	vcap->dev = comp;
 
@@ -491,8 +200,8 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
 	vdev = &vcap->vdev;
 	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
 	vdev->entity.ops = &vimc_cap_mops;
-	vdev->release = vimc_cap_release;
-	vdev->fops = &vimc_cap_fops;
+	vdev->release = vimc_vid_release;
+	vdev->fops = &vimc_vid_fops;
 	vdev->ioctl_ops = &vimc_cap_ioctl_ops;
 	vdev->lock = &vcap->lock;
 	vdev->queue = q;
@@ -525,7 +234,7 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
 
 static const struct component_ops vimc_cap_comp_ops = {
 	.bind = vimc_cap_comp_bind,
-	.unbind = vimc_cap_comp_unbind,
+	.unbind = vimc_vid_comp_unbind,
 };
 
 static int vimc_cap_probe(struct platform_device *pdev)
diff --git a/drivers/media/platform/vimc/vimc-video.c b/drivers/media/platform/vimc/vimc-video.c
new file mode 100644
index 000000000000..f7ccb2e9d6c5
--- /dev/null
+++ b/drivers/media/platform/vimc/vimc-video.c
@@ -0,0 +1,264 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * vimc-video.c Virtual Media Controller Driver
+ *
+ *	Derivated work from original vimc-capture by:
+ *		Helen Koike <helen.koike@collabora.com>
+ *
+ * Copyright 2019 Collabora, Ltd.
+ */
+
+#include "vimc-video.h"
+
+/*
+ * TODO: video device should only enum formats that all subdevices on
+ * topology accepts
+ */
+static const u32 vimc_vid_supported_pixfmt[] = {
+	V4L2_PIX_FMT_BGR24,
+	V4L2_PIX_FMT_RGB24,
+	V4L2_PIX_FMT_ARGB32,
+	V4L2_PIX_FMT_SBGGR8,
+	V4L2_PIX_FMT_SGBRG8,
+	V4L2_PIX_FMT_SGRBG8,
+	V4L2_PIX_FMT_SRGGB8,
+	V4L2_PIX_FMT_SBGGR10,
+	V4L2_PIX_FMT_SGBRG10,
+	V4L2_PIX_FMT_SGRBG10,
+	V4L2_PIX_FMT_SRGGB10,
+	V4L2_PIX_FMT_SBGGR10ALAW8,
+	V4L2_PIX_FMT_SGBRG10ALAW8,
+	V4L2_PIX_FMT_SGRBG10ALAW8,
+	V4L2_PIX_FMT_SRGGB10ALAW8,
+	V4L2_PIX_FMT_SBGGR10DPCM8,
+	V4L2_PIX_FMT_SGBRG10DPCM8,
+	V4L2_PIX_FMT_SGRBG10DPCM8,
+	V4L2_PIX_FMT_SRGGB10DPCM8,
+	V4L2_PIX_FMT_SBGGR12,
+	V4L2_PIX_FMT_SGBRG12,
+	V4L2_PIX_FMT_SGRBG12,
+	V4L2_PIX_FMT_SRGGB12,
+};
+
+int vimc_vid_querycap(struct file *file, void *priv,
+		      struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, VIMC_PDEV_NAME, sizeof(cap->driver));
+	strscpy(cap->card, KBUILD_MODNAME, sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info),
+		 "platform:%s", VIMC_PDEV_NAME);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vimc_vid_querycap);
+
+void vimc_vid_get_format(struct vimc_ent_device *ved,
+			 struct v4l2_pix_format *fmt)
+{
+	struct vimc_vid_device *vid = container_of(ved, struct vimc_vid_device,
+						    ved);
+
+	*fmt = vid->format;
+}
+EXPORT_SYMBOL_GPL(vimc_vid_get_format);
+
+int vimc_vid_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct vimc_vid_device *vid = video_drvdata(file);
+
+	f->fmt.pix = vid->format;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vimc_vid_g_fmt);
+
+int vimc_vid_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct v4l2_pix_format *format = &f->fmt.pix;
+
+	format->width = clamp_t(u32, format->width, VIMC_FRAME_MIN_WIDTH,
+				VIMC_FRAME_MAX_WIDTH) & ~1;
+	format->height = clamp_t(u32, format->height, VIMC_FRAME_MIN_HEIGHT,
+				 VIMC_FRAME_MAX_HEIGHT) & ~1;
+
+	vimc_colorimetry_clamp(format);
+
+	if (format->field == V4L2_FIELD_ANY)
+		format->field = fmt_default.field;
+
+	/* TODO: Add support for custom bytesperline values */
+
+	/* Don't accept a pixelformat that is not on the table */
+	if (!v4l2_format_info(format->pixelformat))
+		format->pixelformat = fmt_default.pixelformat;
+
+	return v4l2_fill_pixfmt(format, format->pixelformat,
+				format->width, format->height);
+}
+EXPORT_SYMBOL_GPL(vimc_vid_try_fmt);
+
+int vimc_vid_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct vimc_vid_device *vid = video_drvdata(file);
+	int ret;
+
+	/* Do not change the format while stream is on */
+	if (vb2_is_busy(&vid->queue))
+		return -EBUSY;
+
+	ret = vimc_vid_try_fmt(file, priv, f);
+	if (ret)
+		return ret;
+
+	dev_dbg(vid->dev, "%s: format update: "
+		"old:%dx%d (0x%x, %d, %d, %d, %d) "
+		"new:%dx%d (0x%x, %d, %d, %d, %d)\n", vid->vdev.name,
+		/* old */
+		vid->format.width, vid->format.height,
+		vid->format.pixelformat, vid->format.colorspace,
+		vid->format.quantization, vid->format.xfer_func,
+		vid->format.ycbcr_enc,
+		/* new */
+		f->fmt.pix.width, f->fmt.pix.height,
+		f->fmt.pix.pixelformat,	f->fmt.pix.colorspace,
+		f->fmt.pix.quantization, f->fmt.pix.xfer_func,
+		f->fmt.pix.ycbcr_enc);
+
+	vid->format = f->fmt.pix;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vimc_vid_s_fmt);
+
+int vimc_vid_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f)
+{
+	if (f->index >= ARRAY_SIZE(vimc_vid_supported_pixfmt))
+		return -EINVAL;
+
+	f->pixelformat = vimc_vid_supported_pixfmt[f->index];
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vimc_vid_enum_fmt);
+
+bool vimc_vid_is_pixfmt_supported(u32 pixelformat)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(vimc_vid_supported_pixfmt); i++)
+		if (vimc_vid_supported_pixfmt[i] == pixelformat)
+			return true;
+	return false;
+}
+EXPORT_SYMBOL_GPL(vimc_vid_is_pixfmt_supported);
+
+int vimc_vid_enum_framesizes(struct file *file, void *fh,
+			     struct v4l2_frmsizeenum *fsize)
+{
+	if (fsize->index)
+		return -EINVAL;
+
+	if (!vimc_vid_is_pixfmt_supported(fsize->pixel_format))
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
+	fsize->stepwise.min_width = VIMC_FRAME_MIN_WIDTH;
+	fsize->stepwise.max_width = VIMC_FRAME_MAX_WIDTH;
+	fsize->stepwise.min_height = VIMC_FRAME_MIN_HEIGHT;
+	fsize->stepwise.max_height = VIMC_FRAME_MAX_HEIGHT;
+	fsize->stepwise.step_width = 1;
+	fsize->stepwise.step_height = 1;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vimc_vid_enum_framesizes);
+
+void vimc_vid_return_all_buffers(struct vimc_vid_device *vid,
+				 enum vb2_buffer_state state)
+{
+	struct vimc_vid_buffer *vbuf, *node;
+
+	spin_lock(&vid->qlock);
+
+	list_for_each_entry_safe(vbuf, node, &vid->buf_list, list) {
+		list_del(&vbuf->list);
+		vb2_buffer_done(&vbuf->vb2.vb2_buf, state);
+	}
+
+	spin_unlock(&vid->qlock);
+}
+EXPORT_SYMBOL_GPL(vimc_vid_return_all_buffers);
+
+/*
+ * vb2 operations
+ */
+
+void vimc_vid_buf_queue(struct vb2_buffer *vb2_buf)
+{
+	struct vimc_vid_device *vid = vb2_get_drv_priv(vb2_buf->vb2_queue);
+	struct vimc_vid_buffer *buf = container_of(vb2_buf,
+						   struct vimc_vid_buffer,
+						   vb2.vb2_buf);
+
+	spin_lock(&vid->qlock);
+	list_add_tail(&buf->list, &vid->buf_list);
+	spin_unlock(&vid->qlock);
+}
+EXPORT_SYMBOL_GPL(vimc_vid_buf_queue);
+
+int vimc_vid_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
+			 unsigned int *nplanes, unsigned int sizes[],
+			 struct device *alloc_devs[])
+{
+	struct vimc_vid_device *vid = vb2_get_drv_priv(vq);
+
+	if (*nplanes)
+		return sizes[0] < vid->format.sizeimage ? -EINVAL : 0;
+	/* We don't support multiplanes for now */
+	*nplanes = 1;
+	sizes[0] = vid->format.sizeimage;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vimc_vid_queue_setup);
+
+int vimc_vid_buffer_prepare(struct vb2_buffer *vb)
+{
+	struct vimc_vid_device *vid = vb2_get_drv_priv(vb->vb2_queue);
+	unsigned long size = vid->format.sizeimage;
+
+	if (vb2_plane_size(vb, 0) < size) {
+		dev_err(vid->dev, "%s: buffer too small (%lu < %lu)\n",
+			vid->vdev.name, vb2_plane_size(vb, 0), size);
+		return -EINVAL;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vimc_vid_buffer_prepare);
+
+void vimc_vid_release(struct video_device *vdev)
+{
+	struct vimc_vid_device *vid =
+		container_of(vdev, struct vimc_vid_device, vdev);
+
+	vimc_pads_cleanup(vid->ved.pads);
+	kfree(vid);
+}
+EXPORT_SYMBOL_GPL(vimc_vid_release);
+
+void vimc_vid_comp_unbind(struct device *comp, struct device *master,
+			  void *master_data)
+{
+	struct vimc_ent_device *ved = dev_get_drvdata(comp);
+	struct vimc_vid_device *vid = container_of(ved, struct vimc_vid_device,
+						    ved);
+
+	vb2_queue_release(&vid->queue);
+	media_entity_cleanup(ved->ent);
+	video_unregister_device(&vid->vdev);
+}
+EXPORT_SYMBOL_GPL(vimc_vid_comp_unbind);
+
+MODULE_DESCRIPTION("Virtual Media Controller Driver (VIMC) Video");
+MODULE_AUTHOR("André Almeida <andrealmeid@collabora.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/vimc/vimc-video.h b/drivers/media/platform/vimc/vimc-video.h
new file mode 100644
index 000000000000..d329345cc77f
--- /dev/null
+++ b/drivers/media/platform/vimc/vimc-video.h
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * vimc-video.h Virtual Media Controller Driver
+ *
+ *	Derivated work from original vimc-capture by:
+ *		Helen Koike <helen.koike@collabora.com>
+ *
+ * Copyright 2019 Collabora, Ltd.
+ */
+
+#ifndef _VIMC_VIDEO_H_
+#define _VIMC_VIDEO_H_
+
+#include <linux/component.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-vmalloc.h>
+
+#include "vimc-common.h"
+#include "vimc-streamer.h"
+
+static const struct v4l2_pix_format fmt_default = {
+	.width = 640,
+	.height = 480,
+	.pixelformat = V4L2_PIX_FMT_RGB24,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_DEFAULT,
+};
+
+static const struct v4l2_file_operations vimc_vid_fops = {
+	.owner		= THIS_MODULE,
+	.open		= v4l2_fh_open,
+	.release	= vb2_fop_release,
+	.read           = vb2_fop_read,
+	.poll		= vb2_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap           = vb2_fop_mmap,
+};
+
+struct vimc_vid_device {
+	struct vimc_ent_device ved;
+	struct video_device vdev;
+	struct device *dev;
+	struct v4l2_pix_format format;
+	struct vb2_queue queue;
+	struct list_head buf_list;
+	/*
+	 * NOTE: in a real driver, a spin lock must be used to access the
+	 * queue because the frames are generated from a hardware interruption
+	 * and the isr is not allowed to sleep.
+	 * Even if it is not necessary a spinlock in the vimc driver, we
+	 * use it here as a code reference
+	 */
+	spinlock_t qlock;
+	struct mutex lock;
+	u32 sequence;
+	struct vimc_stream stream;
+	u8 *frame;
+	struct task_struct *kthread_fd;
+};
+
+struct vimc_vid_buffer {
+	/*
+	 * struct vb2_v4l2_buffer must be the first element
+	 * the videobuf2 framework will allocate this struct based on
+	 * buf_struct_size and use the first sizeof(struct vb2_buffer) bytes of
+	 * memory as a vb2_buffer
+	 */
+	struct vb2_v4l2_buffer vb2;
+	struct list_head list;
+};
+
+int vimc_vid_querycap(struct file *file, void *priv,
+		      struct v4l2_capability *cap);
+
+void vimc_vid_get_format(struct vimc_ent_device *ved,
+			 struct v4l2_pix_format *fmt);
+
+int vimc_vid_g_fmt(struct file *file, void *priv,
+		   struct v4l2_format *f);
+
+int vimc_vid_try_fmt(struct file *file, void *priv,
+		     struct v4l2_format *f);
+
+int vimc_vid_s_fmt(struct file *file, void *priv,
+		   struct v4l2_format *f);
+
+int vimc_vid_enum_fmt_vid(struct file *file, void *priv,
+			  struct v4l2_fmtdesc *f);
+
+bool vimc_vid_is_pixfmt_supported(u32 pixelformat);
+
+void vimc_vid_release(struct video_device *vdev);
+
+void vimc_vid_comp_unbind(struct device *comp, struct device *master,
+			  void *master_data);
+
+int vimc_vid_enum_fmt(struct file *file, void *priv,
+				 struct v4l2_fmtdesc *f);
+
+int vimc_vid_enum_framesizes(struct file *file, void *fh,
+			     struct v4l2_frmsizeenum *fsize);
+
+void vimc_vid_return_all_buffers(struct vimc_vid_device *vid,
+				 enum vb2_buffer_state state);
+
+void vimc_vid_buf_queue(struct vb2_buffer *vb2_buf);
+
+int vimc_vid_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
+			 unsigned int *nplanes, unsigned int sizes[],
+			 struct device *alloc_devs[]);
+
+int vimc_vid_buffer_prepare(struct vb2_buffer *vb);
+
+int vimc_vid_probe(struct platform_device *pdev);
+
+int vimc_vid_remove(struct platform_device *pdev);
+
+void vimc_vid_release(struct video_device *vdev);
+
+void vimc_vid_comp_unbind(struct device *comp, struct device *master,
+				 void *master_data);
+
+#endif /* _VIMC_COMMON_H_ */
-- 
2.22.0

