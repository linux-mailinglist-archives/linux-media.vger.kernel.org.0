Return-Path: <linux-media+bounces-36756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BE6AF8510
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 03:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1912548439
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 01:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A4378F32;
	Fri,  4 Jul 2025 01:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S5MM96BU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601AE72610
	for <linux-media@vger.kernel.org>; Fri,  4 Jul 2025 01:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751590978; cv=none; b=TCSiN83CEGU88MSyP9hduuGEE+J9DPPqXdT1IQJGrYFtlrU07e+B+Gu5IpTN/mORJUpsSfIWZMrkLyZkuJ8KE7vqPpYS7PozV3Opw830u73iPJknpwI1BbhsgHxytOxg3LFrsoEdaK1muCs9X4BGJTZyl5vXUS6J3oajhOLO0jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751590978; c=relaxed/simple;
	bh=IGPuW+93VdWmLQukhynWciPnNyLDJpvkMu+tOTp927U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g9wrHXIQU5+P3DTsdVFPPhO7DSNfedovTzzsd09xnSf4YXj3oAJqRakUjWGAeVhcxiCeDtMakfk9ny5GJlo4e86Wx1zsfUAeDaoHX8yEIN0rPxscqnFtJXwe1cUjr3y2ziGknBbIgq+pAEUH90tksJBF3W9s3jWE4Q4MHKf/pkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=S5MM96BU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2601:602:8100:c320::3926])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D7E2524;
	Fri,  4 Jul 2025 03:02:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751590950;
	bh=IGPuW+93VdWmLQukhynWciPnNyLDJpvkMu+tOTp927U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S5MM96BU8MgT3mMthWMdV3LFKDAGVshLj7+uX6Kno3b++jOyQf3f7K/r6WKjOVuOx
	 fpjv2CgIxKhnIrW7PEjq80YqBlmv2tFxz8Ci5GhIPN8+HsEkbSL7PpZtJX1jxNLWNx
	 WbcLLxTt9yxXBig6Aafn2y0uzV/IfHh+pXGcHf/M=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 03 Jul 2025 18:02:09 -0700
Subject: [PATCH RFC 2/3] media: ti: j721e-csi2rx: Use video_device_state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-vdev-state-v1-2-d647a5e4986d@ideasonboard.com>
References: <20250703-vdev-state-v1-0-d647a5e4986d@ideasonboard.com>
In-Reply-To: <20250703-vdev-state-v1-0-d647a5e4986d@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Heiko Stuebner <heiko@sntech.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6320;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=IGPuW+93VdWmLQukhynWciPnNyLDJpvkMu+tOTp927U=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBoZygvOAdHusCZY0HyFRKv9t1Og/WeDhmsE71mw
 oBWHDJ9hzmJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaGcoLwAKCRBD3pH5JJpx
 RX6yD/9UtKNwabY3DpcGL12ObmqYiZnGLIRyeQpbR9wN/7ZBUSi1003AyLUkFVctkI0DoVzCkH3
 qFFhqoO2s290wIuzdl+vBwjgdH+nA5gAypmtsj3oNCUA6cLXXNShki4WZfy/XBS1AerByP5t+DO
 KqffmDzrJ6HFd5EdemMs+UnH/aj8l9JZc4x4tCCNYkPLOv6+NLKwhi3Bg7+UvSv7eHZgLbGomFv
 HWFzYalPKn0ogiu+dQKttzrGyugjU/rYCi9aoUz0VJSq8iylp6c7zxC2U9wbOXOeVc7rG/EbMe/
 e/1ewOOdSVwRqHY4Q6RzglGLKL61efMfIAIzqXJkqTEGC2WBnzPh/LtjB97lTa9l1ywu5Pd+PGf
 btGrbEInFziQ7InASL6CrLghco7XygZVdJ0va6+MEq2Bw7/utDpIPT3OvpEnzkT20Ml4vyUGfY+
 FIArXn19HukrQi0kA4A6jet+dbET2M7PcGOhq8Q2YFgpqO3VToztP2/S8Msi+xuwMBcD6rf6wCX
 dK+p3iFk+Oy5c9pBaNzFkpuVjy38B6iqBEk9VCu/H0FGsDYB2u9UncY6ZqxVOJNkTIxhMie1McS
 q0KiHAhaBoIDR2s41WZUCVBecau3siOCY4yZ641DeY5wIl26nOtdGP7zQ1mDn1cv3levN/tGJW6
 l5+wMnV8q9VSkWw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Use the newly introduced video_device_state to store the active v4l2
format for the video device.

With this change, we can use a single function for the .s_fmt and
.try_fmt hooks, and the framework helper for the .g_fmt hook.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 57 +++++++---------------
 1 file changed, 17 insertions(+), 40 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 6412a00be8eab89548950dd21b3b3ec02dafa5b4..5aed3c005c8788f77690104c1c1d63509fd59e09 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 
 #include <media/mipi-csi2.h>
+#include <media/v4l2-dev.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mc.h>
@@ -104,7 +105,6 @@ struct ti_csi2rx_dev {
 	struct v4l2_subdev		*source;
 	struct vb2_queue		vidq;
 	struct mutex			mutex; /* To serialize ioctls. */
-	struct v4l2_format		v_fmt;
 	struct ti_csi2rx_dma		dma;
 	u32				sequence;
 };
@@ -299,19 +299,10 @@ static int ti_csi2rx_enum_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int ti_csi2rx_g_fmt_vid_cap(struct file *file, void *prov,
-				   struct v4l2_format *f)
-{
-	struct ti_csi2rx_dev *csi = video_drvdata(file);
-
-	*f = csi->v_fmt;
-
-	return 0;
-}
-
-static int ti_csi2rx_try_fmt_vid_cap(struct file *file, void *priv,
+static int ti_csi2rx_adj_fmt_vid_cap(struct file *file, void *priv,
 				     struct v4l2_format *f)
 {
+	struct video_device_state *state = priv;
 	const struct ti_csi2rx_fmt *fmt;
 
 	/*
@@ -327,24 +318,7 @@ static int ti_csi2rx_try_fmt_vid_cap(struct file *file, void *priv,
 
 	ti_csi2rx_fill_fmt(fmt, f);
 
-	return 0;
-}
-
-static int ti_csi2rx_s_fmt_vid_cap(struct file *file, void *priv,
-				   struct v4l2_format *f)
-{
-	struct ti_csi2rx_dev *csi = video_drvdata(file);
-	struct vb2_queue *q = &csi->vidq;
-	int ret;
-
-	if (vb2_is_busy(q))
-		return -EBUSY;
-
-	ret = ti_csi2rx_try_fmt_vid_cap(file, priv, f);
-	if (ret < 0)
-		return ret;
-
-	csi->v_fmt = *f;
+	state->vid_fmt = *f;
 
 	return 0;
 }
@@ -380,9 +354,9 @@ static int ti_csi2rx_enum_framesizes(struct file *file, void *fh,
 static const struct v4l2_ioctl_ops csi_ioctl_ops = {
 	.vidioc_querycap      = ti_csi2rx_querycap,
 	.vidioc_enum_fmt_vid_cap = ti_csi2rx_enum_fmt_vid_cap,
-	.vidioc_try_fmt_vid_cap = ti_csi2rx_try_fmt_vid_cap,
-	.vidioc_g_fmt_vid_cap = ti_csi2rx_g_fmt_vid_cap,
-	.vidioc_s_fmt_vid_cap = ti_csi2rx_s_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap = ti_csi2rx_adj_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap = video_device_g_fmt_vid,
+	.vidioc_s_fmt_vid_cap = ti_csi2rx_adj_fmt_vid_cap,
 	.vidioc_enum_framesizes = ti_csi2rx_enum_framesizes,
 	.vidioc_reqbufs       = vb2_ioctl_reqbufs,
 	.vidioc_create_bufs   = vb2_ioctl_create_bufs,
@@ -488,7 +462,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_dev *csi)
 	const struct ti_csi2rx_fmt *fmt;
 	unsigned int reg;
 
-	fmt = find_format_by_fourcc(csi->v_fmt.fmt.pix.pixelformat);
+	fmt = find_format_by_fourcc(csi->vdev.state.vid_fmt.fmt.pix.pixelformat);
 
 	/* De-assert the pixel interface reset. */
 	reg = SHIM_CNTL_PIX_RST;
@@ -636,7 +610,7 @@ static int ti_csi2rx_start_dma(struct ti_csi2rx_dev *csi,
 {
 	unsigned long addr;
 	struct dma_async_tx_descriptor *desc;
-	size_t len = csi->v_fmt.fmt.pix.sizeimage;
+	size_t len = csi->vdev.state.vid_fmt.fmt.pix.sizeimage;
 	dma_cookie_t cookie;
 	int ret = 0;
 
@@ -714,7 +688,7 @@ static int ti_csi2rx_queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
 				 struct device *alloc_devs[])
 {
 	struct ti_csi2rx_dev *csi = vb2_get_drv_priv(q);
-	unsigned int size = csi->v_fmt.fmt.pix.sizeimage;
+	unsigned int size = csi->vdev.state.vid_fmt.fmt.pix.sizeimage;
 
 	if (*nplanes) {
 		if (sizes[0] < size)
@@ -731,7 +705,7 @@ static int ti_csi2rx_queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
 static int ti_csi2rx_buffer_prepare(struct vb2_buffer *vb)
 {
 	struct ti_csi2rx_dev *csi = vb2_get_drv_priv(vb->vb2_queue);
-	unsigned long size = csi->v_fmt.fmt.pix.sizeimage;
+	unsigned long size = csi->vdev.state.vid_fmt.fmt.pix.sizeimage;
 
 	if (vb2_plane_size(vb, 0) < size) {
 		dev_err(csi->dev, "Data will not fit into plane\n");
@@ -910,7 +884,7 @@ static int ti_csi2rx_link_validate(struct media_link *link)
 	struct media_entity *entity = link->sink->entity;
 	struct video_device *vdev = media_entity_to_video_device(entity);
 	struct ti_csi2rx_dev *csi = container_of(vdev, struct ti_csi2rx_dev, vdev);
-	struct v4l2_pix_format *csi_fmt = &csi->v_fmt.fmt.pix;
+	struct v4l2_pix_format *csi_fmt = &vdev->state.vid_fmt.fmt.pix;
 	struct v4l2_subdev_format source_fmt = {
 		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
 		.pad	= link->source->index,
@@ -1001,13 +975,15 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 	struct media_device *mdev = &csi->mdev;
 	struct video_device *vdev = &csi->vdev;
 	const struct ti_csi2rx_fmt *fmt;
-	struct v4l2_pix_format *pix_fmt = &csi->v_fmt.fmt.pix;
+	struct v4l2_pix_format *pix_fmt;
 	int ret;
 
 	fmt = find_format_by_fourcc(V4L2_PIX_FMT_UYVY);
 	if (!fmt)
 		return -EINVAL;
 
+	vdev->state.vid_fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	pix_fmt = &vdev->state.vid_fmt.fmt.pix;
 	pix_fmt->width = 640;
 	pix_fmt->height = 480;
 	pix_fmt->field = V4L2_FIELD_NONE;
@@ -1016,7 +992,7 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 	pix_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
 	pix_fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
 
-	ti_csi2rx_fill_fmt(fmt, &csi->v_fmt);
+	ti_csi2rx_fill_fmt(fmt, &vdev->state.vid_fmt);
 
 	mdev->dev = csi->dev;
 	mdev->hw_revision = 1;
@@ -1033,6 +1009,7 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
 			    V4L2_CAP_IO_MC;
 	vdev->lock = &csi->mutex;
+	set_bit(V4L2_FL_USES_STATE, &vdev->flags);
 	video_set_drvdata(vdev, csi);
 
 	csi->pad.flags = MEDIA_PAD_FL_SINK;

-- 
2.49.0


