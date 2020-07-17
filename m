Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7A2F223ADE
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 13:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbgGQLzX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 07:55:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbgGQLzW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 07:55:22 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 180C6C061755;
        Fri, 17 Jul 2020 04:55:22 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id E1F552A576A
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
Subject: [PATCH v4 5/6] media: vivid: Convert the capture and output drivers to EXT_FMT/EXT_BUF
Date:   Fri, 17 Jul 2020 08:54:34 -0300
Message-Id: <20200717115435.2632623-6-helen.koike@collabora.com>
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

This should simplify things a bit as we now have a single
implementation instead of the MPLANE and !MPLANE versions.

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
 drivers/media/test-drivers/vivid/vivid-core.c |  70 ++-----
 .../test-drivers/vivid/vivid-touch-cap.c      |  26 +--
 .../test-drivers/vivid/vivid-touch-cap.h      |   3 +-
 .../media/test-drivers/vivid/vivid-vid-cap.c  | 169 +++++----------
 .../media/test-drivers/vivid/vivid-vid-cap.h  |  15 +-
 .../media/test-drivers/vivid/vivid-vid-out.c  | 193 ++++++------------
 .../media/test-drivers/vivid/vivid-vid-out.h  |  15 +-
 7 files changed, 154 insertions(+), 337 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index f7ee37e9508db..69b9433487150 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -488,63 +488,33 @@ static int vivid_enum_fmt_cap(struct file *file, void  *priv,
 }
 
 static int vivid_g_fmt_cap(struct file *file, void *priv,
-			   struct v4l2_format *f)
+			   struct v4l2_ext_pix_format *f)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_type == VFL_TYPE_TOUCH)
 		return vivid_g_fmt_tch(file, priv, f);
-	return vidioc_g_fmt_vid_cap(file, priv, f);
+	return vivid_g_fmt_vid_cap(file, priv, f);
 }
 
 static int vivid_try_fmt_cap(struct file *file, void *priv,
-			     struct v4l2_format *f)
+			     struct v4l2_ext_pix_format *f)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_type == VFL_TYPE_TOUCH)
 		return vivid_g_fmt_tch(file, priv, f);
-	return vidioc_try_fmt_vid_cap(file, priv, f);
+	return vivid_try_fmt_vid_cap(file, priv, f);
 }
 
 static int vivid_s_fmt_cap(struct file *file, void *priv,
-			   struct v4l2_format *f)
+			   struct v4l2_ext_pix_format *f)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_type == VFL_TYPE_TOUCH)
 		return vivid_g_fmt_tch(file, priv, f);
-	return vidioc_s_fmt_vid_cap(file, priv, f);
-}
-
-static int vivid_g_fmt_cap_mplane(struct file *file, void *priv,
-				  struct v4l2_format *f)
-{
-	struct video_device *vdev = video_devdata(file);
-
-	if (vdev->vfl_type == VFL_TYPE_TOUCH)
-		return vivid_g_fmt_tch_mplane(file, priv, f);
-	return vidioc_g_fmt_vid_cap_mplane(file, priv, f);
-}
-
-static int vivid_try_fmt_cap_mplane(struct file *file, void *priv,
-				    struct v4l2_format *f)
-{
-	struct video_device *vdev = video_devdata(file);
-
-	if (vdev->vfl_type == VFL_TYPE_TOUCH)
-		return vivid_g_fmt_tch_mplane(file, priv, f);
-	return vidioc_try_fmt_vid_cap_mplane(file, priv, f);
-}
-
-static int vivid_s_fmt_cap_mplane(struct file *file, void *priv,
-				  struct v4l2_format *f)
-{
-	struct video_device *vdev = video_devdata(file);
-
-	if (vdev->vfl_type == VFL_TYPE_TOUCH)
-		return vivid_g_fmt_tch_mplane(file, priv, f);
-	return vidioc_s_fmt_vid_cap_mplane(file, priv, f);
+	return vivid_s_fmt_vid_cap(file, priv, f);
 }
 
 static bool vivid_is_in_use(struct video_device *vdev)
@@ -640,20 +610,14 @@ static const struct v4l2_ioctl_ops vivid_ioctl_ops = {
 	.vidioc_querycap		= vidioc_querycap,
 
 	.vidioc_enum_fmt_vid_cap	= vivid_enum_fmt_cap,
-	.vidioc_g_fmt_vid_cap		= vivid_g_fmt_cap,
-	.vidioc_try_fmt_vid_cap		= vivid_try_fmt_cap,
-	.vidioc_s_fmt_vid_cap		= vivid_s_fmt_cap,
-	.vidioc_g_fmt_vid_cap_mplane	= vivid_g_fmt_cap_mplane,
-	.vidioc_try_fmt_vid_cap_mplane	= vivid_try_fmt_cap_mplane,
-	.vidioc_s_fmt_vid_cap_mplane	= vivid_s_fmt_cap_mplane,
+	.vidioc_g_ext_pix_fmt_vid_cap	= vivid_g_fmt_cap,
+	.vidioc_try_ext_pix_fmt_vid_cap	= vivid_try_fmt_cap,
+	.vidioc_s_ext_pix_fmt_vid_cap	= vivid_s_fmt_cap,
 
 	.vidioc_enum_fmt_vid_out	= vivid_enum_fmt_vid,
-	.vidioc_g_fmt_vid_out		= vidioc_g_fmt_vid_out,
-	.vidioc_try_fmt_vid_out		= vidioc_try_fmt_vid_out,
-	.vidioc_s_fmt_vid_out		= vidioc_s_fmt_vid_out,
-	.vidioc_g_fmt_vid_out_mplane	= vidioc_g_fmt_vid_out_mplane,
-	.vidioc_try_fmt_vid_out_mplane	= vidioc_try_fmt_vid_out_mplane,
-	.vidioc_s_fmt_vid_out_mplane	= vidioc_s_fmt_vid_out_mplane,
+	.vidioc_g_ext_pix_fmt_vid_out	= vivid_g_fmt_vid_out,
+	.vidioc_try_ext_pix_fmt_vid_out	= vivid_try_fmt_vid_out,
+	.vidioc_s_ext_pix_fmt_vid_out	= vivid_s_fmt_vid_out,
 
 	.vidioc_g_selection		= vidioc_g_selection,
 	.vidioc_s_selection		= vidioc_s_selection,
@@ -698,11 +662,11 @@ static const struct v4l2_ioctl_ops vivid_ioctl_ops = {
 	.vidioc_s_fbuf			= vidioc_s_fbuf,
 
 	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
-	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
-	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
-	.vidioc_querybuf		= vb2_ioctl_querybuf,
-	.vidioc_qbuf			= vb2_ioctl_qbuf,
-	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
+	.vidioc_ext_create_bufs		= vb2_ioctl_ext_create_bufs,
+	.vidioc_ext_prepare_buf		= vb2_ioctl_ext_prepare_buf,
+	.vidioc_ext_querybuf		= vb2_ioctl_ext_querybuf,
+	.vidioc_ext_qbuf		= vb2_ioctl_ext_qbuf,
+	.vidioc_ext_dqbuf		= vb2_ioctl_ext_dqbuf,
 	.vidioc_expbuf			= vb2_ioctl_expbuf,
 	.vidioc_streamon		= vb2_ioctl_streamon,
 	.vidioc_streamoff		= vb2_ioctl_streamoff,
diff --git a/drivers/media/test-drivers/vivid/vivid-touch-cap.c b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
index ebb00b128030c..6bbe7616e91a1 100644
--- a/drivers/media/test-drivers/vivid/vivid-touch-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
@@ -3,6 +3,8 @@
  * vivid-touch-cap.c - touch support functions.
  */
 
+#include <media/v4l2-ioctl.h>
+
 #include "vivid-core.h"
 #include "vivid-kthread-touch.h"
 #include "vivid-vid-common.h"
@@ -126,27 +128,19 @@ int vivid_enum_fmt_tch(struct file *file, void  *priv, struct v4l2_fmtdesc *f)
 	return 0;
 }
 
-int vivid_g_fmt_tch(struct file *file, void *priv, struct v4l2_format *f)
+int vivid_g_fmt_tch(struct file *file, void *priv, struct v4l2_ext_pix_format *e)
 {
 	struct vivid_dev *dev = video_drvdata(file);
+	struct v4l2_format f;
+	int ret;
 
-	if (dev->multiplanar)
-		return -ENOTTY;
-	f->fmt.pix = dev->tch_format;
-	return 0;
-}
+	ret = v4l2_ext_pix_format_to_format(e, &f, dev->multiplanar, false);
+	if (ret)
+		return ret;
 
-int vivid_g_fmt_tch_mplane(struct file *file, void *priv, struct v4l2_format *f)
-{
-	struct vivid_dev *dev = video_drvdata(file);
-	struct v4l2_format sp_fmt;
+	f.fmt.pix = dev->tch_format;
 
-	if (!dev->multiplanar)
-		return -ENOTTY;
-	sp_fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	sp_fmt.fmt.pix = dev->tch_format;
-	fmt_sp2mp(&sp_fmt, f);
-	return 0;
+	return v4l2_format_to_ext_pix_format(&f, e, false);
 }
 
 int vivid_g_parm_tch(struct file *file, void *priv,
diff --git a/drivers/media/test-drivers/vivid/vivid-touch-cap.h b/drivers/media/test-drivers/vivid/vivid-touch-cap.h
index 07e514046ae80..fccdf0a46824b 100644
--- a/drivers/media/test-drivers/vivid/vivid-touch-cap.h
+++ b/drivers/media/test-drivers/vivid/vivid-touch-cap.h
@@ -27,8 +27,7 @@ enum vivid_tch_test {
 extern const struct vb2_ops vivid_touch_cap_qops;
 
 int vivid_enum_fmt_tch(struct file *file, void  *priv, struct v4l2_fmtdesc *f);
-int vivid_g_fmt_tch(struct file *file, void *priv, struct v4l2_format *f);
-int vivid_g_fmt_tch_mplane(struct file *file, void *priv, struct v4l2_format *f);
+int vivid_g_fmt_tch(struct file *file, void *priv, struct v4l2_ext_pix_format *e);
 int vivid_enum_input_tch(struct file *file, void *priv, struct v4l2_input *inp);
 int vivid_g_input_tch(struct file *file, void *priv, unsigned int *i);
 int vivid_s_input_tch(struct file *file, void *priv, unsigned int i);
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index e94beef008c8e..dcd616c4719bb 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -521,28 +521,26 @@ static unsigned vivid_quantization_cap(struct vivid_dev *dev)
 }
 
 int vivid_g_fmt_vid_cap(struct file *file, void *priv,
-					struct v4l2_format *f)
+			struct v4l2_ext_pix_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
-	struct v4l2_pix_format_mplane *mp = &f->fmt.pix_mp;
 	unsigned p;
 
-	mp->width        = dev->fmt_cap_rect.width;
-	mp->height       = dev->fmt_cap_rect.height;
-	mp->field        = dev->field_cap;
-	mp->pixelformat  = dev->fmt_cap->fourcc;
-	mp->colorspace   = vivid_colorspace_cap(dev);
-	mp->xfer_func    = vivid_xfer_func_cap(dev);
+	f->width = dev->fmt_cap_rect.width;
+	f->height = dev->fmt_cap_rect.height;
+	f->field = dev->field_cap;
+	f->pixelformat = dev->fmt_cap->fourcc;
+	f->colorspace = vivid_colorspace_cap(dev);
+	f->xfer_func = vivid_xfer_func_cap(dev);
 	if (dev->fmt_cap->color_enc == TGP_COLOR_ENC_HSV)
-		mp->hsv_enc    = vivid_hsv_enc_cap(dev);
+		f->hsv_enc = vivid_hsv_enc_cap(dev);
 	else
-		mp->ycbcr_enc    = vivid_ycbcr_enc_cap(dev);
-	mp->quantization = vivid_quantization_cap(dev);
-	mp->num_planes = dev->fmt_cap->buffers;
-	for (p = 0; p < mp->num_planes; p++) {
-		mp->plane_fmt[p].bytesperline = tpg_g_bytesperline(&dev->tpg, p);
-		mp->plane_fmt[p].sizeimage =
-			(tpg_g_line_width(&dev->tpg, p) * mp->height) /
+		f->ycbcr_enc    = vivid_ycbcr_enc_cap(dev);
+	f->quantization = vivid_quantization_cap(dev);
+	for (p = 0; p < dev->fmt_cap->buffers; p++) {
+		f->plane_fmt[p].bytesperline = tpg_g_bytesperline(&dev->tpg, p);
+		f->plane_fmt[p].sizeimage =
+			(tpg_g_line_width(&dev->tpg, p) * f->height) /
 			dev->fmt_cap->vdownsampling[p] +
 			dev->fmt_cap->data_offset[p];
 	}
@@ -550,31 +548,30 @@ int vivid_g_fmt_vid_cap(struct file *file, void *priv,
 }
 
 int vivid_try_fmt_vid_cap(struct file *file, void *priv,
-			struct v4l2_format *f)
+			  struct v4l2_ext_pix_format *f)
 {
-	struct v4l2_pix_format_mplane *mp = &f->fmt.pix_mp;
-	struct v4l2_plane_pix_format *pfmt = mp->plane_fmt;
 	struct vivid_dev *dev = video_drvdata(file);
+	struct v4l2_plane_ext_pix_format *pfmt = f->plane_fmt;
 	const struct vivid_fmt *fmt;
 	unsigned bytesperline, max_bpl;
 	unsigned factor = 1;
 	unsigned w, h;
 	unsigned p;
 
-	fmt = vivid_get_format(dev, mp->pixelformat);
+	fmt = vivid_get_format(dev, f->pixelformat);
 	if (!fmt) {
 		dprintk(dev, 1, "Fourcc format (0x%08x) unknown.\n",
-			mp->pixelformat);
-		mp->pixelformat = V4L2_PIX_FMT_YUYV;
-		fmt = vivid_get_format(dev, mp->pixelformat);
+			f->pixelformat);
+		f->pixelformat = V4L2_PIX_FMT_YUYV;
+		fmt = vivid_get_format(dev, f->pixelformat);
 	}
 
-	mp->field = vivid_field_cap(dev, mp->field);
+	f->field = vivid_field_cap(dev, f->field);
 	if (vivid_is_webcam(dev)) {
 		const struct v4l2_frmsize_discrete *sz =
 			v4l2_find_nearest_size(webcam_sizes,
 					       VIVID_WEBCAM_SIZES, width,
-					       height, mp->width, mp->height);
+					       height, f->width, f->height);
 
 		w = sz->width;
 		h = sz->height;
@@ -585,14 +582,14 @@ int vivid_try_fmt_vid_cap(struct file *file, void *priv,
 		w = dev->src_rect.width;
 		h = dev->src_rect.height;
 	}
-	if (V4L2_FIELD_HAS_T_OR_B(mp->field))
+	if (V4L2_FIELD_HAS_T_OR_B(f->field))
 		factor = 2;
 	if (vivid_is_webcam(dev) ||
 	    (!dev->has_scaler_cap && !dev->has_crop_cap && !dev->has_compose_cap)) {
-		mp->width = w;
-		mp->height = h / factor;
+		f->width = w;
+		f->height = h / factor;
 	} else {
-		struct v4l2_rect r = { 0, 0, mp->width, mp->height * factor };
+		struct v4l2_rect r = { 0, 0, f->width, f->height * factor };
 
 		v4l2_rect_set_min_size(&r, &vivid_min_rect);
 		v4l2_rect_set_max_size(&r, &vivid_max_rect);
@@ -605,16 +602,15 @@ int vivid_try_fmt_vid_cap(struct file *file, void *priv,
 		} else if (!dev->has_scaler_cap && !dev->has_crop_cap) {
 			v4l2_rect_set_min_size(&r, &dev->src_rect);
 		}
-		mp->width = r.width;
-		mp->height = r.height / factor;
+		f->width = r.width;
+		f->height = r.height / factor;
 	}
 
 	/* This driver supports custom bytesperline values */
 
-	mp->num_planes = fmt->buffers;
 	for (p = 0; p < fmt->buffers; p++) {
 		/* Calculate the minimum supported bytesperline value */
-		bytesperline = (mp->width * fmt->bit_depth[p]) >> 3;
+		bytesperline = (f->width * fmt->bit_depth[p]) >> 3;
 		/* Calculate the maximum supported bytesperline value */
 		max_bpl = (MAX_ZOOM * MAX_WIDTH * fmt->bit_depth[p]) >> 3;
 
@@ -623,31 +619,27 @@ int vivid_try_fmt_vid_cap(struct file *file, void *priv,
 		if (pfmt[p].bytesperline < bytesperline)
 			pfmt[p].bytesperline = bytesperline;
 
-		pfmt[p].sizeimage = (pfmt[p].bytesperline * mp->height) /
+		pfmt[p].sizeimage = (pfmt[p].bytesperline * f->height) /
 				fmt->vdownsampling[p] + fmt->data_offset[p];
-
-		memset(pfmt[p].reserved, 0, sizeof(pfmt[p].reserved));
 	}
 	for (p = fmt->buffers; p < fmt->planes; p++)
-		pfmt[0].sizeimage += (pfmt[0].bytesperline * mp->height *
+		pfmt[0].sizeimage += (pfmt[0].bytesperline * f->height *
 			(fmt->bit_depth[p] / fmt->vdownsampling[p])) /
 			(fmt->bit_depth[0] / fmt->vdownsampling[0]);
 
-	mp->colorspace = vivid_colorspace_cap(dev);
+	f->colorspace = vivid_colorspace_cap(dev);
 	if (fmt->color_enc == TGP_COLOR_ENC_HSV)
-		mp->hsv_enc = vivid_hsv_enc_cap(dev);
+		f->hsv_enc = vivid_hsv_enc_cap(dev);
 	else
-		mp->ycbcr_enc = vivid_ycbcr_enc_cap(dev);
-	mp->xfer_func = vivid_xfer_func_cap(dev);
-	mp->quantization = vivid_quantization_cap(dev);
-	memset(mp->reserved, 0, sizeof(mp->reserved));
+		f->ycbcr_enc = vivid_ycbcr_enc_cap(dev);
+	f->xfer_func = vivid_xfer_func_cap(dev);
+	f->quantization = vivid_quantization_cap(dev);
 	return 0;
 }
 
 int vivid_s_fmt_vid_cap(struct file *file, void *priv,
-					struct v4l2_format *f)
+			struct v4l2_ext_pix_format *f)
 {
-	struct v4l2_pix_format_mplane *mp = &f->fmt.pix_mp;
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_rect *crop = &dev->crop_cap;
 	struct v4l2_rect *compose = &dev->compose_cap;
@@ -665,20 +657,21 @@ int vivid_s_fmt_vid_cap(struct file *file, void *priv,
 		return -EBUSY;
 	}
 
-	if (dev->overlay_cap_owner && dev->fb_cap.fmt.pixelformat != mp->pixelformat) {
+	if (dev->overlay_cap_owner &&
+	    dev->fb_cap.fmt.pixelformat != f->pixelformat) {
 		dprintk(dev, 1, "overlay is active, can't change pixelformat\n");
 		return -EBUSY;
 	}
 
-	dev->fmt_cap = vivid_get_format(dev, mp->pixelformat);
-	if (V4L2_FIELD_HAS_T_OR_B(mp->field))
+	dev->fmt_cap = vivid_get_format(dev, f->pixelformat);
+	if (V4L2_FIELD_HAS_T_OR_B(f->field))
 		factor = 2;
 
 	/* Note: the webcam input doesn't support scaling, cropping or composing */
 
 	if (!vivid_is_webcam(dev) &&
 	    (dev->has_scaler_cap || dev->has_crop_cap || dev->has_compose_cap)) {
-		struct v4l2_rect r = { 0, 0, mp->width, mp->height };
+		struct v4l2_rect r = { 0, 0, f->width, f->height };
 
 		if (dev->has_scaler_cap) {
 			if (dev->has_compose_cap)
@@ -739,99 +732,39 @@ int vivid_s_fmt_vid_cap(struct file *file, void *priv,
 	} else if (vivid_is_webcam(dev)) {
 		/* Guaranteed to be a match */
 		for (i = 0; i < ARRAY_SIZE(webcam_sizes); i++)
-			if (webcam_sizes[i].width == mp->width &&
-					webcam_sizes[i].height == mp->height)
+			if (webcam_sizes[i].width == f->width &&
+			    webcam_sizes[i].height == f->height)
 				break;
 		dev->webcam_size_idx = i;
 		if (dev->webcam_ival_idx >= 2 * (VIVID_WEBCAM_SIZES - i))
 			dev->webcam_ival_idx = 2 * (VIVID_WEBCAM_SIZES - i) - 1;
 		vivid_update_format_cap(dev, false);
 	} else {
-		struct v4l2_rect r = { 0, 0, mp->width, mp->height };
+		struct v4l2_rect r = { 0, 0, f->width, f->height };
 
 		v4l2_rect_set_size_to(compose, &r);
 		r.height *= factor;
 		v4l2_rect_set_size_to(crop, &r);
 	}
 
-	dev->fmt_cap_rect.width = mp->width;
-	dev->fmt_cap_rect.height = mp->height;
-	tpg_s_buf_height(&dev->tpg, mp->height);
+	dev->fmt_cap_rect.width = f->width;
+	dev->fmt_cap_rect.height = f->height;
+	tpg_s_buf_height(&dev->tpg, f->height);
 	tpg_s_fourcc(&dev->tpg, dev->fmt_cap->fourcc);
 	for (p = 0; p < tpg_g_buffers(&dev->tpg); p++)
-		tpg_s_bytesperline(&dev->tpg, p, mp->plane_fmt[p].bytesperline);
-	dev->field_cap = mp->field;
+		tpg_s_bytesperline(&dev->tpg, p, f->plane_fmt[p].bytesperline);
+	dev->field_cap = f->field;
 	if (dev->field_cap == V4L2_FIELD_ALTERNATE)
 		tpg_s_field(&dev->tpg, V4L2_FIELD_TOP, true);
 	else
 		tpg_s_field(&dev->tpg, dev->field_cap, false);
 	tpg_s_crop_compose(&dev->tpg, &dev->crop_cap, &dev->compose_cap);
 	if (vivid_is_sdtv_cap(dev))
-		dev->tv_field_cap = mp->field;
+		dev->tv_field_cap = f->field;
 	tpg_update_mv_step(&dev->tpg);
 	return 0;
 }
 
-int vidioc_g_fmt_vid_cap_mplane(struct file *file, void *priv,
-					struct v4l2_format *f)
-{
-	struct vivid_dev *dev = video_drvdata(file);
-
-	if (!dev->multiplanar)
-		return -ENOTTY;
-	return vivid_g_fmt_vid_cap(file, priv, f);
-}
-
-int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
-			struct v4l2_format *f)
-{
-	struct vivid_dev *dev = video_drvdata(file);
-
-	if (!dev->multiplanar)
-		return -ENOTTY;
-	return vivid_try_fmt_vid_cap(file, priv, f);
-}
-
-int vidioc_s_fmt_vid_cap_mplane(struct file *file, void *priv,
-			struct v4l2_format *f)
-{
-	struct vivid_dev *dev = video_drvdata(file);
-
-	if (!dev->multiplanar)
-		return -ENOTTY;
-	return vivid_s_fmt_vid_cap(file, priv, f);
-}
-
-int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
-					struct v4l2_format *f)
-{
-	struct vivid_dev *dev = video_drvdata(file);
-
-	if (dev->multiplanar)
-		return -ENOTTY;
-	return fmt_sp2mp_func(file, priv, f, vivid_g_fmt_vid_cap);
-}
-
-int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
-			struct v4l2_format *f)
-{
-	struct vivid_dev *dev = video_drvdata(file);
-
-	if (dev->multiplanar)
-		return -ENOTTY;
-	return fmt_sp2mp_func(file, priv, f, vivid_try_fmt_vid_cap);
-}
-
-int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
-			struct v4l2_format *f)
-{
-	struct vivid_dev *dev = video_drvdata(file);
-
-	if (dev->multiplanar)
-		return -ENOTTY;
-	return fmt_sp2mp_func(file, priv, f, vivid_s_fmt_vid_cap);
-}
-
 int vivid_vid_cap_g_selection(struct file *file, void *priv,
 			      struct v4l2_selection *sel)
 {
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.h b/drivers/media/test-drivers/vivid/vivid-vid-cap.h
index 1e422a59eeabf..7c9fc5c787b59 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.h
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.h
@@ -17,15 +17,12 @@ extern const char * const vivid_ctrl_standard_strings[];
 
 extern const struct vb2_ops vivid_vid_cap_qops;
 
-int vivid_g_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f);
-int vivid_try_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f);
-int vivid_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_g_fmt_vid_cap_mplane(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_s_fmt_vid_cap_mplane(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_g_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_try_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f);
+int vivid_g_fmt_vid_cap(struct file *file, void *priv,
+			struct v4l2_ext_pix_format *f);
+int vivid_try_fmt_vid_cap(struct file *file, void *priv,
+			  struct v4l2_ext_pix_format *f);
+int vivid_s_fmt_vid_cap(struct file *file, void *priv,
+			struct v4l2_ext_pix_format *f);
 int vivid_vid_cap_g_selection(struct file *file, void *priv, struct v4l2_selection *sel);
 int vivid_vid_cap_s_selection(struct file *file, void *fh, struct v4l2_selection *s);
 int vivid_vid_cap_g_pixelaspect(struct file *file, void *priv, int type, struct v4l2_fract *f);
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.c b/drivers/media/test-drivers/vivid/vivid-vid-out.c
index ee3446e3217cc..1da6bd5a8d121 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-out.c
@@ -315,59 +315,56 @@ static enum tpg_pixel_aspect vivid_get_pixel_aspect(const struct vivid_dev *dev)
 }
 
 int vivid_g_fmt_vid_out(struct file *file, void *priv,
-					struct v4l2_format *f)
+			struct v4l2_ext_pix_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
-	struct v4l2_pix_format_mplane *mp = &f->fmt.pix_mp;
 	const struct vivid_fmt *fmt = dev->fmt_out;
 	unsigned p;
 
-	mp->width        = dev->fmt_out_rect.width;
-	mp->height       = dev->fmt_out_rect.height;
-	mp->field        = dev->field_out;
-	mp->pixelformat  = fmt->fourcc;
-	mp->colorspace   = dev->colorspace_out;
-	mp->xfer_func    = dev->xfer_func_out;
-	mp->ycbcr_enc    = dev->ycbcr_enc_out;
-	mp->quantization = dev->quantization_out;
-	mp->num_planes = fmt->buffers;
-	for (p = 0; p < mp->num_planes; p++) {
-		mp->plane_fmt[p].bytesperline = dev->bytesperline_out[p];
-		mp->plane_fmt[p].sizeimage =
-			mp->plane_fmt[p].bytesperline * mp->height +
+	f->width        = dev->fmt_out_rect.width;
+	f->height       = dev->fmt_out_rect.height;
+	f->field        = dev->field_out;
+	f->pixelformat  = fmt->fourcc;
+	f->colorspace   = dev->colorspace_out;
+	f->xfer_func    = dev->xfer_func_out;
+	f->ycbcr_enc    = dev->ycbcr_enc_out;
+	f->quantization = dev->quantization_out;
+	for (p = 0; p < fmt->buffers; p++) {
+		f->plane_fmt[p].bytesperline = dev->bytesperline_out[p];
+		f->plane_fmt[p].sizeimage =
+			f->plane_fmt[p].bytesperline * f->height +
 			fmt->data_offset[p];
 	}
 	for (p = fmt->buffers; p < fmt->planes; p++) {
 		unsigned stride = dev->bytesperline_out[p];
 
-		mp->plane_fmt[0].sizeimage +=
-			(stride * mp->height) / fmt->vdownsampling[p];
+		f->plane_fmt[0].sizeimage +=
+			(stride * f->height) / fmt->vdownsampling[p];
 	}
 	return 0;
 }
 
 int vivid_try_fmt_vid_out(struct file *file, void *priv,
-			struct v4l2_format *f)
+			  struct v4l2_ext_pix_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
+	struct v4l2_plane_ext_pix_format *pfmt = f->plane_fmt;
 	struct v4l2_bt_timings *bt = &dev->dv_timings_out.bt;
-	struct v4l2_pix_format_mplane *mp = &f->fmt.pix_mp;
-	struct v4l2_plane_pix_format *pfmt = mp->plane_fmt;
 	const struct vivid_fmt *fmt;
 	unsigned bytesperline, max_bpl;
 	unsigned factor = 1;
 	unsigned w, h;
 	unsigned p;
 
-	fmt = vivid_get_format(dev, mp->pixelformat);
+	fmt = vivid_get_format(dev, f->pixelformat);
 	if (!fmt) {
 		dprintk(dev, 1, "Fourcc format (0x%08x) unknown.\n",
-			mp->pixelformat);
-		mp->pixelformat = V4L2_PIX_FMT_YUYV;
-		fmt = vivid_get_format(dev, mp->pixelformat);
+			f->pixelformat);
+		f->pixelformat = V4L2_PIX_FMT_YUYV;
+		fmt = vivid_get_format(dev, f->pixelformat);
 	}
 
-	mp->field = vivid_field_out(dev, mp->field);
+	f->field = vivid_field_out(dev, f->field);
 	if (vivid_is_svid_out(dev)) {
 		w = 720;
 		h = (dev->std_out & V4L2_STD_525_60) ? 480 : 576;
@@ -375,13 +372,13 @@ int vivid_try_fmt_vid_out(struct file *file, void *priv,
 		w = dev->sink_rect.width;
 		h = dev->sink_rect.height;
 	}
-	if (V4L2_FIELD_HAS_T_OR_B(mp->field))
+	if (V4L2_FIELD_HAS_T_OR_B(f->field))
 		factor = 2;
 	if (!dev->has_scaler_out && !dev->has_crop_out && !dev->has_compose_out) {
-		mp->width = w;
-		mp->height = h / factor;
+		f->width = w;
+		f->height = h / factor;
 	} else {
-		struct v4l2_rect r = { 0, 0, mp->width, mp->height * factor };
+		struct v4l2_rect r = { 0, 0, f->width, f->height * factor };
 
 		v4l2_rect_set_min_size(&r, &vivid_min_rect);
 		v4l2_rect_set_max_size(&r, &vivid_max_rect);
@@ -394,16 +391,15 @@ int vivid_try_fmt_vid_out(struct file *file, void *priv,
 		} else if (!dev->has_scaler_out && !dev->has_compose_out) {
 			v4l2_rect_set_min_size(&r, &dev->sink_rect);
 		}
-		mp->width = r.width;
-		mp->height = r.height / factor;
+		f->width = r.width;
+		f->height = r.height / factor;
 	}
 
 	/* This driver supports custom bytesperline values */
 
-	mp->num_planes = fmt->buffers;
 	for (p = 0; p < fmt->buffers; p++) {
 		/* Calculate the minimum supported bytesperline value */
-		bytesperline = (mp->width * fmt->bit_depth[p]) >> 3;
+		bytesperline = (f->width * fmt->bit_depth[p]) >> 3;
 		/* Calculate the maximum supported bytesperline value */
 		max_bpl = (MAX_ZOOM * MAX_WIDTH * fmt->bit_depth[p]) >> 3;
 
@@ -412,42 +408,39 @@ int vivid_try_fmt_vid_out(struct file *file, void *priv,
 		if (pfmt[p].bytesperline < bytesperline)
 			pfmt[p].bytesperline = bytesperline;
 
-		pfmt[p].sizeimage = (pfmt[p].bytesperline * mp->height) /
+		pfmt[p].sizeimage = (pfmt[p].bytesperline * f->height) /
 				fmt->vdownsampling[p] + fmt->data_offset[p];
 
-		memset(pfmt[p].reserved, 0, sizeof(pfmt[p].reserved));
 	}
 	for (p = fmt->buffers; p < fmt->planes; p++)
-		pfmt[0].sizeimage += (pfmt[0].bytesperline * mp->height *
+		pfmt[0].sizeimage += (pfmt[0].bytesperline * f->height *
 			(fmt->bit_depth[p] / fmt->vdownsampling[p])) /
 			(fmt->bit_depth[0] / fmt->vdownsampling[0]);
 
-	mp->xfer_func = V4L2_XFER_FUNC_DEFAULT;
-	mp->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
-	mp->quantization = V4L2_QUANTIZATION_DEFAULT;
+	f->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	f->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	f->quantization = V4L2_QUANTIZATION_DEFAULT;
 	if (vivid_is_svid_out(dev)) {
-		mp->colorspace = V4L2_COLORSPACE_SMPTE170M;
+		f->colorspace = V4L2_COLORSPACE_SMPTE170M;
 	} else if (dev->dvi_d_out || !(bt->flags & V4L2_DV_FL_IS_CE_VIDEO)) {
-		mp->colorspace = V4L2_COLORSPACE_SRGB;
+		f->colorspace = V4L2_COLORSPACE_SRGB;
 		if (dev->dvi_d_out)
-			mp->quantization = V4L2_QUANTIZATION_LIM_RANGE;
+			f->quantization = V4L2_QUANTIZATION_LIM_RANGE;
 	} else if (bt->width == 720 && bt->height <= 576) {
-		mp->colorspace = V4L2_COLORSPACE_SMPTE170M;
-	} else if (mp->colorspace != V4L2_COLORSPACE_SMPTE170M &&
-		   mp->colorspace != V4L2_COLORSPACE_REC709 &&
-		   mp->colorspace != V4L2_COLORSPACE_OPRGB &&
-		   mp->colorspace != V4L2_COLORSPACE_BT2020 &&
-		   mp->colorspace != V4L2_COLORSPACE_SRGB) {
-		mp->colorspace = V4L2_COLORSPACE_REC709;
+		f->colorspace = V4L2_COLORSPACE_SMPTE170M;
+	} else if (f->colorspace != V4L2_COLORSPACE_SMPTE170M &&
+		   f->colorspace != V4L2_COLORSPACE_REC709 &&
+		   f->colorspace != V4L2_COLORSPACE_OPRGB &&
+		   f->colorspace != V4L2_COLORSPACE_BT2020 &&
+		   f->colorspace != V4L2_COLORSPACE_SRGB) {
+		f->colorspace = V4L2_COLORSPACE_REC709;
 	}
-	memset(mp->reserved, 0, sizeof(mp->reserved));
 	return 0;
 }
 
 int vivid_s_fmt_vid_out(struct file *file, void *priv,
-					struct v4l2_format *f)
+			struct v4l2_ext_pix_format *f)
 {
-	struct v4l2_pix_format_mplane *mp = &f->fmt.pix_mp;
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_rect *crop = &dev->crop_out;
 	struct v4l2_rect *compose = &dev->compose_out;
@@ -461,10 +454,10 @@ int vivid_s_fmt_vid_out(struct file *file, void *priv,
 
 	if (vb2_is_busy(q) &&
 	    (vivid_is_svid_out(dev) ||
-	     mp->width != dev->fmt_out_rect.width ||
-	     mp->height != dev->fmt_out_rect.height ||
-	     mp->pixelformat != dev->fmt_out->fourcc ||
-	     mp->field != dev->field_out)) {
+	     f->width != dev->fmt_out_rect.width ||
+	     f->height != dev->fmt_out_rect.height ||
+	     f->pixelformat != dev->fmt_out->fourcc ||
+	     f->field != dev->field_out)) {
 		dprintk(dev, 1, "%s device busy\n", __func__);
 		return -EBUSY;
 	}
@@ -477,12 +470,12 @@ int vivid_s_fmt_vid_out(struct file *file, void *priv,
 	if (vb2_is_busy(q))
 		goto set_colorspace;
 
-	dev->fmt_out = vivid_get_format(dev, mp->pixelformat);
-	if (V4L2_FIELD_HAS_T_OR_B(mp->field))
+	dev->fmt_out = vivid_get_format(dev, f->pixelformat);
+	if (V4L2_FIELD_HAS_T_OR_B(f->field))
 		factor = 2;
 
 	if (dev->has_scaler_out || dev->has_crop_out || dev->has_compose_out) {
-		struct v4l2_rect r = { 0, 0, mp->width, mp->height };
+		struct v4l2_rect r = { 0, 0, f->width, f->height };
 
 		if (dev->has_scaler_out) {
 			if (dev->has_crop_out)
@@ -541,30 +534,30 @@ int vivid_s_fmt_vid_out(struct file *file, void *priv,
 			crop->height /= factor;
 		}
 	} else {
-		struct v4l2_rect r = { 0, 0, mp->width, mp->height };
+		struct v4l2_rect r = { 0, 0, f->width, f->height };
 
 		v4l2_rect_set_size_to(crop, &r);
 		r.height /= factor;
 		v4l2_rect_set_size_to(compose, &r);
 	}
 
-	dev->fmt_out_rect.width = mp->width;
-	dev->fmt_out_rect.height = mp->height;
-	for (p = 0; p < mp->num_planes; p++)
-		dev->bytesperline_out[p] = mp->plane_fmt[p].bytesperline;
+	dev->fmt_out_rect.width = f->width;
+	dev->fmt_out_rect.height = f->height;
+	for (p = 0; p < VIDEO_MAX_PLANES && f->plane_fmt[p].sizeimage; p++)
+		dev->bytesperline_out[p] = f->plane_fmt[p].bytesperline;
 	for (p = dev->fmt_out->buffers; p < dev->fmt_out->planes; p++)
 		dev->bytesperline_out[p] =
 			(dev->bytesperline_out[0] * dev->fmt_out->bit_depth[p]) /
 			dev->fmt_out->bit_depth[0];
-	dev->field_out = mp->field;
+	dev->field_out = f->field;
 	if (vivid_is_svid_out(dev))
-		dev->tv_field_out = mp->field;
+		dev->tv_field_out = f->field;
 
 set_colorspace:
-	dev->colorspace_out = mp->colorspace;
-	dev->xfer_func_out = mp->xfer_func;
-	dev->ycbcr_enc_out = mp->ycbcr_enc;
-	dev->quantization_out = mp->quantization;
+	dev->colorspace_out = f->colorspace;
+	dev->xfer_func_out = f->xfer_func;
+	dev->ycbcr_enc_out = f->ycbcr_enc;
+	dev->quantization_out = f->quantization;
 	if (dev->loop_video) {
 		vivid_send_source_change(dev, SVID);
 		vivid_send_source_change(dev, HDMI);
@@ -572,66 +565,6 @@ int vivid_s_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
-int vidioc_g_fmt_vid_out_mplane(struct file *file, void *priv,
-					struct v4l2_format *f)
-{
-	struct vivid_dev *dev = video_drvdata(file);
-
-	if (!dev->multiplanar)
-		return -ENOTTY;
-	return vivid_g_fmt_vid_out(file, priv, f);
-}
-
-int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
-			struct v4l2_format *f)
-{
-	struct vivid_dev *dev = video_drvdata(file);
-
-	if (!dev->multiplanar)
-		return -ENOTTY;
-	return vivid_try_fmt_vid_out(file, priv, f);
-}
-
-int vidioc_s_fmt_vid_out_mplane(struct file *file, void *priv,
-			struct v4l2_format *f)
-{
-	struct vivid_dev *dev = video_drvdata(file);
-
-	if (!dev->multiplanar)
-		return -ENOTTY;
-	return vivid_s_fmt_vid_out(file, priv, f);
-}
-
-int vidioc_g_fmt_vid_out(struct file *file, void *priv,
-					struct v4l2_format *f)
-{
-	struct vivid_dev *dev = video_drvdata(file);
-
-	if (dev->multiplanar)
-		return -ENOTTY;
-	return fmt_sp2mp_func(file, priv, f, vivid_g_fmt_vid_out);
-}
-
-int vidioc_try_fmt_vid_out(struct file *file, void *priv,
-			struct v4l2_format *f)
-{
-	struct vivid_dev *dev = video_drvdata(file);
-
-	if (dev->multiplanar)
-		return -ENOTTY;
-	return fmt_sp2mp_func(file, priv, f, vivid_try_fmt_vid_out);
-}
-
-int vidioc_s_fmt_vid_out(struct file *file, void *priv,
-			struct v4l2_format *f)
-{
-	struct vivid_dev *dev = video_drvdata(file);
-
-	if (dev->multiplanar)
-		return -ENOTTY;
-	return fmt_sp2mp_func(file, priv, f, vivid_s_fmt_vid_out);
-}
-
 int vivid_vid_out_g_selection(struct file *file, void *priv,
 			      struct v4l2_selection *sel)
 {
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.h b/drivers/media/test-drivers/vivid/vivid-vid-out.h
index 8d56314f4ea1f..b84dc578af362 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-out.h
+++ b/drivers/media/test-drivers/vivid/vivid-vid-out.h
@@ -12,15 +12,12 @@ extern const struct vb2_ops vivid_vid_out_qops;
 
 void vivid_update_format_out(struct vivid_dev *dev);
 
-int vivid_g_fmt_vid_out(struct file *file, void *priv, struct v4l2_format *f);
-int vivid_try_fmt_vid_out(struct file *file, void *priv, struct v4l2_format *f);
-int vivid_s_fmt_vid_out(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_g_fmt_vid_out_mplane(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_s_fmt_vid_out_mplane(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_g_fmt_vid_out(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_try_fmt_vid_out(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_s_fmt_vid_out(struct file *file, void *priv, struct v4l2_format *f);
+int vivid_g_fmt_vid_out(struct file *file, void *priv,
+			struct v4l2_ext_pix_format *f);
+int vivid_try_fmt_vid_out(struct file *file, void *priv,
+			  struct v4l2_ext_pix_format *f);
+int vivid_s_fmt_vid_out(struct file *file, void *priv,
+			struct v4l2_ext_pix_format *f);
 int vivid_vid_out_g_selection(struct file *file, void *priv, struct v4l2_selection *sel);
 int vivid_vid_out_s_selection(struct file *file, void *fh, struct v4l2_selection *s);
 int vivid_vid_out_g_pixelaspect(struct file *file, void *priv, int type, struct v4l2_fract *f);
-- 
2.26.0

