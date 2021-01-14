Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB7E2F6920
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 19:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729788AbhANSJN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 13:09:13 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51644 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729774AbhANSJN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 13:09:13 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id BEE3E1F45D0B
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        boris.brezillon@collabora.com, hiroh@chromium.org,
        nicolas@ndufresne.ca, Brian.Starkey@arm.com, kernel@collabora.com,
        narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
        frkoenig@chromium.org, stanimir.varbanov@linaro.org,
        tfiga@chromium.org
Subject: [RFC PATCH v6 10/11] media: vimc: Convert to v4l2_ext_pix_format
Date:   Thu, 14 Jan 2021 15:07:37 -0300
Message-Id: <20210114180738.1758707-11-helen.koike@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210114180738.1758707-1-helen.koike@collabora.com>
References: <20210114180738.1758707-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplify Multi/Single planer API handling by converting to v4l2_ext_pix_format.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Helen Koike <helen.koike@collabora.com>
---
Changes in v6:
- Update with new format and buffer structs

Changes in v4:
- Update with new format and buffer structs
- Rebased on top of media/master (post 5.8-rc1)

Changes in v3:
- Rebased on top of media/master (post 5.4-rc1)

Changes in v2:
- New patch
---
 .../media/test-drivers/vimc/vimc-capture.c    | 54 ++++++++++---------
 drivers/media/test-drivers/vimc/vimc-common.c |  6 +--
 drivers/media/test-drivers/vimc/vimc-common.h |  2 +-
 3 files changed, 32 insertions(+), 30 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index 729614d19002..51191dc9661b 100644
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
@@ -32,7 +32,8 @@ struct vimc_cap_device {
 	struct media_pad pad;
 };
 
-static const struct v4l2_pix_format fmt_default = {
+static const struct v4l2_ext_pix_format fmt_default = {
+	.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
 	.width = 640,
 	.height = 480,
 	.pixelformat = V4L2_PIX_FMT_RGB24,
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
+	memset(format->plane_fmt, 0, sizeof(format->plane_fmt));
+	format->plane_fmt[0].bytesperline = format->width * vpix->bpp;
+	format->plane_fmt[0].sizeimage = format->plane_fmt[0].bytesperline *
+					 format->height;
 
 	if (format->field == V4L2_FIELD_ANY)
 		format->field = fmt_default.field;
@@ -114,7 +116,7 @@ static int vimc_cap_try_fmt_vid_cap(struct file *file, void *priv,
 }
 
 static int vimc_cap_s_fmt_vid_cap(struct file *file, void *priv,
-				  struct v4l2_format *f)
+				  struct v4l2_ext_pix_format *f)
 {
 	struct vimc_cap_device *vcap = video_drvdata(file);
 	int ret;
@@ -136,12 +138,10 @@ static int vimc_cap_s_fmt_vid_cap(struct file *file, void *priv,
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
@@ -205,9 +205,9 @@ static const struct v4l2_file_operations vimc_cap_fops = {
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
 
@@ -300,10 +300,11 @@ static int vimc_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
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
@@ -311,7 +312,7 @@ static int vimc_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 static int vimc_cap_buffer_prepare(struct vb2_buffer *vb)
 {
 	struct vimc_cap_device *vcap = vb2_get_drv_priv(vb->vb2_queue);
-	unsigned long size = vcap->format.sizeimage;
+	unsigned long size = vcap->format.plane_fmt[0].sizeimage;
 
 	if (vb2_plane_size(vb, 0) < size) {
 		dev_err(vcap->ved.dev, "%s: buffer too small (%lu < %lu)\n",
@@ -386,11 +387,11 @@ static void *vimc_cap_process_frame(struct vimc_ent_device *ved,
 
 	vbuf = vb2_plane_vaddr(&vimc_buf->vb2.vb2_buf, 0);
 
-	memcpy(vbuf, frame, vcap->format.sizeimage);
+	memcpy(vbuf, frame, vcap->format.plane_fmt[0].sizeimage);
 
 	/* Set it as ready */
 	vb2_set_plane_payload(&vimc_buf->vb2.vb2_buf, 0,
-			      vcap->format.sizeimage);
+			      vcap->format.plane_fmt[0].sizeimage);
 	vb2_set_pixelformat(&vimc_buf->vb2.vb2_buf, vcap->format.pixelformat);
 	vb2_buffer_done(&vimc_buf->vb2.vb2_buf, VB2_BUF_STATE_DONE);
 	return NULL;
@@ -449,9 +450,10 @@ static struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 	/* Set default frame format */
 	vcap->format = fmt_default;
 	vpix = vimc_pix_map_by_pixelformat(vcap->format.pixelformat);
-	vcap->format.bytesperline = vcap->format.width * vpix->bpp;
-	vcap->format.sizeimage = vcap->format.bytesperline *
-				 vcap->format.height;
+	memset(vcap->format.plane_fmt, 0, sizeof(vcap->format.plane_fmt));
+	vcap->format.plane_fmt[0].bytesperline = vcap->format.width * vpix->bpp;
+	vcap->format.plane_fmt[0].sizeimage = vcap->format.plane_fmt[0].bytesperline *
+					      vcap->format.height;
 
 	/* Fill the vimc_ent_device struct */
 	vcap->ved.ent = &vcap->vdev.entity;
diff --git a/drivers/media/test-drivers/vimc/vimc-common.c b/drivers/media/test-drivers/vimc/vimc-common.c
index 7b27153c0728..8bbf80f2acb9 100644
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
+		v4l2_fill_ext_pix_format_from_mbus(fmt, &sd_fmt.format);
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
index a289434e75ba..42fa60350d87 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.h
+++ b/drivers/media/test-drivers/vimc/vimc-common.h
@@ -104,7 +104,7 @@ struct vimc_ent_device {
 	void * (*process_frame)(struct vimc_ent_device *ved,
 				const void *frame);
 	void (*vdev_get_format)(struct vimc_ent_device *ved,
-			      struct v4l2_pix_format *fmt);
+				struct v4l2_ext_pix_format *fmt);
 };
 
 /**
-- 
2.29.2

