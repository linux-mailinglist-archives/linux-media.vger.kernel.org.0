Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABE7BCF5BB
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 11:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729986AbfJHJLa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 05:11:30 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42842 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729440AbfJHJL3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 05:11:29 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BEA6D28F7F6;
        Tue,  8 Oct 2019 10:11:24 +0100 (BST)
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
Subject: [RFC PATCH v3 1/6] media: v4l2: Extend pixel formats to unify single/multi-planar handling (and more)
Date:   Tue,  8 Oct 2019 11:11:14 +0200
Message-Id: <20191008091119.7294-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191008091119.7294-1-boris.brezillon@collabora.com>
References: <20191008091119.7294-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is part of the multiplanar and singleplanar unification process.
v4l2_ext_pix_format is supposed to work for both cases.

We also add the concept of modifiers already employed in DRM to expose
HW-specific formats (like tiled or compressed formats) and allow
exchanging this information with the DRM subsystem in a consistent way.

Note that V4L2_BUF_TYPE_VIDEO[_OUTPUT]_OVERLAY and
V4L2_BUF_TYPE_VIDEO_{CAPTURE,OUTPUT}_MPLANE types are no longer accepted
in v4l2_ext_format and will be rejected if you use the {G,S,TRY}EXT_FMT
ioctls. V4L2_BUF_TYPE_VIDEO_{CAPTURE,OUTPUT}_MPLANE is dropped as part
of the multiplanar/singleplanar unification.
V4L2_BUF_TYPE_VIDEO[_OUTPUT]_OVERLAY seems to be used mostly on old
drivers and supporting it would require some extra rework.

New hooks have been added to v4l2_ioctl_ops to support those new ioctls
in drivers, but, in the meantime, the core takes care of converting
{S,G,TRY}_EXT_FMT requests into {S,G,TRY}_FMT so that old drivers can
still work if the userspace app/lib uses the new ioctls.
The conversion is also done the other around to allow userspace
apps/libs using {S,G,TRY}_FMT to work with drivers implementing the
_ext_ hooks.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v3:
- Rebased on top of media/master (post 5.4-rc1)

Changes in v2:
- Move the modifier in v4l2_ext_format (was formerly placed in
  v4l2_ext_plane)
- Fix a few bugs in the converters and add a strict parameter to
  allow conversion of uninitialized/mis-initialized objects
---
 drivers/media/v4l2-core/v4l2-dev.c   |  24 +-
 drivers/media/v4l2-core/v4l2-ioctl.c | 699 ++++++++++++++++++++++++---
 include/media/v4l2-ioctl.h           |  33 ++
 include/uapi/linux/videodev2.h       |  81 ++++
 4 files changed, 754 insertions(+), 83 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 4037689a945a..9aad715537b3 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -595,32 +595,44 @@ static void determine_valid_ioctls(struct video_device *vdev)
 			       ops->vidioc_enum_fmt_meta_out)))
 			set_bit(_IOC_NR(VIDIOC_ENUM_FMT), valid_ioctls);
 		if ((is_rx && (ops->vidioc_g_fmt_vid_cap ||
+			       ops->vidioc_g_ext_fmt_vid_cap ||
 			       ops->vidioc_g_fmt_vid_cap_mplane ||
 			       ops->vidioc_g_fmt_vid_overlay ||
 			       ops->vidioc_g_fmt_meta_cap)) ||
 		    (is_tx && (ops->vidioc_g_fmt_vid_out ||
+			       ops->vidioc_g_ext_fmt_vid_out ||
 			       ops->vidioc_g_fmt_vid_out_mplane ||
 			       ops->vidioc_g_fmt_vid_out_overlay ||
-			       ops->vidioc_g_fmt_meta_out)))
-			 set_bit(_IOC_NR(VIDIOC_G_FMT), valid_ioctls);
+			       ops->vidioc_g_fmt_meta_out))) {
+			set_bit(_IOC_NR(VIDIOC_G_FMT), valid_ioctls);
+			set_bit(_IOC_NR(VIDIOC_G_EXT_FMT), valid_ioctls);
+		}
 		if ((is_rx && (ops->vidioc_s_fmt_vid_cap ||
+			       ops->vidioc_s_ext_fmt_vid_cap ||
 			       ops->vidioc_s_fmt_vid_cap_mplane ||
 			       ops->vidioc_s_fmt_vid_overlay ||
 			       ops->vidioc_s_fmt_meta_cap)) ||
 		    (is_tx && (ops->vidioc_s_fmt_vid_out ||
+			       ops->vidioc_s_ext_fmt_vid_out ||
 			       ops->vidioc_s_fmt_vid_out_mplane ||
 			       ops->vidioc_s_fmt_vid_out_overlay ||
-			       ops->vidioc_s_fmt_meta_out)))
-			 set_bit(_IOC_NR(VIDIOC_S_FMT), valid_ioctls);
+			       ops->vidioc_s_fmt_meta_out))) {
+			set_bit(_IOC_NR(VIDIOC_S_FMT), valid_ioctls);
+			set_bit(_IOC_NR(VIDIOC_S_EXT_FMT), valid_ioctls);
+		}
 		if ((is_rx && (ops->vidioc_try_fmt_vid_cap ||
+			       ops->vidioc_try_ext_fmt_vid_cap ||
 			       ops->vidioc_try_fmt_vid_cap_mplane ||
 			       ops->vidioc_try_fmt_vid_overlay ||
 			       ops->vidioc_try_fmt_meta_cap)) ||
 		    (is_tx && (ops->vidioc_try_fmt_vid_out ||
+			       ops->vidioc_try_ext_fmt_vid_out ||
 			       ops->vidioc_try_fmt_vid_out_mplane ||
 			       ops->vidioc_try_fmt_vid_out_overlay ||
-			       ops->vidioc_try_fmt_meta_out)))
-			 set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
+			       ops->vidioc_try_fmt_meta_out))) {
+			set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
+			set_bit(_IOC_NR(VIDIOC_TRY_EXT_FMT), valid_ioctls);
+		}
 		SET_VALID_IOCTL(ops, VIDIOC_OVERLAY, vidioc_overlay);
 		SET_VALID_IOCTL(ops, VIDIOC_G_FBUF, vidioc_g_fbuf);
 		SET_VALID_IOCTL(ops, VIDIOC_S_FBUF, vidioc_s_fbuf);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 51b912743f0f..78e14c1dc76f 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -377,6 +377,82 @@ static void v4l_print_format(const void *arg, bool write_only)
 	}
 }
 
+static void v4l_print_ext_format(const void *arg, bool write_only)
+{
+	const struct v4l2_ext_format *p = arg;
+	const struct v4l2_ext_pix_format *pix;
+	const struct v4l2_vbi_format *vbi;
+	const struct v4l2_sliced_vbi_format *sliced;
+	const struct v4l2_sdr_format *sdr;
+	const struct v4l2_meta_format *meta;
+	unsigned int i;
+	u32 planes;
+
+	pr_cont("type=%s", prt_names(p->type, v4l2_type_names));
+	switch (p->type) {
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+		pix = &p->fmt.pix;
+		pr_cont(", width=%u, height=%u, format=%c%c%c%c, modifier %llx, field=%s, colorspace=%d, num_planes=%u, flags=0x%x, ycbcr_enc=%u, quantization=%u, xfer_func=%u\n",
+			pix->width, pix->height,
+			(pix->pixelformat & 0xff),
+			(pix->pixelformat >>  8) & 0xff,
+			(pix->pixelformat >> 16) & 0xff,
+			(pix->pixelformat >> 24) & 0xff,
+			pix->modifier, prt_names(pix->field, v4l2_field_names),
+			pix->colorspace, pix->num_planes, pix->flags,
+			pix->ycbcr_enc, pix->quantization, pix->xfer_func);
+		planes = min_t(u32, pix->num_planes, VIDEO_MAX_PLANES);
+		for (i = 0; i < planes; i++)
+			pr_debug("plane %u: bytesperline=%u sizeimage=%u\n",
+				 i, pix->plane_fmt[i].bytesperline,
+				 pix->plane_fmt[i].sizeimage);
+		break;
+	case V4L2_BUF_TYPE_VBI_CAPTURE:
+	case V4L2_BUF_TYPE_VBI_OUTPUT:
+		vbi = &p->fmt.vbi;
+		pr_cont(", sampling_rate=%u, offset=%u, samples_per_line=%u, sample_format=%c%c%c%c, start=%u,%u, count=%u,%u\n",
+			vbi->sampling_rate, vbi->offset,
+			vbi->samples_per_line,
+			(vbi->sample_format & 0xff),
+			(vbi->sample_format >>  8) & 0xff,
+			(vbi->sample_format >> 16) & 0xff,
+			(vbi->sample_format >> 24) & 0xff,
+			vbi->start[0], vbi->start[1],
+			vbi->count[0], vbi->count[1]);
+		break;
+	case V4L2_BUF_TYPE_SLICED_VBI_CAPTURE:
+	case V4L2_BUF_TYPE_SLICED_VBI_OUTPUT:
+		sliced = &p->fmt.sliced;
+		pr_cont(", service_set=0x%08x, io_size=%d\n",
+			sliced->service_set, sliced->io_size);
+		for (i = 0; i < 24; i++)
+			pr_debug("line[%02u]=0x%04x, 0x%04x\n", i,
+				 sliced->service_lines[0][i],
+				 sliced->service_lines[1][i]);
+		break;
+	case V4L2_BUF_TYPE_SDR_CAPTURE:
+	case V4L2_BUF_TYPE_SDR_OUTPUT:
+		sdr = &p->fmt.sdr;
+		pr_cont(", pixelformat=%c%c%c%c\n",
+			(sdr->pixelformat >>  0) & 0xff,
+			(sdr->pixelformat >>  8) & 0xff,
+			(sdr->pixelformat >> 16) & 0xff,
+			(sdr->pixelformat >> 24) & 0xff);
+		break;
+	case V4L2_BUF_TYPE_META_CAPTURE:
+	case V4L2_BUF_TYPE_META_OUTPUT:
+		meta = &p->fmt.meta;
+		pr_cont(", dataformat=%c%c%c%c, buffersize=%u\n",
+			(meta->dataformat >>  0) & 0xff,
+			(meta->dataformat >>  8) & 0xff,
+			(meta->dataformat >> 16) & 0xff,
+			(meta->dataformat >> 24) & 0xff,
+			meta->buffersize);
+		break;
+	}
+}
+
 static void v4l_print_framebuffer(const void *arg, bool write_only)
 {
 	const struct v4l2_framebuffer *p = arg;
@@ -947,11 +1023,15 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
 		if ((is_vid || is_tch) && is_rx &&
-		    (ops->vidioc_g_fmt_vid_cap || ops->vidioc_g_fmt_vid_cap_mplane))
+		    (ops->vidioc_g_fmt_vid_cap ||
+		     ops->vidioc_g_ext_fmt_vid_cap ||
+		     ops->vidioc_g_fmt_vid_cap_mplane))
 			return 0;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (is_vid && is_rx && ops->vidioc_g_fmt_vid_cap_mplane)
+		if (is_vid && is_rx &&
+		    (ops->vidioc_g_fmt_vid_cap_mplane ||
+		     ops->vidioc_g_ext_fmt_vid_cap))
 			return 0;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
@@ -960,11 +1040,15 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
 		break;
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
 		if (is_vid && is_tx &&
-		    (ops->vidioc_g_fmt_vid_out || ops->vidioc_g_fmt_vid_out_mplane))
+		    (ops->vidioc_g_fmt_vid_out ||
+		     ops->vidioc_g_ext_fmt_vid_out ||
+		     ops->vidioc_g_fmt_vid_out_mplane))
 			return 0;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		if (is_vid && is_tx && ops->vidioc_g_fmt_vid_out_mplane)
+		if (is_vid && is_tx &&
+		    (ops->vidioc_g_ext_fmt_vid_out ||
+		     ops->vidioc_g_fmt_vid_out_mplane))
 			return 0;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
@@ -1044,6 +1128,197 @@ static void v4l_sanitize_format(struct v4l2_format *fmt)
 	       sizeof(fmt->fmt.pix) - offset);
 }
 
+int v4l2_ext_format_to_format(const struct v4l2_ext_format *e,
+			      struct v4l2_format *f, bool mplane_cap,
+			      bool strict)
+{
+	const struct v4l2_plane_ext_pix_format *pe;
+	struct v4l2_plane_pix_format *p;
+	unsigned int i;
+
+	memset(f, 0, sizeof(*f));
+
+	switch (e->type) {
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+		/*
+		 * Make sure no modifier is required before doing the
+		 * conversion.
+		 */
+		if (e->fmt.pix.modifier && strict)
+			return -EINVAL;
+
+		if ((e->fmt.pix.num_planes > VIDEO_MAX_PLANES ||
+		     !e->fmt.pix.num_planes) && strict)
+			return -EINVAL;
+
+		if (e->fmt.pix.num_planes > 1 && !mplane_cap && strict)
+			return -EINVAL;
+
+		if (!mplane_cap) {
+			f->fmt.pix.width = e->fmt.pix.width;
+			f->fmt.pix.height = e->fmt.pix.height;
+			f->fmt.pix.pixelformat = e->fmt.pix.pixelformat;
+			f->fmt.pix.field = e->fmt.pix.field;
+			f->fmt.pix.colorspace = e->fmt.pix.colorspace;
+			f->fmt.pix.flags = e->fmt.pix.flags;
+			f->fmt.pix.ycbcr_enc = e->fmt.pix.ycbcr_enc;
+			f->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
+			f->fmt.pix.quantization = e->fmt.pix.quantization;
+			pe = &e->fmt.pix.plane_fmt[0];
+			f->fmt.pix.bytesperline = pe->bytesperline;
+			f->fmt.pix.sizeimage = pe->sizeimage;
+			f->type = e->type;
+			break;
+		}
+
+		f->fmt.pix_mp.width = e->fmt.pix.width;
+		f->fmt.pix_mp.height = e->fmt.pix.height;
+		f->fmt.pix_mp.pixelformat = e->fmt.pix.pixelformat;
+		f->fmt.pix_mp.field = e->fmt.pix.field;
+		f->fmt.pix_mp.colorspace = e->fmt.pix.colorspace;
+		f->fmt.pix_mp.flags = e->fmt.pix.flags;
+		f->fmt.pix_mp.ycbcr_enc = e->fmt.pix.ycbcr_enc;
+		f->fmt.pix_mp.quantization = e->fmt.pix.quantization;
+		if (e->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+			f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+		else
+			f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+
+		for (i = 0; i < VIDEO_MAX_PLANES; i++) {
+			pe = &e->fmt.pix.plane_fmt[i];
+			p = &f->fmt.pix_mp.plane_fmt[i];
+			p->bytesperline = pe->bytesperline;
+			p->sizeimage = pe->sizeimage;
+		}
+		break;
+
+	case V4L2_BUF_TYPE_VBI_CAPTURE:
+	case V4L2_BUF_TYPE_VBI_OUTPUT:
+		f->type = e->type;
+		f->fmt.vbi = e->fmt.vbi;
+		break;
+
+	case V4L2_BUF_TYPE_SLICED_VBI_CAPTURE:
+	case V4L2_BUF_TYPE_SLICED_VBI_OUTPUT:
+		f->type = e->type;
+		f->fmt.sliced = e->fmt.sliced;
+		break;
+
+	case V4L2_BUF_TYPE_SDR_CAPTURE:
+	case V4L2_BUF_TYPE_SDR_OUTPUT:
+		f->type = e->type;
+		f->fmt.sdr = e->fmt.sdr;
+		break;
+
+	case V4L2_BUF_TYPE_META_CAPTURE:
+	case V4L2_BUF_TYPE_META_OUTPUT:
+		f->type = e->type;
+		f->fmt.meta = e->fmt.meta;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_ext_format_to_format);
+
+int v4l2_format_to_ext_format(const struct v4l2_format *f,
+			      struct v4l2_ext_format *e, bool strict)
+{
+	const struct v4l2_plane_pix_format *p;
+	struct v4l2_plane_ext_pix_format *pe;
+	unsigned int i;
+
+	memset(e, 0, sizeof(*e));
+
+	switch (f->type) {
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+		e->fmt.pix.width = f->fmt.pix.width;
+		e->fmt.pix.height = f->fmt.pix.height;
+		e->fmt.pix.pixelformat = f->fmt.pix.pixelformat;
+		e->fmt.pix.field = f->fmt.pix.field;
+		e->fmt.pix.colorspace = f->fmt.pix.colorspace;
+		e->fmt.pix.flags = f->fmt.pix.flags;
+		e->fmt.pix.ycbcr_enc = f->fmt.pix.ycbcr_enc;
+		e->fmt.pix.quantization = f->fmt.pix.quantization;
+		e->fmt.pix.num_planes = 1;
+		e->fmt.pix.plane_fmt[0].bytesperline = f->fmt.pix.bytesperline;
+		e->fmt.pix.plane_fmt[0].sizeimage = f->fmt.pix.sizeimage;
+		e->type = f->type;
+		break;
+
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		if ((f->fmt.pix_mp.num_planes > VIDEO_MAX_PLANES ||
+		     !f->fmt.pix_mp.num_planes) && strict)
+			return -EINVAL;
+
+		e->fmt.pix.width = f->fmt.pix_mp.width;
+		e->fmt.pix.height = f->fmt.pix_mp.height;
+		e->fmt.pix.pixelformat = f->fmt.pix_mp.pixelformat;
+		e->fmt.pix.field = f->fmt.pix_mp.field;
+		e->fmt.pix.colorspace = f->fmt.pix_mp.colorspace;
+		e->fmt.pix.flags = f->fmt.pix_mp.flags;
+		e->fmt.pix.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
+		e->fmt.pix.quantization = f->fmt.pix_mp.quantization;
+		e->fmt.pix.num_planes = f->fmt.pix_mp.num_planes;
+		if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+			e->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+		else
+			e->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
+
+		for (i = 0; i < VIDEO_MAX_PLANES; i++) {
+			pe = &e->fmt.pix.plane_fmt[i];
+			p = &f->fmt.pix_mp.plane_fmt[i];
+			pe->bytesperline = p->bytesperline;
+			pe->sizeimage = p->sizeimage;
+		}
+		break;
+
+	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
+		/*
+		 * OVERLAY formats are not supported by the _EXT_FMT
+		 * ioctl()s.
+		 */
+		return -EINVAL;
+
+	case V4L2_BUF_TYPE_VBI_CAPTURE:
+	case V4L2_BUF_TYPE_VBI_OUTPUT:
+		e->type = f->type;
+		e->fmt.vbi = f->fmt.vbi;
+		break;
+
+	case V4L2_BUF_TYPE_SLICED_VBI_CAPTURE:
+	case V4L2_BUF_TYPE_SLICED_VBI_OUTPUT:
+		e->type = f->type;
+		e->fmt.sliced = f->fmt.sliced;
+		break;
+
+	case V4L2_BUF_TYPE_SDR_CAPTURE:
+	case V4L2_BUF_TYPE_SDR_OUTPUT:
+		e->type = f->type;
+		e->fmt.sdr = f->fmt.sdr;
+		break;
+
+	case V4L2_BUF_TYPE_META_CAPTURE:
+	case V4L2_BUF_TYPE_META_OUTPUT:
+		e->type = f->type;
+		e->fmt.meta = f->fmt.meta;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_format_to_ext_format);
+
 static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
@@ -1466,6 +1741,38 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
 	return ret;
 }
 
+static int v4l_g_fmt_ext_pix(const struct v4l2_ioctl_ops *ops,
+			     struct file *file, void *fh,
+			     struct v4l2_format *f)
+{
+	struct v4l2_ext_format ef = {
+		.type = f->type,
+	};
+	int ret;
+
+	switch (f->type) {
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		ret = ops->vidioc_g_ext_fmt_vid_cap(file, fh, &ef.fmt.pix);
+		break;
+
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		ret = ops->vidioc_g_ext_fmt_vid_out(file, fh, &ef.fmt.pix);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	if (ret)
+		return ret;
+
+	return v4l2_ext_format_to_format(&ef, f,
+					 V4L2_TYPE_IS_MULTIPLANAR(f->type),
+					 true);
+}
+
 static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
@@ -1501,15 +1808,22 @@ static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
 
 	switch (p->type) {
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
-		if (unlikely(!ops->vidioc_g_fmt_vid_cap))
-			break;
-		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
-		ret = ops->vidioc_g_fmt_vid_cap(file, fh, arg);
-		/* just in case the driver zeroed it again */
-		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
-		return ret;
+		if (ops->vidioc_g_fmt_vid_cap) {
+			p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
+			ret = ops->vidioc_g_fmt_vid_cap(file, fh, arg);
+			/* just in case the driver zeroed it again */
+			p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
+			return ret;
+		} else if (ops->vidioc_g_ext_fmt_vid_cap) {
+			return v4l_g_fmt_ext_pix(ops, file, fh, p);
+		}
+		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		return ops->vidioc_g_fmt_vid_cap_mplane(file, fh, arg);
+		if (ops->vidioc_g_fmt_vid_cap_mplane)
+			return ops->vidioc_g_fmt_vid_cap_mplane(file, fh, arg);
+		else if (ops->vidioc_g_ext_fmt_vid_cap)
+			return v4l_g_fmt_ext_pix(ops, file, fh, p);
+		break;
 	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
 		return ops->vidioc_g_fmt_vid_overlay(file, fh, arg);
 	case V4L2_BUF_TYPE_VBI_CAPTURE:
@@ -1517,15 +1831,22 @@ static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
 	case V4L2_BUF_TYPE_SLICED_VBI_CAPTURE:
 		return ops->vidioc_g_fmt_sliced_vbi_cap(file, fh, arg);
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
-		if (unlikely(!ops->vidioc_g_fmt_vid_out))
-			break;
-		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
-		ret = ops->vidioc_g_fmt_vid_out(file, fh, arg);
-		/* just in case the driver zeroed it again */
-		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
-		return ret;
+		if (ops->vidioc_g_fmt_vid_out) {
+			p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
+			ret = ops->vidioc_g_fmt_vid_out(file, fh, arg);
+			/* just in case the driver zeroed it again */
+			p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
+			return ret;
+		} else if (ops->vidioc_g_ext_fmt_vid_out) {
+			return v4l_g_fmt_ext_pix(ops, file, fh, p);
+		}
+		break;
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		return ops->vidioc_g_fmt_vid_out_mplane(file, fh, arg);
+		if (ops->vidioc_g_fmt_vid_out_mplane)
+			return ops->vidioc_g_fmt_vid_out_mplane(file, fh, arg);
+		else if (ops->vidioc_g_ext_fmt_vid_out)
+			return v4l_g_fmt_ext_pix(ops, file, fh, p);
+		break;
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
 		return ops->vidioc_g_fmt_vid_out_overlay(file, fh, arg);
 	case V4L2_BUF_TYPE_VBI_OUTPUT:
@@ -1544,6 +1865,43 @@ static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
 	return -EINVAL;
 }
 
+static int v4l_g_ext_fmt(const struct v4l2_ioctl_ops *ops,
+			 struct file *file, void *fh, void *arg)
+{
+	struct v4l2_ext_format *ef = arg;
+	struct v4l2_format f = {
+		.type = ef->type,
+	};
+	int ret;
+
+	ret = check_fmt(file, ef->type);
+	if (ret)
+		return ret;
+
+	memset(&ef->fmt, 0, sizeof(ef->fmt));
+
+	switch (ef->type) {
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+		if (ops->vidioc_g_ext_fmt_vid_cap)
+			return ops->vidioc_g_ext_fmt_vid_cap(file, fh,
+							     &ef->fmt.pix);
+		break;
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+		if (ops->vidioc_g_ext_fmt_vid_out)
+			return ops->vidioc_g_ext_fmt_vid_out(file, fh,
+							     &ef->fmt.pix);
+		break;
+	default:
+		break;
+	}
+
+	ret = v4l_g_fmt(ops, file, fh, &f);
+	if (ret)
+		return ret;
+
+	return v4l2_format_to_ext_format(&f, ef, true);
+}
+
 static void v4l_pix_format_touch(struct v4l2_pix_format *p)
 {
 	/*
@@ -1559,6 +1917,40 @@ static void v4l_pix_format_touch(struct v4l2_pix_format *p)
 	p->xfer_func = 0;
 }
 
+static int v4l_s_fmt_ext_pix(const struct v4l2_ioctl_ops *ops,
+			     struct file *file, void *fh,
+			     struct v4l2_format *f)
+{
+	struct v4l2_ext_format ef;
+	int ret;
+
+	ret = v4l2_format_to_ext_format(f, &ef, false);
+	if (ret)
+		return ret;
+
+	switch (f->type) {
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		ret = ops->vidioc_s_ext_fmt_vid_cap(file, fh, &ef.fmt.pix);
+		break;
+
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		ret = ops->vidioc_s_ext_fmt_vid_out(file, fh, &ef.fmt.pix);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	if (ret)
+		return ret;
+
+	return v4l2_ext_format_to_format(&ef, f,
+					 V4L2_TYPE_IS_MULTIPLANAR(f->type),
+					 true);
+}
+
 static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
@@ -1577,23 +1969,31 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
 
 	switch (p->type) {
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
-		if (unlikely(!ops->vidioc_s_fmt_vid_cap))
-			break;
-		CLEAR_AFTER_FIELD(p, fmt.pix);
-		ret = ops->vidioc_s_fmt_vid_cap(file, fh, arg);
-		/* just in case the driver zeroed it again */
-		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
+		if (ops->vidioc_s_fmt_vid_cap) {
+			CLEAR_AFTER_FIELD(p, fmt.pix);
+			ret = ops->vidioc_s_fmt_vid_cap(file, fh, arg);
+			/* just in case the driver zeroed it again */
+			p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
+		} else if (ops->vidioc_s_ext_fmt_vid_cap) {
+			ret = v4l_s_fmt_ext_pix(ops, file, fh, arg);
+		} else {
+			ret = -EINVAL;
+		}
+
 		if (vfd->vfl_type == VFL_TYPE_TOUCH)
 			v4l_pix_format_touch(&p->fmt.pix);
 		return ret;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (unlikely(!ops->vidioc_s_fmt_vid_cap_mplane))
-			break;
-		CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
-		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
-			CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
-					  bytesperline);
-		return ops->vidioc_s_fmt_vid_cap_mplane(file, fh, arg);
+		if (ops->vidioc_s_fmt_vid_cap_mplane) {
+			CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
+			for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
+				CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
+						  bytesperline);
+			return ops->vidioc_s_fmt_vid_cap_mplane(file, fh, arg);
+		} else if (ops->vidioc_s_ext_fmt_vid_cap) {
+			return v4l_s_fmt_ext_pix(ops, file, fh, arg);
+		}
+		break;
 	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
 		if (unlikely(!ops->vidioc_s_fmt_vid_overlay))
 			break;
@@ -1610,21 +2010,27 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
 		CLEAR_AFTER_FIELD(p, fmt.sliced);
 		return ops->vidioc_s_fmt_sliced_vbi_cap(file, fh, arg);
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
-		if (unlikely(!ops->vidioc_s_fmt_vid_out))
-			break;
-		CLEAR_AFTER_FIELD(p, fmt.pix);
-		ret = ops->vidioc_s_fmt_vid_out(file, fh, arg);
-		/* just in case the driver zeroed it again */
-		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
-		return ret;
+		if (ops->vidioc_s_fmt_vid_out) {
+			CLEAR_AFTER_FIELD(p, fmt.pix);
+			ret = ops->vidioc_s_fmt_vid_out(file, fh, arg);
+			/* just in case the driver zeroed it again */
+			p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
+			return ret;
+		} else if (ops->vidioc_s_ext_fmt_vid_out) {
+			return v4l_s_fmt_ext_pix(ops, file, fh, arg);
+		}
+		break;
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		if (unlikely(!ops->vidioc_s_fmt_vid_out_mplane))
-			break;
-		CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
-		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
-			CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
-					  bytesperline);
-		return ops->vidioc_s_fmt_vid_out_mplane(file, fh, arg);
+		if (ops->vidioc_s_fmt_vid_out_mplane) {
+			CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
+			for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
+				CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
+						  bytesperline);
+			return ops->vidioc_s_fmt_vid_out_mplane(file, fh, arg);
+		} else if (ops->vidioc_s_ext_fmt_vid_out) {
+			return v4l_s_fmt_ext_pix(ops, file, fh, arg);
+		}
+		break;
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
 		if (unlikely(!ops->vidioc_s_fmt_vid_out_overlay))
 			break;
@@ -1664,6 +2070,84 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
 	return -EINVAL;
 }
 
+static int v4l_s_ext_fmt(const struct v4l2_ioctl_ops *ops,
+			 struct file *file, void *fh, void *arg)
+{
+	struct video_device *vfd = video_devdata(file);
+	struct v4l2_ext_format *ef = arg;
+	struct v4l2_format f;
+	int ret;
+
+	ret = check_fmt(file, ef->type);
+	if (ret)
+		return ret;
+
+	switch (ef->type) {
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+		if (ops->vidioc_s_ext_fmt_vid_cap)
+			return ops->vidioc_s_ext_fmt_vid_cap(file, fh,
+							     &ef->fmt.pix);
+		break;
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+		if (ops->vidioc_s_ext_fmt_vid_out)
+			return ops->vidioc_s_ext_fmt_vid_out(file, fh,
+							     &ef->fmt.pix);
+		break;
+	default:
+		break;
+	}
+
+	ret = v4l2_ext_format_to_format(ef, &f,
+					vfd->device_caps &
+					(V4L2_CAP_VIDEO_CAPTURE_MPLANE |
+					 V4L2_CAP_VIDEO_OUTPUT_MPLANE |
+					 V4L2_CAP_VIDEO_M2M_MPLANE),
+					false);
+	if (ret)
+		return ret;
+
+	ret = v4l_s_fmt(ops, file, fh, &f);
+	if (ret)
+		return ret;
+
+	return v4l2_format_to_ext_format(&f, ef, true);
+}
+
+static int v4l_try_fmt_ext_pix(const struct v4l2_ioctl_ops *ops,
+			       struct file *file, void *fh,
+			       struct v4l2_format *f)
+{
+	struct v4l2_ext_format ef;
+	int ret;
+
+	ret = v4l2_format_to_ext_format(f, &ef, false);
+	if (ret)
+		return ret;
+
+	switch (f->type) {
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		ret = ops->vidioc_try_ext_fmt_vid_cap(file, fh, &ef.fmt.pix);
+		break;
+
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		ret = ops->vidioc_try_ext_fmt_vid_out(file, fh, &ef.fmt.pix);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	if (ret)
+		return ret;
+
+	return v4l2_ext_format_to_format(&ef, f,
+					 V4L2_TYPE_IS_MULTIPLANAR(f->type),
+					 true);
+
+}
+
 static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
@@ -1679,23 +2163,32 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
 
 	switch (p->type) {
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
-		if (unlikely(!ops->vidioc_try_fmt_vid_cap))
-			break;
-		CLEAR_AFTER_FIELD(p, fmt.pix);
-		ret = ops->vidioc_try_fmt_vid_cap(file, fh, arg);
-		/* just in case the driver zeroed it again */
-		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
-		if (vfd->vfl_type == VFL_TYPE_TOUCH)
-			v4l_pix_format_touch(&p->fmt.pix);
-		return ret;
+		if (ops->vidioc_try_fmt_vid_cap) {
+			CLEAR_AFTER_FIELD(p, fmt.pix);
+			ret = ops->vidioc_try_fmt_vid_cap(file, fh, arg);
+			/* just in case the driver zeroed it again */
+			p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
+			if (vfd->vfl_type == VFL_TYPE_TOUCH)
+				v4l_pix_format_touch(&p->fmt.pix);
+			return ret;
+		} else if (ops->vidioc_try_ext_fmt_vid_cap) {
+			ret = v4l_try_fmt_ext_pix(ops, file, fh, p);
+			if (vfd->vfl_type == VFL_TYPE_TOUCH)
+				v4l_pix_format_touch(&p->fmt.pix);
+			return ret;
+		}
+		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (unlikely(!ops->vidioc_try_fmt_vid_cap_mplane))
-			break;
-		CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
-		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
-			CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
-					  bytesperline);
-		return ops->vidioc_try_fmt_vid_cap_mplane(file, fh, arg);
+		if (ops->vidioc_try_fmt_vid_cap_mplane) {
+			CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
+			for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
+				CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
+						  bytesperline);
+			return ops->vidioc_try_fmt_vid_cap_mplane(file, fh, arg);
+		} else if (ops->vidioc_try_ext_fmt_vid_cap) {
+			return v4l_try_fmt_ext_pix(ops, file, fh, p);
+		}
+		break;
 	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
 		if (unlikely(!ops->vidioc_try_fmt_vid_overlay))
 			break;
@@ -1712,21 +2205,27 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
 		CLEAR_AFTER_FIELD(p, fmt.sliced);
 		return ops->vidioc_try_fmt_sliced_vbi_cap(file, fh, arg);
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
-		if (unlikely(!ops->vidioc_try_fmt_vid_out))
-			break;
-		CLEAR_AFTER_FIELD(p, fmt.pix);
-		ret = ops->vidioc_try_fmt_vid_out(file, fh, arg);
-		/* just in case the driver zeroed it again */
-		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
-		return ret;
+		if (ops->vidioc_try_fmt_vid_out) {
+			CLEAR_AFTER_FIELD(p, fmt.pix);
+			ret = ops->vidioc_try_fmt_vid_out(file, fh, arg);
+			/* just in case the driver zeroed it again */
+			p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
+			return ret;
+		} else if (ops->vidioc_try_ext_fmt_vid_cap) {
+			return v4l_try_fmt_ext_pix(ops, file, fh, p);
+		}
+		break;
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		if (unlikely(!ops->vidioc_try_fmt_vid_out_mplane))
-			break;
-		CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
-		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
-			CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
-					  bytesperline);
-		return ops->vidioc_try_fmt_vid_out_mplane(file, fh, arg);
+		if (ops->vidioc_try_fmt_vid_out_mplane) {
+			CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
+			for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
+				CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
+						  bytesperline);
+			return ops->vidioc_try_fmt_vid_out_mplane(file, fh, arg);
+		} else if (ops->vidioc_try_ext_fmt_vid_cap) {
+			return v4l_try_fmt_ext_pix(ops, file, fh, p);
+		}
+		break;
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
 		if (unlikely(!ops->vidioc_try_fmt_vid_out_overlay))
 			break;
@@ -1766,6 +2265,49 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
 	return -EINVAL;
 }
 
+static int v4l_try_ext_fmt(const struct v4l2_ioctl_ops *ops,
+			   struct file *file, void *fh, void *arg)
+{
+	struct video_device *vfd = video_devdata(file);
+	struct v4l2_ext_format *ef = arg;
+	struct v4l2_format f;
+	int ret;
+
+	ret = check_fmt(file, ef->type);
+	if (ret)
+		return ret;
+
+	switch (ef->type) {
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+		if (ops->vidioc_try_ext_fmt_vid_cap)
+			return ops->vidioc_try_ext_fmt_vid_cap(file, fh,
+							       &ef->fmt.pix);
+		break;
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+		if (ops->vidioc_try_ext_fmt_vid_out)
+			return ops->vidioc_try_ext_fmt_vid_out(file, fh,
+							       &ef->fmt.pix);
+		break;
+	default:
+		break;
+	}
+
+	ret = v4l2_ext_format_to_format(ef, &f,
+					vfd->device_caps &
+					(V4L2_CAP_VIDEO_CAPTURE_MPLANE |
+					 V4L2_CAP_VIDEO_OUTPUT_MPLANE |
+					 V4L2_CAP_VIDEO_M2M_MPLANE),
+					false);
+	if (ret)
+		return ret;
+
+	ret = v4l_try_fmt(ops, file, fh, &f);
+	if (ret)
+		return ret;
+
+	return v4l2_format_to_ext_format(&f, ef, true);
+}
+
 static int v4l_streamon(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
@@ -2690,7 +3232,9 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
 	IOCTL_INFO(VIDIOC_QUERYCAP, v4l_querycap, v4l_print_querycap, 0),
 	IOCTL_INFO(VIDIOC_ENUM_FMT, v4l_enum_fmt, v4l_print_fmtdesc, INFO_FL_CLEAR(v4l2_fmtdesc, type)),
 	IOCTL_INFO(VIDIOC_G_FMT, v4l_g_fmt, v4l_print_format, 0),
+	IOCTL_INFO(VIDIOC_G_EXT_FMT, v4l_g_ext_fmt, v4l_print_ext_format, 0),
 	IOCTL_INFO(VIDIOC_S_FMT, v4l_s_fmt, v4l_print_format, INFO_FL_PRIO),
+	IOCTL_INFO(VIDIOC_S_EXT_FMT, v4l_s_ext_fmt, v4l_print_ext_format, INFO_FL_PRIO),
 	IOCTL_INFO(VIDIOC_REQBUFS, v4l_reqbufs, v4l_print_requestbuffers, INFO_FL_PRIO | INFO_FL_QUEUE),
 	IOCTL_INFO(VIDIOC_QUERYBUF, v4l_querybuf, v4l_print_buffer, INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_buffer, length)),
 	IOCTL_INFO(VIDIOC_G_FBUF, v4l_stub_g_fbuf, v4l_print_framebuffer, 0),
@@ -2737,6 +3281,7 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
 	IOCTL_INFO(VIDIOC_S_JPEGCOMP, v4l_stub_s_jpegcomp, v4l_print_jpegcompression, INFO_FL_PRIO),
 	IOCTL_INFO(VIDIOC_QUERYSTD, v4l_querystd, v4l_print_std, 0),
 	IOCTL_INFO(VIDIOC_TRY_FMT, v4l_try_fmt, v4l_print_format, 0),
+	IOCTL_INFO(VIDIOC_TRY_EXT_FMT, v4l_try_ext_fmt, v4l_print_ext_format, 0),
 	IOCTL_INFO(VIDIOC_ENUMAUDIO, v4l_stub_enumaudio, v4l_print_audio, INFO_FL_CLEAR(v4l2_audio, index)),
 	IOCTL_INFO(VIDIOC_ENUMAUDOUT, v4l_stub_enumaudout, v4l_print_audioout, INFO_FL_CLEAR(v4l2_audioout, index)),
 	IOCTL_INFO(VIDIOC_G_PRIORITY, v4l_g_priority, v4l_print_u32, 0),
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index 4bba65a59d46..39ac07fbc7b7 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -48,11 +48,16 @@ struct v4l2_fh;
  * @vidioc_g_fmt_vid_cap: pointer to the function that implements
  *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for video capture
  *	in single plane mode
+ * @vidioc_g_ext_fmt_vid_cap: pointer to the function that implements
+ *	:ref:`VIDIOC_G_EXT_FMT <vidioc_g_ext_fmt>` ioctl logic for video
+ *	capture
  * @vidioc_g_fmt_vid_overlay: pointer to the function that implements
  *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for video overlay
  * @vidioc_g_fmt_vid_out: pointer to the function that implements
  *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for video out
  *	in single plane mode
+ * @vidioc_g_ext_fmt_vid_out: pointer to the function that implements
+ *	:ref:`VIDIOC_G_EXT_FMT <vidioc_g_ext_fmt>` ioctl logic for video out
  * @vidioc_g_fmt_vid_out_overlay: pointer to the function that implements
  *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for video overlay output
  * @vidioc_g_fmt_vbi_cap: pointer to the function that implements
@@ -82,11 +87,16 @@ struct v4l2_fh;
  * @vidioc_s_fmt_vid_cap: pointer to the function that implements
  *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for video capture
  *	in single plane mode
+ * @vidioc_s_ext_fmt_vid_cap: pointer to the function that implements
+ *	:ref:`VIDIOC_S_EXT_FMT <vidioc_s_ext_fmt>` ioctl logic for video
+ *	capture
  * @vidioc_s_fmt_vid_overlay: pointer to the function that implements
  *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for video overlay
  * @vidioc_s_fmt_vid_out: pointer to the function that implements
  *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for video out
  *	in single plane mode
+ * @vidioc_s_ext_fmt_vid_out: pointer to the function that implements
+ *	:ref:`VIDIOC_S_EXT_FMT <vidioc_g_fmt>` ioctl logic for video out
  * @vidioc_s_fmt_vid_out_overlay: pointer to the function that implements
  *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for video overlay output
  * @vidioc_s_fmt_vbi_cap: pointer to the function that implements
@@ -116,11 +126,16 @@ struct v4l2_fh;
  * @vidioc_try_fmt_vid_cap: pointer to the function that implements
  *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for video capture
  *	in single plane mode
+ * @vidioc_try_ext_fmt_vid_cap: pointer to the function that implements
+ *	:ref:`VIDIOC_TRY_EXT_FMT <vidioc_try_ext_fmt>` ioctl logic for video
+	capture
  * @vidioc_try_fmt_vid_overlay: pointer to the function that implements
  *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for video overlay
  * @vidioc_try_fmt_vid_out: pointer to the function that implements
  *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for video out
  *	in single plane mode
+ * @vidioc_try_ext_fmt_vid_out: pointer to the function that implements
+ *	:ref:`VIDIOC_TRY_EXT_FMT <vidioc_g_fmt>` ioctl logic for video out
  * @vidioc_try_fmt_vid_out_overlay: pointer to the function that implements
  *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for video overlay
  *	output
@@ -319,10 +334,14 @@ struct v4l2_ioctl_ops {
 	/* VIDIOC_G_FMT handlers */
 	int (*vidioc_g_fmt_vid_cap)(struct file *file, void *fh,
 				    struct v4l2_format *f);
+	int (*vidioc_g_ext_fmt_vid_cap)(struct file *file, void *fh,
+					struct v4l2_ext_pix_format *f);
 	int (*vidioc_g_fmt_vid_overlay)(struct file *file, void *fh,
 					struct v4l2_format *f);
 	int (*vidioc_g_fmt_vid_out)(struct file *file, void *fh,
 				    struct v4l2_format *f);
+	int (*vidioc_g_ext_fmt_vid_out)(struct file *file, void *fh,
+					struct v4l2_ext_pix_format *f);
 	int (*vidioc_g_fmt_vid_out_overlay)(struct file *file, void *fh,
 					    struct v4l2_format *f);
 	int (*vidioc_g_fmt_vbi_cap)(struct file *file, void *fh,
@@ -349,10 +368,14 @@ struct v4l2_ioctl_ops {
 	/* VIDIOC_S_FMT handlers */
 	int (*vidioc_s_fmt_vid_cap)(struct file *file, void *fh,
 				    struct v4l2_format *f);
+	int (*vidioc_s_ext_fmt_vid_cap)(struct file *file, void *fh,
+					struct v4l2_ext_pix_format *f);
 	int (*vidioc_s_fmt_vid_overlay)(struct file *file, void *fh,
 					struct v4l2_format *f);
 	int (*vidioc_s_fmt_vid_out)(struct file *file, void *fh,
 				    struct v4l2_format *f);
+	int (*vidioc_s_ext_fmt_vid_out)(struct file *file, void *fh,
+					struct v4l2_ext_pix_format *f);
 	int (*vidioc_s_fmt_vid_out_overlay)(struct file *file, void *fh,
 					    struct v4l2_format *f);
 	int (*vidioc_s_fmt_vbi_cap)(struct file *file, void *fh,
@@ -379,10 +402,14 @@ struct v4l2_ioctl_ops {
 	/* VIDIOC_TRY_FMT handlers */
 	int (*vidioc_try_fmt_vid_cap)(struct file *file, void *fh,
 				      struct v4l2_format *f);
+	int (*vidioc_try_ext_fmt_vid_cap)(struct file *file, void *fh,
+					  struct v4l2_ext_pix_format *f);
 	int (*vidioc_try_fmt_vid_overlay)(struct file *file, void *fh,
 					  struct v4l2_format *f);
 	int (*vidioc_try_fmt_vid_out)(struct file *file, void *fh,
 				      struct v4l2_format *f);
+	int (*vidioc_try_ext_fmt_vid_out)(struct file *file, void *fh,
+					  struct v4l2_ext_pix_format *f);
 	int (*vidioc_try_fmt_vid_out_overlay)(struct file *file, void *fh,
 					     struct v4l2_format *f);
 	int (*vidioc_try_fmt_vbi_cap)(struct file *file, void *fh,
@@ -724,4 +751,10 @@ long int video_usercopy(struct file *file, unsigned int cmd,
 long int video_ioctl2(struct file *file,
 		      unsigned int cmd, unsigned long int arg);
 
+int v4l2_format_to_ext_format(const struct v4l2_format *f,
+			      struct v4l2_ext_format *e, bool strict);
+int v4l2_ext_format_to_format(const struct v4l2_ext_format *e,
+			      struct v4l2_format *f,
+			      bool mplane_cap, bool strict);
+
 #endif /* _V4L2_IOCTL_H */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 530638dffd93..c7b169de1c7b 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -2196,6 +2196,55 @@ struct v4l2_pix_format_mplane {
 	__u8				reserved[7];
 } __attribute__ ((packed));
 
+/**
+ * struct v4l2_plane_ext_pix_format - additional, per-plane format definition
+ * @sizeimage:		maximum size in bytes required for data, for which
+ *			this plane will be used
+ * @bytesperline:	distance in bytes between the leftmost pixels in two
+ *			adjacent lines
+ */
+struct v4l2_plane_ext_pix_format {
+	__u32 sizeimage;
+	__u32 bytesperline;
+};
+
+/**
+ * struct v4l2_ext_pix_format - extended single/multiplanar format definition
+ * @width: image width in pixels
+ * @height: image height in pixels
+ * @field: enum v4l2_field; field order (for interlaced video)
+ * @pixelformat: little endian four character code (fourcc)
+ * @modifier: modifier applied to the format (used for tiled formats and other
+ *	      kind of HW-specific formats, like compressed formats)
+ * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
+ * @num_planes: number of planes for this format. Should be equal to 1
+ *		for single-planar formats and greater than 1 for
+ *		multiplanar ones
+ * @plane_fmt: per-plane information
+ * @flags: format flags (V4L2_PIX_FMT_FLAG_*)
+ * @ycbcr_enc: enum v4l2_ycbcr_encoding, Y'CbCr encoding
+ * @hsv_enc: enum v4l2_hsv_encoding, HSV encoding
+ * @quantization: enum v4l2_quantization, colorspace quantization
+ * @xfer_func: enum v4l2_xfer_func, colorspace transfer function
+ */
+struct v4l2_ext_pix_format {
+	__u32 width;
+	__u32 height;
+	__u32 field;
+	__u32 pixelformat;
+	__u64 modifier;
+	__u32 colorspace;
+	__u32 num_planes;
+	struct v4l2_plane_ext_pix_format plane_fmt[VIDEO_MAX_PLANES];
+	__u8 flags;
+	union {
+		__u8 ycbcr_enc;
+		__u8 hsv_enc;
+	};
+	__u8 quantization;
+	__u8 xfer_func;
+};
+
 /**
  * struct v4l2_sdr_format - SDR format definition
  * @pixelformat:	little endian four character code (fourcc)
@@ -2241,6 +2290,35 @@ struct v4l2_format {
 	} fmt;
 };
 
+/**
+ * struct v4l2_ext_format - extended stream data format
+ * @type: enum v4l2_buf_type; type of the data stream.
+ *	  V4L2_BUF_TYPE_VIDEO[_OUTPUT]_OVERLAY and
+ *	  V4L2_BUF_TYPE_VIDEO_{CAPTURE,OUTPUT}_MPLANE are not supported
+ * @pix: definition of an image format. Used for
+ *	 V4L2_BUF_TYPE_VIDEO_{CAPTURE,OUTPUT} types
+ * @vbi: raw VBI capture or output parameters. Used for
+ *	 V4L2_BUF_TYPE_VBI_{CAPTURE,OUTPUT} types
+ * @sliced: sliced VBI capture or output parameters. Used for
+ *	    V4L2_BUF_TYPE_SLICED_VBI_{CAPTURE,OUTPUT} types.
+ * @sdr: SDR capture or output parameters. Used for
+ *	 V4L2_BUF_TYPE_SDR_{CAPTURE,OUTPUT} types
+ * @meta: meta capture or output parameters. Used for
+ *	  V4L2_BUF_TYPE_META_{CAPTURE,OUTPUT} types
+ * @raw_data: placeholder for future extensions and custom formats
+ */
+struct v4l2_ext_format {
+	__u32 type;
+	union {
+		struct v4l2_ext_pix_format pix;
+		struct v4l2_vbi_format vbi;
+		struct v4l2_sliced_vbi_format sliced;
+		struct v4l2_sdr_format sdr;
+		struct v4l2_meta_format meta;
+		__u8 raw_data[200];
+	} fmt;
+};
+
 /*	Stream type-dependent parameters
  */
 struct v4l2_streamparm {
@@ -2505,6 +2583,9 @@ struct v4l2_create_buffers {
 
 #define VIDIOC_QUERY_EXT_CTRL	_IOWR('V', 103, struct v4l2_query_ext_ctrl)
 
+#define VIDIOC_G_EXT_FMT	_IOWR('V', 104, struct v4l2_ext_format)
+#define VIDIOC_S_EXT_FMT	_IOWR('V', 105, struct v4l2_ext_format)
+#define VIDIOC_TRY_EXT_FMT	_IOWR('V', 106, struct v4l2_ext_format)
 /* Reminder: when adding new ioctls please add support for them to
    drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
 
-- 
2.21.0

