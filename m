Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62C9FCE6A5
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 17:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbfJGPIh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 11:08:37 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:37402 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728813AbfJGPHw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 11:07:52 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97F7pCn066253;
        Mon, 7 Oct 2019 10:07:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570460871;
        bh=YAd0kofBBVY/0d1aM/FYbJyhVCitxiU4bFV0/MidiQg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=uCqLJnI/j2s4yHqOuA0cQUKiUfNFUMnlbge4pF3m3iyZsdi+w/5KrHZI401ppMMHe
         zaavpXKXrHDh8/A38Bk0ztQQ6jklJnDcEK/Xem/yp6n0DLM9HF3ObIA0jmzyEKdsmg
         THdp9GOtIBr+PZPb/tsE+dEeLD+G5JR3usyVkOQg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97F7pte060760;
        Mon, 7 Oct 2019 10:07:51 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 10:07:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 10:07:49 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97F7aFM055156;
        Mon, 7 Oct 2019 10:07:51 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 16/21] media: ti-vpe: vpe: use standard struct instead of duplicating fields
Date:   Mon, 7 Oct 2019 10:10:04 -0500
Message-ID: <20191007151009.22095-17-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007151009.22095-1-bparrot@ti.com>
References: <20191007151009.22095-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For each queue we need to maintain resolutions, pixel format,
bytesperline, sizeimage, colorspace, etc.

Instead of manually adding more entries in the vpe_q_data struct, it is
better to just add a "struct v4l2_format" member and use that to store
all needed information.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/vpe.c | 196 ++++++++++++++--------------
 1 file changed, 101 insertions(+), 95 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index d7f8eb901475..295cbcef3a0e 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -319,14 +319,9 @@ static struct vpe_fmt vpe_formats[] = {
  * there is one source queue and one destination queue for each m2m context.
  */
 struct vpe_q_data {
-	unsigned int		width;				/* frame width */
-	unsigned int		height;				/* frame height */
-	unsigned int		nplanes;			/* Current number of planes */
-	unsigned int		bytesperline[VPE_MAX_PLANES];	/* bytes per line in memory */
-	enum v4l2_colorspace	colorspace;
-	enum v4l2_field		field;				/* supported field value */
+	/* current v4l2 format info */
+	struct v4l2_format	format;
 	unsigned int		flags;
-	unsigned int		sizeimage[VPE_MAX_PLANES];	/* image size in memory */
 	struct v4l2_rect	c_rect;				/* crop/compose rectangle */
 	struct vpe_fmt		*fmt;				/* format info */
 };
@@ -761,11 +756,12 @@ static void set_src_registers(struct vpe_ctx *ctx)
 static void set_dst_registers(struct vpe_ctx *ctx)
 {
 	struct vpe_mmr_adb *mmr_adb = ctx->mmr_adb.addr;
-	enum v4l2_colorspace clrspc = ctx->q_data[Q_DATA_DST].colorspace;
+	struct v4l2_pix_format_mplane *pix;
 	struct vpe_fmt *fmt = ctx->q_data[Q_DATA_DST].fmt;
 	u32 val = 0;
 
-	if (clrspc == V4L2_COLORSPACE_SRGB) {
+	pix = &ctx->q_data[Q_DATA_DST].format.fmt.pix_mp;
+	if (pix->colorspace == V4L2_COLORSPACE_SRGB) {
 		val |= VPE_RGB_OUT_SELECT;
 		vpdma_set_bg_color(ctx->dev->vpdma,
 			(struct vpdma_data_format *)fmt->vpdma_fmt[0], 0xff);
@@ -868,11 +864,15 @@ static int set_srcdst_params(struct vpe_ctx *ctx)
 	unsigned int src_h = s_q_data->c_rect.height;
 	unsigned int dst_w = d_q_data->c_rect.width;
 	unsigned int dst_h = d_q_data->c_rect.height;
+	struct v4l2_pix_format_mplane *spix;
+	struct v4l2_pix_format_mplane *dpix;
 	size_t mv_buf_size;
 	int ret;
 
 	ctx->sequence = 0;
 	ctx->field = V4L2_FIELD_TOP;
+	spix = &s_q_data->format.fmt.pix_mp;
+	dpix = &d_q_data->format.fmt.pix_mp;
 
 	if ((s_q_data->flags & Q_IS_INTERLACED) &&
 			!(d_q_data->flags & Q_IS_INTERLACED)) {
@@ -887,9 +887,9 @@ static int set_srcdst_params(struct vpe_ctx *ctx)
 		 * extra space will not be used by the de-interlacer, but will
 		 * ensure that vpdma operates correctly
 		 */
-		bytes_per_line = ALIGN((s_q_data->width * mv->depth) >> 3,
-					VPDMA_STRIDE_ALIGN);
-		mv_buf_size = bytes_per_line * s_q_data->height;
+		bytes_per_line = ALIGN((spix->width * mv->depth) >> 3,
+				       VPDMA_STRIDE_ALIGN);
+		mv_buf_size = bytes_per_line * spix->height;
 
 		ctx->deinterlacing = true;
 		src_h <<= 1;
@@ -909,7 +909,7 @@ static int set_srcdst_params(struct vpe_ctx *ctx)
 	set_dei_regs(ctx);
 
 	csc_set_coeff(ctx->dev->csc, &mmr_adb->csc_regs[0],
-		s_q_data->colorspace, d_q_data->colorspace);
+		      spix->colorspace, dpix->colorspace);
 
 	sc_set_hs_coeffs(ctx->dev->sc, ctx->sc_coeff_h.addr, src_w, dst_w);
 	sc_set_vs_coeffs(ctx->dev->sc, ctx->sc_coeff_v.addr, src_h, dst_h);
@@ -1023,6 +1023,7 @@ static void add_out_dtd(struct vpe_ctx *ctx, int port)
 	struct vpe_fmt *fmt = q_data->fmt;
 	const struct vpdma_data_format *vpdma_fmt;
 	int mv_buf_selector = !ctx->src_mv_buf_selector;
+	struct v4l2_pix_format_mplane *pix;
 	dma_addr_t dma_addr;
 	u32 flags = 0;
 	u32 offset = 0;
@@ -1032,21 +1033,23 @@ static void add_out_dtd(struct vpe_ctx *ctx, int port)
 		vpdma_fmt = &vpdma_misc_fmts[VPDMA_DATA_FMT_MV];
 		dma_addr = ctx->mv_buf_dma[mv_buf_selector];
 		q_data = &ctx->q_data[Q_DATA_SRC];
-		stride = ALIGN((q_data->width * vpdma_fmt->depth) >> 3,
+		pix = &q_data->format.fmt.pix_mp;
+		stride = ALIGN((pix->width * vpdma_fmt->depth) >> 3,
 			       VPDMA_STRIDE_ALIGN);
 	} else {
 		/* to incorporate interleaved formats */
 		int plane = fmt->coplanar ? p_data->vb_part : 0;
 
+		pix = &q_data->format.fmt.pix_mp;
 		vpdma_fmt = fmt->vpdma_fmt[plane];
 		/*
 		 * If we are using a single plane buffer and
 		 * we need to set a separate vpdma chroma channel.
 		 */
-		if (q_data->nplanes == 1 && plane) {
+		if (pix->num_planes == 1 && plane) {
 			dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
 			/* Compute required offset */
-			offset = q_data->bytesperline[0] * q_data->height;
+			offset = pix->plane_fmt[0].bytesperline * pix->height;
 		} else {
 			dma_addr = vb2_dma_contig_plane_dma_addr(vb, plane);
 			/* Use address as is, no offset */
@@ -1060,7 +1063,7 @@ static void add_out_dtd(struct vpe_ctx *ctx, int port)
 		}
 		/* Apply the offset */
 		dma_addr += offset;
-		stride = q_data->bytesperline[VPE_LUMA];
+		stride = pix->plane_fmt[VPE_LUMA].bytesperline;
 	}
 
 	if (q_data->flags & Q_DATA_FRAME_1D)
@@ -1071,7 +1074,7 @@ static void add_out_dtd(struct vpe_ctx *ctx, int port)
 	vpdma_set_max_size(ctx->dev->vpdma, VPDMA_MAX_SIZE1,
 			   MAX_W, MAX_H);
 
-	vpdma_add_out_dtd(&ctx->desc_list, q_data->width,
+	vpdma_add_out_dtd(&ctx->desc_list, pix->width,
 			  stride, &q_data->c_rect,
 			  vpdma_fmt, dma_addr, MAX_OUT_WIDTH_REG1,
 			  MAX_OUT_HEIGHT_REG1, p_data->channel, flags);
@@ -1084,6 +1087,7 @@ static void add_in_dtd(struct vpe_ctx *ctx, int port)
 	struct vb2_buffer *vb = &ctx->src_vbs[p_data->vb_index]->vb2_buf;
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct vpe_fmt *fmt = q_data->fmt;
+	struct v4l2_pix_format_mplane *pix;
 	const struct vpdma_data_format *vpdma_fmt;
 	int mv_buf_selector = ctx->src_mv_buf_selector;
 	int field = vbuf->field == V4L2_FIELD_BOTTOM;
@@ -1093,10 +1097,11 @@ static void add_in_dtd(struct vpe_ctx *ctx, int port)
 	u32 offset = 0;
 	u32 stride;
 
+	pix = &q_data->format.fmt.pix_mp;
 	if (port == VPE_PORT_MV_IN) {
 		vpdma_fmt = &vpdma_misc_fmts[VPDMA_DATA_FMT_MV];
 		dma_addr = ctx->mv_buf_dma[mv_buf_selector];
-		stride = ALIGN((q_data->width * vpdma_fmt->depth) >> 3,
+		stride = ALIGN((pix->width * vpdma_fmt->depth) >> 3,
 			       VPDMA_STRIDE_ALIGN);
 	} else {
 		/* to incorporate interleaved formats */
@@ -1107,10 +1112,10 @@ static void add_in_dtd(struct vpe_ctx *ctx, int port)
 		 * If we are using a single plane buffer and
 		 * we need to set a separate vpdma chroma channel.
 		 */
-		if (q_data->nplanes == 1 && plane) {
+		if (pix->num_planes == 1 && plane) {
 			dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
 			/* Compute required offset */
-			offset = q_data->bytesperline[0] * q_data->height;
+			offset = pix->plane_fmt[0].bytesperline * pix->height;
 		} else {
 			dma_addr = vb2_dma_contig_plane_dma_addr(vb, plane);
 			/* Use address as is, no offset */
@@ -1124,7 +1129,7 @@ static void add_in_dtd(struct vpe_ctx *ctx, int port)
 		}
 		/* Apply the offset */
 		dma_addr += offset;
-		stride = q_data->bytesperline[VPE_LUMA];
+		stride = pix->plane_fmt[VPE_LUMA].bytesperline;
 
 		/*
 		 * field used in VPDMA desc  = 0 (top) / 1 (bottom)
@@ -1144,7 +1149,7 @@ static void add_in_dtd(struct vpe_ctx *ctx, int port)
 			field = (field + p_data->vb_index + ctx->sequence) % 2;
 
 			if (field) {
-				int height = q_data->height / 2;
+				int height = pix->height / 2;
 				int bpp;
 
 				if (fmt->fourcc == V4L2_PIX_FMT_NV12 ||
@@ -1156,7 +1161,7 @@ static void add_in_dtd(struct vpe_ctx *ctx, int port)
 				if (plane)
 					height /= 2;
 
-				dma_addr += q_data->width * height * bpp;
+				dma_addr += pix->width * height * bpp;
 			}
 		}
 	}
@@ -1173,7 +1178,7 @@ static void add_in_dtd(struct vpe_ctx *ctx, int port)
 				fmt->fourcc == V4L2_PIX_FMT_NV21))
 		frame_height /= 2;
 
-	vpdma_add_in_dtd(&ctx->desc_list, q_data->width, stride,
+	vpdma_add_in_dtd(&ctx->desc_list, pix->width, stride,
 			 &q_data->c_rect, vpdma_fmt, dma_addr,
 			 p_data->channel, field, flags, frame_width,
 			 frame_height, 0, 0);
@@ -1210,6 +1215,9 @@ static void device_run(void *priv)
 	struct sc_data *sc = ctx->dev->sc;
 	struct vpe_q_data *d_q_data = &ctx->q_data[Q_DATA_DST];
 	struct vpe_q_data *s_q_data = &ctx->q_data[Q_DATA_SRC];
+	struct v4l2_pix_format_mplane *dpix;
+
+	dpix = &d_q_data->format.fmt.pix_mp;
 
 	if (ctx->deinterlacing && s_q_data->flags & Q_IS_SEQ_XX &&
 	    ctx->sequence % 2 == 0) {
@@ -1282,7 +1290,7 @@ static void device_run(void *priv)
 	if (ctx->deinterlacing)
 		add_out_dtd(ctx, VPE_PORT_MV_OUT);
 
-	if (d_q_data->colorspace == V4L2_COLORSPACE_SRGB) {
+	if (dpix->colorspace == V4L2_COLORSPACE_SRGB) {
 		add_out_dtd(ctx, VPE_PORT_RGB_OUT);
 	} else {
 		add_out_dtd(ctx, VPE_PORT_LUMA_OUT);
@@ -1324,7 +1332,7 @@ static void device_run(void *priv)
 	}
 
 	/* sync on channel control descriptors for output ports */
-	if (d_q_data->colorspace == V4L2_COLORSPACE_SRGB) {
+	if (dpix->colorspace == V4L2_COLORSPACE_SRGB) {
 		vpdma_add_sync_on_channel_ctd(&ctx->desc_list,
 			VPE_CHAN_RGB_OUT);
 	} else {
@@ -1559,7 +1567,6 @@ static int vpe_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	struct vpe_ctx *ctx = file->private_data;
 	struct vb2_queue *vq;
 	struct vpe_q_data *q_data;
-	int i;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
 	if (!vq)
@@ -1569,27 +1576,17 @@ static int vpe_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	if (!q_data)
 		return -EINVAL;
 
-	pix->width = q_data->width;
-	pix->height = q_data->height;
-	pix->pixelformat = q_data->fmt->fourcc;
-	pix->field = q_data->field;
+	*f = q_data->format;
 
-	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
-		pix->colorspace = q_data->colorspace;
-	} else {
+	if (!V4L2_TYPE_IS_OUTPUT(f->type)) {
 		struct vpe_q_data *s_q_data;
+		struct v4l2_pix_format_mplane *spix;
 
 		/* get colorspace from the source queue */
 		s_q_data = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+		spix = &s_q_data->format.fmt.pix_mp;
 
-		pix->colorspace = s_q_data->colorspace;
-	}
-
-	pix->num_planes = q_data->nplanes;
-
-	for (i = 0; i < pix->num_planes; i++) {
-		pix->plane_fmt[i].bytesperline = q_data->bytesperline[i];
-		pix->plane_fmt[i].sizeimage = q_data->sizeimage[i];
+		pix->colorspace = spix->colorspace;
 	}
 
 	return 0;
@@ -1736,10 +1733,9 @@ static int vpe_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 static int __vpe_s_fmt(struct vpe_ctx *ctx, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
-	struct v4l2_plane_pix_format *plane_fmt;
+	struct v4l2_pix_format_mplane *qpix;
 	struct vpe_q_data *q_data;
 	struct vb2_queue *vq;
-	int i;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
 	if (!vq)
@@ -1754,30 +1750,20 @@ static int __vpe_s_fmt(struct vpe_ctx *ctx, struct v4l2_format *f)
 	if (!q_data)
 		return -EINVAL;
 
+	qpix = &q_data->format.fmt.pix_mp;
 	q_data->fmt		= find_format(f);
-	q_data->width		= pix->width;
-	q_data->height		= pix->height;
-	q_data->colorspace	= pix->colorspace;
-	q_data->field		= pix->field;
-	q_data->nplanes		= pix->num_planes;
-
-	for (i = 0; i < pix->num_planes; i++) {
-		plane_fmt = &pix->plane_fmt[i];
-
-		q_data->bytesperline[i]	= plane_fmt->bytesperline;
-		q_data->sizeimage[i]	= plane_fmt->sizeimage;
-	}
+	q_data->format = *f;
 
 	q_data->c_rect.left	= 0;
 	q_data->c_rect.top	= 0;
-	q_data->c_rect.width	= q_data->width;
-	q_data->c_rect.height	= q_data->height;
+	q_data->c_rect.width	= pix->width;
+	q_data->c_rect.height	= pix->height;
 
-	if (q_data->field == V4L2_FIELD_ALTERNATE)
+	if (qpix->field == V4L2_FIELD_ALTERNATE)
 		q_data->flags |= Q_DATA_INTERLACED_ALTERNATE;
-	else if (q_data->field == V4L2_FIELD_SEQ_TB)
+	else if (qpix->field == V4L2_FIELD_SEQ_TB)
 		q_data->flags |= Q_DATA_INTERLACED_SEQ_TB;
-	else if (q_data->field == V4L2_FIELD_SEQ_BT)
+	else if (qpix->field == V4L2_FIELD_SEQ_BT)
 		q_data->flags |= Q_DATA_INTERLACED_SEQ_BT;
 	else
 		q_data->flags &= ~Q_IS_INTERLACED;
@@ -1787,11 +1773,11 @@ static int __vpe_s_fmt(struct vpe_ctx *ctx, struct v4l2_format *f)
 		q_data->c_rect.height /= 2;
 
 	vpe_dbg(ctx->dev, "Setting format for type %d, wxh: %dx%d, fmt: %d bpl_y %d",
-		f->type, q_data->width, q_data->height, q_data->fmt->fourcc,
-		q_data->bytesperline[VPE_LUMA]);
-	if (q_data->nplanes == 2)
+		f->type, pix->width, pix->height, pix->pixelformat,
+		pix->plane_fmt[0].bytesperline);
+	if (pix->num_planes == 2)
 		vpe_dbg(ctx->dev, " bpl_uv %d\n",
-			q_data->bytesperline[VPE_CHROMA]);
+			pix->plane_fmt[1].bytesperline);
 
 	return 0;
 }
@@ -1820,6 +1806,7 @@ static int vpe_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 static int __vpe_try_selection(struct vpe_ctx *ctx, struct v4l2_selection *s)
 {
 	struct vpe_q_data *q_data;
+	struct v4l2_pix_format_mplane *pix;
 	int height;
 
 	if ((s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE) &&
@@ -1830,6 +1817,8 @@ static int __vpe_try_selection(struct vpe_ctx *ctx, struct v4l2_selection *s)
 	if (!q_data)
 		return -EINVAL;
 
+	pix = &q_data->format.fmt.pix_mp;
+
 	switch (s->target) {
 	case V4L2_SEL_TGT_COMPOSE:
 		/*
@@ -1860,23 +1849,23 @@ static int __vpe_try_selection(struct vpe_ctx *ctx, struct v4l2_selection *s)
 	 * the field height, not the buffer height
 	 */
 	if (q_data->flags & Q_IS_SEQ_XX)
-		height = q_data->height / 2;
+		height = pix->height / 2;
 	else
-		height = q_data->height;
+		height = pix->height;
 
 	if (s->r.top < 0 || s->r.left < 0) {
 		vpe_err(ctx->dev, "negative values for top and left\n");
 		s->r.top = s->r.left = 0;
 	}
 
-	v4l_bound_align_image(&s->r.width, MIN_W, q_data->width, 1,
+	v4l_bound_align_image(&s->r.width, MIN_W, pix->width, 1,
 		&s->r.height, MIN_H, height, H_ALIGN, S_ALIGN);
 
 	/* adjust left/top if cropping rectangle is out of bounds */
-	if (s->r.left + s->r.width > q_data->width)
-		s->r.left = q_data->width - s->r.width;
-	if (s->r.top + s->r.height > q_data->height)
-		s->r.top = q_data->height - s->r.height;
+	if (s->r.left + s->r.width > pix->width)
+		s->r.left = pix->width - s->r.width;
+	if (s->r.top + s->r.height > pix->height)
+		s->r.top = pix->height - s->r.height;
 
 	return 0;
 }
@@ -1886,6 +1875,7 @@ static int vpe_g_selection(struct file *file, void *fh,
 {
 	struct vpe_ctx *ctx = file->private_data;
 	struct vpe_q_data *q_data;
+	struct v4l2_pix_format_mplane *pix;
 	bool use_c_rect = false;
 
 	if ((s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE) &&
@@ -1896,6 +1886,8 @@ static int vpe_g_selection(struct file *file, void *fh,
 	if (!q_data)
 		return -EINVAL;
 
+	pix = &q_data->format.fmt.pix_mp;
+
 	switch (s->target) {
 	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
 	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
@@ -1934,8 +1926,8 @@ static int vpe_g_selection(struct file *file, void *fh,
 		 */
 		s->r.left = 0;
 		s->r.top = 0;
-		s->r.width = q_data->width;
-		s->r.height = q_data->height;
+		s->r.width = pix->width;
+		s->r.height = pix->height;
 	}
 
 	return 0;
@@ -2038,19 +2030,21 @@ static int vpe_queue_setup(struct vb2_queue *vq,
 	int i;
 	struct vpe_ctx *ctx = vb2_get_drv_priv(vq);
 	struct vpe_q_data *q_data;
+	struct v4l2_pix_format_mplane *pix;
 
 	q_data = get_q_data(ctx, vq->type);
 	if (!q_data)
 		return -EINVAL;
 
-	*nplanes = q_data->nplanes;
+	pix = &q_data->format.fmt.pix_mp;
+	*nplanes = pix->num_planes;
 
 	for (i = 0; i < *nplanes; i++)
-		sizes[i] = q_data->sizeimage[i];
+		sizes[i] = pix->plane_fmt[i].sizeimage;
 
 	vpe_dbg(ctx->dev, "get %d buffer(s) of size %d", *nbuffers,
 		sizes[VPE_LUMA]);
-	if (q_data->nplanes == 2)
+	if (*nplanes == 2)
 		vpe_dbg(ctx->dev, " and %d\n", sizes[VPE_CHROMA]);
 
 	return 0;
@@ -2061,14 +2055,16 @@ static int vpe_buf_prepare(struct vb2_buffer *vb)
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct vpe_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct vpe_q_data *q_data;
-	int i, num_planes;
+	struct v4l2_pix_format_mplane *pix;
+	int i;
 
 	vpe_dbg(ctx->dev, "type: %d\n", vb->vb2_queue->type);
 
 	q_data = get_q_data(ctx, vb->vb2_queue->type);
 	if (!q_data)
 		return -EINVAL;
-	num_planes = q_data->nplanes;
+
+	pix = &q_data->format.fmt.pix_mp;
 
 	if (vb->vb2_queue->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		if (!(q_data->flags & Q_IS_INTERLACED)) {
@@ -2082,18 +2078,18 @@ static int vpe_buf_prepare(struct vb2_buffer *vb)
 		}
 	}
 
-	for (i = 0; i < num_planes; i++) {
-		if (vb2_plane_size(vb, i) < q_data->sizeimage[i]) {
+	for (i = 0; i < pix->num_planes; i++) {
+		if (vb2_plane_size(vb, i) < pix->plane_fmt[i].sizeimage) {
 			vpe_err(ctx->dev,
 				"data will not fit into plane (%lu < %lu)\n",
 				vb2_plane_size(vb, i),
-				(long) q_data->sizeimage[i]);
+				(long) pix->plane_fmt[i].sizeimage);
 			return -EINVAL;
 		}
 	}
 
-	for (i = 0; i < num_planes; i++)
-		vb2_set_plane_payload(vb, i, q_data->sizeimage[i]);
+	for (i = 0; i < pix->num_planes; i++)
+		vb2_set_plane_payload(vb, i, pix->plane_fmt[i].sizeimage);
 
 	return 0;
 }
@@ -2278,6 +2274,7 @@ static int vpe_open(struct file *file)
 	struct vpe_q_data *s_q_data;
 	struct v4l2_ctrl_handler *hdl;
 	struct vpe_ctx *ctx;
+	struct v4l2_pix_format_mplane *pix;
 	int ret;
 
 	vpe_dbg(dev, "vpe_open\n");
@@ -2326,23 +2323,32 @@ static int vpe_open(struct file *file)
 	v4l2_ctrl_handler_setup(hdl);
 
 	s_q_data = &ctx->q_data[Q_DATA_SRC];
+	pix = &s_q_data->format.fmt.pix_mp;
 	s_q_data->fmt = __find_format(V4L2_PIX_FMT_YUYV);
-	s_q_data->width = 1920;
-	s_q_data->height = 1080;
-	s_q_data->nplanes = 1;
-	s_q_data->bytesperline[VPE_LUMA] = (s_q_data->width *
+	pix->pixelformat = s_q_data->fmt->fourcc;
+	s_q_data->format.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	pix->width = 1920;
+	pix->height = 1080;
+	pix->num_planes = 1;
+	pix->plane_fmt[VPE_LUMA].bytesperline = (pix->width *
 			s_q_data->fmt->vpdma_fmt[VPE_LUMA]->depth) >> 3;
-	s_q_data->sizeimage[VPE_LUMA] = (s_q_data->bytesperline[VPE_LUMA] *
-			s_q_data->height);
-	s_q_data->colorspace = V4L2_COLORSPACE_REC709;
-	s_q_data->field = V4L2_FIELD_NONE;
+	pix->plane_fmt[VPE_LUMA].sizeimage =
+			pix->plane_fmt[VPE_LUMA].bytesperline *
+			pix->height;
+	pix->colorspace = V4L2_COLORSPACE_REC709;
+	pix->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	pix->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	pix->quantization = V4L2_QUANTIZATION_DEFAULT;
+	pix->field = V4L2_FIELD_NONE;
 	s_q_data->c_rect.left = 0;
 	s_q_data->c_rect.top = 0;
-	s_q_data->c_rect.width = s_q_data->width;
-	s_q_data->c_rect.height = s_q_data->height;
+	s_q_data->c_rect.width = pix->width;
+	s_q_data->c_rect.height = pix->height;
 	s_q_data->flags = 0;
 
 	ctx->q_data[Q_DATA_DST] = *s_q_data;
+	ctx->q_data[Q_DATA_DST].format.type =
+			V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 
 	set_dei_shadow_registers(ctx);
 	set_src_registers(ctx);
-- 
2.17.1

