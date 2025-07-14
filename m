Return-Path: <linux-media+bounces-37639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B99B04150
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 16:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 026633A628D
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 14:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977252580CA;
	Mon, 14 Jul 2025 14:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L1nXbZKV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30282571B3;
	Mon, 14 Jul 2025 14:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752502705; cv=none; b=cPoUF0z1GRYiccqG7txIEDv3FEa/MjVD1PFwiaBbSNp42mfPlw2r+fx6k0hVjX6Suadk8SnVTZmG9gkK6+8daGZiLnJFNIPxEbi3D3gpXu1JQLywxRyrIgN8ec7zxnpjUZrUU+ZYJuzl50aiP7tFOs4frn2nOvTlFrf3PSF8c4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752502705; c=relaxed/simple;
	bh=yBrMy2ksiPpLqhGVPw/Tp0fQhjdwAiixtdOl1OdvDoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kMBUB1zS8morjmjGQjshhelcDwP1H+F/xrhxdhlalY21OE4bnGkgW5Lz2oxm36todMdb7X3W8eF5REeFCMxk3fVyrJFxPna052UrLoKRB5R95yp09wz6fIt4O9DnSsyIMi6zHo8I/3t4dzcSuN7OUJTI2aiK4h8j8yT7ovKNMXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L1nXbZKV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D897F166D;
	Mon, 14 Jul 2025 16:17:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752502669;
	bh=yBrMy2ksiPpLqhGVPw/Tp0fQhjdwAiixtdOl1OdvDoI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L1nXbZKVCuAtJSYeteeQthbSIri3QRrHjm7qytFTY+uJKfrPW/YTKGuO2SqPWbJbH
	 tdSw+uhEFwD8TSBIPWLeJlpc668RI46zvoI79pAxvpW+CMc5cxtLoQDny6/W6GJMIc
	 rosAUdvvyji4TMJAeRvZNQGDAhDZgI6Sl4Dci4tk=
Message-ID: <346254d7-af2d-4773-a896-2338f16a0e6d@ideasonboard.com>
Date: Mon, 14 Jul 2025 15:18:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] media: amlogic-c3: Use v4l2-params for validation
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250710-extensible-parameters-validation-v2-0-7ec8918ec443@ideasonboard.com>
 <20250710-extensible-parameters-validation-v2-7-7ec8918ec443@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20250710-extensible-parameters-validation-v2-7-7ec8918ec443@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacopo

On 10/07/2025 14:52, Jacopo Mondi wrote:
> Convert c3-ispa-params.c to use the new types fro block handlers
> defined in v4l2-params.h and use the new helpers from v4l2-params.c
> to remove boilerplate code from the driver.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>   .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 263 ++++++++-------------
>   1 file changed, 94 insertions(+), 169 deletions(-)
>
> diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> index c80667dd766210d2b2e1ee60c8254a5814b9d81b..259cb354ffddf4a1195422dfd9b3ba24c79607fc 100644
> --- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> @@ -9,64 +9,26 @@
>   
>   #include <media/v4l2-ioctl.h>
>   #include <media/v4l2-mc.h>
> +#include <media/v4l2-params.h>
>   #include <media/videobuf2-vmalloc.h>
>   
>   #include "c3-isp-common.h"
>   #include "c3-isp-regs.h"
>   
> -/*
> - * union c3_isp_params_block - Generalisation of a parameter block
> - *
> - * This union allows the driver to treat a block as a generic struct to this
> - * union and safely access the header and block-specific struct without having
> - * to resort to casting. The header member is accessed first, and the type field
> - * checked which allows the driver to determine which of the other members
> - * should be used.
> - *
> - * @header:		The shared header struct embedded as the first member
> - *			of all the possible other members. This member would be
> - *			accessed first and the type field checked to determine
> - *			which of the other members should be accessed.
> - * @awb_gains:		For header.type == C3_ISP_PARAMS_BLOCK_AWB_GAINS
> - * @awb_cfg:		For header.type == C3_ISP_PARAMS_BLOCK_AWB_CONFIG
> - * @ae_cfg:		For header.type == C3_ISP_PARAMS_BLOCK_AE_CONFIG
> - * @af_cfg:		For header.type == C3_ISP_PARAMS_BLOCK_AF_CONFIG
> - * @pst_gamma:		For header.type == C3_ISP_PARAMS_BLOCK_PST_GAMMA
> - * @ccm:		For header.type == C3_ISP_PARAMS_BLOCK_CCM
> - * @csc:		For header.type == C3_ISP_PARAMS_BLOCK_CSC
> - * @blc:		For header.type == C3_ISP_PARAMS_BLOCK_BLC
> - */
> -union c3_isp_params_block {
> -	struct c3_isp_params_block_header header;
> -	struct c3_isp_params_awb_gains awb_gains;
> -	struct c3_isp_params_awb_config awb_cfg;
> -	struct c3_isp_params_ae_config ae_cfg;
> -	struct c3_isp_params_af_config af_cfg;
> -	struct c3_isp_params_pst_gamma pst_gamma;
> -	struct c3_isp_params_ccm ccm;
> -	struct c3_isp_params_csc csc;
> -	struct c3_isp_params_blc blc;
> -};

Same comment as for the rkisp1, but also:


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> -
> -typedef void (*c3_isp_block_handler)(struct c3_isp_device *isp,
> -				     const union c3_isp_params_block *block);
> -
> -struct c3_isp_params_handler {
> -	size_t size;
> -	c3_isp_block_handler handler;
> -};
> -
>   #define to_c3_isp_params_buffer(vbuf) \
>   	container_of(vbuf, struct c3_isp_params_buffer, vb)
>   
>   /* Hardware configuration */
>   
> -static void c3_isp_params_cfg_awb_gains(struct c3_isp_device *isp,
> -					const union c3_isp_params_block *block)
> +static void
> +c3_isp_params_cfg_awb_gains(void *dev,
> +			    const struct v4l2_params_block_header *block)
>   {
> -	const struct c3_isp_params_awb_gains *awb_gains = &block->awb_gains;
> +	const struct c3_isp_params_awb_gains *awb_gains =
> +		(const struct c3_isp_params_awb_gains *)block;
> +	struct c3_isp_device *isp = dev;
>   
> -	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
> +	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
>   		c3_isp_update_bits(isp, ISP_TOP_BEO_CTRL,
>   				   ISP_TOP_BEO_CTRL_WB_EN_MASK,
>   				   ISP_TOP_BEO_CTRL_WB_DIS);
> @@ -89,7 +51,7 @@ static void c3_isp_params_cfg_awb_gains(struct c3_isp_device *isp,
>   			   ISP_LSWB_WB_GAIN2_IR_GAIN_MASK,
>   			   ISP_LSWB_WB_GAIN2_IR_GAIN(awb_gains->gb_gain));
>   
> -	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
> +	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
>   		c3_isp_update_bits(isp, ISP_TOP_BEO_CTRL,
>   				   ISP_TOP_BEO_CTRL_WB_EN_MASK,
>   				   ISP_TOP_BEO_CTRL_WB_EN);
> @@ -151,12 +113,15 @@ static void c3_isp_params_awb_cood(struct c3_isp_device *isp,
>   			     ISP_AWB_IDX_DATA_VIDX_DATA(cfg->vert_coord[i]));
>   }
>   
> -static void c3_isp_params_cfg_awb_config(struct c3_isp_device *isp,
> -					 const union c3_isp_params_block *block)
> +static void
> +c3_isp_params_cfg_awb_config(void *dev,
> +			     const struct v4l2_params_block_header *block)
>   {
> -	const struct c3_isp_params_awb_config *awb_cfg = &block->awb_cfg;
> +	const struct c3_isp_params_awb_config *awb_cfg =
> +		(const struct c3_isp_params_awb_config *)block;
> +	struct c3_isp_device *isp = dev;
>   
> -	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
> +	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
>   		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
>   				   ISP_TOP_3A_STAT_CRTL_AWB_STAT_EN_MASK,
>   				   ISP_TOP_3A_STAT_CRTL_AWB_STAT_DIS);
> @@ -205,7 +170,7 @@ static void c3_isp_params_cfg_awb_config(struct c3_isp_device *isp,
>   	c3_isp_params_awb_wt(isp, awb_cfg);
>   	c3_isp_params_awb_cood(isp, awb_cfg);
>   
> -	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
> +	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
>   		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
>   				   ISP_TOP_3A_STAT_CRTL_AWB_STAT_EN_MASK,
>   				   ISP_TOP_3A_STAT_CRTL_AWB_STAT_EN);
> @@ -268,12 +233,15 @@ static void c3_isp_params_ae_cood(struct c3_isp_device *isp,
>   			     ISP_AE_IDX_DATA_VIDX_DATA(cfg->vert_coord[i]));
>   }
>   
> -static void c3_isp_params_cfg_ae_config(struct c3_isp_device *isp,
> -					const union c3_isp_params_block *block)
> +static void
> +c3_isp_params_cfg_ae_config(void *dev,
> +			    const struct v4l2_params_block_header *block)
>   {
> -	const struct c3_isp_params_ae_config *ae_cfg = &block->ae_cfg;
> +	const struct c3_isp_params_ae_config *ae_cfg =
> +		(const struct c3_isp_params_ae_config *)block;
> +	struct c3_isp_device *isp = dev;
>   
> -	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
> +	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
>   		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
>   				   ISP_TOP_3A_STAT_CRTL_AE_STAT_EN_MASK,
>   				   ISP_TOP_3A_STAT_CRTL_AE_STAT_DIS);
> @@ -303,7 +271,7 @@ static void c3_isp_params_cfg_ae_config(struct c3_isp_device *isp,
>   	c3_isp_params_ae_wt(isp, ae_cfg);
>   	c3_isp_params_ae_cood(isp, ae_cfg);
>   
> -	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
> +	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
>   		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
>   				   ISP_TOP_3A_STAT_CRTL_AE_STAT_EN_MASK,
>   				   ISP_TOP_3A_STAT_CRTL_AE_STAT_EN);
> @@ -326,12 +294,15 @@ static void c3_isp_params_af_cood(struct c3_isp_device *isp,
>   			     ISP_AF_IDX_DATA_VIDX_DATA(cfg->vert_coord[i]));
>   }
>   
> -static void c3_isp_params_cfg_af_config(struct c3_isp_device *isp,
> -					const union c3_isp_params_block *block)
> +static void
> +c3_isp_params_cfg_af_config(void *dev,
> +			    const struct v4l2_params_block_header *block)
>   {
> -	const struct c3_isp_params_af_config *af_cfg = &block->af_cfg;
> +	const struct c3_isp_params_af_config *af_cfg =
> +		(const struct c3_isp_params_af_config *)block;
> +	struct c3_isp_device *isp = dev;
>   
> -	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
> +	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
>   		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
>   				   ISP_TOP_3A_STAT_CRTL_AF_STAT_EN_MASK,
>   				   ISP_TOP_3A_STAT_CRTL_AF_STAT_DIS);
> @@ -351,20 +322,23 @@ static void c3_isp_params_cfg_af_config(struct c3_isp_device *isp,
>   
>   	c3_isp_params_af_cood(isp, af_cfg);
>   
> -	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
> +	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
>   		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
>   				   ISP_TOP_3A_STAT_CRTL_AF_STAT_EN_MASK,
>   				   ISP_TOP_3A_STAT_CRTL_AF_STAT_EN);
>   }
>   
> -static void c3_isp_params_cfg_pst_gamma(struct c3_isp_device *isp,
> -					const union c3_isp_params_block *block)
> +static void
> +c3_isp_params_cfg_pst_gamma(void *dev,
> +			    const struct v4l2_params_block_header *block)
>   {
> -	const struct c3_isp_params_pst_gamma *gm = &block->pst_gamma;
> +	const struct c3_isp_params_pst_gamma *gm =
> +		(const struct c3_isp_params_pst_gamma *)block;
> +	struct c3_isp_device *isp = dev;
>   	unsigned int base;
>   	unsigned int i;
>   
> -	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
> +	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
>   		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
>   				   ISP_TOP_BED_CTRL_PST_GAMMA_EN_MASK,
>   				   ISP_TOP_BED_CTRL_PST_GAMMA_DIS);
> @@ -393,19 +367,21 @@ static void c3_isp_params_cfg_pst_gamma(struct c3_isp_device *isp,
>   		}
>   	}
>   
> -	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
> +	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
>   		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
>   				   ISP_TOP_BED_CTRL_PST_GAMMA_EN_MASK,
>   				   ISP_TOP_BED_CTRL_PST_GAMMA_EN);
>   }
>   
>   /* Configure 3 x 3 ccm matrix */
> -static void c3_isp_params_cfg_ccm(struct c3_isp_device *isp,
> -				  const union c3_isp_params_block *block)
> +static void c3_isp_params_cfg_ccm(void *dev,
> +				  const struct v4l2_params_block_header *block)
>   {
> -	const struct c3_isp_params_ccm *ccm = &block->ccm;
> +	const struct c3_isp_params_ccm *ccm =
> +		(const struct c3_isp_params_ccm *)block;
> +	struct c3_isp_device *isp = dev;
>   
> -	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
> +	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
>   		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
>   				   ISP_TOP_BED_CTRL_CCM_EN_MASK,
>   				   ISP_TOP_BED_CTRL_CCM_DIS);
> @@ -442,19 +418,21 @@ static void c3_isp_params_cfg_ccm(struct c3_isp_device *isp,
>   			   ISP_CCM_MTX_22_23_RS_MTX_22_MASK,
>   			   ISP_CCM_MTX_22_23_RS_MTX_22(ccm->matrix[2][2]));
>   
> -	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
> +	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
>   		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
>   				   ISP_TOP_BED_CTRL_CCM_EN_MASK,
>   				   ISP_TOP_BED_CTRL_CCM_EN);
>   }
>   
>   /* Configure color space conversion matrix parameters */
> -static void c3_isp_params_cfg_csc(struct c3_isp_device *isp,
> -				  const union c3_isp_params_block *block)
> +static void c3_isp_params_cfg_csc(void *dev,
> +				  const struct v4l2_params_block_header *block)
>   {
> -	const struct c3_isp_params_csc *csc = &block->csc;
> +	const struct c3_isp_params_csc *csc =
> +		(const struct c3_isp_params_csc *)block;
> +	struct c3_isp_device *isp = dev;
>   
> -	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
> +	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
>   		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
>   				   ISP_TOP_BED_CTRL_CM0_EN_MASK,
>   				   ISP_TOP_BED_CTRL_CM0_DIS);
> @@ -491,19 +469,21 @@ static void c3_isp_params_cfg_csc(struct c3_isp_device *isp,
>   			   ISP_CM0_COEF22_OUP_OFST0_MTX_22_MASK,
>   			   ISP_CM0_COEF22_OUP_OFST0_MTX_22(csc->matrix[2][2]));
>   
> -	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
> +	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
>   		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
>   				   ISP_TOP_BED_CTRL_CM0_EN_MASK,
>   				   ISP_TOP_BED_CTRL_CM0_EN);
>   }
>   
>   /* Set blc offset of each color channel */
> -static void c3_isp_params_cfg_blc(struct c3_isp_device *isp,
> -				  const union c3_isp_params_block *block)
> +static void c3_isp_params_cfg_blc(void *dev,
> +				  const struct v4l2_params_block_header *block)
>   {
> -	const struct c3_isp_params_blc *blc = &block->blc;
> +	const struct c3_isp_params_blc *blc =
> +		(const struct c3_isp_params_blc *)block;
> +	struct c3_isp_device *isp = dev;
>   
> -	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
> +	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
>   		c3_isp_update_bits(isp, ISP_TOP_BEO_CTRL,
>   				   ISP_TOP_BEO_CTRL_BLC_EN_MASK,
>   				   ISP_TOP_BEO_CTRL_BLC_DIS);
> @@ -517,13 +497,13 @@ static void c3_isp_params_cfg_blc(struct c3_isp_device *isp,
>   		     ISP_LSWB_BLC_OFST1_GB_OFST(blc->gb_ofst) |
>   		     ISP_LSWB_BLC_OFST1_B_OFST(blc->b_ofst));
>   
> -	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
> +	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
>   		c3_isp_update_bits(isp, ISP_TOP_BEO_CTRL,
>   				   ISP_TOP_BEO_CTRL_BLC_EN_MASK,
>   				   ISP_TOP_BEO_CTRL_BLC_EN);
>   }
>   
> -static const struct c3_isp_params_handler c3_isp_params_handlers[] = {
> +static const struct v4l2_params_handler c3_isp_params_handlers[] = {
>   	[C3_ISP_PARAMS_BLOCK_AWB_GAINS] = {
>   		.size = sizeof(struct c3_isp_params_awb_gains),
>   		.handler = c3_isp_params_cfg_awb_gains,
> @@ -568,16 +548,16 @@ static void c3_isp_params_cfg_blocks(struct c3_isp_params *params)
>   
>   	/* Walk the list of parameter blocks and process them */
>   	while (block_offset < config->data_size) {
> -		const struct c3_isp_params_handler *block_handler;
> -		const union c3_isp_params_block *block;
> +		const struct v4l2_params_handler *block_handler;
> +		const struct v4l2_params_block_header *block;
>   
> -		block = (const union c3_isp_params_block *)
> +		block = (const struct v4l2_params_block_header *)
>   			 &config->data[block_offset];
>   
> -		block_handler = &c3_isp_params_handlers[block->header.type];
> +		block_handler = &c3_isp_params_handlers[block->type];
>   		block_handler->handler(params->isp, block);
>   
> -		block_offset += block->header.size;
> +		block_offset += block->size;
>   	}
>   }
>   
> @@ -766,31 +746,35 @@ static void c3_isp_params_vb2_buf_queue(struct vb2_buffer *vb)
>   	list_add_tail(&buf->list, &params->pending);
>   }
>   
> +static int
> +c3_isp_params_validate_buffer(struct device *dev,
> +			      const struct v4l2_params_buffer *buffer)
> +{
> +	/* Only v0 is supported at the moment */
> +	if (buffer->version != C3_ISP_PARAMS_BUFFER_V0) {
> +		dev_dbg(dev, "Invalid params buffer version: %u\n",
> +			buffer->version);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>   static int c3_isp_params_vb2_buf_prepare(struct vb2_buffer *vb)
>   {
>   	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>   	struct c3_isp_params_buffer *buf = to_c3_isp_params_buffer(vbuf);
>   	struct c3_isp_params *params = vb2_get_drv_priv(vb->vb2_queue);
> -	struct c3_isp_params_cfg *cfg = buf->cfg;
>   	struct c3_isp_params_cfg *usr_cfg = vb2_plane_vaddr(vb, 0);
>   	size_t payload_size = vb2_get_plane_payload(vb, 0);
> -	size_t header_size = offsetof(struct c3_isp_params_cfg, data);
> -	size_t block_offset = 0;
> -	size_t cfg_size;
> -
> -	/* Payload size can't be greater than the destination buffer size */
> -	if (payload_size > params->vfmt.fmt.meta.buffersize) {
> -		dev_dbg(params->isp->dev,
> -			"Payload size is too large: %zu\n", payload_size);
> -		return -EINVAL;
> -	}
> +	struct c3_isp_params_cfg *cfg = buf->cfg;
> +	int ret;
>   
> -	/* Payload size can't be smaller than the header size */
> -	if (payload_size < header_size) {
> -		dev_dbg(params->isp->dev,
> -			"Payload size is too small: %zu\n", payload_size);
> -		return -EINVAL;
> -	}
> +	ret = v4l2_params_buffer_validate(params->isp->dev, vb,
> +					  params->vfmt.fmt.meta.buffersize,
> +					  c3_isp_params_validate_buffer);
> +	if (ret)
> +		return ret;
>   
>   	/*
>   	 * Use the internal scratch buffer to avoid userspace modifying
> @@ -798,70 +782,11 @@ static int c3_isp_params_vb2_buf_prepare(struct vb2_buffer *vb)
>   	 */
>   	memcpy(cfg, usr_cfg, payload_size);
>   
> -	/* Only v0 is supported at the moment */
> -	if (cfg->version != C3_ISP_PARAMS_BUFFER_V0) {
> -		dev_dbg(params->isp->dev,
> -			"Invalid params buffer version: %u\n", cfg->version);
> -		return -EINVAL;
> -	}
> -
> -	/* Validate the size reported in the parameter buffer header */
> -	cfg_size = header_size + cfg->data_size;
> -	if (cfg_size != payload_size) {
> -		dev_dbg(params->isp->dev,
> -			"Data size %zu and payload size %zu are different\n",
> -			cfg_size, payload_size);
> -		return -EINVAL;
> -	}
> -
> -	/* Walk the list of parameter blocks and validate them */
> -	cfg_size = cfg->data_size;
> -	while (cfg_size >= sizeof(struct c3_isp_params_block_header)) {
> -		const struct c3_isp_params_block_header *block;
> -		const struct c3_isp_params_handler *handler;
> -
> -		block = (struct c3_isp_params_block_header *)
> -			&cfg->data[block_offset];
> -
> -		if (block->type >= ARRAY_SIZE(c3_isp_params_handlers)) {
> -			dev_dbg(params->isp->dev,
> -				"Invalid params block type\n");
> -			return -EINVAL;
> -		}
> -
> -		if (block->size > cfg_size) {
> -			dev_dbg(params->isp->dev,
> -				"Block size is greater than cfg size\n");
> -			return -EINVAL;
> -		}
> -
> -		if ((block->flags & (C3_ISP_PARAMS_BLOCK_FL_ENABLE |
> -				     C3_ISP_PARAMS_BLOCK_FL_DISABLE)) ==
> -		    (C3_ISP_PARAMS_BLOCK_FL_ENABLE |
> -		     C3_ISP_PARAMS_BLOCK_FL_DISABLE)) {
> -			dev_dbg(params->isp->dev,
> -				"Invalid parameters block flags\n");
> -			return -EINVAL;
> -		}
> -
> -		handler = &c3_isp_params_handlers[block->type];
> -		if (block->size != handler->size) {
> -			dev_dbg(params->isp->dev,
> -				"Invalid params block size\n");
> -			return -EINVAL;
> -		}
> -
> -		block_offset += block->size;
> -		cfg_size -= block->size;
> -	}
> -
> -	if (cfg_size) {
> -		dev_dbg(params->isp->dev,
> -			"Unexpected data after the params buffer end\n");
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> +	return v4l2_params_blocks_validate(params->isp->dev,
> +					   (struct v4l2_params_buffer *)cfg,
> +					   c3_isp_params_handlers,
> +					   ARRAY_SIZE(c3_isp_params_handlers),
> +					   NULL);
>   }
>   
>   static int c3_isp_params_vb2_buf_init(struct vb2_buffer *vb)
>

