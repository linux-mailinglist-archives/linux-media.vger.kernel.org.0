Return-Path: <linux-media+bounces-25229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CD7A1ACD5
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 23:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63F583AC478
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 22:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302AD1D47CB;
	Thu, 23 Jan 2025 22:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iLUz9MXL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E4F14A4E1;
	Thu, 23 Jan 2025 22:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737672569; cv=none; b=HiBZ4hDcq/KtPbygJSZqdjyhfQgPW1vtlrX3kyKKg8jRS2UAd+3M2xGQglV/4+fS4OuP+dd7gesLFKAf2F9OM74nn4h+QeWPJ1AmWZaVzVc1PADrJ6GDKLrNJGCVH9Gc6xUGnRc3IEbtQpK35R79VzcWQDXij3iGvkyQ7i4+bbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737672569; c=relaxed/simple;
	bh=h/YzDXSq4TQ3S5i/u4Ot8/PK+q0PM1Aqx/jpgMD7Iw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bzv0sxtmSYR8cpdGztTur0wrFC5zBCIrTSwPm+dfE8PWQr69aAevTvS1E936p9lyAt9vnFHJeSHwjMVEhRZo1t+p6H04OyVPMWwj7+pehDxPh3WgyspZ2EH1Mvkj5nhHGfIqPsA7VdgrOw204KFgXELqOOAY/5654qupate52yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iLUz9MXL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C5D289A;
	Thu, 23 Jan 2025 23:48:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737672501;
	bh=h/YzDXSq4TQ3S5i/u4Ot8/PK+q0PM1Aqx/jpgMD7Iw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iLUz9MXLy9T/ZpN9qMUR1eWiUDZbEo4HGsxdgaUMlQv2UkK3tQ4y7cYUdzpbaaFD3
	 i8JVZ+7eCQkM47K1MFNMTWiWq8Tlw4MCxi8Sk+VsSgoiUnNOJNDC6NiNGH0iKLNevm
	 EoX8SjqgzrNmzEdG8BpxFNEHN6nvIBPcw/a7zXoA=
Date: Fri, 24 Jan 2025 00:49:16 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 6/6] media: vsp1: rwpf: Support operations with IIF
Message-ID: <20250123224916.GF10642@pendragon.ideasonboard.com>
References: <20250123-v4h-iif-v1-0-7b4e5299939f@ideasonboard.com>
 <20250123-v4h-iif-v1-6-7b4e5299939f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250123-v4h-iif-v1-6-7b4e5299939f@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Thu, Jan 23, 2025 at 06:04:07PM +0100, Jacopo Mondi wrote:
> When the RPF/WPF units are used for ISP interfacing through
> the IIF, the set of accessible registers is limited compared to
> the regular VSPD operations.
> 
> Support ISP interfacing in the rpf and wpf drivers by checking if
> the pipe features an IIF instance and writing only the relevant
> registers.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_rpf.c | 66 +++++++++++++++-----------
>  drivers/media/platform/renesas/vsp1/vsp1_wpf.c | 18 +++++--
>  2 files changed, 53 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> index 5c8b3ba1bd3c2c7b9289f05c9c2578e9717c23ff..e215491a3d962e2ae3c06b7835ca3b7654f04d10 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> @@ -60,6 +60,7 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
>  	const struct v4l2_mbus_framefmt *sink_format;
>  	unsigned int left = 0;
>  	unsigned int top = 0;
> +	u32 alpha_sel = 0;
>  	u32 pstride;
>  	u32 infmt;
>  
> @@ -84,7 +85,7 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
>  	sink_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
>  	source_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SOURCE);
>  
> -	infmt = VI6_RPF_INFMT_CIPM
> +	infmt = (pipe->iif ? 0 : VI6_RPF_INFMT_CIPM)
>  	      | (fmtinfo->hwfmt << VI6_RPF_INFMT_RDFMT_SHIFT);
>  
>  	if (fmtinfo->swap_yc)
> @@ -98,7 +99,7 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
>  	vsp1_rpf_write(rpf, dlb, VI6_RPF_INFMT, infmt);
>  	vsp1_rpf_write(rpf, dlb, VI6_RPF_DSWAP, fmtinfo->swap);
>  
> -	if (entity->vsp1->info->gen == 4) {
> +	if (entity->vsp1->info->gen == 4 && !pipe->iif) {
>  		u32 ext_infmt0;
>  		u32 ext_infmt1;
>  		u32 ext_infmt2;
> @@ -150,23 +151,6 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
>  		vsp1_rpf_write(rpf, dlb, VI6_RPF_EXT_INFMT2, ext_infmt2);
>  	}
>  
> -	/* Output location. */
> -	if (pipe->brx) {
> -		const struct v4l2_rect *compose;
> -
> -		compose = v4l2_subdev_state_get_compose(pipe->brx->state,
> -							rpf->brx_input);
> -		left = compose->left;
> -		top = compose->top;
> -	}
> -
> -	if (pipe->interlaced)
> -		top /= 2;
> -
> -	vsp1_rpf_write(rpf, dlb, VI6_RPF_LOC,
> -		       (left << VI6_RPF_LOC_HCOORD_SHIFT) |
> -		       (top << VI6_RPF_LOC_VCOORD_SHIFT));
> -
>  	/*
>  	 * On Gen2 use the alpha channel (extended to 8 bits) when available or
>  	 * a fixed alpha value set through the V4L2_CID_ALPHA_COMPONENT control
> @@ -188,11 +172,35 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
>  	 * contains an alpha channel. On Gen2 the global alpha is ignored in
>  	 * that case.
>  	 *
> -	 * In all cases, disable color keying.
> +	 * In all the above cases, disable color keying.
> +	 *
> +	 * VSPX wants alpha_sel to be set to 0.
>  	 */
> -	vsp1_rpf_write(rpf, dlb, VI6_RPF_ALPH_SEL, VI6_RPF_ALPH_SEL_AEXT_EXT |
> -		       (fmtinfo->alpha ? VI6_RPF_ALPH_SEL_ASEL_PACKED
> -				       : VI6_RPF_ALPH_SEL_ASEL_FIXED));
> +	alpha_sel = pipe->iif ? 0
> +			      : VI6_RPF_ALPH_SEL_AEXT_EXT
> +				| (fmtinfo->alpha ? VI6_RPF_ALPH_SEL_ASEL_PACKED
> +						  : VI6_RPF_ALPH_SEL_ASEL_FIXED);

	alpha_sel = pipe->iif ? 0
		  : VI6_RPF_ALPH_SEL_AEXT_EXT |
		    (fmtinfo->alpha ? VI6_RPF_ALPH_SEL_ASEL_PACKED
				    : VI6_RPF_ALPH_SEL_ASEL_FIXED);

or

	if (!pipe->iif)
		alpha_sel |= VI6_RPF_ALPH_SEL_AEXT_EXT
			  |  (fmtinfo->alpha ? VI6_RPF_ALPH_SEL_ASEL_PACKED
					     : VI6_RPF_ALPH_SEL_ASEL_FIXED);

as alpha_sel is initialized to 0 when declared.

> +	vsp1_rpf_write(rpf, dlb, VI6_RPF_ALPH_SEL, alpha_sel);
> +
> +	if (pipe->iif)
> +		return;

This becomes confusing, as you move the output location configuration in
the middle of the alpha handling block which is described by the big
comment above.

One option is to move the "output location" section after the whole
alpha handling (to the very end of this function). Another option is to
add

	if (pipe->iif) {
		vsp1_rpf_write(rpf, dlb, VI6_RPF_ALPH_SEL, 0);
		return;
	}

just above the "output location" section. That would avoid quite a few
changes from this patch.

> +
> +	/* Output location. */
> +	if (pipe->brx) {
> +		const struct v4l2_rect *compose;
> +
> +		compose = v4l2_subdev_state_get_compose(pipe->brx->state,
> +							rpf->brx_input);
> +		left = compose->left;
> +		top = compose->top;
> +	}
> +
> +	if (pipe->interlaced)
> +		top /= 2;
> +	vsp1_rpf_write(rpf, dlb, VI6_RPF_LOC,
> +		       (left << VI6_RPF_LOC_HCOORD_SHIFT) |
> +		       (top << VI6_RPF_LOC_VCOORD_SHIFT));
> +
>  
>  	if (entity->vsp1->info->gen >= 3) {
>  		u32 mult;
> @@ -338,11 +346,15 @@ static void rpf_configure_partition(struct vsp1_entity *entity,
>  	 */
>  	if (pipe->interlaced) {
>  		vsp1_rpf_configure_autofld(rpf, dl);
> -	} else {
> -		vsp1_rpf_write(rpf, dlb, VI6_RPF_SRCM_ADDR_Y, mem.addr[0]);
> -		vsp1_rpf_write(rpf, dlb, VI6_RPF_SRCM_ADDR_C0, mem.addr[1]);
> -		vsp1_rpf_write(rpf, dlb, VI6_RPF_SRCM_ADDR_C1, mem.addr[2]);
> +		return;
>  	}
> +
> +	vsp1_rpf_write(rpf, dlb, VI6_RPF_SRCM_ADDR_Y, mem.addr[0]);
> +	if (!mem.addr[1])
> +		return;
> +
> +	vsp1_rpf_write(rpf, dlb, VI6_RPF_SRCM_ADDR_C0, mem.addr[1]);
> +	vsp1_rpf_write(rpf, dlb, VI6_RPF_SRCM_ADDR_C1, mem.addr[2]);
>  }
>  
>  static void rpf_partition(struct vsp1_entity *entity,
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> index 93a663f58a5930a3c7c40a96a30888d0b8ccb2ed..736f76389e07a7cc28ba098a0a0bdf350a0794f7 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> @@ -248,8 +248,11 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
>  	sink_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
>  	source_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SOURCE);
>  
> -	/* Format */
> -	if (!pipe->lif || wpf->writeback) {
> +	/*
> +	 * Format configuration. Skip for IIF (VSPX) or if the pipe doesn't have
> +	 * an active output.

s/active output/active memory output/

or maybe better

"if the pipe doesn't write to memory."

> +	 */
> +	if (!pipe->iif && (!pipe->lif || wpf->writeback)) {
>  		const struct v4l2_pix_format_mplane *format = &wpf->format;
>  		const struct vsp1_format_info *fmtinfo = wpf->fmtinfo;
>  
> @@ -292,7 +295,7 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
>  	 * Sources. If the pipeline has a single input and BRx is not used,
>  	 * configure it as the master layer. Otherwise configure all
>  	 * inputs as sub-layers and select the virtual RPF as the master
> -	 * layer.
> +	 * layer. For VSPX configure the enabled sources as masters.
>  	 */
>  	for (i = 0; i < vsp1->info->rpf_count; ++i) {
>  		struct vsp1_rwpf *input = pipe->inputs[i];
> @@ -300,7 +303,11 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
>  		if (!input)
>  			continue;
>  
> -		srcrpf |= (!pipe->brx && pipe->num_inputs == 1)
> +		/* For VSPX we enable and use RPF0 only for now. */
> +		if (pipe->iif && i > 0)
> +			break;

Is this needed ? I don't expect the pipeline to have more than one input
(for now) on the VSPX, so the continue statement above should take care
of this already.

> +
> +		srcrpf |= (pipe->iif || (!pipe->brx && pipe->num_inputs == 1))
>  			? VI6_WPF_SRCRPF_RPF_ACT_MST(input->entity.index)
>  			: VI6_WPF_SRCRPF_RPF_ACT_SUB(input->entity.index);
>  	}
> @@ -317,6 +324,9 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
>  	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_STA(index), 0);
>  	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_ENB(index), irqmask);
>  
> +	if (pipe->iif)
> +		return;
> +
>  	/*
>  	 * Configure writeback for display pipelines (the wpf writeback flag is
>  	 * never set for memory-to-memory pipelines). Start by adding a chained

-- 
Regards,

Laurent Pinchart

