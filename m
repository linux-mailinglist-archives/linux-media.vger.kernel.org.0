Return-Path: <linux-media+bounces-13742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F9D90F352
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 17:59:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7B8D1F22E45
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 15:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3810A155744;
	Wed, 19 Jun 2024 15:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YgijNq67"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D15C152169
	for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 15:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718812027; cv=none; b=kqQpF468lTiLAKs9PQ54FkQ4dI6D3bjMlZjRxWgEFyuHEJwpJENK+5aOmoIfgSR2ezecvjW/6kx0+vxIHyid96NjEXR3oonv4VPRpUgCkepNSz3Xc1a37CpgKJ2mRZitTMA5ORYcZUMy6wx/rYqhqx3uD8owxOcFEOpXFA17thg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718812027; c=relaxed/simple;
	bh=lzH2HxsWlX59PeoANx3gMDYAaBbFMCHEBPLBjeROMWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lqPrrnwALUCjPmu+M5VpgAWQS0rBCxrUVQ0UFVyMGRZ7lG/2+L7LuOrqIp3oODlyCytgBfwEsseIxfqjC03IFidxTrr2G2LwYggT8ZveQzh1t8hR4mWQW4SVAsI35lVPbqB1HByv/rcwGnEbfEkkD6x21ktUTYqVMpuJHGR7ULs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YgijNq67; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52F6745B;
	Wed, 19 Jun 2024 17:46:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718812004;
	bh=lzH2HxsWlX59PeoANx3gMDYAaBbFMCHEBPLBjeROMWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YgijNq67CSAO73o3sUxpUQfXiUBQXimRd6sKD/grEIda4eDVlWr5JGNf9ccjUAIkI
	 NyneYBxIAFWuAuJ9u6/9mrxiP0KU7MTrAAJPrX1YoFMTqesoURyx5N9VOSt36P5+Dz
	 6Q/nLKkTzpr5oOdbEfyoARo6iETs+JOSKUQG0P94=
Date: Wed, 19 Jun 2024 17:46:59 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dan Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Paul Elder <paul.elder@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 5/8] media: rkisp1: Implement extensible params support
Message-ID: <bmsacxbapf3ftwr764zfqpm2tzhzyk4jweceotzfrsjwwpifp4@7h4vdumtutr3>
References: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
 <20240605165434.432230-6-jacopo.mondi@ideasonboard.com>
 <43ba414f-96f5-47a5-81a6-26cb109b22cd@ideasonboard.com>
 <20240612154201.GD15991@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240612154201.GD15991@pendragon.ideasonboard.com>

Hi Laurent

On Wed, Jun 12, 2024 at 06:42:01PM GMT, Laurent Pinchart wrote:
> On Wed, Jun 12, 2024 at 02:50:34PM +0100, Daniel Scally wrote:
> > On 05/06/2024 17:54, Jacopo Mondi wrote:
> > > Implement support in the rkisp1-params for the extensible configuration
> > > parameters format.
> > >
> > > Create a list of handlers for each ISP block that wraps the existing
> > > configuration functions and handles the ISP block enablement state.
> > >
> > > Parse the configuration parameters buffer in __rkisp1_ext_params_config
> > > and filter the enable blocks by group, to allow setting the 'other' and
> > > 'meas' groups separately from the 'lsc' group to support the
> > > pre/post-configure operations.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > ---
> > >   .../platform/rockchip/rkisp1/rkisp1-params.c  | 565 +++++++++++++++++-
> > >   1 file changed, 544 insertions(+), 21 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > > index 6f99c7dad758..3d78e643d0b8 100644
> > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > > @@ -33,6 +33,10 @@
> > >   #define RKISP1_ISP_CC_COEFF(n) \
> > >   			(RKISP1_CIF_ISP_CC_COEFF_0 + (n) * 4)
> > >
> > > +#define RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS	BIT(0)
> > > +#define RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS	BIT(1)
> > > +#define RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC	BIT(2)
>
> Would "LSC" and "OTHERS" be enough ? The OTHERS and MEAS groups are
> always handled together.
>

The existing code handles the three separately but I actually program
OTHER and MEAS together.

Then we're left with "OTHER" and "LSC". I would like a more
descriptive name for "OTHER"

> > > +
> > >   enum rkisp1_params_formats {
> > >   	RKISP1_PARAMS_FIXED,
> > >   	RKISP1_PARAMS_EXTENSIBLE,
> > > @@ -1529,9 +1533,491 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
> > >   	}
> > >   }
> > >
> > > +/*------------------------------------------------------------------------------
> > > + * Extensible parameters format handling
> > > + */
> > > +
> > > +static void rkisp1_ext_params_bls(struct rkisp1_params *params,
> > > +				  struct rkisp1_ext_params_block_header *hdr)
> > > +{
> > > +	struct rkisp1_ext_params_bls_config *bls =
> > > +		(struct rkisp1_ext_params_bls_config *)hdr;
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> > > +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_BLS_CTRL,
> > > +					RKISP1_CIF_ISP_BLS_ENA);
> > > +		return;
> > > +	}
> > > +
> > > +	rkisp1_bls_config(params, &bls->bls_config);
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> > > +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_BLS_CTRL,
> > > +				      RKISP1_CIF_ISP_BLS_ENA);
> > > +}
> >
> > Most of the handlers have all but identical handling for the
> > enable/disable parts; is it worth factoring that out perhaps? The
> > register and bits could be added to struct rkisp1_ext_params_handler
> > and then a common pre-handler function could be called from
> > __rkisp1_ext_params_config() to set/clear the bits.
>
> I like the idea of generalizing things :-) The devil is in the details
> though, so if it causes annoying issues, we can skip it.

There are slight differences in how blocks are enabled, most blocks
are enabled setting a bit, other have a dedicated function. I would
keep them in the handlers for clarify (or I should add an .enable and
.disable function, but this seems more cumbersome than what I have
here)

>
> If we drop RKISP1_EXT_PARAMS_BLOCK_NO_CHANGE, we should also cache the
> enable state. That should be easy to do in a bitmask indexed by block
> type, and will fit nicely in generalized handling of the enable bits.
>

Done

> > > +
> > > +static void rkisp1_ext_params_dpcc(struct rkisp1_params *params,
> > > +				   struct rkisp1_ext_params_block_header *hdr)
> > > +{
> > > +	struct rkisp1_ext_params_dpcc_config *dpcc =
> > > +		(struct rkisp1_ext_params_dpcc_config *)hdr;
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> > > +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPCC_MODE,
> > > +					RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE);
> > > +		return;
> > > +	}
> > > +
> > > +	rkisp1_dpcc_config(params, &dpcc->dpcc_config);
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> > > +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_DPCC_MODE,
> > > +				      RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE);
> > > +}
> > > +
> > > +static void rkisp1_ext_params_sdg(struct rkisp1_params *params,
> > > +				  struct rkisp1_ext_params_block_header *hdr)
> > > +{
> > > +	struct rkisp1_ext_params_sdg_config *sdg =
> > > +		(struct rkisp1_ext_params_sdg_config *)hdr;
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> > > +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
> > > +					RKISP1_CIF_ISP_CTRL_ISP_GAMMA_IN_ENA);
> > > +		return;
> > > +	}
> > > +
> > > +	rkisp1_sdg_config(params, &sdg->sdg_config);
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> > > +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> > > +				      RKISP1_CIF_ISP_CTRL_ISP_GAMMA_IN_ENA);
> > > +}
> > > +
> > > +static void rkisp1_ext_params_lsc(struct rkisp1_params *params,
> > > +				  struct rkisp1_ext_params_block_header *hdr)
> > > +{
> > > +	struct rkisp1_ext_params_lsc_config *lsc =
> > > +		(struct rkisp1_ext_params_lsc_config *)hdr;
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> > > +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_LSC_CTRL,
> > > +					RKISP1_CIF_ISP_LSC_CTRL_ENA);
> > > +		return;
> > > +	}
> > > +
> > > +	rkisp1_lsc_config(params, &lsc->lsc_config);
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> > > +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_LSC_CTRL,
> > > +				      RKISP1_CIF_ISP_LSC_CTRL_ENA);
> > > +}
> > > +
> > > +static void rkisp1_ext_params_awbg(struct rkisp1_params *params,
> > > +				   struct rkisp1_ext_params_block_header *hdr)
> > > +{
> > > +	struct rkisp1_ext_params_awb_gain_config *awbg =
> > > +		(struct rkisp1_ext_params_awb_gain_config *)hdr;
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> > > +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
> > > +					RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
> > > +		return;
> > > +	}
> > > +
> > > +	params->ops->awb_gain_config(params, &awbg->awb_config);
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> > > +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> > > +				      RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
> > > +}
> > > +
> > > +static void rkisp1_ext_params_flt(struct rkisp1_params *params,
> > > +				  struct rkisp1_ext_params_block_header *hdr)
> > > +{
> > > +	struct rkisp1_ext_params_flt_config *flt =
> > > +		(struct rkisp1_ext_params_flt_config *)hdr;
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> > > +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_FILT_MODE,
> > > +					RKISP1_CIF_ISP_FLT_ENA);
> > > +		return;
> > > +	}
> > > +
> > > +	rkisp1_flt_config(params, &flt->flt_config);
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> > > +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_FILT_MODE,
> > > +				      RKISP1_CIF_ISP_FLT_ENA);
> > > +}
> > > +
> > > +static void rkisp1_ext_params_bdm(struct rkisp1_params *params,
> > > +				  struct rkisp1_ext_params_block_header *hdr)
> > > +{
> > > +	struct rkisp1_ext_params_bdm_config *bdm =
> > > +		(struct rkisp1_ext_params_bdm_config *)hdr;
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> > > +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
> > > +					RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
> > > +		return;
> > > +	}
> > > +
> > > +	rkisp1_bdm_config(params, &bdm->bdm_config);
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> > > +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
> > > +				      RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
> > > +}
> > > +
> > > +static void rkisp1_ext_params_ctk(struct rkisp1_params *params,
> > > +				  struct rkisp1_ext_params_block_header *hdr)
> > > +{
> > > +	struct rkisp1_ext_params_ctk_config *ctk =
> > > +		(struct rkisp1_ext_params_ctk_config *)hdr;
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> > > +		rkisp1_ctk_enable(params, false);
> > > +		return;
> > > +	}
> > > +
> > > +	rkisp1_ctk_config(params, &ctk->ctk_config);
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> > > +		rkisp1_ctk_enable(params, true);
> > > +}
> > > +
> > > +static void rkisp1_ext_params_goc(struct rkisp1_params *params,
> > > +				  struct rkisp1_ext_params_block_header *hdr)
> > > +{
> > > +	struct rkisp1_ext_params_goc_config *goc =
> > > +		(struct rkisp1_ext_params_goc_config *)hdr;
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> > > +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
> > > +					RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
> > > +		return;
> > > +	}
> > > +
> > > +	params->ops->goc_config(params, &goc->goc_config);
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> > > +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> > > +				      RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
> > > +}
> > > +
> > > +static void rkisp1_ext_params_dpf(struct rkisp1_params *params,
> > > +				  struct rkisp1_ext_params_block_header *hdr)
> > > +{
> > > +	struct rkisp1_ext_params_dpf_config *dpf =
> > > +		(struct rkisp1_ext_params_dpf_config *)hdr;
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> > > +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPF_MODE,
> > > +					RKISP1_CIF_ISP_DPF_MODE_EN);
> > > +		return;
> > > +	}
> > > +
> > > +	rkisp1_dpf_config(params, &dpf->dpf_config);
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> > > +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_DPF_MODE,
> > > +				      RKISP1_CIF_ISP_DPF_MODE_EN);
> > > +}
> > > +
> > > +static void rkisp1_ext_params_dpfs(struct rkisp1_params *params,
> > > +				   struct rkisp1_ext_params_block_header *hdr)
> > > +{
> > > +	struct rkisp1_ext_params_dpf_strength_config *dpfs =
> > > +		(struct rkisp1_ext_params_dpf_strength_config *)hdr;
> > > +
> > > +	rkisp1_dpf_strength_config(params, &dpfs->dpf_strength_config);
> > > +}
> > > +
> > > +static void rkisp1_ext_params_cproc(struct rkisp1_params *params,
> > > +				    struct rkisp1_ext_params_block_header *hdr)
> > > +{
> > > +	struct rkisp1_ext_params_cproc_config *cproc =
> > > +		(struct rkisp1_ext_params_cproc_config *)hdr;
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> > > +		rkisp1_param_clear_bits(params, RKISP1_CIF_C_PROC_CTRL,
> > > +					RKISP1_CIF_C_PROC_CTR_ENABLE);
> > > +		return;
> > > +	}
> > > +
> > > +	rkisp1_cproc_config(params, &cproc->cproc_config);
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> > > +		rkisp1_param_set_bits(params, RKISP1_CIF_C_PROC_CTRL,
> > > +				      RKISP1_CIF_C_PROC_CTR_ENABLE);
> > > +}
> > > +
> > > +static void rkisp1_ext_params_ie(struct rkisp1_params *params,
> > > +				 struct rkisp1_ext_params_block_header *hdr)
> > > +{
> > > +	struct rkisp1_ext_params_ie_config *ie =
> > > +		(struct rkisp1_ext_params_ie_config *)hdr;
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> > > +		rkisp1_ie_enable(params, false);
> > > +		return;
> > > +	}
> > > +
> > > +	rkisp1_ie_config(params, &ie->ie_config);
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> > > +		rkisp1_ie_enable(params, true);
> > > +}
> > > +
> > > +static void rkisp1_ext_params_awbm(struct rkisp1_params *params,
> > > +				   struct rkisp1_ext_params_block_header *hdr)
> > > +{
> > > +	struct rkisp1_ext_params_awb_meas_config *awbm =
> > > +		(struct rkisp1_ext_params_awb_meas_config *)hdr;
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> > > +		params->ops->awb_meas_enable(params, &awbm->awb_meas_config,
> > > +					     false);
> > > +		return;
> > > +	}
> > > +
> > > +	params->ops->awb_meas_config(params, &awbm->awb_meas_config);
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> > > +		params->ops->awb_meas_enable(params, &awbm->awb_meas_config,
> > > +					     true);
> > > +}
> > > +
> > > +static void rkisp1_ext_params_hstm(struct rkisp1_params *params,
> > > +				   struct rkisp1_ext_params_block_header *hdr)
> > > +{
> > > +	struct rkisp1_ext_params_hst_config *hst =
> > > +		(struct rkisp1_ext_params_hst_config *)hdr;
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> > > +		params->ops->hst_enable(params, &hst->hst_config, false);
> > > +		return;
> > > +	}
> > > +
> > > +	params->ops->hst_config(params, &hst->hst_config);
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> > > +		params->ops->hst_enable(params, &hst->hst_config, true);
> > > +}
> > > +
> > > +static void rkisp1_ext_params_aecm(struct rkisp1_params *params,
> > > +				   struct rkisp1_ext_params_block_header *hdr)
> > > +{
> > > +	struct rkisp1_ext_params_aec_config *aec =
> > > +		(struct rkisp1_ext_params_aec_config *)hdr;
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> > > +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_EXP_CTRL,
> > > +					RKISP1_CIF_ISP_EXP_ENA);
> > > +		return;
> > > +	}
> > > +
> > > +	params->ops->aec_config(params, &aec->aec_config);
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> > > +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_EXP_CTRL,
> > > +				      RKISP1_CIF_ISP_EXP_ENA);
> > > +}
> > > +
> > > +static void rkisp1_ext_params_afcm(struct rkisp1_params *params,
> > > +				   struct rkisp1_ext_params_block_header *hdr)
> > > +{
> > > +	struct rkisp1_ext_params_afc_config *afc =
> > > +		(struct rkisp1_ext_params_afc_config *)hdr;
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> > > +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_AFM_CTRL,
> > > +					RKISP1_CIF_ISP_AFM_ENA);
> > > +		return;
> > > +	}
> > > +
> > > +	params->ops->afm_config(params, &afc->afc_config);
> > > +
> > > +	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
> > > +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_AFM_CTRL,
> > > +				      RKISP1_CIF_ISP_AFM_ENA);
> > > +}
> > > +
> > > +typedef void (*rkisp1_block_handler)(struct rkisp1_params *params,
> > > +				     struct rkisp1_ext_params_block_header *hdr);
> > > +
> > > +static const struct rkisp1_ext_params_handler {
> > > +	size_t size;
> > > +	rkisp1_block_handler handler;
> > > +	unsigned int group;
>
> We'll have to extend this structure with a bitmask of the ISP versions
> each block supports. That can be done later.
>
> > > +} rkisp1_ext_params_handlers[] = {
> > > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS] = {
> > > +		.size		= sizeof(struct rkisp1_ext_params_bls_config),
> > > +		.handler	= rkisp1_ext_params_bls,
> > > +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
> > > +	},
> > > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC] = {
> > > +		.size		= sizeof(struct rkisp1_ext_params_dpcc_config),
> > > +		.handler	= rkisp1_ext_params_dpcc,
> > > +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
> > > +	},
> > > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG] = {
> > > +		.size		= sizeof(struct rkisp1_ext_params_sdg_config),
> > > +		.handler	= rkisp1_ext_params_sdg,
> > > +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
> > > +	},
> > > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAINS] = {
> > > +		.size		=
> > > +			sizeof(struct rkisp1_ext_params_awb_gain_config),
> > > +		.handler	= rkisp1_ext_params_awbg,
> > > +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
> > > +	},
> > > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT] = {
> > > +		.size		= sizeof(struct rkisp1_ext_params_flt_config),
> > > +		.handler	= rkisp1_ext_params_flt,
> > > +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
> > > +	},
> > > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM] = {
> > > +		.size		= sizeof(struct rkisp1_ext_params_bdm_config),
> > > +		.handler	= rkisp1_ext_params_bdm,
> > > +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
> > > +	},
> > > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK] = {
> > > +		.size		= sizeof(struct rkisp1_ext_params_ctk_config),
> > > +		.handler	= rkisp1_ext_params_ctk,
> > > +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
> > > +	},
> > > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC] = {
> > > +		.size		= sizeof(struct rkisp1_ext_params_goc_config),
> > > +		.handler	= rkisp1_ext_params_goc,
> > > +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
> > > +	},
> > > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF] = {
> > > +		.size		= sizeof(struct rkisp1_ext_params_dpf_config),
> > > +		.handler	= rkisp1_ext_params_dpf,
> > > +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
> > > +	},
> > > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGHT] = {
> > > +		.size		=
> > > +			sizeof(struct rkisp1_ext_params_dpf_strength_config),
> > > +		.handler	= rkisp1_ext_params_dpfs,
> > > +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
> > > +	},
> > > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC] = {
> > > +		.size		= sizeof(struct rkisp1_ext_params_cproc_config),
> > > +		.handler	= rkisp1_ext_params_cproc,
> > > +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
> > > +	},
> > > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_IE] = {
> > > +		.size		= sizeof(struct rkisp1_ext_params_ie_config),
> > > +		.handler	= rkisp1_ext_params_ie,
> > > +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
> > > +	},
> > > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC] = {
> > > +		.size		= sizeof(struct rkisp1_ext_params_lsc_config),
> > > +		.handler	= rkisp1_ext_params_lsc,
> > > +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC
> > > +	},
> > > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS] = {
> > > +		.size		=
> > > +			sizeof(struct rkisp1_ext_params_awb_meas_config),
> > > +		.handler	= rkisp1_ext_params_awbm,
> > > +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS
> > > +	},
> > > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS] = {
> > > +		.size		= sizeof(struct rkisp1_ext_params_hst_config),
> > > +		.handler	= rkisp1_ext_params_hstm,
> > > +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS
> > > +	},
> > > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS] = {
> > > +		.size		= sizeof(struct rkisp1_ext_params_aec_config),
> > > +		.handler	= rkisp1_ext_params_aecm,
> > > +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS
> > > +	},
> > > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS] = {
> > > +		.size		= sizeof(struct rkisp1_ext_params_afc_config),
> > > +		.handler	= rkisp1_ext_params_afcm,
> > > +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS
> > > +	},
> > > +};
> > > +
> > > +static int __rkisp1_ext_params_config(struct rkisp1_params *params,
> > > +				      struct rkisp1_ext_params_cfg *cfg,
> > > +				      u32 block_group_mask)
> > > +{
> > > +	size_t block_offset = 0;
> > > +
> > > +	if (cfg->total_size > RKISP1_EXT_PARAMS_MAX_SIZE) {
> > > +		dev_dbg(params->rkisp1->dev,
> > > +			"Invalid parameters buffer size %llu\n",
> > > +			cfg->total_size);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	/* Walk the list of parameter blocks and process them. */
> > > +	while (block_offset < cfg->total_size) {
> > > +		const struct rkisp1_ext_params_handler *block_handler;
> > > +		struct rkisp1_ext_params_block_header *block;
> > > +
> > > +		block = (struct rkisp1_ext_params_block_header *)
> > > +			&cfg->data[block_offset];
> > > +		block_offset += block->size;
> > > +
> > > +		/*
> > > +		 * Validate the block id and make sure the block group is in
> > > +		 * the list of groups to configure.
> > > +		 */
> > > +		if (block->type >= RKISP1_EXT_PARAMS_BLOCK_TYPE_SENTINEL) {
>
> Use ARRAY_SIZE().
>

I don't think I can use ARRAY_SIZE() on a enum type

> > > +			dev_dbg(params->rkisp1->dev,
> > > +				"Invalid parameters block type\n");
> > > +			return -EINVAL;
> > > +		}
> > > +
> > > +		block_handler = &rkisp1_ext_params_handlers[block->type];
> > > +		if (!(block_handler->group & block_group_mask))
> > > +			continue;
> >
> >
> > So maybe something like
> >
> >
> > if (block_handler->enable_reg)
> >
> >          __rkisp1_block_handle_enable_disable(block->state, block_handler->enable_reg,
> > block_handler->enable_val);
> >
> >
> > here to move it out of the handlers.
> >
> > > +
> > > +		if (block->size != block_handler->size) {
> > > +			dev_dbg(params->rkisp1->dev,
> > > +				"Invalid parameters block size\n");
> > > +			return -EINVAL;
> > > +		}
> > > +
> > > +		block_handler->handler(params, block);
>
> It would be nicer to move validation to qbuf time, and applying
> parameters at runtime. Maybe I'll find that later in the series :-)
>
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int rkisp1_ext_params_config(struct rkisp1_params *params,
> > > +				    struct rkisp1_ext_params_cfg *cfg)
> > > +{
> > > +	return __rkisp1_ext_params_config(params, cfg,
> > > +					  RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS |
> > > +					  RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC |
> > > +					  RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS);
> > > +}
> > > +
> > > +static int
> > > +rkisp1_ext_params_other_meas_config(struct rkisp1_params *params,
> > > +				    struct rkisp1_ext_params_cfg *cfg)
> > > +{
> > > +	return __rkisp1_ext_params_config(params, cfg,
> > > +					  RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS |
> > > +					  RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS);
> > > +}
> > > +
> > > +static int rkisp1_ext_params_lsc_config(struct rkisp1_params *params,
> > > +					struct rkisp1_ext_params_cfg *cfg)
> > > +{
> > > +	return __rkisp1_ext_params_config(params, cfg,
> > > +					  RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC);
> > > +}
>
> I'm tempted to inline this in the callers, I think it would be more
> readable.
>
> > > +
> > >   static bool rkisp1_params_get_buffer(struct rkisp1_params *params,
> > >   				     struct rkisp1_buffer **buf,
> > > -				     struct rkisp1_params_cfg **cfg)
> > > +				     void **cfg)
> > >   {
> > >   	if (list_empty(&params->params))
> > >   		return false;
> > > @@ -1544,28 +2030,37 @@ static bool rkisp1_params_get_buffer(struct rkisp1_params *params,
> > >
> > >   static void rkisp1_params_complete_buffer(struct rkisp1_params *params,
> > >   					  struct rkisp1_buffer *buf,
> > > -					  unsigned int frame_sequence)
> > > +					  unsigned int frame_sequence,
> > > +					  enum vb2_buffer_state state)
> > >   {
> > >   	list_del(&buf->queue);
> > >
> > >   	buf->vb.sequence = frame_sequence;
> > > -	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> > > +	vb2_buffer_done(&buf->vb.vb2_buf, state);
> > >   }
> > >
> > >   void rkisp1_params_isr(struct rkisp1_device *rkisp1)
> > >   {
> > >   	struct rkisp1_params *params = &rkisp1->params;
> > > -	struct rkisp1_params_cfg *new_params;
> > > -	struct rkisp1_buffer *cur_buf;
> > > +	struct rkisp1_buffer *buf;
> >
> > Why the rename?
> >

Because "cur" implies there's a "next" or a "prev".
I can drop it though.


> > > +	int ret = 0;
> > > +	void *cfg;
> > >
> > >   	spin_lock(&params->config_lock);
> > >
> > > -	if (!rkisp1_params_get_buffer(params, &cur_buf, &new_params))
> > > +	if (!rkisp1_params_get_buffer(params, &buf, &cfg))
> > >   		goto unlock;
> > >
> > > -	rkisp1_isp_isr_other_config(params, new_params);
> > > -	rkisp1_isp_isr_lsc_config(params, new_params);
> > > -	rkisp1_isp_isr_meas_config(params, new_params);
> > > +	if (params->metafmt.dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
> > > +		rkisp1_isp_isr_other_config(params, cfg);
> > > +		rkisp1_isp_isr_lsc_config(params, cfg);
> > > +		rkisp1_isp_isr_meas_config(params, cfg);
> > > +	} else {
> > > +		ret = rkisp1_ext_params_config(params, cfg);
> > > +	}
> > > +
> > > +	if (ret)
> > > +		goto complete_and_unlock;
>
> As validation should happen at qbuf time, I think it would be nicer to
> reorder the patches to avoid introducing error handling here and
> removing it later.
>
> > >
> > >   	/* update shadow register immediately */
> > >   	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> > > @@ -1579,8 +2074,11 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
> > >   	 * indicate to userspace on which frame these parameters are being
> > >   	 * applied.
> > >   	 */
> > > -	rkisp1_params_complete_buffer(params, cur_buf,
> > > -				      rkisp1->isp.frame_sequence + 1);
> > > +complete_and_unlock:
> > > +	rkisp1_params_complete_buffer(params, buf,
> > > +				      rkisp1->isp.frame_sequence + 1,
> > > +				      ret ? VB2_BUF_STATE_ERROR
> > > +					  : VB2_BUF_STATE_DONE);
> > >
> > >   unlock:
> > >   	spin_unlock(&params->config_lock);
> > > @@ -1631,8 +2129,9 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
> > >   				 enum v4l2_ycbcr_encoding ycbcr_encoding)
> > >   {
> > >   	struct rkisp1_cif_isp_hst_config hst = rkisp1_hst_params_default_config;
> > > -	struct rkisp1_params_cfg *new_params;
> > > -	struct rkisp1_buffer *cur_buf;
> > > +	struct rkisp1_buffer *buf;
> > > +	int ret = 0;
> > > +	void *cfg;
> > >
> > >   	params->quantization = quantization;
> > >   	params->ycbcr_encoding = ycbcr_encoding;
> > > @@ -1661,11 +2160,26 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
> > >
> > >   	/* apply the first buffer if there is one already */
> > >
> > > -	if (!rkisp1_params_get_buffer(params, &cur_buf, &new_params))
> > > +	if (!rkisp1_params_get_buffer(params, &buf, &cfg))
> > >   		goto unlock;
> > >
> > > -	rkisp1_isp_isr_other_config(params, new_params);
> > > -	rkisp1_isp_isr_meas_config(params, new_params);
> > > +	if (params->metafmt.dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
> > > +		rkisp1_isp_isr_other_config(params, cfg);
> > > +		rkisp1_isp_isr_meas_config(params, cfg);
> > > +	} else {
> > > +		ret = rkisp1_ext_params_other_meas_config(params, cfg);
> > > +	}
> > > +
> > > +	if (ret) {
> > > +		/*
> > > +		 * Complete the buffer in error state immediately. In case of no
> > > +		 * error, the buffer will be completed in
> > > +		 * rkisp1_params_post_configure().
> > > +		 */
> > > +		rkisp1_params_complete_buffer(params, buf, 0,
> > > +					      VB2_BUF_STATE_ERROR);
> > > +		goto unlock;
> > > +	}
> > >
> > >   	/* update shadow register immediately */
> > >   	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> > > @@ -1677,8 +2191,9 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
> > >
> > >   void rkisp1_params_post_configure(struct rkisp1_params *params)
> > >   {
> > > -	struct rkisp1_params_cfg *new_params;
> > > -	struct rkisp1_buffer *cur_buf;
> > > +	struct rkisp1_buffer *buf;
> >
> > And likewise here?
> >
> > > +	int ret = 0;
> > > +	void *cfg;
> > >
> > >   	spin_lock_irq(&params->config_lock);
> > >
> > > @@ -1691,16 +2206,24 @@ void rkisp1_params_post_configure(struct rkisp1_params *params)
> > >   	 * unconditionally.
> > >   	 */
> > >
> > > -	if (!rkisp1_params_get_buffer(params, &cur_buf, &new_params))
> > > +	if (!rkisp1_params_get_buffer(params, &buf, &cfg))
> > >   		goto unlock;
> > >
> > > -	rkisp1_isp_isr_lsc_config(params, new_params);
> > > +	if (params->metafmt.dataformat == V4L2_META_FMT_RK_ISP1_PARAMS)
> > > +		rkisp1_isp_isr_lsc_config(params, cfg);
> > > +	else
> > > +		ret = rkisp1_ext_params_lsc_config(params, cfg);
> > > +
> > > +	if (ret)
> > > +		goto complete_and_unlock;
> > >
> > >   	/* update shadow register immediately */
> > >   	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> > >   			      RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD);
> > >
> > > -	rkisp1_params_complete_buffer(params, cur_buf, 0);
> > > +complete_and_unlock:
> > > +	rkisp1_params_complete_buffer(params, buf, 0, ret ? VB2_BUF_STATE_ERROR
> > > +							  : VB2_BUF_STATE_DONE);
> > >
> > >   unlock:
> > >   	spin_unlock_irq(&params->config_lock);
>
> --
> Regards,
>
> Laurent Pinchart

