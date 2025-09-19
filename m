Return-Path: <linux-media+bounces-42759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4075B88B61
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 11:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5898C1BC7B91
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 09:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C21306B3D;
	Fri, 19 Sep 2025 09:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AdlKwL5J"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D1C306D4B;
	Fri, 19 Sep 2025 09:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758275877; cv=none; b=lH3Eg7BjSqqgs5qvYZKSCHA3dpSZBUTXJLecnhon+Ude2LJ9cpwi5d8out3bErq6ZG0xESmNgRg7B3NTYxqB0J52vbnbJh8sQe8vMvC7Zr8tsWqrI80cobXAtjgpEVD0bf/6X/tk4P4WQ3Tc2napcBf6pqkE09/FMbG35d86CtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758275877; c=relaxed/simple;
	bh=h03H+8yiC2Kyhg05f5+XZZP4Qf6g7IoJdSXpJjGJz9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mAl89+FoM33k0W09FLIdHB/xSH+mIll+gGabQ/WWtDVO4T0oiwmwHkKCkJ4eqaZRM+dR8ueNzeHUSXA0NPe5562XUkHyrkBzup39kpsRDmUeZ34pPp9dj5Nw1mUI5QAXxhndFHlMcYKhEsTrOjmLHiBEloFJABnF8mX83e3u5zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AdlKwL5J; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:4816:952:3054:81b6:1a3a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1EDAAD3E;
	Fri, 19 Sep 2025 11:56:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758275793;
	bh=h03H+8yiC2Kyhg05f5+XZZP4Qf6g7IoJdSXpJjGJz9k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AdlKwL5J/YS60EZTBBJub18zWuZvEeYq/TYP10lyYMZRlD07R6l0ROWawEo0IpPkh
	 BA7+D861xMKSXd9fUo7besj6CfGgL210vGhr2LWqrTJdBXmyYoLOY8PAbqndAA1+2m
	 LkTsusoN0HOOpDJ5L3yNFBNUcW1WIWhGudp33ThE=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 19 Sep 2025 15:26:01 +0530
Subject: [PATCH v2 09/10] media: rkisp1: Use video_device_state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-vdev-state-v2-9-b2c42426965c@ideasonboard.com>
References: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
In-Reply-To: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
To: Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, 
 Dafna Hirschfeld <dafna@fastmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Use the newly introduced video_device_state to store the active V4L2
format for the video device.

Additionally, calculate stride on-demand instead of storing it in the
driver context structure.

This change allows using a single function for both .s_fmt and .try_fmt
hooks, while leveraging the framework helper for the .g_fmt hook.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
--
Cc: Dafna Hirschfeld <dafna@fastmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 .../platform/rockchip/rkisp1/rkisp1-capture.c      | 135 +++++++++++----------
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |   4 -
 2 files changed, 70 insertions(+), 69 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 38541f482b2d0dcf23546a0b9f893fb8544bcc40..81bf4ed8bccdb0873c910fa49b22ef72eab295eb 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -482,7 +482,10 @@ static void rkisp1_irq_frame_end_enable(struct rkisp1_capture *cap)
 
 static void rkisp1_mp_config(struct rkisp1_capture *cap)
 {
-	const struct v4l2_pix_format_mplane *pixm = &cap->pix.fmt;
+	const struct v4l2_format *format =
+		video_device_state_get_fmt(cap->vnode.vdev.state);
+	const struct v4l2_pix_format_mplane *pixm = &format->fmt.pix_mp;
+	u32 stride = pixm->plane_fmt[0].bytesperline / cap->pix.info->bpp[0];
 	struct rkisp1_device *rkisp1 = cap->rkisp1;
 	u32 reg;
 
@@ -494,11 +497,11 @@ static void rkisp1_mp_config(struct rkisp1_capture *cap)
 		     rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CR));
 
 	if (rkisp1_has_feature(rkisp1, MAIN_STRIDE)) {
-		rkisp1_write(rkisp1, RKISP1_CIF_MI_MP_Y_LLENGTH, cap->stride);
+		rkisp1_write(rkisp1, RKISP1_CIF_MI_MP_Y_LLENGTH, stride);
 		rkisp1_write(rkisp1, RKISP1_CIF_MI_MP_Y_PIC_WIDTH, pixm->width);
 		rkisp1_write(rkisp1, RKISP1_CIF_MI_MP_Y_PIC_HEIGHT, pixm->height);
 		rkisp1_write(rkisp1, RKISP1_CIF_MI_MP_Y_PIC_SIZE,
-			     cap->stride * pixm->height);
+			     stride * pixm->height);
 	}
 
 	rkisp1_irq_frame_end_enable(cap);
@@ -546,7 +549,10 @@ static void rkisp1_mp_config(struct rkisp1_capture *cap)
 
 static void rkisp1_sp_config(struct rkisp1_capture *cap)
 {
-	const struct v4l2_pix_format_mplane *pixm = &cap->pix.fmt;
+	const struct v4l2_format *format =
+		video_device_state_get_fmt(cap->vnode.vdev.state);
+	const struct v4l2_pix_format_mplane *pixm = &format->fmt.pix_mp;
+	u32 stride = pixm->plane_fmt[0].bytesperline / cap->pix.info->bpp[0];
 	struct rkisp1_device *rkisp1 = cap->rkisp1;
 	u32 mi_ctrl, reg;
 
@@ -557,11 +563,11 @@ static void rkisp1_sp_config(struct rkisp1_capture *cap)
 	rkisp1_write(rkisp1, cap->config->mi.cr_size_init,
 		     rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CR));
 
-	rkisp1_write(rkisp1, RKISP1_CIF_MI_SP_Y_LLENGTH, cap->stride);
+	rkisp1_write(rkisp1, RKISP1_CIF_MI_SP_Y_LLENGTH, stride);
 	rkisp1_write(rkisp1, RKISP1_CIF_MI_SP_Y_PIC_WIDTH, pixm->width);
 	rkisp1_write(rkisp1, RKISP1_CIF_MI_SP_Y_PIC_HEIGHT, pixm->height);
 	rkisp1_write(rkisp1, RKISP1_CIF_MI_SP_Y_PIC_SIZE,
-		     cap->stride * pixm->height);
+		     stride * pixm->height);
 
 	rkisp1_irq_frame_end_enable(cap);
 
@@ -704,7 +710,9 @@ static const struct rkisp1_capture_ops rkisp1_capture_ops_sp = {
 
 static int rkisp1_dummy_buf_create(struct rkisp1_capture *cap)
 {
-	const struct v4l2_pix_format_mplane *pixm = &cap->pix.fmt;
+	const struct v4l2_format *format =
+		video_device_state_get_fmt(cap->vnode.vdev.state);
+	const struct v4l2_pix_format_mplane *pixm = &format->fmt.pix_mp;
 	struct rkisp1_dummy_buffer *dummy_buf = &cap->buf.dummy;
 
 	dummy_buf->size = max3(rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_Y),
@@ -869,7 +877,9 @@ static int rkisp1_vb2_queue_setup(struct vb2_queue *queue,
 				  struct device *alloc_devs[])
 {
 	struct rkisp1_capture *cap = queue->drv_priv;
-	const struct v4l2_pix_format_mplane *pixm = &cap->pix.fmt;
+	const struct v4l2_format *format =
+		video_device_state_get_fmt(cap->vnode.vdev.state);
+	const struct v4l2_pix_format_mplane *pixm = &format->fmt.pix_mp;
 	unsigned int i;
 
 	if (*num_planes) {
@@ -894,7 +904,9 @@ static int rkisp1_vb2_buf_init(struct vb2_buffer *vb)
 	struct rkisp1_buffer *ispbuf =
 		container_of(vbuf, struct rkisp1_buffer, vb);
 	struct rkisp1_capture *cap = vb->vb2_queue->drv_priv;
-	const struct v4l2_pix_format_mplane *pixm = &cap->pix.fmt;
+	const struct v4l2_format *format =
+		video_device_state_get_fmt(cap->vnode.vdev.state);
+	const struct v4l2_pix_format_mplane *pixm = &format->fmt.pix_mp;
 	unsigned int i;
 
 	memset(ispbuf->buff_addr, 0, sizeof(ispbuf->buff_addr));
@@ -936,10 +948,13 @@ static void rkisp1_vb2_buf_queue(struct vb2_buffer *vb)
 static int rkisp1_vb2_buf_prepare(struct vb2_buffer *vb)
 {
 	struct rkisp1_capture *cap = vb->vb2_queue->drv_priv;
+	const struct v4l2_format *format =
+		video_device_state_get_fmt(cap->vnode.vdev.state);
+	const struct v4l2_pix_format_mplane *pixm = &format->fmt.pix_mp;
 	unsigned int i;
 
-	for (i = 0; i < cap->pix.fmt.num_planes; i++) {
-		unsigned long size = cap->pix.fmt.plane_fmt[i].sizeimage;
+	for (i = 0; i < pixm->num_planes; i++) {
+		unsigned long size = pixm->plane_fmt[i].sizeimage;
 
 		if (vb2_plane_size(vb, i) < size) {
 			dev_err(cap->rkisp1->dev,
@@ -1278,7 +1293,7 @@ rkisp1_find_fmt_cfg(const struct rkisp1_capture *cap, const u32 pixelfmt)
 	return NULL;
 }
 
-static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
+static void rkisp1_adj_fmt(const struct rkisp1_capture *cap,
 			   struct v4l2_pix_format_mplane *pixm,
 			   const struct rkisp1_capture_fmt_cfg **fmt_cfg,
 			   const struct v4l2_format_info **fmt_info)
@@ -1317,23 +1332,23 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
 		*fmt_info = info;
 }
 
-static void rkisp1_set_fmt(struct rkisp1_capture *cap,
-			   struct v4l2_pix_format_mplane *pixm)
-{
-	rkisp1_try_fmt(cap, pixm, &cap->pix.cfg, &cap->pix.info);
-
-	cap->pix.fmt = *pixm;
-	cap->stride = pixm->plane_fmt[0].bytesperline / cap->pix.info->bpp[0];
-}
-
-static int rkisp1_try_fmt_vid_cap_mplane(struct file *file,
+static int rkisp1_adj_fmt_vid_cap_mplane(struct file *file,
 					 struct video_device_state *state,
 					 struct v4l2_format *f)
 {
 	struct rkisp1_capture *cap = video_drvdata(file);
 
-	rkisp1_try_fmt(cap, &f->fmt.pix_mp, NULL, NULL);
+	if (state->which == VIDEO_DEVICE_STATE_ACTIVE) {
+		if (vb2_is_busy(cap->vnode.vdev.queue))
+			return -EBUSY;
 
+		rkisp1_adj_fmt(cap, &f->fmt.pix_mp, &cap->pix.cfg,
+			       &cap->pix.info);
+	} else {
+		rkisp1_adj_fmt(cap, &f->fmt.pix_mp, NULL, NULL);
+	}
+
+	state->fmt = *f;
 	return 0;
 }
 
@@ -1402,33 +1417,6 @@ static int rkisp1_enum_framesizes(struct file *file,
 	return 0;
 }
 
-static int rkisp1_s_fmt_vid_cap_mplane(struct file *file,
-				       struct video_device_state *state,
-				       struct v4l2_format *f)
-{
-	struct rkisp1_capture *cap = video_drvdata(file);
-	struct rkisp1_vdev_node *node =
-				rkisp1_vdev_to_node(&cap->vnode.vdev);
-
-	if (vb2_is_busy(&node->buf_queue))
-		return -EBUSY;
-
-	rkisp1_set_fmt(cap, &f->fmt.pix_mp);
-
-	return 0;
-}
-
-static int rkisp1_g_fmt_vid_cap_mplane(struct file *file,
-				       struct video_device_state *state,
-				       struct v4l2_format *f)
-{
-	struct rkisp1_capture *cap = video_drvdata(file);
-
-	f->fmt.pix_mp = cap->pix.fmt;
-
-	return 0;
-}
-
 static int
 rkisp1_querycap(struct file *file, struct video_device_state *state,
 		struct v4l2_capability *cap)
@@ -1450,9 +1438,9 @@ static const struct v4l2_ioctl_ops rkisp1_v4l2_ioctl_ops = {
 	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
 	.vidioc_streamon = vb2_ioctl_streamon,
 	.vidioc_streamoff = vb2_ioctl_streamoff,
-	.vidioc_try_fmt_vid_cap_mplane = rkisp1_try_fmt_vid_cap_mplane,
-	.vidioc_s_fmt_vid_cap_mplane = rkisp1_s_fmt_vid_cap_mplane,
-	.vidioc_g_fmt_vid_cap_mplane = rkisp1_g_fmt_vid_cap_mplane,
+	.vidioc_try_fmt_vid_cap_mplane = rkisp1_adj_fmt_vid_cap_mplane,
+	.vidioc_s_fmt_vid_cap_mplane = rkisp1_adj_fmt_vid_cap_mplane,
+	.vidioc_g_fmt_vid_cap_mplane = video_device_g_fmt,
 	.vidioc_enum_fmt_vid_cap = rkisp1_enum_fmt_vid_cap_mplane,
 	.vidioc_enum_framesizes = rkisp1_enum_framesizes,
 	.vidioc_querycap = rkisp1_querycap,
@@ -1460,6 +1448,25 @@ static const struct v4l2_ioctl_ops rkisp1_v4l2_ioctl_ops = {
 	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
 };
 
+static int rkisp1_vdev_init_state(struct video_device_state *state)
+{
+	struct rkisp1_capture *cap = video_get_drvdata(state->vdev);
+	struct v4l2_pix_format_mplane *pixm = &state->fmt.fmt.pix_mp;
+
+	state->fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	pixm->pixelformat = V4L2_PIX_FMT_YUYV;
+	pixm->width = RKISP1_DEFAULT_WIDTH;
+	pixm->height = RKISP1_DEFAULT_HEIGHT;
+
+	rkisp1_adj_fmt(cap, pixm, &cap->pix.cfg, &cap->pix.info);
+
+	return 0;
+}
+
+static const struct video_device_internal_ops rkisp1_vdev_ops = {
+	.init_state = rkisp1_vdev_init_state,
+};
+
 static int rkisp1_capture_link_validate(struct media_link *link)
 {
 	struct video_device *vdev =
@@ -1467,8 +1474,11 @@ static int rkisp1_capture_link_validate(struct media_link *link)
 	struct v4l2_subdev *sd =
 		media_entity_to_v4l2_subdev(link->source->entity);
 	struct rkisp1_capture *cap = video_get_drvdata(vdev);
+	const struct v4l2_format *format =
+		video_device_state_get_fmt(cap->vnode.vdev.state);
+	const struct v4l2_pix_format_mplane *pixm = &format->fmt.pix_mp;
 	const struct rkisp1_capture_fmt_cfg *fmt =
-		rkisp1_find_fmt_cfg(cap, cap->pix.fmt.pixelformat);
+		rkisp1_find_fmt_cfg(cap, pixm->pixelformat);
 	struct v4l2_subdev_format sd_fmt = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.pad = link->source->index,
@@ -1479,16 +1489,16 @@ static int rkisp1_capture_link_validate(struct media_link *link)
 	if (ret)
 		return ret;
 
-	if (sd_fmt.format.height != cap->pix.fmt.height ||
-	    sd_fmt.format.width != cap->pix.fmt.width ||
+	if (sd_fmt.format.height != pixm->height ||
+	    sd_fmt.format.width != pixm->width ||
 	    sd_fmt.format.code != fmt->mbus) {
 		dev_dbg(cap->rkisp1->dev,
 			"link '%s':%u -> '%s':%u not valid: 0x%04x/%ux%u != 0x%04x/%ux%u\n",
 			link->source->entity->name, link->source->index,
 			link->sink->entity->name, link->sink->index,
 			sd_fmt.format.code, sd_fmt.format.width,
-			sd_fmt.format.height, fmt->mbus, cap->pix.fmt.width,
-			cap->pix.fmt.height);
+			sd_fmt.format.height, fmt->mbus, pixm->width,
+			pixm->height);
 		return -EPIPE;
 	}
 
@@ -1546,6 +1556,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
 	mutex_init(&node->vlock);
 
 	vdev->ioctl_ops = &rkisp1_v4l2_ioctl_ops;
+	vdev->vdev_ops = &rkisp1_vdev_ops;
 	vdev->release = video_device_release_empty;
 	vdev->fops = &rkisp1_fops;
 	vdev->minor = -1;
@@ -1554,6 +1565,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
 	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
 			    V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
 	vdev->entity.ops = &rkisp1_media_ops;
+	set_bit(V4L2_FL_USES_STATE, &vdev->flags);
 	video_set_drvdata(vdev, cap);
 	vdev->vfl_dir = VFL_DIR_RX;
 	node->pad.flags = MEDIA_PAD_FL_SINK;
@@ -1604,7 +1616,6 @@ static void
 rkisp1_capture_init(struct rkisp1_device *rkisp1, enum rkisp1_stream_id id)
 {
 	struct rkisp1_capture *cap = &rkisp1->capture_devs[id];
-	struct v4l2_pix_format_mplane pixm;
 
 	memset(cap, 0, sizeof(*cap));
 	cap->id = id;
@@ -1622,12 +1633,6 @@ rkisp1_capture_init(struct rkisp1_device *rkisp1, enum rkisp1_stream_id id)
 	}
 
 	cap->is_streaming = false;
-
-	memset(&pixm, 0, sizeof(pixm));
-	pixm.pixelformat = V4L2_PIX_FMT_YUYV;
-	pixm.width = RKISP1_DEFAULT_WIDTH;
-	pixm.height = RKISP1_DEFAULT_HEIGHT;
-	rkisp1_set_fmt(cap, &pixm);
 }
 
 int rkisp1_capture_devs_register(struct rkisp1_device *rkisp1)
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 6028ecdd23de6f69d53f77796252ee399a14436a..5731c4b368f8832c2b0748338cd0da2d0edf0a93 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -309,7 +309,6 @@ struct rkisp1_device;
  *		  handler to stop the streaming by waiting on the 'done' wait queue.
  *		  If the irq handler is not called, the stream is stopped by the callback
  *		  after timeout.
- * @stride:       the line stride for the first plane, in pixel units
  * @buf.lock:	  lock to protect buf.queue
  * @buf.queue:	  queued buffer list
  * @buf.dummy:	  dummy space to store dropped data
@@ -319,7 +318,6 @@ struct rkisp1_device;
  * @buf.next:	  the buffer used for next frame
  * @pix.cfg:	  pixel configuration
  * @pix.info:	  a pointer to the v4l2_format_info of the pixel format
- * @pix.fmt:	  buffer format
  */
 struct rkisp1_capture {
 	struct rkisp1_vdev_node vnode;
@@ -330,7 +328,6 @@ struct rkisp1_capture {
 	bool is_streaming;
 	bool is_stopping;
 	wait_queue_head_t done;
-	unsigned int stride;
 	struct {
 		/* protects queue, curr and next */
 		spinlock_t lock;
@@ -342,7 +339,6 @@ struct rkisp1_capture {
 	struct {
 		const struct rkisp1_capture_fmt_cfg *cfg;
 		const struct v4l2_format_info *info;
-		struct v4l2_pix_format_mplane fmt;
 	} pix;
 };
 

-- 
2.51.0


