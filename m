Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAA0C2175EA
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 20:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728266AbgGGSHv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 14:07:51 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35566 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728036AbgGGSHv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jul 2020 14:07:51 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id C62662A00D5
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH] media: staging: rkisp1: improve documentation in file rkisp1-config.h
Date:   Tue,  7 Jul 2020 20:07:41 +0200
Message-Id: <20200707180741.23816-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is some missing documentation of structs and
fields in rkisp1-config.h. This patch improves the
documentation.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 .../staging/media/rkisp1/uapi/rkisp1-config.h | 87 ++++++++++++++++---
 1 file changed, 73 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
index b2923b2833d3..7983498bda24 100644
--- a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
+++ b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
@@ -102,6 +102,7 @@
  */
 #define RKISP1_CIF_ISP_LSC_GRAD_TBL_SIZE           8
 #define RKISP1_CIF_ISP_LSC_SIZE_TBL_SIZE           8
+
 /*
  * The following matches the tuning process,
  * not the max capabilities of the chip.
@@ -176,6 +177,17 @@ enum rkisp1_cif_isp_exp_meas_mode {
 
 /*---------- PART1: Input Parameters ------------*/
 
+/**
+ * struct rkisp1_cif_isp_window -  measurement window.
+ *
+ * Measurements are calculated per window inside the frame.
+ * This struct represents a window for a measurement.
+ *
+ * @h_offs: the horizontal offset of the window from the left of the frame in pixels.
+ * @v_offs: the vertical offset of the window from the top of the frame in pixels.
+ * @h_size: the horizontal size of the window in pixels
+ * @v_size: the vertical size of the window in pixels.
+ */
 struct rkisp1_cif_isp_window {
 	__u16 h_offs;
 	__u16 v_offs;
@@ -265,10 +277,29 @@ struct rkisp1_cif_isp_dpcc_config {
 	__u32 rnd_offs;
 } __packed;
 
+/**
+ * struct rkisp1_cif_isp_gamma_corr_curve - gamma curve point definition y-axis (output).
+ *
+ * The reset values define a linear curve which has the same effect as bypass. Reset values are:
+ * gamma_y[0] = 0x0000, gamma_y[1] = 0x0100, ... gamma_y[15] = 0x0f00, gamma_y[16] = 0xfff
+ *
+ * @gamma_y: the values for the y-axis of gamma curve points. Each value is 12 bit.
+ */
 struct rkisp1_cif_isp_gamma_corr_curve {
 	__u16 gamma_y[RKISP1_CIF_ISP_DEGAMMA_CURVE_SIZE];
 } __packed;
 
+/**
+ * struct rkisp1_cif_isp_gamma_curve_x_axis_pnts - De-Gamma Curve definition x increments
+ *		(sampling points). gamma_dx0 is for the lower samples (1-8), gamma_dx1 is for the
+ *		higher samples (9-16). The reset values for both fields is 0x44444444. This means
+ *		that each sample is 4 units away from the previous one on the x-axis.
+ *
+ * @gamma_dx0: gamma curve sample points definitions. Bits 0:2 for sample 1. Bit 3 unused.
+ *		Bits 4:6 for sample 2. bit 7 unused ... Bits 28:30 for sample 8. Bit 31 unused
+ * @gamma_dx1: gamma curve sample points definitions. Bits 0:2 for sample 9. Bit 3 unused.
+ *		Bits 4:6 for sample 10. bit 7 unused ... Bits 28:30 for sample 16. Bit 31 unused
+ */
 struct rkisp1_cif_isp_gamma_curve_x_axis_pnts {
 	__u32 gamma_dx0;
 	__u32 gamma_dx1;
@@ -277,8 +308,10 @@ struct rkisp1_cif_isp_gamma_curve_x_axis_pnts {
 /**
  * struct rkisp1_cif_isp_sdg_config - Configuration used by sensor degamma
  *
- * @curve_x: gamma curve point definition axis for x
- * @xa_pnts: x increments
+ * @curve_r: gamma curve point definition axis for red
+ * @curve_g: gamma curve point definition axis for green
+ * @curve_b: gamma curve point definition axis for blue
+ * @xa_pnts: x axis increments
  */
 struct rkisp1_cif_isp_sdg_config {
 	struct rkisp1_cif_isp_gamma_corr_curve curve_r;
@@ -310,6 +343,11 @@ struct rkisp1_cif_isp_lsc_config {
 /**
  * struct rkisp1_cif_isp_ie_config - Configuration used by image effects
  *
+ * @effect: values from 'enum v4l2_colorfx'. Possible values are: V4L2_COLORFX_SEPIA,
+ *		V4L2_COLORFX_SET_CBCR, V4L2_COLORFX_AQUA, V4L2_COLORFX_EMBOSS,
+ *		V4L2_COLORFX_SKETCH,   V4L2_COLORFX_BW,   V4L2_COLORFX_NEGATIVE
+ * @color_sel: bits 0:2 - colors bitmask (001 - blue, 010 - green, 100 - red).
+ *		bits 8:15 - Threshold value of the RGB colors for the color selection effect.
  * @eff_mat_1: 3x3 Matrix Coefficients for Emboss Effect 1
  * @eff_mat_2: 3x3 Matrix Coefficients for Emboss Effect 2
  * @eff_mat_3: 3x3 Matrix Coefficients for Emboss 3/Sketch 1
@@ -353,8 +391,8 @@ struct rkisp1_cif_isp_cproc_config {
 /**
  * struct rkisp1_cif_isp_awb_meas_config - Configuration used by auto white balance
  *
+ * @awb_mode: the awb meas mode. From enum rkisp1_cif_isp_awb_mode_type.
  * @awb_wnd: white balance measurement window (in pixels)
- *	     (from enum rkisp1_cif_isp_awb_mode_type)
  * @max_y: only pixels values < max_y contribute to awb measurement, set to 0
  *	   to disable this feature
  * @min_y: only pixels values > min_y contribute to awb measurement
@@ -366,6 +404,7 @@ struct rkisp1_cif_isp_cproc_config {
  *	    (ucFrames=0 means 1 Frame)
  * @awb_ref_cr: reference Cr value for AWB regulation, target for AWB
  * @awb_ref_cb: reference Cb value for AWB regulation, target for AWB
+ * @enable_ymax_cmp: enable Y_MAX compare (Not valid in RGB measurement mode.)
  */
 struct rkisp1_cif_isp_awb_meas_config {
 	/*
@@ -386,7 +425,15 @@ struct rkisp1_cif_isp_awb_meas_config {
 /**
  * struct rkisp1_cif_isp_awb_gain_config - Configuration used by auto white balance gain
  *
- * out_data_x = ( AWB_GEAIN_X * in_data + 128) >> 8
+ * All fields in this struct are 10 bit, where:
+ * 0x100h = 1, unsigned integer value, range 0 to 4 with 8 bit fractional part.
+ *
+ * out_data_x = ( AWB_GAIN_X * in_data + 128) >> 8
+ *
+ * @gain_red: gain value for red component.
+ * @gain_green_r: gain value for green component in red line.
+ * @gain_blue: gain value for blue component.
+ * @gain_green_b: gain value for green component in blue line.
  */
 struct rkisp1_cif_isp_awb_gain_config {
 	__u16 gain_red;
@@ -398,12 +445,24 @@ struct rkisp1_cif_isp_awb_gain_config {
 /**
  * struct rkisp1_cif_isp_flt_config - Configuration used by ISP filtering
  *
+ * All 4 threshold fields (thresh_*) are 10 bits.
+ * All 6 factor fields (fac_*) are 6 bits.
+ *
  * @mode: ISP_FILT_MODE register fields (from enum rkisp1_cif_isp_flt_mode)
- * @grn_stage1: ISP_FILT_MODE register fields
- * @chr_h_mode: ISP_FILT_MODE register fields
- * @chr_v_mode: ISP_FILT_MODE register fields
+ * @grn_stage1: Green filter stage 1 select (range 0x0...0x8)
+ * @chr_h_mode: Chroma filter horizontal mode
+ * @chr_v_mode: Chroma filter vertical mode
+ * @thresh_bl0: If thresh_bl1 < sum_grad < thresh_bl0 then fac_bl0 is selected (blurring th)
+ * @thresh_bl1: If sum_grad < thresh_bl1 then fac_bl1 is selected (blurring th)
+ * @thresh_sh0: If thresh_sh0 < sum_grad < thresh_sh1 then thresh_sh0 is selected (sharpening th)
+ * @thresh_sh1: If thresh_sh1 < sum_grad then thresh_sh1 is selected (sharpening th)
+ * @lum_weight: Parameters for luminance weight function.
+ * @fac_sh1: filter factor for sharp1 level
+ * @fac_sh0: filter factor for sharp0 level
+ * @fac_mid: filter factor for mid level and for static filter mode
+ * @fac_bl0: filter factor for blur 0 level
+ * @fac_bl1: filter factor for blur 1 level (max blur)
  *
- * refer to REF_01 for details.
  */
 
 struct rkisp1_cif_isp_flt_config {
@@ -799,12 +858,12 @@ struct rkisp1_cif_isp_hist_stat {
 } __packed;
 
 /**
- * struct rkisp1_stat_buffer - Rockchip ISP1 Statistics Data
+ * struct rkisp1_cif_isp_stat - Rockchip ISP1 Statistics Data
  *
- * @rkisp1_cif_isp_awb_stat: statistics data for automatic white balance
- * @rkisp1_cif_isp_ae_stat: statistics data for auto exposure
- * @rkisp1_cif_isp_af_stat: statistics data for auto focus
- * @rkisp1_cif_isp_hist_stat: statistics histogram data
+ * @awb: statistics data for automatic white balance
+ * @ae: statistics data for auto exposure
+ * @af: statistics data for auto focus
+ * @hist: statistics histogram data
  */
 struct rkisp1_cif_isp_stat {
 	struct rkisp1_cif_isp_awb_stat awb;
@@ -816,7 +875,7 @@ struct rkisp1_cif_isp_stat {
 /**
  * struct rkisp1_stat_buffer - Rockchip ISP1 Statistics Meta Data
  *
- * @meas_type: measurement types (RKISP1_CIF_ISP_STAT_ definitions)
+ * @meas_type: measurement types (RKISP1_CIF_ISP_STAT_* definitions)
  * @frame_id: frame ID for sync
  * @params: statistics data
  */
-- 
2.17.1

