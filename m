Return-Path: <linux-media+bounces-42760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFF6B88B64
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 11:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A603C1BC8003
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 10:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136FC2FAC17;
	Fri, 19 Sep 2025 09:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KRRekGJa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6722FB616;
	Fri, 19 Sep 2025 09:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758275883; cv=none; b=Kh5oe0wmw4r1Tg7ttQUy3BJrevuEMktSs0i8i8N9IpqkLSd32MdDR9IrrNDyExhdsep+SWJuDhjuOdsEOiItdA/Yh2Xgv9mvGXyfbEKyi9bqCvgXcaMV39F3CwrU2N5L1Wode0YnRquwgr0cTaGUgZGIiTKZgDt1JZT57w0KLQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758275883; c=relaxed/simple;
	bh=tjf6dvEjoK7+zf/xaHgIHnkhI9DeWptIzUTAWkRt7Js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V6JFbewEmYfctfudz59x50966NonVuMjyzxeL3QobYycbCVJBZlGL5gge9/kV/ZL7yYgdtKy02YD3OxmKg/vyVlHsaQDP1IUGO9j9vaAKc35iSssxyoRvJv1zrn4nGZQMoa6yXHF6qMa3D7ximngYPk1wS81vXg6dUMGGhFDhAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KRRekGJa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:4816:952:3054:81b6:1a3a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7DFC3819;
	Fri, 19 Sep 2025 11:56:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758275800;
	bh=tjf6dvEjoK7+zf/xaHgIHnkhI9DeWptIzUTAWkRt7Js=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KRRekGJa4k9DMQrl4b304TD1YmxTii5tuyEEDP1mo71neQ5VvEAwEXvOaRVg82ro4
	 MpgLfeAg5nYPaKJyLgjVS0g/p0gbu6fYC75ijkULzPBXZXvmCrkv5W8imNjrx3thZr
	 XDiw9/trLAOQ83kKM9SHPTNyGlj2XMwemI/8KATA=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 19 Sep 2025 15:26:02 +0530
Subject: [PATCH v2 10/10] media: rkisp1: Calculate format information on
 demand
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-vdev-state-v2-10-b2c42426965c@ideasonboard.com>
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

Instead of storing format configuration and information as explicit
state in the driver structure, calculate it on demand when needed using
the format stored in the active video device state.

This change removes the pix member from rkisp1_capture structure and
refactors the code to look up format configuration and v4l2_format_info
at the point of use.

Additionally, grey format handling is moved from the next buffer setup
path (which may be called in interrupt context) to the buffer
initialization phase for simplicity.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Cc: Dafna Hirschfeld <dafna@fastmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 .../platform/rockchip/rkisp1/rkisp1-capture.c      | 170 ++++++++++-----------
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |   6 -
 2 files changed, 84 insertions(+), 92 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 81bf4ed8bccdb0873c910fa49b22ef72eab295eb..2399fecc94dc4bf3a82fd1ae7fe8c746d015cdd8 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -63,9 +63,12 @@ struct rkisp1_capture_fmt_cfg {
 };
 
 struct rkisp1_capture_ops {
-	void (*config)(struct rkisp1_capture *cap);
+	void (*config)(struct rkisp1_capture *cap,
+		       const struct rkisp1_capture_fmt_cfg *cfg,
+		       const struct v4l2_format_info *info);
 	void (*stop)(struct rkisp1_capture *cap);
-	void (*enable)(struct rkisp1_capture *cap);
+	void (*enable)(struct rkisp1_capture *cap,
+		       const struct v4l2_format_info *info);
 	void (*disable)(struct rkisp1_capture *cap);
 	void (*set_data_path)(struct rkisp1_capture *cap);
 	bool (*is_stopped)(struct rkisp1_capture *cap);
@@ -480,12 +483,30 @@ static void rkisp1_irq_frame_end_enable(struct rkisp1_capture *cap)
 	rkisp1_write(cap->rkisp1, RKISP1_CIF_MI_IMSC, mi_imsc);
 }
 
-static void rkisp1_mp_config(struct rkisp1_capture *cap)
+static const struct rkisp1_capture_fmt_cfg *
+rkisp1_find_fmt_cfg(const struct rkisp1_capture *cap, const u32 pixelfmt)
+{
+	bool yc_swap_support = rkisp1_has_feature(cap->rkisp1, MAIN_STRIDE);
+	unsigned int i;
+
+	for (i = 0; i < cap->config->fmt_size; i++) {
+		const struct rkisp1_capture_fmt_cfg *fmt = &cap->config->fmts[i];
+
+		if (fmt->fourcc == pixelfmt &&
+		    (!fmt->yc_swap || yc_swap_support))
+			return &cap->config->fmts[i];
+	}
+	return NULL;
+}
+
+static void rkisp1_mp_config(struct rkisp1_capture *cap,
+			     const struct rkisp1_capture_fmt_cfg *cfg,
+			     const struct v4l2_format_info *info)
 {
 	const struct v4l2_format *format =
 		video_device_state_get_fmt(cap->vnode.vdev.state);
 	const struct v4l2_pix_format_mplane *pixm = &format->fmt.pix_mp;
-	u32 stride = pixm->plane_fmt[0].bytesperline / cap->pix.info->bpp[0];
+	u32 stride = pixm->plane_fmt[0].bytesperline / info->bpp[0];
 	struct rkisp1_device *rkisp1 = cap->rkisp1;
 	u32 reg;
 
@@ -507,9 +528,9 @@ static void rkisp1_mp_config(struct rkisp1_capture *cap)
 	rkisp1_irq_frame_end_enable(cap);
 
 	/* set uv swapping for semiplanar formats */
-	if (cap->pix.info->comp_planes == 2) {
+	if (info->comp_planes == 2) {
 		reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
-		if (cap->pix.cfg->uv_swap)
+		if (cfg->uv_swap)
 			reg |= RKISP1_CIF_MI_XTD_FMT_CTRL_MP_CB_CR_SWAP;
 		else
 			reg &= ~RKISP1_CIF_MI_XTD_FMT_CTRL_MP_CB_CR_SWAP;
@@ -523,7 +544,7 @@ static void rkisp1_mp_config(struct rkisp1_capture *cap)
 	 */
 	if (rkisp1_has_feature(rkisp1, MAIN_STRIDE)) {
 		reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_OUTPUT_ALIGN_FORMAT);
-		if (cap->pix.cfg->yc_swap || cap->pix.cfg->byte_swap)
+		if (cfg->yc_swap || cfg->byte_swap)
 			reg |= RKISP1_CIF_OUTPUT_ALIGN_FORMAT_MP_BYTE_SWAP_BYTES;
 		else
 			reg &= ~RKISP1_CIF_OUTPUT_ALIGN_FORMAT_MP_BYTE_SWAP_BYTES;
@@ -531,15 +552,14 @@ static void rkisp1_mp_config(struct rkisp1_capture *cap)
 		reg |= RKISP1_CIF_OUTPUT_ALIGN_FORMAT_MP_LSB_ALIGNMENT;
 		rkisp1_write(rkisp1, RKISP1_CIF_MI_OUTPUT_ALIGN_FORMAT, reg);
 
-		rkisp1_write(rkisp1, RKISP1_CIF_MI_INIT,
-			     cap->pix.cfg->output_format);
+		rkisp1_write(rkisp1, RKISP1_CIF_MI_INIT, cfg->output_format);
 	}
 
 	rkisp1_mi_config_ctrl(cap);
 
 	reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_CTRL);
 	reg &= ~RKISP1_MI_CTRL_MP_FMT_MASK;
-	reg |= cap->pix.cfg->write_format;
+	reg |= cfg->write_format;
 	rkisp1_write(rkisp1, RKISP1_CIF_MI_CTRL, reg);
 
 	reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_CTRL);
@@ -547,12 +567,14 @@ static void rkisp1_mp_config(struct rkisp1_capture *cap)
 	rkisp1_write(rkisp1, RKISP1_CIF_MI_CTRL, reg);
 }
 
-static void rkisp1_sp_config(struct rkisp1_capture *cap)
+static void rkisp1_sp_config(struct rkisp1_capture *cap,
+			     const struct rkisp1_capture_fmt_cfg *cfg,
+			     const struct v4l2_format_info *info)
 {
 	const struct v4l2_format *format =
 		video_device_state_get_fmt(cap->vnode.vdev.state);
 	const struct v4l2_pix_format_mplane *pixm = &format->fmt.pix_mp;
-	u32 stride = pixm->plane_fmt[0].bytesperline / cap->pix.info->bpp[0];
+	u32 stride = pixm->plane_fmt[0].bytesperline / info->bpp[0];
 	struct rkisp1_device *rkisp1 = cap->rkisp1;
 	u32 mi_ctrl, reg;
 
@@ -572,9 +594,9 @@ static void rkisp1_sp_config(struct rkisp1_capture *cap)
 	rkisp1_irq_frame_end_enable(cap);
 
 	/* set uv swapping for semiplanar formats */
-	if (cap->pix.info->comp_planes == 2) {
+	if (info->comp_planes == 2) {
 		reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
-		if (cap->pix.cfg->uv_swap)
+		if (cfg->uv_swap)
 			reg |= RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP;
 		else
 			reg &= ~RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP;
@@ -588,7 +610,7 @@ static void rkisp1_sp_config(struct rkisp1_capture *cap)
 	 */
 	if (rkisp1_has_feature(rkisp1, MAIN_STRIDE)) {
 		reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_OUTPUT_ALIGN_FORMAT);
-		if (cap->pix.cfg->yc_swap)
+		if (cfg->yc_swap)
 			reg |= RKISP1_CIF_OUTPUT_ALIGN_FORMAT_SP_BYTE_SWAP_BYTES;
 		else
 			reg &= ~RKISP1_CIF_OUTPUT_ALIGN_FORMAT_SP_BYTE_SWAP_BYTES;
@@ -599,10 +621,8 @@ static void rkisp1_sp_config(struct rkisp1_capture *cap)
 
 	mi_ctrl = rkisp1_read(rkisp1, RKISP1_CIF_MI_CTRL);
 	mi_ctrl &= ~RKISP1_MI_CTRL_SP_FMT_MASK;
-	mi_ctrl |= cap->pix.cfg->write_format |
-		   RKISP1_MI_CTRL_SP_INPUT_YUV422 |
-		   cap->pix.cfg->output_format |
-		   RKISP1_CIF_MI_SP_AUTOUPDATE_ENABLE;
+	mi_ctrl |= cfg->write_format | RKISP1_MI_CTRL_SP_INPUT_YUV422 |
+		   cfg->output_format | RKISP1_CIF_MI_SP_AUTOUPDATE_ENABLE;
 	rkisp1_write(rkisp1, RKISP1_CIF_MI_CTRL, mi_ctrl);
 }
 
@@ -623,14 +643,15 @@ static void rkisp1_sp_disable(struct rkisp1_capture *cap)
 	rkisp1_write(cap->rkisp1, RKISP1_CIF_MI_CTRL, mi_ctrl);
 }
 
-static void rkisp1_mp_enable(struct rkisp1_capture *cap)
+static void rkisp1_mp_enable(struct rkisp1_capture *cap,
+			     const struct v4l2_format_info *info)
 {
 	u32 mi_ctrl;
 
 	rkisp1_mp_disable(cap);
 
 	mi_ctrl = rkisp1_read(cap->rkisp1, RKISP1_CIF_MI_CTRL);
-	if (v4l2_is_format_bayer(cap->pix.info))
+	if (v4l2_is_format_bayer(info))
 		mi_ctrl |= RKISP1_CIF_MI_CTRL_RAW_ENABLE;
 	/* YUV */
 	else
@@ -639,7 +660,8 @@ static void rkisp1_mp_enable(struct rkisp1_capture *cap)
 	rkisp1_write(cap->rkisp1, RKISP1_CIF_MI_CTRL, mi_ctrl);
 }
 
-static void rkisp1_sp_enable(struct rkisp1_capture *cap)
+static void rkisp1_sp_enable(struct rkisp1_capture *cap,
+			     const struct v4l2_format_info *info)
 {
 	u32 mi_ctrl = rkisp1_read(cap->rkisp1, RKISP1_CIF_MI_CTRL);
 
@@ -755,26 +777,12 @@ static void rkisp1_set_next_buf(struct rkisp1_capture *cap)
 
 		rkisp1_write(cap->rkisp1, cap->config->mi.y_base_ad_init,
 			     buff_addr[RKISP1_PLANE_Y] >> shift);
-		/*
-		 * In order to support grey format we capture
-		 * YUV422 planar format from the camera and
-		 * set the U and V planes to the dummy buffer
-		 */
-		if (cap->pix.cfg->fourcc == V4L2_PIX_FMT_GREY) {
-			rkisp1_write(cap->rkisp1,
-				     cap->config->mi.cb_base_ad_init,
-				     cap->buf.dummy.dma_addr >> shift);
-			rkisp1_write(cap->rkisp1,
-				     cap->config->mi.cr_base_ad_init,
-				     cap->buf.dummy.dma_addr >> shift);
-		} else {
-			rkisp1_write(cap->rkisp1,
-				     cap->config->mi.cb_base_ad_init,
-				     buff_addr[RKISP1_PLANE_CB] >> shift);
-			rkisp1_write(cap->rkisp1,
-				     cap->config->mi.cr_base_ad_init,
-				     buff_addr[RKISP1_PLANE_CR] >> shift);
-		}
+		rkisp1_write(cap->rkisp1,
+			     cap->config->mi.cb_base_ad_init,
+			     buff_addr[RKISP1_PLANE_CB] >> shift);
+		rkisp1_write(cap->rkisp1,
+			     cap->config->mi.cr_base_ad_init,
+			     buff_addr[RKISP1_PLANE_CR] >> shift);
 	} else {
 		/*
 		 * Use the dummy space allocated by dma_alloc_coherent to
@@ -907,6 +915,10 @@ static int rkisp1_vb2_buf_init(struct vb2_buffer *vb)
 	const struct v4l2_format *format =
 		video_device_state_get_fmt(cap->vnode.vdev.state);
 	const struct v4l2_pix_format_mplane *pixm = &format->fmt.pix_mp;
+	const struct rkisp1_capture_fmt_cfg *cfg =
+		rkisp1_find_fmt_cfg(cap, pixm->pixelformat);
+	const struct v4l2_format_info *info =
+		v4l2_format_info(pixm->pixelformat);
 	unsigned int i;
 
 	memset(ispbuf->buff_addr, 0, sizeof(ispbuf->buff_addr));
@@ -927,9 +939,19 @@ static int rkisp1_vb2_buf_init(struct vb2_buffer *vb)
 	 * uv swap can be supported for planar formats by switching
 	 * the address of cb and cr
 	 */
-	if (cap->pix.info->comp_planes == 3 && cap->pix.cfg->uv_swap)
+	if (info->comp_planes == 3 && cfg->uv_swap)
 		swap(ispbuf->buff_addr[RKISP1_PLANE_CR],
 		     ispbuf->buff_addr[RKISP1_PLANE_CB]);
+
+	/*
+	 * grey format can be supported by using dummy buffer for
+	 * the cb and cr planes
+	 */
+	if (cfg->fourcc == V4L2_PIX_FMT_GREY) {
+		ispbuf->buff_addr[RKISP1_PLANE_CB] = cap->buf.dummy.dma_addr;
+		ispbuf->buff_addr[RKISP1_PLANE_CR] = cap->buf.dummy.dma_addr;
+	}
+
 	return 0;
 }
 
@@ -1001,15 +1023,22 @@ static void rkisp1_cap_stream_enable(struct rkisp1_capture *cap)
 {
 	struct rkisp1_device *rkisp1 = cap->rkisp1;
 	struct rkisp1_capture *other = &rkisp1->capture_devs[cap->id ^ 1];
+	const struct v4l2_format *format =
+		video_device_state_get_fmt(cap->vnode.vdev.state);
+	const struct v4l2_pix_format_mplane *pixm = &format->fmt.pix_mp;
+	const struct rkisp1_capture_fmt_cfg *cfg =
+		rkisp1_find_fmt_cfg(cap, pixm->pixelformat);
+	const struct v4l2_format_info *info =
+		v4l2_format_info(pixm->pixelformat);
 	bool has_self_path = rkisp1_has_feature(rkisp1, SELF_PATH);
 
 	cap->ops->set_data_path(cap);
-	cap->ops->config(cap);
+	cap->ops->config(cap, cfg, info);
 
 	/* Setup a buffer for the next frame */
 	spin_lock_irq(&cap->buf.lock);
 	rkisp1_set_next_buf(cap);
-	cap->ops->enable(cap);
+	cap->ops->enable(cap, info);
 
 	/*
 	 * It's safe to configure ACTIVE and SHADOW registers for the first
@@ -1224,9 +1253,8 @@ static const struct vb2_ops rkisp1_vb2_ops = {
  * IOCTLs operations
  */
 
-static const struct v4l2_format_info *
-rkisp1_fill_pixfmt(const struct rkisp1_capture *cap,
-		   struct v4l2_pix_format_mplane *pixm)
+static void rkisp1_fill_pixfmt(const struct rkisp1_capture *cap,
+			       struct v4l2_pix_format_mplane *pixm)
 {
 	struct v4l2_plane_pix_format *plane_y = &pixm->plane_fmt[0];
 	const struct v4l2_format_info *info;
@@ -1273,34 +1301,13 @@ rkisp1_fill_pixfmt(const struct rkisp1_capture *cap,
 	if (info->mem_planes == 1)
 		for (i = 1; i < info->comp_planes; i++)
 			plane_y->sizeimage += pixm->plane_fmt[i].sizeimage;
-
-	return info;
-}
-
-static const struct rkisp1_capture_fmt_cfg *
-rkisp1_find_fmt_cfg(const struct rkisp1_capture *cap, const u32 pixelfmt)
-{
-	bool yc_swap_support = rkisp1_has_feature(cap->rkisp1, MAIN_STRIDE);
-	unsigned int i;
-
-	for (i = 0; i < cap->config->fmt_size; i++) {
-		const struct rkisp1_capture_fmt_cfg *fmt = &cap->config->fmts[i];
-
-		if (fmt->fourcc == pixelfmt &&
-		    (!fmt->yc_swap || yc_swap_support))
-			return &cap->config->fmts[i];
-	}
-	return NULL;
 }
 
 static void rkisp1_adj_fmt(const struct rkisp1_capture *cap,
-			   struct v4l2_pix_format_mplane *pixm,
-			   const struct rkisp1_capture_fmt_cfg **fmt_cfg,
-			   const struct v4l2_format_info **fmt_info)
+			   struct v4l2_pix_format_mplane *pixm)
 {
 	const struct rkisp1_capture_config *config = cap->config;
 	const struct rkisp1_capture_fmt_cfg *fmt;
-	const struct v4l2_format_info *info;
 	static const unsigned int max_widths[] = {
 		RKISP1_RSZ_MP_SRC_MAX_WIDTH, RKISP1_RSZ_SP_SRC_MAX_WIDTH
 	};
@@ -1324,12 +1331,7 @@ static void rkisp1_adj_fmt(const struct rkisp1_capture *cap,
 	pixm->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
 	pixm->quantization = V4L2_QUANTIZATION_DEFAULT;
 
-	info = rkisp1_fill_pixfmt(cap, pixm);
-
-	if (fmt_cfg)
-		*fmt_cfg = fmt;
-	if (fmt_info)
-		*fmt_info = info;
+	rkisp1_fill_pixfmt(cap, pixm);
 }
 
 static int rkisp1_adj_fmt_vid_cap_mplane(struct file *file,
@@ -1338,17 +1340,13 @@ static int rkisp1_adj_fmt_vid_cap_mplane(struct file *file,
 {
 	struct rkisp1_capture *cap = video_drvdata(file);
 
-	if (state->which == VIDEO_DEVICE_STATE_ACTIVE) {
-		if (vb2_is_busy(cap->vnode.vdev.queue))
-			return -EBUSY;
-
-		rkisp1_adj_fmt(cap, &f->fmt.pix_mp, &cap->pix.cfg,
-			       &cap->pix.info);
-	} else {
-		rkisp1_adj_fmt(cap, &f->fmt.pix_mp, NULL, NULL);
-	}
+	if (state->which == VIDEO_DEVICE_STATE_ACTIVE &&
+	    vb2_is_busy(cap->vnode.vdev.queue))
+		return -EBUSY;
 
+	rkisp1_adj_fmt(cap, &f->fmt.pix_mp);
 	state->fmt = *f;
+
 	return 0;
 }
 
@@ -1458,7 +1456,7 @@ static int rkisp1_vdev_init_state(struct video_device_state *state)
 	pixm->width = RKISP1_DEFAULT_WIDTH;
 	pixm->height = RKISP1_DEFAULT_HEIGHT;
 
-	rkisp1_adj_fmt(cap, pixm, &cap->pix.cfg, &cap->pix.info);
+	rkisp1_adj_fmt(cap, pixm);
 
 	return 0;
 }
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 5731c4b368f8832c2b0748338cd0da2d0edf0a93..daea11c55c9937d08f06efa2fddb307a8b5d767a 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -316,8 +316,6 @@ struct rkisp1_device;
  * rkisp1 uses shadow registers, so it needs two buffers at a time
  * @buf.curr:	  the buffer used for current frame
  * @buf.next:	  the buffer used for next frame
- * @pix.cfg:	  pixel configuration
- * @pix.info:	  a pointer to the v4l2_format_info of the pixel format
  */
 struct rkisp1_capture {
 	struct rkisp1_vdev_node vnode;
@@ -336,10 +334,6 @@ struct rkisp1_capture {
 		struct rkisp1_buffer *curr;
 		struct rkisp1_buffer *next;
 	} buf;
-	struct {
-		const struct rkisp1_capture_fmt_cfg *cfg;
-		const struct v4l2_format_info *info;
-	} pix;
 };
 
 struct rkisp1_stats;

-- 
2.51.0


