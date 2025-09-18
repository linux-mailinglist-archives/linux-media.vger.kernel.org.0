Return-Path: <linux-media+bounces-39343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEFAB1F7ED
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09F7D189274C
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62B51DE4DC;
	Sun, 10 Aug 2025 01:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vIKQDfmt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86261D63C5
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789601; cv=none; b=SDeB2aUl3XkDU+jMtH1gXAuzoZqen5642yi7lFhHKNwKIrAJk/dtaMXvPEan9Fb8QCXMs4+1kAKhvObBcugqYbAu0OQLA88uD5cDpxa8a9Zfco8Fg06yTLCP5jusCvmLPqhlCcs/mbbYJfnluMPlVm/VGleMgP7WWiWUWYp9Go0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789601; c=relaxed/simple;
	bh=s8jkedVtBRn13jQQf5xmelzvH0lAh0d+LVX31hpCT6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qgMNzfhTzDznZyfzZIFpAupo2Wgt4wcjNpajHzUPbr+yQaNOB0RYRqmNiDv0rytbcc7BON8vXA4B2QcOZVq36eugBpMDHjqOJilXljPe1m8hmiAdAbiXJ3jM6Y7OUjrq2VXCrzedd2c8fVyGeY56CLn3K9+N6QNlE6VpeCKQRSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vIKQDfmt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 45B4719C6;
	Sun, 10 Aug 2025 03:32:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789545;
	bh=s8jkedVtBRn13jQQf5xmelzvH0lAh0d+LVX31hpCT6w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vIKQDfmtkDGDwcQ7Uoe1ckn1zgeAjc3O7s0vI4soT5hD/xxAVqECx7FIYfUmJXorK
	 W1FjMX+oCrFqu2OQqNhT6XXUJE6I9c4sSldh+i3Hqf6Wo7iwXiDTkK5pSR7rp6vxvu
	 bPjgrnaxbpG1eZGZhUBlPB0rlMEXDixHxqLHLvf0=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 70/76] media: v4l2-ioctl: Push NULL fh argument down to ioctl wrappers
Date: Sun, 10 Aug 2025 04:30:52 +0300
Message-ID: <20250810013100.29776-71-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As ioctl handlers do not expect a priv argument anymore, start pushing
the NULL pointer down from __video_do_ioctl() to the ioctl wrappers.
This paves the way to dropping the void *priv argument to ioctl handlers
themselves.

Changes to ioctl wrappers have been generated with the following
coccinelle semantic patch:

@ioctl@
identifier v4l2_ioctls;
identifier ioctl;
identifier fn;
identifier debug;
expression flags;
@@
struct v4l2_ioctl_info v4l2_ioctls[] = {
	...,
	IOCTL_INFO(ioctl, fn, debug, flags),
	...,
};

@depends on ioctl@
identifier ioctl.fn;
identifier ops;
identifier file;
identifier fh;
identifier arg;
identifier handler;
expression list args;
@@
-int fn(const struct v4l2_ioctl_ops *ops, struct file *file, void *fh, void *arg)
+int fn(const struct v4l2_ioctl_ops *ops, struct file *file, void *arg)
{
	<...
-	ops->handler(file, fh, args)
+	ops->handler(file, NULL, args)
	...>
}

Manual changes have been added to handle the calls to
v4l_[gs]_selection(), drop the fh argument in the v4l2_ioctl_info
structure definition and in the DEFINE_V4L_STUB_FUNC() macro, and stop
passing NULL to the wrappers in __video_do_ioctl()

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 402 +++++++++++++--------------
 1 file changed, 201 insertions(+), 201 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index d815291624a9..01cf52c3ea33 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1089,8 +1089,8 @@ static void v4l_sanitize_format(struct v4l2_format *fmt)
 	}
 }
 
-static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_querycap(const struct v4l2_ioctl_ops *ops, struct file *file,
+			void *arg)
 {
 	struct v4l2_capability *cap = (struct v4l2_capability *)arg;
 	struct video_device *vfd = video_devdata(file);
@@ -1103,7 +1103,7 @@ static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
 	media_set_bus_info(cap->bus_info, sizeof(cap->bus_info),
 			   vfd->dev_parent);
 
-	ret = ops->vidioc_querycap(file, fh, cap);
+	ret = ops->vidioc_querycap(file, NULL, cap);
 
 	/*
 	 * Drivers must not change device_caps, so check for this and
@@ -1123,8 +1123,8 @@ static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
 	return ret;
 }
 
-static int v4l_g_input(const struct v4l2_ioctl_ops *ops,
-		       struct file *file, void *fh, void *arg)
+static int v4l_g_input(const struct v4l2_ioctl_ops *ops, struct file *file,
+		       void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 
@@ -1133,11 +1133,11 @@ static int v4l_g_input(const struct v4l2_ioctl_ops *ops,
 		return 0;
 	}
 
-	return ops->vidioc_g_input(file, fh, arg);
+	return ops->vidioc_g_input(file, NULL, arg);
 }
 
-static int v4l_g_output(const struct v4l2_ioctl_ops *ops,
-			struct file *file, void *fh, void *arg)
+static int v4l_g_output(const struct v4l2_ioctl_ops *ops, struct file *file,
+			void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 
@@ -1146,11 +1146,11 @@ static int v4l_g_output(const struct v4l2_ioctl_ops *ops,
 		return 0;
 	}
 
-	return ops->vidioc_g_output(file, fh, arg);
+	return ops->vidioc_g_output(file, NULL, arg);
 }
 
-static int v4l_s_input(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_s_input(const struct v4l2_ioctl_ops *ops, struct file *file,
+		       void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	int ret;
@@ -1162,22 +1162,22 @@ static int v4l_s_input(const struct v4l2_ioctl_ops *ops,
 	if (vfd->device_caps & V4L2_CAP_IO_MC)
 		return  *(int *)arg ? -EINVAL : 0;
 
-	return ops->vidioc_s_input(file, fh, *(unsigned int *)arg);
+	return ops->vidioc_s_input(file, NULL, *(unsigned int *)arg);
 }
 
-static int v4l_s_output(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_s_output(const struct v4l2_ioctl_ops *ops, struct file *file,
+			void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 
 	if (vfd->device_caps & V4L2_CAP_IO_MC)
 		return  *(int *)arg ? -EINVAL : 0;
 
-	return ops->vidioc_s_output(file, fh, *(unsigned int *)arg);
+	return ops->vidioc_s_output(file, NULL, *(unsigned int *)arg);
 }
 
-static int v4l_g_priority(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_g_priority(const struct v4l2_ioctl_ops *ops, struct file *file,
+			  void *arg)
 {
 	struct video_device *vfd;
 	u32 *p = arg;
@@ -1187,8 +1187,8 @@ static int v4l_g_priority(const struct v4l2_ioctl_ops *ops,
 	return 0;
 }
 
-static int v4l_s_priority(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_s_priority(const struct v4l2_ioctl_ops *ops, struct file *file,
+			  void *arg)
 {
 	struct video_device *vfd;
 	struct v4l2_fh *vfh;
@@ -1199,8 +1199,8 @@ static int v4l_s_priority(const struct v4l2_ioctl_ops *ops,
 	return v4l2_prio_change(vfd->prio, &vfh->prio, *p);
 }
 
-static int v4l_enuminput(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_enuminput(const struct v4l2_ioctl_ops *ops, struct file *file,
+			 void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_input *p = arg;
@@ -1222,11 +1222,11 @@ static int v4l_enuminput(const struct v4l2_ioctl_ops *ops,
 		return 0;
 	}
 
-	return ops->vidioc_enum_input(file, fh, p);
+	return ops->vidioc_enum_input(file, NULL, p);
 }
 
-static int v4l_enumoutput(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_enumoutput(const struct v4l2_ioctl_ops *ops, struct file *file,
+			  void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_output *p = arg;
@@ -1248,7 +1248,7 @@ static int v4l_enumoutput(const struct v4l2_ioctl_ops *ops,
 		return 0;
 	}
 
-	return ops->vidioc_enum_output(file, fh, p);
+	return ops->vidioc_enum_output(file, NULL, p);
 }
 
 static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
@@ -1587,8 +1587,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	fmt->flags |= flags;
 }
 
-static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops, struct file *file,
+			void *arg)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct v4l2_fmtdesc *p = arg;
@@ -1618,12 +1618,12 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
 
 		if (unlikely(!ops->vidioc_enum_fmt_vid_cap))
 			break;
-		ret = ops->vidioc_enum_fmt_vid_cap(file, fh, arg);
+		ret = ops->vidioc_enum_fmt_vid_cap(file, NULL, arg);
 		break;
 	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
 		if (unlikely(!ops->vidioc_enum_fmt_vid_overlay))
 			break;
-		ret = ops->vidioc_enum_fmt_vid_overlay(file, fh, arg);
+		ret = ops->vidioc_enum_fmt_vid_overlay(file, NULL, arg);
 		break;
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
@@ -1635,27 +1635,27 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
 
 		if (unlikely(!ops->vidioc_enum_fmt_vid_out))
 			break;
-		ret = ops->vidioc_enum_fmt_vid_out(file, fh, arg);
+		ret = ops->vidioc_enum_fmt_vid_out(file, NULL, arg);
 		break;
 	case V4L2_BUF_TYPE_SDR_CAPTURE:
 		if (unlikely(!ops->vidioc_enum_fmt_sdr_cap))
 			break;
-		ret = ops->vidioc_enum_fmt_sdr_cap(file, fh, arg);
+		ret = ops->vidioc_enum_fmt_sdr_cap(file, NULL, arg);
 		break;
 	case V4L2_BUF_TYPE_SDR_OUTPUT:
 		if (unlikely(!ops->vidioc_enum_fmt_sdr_out))
 			break;
-		ret = ops->vidioc_enum_fmt_sdr_out(file, fh, arg);
+		ret = ops->vidioc_enum_fmt_sdr_out(file, NULL, arg);
 		break;
 	case V4L2_BUF_TYPE_META_CAPTURE:
 		if (unlikely(!ops->vidioc_enum_fmt_meta_cap))
 			break;
-		ret = ops->vidioc_enum_fmt_meta_cap(file, fh, arg);
+		ret = ops->vidioc_enum_fmt_meta_cap(file, NULL, arg);
 		break;
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		if (unlikely(!ops->vidioc_enum_fmt_meta_out))
 			break;
-		ret = ops->vidioc_enum_fmt_meta_out(file, fh, arg);
+		ret = ops->vidioc_enum_fmt_meta_out(file, NULL, arg);
 		break;
 	}
 	if (ret == 0)
@@ -1678,8 +1678,8 @@ static void v4l_pix_format_touch(struct v4l2_pix_format *p)
 	p->xfer_func = 0;
 }
 
-static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops, struct file *file,
+		     void *arg)
 {
 	struct v4l2_format *p = arg;
 	struct video_device *vfd = video_devdata(file);
@@ -1695,50 +1695,50 @@ static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
 		if (unlikely(!ops->vidioc_g_fmt_vid_cap))
 			break;
 		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
-		ret = ops->vidioc_g_fmt_vid_cap(file, fh, arg);
+		ret = ops->vidioc_g_fmt_vid_cap(file, NULL, arg);
 		/* just in case the driver zeroed it again */
 		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
 		if (vfd->vfl_type == VFL_TYPE_TOUCH)
 			v4l_pix_format_touch(&p->fmt.pix);
 		return ret;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		return ops->vidioc_g_fmt_vid_cap_mplane(file, fh, arg);
+		return ops->vidioc_g_fmt_vid_cap_mplane(file, NULL, arg);
 	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
-		return ops->vidioc_g_fmt_vid_overlay(file, fh, arg);
+		return ops->vidioc_g_fmt_vid_overlay(file, NULL, arg);
 	case V4L2_BUF_TYPE_VBI_CAPTURE:
-		return ops->vidioc_g_fmt_vbi_cap(file, fh, arg);
+		return ops->vidioc_g_fmt_vbi_cap(file, NULL, arg);
 	case V4L2_BUF_TYPE_SLICED_VBI_CAPTURE:
-		return ops->vidioc_g_fmt_sliced_vbi_cap(file, fh, arg);
+		return ops->vidioc_g_fmt_sliced_vbi_cap(file, NULL, arg);
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
 		if (unlikely(!ops->vidioc_g_fmt_vid_out))
 			break;
 		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
-		ret = ops->vidioc_g_fmt_vid_out(file, fh, arg);
+		ret = ops->vidioc_g_fmt_vid_out(file, NULL, arg);
 		/* just in case the driver zeroed it again */
 		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
 		return ret;
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		return ops->vidioc_g_fmt_vid_out_mplane(file, fh, arg);
+		return ops->vidioc_g_fmt_vid_out_mplane(file, NULL, arg);
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
-		return ops->vidioc_g_fmt_vid_out_overlay(file, fh, arg);
+		return ops->vidioc_g_fmt_vid_out_overlay(file, NULL, arg);
 	case V4L2_BUF_TYPE_VBI_OUTPUT:
-		return ops->vidioc_g_fmt_vbi_out(file, fh, arg);
+		return ops->vidioc_g_fmt_vbi_out(file, NULL, arg);
 	case V4L2_BUF_TYPE_SLICED_VBI_OUTPUT:
-		return ops->vidioc_g_fmt_sliced_vbi_out(file, fh, arg);
+		return ops->vidioc_g_fmt_sliced_vbi_out(file, NULL, arg);
 	case V4L2_BUF_TYPE_SDR_CAPTURE:
-		return ops->vidioc_g_fmt_sdr_cap(file, fh, arg);
+		return ops->vidioc_g_fmt_sdr_cap(file, NULL, arg);
 	case V4L2_BUF_TYPE_SDR_OUTPUT:
-		return ops->vidioc_g_fmt_sdr_out(file, fh, arg);
+		return ops->vidioc_g_fmt_sdr_out(file, NULL, arg);
 	case V4L2_BUF_TYPE_META_CAPTURE:
-		return ops->vidioc_g_fmt_meta_cap(file, fh, arg);
+		return ops->vidioc_g_fmt_meta_cap(file, NULL, arg);
 	case V4L2_BUF_TYPE_META_OUTPUT:
-		return ops->vidioc_g_fmt_meta_out(file, fh, arg);
+		return ops->vidioc_g_fmt_meta_out(file, NULL, arg);
 	}
 	return -EINVAL;
 }
 
-static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops, struct file *file,
+		     void *arg)
 {
 	struct v4l2_format *p = arg;
 	struct video_device *vfd = video_devdata(file);
@@ -1758,7 +1758,7 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
 		if (unlikely(!ops->vidioc_s_fmt_vid_cap))
 			break;
 		memset_after(p, 0, fmt.pix);
-		ret = ops->vidioc_s_fmt_vid_cap(file, fh, arg);
+		ret = ops->vidioc_s_fmt_vid_cap(file, NULL, arg);
 		/* just in case the driver zeroed it again */
 		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
 		if (vfd->vfl_type == VFL_TYPE_TOUCH)
@@ -1771,7 +1771,7 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
 		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
 			memset_after(&p->fmt.pix_mp.plane_fmt[i],
 				     0, bytesperline);
-		return ops->vidioc_s_fmt_vid_cap_mplane(file, fh, arg);
+		return ops->vidioc_s_fmt_vid_cap_mplane(file, NULL, arg);
 	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
 		if (unlikely(!ops->vidioc_s_fmt_vid_overlay))
 			break;
@@ -1779,22 +1779,22 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
 		p->fmt.win.clips = NULL;
 		p->fmt.win.clipcount = 0;
 		p->fmt.win.bitmap = NULL;
-		return ops->vidioc_s_fmt_vid_overlay(file, fh, arg);
+		return ops->vidioc_s_fmt_vid_overlay(file, NULL, arg);
 	case V4L2_BUF_TYPE_VBI_CAPTURE:
 		if (unlikely(!ops->vidioc_s_fmt_vbi_cap))
 			break;
 		memset_after(p, 0, fmt.vbi.flags);
-		return ops->vidioc_s_fmt_vbi_cap(file, fh, arg);
+		return ops->vidioc_s_fmt_vbi_cap(file, NULL, arg);
 	case V4L2_BUF_TYPE_SLICED_VBI_CAPTURE:
 		if (unlikely(!ops->vidioc_s_fmt_sliced_vbi_cap))
 			break;
 		memset_after(p, 0, fmt.sliced.io_size);
-		return ops->vidioc_s_fmt_sliced_vbi_cap(file, fh, arg);
+		return ops->vidioc_s_fmt_sliced_vbi_cap(file, NULL, arg);
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
 		if (unlikely(!ops->vidioc_s_fmt_vid_out))
 			break;
 		memset_after(p, 0, fmt.pix);
-		ret = ops->vidioc_s_fmt_vid_out(file, fh, arg);
+		ret = ops->vidioc_s_fmt_vid_out(file, NULL, arg);
 		/* just in case the driver zeroed it again */
 		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
 		return ret;
@@ -1805,7 +1805,7 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
 		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
 			memset_after(&p->fmt.pix_mp.plane_fmt[i],
 				     0, bytesperline);
-		return ops->vidioc_s_fmt_vid_out_mplane(file, fh, arg);
+		return ops->vidioc_s_fmt_vid_out_mplane(file, NULL, arg);
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
 		if (unlikely(!ops->vidioc_s_fmt_vid_out_overlay))
 			break;
@@ -1813,43 +1813,43 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
 		p->fmt.win.clips = NULL;
 		p->fmt.win.clipcount = 0;
 		p->fmt.win.bitmap = NULL;
-		return ops->vidioc_s_fmt_vid_out_overlay(file, fh, arg);
+		return ops->vidioc_s_fmt_vid_out_overlay(file, NULL, arg);
 	case V4L2_BUF_TYPE_VBI_OUTPUT:
 		if (unlikely(!ops->vidioc_s_fmt_vbi_out))
 			break;
 		memset_after(p, 0, fmt.vbi.flags);
-		return ops->vidioc_s_fmt_vbi_out(file, fh, arg);
+		return ops->vidioc_s_fmt_vbi_out(file, NULL, arg);
 	case V4L2_BUF_TYPE_SLICED_VBI_OUTPUT:
 		if (unlikely(!ops->vidioc_s_fmt_sliced_vbi_out))
 			break;
 		memset_after(p, 0, fmt.sliced.io_size);
-		return ops->vidioc_s_fmt_sliced_vbi_out(file, fh, arg);
+		return ops->vidioc_s_fmt_sliced_vbi_out(file, NULL, arg);
 	case V4L2_BUF_TYPE_SDR_CAPTURE:
 		if (unlikely(!ops->vidioc_s_fmt_sdr_cap))
 			break;
 		memset_after(p, 0, fmt.sdr.buffersize);
-		return ops->vidioc_s_fmt_sdr_cap(file, fh, arg);
+		return ops->vidioc_s_fmt_sdr_cap(file, NULL, arg);
 	case V4L2_BUF_TYPE_SDR_OUTPUT:
 		if (unlikely(!ops->vidioc_s_fmt_sdr_out))
 			break;
 		memset_after(p, 0, fmt.sdr.buffersize);
-		return ops->vidioc_s_fmt_sdr_out(file, fh, arg);
+		return ops->vidioc_s_fmt_sdr_out(file, NULL, arg);
 	case V4L2_BUF_TYPE_META_CAPTURE:
 		if (unlikely(!ops->vidioc_s_fmt_meta_cap))
 			break;
 		memset_after(p, 0, fmt.meta);
-		return ops->vidioc_s_fmt_meta_cap(file, fh, arg);
+		return ops->vidioc_s_fmt_meta_cap(file, NULL, arg);
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		if (unlikely(!ops->vidioc_s_fmt_meta_out))
 			break;
 		memset_after(p, 0, fmt.meta);
-		return ops->vidioc_s_fmt_meta_out(file, fh, arg);
+		return ops->vidioc_s_fmt_meta_out(file, NULL, arg);
 	}
 	return -EINVAL;
 }
 
-static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops, struct file *file,
+		       void *arg)
 {
 	struct v4l2_format *p = arg;
 	struct video_device *vfd = video_devdata(file);
@@ -1866,7 +1866,7 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
 		if (unlikely(!ops->vidioc_try_fmt_vid_cap))
 			break;
 		memset_after(p, 0, fmt.pix);
-		ret = ops->vidioc_try_fmt_vid_cap(file, fh, arg);
+		ret = ops->vidioc_try_fmt_vid_cap(file, NULL, arg);
 		/* just in case the driver zeroed it again */
 		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
 		if (vfd->vfl_type == VFL_TYPE_TOUCH)
@@ -1879,7 +1879,7 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
 		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
 			memset_after(&p->fmt.pix_mp.plane_fmt[i],
 				     0, bytesperline);
-		return ops->vidioc_try_fmt_vid_cap_mplane(file, fh, arg);
+		return ops->vidioc_try_fmt_vid_cap_mplane(file, NULL, arg);
 	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
 		if (unlikely(!ops->vidioc_try_fmt_vid_overlay))
 			break;
@@ -1887,22 +1887,22 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
 		p->fmt.win.clips = NULL;
 		p->fmt.win.clipcount = 0;
 		p->fmt.win.bitmap = NULL;
-		return ops->vidioc_try_fmt_vid_overlay(file, fh, arg);
+		return ops->vidioc_try_fmt_vid_overlay(file, NULL, arg);
 	case V4L2_BUF_TYPE_VBI_CAPTURE:
 		if (unlikely(!ops->vidioc_try_fmt_vbi_cap))
 			break;
 		memset_after(p, 0, fmt.vbi.flags);
-		return ops->vidioc_try_fmt_vbi_cap(file, fh, arg);
+		return ops->vidioc_try_fmt_vbi_cap(file, NULL, arg);
 	case V4L2_BUF_TYPE_SLICED_VBI_CAPTURE:
 		if (unlikely(!ops->vidioc_try_fmt_sliced_vbi_cap))
 			break;
 		memset_after(p, 0, fmt.sliced.io_size);
-		return ops->vidioc_try_fmt_sliced_vbi_cap(file, fh, arg);
+		return ops->vidioc_try_fmt_sliced_vbi_cap(file, NULL, arg);
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
 		if (unlikely(!ops->vidioc_try_fmt_vid_out))
 			break;
 		memset_after(p, 0, fmt.pix);
-		ret = ops->vidioc_try_fmt_vid_out(file, fh, arg);
+		ret = ops->vidioc_try_fmt_vid_out(file, NULL, arg);
 		/* just in case the driver zeroed it again */
 		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
 		return ret;
@@ -1913,7 +1913,7 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
 		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
 			memset_after(&p->fmt.pix_mp.plane_fmt[i],
 				     0, bytesperline);
-		return ops->vidioc_try_fmt_vid_out_mplane(file, fh, arg);
+		return ops->vidioc_try_fmt_vid_out_mplane(file, NULL, arg);
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
 		if (unlikely(!ops->vidioc_try_fmt_vid_out_overlay))
 			break;
@@ -1921,55 +1921,55 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
 		p->fmt.win.clips = NULL;
 		p->fmt.win.clipcount = 0;
 		p->fmt.win.bitmap = NULL;
-		return ops->vidioc_try_fmt_vid_out_overlay(file, fh, arg);
+		return ops->vidioc_try_fmt_vid_out_overlay(file, NULL, arg);
 	case V4L2_BUF_TYPE_VBI_OUTPUT:
 		if (unlikely(!ops->vidioc_try_fmt_vbi_out))
 			break;
 		memset_after(p, 0, fmt.vbi.flags);
-		return ops->vidioc_try_fmt_vbi_out(file, fh, arg);
+		return ops->vidioc_try_fmt_vbi_out(file, NULL, arg);
 	case V4L2_BUF_TYPE_SLICED_VBI_OUTPUT:
 		if (unlikely(!ops->vidioc_try_fmt_sliced_vbi_out))
 			break;
 		memset_after(p, 0, fmt.sliced.io_size);
-		return ops->vidioc_try_fmt_sliced_vbi_out(file, fh, arg);
+		return ops->vidioc_try_fmt_sliced_vbi_out(file, NULL, arg);
 	case V4L2_BUF_TYPE_SDR_CAPTURE:
 		if (unlikely(!ops->vidioc_try_fmt_sdr_cap))
 			break;
 		memset_after(p, 0, fmt.sdr.buffersize);
-		return ops->vidioc_try_fmt_sdr_cap(file, fh, arg);
+		return ops->vidioc_try_fmt_sdr_cap(file, NULL, arg);
 	case V4L2_BUF_TYPE_SDR_OUTPUT:
 		if (unlikely(!ops->vidioc_try_fmt_sdr_out))
 			break;
 		memset_after(p, 0, fmt.sdr.buffersize);
-		return ops->vidioc_try_fmt_sdr_out(file, fh, arg);
+		return ops->vidioc_try_fmt_sdr_out(file, NULL, arg);
 	case V4L2_BUF_TYPE_META_CAPTURE:
 		if (unlikely(!ops->vidioc_try_fmt_meta_cap))
 			break;
 		memset_after(p, 0, fmt.meta);
-		return ops->vidioc_try_fmt_meta_cap(file, fh, arg);
+		return ops->vidioc_try_fmt_meta_cap(file, NULL, arg);
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		if (unlikely(!ops->vidioc_try_fmt_meta_out))
 			break;
 		memset_after(p, 0, fmt.meta);
-		return ops->vidioc_try_fmt_meta_out(file, fh, arg);
+		return ops->vidioc_try_fmt_meta_out(file, NULL, arg);
 	}
 	return -EINVAL;
 }
 
-static int v4l_streamon(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_streamon(const struct v4l2_ioctl_ops *ops, struct file *file,
+			void *arg)
 {
-	return ops->vidioc_streamon(file, fh, *(unsigned int *)arg);
+	return ops->vidioc_streamon(file, NULL, *(unsigned int *)arg);
 }
 
-static int v4l_streamoff(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_streamoff(const struct v4l2_ioctl_ops *ops, struct file *file,
+			 void *arg)
 {
-	return ops->vidioc_streamoff(file, fh, *(unsigned int *)arg);
+	return ops->vidioc_streamoff(file, NULL, *(unsigned int *)arg);
 }
 
-static int v4l_g_tuner(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_g_tuner(const struct v4l2_ioctl_ops *ops, struct file *file,
+		       void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_tuner *p = arg;
@@ -1977,14 +1977,14 @@ static int v4l_g_tuner(const struct v4l2_ioctl_ops *ops,
 
 	p->type = (vfd->vfl_type == VFL_TYPE_RADIO) ?
 			V4L2_TUNER_RADIO : V4L2_TUNER_ANALOG_TV;
-	err = ops->vidioc_g_tuner(file, fh, p);
+	err = ops->vidioc_g_tuner(file, NULL, p);
 	if (!err)
 		p->capability |= V4L2_TUNER_CAP_FREQ_BANDS;
 	return err;
 }
 
-static int v4l_s_tuner(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_s_tuner(const struct v4l2_ioctl_ops *ops, struct file *file,
+		       void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_tuner *p = arg;
@@ -1995,11 +1995,11 @@ static int v4l_s_tuner(const struct v4l2_ioctl_ops *ops,
 		return ret;
 	p->type = (vfd->vfl_type == VFL_TYPE_RADIO) ?
 			V4L2_TUNER_RADIO : V4L2_TUNER_ANALOG_TV;
-	return ops->vidioc_s_tuner(file, fh, p);
+	return ops->vidioc_s_tuner(file, NULL, p);
 }
 
 static int v4l_g_modulator(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+			   struct file *file, void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_modulator *p = arg;
@@ -2008,14 +2008,14 @@ static int v4l_g_modulator(const struct v4l2_ioctl_ops *ops,
 	if (vfd->vfl_type == VFL_TYPE_RADIO)
 		p->type = V4L2_TUNER_RADIO;
 
-	err = ops->vidioc_g_modulator(file, fh, p);
+	err = ops->vidioc_g_modulator(file, NULL, p);
 	if (!err)
 		p->capability |= V4L2_TUNER_CAP_FREQ_BANDS;
 	return err;
 }
 
 static int v4l_s_modulator(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+			   struct file *file, void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_modulator *p = arg;
@@ -2023,11 +2023,11 @@ static int v4l_s_modulator(const struct v4l2_ioctl_ops *ops,
 	if (vfd->vfl_type == VFL_TYPE_RADIO)
 		p->type = V4L2_TUNER_RADIO;
 
-	return ops->vidioc_s_modulator(file, fh, p);
+	return ops->vidioc_s_modulator(file, NULL, p);
 }
 
 static int v4l_g_frequency(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+			   struct file *file, void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_frequency *p = arg;
@@ -2037,11 +2037,11 @@ static int v4l_g_frequency(const struct v4l2_ioctl_ops *ops,
 	else
 		p->type = (vfd->vfl_type == VFL_TYPE_RADIO) ?
 				V4L2_TUNER_RADIO : V4L2_TUNER_ANALOG_TV;
-	return ops->vidioc_g_frequency(file, fh, p);
+	return ops->vidioc_g_frequency(file, NULL, p);
 }
 
 static int v4l_s_frequency(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+			   struct file *file, void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	const struct v4l2_frequency *p = arg;
@@ -2060,11 +2060,11 @@ static int v4l_s_frequency(const struct v4l2_ioctl_ops *ops,
 		if (type != p->type)
 			return -EINVAL;
 	}
-	return ops->vidioc_s_frequency(file, fh, p);
+	return ops->vidioc_s_frequency(file, NULL, p);
 }
 
-static int v4l_enumstd(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_enumstd(const struct v4l2_ioctl_ops *ops, struct file *file,
+		       void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_standard *p = arg;
@@ -2072,8 +2072,8 @@ static int v4l_enumstd(const struct v4l2_ioctl_ops *ops,
 	return v4l_video_std_enumstd(p, vfd->tvnorms);
 }
 
-static int v4l_s_std(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_s_std(const struct v4l2_ioctl_ops *ops, struct file *file,
+		     void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	v4l2_std_id id = *(v4l2_std_id *)arg, norm;
@@ -2087,11 +2087,11 @@ static int v4l_s_std(const struct v4l2_ioctl_ops *ops,
 		return -EINVAL;
 
 	/* Calls the specific handler */
-	return ops->vidioc_s_std(file, fh, norm);
+	return ops->vidioc_s_std(file, NULL, norm);
 }
 
-static int v4l_querystd(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_querystd(const struct v4l2_ioctl_ops *ops, struct file *file,
+			void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	v4l2_std_id *p = arg;
@@ -2109,11 +2109,11 @@ static int v4l_querystd(const struct v4l2_ioctl_ops *ops,
 	 * their efforts to improve the standards detection.
 	 */
 	*p = vfd->tvnorms;
-	return ops->vidioc_querystd(file, fh, arg);
+	return ops->vidioc_querystd(file, NULL, arg);
 }
 
 static int v4l_s_hw_freq_seek(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+			      struct file *file, void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_hw_freq_seek *p = arg;
@@ -2131,26 +2131,26 @@ static int v4l_s_hw_freq_seek(const struct v4l2_ioctl_ops *ops,
 		V4L2_TUNER_RADIO : V4L2_TUNER_ANALOG_TV;
 	if (p->type != type)
 		return -EINVAL;
-	return ops->vidioc_s_hw_freq_seek(file, fh, p);
+	return ops->vidioc_s_hw_freq_seek(file, NULL, p);
 }
 
-static int v4l_s_fbuf(const struct v4l2_ioctl_ops *ops,
-		      struct file *file, void *fh, void *arg)
+static int v4l_s_fbuf(const struct v4l2_ioctl_ops *ops, struct file *file,
+		      void *arg)
 {
 	struct v4l2_framebuffer *p = arg;
 
 	p->base = NULL;
-	return ops->vidioc_s_fbuf(file, fh, p);
+	return ops->vidioc_s_fbuf(file, NULL, p);
 }
 
-static int v4l_overlay(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_overlay(const struct v4l2_ioctl_ops *ops, struct file *file,
+		       void *arg)
 {
-	return ops->vidioc_overlay(file, fh, *(unsigned int *)arg);
+	return ops->vidioc_overlay(file, NULL, *(unsigned int *)arg);
 }
 
-static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops, struct file *file,
+		       void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_requestbuffers *p = arg;
@@ -2165,38 +2165,38 @@ static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
 	if (is_valid_ioctl(vfd, VIDIOC_REMOVE_BUFS))
 		p->capabilities = V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS;
 
-	return ops->vidioc_reqbufs(file, fh, p);
+	return ops->vidioc_reqbufs(file, NULL, p);
 }
 
-static int v4l_querybuf(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_querybuf(const struct v4l2_ioctl_ops *ops, struct file *file,
+			void *arg)
 {
 	struct v4l2_buffer *p = arg;
 	int ret = check_fmt(file, p->type);
 
-	return ret ? ret : ops->vidioc_querybuf(file, fh, p);
+	return ret ? ret : ops->vidioc_querybuf(file, NULL, p);
 }
 
-static int v4l_qbuf(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_qbuf(const struct v4l2_ioctl_ops *ops, struct file *file,
+		    void *arg)
 {
 	struct v4l2_buffer *p = arg;
 	int ret = check_fmt(file, p->type);
 
-	return ret ? ret : ops->vidioc_qbuf(file, fh, p);
+	return ret ? ret : ops->vidioc_qbuf(file, NULL, p);
 }
 
-static int v4l_dqbuf(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_dqbuf(const struct v4l2_ioctl_ops *ops, struct file *file,
+		     void *arg)
 {
 	struct v4l2_buffer *p = arg;
 	int ret = check_fmt(file, p->type);
 
-	return ret ? ret : ops->vidioc_dqbuf(file, fh, p);
+	return ret ? ret : ops->vidioc_dqbuf(file, NULL, p);
 }
 
 static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+			   struct file *file, void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_create_buffers *create = arg;
@@ -2213,7 +2213,7 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
 	if (is_valid_ioctl(vfd, VIDIOC_REMOVE_BUFS))
 		create->capabilities = V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS;
 
-	ret = ops->vidioc_create_bufs(file, fh, create);
+	ret = ops->vidioc_create_bufs(file, NULL, create);
 
 	if (create->format.type == V4L2_BUF_TYPE_VIDEO_CAPTURE ||
 	    create->format.type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
@@ -2223,27 +2223,27 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
 }
 
 static int v4l_prepare_buf(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+			   struct file *file, void *arg)
 {
 	struct v4l2_buffer *b = arg;
 	int ret = check_fmt(file, b->type);
 
-	return ret ? ret : ops->vidioc_prepare_buf(file, fh, b);
+	return ret ? ret : ops->vidioc_prepare_buf(file, NULL, b);
 }
 
 static int v4l_remove_bufs(const struct v4l2_ioctl_ops *ops,
-			   struct file *file, void *fh, void *arg)
+			   struct file *file, void *arg)
 {
 	struct v4l2_remove_buffers *remove = arg;
 
 	if (ops->vidioc_remove_bufs)
-		return ops->vidioc_remove_bufs(file, fh, remove);
+		return ops->vidioc_remove_bufs(file, NULL, remove);
 
 	return -ENOTTY;
 }
 
-static int v4l_g_parm(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_g_parm(const struct v4l2_ioctl_ops *ops, struct file *file,
+		      void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_streamparm *p = arg;
@@ -2253,20 +2253,20 @@ static int v4l_g_parm(const struct v4l2_ioctl_ops *ops,
 	if (ret)
 		return ret;
 	if (ops->vidioc_g_parm)
-		return ops->vidioc_g_parm(file, fh, p);
+		return ops->vidioc_g_parm(file, NULL, p);
 	if (p->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
 	    p->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
 		return -EINVAL;
 	if (vfd->device_caps & V4L2_CAP_READWRITE)
 		p->parm.capture.readbuffers = 2;
-	ret = ops->vidioc_g_std(file, fh, &std);
+	ret = ops->vidioc_g_std(file, NULL, &std);
 	if (ret == 0)
 		v4l2_video_std_frame_period(std, &p->parm.capture.timeperframe);
 	return ret;
 }
 
-static int v4l_s_parm(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_s_parm(const struct v4l2_ioctl_ops *ops, struct file *file,
+		      void *arg)
 {
 	struct v4l2_streamparm *p = arg;
 	int ret = check_fmt(file, p->type);
@@ -2286,11 +2286,11 @@ static int v4l_s_parm(const struct v4l2_ioctl_ops *ops,
 		p->parm.capture.extendedmode = 0;
 		p->parm.capture.capturemode &= V4L2_MODE_HIGHQUALITY;
 	}
-	return ops->vidioc_s_parm(file, fh, p);
+	return ops->vidioc_s_parm(file, NULL, p);
 }
 
-static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops, struct file *file,
+			 void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_query_ext_ctrl qec = {};
@@ -2307,7 +2307,7 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
 
 	/* Simulate query_ext_ctr using query_ctrl. */
 	qec.id = p->id;
-	ret = ops->vidioc_query_ext_ctrl(file, fh, &qec);
+	ret = ops->vidioc_query_ext_ctrl(file, NULL, &qec);
 	if (ret)
 		return ret;
 	v4l2_query_ext_ctrl_to_v4l2_queryctrl(p, &qec);
@@ -2315,7 +2315,7 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
 }
 
 static int v4l_query_ext_ctrl(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+			      struct file *file, void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_query_ext_ctrl *p = arg;
@@ -2326,12 +2326,12 @@ static int v4l_query_ext_ctrl(const struct v4l2_ioctl_ops *ops,
 	if (vfd->ctrl_handler)
 		return v4l2_query_ext_ctrl(vfd->ctrl_handler, p);
 	if (ops->vidioc_query_ext_ctrl)
-		return ops->vidioc_query_ext_ctrl(file, fh, p);
+		return ops->vidioc_query_ext_ctrl(file, NULL, p);
 	return -ENOTTY;
 }
 
-static int v4l_querymenu(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_querymenu(const struct v4l2_ioctl_ops *ops, struct file *file,
+			 void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_querymenu *p = arg;
@@ -2342,12 +2342,12 @@ static int v4l_querymenu(const struct v4l2_ioctl_ops *ops,
 	if (vfd->ctrl_handler)
 		return v4l2_querymenu(vfd->ctrl_handler, p);
 	if (ops->vidioc_querymenu)
-		return ops->vidioc_querymenu(file, fh, p);
+		return ops->vidioc_querymenu(file, NULL, p);
 	return -ENOTTY;
 }
 
-static int v4l_g_ctrl(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_g_ctrl(const struct v4l2_ioctl_ops *ops, struct file *file,
+		      void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_control *p = arg;
@@ -2368,7 +2368,7 @@ static int v4l_g_ctrl(const struct v4l2_ioctl_ops *ops,
 	ctrl.id = p->id;
 	ctrl.value = p->value;
 	if (check_ext_ctrls(&ctrls, VIDIOC_G_CTRL)) {
-		int ret = ops->vidioc_g_ext_ctrls(file, fh, &ctrls);
+		int ret = ops->vidioc_g_ext_ctrls(file, NULL, &ctrls);
 
 		if (ret == 0)
 			p->value = ctrl.value;
@@ -2377,8 +2377,8 @@ static int v4l_g_ctrl(const struct v4l2_ioctl_ops *ops,
 	return -EINVAL;
 }
 
-static int v4l_s_ctrl(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_s_ctrl(const struct v4l2_ioctl_ops *ops, struct file *file,
+		      void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_control *p = arg;
@@ -2401,13 +2401,13 @@ static int v4l_s_ctrl(const struct v4l2_ioctl_ops *ops,
 	ctrl.value = p->value;
 	if (!check_ext_ctrls(&ctrls, VIDIOC_S_CTRL))
 		return -EINVAL;
-	ret = ops->vidioc_s_ext_ctrls(file, fh, &ctrls);
+	ret = ops->vidioc_s_ext_ctrls(file, NULL, &ctrls);
 	p->value = ctrl.value;
 	return ret;
 }
 
 static int v4l_g_ext_ctrls(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+			   struct file *file, void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_ext_controls *p = arg;
@@ -2423,11 +2423,11 @@ static int v4l_g_ext_ctrls(const struct v4l2_ioctl_ops *ops,
 	if (ops->vidioc_g_ext_ctrls == NULL)
 		return -ENOTTY;
 	return check_ext_ctrls(p, VIDIOC_G_EXT_CTRLS) ?
-				ops->vidioc_g_ext_ctrls(file, fh, p) : -EINVAL;
+				ops->vidioc_g_ext_ctrls(file, NULL, p) : -EINVAL;
 }
 
 static int v4l_s_ext_ctrls(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+			   struct file *file, void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_ext_controls *p = arg;
@@ -2443,11 +2443,11 @@ static int v4l_s_ext_ctrls(const struct v4l2_ioctl_ops *ops,
 	if (ops->vidioc_s_ext_ctrls == NULL)
 		return -ENOTTY;
 	return check_ext_ctrls(p, VIDIOC_S_EXT_CTRLS) ?
-				ops->vidioc_s_ext_ctrls(file, fh, p) : -EINVAL;
+				ops->vidioc_s_ext_ctrls(file, NULL, p) : -EINVAL;
 }
 
 static int v4l_try_ext_ctrls(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+			     struct file *file, void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_ext_controls *p = arg;
@@ -2463,7 +2463,7 @@ static int v4l_try_ext_ctrls(const struct v4l2_ioctl_ops *ops,
 	if (ops->vidioc_try_ext_ctrls == NULL)
 		return -ENOTTY;
 	return check_ext_ctrls(p, VIDIOC_TRY_EXT_CTRLS) ?
-			ops->vidioc_try_ext_ctrls(file, fh, p) : -EINVAL;
+			ops->vidioc_try_ext_ctrls(file, NULL, p) : -EINVAL;
 }
 
 /*
@@ -2476,7 +2476,7 @@ static int v4l_try_ext_ctrls(const struct v4l2_ioctl_ops *ops,
  * type and drivers don't need to check for both.
  */
 static int v4l_g_selection(const struct v4l2_ioctl_ops *ops,
-			   struct file *file, void *fh, void *arg)
+			   struct file *file, void *arg)
 {
 	struct v4l2_selection *p = arg;
 	u32 old_type = p->type;
@@ -2486,13 +2486,13 @@ static int v4l_g_selection(const struct v4l2_ioctl_ops *ops,
 		p->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	else if (p->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		p->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
-	ret = ops->vidioc_g_selection(file, fh, p);
+	ret = ops->vidioc_g_selection(file, NULL, p);
 	p->type = old_type;
 	return ret;
 }
 
 static int v4l_s_selection(const struct v4l2_ioctl_ops *ops,
-			   struct file *file, void *fh, void *arg)
+			   struct file *file, void *arg)
 {
 	struct v4l2_selection *p = arg;
 	u32 old_type = p->type;
@@ -2502,13 +2502,13 @@ static int v4l_s_selection(const struct v4l2_ioctl_ops *ops,
 		p->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	else if (p->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		p->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
-	ret = ops->vidioc_s_selection(file, fh, p);
+	ret = ops->vidioc_s_selection(file, NULL, p);
 	p->type = old_type;
 	return ret;
 }
 
-static int v4l_g_crop(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_g_crop(const struct v4l2_ioctl_ops *ops, struct file *file,
+		      void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_crop *p = arg;
@@ -2529,7 +2529,7 @@ static int v4l_g_crop(const struct v4l2_ioctl_ops *ops,
 		s.target = s.target == V4L2_SEL_TGT_COMPOSE ?
 			V4L2_SEL_TGT_CROP : V4L2_SEL_TGT_COMPOSE;
 
-	ret = v4l_g_selection(ops, file, fh, &s);
+	ret = v4l_g_selection(ops, file, &s);
 
 	/* copying results to old structure on success */
 	if (!ret)
@@ -2537,8 +2537,8 @@ static int v4l_g_crop(const struct v4l2_ioctl_ops *ops,
 	return ret;
 }
 
-static int v4l_s_crop(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_s_crop(const struct v4l2_ioctl_ops *ops, struct file *file,
+		      void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_crop *p = arg;
@@ -2559,11 +2559,11 @@ static int v4l_s_crop(const struct v4l2_ioctl_ops *ops,
 		s.target = s.target == V4L2_SEL_TGT_COMPOSE ?
 			V4L2_SEL_TGT_CROP : V4L2_SEL_TGT_COMPOSE;
 
-	return v4l_s_selection(ops, file, fh, &s);
+	return v4l_s_selection(ops, file, &s);
 }
 
-static int v4l_cropcap(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_cropcap(const struct v4l2_ioctl_ops *ops, struct file *file,
+		       void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_cropcap *p = arg;
@@ -2587,7 +2587,7 @@ static int v4l_cropcap(const struct v4l2_ioctl_ops *ops,
 		return -ENOTTY;
 
 	if (ops->vidioc_g_pixelaspect)
-		ret = ops->vidioc_g_pixelaspect(file, fh, s.type,
+		ret = ops->vidioc_g_pixelaspect(file, NULL, s.type,
 						&p->pixelaspect);
 
 	/*
@@ -2609,7 +2609,7 @@ static int v4l_cropcap(const struct v4l2_ioctl_ops *ops,
 		s.target = s.target == V4L2_SEL_TGT_COMPOSE_BOUNDS ?
 			V4L2_SEL_TGT_CROP_BOUNDS : V4L2_SEL_TGT_COMPOSE_BOUNDS;
 
-	ret = v4l_g_selection(ops, file, fh, &s);
+	ret = v4l_g_selection(ops, file, &s);
 	if (ret)
 		return ret;
 	p->bounds = s.r;
@@ -2620,7 +2620,7 @@ static int v4l_cropcap(const struct v4l2_ioctl_ops *ops,
 	else
 		s.target = V4L2_SEL_TGT_CROP_DEFAULT;
 
-	ret = v4l_g_selection(ops, file, fh, &s);
+	ret = v4l_g_selection(ops, file, &s);
 	if (ret)
 		return ret;
 	p->defrect = s.r;
@@ -2628,8 +2628,8 @@ static int v4l_cropcap(const struct v4l2_ioctl_ops *ops,
 	return 0;
 }
 
-static int v4l_log_status(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_log_status(const struct v4l2_ioctl_ops *ops, struct file *file,
+			  void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	int ret;
@@ -2637,7 +2637,7 @@ static int v4l_log_status(const struct v4l2_ioctl_ops *ops,
 	if (vfd->v4l2_dev)
 		pr_info("%s: =================  START STATUS  =================\n",
 			vfd->v4l2_dev->name);
-	ret = ops->vidioc_log_status(file, fh);
+	ret = ops->vidioc_log_status(file, NULL);
 	if (vfd->v4l2_dev)
 		pr_info("%s: ==================  END STATUS  ==================\n",
 			vfd->v4l2_dev->name);
@@ -2645,7 +2645,7 @@ static int v4l_log_status(const struct v4l2_ioctl_ops *ops,
 }
 
 static int v4l_dbg_g_register(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+			      struct file *file, void *arg)
 {
 #ifdef CONFIG_VIDEO_ADV_DEBUG
 	struct v4l2_dbg_register *p = arg;
@@ -2665,7 +2665,7 @@ static int v4l_dbg_g_register(const struct v4l2_ioctl_ops *ops,
 	}
 	if (ops->vidioc_g_register && p->match.type == V4L2_CHIP_MATCH_BRIDGE &&
 	    (ops->vidioc_g_chip_info || p->match.addr == 0))
-		return ops->vidioc_g_register(file, fh, p);
+		return ops->vidioc_g_register(file, NULL, p);
 	return -EINVAL;
 #else
 	return -ENOTTY;
@@ -2673,7 +2673,7 @@ static int v4l_dbg_g_register(const struct v4l2_ioctl_ops *ops,
 }
 
 static int v4l_dbg_s_register(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+			      struct file *file, void *arg)
 {
 #ifdef CONFIG_VIDEO_ADV_DEBUG
 	const struct v4l2_dbg_register *p = arg;
@@ -2693,7 +2693,7 @@ static int v4l_dbg_s_register(const struct v4l2_ioctl_ops *ops,
 	}
 	if (ops->vidioc_s_register && p->match.type == V4L2_CHIP_MATCH_BRIDGE &&
 	    (ops->vidioc_g_chip_info || p->match.addr == 0))
-		return ops->vidioc_s_register(file, fh, p);
+		return ops->vidioc_s_register(file, NULL, p);
 	return -EINVAL;
 #else
 	return -ENOTTY;
@@ -2701,7 +2701,7 @@ static int v4l_dbg_s_register(const struct v4l2_ioctl_ops *ops,
 }
 
 static int v4l_dbg_g_chip_info(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+			       struct file *file, void *arg)
 {
 #ifdef CONFIG_VIDEO_ADV_DEBUG
 	struct video_device *vfd = video_devdata(file);
@@ -2717,7 +2717,7 @@ static int v4l_dbg_g_chip_info(const struct v4l2_ioctl_ops *ops,
 			p->flags |= V4L2_CHIP_FL_READABLE;
 		strscpy(p->name, vfd->v4l2_dev->name, sizeof(p->name));
 		if (ops->vidioc_g_chip_info)
-			return ops->vidioc_g_chip_info(file, fh, arg);
+			return ops->vidioc_g_chip_info(file, NULL, arg);
 		if (p->match.addr)
 			return -EINVAL;
 		return 0;
@@ -2743,8 +2743,8 @@ static int v4l_dbg_g_chip_info(const struct v4l2_ioctl_ops *ops,
 #endif
 }
 
-static int v4l_dqevent(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+static int v4l_dqevent(const struct v4l2_ioctl_ops *ops, struct file *file,
+		       void *arg)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 
@@ -2752,7 +2752,7 @@ static int v4l_dqevent(const struct v4l2_ioctl_ops *ops,
 }
 
 static int v4l_subscribe_event(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+			       struct file *file, void *arg)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 
@@ -2760,7 +2760,7 @@ static int v4l_subscribe_event(const struct v4l2_ioctl_ops *ops,
 }
 
 static int v4l_unsubscribe_event(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+				 struct file *file, void *arg)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 
@@ -2768,7 +2768,7 @@ static int v4l_unsubscribe_event(const struct v4l2_ioctl_ops *ops,
 }
 
 static int v4l_g_sliced_vbi_cap(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+				struct file *file, void *arg)
 {
 	struct v4l2_sliced_vbi_cap *p = arg;
 	int ret = check_fmt(file, p->type);
@@ -2779,11 +2779,11 @@ static int v4l_g_sliced_vbi_cap(const struct v4l2_ioctl_ops *ops,
 	/* Clear up to type, everything after type is zeroed already */
 	memset(p, 0, offsetof(struct v4l2_sliced_vbi_cap, type));
 
-	return ops->vidioc_g_sliced_vbi_cap(file, fh, p);
+	return ops->vidioc_g_sliced_vbi_cap(file, NULL, p);
 }
 
 static int v4l_enum_freq_bands(const struct v4l2_ioctl_ops *ops,
-				struct file *file, void *fh, void *arg)
+			       struct file *file, void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_frequency_band *p = arg;
@@ -2801,7 +2801,7 @@ static int v4l_enum_freq_bands(const struct v4l2_ioctl_ops *ops,
 			return -EINVAL;
 	}
 	if (ops->vidioc_enum_freq_bands) {
-		err = ops->vidioc_enum_freq_bands(file, fh, p);
+		err = ops->vidioc_enum_freq_bands(file, NULL, p);
 		if (err != -ENOTTY)
 			return err;
 	}
@@ -2813,7 +2813,7 @@ static int v4l_enum_freq_bands(const struct v4l2_ioctl_ops *ops,
 
 		if (p->index)
 			return -EINVAL;
-		err = ops->vidioc_g_tuner(file, fh, &t);
+		err = ops->vidioc_g_tuner(file, NULL, &t);
 		if (err)
 			return err;
 		p->capability = t.capability | V4L2_TUNER_CAP_FREQ_BANDS;
@@ -2832,7 +2832,7 @@ static int v4l_enum_freq_bands(const struct v4l2_ioctl_ops *ops,
 			return -EINVAL;
 		if (p->index)
 			return -EINVAL;
-		err = ops->vidioc_g_modulator(file, fh, &m);
+		err = ops->vidioc_g_modulator(file, NULL, &m);
 		if (err)
 			return err;
 		p->capability = m.capability | V4L2_TUNER_CAP_FREQ_BANDS;
@@ -2849,7 +2849,7 @@ struct v4l2_ioctl_info {
 	u32 flags;
 	const char * const name;
 	int (*func)(const struct v4l2_ioctl_ops *ops, struct file *file,
-		    void *fh, void *p);
+		    void *p);
 	void (*debug)(const void *arg, bool write_only);
 };
 
@@ -2870,9 +2870,9 @@ struct v4l2_ioctl_info {
 #define DEFINE_V4L_STUB_FUNC(_vidioc)				\
 	static int v4l_stub_ ## _vidioc(			\
 			const struct v4l2_ioctl_ops *ops,	\
-			struct file *file, void *fh, void *p)	\
+			struct file *file, void *p)		\
 	{							\
-		return ops->vidioc_ ## _vidioc(file, fh, p);	\
+		return ops->vidioc_ ## _vidioc(file, NULL, p);	\
 	}
 
 #define IOCTL_INFO(_ioctl, _func, _debug, _flags)		\
@@ -3126,7 +3126,7 @@ static long __video_do_ioctl(struct file *file,
 
 	write_only = _IOC_DIR(cmd) == _IOC_WRITE;
 	if (info != &default_info) {
-		ret = info->func(ops, file, NULL, arg);
+		ret = info->func(ops, file, arg);
 	} else if (!ops->vidioc_default) {
 		ret = -ENOTTY;
 	} else {
-- 
Regards,

Laurent Pinchart


