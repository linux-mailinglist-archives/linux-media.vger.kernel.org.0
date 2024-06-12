Return-Path: <linux-media+bounces-13038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE91905428
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 15:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E80CF2830EF
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 13:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B229A17CA1D;
	Wed, 12 Jun 2024 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Rrt282tH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E067FB
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 13:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718200241; cv=none; b=M2m2KzFdWk5nEW/0VKbd7w+46PEX2y9Gn2De1yCZ0I6hXePwxs004h/v9mTc5l//ZXyys5lnpKY6QeBLct96zZzwdw1Vc4DF8eyojlAXT2JLT8HvajwAs76QNGSs4WLehNTvrJFE5+hnrs/2u2XLUkybQfbSSzcQrKfb0crQEDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718200241; c=relaxed/simple;
	bh=6grtnL+une2OxPR6/lnr1Kb79nevtgByS4MB+Lasl38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GGyP6gCUjAjJ3pYJ6+bIOzKP0z4K/VqrS0I0SXFgDNqU4rLuF8sMj/yB9y1bogJ3PVTRs2yfZubtbtHwd7M8DCw7+xADVZ5l7khEZkxGvYYlC1Hcd0/GLhBs9T6RJvb34bM4g+r85iafk5rQYvKTNCHwZW/RRPyom8SQsbxZcpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Rrt282tH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E969C4D0;
	Wed, 12 Jun 2024 15:50:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718200224;
	bh=6grtnL+une2OxPR6/lnr1Kb79nevtgByS4MB+Lasl38=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Rrt282tHH1TaVuzHlS89zYecQ4WOSoLkqrp+xv+Ie9evA9R5IljfdxJYSULliQETn
	 /2dA1cQruW+QsjVp8ZviP/K8WoHIhJwHpOhzeZn1QQCEgIKj7AniJ3wUfTa/HRAfxX
	 nNAVq9w7n5ofwpBTHea2sjB/6sK36V+jdzcTs75E=
Message-ID: <43ba414f-96f5-47a5-81a6-26cb109b22cd@ideasonboard.com>
Date: Wed, 12 Jun 2024 14:50:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] media: rkisp1: Implement extensible params support
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
 <20240605165434.432230-6-jacopo.mondi@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20240605165434.432230-6-jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jacopo

On 05/06/2024 17:54, Jacopo Mondi wrote:
> Implement support in the rkisp1-params for the extensible configuration
> parameters format.
>
> Create a list of handlers for each ISP block that wraps the existing
> configuration functions and handles the ISP block enablement state.
>
> Parse the configuration parameters buffer in __rkisp1_ext_params_config
> and filter the enable blocks by group, to allow setting the 'other' and
> 'meas' groups separately from the 'lsc' group to support the
> pre/post-configure operations.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>   .../platform/rockchip/rkisp1/rkisp1-params.c  | 565 +++++++++++++++++-
>   1 file changed, 544 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 6f99c7dad758..3d78e643d0b8 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -33,6 +33,10 @@
>   #define RKISP1_ISP_CC_COEFF(n) \
>   			(RKISP1_CIF_ISP_CC_COEFF_0 + (n) * 4)
>   
> +#define RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS	BIT(0)
> +#define RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS	BIT(1)
> +#define RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC	BIT(2)
> +
>   enum rkisp1_params_formats {
>   	RKISP1_PARAMS_FIXED,
>   	RKISP1_PARAMS_EXTENSIBLE,
> @@ -1529,9 +1533,491 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
>   	}
>   }
>   
> +/*------------------------------------------------------------------------------
> + * Extensible parameters format handling
> + */
> +
> +static void rkisp1_ext_params_bls(struct rkisp1_params *params,
> +				  struct rkisp1_ext_params_block_header *hdr)
> +{
> +	struct rkisp1_ext_params_bls_config *bls =
> +		(struct rkisp1_ext_params_bls_config *)hdr;
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_BLS_CTRL,
> +					RKISP1_CIF_ISP_BLS_ENA);
> +		return;
> +	}
> +
> +	rkisp1_bls_config(params, &bls->bls_config);
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_BLS_CTRL,
> +				      RKISP1_CIF_ISP_BLS_ENA);
> +}


Most of the handlers have all but identical handling for the enable/disable parts; is it worth 
factoring that out perhaps? The register and bits could be added to struct rkisp1_ext_params_handler 
and then a common pre-handler function could be called from __rkisp1_ext_params_config() to 
set/clear the bits.

> +
> +static void rkisp1_ext_params_dpcc(struct rkisp1_params *params,
> +				   struct rkisp1_ext_params_block_header *hdr)
> +{
> +	struct rkisp1_ext_params_dpcc_config *dpcc =
> +		(struct rkisp1_ext_params_dpcc_config *)hdr;
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPCC_MODE,
> +					RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE);
> +		return;
> +	}
> +
> +	rkisp1_dpcc_config(params, &dpcc->dpcc_config);
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_DPCC_MODE,
> +				      RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE);
> +}
> +
> +static void rkisp1_ext_params_sdg(struct rkisp1_params *params,
> +				  struct rkisp1_ext_params_block_header *hdr)
> +{
> +	struct rkisp1_ext_params_sdg_config *sdg =
> +		(struct rkisp1_ext_params_sdg_config *)hdr;
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
> +					RKISP1_CIF_ISP_CTRL_ISP_GAMMA_IN_ENA);
> +		return;
> +	}
> +
> +	rkisp1_sdg_config(params, &sdg->sdg_config);
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> +				      RKISP1_CIF_ISP_CTRL_ISP_GAMMA_IN_ENA);
> +}
> +
> +static void rkisp1_ext_params_lsc(struct rkisp1_params *params,
> +				  struct rkisp1_ext_params_block_header *hdr)
> +{
> +	struct rkisp1_ext_params_lsc_config *lsc =
> +		(struct rkisp1_ext_params_lsc_config *)hdr;
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_LSC_CTRL,
> +					RKISP1_CIF_ISP_LSC_CTRL_ENA);
> +		return;
> +	}
> +
> +	rkisp1_lsc_config(params, &lsc->lsc_config);
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_LSC_CTRL,
> +				      RKISP1_CIF_ISP_LSC_CTRL_ENA);
> +}
> +
> +static void rkisp1_ext_params_awbg(struct rkisp1_params *params,
> +				   struct rkisp1_ext_params_block_header *hdr)
> +{
> +	struct rkisp1_ext_params_awb_gain_config *awbg =
> +		(struct rkisp1_ext_params_awb_gain_config *)hdr;
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
> +					RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
> +		return;
> +	}
> +
> +	params->ops->awb_gain_config(params, &awbg->awb_config);
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> +				      RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
> +}
> +
> +static void rkisp1_ext_params_flt(struct rkisp1_params *params,
> +				  struct rkisp1_ext_params_block_header *hdr)
> +{
> +	struct rkisp1_ext_params_flt_config *flt =
> +		(struct rkisp1_ext_params_flt_config *)hdr;
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_FILT_MODE,
> +					RKISP1_CIF_ISP_FLT_ENA);
> +		return;
> +	}
> +
> +	rkisp1_flt_config(params, &flt->flt_config);
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_FILT_MODE,
> +				      RKISP1_CIF_ISP_FLT_ENA);
> +}
> +
> +static void rkisp1_ext_params_bdm(struct rkisp1_params *params,
> +				  struct rkisp1_ext_params_block_header *hdr)
> +{
> +	struct rkisp1_ext_params_bdm_config *bdm =
> +		(struct rkisp1_ext_params_bdm_config *)hdr;
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
> +					RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
> +		return;
> +	}
> +
> +	rkisp1_bdm_config(params, &bdm->bdm_config);
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
> +				      RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
> +}
> +
> +static void rkisp1_ext_params_ctk(struct rkisp1_params *params,
> +				  struct rkisp1_ext_params_block_header *hdr)
> +{
> +	struct rkisp1_ext_params_ctk_config *ctk =
> +		(struct rkisp1_ext_params_ctk_config *)hdr;
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_ctk_enable(params, false);
> +		return;
> +	}
> +
> +	rkisp1_ctk_config(params, &ctk->ctk_config);
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> +		rkisp1_ctk_enable(params, true);
> +}
> +
> +static void rkisp1_ext_params_goc(struct rkisp1_params *params,
> +				  struct rkisp1_ext_params_block_header *hdr)
> +{
> +	struct rkisp1_ext_params_goc_config *goc =
> +		(struct rkisp1_ext_params_goc_config *)hdr;
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
> +					RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
> +		return;
> +	}
> +
> +	params->ops->goc_config(params, &goc->goc_config);
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> +				      RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
> +}
> +
> +static void rkisp1_ext_params_dpf(struct rkisp1_params *params,
> +				  struct rkisp1_ext_params_block_header *hdr)
> +{
> +	struct rkisp1_ext_params_dpf_config *dpf =
> +		(struct rkisp1_ext_params_dpf_config *)hdr;
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPF_MODE,
> +					RKISP1_CIF_ISP_DPF_MODE_EN);
> +		return;
> +	}
> +
> +	rkisp1_dpf_config(params, &dpf->dpf_config);
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_DPF_MODE,
> +				      RKISP1_CIF_ISP_DPF_MODE_EN);
> +}
> +
> +static void rkisp1_ext_params_dpfs(struct rkisp1_params *params,
> +				   struct rkisp1_ext_params_block_header *hdr)
> +{
> +	struct rkisp1_ext_params_dpf_strength_config *dpfs =
> +		(struct rkisp1_ext_params_dpf_strength_config *)hdr;
> +
> +	rkisp1_dpf_strength_config(params, &dpfs->dpf_strength_config);
> +}
> +
> +static void rkisp1_ext_params_cproc(struct rkisp1_params *params,
> +				    struct rkisp1_ext_params_block_header *hdr)
> +{
> +	struct rkisp1_ext_params_cproc_config *cproc =
> +		(struct rkisp1_ext_params_cproc_config *)hdr;
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_C_PROC_CTRL,
> +					RKISP1_CIF_C_PROC_CTR_ENABLE);
> +		return;
> +	}
> +
> +	rkisp1_cproc_config(params, &cproc->cproc_config);
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> +		rkisp1_param_set_bits(params, RKISP1_CIF_C_PROC_CTRL,
> +				      RKISP1_CIF_C_PROC_CTR_ENABLE);
> +}
> +
> +static void rkisp1_ext_params_ie(struct rkisp1_params *params,
> +				 struct rkisp1_ext_params_block_header *hdr)
> +{
> +	struct rkisp1_ext_params_ie_config *ie =
> +		(struct rkisp1_ext_params_ie_config *)hdr;
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_ie_enable(params, false);
> +		return;
> +	}
> +
> +	rkisp1_ie_config(params, &ie->ie_config);
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> +		rkisp1_ie_enable(params, true);
> +}
> +
> +static void rkisp1_ext_params_awbm(struct rkisp1_params *params,
> +				   struct rkisp1_ext_params_block_header *hdr)
> +{
> +	struct rkisp1_ext_params_awb_meas_config *awbm =
> +		(struct rkisp1_ext_params_awb_meas_config *)hdr;
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		params->ops->awb_meas_enable(params, &awbm->awb_meas_config,
> +					     false);
> +		return;
> +	}
> +
> +	params->ops->awb_meas_config(params, &awbm->awb_meas_config);
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> +		params->ops->awb_meas_enable(params, &awbm->awb_meas_config,
> +					     true);
> +}
> +
> +static void rkisp1_ext_params_hstm(struct rkisp1_params *params,
> +				   struct rkisp1_ext_params_block_header *hdr)
> +{
> +	struct rkisp1_ext_params_hst_config *hst =
> +		(struct rkisp1_ext_params_hst_config *)hdr;
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		params->ops->hst_enable(params, &hst->hst_config, false);
> +		return;
> +	}
> +
> +	params->ops->hst_config(params, &hst->hst_config);
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> +		params->ops->hst_enable(params, &hst->hst_config, true);
> +}
> +
> +static void rkisp1_ext_params_aecm(struct rkisp1_params *params,
> +				   struct rkisp1_ext_params_block_header *hdr)
> +{
> +	struct rkisp1_ext_params_aec_config *aec =
> +		(struct rkisp1_ext_params_aec_config *)hdr;
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_EXP_CTRL,
> +					RKISP1_CIF_ISP_EXP_ENA);
> +		return;
> +	}
> +
> +	params->ops->aec_config(params, &aec->aec_config);
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_EXP_CTRL,
> +				      RKISP1_CIF_ISP_EXP_ENA);
> +}
> +
> +static void rkisp1_ext_params_afcm(struct rkisp1_params *params,
> +				   struct rkisp1_ext_params_block_header *hdr)
> +{
> +	struct rkisp1_ext_params_afc_config *afc =
> +		(struct rkisp1_ext_params_afc_config *)hdr;
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_AFM_CTRL,
> +					RKISP1_CIF_ISP_AFM_ENA);
> +		return;
> +	}
> +
> +	params->ops->afm_config(params, &afc->afc_config);
> +
> +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_AFM_CTRL,
> +				      RKISP1_CIF_ISP_AFM_ENA);
> +}
> +
> +typedef void (*rkisp1_block_handler)(struct rkisp1_params *params,
> +				     struct rkisp1_ext_params_block_header *hdr);
> +
> +static const struct rkisp1_ext_params_handler {
> +	size_t size;
> +	rkisp1_block_handler handler;
> +	unsigned int group;
> +} rkisp1_ext_params_handlers[] = {
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS] = {
> +		.size		= sizeof(struct rkisp1_ext_params_bls_config),
> +		.handler	= rkisp1_ext_params_bls,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC] = {
> +		.size		= sizeof(struct rkisp1_ext_params_dpcc_config),
> +		.handler	= rkisp1_ext_params_dpcc,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG] = {
> +		.size		= sizeof(struct rkisp1_ext_params_sdg_config),
> +		.handler	= rkisp1_ext_params_sdg,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAINS] = {
> +		.size		=
> +			sizeof(struct rkisp1_ext_params_awb_gain_config),
> +		.handler	= rkisp1_ext_params_awbg,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT] = {
> +		.size		= sizeof(struct rkisp1_ext_params_flt_config),
> +		.handler	= rkisp1_ext_params_flt,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM] = {
> +		.size		= sizeof(struct rkisp1_ext_params_bdm_config),
> +		.handler	= rkisp1_ext_params_bdm,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK] = {
> +		.size		= sizeof(struct rkisp1_ext_params_ctk_config),
> +		.handler	= rkisp1_ext_params_ctk,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC] = {
> +		.size		= sizeof(struct rkisp1_ext_params_goc_config),
> +		.handler	= rkisp1_ext_params_goc,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF] = {
> +		.size		= sizeof(struct rkisp1_ext_params_dpf_config),
> +		.handler	= rkisp1_ext_params_dpf,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGHT] = {
> +		.size		=
> +			sizeof(struct rkisp1_ext_params_dpf_strength_config),
> +		.handler	= rkisp1_ext_params_dpfs,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC] = {
> +		.size		= sizeof(struct rkisp1_ext_params_cproc_config),
> +		.handler	= rkisp1_ext_params_cproc,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_IE] = {
> +		.size		= sizeof(struct rkisp1_ext_params_ie_config),
> +		.handler	= rkisp1_ext_params_ie,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC] = {
> +		.size		= sizeof(struct rkisp1_ext_params_lsc_config),
> +		.handler	= rkisp1_ext_params_lsc,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS] = {
> +		.size		=
> +			sizeof(struct rkisp1_ext_params_awb_meas_config),
> +		.handler	= rkisp1_ext_params_awbm,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS] = {
> +		.size		= sizeof(struct rkisp1_ext_params_hst_config),
> +		.handler	= rkisp1_ext_params_hstm,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS] = {
> +		.size		= sizeof(struct rkisp1_ext_params_aec_config),
> +		.handler	= rkisp1_ext_params_aecm,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS] = {
> +		.size		= sizeof(struct rkisp1_ext_params_afc_config),
> +		.handler	= rkisp1_ext_params_afcm,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS
> +	},
> +};
> +
> +static int __rkisp1_ext_params_config(struct rkisp1_params *params,
> +				      struct rkisp1_ext_params_cfg *cfg,
> +				      u32 block_group_mask)
> +{
> +	size_t block_offset = 0;
> +
> +	if (cfg->total_size > RKISP1_EXT_PARAMS_MAX_SIZE) {
> +		dev_dbg(params->rkisp1->dev,
> +			"Invalid parameters buffer size %llu\n",
> +			cfg->total_size);
> +		return -EINVAL;
> +	}
> +
> +	/* Walk the list of parameter blocks and process them. */
> +	while (block_offset < cfg->total_size) {
> +		const struct rkisp1_ext_params_handler *block_handler;
> +		struct rkisp1_ext_params_block_header *block;
> +
> +		block = (struct rkisp1_ext_params_block_header *)
> +			&cfg->data[block_offset];
> +		block_offset += block->size;
> +
> +		/*
> +		 * Validate the block id and make sure the block group is in
> +		 * the list of groups to configure.
> +		 */
> +		if (block->type >= RKISP1_EXT_PARAMS_BLOCK_TYPE_SENTINEL) {
> +			dev_dbg(params->rkisp1->dev,
> +				"Invalid parameters block type\n");
> +			return -EINVAL;
> +		}
> +
> +		block_handler = &rkisp1_ext_params_handlers[block->type];
> +		if (!(block_handler->group & block_group_mask))
> +			continue;


So maybe something like


if (block_handler->enable_reg)

         __rkisp1_block_handle_enable_disable(block->state, block_handler->enable_reg, 
block_handler->enable_val);


here to move it out of the handlers.

> +
> +		if (block->size != block_handler->size) {
> +			dev_dbg(params->rkisp1->dev,
> +				"Invalid parameters block size\n");
> +			return -EINVAL;
> +		}
> +
> +		block_handler->handler(params, block);
> +	}
> +
> +	return 0;
> +}
> +
> +static int rkisp1_ext_params_config(struct rkisp1_params *params,
> +				    struct rkisp1_ext_params_cfg *cfg)
> +{
> +	return __rkisp1_ext_params_config(params, cfg,
> +					  RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS |
> +					  RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC |
> +					  RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS);
> +}
> +
> +static int
> +rkisp1_ext_params_other_meas_config(struct rkisp1_params *params,
> +				    struct rkisp1_ext_params_cfg *cfg)
> +{
> +	return __rkisp1_ext_params_config(params, cfg,
> +					  RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS |
> +					  RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS);
> +}
> +
> +static int rkisp1_ext_params_lsc_config(struct rkisp1_params *params,
> +					struct rkisp1_ext_params_cfg *cfg)
> +{
> +	return __rkisp1_ext_params_config(params, cfg,
> +					  RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC);
> +}
> +
>   static bool rkisp1_params_get_buffer(struct rkisp1_params *params,
>   				     struct rkisp1_buffer **buf,
> -				     struct rkisp1_params_cfg **cfg)
> +				     void **cfg)
>   {
>   	if (list_empty(&params->params))
>   		return false;
> @@ -1544,28 +2030,37 @@ static bool rkisp1_params_get_buffer(struct rkisp1_params *params,
>   
>   static void rkisp1_params_complete_buffer(struct rkisp1_params *params,
>   					  struct rkisp1_buffer *buf,
> -					  unsigned int frame_sequence)
> +					  unsigned int frame_sequence,
> +					  enum vb2_buffer_state state)
>   {
>   	list_del(&buf->queue);
>   
>   	buf->vb.sequence = frame_sequence;
> -	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +	vb2_buffer_done(&buf->vb.vb2_buf, state);
>   }
>   
>   void rkisp1_params_isr(struct rkisp1_device *rkisp1)
>   {
>   	struct rkisp1_params *params = &rkisp1->params;
> -	struct rkisp1_params_cfg *new_params;
> -	struct rkisp1_buffer *cur_buf;
> +	struct rkisp1_buffer *buf;
Why the rename?
> +	int ret = 0;
> +	void *cfg;
>   
>   	spin_lock(&params->config_lock);
>   
> -	if (!rkisp1_params_get_buffer(params, &cur_buf, &new_params))
> +	if (!rkisp1_params_get_buffer(params, &buf, &cfg))
>   		goto unlock;
>   
> -	rkisp1_isp_isr_other_config(params, new_params);
> -	rkisp1_isp_isr_lsc_config(params, new_params);
> -	rkisp1_isp_isr_meas_config(params, new_params);
> +	if (params->metafmt.dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
> +		rkisp1_isp_isr_other_config(params, cfg);
> +		rkisp1_isp_isr_lsc_config(params, cfg);
> +		rkisp1_isp_isr_meas_config(params, cfg);
> +	} else {
> +		ret = rkisp1_ext_params_config(params, cfg);
> +	}
> +
> +	if (ret)
> +		goto complete_and_unlock;
>   
>   	/* update shadow register immediately */
>   	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> @@ -1579,8 +2074,11 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
>   	 * indicate to userspace on which frame these parameters are being
>   	 * applied.
>   	 */
> -	rkisp1_params_complete_buffer(params, cur_buf,
> -				      rkisp1->isp.frame_sequence + 1);
> +complete_and_unlock:
> +	rkisp1_params_complete_buffer(params, buf,
> +				      rkisp1->isp.frame_sequence + 1,
> +				      ret ? VB2_BUF_STATE_ERROR
> +					  : VB2_BUF_STATE_DONE);
>   
>   unlock:
>   	spin_unlock(&params->config_lock);
> @@ -1631,8 +2129,9 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
>   				 enum v4l2_ycbcr_encoding ycbcr_encoding)
>   {
>   	struct rkisp1_cif_isp_hst_config hst = rkisp1_hst_params_default_config;
> -	struct rkisp1_params_cfg *new_params;
> -	struct rkisp1_buffer *cur_buf;
> +	struct rkisp1_buffer *buf;
> +	int ret = 0;
> +	void *cfg;
>   
>   	params->quantization = quantization;
>   	params->ycbcr_encoding = ycbcr_encoding;
> @@ -1661,11 +2160,26 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
>   
>   	/* apply the first buffer if there is one already */
>   
> -	if (!rkisp1_params_get_buffer(params, &cur_buf, &new_params))
> +	if (!rkisp1_params_get_buffer(params, &buf, &cfg))
>   		goto unlock;
>   
> -	rkisp1_isp_isr_other_config(params, new_params);
> -	rkisp1_isp_isr_meas_config(params, new_params);
> +	if (params->metafmt.dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
> +		rkisp1_isp_isr_other_config(params, cfg);
> +		rkisp1_isp_isr_meas_config(params, cfg);
> +	} else {
> +		ret = rkisp1_ext_params_other_meas_config(params, cfg);
> +	}
> +
> +	if (ret) {
> +		/*
> +		 * Complete the buffer in error state immediately. In case of no
> +		 * error, the buffer will be completed in
> +		 * rkisp1_params_post_configure().
> +		 */
> +		rkisp1_params_complete_buffer(params, buf, 0,
> +					      VB2_BUF_STATE_ERROR);
> +		goto unlock;
> +	}
>   
>   	/* update shadow register immediately */
>   	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> @@ -1677,8 +2191,9 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
>   
>   void rkisp1_params_post_configure(struct rkisp1_params *params)
>   {
> -	struct rkisp1_params_cfg *new_params;
> -	struct rkisp1_buffer *cur_buf;
> +	struct rkisp1_buffer *buf;
And likewise here?
> +	int ret = 0;
> +	void *cfg;
>   
>   	spin_lock_irq(&params->config_lock);
>   
> @@ -1691,16 +2206,24 @@ void rkisp1_params_post_configure(struct rkisp1_params *params)
>   	 * unconditionally.
>   	 */
>   
> -	if (!rkisp1_params_get_buffer(params, &cur_buf, &new_params))
> +	if (!rkisp1_params_get_buffer(params, &buf, &cfg))
>   		goto unlock;
>   
> -	rkisp1_isp_isr_lsc_config(params, new_params);
> +	if (params->metafmt.dataformat == V4L2_META_FMT_RK_ISP1_PARAMS)
> +		rkisp1_isp_isr_lsc_config(params, cfg);
> +	else
> +		ret = rkisp1_ext_params_lsc_config(params, cfg);
> +
> +	if (ret)
> +		goto complete_and_unlock;
>   
>   	/* update shadow register immediately */
>   	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
>   			      RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD);
>   
> -	rkisp1_params_complete_buffer(params, cur_buf, 0);
> +complete_and_unlock:
> +	rkisp1_params_complete_buffer(params, buf, 0, ret ? VB2_BUF_STATE_ERROR
> +							  : VB2_BUF_STATE_DONE);
>   
>   unlock:
>   	spin_unlock_irq(&params->config_lock);

