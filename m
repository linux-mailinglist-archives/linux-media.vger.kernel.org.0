Return-Path: <linux-media+bounces-14623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFDD9271D2
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 10:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7366E284C9D
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 08:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D081B1A3BC9;
	Thu,  4 Jul 2024 08:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BOx+TB9a"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B6B4431
	for <linux-media@vger.kernel.org>; Thu,  4 Jul 2024 08:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720082067; cv=none; b=DfSjejwStui2Zs0bvtyU+sen572zCXdBt1b9Ys18i2yxUeSUm3jh+JhZ1ea2hmCvF6D+JC9PNWzxnneDOZJakDgqszBPU9PpPwfVv6MfK8PIu702y5Z8gHUMac+VCFR6B8oXZYeEk4PNr3IUDcc1FtpCovpCvDiDR1jvPH6q8iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720082067; c=relaxed/simple;
	bh=HPyiHF8R5n2eyMGrYLC9k4o1jPc5d+O8wocSzDMWeV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vmg2nXSTp6VUeQiOTfop8diz6prANCnKVDA+WEM8N2ofTch4RXhhwX52dhrhSbE5PUhlvLjZHPBF4OqHRNB11IIAAzbOeqwHZn2X3siHK5davKKHtcKhuhdeWQUrS0OjQq3uO/mtOznJLkbYkU/B1IQbREClAsKh/+gJ0P+am28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BOx+TB9a; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4203D502;
	Thu,  4 Jul 2024 10:33:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720082035;
	bh=HPyiHF8R5n2eyMGrYLC9k4o1jPc5d+O8wocSzDMWeV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BOx+TB9appE9g/yLl05ON8khRMLldH6ywgh7LNyQZVRCUFEu5x+/SOnibmxIhWEqc
	 t29VN5V8LUY1McqNFa4w8U9adpEQQ6nvj3WjxYpUYocpx/ztqdwcLQctBs0uuE6z7U
	 xERvPHZI+rHiEoDH6ijK9F4ZP6HPfOiYz6irqFYI=
Date: Thu, 4 Jul 2024 10:34:20 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Paul Elder <paul.elder@ideasonboard.com>, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v1 4/5] media: rkisp1: Add feature flags for BLS and
 compand
Message-ID: <aayd65reqbctgm37jirnbxrjpo3isi2jntsc3auiday2ww3b77@svw6xhnw627d>
References: <20240703222533.1662-1-laurent.pinchart@ideasonboard.com>
 <20240703222533.1662-5-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240703222533.1662-5-laurent.pinchart@ideasonboard.com>

Hi Laurent

On Thu, Jul 04, 2024 at 01:25:32AM GMT, Laurent Pinchart wrote:
> From: Paul Elder <paul.elder@ideasonboard.com>
>
> Add feature flags for the dedicated black level subtraction hardware
> block and for the compand hardware block. The companding feature flag is
> added on its own (as opposed to "the absence of BLS") because we will
> need it later for when we add support for the companding block.
>
> Skip BLS configuration when the BLS feature flag is unset, as devices
> without the dedicated BLS block cannot configure a hardware block that
> doesn't exist.
>
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-common.h | 4 ++++
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c    | 9 ++++++---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 7 +++++++
>  3 files changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index cdf2d30e2bb1..607e1a024d02 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -116,6 +116,8 @@ enum rkisp1_isp_pad {
>   * @RKISP1_FEATURE_SELF_PATH: The ISP has a self path
>   * @RKISP1_FEATURE_DUAL_CROP: The ISP has the dual crop block at the resizer input
>   * @RKISP1_FEATURE_DMA_34BIT: The ISP uses 34-bit DMA addresses
> + * @RKISP1_FEATURE_BLS: The ISP has a dedicated BLS block
> + * @RKISP1_FEATURE_COMPAND: The ISP has a companding block
>   *
>   * The ISP features are stored in a bitmask in &rkisp1_info.features and allow
>   * the driver to implement support for features present in some ISP versions
> @@ -127,6 +129,8 @@ enum rkisp1_feature {
>  	RKISP1_FEATURE_SELF_PATH = BIT(2),
>  	RKISP1_FEATURE_DUAL_CROP = BIT(3),
>  	RKISP1_FEATURE_DMA_34BIT = BIT(4),
> +	RKISP1_FEATURE_BLS = BIT(5),
> +	RKISP1_FEATURE_COMPAND = BIT(6),
>  };
>
>  #define rkisp1_has_feature(rkisp1, feature) \
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index 0535ce57e862..dd114ab77800 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -509,7 +509,8 @@ static const struct rkisp1_info px30_isp_info = {
>  	.isp_ver = RKISP1_V12,
>  	.features = RKISP1_FEATURE_MIPI_CSI2
>  		  | RKISP1_FEATURE_SELF_PATH
> -		  | RKISP1_FEATURE_DUAL_CROP,
> +		  | RKISP1_FEATURE_DUAL_CROP
> +		  | RKISP1_FEATURE_BLS,

Doesn't apply for me on top of [media-stage/master + my ext params
series]

In particular, in media-stage I don't see
>  	.max_width = 3264,
>  	.max_height = 2448,

these

>  };
> @@ -532,7 +533,8 @@ static const struct rkisp1_info rk3399_isp_info = {
>  	.isp_ver = RKISP1_V10,
>  	.features = RKISP1_FEATURE_MIPI_CSI2
>  		  | RKISP1_FEATURE_SELF_PATH
> -		  | RKISP1_FEATURE_DUAL_CROP,
> +		  | RKISP1_FEATURE_DUAL_CROP
> +		  | RKISP1_FEATURE_BLS,
>  	.max_width = 4416,
>  	.max_height = 3312,
>  };
> @@ -554,7 +556,8 @@ static const struct rkisp1_info imx8mp_isp_info = {
>  	.isr_size = ARRAY_SIZE(imx8mp_isp_isrs),
>  	.isp_ver = RKISP1_V_IMX8MP,
>  	.features = RKISP1_FEATURE_MAIN_STRIDE
> -		  | RKISP1_FEATURE_DMA_34BIT,
> +		  | RKISP1_FEATURE_DMA_34BIT
> +		  | RKISP1_FEATURE_COMPAND,
>  	.max_width = 4096,
>  	.max_height = 3072,
>  };
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 92312b4dabf6..bac9d4972493 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -1268,6 +1268,12 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  	module_cfg_update = new_params->module_cfg_update;
>  	module_ens = new_params->module_ens;
>
> +	if (!rkisp1_has_feature(params->rkisp1, BLS)) {
> +		module_en_update &= ~RKISP1_CIF_ISP_MODULE_BLS;
> +		module_cfg_update &= ~RKISP1_CIF_ISP_MODULE_BLS;
> +		module_ens &= ~RKISP1_CIF_ISP_MODULE_BLS;
> +	}
> +

or is it easier to read if you

	if (rkisp1_has_feature(params->rkisp1, BLS)) {
                /* update bls config */
                if (module_cfg_update & RKISP1_CIF_ISP_MODULE_BLS)
                        rkisp1_bls_config(params,
                                          &new_params->others.bls_config);

                if (module_en_update & RKISP1_CIF_ISP_MODULE_BLS) {
                        if (module_ens & RKISP1_CIF_ISP_MODULE_BLS)
                                rkisp1_param_set_bits(params,
                                                      RKISP1_CIF_ISP_BLS_CTRL,
                                                      RKISP1_CIF_ISP_BLS_ENA);
                        else
                                rkisp1_param_clear_bits(params,
                                                        RKISP1_CIF_ISP_BLS_CTRL,
                                                        RKISP1_CIF_ISP_BLS_ENA);
                }
        }

below ?


>  	/* update dpc config */
>  	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_DPCC)
>  		rkisp1_dpcc_config(params,
> @@ -1851,6 +1857,7 @@ static const struct rkisp1_ext_params_handler {
>  		.size		= sizeof(struct rkisp1_ext_params_bls_config),
>  		.handler	= rkisp1_ext_params_bls,
>  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> +		.features	= RKISP1_FEATURE_BLS,
>  	},
>  	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC] = {
>  		.size		= sizeof(struct rkisp1_ext_params_dpcc_config),
> --
> Regards,
>
> Laurent Pinchart
>

