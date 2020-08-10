Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52BCA240D04
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 20:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbgHJSbm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 14:31:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728119AbgHJSbm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 14:31:42 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2F34C061756
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2020 11:31:41 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id E4F86296252
Subject: Re: [PATCH v2 4/4] media: staging: rkisp1: improve documentation in
 file rkisp1-config.h
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com, tfiga@chromium.org
References: <20200806115033.32475-1-dafna.hirschfeld@collabora.com>
 <20200806115033.32475-5-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <03b08ee1-a514-af68-1395-eea504b8cbc0@collabora.com>
Date:   Mon, 10 Aug 2020 15:31:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806115033.32475-5-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/6/20 8:50 AM, Dafna Hirschfeld wrote:
> There is some missing documentation of structs and
> fields in rkisp1-config.h. This patch improves the
> documentation.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks,
Helen

> ---
>  .../staging/media/rkisp1/uapi/rkisp1-config.h | 127 ++++++++++++++----
>  1 file changed, 103 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> index 76991b0073bb..6894ec768286 100644
> --- a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> +++ b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> @@ -4,11 +4,6 @@
>   * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
>   */
>  
> -/*
> - * TODO: Improve documentation, mostly regarding abbreviation and hardware
> - * specificities. Reference: "REF_01 - ISP_user_manual, Rev 2.57" (not public)
> - */
> -
>  #ifndef _UAPI_RKISP1_CONFIG_H
>  #define _UAPI_RKISP1_CONFIG_H
>  
> @@ -18,23 +13,41 @@
>  #define V4L2_META_FMT_RK_ISP1_PARAMS   v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 params */
>  #define V4L2_META_FMT_RK_ISP1_STAT_3A  v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A statistics */
>  
> +/* Defect Pixel Cluster Detection */
>  #define RKISP1_CIF_ISP_MODULE_DPCC		BIT(0)
> +/* Black Level Subtraction */
>  #define RKISP1_CIF_ISP_MODULE_BLS		BIT(1)
> +/* Sensor De-gamma */
>  #define RKISP1_CIF_ISP_MODULE_SDG		BIT(2)
> +/* Histogram */
>  #define RKISP1_CIF_ISP_MODULE_HST		BIT(3)
> +/* Lens Shade Control */
>  #define RKISP1_CIF_ISP_MODULE_LSC		BIT(4)
> +/* Auto White Balance Gain */
>  #define RKISP1_CIF_ISP_MODULE_AWB_GAIN		BIT(5)
> +/* Filter */
>  #define RKISP1_CIF_ISP_MODULE_FLT		BIT(6)
> +/* Bayer Demosaic */
>  #define RKISP1_CIF_ISP_MODULE_BDM		BIT(7)
> +/* Cross Talk */
>  #define RKISP1_CIF_ISP_MODULE_CTK		BIT(8)
> +/* Gamma Out Curve */
>  #define RKISP1_CIF_ISP_MODULE_GOC		BIT(9)
> +/* Color Processing */
>  #define RKISP1_CIF_ISP_MODULE_CPROC		BIT(10)
> +/* Auto Focus Control */
>  #define RKISP1_CIF_ISP_MODULE_AFC		BIT(11)
> +/* Auto White Balancing */
>  #define RKISP1_CIF_ISP_MODULE_AWB		BIT(12)
> +/* Image Effect */
>  #define RKISP1_CIF_ISP_MODULE_IE		BIT(13)
> +/* Auto Exposure Control */
>  #define RKISP1_CIF_ISP_MODULE_AEC		BIT(14)
> +/* Wide Dynamic Range */
>  #define RKISP1_CIF_ISP_MODULE_WDR		BIT(15)
> +/* Denoise Pre-Filter */
>  #define RKISP1_CIF_ISP_MODULE_DPF		BIT(16)
> +/* Denoise Pre-Filter Strength */
>  #define RKISP1_CIF_ISP_MODULE_DPF_STRENGTH	BIT(17)
>  
>  #define RKISP1_CIF_ISP_CTK_COEFF_MAX            0x100
> @@ -84,6 +97,7 @@
>   */
>  #define RKISP1_CIF_ISP_LSC_GRAD_TBL_SIZE           8
>  #define RKISP1_CIF_ISP_LSC_SIZE_TBL_SIZE           8
> +
>  /*
>   * The following matches the tuning process,
>   * not the max capabilities of the chip.
> @@ -158,6 +172,17 @@ enum rkisp1_cif_isp_exp_meas_mode {
>  
>  /*---------- PART1: Input Parameters ------------*/
>  
> +/**
> + * struct rkisp1_cif_isp_window -  measurement window.
> + *
> + * Measurements are calculated per window inside the frame.
> + * This struct represents a window for a measurement.
> + *
> + * @h_offs: the horizontal offset of the window from the left of the frame in pixels.
> + * @v_offs: the vertical offset of the window from the top of the frame in pixels.
> + * @h_size: the horizontal size of the window in pixels
> + * @v_size: the vertical size of the window in pixels.
> + */
>  struct rkisp1_cif_isp_window {
>  	__u16 h_offs;
>  	__u16 v_offs;
> @@ -247,10 +272,29 @@ struct rkisp1_cif_isp_dpcc_config {
>  	__u32 rnd_offs;
>  } __packed;
>  
> +/**
> + * struct rkisp1_cif_isp_gamma_corr_curve - gamma curve point definition y-axis (output).
> + *
> + * The reset values define a linear curve which has the same effect as bypass. Reset values are:
> + * gamma_y[0] = 0x0000, gamma_y[1] = 0x0100, ... gamma_y[15] = 0x0f00, gamma_y[16] = 0xfff
> + *
> + * @gamma_y: the values for the y-axis of gamma curve points. Each value is 12 bit.
> + */
>  struct rkisp1_cif_isp_gamma_corr_curve {
>  	__u16 gamma_y[RKISP1_CIF_ISP_DEGAMMA_CURVE_SIZE];
>  } __packed;
>  
> +/**
> + * struct rkisp1_cif_isp_gamma_curve_x_axis_pnts - De-Gamma Curve definition x increments
> + *		(sampling points). gamma_dx0 is for the lower samples (1-8), gamma_dx1 is for the
> + *		higher samples (9-16). The reset values for both fields is 0x44444444. This means
> + *		that each sample is 4 units away from the previous one on the x-axis.
> + *
> + * @gamma_dx0: gamma curve sample points definitions. Bits 0:2 for sample 1. Bit 3 unused.
> + *		Bits 4:6 for sample 2. bit 7 unused ... Bits 28:30 for sample 8. Bit 31 unused
> + * @gamma_dx1: gamma curve sample points definitions. Bits 0:2 for sample 9. Bit 3 unused.
> + *		Bits 4:6 for sample 10. bit 7 unused ... Bits 28:30 for sample 16. Bit 31 unused
> + */
>  struct rkisp1_cif_isp_gamma_curve_x_axis_pnts {
>  	__u32 gamma_dx0;
>  	__u32 gamma_dx1;
> @@ -259,8 +303,10 @@ struct rkisp1_cif_isp_gamma_curve_x_axis_pnts {
>  /**
>   * struct rkisp1_cif_isp_sdg_config - Configuration used by sensor degamma
>   *
> - * @curve_x: gamma curve point definition axis for x
> - * @xa_pnts: x increments
> + * @curve_r: gamma curve point definition axis for red
> + * @curve_g: gamma curve point definition axis for green
> + * @curve_b: gamma curve point definition axis for blue
> + * @xa_pnts: x axis increments
>   */
>  struct rkisp1_cif_isp_sdg_config {
>  	struct rkisp1_cif_isp_gamma_corr_curve curve_r;
> @@ -272,7 +318,16 @@ struct rkisp1_cif_isp_sdg_config {
>  /**
>   * struct rkisp1_cif_isp_lsc_config - Configuration used by Lens shading correction
>   *
> - * refer to REF_01 for details
> + * @r_data_tbl: sample table red
> + * @gr_data_tbl: sample table green (red)
> + * @gb_data_tbl: sample table green (blue)
> + * @b_data_tbl: sample table blue
> + * @x_grad_tbl: gradient table x
> + * @y_grad_tbl: gradient table y
> + * @x_size_tbl: size table x
> + * @y_size_tbl: size table y
> + * @config_width: not used at the moment
> + * @config_height: not used at the moment
>   */
>  struct rkisp1_cif_isp_lsc_config {
>  	__u32 r_data_tbl[RKISP1_CIF_ISP_LSC_DATA_TBL_SIZE];
> @@ -292,6 +347,11 @@ struct rkisp1_cif_isp_lsc_config {
>  /**
>   * struct rkisp1_cif_isp_ie_config - Configuration used by image effects
>   *
> + * @effect: values from 'enum v4l2_colorfx'. Possible values are: V4L2_COLORFX_SEPIA,
> + *		V4L2_COLORFX_SET_CBCR, V4L2_COLORFX_AQUA, V4L2_COLORFX_EMBOSS,
> + *		V4L2_COLORFX_SKETCH,   V4L2_COLORFX_BW,   V4L2_COLORFX_NEGATIVE
> + * @color_sel: bits 0:2 - colors bitmask (001 - blue, 010 - green, 100 - red).
> + *		bits 8:15 - Threshold value of the RGB colors for the color selection effect.
>   * @eff_mat_1: 3x3 Matrix Coefficients for Emboss Effect 1
>   * @eff_mat_2: 3x3 Matrix Coefficients for Emboss Effect 2
>   * @eff_mat_3: 3x3 Matrix Coefficients for Emboss 3/Sketch 1
> @@ -335,8 +395,8 @@ struct rkisp1_cif_isp_cproc_config {
>  /**
>   * struct rkisp1_cif_isp_awb_meas_config - Configuration used by auto white balance
>   *
> + * @awb_mode: the awb meas mode. From enum rkisp1_cif_isp_awb_mode_type.
>   * @awb_wnd: white balance measurement window (in pixels)
> - *	     (from enum rkisp1_cif_isp_awb_mode_type)
>   * @max_y: only pixels values < max_y contribute to awb measurement, set to 0
>   *	   to disable this feature
>   * @min_y: only pixels values > min_y contribute to awb measurement
> @@ -348,6 +408,7 @@ struct rkisp1_cif_isp_cproc_config {
>   *	    (ucFrames=0 means 1 Frame)
>   * @awb_ref_cr: reference Cr value for AWB regulation, target for AWB
>   * @awb_ref_cb: reference Cb value for AWB regulation, target for AWB
> + * @enable_ymax_cmp: enable Y_MAX compare (Not valid in RGB measurement mode.)
>   */
>  struct rkisp1_cif_isp_awb_meas_config {
>  	/*
> @@ -368,7 +429,15 @@ struct rkisp1_cif_isp_awb_meas_config {
>  /**
>   * struct rkisp1_cif_isp_awb_gain_config - Configuration used by auto white balance gain
>   *
> - * out_data_x = ( AWB_GEAIN_X * in_data + 128) >> 8
> + * All fields in this struct are 10 bit, where:
> + * 0x100h = 1, unsigned integer value, range 0 to 4 with 8 bit fractional part.
> + *
> + * out_data_x = ( AWB_GAIN_X * in_data + 128) >> 8
> + *
> + * @gain_red: gain value for red component.
> + * @gain_green_r: gain value for green component in red line.
> + * @gain_blue: gain value for blue component.
> + * @gain_green_b: gain value for green component in blue line.
>   */
>  struct rkisp1_cif_isp_awb_gain_config {
>  	__u16 gain_red;
> @@ -380,14 +449,24 @@ struct rkisp1_cif_isp_awb_gain_config {
>  /**
>   * struct rkisp1_cif_isp_flt_config - Configuration used by ISP filtering
>   *
> - * @mode: ISP_FILT_MODE register fields (from enum rkisp1_cif_isp_flt_mode)
> - * @grn_stage1: ISP_FILT_MODE register fields
> - * @chr_h_mode: ISP_FILT_MODE register fields
> - * @chr_v_mode: ISP_FILT_MODE register fields
> + * All 4 threshold fields (thresh_*) are 10 bits.
> + * All 6 factor fields (fac_*) are 6 bits.
>   *
> - * refer to REF_01 for details.
> + * @mode: ISP_FILT_MODE register fields (from enum rkisp1_cif_isp_flt_mode)
> + * @grn_stage1: Green filter stage 1 select (range 0x0...0x8)
> + * @chr_h_mode: Chroma filter horizontal mode
> + * @chr_v_mode: Chroma filter vertical mode
> + * @thresh_bl0: If thresh_bl1 < sum_grad < thresh_bl0 then fac_bl0 is selected (blurring th)
> + * @thresh_bl1: If sum_grad < thresh_bl1 then fac_bl1 is selected (blurring th)
> + * @thresh_sh0: If thresh_sh0 < sum_grad < thresh_sh1 then thresh_sh0 is selected (sharpening th)
> + * @thresh_sh1: If thresh_sh1 < sum_grad then thresh_sh1 is selected (sharpening th)
> + * @lum_weight: Parameters for luminance weight function.
> + * @fac_sh1: filter factor for sharp1 level
> + * @fac_sh0: filter factor for sharp0 level
> + * @fac_mid: filter factor for mid level and for static filter mode
> + * @fac_bl0: filter factor for blur 0 level
> + * @fac_bl1: filter factor for blur 1 level (max blur)
>   */
> -
>  struct rkisp1_cif_isp_flt_config {
>  	__u32 mode;
>  	__u8 grn_stage1;
> @@ -748,8 +827,8 @@ struct rkisp1_cif_isp_ae_stat {
>  /**
>   * struct rkisp1_cif_isp_af_meas_val - AF measured values
>   *
> - * @sum: sharpness, refer to REF_01 for definition
> - * @lum: luminance, refer to REF_01 for definition
> + * @sum: sharpness value
> + * @lum: luminance value
>   */
>  struct rkisp1_cif_isp_af_meas_val {
>  	__u32 sum;
> @@ -781,12 +860,12 @@ struct rkisp1_cif_isp_hist_stat {
>  } __packed;
>  
>  /**
> - * struct rkisp1_stat_buffer - Rockchip ISP1 Statistics Data
> + * struct rkisp1_cif_isp_stat - Rockchip ISP1 Statistics Data
>   *
> - * @rkisp1_cif_isp_awb_stat: statistics data for automatic white balance
> - * @rkisp1_cif_isp_ae_stat: statistics data for auto exposure
> - * @rkisp1_cif_isp_af_stat: statistics data for auto focus
> - * @rkisp1_cif_isp_hist_stat: statistics histogram data
> + * @awb: statistics data for automatic white balance
> + * @ae: statistics data for auto exposure
> + * @af: statistics data for auto focus
> + * @hist: statistics histogram data
>   */
>  struct rkisp1_cif_isp_stat {
>  	struct rkisp1_cif_isp_awb_stat awb;
> @@ -798,7 +877,7 @@ struct rkisp1_cif_isp_stat {
>  /**
>   * struct rkisp1_stat_buffer - Rockchip ISP1 Statistics Meta Data
>   *
> - * @meas_type: measurement types (RKISP1_CIF_ISP_STAT_ definitions)
> + * @meas_type: measurement types (RKISP1_CIF_ISP_STAT_* definitions)
>   * @frame_id: frame ID for sync
>   * @params: statistics data
>   */
> 
