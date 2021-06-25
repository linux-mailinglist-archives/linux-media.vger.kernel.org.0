Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F35E3B4549
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 16:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231804AbhFYOOg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Jun 2021 10:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231644AbhFYOOc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Jun 2021 10:14:32 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF18FC061574;
        Fri, 25 Jun 2021 07:12:10 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:42b6:51ca:7d52:50ad])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E8DA01F44754;
        Fri, 25 Jun 2021 15:12:07 +0100 (BST)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     hverkuil@xs4all.nl, ezequiel@collabora.com, p.zabel@pengutronix.de,
        mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk,
        jernej.skrabec@gmail.com, nicolas@ndufresne.ca, cphealy@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v4 3/9] media: hantro: hevc: Allow 10-bits encoded streams
Date:   Fri, 25 Jun 2021 16:11:37 +0200
Message-Id: <20210625141143.577998-4-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625141143.577998-1-benjamin.gaignard@collabora.com>
References: <20210625141143.577998-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allow to use 10-bits encoded streams but force the output
to remain in 8-bits.
Add a function to get chroma offset for the output since
it may now not match with internal reference buffers chroma
offset.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/staging/media/hantro/hantro_drv.c     |  5 ++--
 .../staging/media/hantro/hantro_g2_hevc_dec.c | 29 +++++++++++++++----
 drivers/staging/media/hantro/hantro_g2_regs.h |  1 +
 drivers/staging/media/hantro/hantro_hevc.c    |  5 ++--
 4 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 61c0e9f0a05e..7121e6a6ca5b 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -263,8 +263,9 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
 		if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
 			/* Luma and chroma bit depth mismatch */
 			return -EINVAL;
-		if (sps->bit_depth_luma_minus8 != 0)
-			/* Only 8-bit is supported */
+		if (sps->bit_depth_luma_minus8 != 0 &&
+		    sps->bit_depth_luma_minus8 != 2)
+			/* Only 8-bit or 10-bit is supported */
 			return -EINVAL;
 		if (sps->flags & V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED)
 			/* No scaling support */
diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
index d8c83eb37e64..907e453ac9b2 100644
--- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
+++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
@@ -133,6 +133,16 @@ static void prepare_tile_info_buffer(struct hantro_ctx *ctx)
 		vpu_debug(1, "%s: no chroma!\n", __func__);
 }
 
+static bool is_8bit_dst_format(struct hantro_ctx *ctx)
+{
+	switch (ctx->vpu_dst_fmt->fourcc) {
+	case V4L2_PIX_FMT_NV12:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static void set_params(struct hantro_ctx *ctx)
 {
 	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
@@ -148,7 +158,8 @@ static void set_params(struct hantro_ctx *ctx)
 	hantro_reg_write(vpu, &g2_bit_depth_y_minus8, sps->bit_depth_luma_minus8);
 	hantro_reg_write(vpu, &g2_bit_depth_c_minus8, sps->bit_depth_chroma_minus8);
 
-	hantro_reg_write(vpu, &g2_output_8_bits, 0);
+	hantro_reg_write(vpu, &g2_output_8_bits, 1);
+	hantro_reg_write(vpu, &g2_output_format, 0);
 
 	hantro_reg_write(vpu, &g2_hdr_skip_length, ctrls->hevc_hdr_skip_length);
 
@@ -522,13 +533,21 @@ static int set_ref(struct hantro_ctx *ctx)
 	return 0;
 }
 
+static size_t hantro_hevc_output_chroma_offset(struct hantro_ctx *ctx)
+{
+	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
+	const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
+	int bytes_per_pixel = is_8bit_dst_format(ctx) ? 1 : 2;
+
+	return sps->pic_width_in_luma_samples *
+		sps->pic_height_in_luma_samples * bytes_per_pixel;
+}
+
 static void set_buffers(struct hantro_ctx *ctx)
 {
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	struct hantro_dev *vpu = ctx->dev;
-	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
-	const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
-	size_t cr_offset = hantro_hevc_chroma_offset(sps);
+	size_t output_cr_offset = hantro_hevc_output_chroma_offset(ctx);
 	dma_addr_t src_dma, dst_dma;
 	u32 src_len, src_buf_len;
 
@@ -550,7 +569,7 @@ static void set_buffers(struct hantro_ctx *ctx)
 	dst_dma = hantro_get_dec_buf_addr(ctx, &dst_buf->vb2_buf);
 
 	hantro_write_addr(vpu, G2_RASTER_SCAN, dst_dma);
-	hantro_write_addr(vpu, G2_RASTER_SCAN_CHR, dst_dma + cr_offset);
+	hantro_write_addr(vpu, G2_RASTER_SCAN_CHR, dst_dma + output_cr_offset);
 	hantro_write_addr(vpu, G2_ADDR_TILE_SIZE, ctx->hevc_dec.tile_sizes.dma);
 	hantro_write_addr(vpu, G2_TILE_FILTER, ctx->hevc_dec.tile_filter.dma);
 	hantro_write_addr(vpu, G2_TILE_SAO, ctx->hevc_dec.tile_sao.dma);
diff --git a/drivers/staging/media/hantro/hantro_g2_regs.h b/drivers/staging/media/hantro/hantro_g2_regs.h
index 0414d92e3860..941e5482d27b 100644
--- a/drivers/staging/media/hantro/hantro_g2_regs.h
+++ b/drivers/staging/media/hantro/hantro_g2_regs.h
@@ -77,6 +77,7 @@
 #define g2_bit_depth_y_minus8	G2_DEC_REG(8, 6,  0x3)
 #define g2_bit_depth_c_minus8	G2_DEC_REG(8, 4,  0x3)
 #define g2_output_8_bits	G2_DEC_REG(8, 3,  0x1)
+#define g2_output_format	G2_DEC_REG(8, 0,  0x7)
 
 #define g2_refidx1_active	G2_DEC_REG(9, 19, 0x1f)
 #define g2_refidx0_active	G2_DEC_REG(9, 14, 0x1f)
diff --git a/drivers/staging/media/hantro/hantro_hevc.c b/drivers/staging/media/hantro/hantro_hevc.c
index 78e5ceda520c..3d6606ff3340 100644
--- a/drivers/staging/media/hantro/hantro_hevc.c
+++ b/drivers/staging/media/hantro/hantro_hevc.c
@@ -204,6 +204,7 @@ static int tile_buffer_reallocate(struct hantro_ctx *ctx)
 	const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
 	unsigned int num_tile_cols = pps->num_tile_columns_minus1 + 1;
 	unsigned int height64 = (sps->pic_height_in_luma_samples + 63) & ~63;
+	unsigned int pixel_depth = sps->bit_depth_luma_minus8 == 0 ? 8 : 10;
 	unsigned int size;
 
 	if (num_tile_cols <= 1 ||
@@ -232,7 +233,7 @@ static int tile_buffer_reallocate(struct hantro_ctx *ctx)
 		hevc_dec->tile_bsd.cpu = NULL;
 	}
 
-	size = VERT_FILTER_RAM_SIZE * height64 * (num_tile_cols - 1);
+	size = (VERT_FILTER_RAM_SIZE * height64 * (num_tile_cols - 1) * pixel_depth) / 8;
 	hevc_dec->tile_filter.cpu = dma_alloc_coherent(vpu->dev, size,
 						       &hevc_dec->tile_filter.dma,
 						       GFP_KERNEL);
@@ -240,7 +241,7 @@ static int tile_buffer_reallocate(struct hantro_ctx *ctx)
 		goto err_free_tile_buffers;
 	hevc_dec->tile_filter.size = size;
 
-	size = VERT_SAO_RAM_SIZE * height64 * (num_tile_cols - 1);
+	size = (VERT_SAO_RAM_SIZE * height64 * (num_tile_cols - 1) * pixel_depth) / 8;
 	hevc_dec->tile_sao.cpu = dma_alloc_coherent(vpu->dev, size,
 						    &hevc_dec->tile_sao.dma,
 						    GFP_KERNEL);
-- 
2.25.1

