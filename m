Return-Path: <linux-media+bounces-37638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C047B0414D
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 16:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74B2316AE12
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 14:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081B3253F3D;
	Mon, 14 Jul 2025 14:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CsnNcafN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD9319ABC6;
	Mon, 14 Jul 2025 14:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752502686; cv=none; b=jSIJpmlHaS1IoIvjLKS94aFfm6Ct5M40V7jMY6aw1i5O8iTJ+SPMaQ1m8lPk9JHhBgpW0WEt4Pt7qorM6w5UmEDX6Od5TnKih8SKU62aWvQcIYVv2w4RWgpnaKds1SV23bkhGz5CvQ5cDeTvrZ2OhLz3KFZw/hoELLbphRYmkhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752502686; c=relaxed/simple;
	bh=u4Xsa31YyF3/xCL3GAMg1OW8VN80iO4/Jh8BrDcy2Ds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZJ70r1mRqcIBu3BXXCSiYCOrjP50yYRPi+08VsTMJbrqKSb+5O0lzfXmBhQxnyOeswyu9JCGXt+lS33NTqU7LEbkcNR6Xlwt3EpPVvqr9LBIb3WmQA7nrArvFhh/trAUq/qRV/dJQU4tJqxwMEfZgnFDTytXrq2d8ZCoWn4+49I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CsnNcafN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4658B166D;
	Mon, 14 Jul 2025 16:17:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752502650;
	bh=u4Xsa31YyF3/xCL3GAMg1OW8VN80iO4/Jh8BrDcy2Ds=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CsnNcafNvClh8KCYX5R/4vX7ay2FqU9HYU2ZIe+xaEFKXdiUil0MxR7B3QxEJ9CxY
	 Zcqc+QASohJlncqfrA+hKr+39M6//dQGwOlb22LEFf5FV92w4fD+O6CFZomSNrgGrH
	 3cfVDqMZlEQ2vdOkBJEsKO3UgUkmoGpQctsK3+rE=
Message-ID: <0e72b927-7fff-466a-afea-4531722f7fdd@ideasonboard.com>
Date: Mon, 14 Jul 2025 15:17:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] media: rkisp1: Use v4l2-params for validation
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250710-extensible-parameters-validation-v2-0-7ec8918ec443@ideasonboard.com>
 <20250710-extensible-parameters-validation-v2-6-7ec8918ec443@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20250710-extensible-parameters-validation-v2-6-7ec8918ec443@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacopo

On 10/07/2025 14:52, Jacopo Mondi wrote:
> Convert rkisp1-params.c to use the new types for block handlers
> defined in v4l2-params.h and use the new helpers from v4l2-params.c
> to remove bolierplate code from the driver.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>   .../media/platform/rockchip/rkisp1/rkisp1-params.c | 349 +++++++++------------
>   1 file changed, 141 insertions(+), 208 deletions(-)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index f1585f8fa0f478304f74317fd9dd09199c94ec82..d7bfb1b50ed7e8dec5a20aec6cd775b721091abf 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -12,6 +12,7 @@
>   #include <media/v4l2-common.h>
>   #include <media/v4l2-event.h>
>   #include <media/v4l2-ioctl.h>
> +#include <media/v4l2-params.h>
>   #include <media/videobuf2-core.h>
>   #include <media/videobuf2-vmalloc.h>	/* for ISP params */
>   
> @@ -40,30 +41,6 @@
>   #define RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS	BIT(0)
>   #define RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC	BIT(1)
>   
> -union rkisp1_ext_params_config {
> -	struct rkisp1_ext_params_block_header header;
> -	struct rkisp1_ext_params_bls_config bls;
> -	struct rkisp1_ext_params_dpcc_config dpcc;
> -	struct rkisp1_ext_params_sdg_config sdg;
> -	struct rkisp1_ext_params_lsc_config lsc;
> -	struct rkisp1_ext_params_awb_gain_config awbg;
> -	struct rkisp1_ext_params_flt_config flt;
> -	struct rkisp1_ext_params_bdm_config bdm;
> -	struct rkisp1_ext_params_ctk_config ctk;
> -	struct rkisp1_ext_params_goc_config goc;
> -	struct rkisp1_ext_params_dpf_config dpf;
> -	struct rkisp1_ext_params_dpf_strength_config dpfs;
> -	struct rkisp1_ext_params_cproc_config cproc;
> -	struct rkisp1_ext_params_ie_config ie;
> -	struct rkisp1_ext_params_awb_meas_config awbm;
> -	struct rkisp1_ext_params_hst_config hst;
> -	struct rkisp1_ext_params_aec_config aec;
> -	struct rkisp1_ext_params_afc_config afc;
> -	struct rkisp1_ext_params_compand_bls_config compand_bls;
> -	struct rkisp1_ext_params_compand_curve_config compand_curve;
> -	struct rkisp1_ext_params_wdr_config wdr;
> -};


I still think it would look nicer if we kept this; I just noticed that this uses struct members 
rather than pointers though, perhaps that makes it harder. I don't feel too strongly about it 
though, so either way:


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> -
>   enum rkisp1_params_formats {
>   	RKISP1_PARAMS_FIXED,
>   	RKISP1_PARAMS_EXTENSIBLE,
> @@ -1689,11 +1666,12 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
>    * Extensible parameters format handling
>    */
>   
> -static void
> -rkisp1_ext_params_bls(struct rkisp1_params *params,
> -		      const union rkisp1_ext_params_config *block)
> +static void rkisp1_ext_params_bls(void *dev,
> +				  const struct v4l2_params_block_header *block)
>   {
> -	const struct rkisp1_ext_params_bls_config *bls = &block->bls;
> +	const struct rkisp1_ext_params_bls_config *bls =
> +		(const struct rkisp1_ext_params_bls_config *)block;
> +	struct rkisp1_params *params = dev;
>   
>   	if (bls->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
>   		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_BLS_CTRL,
> @@ -1709,11 +1687,12 @@ rkisp1_ext_params_bls(struct rkisp1_params *params,
>   				      RKISP1_CIF_ISP_BLS_ENA);
>   }
>   
> -static void
> -rkisp1_ext_params_dpcc(struct rkisp1_params *params,
> -		       const union rkisp1_ext_params_config *block)
> +static void rkisp1_ext_params_dpcc(void *dev,
> +				   const struct v4l2_params_block_header *block)
>   {
> -	const struct rkisp1_ext_params_dpcc_config *dpcc = &block->dpcc;
> +	const struct rkisp1_ext_params_dpcc_config *dpcc =
> +		(const struct rkisp1_ext_params_dpcc_config *)block;
> +	struct rkisp1_params *params = dev;
>   
>   	if (dpcc->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
>   		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPCC_MODE,
> @@ -1729,11 +1708,12 @@ rkisp1_ext_params_dpcc(struct rkisp1_params *params,
>   				      RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE);
>   }
>   
> -static void
> -rkisp1_ext_params_sdg(struct rkisp1_params *params,
> -		      const union rkisp1_ext_params_config *block)
> +static void rkisp1_ext_params_sdg(void *dev,
> +				  const struct v4l2_params_block_header *block)
>   {
> -	const struct rkisp1_ext_params_sdg_config *sdg = &block->sdg;
> +	const struct rkisp1_ext_params_sdg_config *sdg =
> +		(const struct rkisp1_ext_params_sdg_config *)block;
> +	struct rkisp1_params *params = dev;
>   
>   	if (sdg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
>   		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
> @@ -1749,11 +1729,12 @@ rkisp1_ext_params_sdg(struct rkisp1_params *params,
>   				      RKISP1_CIF_ISP_CTRL_ISP_GAMMA_IN_ENA);
>   }
>   
> -static void
> -rkisp1_ext_params_lsc(struct rkisp1_params *params,
> -		      const union rkisp1_ext_params_config *block)
> +static void rkisp1_ext_params_lsc(void *dev,
> +				  const struct v4l2_params_block_header *block)
>   {
> -	const struct rkisp1_ext_params_lsc_config *lsc = &block->lsc;
> +	const struct rkisp1_ext_params_lsc_config *lsc =
> +		(const struct rkisp1_ext_params_lsc_config *)block;
> +	struct rkisp1_params *params = dev;
>   
>   	if (lsc->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
>   		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_LSC_CTRL,
> @@ -1769,11 +1750,12 @@ rkisp1_ext_params_lsc(struct rkisp1_params *params,
>   				      RKISP1_CIF_ISP_LSC_CTRL_ENA);
>   }
>   
> -static void
> -rkisp1_ext_params_awbg(struct rkisp1_params *params,
> -		       const union rkisp1_ext_params_config *block)
> +static void rkisp1_ext_params_awbg(void *dev,
> +				   const struct v4l2_params_block_header *block)
>   {
> -	const struct rkisp1_ext_params_awb_gain_config *awbg = &block->awbg;
> +	const struct rkisp1_ext_params_awb_gain_config *awbg =
> +		(const struct rkisp1_ext_params_awb_gain_config *)block;
> +	struct rkisp1_params *params = dev;
>   
>   	if (awbg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
>   		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
> @@ -1789,11 +1771,12 @@ rkisp1_ext_params_awbg(struct rkisp1_params *params,
>   				      RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
>   }
>   
> -static void
> -rkisp1_ext_params_flt(struct rkisp1_params *params,
> -		      const union rkisp1_ext_params_config *block)
> +static void rkisp1_ext_params_flt(void *dev,
> +				  const struct v4l2_params_block_header *block)
>   {
> -	const struct rkisp1_ext_params_flt_config *flt = &block->flt;
> +	const struct rkisp1_ext_params_flt_config *flt =
> +		(const struct rkisp1_ext_params_flt_config *)block;
> +	struct rkisp1_params *params = dev;
>   
>   	if (flt->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
>   		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_FILT_MODE,
> @@ -1809,11 +1792,12 @@ rkisp1_ext_params_flt(struct rkisp1_params *params,
>   				      RKISP1_CIF_ISP_FLT_ENA);
>   }
>   
> -static void
> -rkisp1_ext_params_bdm(struct rkisp1_params *params,
> -		      const union rkisp1_ext_params_config *block)
> +static void rkisp1_ext_params_bdm(void *dev,
> +				  const struct v4l2_params_block_header *block)
>   {
> -	const struct rkisp1_ext_params_bdm_config *bdm = &block->bdm;
> +	const struct rkisp1_ext_params_bdm_config *bdm =
> +		(const struct rkisp1_ext_params_bdm_config *)block;
> +	struct rkisp1_params *params = dev;
>   
>   	if (bdm->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
>   		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
> @@ -1829,11 +1813,12 @@ rkisp1_ext_params_bdm(struct rkisp1_params *params,
>   				      RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
>   }
>   
> -static void
> -rkisp1_ext_params_ctk(struct rkisp1_params *params,
> -		      const union rkisp1_ext_params_config *block)
> +static void rkisp1_ext_params_ctk(void *dev,
> +				  const struct v4l2_params_block_header *block)
>   {
> -	const struct rkisp1_ext_params_ctk_config *ctk = &block->ctk;
> +	const struct rkisp1_ext_params_ctk_config *ctk =
> +		(const struct rkisp1_ext_params_ctk_config *)block;
> +	struct rkisp1_params *params = dev;
>   
>   	if (ctk->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
>   		rkisp1_ctk_enable(params, false);
> @@ -1847,11 +1832,12 @@ rkisp1_ext_params_ctk(struct rkisp1_params *params,
>   		rkisp1_ctk_enable(params, true);
>   }
>   
> -static void
> -rkisp1_ext_params_goc(struct rkisp1_params *params,
> -		      const union rkisp1_ext_params_config *block)
> +static void rkisp1_ext_params_goc(void *dev,
> +				  const struct v4l2_params_block_header *block)
>   {
> -	const struct rkisp1_ext_params_goc_config *goc = &block->goc;
> +	const struct rkisp1_ext_params_goc_config *goc =
> +		(const struct rkisp1_ext_params_goc_config *)block;
> +	struct rkisp1_params *params = dev;
>   
>   	if (goc->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
>   		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
> @@ -1869,11 +1855,12 @@ rkisp1_ext_params_goc(struct rkisp1_params *params,
>   			      RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
>   }
>   
> -static void
> -rkisp1_ext_params_dpf(struct rkisp1_params *params,
> -		      const union rkisp1_ext_params_config *block)
> +static void rkisp1_ext_params_dpf(void *dev,
> +				  const struct v4l2_params_block_header *block)
>   {
> -	const struct rkisp1_ext_params_dpf_config *dpf = &block->dpf;
> +	const struct rkisp1_ext_params_dpf_config *dpf =
> +		(const struct rkisp1_ext_params_dpf_config *)block;
> +	struct rkisp1_params *params = dev;
>   
>   	if (dpf->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
>   		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPF_MODE,
> @@ -1889,20 +1876,22 @@ rkisp1_ext_params_dpf(struct rkisp1_params *params,
>   				      RKISP1_CIF_ISP_DPF_MODE_EN);
>   }
>   
> -static void
> -rkisp1_ext_params_dpfs(struct rkisp1_params *params,
> -		       const union rkisp1_ext_params_config *block)
> +static void rkisp1_ext_params_dpfs(void *dev,
> +				   const struct v4l2_params_block_header *block)
>   {
> -	const struct rkisp1_ext_params_dpf_strength_config *dpfs = &block->dpfs;
> +	const struct rkisp1_ext_params_dpf_strength_config *dpfs =
> +		(const struct rkisp1_ext_params_dpf_strength_config *)block;
> +	struct rkisp1_params *params = dev;
>   
>   	rkisp1_dpf_strength_config(params, &dpfs->config);
>   }
>   
> -static void
> -rkisp1_ext_params_cproc(struct rkisp1_params *params,
> -			const union rkisp1_ext_params_config *block)
> +static void rkisp1_ext_params_cproc(void *dev,
> +				    const struct v4l2_params_block_header *block)
>   {
> -	const struct rkisp1_ext_params_cproc_config *cproc = &block->cproc;
> +	const struct rkisp1_ext_params_cproc_config *cproc =
> +		(const struct rkisp1_ext_params_cproc_config *)block;
> +	struct rkisp1_params *params = dev;
>   
>   	if (cproc->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
>   		rkisp1_param_clear_bits(params, RKISP1_CIF_C_PROC_CTRL,
> @@ -1918,11 +1907,12 @@ rkisp1_ext_params_cproc(struct rkisp1_params *params,
>   				      RKISP1_CIF_C_PROC_CTR_ENABLE);
>   }
>   
> -static void
> -rkisp1_ext_params_ie(struct rkisp1_params *params,
> -		     const union rkisp1_ext_params_config *block)
> +static void rkisp1_ext_params_ie(void *dev,
> +				 const struct v4l2_params_block_header *block)
>   {
> -	const struct rkisp1_ext_params_ie_config *ie = &block->ie;
> +	const struct rkisp1_ext_params_ie_config *ie =
> +		(const struct rkisp1_ext_params_ie_config *)block;
> +	struct rkisp1_params *params = dev;
>   
>   	if (ie->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
>   		rkisp1_ie_enable(params, false);
> @@ -1936,11 +1926,12 @@ rkisp1_ext_params_ie(struct rkisp1_params *params,
>   		rkisp1_ie_enable(params, true);
>   }
>   
> -static void
> -rkisp1_ext_params_awbm(struct rkisp1_params *params,
> -		       const union rkisp1_ext_params_config *block)
> +static void rkisp1_ext_params_awbm(void *dev,
> +				   const struct v4l2_params_block_header *block)
>   {
> -	const struct rkisp1_ext_params_awb_meas_config *awbm = &block->awbm;
> +	const struct rkisp1_ext_params_awb_meas_config *awbm =
> +		(const struct rkisp1_ext_params_awb_meas_config *)block;
> +	struct rkisp1_params *params = dev;
>   
>   	if (awbm->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
>   		params->ops->awb_meas_enable(params, &awbm->config,
> @@ -1956,11 +1947,12 @@ rkisp1_ext_params_awbm(struct rkisp1_params *params,
>   					     true);
>   }
>   
> -static void
> -rkisp1_ext_params_hstm(struct rkisp1_params *params,
> -		       const union rkisp1_ext_params_config *block)
> +static void rkisp1_ext_params_hstm(void *dev,
> +				   const struct v4l2_params_block_header *block)
>   {
> -	const struct rkisp1_ext_params_hst_config *hst = &block->hst;
> +	const struct rkisp1_ext_params_hst_config *hst =
> +		(const struct rkisp1_ext_params_hst_config *)block;
> +	struct rkisp1_params *params = dev;
>   
>   	if (hst->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
>   		params->ops->hst_enable(params, &hst->config, false);
> @@ -1974,11 +1966,12 @@ rkisp1_ext_params_hstm(struct rkisp1_params *params,
>   		params->ops->hst_enable(params, &hst->config, true);
>   }
>   
> -static void
> -rkisp1_ext_params_aecm(struct rkisp1_params *params,
> -		       const union rkisp1_ext_params_config *block)
> +static void rkisp1_ext_params_aecm(void *dev,
> +				   const struct v4l2_params_block_header *block)
>   {
> -	const struct rkisp1_ext_params_aec_config *aec = &block->aec;
> +	const struct rkisp1_ext_params_aec_config *aec =
> +		(const struct rkisp1_ext_params_aec_config *)block;
> +	struct rkisp1_params *params = dev;
>   
>   	if (aec->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
>   		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_EXP_CTRL,
> @@ -1994,11 +1987,12 @@ rkisp1_ext_params_aecm(struct rkisp1_params *params,
>   				      RKISP1_CIF_ISP_EXP_ENA);
>   }
>   
> -static void
> -rkisp1_ext_params_afcm(struct rkisp1_params *params,
> -		       const union rkisp1_ext_params_config *block)
> +static void rkisp1_ext_params_afcm(void *dev,
> +				   const struct v4l2_params_block_header *block)
>   {
> -	const struct rkisp1_ext_params_afc_config *afc = &block->afc;
> +	const struct rkisp1_ext_params_afc_config *afc =
> +		(const struct rkisp1_ext_params_afc_config *)block;
> +	struct rkisp1_params *params = dev;
>   
>   	if (afc->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
>   		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_AFM_CTRL,
> @@ -2014,11 +2008,12 @@ rkisp1_ext_params_afcm(struct rkisp1_params *params,
>   				      RKISP1_CIF_ISP_AFM_ENA);
>   }
>   
> -static void rkisp1_ext_params_compand_bls(struct rkisp1_params *params,
> -					  const union rkisp1_ext_params_config *block)
> +static void rkisp1_ext_params_compand_bls(void *dev,
> +					  const struct v4l2_params_block_header *block)
>   {
>   	const struct rkisp1_ext_params_compand_bls_config *bls =
> -		&block->compand_bls;
> +		(const struct rkisp1_ext_params_compand_bls_config *)block;
> +	struct rkisp1_params *params = dev;
>   
>   	if (bls->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
>   		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
> @@ -2034,11 +2029,13 @@ static void rkisp1_ext_params_compand_bls(struct rkisp1_params *params,
>   				      RKISP1_CIF_ISP_COMPAND_CTRL_BLS_ENABLE);
>   }
>   
> -static void rkisp1_ext_params_compand_expand(struct rkisp1_params *params,
> -					     const union rkisp1_ext_params_config *block)
> +static void
> +rkisp1_ext_params_compand_expand(void *dev,
> +				 const struct v4l2_params_block_header *block)
>   {
>   	const struct rkisp1_ext_params_compand_curve_config *curve =
> -		&block->compand_curve;
> +		(const struct rkisp1_ext_params_compand_curve_config *)block;
> +	struct rkisp1_params *params = dev;
>   
>   	if (curve->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
>   		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
> @@ -2054,11 +2051,13 @@ static void rkisp1_ext_params_compand_expand(struct rkisp1_params *params,
>   				      RKISP1_CIF_ISP_COMPAND_CTRL_EXPAND_ENABLE);
>   }
>   
> -static void rkisp1_ext_params_compand_compress(struct rkisp1_params *params,
> -					       const union rkisp1_ext_params_config *block)
> +static void
> +rkisp1_ext_params_compand_compress(void *dev,
> +				   const struct v4l2_params_block_header *block)
>   {
>   	const struct rkisp1_ext_params_compand_curve_config *curve =
> -		&block->compand_curve;
> +		(const struct rkisp1_ext_params_compand_curve_config *)block;
> +	struct rkisp1_params *params = dev;
>   
>   	if (curve->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
>   		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
> @@ -2074,10 +2073,12 @@ static void rkisp1_ext_params_compand_compress(struct rkisp1_params *params,
>   				      RKISP1_CIF_ISP_COMPAND_CTRL_COMPRESS_ENABLE);
>   }
>   
> -static void rkisp1_ext_params_wdr(struct rkisp1_params *params,
> -				  const union rkisp1_ext_params_config *block)
> +static void rkisp1_ext_params_wdr(void *dev,
> +				  const struct v4l2_params_block_header *block)
>   {
> -	const struct rkisp1_ext_params_wdr_config *wdr = &block->wdr;
> +	const struct rkisp1_ext_params_wdr_config *wdr =
> +		(const struct rkisp1_ext_params_wdr_config *)block;
> +	struct rkisp1_params *params = dev;
>   
>   	if (wdr->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
>   		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_WDR_CTRL,
> @@ -2093,15 +2094,7 @@ static void rkisp1_ext_params_wdr(struct rkisp1_params *params,
>   				      RKISP1_CIF_ISP_WDR_CTRL_ENABLE);
>   }
>   
> -typedef void (*rkisp1_block_handler)(struct rkisp1_params *params,
> -			     const union rkisp1_ext_params_config *config);
> -
> -static const struct rkisp1_ext_params_handler {
> -	size_t size;
> -	rkisp1_block_handler handler;
> -	unsigned int group;
> -	unsigned int features;
> -} rkisp1_ext_params_handlers[] = {
> +static const struct v4l2_params_handler rkisp1_ext_params_handlers[] = {
>   	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS] = {
>   		.size		= sizeof(struct rkisp1_ext_params_bls_config),
>   		.handler	= rkisp1_ext_params_bls,
> @@ -2224,18 +2217,18 @@ static void rkisp1_ext_params_config(struct rkisp1_params *params,
>   
>   	/* Walk the list of parameter blocks and process them. */
>   	while (block_offset < cfg->data_size) {
> -		const struct rkisp1_ext_params_handler *block_handler;
> -		const union rkisp1_ext_params_config *block;
> +		const struct v4l2_params_handler *block_handler;
> +		const struct v4l2_params_block_header *block;
>   
> -		block = (const union rkisp1_ext_params_config *)
> +		block = (const struct v4l2_params_block_header *)
>   			&cfg->data[block_offset];
> -		block_offset += block->header.size;
> +		block_offset += block->size;
>   
>   		/*
>   		 * Make sure the block is supported by the platform and in the
>   		 * list of groups to configure.
>   		 */
> -		block_handler = &rkisp1_ext_params_handlers[block->header.type];
> +		block_handler = &rkisp1_ext_params_handlers[block->type];
>   		if (!(block_handler->group & block_group_mask))
>   			continue;
>   
> @@ -2245,10 +2238,10 @@ static void rkisp1_ext_params_config(struct rkisp1_params *params,
>   
>   		block_handler->handler(params, block);
>   
> -		if (block->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE)
> -			params->enabled_blocks &= ~BIT(block->header.type);
> -		else if (block->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE)
> -			params->enabled_blocks |= BIT(block->header.type);
> +		if (block->flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE)
> +			params->enabled_blocks &= ~BIT(block->type);
> +		else if (block->flags & RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE)
> +			params->enabled_blocks |= BIT(block->type);
>   	}
>   }
>   
> @@ -2641,36 +2634,36 @@ static void rkisp1_params_vb2_buf_queue(struct vb2_buffer *vb)
>   	spin_unlock_irq(&params->config_lock);
>   }
>   
> +static int
> +rkisp1_ext_params_validate_buffer(struct device *dev,
> +				  const struct v4l2_params_buffer *buffer)
> +{
> +	/* Only v1 is supported at the moment. */
> +	if (buffer->version != RKISP1_EXT_PARAM_BUFFER_V1) {
> +		dev_dbg(dev, "Unsupported extensible format version: %u\n",
> +			buffer->version);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>   static int rkisp1_params_prepare_ext_params(struct rkisp1_params *params,
>   					    struct vb2_buffer *vb)
>   {
>   	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>   	struct rkisp1_params_buffer *params_buf = to_rkisp1_params_buffer(vbuf);
> -	size_t header_size = offsetof(struct rkisp1_ext_params_cfg, data);
>   	struct rkisp1_ext_params_cfg *cfg = params_buf->cfg;
>   	size_t payload_size = vb2_get_plane_payload(vb, 0);
>   	struct rkisp1_ext_params_cfg *usr_cfg =
>   		vb2_plane_vaddr(&vbuf->vb2_buf, 0);
> -	size_t block_offset = 0;
> -	size_t cfg_size;
> -
> -	/*
> -	 * Validate the buffer payload size before copying the parameters. The
> -	 * payload has to be smaller than the destination buffer size and larger
> -	 * than the header size.
> -	 */
> -	if (payload_size > params->metafmt->buffersize) {
> -		dev_dbg(params->rkisp1->dev,
> -			"Too large buffer payload size %zu\n", payload_size);
> -		return -EINVAL;
> -	}
> +	int ret;
>   
> -	if (payload_size < header_size) {
> -		dev_dbg(params->rkisp1->dev,
> -			"Buffer payload %zu smaller than header size %zu\n",
> -			payload_size, header_size);
> -		return -EINVAL;
> -	}
> +	ret = v4l2_params_buffer_validate(params->rkisp1->dev, vb,
> +					  params->metafmt->buffersize,
> +					  rkisp1_ext_params_validate_buffer);
> +	if (ret)
> +		return ret;
>   
>   	/*
>   	 * Copy the parameters buffer to the internal scratch buffer to avoid
> @@ -2678,71 +2671,11 @@ static int rkisp1_params_prepare_ext_params(struct rkisp1_params *params,
>   	 */
>   	memcpy(cfg, usr_cfg, payload_size);
>   
> -	/* Only v1 is supported at the moment. */
> -	if (cfg->version != RKISP1_EXT_PARAM_BUFFER_V1) {
> -		dev_dbg(params->rkisp1->dev,
> -			"Unsupported extensible format version: %u\n",
> -			cfg->version);
> -		return -EINVAL;
> -	}
> -
> -	/* Validate the size reported in the parameters buffer header. */
> -	cfg_size = header_size + cfg->data_size;
> -	if (cfg_size != payload_size) {
> -		dev_dbg(params->rkisp1->dev,
> -			"Data size %zu different than buffer payload size %zu\n",
> -			cfg_size, payload_size);
> -		return -EINVAL;
> -	}
> -
> -	/* Walk the list of parameter blocks and validate them. */
> -	cfg_size = cfg->data_size;
> -	while (cfg_size >= sizeof(struct rkisp1_ext_params_block_header)) {
> -		const struct rkisp1_ext_params_block_header *block;
> -		const struct rkisp1_ext_params_handler *handler;
> -
> -		block = (const struct rkisp1_ext_params_block_header *)
> -			&cfg->data[block_offset];
> -
> -		if (block->type >= ARRAY_SIZE(rkisp1_ext_params_handlers)) {
> -			dev_dbg(params->rkisp1->dev,
> -				"Invalid parameters block type\n");
> -			return -EINVAL;
> -		}
> -
> -		if (block->size > cfg_size) {
> -			dev_dbg(params->rkisp1->dev,
> -				"Premature end of parameters data\n");
> -			return -EINVAL;
> -		}
> -
> -		if ((block->flags & (RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE |
> -				     RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE)) ==
> -		   (RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE |
> -		    RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE)) {
> -			dev_dbg(params->rkisp1->dev,
> -				"Invalid parameters block flags\n");
> -			return -EINVAL;
> -		}
> -
> -		handler = &rkisp1_ext_params_handlers[block->type];
> -		if (block->size != handler->size) {
> -			dev_dbg(params->rkisp1->dev,
> -				"Invalid parameters block size\n");
> -			return -EINVAL;
> -		}
> -
> -		block_offset += block->size;
> -		cfg_size -= block->size;
> -	}
> -
> -	if (cfg_size) {
> -		dev_dbg(params->rkisp1->dev,
> -			"Unexpected data after the parameters buffer end\n");
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> +	return v4l2_params_blocks_validate(params->rkisp1->dev,
> +					   (struct v4l2_params_buffer *)cfg,
> +					   rkisp1_ext_params_handlers,
> +					   ARRAY_SIZE(rkisp1_ext_params_handlers),
> +					   NULL);
>   }
>   
>   static int rkisp1_params_vb2_buf_prepare(struct vb2_buffer *vb)
> @@ -2842,7 +2775,7 @@ static int rkisp1_params_ctrl_init(struct rkisp1_params *params)
>   	v4l2_ctrl_handler_init(&params->ctrls, 1);
>   
>   	for (unsigned int i = 0; i < ARRAY_SIZE(rkisp1_ext_params_handlers); i++) {
> -		const struct rkisp1_ext_params_handler *block_handler;
> +		const struct v4l2_params_handler *block_handler;
>   
>   		block_handler = &rkisp1_ext_params_handlers[i];
>   		ctrl_config.max |= BIT(i);
>

