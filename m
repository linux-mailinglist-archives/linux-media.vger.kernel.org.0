Return-Path: <linux-media+bounces-28563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2812A6BA50
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 13:10:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 560424A05C8
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 12:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7AA22540A;
	Fri, 21 Mar 2025 12:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fbLF7nzG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B082433F6;
	Fri, 21 Mar 2025 12:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742559008; cv=none; b=gea6gC570qMTOBSy/gZwx8yXlkkphn4klMFi4xgcZksB4v1E1KiDOCpeb/xIurg02PMf78XwyNWhVJ3sg/B77knbVdHatBQ6A05G9jgCKlcBbKzenQMbaBjXwryTUEPIgHLczdx12h2iMWoDTG81AlUAAoXLCNJzA+3rgVXyxS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742559008; c=relaxed/simple;
	bh=0LhL/0j4q3h3UbTTetrAOm2wSUEsW45mZFCwnDtwtoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shwwMBcDUwZebh8wwwPBnYDNLTtUvPmC0cQ5FgYJqsoRXi7zhixP+MTBxIIG1rzUISHUDTcM/S9pd6OzdoquxShj85JK2jF2lgw5Ygt0TedpKwS6MuEmVuD5HruI1XkTFy2+ePgtT7ZCIdmCp4keTFy8mQV0EeVJ0vI0IehK/ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fbLF7nzG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [157.231.223.213])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BAFA220;
	Fri, 21 Mar 2025 13:08:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742558900;
	bh=0LhL/0j4q3h3UbTTetrAOm2wSUEsW45mZFCwnDtwtoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fbLF7nzG2WVmDR2WQ1S05WwbjQKPBFY+KsCNu9aCUsSIzGkoR2YtF7dWs0wATdmf7
	 QRHJpGY+BLYSTbJMmB2JvdIrZ1WL3rOOVdzWpUyn8nkAUF/H4VWsq1J0hzgVh55qG5
	 fVXhnBjmI2RD6oKr3qAbuS9h3487vklVax0WpRXY=
Date: Fri, 21 Mar 2025 14:09:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v5 6/7] media: vsp1: rwpf: Support operations with IIF
Message-ID: <20250321120942.GB1752@pendragon.ideasonboard.com>
References: <20250319-v4h-iif-v5-0-0a10456d792c@ideasonboard.com>
 <20250319-v4h-iif-v5-6-0a10456d792c@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250319-v4h-iif-v5-6-0a10456d792c@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Wed, Mar 19, 2025 at 12:28:19PM +0100, Jacopo Mondi wrote:
> When the RPF/WPF units are used for ISP interfacing through
> the IIF, the set of accessible registers is limited compared to
> the regular VSPD operations.
> 
> Support ISP interfacing in the rpf and wpf entities by checking if
> the pipe features an IIF instance and writing only the relevant
> registers.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_rpf.c | 11 +++++++++--
>  drivers/media/platform/renesas/vsp1/vsp1_wpf.c | 14 ++++++++++----
>  2 files changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> index 056491286577cc8e9e7a6bd096f1107da6009ea7..4e960fc910c16600b875286c2efec558ebdc1ee7 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> @@ -84,7 +84,7 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
>  	sink_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
>  	source_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SOURCE);
>  
> -	infmt = VI6_RPF_INFMT_CIPM
> +	infmt = (pipe->iif ? 0 : VI6_RPF_INFMT_CIPM)
>  	      | (fmtinfo->hwfmt << VI6_RPF_INFMT_RDFMT_SHIFT);
>  
>  	if (fmtinfo->swap_yc)
> @@ -98,7 +98,7 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
>  	vsp1_rpf_write(rpf, dlb, VI6_RPF_INFMT, infmt);
>  	vsp1_rpf_write(rpf, dlb, VI6_RPF_DSWAP, fmtinfo->swap);
>  
> -	if (entity->vsp1->info->gen == 4) {
> +	if (entity->vsp1->info->gen == 4 && !pipe->iif) {

I think this can be dropped, because ...

>  		u32 ext_infmt0;
>  		u32 ext_infmt1;
>  		u32 ext_infmt2;
> @@ -163,6 +163,13 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
>  	if (pipe->interlaced)
>  		top /= 2;
>  
> +	/* No further configuration for VSPX. */
> +	if (pipe->iif) {
> +		/* VSPX wants alpha_sel to be set to 0. */
> +		vsp1_rpf_write(rpf, dlb, VI6_RPF_ALPH_SEL, 0);
> +		return;
> +	}
> +

This block can be moved right after DSWAP. I can handle this when
applying the series if there's no need to resend for other reasons (I
would appreciate the change being tested first though).

>  	vsp1_rpf_write(rpf, dlb, VI6_RPF_LOC,
>  		       (left << VI6_RPF_LOC_HCOORD_SHIFT) |
>  		       (top << VI6_RPF_LOC_VCOORD_SHIFT));
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> index a32e4b3527db41e7fac859ad8e13670141c1ef04..fafef9eeb3f898b774287d615bb4a99fed0b4cfe 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> @@ -247,8 +247,11 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
>  	sink_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
>  	source_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SOURCE);
>  
> -	/* Format */
> -	if (!pipe->lif || wpf->writeback) {
> +	/*
> +	 * Format configuration. Skip for IIF (VSPX) or if the pipe doesn't
> +	 * write to memory.
> +	 */
> +	if (!pipe->iif && (!pipe->lif || wpf->writeback)) {
>  		const struct v4l2_pix_format_mplane *format = &wpf->format;
>  		const struct vsp1_format_info *fmtinfo = wpf->fmtinfo;
>  
> @@ -291,7 +294,7 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
>  	 * Sources. If the pipeline has a single input and BRx is not used,
>  	 * configure it as the master layer. Otherwise configure all
>  	 * inputs as sub-layers and select the virtual RPF as the master
> -	 * layer.
> +	 * layer. For VSPX configure the enabled sources as masters.
>  	 */
>  	for (i = 0; i < vsp1->info->rpf_count; ++i) {
>  		struct vsp1_rwpf *input = pipe->inputs[i];
> @@ -299,7 +302,7 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
>  		if (!input)
>  			continue;
>  
> -		srcrpf |= (!pipe->brx && pipe->num_inputs == 1)
> +		srcrpf |= (pipe->iif || (!pipe->brx && pipe->num_inputs == 1))
>  			? VI6_WPF_SRCRPF_RPF_ACT_MST(input->entity.index)
>  			: VI6_WPF_SRCRPF_RPF_ACT_SUB(input->entity.index);
>  	}
> @@ -316,6 +319,9 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
>  	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_ENB(index),
>  			   VI6_WPF_IRQ_ENB_DFEE);
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

