Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3BF9311539
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 23:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233133AbhBEWZi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 17:25:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232583AbhBEOZQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 09:25:16 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53A0C061A32
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 07:51:50 -0800 (PST)
Received: from [IPv6:2003:c7:cf1c:ce00:c5f9:7f5:ebcd:ea47] (p200300c7cf1cce00c5f907f5ebcdea47.dip0.t-ipconnect.de [IPv6:2003:c7:cf1c:ce00:c5f9:7f5:ebcd:ea47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CF60F1F466F8;
        Fri,  5 Feb 2021 14:05:24 +0000 (GMT)
Subject: Re: [PATCH RFC 08/11] media: rockchip: rkisp1: make some isp-param
 functions variable
To:     Heiko Stuebner <heiko@sntech.de>, ezequiel@collabora.com,
        helen.koike@collabora.com, Laurent.pinchart@ideasonboard.com
Cc:     linux-rockchip@lists.infradead.org,
        christoph.muellner@theobroma-systems.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
References: <20210108193311.3423236-1-heiko@sntech.de>
 <20210108193311.3423236-9-heiko@sntech.de>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <7c06bf28-2629-1f8d-1e55-d86ad792d6bf@collabora.com>
Date:   Fri, 5 Feb 2021 15:05:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210108193311.3423236-9-heiko@sntech.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 08.01.21 um 20:33 schrieb Heiko Stuebner:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> The isp block evolved in subsequent socs, so some functions
> will behave differently on newer variants.
> 
> Therefore make it possible to override the needed params functions.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> ---
>   .../platform/rockchip/rkisp1/rkisp1-common.h  | 30 ++++++++
>   .../platform/rockchip/rkisp1/rkisp1-params.c  | 76 ++++++++++++-------
>   2 files changed, 77 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 7678eabc9ffc..4034a05ef9d2 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -258,11 +258,39 @@ struct rkisp1_stats {
>   	struct v4l2_format vdev_fmt;
>   };
>   
> +struct rkisp1_params;
> +struct rkisp1_params_ops {

could you add a short inline doc of this stuct?

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
> +struct rkisp1_params_config {
> +	const int gamma_out_max_samples;
> +};
> +
>   /*
>    * struct rkisp1_params - ISP input parameters device
>    *
>    * @vnode:		video node
>    * @rkisp1:		pointer to the rkisp1 device
> + * @ops:		pointer to the variant-specific operations

maybe change the doc here to "version-specific operations according to rkisp1_cif_isp_version"

>    * @config_lock:	locks the buffer list 'params'
>    * @params:		queue of rkisp1_buffer
>    * @vdev_fmt:		v4l2_format of the metadata format
> @@ -272,6 +300,8 @@ struct rkisp1_stats {
>   struct rkisp1_params {
>   	struct rkisp1_vdev_node vnode;
>   	struct rkisp1_device *rkisp1;
> +	struct rkisp1_params_ops *ops;
> +	struct rkisp1_params_config *config;

I think the field 'config' is not needed, see my comment in patch 10/11

>   
>   	spinlock_t config_lock; /* locks the buffers list 'params' */
>   	struct list_head params;
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 6af4d551ffb5..008584caaad0 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -185,8 +185,8 @@ static void rkisp1_bls_config(struct rkisp1_params *params,
>   
>   /* ISP LS correction interface function */
>   static void
> -rkisp1_lsc_correct_matrix_config(struct rkisp1_params *params,
> -				 const struct rkisp1_cif_isp_lsc_config *pconfig)
> +rkisp1_lsc_matrix_config(struct rkisp1_params *params,
> +			 const struct rkisp1_cif_isp_lsc_config *pconfig)

This is just a renaming of the function , I don't think this is needed

Thanks,
Dafna

>   {
>   	unsigned int isp_lsc_status, sram_addr, isp_lsc_table_sel, i, j, data;
>   
> @@ -265,7 +265,7 @@ static void rkisp1_lsc_config(struct rkisp1_params *params,
>   	lsc_ctrl = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_LSC_CTRL);
>   	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_LSC_CTRL,
>   				RKISP1_CIF_ISP_LSC_CTRL_ENA);
> -	rkisp1_lsc_correct_matrix_config(params, arg);
> +	params->ops->lsc_matrix_config(params, arg);
>   
>   	for (i = 0; i < RKISP1_CIF_ISP_LSC_SECTORS_TBL_SIZE / 2; i++) {
>   		/* program x size tables */
> @@ -391,7 +391,7 @@ static void rkisp1_goc_config(struct rkisp1_params *params,
>   				RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
>   	rkisp1_write(params->rkisp1, arg->mode, RKISP1_CIF_ISP_GAMMA_OUT_MODE);
>   
> -	for (i = 0; i < RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES; i++)
> +	for (i = 0; i < params->config->gamma_out_max_samples; i++)
>   		rkisp1_write(params->rkisp1, arg->gamma_y[i],
>   			     RKISP1_CIF_ISP_GAMMA_OUT_Y_0 + i * 4);
>   }
> @@ -968,8 +968,8 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>   	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_AWB_GAIN)) {
>   		/* update awb gains */
>   		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_AWB_GAIN)
> -			rkisp1_awb_gain_config(params,
> -					       &new_params->others.awb_gain_config);
> +			params->ops->awb_gain_config(params,
> +						     &new_params->others.awb_gain_config);
>   
>   		if (module_en_update & RKISP1_CIF_ISP_MODULE_AWB_GAIN) {
>   			if (module_ens & RKISP1_CIF_ISP_MODULE_AWB_GAIN)
> @@ -1037,8 +1037,8 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>   	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_GOC)) {
>   		/* update goc config */
>   		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_GOC)
> -			rkisp1_goc_config(params,
> -					  &new_params->others.goc_config);
> +			params->ops->goc_config(params,
> +						&new_params->others.goc_config);
>   
>   		if (module_en_update & RKISP1_CIF_ISP_MODULE_GOC) {
>   			if (module_ens & RKISP1_CIF_ISP_MODULE_GOC)
> @@ -1124,20 +1124,20 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
>   	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_AWB)) {
>   		/* update awb config */
>   		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_AWB)
> -			rkisp1_awb_meas_config(params,
> -					       &new_params->meas.awb_meas_config);
> +			params->ops->awb_meas_config(params,
> +						     &new_params->meas.awb_meas_config);
>   
>   		if (module_en_update & RKISP1_CIF_ISP_MODULE_AWB)
> -			rkisp1_awb_meas_enable(params,
> -					       &new_params->meas.awb_meas_config,
> -					       !!(module_ens & RKISP1_CIF_ISP_MODULE_AWB));
> +			params->ops->awb_meas_enable(params,
> +						     &new_params->meas.awb_meas_config,
> +						     !!(module_ens & RKISP1_CIF_ISP_MODULE_AWB));
>   	}
>   
>   	if ((module_en_update & RKISP1_CIF_ISP_MODULE_AFC) ||
>   	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_AFC)) {
>   		/* update afc config */
>   		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_AFC)
> -			rkisp1_afm_config(params,
> +			params->ops->afm_config(params,
>   					  &new_params->meas.afc_config);
>   
>   		if (module_en_update & RKISP1_CIF_ISP_MODULE_AFC) {
> @@ -1156,21 +1156,21 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
>   	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_HST)) {
>   		/* update hst config */
>   		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_HST)
> -			rkisp1_hst_config(params,
> -					  &new_params->meas.hst_config);
> +			params->ops->hst_config(params,
> +						&new_params->meas.hst_config);
>   
>   		if (module_en_update & RKISP1_CIF_ISP_MODULE_HST)
> -			rkisp1_hst_enable(params,
> -					  &new_params->meas.hst_config,
> -					  !!(module_ens & RKISP1_CIF_ISP_MODULE_HST));
> +			params->ops->hst_enable(params,
> +						&new_params->meas.hst_config,
> +						!!(module_ens & RKISP1_CIF_ISP_MODULE_HST));
>   	}
>   
>   	if ((module_en_update & RKISP1_CIF_ISP_MODULE_AEC) ||
>   	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_AEC)) {
>   		/* update aec config */
>   		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_AEC)
> -			rkisp1_aec_config(params,
> -					  &new_params->meas.aec_config);
> +			params->ops->aec_config(params,
> +						&new_params->meas.aec_config);
>   
>   		if (module_en_update & RKISP1_CIF_ISP_MODULE_AEC) {
>   			if (module_ens & RKISP1_CIF_ISP_MODULE_AEC)
> @@ -1272,20 +1272,20 @@ static void rkisp1_params_config_parameter(struct rkisp1_params *params)
>   {
>   	struct rkisp1_cif_isp_hst_config hst = rkisp1_hst_params_default_config;
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
>   	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_EXP_CTRL,
>   			      RKISP1_CIF_ISP_EXP_ENA);
>   
> -	rkisp1_afm_config(params, &rkisp1_afc_params_default_config);
> +	params->ops->afm_config(params, &rkisp1_afc_params_default_config);
>   	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_AFM_CTRL,
>   			      RKISP1_CIF_ISP_AFM_ENA);
>   
>   	memset(hst.hist_weight, 0x01, sizeof(hst.hist_weight));
> -	rkisp1_hst_config(params, &hst);
> +	params->ops->hst_config(params, &hst);
>   	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_HIST_PROP,
>   			      ~RKISP1_CIF_ISP_HIST_PROP_MODE_MASK |
>   			      rkisp1_hst_params_default_config.mode);
> @@ -1330,7 +1330,7 @@ void rkisp1_params_disable(struct rkisp1_params *params)
>   				RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
>   	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_FILT_MODE,
>   				RKISP1_CIF_ISP_FLT_ENA);
> -	rkisp1_awb_meas_enable(params, NULL, false);
> +	params->ops->awb_meas_enable(params, NULL, false);
>   	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
>   				RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
>   	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_EXP_CTRL,
> @@ -1338,7 +1338,7 @@ void rkisp1_params_disable(struct rkisp1_params *params)
>   	rkisp1_ctk_enable(params, false);
>   	rkisp1_param_clear_bits(params, RKISP1_CIF_C_PROC_CTRL,
>   				RKISP1_CIF_C_PROC_CTR_ENABLE);
> -	rkisp1_hst_enable(params, NULL, false);
> +	params->ops->hst_enable(params, NULL, false);
>   	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_AFM_CTRL,
>   				RKISP1_CIF_ISP_AFM_ENA);
>   	rkisp1_ie_enable(params, false);
> @@ -1346,6 +1346,22 @@ void rkisp1_params_disable(struct rkisp1_params *params)
>   				RKISP1_CIF_ISP_DPF_MODE_EN);
>   }
>   
> +static struct rkisp1_params_ops rkisp1_params_ops = {
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
> +static struct rkisp1_params_config rkisp1_params_config = {
> +	.gamma_out_max_samples = 17,
> +};> +
>   static int rkisp1_params_enum_fmt_meta_out(struct file *file, void *priv,
>   					   struct v4l2_fmtdesc *f)
>   {
> @@ -1512,6 +1528,8 @@ static void rkisp1_init_params(struct rkisp1_params *params)
>   		V4L2_META_FMT_RK_ISP1_PARAMS;
>   	params->vdev_fmt.fmt.meta.buffersize =
>   		sizeof(struct rkisp1_params_cfg);
> +	params->ops = &rkisp1_params_ops;
> +	params->config = &rkisp1_params_config;
>   }
>   
>   int rkisp1_params_register(struct rkisp1_device *rkisp1)
> 
