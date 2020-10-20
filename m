Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E405294132
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 19:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395312AbgJTRN2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 13:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729173AbgJTRN2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 13:13:28 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8E41C0613CE
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2020 10:13:27 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 5141E1F44F72
Subject: Re: [PATCH 3/4] media: staging: rkisp1: params: remove unnecessary
 parentheses
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20201019205956.6980-1-dafna.hirschfeld@collabora.com>
 <20201019205956.6980-4-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <757aa5f5-b63d-1ca9-c694-b91737f34bd8@collabora.com>
Date:   Tue, 20 Oct 2020 14:13:18 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201019205956.6980-4-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/19/20 5:59 PM, Dafna Hirschfeld wrote:
> There are several 'if' expression where double
> parentheses is used when one is enough.
> Remove the extra parentheses.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
>  drivers/staging/media/rkisp1/rkisp1-params.c | 32 ++++++++++----------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
> index 4ac401bc2164..a2df6b50c109 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
> @@ -891,7 +891,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  	if ((module_en_update & RKISP1_CIF_ISP_MODULE_DPCC) ||
>  	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_DPCC)) {
>  		/*update dpc config */
> -		if ((module_cfg_update & RKISP1_CIF_ISP_MODULE_DPCC))
> +		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_DPCC)
>  			rkisp1_dpcc_config(params,
>  					   &new_params->others.dpcc_config);
>  
> @@ -910,7 +910,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  	if ((module_en_update & RKISP1_CIF_ISP_MODULE_BLS) ||
>  	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_BLS)) {
>  		/* update bls config */
> -		if ((module_cfg_update & RKISP1_CIF_ISP_MODULE_BLS))
> +		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_BLS)
>  			rkisp1_bls_config(params,
>  					  &new_params->others.bls_config);
>  
> @@ -929,7 +929,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  	if ((module_en_update & RKISP1_CIF_ISP_MODULE_SDG) ||
>  	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_SDG)) {
>  		/* update sdg config */
> -		if ((module_cfg_update & RKISP1_CIF_ISP_MODULE_SDG))
> +		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_SDG)
>  			rkisp1_sdg_config(params,
>  					  &new_params->others.sdg_config);
>  
> @@ -948,7 +948,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  	if ((module_en_update & RKISP1_CIF_ISP_MODULE_LSC) ||
>  	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_LSC)) {
>  		/* update lsc config */
> -		if ((module_cfg_update & RKISP1_CIF_ISP_MODULE_LSC))
> +		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_LSC)
>  			rkisp1_lsc_config(params,
>  					  &new_params->others.lsc_config);
>  
> @@ -967,7 +967,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  	if ((module_en_update & RKISP1_CIF_ISP_MODULE_AWB_GAIN) ||
>  	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_AWB_GAIN)) {
>  		/* update awb gains */
> -		if ((module_cfg_update & RKISP1_CIF_ISP_MODULE_AWB_GAIN))
> +		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_AWB_GAIN)
>  			rkisp1_awb_gain_config(params,
>  					&new_params->others.awb_gain_config);
>  
> @@ -986,7 +986,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  	if ((module_en_update & RKISP1_CIF_ISP_MODULE_BDM) ||
>  	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_BDM)) {
>  		/* update bdm config */
> -		if ((module_cfg_update & RKISP1_CIF_ISP_MODULE_BDM))
> +		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_BDM)
>  			rkisp1_bdm_config(params,
>  					  &new_params->others.bdm_config);
>  
> @@ -1005,7 +1005,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  	if ((module_en_update & RKISP1_CIF_ISP_MODULE_FLT) ||
>  	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_FLT)) {
>  		/* update filter config */
> -		if ((module_cfg_update & RKISP1_CIF_ISP_MODULE_FLT))
> +		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_FLT)
>  			rkisp1_flt_config(params,
>  					  &new_params->others.flt_config);
>  
> @@ -1024,7 +1024,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  	if ((module_en_update & RKISP1_CIF_ISP_MODULE_CTK) ||
>  	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_CTK)) {
>  		/* update ctk config */
> -		if ((module_cfg_update & RKISP1_CIF_ISP_MODULE_CTK))
> +		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_CTK)
>  			rkisp1_ctk_config(params,
>  					  &new_params->others.ctk_config);
>  
> @@ -1036,7 +1036,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  	if ((module_en_update & RKISP1_CIF_ISP_MODULE_GOC) ||
>  	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_GOC)) {
>  		/* update goc config */
> -		if ((module_cfg_update & RKISP1_CIF_ISP_MODULE_GOC))
> +		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_GOC)
>  			rkisp1_goc_config(params,
>  					  &new_params->others.goc_config);
>  
> @@ -1055,7 +1055,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  	if ((module_en_update & RKISP1_CIF_ISP_MODULE_CPROC) ||
>  	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_CPROC)) {
>  		/* update cproc config */
> -		if ((module_cfg_update & RKISP1_CIF_ISP_MODULE_CPROC)) {
> +		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_CPROC) {
>  			rkisp1_cproc_config(params,
>  					    &new_params->others.cproc_config);
>  		}
> @@ -1075,7 +1075,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  	if ((module_en_update & RKISP1_CIF_ISP_MODULE_IE) ||
>  	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_IE)) {
>  		/* update ie config */
> -		if ((module_cfg_update & RKISP1_CIF_ISP_MODULE_IE))
> +		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_IE)
>  			rkisp1_ie_config(params,
>  					 &new_params->others.ie_config);
>  
> @@ -1087,7 +1087,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  	if ((module_en_update & RKISP1_CIF_ISP_MODULE_DPF) ||
>  	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_DPF)) {
>  		/* update dpf  config */
> -		if ((module_cfg_update & RKISP1_CIF_ISP_MODULE_DPF))
> +		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_DPF)
>  			rkisp1_dpf_config(params,
>  					  &new_params->others.dpf_config);
>  
> @@ -1123,7 +1123,7 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
>  	if ((module_en_update & RKISP1_CIF_ISP_MODULE_AWB) ||
>  	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_AWB)) {
>  		/* update awb config */
> -		if ((module_cfg_update & RKISP1_CIF_ISP_MODULE_AWB))
> +		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_AWB)
>  			rkisp1_awb_meas_config(params,
>  					&new_params->meas.awb_meas_config);
>  
> @@ -1136,7 +1136,7 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
>  	if ((module_en_update & RKISP1_CIF_ISP_MODULE_AFC) ||
>  	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_AFC)) {
>  		/* update afc config */
> -		if ((module_cfg_update & RKISP1_CIF_ISP_MODULE_AFC))
> +		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_AFC)
>  			rkisp1_afm_config(params,
>  					  &new_params->meas.afc_config);
>  
> @@ -1155,7 +1155,7 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
>  	if ((module_en_update & RKISP1_CIF_ISP_MODULE_HST) ||
>  	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_HST)) {
>  		/* update hst config */
> -		if ((module_cfg_update & RKISP1_CIF_ISP_MODULE_HST))
> +		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_HST)
>  			rkisp1_hst_config(params,
>  					  &new_params->meas.hst_config);
>  
> @@ -1168,7 +1168,7 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
>  	if ((module_en_update & RKISP1_CIF_ISP_MODULE_AEC) ||
>  	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_AEC)) {
>  		/* update aec config */
> -		if ((module_cfg_update & RKISP1_CIF_ISP_MODULE_AEC))
> +		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_AEC)
>  			rkisp1_aec_config(params,
>  					  &new_params->meas.aec_config);
>  
> 
