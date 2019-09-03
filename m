Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A436AA7269
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 20:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729838AbfICSR3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 14:17:29 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38054 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbfICSR3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 14:17:29 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id CF0E328A0B7
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Chris Healy <cphealy@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 1/4] media: hantro: Simplify macroblock macros
Date:   Tue,  3 Sep 2019 15:17:08 -0300
Message-Id: <20190903181711.7559-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190903181711.7559-1-ezequiel@collabora.com>
References: <20190903181711.7559-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It seems all codecs are using a 16x16 size macroblock,
and so it's possible to have just one set of macroblock macros.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro.h          | 18 +++---------------
 .../staging/media/hantro/hantro_g1_h264_dec.c  |  2 +-
 .../staging/media/hantro/hantro_g1_mpeg2_dec.c |  4 ++--
 .../staging/media/hantro/hantro_g1_vp8_dec.c   |  4 ++--
 .../staging/media/hantro/hantro_h1_jpeg_enc.c  |  4 ++--
 drivers/staging/media/hantro/rk3288_vpu_hw.c   | 16 ++++++++--------
 drivers/staging/media/hantro/rk3399_vpu_hw.c   | 12 ++++++------
 .../media/hantro/rk3399_vpu_hw_jpeg_enc.c      |  4 ++--
 .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c     |  4 ++--
 .../media/hantro/rk3399_vpu_hw_vp8_dec.c       |  4 ++--
 10 files changed, 30 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index f670bbde4159..c151133b8c86 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -26,21 +26,9 @@
 
 #include "hantro_hw.h"
 
-#define VP8_MB_DIM			16
-#define VP8_MB_WIDTH(w)			DIV_ROUND_UP(w, VP8_MB_DIM)
-#define VP8_MB_HEIGHT(h)		DIV_ROUND_UP(h, VP8_MB_DIM)
-
-#define H264_MB_DIM			16
-#define H264_MB_WIDTH(w)		DIV_ROUND_UP(w, H264_MB_DIM)
-#define H264_MB_HEIGHT(h)		DIV_ROUND_UP(h, H264_MB_DIM)
-
-#define MPEG2_MB_DIM			16
-#define MPEG2_MB_WIDTH(w)		DIV_ROUND_UP(w, MPEG2_MB_DIM)
-#define MPEG2_MB_HEIGHT(h)		DIV_ROUND_UP(h, MPEG2_MB_DIM)
-
-#define JPEG_MB_DIM			16
-#define JPEG_MB_WIDTH(w)		DIV_ROUND_UP(w, JPEG_MB_DIM)
-#define JPEG_MB_HEIGHT(h)		DIV_ROUND_UP(h, JPEG_MB_DIM)
+#define MB_DIM			16
+#define MB_WIDTH(w)		DIV_ROUND_UP(w, MB_DIM)
+#define MB_HEIGHT(h)		DIV_ROUND_UP(h, MB_DIM)
 
 struct hantro_ctx;
 struct hantro_codec_ops;
diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index 7ab534936843..d42c4004fe35 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -251,7 +251,7 @@ static void set_buffers(struct hantro_ctx *ctx)
 		size_t mv_offset = round_up(pic_size, 8);
 
 		if (ctrls->slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
-			mv_offset += 32 * H264_MB_WIDTH(ctx->dst_fmt.width);
+			mv_offset += 32 * MB_WIDTH(ctx->dst_fmt.width);
 
 		vdpu_write_relaxed(vpu, dst_dma + mv_offset,
 				   G1_REG_ADDR_DIR_MV);
diff --git a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
index 80f0e94f8afa..314a72208812 100644
--- a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
@@ -207,8 +207,8 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 	      G1_REG_DEC_AXI_WR_ID(0);
 	vdpu_write_relaxed(vpu, reg, G1_SWREG(3));
 
-	reg = G1_REG_PIC_MB_WIDTH(MPEG2_MB_WIDTH(ctx->dst_fmt.width)) |
-	      G1_REG_PIC_MB_HEIGHT_P(MPEG2_MB_HEIGHT(ctx->dst_fmt.height)) |
+	reg = G1_REG_PIC_MB_WIDTH(MB_WIDTH(ctx->dst_fmt.width)) |
+	      G1_REG_PIC_MB_HEIGHT_P(MB_HEIGHT(ctx->dst_fmt.height)) |
 	      G1_REG_ALT_SCAN_E(picture->alternate_scan) |
 	      G1_REG_TOPFIELDFIRST_E(picture->top_field_first);
 	vdpu_write_relaxed(vpu, reg, G1_SWREG(4));
diff --git a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
index 6d99c2be01cf..e9d3361ed385 100644
--- a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
@@ -470,8 +470,8 @@ void hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
 	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
 
 	/* Frame dimensions */
-	mb_width = VP8_MB_WIDTH(width);
-	mb_height = VP8_MB_HEIGHT(height);
+	mb_width = MB_WIDTH(width);
+	mb_height = MB_HEIGHT(height);
 	reg = G1_REG_DEC_CTRL1_PIC_MB_WIDTH(mb_width) |
 	      G1_REG_DEC_CTRL1_PIC_MB_HEIGHT_P(mb_height) |
 	      G1_REG_DEC_CTRL1_PIC_MB_W_EXT(mb_width >> 9) |
diff --git a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
index ecd34a7db190..938b48d4d3d9 100644
--- a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
+++ b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
@@ -116,8 +116,8 @@ void hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx)
 	/* Make sure that all registers are written at this point. */
 	vepu_write(vpu, reg, H1_REG_AXI_CTRL);
 
-	reg = H1_REG_ENC_CTRL_WIDTH(JPEG_MB_WIDTH(ctx->src_fmt.width))
-		| H1_REG_ENC_CTRL_HEIGHT(JPEG_MB_HEIGHT(ctx->src_fmt.height))
+	reg = H1_REG_ENC_CTRL_WIDTH(MB_WIDTH(ctx->src_fmt.width))
+		| H1_REG_ENC_CTRL_HEIGHT(MB_HEIGHT(ctx->src_fmt.height))
 		| H1_REG_ENC_CTRL_ENC_MODE_JPEG
 		| H1_REG_ENC_PIC_INTRA
 		| H1_REG_ENC_CTRL_EN_BIT;
diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
index 6bfcc47d1e58..c0bdd6c02520 100644
--- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
@@ -48,10 +48,10 @@ static const struct hantro_fmt rk3288_vpu_enc_fmts[] = {
 		.frmsize = {
 			.min_width = 96,
 			.max_width = 8192,
-			.step_width = JPEG_MB_DIM,
+			.step_width = MB_DIM,
 			.min_height = 32,
 			.max_height = 8192,
-			.step_height = JPEG_MB_DIM,
+			.step_height = MB_DIM,
 		},
 	},
 };
@@ -68,10 +68,10 @@ static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
 		.frmsize = {
 			.min_width = 48,
 			.max_width = 3840,
-			.step_width = H264_MB_DIM,
+			.step_width = MB_DIM,
 			.min_height = 48,
 			.max_height = 2160,
-			.step_height = H264_MB_DIM,
+			.step_height = MB_DIM,
 		},
 	},
 	{
@@ -81,10 +81,10 @@ static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
 		.frmsize = {
 			.min_width = 48,
 			.max_width = 1920,
-			.step_width = MPEG2_MB_DIM,
+			.step_width = MB_DIM,
 			.min_height = 48,
 			.max_height = 1088,
-			.step_height = MPEG2_MB_DIM,
+			.step_height = MB_DIM,
 		},
 	},
 	{
@@ -94,10 +94,10 @@ static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
 		.frmsize = {
 			.min_width = 48,
 			.max_width = 3840,
-			.step_width = VP8_MB_DIM,
+			.step_width = MB_DIM,
 			.min_height = 48,
 			.max_height = 2160,
-			.step_height = VP8_MB_DIM,
+			.step_height = MB_DIM,
 		},
 	},
 };
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw.c b/drivers/staging/media/hantro/rk3399_vpu_hw.c
index 14d14bc6b12b..9ac1f2cb6a16 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw.c
@@ -47,10 +47,10 @@ static const struct hantro_fmt rk3399_vpu_enc_fmts[] = {
 		.frmsize = {
 			.min_width = 96,
 			.max_width = 8192,
-			.step_width = JPEG_MB_DIM,
+			.step_width = MB_DIM,
 			.min_height = 32,
 			.max_height = 8192,
-			.step_height = JPEG_MB_DIM,
+			.step_height = MB_DIM,
 		},
 	},
 };
@@ -67,10 +67,10 @@ static const struct hantro_fmt rk3399_vpu_dec_fmts[] = {
 		.frmsize = {
 			.min_width = 48,
 			.max_width = 1920,
-			.step_width = MPEG2_MB_DIM,
+			.step_width = MB_DIM,
 			.min_height = 48,
 			.max_height = 1088,
-			.step_height = MPEG2_MB_DIM,
+			.step_height = MB_DIM,
 		},
 	},
 	{
@@ -80,10 +80,10 @@ static const struct hantro_fmt rk3399_vpu_dec_fmts[] = {
 		.frmsize = {
 			.min_width = 48,
 			.max_width = 3840,
-			.step_width = VP8_MB_DIM,
+			.step_width = MB_DIM,
 			.min_height = 48,
 			.max_height = 2160,
-			.step_height = VP8_MB_DIM,
+			.step_height = MB_DIM,
 		},
 	},
 };
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c b/drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c
index 06162f569b5e..067892345b5d 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c
@@ -149,8 +149,8 @@ void rk3399_vpu_jpeg_enc_run(struct hantro_ctx *ctx)
 	reg = VEPU_REG_AXI_CTRL_BURST_LEN(16);
 	vepu_write_relaxed(vpu, reg, VEPU_REG_AXI_CTRL);
 
-	reg = VEPU_REG_MB_WIDTH(JPEG_MB_WIDTH(ctx->src_fmt.width))
-		| VEPU_REG_MB_HEIGHT(JPEG_MB_HEIGHT(ctx->src_fmt.height))
+	reg = VEPU_REG_MB_WIDTH(MB_WIDTH(ctx->src_fmt.width))
+		| VEPU_REG_MB_HEIGHT(MB_HEIGHT(ctx->src_fmt.height))
 		| VEPU_REG_FRAME_TYPE_INTRA
 		| VEPU_REG_ENCODE_FORMAT_JPEG
 		| VEPU_REG_ENCODE_ENABLE;
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
index e7ba5c0441cc..263ec81f209b 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
@@ -223,8 +223,8 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 	      VDPU_REG_DEC_CLK_GATE_E(1);
 	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(57));
 
-	reg = VDPU_REG_PIC_MB_WIDTH(MPEG2_MB_WIDTH(ctx->dst_fmt.width)) |
-	      VDPU_REG_PIC_MB_HEIGHT_P(MPEG2_MB_HEIGHT(ctx->dst_fmt.height)) |
+	reg = VDPU_REG_PIC_MB_WIDTH(MB_WIDTH(ctx->dst_fmt.width)) |
+	      VDPU_REG_PIC_MB_HEIGHT_P(MB_HEIGHT(ctx->dst_fmt.height)) |
 	      VDPU_REG_ALT_SCAN_E(picture->alternate_scan) |
 	      VDPU_REG_TOPFIELDFIRST_E(picture->top_field_first);
 	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(120));
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c b/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
index f17e32620b08..7d32a0283d93 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
@@ -563,8 +563,8 @@ void rk3399_vpu_vp8_dec_run(struct hantro_ctx *ctx)
 		hantro_reg_write(vpu, &vp8_dec_filter_disable, 1);
 
 	/* Frame dimensions */
-	mb_width = VP8_MB_WIDTH(width);
-	mb_height = VP8_MB_HEIGHT(height);
+	mb_width = MB_WIDTH(width);
+	mb_height = MB_HEIGHT(height);
 
 	hantro_reg_write(vpu, &vp8_dec_mb_width, mb_width);
 	hantro_reg_write(vpu, &vp8_dec_mb_height, mb_height);
-- 
2.22.0

