Return-Path: <linux-media+bounces-14627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7684492729E
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 11:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2766228D24D
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 09:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886AC1AB911;
	Thu,  4 Jul 2024 09:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Cm7kns4m"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EC82BB06
	for <linux-media@vger.kernel.org>; Thu,  4 Jul 2024 09:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720083662; cv=none; b=I7Wyhac8z189h1zY1CebSaz/PVeONrcNdNQcwgvYIPmtYLAVTdGTe2mIoFgSoFzimzZ84SIHsoz9p4TMj3uoAmhHw2nAeSrz1iFHarGMUEihUAgxDoezoa+X9V/7NYf1t+UQq3kqQWGE79dgU3ns6PPiUq2ow7zqJAjSu868Us8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720083662; c=relaxed/simple;
	bh=YaUWUl8EnNZIC7qO0CR0iMMrU86ht284fMYDBUlc9ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BcJGsS3/KcGk9nnwzvQVO7VOu4MLrFKKgK64oTWrthvTLXK0Zy4pfz4YUQTm8efaTqboABXCjHqUYXU7x1u5zaNaUc+a3OCJRPOJYCRUrM8HF+XS8rlylgf6X2LmkSqntvWRWwOms+EAKXwqxJOxbnmHw+FfRnoewYGhwfp0ur4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Cm7kns4m; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C37183F;
	Thu,  4 Jul 2024 11:00:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720083630;
	bh=YaUWUl8EnNZIC7qO0CR0iMMrU86ht284fMYDBUlc9ro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cm7kns4mtnhsZ9f+9mugwAlC12HOLkgX7yHnWzhi6zYH8qT1fTTggZvbfcnPg/W59
	 dBtXKVAJctih1Q+sa060opBtGPFQz2W/cexrSdhyA888XpxPNn3kH769vT5kE0rrMZ
	 AlzaLRzvKBSg1asTVZlgOiVXX15kblJKyLcjC6ZM=
Date: Thu, 4 Jul 2024 12:00:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v1 4/5] media: rkisp1: Add feature flags for BLS and
 compand
Message-ID: <20240704090036.GA10099@pendragon.ideasonboard.com>
References: <20240703222533.1662-1-laurent.pinchart@ideasonboard.com>
 <20240703222533.1662-5-laurent.pinchart@ideasonboard.com>
 <aayd65reqbctgm37jirnbxrjpo3isi2jntsc3auiday2ww3b77@svw6xhnw627d>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aayd65reqbctgm37jirnbxrjpo3isi2jntsc3auiday2ww3b77@svw6xhnw627d>

On Thu, Jul 04, 2024 at 10:34:20AM +0200, Jacopo Mondi wrote:
> On Thu, Jul 04, 2024 at 01:25:32AM GMT, Laurent Pinchart wrote:
> > From: Paul Elder <paul.elder@ideasonboard.com>
> >
> > Add feature flags for the dedicated black level subtraction hardware
> > block and for the compand hardware block. The companding feature flag is
> > added on its own (as opposed to "the absence of BLS") because we will
> > need it later for when we add support for the companding block.
> >
> > Skip BLS configuration when the BLS feature flag is unset, as devices
> > without the dedicated BLS block cannot configure a hardware block that
> > doesn't exist.
> >
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/rockchip/rkisp1/rkisp1-common.h | 4 ++++
> >  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c    | 9 ++++++---
> >  drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 7 +++++++
> >  3 files changed, 17 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > index cdf2d30e2bb1..607e1a024d02 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > @@ -116,6 +116,8 @@ enum rkisp1_isp_pad {
> >   * @RKISP1_FEATURE_SELF_PATH: The ISP has a self path
> >   * @RKISP1_FEATURE_DUAL_CROP: The ISP has the dual crop block at the resizer input
> >   * @RKISP1_FEATURE_DMA_34BIT: The ISP uses 34-bit DMA addresses
> > + * @RKISP1_FEATURE_BLS: The ISP has a dedicated BLS block
> > + * @RKISP1_FEATURE_COMPAND: The ISP has a companding block
> >   *
> >   * The ISP features are stored in a bitmask in &rkisp1_info.features and allow
> >   * the driver to implement support for features present in some ISP versions
> > @@ -127,6 +129,8 @@ enum rkisp1_feature {
> >  	RKISP1_FEATURE_SELF_PATH = BIT(2),
> >  	RKISP1_FEATURE_DUAL_CROP = BIT(3),
> >  	RKISP1_FEATURE_DMA_34BIT = BIT(4),
> > +	RKISP1_FEATURE_BLS = BIT(5),
> > +	RKISP1_FEATURE_COMPAND = BIT(6),
> >  };
> >
> >  #define rkisp1_has_feature(rkisp1, feature) \
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > index 0535ce57e862..dd114ab77800 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > @@ -509,7 +509,8 @@ static const struct rkisp1_info px30_isp_info = {
> >  	.isp_ver = RKISP1_V12,
> >  	.features = RKISP1_FEATURE_MIPI_CSI2
> >  		  | RKISP1_FEATURE_SELF_PATH
> > -		  | RKISP1_FEATURE_DUAL_CROP,
> > +		  | RKISP1_FEATURE_DUAL_CROP
> > +		  | RKISP1_FEATURE_BLS,
> 
> Doesn't apply for me on top of [media-stage/master + my ext params
> series]
> 
> In particular, in media-stage I don't see
> >  	.max_width = 3264,
> >  	.max_height = 2448,
> 
> these

There are a few prerequisites. The cover letter lists the base commit
ID. The fact that I haven't pushed a branch anywhere doesn't help
obviously... I'll make it clearer in v2.

> >  };
> > @@ -532,7 +533,8 @@ static const struct rkisp1_info rk3399_isp_info = {
> >  	.isp_ver = RKISP1_V10,
> >  	.features = RKISP1_FEATURE_MIPI_CSI2
> >  		  | RKISP1_FEATURE_SELF_PATH
> > -		  | RKISP1_FEATURE_DUAL_CROP,
> > +		  | RKISP1_FEATURE_DUAL_CROP
> > +		  | RKISP1_FEATURE_BLS,
> >  	.max_width = 4416,
> >  	.max_height = 3312,
> >  };
> > @@ -554,7 +556,8 @@ static const struct rkisp1_info imx8mp_isp_info = {
> >  	.isr_size = ARRAY_SIZE(imx8mp_isp_isrs),
> >  	.isp_ver = RKISP1_V_IMX8MP,
> >  	.features = RKISP1_FEATURE_MAIN_STRIDE
> > -		  | RKISP1_FEATURE_DMA_34BIT,
> > +		  | RKISP1_FEATURE_DMA_34BIT
> > +		  | RKISP1_FEATURE_COMPAND,
> >  	.max_width = 4096,
> >  	.max_height = 3072,
> >  };
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > index 92312b4dabf6..bac9d4972493 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > @@ -1268,6 +1268,12 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
> >  	module_cfg_update = new_params->module_cfg_update;
> >  	module_ens = new_params->module_ens;
> >
> > +	if (!rkisp1_has_feature(params->rkisp1, BLS)) {
> > +		module_en_update &= ~RKISP1_CIF_ISP_MODULE_BLS;
> > +		module_cfg_update &= ~RKISP1_CIF_ISP_MODULE_BLS;
> > +		module_ens &= ~RKISP1_CIF_ISP_MODULE_BLS;
> > +	}
> > +
> 
> or is it easier to read if you
> 
> 	if (rkisp1_has_feature(params->rkisp1, BLS)) {
>                 /* update bls config */
>                 if (module_cfg_update & RKISP1_CIF_ISP_MODULE_BLS)
>                         rkisp1_bls_config(params,
>                                           &new_params->others.bls_config);
> 
>                 if (module_en_update & RKISP1_CIF_ISP_MODULE_BLS) {
>                         if (module_ens & RKISP1_CIF_ISP_MODULE_BLS)
>                                 rkisp1_param_set_bits(params,
>                                                       RKISP1_CIF_ISP_BLS_CTRL,
>                                                       RKISP1_CIF_ISP_BLS_ENA);
>                         else
>                                 rkisp1_param_clear_bits(params,
>                                                         RKISP1_CIF_ISP_BLS_CTRL,
>                                                         RKISP1_CIF_ISP_BLS_ENA);
>                 }
>         }
> 
> below ?

I was considering it. Lower indentation is nice, and I thought that we
could centralize all the feature checks in one place, but I don't mind
much either way. If you have a stronger preference I can change this.

> >  	/* update dpc config */
> >  	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_DPCC)
> >  		rkisp1_dpcc_config(params,
> > @@ -1851,6 +1857,7 @@ static const struct rkisp1_ext_params_handler {
> >  		.size		= sizeof(struct rkisp1_ext_params_bls_config),
> >  		.handler	= rkisp1_ext_params_bls,
> >  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> > +		.features	= RKISP1_FEATURE_BLS,
> >  	},
> >  	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC] = {
> >  		.size		= sizeof(struct rkisp1_ext_params_dpcc_config),

-- 
Regards,

Laurent Pinchart

