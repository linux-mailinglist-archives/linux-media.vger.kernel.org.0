Return-Path: <linux-media+bounces-43811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA62BC0B53
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 10:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 248E73B7A5B
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 08:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5332DECCB;
	Tue,  7 Oct 2025 08:33:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC952DEA70
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 08:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759825993; cv=none; b=qSUkHSOgi7FYj+K0UmRkxuheQnm+/ptZWdN9vmW6wdkPhLxCoSzNahdQN73AR6+sDVwtm7TQ1J2IRNNaQDs3IFz+SI5kfkx8vg3OV2Xd2afrp10IveX3rBDO1NTSF6dYsopA1b5cLsLC8V9uQv9Hw1LzgNVis+uFoRX7tAZw/YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759825993; c=relaxed/simple;
	bh=jLdwCl+E15LN7c0A/eTcmasmV3G2F1fBYT0YYtcWt70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YZ+PzhII17smsGU4ll7YnktCrwuBMtfSsDXe2dWbk4B7V/zTCI3hcYuay7zLErspKUYYF51n35qh8tx25yEMuOkdCAVtUykFh5LGKq7QRwamfTIKxsHU/iCGpIKm5UkoM12FCnQKxllN5XGlG0QQFjYV327qHGuicEj9e3mj+/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1v637s-0002Hb-Oh; Tue, 07 Oct 2025 10:32:52 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 07 Oct 2025 10:31:59 +0200
Subject: [PATCH 06/16] media: rockchip: rga: change offset to dma_addresses
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251007-spu-rga3-v1-6-36ad85570402@pengutronix.de>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
In-Reply-To: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

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

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-buf.c |  12 +--
 drivers/media/platform/rockchip/rga/rga-hw.c  | 105 +++++++++++++-------------
 drivers/media/platform/rockchip/rga/rga.h     |  12 +--
 3 files changed, 64 insertions(+), 65 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index b5e6b1b527ca81721c64d96d984d5e981449c237..0d188b3176cf3e175e865db5cfa26d565bf846ec 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -118,7 +118,7 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
 	size_t curr_desc = 0;
 	int i;
 	const struct v4l2_format_info *info;
-	unsigned int offsets[VIDEO_MAX_PLANES];
+	unsigned int dma_addrs[VIDEO_MAX_PLANES];
 
 	if (IS_ERR(f))
 		return PTR_ERR(f);
@@ -142,18 +142,18 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
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
index a44befe4054d19e3b921c0827af4d36cf077e61f..f3aef0b5ce25870764bd59f4241e2bda332bbd1f 100644
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
@@ -36,48 +36,47 @@ static unsigned int rga_get_scaling(unsigned int src, unsigned int dst)
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
 
 	x_div = frm->fmt->x_div;
 	y_div = frm->fmt->y_div;
 	uv_stride = frm->stride / x_div;
 	pixel_width = frm->stride / frm->width;
 
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
@@ -94,18 +93,18 @@ static struct rga_addr_offset *rga_lookup_draw_pos(struct
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
@@ -310,9 +309,9 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 }
 
 static void rga_cmd_set_src_info(struct rga_ctx *ctx,
-				 struct rga_addr_offset *offset)
+				 struct rga_addrs *addrs)
 {
-	struct rga_corners_addr_offset src_offsets;
+	struct rga_corners_addrs src_corner_addrs;
 	struct rockchip_rga *rga = ctx->rga;
 	u32 *dest = rga->cmdbuf_virt;
 	unsigned int src_h, src_w, src_x, src_y;
@@ -325,22 +324,22 @@ static void rga_cmd_set_src_info(struct rga_ctx *ctx,
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
 	struct rockchip_rga *rga = ctx->rga;
 	u32 *dest = rga->cmdbuf_virt;
 	unsigned int dst_h, dst_w, dst_x, dst_y;
@@ -375,15 +374,15 @@ static void rga_cmd_set_dst_info(struct rga_ctx *ctx,
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
 	rga_cmd_set_mode(ctx);
 
-	rga_cmd_set_src_info(ctx, &src->offset);
-	rga_cmd_set_dst_info(ctx, &dst->offset);
+	rga_cmd_set_src_info(ctx, &src->dma_addrs);
+	rga_cmd_set_dst_info(ctx, &dst->dma_addrs);
 	rga_cmd_set_trans_info(ctx);
 
 	rga_write(rga, RGA_CMD_BASE, rga->cmdbuf_phy);
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 257267738d5d179d9ec4fcb5c8729783c9b713de..fa47cb35f2623fc5226cb23d1d1d793d5dcd1dc7 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -102,10 +102,10 @@ struct rockchip_rga {
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
@@ -117,8 +117,8 @@ struct rga_vb_buffer {
 	dma_addr_t dma_desc_pa;
 	size_t n_desc;
 
-	/* Plane offsets of this buffer into the mapping */
-	struct rga_addr_offset offset;
+	/* Plane DMA addresses after the MMU mapping of the buffer */
+	struct rga_addrs dma_addrs;
 };
 
 static inline struct rga_vb_buffer *vb_to_rga(struct vb2_v4l2_buffer *vb)

-- 
2.51.0


