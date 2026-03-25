Return-Path: <linux-media+bounces-57065-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMWJDmb6w2klvQQAu9opvQ
	(envelope-from <linux-media+bounces-57065-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 16:08:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EE53278BD
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 16:08:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C52C321DBBC
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 14:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84D840245D;
	Wed, 25 Mar 2026 14:51:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C353FCB27
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 14:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774450273; cv=none; b=iKIgjz/S9HF16caJ8/GzihE3u8x1JsmOycBsaHjXN0yK9+1Y1QmKPzQT7fQv2Nd0KupsX8KL04h0nHc70w+4/iAxqhF10k4RH4bNSrjmY6AXQLoWDlpf1ib9TGE/1XUuUnTFLER6daZE7T8YwiWMQz8jy6hhYsgaNZl/xWYkArw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774450273; c=relaxed/simple;
	bh=Z1dluJaQnCSfLUqEThZ+0b/dhGaScVsCm3XU4Mza840=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FBpOyCs6s+OPrVQSm2bf4PFyjvDuHsSUQCLFUJS/v+G6G/h4OUzcniE1rvbafLaKjTEhkSqHDGOB9FdCtBgGT6A1IX/hORe/aPTY25FM/WwtL28BWjbWK9C11x2oYUGT+nUWzg2inZgcCLO523YFvgeDzN1buW19VQinTenMmn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1w5PZV-00050C-G1; Wed, 25 Mar 2026 15:51:01 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 25 Mar 2026 15:50:49 +0100
Subject: [PATCH v4 18/27] media: rockchip: rga: change offset to
 dma_addresses
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-spu-rga3-v4-18-e90ec1c61354@pengutronix.de>
References: <20260325-spu-rga3-v4-0-e90ec1c61354@pengutronix.de>
In-Reply-To: <20260325-spu-rga3-v4-0-e90ec1c61354@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.15.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57065-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,pengutronix.de:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: A9EE53278BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Change the offset to dma_addresses, as the current naming is misleading.
The offset naming comes from the fact that it references the offset in
the mapped iommu address space. But from the hardware point of view this
is an address, as also pointed out by the register naming
(e.g. RGA_DST_Y_RGB_BASE_ADDR). Therefore also change the type to
dma_addr_t, as with an external iommu driver this would also be the
correct type.

This change is a preparation for the RGA3 support, which uses an external
iommu and therefore just gets an dma_addr_t for each buffer. The field
renaming allows to reuse the existing fields of rga_vb_buffer to store
these values.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-buf.c |  12 +--
 drivers/media/platform/rockchip/rga/rga-hw.c  | 105 +++++++++++++-------------
 drivers/media/platform/rockchip/rga/rga.h     |  12 +--
 3 files changed, 64 insertions(+), 65 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index ffc6162b2e681..bc349d0a46365 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -121,7 +121,7 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
 	size_t curr_desc = 0;
 	int i;
 	const struct v4l2_format_info *info;
-	unsigned int offsets[VIDEO_MAX_PLANES];
+	unsigned int dma_addrs[VIDEO_MAX_PLANES];
 
 	if (IS_ERR(f))
 		return PTR_ERR(f);
@@ -145,18 +145,18 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
 				 "Failed to map video buffer to RGA\n");
 			return n_desc;
 		}
-		offsets[i] = curr_desc << PAGE_SHIFT;
+		dma_addrs[i] = curr_desc << PAGE_SHIFT;
 		curr_desc += n_desc;
 	}
 
 	/* Fill the remaining planes */
 	info = v4l2_format_info(f->fmt->fourcc);
 	for (i = info->mem_planes; i < info->comp_planes; i++)
-		offsets[i] = get_plane_offset(f, info, i);
+		dma_addrs[i] = dma_addrs[0] + get_plane_offset(f, info, i);
 
-	rbuf->offset.y_off = offsets[0];
-	rbuf->offset.u_off = offsets[1];
-	rbuf->offset.v_off = offsets[2];
+	rbuf->dma_addrs.y_addr = dma_addrs[0];
+	rbuf->dma_addrs.u_addr = dma_addrs[1];
+	rbuf->dma_addrs.v_addr = dma_addrs[2];
 
 	return 0;
 }
diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index f6070508b1475..bf4a86a640ec5 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -16,11 +16,11 @@ enum e_rga_start_pos {
 	RB = 3,
 };
 
-struct rga_corners_addr_offset {
-	struct rga_addr_offset left_top;
-	struct rga_addr_offset right_top;
-	struct rga_addr_offset left_bottom;
-	struct rga_addr_offset right_bottom;
+struct rga_corners_addrs {
+	struct rga_addrs left_top;
+	struct rga_addrs right_top;
+	struct rga_addrs left_bottom;
+	struct rga_addrs right_bottom;
 };
 
 static unsigned int rga_get_scaling(unsigned int src, unsigned int dst)
@@ -36,20 +36,20 @@ static unsigned int rga_get_scaling(unsigned int src, unsigned int dst)
 	return (src > dst) ? ((dst << 16) / src) : ((src << 16) / dst);
 }
 
-static struct rga_corners_addr_offset
-rga_get_addr_offset(struct rga_frame *frm, struct rga_addr_offset *offset,
-		    unsigned int x, unsigned int y, unsigned int w, unsigned int h)
+static struct rga_corners_addrs
+rga_get_corner_addrs(struct rga_frame *frm, struct rga_addrs *addrs,
+		     unsigned int x, unsigned int y, unsigned int w, unsigned int h)
 {
-	struct rga_corners_addr_offset offsets;
-	struct rga_addr_offset *lt, *lb, *rt, *rb;
+	struct rga_corners_addrs corner_addrs;
+	struct rga_addrs *lt, *lb, *rt, *rb;
 	const struct v4l2_format_info *format_info;
 	unsigned int x_div = 0,
 		     y_div = 0, uv_stride = 0, pixel_width = 0;
 
-	lt = &offsets.left_top;
-	lb = &offsets.left_bottom;
-	rt = &offsets.right_top;
-	rb = &offsets.right_bottom;
+	lt = &corner_addrs.left_top;
+	lb = &corner_addrs.left_bottom;
+	rt = &corner_addrs.right_top;
+	rb = &corner_addrs.right_bottom;
 
 	format_info = v4l2_format_info(frm->pix.pixelformat);
 	/* x_div is only used for the u/v planes.
@@ -64,29 +64,28 @@ rga_get_addr_offset(struct rga_frame *frm, struct rga_addr_offset *offset,
 	uv_stride = frm->stride / x_div;
 	pixel_width = frm->stride / frm->pix.width;
 
-	lt->y_off = offset->y_off + y * frm->stride + x * pixel_width;
-	lt->u_off = offset->u_off + (y / y_div) * uv_stride + x / x_div;
-	lt->v_off = offset->v_off + (y / y_div) * uv_stride + x / x_div;
+	lt->y_addr = addrs->y_addr + y * frm->stride + x * pixel_width;
+	lt->u_addr = addrs->u_addr + (y / y_div) * uv_stride + x / x_div;
+	lt->v_addr = addrs->v_addr + (y / y_div) * uv_stride + x / x_div;
 
-	lb->y_off = lt->y_off + (h - 1) * frm->stride;
-	lb->u_off = lt->u_off + (h / y_div - 1) * uv_stride;
-	lb->v_off = lt->v_off + (h / y_div - 1) * uv_stride;
+	lb->y_addr = lt->y_addr + (h - 1) * frm->stride;
+	lb->u_addr = lt->u_addr + (h / y_div - 1) * uv_stride;
+	lb->v_addr = lt->v_addr + (h / y_div - 1) * uv_stride;
 
-	rt->y_off = lt->y_off + (w - 1) * pixel_width;
-	rt->u_off = lt->u_off + w / x_div - 1;
-	rt->v_off = lt->v_off + w / x_div - 1;
+	rt->y_addr = lt->y_addr + (w - 1) * pixel_width;
+	rt->u_addr = lt->u_addr + w / x_div - 1;
+	rt->v_addr = lt->v_addr + w / x_div - 1;
 
-	rb->y_off = lb->y_off + (w - 1) * pixel_width;
-	rb->u_off = lb->u_off + w / x_div - 1;
-	rb->v_off = lb->v_off + w / x_div - 1;
+	rb->y_addr = lb->y_addr + (w - 1) * pixel_width;
+	rb->u_addr = lb->u_addr + w / x_div - 1;
+	rb->v_addr = lb->v_addr + w / x_div - 1;
 
-	return offsets;
+	return corner_addrs;
 }
 
-static struct rga_addr_offset *rga_lookup_draw_pos(struct
-		rga_corners_addr_offset
-		* offsets, u32 rotate_mode,
-		u32 mirr_mode)
+static struct rga_addrs *rga_lookup_draw_pos(struct rga_corners_addrs *corner_addrs,
+					     u32 rotate_mode,
+					     u32 mirr_mode)
 {
 	static enum e_rga_start_pos rot_mir_point_matrix[4][4] = {
 		{
@@ -103,18 +102,18 @@ static struct rga_addr_offset *rga_lookup_draw_pos(struct
 		},
 	};
 
-	if (!offsets)
+	if (!corner_addrs)
 		return NULL;
 
 	switch (rot_mir_point_matrix[rotate_mode][mirr_mode]) {
 	case LT:
-		return &offsets->left_top;
+		return &corner_addrs->left_top;
 	case LB:
-		return &offsets->left_bottom;
+		return &corner_addrs->left_bottom;
 	case RT:
-		return &offsets->right_top;
+		return &corner_addrs->right_top;
 	case RB:
-		return &offsets->right_bottom;
+		return &corner_addrs->right_bottom;
 	}
 
 	return NULL;
@@ -316,9 +315,9 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 }
 
 static void rga_cmd_set_src_info(struct rga_ctx *ctx,
-				 struct rga_addr_offset *offset)
+				 struct rga_addrs *addrs)
 {
-	struct rga_corners_addr_offset src_offsets;
+	struct rga_corners_addrs src_corner_addrs;
 	u32 *dest = ctx->cmdbuf_virt;
 	unsigned int src_h, src_w, src_x, src_y;
 
@@ -330,22 +329,22 @@ static void rga_cmd_set_src_info(struct rga_ctx *ctx,
 	/*
 	 * Calculate the source framebuffer base address with offset pixel.
 	 */
-	src_offsets = rga_get_addr_offset(&ctx->in, offset,
-					  src_x, src_y, src_w, src_h);
+	src_corner_addrs = rga_get_corner_addrs(&ctx->in, addrs,
+						src_x, src_y, src_w, src_h);
 
 	dest[(RGA_SRC_Y_RGB_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =
-		src_offsets.left_top.y_off;
+		src_corner_addrs.left_top.y_addr;
 	dest[(RGA_SRC_CB_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =
-		src_offsets.left_top.u_off;
+		src_corner_addrs.left_top.u_addr;
 	dest[(RGA_SRC_CR_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =
-		src_offsets.left_top.v_off;
+		src_corner_addrs.left_top.v_addr;
 }
 
 static void rga_cmd_set_dst_info(struct rga_ctx *ctx,
-				 struct rga_addr_offset *offset)
+				 struct rga_addrs *addrs)
 {
-	struct rga_addr_offset *dst_offset;
-	struct rga_corners_addr_offset offsets;
+	struct rga_addrs *dst_addrs;
+	struct rga_corners_addrs corner_addrs;
 	u32 *dest = ctx->cmdbuf_virt;
 	unsigned int dst_h, dst_w, dst_x, dst_y;
 	unsigned int mir_mode = 0;
@@ -379,15 +378,15 @@ static void rga_cmd_set_dst_info(struct rga_ctx *ctx,
 	/*
 	 * Configure the dest framebuffer base address with pixel offset.
 	 */
-	offsets = rga_get_addr_offset(&ctx->out, offset, dst_x, dst_y, dst_w, dst_h);
-	dst_offset = rga_lookup_draw_pos(&offsets, rot_mode, mir_mode);
+	corner_addrs = rga_get_corner_addrs(&ctx->out, addrs, dst_x, dst_y, dst_w, dst_h);
+	dst_addrs = rga_lookup_draw_pos(&corner_addrs, rot_mode, mir_mode);
 
 	dest[(RGA_DST_Y_RGB_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =
-		dst_offset->y_off;
+		dst_addrs->y_addr;
 	dest[(RGA_DST_CB_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =
-		dst_offset->u_off;
+		dst_addrs->u_addr;
 	dest[(RGA_DST_CR_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =
-		dst_offset->v_off;
+		dst_addrs->v_addr;
 }
 
 static void rga_cmd_set_mode(struct rga_ctx *ctx)
@@ -426,8 +425,8 @@ static void rga_cmd_set(struct rga_ctx *ctx,
 
 	rga_cmd_set_dst_addr(ctx, dst->dma_desc_pa);
 
-	rga_cmd_set_src_info(ctx, &src->offset);
-	rga_cmd_set_dst_info(ctx, &dst->offset);
+	rga_cmd_set_src_info(ctx, &src->dma_addrs);
+	rga_cmd_set_dst_info(ctx, &dst->dma_addrs);
 
 	rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);
 
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index dc6f90b843c32..025b1df594e9a 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -96,10 +96,10 @@ struct rockchip_rga {
 	const struct rga_hw *hw;
 };
 
-struct rga_addr_offset {
-	unsigned int y_off;
-	unsigned int u_off;
-	unsigned int v_off;
+struct rga_addrs {
+	dma_addr_t y_addr;
+	dma_addr_t u_addr;
+	dma_addr_t v_addr;
 };
 
 struct rga_vb_buffer {
@@ -111,8 +111,8 @@ struct rga_vb_buffer {
 	dma_addr_t dma_desc_pa;
 	size_t n_desc;
 
-	/* Plane offsets of this buffer into the mapping */
-	struct rga_addr_offset offset;
+	/* Plane DMA addresses after the MMU mapping of the buffer */
+	struct rga_addrs dma_addrs;
 };
 
 static inline struct rga_vb_buffer *vb_to_rga(struct vb2_v4l2_buffer *vb)

-- 
2.53.0


