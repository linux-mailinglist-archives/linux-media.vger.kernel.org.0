Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6D117C83EB
	for <lists+linux-media@lfdr.de>; Fri, 13 Oct 2023 13:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230391AbjJMLBc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Oct 2023 07:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbjJMLBV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Oct 2023 07:01:21 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F32C7BD
        for <linux-media@vger.kernel.org>; Fri, 13 Oct 2023 04:01:19 -0700 (PDT)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1qrFuU-0006xJ-6f; Fri, 13 Oct 2023 13:00:50 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
Date:   Fri, 13 Oct 2023 13:00:26 +0200
Subject: [PATCH v2 05/13] media: rockchip: rga: pre-calculate plane offsets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230914-rockchip-rga-multiplanar-v2-5-bbfa6abf8bbf@pengutronix.de>
References: <20230914-rockchip-rga-multiplanar-v2-0-bbfa6abf8bbf@pengutronix.de>
In-Reply-To: <20230914-rockchip-rga-multiplanar-v2-0-bbfa6abf8bbf@pengutronix.de>
To:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Shengyu Qu <wiagn233@outlook.com>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Diederik de Haas <didi.debian@cknow.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Calculate the plane offsets and store them with the video buffer while
creating the buffer mapping.

This allows the driver to more freely handle the memory of the DMA
mapping as the offsets and the mapping can be kept in sync.

The driver still has to update the offsets to respect the configured
cropping and rotation, but this calculation is now separated from the
calculation of the plane offsets.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v2:
- Drop unused uv_factor to fix smatch warning
---
 drivers/media/platform/rockchip/rga/rga-buf.c | 16 ++++++++++++
 drivers/media/platform/rockchip/rga/rga-hw.c  | 36 +++++++++++----------------
 drivers/media/platform/rockchip/rga/rga.h     |  9 +++++++
 3 files changed, 40 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index ff36efade060..d6774a844d9b 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -74,6 +74,18 @@ static int rga_buf_init(struct vb2_buffer *vb)
 	return 0;
 }
 
+static int get_plane_offset(struct rga_frame *f, int plane)
+{
+	if (plane == 0)
+		return 0;
+	if (plane == 1)
+		return f->width * f->height;
+	if (plane == 2)
+		return f->width * f->height + (f->width * f->height / f->fmt->uv_factor);
+
+	return -EINVAL;
+}
+
 static int rga_buf_prepare(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
@@ -89,6 +101,10 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
 	/* Create local MMU table for RGA */
 	fill_descriptors(rbuf->dma_desc, vb2_dma_sg_plane_desc(vb, 0));
 
+	rbuf->offset.y_off = get_plane_offset(f, 0);
+	rbuf->offset.u_off = get_plane_offset(f, 1);
+	rbuf->offset.v_off = get_plane_offset(f, 2);
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 836ec7721b21..11c3d7234757 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -16,12 +16,6 @@ enum e_rga_start_pos {
 	RB = 3,
 };
 
-struct rga_addr_offset {
-	unsigned int y_off;
-	unsigned int u_off;
-	unsigned int v_off;
-};
-
 struct rga_corners_addr_offset {
 	struct rga_addr_offset left_top;
 	struct rga_addr_offset right_top;
@@ -43,13 +37,13 @@ static unsigned int rga_get_scaling(unsigned int src, unsigned int dst)
 }
 
 static struct rga_corners_addr_offset
-rga_get_addr_offset(struct rga_frame *frm, unsigned int x, unsigned int y,
-		    unsigned int w, unsigned int h)
+rga_get_addr_offset(struct rga_frame *frm, struct rga_addr_offset *offset,
+		    unsigned int x, unsigned int y, unsigned int w, unsigned int h)
 {
 	struct rga_corners_addr_offset offsets;
 	struct rga_addr_offset *lt, *lb, *rt, *rb;
 	unsigned int x_div = 0,
-		     y_div = 0, uv_stride = 0, pixel_width = 0, uv_factor = 0;
+		     y_div = 0, uv_stride = 0, pixel_width = 0;
 
 	lt = &offsets.left_top;
 	lb = &offsets.left_bottom;
@@ -58,14 +52,12 @@ rga_get_addr_offset(struct rga_frame *frm, unsigned int x, unsigned int y,
 
 	x_div = frm->fmt->x_div;
 	y_div = frm->fmt->y_div;
-	uv_factor = frm->fmt->uv_factor;
 	uv_stride = frm->stride / x_div;
 	pixel_width = frm->stride / frm->width;
 
-	lt->y_off = y * frm->stride + x * pixel_width;
-	lt->u_off =
-		frm->width * frm->height + (y / y_div) * uv_stride + x / x_div;
-	lt->v_off = lt->u_off + frm->width * frm->height / uv_factor;
+	lt->y_off = offset->y_off + y * frm->stride + x * pixel_width;
+	lt->u_off = offset->u_off + (y / y_div) * uv_stride + x / x_div;
+	lt->v_off = offset->v_off + (y / y_div) * uv_stride + x / x_div;
 
 	lb->y_off = lt->y_off + (h - 1) * frm->stride;
 	lb->u_off = lt->u_off + (h / y_div - 1) * uv_stride;
@@ -317,7 +309,8 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 	dest[(RGA_DST_INFO - RGA_MODE_BASE_REG) >> 2] = dst_info.val;
 }
 
-static void rga_cmd_set_src_info(struct rga_ctx *ctx)
+static void rga_cmd_set_src_info(struct rga_ctx *ctx,
+				 struct rga_addr_offset *offset)
 {
 	struct rga_corners_addr_offset src_offsets;
 	struct rockchip_rga *rga = ctx->rga;
@@ -332,8 +325,8 @@ static void rga_cmd_set_src_info(struct rga_ctx *ctx)
 	/*
 	 * Calculate the source framebuffer base address with offset pixel.
 	 */
-	src_offsets = rga_get_addr_offset(&ctx->in, src_x, src_y,
-					  src_w, src_h);
+	src_offsets = rga_get_addr_offset(&ctx->in, offset,
+					  src_x, src_y, src_w, src_h);
 
 	dest[(RGA_SRC_Y_RGB_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =
 		src_offsets.left_top.y_off;
@@ -343,7 +336,8 @@ static void rga_cmd_set_src_info(struct rga_ctx *ctx)
 		src_offsets.left_top.v_off;
 }
 
-static void rga_cmd_set_dst_info(struct rga_ctx *ctx)
+static void rga_cmd_set_dst_info(struct rga_ctx *ctx,
+				 struct rga_addr_offset *offset)
 {
 	struct rga_addr_offset *dst_offset;
 	struct rga_corners_addr_offset offsets;
@@ -381,7 +375,7 @@ static void rga_cmd_set_dst_info(struct rga_ctx *ctx)
 	/*
 	 * Configure the dest framebuffer base address with pixel offset.
 	 */
-	offsets = rga_get_addr_offset(&ctx->out, dst_x, dst_y, dst_w, dst_h);
+	offsets = rga_get_addr_offset(&ctx->out, offset, dst_x, dst_y, dst_w, dst_h);
 	dst_offset = rga_lookup_draw_pos(&offsets, mir_mode, rot_mode);
 
 	dest[(RGA_DST_Y_RGB_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =
@@ -432,8 +426,8 @@ static void rga_cmd_set(struct rga_ctx *ctx,
 	rga_cmd_set_dst_addr(ctx, dst->dma_desc_pa);
 	rga_cmd_set_mode(ctx);
 
-	rga_cmd_set_src_info(ctx);
-	rga_cmd_set_dst_info(ctx);
+	rga_cmd_set_src_info(ctx, &src->offset);
+	rga_cmd_set_dst_info(ctx, &dst->offset);
 	rga_cmd_set_trans_info(ctx);
 
 	rga_write(rga, RGA_CMD_BASE, rga->cmdbuf_phy);
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 678f0f627bdd..f3953a07d9e7 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -87,6 +87,12 @@ struct rockchip_rga {
 	void *cmdbuf_virt;
 };
 
+struct rga_addr_offset {
+	unsigned int y_off;
+	unsigned int u_off;
+	unsigned int v_off;
+};
+
 struct rga_vb_buffer {
 	struct vb2_v4l2_buffer vb_buf;
 	struct list_head queue;
@@ -95,6 +101,9 @@ struct rga_vb_buffer {
 	struct rga_dma_desc *dma_desc;
 	dma_addr_t dma_desc_pa;
 	size_t n_desc;
+
+	/* Plane offsets of this buffer into the mapping */
+	struct rga_addr_offset offset;
 };
 
 static inline struct rga_vb_buffer *vb_to_rga(struct vb2_v4l2_buffer *vb)

-- 
2.39.2

