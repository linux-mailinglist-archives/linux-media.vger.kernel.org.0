Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52FDD22CB02
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 18:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgGXQ0I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 12:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726455AbgGXQ0H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 12:26:07 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54BF6C0619D3;
        Fri, 24 Jul 2020 09:26:07 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id BF34E29931C
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        kernel@collabora.com, dafna.hirschfeld@collabora.com,
        tfiga@chromium.org
Subject: [PATCH] media: staging: rkisp1: uapi: remove __packed
Date:   Fri, 24 Jul 2020 13:25:55 -0300
Message-Id: <20200724162555.393631-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.28.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver access struct's fields one by one, they are not blindly
copied to/from the hardware, so we can remove __packed from the
structs.

Tested on Scarlet Chromebook with ChromeOS stack and verified images
with the Camera app.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
---
 .../staging/media/rkisp1/uapi/rkisp1-config.h | 76 +++++++++----------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
index 8f9b061e5b6b6..dbcb5933185e3 100644
--- a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
+++ b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
@@ -163,7 +163,7 @@ struct rkisp1_cif_isp_window {
 	__u16 v_offs;
 	__u16 h_size;
 	__u16 v_size;
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_bls_fixed_val - BLS fixed subtraction values
@@ -181,7 +181,7 @@ struct rkisp1_cif_isp_bls_fixed_val {
 	__s16 gr;
 	__s16 gb;
 	__s16 b;
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_bls_config - Configuration used by black level subtraction
@@ -203,7 +203,7 @@ struct rkisp1_cif_isp_bls_config {
 	struct rkisp1_cif_isp_window bls_window2;
 	__u8 bls_samples;
 	struct rkisp1_cif_isp_bls_fixed_val fixed_val;
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_dpcc_methods_config - Methods Configuration used by DPCC
@@ -224,7 +224,7 @@ struct rkisp1_cif_isp_dpcc_methods_config {
 	__u32 pg_fac;
 	__u32 rnd_thresh;
 	__u32 rg_fac;
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_dpcc_config - Configuration used by DPCC
@@ -245,16 +245,16 @@ struct rkisp1_cif_isp_dpcc_config {
 	struct rkisp1_cif_isp_dpcc_methods_config methods[RKISP1_CIF_ISP_DPCC_METHODS_MAX];
 	__u32 ro_limits;
 	__u32 rnd_offs;
-} __packed;
+};
 
 struct rkisp1_cif_isp_gamma_corr_curve {
 	__u16 gamma_y[RKISP1_CIF_ISP_DEGAMMA_CURVE_SIZE];
-} __packed;
+};
 
 struct rkisp1_cif_isp_gamma_curve_x_axis_pnts {
 	__u32 gamma_dx0;
 	__u32 gamma_dx1;
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_sdg_config - Configuration used by sensor degamma
@@ -267,7 +267,7 @@ struct rkisp1_cif_isp_sdg_config {
 	struct rkisp1_cif_isp_gamma_corr_curve curve_g;
 	struct rkisp1_cif_isp_gamma_corr_curve curve_b;
 	struct rkisp1_cif_isp_gamma_curve_x_axis_pnts xa_pnts;
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_lsc_config - Configuration used by Lens shading correction
@@ -287,7 +287,7 @@ struct rkisp1_cif_isp_lsc_config {
 	__u32 y_size_tbl[RKISP1_CIF_ISP_LSC_SIZE_TBL_SIZE];
 	__u16 config_width;
 	__u16 config_height;
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_ie_config - Configuration used by image effects
@@ -308,7 +308,7 @@ struct rkisp1_cif_isp_ie_config {
 	__u16 eff_mat_4;
 	__u16 eff_mat_5;
 	__u16 eff_tint;
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_cproc_config - Configuration used by Color Processing
@@ -330,7 +330,7 @@ struct rkisp1_cif_isp_cproc_config {
 	__u8 brightness;
 	__u8 sat;
 	__u8 hue;
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_awb_meas_config - Configuration used by auto white balance
@@ -363,7 +363,7 @@ struct rkisp1_cif_isp_awb_meas_config {
 	__u8 awb_ref_cr;
 	__u8 awb_ref_cb;
 	__u8 enable_ymax_cmp;
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_awb_gain_config - Configuration used by auto white balance gain
@@ -375,7 +375,7 @@ struct rkisp1_cif_isp_awb_gain_config {
 	__u16 gain_green_r;
 	__u16 gain_blue;
 	__u16 gain_green_b;
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_flt_config - Configuration used by ISP filtering
@@ -403,7 +403,7 @@ struct rkisp1_cif_isp_flt_config {
 	__u32 fac_mid;
 	__u32 fac_bl0;
 	__u32 fac_bl1;
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_bdm_config - Configuration used by Bayer DeMosaic
@@ -412,7 +412,7 @@ struct rkisp1_cif_isp_flt_config {
  */
 struct rkisp1_cif_isp_bdm_config {
 	__u8 demosaic_th;
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_ctk_config - Configuration used by Cross Talk correction
@@ -433,7 +433,7 @@ struct rkisp1_cif_isp_ctk_config {
 	__u16 ct_offset_r;
 	__u16 ct_offset_g;
 	__u16 ct_offset_b;
-} __packed;
+};
 
 enum rkisp1_cif_isp_goc_mode {
 	RKISP1_CIF_ISP_GOC_MODE_LOGARITHMIC,
@@ -449,7 +449,7 @@ enum rkisp1_cif_isp_goc_mode {
 struct rkisp1_cif_isp_goc_config {
 	__u32 mode;
 	__u16 gamma_y[RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES];
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_hst_config - Configuration used by Histogram
@@ -465,7 +465,7 @@ struct rkisp1_cif_isp_hst_config {
 	__u8 histogram_predivider;
 	struct rkisp1_cif_isp_window meas_window;
 	__u8 hist_weight[RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE];
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_aec_config - Configuration used by Auto Exposure Control
@@ -478,7 +478,7 @@ struct rkisp1_cif_isp_aec_config {
 	__u32 mode;
 	__u32 autostop;
 	struct rkisp1_cif_isp_window meas_window;
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_afc_config - Configuration used by Auto Focus Control
@@ -494,7 +494,7 @@ struct rkisp1_cif_isp_afc_config {
 	struct rkisp1_cif_isp_window afm_win[RKISP1_CIF_ISP_AFM_MAX_WINDOWS];
 	__u32 thres;
 	__u32 var_shift;
-} __packed;
+};
 
 /**
  * enum rkisp1_cif_isp_dpf_gain_usage - dpf gain usage
@@ -549,7 +549,7 @@ enum rkisp1_cif_isp_dpf_nll_scale_mode {
 struct rkisp1_cif_isp_dpf_nll {
 	__u16 coeff[RKISP1_CIF_ISP_DPF_MAX_NLF_COEFFS];
 	__u32 scale_mode;
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_dpf_rb_flt - Red blue filter config
@@ -565,7 +565,7 @@ struct rkisp1_cif_isp_dpf_rb_flt {
 	__u8 spatial_coeff[RKISP1_CIF_ISP_DPF_MAX_SPATIAL_COEFFS];
 	__u8 r_enable;
 	__u8 b_enable;
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_dpf_g_flt - Green filter Configuration
@@ -578,7 +578,7 @@ struct rkisp1_cif_isp_dpf_g_flt {
 	__u8 spatial_coeff[RKISP1_CIF_ISP_DPF_MAX_SPATIAL_COEFFS];
 	__u8 gr_enable;
 	__u8 gb_enable;
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_dpf_gain - Noise function Configuration
@@ -597,7 +597,7 @@ struct rkisp1_cif_isp_dpf_gain {
 	__u16 nf_b_gain;
 	__u16 nf_gr_gain;
 	__u16 nf_gb_gain;
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_dpf_config - Configuration used by De-noising pre-filter
@@ -612,7 +612,7 @@ struct rkisp1_cif_isp_dpf_config {
 	struct rkisp1_cif_isp_dpf_g_flt g_flt;
 	struct rkisp1_cif_isp_dpf_rb_flt rb_flt;
 	struct rkisp1_cif_isp_dpf_nll nll;
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_dpf_strength_config - strength of the filter
@@ -625,7 +625,7 @@ struct rkisp1_cif_isp_dpf_strength_config {
 	__u8 r;
 	__u8 g;
 	__u8 b;
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_isp_other_cfg - Parameters for some blocks in rockchip isp1
@@ -659,7 +659,7 @@ struct rkisp1_cif_isp_isp_other_cfg {
 	struct rkisp1_cif_isp_dpf_strength_config dpf_strength_config;
 	struct rkisp1_cif_isp_cproc_config cproc_config;
 	struct rkisp1_cif_isp_ie_config ie_config;
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_isp_meas_cfg - Rockchip ISP1 Measure Parameters
@@ -674,7 +674,7 @@ struct rkisp1_cif_isp_isp_meas_cfg {
 	struct rkisp1_cif_isp_hst_config hst_config;
 	struct rkisp1_cif_isp_aec_config aec_config;
 	struct rkisp1_cif_isp_afc_config afc_config;
-} __packed;
+};
 
 /**
  * struct rkisp1_params_cfg - Rockchip ISP1 Input Parameters Meta Data
@@ -693,7 +693,7 @@ struct rkisp1_params_cfg {
 
 	struct rkisp1_cif_isp_isp_meas_cfg meas;
 	struct rkisp1_cif_isp_isp_other_cfg others;
-} __packed;
+};
 
 /*---------- PART2: Measurement Statistics ------------*/
 
@@ -714,7 +714,7 @@ struct rkisp1_cif_isp_awb_meas {
 	__u8 mean_y_or_g;
 	__u8 mean_cb_or_b;
 	__u8 mean_cr_or_r;
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_awb_stat - statistics automatic white balance data
@@ -723,7 +723,7 @@ struct rkisp1_cif_isp_awb_meas {
  */
 struct rkisp1_cif_isp_awb_stat {
 	struct rkisp1_cif_isp_awb_meas awb_mean[RKISP1_CIF_ISP_AWB_MAX_GRID];
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_bls_meas_val - BLS measured values
@@ -738,7 +738,7 @@ struct rkisp1_cif_isp_bls_meas_val {
 	__u16 meas_gr;
 	__u16 meas_gb;
 	__u16 meas_b;
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_ae_stat - statistics auto exposure data
@@ -751,7 +751,7 @@ struct rkisp1_cif_isp_bls_meas_val {
 struct rkisp1_cif_isp_ae_stat {
 	__u8 exp_mean[RKISP1_CIF_ISP_AE_MEAN_MAX];
 	struct rkisp1_cif_isp_bls_meas_val bls_val;
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_af_meas_val - AF measured values
@@ -762,7 +762,7 @@ struct rkisp1_cif_isp_ae_stat {
 struct rkisp1_cif_isp_af_meas_val {
 	__u32 sum;
 	__u32 lum;
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_af_stat - statistics auto focus data
@@ -774,7 +774,7 @@ struct rkisp1_cif_isp_af_meas_val {
  */
 struct rkisp1_cif_isp_af_stat {
 	struct rkisp1_cif_isp_af_meas_val window[RKISP1_CIF_ISP_AFM_MAX_WINDOWS];
-} __packed;
+};
 
 /**
  * struct rkisp1_cif_isp_hist_stat - statistics histogram data
@@ -786,7 +786,7 @@ struct rkisp1_cif_isp_af_stat {
  */
 struct rkisp1_cif_isp_hist_stat {
 	__u16 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
-} __packed;
+};
 
 /**
  * struct rkisp1_stat_buffer - Rockchip ISP1 Statistics Data
@@ -801,7 +801,7 @@ struct rkisp1_cif_isp_stat {
 	struct rkisp1_cif_isp_ae_stat ae;
 	struct rkisp1_cif_isp_af_stat af;
 	struct rkisp1_cif_isp_hist_stat hist;
-} __packed;
+};
 
 /**
  * struct rkisp1_stat_buffer - Rockchip ISP1 Statistics Meta Data
@@ -814,6 +814,6 @@ struct rkisp1_stat_buffer {
 	__u32 meas_type;
 	__u32 frame_id;
 	struct rkisp1_cif_isp_stat params;
-} __packed;
+};
 
 #endif /* _UAPI_RKISP1_CONFIG_H */
-- 
2.28.0.rc1

