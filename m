Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 272C03C651C
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 22:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbhGLUvX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 16:51:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbhGLUvW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 16:51:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B348EC0613DD;
        Mon, 12 Jul 2021 13:48:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECA8CCC;
        Mon, 12 Jul 2021 22:48:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1626122912;
        bh=9Ov4oVQk8e2SYIZq2V0bgRNztI5BEqRh1Y1fseZ6XB8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NJuTp0qoBKb8GVLSmTab200POCA2TNO+IY41i3AKfz5MoquL8KqK/RrUAOrzNqoUV
         X3bPlGQ9GWftRbZhb0MWPoqyGg0b8KJo5WSJADKFGgBjHxV/wQ12DJtMlx7KRI9FYl
         R6KlMK8hBZXH93ePfaTNB8LJEdwPzRyL1ib+fzJ8=
Date:   Mon, 12 Jul 2021 23:47:45 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@collabora.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, linux-rockchip@lists.infradead.org,
        linux-media@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: Re: [PATCH v6 08/10] media: rockchip: rkisp1: add support for v12
 isp variants
Message-ID: <YOyqcVKJf2fO3RPr@pendragon.ideasonboard.com>
References: <20210618130238.4171196-1-heiko@sntech.de>
 <20210618130238.4171196-9-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210618130238.4171196-9-heiko@sntech.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Heiko,

Thank you for the patch.

On Fri, Jun 18, 2021 at 03:02:36PM +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> The rkisp1 evolved over soc generations and the rk3326/px30 introduced
> the so called v12 - probably meaning v1.2.
> 
> Add the new register definitions.

I don't like asking for yak shaving (despite the appearances), but I
think the differences between v10 and v12 should be documented. Would it
be possible to start outlining those differences in a new
Documentation/driver-api/media/drivers/rkisp1.rst file ?

> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     |  13 +
>  .../platform/rockchip/rkisp1/rkisp1-params.c  | 338 +++++++++++++++++-
>  .../platform/rockchip/rkisp1/rkisp1-regs.h    | 143 ++++++++
>  .../platform/rockchip/rkisp1/rkisp1-stats.c   |  73 +++-
>  4 files changed, 565 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 1de98e688008..36829e3bdda0 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -408,6 +408,10 @@ static int rkisp1_config_mipi(struct rkisp1_device *rkisp1)
>  
>  	rkisp1_write(rkisp1, mipi_ctrl, RKISP1_CIF_MIPI_CTRL);
>  
> +	/* V12 could also use a newer csi2-host, but we don't want that yet */
> +	if (rkisp1->media_dev.hw_revision == RKISP1_V12)
> +		rkisp1_write(rkisp1, 0, RKISP1_CIF_ISP_CSI0_CTRL0);
> +
>  	/* Configure Data Type and Virtual Channel */
>  	rkisp1_write(rkisp1,
>  		     RKISP1_CIF_MIPI_DATA_SEL_DT(sink_fmt->mipi_dt) |
> @@ -527,6 +531,15 @@ static void rkisp1_config_clk(struct rkisp1_device *rkisp1)
>  		  RKISP1_CIF_ICCL_DCROP_CLK;
>  
>  	rkisp1_write(rkisp1, val, RKISP1_CIF_ICCL);
> +
> +	/* ensure sp and mp can run at the same time in V12 */
> +	if (rkisp1->media_dev.hw_revision == RKISP1_V12) {
> +		val = RKISP1_CIF_CLK_CTRL_MI_Y12 | RKISP1_CIF_CLK_CTRL_MI_SP |
> +		      RKISP1_CIF_CLK_CTRL_MI_RAW0 | RKISP1_CIF_CLK_CTRL_MI_RAW1 |
> +		      RKISP1_CIF_CLK_CTRL_MI_READ | RKISP1_CIF_CLK_CTRL_MI_RAWRD |
> +		      RKISP1_CIF_CLK_CTRL_CP | RKISP1_CIF_CLK_CTRL_IE;
> +		rkisp1_write(rkisp1, val, RKISP1_CIF_VI_ISP_CLK_CTRL_V12);
> +	}
>  }
>  
>  static void rkisp1_isp_start(struct rkisp1_device *rkisp1)
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 31a2194e003d..de56fdd9124a 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -255,6 +255,78 @@ rkisp1_lsc_matrix_config_v10(struct rkisp1_params *params,
>  		     RKISP1_CIF_ISP_LSC_TABLE_SEL);
>  }
>  
> +static void
> +rkisp1_lsc_matrix_config_v12(struct rkisp1_params *params,
> +			     const struct rkisp1_cif_isp_lsc_config *pconfig)
> +{
> +	unsigned int isp_lsc_status, sram_addr, isp_lsc_table_sel, i, j, data;
> +
> +	isp_lsc_status = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_LSC_STATUS);
> +
> +	/* RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_153 = ( 17 * 18 ) >> 1 */
> +	sram_addr = (isp_lsc_status & RKISP1_CIF_ISP_LSC_ACTIVE_TABLE) ?
> +		     RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_0 :
> +		     RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_153;
> +	rkisp1_write(params->rkisp1, sram_addr, RKISP1_CIF_ISP_LSC_R_TABLE_ADDR);
> +	rkisp1_write(params->rkisp1, sram_addr, RKISP1_CIF_ISP_LSC_GR_TABLE_ADDR);
> +	rkisp1_write(params->rkisp1, sram_addr, RKISP1_CIF_ISP_LSC_GB_TABLE_ADDR);
> +	rkisp1_write(params->rkisp1, sram_addr, RKISP1_CIF_ISP_LSC_B_TABLE_ADDR);
> +
> +	/* program data tables (table size is 9 * 17 = 153) */
> +	for (i = 0; i < RKISP1_CIF_ISP_LSC_SAMPLES_MAX; i++) {
> +		/*
> +		 * 17 sectors with 2 values in one DWORD = 9
> +		 * DWORDs (2nd value of last DWORD unused)
> +		 */
> +		for (j = 0; j < RKISP1_CIF_ISP_LSC_SAMPLES_MAX - 1; j += 2) {
> +			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
> +					pconfig->r_data_tbl[i][j],
> +					pconfig->r_data_tbl[i][j + 1]);
> +			rkisp1_write(params->rkisp1, data,
> +				     RKISP1_CIF_ISP_LSC_R_TABLE_DATA);
> +
> +			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
> +					pconfig->gr_data_tbl[i][j],
> +					pconfig->gr_data_tbl[i][j + 1]);
> +			rkisp1_write(params->rkisp1, data,
> +				     RKISP1_CIF_ISP_LSC_GR_TABLE_DATA);
> +
> +			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
> +					pconfig->gb_data_tbl[i][j],
> +					pconfig->gb_data_tbl[i][j + 1]);
> +			rkisp1_write(params->rkisp1, data,
> +				     RKISP1_CIF_ISP_LSC_GB_TABLE_DATA);
> +
> +			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
> +					pconfig->b_data_tbl[i][j],
> +					pconfig->b_data_tbl[i][j + 1]);
> +			rkisp1_write(params->rkisp1, data,
> +				     RKISP1_CIF_ISP_LSC_B_TABLE_DATA);
> +		}
> +
> +		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(pconfig->r_data_tbl[i][j], 0);
> +		rkisp1_write(params->rkisp1, data,
> +			     RKISP1_CIF_ISP_LSC_R_TABLE_DATA);
> +
> +		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(pconfig->gr_data_tbl[i][j], 0);
> +		rkisp1_write(params->rkisp1, data,
> +			     RKISP1_CIF_ISP_LSC_GR_TABLE_DATA);
> +
> +		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(pconfig->gb_data_tbl[i][j], 0);
> +		rkisp1_write(params->rkisp1, data,
> +			     RKISP1_CIF_ISP_LSC_GB_TABLE_DATA);
> +
> +		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(pconfig->b_data_tbl[i][j], 0);
> +		rkisp1_write(params->rkisp1, data,
> +			     RKISP1_CIF_ISP_LSC_B_TABLE_DATA);
> +	}
> +	isp_lsc_table_sel = (isp_lsc_status & RKISP1_CIF_ISP_LSC_ACTIVE_TABLE) ?
> +			    RKISP1_CIF_ISP_LSC_TABLE_0 :
> +			    RKISP1_CIF_ISP_LSC_TABLE_1;
> +	rkisp1_write(params->rkisp1, isp_lsc_table_sel,
> +		     RKISP1_CIF_ISP_LSC_TABLE_SEL);
> +}
> +
>  static void rkisp1_lsc_config(struct rkisp1_params *params,
>  			      const struct rkisp1_cif_isp_lsc_config *arg)
>  {
> @@ -396,6 +468,25 @@ static void rkisp1_goc_config_v10(struct rkisp1_params *params,
>  			     RKISP1_CIF_ISP_GAMMA_OUT_Y_0_V10 + i * 4);
>  }
>  
> +static void rkisp1_goc_config_v12(struct rkisp1_params *params,
> +				  const struct rkisp1_cif_isp_goc_config *arg)
> +{
> +	unsigned int i;
> +	u32 value;
> +
> +	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
> +				RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
> +	rkisp1_write(params->rkisp1, arg->mode, RKISP1_CIF_ISP_GAMMA_OUT_MODE_V12);
> +
> +	for (i = 0; i < RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V12 / 2; i++) {
> +		value = RKISP1_CIF_ISP_GAMMA_VALUE_V12(
> +			arg->gamma_y[2 * i + 1],
> +			arg->gamma_y[2 * i]);
> +		rkisp1_write(params->rkisp1, value,
> +			     RKISP1_CIF_ISP_GAMMA_OUT_Y_0_V12 + i * 4);
> +	}
> +}
> +
>  /* ISP Cross Talk */
>  static void rkisp1_ctk_config(struct rkisp1_params *params,
>  			      const struct rkisp1_cif_isp_ctk_config *arg)
> @@ -473,6 +564,45 @@ static void rkisp1_awb_meas_config_v10(struct rkisp1_params *params,
>  		     arg->frames, RKISP1_CIF_ISP_AWB_FRAMES_V10);
>  }
>  
> +static void rkisp1_awb_meas_config_v12(struct rkisp1_params *params,
> +				       const struct rkisp1_cif_isp_awb_meas_config *arg)
> +{
> +	u32 reg_val = 0;
> +	/* based on the mode,configure the awb module */
> +	if (arg->awb_mode == RKISP1_CIF_ISP_AWB_MODE_YCBCR) {
> +		/* Reference Cb and Cr */
> +		rkisp1_write(params->rkisp1,
> +			     RKISP1_CIF_ISP_AWB_REF_CR_SET(arg->awb_ref_cr) |
> +			     arg->awb_ref_cb, RKISP1_CIF_ISP_AWB_REF_V12);
> +		/* Yc Threshold */
> +		rkisp1_write(params->rkisp1,
> +			     RKISP1_CIF_ISP_AWB_MAX_Y_SET(arg->max_y) |
> +			     RKISP1_CIF_ISP_AWB_MIN_Y_SET(arg->min_y) |
> +			     RKISP1_CIF_ISP_AWB_MAX_CS_SET(arg->max_csum) |
> +			     arg->min_c, RKISP1_CIF_ISP_AWB_THRESH_V12);
> +	}
> +
> +	reg_val = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_AWB_PROP_V12);
> +	if (arg->enable_ymax_cmp)
> +		reg_val |= RKISP1_CIF_ISP_AWB_YMAX_CMP_EN;
> +	else
> +		reg_val &= ~RKISP1_CIF_ISP_AWB_YMAX_CMP_EN;
> +	reg_val &= ~RKISP1_CIF_ISP_AWB_SET_FRAMES_MASK_V12;
> +	reg_val |= RKISP1_CIF_ISP_AWB_SET_FRAMES_V12(arg->frames);
> +	rkisp1_write(params->rkisp1, reg_val, RKISP1_CIF_ISP_AWB_PROP_V12);
> +
> +	/* window offset */
> +	rkisp1_write(params->rkisp1,
> +		     arg->awb_wnd.v_offs << 16 |
> +		     arg->awb_wnd.h_offs,
> +		     RKISP1_CIF_ISP_AWB_OFFS_V12);
> +	/* AWB window size */
> +	rkisp1_write(params->rkisp1,
> +		     arg->awb_wnd.v_size << 16 |
> +		     arg->awb_wnd.h_size,
> +		     RKISP1_CIF_ISP_AWB_SIZE_V12);
> +}
> +
>  static void
>  rkisp1_awb_meas_enable_v10(struct rkisp1_params *params,
>  			   const struct rkisp1_cif_isp_awb_meas_config *arg,
> @@ -502,6 +632,35 @@ rkisp1_awb_meas_enable_v10(struct rkisp1_params *params,
>  	}
>  }
>  
> +static void
> +rkisp1_awb_meas_enable_v12(struct rkisp1_params *params,
> +			   const struct rkisp1_cif_isp_awb_meas_config *arg,
> +			   bool en)
> +{
> +	u32 reg_val = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_AWB_PROP_V12);
> +
> +	/* switch off */
> +	reg_val &= RKISP1_CIF_ISP_AWB_MODE_MASK_NONE;
> +
> +	if (en) {
> +		if (arg->awb_mode == RKISP1_CIF_ISP_AWB_MODE_RGB)
> +			reg_val |= RKISP1_CIF_ISP_AWB_MODE_RGB_EN;
> +		else
> +			reg_val |= RKISP1_CIF_ISP_AWB_MODE_YCBCR_EN;
> +
> +		rkisp1_write(params->rkisp1, reg_val, RKISP1_CIF_ISP_AWB_PROP_V12);
> +
> +		/* Measurements require AWB block be active. */
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> +				      RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
> +	} else {
> +		rkisp1_write(params->rkisp1,
> +			     reg_val, RKISP1_CIF_ISP_AWB_PROP_V12);
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
> +					RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
> +	}
> +}
> +
>  static void
>  rkisp1_awb_gain_config_v10(struct rkisp1_params *params,
>  			   const struct rkisp1_cif_isp_awb_gain_config *arg)
> @@ -515,6 +674,19 @@ rkisp1_awb_gain_config_v10(struct rkisp1_params *params,
>  		     arg->gain_blue, RKISP1_CIF_ISP_AWB_GAIN_RB_V10);
>  }
>  
> +static void
> +rkisp1_awb_gain_config_v12(struct rkisp1_params *params,
> +			   const struct rkisp1_cif_isp_awb_gain_config *arg)
> +{
> +	rkisp1_write(params->rkisp1,
> +		     RKISP1_CIF_ISP_AWB_GAIN_R_SET(arg->gain_green_r) |
> +		     arg->gain_green_b, RKISP1_CIF_ISP_AWB_GAIN_G_V12);
> +
> +	rkisp1_write(params->rkisp1,
> +		     RKISP1_CIF_ISP_AWB_GAIN_R_SET(arg->gain_red) |
> +		     arg->gain_blue, RKISP1_CIF_ISP_AWB_GAIN_RB_V12);
> +}
> +
>  static void rkisp1_aec_config_v10(struct rkisp1_params *params,
>  				  const struct rkisp1_cif_isp_aec_config *arg)
>  {
> @@ -548,6 +720,38 @@ static void rkisp1_aec_config_v10(struct rkisp1_params *params,
>  		     RKISP1_CIF_ISP_EXP_V_SIZE_V10);
>  }
>  
> +static void rkisp1_aec_config_v12(struct rkisp1_params *params,
> +			       const struct rkisp1_cif_isp_aec_config *arg)
> +{
> +	u32 exp_ctrl;
> +	u32 block_hsize, block_vsize;
> +	u32 wnd_num_idx = 1;
> +	const u32 ae_wnd_num[] = { 5, 9, 15, 15 };
> +
> +	/* avoid to override the old enable value */
> +	exp_ctrl = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_EXP_CTRL);
> +	exp_ctrl &= RKISP1_CIF_ISP_EXP_ENA;
> +	if (arg->autostop)
> +		exp_ctrl |= RKISP1_CIF_ISP_EXP_CTRL_AUTOSTOP;
> +	if (arg->mode == RKISP1_CIF_ISP_EXP_MEASURING_MODE_1)
> +		exp_ctrl |= RKISP1_CIF_ISP_EXP_CTRL_MEASMODE_1;
> +	exp_ctrl |= RKISP1_CIF_ISP_EXP_CTRL_WNDNUM_SET_V12(wnd_num_idx);
> +	rkisp1_write(params->rkisp1, exp_ctrl, RKISP1_CIF_ISP_EXP_CTRL);
> +
> +	rkisp1_write(params->rkisp1,
> +		     RKISP1_CIF_ISP_EXP_V_OFFSET_SET_V12(arg->meas_window.v_offs) |
> +		     RKISP1_CIF_ISP_EXP_H_OFFSET_SET_V12(arg->meas_window.h_offs),
> +		     RKISP1_CIF_ISP_EXP_OFFS_V12);
> +
> +	block_hsize = arg->meas_window.h_size / ae_wnd_num[wnd_num_idx] - 1;
> +	block_vsize = arg->meas_window.v_size / ae_wnd_num[wnd_num_idx] - 1;
> +
> +	rkisp1_write(params->rkisp1,
> +		     RKISP1_CIF_ISP_EXP_V_SIZE_SET_V12(block_vsize) |
> +		     RKISP1_CIF_ISP_EXP_H_SIZE_SET_V12(block_hsize),
> +		     RKISP1_CIF_ISP_EXP_SIZE_V12);
> +}
> +
>  static void rkisp1_cproc_config(struct rkisp1_params *params,
>  				const struct rkisp1_cif_isp_cproc_config *arg)
>  {
> @@ -625,6 +829,64 @@ static void rkisp1_hst_config_v10(struct rkisp1_params *params,
>  	rkisp1_write(params->rkisp1, weight[0] & 0x1F, RKISP1_CIF_ISP_HIST_WEIGHT_44_V10);
>  }
>  
> +static void rkisp1_hst_config_v12(struct rkisp1_params *params,
> +				  const struct rkisp1_cif_isp_hst_config *arg)
> +{
> +	unsigned int i, j;
> +	u32 block_hsize, block_vsize;
> +	u32 wnd_num_idx, hist_weight_num, hist_ctrl, value;
> +	u8 weight15x15[RKISP1_CIF_ISP_HIST_WEIGHT_REG_SIZE_V12];
> +	const u32 hist_wnd_num[] = { 5, 9, 15, 15 };
> +
> +	/* now we just support 9x9 window */
> +	wnd_num_idx = 1;
> +	memset(weight15x15, 0x00, sizeof(weight15x15));
> +	/* avoid to override the old enable value */
> +	hist_ctrl = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_HIST_CTRL_V12);
> +	hist_ctrl &= RKISP1_CIF_ISP_HIST_CTRL_MODE_MASK_V12 |
> +		     RKISP1_CIF_ISP_HIST_CTRL_EN_MASK_V12;
> +	hist_ctrl = hist_ctrl |
> +		    RKISP1_CIF_ISP_HIST_CTRL_INTRSEL_SET_V12(1) |
> +		    RKISP1_CIF_ISP_HIST_CTRL_DATASEL_SET_V12(0) |
> +		    RKISP1_CIF_ISP_HIST_CTRL_WATERLINE_SET_V12(0) |
> +		    RKISP1_CIF_ISP_HIST_CTRL_AUTOSTOP_SET_V12(0) |
> +		    RKISP1_CIF_ISP_HIST_CTRL_WNDNUM_SET_V12(1) |
> +		    RKISP1_CIF_ISP_HIST_CTRL_STEPSIZE_SET_V12(arg->histogram_predivider);
> +	rkisp1_write(params->rkisp1, hist_ctrl, RKISP1_CIF_ISP_HIST_CTRL_V12);
> +
> +	rkisp1_write(params->rkisp1,
> +		     RKISP1_CIF_ISP_HIST_OFFS_SET_V12(arg->meas_window.h_offs,
> +						      arg->meas_window.v_offs),
> +		     RKISP1_CIF_ISP_HIST_OFFS_V12);
> +
> +	block_hsize = arg->meas_window.h_size / hist_wnd_num[wnd_num_idx] - 1;
> +	block_vsize = arg->meas_window.v_size / hist_wnd_num[wnd_num_idx] - 1;
> +	rkisp1_write(params->rkisp1,
> +		     RKISP1_CIF_ISP_HIST_SIZE_SET_V12(block_hsize, block_vsize),
> +		     RKISP1_CIF_ISP_HIST_SIZE_V12);
> +
> +	for (i = 0; i < hist_wnd_num[wnd_num_idx]; i++) {
> +		for (j = 0; j < hist_wnd_num[wnd_num_idx]; j++) {
> +			weight15x15[i * RKISP1_CIF_ISP_HIST_ROW_NUM_V12 + j] =
> +				arg->hist_weight[i * hist_wnd_num[wnd_num_idx] + j];
> +		}
> +	}
> +
> +	hist_weight_num = RKISP1_CIF_ISP_HIST_WEIGHT_REG_SIZE_V12;
> +	for (i = 0; i < (hist_weight_num / 4); i++) {
> +		value = RKISP1_CIF_ISP_HIST_WEIGHT_SET_V12(
> +				 weight15x15[4 * i + 0],
> +				 weight15x15[4 * i + 1],
> +				 weight15x15[4 * i + 2],
> +				 weight15x15[4 * i + 3]);
> +		rkisp1_write(params->rkisp1, value,
> +				 RKISP1_CIF_ISP_HIST_WEIGHT_V12 + 4 * i);
> +	}
> +	value = RKISP1_CIF_ISP_HIST_WEIGHT_SET_V12(weight15x15[4 * i + 0], 0, 0, 0);
> +	rkisp1_write(params->rkisp1, value,
> +				 RKISP1_CIF_ISP_HIST_WEIGHT_V12 + 4 * i);
> +}
> +
>  static void
>  rkisp1_hst_enable_v10(struct rkisp1_params *params,
>  		      const struct rkisp1_cif_isp_hst_config *arg, bool en)
> @@ -643,6 +905,26 @@ rkisp1_hst_enable_v10(struct rkisp1_params *params,
>  	}
>  }
>  
> +static void
> +rkisp1_hst_enable_v12(struct rkisp1_params *params,
> +		      const struct rkisp1_cif_isp_hst_config *arg, bool en)
> +{
> +	if (en) {
> +		u32 hist_ctrl = rkisp1_read(params->rkisp1,
> +					    RKISP1_CIF_ISP_HIST_CTRL_V12);
> +
> +		hist_ctrl &= ~RKISP1_CIF_ISP_HIST_CTRL_MODE_MASK_V12;
> +		hist_ctrl |= RKISP1_CIF_ISP_HIST_CTRL_MODE_SET_V12(arg->mode);
> +		hist_ctrl |= RKISP1_CIF_ISP_HIST_CTRL_EN_SET_V12(1);
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_HIST_CTRL_V12,
> +				      hist_ctrl);
> +	} else {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_HIST_CTRL_V12,
> +					RKISP1_CIF_ISP_HIST_CTRL_MODE_MASK_V12 |
> +					RKISP1_CIF_ISP_HIST_CTRL_EN_MASK_V12);
> +	}
> +}
> +
>  static void rkisp1_afm_config_v10(struct rkisp1_params *params,
>  				  const struct rkisp1_cif_isp_afc_config *arg)
>  {
> @@ -674,6 +956,45 @@ static void rkisp1_afm_config_v10(struct rkisp1_params *params,
>  	rkisp1_write(params->rkisp1, afm_ctrl, RKISP1_CIF_ISP_AFM_CTRL);
>  }
>  
> +static void rkisp1_afm_config_v12(struct rkisp1_params *params,
> +				  const struct rkisp1_cif_isp_afc_config *arg)
> +{
> +	size_t num_of_win = min_t(size_t, ARRAY_SIZE(arg->afm_win),
> +				  arg->num_afm_win);
> +	u32 afm_ctrl = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_AFM_CTRL);
> +	u32 lum_var_shift, afm_var_shift;
> +	unsigned int i;
> +
> +	/* Switch off to configure. */
> +	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_AFM_CTRL,
> +				RKISP1_CIF_ISP_AFM_ENA);
> +
> +	for (i = 0; i < num_of_win; i++) {
> +		rkisp1_write(params->rkisp1,
> +			     RKISP1_CIF_ISP_AFM_WINDOW_X(arg->afm_win[i].h_offs) |
> +			     RKISP1_CIF_ISP_AFM_WINDOW_Y(arg->afm_win[i].v_offs),
> +			     RKISP1_CIF_ISP_AFM_LT_A + i * 8);
> +		rkisp1_write(params->rkisp1,
> +			     RKISP1_CIF_ISP_AFM_WINDOW_X(arg->afm_win[i].h_size +
> +							 arg->afm_win[i].h_offs) |
> +			     RKISP1_CIF_ISP_AFM_WINDOW_Y(arg->afm_win[i].v_size +
> +							 arg->afm_win[i].v_offs),
> +			     RKISP1_CIF_ISP_AFM_RB_A + i * 8);
> +	}
> +	rkisp1_write(params->rkisp1, arg->thres, RKISP1_CIF_ISP_AFM_THRES);
> +
> +	lum_var_shift = RKISP1_CIF_ISP_AFM_GET_LUM_SHIFT_a_V12(arg->var_shift);
> +	afm_var_shift = RKISP1_CIF_ISP_AFM_GET_AFM_SHIFT_a_V12(arg->var_shift);
> +	rkisp1_write(params->rkisp1,
> +		     RKISP1_CIF_ISP_AFM_SET_SHIFT_a_V12(lum_var_shift, afm_var_shift) |
> +		     RKISP1_CIF_ISP_AFM_SET_SHIFT_b_V12(lum_var_shift, afm_var_shift) |
> +		     RKISP1_CIF_ISP_AFM_SET_SHIFT_c_V12(lum_var_shift, afm_var_shift),
> +		     RKISP1_CIF_ISP_AFM_VAR_SHIFT);
> +
> +	/* restore afm status */
> +	rkisp1_write(params->rkisp1, afm_ctrl, RKISP1_CIF_ISP_AFM_CTRL);
> +}
> +
>  static void rkisp1_ie_config(struct rkisp1_params *params,
>  			     const struct rkisp1_cif_isp_ie_config *arg)
>  {
> @@ -1302,6 +1623,18 @@ static struct rkisp1_params_ops rkisp1_v10_params_ops = {
>  	.afm_config = rkisp1_afm_config_v10,
>  };
>  
> +static struct rkisp1_params_ops rkisp1_v12_params_ops = {
> +	.lsc_matrix_config = rkisp1_lsc_matrix_config_v12,
> +	.goc_config = rkisp1_goc_config_v12,
> +	.awb_meas_config = rkisp1_awb_meas_config_v12,
> +	.awb_meas_enable = rkisp1_awb_meas_enable_v12,
> +	.awb_gain_config = rkisp1_awb_gain_config_v12,
> +	.aec_config = rkisp1_aec_config_v12,
> +	.hst_config = rkisp1_hst_config_v12,
> +	.hst_enable = rkisp1_hst_enable_v12,
> +	.afm_config = rkisp1_afm_config_v12,
> +};
> +
>  static int rkisp1_params_enum_fmt_meta_out(struct file *file, void *priv,
>  					   struct v4l2_fmtdesc *f)
>  {
> @@ -1469,7 +1802,10 @@ static void rkisp1_init_params(struct rkisp1_params *params)
>  	params->vdev_fmt.fmt.meta.buffersize =
>  		sizeof(struct rkisp1_params_cfg);
>  
> -	params->ops = &rkisp1_v10_params_ops;
> +	if (params->rkisp1->media_dev.hw_revision == RKISP1_V12)
> +		params->ops = &rkisp1_v12_params_ops;
> +	else
> +		params->ops = &rkisp1_v10_params_ops;
>  }
>  
>  int rkisp1_params_register(struct rkisp1_device *rkisp1)
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> index e3944c04102f..d326214c7e07 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> @@ -212,6 +212,35 @@
>  
>  /* CCL */
>  #define RKISP1_CIF_CCL_CIF_CLK_DIS			BIT(2)
> +/* VI_ISP_CLK_CTRL */
> +#define RKISP1_CIF_CLK_CTRL_ISP_RAW			BIT(0)
> +#define RKISP1_CIF_CLK_CTRL_ISP_RGB			BIT(1)
> +#define RKISP1_CIF_CLK_CTRL_ISP_YUV			BIT(2)
> +#define RKISP1_CIF_CLK_CTRL_ISP_3A			BIT(3)
> +#define RKISP1_CIF_CLK_CTRL_MIPI_RAW			BIT(4)
> +#define RKISP1_CIF_CLK_CTRL_ISP_IE			BIT(5)
> +#define RKISP1_CIF_CLK_CTRL_RSZ_RAM			BIT(6)
> +#define RKISP1_CIF_CLK_CTRL_JPEG_RAM			BIT(7)
> +#define RKISP1_CIF_CLK_CTRL_ACLK_ISP			BIT(8)
> +#define RKISP1_CIF_CLK_CTRL_MI_IDC			BIT(9)
> +#define RKISP1_CIF_CLK_CTRL_MI_MP			BIT(10)
> +#define RKISP1_CIF_CLK_CTRL_MI_JPEG			BIT(11)
> +#define RKISP1_CIF_CLK_CTRL_MI_DP			BIT(12)
> +#define RKISP1_CIF_CLK_CTRL_MI_Y12			BIT(13)
> +#define RKISP1_CIF_CLK_CTRL_MI_SP			BIT(14)
> +#define RKISP1_CIF_CLK_CTRL_MI_RAW0			BIT(15)
> +#define RKISP1_CIF_CLK_CTRL_MI_RAW1			BIT(16)
> +#define RKISP1_CIF_CLK_CTRL_MI_READ			BIT(17)
> +#define RKISP1_CIF_CLK_CTRL_MI_RAWRD			BIT(18)
> +#define RKISP1_CIF_CLK_CTRL_CP				BIT(19)
> +#define RKISP1_CIF_CLK_CTRL_IE				BIT(20)
> +#define RKISP1_CIF_CLK_CTRL_SI				BIT(21)
> +#define RKISP1_CIF_CLK_CTRL_RSZM			BIT(22)
> +#define RKISP1_CIF_CLK_CTRL_DPMUX			BIT(23)
> +#define RKISP1_CIF_CLK_CTRL_JPEG			BIT(24)
> +#define RKISP1_CIF_CLK_CTRL_RSZS			BIT(25)
> +#define RKISP1_CIF_CLK_CTRL_MIPI			BIT(26)
> +#define RKISP1_CIF_CLK_CTRL_MARVINMI			BIT(27)
>  /* ICCL */
>  #define RKISP1_CIF_ICCL_ISP_CLK				BIT(0)
>  #define RKISP1_CIF_ICCL_CP_CLK				BIT(1)
> @@ -367,6 +396,38 @@
>  #define RKISP1_CIF_ISP_HIST_COLUMN_NUM_V10		5
>  #define RKISP1_CIF_ISP_HIST_GET_BIN_V10(x)		((x) & 0x000FFFFF)
>  
> +/* ISP HISTOGRAM CALCULATION : CIF_ISP_HIST */
> +#define RKISP1_CIF_ISP_HIST_CTRL_EN_SET_V12(x)		(((x) & 0x01) << 0)
> +#define RKISP1_CIF_ISP_HIST_CTRL_EN_MASK_V12		RKISP1_CIF_ISP_HIST_CTRL_EN_SET_V12(0x01)
> +#define RKISP1_CIF_ISP_HIST_CTRL_STEPSIZE_SET_V12(x)	(((x) & 0x7F) << 1)
> +#define RKISP1_CIF_ISP_HIST_CTRL_MODE_SET_V12(x)	(((x) & 0x07) << 8)
> +#define RKISP1_CIF_ISP_HIST_CTRL_MODE_MASK_V12		RKISP1_CIF_ISP_HIST_CTRL_MODE_SET_V12(0x07)
> +#define RKISP1_CIF_ISP_HIST_CTRL_AUTOSTOP_SET_V12(x)	(((x) & 0x01) << 11)
> +#define RKISP1_CIF_ISP_HIST_CTRL_WATERLINE_SET_V12(x)	(((x) & 0xFFF) << 12)
> +#define RKISP1_CIF_ISP_HIST_CTRL_DATASEL_SET_V12(x)	(((x) & 0x07) << 24)
> +#define RKISP1_CIF_ISP_HIST_CTRL_INTRSEL_SET_V12(x)	(((x) & 0x01) << 27)
> +#define RKISP1_CIF_ISP_HIST_CTRL_WNDNUM_SET_V12(x)	(((x) & 0x03) << 28)
> +#define RKISP1_CIF_ISP_HIST_CTRL_DBGEN_SET_V12(x)	(((x) & 0x01) << 30)
> +#define RKISP1_CIF_ISP_HIST_ROW_NUM_V12		15
> +#define RKISP1_CIF_ISP_HIST_COLUMN_NUM_V12		15
> +#define RKISP1_CIF_ISP_HIST_WEIGHT_REG_SIZE_V12	\
> +				(RKISP1_CIF_ISP_HIST_ROW_NUM_V12 * RKISP1_CIF_ISP_HIST_COLUMN_NUM_V12)
> +
> +#define RKISP1_CIF_ISP_HIST_WEIGHT_SET_V12(v0, v1, v2, v3)	\
> +				(((v0) & 0x3F) | (((v1) & 0x3F) << 8) |\
> +				(((v2) & 0x3F) << 16) |\
> +				(((v3) & 0x3F) << 24))
> +
> +#define RKISP1_CIF_ISP_HIST_OFFS_SET_V12(v0, v1)	\
> +				(((v0) & 0x1FFF) | (((v1) & 0x1FFF) << 16))
> +#define RKISP1_CIF_ISP_HIST_SIZE_SET_V12(v0, v1)	\
> +				(((v0) & 0x7FF) | (((v1) & 0x7FF) << 16))
> +
> +#define RKISP1_CIF_ISP_HIST_GET_BIN0_V12(x)	\
> +				((x) & 0xFFFF)
> +#define RKISP1_CIF_ISP_HIST_GET_BIN1_V12(x)	\
> +				(((x) >> 16) & 0xFFFF)
> +
>  /* AUTO FOCUS MEASUREMENT:  ISP_AFM_CTRL */
>  #define RKISP1_ISP_AFM_CTRL_ENABLE			BIT(0)
>  
> @@ -401,6 +462,8 @@
>  #define RKISP1_CIF_ISP_AWB_MODE_YCBCR_EN		((0 << 31) | (0x2 << 0))
>  #define RKISP1_CIF_ISP_AWB_MODE_MASK_NONE		0xFFFFFFFC
>  #define RKISP1_CIF_ISP_AWB_MODE_READ(x)			((x) & 3)
> +#define RKISP1_CIF_ISP_AWB_SET_FRAMES_V12(x)		(((x) & 0x07) << 28)
> +#define RKISP1_CIF_ISP_AWB_SET_FRAMES_MASK_V12		RKISP1_CIF_ISP_AWB_SET_FRAMES_V12(0x07)
>  /* ISP_AWB_GAIN_RB, ISP_AWB_GAIN_G  */
>  #define RKISP1_CIF_ISP_AWB_GAIN_R_SET(x)		(((x) & 0x3FF) << 16)
>  #define RKISP1_CIF_ISP_AWB_GAIN_R_READ(x)		(((x) >> 16) & 0x3FF)
> @@ -435,6 +498,7 @@
>  /* ISP_EXP_CTRL */
>  #define RKISP1_CIF_ISP_EXP_ENA				BIT(0)
>  #define RKISP1_CIF_ISP_EXP_CTRL_AUTOSTOP		BIT(1)
> +#define RKISP1_CIF_ISP_EXP_CTRL_WNDNUM_SET_V12(x)	(((x) & 0x03) << 2)
>  /*
>   *'1' luminance calculation according to  Y=(R+G+B) x 0.332 (85/256)
>   *'0' luminance calculation according to Y=16+0.25R+0.5G+0.1094B
> @@ -444,15 +508,22 @@
>  /* ISP_EXP_H_SIZE */
>  #define RKISP1_CIF_ISP_EXP_H_SIZE_SET_V10(x)		((x) & 0x7FF)
>  #define RKISP1_CIF_ISP_EXP_HEIGHT_MASK_V10			0x000007FF
> +#define RKISP1_CIF_ISP_EXP_H_SIZE_SET_V12(x)		((x) & 0x7FF)
> +#define RKISP1_CIF_ISP_EXP_HEIGHT_MASK_V12		0x000007FF
>  /* ISP_EXP_V_SIZE : vertical size must be a multiple of 2). */
>  #define RKISP1_CIF_ISP_EXP_V_SIZE_SET_V10(x)		((x) & 0x7FE)
> +#define RKISP1_CIF_ISP_EXP_V_SIZE_SET_V12(x)		(((x) & 0x7FE) << 16)
>  
>  /* ISP_EXP_H_OFFSET */
>  #define RKISP1_CIF_ISP_EXP_H_OFFSET_SET_V10(x)		((x) & 0x1FFF)
>  #define RKISP1_CIF_ISP_EXP_MAX_HOFFS_V10		2424
> +#define RKISP1_CIF_ISP_EXP_H_OFFSET_SET_V12(x)		((x) & 0x1FFF)
> +#define RKISP1_CIF_ISP_EXP_MAX_HOFFS_V12		0x1FFF
>  /* ISP_EXP_V_OFFSET */
>  #define RKISP1_CIF_ISP_EXP_V_OFFSET_SET_V10(x)		((x) & 0x1FFF)
>  #define RKISP1_CIF_ISP_EXP_MAX_VOFFS_V10		1806
> +#define RKISP1_CIF_ISP_EXP_V_OFFSET_SET_V12(x)		(((x) & 0x1FFF) << 16)
> +#define RKISP1_CIF_ISP_EXP_MAX_VOFFS_V12		0x1FFF
>  
>  #define RKISP1_CIF_ISP_EXP_ROW_NUM_V10			5
>  #define RKISP1_CIF_ISP_EXP_COLUMN_NUM_V10			5
> @@ -471,13 +542,40 @@
>  #define RKISP1_CIF_ISP_EXP_MIN_VSIZE_V10	\
>  	(RKISP1_CIF_ISP_EXP_BLOCK_MIN_VSIZE_V10 * RKISP1_CIF_ISP_EXP_ROW_NUM_V10 + 1)
>  
> +#define RKISP1_CIF_ISP_EXP_ROW_NUM_V12			15
> +#define RKISP1_CIF_ISP_EXP_COLUMN_NUM_V12		15
> +#define RKISP1_CIF_ISP_EXP_NUM_LUMA_REGS_V12 \
> +	(RKISP1_CIF_ISP_EXP_ROW_NUM_V12 * RKISP1_CIF_ISP_EXP_COLUMN_NUM_V12)
> +
> +#define RKISP1_CIF_ISP_EXP_BLOCK_MAX_HSIZE_V12		0x7FF
> +#define RKISP1_CIF_ISP_EXP_BLOCK_MIN_HSIZE_V12		0xE
> +#define RKISP1_CIF_ISP_EXP_BLOCK_MAX_VSIZE_V12		0x7FE
> +#define RKISP1_CIF_ISP_EXP_BLOCK_MIN_VSIZE_V12		0xE
> +#define RKISP1_CIF_ISP_EXP_MAX_HSIZE_V12	\
> +	(RKISP1_CIF_ISP_EXP_BLOCK_MAX_HSIZE_V12 * RKISP1_CIF_ISP_EXP_COLUMN_NUM_V12 + 1)
> +#define RKISP1_CIF_ISP_EXP_MIN_HSIZE_V12	\
> +	(RKISP1_CIF_ISP_EXP_BLOCK_MIN_HSIZE_V12 * RKISP1_CIF_ISP_EXP_COLUMN_NUM_V12 + 1)
> +#define RKISP1_CIF_ISP_EXP_MAX_VSIZE_V12	\
> +	(RKISP1_CIF_ISP_EXP_BLOCK_MAX_VSIZE_V12 * RKISP1_CIF_ISP_EXP_ROW_NUM_V12 + 1)
> +#define RKISP1_CIF_ISP_EXP_MIN_VSIZE_V12	\
> +	(RKISP1_CIF_ISP_EXP_BLOCK_MIN_VSIZE_V12 * RKISP1_CIF_ISP_EXP_ROW_NUM_V12 + 1)
> +
> +#define RKISP1_CIF_ISP_EXP_GET_MEAN_xy0_V12(x)		((x) & 0xFF)
> +#define RKISP1_CIF_ISP_EXP_GET_MEAN_xy1_V12(x)		(((x) >> 8) & 0xFF)
> +#define RKISP1_CIF_ISP_EXP_GET_MEAN_xy2_V12(x)		(((x) >> 16) & 0xFF)
> +#define RKISP1_CIF_ISP_EXP_GET_MEAN_xy3_V12(x)		(((x) >> 24) & 0xFF)
> +
>  /* LSC: ISP_LSC_CTRL */
>  #define RKISP1_CIF_ISP_LSC_CTRL_ENA			BIT(0)
>  #define RKISP1_CIF_ISP_LSC_SECT_SIZE_RESERVED		0xFC00FC00
>  #define RKISP1_CIF_ISP_LSC_GRAD_RESERVED_V10		0xF000F000
>  #define RKISP1_CIF_ISP_LSC_SAMPLE_RESERVED_V10		0xF000F000
> +#define RKISP1_CIF_ISP_LSC_GRAD_RESERVED_V12		0xE000E000
> +#define RKISP1_CIF_ISP_LSC_SAMPLE_RESERVED_V12		0xE000E000
>  #define RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(v0, v1)     \
>  	(((v0) & 0xFFF) | (((v1) & 0xFFF) << 12))
> +#define RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(v0, v1)     \
> +	(((v0) & 0x1FFF) | (((v1) & 0x1FFF) << 13))
>  #define RKISP1_CIF_ISP_LSC_SECT_SIZE(v0, v1)      \
>  	(((v0) & 0xFFF) | (((v1) & 0xFFF) << 16))
>  #define RKISP1_CIF_ISP_LSC_GRAD_SIZE(v0, v1)      \
> @@ -550,6 +648,10 @@
>  	(1 << 15) | (1 << 11) | (1 << 7) | (1 << 3))
>  #define RKISP1_CIFISP_DEGAMMA_Y_RESERVED		0xFFFFF000
>  
> +/* GAMMA-OUT */
> +#define RKISP1_CIF_ISP_GAMMA_VALUE_V12(x, y)	\
> +	(((x) & 0xFFF) << 16 | ((y) & 0xFFF) << 0)
> +
>  /* AFM */
>  #define RKISP1_CIF_ISP_AFM_ENA				BIT(0)
>  #define RKISP1_CIF_ISP_AFM_THRES_RESERVED		0xFFFF0000
> @@ -560,6 +662,11 @@
>  #define RKISP1_CIF_ISP_AFM_WINDOW_Y_MIN			0x2
>  #define RKISP1_CIF_ISP_AFM_WINDOW_X(x)			(((x) & 0x1FFF) << 16)
>  #define RKISP1_CIF_ISP_AFM_WINDOW_Y(x)			((x) & 0x1FFF)
> +#define RKISP1_CIF_ISP_AFM_SET_SHIFT_a_V12(x, y)	(((x) & 0x7) << 16 | ((y) & 0x7) << 0)
> +#define RKISP1_CIF_ISP_AFM_SET_SHIFT_b_V12(x, y)	(((x) & 0x7) << 20 | ((y) & 0x7) << 4)
> +#define RKISP1_CIF_ISP_AFM_SET_SHIFT_c_V12(x, y)	(((x) & 0x7) << 24 | ((y) & 0x7) << 8)
> +#define RKISP1_CIF_ISP_AFM_GET_LUM_SHIFT_a_V12(x)	(((x) & 0x70000) >> 16)
> +#define RKISP1_CIF_ISP_AFM_GET_AFM_SHIFT_a_V12(x)	((x) & 0x7)
>  
>  /* DPF */
>  #define RKISP1_CIF_ISP_DPF_MODE_EN			BIT(0)
> @@ -582,6 +689,7 @@
>  #define RKISP1_CIF_CTRL_BASE			0x00000000
>  #define RKISP1_CIF_CCL				(RKISP1_CIF_CTRL_BASE + 0x00000000)
>  #define RKISP1_CIF_VI_ID			(RKISP1_CIF_CTRL_BASE + 0x00000008)
> +#define RKISP1_CIF_VI_ISP_CLK_CTRL_V12		(RKISP1_CIF_CTRL_BASE + 0x0000000C)
>  #define RKISP1_CIF_ICCL				(RKISP1_CIF_CTRL_BASE + 0x00000010)
>  #define RKISP1_CIF_IRCL				(RKISP1_CIF_CTRL_BASE + 0x00000014)
>  #define RKISP1_CIF_VI_DPCL			(RKISP1_CIF_CTRL_BASE + 0x00000018)
> @@ -679,6 +787,23 @@
>  #define RKISP1_CIF_ISP_AWB_GAIN_RB_V10		(RKISP1_CIF_ISP_BASE + 0x0000013C)
>  #define RKISP1_CIF_ISP_AWB_WHITE_CNT_V10	(RKISP1_CIF_ISP_BASE + 0x00000140)
>  #define RKISP1_CIF_ISP_AWB_MEAN_V10		(RKISP1_CIF_ISP_BASE + 0x00000144)
> +#define RKISP1_CIF_ISP_AWB_PROP_V12		(RKISP1_CIF_ISP_BASE + 0x00000110)
> +#define RKISP1_CIF_ISP_AWB_SIZE_V12		(RKISP1_CIF_ISP_BASE + 0x00000114)
> +#define RKISP1_CIF_ISP_AWB_OFFS_V12		(RKISP1_CIF_ISP_BASE + 0x00000118)
> +#define RKISP1_CIF_ISP_AWB_REF_V12		(RKISP1_CIF_ISP_BASE + 0x0000011C)
> +#define RKISP1_CIF_ISP_AWB_THRESH_V12		(RKISP1_CIF_ISP_BASE + 0x00000120)
> +#define RKISP1_CIF_ISP_X_COOR12_V12		(RKISP1_CIF_ISP_BASE + 0x00000124)
> +#define RKISP1_CIF_ISP_X_COOR34_V12		(RKISP1_CIF_ISP_BASE + 0x00000128)
> +#define RKISP1_CIF_ISP_AWB_WHITE_CNT_V12	(RKISP1_CIF_ISP_BASE + 0x0000012C)
> +#define RKISP1_CIF_ISP_AWB_MEAN_V12		(RKISP1_CIF_ISP_BASE + 0x00000130)
> +#define RKISP1_CIF_ISP_DEGAIN_V12		(RKISP1_CIF_ISP_BASE + 0x00000134)
> +#define RKISP1_CIF_ISP_AWB_GAIN_G_V12		(RKISP1_CIF_ISP_BASE + 0x00000138)
> +#define RKISP1_CIF_ISP_AWB_GAIN_RB_V12		(RKISP1_CIF_ISP_BASE + 0x0000013C)
> +#define RKISP1_CIF_ISP_REGION_LINE_V12		(RKISP1_CIF_ISP_BASE + 0x00000140)
> +#define RKISP1_CIF_ISP_WP_CNT_REGION0_V12	(RKISP1_CIF_ISP_BASE + 0x00000160)
> +#define RKISP1_CIF_ISP_WP_CNT_REGION1_V12	(RKISP1_CIF_ISP_BASE + 0x00000164)
> +#define RKISP1_CIF_ISP_WP_CNT_REGION2_V12	(RKISP1_CIF_ISP_BASE + 0x00000168)
> +#define RKISP1_CIF_ISP_WP_CNT_REGION3_V12	(RKISP1_CIF_ISP_BASE + 0x0000016C)
>  #define RKISP1_CIF_ISP_CC_COEFF_0		(RKISP1_CIF_ISP_BASE + 0x00000170)
>  #define RKISP1_CIF_ISP_CC_COEFF_1		(RKISP1_CIF_ISP_BASE + 0x00000174)
>  #define RKISP1_CIF_ISP_CC_COEFF_2		(RKISP1_CIF_ISP_BASE + 0x00000178)
> @@ -736,6 +861,8 @@
>  #define RKISP1_CIF_ISP_CT_OFFSET_R		(RKISP1_CIF_ISP_BASE + 0x00000248)
>  #define RKISP1_CIF_ISP_CT_OFFSET_G		(RKISP1_CIF_ISP_BASE + 0x0000024C)
>  #define RKISP1_CIF_ISP_CT_OFFSET_B		(RKISP1_CIF_ISP_BASE + 0x00000250)
> +#define RKISP1_CIF_ISP_GAMMA_OUT_MODE_V12	(RKISP1_CIF_ISP_BASE + 0x00000300)
> +#define RKISP1_CIF_ISP_GAMMA_OUT_Y_0_V12	(RKISP1_CIF_ISP_BASE + 0x00000304)
>  
>  #define RKISP1_CIF_ISP_FLASH_BASE		0x00000660
>  #define RKISP1_CIF_ISP_FLASH_CMD		(RKISP1_CIF_ISP_FLASH_BASE + 0x00000000)
> @@ -1088,6 +1215,9 @@
>  #define RKISP1_CIF_ISP_EXP_MEAN_24_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x0000006c)
>  #define RKISP1_CIF_ISP_EXP_MEAN_34_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000070)
>  #define RKISP1_CIF_ISP_EXP_MEAN_44_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000074)
> +#define RKISP1_CIF_ISP_EXP_SIZE_V12		(RKISP1_CIF_ISP_EXP_BASE + 0x00000004)
> +#define RKISP1_CIF_ISP_EXP_OFFS_V12		(RKISP1_CIF_ISP_EXP_BASE + 0x00000008)
> +#define RKISP1_CIF_ISP_EXP_MEAN_V12		(RKISP1_CIF_ISP_EXP_BASE + 0x0000000c)
>  
>  #define RKISP1_CIF_ISP_BLS_BASE			0x00002700
>  #define RKISP1_CIF_ISP_BLS_CTRL			(RKISP1_CIF_ISP_BLS_BASE + 0x00000000)
> @@ -1248,6 +1378,16 @@
>  #define RKISP1_CIF_ISP_WDR_TONECURVE_YM_31_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x0000012C)
>  #define RKISP1_CIF_ISP_WDR_TONECURVE_YM_32_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x00000130)
>  
> +#define RKISP1_CIF_ISP_HIST_BASE_V12		0x00002C00
> +#define RKISP1_CIF_ISP_HIST_CTRL_V12		(RKISP1_CIF_ISP_HIST_BASE_V12 + 0x00000000)
> +#define RKISP1_CIF_ISP_HIST_SIZE_V12		(RKISP1_CIF_ISP_HIST_BASE_V12 + 0x00000004)
> +#define RKISP1_CIF_ISP_HIST_OFFS_V12		(RKISP1_CIF_ISP_HIST_BASE_V12 + 0x00000008)
> +#define RKISP1_CIF_ISP_HIST_DBG1_V12		(RKISP1_CIF_ISP_HIST_BASE_V12 + 0x0000000C)
> +#define RKISP1_CIF_ISP_HIST_DBG2_V12		(RKISP1_CIF_ISP_HIST_BASE_V12 + 0x0000001C)
> +#define RKISP1_CIF_ISP_HIST_DBG3_V12		(RKISP1_CIF_ISP_HIST_BASE_V12 + 0x0000002C)
> +#define RKISP1_CIF_ISP_HIST_WEIGHT_V12		(RKISP1_CIF_ISP_HIST_BASE_V12 + 0x0000003C)
> +#define RKISP1_CIF_ISP_HIST_BIN_V12		(RKISP1_CIF_ISP_HIST_BASE_V12 + 0x00000120)
> +
>  #define RKISP1_CIF_ISP_VSM_BASE			0x00002F00
>  #define RKISP1_CIF_ISP_VSM_MODE			(RKISP1_CIF_ISP_VSM_BASE + 0x00000000)
>  #define RKISP1_CIF_ISP_VSM_H_OFFS		(RKISP1_CIF_ISP_VSM_BASE + 0x00000004)
> @@ -1259,4 +1399,7 @@
>  #define RKISP1_CIF_ISP_VSM_DELTA_H		(RKISP1_CIF_ISP_VSM_BASE + 0x0000001C)
>  #define RKISP1_CIF_ISP_VSM_DELTA_V		(RKISP1_CIF_ISP_VSM_BASE + 0x00000020)
>  
> +#define RKISP1_CIF_ISP_CSI0_BASE		0x00007000
> +#define RKISP1_CIF_ISP_CSI0_CTRL0		(RKISP1_CIF_ISP_CSI0_BASE + 0x00000000)
> +
>  #endif /* _RKISP1_REGS_H */
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> index 3f286c55ad60..dd99d7ea9ff6 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> @@ -196,6 +196,27 @@ static void rkisp1_stats_get_awb_meas_v10(struct rkisp1_stats *stats,
>  				RKISP1_CIF_ISP_AWB_GET_MEAN_Y_G(reg_val);
>  }
>  
> +static void rkisp1_stats_get_awb_meas_v12(struct rkisp1_stats *stats,
> +					  struct rkisp1_stat_buffer *pbuf)
> +{
> +	/* Protect against concurrent access from ISR? */
> +	struct rkisp1_device *rkisp1 = stats->rkisp1;
> +	u32 reg_val;
> +
> +	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_AWB;
> +	reg_val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB_WHITE_CNT_V12);
> +	pbuf->params.awb.awb_mean[0].cnt =
> +				RKISP1_CIF_ISP_AWB_GET_PIXEL_CNT(reg_val);
> +	reg_val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB_MEAN_V12);
> +
> +	pbuf->params.awb.awb_mean[0].mean_cr_or_r =
> +				RKISP1_CIF_ISP_AWB_GET_MEAN_CR_R(reg_val);
> +	pbuf->params.awb.awb_mean[0].mean_cb_or_b =
> +				RKISP1_CIF_ISP_AWB_GET_MEAN_CB_B(reg_val);
> +	pbuf->params.awb.awb_mean[0].mean_y_or_g =
> +				RKISP1_CIF_ISP_AWB_GET_MEAN_Y_G(reg_val);
> +}
> +
>  static void rkisp1_stats_get_aec_meas_v10(struct rkisp1_stats *stats,
>  					  struct rkisp1_stat_buffer *pbuf)
>  {
> @@ -209,6 +230,30 @@ static void rkisp1_stats_get_aec_meas_v10(struct rkisp1_stats *stats,
>  					RKISP1_CIF_ISP_EXP_MEAN_00_V10 + i * 4);
>  }
>  
> +static void rkisp1_stats_get_aec_meas_v12(struct rkisp1_stats *stats,
> +					  struct rkisp1_stat_buffer *pbuf)
> +{
> +	struct rkisp1_device *rkisp1 = stats->rkisp1;
> +	u32 value;
> +	int i;
> +
> +	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_AUTOEXP;
> +	for (i = 0; i < RKISP1_CIF_ISP_AE_MEAN_MAX_V12 / 4; i++) {
> +		value = rkisp1_read(rkisp1, RKISP1_CIF_ISP_EXP_MEAN_V12 + i * 4);
> +		pbuf->params.ae.exp_mean[4 * i + 0] =
> +				RKISP1_CIF_ISP_EXP_GET_MEAN_xy0_V12(value);
> +		pbuf->params.ae.exp_mean[4 * i + 1] =
> +				RKISP1_CIF_ISP_EXP_GET_MEAN_xy1_V12(value);
> +		pbuf->params.ae.exp_mean[4 * i + 2] =
> +				RKISP1_CIF_ISP_EXP_GET_MEAN_xy2_V12(value);
> +		pbuf->params.ae.exp_mean[4 * i + 3] =
> +				RKISP1_CIF_ISP_EXP_GET_MEAN_xy3_V12(value);
> +	}
> +
> +	value = rkisp1_read(rkisp1, RKISP1_CIF_ISP_EXP_MEAN_V12 + i * 4);
> +	pbuf->params.ae.exp_mean[4 * i + 0] = RKISP1_CIF_ISP_EXP_GET_MEAN_xy0_V12(value);
> +}
> +
>  static void rkisp1_stats_get_afc_meas(struct rkisp1_stats *stats,
>  				      struct rkisp1_stat_buffer *pbuf)
>  {
> @@ -240,6 +285,23 @@ static void rkisp1_stats_get_hst_meas_v10(struct rkisp1_stats *stats,
>  	}
>  }
>  
> +static void rkisp1_stats_get_hst_meas_v12(struct rkisp1_stats *stats,
> +					  struct rkisp1_stat_buffer *pbuf)
> +{
> +	struct rkisp1_device *rkisp1 = stats->rkisp1;
> +	u32 value;
> +	int i;
> +
> +	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_HIST;
> +	for (i = 0; i < RKISP1_CIF_ISP_HIST_BIN_N_MAX_V12 / 2; i++) {
> +		value = rkisp1_read(rkisp1, RKISP1_CIF_ISP_HIST_BIN_V12 + i * 4);
> +		pbuf->params.hist.hist_bins[2 * i] =
> +					RKISP1_CIF_ISP_HIST_GET_BIN0_V12(value);
> +		pbuf->params.hist.hist_bins[2 * i + 1] =
> +					RKISP1_CIF_ISP_HIST_GET_BIN1_V12(value);
> +	}
> +}
> +
>  static void rkisp1_stats_get_bls_meas(struct rkisp1_stats *stats,
>  				      struct rkisp1_stat_buffer *pbuf)
>  {
> @@ -293,6 +355,12 @@ static struct rkisp1_stats_ops rkisp1_v10_stats_ops = {
>  	.get_hst_meas = rkisp1_stats_get_hst_meas_v10,
>  };
>  
> +static struct rkisp1_stats_ops rkisp1_v12_stats_ops = {
> +	.get_awb_meas = rkisp1_stats_get_awb_meas_v12,
> +	.get_aec_meas = rkisp1_stats_get_aec_meas_v12,
> +	.get_hst_meas = rkisp1_stats_get_hst_meas_v12,
> +};
> +
>  static void
>  rkisp1_stats_send_measurement(struct rkisp1_stats *stats, u32 isp_ris)
>  {
> @@ -361,7 +429,10 @@ static void rkisp1_init_stats(struct rkisp1_stats *stats)
>  	stats->vdev_fmt.fmt.meta.buffersize =
>  		sizeof(struct rkisp1_stat_buffer);
>  
> -	stats->ops = &rkisp1_v10_stats_ops;
> +	if (stats->rkisp1->media_dev.hw_revision == RKISP1_V12)
> +		stats->ops = &rkisp1_v12_stats_ops;
> +	else
> +		stats->ops = &rkisp1_v10_stats_ops;
>  }
>  
>  int rkisp1_stats_register(struct rkisp1_device *rkisp1)

-- 
Regards,

Laurent Pinchart
