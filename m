Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2DE294131
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 19:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395310AbgJTRNY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 13:13:24 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43440 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395204AbgJTRNY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 13:13:24 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id EFEA91F44F56
Subject: Re: [PATCH 2/4] media: staging: rkisp1: params: remove unnecessary
 "!!"
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20201019205956.6980-1-dafna.hirschfeld@collabora.com>
 <20201019205956.6980-3-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <e228b9ca-58a6-b70d-ff8d-d0e73f09d276@collabora.com>
Date:   Tue, 20 Oct 2020 14:13:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201019205956.6980-3-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/19/20 5:59 PM, Dafna Hirschfeld wrote:
> There are several 'if' conditions of the form:
> 
> if (!!(module_ens & SOME_FLAG))
> 
> Those can be replaced with:
> 
> if (module_ens & SOME_FLAG)
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
>  drivers/staging/media/rkisp1/rkisp1-params.c | 24 ++++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
> index 986d293201e6..4ac401bc2164 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
> @@ -896,7 +896,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  					   &new_params->others.dpcc_config);
>  
>  		if (module_en_update & RKISP1_CIF_ISP_MODULE_DPCC) {
> -			if (!!(module_ens & RKISP1_CIF_ISP_MODULE_DPCC))
> +			if (module_ens & RKISP1_CIF_ISP_MODULE_DPCC)
>  				rkisp1_param_set_bits(params,
>  						      RKISP1_CIF_ISP_DPCC_MODE,
>  						      RKISP1_CIF_ISP_DPCC_ENA);
> @@ -915,7 +915,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  					  &new_params->others.bls_config);
>  
>  		if (module_en_update & RKISP1_CIF_ISP_MODULE_BLS) {
> -			if (!!(module_ens & RKISP1_CIF_ISP_MODULE_BLS))
> +			if (module_ens & RKISP1_CIF_ISP_MODULE_BLS)
>  				rkisp1_param_set_bits(params,
>  						      RKISP1_CIF_ISP_BLS_CTRL,
>  						      RKISP1_CIF_ISP_BLS_ENA);
> @@ -934,7 +934,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  					  &new_params->others.sdg_config);
>  
>  		if (module_en_update & RKISP1_CIF_ISP_MODULE_SDG) {
> -			if (!!(module_ens & RKISP1_CIF_ISP_MODULE_SDG))
> +			if (module_ens & RKISP1_CIF_ISP_MODULE_SDG)
>  				rkisp1_param_set_bits(params,
>  					RKISP1_CIF_ISP_CTRL,
>  					RKISP1_CIF_ISP_CTRL_ISP_GAMMA_IN_ENA);
> @@ -953,7 +953,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  					  &new_params->others.lsc_config);
>  
>  		if (module_en_update & RKISP1_CIF_ISP_MODULE_LSC) {
> -			if (!!(module_ens & RKISP1_CIF_ISP_MODULE_LSC))
> +			if (module_ens & RKISP1_CIF_ISP_MODULE_LSC)
>  				rkisp1_param_set_bits(params,
>  						RKISP1_CIF_ISP_LSC_CTRL,
>  						RKISP1_CIF_ISP_LSC_CTRL_ENA);
> @@ -972,7 +972,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  					&new_params->others.awb_gain_config);
>  
>  		if (module_en_update & RKISP1_CIF_ISP_MODULE_AWB_GAIN) {
> -			if (!!(module_ens & RKISP1_CIF_ISP_MODULE_AWB_GAIN))
> +			if (module_ens & RKISP1_CIF_ISP_MODULE_AWB_GAIN)
>  				rkisp1_param_set_bits(params,
>  					RKISP1_CIF_ISP_CTRL,
>  					RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
> @@ -991,7 +991,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  					  &new_params->others.bdm_config);
>  
>  		if (module_en_update & RKISP1_CIF_ISP_MODULE_BDM) {
> -			if (!!(module_ens & RKISP1_CIF_ISP_MODULE_BDM))
> +			if (module_ens & RKISP1_CIF_ISP_MODULE_BDM)
>  				rkisp1_param_set_bits(params,
>  						RKISP1_CIF_ISP_DEMOSAIC,
>  						RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
> @@ -1010,7 +1010,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  					  &new_params->others.flt_config);
>  
>  		if (module_en_update & RKISP1_CIF_ISP_MODULE_FLT) {
> -			if (!!(module_ens & RKISP1_CIF_ISP_MODULE_FLT))
> +			if (module_ens & RKISP1_CIF_ISP_MODULE_FLT)
>  				rkisp1_param_set_bits(params,
>  						      RKISP1_CIF_ISP_FILT_MODE,
>  						      RKISP1_CIF_ISP_FLT_ENA);
> @@ -1041,7 +1041,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  					  &new_params->others.goc_config);
>  
>  		if (module_en_update & RKISP1_CIF_ISP_MODULE_GOC) {
> -			if (!!(module_ens & RKISP1_CIF_ISP_MODULE_GOC))
> +			if (module_ens & RKISP1_CIF_ISP_MODULE_GOC)
>  				rkisp1_param_set_bits(params,
>  					RKISP1_CIF_ISP_CTRL,
>  					RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
> @@ -1061,7 +1061,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  		}
>  
>  		if (module_en_update & RKISP1_CIF_ISP_MODULE_CPROC) {
> -			if (!!(module_ens & RKISP1_CIF_ISP_MODULE_CPROC))
> +			if (module_ens & RKISP1_CIF_ISP_MODULE_CPROC)
>  				rkisp1_param_set_bits(params,
>  						RKISP1_CIF_C_PROC_CTRL,
>  						RKISP1_CIF_C_PROC_CTR_ENABLE);
> @@ -1092,7 +1092,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  					  &new_params->others.dpf_config);
>  
>  		if (module_en_update & RKISP1_CIF_ISP_MODULE_DPF) {
> -			if (!!(module_ens & RKISP1_CIF_ISP_MODULE_DPF))
> +			if (module_ens & RKISP1_CIF_ISP_MODULE_DPF)
>  				rkisp1_param_set_bits(params,
>  						   RKISP1_CIF_ISP_DPF_MODE,
>  						   RKISP1_CIF_ISP_DPF_MODE_EN);
> @@ -1141,7 +1141,7 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
>  					  &new_params->meas.afc_config);
>  
>  		if (module_en_update & RKISP1_CIF_ISP_MODULE_AFC) {
> -			if (!!(module_ens & RKISP1_CIF_ISP_MODULE_AFC))
> +			if (module_ens & RKISP1_CIF_ISP_MODULE_AFC)
>  				rkisp1_param_set_bits(params,
>  						      RKISP1_CIF_ISP_AFM_CTRL,
>  						      RKISP1_CIF_ISP_AFM_ENA);
> @@ -1173,7 +1173,7 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
>  					  &new_params->meas.aec_config);
>  
>  		if (module_en_update & RKISP1_CIF_ISP_MODULE_AEC) {
> -			if (!!(module_ens & RKISP1_CIF_ISP_MODULE_AEC))
> +			if (module_ens & RKISP1_CIF_ISP_MODULE_AEC)
>  				rkisp1_param_set_bits(params,
>  						      RKISP1_CIF_ISP_EXP_CTRL,
>  						      RKISP1_CIF_ISP_EXP_ENA);
> 
