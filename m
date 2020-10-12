Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 212FC28C396
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 22:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731876AbgJLU7m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 16:59:42 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50028 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731756AbgJLU7J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 16:59:09 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id 8D0221F44C5E
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
Subject: [PATCH 18/18] media: hantro: document encoder reg fields
Date:   Mon, 12 Oct 2020 23:59:57 +0300
Message-Id: <20201012205957.889185-19-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012205957.889185-1-adrian.ratiu@collabora.com>
References: <20201012205957.889185-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Even though these fields are currently unused it is still a good
idea to have them documented for future encoder implementations.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 drivers/staging/media/hantro/hantro_regmap.c | 580 ++++++++++++++++++-
 drivers/staging/media/hantro/hantro_regmap.h | 177 +++++-
 2 files changed, 754 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_regmap.c b/drivers/staging/media/hantro/hantro_regmap.c
index 62280b873859..f15884f29ed6 100644
--- a/drivers/staging/media/hantro/hantro_regmap.c
+++ b/drivers/staging/media/hantro/hantro_regmap.c
@@ -115,7 +115,394 @@ struct hantro_field_dec {
 };
 
 struct hantro_field_enc {
-	/* TODO: populate encoder fields */
+	struct reg_field cfg_enc_timeout_e;
+	struct reg_field cfg_enc_timeout_cycles;
+	struct reg_field cfg_enc_mode;
+	struct reg_field cfg_enc_stream_mode;
+	struct reg_field cfg_enc_enable;
+	struct reg_field cfg_enc_pic_type;
+	struct reg_field cfg_enc_pic_width;
+	struct reg_field cfg_enc_pic_height;
+	struct reg_field cfg_enc_burst_len;
+	struct reg_field cfg_enc_clk_gate_en;
+	struct reg_field cfg_enc_TODO_swap;
+	struct reg_field cfg_enc_stream_buf_limit;
+	struct reg_field cfg_enc_row_len;
+	struct reg_field cfg_enc_overfill_r;
+	struct reg_field cfg_enc_overfill_b;
+	struct reg_field cfg_enc_src_format;
+	struct reg_field cfg_enc_init_qp;
+	struct reg_field cfg_enc_chroma_qp_offset;
+	struct reg_field cfg_enc_idr_pic_id;
+	struct reg_field cfg_enc_nal_ref_idc;
+	struct reg_field cfg_enc_pps_id;
+	struct reg_field cfg_enc_nal_unit_type;
+	struct reg_field cfg_enc_frame_num;
+	struct reg_field cfg_enc_min_cb_size;
+	struct reg_field cfg_enc_max_cb_size;
+	struct reg_field cfg_enc_max_trb_size;
+	struct reg_field cfg_enc_min_trb_size;
+	struct reg_field cfg_enc_deblocking_filter_dis;
+	struct reg_field cfg_enc_slice_deblocking_filter_override;
+	struct reg_field cfg_enc_slice_deblocking_filter_dis;
+	struct reg_field cfg_enc_pps_deblocking_filter_override;
+	struct reg_field cfg_enc_slice_alpha_div2;
+	struct reg_field cfg_enc_slice_beta_div2;
+	struct reg_field cfg_enc_slice_size;
+	struct reg_field cfg_enc_nal_size_write;
+	struct reg_field cfg_enc_cabac_init_idc;
+	struct reg_field cfg_enc_pic_qp;
+	struct reg_field cfg_enc_qp_frac;
+	struct reg_field cfg_enc_entropy_coding_mode;
+	struct reg_field cfg_enc_axi_r_outstanding_num;
+	struct reg_field cfg_enc_axi_w_outstanding_num;
+	struct reg_field cfg_enc_trans8x8_mode_en;
+	struct reg_field cfg_enc_inter4x4_mode;
+	struct reg_field cfg_enc_quarter_pixmv_dis;
+	struct reg_field cfg_enc_addr_cabac;
+	struct reg_field cfg_enc_addr_str;
+	struct reg_field cfg_enc_addr_size_table;
+	struct reg_field cfg_enc_addr_rec_luma;
+	struct reg_field cfg_enc_addr_rec_luma_4n;
+	struct reg_field cfg_enc_addr_ref_luma_l0_4n0;
+	struct reg_field cfg_enc_addr_rec_chroma;
+	struct reg_field cfg_enc_addr_ref_luma;
+	struct reg_field cfg_enc_addr_ref_chroma;
+	struct reg_field cfg_enc_addr_src_y;
+	struct reg_field cfg_enc_addr_src_cb;
+	struct reg_field cfg_enc_addr_src_cr;
+	struct reg_field cfg_enc_log2_max_pic_order_cnt_lsb;
+	struct reg_field cfg_enc_log2_max_frame_num;
+	struct reg_field cfg_enc_pic_order_cnt_type;
+	struct reg_field cfg_enc_l0_delta_framenum0;
+	struct reg_field cfg_enc_l0_used_by_next_pic0;
+	struct reg_field cfg_enc_l0_used_by_next_pic1;
+
+	struct reg_field cfg_enc_lu_stride;
+	struct reg_field cfg_enc_cr_stride;
+	struct reg_field cfg_enc_ref_lu_stride;
+	struct reg_field cfg_enc_ref_ds_lu_stride;
+	struct reg_field cfg_enc_ref_cr_stride;
+	struct reg_field cfg_enc_ipcm2_left;
+	struct reg_field cfg_enc_ipcm2_right;
+	struct reg_field cfg_enc_ipcm2_top;
+	struct reg_field cfg_enc_ipcm2_bottom;
+
+	struct reg_field cfg_enc_slice_qp_offset;
+	struct reg_field cfg_enc_qp_min;
+	struct reg_field cfg_enc_qp_max;
+
+	struct reg_field cfg_enc_lambda_satd_me_0;
+	struct reg_field cfg_enc_lambda_satd_me_1;
+	struct reg_field cfg_enc_lambda_satd_me_2;
+	struct reg_field cfg_enc_lambda_satd_me_3;
+	struct reg_field cfg_enc_lambda_satd_me_4;
+	struct reg_field cfg_enc_lambda_satd_me_5;
+	struct reg_field cfg_enc_lambda_satd_me_6;
+	struct reg_field cfg_enc_lambda_satd_me_7;
+	struct reg_field cfg_enc_lambda_satd_me_8;
+	struct reg_field cfg_enc_lambda_satd_me_9;
+	struct reg_field cfg_enc_lambda_satd_me_10;
+	struct reg_field cfg_enc_lambda_satd_me_11;
+	struct reg_field cfg_enc_lambda_satd_me_12;
+	struct reg_field cfg_enc_lambda_satd_me_13;
+	struct reg_field cfg_enc_lambda_satd_me_14;
+	struct reg_field cfg_enc_lambda_satd_me_15;
+	struct reg_field cfg_enc_lambda_satd_me_16;
+	struct reg_field cfg_enc_lambda_satd_me_17;
+	struct reg_field cfg_enc_lambda_satd_me_18;
+	struct reg_field cfg_enc_lambda_satd_me_19;
+	struct reg_field cfg_enc_lambda_satd_me_20;
+	struct reg_field cfg_enc_lambda_satd_me_21;
+	struct reg_field cfg_enc_lambda_satd_me_22;
+	struct reg_field cfg_enc_lambda_satd_me_23;
+	struct reg_field cfg_enc_lambda_satd_me_24;
+	struct reg_field cfg_enc_lambda_satd_me_25;
+	struct reg_field cfg_enc_lambda_satd_me_26;
+	struct reg_field cfg_enc_lambda_satd_me_27;
+	struct reg_field cfg_enc_lambda_satd_me_28;
+	struct reg_field cfg_enc_lambda_satd_me_29;
+	struct reg_field cfg_enc_lambda_satd_me_30;
+	struct reg_field cfg_enc_lambda_satd_me_31;
+
+	struct reg_field cfg_enc_lambda_satd_0;
+	struct reg_field cfg_enc_lambda_satd_1;
+	struct reg_field cfg_enc_lambda_satd_2;
+	struct reg_field cfg_enc_lambda_satd_3;
+	struct reg_field cfg_enc_lambda_satd_4;
+	struct reg_field cfg_enc_lambda_satd_5;
+	struct reg_field cfg_enc_lambda_satd_6;
+	struct reg_field cfg_enc_lambda_satd_7;
+	struct reg_field cfg_enc_lambda_satd_8;
+	struct reg_field cfg_enc_lambda_satd_9;
+	struct reg_field cfg_enc_lambda_satd_10;
+	struct reg_field cfg_enc_lambda_satd_11;
+	struct reg_field cfg_enc_lambda_satd_12;
+	struct reg_field cfg_enc_lambda_satd_13;
+	struct reg_field cfg_enc_lambda_satd_14;
+	struct reg_field cfg_enc_lambda_satd_15;
+	struct reg_field cfg_enc_lambda_satd_16;
+	struct reg_field cfg_enc_lambda_satd_17;
+	struct reg_field cfg_enc_lambda_satd_18;
+	struct reg_field cfg_enc_lambda_satd_19;
+	struct reg_field cfg_enc_lambda_satd_20;
+	struct reg_field cfg_enc_lambda_satd_21;
+	struct reg_field cfg_enc_lambda_satd_22;
+	struct reg_field cfg_enc_lambda_satd_23;
+	struct reg_field cfg_enc_lambda_satd_24;
+	struct reg_field cfg_enc_lambda_satd_25;
+	struct reg_field cfg_enc_lambda_satd_26;
+	struct reg_field cfg_enc_lambda_satd_27;
+	struct reg_field cfg_enc_lambda_satd_28;
+	struct reg_field cfg_enc_lambda_satd_29;
+	struct reg_field cfg_enc_lambda_satd_30;
+	struct reg_field cfg_enc_lambda_satd_31;
+
+	struct reg_field cfg_enc_lambda_sse_me_0;
+	struct reg_field cfg_enc_lambda_sse_me_1;
+	struct reg_field cfg_enc_lambda_sse_me_2;
+	struct reg_field cfg_enc_lambda_sse_me_3;
+	struct reg_field cfg_enc_lambda_sse_me_4;
+	struct reg_field cfg_enc_lambda_sse_me_5;
+	struct reg_field cfg_enc_lambda_sse_me_6;
+	struct reg_field cfg_enc_lambda_sse_me_7;
+	struct reg_field cfg_enc_lambda_sse_me_8;
+	struct reg_field cfg_enc_lambda_sse_me_9;
+	struct reg_field cfg_enc_lambda_sse_me_10;
+	struct reg_field cfg_enc_lambda_sse_me_11;
+	struct reg_field cfg_enc_lambda_sse_me_12;
+	struct reg_field cfg_enc_lambda_sse_me_13;
+	struct reg_field cfg_enc_lambda_sse_me_14;
+	struct reg_field cfg_enc_lambda_sse_me_15;
+	struct reg_field cfg_enc_lambda_sse_me_16;
+	struct reg_field cfg_enc_lambda_sse_me_17;
+	struct reg_field cfg_enc_lambda_sse_me_18;
+	struct reg_field cfg_enc_lambda_sse_me_19;
+	struct reg_field cfg_enc_lambda_sse_me_20;
+	struct reg_field cfg_enc_lambda_sse_me_21;
+	struct reg_field cfg_enc_lambda_sse_me_22;
+	struct reg_field cfg_enc_lambda_sse_me_23;
+	struct reg_field cfg_enc_lambda_sse_me_24;
+	struct reg_field cfg_enc_lambda_sse_me_25;
+	struct reg_field cfg_enc_lambda_sse_me_26;
+	struct reg_field cfg_enc_lambda_sse_me_27;
+	struct reg_field cfg_enc_lambda_sse_me_28;
+	struct reg_field cfg_enc_lambda_sse_me_29;
+	struct reg_field cfg_enc_lambda_sse_me_30;
+	struct reg_field cfg_enc_lambda_sse_me_31;
+};
+
+static const struct hantro_field_enc h1_field = {
+	.cfg_enc_mode =			REG_FIELD(SWREG(14), 1, 2),
+	.cfg_enc_enable =		REG_FIELD(SWREG(14), 0, 0),
+	.cfg_enc_pic_type =		REG_FIELD(SWREG(14), 3, 4),
+	.cfg_enc_pic_width =		REG_FIELD(SWREG(14), 19, 27),
+	.cfg_enc_pic_height =		REG_FIELD(SWREG(14), 10, 18),
+	.cfg_enc_nal_size_write =	REG_FIELD(SWREG(14), 29, 29),
+	.cfg_enc_stream_mode =		REG_FIELD(SWREG(18), 16, 16),
+	.cfg_enc_burst_len =		REG_FIELD(SWREG(2), 8, 13),
+	.cfg_enc_clk_gate_en =		REG_FIELD(SWREG(2), 4, 4),
+	.cfg_enc_stream_buf_limit =	REG_FIELD(SWREG(48), 0, 31),
+	.cfg_enc_row_len =		REG_FIELD(SWREG(15), 12, 25),
+	.cfg_enc_overfill_r =		REG_FIELD(SWREG(15), 10, 11),
+	.cfg_enc_overfill_b =		REG_FIELD(SWREG(15), 6, 9),
+	.cfg_enc_src_format =		REG_FIELD(SWREG(15), 2, 5),
+	.cfg_enc_init_qp =		REG_FIELD(SWREG(16), 26, 31),
+	.cfg_enc_slice_alpha_div2 =	REG_FIELD(SWREG(16), 22, 25),
+	.cfg_enc_slice_beta_div2 =	REG_FIELD(SWREG(16), 18, 21),
+	.cfg_enc_idr_pic_id =		REG_FIELD(SWREG(16), 1, 4),
+	.cfg_enc_pps_id =		REG_FIELD(SWREG(17), 24, 31),
+	.cfg_enc_frame_num =		REG_FIELD(SWREG(17), 0, 15),
+	.cfg_enc_chroma_qp_offset =	REG_FIELD(SWREG(16), 13, 17),
+	.cfg_enc_deblocking_filter_dis = REG_FIELD(SWREG(18), 30, 31),
+	.cfg_enc_slice_size =		REG_FIELD(SWREG(18), 23, 29),
+	.cfg_enc_cabac_init_idc =	REG_FIELD(SWREG(18), 19, 20),
+	.cfg_enc_entropy_coding_mode =	REG_FIELD(SWREG(18), 18, 18),
+	.cfg_enc_trans8x8_mode_en =	REG_FIELD(SWREG(18), 21, 21),
+	.cfg_enc_inter4x4_mode =	REG_FIELD(SWREG(18), 17, 17),
+	.cfg_enc_quarter_pixmv_dis =	REG_FIELD(SWREG(18), 22, 22),
+	.cfg_enc_addr_str =		REG_FIELD(SWREG(5), 0, 31),
+	.cfg_enc_addr_size_table =	REG_FIELD(SWREG(6), 0, 31),
+	.cfg_enc_addr_rec_luma =	REG_FIELD(SWREG(9), 0, 31),
+	.cfg_enc_addr_rec_chroma =	REG_FIELD(SWREG(10), 0, 31),
+	.cfg_enc_addr_ref_luma =	REG_FIELD(SWREG(7), 0, 31),
+	.cfg_enc_addr_ref_chroma =	REG_FIELD(SWREG(8), 0, 31),
+	.cfg_enc_addr_src_y =		REG_FIELD(SWREG(11), 0, 31),
+	.cfg_enc_addr_src_cb =		REG_FIELD(SWREG(12), 0, 31),
+	.cfg_enc_addr_src_cr =		REG_FIELD(SWREG(13), 0, 31),
+};
+
+static const struct hantro_field_enc vc8000e_field = {
+	.cfg_enc_burst_len =		REG_FIELD(SWREG(81), 24, 31),
+	.cfg_enc_timeout_e =		REG_FIELD(SWREG(81), 23, 23),
+	.cfg_enc_timeout_cycles =	REG_FIELD(SWREG(81), 0, 22),
+	.cfg_enc_mode =			REG_FIELD(SWREG(4), 29, 31),
+	.cfg_enc_stream_mode =		REG_FIELD(SWREG(4), 18, 18),
+	.cfg_enc_enable =		REG_FIELD(SWREG(5), 0, 0),
+	.cfg_enc_pic_type =		REG_FIELD(SWREG(5), 1, 2),
+	.cfg_enc_pic_width =		REG_FIELD(SWREG(5), 22, 31),
+	.cfg_enc_pic_height =		REG_FIELD(SWREG(5), 11, 21),
+	.cfg_enc_stream_buf_limit =	REG_FIELD(SWREG(9), 0, 31),
+	.cfg_enc_row_len =		REG_FIELD(SWREG(38), 6, 19),
+	.cfg_enc_overfill_r =		REG_FIELD(SWREG(38), 4, 5),
+	.cfg_enc_overfill_b =		REG_FIELD(SWREG(38), 1, 3),
+	.cfg_enc_src_format =		REG_FIELD(SWREG(38), 28, 31),
+	.cfg_enc_init_qp =		REG_FIELD(SWREG(7), 26, 31),
+	.cfg_enc_idr_pic_id =		REG_FIELD(SWREG(193), 2, 2),
+	.cfg_enc_nal_ref_idc =		REG_FIELD(SWREG(193), 3, 3),
+	.cfg_enc_pic_qp =		REG_FIELD(SWREG(7), 8, 13),
+	.cfg_enc_qp_frac =		REG_FIELD(SWREG(182), 16, 31),
+	.cfg_enc_nal_unit_type =	REG_FIELD(SWREG(191), 26, 31),
+	.cfg_enc_pps_id =		REG_FIELD(SWREG(191), 17, 22),
+	.cfg_enc_frame_num =		REG_FIELD(SWREG(192), 0, 31),
+	.cfg_enc_min_cb_size =		REG_FIELD(SWREG(4), 25, 26),
+	.cfg_enc_max_cb_size =		REG_FIELD(SWREG(4), 23, 24),
+	.cfg_enc_min_trb_size =		REG_FIELD(SWREG(4), 21, 22),
+	.cfg_enc_max_trb_size =		REG_FIELD(SWREG(4), 19, 20),
+	.cfg_enc_chroma_qp_offset =	REG_FIELD(SWREG(4), 13, 17),
+	.cfg_enc_slice_deblocking_filter_dis = REG_FIELD(SWREG(6), 15, 15),
+	.cfg_enc_pps_deblocking_filter_override = REG_FIELD(SWREG(5), 9, 9),
+	.cfg_enc_slice_deblocking_filter_override = REG_FIELD(SWREG(5), 8, 8),
+	.cfg_enc_slice_alpha_div2 =	REG_FIELD(SWREG(6), 11, 14),
+	.cfg_enc_slice_beta_div2 =	REG_FIELD(SWREG(6), 7, 10),
+	.cfg_enc_slice_size =		REG_FIELD(SWREG(6), 25, 31),
+	.cfg_enc_nal_size_write =	REG_FIELD(SWREG(6), 1, 1),
+	.cfg_enc_cabac_init_idc =	REG_FIELD(SWREG(7), 25, 25),
+	.cfg_enc_entropy_coding_mode =	REG_FIELD(SWREG(193), 0, 0),
+	.cfg_enc_axi_r_outstanding_num = REG_FIELD(SWREG(261), 4, 11),
+	.cfg_enc_axi_w_outstanding_num = REG_FIELD(SWREG(246), 6, 13),
+	.cfg_enc_trans8x8_mode_en =	REG_FIELD(SWREG(193), 1, 1),
+	.cfg_enc_addr_str =		REG_FIELD(SWREG(8), 0, 31),
+	.cfg_enc_addr_size_table =	REG_FIELD(SWREG(10), 0, 31),
+	.cfg_enc_addr_rec_luma_4n =	REG_FIELD(SWREG(72), 0, 31),
+	.cfg_enc_addr_ref_luma_l0_4n0 =	REG_FIELD(SWREG(74), 0, 31),
+	.cfg_enc_addr_rec_luma =	REG_FIELD(SWREG(15), 0, 31),
+	.cfg_enc_addr_rec_chroma =	REG_FIELD(SWREG(16), 0, 31),
+	.cfg_enc_addr_ref_luma =	REG_FIELD(SWREG(18), 0, 31),
+	.cfg_enc_addr_ref_chroma =	REG_FIELD(SWREG(19), 0, 31),
+	.cfg_enc_addr_src_y =		REG_FIELD(SWREG(12), 0, 31),
+	.cfg_enc_addr_src_cb =		REG_FIELD(SWREG(13), 0, 31),
+	.cfg_enc_addr_src_cr =		REG_FIELD(SWREG(14), 0, 31),
+	.cfg_enc_log2_max_pic_order_cnt_lsb = REG_FIELD(SWREG(277), 27, 31),
+	.cfg_enc_log2_max_frame_num =	REG_FIELD(SWREG(277), 22, 26),
+	.cfg_enc_pic_order_cnt_type =	REG_FIELD(SWREG(277), 20, 21),
+	.cfg_enc_l0_delta_framenum0 =	REG_FIELD(SWREG(193), 21, 31),
+	.cfg_enc_l0_used_by_next_pic0 = REG_FIELD(SWREG(193), 20, 20),
+	.cfg_enc_l0_used_by_next_pic1 = REG_FIELD(SWREG(193), 8, 8),
+
+	.cfg_enc_lu_stride =		REG_FIELD(SWREG(210), 12, 31),
+	.cfg_enc_cr_stride =		REG_FIELD(SWREG(211), 12, 31),
+	.cfg_enc_ref_lu_stride =	REG_FIELD(SWREG(212), 12, 31),
+	.cfg_enc_ref_cr_stride =	REG_FIELD(SWREG(237), 12, 31),
+	.cfg_enc_ref_ds_lu_stride =	REG_FIELD(SWREG(213), 14, 31),
+
+	.cfg_enc_ipcm2_left =		REG_FIELD(SWREG(210), 3, 11),
+	.cfg_enc_ipcm2_right =		REG_FIELD(SWREG(211), 3, 11),
+	.cfg_enc_ipcm2_top =		REG_FIELD(SWREG(212), 3, 11),
+	.cfg_enc_ipcm2_bottom =		REG_FIELD(SWREG(213), 5, 13),
+
+	.cfg_enc_slice_qp_offset =	REG_FIELD(SWREG(170), 5, 10),
+	.cfg_enc_qp_min =		REG_FIELD(SWREG(172), 5, 10),
+	.cfg_enc_qp_max =		REG_FIELD(SWREG(173), 5, 10),
+
+	.cfg_enc_lambda_satd_me_0 =	REG_FIELD(SWREG(28), 19, 31),
+	.cfg_enc_lambda_satd_me_1 =	REG_FIELD(SWREG(28), 6,  18),
+	.cfg_enc_lambda_satd_me_2 =	REG_FIELD(SWREG(29), 19, 31),
+	.cfg_enc_lambda_satd_me_3 =	REG_FIELD(SWREG(29), 6,  18),
+	.cfg_enc_lambda_satd_me_4 =	REG_FIELD(SWREG(30), 19, 31),
+	.cfg_enc_lambda_satd_me_5 =	REG_FIELD(SWREG(30), 6,  18),
+	.cfg_enc_lambda_satd_me_6 =	REG_FIELD(SWREG(31), 19, 31),
+	.cfg_enc_lambda_satd_me_7 =	REG_FIELD(SWREG(31), 6,  18),
+	.cfg_enc_lambda_satd_me_8 =	REG_FIELD(SWREG(32), 19, 31),
+	.cfg_enc_lambda_satd_me_9 =	REG_FIELD(SWREG(32), 6,  18),
+	.cfg_enc_lambda_satd_me_10 =	REG_FIELD(SWREG(33), 19, 31),
+	.cfg_enc_lambda_satd_me_11 =	REG_FIELD(SWREG(33), 6,  18),
+	.cfg_enc_lambda_satd_me_12 =	REG_FIELD(SWREG(34), 19, 31),
+	.cfg_enc_lambda_satd_me_13 =	REG_FIELD(SWREG(34), 6,  18),
+	.cfg_enc_lambda_satd_me_14 =	REG_FIELD(SWREG(78), 19, 31),
+	.cfg_enc_lambda_satd_me_15 =	REG_FIELD(SWREG(78), 6,  18),
+	.cfg_enc_lambda_satd_me_16 =	REG_FIELD(SWREG(150), 19, 31),
+	.cfg_enc_lambda_satd_me_17 =	REG_FIELD(SWREG(150), 6,  18),
+	.cfg_enc_lambda_satd_me_18 =	REG_FIELD(SWREG(151), 19, 31),
+	.cfg_enc_lambda_satd_me_19 =	REG_FIELD(SWREG(151), 6,  18),
+	.cfg_enc_lambda_satd_me_20 =	REG_FIELD(SWREG(152), 19, 31),
+	.cfg_enc_lambda_satd_me_21 =	REG_FIELD(SWREG(152), 6,  18),
+	.cfg_enc_lambda_satd_me_22 =	REG_FIELD(SWREG(153), 19, 31),
+	.cfg_enc_lambda_satd_me_23 =	REG_FIELD(SWREG(153), 6,  18),
+	.cfg_enc_lambda_satd_me_24 =	REG_FIELD(SWREG(154), 19, 31),
+	.cfg_enc_lambda_satd_me_25 =	REG_FIELD(SWREG(154), 6,  18),
+	.cfg_enc_lambda_satd_me_26 =	REG_FIELD(SWREG(155), 19, 31),
+	.cfg_enc_lambda_satd_me_27 =	REG_FIELD(SWREG(155), 6,  18),
+	.cfg_enc_lambda_satd_me_28 =	REG_FIELD(SWREG(156), 19, 31),
+	.cfg_enc_lambda_satd_me_29 =	REG_FIELD(SWREG(156), 6,  18),
+	.cfg_enc_lambda_satd_me_30 =	REG_FIELD(SWREG(157), 19, 31),
+	.cfg_enc_lambda_satd_me_31 =	REG_FIELD(SWREG(157), 6,  18),
+
+	.cfg_enc_lambda_satd_0 =	REG_FIELD(SWREG(125), 18, 31),
+	.cfg_enc_lambda_satd_1 =	REG_FIELD(SWREG(125), 4, 17),
+	.cfg_enc_lambda_satd_2 =	REG_FIELD(SWREG(126), 18, 31),
+	.cfg_enc_lambda_satd_3 =	REG_FIELD(SWREG(126), 4, 17),
+	.cfg_enc_lambda_satd_4 =	REG_FIELD(SWREG(127), 18, 31),
+	.cfg_enc_lambda_satd_5 =	REG_FIELD(SWREG(127), 4, 17),
+	.cfg_enc_lambda_satd_6 =	REG_FIELD(SWREG(128), 18, 31),
+	.cfg_enc_lambda_satd_7 =	REG_FIELD(SWREG(128), 4, 17),
+	.cfg_enc_lambda_satd_8 =	REG_FIELD(SWREG(129), 18, 31),
+	.cfg_enc_lambda_satd_9 =	REG_FIELD(SWREG(129), 4, 17),
+	.cfg_enc_lambda_satd_10 =	REG_FIELD(SWREG(130), 18, 31),
+	.cfg_enc_lambda_satd_11 =	REG_FIELD(SWREG(130), 4, 17),
+	.cfg_enc_lambda_satd_12 =	REG_FIELD(SWREG(131), 18, 31),
+	.cfg_enc_lambda_satd_13 =	REG_FIELD(SWREG(131), 4, 17),
+	.cfg_enc_lambda_satd_14 =	REG_FIELD(SWREG(132), 18, 31),
+	.cfg_enc_lambda_satd_15 =	REG_FIELD(SWREG(132), 4, 17),
+	.cfg_enc_lambda_satd_16 =	REG_FIELD(SWREG(174), 18, 31),
+	.cfg_enc_lambda_satd_17 =	REG_FIELD(SWREG(174), 4, 17),
+	.cfg_enc_lambda_satd_18 =	REG_FIELD(SWREG(175), 18, 31),
+	.cfg_enc_lambda_satd_19 =	REG_FIELD(SWREG(175), 4, 17),
+	.cfg_enc_lambda_satd_20 =	REG_FIELD(SWREG(176), 18, 31),
+	.cfg_enc_lambda_satd_21 =	REG_FIELD(SWREG(176), 4, 17),
+	.cfg_enc_lambda_satd_22 =	REG_FIELD(SWREG(177), 18, 31),
+	.cfg_enc_lambda_satd_23 =	REG_FIELD(SWREG(177), 4, 17),
+	.cfg_enc_lambda_satd_24 =	REG_FIELD(SWREG(178), 18, 31),
+	.cfg_enc_lambda_satd_25 =	REG_FIELD(SWREG(178), 4, 17),
+	.cfg_enc_lambda_satd_26 =	REG_FIELD(SWREG(179), 18, 31),
+	.cfg_enc_lambda_satd_27 =	REG_FIELD(SWREG(179), 4, 17),
+	.cfg_enc_lambda_satd_28 =	REG_FIELD(SWREG(180), 18, 31),
+	.cfg_enc_lambda_satd_29 =	REG_FIELD(SWREG(180), 4, 17),
+	.cfg_enc_lambda_satd_30 =	REG_FIELD(SWREG(181), 18, 31),
+	.cfg_enc_lambda_satd_31 =	REG_FIELD(SWREG(181), 4, 17),
+
+	.cfg_enc_lambda_sse_me_0 =	REG_FIELD(SWREG(79), 11, 31),
+	.cfg_enc_lambda_sse_me_1 =	REG_FIELD(SWREG(122), 11, 31),
+	.cfg_enc_lambda_sse_me_2 =	REG_FIELD(SWREG(123), 11, 31),
+	.cfg_enc_lambda_sse_me_3 =	REG_FIELD(SWREG(124), 11, 31),
+	.cfg_enc_lambda_sse_me_4 =	REG_FIELD(SWREG(138), 11, 31),
+	.cfg_enc_lambda_sse_me_5 =	REG_FIELD(SWREG(139), 11, 31),
+	.cfg_enc_lambda_sse_me_6 =	REG_FIELD(SWREG(140), 11, 31),
+	.cfg_enc_lambda_sse_me_7 =	REG_FIELD(SWREG(141), 11, 31),
+	.cfg_enc_lambda_sse_me_8 =	REG_FIELD(SWREG(142), 11, 31),
+	.cfg_enc_lambda_sse_me_9 =	REG_FIELD(SWREG(143), 11, 31),
+	.cfg_enc_lambda_sse_me_10 =	REG_FIELD(SWREG(144), 11, 31),
+	.cfg_enc_lambda_sse_me_11 =	REG_FIELD(SWREG(145), 11, 31),
+	.cfg_enc_lambda_sse_me_12 =	REG_FIELD(SWREG(146), 11, 31),
+	.cfg_enc_lambda_sse_me_13 =	REG_FIELD(SWREG(147), 11, 31),
+	.cfg_enc_lambda_sse_me_14 =	REG_FIELD(SWREG(148), 11, 31),
+	.cfg_enc_lambda_sse_me_15 =	REG_FIELD(SWREG(149), 11, 31),
+	.cfg_enc_lambda_sse_me_16 =	REG_FIELD(SWREG(158), 11, 31),
+	.cfg_enc_lambda_sse_me_17 =	REG_FIELD(SWREG(159), 11, 31),
+	.cfg_enc_lambda_sse_me_18 =	REG_FIELD(SWREG(160), 11, 31),
+	.cfg_enc_lambda_sse_me_19 =	REG_FIELD(SWREG(161), 11, 31),
+	.cfg_enc_lambda_sse_me_20 =	REG_FIELD(SWREG(162), 11, 31),
+	.cfg_enc_lambda_sse_me_21 =	REG_FIELD(SWREG(163), 11, 31),
+	.cfg_enc_lambda_sse_me_22 =	REG_FIELD(SWREG(164), 11, 31),
+	.cfg_enc_lambda_sse_me_23 =	REG_FIELD(SWREG(165), 11, 31),
+	.cfg_enc_lambda_sse_me_24 =	REG_FIELD(SWREG(166), 11, 31),
+	.cfg_enc_lambda_sse_me_25 =	REG_FIELD(SWREG(167), 11, 31),
+	.cfg_enc_lambda_sse_me_26 =	REG_FIELD(SWREG(168), 11, 31),
+	.cfg_enc_lambda_sse_me_27 =	REG_FIELD(SWREG(169), 11, 31),
+	.cfg_enc_lambda_sse_me_28 =	REG_FIELD(SWREG(170), 11, 31),
+	.cfg_enc_lambda_sse_me_29 =	REG_FIELD(SWREG(171), 11, 31),
+	.cfg_enc_lambda_sse_me_30 =	REG_FIELD(SWREG(172), 11, 31),
+	.cfg_enc_lambda_sse_me_31 =	REG_FIELD(SWREG(173), 11, 31),
 };
 
 static const struct hantro_field_dec g1_field = {
@@ -353,7 +740,181 @@ static int hantro_regmap_fields_init_enc(struct hantro_dev *vpu,
 	if (!vpu->reg_fields_enc)
 		return -ENOMEM;
 
-	/* TODO: add encoder fields */
+	/* Encoder */
+	INIT_ENC_FIELD(enc_timeout_cycles);
+	INIT_ENC_FIELD(enc_timeout_e);
+	INIT_ENC_FIELD(enc_mode);
+	INIT_ENC_FIELD(enc_stream_mode);
+	INIT_ENC_FIELD(enc_enable);
+	INIT_ENC_FIELD(enc_pic_type);
+	INIT_ENC_FIELD(enc_pic_width);
+	INIT_ENC_FIELD(enc_pic_height);
+	INIT_ENC_FIELD(enc_burst_len);
+	INIT_ENC_FIELD(enc_clk_gate_en);
+	INIT_ENC_FIELD(enc_stream_buf_limit);
+	INIT_ENC_FIELD(enc_row_len);
+	INIT_ENC_FIELD(enc_overfill_r);
+	INIT_ENC_FIELD(enc_overfill_b);
+	INIT_ENC_FIELD(enc_src_format);
+	INIT_ENC_FIELD(enc_init_qp);
+	INIT_ENC_FIELD(enc_chroma_qp_offset);
+	INIT_ENC_FIELD(enc_deblocking_filter_dis);
+	INIT_ENC_FIELD(enc_slice_deblocking_filter_dis);
+	INIT_ENC_FIELD(enc_pps_deblocking_filter_override);
+	INIT_ENC_FIELD(enc_slice_deblocking_filter_override);
+	INIT_ENC_FIELD(enc_axi_r_outstanding_num);
+	INIT_ENC_FIELD(enc_axi_w_outstanding_num);
+	INIT_ENC_FIELD(enc_slice_alpha_div2);
+	INIT_ENC_FIELD(enc_slice_beta_div2);
+	INIT_ENC_FIELD(enc_idr_pic_id);
+	INIT_ENC_FIELD(enc_nal_ref_idc);
+	INIT_ENC_FIELD(enc_pps_id);
+	INIT_ENC_FIELD(enc_nal_unit_type);
+	INIT_ENC_FIELD(enc_frame_num);
+	INIT_ENC_FIELD(enc_min_cb_size);
+	INIT_ENC_FIELD(enc_max_cb_size);
+	INIT_ENC_FIELD(enc_min_trb_size);
+	INIT_ENC_FIELD(enc_max_trb_size);
+	INIT_ENC_FIELD(enc_slice_size);
+	INIT_ENC_FIELD(enc_nal_size_write);
+	INIT_ENC_FIELD(enc_cabac_init_idc);
+	INIT_ENC_FIELD(enc_pic_qp);
+	INIT_ENC_FIELD(enc_qp_frac);
+	INIT_ENC_FIELD(enc_entropy_coding_mode);
+	INIT_ENC_FIELD(enc_trans8x8_mode_en);
+	INIT_ENC_FIELD(enc_inter4x4_mode);
+	INIT_ENC_FIELD(enc_quarter_pixmv_dis);
+	INIT_ENC_FIELD(enc_addr_str);
+	INIT_ENC_FIELD(enc_addr_size_table);
+	INIT_ENC_FIELD(enc_addr_rec_luma);
+	INIT_ENC_FIELD(enc_addr_rec_chroma);
+	INIT_ENC_FIELD(enc_addr_rec_luma_4n);
+	INIT_ENC_FIELD(enc_addr_ref_luma_l0_4n0);
+	INIT_ENC_FIELD(enc_addr_ref_luma);
+	INIT_ENC_FIELD(enc_addr_ref_chroma);
+	INIT_ENC_FIELD(enc_addr_src_y);
+	INIT_ENC_FIELD(enc_addr_src_cb);
+	INIT_ENC_FIELD(enc_addr_src_cr);
+	INIT_ENC_FIELD(enc_log2_max_pic_order_cnt_lsb);
+	INIT_ENC_FIELD(enc_log2_max_frame_num);
+	INIT_ENC_FIELD(enc_pic_order_cnt_type);
+	INIT_ENC_FIELD(enc_l0_delta_framenum0);
+	INIT_ENC_FIELD(enc_l0_used_by_next_pic0);
+	INIT_ENC_FIELD(enc_l0_used_by_next_pic1);
+
+	INIT_ENC_FIELD(enc_lu_stride);
+	INIT_ENC_FIELD(enc_cr_stride);
+	INIT_ENC_FIELD(enc_ref_lu_stride);
+	INIT_ENC_FIELD(enc_ref_ds_lu_stride);
+	INIT_ENC_FIELD(enc_ref_cr_stride);
+	INIT_ENC_FIELD(enc_ipcm2_left);
+	INIT_ENC_FIELD(enc_ipcm2_right);
+	INIT_ENC_FIELD(enc_ipcm2_top);
+	INIT_ENC_FIELD(enc_ipcm2_bottom);
+
+	/* Quantization fields */
+	INIT_ENC_FIELD(enc_slice_qp_offset);
+	INIT_ENC_FIELD(enc_qp_min);
+	INIT_ENC_FIELD(enc_qp_max);
+
+	INIT_ENC_FIELD(enc_lambda_satd_me_0);
+	INIT_ENC_FIELD(enc_lambda_satd_me_1);
+	INIT_ENC_FIELD(enc_lambda_satd_me_2);
+	INIT_ENC_FIELD(enc_lambda_satd_me_3);
+	INIT_ENC_FIELD(enc_lambda_satd_me_4);
+	INIT_ENC_FIELD(enc_lambda_satd_me_5);
+	INIT_ENC_FIELD(enc_lambda_satd_me_6);
+	INIT_ENC_FIELD(enc_lambda_satd_me_7);
+	INIT_ENC_FIELD(enc_lambda_satd_me_8);
+	INIT_ENC_FIELD(enc_lambda_satd_me_9);
+	INIT_ENC_FIELD(enc_lambda_satd_me_10);
+	INIT_ENC_FIELD(enc_lambda_satd_me_11);
+	INIT_ENC_FIELD(enc_lambda_satd_me_12);
+	INIT_ENC_FIELD(enc_lambda_satd_me_13);
+	INIT_ENC_FIELD(enc_lambda_satd_me_14);
+	INIT_ENC_FIELD(enc_lambda_satd_me_15);
+	INIT_ENC_FIELD(enc_lambda_satd_me_16);
+	INIT_ENC_FIELD(enc_lambda_satd_me_17);
+	INIT_ENC_FIELD(enc_lambda_satd_me_18);
+	INIT_ENC_FIELD(enc_lambda_satd_me_19);
+	INIT_ENC_FIELD(enc_lambda_satd_me_20);
+	INIT_ENC_FIELD(enc_lambda_satd_me_21);
+	INIT_ENC_FIELD(enc_lambda_satd_me_22);
+	INIT_ENC_FIELD(enc_lambda_satd_me_23);
+	INIT_ENC_FIELD(enc_lambda_satd_me_24);
+	INIT_ENC_FIELD(enc_lambda_satd_me_25);
+	INIT_ENC_FIELD(enc_lambda_satd_me_26);
+	INIT_ENC_FIELD(enc_lambda_satd_me_27);
+	INIT_ENC_FIELD(enc_lambda_satd_me_28);
+	INIT_ENC_FIELD(enc_lambda_satd_me_29);
+	INIT_ENC_FIELD(enc_lambda_satd_me_30);
+	INIT_ENC_FIELD(enc_lambda_satd_me_31);
+
+	INIT_ENC_FIELD(enc_lambda_satd_0);
+	INIT_ENC_FIELD(enc_lambda_satd_1);
+	INIT_ENC_FIELD(enc_lambda_satd_2);
+	INIT_ENC_FIELD(enc_lambda_satd_3);
+	INIT_ENC_FIELD(enc_lambda_satd_4);
+	INIT_ENC_FIELD(enc_lambda_satd_5);
+	INIT_ENC_FIELD(enc_lambda_satd_6);
+	INIT_ENC_FIELD(enc_lambda_satd_7);
+	INIT_ENC_FIELD(enc_lambda_satd_8);
+	INIT_ENC_FIELD(enc_lambda_satd_9);
+	INIT_ENC_FIELD(enc_lambda_satd_10);
+	INIT_ENC_FIELD(enc_lambda_satd_11);
+	INIT_ENC_FIELD(enc_lambda_satd_12);
+	INIT_ENC_FIELD(enc_lambda_satd_13);
+	INIT_ENC_FIELD(enc_lambda_satd_14);
+	INIT_ENC_FIELD(enc_lambda_satd_15);
+	INIT_ENC_FIELD(enc_lambda_satd_16);
+	INIT_ENC_FIELD(enc_lambda_satd_17);
+	INIT_ENC_FIELD(enc_lambda_satd_18);
+	INIT_ENC_FIELD(enc_lambda_satd_19);
+	INIT_ENC_FIELD(enc_lambda_satd_20);
+	INIT_ENC_FIELD(enc_lambda_satd_21);
+	INIT_ENC_FIELD(enc_lambda_satd_22);
+	INIT_ENC_FIELD(enc_lambda_satd_23);
+	INIT_ENC_FIELD(enc_lambda_satd_24);
+	INIT_ENC_FIELD(enc_lambda_satd_25);
+	INIT_ENC_FIELD(enc_lambda_satd_26);
+	INIT_ENC_FIELD(enc_lambda_satd_27);
+	INIT_ENC_FIELD(enc_lambda_satd_28);
+	INIT_ENC_FIELD(enc_lambda_satd_29);
+	INIT_ENC_FIELD(enc_lambda_satd_30);
+	INIT_ENC_FIELD(enc_lambda_satd_31);
+
+	INIT_ENC_FIELD(enc_lambda_sse_me_0);
+	INIT_ENC_FIELD(enc_lambda_sse_me_1);
+	INIT_ENC_FIELD(enc_lambda_sse_me_2);
+	INIT_ENC_FIELD(enc_lambda_sse_me_3);
+	INIT_ENC_FIELD(enc_lambda_sse_me_4);
+	INIT_ENC_FIELD(enc_lambda_sse_me_5);
+	INIT_ENC_FIELD(enc_lambda_sse_me_6);
+	INIT_ENC_FIELD(enc_lambda_sse_me_7);
+	INIT_ENC_FIELD(enc_lambda_sse_me_8);
+	INIT_ENC_FIELD(enc_lambda_sse_me_9);
+	INIT_ENC_FIELD(enc_lambda_sse_me_10);
+	INIT_ENC_FIELD(enc_lambda_sse_me_11);
+	INIT_ENC_FIELD(enc_lambda_sse_me_12);
+	INIT_ENC_FIELD(enc_lambda_sse_me_13);
+	INIT_ENC_FIELD(enc_lambda_sse_me_14);
+	INIT_ENC_FIELD(enc_lambda_sse_me_15);
+	INIT_ENC_FIELD(enc_lambda_sse_me_16);
+	INIT_ENC_FIELD(enc_lambda_sse_me_17);
+	INIT_ENC_FIELD(enc_lambda_sse_me_18);
+	INIT_ENC_FIELD(enc_lambda_sse_me_19);
+	INIT_ENC_FIELD(enc_lambda_sse_me_20);
+	INIT_ENC_FIELD(enc_lambda_sse_me_21);
+	INIT_ENC_FIELD(enc_lambda_sse_me_22);
+	INIT_ENC_FIELD(enc_lambda_sse_me_23);
+	INIT_ENC_FIELD(enc_lambda_sse_me_24);
+	INIT_ENC_FIELD(enc_lambda_sse_me_25);
+	INIT_ENC_FIELD(enc_lambda_sse_me_26);
+	INIT_ENC_FIELD(enc_lambda_sse_me_27);
+	INIT_ENC_FIELD(enc_lambda_sse_me_28);
+	INIT_ENC_FIELD(enc_lambda_sse_me_29);
+	INIT_ENC_FIELD(enc_lambda_sse_me_30);
+	INIT_ENC_FIELD(enc_lambda_sse_me_31);
 
 	return 0;
 }
@@ -379,6 +940,21 @@ int hantro_regmap_init_enc(struct hantro_dev *vpu)
 
 	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
 
+	switch (vpu->core_hw_enc_rev) {
+	case HANTRO_H1_REV:
+		hantro_regmap_enc.max_register = 0x300;
+		field = &h1_field;
+		break;
+	case HANTRO_VC8000_REV:
+		hantro_regmap_enc.max_register = 0x640;
+		field = &vc8000e_field;
+		break;
+	default:
+		dev_err(vpu->dev, "Encoder revision 0x%x not supported by driver.\n",
+			vpu->core_hw_enc_rev);
+		return -ENODEV;
+	}
+
 	vpu->regs_enc = devm_regmap_init_mmio(vpu->dev, enc_base,
 					      &hantro_regmap_enc);
 	if (IS_ERR(vpu->regs_enc)) {
diff --git a/drivers/staging/media/hantro/hantro_regmap.h b/drivers/staging/media/hantro/hantro_regmap.h
index 083c4e92c4bd..549c16f72919 100644
--- a/drivers/staging/media/hantro/hantro_regmap.h
+++ b/drivers/staging/media/hantro/hantro_regmap.h
@@ -10,6 +10,7 @@
 #define HANTRO_REGMAP_H_
 
 #define HANTRO_G1_REV		0x6731
+#define HANTRO_H1_REV		0x4831
 #define HANTRO_VC8000_REV	0x8001
 
 #define SWREG(nr)		((nr) << 2)
@@ -111,7 +112,181 @@ struct hantro_regmap_fields_dec {
 };
 
 struct hantro_regmap_fields_enc {
-	/* TODO: populate encoder fields */
+	/* Encoder */
+	struct regmap_field *enc_timeout_cycles;
+	struct regmap_field *enc_timeout_e;
+	struct regmap_field *enc_mode;
+	struct regmap_field *enc_stream_mode;
+	struct regmap_field *enc_enable;
+	struct regmap_field *enc_pic_type;
+	struct regmap_field *enc_pic_width;
+	struct regmap_field *enc_pic_height;
+	struct regmap_field *enc_burst_len;
+	struct regmap_field *enc_clk_gate_en;
+	struct regmap_field *enc_stream_buf_limit;
+	struct regmap_field *enc_row_len;
+	struct regmap_field *enc_overfill_r;
+	struct regmap_field *enc_overfill_b;
+	struct regmap_field *enc_src_format;
+	struct regmap_field *enc_init_qp;
+	struct regmap_field *enc_qp_frac;
+	struct regmap_field *enc_chroma_qp_offset;
+	struct regmap_field *enc_deblocking_filter_dis;
+	struct regmap_field *enc_slice_deblocking_filter_dis;
+	struct regmap_field *enc_slice_deblocking_filter_override;
+	struct regmap_field *enc_pps_deblocking_filter_override;
+	struct regmap_field *enc_slice_alpha_div2;
+	struct regmap_field *enc_slice_beta_div2;
+	struct regmap_field *enc_idr_pic_id;
+	struct regmap_field *enc_nal_ref_idc;
+	struct regmap_field *enc_pps_id;
+	struct regmap_field *enc_nal_unit_type;
+	struct regmap_field *enc_frame_num;
+	struct regmap_field *enc_min_cb_size;
+	struct regmap_field *enc_max_cb_size;
+	struct regmap_field *enc_min_trb_size;
+	struct regmap_field *enc_max_trb_size;
+	struct regmap_field *enc_slice_size;
+	struct regmap_field *enc_nal_size_write;
+	struct regmap_field *enc_cabac_init_idc;
+	struct regmap_field *enc_pic_qp;
+	struct regmap_field *enc_entropy_coding_mode;
+	struct regmap_field *enc_axi_r_outstanding_num;
+	struct regmap_field *enc_axi_w_outstanding_num;
+	struct regmap_field *enc_trans8x8_mode_en;
+	struct regmap_field *enc_inter4x4_mode;
+	struct regmap_field *enc_quarter_pixmv_dis;
+	struct regmap_field *enc_addr_cabac;
+	struct regmap_field *enc_addr_str;
+	struct regmap_field *enc_addr_size_table;
+	struct regmap_field *enc_addr_rec_luma;
+	struct regmap_field *enc_addr_rec_luma_4n;
+	struct regmap_field *enc_addr_ref_luma_l0_4n0;
+	struct regmap_field *enc_addr_rec_chroma;
+	struct regmap_field *enc_addr_ref_luma;
+	struct regmap_field *enc_addr_ref_chroma;
+	struct regmap_field *enc_addr_src_y;
+	struct regmap_field *enc_addr_src_cb;
+	struct regmap_field *enc_addr_src_cr;
+	struct regmap_field *enc_log2_max_pic_order_cnt_lsb;
+	struct regmap_field *enc_log2_max_frame_num;
+	struct regmap_field *enc_pic_order_cnt_type;
+	struct regmap_field *enc_l0_delta_framenum0;
+	struct regmap_field *enc_l0_used_by_next_pic0;
+	struct regmap_field *enc_l0_used_by_next_pic1;
+
+	struct regmap_field *enc_lu_stride;
+	struct regmap_field *enc_cr_stride;
+	struct regmap_field *enc_ref_lu_stride;
+	struct regmap_field *enc_ref_ds_lu_stride;
+	struct regmap_field *enc_ref_cr_stride;
+	struct regmap_field *enc_ipcm2_left;
+	struct regmap_field *enc_ipcm2_right;
+	struct regmap_field *enc_ipcm2_top;
+	struct regmap_field *enc_ipcm2_bottom;
+
+	struct regmap_field *enc_slice_qp_offset;
+	struct regmap_field *enc_qp_min;
+	struct regmap_field *enc_qp_max;
+
+	struct regmap_field *enc_lambda_satd_me_0;
+	struct regmap_field *enc_lambda_satd_me_1;
+	struct regmap_field *enc_lambda_satd_me_2;
+	struct regmap_field *enc_lambda_satd_me_3;
+	struct regmap_field *enc_lambda_satd_me_4;
+	struct regmap_field *enc_lambda_satd_me_5;
+	struct regmap_field *enc_lambda_satd_me_6;
+	struct regmap_field *enc_lambda_satd_me_7;
+	struct regmap_field *enc_lambda_satd_me_8;
+	struct regmap_field *enc_lambda_satd_me_9;
+	struct regmap_field *enc_lambda_satd_me_10;
+	struct regmap_field *enc_lambda_satd_me_11;
+	struct regmap_field *enc_lambda_satd_me_12;
+	struct regmap_field *enc_lambda_satd_me_13;
+	struct regmap_field *enc_lambda_satd_me_14;
+	struct regmap_field *enc_lambda_satd_me_15;
+	struct regmap_field *enc_lambda_satd_me_16;
+	struct regmap_field *enc_lambda_satd_me_17;
+	struct regmap_field *enc_lambda_satd_me_18;
+	struct regmap_field *enc_lambda_satd_me_19;
+	struct regmap_field *enc_lambda_satd_me_20;
+	struct regmap_field *enc_lambda_satd_me_21;
+	struct regmap_field *enc_lambda_satd_me_22;
+	struct regmap_field *enc_lambda_satd_me_23;
+	struct regmap_field *enc_lambda_satd_me_24;
+	struct regmap_field *enc_lambda_satd_me_25;
+	struct regmap_field *enc_lambda_satd_me_26;
+	struct regmap_field *enc_lambda_satd_me_27;
+	struct regmap_field *enc_lambda_satd_me_28;
+	struct regmap_field *enc_lambda_satd_me_29;
+	struct regmap_field *enc_lambda_satd_me_30;
+	struct regmap_field *enc_lambda_satd_me_31;
+
+	struct regmap_field *enc_lambda_satd_0;
+	struct regmap_field *enc_lambda_satd_1;
+	struct regmap_field *enc_lambda_satd_2;
+	struct regmap_field *enc_lambda_satd_3;
+	struct regmap_field *enc_lambda_satd_4;
+	struct regmap_field *enc_lambda_satd_5;
+	struct regmap_field *enc_lambda_satd_6;
+	struct regmap_field *enc_lambda_satd_7;
+	struct regmap_field *enc_lambda_satd_8;
+	struct regmap_field *enc_lambda_satd_9;
+	struct regmap_field *enc_lambda_satd_10;
+	struct regmap_field *enc_lambda_satd_11;
+	struct regmap_field *enc_lambda_satd_12;
+	struct regmap_field *enc_lambda_satd_13;
+	struct regmap_field *enc_lambda_satd_14;
+	struct regmap_field *enc_lambda_satd_15;
+	struct regmap_field *enc_lambda_satd_16;
+	struct regmap_field *enc_lambda_satd_17;
+	struct regmap_field *enc_lambda_satd_18;
+	struct regmap_field *enc_lambda_satd_19;
+	struct regmap_field *enc_lambda_satd_20;
+	struct regmap_field *enc_lambda_satd_21;
+	struct regmap_field *enc_lambda_satd_22;
+	struct regmap_field *enc_lambda_satd_23;
+	struct regmap_field *enc_lambda_satd_24;
+	struct regmap_field *enc_lambda_satd_25;
+	struct regmap_field *enc_lambda_satd_26;
+	struct regmap_field *enc_lambda_satd_27;
+	struct regmap_field *enc_lambda_satd_28;
+	struct regmap_field *enc_lambda_satd_29;
+	struct regmap_field *enc_lambda_satd_30;
+	struct regmap_field *enc_lambda_satd_31;
+
+	struct regmap_field *enc_lambda_sse_me_0;
+	struct regmap_field *enc_lambda_sse_me_1;
+	struct regmap_field *enc_lambda_sse_me_2;
+	struct regmap_field *enc_lambda_sse_me_3;
+	struct regmap_field *enc_lambda_sse_me_4;
+	struct regmap_field *enc_lambda_sse_me_5;
+	struct regmap_field *enc_lambda_sse_me_6;
+	struct regmap_field *enc_lambda_sse_me_7;
+	struct regmap_field *enc_lambda_sse_me_8;
+	struct regmap_field *enc_lambda_sse_me_9;
+	struct regmap_field *enc_lambda_sse_me_10;
+	struct regmap_field *enc_lambda_sse_me_11;
+	struct regmap_field *enc_lambda_sse_me_12;
+	struct regmap_field *enc_lambda_sse_me_13;
+	struct regmap_field *enc_lambda_sse_me_14;
+	struct regmap_field *enc_lambda_sse_me_15;
+	struct regmap_field *enc_lambda_sse_me_16;
+	struct regmap_field *enc_lambda_sse_me_17;
+	struct regmap_field *enc_lambda_sse_me_18;
+	struct regmap_field *enc_lambda_sse_me_19;
+	struct regmap_field *enc_lambda_sse_me_20;
+	struct regmap_field *enc_lambda_sse_me_21;
+	struct regmap_field *enc_lambda_sse_me_22;
+	struct regmap_field *enc_lambda_sse_me_23;
+	struct regmap_field *enc_lambda_sse_me_24;
+	struct regmap_field *enc_lambda_sse_me_25;
+	struct regmap_field *enc_lambda_sse_me_26;
+	struct regmap_field *enc_lambda_sse_me_27;
+	struct regmap_field *enc_lambda_sse_me_28;
+	struct regmap_field *enc_lambda_sse_me_29;
+	struct regmap_field *enc_lambda_sse_me_30;
+	struct regmap_field *enc_lambda_sse_me_31;
 };
 
 int hantro_regmap_init_dec(struct hantro_dev *vpu);
-- 
2.28.0

