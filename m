Return-Path: <linux-media+bounces-42758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 001F5B88B5B
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 11:59:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9805625647
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 09:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6680E2EBDD9;
	Fri, 19 Sep 2025 09:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RTNIp4cw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5832F83BA;
	Fri, 19 Sep 2025 09:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758275871; cv=none; b=FmhcPGEqO06pRzQlnbfobBgjrrYtFZu/pMbwcaTZ3co/Nzfcf4ZgxA+iNINp+SGrtentOcoMY/IeBfoqs91rMRAcGZC5hhRmmIyb3qzRx62FT/h4IJWXFko8CBCKdytZK7+FsIxHdF60Bxj1a36Wukm808QuTI3yyrB/V1cqq2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758275871; c=relaxed/simple;
	bh=7RThQq6enDN5qtXPKbmoCSTktTegcP0V9iKtvTOatxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SiQfXZLZ3zYsuVKsqqxQkELaTttPUeNsbASkD26MJ4Sx8P7PsfkZxQJweJ9WprBMrw6hoBYsMJKDVMpCy1fgttGeL+Ms+UmWXZmqE5Uhu/sGlOCYzoGIrG/HvCQovKw4uvs572U/hPLZdO2bb3m3w7Vwh7FxmRE3feiDH+I2CwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RTNIp4cw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:4816:952:3054:81b6:1a3a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D07BD99F;
	Fri, 19 Sep 2025 11:56:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758275788;
	bh=7RThQq6enDN5qtXPKbmoCSTktTegcP0V9iKtvTOatxI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RTNIp4cwO7rObTEHofXw4Xz5C4Ir6lo+9fKw7pBOmTF/gY2gkCwZsGnS4OrKpz/ZE
	 o58t89zvpogBte6dzF4IY5Tpl2xlhpPq0NzCE+XDZE46JgrLwTpz2D0Rf+pLArsgER
	 rzb7fZ6T+Opif20w+7PMPdPDJNN4XqGX93nyS3OE=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 19 Sep 2025 15:26:00 +0530
Subject: [PATCH v2 08/10] media: ti: j721e-csi2rx: Use video_device_state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-vdev-state-v2-8-b2c42426965c@ideasonboard.com>
References: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
In-Reply-To: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
To: Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, 
 Jai Luthra <jai.luthra@linux.dev>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Use the newly introduced video_device_state to store the active V4L2
format for the video device.

This change allows using a single function for both .s_fmt and .try_fmt
hooks, while leveraging the framework helper for the .g_fmt hook.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
--
Cc: Jai Luthra <jai.luthra@linux.dev>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 119 +++++++++++----------
 1 file changed, 62 insertions(+), 57 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index ac9a87ee06b1090456508c87893ac0a265c93ae9..08557fc77851ec5897d5adc8011e2cd031267cf5 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -17,6 +17,7 @@
 
 #include <media/cadence/cdns-csi2rx.h>
 #include <media/mipi-csi2.h>
+#include <media/v4l2-dev.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mc.h>
@@ -110,7 +111,6 @@ struct ti_csi2rx_dev {
 	struct v4l2_subdev		*source;
 	struct vb2_queue		vidq;
 	struct mutex			mutex; /* To serialize ioctls. */
-	struct v4l2_format		v_fmt;
 	struct ti_csi2rx_dma		dma;
 	u32				sequence;
 	u8				pix_per_clk;
@@ -308,22 +308,19 @@ static int ti_csi2rx_enum_fmt_vid_cap(struct file *file,
 	return 0;
 }
 
-static int ti_csi2rx_g_fmt_vid_cap(struct file *file,
-				   struct video_device_state *state,
-				   struct v4l2_format *f)
-{
-	struct ti_csi2rx_dev *csi = video_drvdata(file);
-
-	*f = csi->v_fmt;
-
-	return 0;
-}
-
-static int ti_csi2rx_try_fmt_vid_cap(struct file *file,
+static int ti_csi2rx_adj_fmt_vid_cap(struct file *file,
 				     struct video_device_state *state,
 				     struct v4l2_format *f)
 {
 	const struct ti_csi2rx_fmt *fmt;
+	struct v4l2_format *format;
+
+	if (state->which == VIDEO_DEVICE_STATE_ACTIVE) {
+		struct ti_csi2rx_dev *csi = video_drvdata(file);
+
+		if (vb2_is_busy(csi->vdev.queue))
+			return -EBUSY;
+	}
 
 	/*
 	 * Default to the first format if the requested pixel format code isn't
@@ -338,25 +335,8 @@ static int ti_csi2rx_try_fmt_vid_cap(struct file *file,
 
 	ti_csi2rx_fill_fmt(fmt, f);
 
-	return 0;
-}
-
-static int ti_csi2rx_s_fmt_vid_cap(struct file *file,
-				   struct video_device_state *state,
-				   struct v4l2_format *f)
-{
-	struct ti_csi2rx_dev *csi = video_drvdata(file);
-	struct vb2_queue *q = &csi->vidq;
-	int ret;
-
-	if (vb2_is_busy(q))
-		return -EBUSY;
-
-	ret = ti_csi2rx_try_fmt_vid_cap(file, state, f);
-	if (ret < 0)
-		return ret;
-
-	csi->v_fmt = *f;
+	format = video_device_state_get_fmt(state);
+	*format = *f;
 
 	return 0;
 }
@@ -390,12 +370,36 @@ static int ti_csi2rx_enum_framesizes(struct file *file,
 	return 0;
 }
 
+static int ti_csi2rx_vdev_init_state(struct video_device_state *state)
+{
+	const struct ti_csi2rx_fmt *fmt;
+	struct v4l2_pix_format *pix_fmt;
+
+	fmt = find_format_by_fourcc(V4L2_PIX_FMT_UYVY);
+	if (!fmt)
+		return -EINVAL;
+
+	state->fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	pix_fmt = &state->fmt.fmt.pix;
+	pix_fmt->width = 640;
+	pix_fmt->height = 480;
+	pix_fmt->field = V4L2_FIELD_NONE;
+	pix_fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	pix_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+	pix_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
+	pix_fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
+
+	ti_csi2rx_fill_fmt(fmt, &state->fmt);
+
+	return 0;
+}
+
 static const struct v4l2_ioctl_ops csi_ioctl_ops = {
 	.vidioc_querycap      = ti_csi2rx_querycap,
 	.vidioc_enum_fmt_vid_cap = ti_csi2rx_enum_fmt_vid_cap,
-	.vidioc_try_fmt_vid_cap = ti_csi2rx_try_fmt_vid_cap,
-	.vidioc_g_fmt_vid_cap = ti_csi2rx_g_fmt_vid_cap,
-	.vidioc_s_fmt_vid_cap = ti_csi2rx_s_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap = ti_csi2rx_adj_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap = video_device_g_fmt,
+	.vidioc_s_fmt_vid_cap = ti_csi2rx_adj_fmt_vid_cap,
 	.vidioc_enum_framesizes = ti_csi2rx_enum_framesizes,
 	.vidioc_reqbufs       = vb2_ioctl_reqbufs,
 	.vidioc_create_bufs   = vb2_ioctl_create_bufs,
@@ -418,6 +422,10 @@ static const struct v4l2_file_operations csi_fops = {
 	.mmap = vb2_fop_mmap,
 };
 
+static const struct video_device_internal_ops csi_vdev_ops = {
+	.init_state = ti_csi2rx_vdev_init_state,
+};
+
 static int csi_async_notifier_bound(struct v4l2_async_notifier *notifier,
 				    struct v4l2_subdev *subdev,
 				    struct v4l2_async_connection *asc)
@@ -518,9 +526,11 @@ static void ti_csi2rx_request_max_ppc(struct ti_csi2rx_dev *csi)
 static void ti_csi2rx_setup_shim(struct ti_csi2rx_dev *csi)
 {
 	const struct ti_csi2rx_fmt *fmt;
+	struct v4l2_format *format;
 	unsigned int reg;
 
-	fmt = find_format_by_fourcc(csi->v_fmt.fmt.pix.pixelformat);
+	format = video_device_state_get_fmt(csi->vdev.state);
+	fmt = find_format_by_fourcc(format->fmt.pix.pixelformat);
 
 	/* De-assert the pixel interface reset. */
 	reg = SHIM_CNTL_PIX_RST;
@@ -671,13 +681,21 @@ static void ti_csi2rx_dma_callback(void *param)
 	spin_unlock_irqrestore(&dma->lock, flags);
 }
 
+static u32 ti_csi2rx_sizeimage(struct ti_csi2rx_dev *csi)
+{
+	struct v4l2_format *format =
+		video_device_state_get_fmt(csi->vdev.state);
+
+	return format->fmt.pix.sizeimage;
+}
+
 static int ti_csi2rx_start_dma(struct ti_csi2rx_dev *csi,
 			       struct ti_csi2rx_buffer *buf)
 {
-	unsigned long addr;
 	struct dma_async_tx_descriptor *desc;
-	size_t len = csi->v_fmt.fmt.pix.sizeimage;
+	unsigned long addr;
 	dma_cookie_t cookie;
+	size_t len = ti_csi2rx_sizeimage(csi);
 	int ret = 0;
 
 	addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
@@ -754,7 +772,7 @@ static int ti_csi2rx_queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
 				 struct device *alloc_devs[])
 {
 	struct ti_csi2rx_dev *csi = vb2_get_drv_priv(q);
-	unsigned int size = csi->v_fmt.fmt.pix.sizeimage;
+	unsigned int size = ti_csi2rx_sizeimage(csi);
 
 	if (*nplanes) {
 		if (sizes[0] < size)
@@ -771,7 +789,7 @@ static int ti_csi2rx_queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
 static int ti_csi2rx_buffer_prepare(struct vb2_buffer *vb)
 {
 	struct ti_csi2rx_dev *csi = vb2_get_drv_priv(vb->vb2_queue);
-	unsigned long size = csi->v_fmt.fmt.pix.sizeimage;
+	unsigned long size = ti_csi2rx_sizeimage(csi);
 
 	if (vb2_plane_size(vb, 0) < size) {
 		dev_err(csi->dev, "Data will not fit into plane\n");
@@ -951,7 +969,8 @@ static int ti_csi2rx_link_validate(struct media_link *link)
 	struct media_entity *entity = link->sink->entity;
 	struct video_device *vdev = media_entity_to_video_device(entity);
 	struct ti_csi2rx_dev *csi = container_of(vdev, struct ti_csi2rx_dev, vdev);
-	struct v4l2_pix_format *csi_fmt = &csi->v_fmt.fmt.pix;
+	struct v4l2_format *format = video_device_state_get_fmt(vdev->state);
+	struct v4l2_pix_format *csi_fmt = &format->fmt.pix;
 	struct v4l2_subdev_format source_fmt = {
 		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
 		.pad	= link->source->index,
@@ -1041,24 +1060,8 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 {
 	struct media_device *mdev = &csi->mdev;
 	struct video_device *vdev = &csi->vdev;
-	const struct ti_csi2rx_fmt *fmt;
-	struct v4l2_pix_format *pix_fmt = &csi->v_fmt.fmt.pix;
 	int ret;
 
-	fmt = find_format_by_fourcc(V4L2_PIX_FMT_UYVY);
-	if (!fmt)
-		return -EINVAL;
-
-	pix_fmt->width = 640;
-	pix_fmt->height = 480;
-	pix_fmt->field = V4L2_FIELD_NONE;
-	pix_fmt->colorspace = V4L2_COLORSPACE_SRGB;
-	pix_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
-	pix_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
-	pix_fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
-
-	ti_csi2rx_fill_fmt(fmt, &csi->v_fmt);
-
 	mdev->dev = csi->dev;
 	mdev->hw_revision = 1;
 	strscpy(mdev->model, "TI-CSI2RX", sizeof(mdev->model));
@@ -1070,10 +1073,12 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 	vdev->vfl_dir = VFL_DIR_RX;
 	vdev->fops = &csi_fops;
 	vdev->ioctl_ops = &csi_ioctl_ops;
+	vdev->vdev_ops = &csi_vdev_ops;
 	vdev->release = video_device_release_empty;
 	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
 			    V4L2_CAP_IO_MC;
 	vdev->lock = &csi->mutex;
+	set_bit(V4L2_FL_USES_STATE, &vdev->flags);
 	video_set_drvdata(vdev, csi);
 
 	csi->pad.flags = MEDIA_PAD_FL_SINK;

-- 
2.51.0


