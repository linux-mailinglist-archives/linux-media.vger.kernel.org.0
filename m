Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83E013C6512
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 22:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbhGLUrO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 16:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbhGLUrN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 16:47:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 242CEC0613DD;
        Mon, 12 Jul 2021 13:44:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EEFBCC;
        Mon, 12 Jul 2021 22:44:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1626122663;
        bh=UH1i5tEX4PP7MmbW8xAX+LcN9wV/S9a/fmZhTV7JjKM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OKJuNA5lLm1n0ArPVJ6gq4tETE1V8rjCjWyErrbCrnKr0Br7UtMUuURmlwBwP4LCN
         NGuOpWJCLgs0zql3UmScXhSP3sdqioBX9PS9ENBMr/H3zuL9d8ncOD2z7vLvWX5/pW
         M77BqQkTUq6OuyIlUN7+Xf7WFjaYVuHP6FLH+s94=
Date:   Mon, 12 Jul 2021 23:43:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@collabora.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, linux-rockchip@lists.infradead.org,
        linux-media@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: Re: [PATCH v6 05/10] media: rockchip: rkisp1: make some isp-param
 functions variable
Message-ID: <YOypeEHjQacQBfsf@pendragon.ideasonboard.com>
References: <20210618130238.4171196-1-heiko@sntech.de>
 <20210618130238.4171196-6-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210618130238.4171196-6-heiko@sntech.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Heiko,

Thank you for the patch.

On Fri, Jun 18, 2021 at 03:02:33PM +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> The isp block evolved in subsequent socs, so some functions
> will behave differently on newer variants.
> 
> Therefore make it possible to override the needed params functions.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-common.h  | 25 +++++++
>  .../platform/rockchip/rkisp1/rkisp1-params.c  | 67 +++++++++++--------
>  2 files changed, 65 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 25dd5c93620e..74ddd8256366 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -254,11 +254,35 @@ struct rkisp1_stats {
>  	struct v4l2_format vdev_fmt;
>  };
>  
> +struct rkisp1_params;
> +struct rkisp1_params_ops {
> +	void (*lsc_matrix_config)(struct rkisp1_params *params,
> +				  const struct rkisp1_cif_isp_lsc_config *pconfig);
> +	void (*goc_config)(struct rkisp1_params *params,
> +			   const struct rkisp1_cif_isp_goc_config *arg);
> +	void (*awb_meas_config)(struct rkisp1_params *params,
> +				const struct rkisp1_cif_isp_awb_meas_config *arg);
> +	void (*awb_meas_enable)(struct rkisp1_params *params,
> +				const struct rkisp1_cif_isp_awb_meas_config *arg,
> +				bool en);
> +	void (*awb_gain_config)(struct rkisp1_params *params,
> +				const struct rkisp1_cif_isp_awb_gain_config *arg);
> +	void (*aec_config)(struct rkisp1_params *params,
> +			   const struct rkisp1_cif_isp_aec_config *arg);
> +	void (*hst_config)(struct rkisp1_params *params,
> +			   const struct rkisp1_cif_isp_hst_config *arg);
> +	void (*hst_enable)(struct rkisp1_params *params,
> +			   const struct rkisp1_cif_isp_hst_config *arg, bool en);
> +	void (*afm_config)(struct rkisp1_params *params,
> +			   const struct rkisp1_cif_isp_afc_config *arg);
> +};
> +
>  /*
>   * struct rkisp1_params - ISP input parameters device
>   *
>   * @vnode:		video node
>   * @rkisp1:		pointer to the rkisp1 device
> + * @ops:		pointer to the variant-specific operations
>   * @config_lock:	locks the buffer list 'params'
>   * @params:		queue of rkisp1_buffer
>   * @vdev_fmt:		v4l2_format of the metadata format
> @@ -268,6 +292,7 @@ struct rkisp1_stats {
>  struct rkisp1_params {
>  	struct rkisp1_vdev_node vnode;
>  	struct rkisp1_device *rkisp1;
> +	struct rkisp1_params_ops *ops;

This should be const.

>  
>  	spinlock_t config_lock; /* locks the buffers list 'params' */
>  	struct list_head params;
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index b6beddd988d0..1aab2720ffa2 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -185,8 +185,8 @@ static void rkisp1_bls_config(struct rkisp1_params *params,
>  
>  /* ISP LS correction interface function */
>  static void
> -rkisp1_lsc_correct_matrix_config(struct rkisp1_params *params,
> -				 const struct rkisp1_cif_isp_lsc_config *pconfig)
> +rkisp1_lsc_matrix_config(struct rkisp1_params *params,
> +			 const struct rkisp1_cif_isp_lsc_config *pconfig)
>  {
>  	unsigned int isp_lsc_status, sram_addr, isp_lsc_table_sel, i, j, data;
>  
> @@ -265,7 +265,7 @@ static void rkisp1_lsc_config(struct rkisp1_params *params,
>  	lsc_ctrl = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_LSC_CTRL);
>  	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_LSC_CTRL,
>  				RKISP1_CIF_ISP_LSC_CTRL_ENA);
> -	rkisp1_lsc_correct_matrix_config(params, arg);
> +	params->ops->lsc_matrix_config(params, arg);
>  
>  	for (i = 0; i < RKISP1_CIF_ISP_LSC_SECTORS_TBL_SIZE / 2; i++) {
>  		/* program x size tables */
> @@ -955,7 +955,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  
>  	/* update awb gains */
>  	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_AWB_GAIN)
> -		rkisp1_awb_gain_config(params, &new_params->others.awb_gain_config);
> +		params->ops->awb_gain_config(params, &new_params->others.awb_gain_config);
>  
>  	if (module_en_update & RKISP1_CIF_ISP_MODULE_AWB_GAIN) {
>  		if (module_ens & RKISP1_CIF_ISP_MODULE_AWB_GAIN)
> @@ -1010,8 +1010,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  
>  	/* update goc config */
>  	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_GOC)
> -		rkisp1_goc_config(params,
> -				  &new_params->others.goc_config);
> +		params->ops->goc_config(params, &new_params->others.goc_config);
>  
>  	if (module_en_update & RKISP1_CIF_ISP_MODULE_GOC) {
>  		if (module_ens & RKISP1_CIF_ISP_MODULE_GOC)
> @@ -1081,17 +1080,17 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
>  
>  	/* update awb config */
>  	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_AWB)
> -		rkisp1_awb_meas_config(params, &new_params->meas.awb_meas_config);
> +		params->ops->awb_meas_config(params, &new_params->meas.awb_meas_config);
>  
>  	if (module_en_update & RKISP1_CIF_ISP_MODULE_AWB)
> -		rkisp1_awb_meas_enable(params,
> -				       &new_params->meas.awb_meas_config,
> -				       !!(module_ens & RKISP1_CIF_ISP_MODULE_AWB));
> +		params->ops->awb_meas_enable(params,
> +					     &new_params->meas.awb_meas_config,
> +					     !!(module_ens & RKISP1_CIF_ISP_MODULE_AWB));
>  
>  	/* update afc config */
>  	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_AFC)
> -		rkisp1_afm_config(params,
> -				  &new_params->meas.afc_config);
> +		params->ops->afm_config(params,
> +					&new_params->meas.afc_config);
>  
>  	if (module_en_update & RKISP1_CIF_ISP_MODULE_AFC) {
>  		if (module_ens & RKISP1_CIF_ISP_MODULE_AFC)
> @@ -1106,18 +1105,18 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
>  
>  	/* update hst config */
>  	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_HST)
> -		rkisp1_hst_config(params,
> -				  &new_params->meas.hst_config);
> +		params->ops->hst_config(params,
> +					&new_params->meas.hst_config);
>  
>  	if (module_en_update & RKISP1_CIF_ISP_MODULE_HST)
> -		rkisp1_hst_enable(params,
> -				  &new_params->meas.hst_config,
> -				  !!(module_ens & RKISP1_CIF_ISP_MODULE_HST));
> +		params->ops->hst_enable(params,
> +					&new_params->meas.hst_config,
> +					!!(module_ens & RKISP1_CIF_ISP_MODULE_HST));
>  
>  	/* update aec config */
>  	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_AEC)
> -		rkisp1_aec_config(params,
> -				  &new_params->meas.aec_config);
> +		params->ops->aec_config(params,
> +					&new_params->meas.aec_config);
>  
>  	if (module_en_update & RKISP1_CIF_ISP_MODULE_AEC) {
>  		if (module_ens & RKISP1_CIF_ISP_MODULE_AEC)
> @@ -1218,20 +1217,20 @@ static void rkisp1_params_config_parameter(struct rkisp1_params *params)
>  {
>  	struct rkisp1_cif_isp_hst_config hst = rkisp1_hst_params_default_config;
>  
> -	rkisp1_awb_meas_config(params, &rkisp1_awb_params_default_config);
> -	rkisp1_awb_meas_enable(params, &rkisp1_awb_params_default_config,
> -			       true);
> +	params->ops->awb_meas_config(params, &rkisp1_awb_params_default_config);
> +	params->ops->awb_meas_enable(params, &rkisp1_awb_params_default_config,
> +				     true);
>  
> -	rkisp1_aec_config(params, &rkisp1_aec_params_default_config);
> +	params->ops->aec_config(params, &rkisp1_aec_params_default_config);
>  	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_EXP_CTRL,
>  			      RKISP1_CIF_ISP_EXP_ENA);
>  
> -	rkisp1_afm_config(params, &rkisp1_afc_params_default_config);
> +	params->ops->afm_config(params, &rkisp1_afc_params_default_config);
>  	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_AFM_CTRL,
>  			      RKISP1_CIF_ISP_AFM_ENA);
>  
>  	memset(hst.hist_weight, 0x01, sizeof(hst.hist_weight));
> -	rkisp1_hst_config(params, &hst);
> +	params->ops->hst_config(params, &hst);
>  	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_HIST_PROP,
>  			      rkisp1_hst_params_default_config.mode);
>  
> @@ -1275,7 +1274,7 @@ void rkisp1_params_disable(struct rkisp1_params *params)
>  				RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
>  	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_FILT_MODE,
>  				RKISP1_CIF_ISP_FLT_ENA);
> -	rkisp1_awb_meas_enable(params, NULL, false);
> +	params->ops->awb_meas_enable(params, NULL, false);
>  	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
>  				RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
>  	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_EXP_CTRL,
> @@ -1283,7 +1282,7 @@ void rkisp1_params_disable(struct rkisp1_params *params)
>  	rkisp1_ctk_enable(params, false);
>  	rkisp1_param_clear_bits(params, RKISP1_CIF_C_PROC_CTRL,
>  				RKISP1_CIF_C_PROC_CTR_ENABLE);
> -	rkisp1_hst_enable(params, NULL, false);
> +	params->ops->hst_enable(params, NULL, false);
>  	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_AFM_CTRL,
>  				RKISP1_CIF_ISP_AFM_ENA);
>  	rkisp1_ie_enable(params, false);
> @@ -1291,6 +1290,18 @@ void rkisp1_params_disable(struct rkisp1_params *params)
>  				RKISP1_CIF_ISP_DPF_MODE_EN);
>  }
>  
> +static struct rkisp1_params_ops rkisp1_params_ops = {

And this should be const too.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	.lsc_matrix_config = rkisp1_lsc_matrix_config,
> +	.goc_config = rkisp1_goc_config,
> +	.awb_meas_config = rkisp1_awb_meas_config,
> +	.awb_meas_enable = rkisp1_awb_meas_enable,
> +	.awb_gain_config = rkisp1_awb_gain_config,
> +	.aec_config = rkisp1_aec_config,
> +	.hst_config = rkisp1_hst_config,
> +	.hst_enable = rkisp1_hst_enable,
> +	.afm_config = rkisp1_afm_config,
> +};
> +
>  static int rkisp1_params_enum_fmt_meta_out(struct file *file, void *priv,
>  					   struct v4l2_fmtdesc *f)
>  {
> @@ -1457,6 +1468,8 @@ static void rkisp1_init_params(struct rkisp1_params *params)
>  		V4L2_META_FMT_RK_ISP1_PARAMS;
>  	params->vdev_fmt.fmt.meta.buffersize =
>  		sizeof(struct rkisp1_params_cfg);
> +
> +	params->ops = &rkisp1_params_ops;
>  }
>  
>  int rkisp1_params_register(struct rkisp1_device *rkisp1)

-- 
Regards,

Laurent Pinchart
