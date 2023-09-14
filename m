Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED5E27A0420
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 14:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238453AbjINMld (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 08:41:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238235AbjINMla (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 08:41:30 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D191FD6
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 05:41:26 -0700 (PDT)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1qgles-0008Mc-Vq; Thu, 14 Sep 2023 14:41:22 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu, 14 Sep 2023 14:40:36 +0200
Subject: [PATCH 04/13] media: rockchip: rga: split src and dst buffer setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230914-rockchip-rga-multiplanar-v1-4-abfd77260ae3@pengutronix.de>
References: <20230914-rockchip-rga-multiplanar-v1-0-abfd77260ae3@pengutronix.de>
In-Reply-To: <20230914-rockchip-rga-multiplanar-v1-0-abfd77260ae3@pengutronix.de>
To:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Shengyu Qu <wiagn233@outlook.com>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Diederik de Haas <didi.debian@cknow.org>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Split the register setup for the source and destination video buffers
into separate functions.

This is a cleanup to make the code more readable by separating the
offset calculation for the different buffers and prepares the driver for
using pre-calculated offsets of planes.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-hw.c | 94 ++++++++++++++++++++--------
 1 file changed, 68 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index b391d97d4632..836ec7721b21 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -163,7 +163,7 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 	struct rockchip_rga *rga = ctx->rga;
 	u32 *dest = rga->cmdbuf_virt;
 	unsigned int scale_dst_w, scale_dst_h;
-	unsigned int src_h, src_w, src_x, src_y, dst_h, dst_w, dst_x, dst_y;
+	unsigned int src_h, src_w, dst_h, dst_w;
 	union rga_src_info src_info;
 	union rga_dst_info dst_info;
 	union rga_src_x_factor x_factor;
@@ -173,18 +173,10 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 	union rga_dst_vir_info dst_vir_info;
 	union rga_dst_act_info dst_act_info;
 
-	struct rga_addr_offset *dst_offset;
-	struct rga_corners_addr_offset offsets;
-	struct rga_corners_addr_offset src_offsets;
-
 	src_h = ctx->in.crop.height;
 	src_w = ctx->in.crop.width;
-	src_x = ctx->in.crop.left;
-	src_y = ctx->in.crop.top;
 	dst_h = ctx->out.crop.height;
 	dst_w = ctx->out.crop.width;
-	dst_x = ctx->out.crop.left;
-	dst_y = ctx->out.crop.top;
 
 	src_info.val = dest[(RGA_SRC_INFO - RGA_MODE_BASE_REG) >> 2];
 	dst_info.val = dest[(RGA_DST_INFO - RGA_MODE_BASE_REG) >> 2];
@@ -312,32 +304,85 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 	dst_act_info.data.act_height = dst_h - 1;
 	dst_act_info.data.act_width = dst_w - 1;
 
+	dest[(RGA_SRC_X_FACTOR - RGA_MODE_BASE_REG) >> 2] = x_factor.val;
+	dest[(RGA_SRC_Y_FACTOR - RGA_MODE_BASE_REG) >> 2] = y_factor.val;
+	dest[(RGA_SRC_VIR_INFO - RGA_MODE_BASE_REG) >> 2] = src_vir_info.val;
+	dest[(RGA_SRC_ACT_INFO - RGA_MODE_BASE_REG) >> 2] = src_act_info.val;
+
+	dest[(RGA_SRC_INFO - RGA_MODE_BASE_REG) >> 2] = src_info.val;
+
+	dest[(RGA_DST_VIR_INFO - RGA_MODE_BASE_REG) >> 2] = dst_vir_info.val;
+	dest[(RGA_DST_ACT_INFO - RGA_MODE_BASE_REG) >> 2] = dst_act_info.val;
+
+	dest[(RGA_DST_INFO - RGA_MODE_BASE_REG) >> 2] = dst_info.val;
+}
+
+static void rga_cmd_set_src_info(struct rga_ctx *ctx)
+{
+	struct rga_corners_addr_offset src_offsets;
+	struct rockchip_rga *rga = ctx->rga;
+	u32 *dest = rga->cmdbuf_virt;
+	unsigned int src_h, src_w, src_x, src_y;
+
+	src_h = ctx->in.crop.height;
+	src_w = ctx->in.crop.width;
+	src_x = ctx->in.crop.left;
+	src_y = ctx->in.crop.top;
+
 	/*
 	 * Calculate the source framebuffer base address with offset pixel.
 	 */
 	src_offsets = rga_get_addr_offset(&ctx->in, src_x, src_y,
 					  src_w, src_h);
 
-	/*
-	 * Configure the dest framebuffer base address with pixel offset.
-	 */
-	offsets = rga_get_addr_offset(&ctx->out, dst_x, dst_y, dst_w, dst_h);
-	dst_offset = rga_lookup_draw_pos(&offsets, src_info.data.rot_mode,
-					 src_info.data.mir_mode);
-
 	dest[(RGA_SRC_Y_RGB_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =
 		src_offsets.left_top.y_off;
 	dest[(RGA_SRC_CB_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =
 		src_offsets.left_top.u_off;
 	dest[(RGA_SRC_CR_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =
 		src_offsets.left_top.v_off;
+}
 
-	dest[(RGA_SRC_X_FACTOR - RGA_MODE_BASE_REG) >> 2] = x_factor.val;
-	dest[(RGA_SRC_Y_FACTOR - RGA_MODE_BASE_REG) >> 2] = y_factor.val;
-	dest[(RGA_SRC_VIR_INFO - RGA_MODE_BASE_REG) >> 2] = src_vir_info.val;
-	dest[(RGA_SRC_ACT_INFO - RGA_MODE_BASE_REG) >> 2] = src_act_info.val;
+static void rga_cmd_set_dst_info(struct rga_ctx *ctx)
+{
+	struct rga_addr_offset *dst_offset;
+	struct rga_corners_addr_offset offsets;
+	struct rockchip_rga *rga = ctx->rga;
+	u32 *dest = rga->cmdbuf_virt;
+	unsigned int dst_h, dst_w, dst_x, dst_y;
+	unsigned int mir_mode = 0;
+	unsigned int rot_mode = 0;
 
-	dest[(RGA_SRC_INFO - RGA_MODE_BASE_REG) >> 2] = src_info.val;
+	dst_h = ctx->out.crop.height;
+	dst_w = ctx->out.crop.width;
+	dst_x = ctx->out.crop.left;
+	dst_y = ctx->out.crop.top;
+
+	if (ctx->vflip)
+		mir_mode |= RGA_SRC_MIRR_MODE_X;
+	if (ctx->hflip)
+		mir_mode |= RGA_SRC_MIRR_MODE_Y;
+
+	switch (ctx->rotate) {
+	case 90:
+		rot_mode = RGA_SRC_ROT_MODE_90_DEGREE;
+		break;
+	case 180:
+		rot_mode = RGA_SRC_ROT_MODE_180_DEGREE;
+		break;
+	case 270:
+		rot_mode = RGA_SRC_ROT_MODE_270_DEGREE;
+		break;
+	default:
+		rot_mode = RGA_SRC_ROT_MODE_0_DEGREE;
+		break;
+	}
+
+	/*
+	 * Configure the dest framebuffer base address with pixel offset.
+	 */
+	offsets = rga_get_addr_offset(&ctx->out, dst_x, dst_y, dst_w, dst_h);
+	dst_offset = rga_lookup_draw_pos(&offsets, mir_mode, rot_mode);
 
 	dest[(RGA_DST_Y_RGB_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =
 		dst_offset->y_off;
@@ -345,11 +390,6 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 		dst_offset->u_off;
 	dest[(RGA_DST_CR_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =
 		dst_offset->v_off;
-
-	dest[(RGA_DST_VIR_INFO - RGA_MODE_BASE_REG) >> 2] = dst_vir_info.val;
-	dest[(RGA_DST_ACT_INFO - RGA_MODE_BASE_REG) >> 2] = dst_act_info.val;
-
-	dest[(RGA_DST_INFO - RGA_MODE_BASE_REG) >> 2] = dst_info.val;
 }
 
 static void rga_cmd_set_mode(struct rga_ctx *ctx)
@@ -392,6 +432,8 @@ static void rga_cmd_set(struct rga_ctx *ctx,
 	rga_cmd_set_dst_addr(ctx, dst->dma_desc_pa);
 	rga_cmd_set_mode(ctx);
 
+	rga_cmd_set_src_info(ctx);
+	rga_cmd_set_dst_info(ctx);
 	rga_cmd_set_trans_info(ctx);
 
 	rga_write(rga, RGA_CMD_BASE, rga->cmdbuf_phy);

-- 
2.39.2

