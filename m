Return-Path: <linux-media+bounces-14589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2519261F8
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 15:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C47E5284694
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 13:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D6217967E;
	Wed,  3 Jul 2024 13:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DRYwB+y1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF16B173359
	for <linux-media@vger.kernel.org>; Wed,  3 Jul 2024 13:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720014005; cv=none; b=puJ9pJf76mwiYtQfxSCsKGNtKokpJ2EA7AHKw4Rffw4RetCSBwHair0n6HUACAuGquPvFL7fn6w3KKeoot5UqmRK9G2bbD71+ASWKMZ7YsrGJG+oAOyMPQ5o62nUQuB/Lst34KjNNRgQ5sAHnaLK/RnpG6WFpski/2vNGDkX0W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720014005; c=relaxed/simple;
	bh=VBLxghayAxzzCAOLc+wTzkcba1Vl0Qw2ADu1bovLwQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJ1PdWZ09EeoU9fEcMhieefb02uhL9cEfiiabjMyS8tE6PV100yeDejYTkDURUTiVOffFO/AIAM5pxw3Lcv1avIdaKx5s79hIL+hD2753WZyt0yjfxM/aZ+kVT95bfs/7ypcLVWwlkfePTNINXdCUDYlC1Yk4BfGs7mZByl2HrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DRYwB+y1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 022CF3D6;
	Wed,  3 Jul 2024 15:39:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720013972;
	bh=VBLxghayAxzzCAOLc+wTzkcba1Vl0Qw2ADu1bovLwQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DRYwB+y1NJvJZj24JQkO1rG8HQtfgWvRhzpWoz8jr8aV1XEznutY07je6kghRpu1U
	 GXbvrkBTv3yehylaLi9jmGweDZBD235yZe4jNAOq0zyRNTDchz3ORtqL40ORksEjdS
	 GbaLJG7yOynKgOcrHXxcGLiHZXbfdxog8/YKh1NU=
Date: Wed, 3 Jul 2024 16:39:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v4 6/7] media: rkisp1: Implement extensible params support
Message-ID: <20240703133938.GI27927@pendragon.ideasonboard.com>
References: <20240703101951.77785-1-jacopo.mondi@ideasonboard.com>
 <20240703101951.77785-7-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240703101951.77785-7-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Wed, Jul 03, 2024 at 12:19:49PM +0200, Jacopo Mondi wrote:
> Implement support in rkisp1-params for the extensible configuration
> parameters format.
> 
> Create a list of handlers for each ISP block that wraps the existing
> configuration functions and handles the ISP block enablement.
> 
> Parse the configuration parameters buffer in rkisp1_ext_params_config
> and filter the enable blocks by group, to allow setting the 'other'
> groups separately from the 'lsc' group to support the pre/post-configure
> operations.
> 
> Implement parameter buffer validation for the extensible format at
> .buf_prepare() time.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-common.h  |   3 +
>  .../platform/rockchip/rkisp1/rkisp1-params.c  | 580 +++++++++++++++++-
>  2 files changed, 569 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 43cc727a628d..2f4bf7e97927 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -396,6 +396,7 @@ struct rkisp1_params_ops {
>   * @quantization:	the quantization configured on the isp's src pad
>   * @ycbcr_encoding	the YCbCr encoding
>   * @raw_type:		the bayer pattern on the isp video sink pad
> + * @enabled_blocks:	bitmask of enabled ISP blocks
>   */
>  struct rkisp1_params {
>  	struct rkisp1_vdev_node vnode;
> @@ -410,6 +411,8 @@ struct rkisp1_params {
>  	enum v4l2_quantization quantization;
>  	enum v4l2_ycbcr_encoding ycbcr_encoding;
>  	enum rkisp1_fmt_raw_pat_type raw_type;
> +
> +	u32 enabled_blocks;
>  };
>  
>  /*
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 9444790c564f..125093d16adb 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -35,6 +35,30 @@
>  #define RKISP1_ISP_CC_COEFF(n) \
>  			(RKISP1_CIF_ISP_CC_COEFF_0 + (n) * 4)
>  
> +#define RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS	BIT(0)
> +#define RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC	BIT(1)
> +
> +union rkisp1_ext_params_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_ext_params_bls_config bls;
> +	struct rkisp1_ext_params_dpcc_config dpcc;
> +	struct rkisp1_ext_params_sdg_config sdg;
> +	struct rkisp1_ext_params_lsc_config lsc;
> +	struct rkisp1_ext_params_awb_gain_config awbg;
> +	struct rkisp1_ext_params_flt_config flt;
> +	struct rkisp1_ext_params_bdm_config bdm;
> +	struct rkisp1_ext_params_ctk_config ctk;
> +	struct rkisp1_ext_params_goc_config goc;
> +	struct rkisp1_ext_params_dpf_config dpf;
> +	struct rkisp1_ext_params_dpf_strength_config dpfs;
> +	struct rkisp1_ext_params_cproc_config cproc;
> +	struct rkisp1_ext_params_ie_config ie;
> +	struct rkisp1_ext_params_awb_meas_config awbm;
> +	struct rkisp1_ext_params_hst_config hst;
> +	struct rkisp1_ext_params_aec_config aec;
> +	struct rkisp1_ext_params_afc_config afc;
> +};
> +
>  enum rkisp1_params_formats {
>  	RKISP1_PARAMS_FIXED,
>  	RKISP1_PARAMS_EXTENSIBLE,
> @@ -1519,6 +1543,451 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
>  	}
>  }
>  
> +/*------------------------------------------------------------------------------
> + * Extensible parameters format handling
> + */
> +
> +static void
> +rkisp1_ext_params_bls(struct rkisp1_params *params,
> +		      const union rkisp1_ext_params_config *block)
> +{
> +	const struct rkisp1_ext_params_bls_config *bls = &block->bls;
> +
> +	if (bls->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_BLS_CTRL,
> +					RKISP1_CIF_ISP_BLS_ENA);
> +		return;
> +	}
> +
> +	rkisp1_bls_config(params, &bls->config);
> +
> +	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS)))
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_BLS_CTRL,
> +				      RKISP1_CIF_ISP_BLS_ENA);
> +}
> +
> +static void
> +rkisp1_ext_params_dpcc(struct rkisp1_params *params,
> +		       const union rkisp1_ext_params_config *block)
> +{
> +	const struct rkisp1_ext_params_dpcc_config *dpcc = &block->dpcc;
> +
> +	if (dpcc->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPCC_MODE,
> +					RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE);
> +		return;
> +	}
> +
> +	rkisp1_dpcc_config(params, &dpcc->config);
> +
> +	if (!(params->enabled_blocks &
> +	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC)))
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_DPCC_MODE,
> +				      RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE);
> +}
> +
> +static void
> +rkisp1_ext_params_sdg(struct rkisp1_params *params,
> +		      const union rkisp1_ext_params_config *block)
> +{
> +	const struct rkisp1_ext_params_sdg_config *sdg = &block->sdg;
> +
> +	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
> +					RKISP1_CIF_ISP_CTRL_ISP_GAMMA_IN_ENA);
> +		return;
> +	}
> +
> +	rkisp1_sdg_config(params, &sdg->config);
> +
> +	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG)))
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> +				      RKISP1_CIF_ISP_CTRL_ISP_GAMMA_IN_ENA);
> +}
> +
> +static void
> +rkisp1_ext_params_lsc(struct rkisp1_params *params,
> +		      const union rkisp1_ext_params_config *block)
> +{
> +	const struct rkisp1_ext_params_lsc_config *lsc = &block->lsc;
> +
> +	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_LSC_CTRL,
> +					RKISP1_CIF_ISP_LSC_CTRL_ENA);
> +		return;
> +	}
> +
> +	rkisp1_lsc_config(params, &lsc->config);
> +
> +	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC)))
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_LSC_CTRL,
> +				      RKISP1_CIF_ISP_LSC_CTRL_ENA);
> +}
> +
> +static void
> +rkisp1_ext_params_awbg(struct rkisp1_params *params,
> +		       const union rkisp1_ext_params_config *block)
> +{
> +	const struct rkisp1_ext_params_awb_gain_config *awbg = &block->awbg;
> +
> +	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
> +					RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
> +		return;
> +	}
> +
> +	params->ops->awb_gain_config(params, &awbg->config);
> +
> +	if (!(params->enabled_blocks &
> +	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN)))
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> +				      RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
> +}
> +
> +static void
> +rkisp1_ext_params_flt(struct rkisp1_params *params,
> +		      const union rkisp1_ext_params_config *block)
> +{
> +	const struct rkisp1_ext_params_flt_config *flt = &block->flt;
> +
> +	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_FILT_MODE,
> +					RKISP1_CIF_ISP_FLT_ENA);
> +		return;
> +	}
> +
> +	rkisp1_flt_config(params, &flt->config);
> +
> +	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT)))
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_FILT_MODE,
> +				      RKISP1_CIF_ISP_FLT_ENA);
> +}
> +
> +static void
> +rkisp1_ext_params_bdm(struct rkisp1_params *params,
> +		      const union rkisp1_ext_params_config *block)
> +{
> +	const struct rkisp1_ext_params_bdm_config *bdm = &block->bdm;
> +
> +	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
> +					RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
> +		return;
> +	}
> +
> +	rkisp1_bdm_config(params, &bdm->config);
> +
> +	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM)))
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
> +				      RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
> +}
> +
> +static void
> +rkisp1_ext_params_ctk(struct rkisp1_params *params,
> +		      const union rkisp1_ext_params_config *block)
> +{
> +	const struct rkisp1_ext_params_ctk_config *ctk = &block->ctk;
> +
> +	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_ctk_enable(params, false);
> +		return;
> +	}
> +
> +	rkisp1_ctk_config(params, &ctk->config);
> +
> +	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK)))
> +		rkisp1_ctk_enable(params, true);
> +}
> +
> +static void
> +rkisp1_ext_params_goc(struct rkisp1_params *params,
> +		      const union rkisp1_ext_params_config *block)
> +{
> +	const struct rkisp1_ext_params_goc_config *goc = &block->goc;
> +
> +	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
> +					RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
> +		return;
> +	}
> +
> +	params->ops->goc_config(params, &goc->config);
> +
> +	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC)))
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> +				      RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
> +}
> +
> +static void
> +rkisp1_ext_params_dpf(struct rkisp1_params *params,
> +		      const union rkisp1_ext_params_config *block)
> +{
> +	const struct rkisp1_ext_params_dpf_config *dpf = &block->dpf;
> +
> +	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPF_MODE,
> +					RKISP1_CIF_ISP_DPF_MODE_EN);
> +		return;
> +	}
> +
> +	rkisp1_dpf_config(params, &dpf->config);
> +
> +	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF)))
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_DPF_MODE,
> +				      RKISP1_CIF_ISP_DPF_MODE_EN);
> +}
> +
> +static void
> +rkisp1_ext_params_dpfs(struct rkisp1_params *params,
> +		       const union rkisp1_ext_params_config *block)
> +{
> +	const struct rkisp1_ext_params_dpf_strength_config *dpfs = &block->dpfs;
> +
> +	rkisp1_dpf_strength_config(params, &dpfs->config);
> +}
> +
> +static void
> +rkisp1_ext_params_cproc(struct rkisp1_params *params,
> +			const union rkisp1_ext_params_config *block)
> +{
> +	const struct rkisp1_ext_params_cproc_config *cproc = &block->cproc;
> +
> +	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_C_PROC_CTRL,
> +					RKISP1_CIF_C_PROC_CTR_ENABLE);
> +		return;
> +	}
> +
> +	rkisp1_cproc_config(params, &cproc->config);
> +
> +	if (!(params->enabled_blocks &
> +	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC)))
> +		rkisp1_param_set_bits(params, RKISP1_CIF_C_PROC_CTRL,
> +				      RKISP1_CIF_C_PROC_CTR_ENABLE);
> +}
> +
> +static void
> +rkisp1_ext_params_ie(struct rkisp1_params *params,
> +		     const union rkisp1_ext_params_config *block)
> +{
> +	const struct rkisp1_ext_params_ie_config *ie = &block->ie;
> +
> +	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_ie_enable(params, false);
> +		return;
> +	}
> +
> +	rkisp1_ie_config(params, &ie->config);
> +
> +	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_IE)))
> +		rkisp1_ie_enable(params, true);
> +}
> +
> +static void
> +rkisp1_ext_params_awbm(struct rkisp1_params *params,
> +		       const union rkisp1_ext_params_config *block)
> +{
> +	const struct rkisp1_ext_params_awb_meas_config *awbm = &block->awbm;
> +
> +	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		params->ops->awb_meas_enable(params, &awbm->config,
> +					     false);
> +		return;
> +	}
> +
> +	params->ops->awb_meas_config(params, &awbm->config);
> +
> +	if (!(params->enabled_blocks &
> +	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS)))
> +		params->ops->awb_meas_enable(params, &awbm->config,
> +					     true);
> +}
> +
> +static void
> +rkisp1_ext_params_hstm(struct rkisp1_params *params,
> +		       const union rkisp1_ext_params_config *block)
> +{
> +	const struct rkisp1_ext_params_hst_config *hst = &block->hst;
> +
> +	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		params->ops->hst_enable(params, &hst->config, false);
> +		return;
> +	}
> +
> +	params->ops->hst_config(params, &hst->config);
> +
> +	if (!(params->enabled_blocks &
> +	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS)))
> +		params->ops->hst_enable(params, &hst->config, true);
> +}
> +
> +static void
> +rkisp1_ext_params_aecm(struct rkisp1_params *params,
> +		       const union rkisp1_ext_params_config *block)
> +{
> +	const struct rkisp1_ext_params_aec_config *aec = &block->aec;
> +
> +	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_EXP_CTRL,
> +					RKISP1_CIF_ISP_EXP_ENA);
> +		return;
> +	}
> +
> +	params->ops->aec_config(params, &aec->config);
> +
> +	if (!(params->enabled_blocks &
> +	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS)))
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_EXP_CTRL,
> +				      RKISP1_CIF_ISP_EXP_ENA);
> +}
> +
> +static void
> +rkisp1_ext_params_afcm(struct rkisp1_params *params,
> +		       const union rkisp1_ext_params_config *block)
> +{
> +	const struct rkisp1_ext_params_afc_config *afc = &block->afc;
> +
> +	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_AFM_CTRL,
> +					RKISP1_CIF_ISP_AFM_ENA);
> +		return;
> +	}
> +
> +	params->ops->afm_config(params, &afc->config);
> +
> +	if (!(params->enabled_blocks &
> +	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS)))
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_AFM_CTRL,
> +				      RKISP1_CIF_ISP_AFM_ENA);
> +}
> +
> +typedef void (*rkisp1_block_handler)(struct rkisp1_params *params,
> +			     const union rkisp1_ext_params_config *config);
> +
> +static const struct rkisp1_ext_params_handler {
> +	size_t size;
> +	rkisp1_block_handler handler;
> +	unsigned int group;
> +} rkisp1_ext_params_handlers[] = {
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS] = {
> +		.size		= sizeof(struct rkisp1_ext_params_bls_config),
> +		.handler	= rkisp1_ext_params_bls,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC] = {
> +		.size		= sizeof(struct rkisp1_ext_params_dpcc_config),
> +		.handler	= rkisp1_ext_params_dpcc,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG] = {
> +		.size		= sizeof(struct rkisp1_ext_params_sdg_config),
> +		.handler	= rkisp1_ext_params_sdg,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN] = {
> +		.size		= sizeof(struct rkisp1_ext_params_awb_gain_config),
> +		.handler	= rkisp1_ext_params_awbg,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT] = {
> +		.size		= sizeof(struct rkisp1_ext_params_flt_config),
> +		.handler	= rkisp1_ext_params_flt,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM] = {
> +		.size		= sizeof(struct rkisp1_ext_params_bdm_config),
> +		.handler	= rkisp1_ext_params_bdm,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK] = {
> +		.size		= sizeof(struct rkisp1_ext_params_ctk_config),
> +		.handler	= rkisp1_ext_params_ctk,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC] = {
> +		.size		= sizeof(struct rkisp1_ext_params_goc_config),
> +		.handler	= rkisp1_ext_params_goc,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF] = {
> +		.size		= sizeof(struct rkisp1_ext_params_dpf_config),
> +		.handler	= rkisp1_ext_params_dpf,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH] = {
> +		.size		= sizeof(struct rkisp1_ext_params_dpf_strength_config),
> +		.handler	= rkisp1_ext_params_dpfs,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC] = {
> +		.size		= sizeof(struct rkisp1_ext_params_cproc_config),
> +		.handler	= rkisp1_ext_params_cproc,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_IE] = {
> +		.size		= sizeof(struct rkisp1_ext_params_ie_config),
> +		.handler	= rkisp1_ext_params_ie,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC] = {
> +		.size		= sizeof(struct rkisp1_ext_params_lsc_config),
> +		.handler	= rkisp1_ext_params_lsc,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC,
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS] = {
> +		.size		= sizeof(struct rkisp1_ext_params_awb_meas_config),
> +		.handler	= rkisp1_ext_params_awbm,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS] = {
> +		.size		= sizeof(struct rkisp1_ext_params_hst_config),
> +		.handler	= rkisp1_ext_params_hstm,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS] = {
> +		.size		= sizeof(struct rkisp1_ext_params_aec_config),
> +		.handler	= rkisp1_ext_params_aecm,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS] = {
> +		.size		= sizeof(struct rkisp1_ext_params_afc_config),
> +		.handler	= rkisp1_ext_params_afcm,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> +	},
> +};
> +
> +static void rkisp1_ext_params_config(struct rkisp1_params *params,
> +				     struct rkisp1_ext_params_cfg *cfg,
> +				     u32 block_group_mask)
> +{
> +	size_t block_offset = 0;
> +
> +	if (WARN_ON(!cfg))
> +		return;
> +
> +	/* Walk the list of parameter blocks and process them. */
> +	while (block_offset < cfg->data_size) {
> +		const struct rkisp1_ext_params_handler *block_handler;
> +		const union rkisp1_ext_params_config *block;
> +
> +		block = (const union rkisp1_ext_params_config *)
> +			&cfg->data[block_offset];
> +		block_offset += block->header.size;
> +
> +		/* Make sure the block is in the list of groups to configure. */
> +		block_handler = &rkisp1_ext_params_handlers[block->header.type];
> +		if (!(block_handler->group & block_group_mask))
> +			continue;
> +
> +		block_handler->handler(params, block);
> +
> +		if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE)
> +			params->enabled_blocks &= ~BIT(block->header.type);
> +		else
> +			params->enabled_blocks |= BIT(block->header.type);
> +	}
> +}
> +
>  static void rkisp1_params_complete_buffer(struct rkisp1_params *params,
>  					  struct rkisp1_params_buffer *buf,
>  					  unsigned int frame_sequence)
> @@ -1541,9 +2010,15 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
>  	if (!cur_buf)
>  		goto unlock;
>  
> -	rkisp1_isp_isr_other_config(params, cur_buf->cfg);
> -	rkisp1_isp_isr_lsc_config(params, cur_buf->cfg);
> -	rkisp1_isp_isr_meas_config(params, cur_buf->cfg);
> +	if (params->metafmt->dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
> +		rkisp1_isp_isr_other_config(params, cur_buf->cfg);
> +		rkisp1_isp_isr_lsc_config(params, cur_buf->cfg);
> +		rkisp1_isp_isr_meas_config(params, cur_buf->cfg);
> +	} else {
> +		rkisp1_ext_params_config(params, cur_buf->cfg,
> +					 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS |
> +					 RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC);
> +	}
>  
>  	/* update shadow register immediately */
>  	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> @@ -1643,8 +2118,13 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
>  	if (!cur_buf)
>  		goto unlock;
>  
> -	rkisp1_isp_isr_other_config(params, cur_buf->cfg);
> -	rkisp1_isp_isr_meas_config(params, cur_buf->cfg);
> +	if (params->metafmt->dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
> +		rkisp1_isp_isr_other_config(params, cur_buf->cfg);
> +		rkisp1_isp_isr_meas_config(params, cur_buf->cfg);
> +	} else {
> +		rkisp1_ext_params_config(params, cur_buf->cfg,
> +					 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS);
> +	}
>  
>  	/* update shadow register immediately */
>  	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> @@ -1673,7 +2153,11 @@ void rkisp1_params_post_configure(struct rkisp1_params *params)
>  	if (!cur_buf)
>  		goto unlock;
>  
> -	rkisp1_isp_isr_lsc_config(params, cur_buf->cfg);
> +	if (params->metafmt->dataformat == V4L2_META_FMT_RK_ISP1_PARAMS)
> +		rkisp1_isp_isr_lsc_config(params, cur_buf->cfg);
> +	else
> +		rkisp1_ext_params_config(params, cur_buf->cfg,
> +					 RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC);
>  
>  	/* update shadow register immediately */
>  	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> @@ -1862,23 +2346,90 @@ static void rkisp1_params_vb2_buf_queue(struct vb2_buffer *vb)
>  	spin_unlock_irq(&params->config_lock);
>  }
>  
> -static int rkisp1_params_vb2_buf_prepare(struct vb2_buffer *vb)
> +static int rkisp1_params_prepare_ext_params(struct rkisp1_params *params,
> +					    struct vb2_buffer *vb)
>  {
>  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> -	struct rkisp1_params_buffer *params_buf = to_rkisp1_params_buffer(vbuf);
> -	struct rkisp1_params_cfg *cfg =
> -		vb2_plane_vaddr(&params_buf->vb.vb2_buf, 0);
> +	struct rkisp1_ext_params_cfg *cfg = vb2_plane_vaddr(&vbuf->vb2_buf, 0);

Wrong you're, you're supposed to validate the copy :-)

> +	size_t block_offset = 0;
> +	size_t cfg_size;
> +
> +	if (cfg->data_size > RKISP1_EXT_PARAMS_MAX_SIZE) {
> +		dev_dbg(params->rkisp1->dev,
> +			"Invalid parameters buffer size %u\n",

s/Invalid/Too larger/ would be more precise.

> +			cfg->data_size);
> +		return -EINVAL;
> +	}
>  
> -	if (vb2_get_plane_payload(vb, 0) < sizeof(struct rkisp1_params_cfg))
> +	cfg_size = offsetof(struct rkisp1_ext_params_cfg, data) +
> +		   cfg->data_size;
> +	if (cfg_size != vb2_get_plane_payload(vb, 0)) {

	if (cfg_size > vb2_get_plane_payload(vb, 0)) {

> +		dev_dbg(params->rkisp1->dev,
> +			"Buffer payload (%lu) larger than data size (%lu)\n",
> +			vb2_get_plane_payload(vb, 0), cfg_size);

The other way around, 

			"Data size %lu larger than buffer payload size %lu\n",
			cfg_size, vb2_get_plane_payload(vb, 0));

>  		return -EINVAL;
> +	}
> +
> +	/* Walk the list of parameter blocks and validate them. */
> +	cfg_size = cfg->data_size;
> +	while (cfg_size >= sizeof(struct rkisp1_ext_params_block_header)) {
> +		const struct rkisp1_ext_params_block_header *block;
> +		const struct rkisp1_ext_params_handler *handler;
> +
> +		block = (const struct rkisp1_ext_params_block_header *)
> +			&cfg->data[block_offset];
> +
> +		if (block->type >= ARRAY_SIZE(rkisp1_ext_params_handlers)) {
> +			dev_dbg(params->rkisp1->dev,
> +				"Invalid parameters block type\n");
> +			return -EINVAL;
> +		}
> +
> +		if (block->size > cfg_size) {
> +			dev_dbg(params->rkisp1->dev,
> +				"Premature end of parameters data\n");
> +			return -EINVAL;
> +		}
> +
> +		handler = &rkisp1_ext_params_handlers[block->type];
> +		if (block->size != handler->size) {
> +			dev_dbg(params->rkisp1->dev,
> +				"Invalid parameters block size\n");
> +			return -EINVAL;
> +		}
> +
> +		block_offset += block->size;
> +		cfg_size -= block->size;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rkisp1_params_vb2_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct rkisp1_ext_params_cfg *cfg = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
> +	struct rkisp1_params_buffer *params_buf =
> +		container_of(vbuf, struct rkisp1_params_buffer, vb);

	struct rkisp1_params_buffer *params_buf = to_rkisp1_params_buffer(vbuf);

> +	size_t payload = vb2_get_plane_payload(vb, 0);
> +	struct vb2_queue *vq = vb->vb2_queue;
> +	struct rkisp1_params *params = vq->drv_priv;

You can replace the two above lines with

	struct rkisp1_params *params = vb->vb2_queue->drv_priv;

>  
>  	/*
>  	 * Copy the parameters buffer to the internal scratch buffer to avoid
>  	 * userspace modifying the buffer content while the driver processes it.
>  	 */
> -	memcpy(params_buf->cfg, cfg, vb2_get_plane_payload(vb, 0));
> +	memcpy(params_buf->cfg, cfg, payload);
>  
> -	return 0;
> +	/* Only validate the plane payload size for fixed parameters format. */
> +	if (params->metafmt->dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
> +		if (payload < sizeof(struct rkisp1_params_cfg))
> +			return -EINVAL;
> +
> +		return 0;
> +	}
> +
> +	return rkisp1_params_prepare_ext_params(params, vb);
>  }
>  
>  static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
> @@ -1898,6 +2449,8 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
>  
>  	list_for_each_entry(buf, &tmp_list, queue)
>  		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +
> +	params->enabled_blocks = 0;
>  }
>  
>  static const struct vb2_ops rkisp1_params_vb2_ops = {
> @@ -1909,7 +2462,6 @@ static const struct vb2_ops rkisp1_params_vb2_ops = {
>  	.buf_queue = rkisp1_params_vb2_buf_queue,
>  	.buf_prepare = rkisp1_params_vb2_buf_prepare,
>  	.stop_streaming = rkisp1_params_vb2_stop_streaming,
> -
>  };
>  
>  static const struct v4l2_file_operations rkisp1_params_fops = {

-- 
Regards,

Laurent Pinchart

