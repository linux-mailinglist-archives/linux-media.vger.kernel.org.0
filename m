Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B38F03D3559
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 09:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233405AbhGWGwB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 02:52:01 -0400
Received: from gloria.sntech.de ([185.11.138.130]:43382 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233396AbhGWGwA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 02:52:00 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1m6pfY-0003dj-0e; Fri, 23 Jul 2021 09:32:28 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc:     ezequiel@collabora.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, Laurent.pinchart@ideasonboard.com,
        linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
        heiko@sntech.de, robh+dt@kernel.org, devicetree@vger.kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: [PATCH v7 07/10] media: rockchip: rkisp1: add prefixes for v10 specific parts
Date:   Fri, 23 Jul 2021 09:32:18 +0200
Message-Id: <20210723073221.1276358-8-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210723073221.1276358-1-heiko@sntech.de>
References: <20210723073221.1276358-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

The rkisp1 evolved over soc generations and the rk3326/px30 introduced
the so called v12 - probably meaning v1.2.

In a first step adapt the affected v10 parts to give them a
matching suffix to enable us to add v12 variants later on.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 180 ++++++------
 .../platform/rockchip/rkisp1/rkisp1-regs.h    | 263 +++++++++---------
 .../platform/rockchip/rkisp1/rkisp1-stats.c   |  32 +--
 3 files changed, 237 insertions(+), 238 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index ffc53fad57c4..945225e273a7 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -185,8 +185,8 @@ static void rkisp1_bls_config(struct rkisp1_params *params,
 
 /* ISP LS correction interface function */
 static void
-rkisp1_lsc_matrix_config(struct rkisp1_params *params,
-			 const struct rkisp1_cif_isp_lsc_config *pconfig)
+rkisp1_lsc_matrix_config_v10(struct rkisp1_params *params,
+			     const struct rkisp1_cif_isp_lsc_config *pconfig)
 {
 	unsigned int isp_lsc_status, sram_addr, isp_lsc_table_sel, i, j, data;
 
@@ -212,39 +212,39 @@ rkisp1_lsc_matrix_config(struct rkisp1_params *params,
 		 * DWORDs (2nd value of last DWORD unused)
 		 */
 		for (j = 0; j < RKISP1_CIF_ISP_LSC_SAMPLES_MAX - 1; j += 2) {
-			data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->r_data_tbl[i][j],
-							     pconfig->r_data_tbl[i][j + 1]);
+			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->r_data_tbl[i][j],
+								 pconfig->r_data_tbl[i][j + 1]);
 			rkisp1_write(params->rkisp1, data,
 				     RKISP1_CIF_ISP_LSC_R_TABLE_DATA);
 
-			data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->gr_data_tbl[i][j],
-							     pconfig->gr_data_tbl[i][j + 1]);
+			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->gr_data_tbl[i][j],
+								 pconfig->gr_data_tbl[i][j + 1]);
 			rkisp1_write(params->rkisp1, data,
 				     RKISP1_CIF_ISP_LSC_GR_TABLE_DATA);
 
-			data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->gb_data_tbl[i][j],
-							     pconfig->gb_data_tbl[i][j + 1]);
+			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->gb_data_tbl[i][j],
+								 pconfig->gb_data_tbl[i][j + 1]);
 			rkisp1_write(params->rkisp1, data,
 				     RKISP1_CIF_ISP_LSC_GB_TABLE_DATA);
 
-			data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->b_data_tbl[i][j],
-							     pconfig->b_data_tbl[i][j + 1]);
+			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->b_data_tbl[i][j],
+								 pconfig->b_data_tbl[i][j + 1]);
 			rkisp1_write(params->rkisp1, data,
 				     RKISP1_CIF_ISP_LSC_B_TABLE_DATA);
 		}
-		data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->r_data_tbl[i][j], 0);
+		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->r_data_tbl[i][j], 0);
 		rkisp1_write(params->rkisp1, data,
 			     RKISP1_CIF_ISP_LSC_R_TABLE_DATA);
 
-		data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->gr_data_tbl[i][j], 0);
+		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->gr_data_tbl[i][j], 0);
 		rkisp1_write(params->rkisp1, data,
 			     RKISP1_CIF_ISP_LSC_GR_TABLE_DATA);
 
-		data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->gb_data_tbl[i][j], 0);
+		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->gb_data_tbl[i][j], 0);
 		rkisp1_write(params->rkisp1, data,
 			     RKISP1_CIF_ISP_LSC_GB_TABLE_DATA);
 
-		data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->b_data_tbl[i][j], 0);
+		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->b_data_tbl[i][j], 0);
 		rkisp1_write(params->rkisp1, data,
 			     RKISP1_CIF_ISP_LSC_B_TABLE_DATA);
 	}
@@ -382,18 +382,18 @@ static void rkisp1_sdg_config(struct rkisp1_params *params,
 }
 
 /* ISP GAMMA correction interface function */
-static void rkisp1_goc_config(struct rkisp1_params *params,
-			      const struct rkisp1_cif_isp_goc_config *arg)
+static void rkisp1_goc_config_v10(struct rkisp1_params *params,
+				  const struct rkisp1_cif_isp_goc_config *arg)
 {
 	unsigned int i;
 
 	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
 				RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
-	rkisp1_write(params->rkisp1, arg->mode, RKISP1_CIF_ISP_GAMMA_OUT_MODE);
+	rkisp1_write(params->rkisp1, arg->mode, RKISP1_CIF_ISP_GAMMA_OUT_MODE_V10);
 
 	for (i = 0; i < RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V10; i++)
 		rkisp1_write(params->rkisp1, arg->gamma_y[i],
-			     RKISP1_CIF_ISP_GAMMA_OUT_Y_0 + i * 4);
+			     RKISP1_CIF_ISP_GAMMA_OUT_Y_0_V10 + i * 4);
 }
 
 /* ISP Cross Talk */
@@ -433,8 +433,8 @@ static void rkisp1_ctk_enable(struct rkisp1_params *params, bool en)
 }
 
 /* ISP White Balance Mode */
-static void rkisp1_awb_meas_config(struct rkisp1_params *params,
-				   const struct rkisp1_cif_isp_awb_meas_config *arg)
+static void rkisp1_awb_meas_config_v10(struct rkisp1_params *params,
+				       const struct rkisp1_cif_isp_awb_meas_config *arg)
 {
 	u32 reg_val = 0;
 	/* based on the mode,configure the awb module */
@@ -442,43 +442,43 @@ static void rkisp1_awb_meas_config(struct rkisp1_params *params,
 		/* Reference Cb and Cr */
 		rkisp1_write(params->rkisp1,
 			     RKISP1_CIF_ISP_AWB_REF_CR_SET(arg->awb_ref_cr) |
-			     arg->awb_ref_cb, RKISP1_CIF_ISP_AWB_REF);
+			     arg->awb_ref_cb, RKISP1_CIF_ISP_AWB_REF_V10);
 		/* Yc Threshold */
 		rkisp1_write(params->rkisp1,
 			     RKISP1_CIF_ISP_AWB_MAX_Y_SET(arg->max_y) |
 			     RKISP1_CIF_ISP_AWB_MIN_Y_SET(arg->min_y) |
 			     RKISP1_CIF_ISP_AWB_MAX_CS_SET(arg->max_csum) |
-			     arg->min_c, RKISP1_CIF_ISP_AWB_THRESH);
+			     arg->min_c, RKISP1_CIF_ISP_AWB_THRESH_V10);
 	}
 
-	reg_val = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_AWB_PROP);
+	reg_val = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_AWB_PROP_V10);
 	if (arg->enable_ymax_cmp)
 		reg_val |= RKISP1_CIF_ISP_AWB_YMAX_CMP_EN;
 	else
 		reg_val &= ~RKISP1_CIF_ISP_AWB_YMAX_CMP_EN;
-	rkisp1_write(params->rkisp1, reg_val, RKISP1_CIF_ISP_AWB_PROP);
+	rkisp1_write(params->rkisp1, reg_val, RKISP1_CIF_ISP_AWB_PROP_V10);
 
 	/* window offset */
 	rkisp1_write(params->rkisp1,
-		     arg->awb_wnd.v_offs, RKISP1_CIF_ISP_AWB_WND_V_OFFS);
+		     arg->awb_wnd.v_offs, RKISP1_CIF_ISP_AWB_WND_V_OFFS_V10);
 	rkisp1_write(params->rkisp1,
-		     arg->awb_wnd.h_offs, RKISP1_CIF_ISP_AWB_WND_H_OFFS);
+		     arg->awb_wnd.h_offs, RKISP1_CIF_ISP_AWB_WND_H_OFFS_V10);
 	/* AWB window size */
 	rkisp1_write(params->rkisp1,
-		     arg->awb_wnd.v_size, RKISP1_CIF_ISP_AWB_WND_V_SIZE);
+		     arg->awb_wnd.v_size, RKISP1_CIF_ISP_AWB_WND_V_SIZE_V10);
 	rkisp1_write(params->rkisp1,
-		     arg->awb_wnd.h_size, RKISP1_CIF_ISP_AWB_WND_H_SIZE);
+		     arg->awb_wnd.h_size, RKISP1_CIF_ISP_AWB_WND_H_SIZE_V10);
 	/* Number of frames */
 	rkisp1_write(params->rkisp1,
-		     arg->frames, RKISP1_CIF_ISP_AWB_FRAMES);
+		     arg->frames, RKISP1_CIF_ISP_AWB_FRAMES_V10);
 }
 
 static void
-rkisp1_awb_meas_enable(struct rkisp1_params *params,
-		       const struct rkisp1_cif_isp_awb_meas_config *arg,
-		       bool en)
+rkisp1_awb_meas_enable_v10(struct rkisp1_params *params,
+			   const struct rkisp1_cif_isp_awb_meas_config *arg,
+			   bool en)
 {
-	u32 reg_val = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_AWB_PROP);
+	u32 reg_val = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_AWB_PROP_V10);
 
 	/* switch off */
 	reg_val &= RKISP1_CIF_ISP_AWB_MODE_MASK_NONE;
@@ -489,34 +489,34 @@ rkisp1_awb_meas_enable(struct rkisp1_params *params,
 		else
 			reg_val |= RKISP1_CIF_ISP_AWB_MODE_YCBCR_EN;
 
-		rkisp1_write(params->rkisp1, reg_val, RKISP1_CIF_ISP_AWB_PROP);
+		rkisp1_write(params->rkisp1, reg_val, RKISP1_CIF_ISP_AWB_PROP_V10);
 
 		/* Measurements require AWB block be active. */
 		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
 				      RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
 	} else {
 		rkisp1_write(params->rkisp1,
-			     reg_val, RKISP1_CIF_ISP_AWB_PROP);
+			     reg_val, RKISP1_CIF_ISP_AWB_PROP_V10);
 		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
 					RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
 	}
 }
 
 static void
-rkisp1_awb_gain_config(struct rkisp1_params *params,
-		       const struct rkisp1_cif_isp_awb_gain_config *arg)
+rkisp1_awb_gain_config_v10(struct rkisp1_params *params,
+			   const struct rkisp1_cif_isp_awb_gain_config *arg)
 {
 	rkisp1_write(params->rkisp1,
 		     RKISP1_CIF_ISP_AWB_GAIN_R_SET(arg->gain_green_r) |
-		     arg->gain_green_b, RKISP1_CIF_ISP_AWB_GAIN_G);
+		     arg->gain_green_b, RKISP1_CIF_ISP_AWB_GAIN_G_V10);
 
 	rkisp1_write(params->rkisp1,
 		     RKISP1_CIF_ISP_AWB_GAIN_R_SET(arg->gain_red) |
-		     arg->gain_blue, RKISP1_CIF_ISP_AWB_GAIN_RB);
+		     arg->gain_blue, RKISP1_CIF_ISP_AWB_GAIN_RB_V10);
 }
 
-static void rkisp1_aec_config(struct rkisp1_params *params,
-			      const struct rkisp1_cif_isp_aec_config *arg)
+static void rkisp1_aec_config_v10(struct rkisp1_params *params,
+				  const struct rkisp1_cif_isp_aec_config *arg)
 {
 	unsigned int block_hsize, block_vsize;
 	u32 exp_ctrl;
@@ -531,21 +531,21 @@ static void rkisp1_aec_config(struct rkisp1_params *params,
 	rkisp1_write(params->rkisp1, exp_ctrl, RKISP1_CIF_ISP_EXP_CTRL);
 
 	rkisp1_write(params->rkisp1,
-		     arg->meas_window.h_offs, RKISP1_CIF_ISP_EXP_H_OFFSET);
+		     arg->meas_window.h_offs, RKISP1_CIF_ISP_EXP_H_OFFSET_V10);
 	rkisp1_write(params->rkisp1,
-		     arg->meas_window.v_offs, RKISP1_CIF_ISP_EXP_V_OFFSET);
+		     arg->meas_window.v_offs, RKISP1_CIF_ISP_EXP_V_OFFSET_V10);
 
 	block_hsize = arg->meas_window.h_size /
-		      RKISP1_CIF_ISP_EXP_COLUMN_NUM - 1;
+		      RKISP1_CIF_ISP_EXP_COLUMN_NUM_V10 - 1;
 	block_vsize = arg->meas_window.v_size /
-		      RKISP1_CIF_ISP_EXP_ROW_NUM - 1;
+		      RKISP1_CIF_ISP_EXP_ROW_NUM_V10 - 1;
 
 	rkisp1_write(params->rkisp1,
-		     RKISP1_CIF_ISP_EXP_H_SIZE_SET(block_hsize),
-		     RKISP1_CIF_ISP_EXP_H_SIZE);
+		     RKISP1_CIF_ISP_EXP_H_SIZE_SET_V10(block_hsize),
+		     RKISP1_CIF_ISP_EXP_H_SIZE_V10);
 	rkisp1_write(params->rkisp1,
-		     RKISP1_CIF_ISP_EXP_V_SIZE_SET(block_vsize),
-		     RKISP1_CIF_ISP_EXP_V_SIZE);
+		     RKISP1_CIF_ISP_EXP_V_SIZE_SET_V10(block_vsize),
+		     RKISP1_CIF_ISP_EXP_V_SIZE_V10);
 }
 
 static void rkisp1_cproc_config(struct rkisp1_params *params,
@@ -578,73 +578,73 @@ static void rkisp1_cproc_config(struct rkisp1_params *params,
 	}
 }
 
-static void rkisp1_hst_config(struct rkisp1_params *params,
-			      const struct rkisp1_cif_isp_hst_config *arg)
+static void rkisp1_hst_config_v10(struct rkisp1_params *params,
+				  const struct rkisp1_cif_isp_hst_config *arg)
 {
 	unsigned int block_hsize, block_vsize;
 	static const u32 hist_weight_regs[] = {
-		RKISP1_CIF_ISP_HIST_WEIGHT_00TO30,
-		RKISP1_CIF_ISP_HIST_WEIGHT_40TO21,
-		RKISP1_CIF_ISP_HIST_WEIGHT_31TO12,
-		RKISP1_CIF_ISP_HIST_WEIGHT_22TO03,
-		RKISP1_CIF_ISP_HIST_WEIGHT_13TO43,
-		RKISP1_CIF_ISP_HIST_WEIGHT_04TO34,
+		RKISP1_CIF_ISP_HIST_WEIGHT_00TO30_V10,
+		RKISP1_CIF_ISP_HIST_WEIGHT_40TO21_V10,
+		RKISP1_CIF_ISP_HIST_WEIGHT_31TO12_V10,
+		RKISP1_CIF_ISP_HIST_WEIGHT_22TO03_V10,
+		RKISP1_CIF_ISP_HIST_WEIGHT_13TO43_V10,
+		RKISP1_CIF_ISP_HIST_WEIGHT_04TO34_V10,
 	};
 	const u8 *weight;
 	unsigned int i;
 	u32 hist_prop;
 
 	/* avoid to override the old enable value */
-	hist_prop = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_HIST_PROP);
-	hist_prop &= RKISP1_CIF_ISP_HIST_PROP_MODE_MASK;
-	hist_prop |= RKISP1_CIF_ISP_HIST_PREDIV_SET(arg->histogram_predivider);
-	rkisp1_write(params->rkisp1, hist_prop, RKISP1_CIF_ISP_HIST_PROP);
+	hist_prop = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_HIST_PROP_V10);
+	hist_prop &= RKISP1_CIF_ISP_HIST_PROP_MODE_MASK_V10;
+	hist_prop |= RKISP1_CIF_ISP_HIST_PREDIV_SET_V10(arg->histogram_predivider);
+	rkisp1_write(params->rkisp1, hist_prop, RKISP1_CIF_ISP_HIST_PROP_V10);
 	rkisp1_write(params->rkisp1,
 		     arg->meas_window.h_offs,
-		     RKISP1_CIF_ISP_HIST_H_OFFS);
+		     RKISP1_CIF_ISP_HIST_H_OFFS_V10);
 	rkisp1_write(params->rkisp1,
 		     arg->meas_window.v_offs,
-		     RKISP1_CIF_ISP_HIST_V_OFFS);
+		     RKISP1_CIF_ISP_HIST_V_OFFS_V10);
 
 	block_hsize = arg->meas_window.h_size /
-		      RKISP1_CIF_ISP_HIST_COLUMN_NUM - 1;
-	block_vsize = arg->meas_window.v_size / RKISP1_CIF_ISP_HIST_ROW_NUM - 1;
+		      RKISP1_CIF_ISP_HIST_COLUMN_NUM_V10 - 1;
+	block_vsize = arg->meas_window.v_size / RKISP1_CIF_ISP_HIST_ROW_NUM_V10 - 1;
 
-	rkisp1_write(params->rkisp1, block_hsize, RKISP1_CIF_ISP_HIST_H_SIZE);
-	rkisp1_write(params->rkisp1, block_vsize, RKISP1_CIF_ISP_HIST_V_SIZE);
+	rkisp1_write(params->rkisp1, block_hsize, RKISP1_CIF_ISP_HIST_H_SIZE_V10);
+	rkisp1_write(params->rkisp1, block_vsize, RKISP1_CIF_ISP_HIST_V_SIZE_V10);
 
 	weight = arg->hist_weight;
 	for (i = 0; i < ARRAY_SIZE(hist_weight_regs); ++i, weight += 4)
 		rkisp1_write(params->rkisp1,
-			     RKISP1_CIF_ISP_HIST_WEIGHT_SET(weight[0],
+			     RKISP1_CIF_ISP_HIST_WEIGHT_SET_V10(weight[0],
 							    weight[1],
 							    weight[2],
 							    weight[3]),
 				 hist_weight_regs[i]);
 
-	rkisp1_write(params->rkisp1, weight[0] & 0x1F, RKISP1_CIF_ISP_HIST_WEIGHT_44);
+	rkisp1_write(params->rkisp1, weight[0] & 0x1F, RKISP1_CIF_ISP_HIST_WEIGHT_44_V10);
 }
 
 static void
-rkisp1_hst_enable(struct rkisp1_params *params,
-		  const struct rkisp1_cif_isp_hst_config *arg, bool en)
+rkisp1_hst_enable_v10(struct rkisp1_params *params,
+		      const struct rkisp1_cif_isp_hst_config *arg, bool en)
 {
 	if (en)	{
 		u32 hist_prop = rkisp1_read(params->rkisp1,
-					    RKISP1_CIF_ISP_HIST_PROP);
+					    RKISP1_CIF_ISP_HIST_PROP_V10);
 
-		hist_prop &= ~RKISP1_CIF_ISP_HIST_PROP_MODE_MASK;
+		hist_prop &= ~RKISP1_CIF_ISP_HIST_PROP_MODE_MASK_V10;
 		hist_prop |= arg->mode;
-		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_HIST_PROP,
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_HIST_PROP_V10,
 				      hist_prop);
 	} else {
-		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_HIST_PROP,
-					RKISP1_CIF_ISP_HIST_PROP_MODE_MASK);
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_HIST_PROP_V10,
+					RKISP1_CIF_ISP_HIST_PROP_MODE_MASK_V10);
 	}
 }
 
-static void rkisp1_afm_config(struct rkisp1_params *params,
-			      const struct rkisp1_cif_isp_afc_config *arg)
+static void rkisp1_afm_config_v10(struct rkisp1_params *params,
+				  const struct rkisp1_cif_isp_afc_config *arg)
 {
 	size_t num_of_win = min_t(size_t, ARRAY_SIZE(arg->afm_win),
 				  arg->num_afm_win);
@@ -1231,7 +1231,7 @@ static void rkisp1_params_config_parameter(struct rkisp1_params *params)
 
 	memset(hst.hist_weight, 0x01, sizeof(hst.hist_weight));
 	params->ops->hst_config(params, &hst);
-	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_HIST_PROP,
+	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_HIST_PROP_V10,
 			      rkisp1_hst_params_default_config.mode);
 
 	/* set the  range */
@@ -1293,16 +1293,16 @@ void rkisp1_params_disable(struct rkisp1_params *params)
 				RKISP1_CIF_ISP_DPF_MODE_EN);
 }
 
-static const struct rkisp1_params_ops rkisp1_params_ops = {
-	.lsc_matrix_config = rkisp1_lsc_matrix_config,
-	.goc_config = rkisp1_goc_config,
-	.awb_meas_config = rkisp1_awb_meas_config,
-	.awb_meas_enable = rkisp1_awb_meas_enable,
-	.awb_gain_config = rkisp1_awb_gain_config,
-	.aec_config = rkisp1_aec_config,
-	.hst_config = rkisp1_hst_config,
-	.hst_enable = rkisp1_hst_enable,
-	.afm_config = rkisp1_afm_config,
+static const struct rkisp1_params_ops rkisp1_v10_params_ops = {
+	.lsc_matrix_config = rkisp1_lsc_matrix_config_v10,
+	.goc_config = rkisp1_goc_config_v10,
+	.awb_meas_config = rkisp1_awb_meas_config_v10,
+	.awb_meas_enable = rkisp1_awb_meas_enable_v10,
+	.awb_gain_config = rkisp1_awb_gain_config_v10,
+	.aec_config = rkisp1_aec_config_v10,
+	.hst_config = rkisp1_hst_config_v10,
+	.hst_enable = rkisp1_hst_enable_v10,
+	.afm_config = rkisp1_afm_config_v10,
 };
 
 static int rkisp1_params_enum_fmt_meta_out(struct file *file, void *priv,
@@ -1472,7 +1472,7 @@ static void rkisp1_init_params(struct rkisp1_params *params)
 	params->vdev_fmt.fmt.meta.buffersize =
 		sizeof(struct rkisp1_params_cfg);
 
-	params->ops = &rkisp1_params_ops;
+	params->ops = &rkisp1_v10_params_ops;
 }
 
 int rkisp1_params_register(struct rkisp1_device *rkisp1)
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
index fa33080f51db..e3944c04102f 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
@@ -346,26 +346,26 @@
 #define RKISP1_CIF_SUPER_IMP_CTRL_TRANSP_DIS		BIT(2)
 
 /* ISP HISTOGRAM CALCULATION : ISP_HIST_PROP */
-#define RKISP1_CIF_ISP_HIST_PROP_MODE_DIS		(0 << 0)
-#define RKISP1_CIF_ISP_HIST_PROP_MODE_RGB		BIT(0)
-#define RKISP1_CIF_ISP_HIST_PROP_MODE_RED		(2 << 0)
-#define RKISP1_CIF_ISP_HIST_PROP_MODE_GREEN		(3 << 0)
-#define RKISP1_CIF_ISP_HIST_PROP_MODE_BLUE		(4 << 0)
-#define RKISP1_CIF_ISP_HIST_PROP_MODE_LUM		(5 << 0)
-#define RKISP1_CIF_ISP_HIST_PROP_MODE_MASK		0x7
-#define RKISP1_CIF_ISP_HIST_PREDIV_SET(x)		(((x) & 0x7F) << 3)
-#define RKISP1_CIF_ISP_HIST_WEIGHT_SET(v0, v1, v2, v3)	\
+#define RKISP1_CIF_ISP_HIST_PROP_MODE_DIS_V10		(0 << 0)
+#define RKISP1_CIF_ISP_HIST_PROP_MODE_RGB_V10		BIT(0)
+#define RKISP1_CIF_ISP_HIST_PROP_MODE_RED_V10		(2 << 0)
+#define RKISP1_CIF_ISP_HIST_PROP_MODE_GREEN_V10		(3 << 0)
+#define RKISP1_CIF_ISP_HIST_PROP_MODE_BLUE_V10		(4 << 0)
+#define RKISP1_CIF_ISP_HIST_PROP_MODE_LUM_V10		(5 << 0)
+#define RKISP1_CIF_ISP_HIST_PROP_MODE_MASK_V10		0x7
+#define RKISP1_CIF_ISP_HIST_PREDIV_SET_V10(x)		(((x) & 0x7F) << 3)
+#define RKISP1_CIF_ISP_HIST_WEIGHT_SET_V10(v0, v1, v2, v3)	\
 				     (((v0) & 0x1F) | (((v1) & 0x1F) << 8)  |\
 				     (((v2) & 0x1F) << 16) | \
 				     (((v3) & 0x1F) << 24))
 
-#define RKISP1_CIF_ISP_HIST_WINDOW_OFFSET_RESERVED	0xFFFFF000
-#define RKISP1_CIF_ISP_HIST_WINDOW_SIZE_RESERVED	0xFFFFF800
-#define RKISP1_CIF_ISP_HIST_WEIGHT_RESERVED		0xE0E0E0E0
-#define RKISP1_CIF_ISP_MAX_HIST_PREDIVIDER		0x0000007F
-#define RKISP1_CIF_ISP_HIST_ROW_NUM			5
-#define RKISP1_CIF_ISP_HIST_COLUMN_NUM			5
-#define RKISP1_CIF_ISP_HIST_GET_BIN(x)			((x) & 0x000FFFFF)
+#define RKISP1_CIF_ISP_HIST_WINDOW_OFFSET_RESERVED_V10	0xFFFFF000
+#define RKISP1_CIF_ISP_HIST_WINDOW_SIZE_RESERVED_V10	0xFFFFF800
+#define RKISP1_CIF_ISP_HIST_WEIGHT_RESERVED_V10		0xE0E0E0E0
+#define RKISP1_CIF_ISP_MAX_HIST_PREDIVIDER_V10		0x0000007F
+#define RKISP1_CIF_ISP_HIST_ROW_NUM_V10			5
+#define RKISP1_CIF_ISP_HIST_COLUMN_NUM_V10		5
+#define RKISP1_CIF_ISP_HIST_GET_BIN_V10(x)		((x) & 0x000FFFFF)
 
 /* AUTO FOCUS MEASUREMENT:  ISP_AFM_CTRL */
 #define RKISP1_ISP_AFM_CTRL_ENABLE			BIT(0)
@@ -442,41 +442,41 @@
 #define RKISP1_CIF_ISP_EXP_CTRL_MEASMODE_1		BIT(31)
 
 /* ISP_EXP_H_SIZE */
-#define RKISP1_CIF_ISP_EXP_H_SIZE_SET(x)		((x) & 0x7FF)
-#define RKISP1_CIF_ISP_EXP_HEIGHT_MASK			0x000007FF
+#define RKISP1_CIF_ISP_EXP_H_SIZE_SET_V10(x)		((x) & 0x7FF)
+#define RKISP1_CIF_ISP_EXP_HEIGHT_MASK_V10			0x000007FF
 /* ISP_EXP_V_SIZE : vertical size must be a multiple of 2). */
-#define RKISP1_CIF_ISP_EXP_V_SIZE_SET(x)		((x) & 0x7FE)
+#define RKISP1_CIF_ISP_EXP_V_SIZE_SET_V10(x)		((x) & 0x7FE)
 
 /* ISP_EXP_H_OFFSET */
-#define RKISP1_CIF_ISP_EXP_H_OFFSET_SET(x)		((x) & 0x1FFF)
-#define RKISP1_CIF_ISP_EXP_MAX_HOFFS			2424
+#define RKISP1_CIF_ISP_EXP_H_OFFSET_SET_V10(x)		((x) & 0x1FFF)
+#define RKISP1_CIF_ISP_EXP_MAX_HOFFS_V10		2424
 /* ISP_EXP_V_OFFSET */
-#define RKISP1_CIF_ISP_EXP_V_OFFSET_SET(x)		((x) & 0x1FFF)
-#define RKISP1_CIF_ISP_EXP_MAX_VOFFS			1806
-
-#define RKISP1_CIF_ISP_EXP_ROW_NUM			5
-#define RKISP1_CIF_ISP_EXP_COLUMN_NUM			5
-#define RKISP1_CIF_ISP_EXP_NUM_LUMA_REGS \
-	(RKISP1_CIF_ISP_EXP_ROW_NUM * RKISP1_CIF_ISP_EXP_COLUMN_NUM)
-#define RKISP1_CIF_ISP_EXP_BLOCK_MAX_HSIZE		516
-#define RKISP1_CIF_ISP_EXP_BLOCK_MIN_HSIZE		35
-#define RKISP1_CIF_ISP_EXP_BLOCK_MAX_VSIZE		390
-#define RKISP1_CIF_ISP_EXP_BLOCK_MIN_VSIZE		28
-#define RKISP1_CIF_ISP_EXP_MAX_HSIZE	\
-	(RKISP1_CIF_ISP_EXP_BLOCK_MAX_HSIZE * RKISP1_CIF_ISP_EXP_COLUMN_NUM + 1)
-#define RKISP1_CIF_ISP_EXP_MIN_HSIZE	\
-	(RKISP1_CIF_ISP_EXP_BLOCK_MIN_HSIZE * RKISP1_CIF_ISP_EXP_COLUMN_NUM + 1)
-#define RKISP1_CIF_ISP_EXP_MAX_VSIZE	\
-	(RKISP1_CIF_ISP_EXP_BLOCK_MAX_VSIZE * RKISP1_CIF_ISP_EXP_ROW_NUM + 1)
-#define RKISP1_CIF_ISP_EXP_MIN_VSIZE	\
-	(RKISP1_CIF_ISP_EXP_BLOCK_MIN_VSIZE * RKISP1_CIF_ISP_EXP_ROW_NUM + 1)
+#define RKISP1_CIF_ISP_EXP_V_OFFSET_SET_V10(x)		((x) & 0x1FFF)
+#define RKISP1_CIF_ISP_EXP_MAX_VOFFS_V10		1806
+
+#define RKISP1_CIF_ISP_EXP_ROW_NUM_V10			5
+#define RKISP1_CIF_ISP_EXP_COLUMN_NUM_V10			5
+#define RKISP1_CIF_ISP_EXP_NUM_LUMA_REGS_V10 \
+	(RKISP1_CIF_ISP_EXP_ROW_NUM_V10 * RKISP1_CIF_ISP_EXP_COLUMN_NUM_V10)
+#define RKISP1_CIF_ISP_EXP_BLOCK_MAX_HSIZE_V10		516
+#define RKISP1_CIF_ISP_EXP_BLOCK_MIN_HSIZE_V10		35
+#define RKISP1_CIF_ISP_EXP_BLOCK_MAX_VSIZE_V10		390
+#define RKISP1_CIF_ISP_EXP_BLOCK_MIN_VSIZE_V10		28
+#define RKISP1_CIF_ISP_EXP_MAX_HSIZE_V10	\
+	(RKISP1_CIF_ISP_EXP_BLOCK_MAX_HSIZE_V10 * RKISP1_CIF_ISP_EXP_COLUMN_NUM_V10 + 1)
+#define RKISP1_CIF_ISP_EXP_MIN_HSIZE_V10	\
+	(RKISP1_CIF_ISP_EXP_BLOCK_MIN_HSIZE_V10 * RKISP1_CIF_ISP_EXP_COLUMN_NUM_V10 + 1)
+#define RKISP1_CIF_ISP_EXP_MAX_VSIZE_V10	\
+	(RKISP1_CIF_ISP_EXP_BLOCK_MAX_VSIZE_V10 * RKISP1_CIF_ISP_EXP_ROW_NUM_V10 + 1)
+#define RKISP1_CIF_ISP_EXP_MIN_VSIZE_V10	\
+	(RKISP1_CIF_ISP_EXP_BLOCK_MIN_VSIZE_V10 * RKISP1_CIF_ISP_EXP_ROW_NUM_V10 + 1)
 
 /* LSC: ISP_LSC_CTRL */
 #define RKISP1_CIF_ISP_LSC_CTRL_ENA			BIT(0)
 #define RKISP1_CIF_ISP_LSC_SECT_SIZE_RESERVED		0xFC00FC00
-#define RKISP1_CIF_ISP_LSC_GRAD_RESERVED		0xF000F000
-#define RKISP1_CIF_ISP_LSC_SAMPLE_RESERVED		0xF000F000
-#define RKISP1_CIF_ISP_LSC_TABLE_DATA(v0, v1)     \
+#define RKISP1_CIF_ISP_LSC_GRAD_RESERVED_V10		0xF000F000
+#define RKISP1_CIF_ISP_LSC_SAMPLE_RESERVED_V10		0xF000F000
+#define RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(v0, v1)     \
 	(((v0) & 0xFFF) | (((v1) & 0xFFF) << 12))
 #define RKISP1_CIF_ISP_LSC_SECT_SIZE(v0, v1)      \
 	(((v0) & 0xFFF) | (((v1) & 0xFFF) << 16))
@@ -667,18 +667,18 @@
 #define RKISP1_CIF_ISP_GAMMA_B_Y14		(RKISP1_CIF_ISP_BASE + 0x000000E4)
 #define RKISP1_CIF_ISP_GAMMA_B_Y15		(RKISP1_CIF_ISP_BASE + 0x000000E8)
 #define RKISP1_CIF_ISP_GAMMA_B_Y16		(RKISP1_CIF_ISP_BASE + 0x000000EC)
-#define RKISP1_CIF_ISP_AWB_PROP			(RKISP1_CIF_ISP_BASE + 0x00000110)
-#define RKISP1_CIF_ISP_AWB_WND_H_OFFS		(RKISP1_CIF_ISP_BASE + 0x00000114)
-#define RKISP1_CIF_ISP_AWB_WND_V_OFFS		(RKISP1_CIF_ISP_BASE + 0x00000118)
-#define RKISP1_CIF_ISP_AWB_WND_H_SIZE		(RKISP1_CIF_ISP_BASE + 0x0000011C)
-#define RKISP1_CIF_ISP_AWB_WND_V_SIZE		(RKISP1_CIF_ISP_BASE + 0x00000120)
-#define RKISP1_CIF_ISP_AWB_FRAMES		(RKISP1_CIF_ISP_BASE + 0x00000124)
-#define RKISP1_CIF_ISP_AWB_REF			(RKISP1_CIF_ISP_BASE + 0x00000128)
-#define RKISP1_CIF_ISP_AWB_THRESH		(RKISP1_CIF_ISP_BASE + 0x0000012C)
-#define RKISP1_CIF_ISP_AWB_GAIN_G		(RKISP1_CIF_ISP_BASE + 0x00000138)
-#define RKISP1_CIF_ISP_AWB_GAIN_RB		(RKISP1_CIF_ISP_BASE + 0x0000013C)
-#define RKISP1_CIF_ISP_AWB_WHITE_CNT		(RKISP1_CIF_ISP_BASE + 0x00000140)
-#define RKISP1_CIF_ISP_AWB_MEAN			(RKISP1_CIF_ISP_BASE + 0x00000144)
+#define RKISP1_CIF_ISP_AWB_PROP_V10		(RKISP1_CIF_ISP_BASE + 0x00000110)
+#define RKISP1_CIF_ISP_AWB_WND_H_OFFS_V10	(RKISP1_CIF_ISP_BASE + 0x00000114)
+#define RKISP1_CIF_ISP_AWB_WND_V_OFFS_V10	(RKISP1_CIF_ISP_BASE + 0x00000118)
+#define RKISP1_CIF_ISP_AWB_WND_H_SIZE_V10	(RKISP1_CIF_ISP_BASE + 0x0000011C)
+#define RKISP1_CIF_ISP_AWB_WND_V_SIZE_V10	(RKISP1_CIF_ISP_BASE + 0x00000120)
+#define RKISP1_CIF_ISP_AWB_FRAMES_V10		(RKISP1_CIF_ISP_BASE + 0x00000124)
+#define RKISP1_CIF_ISP_AWB_REF_V10		(RKISP1_CIF_ISP_BASE + 0x00000128)
+#define RKISP1_CIF_ISP_AWB_THRESH_V10		(RKISP1_CIF_ISP_BASE + 0x0000012C)
+#define RKISP1_CIF_ISP_AWB_GAIN_G_V10		(RKISP1_CIF_ISP_BASE + 0x00000138)
+#define RKISP1_CIF_ISP_AWB_GAIN_RB_V10		(RKISP1_CIF_ISP_BASE + 0x0000013C)
+#define RKISP1_CIF_ISP_AWB_WHITE_CNT_V10	(RKISP1_CIF_ISP_BASE + 0x00000140)
+#define RKISP1_CIF_ISP_AWB_MEAN_V10		(RKISP1_CIF_ISP_BASE + 0x00000144)
 #define RKISP1_CIF_ISP_CC_COEFF_0		(RKISP1_CIF_ISP_BASE + 0x00000170)
 #define RKISP1_CIF_ISP_CC_COEFF_1		(RKISP1_CIF_ISP_BASE + 0x00000174)
 #define RKISP1_CIF_ISP_CC_COEFF_2		(RKISP1_CIF_ISP_BASE + 0x00000178)
@@ -712,24 +712,24 @@
 #define RKISP1_CIF_ISP_CT_COEFF_6		(RKISP1_CIF_ISP_BASE + 0x000001E8)
 #define RKISP1_CIF_ISP_CT_COEFF_7		(RKISP1_CIF_ISP_BASE + 0x000001EC)
 #define RKISP1_CIF_ISP_CT_COEFF_8		(RKISP1_CIF_ISP_BASE + 0x000001F0)
-#define RKISP1_CIF_ISP_GAMMA_OUT_MODE		(RKISP1_CIF_ISP_BASE + 0x000001F4)
-#define RKISP1_CIF_ISP_GAMMA_OUT_Y_0		(RKISP1_CIF_ISP_BASE + 0x000001F8)
-#define RKISP1_CIF_ISP_GAMMA_OUT_Y_1		(RKISP1_CIF_ISP_BASE + 0x000001FC)
-#define RKISP1_CIF_ISP_GAMMA_OUT_Y_2		(RKISP1_CIF_ISP_BASE + 0x00000200)
-#define RKISP1_CIF_ISP_GAMMA_OUT_Y_3		(RKISP1_CIF_ISP_BASE + 0x00000204)
-#define RKISP1_CIF_ISP_GAMMA_OUT_Y_4		(RKISP1_CIF_ISP_BASE + 0x00000208)
-#define RKISP1_CIF_ISP_GAMMA_OUT_Y_5		(RKISP1_CIF_ISP_BASE + 0x0000020C)
-#define RKISP1_CIF_ISP_GAMMA_OUT_Y_6		(RKISP1_CIF_ISP_BASE + 0x00000210)
-#define RKISP1_CIF_ISP_GAMMA_OUT_Y_7		(RKISP1_CIF_ISP_BASE + 0x00000214)
-#define RKISP1_CIF_ISP_GAMMA_OUT_Y_8		(RKISP1_CIF_ISP_BASE + 0x00000218)
-#define RKISP1_CIF_ISP_GAMMA_OUT_Y_9		(RKISP1_CIF_ISP_BASE + 0x0000021C)
-#define RKISP1_CIF_ISP_GAMMA_OUT_Y_10		(RKISP1_CIF_ISP_BASE + 0x00000220)
-#define RKISP1_CIF_ISP_GAMMA_OUT_Y_11		(RKISP1_CIF_ISP_BASE + 0x00000224)
-#define RKISP1_CIF_ISP_GAMMA_OUT_Y_12		(RKISP1_CIF_ISP_BASE + 0x00000228)
-#define RKISP1_CIF_ISP_GAMMA_OUT_Y_13		(RKISP1_CIF_ISP_BASE + 0x0000022C)
-#define RKISP1_CIF_ISP_GAMMA_OUT_Y_14		(RKISP1_CIF_ISP_BASE + 0x00000230)
-#define RKISP1_CIF_ISP_GAMMA_OUT_Y_15		(RKISP1_CIF_ISP_BASE + 0x00000234)
-#define RKISP1_CIF_ISP_GAMMA_OUT_Y_16		(RKISP1_CIF_ISP_BASE + 0x00000238)
+#define RKISP1_CIF_ISP_GAMMA_OUT_MODE_V10	(RKISP1_CIF_ISP_BASE + 0x000001F4)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_0_V10	(RKISP1_CIF_ISP_BASE + 0x000001F8)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_1_V10	(RKISP1_CIF_ISP_BASE + 0x000001FC)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_2_V10	(RKISP1_CIF_ISP_BASE + 0x00000200)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_3_V10	(RKISP1_CIF_ISP_BASE + 0x00000204)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_4_V10	(RKISP1_CIF_ISP_BASE + 0x00000208)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_5_V10	(RKISP1_CIF_ISP_BASE + 0x0000020C)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_6_V10	(RKISP1_CIF_ISP_BASE + 0x00000210)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_7_V10	(RKISP1_CIF_ISP_BASE + 0x00000214)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_8_V10	(RKISP1_CIF_ISP_BASE + 0x00000218)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_9_V10	(RKISP1_CIF_ISP_BASE + 0x0000021C)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_10_V10	(RKISP1_CIF_ISP_BASE + 0x00000220)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_11_V10	(RKISP1_CIF_ISP_BASE + 0x00000224)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_12_V10	(RKISP1_CIF_ISP_BASE + 0x00000228)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_13_V10	(RKISP1_CIF_ISP_BASE + 0x0000022C)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_14_V10	(RKISP1_CIF_ISP_BASE + 0x00000230)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_15_V10	(RKISP1_CIF_ISP_BASE + 0x00000234)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_16_V10	(RKISP1_CIF_ISP_BASE + 0x00000238)
 #define RKISP1_CIF_ISP_ERR			(RKISP1_CIF_ISP_BASE + 0x0000023C)
 #define RKISP1_CIF_ISP_ERR_CLR			(RKISP1_CIF_ISP_BASE + 0x00000240)
 #define RKISP1_CIF_ISP_FRAME_COUNT		(RKISP1_CIF_ISP_BASE + 0x00000244)
@@ -1005,36 +1005,35 @@
 #define RKISP1_CIF_ISP_IS_H_SIZE_SHD		(RKISP1_CIF_ISP_IS_BASE + 0x0000002C)
 #define RKISP1_CIF_ISP_IS_V_SIZE_SHD		(RKISP1_CIF_ISP_IS_BASE + 0x00000030)
 
-#define RKISP1_CIF_ISP_HIST_BASE		0x00002400
-
-#define RKISP1_CIF_ISP_HIST_PROP		(RKISP1_CIF_ISP_HIST_BASE + 0x00000000)
-#define RKISP1_CIF_ISP_HIST_H_OFFS		(RKISP1_CIF_ISP_HIST_BASE + 0x00000004)
-#define RKISP1_CIF_ISP_HIST_V_OFFS		(RKISP1_CIF_ISP_HIST_BASE + 0x00000008)
-#define RKISP1_CIF_ISP_HIST_H_SIZE		(RKISP1_CIF_ISP_HIST_BASE + 0x0000000C)
-#define RKISP1_CIF_ISP_HIST_V_SIZE		(RKISP1_CIF_ISP_HIST_BASE + 0x00000010)
-#define RKISP1_CIF_ISP_HIST_BIN_0		(RKISP1_CIF_ISP_HIST_BASE + 0x00000014)
-#define RKISP1_CIF_ISP_HIST_BIN_1		(RKISP1_CIF_ISP_HIST_BASE + 0x00000018)
-#define RKISP1_CIF_ISP_HIST_BIN_2		(RKISP1_CIF_ISP_HIST_BASE + 0x0000001C)
-#define RKISP1_CIF_ISP_HIST_BIN_3		(RKISP1_CIF_ISP_HIST_BASE + 0x00000020)
-#define RKISP1_CIF_ISP_HIST_BIN_4		(RKISP1_CIF_ISP_HIST_BASE + 0x00000024)
-#define RKISP1_CIF_ISP_HIST_BIN_5		(RKISP1_CIF_ISP_HIST_BASE + 0x00000028)
-#define RKISP1_CIF_ISP_HIST_BIN_6		(RKISP1_CIF_ISP_HIST_BASE + 0x0000002C)
-#define RKISP1_CIF_ISP_HIST_BIN_7		(RKISP1_CIF_ISP_HIST_BASE + 0x00000030)
-#define RKISP1_CIF_ISP_HIST_BIN_8		(RKISP1_CIF_ISP_HIST_BASE + 0x00000034)
-#define RKISP1_CIF_ISP_HIST_BIN_9		(RKISP1_CIF_ISP_HIST_BASE + 0x00000038)
-#define RKISP1_CIF_ISP_HIST_BIN_10		(RKISP1_CIF_ISP_HIST_BASE + 0x0000003C)
-#define RKISP1_CIF_ISP_HIST_BIN_11		(RKISP1_CIF_ISP_HIST_BASE + 0x00000040)
-#define RKISP1_CIF_ISP_HIST_BIN_12		(RKISP1_CIF_ISP_HIST_BASE + 0x00000044)
-#define RKISP1_CIF_ISP_HIST_BIN_13		(RKISP1_CIF_ISP_HIST_BASE + 0x00000048)
-#define RKISP1_CIF_ISP_HIST_BIN_14		(RKISP1_CIF_ISP_HIST_BASE + 0x0000004C)
-#define RKISP1_CIF_ISP_HIST_BIN_15		(RKISP1_CIF_ISP_HIST_BASE + 0x00000050)
-#define RKISP1_CIF_ISP_HIST_WEIGHT_00TO30	(RKISP1_CIF_ISP_HIST_BASE + 0x00000054)
-#define RKISP1_CIF_ISP_HIST_WEIGHT_40TO21	(RKISP1_CIF_ISP_HIST_BASE + 0x00000058)
-#define RKISP1_CIF_ISP_HIST_WEIGHT_31TO12	(RKISP1_CIF_ISP_HIST_BASE + 0x0000005C)
-#define RKISP1_CIF_ISP_HIST_WEIGHT_22TO03	(RKISP1_CIF_ISP_HIST_BASE + 0x00000060)
-#define RKISP1_CIF_ISP_HIST_WEIGHT_13TO43	(RKISP1_CIF_ISP_HIST_BASE + 0x00000064)
-#define RKISP1_CIF_ISP_HIST_WEIGHT_04TO34	(RKISP1_CIF_ISP_HIST_BASE + 0x00000068)
-#define RKISP1_CIF_ISP_HIST_WEIGHT_44		(RKISP1_CIF_ISP_HIST_BASE + 0x0000006C)
+#define RKISP1_CIF_ISP_HIST_BASE_V10		0x00002400
+#define RKISP1_CIF_ISP_HIST_PROP_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000000)
+#define RKISP1_CIF_ISP_HIST_H_OFFS_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000004)
+#define RKISP1_CIF_ISP_HIST_V_OFFS_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000008)
+#define RKISP1_CIF_ISP_HIST_H_SIZE_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x0000000C)
+#define RKISP1_CIF_ISP_HIST_V_SIZE_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000010)
+#define RKISP1_CIF_ISP_HIST_BIN_0_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000014)
+#define RKISP1_CIF_ISP_HIST_BIN_1_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000018)
+#define RKISP1_CIF_ISP_HIST_BIN_2_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x0000001C)
+#define RKISP1_CIF_ISP_HIST_BIN_3_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000020)
+#define RKISP1_CIF_ISP_HIST_BIN_4_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000024)
+#define RKISP1_CIF_ISP_HIST_BIN_5_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000028)
+#define RKISP1_CIF_ISP_HIST_BIN_6_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x0000002C)
+#define RKISP1_CIF_ISP_HIST_BIN_7_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000030)
+#define RKISP1_CIF_ISP_HIST_BIN_8_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000034)
+#define RKISP1_CIF_ISP_HIST_BIN_9_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000038)
+#define RKISP1_CIF_ISP_HIST_BIN_10_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x0000003C)
+#define RKISP1_CIF_ISP_HIST_BIN_11_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000040)
+#define RKISP1_CIF_ISP_HIST_BIN_12_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000044)
+#define RKISP1_CIF_ISP_HIST_BIN_13_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000048)
+#define RKISP1_CIF_ISP_HIST_BIN_14_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x0000004C)
+#define RKISP1_CIF_ISP_HIST_BIN_15_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000050)
+#define RKISP1_CIF_ISP_HIST_WEIGHT_00TO30_V10	(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000054)
+#define RKISP1_CIF_ISP_HIST_WEIGHT_40TO21_V10	(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000058)
+#define RKISP1_CIF_ISP_HIST_WEIGHT_31TO12_V10	(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x0000005C)
+#define RKISP1_CIF_ISP_HIST_WEIGHT_22TO03_V10	(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000060)
+#define RKISP1_CIF_ISP_HIST_WEIGHT_13TO43_V10	(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000064)
+#define RKISP1_CIF_ISP_HIST_WEIGHT_04TO34_V10	(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000068)
+#define RKISP1_CIF_ISP_HIST_WEIGHT_44_V10	(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x0000006C)
 
 #define RKISP1_CIF_ISP_FILT_BASE		0x00002500
 #define RKISP1_CIF_ISP_FILT_MODE		(RKISP1_CIF_ISP_FILT_BASE + 0x00000000)
@@ -1060,35 +1059,35 @@
 
 #define RKISP1_CIF_ISP_EXP_BASE			0x00002600
 #define RKISP1_CIF_ISP_EXP_CTRL			(RKISP1_CIF_ISP_EXP_BASE + 0x00000000)
-#define RKISP1_CIF_ISP_EXP_H_OFFSET		(RKISP1_CIF_ISP_EXP_BASE + 0x00000004)
-#define RKISP1_CIF_ISP_EXP_V_OFFSET		(RKISP1_CIF_ISP_EXP_BASE + 0x00000008)
-#define RKISP1_CIF_ISP_EXP_H_SIZE		(RKISP1_CIF_ISP_EXP_BASE + 0x0000000C)
-#define RKISP1_CIF_ISP_EXP_V_SIZE		(RKISP1_CIF_ISP_EXP_BASE + 0x00000010)
-#define RKISP1_CIF_ISP_EXP_MEAN_00		(RKISP1_CIF_ISP_EXP_BASE + 0x00000014)
-#define RKISP1_CIF_ISP_EXP_MEAN_10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000018)
-#define RKISP1_CIF_ISP_EXP_MEAN_20		(RKISP1_CIF_ISP_EXP_BASE + 0x0000001c)
-#define RKISP1_CIF_ISP_EXP_MEAN_30		(RKISP1_CIF_ISP_EXP_BASE + 0x00000020)
-#define RKISP1_CIF_ISP_EXP_MEAN_40		(RKISP1_CIF_ISP_EXP_BASE + 0x00000024)
-#define RKISP1_CIF_ISP_EXP_MEAN_01		(RKISP1_CIF_ISP_EXP_BASE + 0x00000028)
-#define RKISP1_CIF_ISP_EXP_MEAN_11		(RKISP1_CIF_ISP_EXP_BASE + 0x0000002c)
-#define RKISP1_CIF_ISP_EXP_MEAN_21		(RKISP1_CIF_ISP_EXP_BASE + 0x00000030)
-#define RKISP1_CIF_ISP_EXP_MEAN_31		(RKISP1_CIF_ISP_EXP_BASE + 0x00000034)
-#define RKISP1_CIF_ISP_EXP_MEAN_41		(RKISP1_CIF_ISP_EXP_BASE + 0x00000038)
-#define RKISP1_CIF_ISP_EXP_MEAN_02		(RKISP1_CIF_ISP_EXP_BASE + 0x0000003c)
-#define RKISP1_CIF_ISP_EXP_MEAN_12		(RKISP1_CIF_ISP_EXP_BASE + 0x00000040)
-#define RKISP1_CIF_ISP_EXP_MEAN_22		(RKISP1_CIF_ISP_EXP_BASE + 0x00000044)
-#define RKISP1_CIF_ISP_EXP_MEAN_32		(RKISP1_CIF_ISP_EXP_BASE + 0x00000048)
-#define RKISP1_CIF_ISP_EXP_MEAN_42		(RKISP1_CIF_ISP_EXP_BASE + 0x0000004c)
-#define RKISP1_CIF_ISP_EXP_MEAN_03		(RKISP1_CIF_ISP_EXP_BASE + 0x00000050)
-#define RKISP1_CIF_ISP_EXP_MEAN_13		(RKISP1_CIF_ISP_EXP_BASE + 0x00000054)
-#define RKISP1_CIF_ISP_EXP_MEAN_23		(RKISP1_CIF_ISP_EXP_BASE + 0x00000058)
-#define RKISP1_CIF_ISP_EXP_MEAN_33		(RKISP1_CIF_ISP_EXP_BASE + 0x0000005c)
-#define RKISP1_CIF_ISP_EXP_MEAN_43		(RKISP1_CIF_ISP_EXP_BASE + 0x00000060)
-#define RKISP1_CIF_ISP_EXP_MEAN_04		(RKISP1_CIF_ISP_EXP_BASE + 0x00000064)
-#define RKISP1_CIF_ISP_EXP_MEAN_14		(RKISP1_CIF_ISP_EXP_BASE + 0x00000068)
-#define RKISP1_CIF_ISP_EXP_MEAN_24		(RKISP1_CIF_ISP_EXP_BASE + 0x0000006c)
-#define RKISP1_CIF_ISP_EXP_MEAN_34		(RKISP1_CIF_ISP_EXP_BASE + 0x00000070)
-#define RKISP1_CIF_ISP_EXP_MEAN_44		(RKISP1_CIF_ISP_EXP_BASE + 0x00000074)
+#define RKISP1_CIF_ISP_EXP_H_OFFSET_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000004)
+#define RKISP1_CIF_ISP_EXP_V_OFFSET_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000008)
+#define RKISP1_CIF_ISP_EXP_H_SIZE_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x0000000C)
+#define RKISP1_CIF_ISP_EXP_V_SIZE_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000010)
+#define RKISP1_CIF_ISP_EXP_MEAN_00_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000014)
+#define RKISP1_CIF_ISP_EXP_MEAN_10_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000018)
+#define RKISP1_CIF_ISP_EXP_MEAN_20_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x0000001c)
+#define RKISP1_CIF_ISP_EXP_MEAN_30_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000020)
+#define RKISP1_CIF_ISP_EXP_MEAN_40_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000024)
+#define RKISP1_CIF_ISP_EXP_MEAN_01_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000028)
+#define RKISP1_CIF_ISP_EXP_MEAN_11_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x0000002c)
+#define RKISP1_CIF_ISP_EXP_MEAN_21_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000030)
+#define RKISP1_CIF_ISP_EXP_MEAN_31_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000034)
+#define RKISP1_CIF_ISP_EXP_MEAN_41_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000038)
+#define RKISP1_CIF_ISP_EXP_MEAN_02_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x0000003c)
+#define RKISP1_CIF_ISP_EXP_MEAN_12_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000040)
+#define RKISP1_CIF_ISP_EXP_MEAN_22_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000044)
+#define RKISP1_CIF_ISP_EXP_MEAN_32_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000048)
+#define RKISP1_CIF_ISP_EXP_MEAN_42_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x0000004c)
+#define RKISP1_CIF_ISP_EXP_MEAN_03_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000050)
+#define RKISP1_CIF_ISP_EXP_MEAN_13_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000054)
+#define RKISP1_CIF_ISP_EXP_MEAN_23_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000058)
+#define RKISP1_CIF_ISP_EXP_MEAN_33_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x0000005c)
+#define RKISP1_CIF_ISP_EXP_MEAN_43_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000060)
+#define RKISP1_CIF_ISP_EXP_MEAN_04_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000064)
+#define RKISP1_CIF_ISP_EXP_MEAN_14_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000068)
+#define RKISP1_CIF_ISP_EXP_MEAN_24_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x0000006c)
+#define RKISP1_CIF_ISP_EXP_MEAN_34_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000070)
+#define RKISP1_CIF_ISP_EXP_MEAN_44_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000074)
 
 #define RKISP1_CIF_ISP_BLS_BASE			0x00002700
 #define RKISP1_CIF_ISP_BLS_CTRL			(RKISP1_CIF_ISP_BLS_BASE + 0x00000000)
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
index e5743efecd1c..1156db31432f 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
@@ -175,18 +175,18 @@ rkisp1_stats_init_vb2_queue(struct vb2_queue *q, struct rkisp1_stats *stats)
 	return vb2_queue_init(q);
 }
 
-static void rkisp1_stats_get_awb_meas(struct rkisp1_stats *stats,
-				      struct rkisp1_stat_buffer *pbuf)
+static void rkisp1_stats_get_awb_meas_v10(struct rkisp1_stats *stats,
+					  struct rkisp1_stat_buffer *pbuf)
 {
 	/* Protect against concurrent access from ISR? */
 	struct rkisp1_device *rkisp1 = stats->rkisp1;
 	u32 reg_val;
 
 	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_AWB;
-	reg_val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB_WHITE_CNT);
+	reg_val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB_WHITE_CNT_V10);
 	pbuf->params.awb.awb_mean[0].cnt =
 				RKISP1_CIF_ISP_AWB_GET_PIXEL_CNT(reg_val);
-	reg_val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB_MEAN);
+	reg_val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB_MEAN_V10);
 
 	pbuf->params.awb.awb_mean[0].mean_cr_or_r =
 				RKISP1_CIF_ISP_AWB_GET_MEAN_CR_R(reg_val);
@@ -196,8 +196,8 @@ static void rkisp1_stats_get_awb_meas(struct rkisp1_stats *stats,
 				RKISP1_CIF_ISP_AWB_GET_MEAN_Y_G(reg_val);
 }
 
-static void rkisp1_stats_get_aec_meas(struct rkisp1_stats *stats,
-				      struct rkisp1_stat_buffer *pbuf)
+static void rkisp1_stats_get_aec_meas_v10(struct rkisp1_stats *stats,
+					  struct rkisp1_stat_buffer *pbuf)
 {
 	struct rkisp1_device *rkisp1 = stats->rkisp1;
 	unsigned int i;
@@ -206,7 +206,7 @@ static void rkisp1_stats_get_aec_meas(struct rkisp1_stats *stats,
 	for (i = 0; i < RKISP1_CIF_ISP_AE_MEAN_MAX_V10; i++)
 		pbuf->params.ae.exp_mean[i] =
 			(u8)rkisp1_read(rkisp1,
-					RKISP1_CIF_ISP_EXP_MEAN_00 + i * 4);
+					RKISP1_CIF_ISP_EXP_MEAN_00_V10 + i * 4);
 }
 
 static void rkisp1_stats_get_afc_meas(struct rkisp1_stats *stats,
@@ -226,17 +226,17 @@ static void rkisp1_stats_get_afc_meas(struct rkisp1_stats *stats,
 	af->window[2].lum = rkisp1_read(rkisp1, RKISP1_CIF_ISP_AFM_LUM_C);
 }
 
-static void rkisp1_stats_get_hst_meas(struct rkisp1_stats *stats,
-				      struct rkisp1_stat_buffer *pbuf)
+static void rkisp1_stats_get_hst_meas_v10(struct rkisp1_stats *stats,
+					  struct rkisp1_stat_buffer *pbuf)
 {
 	struct rkisp1_device *rkisp1 = stats->rkisp1;
 	unsigned int i;
 
 	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_HIST;
 	for (i = 0; i < RKISP1_CIF_ISP_HIST_BIN_N_MAX_V10; i++) {
-		u32 reg_val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_HIST_BIN_0 + i * 4);
+		u32 reg_val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_HIST_BIN_0_V10 + i * 4);
 
-		pbuf->params.hist.hist_bins[i] = RKISP1_CIF_ISP_HIST_GET_BIN(reg_val);
+		pbuf->params.hist.hist_bins[i] = RKISP1_CIF_ISP_HIST_GET_BIN_V10(reg_val);
 	}
 }
 
@@ -287,10 +287,10 @@ static void rkisp1_stats_get_bls_meas(struct rkisp1_stats *stats,
 	}
 }
 
-static const struct rkisp1_stats_ops rkisp1_stats_ops = {
-	.get_awb_meas = rkisp1_stats_get_awb_meas,
-	.get_aec_meas = rkisp1_stats_get_aec_meas,
-	.get_hst_meas = rkisp1_stats_get_hst_meas,
+static const struct rkisp1_stats_ops rkisp1_v10_stats_ops = {
+	.get_awb_meas = rkisp1_stats_get_awb_meas_v10,
+	.get_aec_meas = rkisp1_stats_get_aec_meas_v10,
+	.get_hst_meas = rkisp1_stats_get_hst_meas_v10,
 };
 
 static void
@@ -361,7 +361,7 @@ static void rkisp1_init_stats(struct rkisp1_stats *stats)
 	stats->vdev_fmt.fmt.meta.buffersize =
 		sizeof(struct rkisp1_stat_buffer);
 
-	stats->ops = &rkisp1_stats_ops;
+	stats->ops = &rkisp1_v10_stats_ops;
 }
 
 int rkisp1_stats_register(struct rkisp1_device *rkisp1)
-- 
2.29.2

