Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC45CF5BC
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 11:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729944AbfJHJLa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 05:11:30 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42916 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729893AbfJHJL3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 05:11:29 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 866AB28F7F9;
        Tue,  8 Oct 2019 10:11:27 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Brian Starkey <Brian.Starkey@arm.com>, kernel@collabora.com,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [RFC PATCH v3 6/6] media: vimc: Implement the ext_fmt and ext_buf hooks
Date:   Tue,  8 Oct 2019 11:11:19 +0200
Message-Id: <20191008091119.7294-7-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191008091119.7294-1-boris.brezillon@collabora.com>
References: <20191008091119.7294-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the driver to the _ext_fmt and _ext_buf API.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v3:
- Rebased on top of media/master (post 5.4-rc1)

Changes in v2:
- New patch
---
 drivers/media/platform/vimc/vimc-capture.c | 65 +++++++++++-----------
 drivers/media/platform/vimc/vimc-common.c  |  4 +-
 drivers/media/platform/vimc/vimc-common.h  |  2 +-
 3 files changed, 36 insertions(+), 35 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index 602f80323031..8a9d0039bf6e 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -16,7 +16,7 @@ struct vimc_cap_device {
 	struct vimc_ent_device ved;
 	struct video_device vdev;
 	struct device *dev;
-	struct v4l2_pix_format format;
+	struct v4l2_ext_pix_format format;
 	struct vb2_queue queue;
 	struct list_head buf_list;
 	/*
@@ -32,12 +32,13 @@ struct vimc_cap_device {
 	struct vimc_stream stream;
 };
 
-static const struct v4l2_pix_format fmt_default = {
+static const struct v4l2_ext_pix_format fmt_default = {
 	.width = 640,
 	.height = 480,
 	.pixelformat = V4L2_PIX_FMT_RGB24,
 	.field = V4L2_FIELD_NONE,
 	.colorspace = V4L2_COLORSPACE_DEFAULT,
+	.num_planes = 1,
 };
 
 struct vimc_cap_buffer {
@@ -63,7 +64,7 @@ static int vimc_cap_querycap(struct file *file, void *priv,
 }
 
 static void vimc_cap_get_format(struct vimc_ent_device *ved,
-				struct v4l2_pix_format *fmt)
+				struct v4l2_ext_pix_format *fmt)
 {
 	struct vimc_cap_device *vcap = container_of(ved, struct vimc_cap_device,
 						    ved);
@@ -72,19 +73,18 @@ static void vimc_cap_get_format(struct vimc_ent_device *ved,
 }
 
 static int vimc_cap_g_fmt_vid_cap(struct file *file, void *priv,
-				  struct v4l2_format *f)
+				  struct v4l2_ext_pix_format *f)
 {
 	struct vimc_cap_device *vcap = video_drvdata(file);
 
-	f->fmt.pix = vcap->format;
+	*f = vcap->format;
 
 	return 0;
 }
 
 static int vimc_cap_try_fmt_vid_cap(struct file *file, void *priv,
-				    struct v4l2_format *f)
+				    struct v4l2_ext_pix_format *format)
 {
-	struct v4l2_pix_format *format = &f->fmt.pix;
 	const struct vimc_pix_map *vpix;
 
 	format->width = clamp_t(u32, format->width, VIMC_FRAME_MIN_WIDTH,
@@ -99,8 +99,10 @@ static int vimc_cap_try_fmt_vid_cap(struct file *file, void *priv,
 		vpix = vimc_pix_map_by_pixelformat(format->pixelformat);
 	}
 	/* TODO: Add support for custom bytesperline values */
-	format->bytesperline = format->width * vpix->bpp;
-	format->sizeimage = format->bytesperline * format->height;
+	format->num_planes = 1;
+	format->plane_fmt[0].bytesperline = format->width * vpix->bpp;
+	format->plane_fmt[0].sizeimage = format->plane_fmt[0].bytesperline *
+					 format->height;
 
 	if (format->field == V4L2_FIELD_ANY)
 		format->field = fmt_default.field;
@@ -111,7 +113,7 @@ static int vimc_cap_try_fmt_vid_cap(struct file *file, void *priv,
 }
 
 static int vimc_cap_s_fmt_vid_cap(struct file *file, void *priv,
-				  struct v4l2_format *f)
+				  struct v4l2_ext_pix_format *f)
 {
 	struct vimc_cap_device *vcap = video_drvdata(file);
 	int ret;
@@ -133,12 +135,10 @@ static int vimc_cap_s_fmt_vid_cap(struct file *file, void *priv,
 		vcap->format.quantization, vcap->format.xfer_func,
 		vcap->format.ycbcr_enc,
 		/* new */
-		f->fmt.pix.width, f->fmt.pix.height,
-		f->fmt.pix.pixelformat,	f->fmt.pix.colorspace,
-		f->fmt.pix.quantization, f->fmt.pix.xfer_func,
-		f->fmt.pix.ycbcr_enc);
+		f->width, f->height, f->pixelformat, f->colorspace,
+		f->quantization, f->xfer_func, f->ycbcr_enc);
 
-	vcap->format = f->fmt.pix;
+	vcap->format = *f;
 
 	return 0;
 }
@@ -193,19 +193,19 @@ static const struct v4l2_file_operations vimc_cap_fops = {
 static const struct v4l2_ioctl_ops vimc_cap_ioctl_ops = {
 	.vidioc_querycap = vimc_cap_querycap,
 
-	.vidioc_g_fmt_vid_cap = vimc_cap_g_fmt_vid_cap,
-	.vidioc_s_fmt_vid_cap = vimc_cap_s_fmt_vid_cap,
-	.vidioc_try_fmt_vid_cap = vimc_cap_try_fmt_vid_cap,
+	.vidioc_g_ext_fmt_vid_cap = vimc_cap_g_fmt_vid_cap,
+	.vidioc_s_ext_fmt_vid_cap = vimc_cap_s_fmt_vid_cap,
+	.vidioc_try_ext_fmt_vid_cap = vimc_cap_try_fmt_vid_cap,
 	.vidioc_enum_fmt_vid_cap = vimc_cap_enum_fmt_vid_cap,
 	.vidioc_enum_framesizes = vimc_cap_enum_framesizes,
 
 	.vidioc_reqbufs = vb2_ioctl_reqbufs,
-	.vidioc_create_bufs = vb2_ioctl_create_bufs,
-	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
-	.vidioc_querybuf = vb2_ioctl_querybuf,
-	.vidioc_qbuf = vb2_ioctl_qbuf,
-	.vidioc_dqbuf = vb2_ioctl_dqbuf,
-	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_ext_create_bufs = vb2_ioctl_ext_create_bufs,
+	.vidioc_ext_prepare_buf = vb2_ioctl_ext_prepare_buf,
+	.vidioc_ext_querybuf = vb2_ioctl_ext_querybuf,
+	.vidioc_ext_qbuf = vb2_ioctl_ext_qbuf,
+	.vidioc_ext_dqbuf = vb2_ioctl_ext_dqbuf,
+	.vidioc_ext_expbuf = vb2_ioctl_ext_expbuf,
 	.vidioc_streamon = vb2_ioctl_streamon,
 	.vidioc_streamoff = vb2_ioctl_streamoff,
 };
@@ -286,10 +286,11 @@ static int vimc_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 	struct vimc_cap_device *vcap = vb2_get_drv_priv(vq);
 
 	if (*nplanes)
-		return sizes[0] < vcap->format.sizeimage ? -EINVAL : 0;
+		return sizes[0] < vcap->format.plane_fmt[0].sizeimage ?
+		       -EINVAL : 0;
 	/* We don't support multiplanes for now */
 	*nplanes = 1;
-	sizes[0] = vcap->format.sizeimage;
+	sizes[0] = vcap->format.plane_fmt[0].sizeimage;
 
 	return 0;
 }
@@ -297,7 +298,7 @@ static int vimc_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 static int vimc_cap_buffer_prepare(struct vb2_buffer *vb)
 {
 	struct vimc_cap_device *vcap = vb2_get_drv_priv(vb->vb2_queue);
-	unsigned long size = vcap->format.sizeimage;
+	unsigned long size = vcap->format.plane_fmt[0].sizeimage;
 
 	if (vb2_plane_size(vb, 0) < size) {
 		dev_err(vcap->dev, "%s: buffer too small (%lu < %lu)\n",
@@ -374,11 +375,11 @@ static void *vimc_cap_process_frame(struct vimc_ent_device *ved,
 
 	vbuf = vb2_plane_vaddr(&vimc_buf->vb2.vb2_buf, 0);
 
-	memcpy(vbuf, frame, vcap->format.sizeimage);
+	memcpy(vbuf, frame, vcap->format.plane_fmt[0].sizeimage);
 
 	/* Set it as ready */
 	vb2_set_plane_payload(&vimc_buf->vb2.vb2_buf, 0,
-			      vcap->format.sizeimage);
+			      vcap->format.plane_fmt[0].sizeimage);
 	vb2_buffer_done(&vimc_buf->vb2.vb2_buf, VB2_BUF_STATE_DONE);
 	return NULL;
 }
@@ -443,9 +444,9 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 	/* Set default frame format */
 	vcap->format = fmt_default;
 	vpix = vimc_pix_map_by_pixelformat(vcap->format.pixelformat);
-	vcap->format.bytesperline = vcap->format.width * vpix->bpp;
-	vcap->format.sizeimage = vcap->format.bytesperline *
-				 vcap->format.height;
+	vcap->format.plane_fmt[0].bytesperline = vcap->format.width * vpix->bpp;
+	vcap->format.plane_fmt[0].sizeimage = vcap->format.plane_fmt[0].bytesperline *
+					      vcap->format.height;
 
 	/* Fill the vimc_ent_device struct */
 	vcap->ved.ent = &vcap->vdev.entity;
diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
index a3120f4f7a90..c10cb3e9b934 100644
--- a/drivers/media/platform/vimc/vimc-common.c
+++ b/drivers/media/platform/vimc/vimc-common.c
@@ -268,14 +268,14 @@ static int vimc_get_mbus_format(struct media_pad *pad,
 							 entity);
 		struct vimc_ent_device *ved = video_get_drvdata(vdev);
 		const struct vimc_pix_map *vpix;
-		struct v4l2_pix_format vdev_fmt;
+		struct v4l2_ext_pix_format vdev_fmt;
 
 		if (!ved->vdev_get_format)
 			return -ENOIOCTLCMD;
 
 		ved->vdev_get_format(ved, &vdev_fmt);
 		vpix = vimc_pix_map_by_pixelformat(vdev_fmt.pixelformat);
-		v4l2_fill_mbus_format(&fmt->format, &vdev_fmt, vpix->code);
+		v4l2_fill_mbus_format_ext(&fmt->format, &vdev_fmt, vpix->code);
 	} else {
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
index 698db7c07645..21bbe31c8029 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -113,7 +113,7 @@ struct vimc_ent_device {
 	void * (*process_frame)(struct vimc_ent_device *ved,
 				const void *frame);
 	void (*vdev_get_format)(struct vimc_ent_device *ved,
-			      struct v4l2_pix_format *fmt);
+				struct v4l2_ext_pix_format *fmt);
 };
 
 /**
-- 
2.21.0

