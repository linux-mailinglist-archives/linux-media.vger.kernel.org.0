Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCFBB28C39D
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 23:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731965AbgJLU7w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 16:59:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729488AbgJLU7E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 16:59:04 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89155C0613D7;
        Mon, 12 Oct 2020 13:59:01 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id EB0B41F44C4D
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fruehberger Peter <Peter.Fruehberger@de.bosch.com>,
        kuhanh.murugasen.krishnan@intel.com,
        Daniel Vetter <daniel@ffwll.ch>, kernel@collabora.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 12/18] media: hantro: add VC8000D h264 decoding
Date:   Mon, 12 Oct 2020 23:59:51 +0300
Message-Id: <20201012205957.889185-13-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012205957.889185-1-adrian.ratiu@collabora.com>
References: <20201012205957.889185-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VC8000D is a newer core combining both previous G1 and G2 cores into
one chip. As a result of this register layouts took a hit but the HW
functions mostly the same, so we can use regmap fields to compensate.

Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 .../staging/media/hantro/hantro_g1_h264_dec.c | 29 +++++++-
 drivers/staging/media/hantro/hantro_regmap.c  | 69 +++++++++++++++++++
 drivers/staging/media/hantro/hantro_regmap.h  | 22 ++++++
 3 files changed, 117 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index 8592dfabbc5e..a04cb616d628 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -20,6 +20,8 @@
 #include "hantro_v4l2.h"
 #include "hantro_regmap.h"
 
+#define VC8KD_TIMEOUT 0x500000
+
 extern struct regmap_config hantro_regmap_dec;
 
 static void set_params(struct hantro_ctx *ctx)
@@ -33,10 +35,23 @@ static void set_params(struct hantro_ctx *ctx)
 	struct hantro_regmap_fields_dec *fields = vpu->reg_fields_dec;
 	u32 width = MB_WIDTH(ctx->src_fmt.width);
 	u32 height = MB_HEIGHT(ctx->src_fmt.height);
-	u32 reg;
+	u32 reg, stride;
 
 	regmap_field_write(fields->dec_axi_wr_id, 0x0);
 
+	if (vpu->core_hw_dec_rev == HANTRO_VC8000_REV) {
+		/* stride should be computed in hantro_try_fmt() and set here */
+		stride = width * 4 * 16;
+		regmap_field_write(fields->dec_out_y_stride, stride);
+		regmap_field_write(fields->dec_out_c_stride, stride);
+
+		/* on VC8KD the pic sizes changed from MB to CBS */
+		regmap_field_write(fields->dec_min_cb_size, 3);
+		regmap_field_write(fields->dec_max_cb_size, 4);
+		width <<= 1;
+		height <<= 1;
+	}
+
 	/* Decoder control register 0. */
 	reg = 0;
 	if (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD)
@@ -230,7 +245,7 @@ static void set_ref(struct hantro_ctx *ctx)
 	/* Set up addresses of DPB buffers. */
 	for (i = 0; i < HANTRO_H264_DPB_SIZE; i++) {
 		dma_addr_t dma_addr = hantro_h264_get_ref_buf(ctx, i);
-		vdpu_write_relaxed(vpu, dma_addr, G1_REG_ADDR_REF(i));
+		vdpu_write_relaxed(vpu, dma_addr, REG_ADDR_REF(i));
 	}
 }
 
@@ -309,7 +324,15 @@ void hantro_g1_h264_dec_run(struct hantro_ctx *ctx)
 			G1_REG_CONFIG_DEC_STRSWAP32_E;
 		vdpu_write_relaxed(vpu, reg, G1_REG_CONFIG);
 		break;
-	/* TODO: add VC8000 support */
+	case HANTRO_VC8000_REV:
+		regmap_field_write(fields->dec_ext_timeout_e, 1);
+		regmap_field_write(fields->dec_ext_timeout_cycles, VC8KD_TIMEOUT);
+		regmap_field_write(fields->dec_timeout_e, 1);
+		regmap_field_write(fields->dec_timeout_cycles, VC8KD_TIMEOUT);
+		regmap_field_write(fields->dec_buswidth, 2);
+		regmap_field_write(fields->dec_tab_swap, 3);
+		regmap_field_write(fields->dec_tiled_mode_lsb, 1);
+		break;
 	}
 
 	regmap_field_write(fields->dec_clk_gate_e, 1);
diff --git a/drivers/staging/media/hantro/hantro_regmap.c b/drivers/staging/media/hantro/hantro_regmap.c
index c0344b0ec8de..0e74ba69034f 100644
--- a/drivers/staging/media/hantro/hantro_regmap.c
+++ b/drivers/staging/media/hantro/hantro_regmap.c
@@ -37,8 +37,13 @@ struct hantro_field_dec {
 	struct reg_field cfg_dec_axi_rd_id;
 	struct reg_field cfg_dec_axi_wr_id;
 	struct reg_field cfg_dec_rlc_mode_e;
+	struct reg_field cfg_dec_strm_swap;
+	struct reg_field cfg_dec_pic_swap;
+	struct reg_field cfg_dec_dirmv_swap;
 	struct reg_field cfg_dec_mode;
+	struct reg_field cfg_dec_buffer_empty_int_e;
 	struct reg_field cfg_dec_max_burst;
+	struct reg_field cfg_dec_buswidth;
 	struct reg_field cfg_dec_apf_threshold;
 	struct reg_field cfg_dec_stream_len;
 	struct reg_field cfg_dec_init_qp;
@@ -51,9 +56,18 @@ struct hantro_field_dec {
 	struct reg_field cfg_dec_addr_dst;
 	struct reg_field cfg_dec_ilace_mode;
 	struct reg_field cfg_dec_addr_qtable;
+	struct reg_field cfg_dec_max_cb_size;
+	struct reg_field cfg_dec_min_cb_size;
+	struct reg_field cfg_dec_out_y_stride;
+	struct reg_field cfg_dec_out_c_stride;
 	struct reg_field cfg_dec_addr_dir_mv;
 	struct reg_field cfg_dec_tiled_mode_lsb;
 	struct reg_field cfg_dec_clk_gate_e;
+	struct reg_field cfg_dec_tab_swap;
+	struct reg_field cfg_dec_ext_timeout_cycles;
+	struct reg_field cfg_dec_ext_timeout_e;
+	struct reg_field cfg_dec_timeout_cycles;
+	struct reg_field cfg_dec_timeout_e;
 
 	struct reg_field cfg_pp_pipeline_en;
 	struct reg_field cfg_pp_max_burst;
@@ -132,6 +146,43 @@ static const struct hantro_field_dec g1_field = {
 	.cfg_pp_scale_inv_hratio =	REG_FIELD(SWREG(81), 0, 15),
 };
 
+static const struct hantro_field_dec vc8000d_field = {
+	.cfg_dec_tiled_mode_lsb	=	REG_FIELD(SWREG(2), 7, 7),
+	.cfg_dec_clk_gate_e =		REG_FIELD(SWREG(2), 10, 10),
+	.cfg_dec_tab_swap =		REG_FIELD(SWREG(2), 12, 15),
+	.cfg_dec_axi_rd_id =		REG_FIELD(SWREG(60), 0, 15),
+	.cfg_dec_axi_wr_id =		REG_FIELD(SWREG(60), 16, 31),
+	.cfg_dec_rlc_mode_e =		REG_FIELD(SWREG(3), 24, 24),
+	.cfg_dec_strm_swap =		REG_FIELD(SWREG(2), 28, 31),
+	.cfg_dec_pic_swap =		REG_FIELD(SWREG(2), 24, 27),
+	.cfg_dec_dirmv_swap =		REG_FIELD(SWREG(2), 20, 23),
+	.cfg_dec_mode =			REG_FIELD(SWREG(3), 27, 31),
+	.cfg_dec_buffer_empty_int_e =	REG_FIELD(SWREG(3), 2, 2),
+	.cfg_dec_max_burst =		REG_FIELD(SWREG(58), 0, 7),
+	.cfg_dec_buswidth =		REG_FIELD(SWREG(58), 8, 10),
+	.cfg_dec_apf_threshold =	REG_FIELD(SWREG(55), 0, 15),
+	.cfg_dec_stream_len =		REG_FIELD(SWREG(6), 0, 31),
+	.cfg_dec_init_qp =		REG_FIELD(SWREG(13), 24, 30),
+	.cfg_dec_start_code_e =		REG_FIELD(SWREG(13), 31, 31),
+	.cfg_dec_pic_width =		REG_FIELD(SWREG(4), 19, 31),
+	.cfg_dec_pic_height =		REG_FIELD(SWREG(4), 6, 18),
+	.cfg_dec_num_ref_frames =	REG_FIELD(SWREG(4), 0, 4),
+	.cfg_dec_scaling_list_e =	REG_FIELD(SWREG(5), 24, 24),
+	.cfg_dec_addr_str =		REG_FIELD(SWREG(169), 0, 31),
+	.cfg_dec_addr_dst =		REG_FIELD(SWREG(65), 0, 31),
+	.cfg_dec_ilace_mode =		REG_FIELD(SWREG(65), 1, 1),
+	.cfg_dec_addr_qtable =		REG_FIELD(SWREG(175), 0, 31),
+	.cfg_dec_addr_dir_mv =		REG_FIELD(SWREG(133), 0, 31),
+	.cfg_dec_max_cb_size =		REG_FIELD(SWREG(12), 10, 12),
+	.cfg_dec_min_cb_size =		REG_FIELD(SWREG(12), 13, 15),
+	.cfg_dec_out_y_stride =		REG_FIELD(SWREG(314), 16, 31),
+	.cfg_dec_out_c_stride =		REG_FIELD(SWREG(314), 0, 15),
+	.cfg_dec_ext_timeout_cycles =	REG_FIELD(SWREG(318), 0, 30),
+	.cfg_dec_ext_timeout_e =	REG_FIELD(SWREG(318), 31, 31),
+	.cfg_dec_timeout_cycles =	REG_FIELD(SWREG(319), 0, 30),
+	.cfg_dec_timeout_e =		REG_FIELD(SWREG(319), 31, 31),
+};
+
 #define INIT_FIELD_CFG(f, codec, conf) ({					\
 		vpu->reg_fields_##codec->(f) = devm_regmap_field_alloc(vpu->dev,\
 						     vpu->regs_##codec,		\
@@ -156,8 +207,13 @@ static int hantro_regmap_fields_init_dec(struct hantro_dev *vpu,
 	INIT_DEC_FIELD(dec_axi_wr_id);
 	INIT_DEC_FIELD(dec_axi_rd_id);
 	INIT_DEC_FIELD(dec_rlc_mode_e);
+	INIT_DEC_FIELD(dec_strm_swap);
+	INIT_DEC_FIELD(dec_pic_swap);
+	INIT_DEC_FIELD(dec_dirmv_swap);
 	INIT_DEC_FIELD(dec_mode);
+	INIT_DEC_FIELD(dec_buffer_empty_int_e);
 	INIT_DEC_FIELD(dec_max_burst);
+	INIT_DEC_FIELD(dec_buswidth);
 	INIT_DEC_FIELD(dec_apf_threshold);
 	INIT_DEC_FIELD(dec_stream_len);
 	INIT_DEC_FIELD(dec_init_qp);
@@ -170,9 +226,18 @@ static int hantro_regmap_fields_init_dec(struct hantro_dev *vpu,
 	INIT_DEC_FIELD(dec_addr_dst);
 	INIT_DEC_FIELD(dec_ilace_mode);
 	INIT_DEC_FIELD(dec_addr_qtable);
+	INIT_DEC_FIELD(dec_max_cb_size);
+	INIT_DEC_FIELD(dec_min_cb_size);
+	INIT_DEC_FIELD(dec_out_y_stride);
+	INIT_DEC_FIELD(dec_out_c_stride);
 	INIT_DEC_FIELD(dec_addr_dir_mv);
 	INIT_DEC_FIELD(dec_tiled_mode_lsb);
 	INIT_DEC_FIELD(dec_clk_gate_e);
+	INIT_DEC_FIELD(dec_tab_swap);
+	INIT_DEC_FIELD(dec_ext_timeout_cycles);
+	INIT_DEC_FIELD(dec_ext_timeout_e);
+	INIT_DEC_FIELD(dec_timeout_cycles);
+	INIT_DEC_FIELD(dec_timeout_e);
 
 	/* Post-processor */
 	INIT_DEC_FIELD(pp_pipeline_en);
@@ -275,6 +340,10 @@ int hantro_regmap_init_dec(struct hantro_dev *vpu)
 		hantro_regmap_dec.max_register = 0x1D8;
 		field = &g1_field;
 		break;
+	case HANTRO_VC8000_REV:
+		hantro_regmap_dec.max_register = 0x554;
+		field = &vc8000d_field;
+		break;
 	default:
 		dev_err(vpu->dev, "Decoder revision 0x%x not supported by driver.\n",
 			vpu->core_hw_dec_rev);
diff --git a/drivers/staging/media/hantro/hantro_regmap.h b/drivers/staging/media/hantro/hantro_regmap.h
index 1e6e3b2478ae..8ec0020f40c3 100644
--- a/drivers/staging/media/hantro/hantro_regmap.h
+++ b/drivers/staging/media/hantro/hantro_regmap.h
@@ -10,16 +10,29 @@
 #define HANTRO_REGMAP_H_
 
 #define HANTRO_G1_REV		0x6731
+#define HANTRO_VC8000_REV	0x8001
 
 #define SWREG(nr)		((nr) << 2)
 
+#define SWREG_ITER_G1(n, i)	(SWREG(n) + ((i) << 2))
+#define SWREG_ITER_VC8000(n, i)	(SWREG(n) + ((i) << 3))
+
+#define REG_ADDR_REF(i)		(vpu->core_hw_dec_rev == HANTRO_G1_REV ? \
+				 SWREG_ITER_G1(14, i) : \
+				 SWREG_ITER_VC8000(67, i))
+
 struct hantro_regmap_fields_dec {
 	/* Decoder */
 	struct regmap_field *dec_axi_rd_id;
 	struct regmap_field *dec_axi_wr_id;
 	struct regmap_field *dec_max_burst;
 	struct regmap_field *dec_rlc_mode_e;
+	struct regmap_field *dec_strm_swap;
+	struct regmap_field *dec_pic_swap;
+	struct regmap_field *dec_dirmv_swap;
 	struct regmap_field *dec_mode;
+	struct regmap_field *dec_buffer_empty_int_e;
+	struct regmap_field *dec_buswidth;
 	struct regmap_field *dec_apf_threshold;
 	struct regmap_field *dec_stream_len;
 	struct regmap_field *dec_init_qp;
@@ -32,9 +45,18 @@ struct hantro_regmap_fields_dec {
 	struct regmap_field *dec_addr_dst;
 	struct regmap_field *dec_ilace_mode;
 	struct regmap_field *dec_addr_qtable;
+	struct regmap_field *dec_max_cb_size;
+	struct regmap_field *dec_min_cb_size;
+	struct regmap_field *dec_out_y_stride;
+	struct regmap_field *dec_out_c_stride;
 	struct regmap_field *dec_addr_dir_mv;
 	struct regmap_field *dec_tiled_mode_lsb;
 	struct regmap_field *dec_clk_gate_e;
+	struct regmap_field *dec_tab_swap;
+	struct regmap_field *dec_ext_timeout_cycles;
+	struct regmap_field *dec_ext_timeout_e;
+	struct regmap_field *dec_timeout_cycles;
+	struct regmap_field *dec_timeout_e;
 
 	/* Post-processor */
 	struct regmap_field *pp_pipeline_en;
-- 
2.28.0

