Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4E30223AE0
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 13:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbgGQLz1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 07:55:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbgGQLz0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 07:55:26 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97175C061755;
        Fri, 17 Jul 2020 04:55:26 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 7E35A2A5766
From:   Helen Koike <helen.koike@collabora.com>
To:     mchehab@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        linux-media@vger.kernel.org
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Helen Koike <helen.koike@collabora.com>, tfiga@chromium.org,
        hiroh@chromium.org, nicolas@ndufresne.ca, Brian.Starkey@arm.com,
        kernel@collabora.com, narmstrong@baylibre.com,
        linux-kernel@vger.kernel.org, frkoenig@chromium.org,
        mjourdan@baylibre.com, stanimir.varbanov@linaro.org
Subject: [PATCH v4 6/6] media: vimc: Implement the ext_fmt and ext_buf hooks
Date:   Fri, 17 Jul 2020 08:54:35 -0300
Message-Id: <20200717115435.2632623-7-helen.koike@collabora.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200717115435.2632623-1-helen.koike@collabora.com>
References: <20200717115435.2632623-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Boris Brezillon <boris.brezillon@collabora.com>

Convert the driver to the _ext_fmt and _ext_buf API.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Helen Koike <helen.koike@collabora.com>
---
Changes in v4:
- Update with new format and buffer structs
- Rebased on top of media/master (post 5.8-rc1)

Changes in v3:
- Rebased on top of media/master (post 5.4-rc1)

Changes in v2:
- New patch
---
 .../media/test-drivers/vimc/vimc-capture.c    | 61 +++++++++----------
 drivers/media/test-drivers/vimc/vimc-common.c |  6 +-
 drivers/media/test-drivers/vimc/vimc-common.h |  2 +-
 3 files changed, 34 insertions(+), 35 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index c63496b17b9a5..0c8b86f0dd3ec 100644
--- a/drivers/media/test-drivers/vimc/vimc-capture.c
+++ b/drivers/media/test-drivers/vimc/vimc-capture.c
@@ -15,7 +15,7 @@
 struct vimc_cap_device {
 	struct vimc_ent_device ved;
 	struct video_device vdev;
-	struct v4l2_pix_format format;
+	struct v4l2_ext_pix_format format;
 	struct vb2_queue queue;
 	struct list_head buf_list;
 	/*
@@ -32,7 +32,7 @@ struct vimc_cap_device {
 	struct media_pad pad;
 };
 
-static const struct v4l2_pix_format fmt_default = {
+static const struct v4l2_ext_pix_format fmt_default = {
 	.width = 640,
 	.height = 480,
 	.pixelformat = V4L2_PIX_FMT_RGB24,
@@ -63,7 +63,7 @@ static int vimc_cap_querycap(struct file *file, void *priv,
 }
 
 static void vimc_cap_get_format(struct vimc_ent_device *ved,
-				struct v4l2_pix_format *fmt)
+				struct v4l2_ext_pix_format *fmt)
 {
 	struct vimc_cap_device *vcap = container_of(ved, struct vimc_cap_device,
 						    ved);
@@ -72,19 +72,18 @@ static void vimc_cap_get_format(struct vimc_ent_device *ved,
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
@@ -99,8 +98,9 @@ static int vimc_cap_try_fmt_vid_cap(struct file *file, void *priv,
 		vpix = vimc_pix_map_by_pixelformat(format->pixelformat);
 	}
 	/* TODO: Add support for custom bytesperline values */
-	format->bytesperline = format->width * vpix->bpp;
-	format->sizeimage = format->bytesperline * format->height;
+	format->plane_fmt[0].bytesperline = format->width * vpix->bpp;
+	format->plane_fmt[0].sizeimage = format->plane_fmt[0].bytesperline *
+					 format->height;
 
 	if (format->field == V4L2_FIELD_ANY)
 		format->field = fmt_default.field;
@@ -114,7 +114,7 @@ static int vimc_cap_try_fmt_vid_cap(struct file *file, void *priv,
 }
 
 static int vimc_cap_s_fmt_vid_cap(struct file *file, void *priv,
-				  struct v4l2_format *f)
+				  struct v4l2_ext_pix_format *f)
 {
 	struct vimc_cap_device *vcap = video_drvdata(file);
 	int ret;
@@ -136,12 +136,10 @@ static int vimc_cap_s_fmt_vid_cap(struct file *file, void *priv,
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
@@ -205,18 +203,18 @@ static const struct v4l2_file_operations vimc_cap_fops = {
 static const struct v4l2_ioctl_ops vimc_cap_ioctl_ops = {
 	.vidioc_querycap = vimc_cap_querycap,
 
-	.vidioc_g_fmt_vid_cap = vimc_cap_g_fmt_vid_cap,
-	.vidioc_s_fmt_vid_cap = vimc_cap_s_fmt_vid_cap,
-	.vidioc_try_fmt_vid_cap = vimc_cap_try_fmt_vid_cap,
+	.vidioc_g_ext_pix_fmt_vid_cap = vimc_cap_g_fmt_vid_cap,
+	.vidioc_s_ext_pix_fmt_vid_cap = vimc_cap_s_fmt_vid_cap,
+	.vidioc_try_ext_pix_fmt_vid_cap = vimc_cap_try_fmt_vid_cap,
 	.vidioc_enum_fmt_vid_cap = vimc_cap_enum_fmt_vid_cap,
 	.vidioc_enum_framesizes = vimc_cap_enum_framesizes,
 
 	.vidioc_reqbufs = vb2_ioctl_reqbufs,
-	.vidioc_create_bufs = vb2_ioctl_create_bufs,
-	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
-	.vidioc_querybuf = vb2_ioctl_querybuf,
-	.vidioc_qbuf = vb2_ioctl_qbuf,
-	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_ext_create_bufs = vb2_ioctl_ext_create_bufs,
+	.vidioc_ext_prepare_buf = vb2_ioctl_ext_prepare_buf,
+	.vidioc_ext_querybuf = vb2_ioctl_ext_querybuf,
+	.vidioc_ext_qbuf = vb2_ioctl_ext_qbuf,
+	.vidioc_ext_dqbuf = vb2_ioctl_ext_dqbuf,
 	.vidioc_expbuf = vb2_ioctl_expbuf,
 	.vidioc_streamon = vb2_ioctl_streamon,
 	.vidioc_streamoff = vb2_ioctl_streamoff,
@@ -298,10 +296,11 @@ static int vimc_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
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
@@ -309,7 +308,7 @@ static int vimc_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 static int vimc_cap_buffer_prepare(struct vb2_buffer *vb)
 {
 	struct vimc_cap_device *vcap = vb2_get_drv_priv(vb->vb2_queue);
-	unsigned long size = vcap->format.sizeimage;
+	unsigned long size = vcap->format.plane_fmt[0].sizeimage;
 
 	if (vb2_plane_size(vb, 0) < size) {
 		dev_err(vcap->ved.dev, "%s: buffer too small (%lu < %lu)\n",
@@ -385,11 +384,11 @@ static void *vimc_cap_process_frame(struct vimc_ent_device *ved,
 
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
@@ -447,9 +446,9 @@ static struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
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
diff --git a/drivers/media/test-drivers/vimc/vimc-common.c b/drivers/media/test-drivers/vimc/vimc-common.c
index 7b27153c0728b..854f88be3e93e 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.c
+++ b/drivers/media/test-drivers/vimc/vimc-common.c
@@ -236,7 +236,7 @@ const struct vimc_pix_map *vimc_pix_map_by_pixelformat(u32 pixelformat)
 }
 
 static int vimc_get_pix_format(struct media_pad *pad,
-			       struct v4l2_pix_format *fmt)
+			       struct v4l2_ext_pix_format *fmt)
 {
 	if (is_media_entity_v4l2_subdev(pad->entity)) {
 		struct v4l2_subdev *sd =
@@ -252,7 +252,7 @@ static int vimc_get_pix_format(struct media_pad *pad,
 		if (ret)
 			return ret;
 
-		v4l2_fill_pix_format(fmt, &sd_fmt.format);
+		v4l2_fill_ext_pix_format(fmt, &sd_fmt.format);
 		pix_map = vimc_pix_map_by_code(sd_fmt.format.code);
 		fmt->pixelformat = pix_map->pixelformat;
 	} else if (is_media_entity_v4l2_video_device(pad->entity)) {
@@ -274,7 +274,7 @@ static int vimc_get_pix_format(struct media_pad *pad,
 
 int vimc_vdev_link_validate(struct media_link *link)
 {
-	struct v4l2_pix_format source_fmt, sink_fmt;
+	struct v4l2_ext_pix_format source_fmt, sink_fmt;
 	int ret;
 
 	ret = vimc_get_pix_format(link->source, &source_fmt);
diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
index ae163dec2459c..f9a915d064e12 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.h
+++ b/drivers/media/test-drivers/vimc/vimc-common.h
@@ -103,7 +103,7 @@ struct vimc_ent_device {
 	void * (*process_frame)(struct vimc_ent_device *ved,
 				const void *frame);
 	void (*vdev_get_format)(struct vimc_ent_device *ved,
-			      struct v4l2_pix_format *fmt);
+				struct v4l2_ext_pix_format *fmt);
 };
 
 /**
-- 
2.26.0

