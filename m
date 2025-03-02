Return-Path: <linux-media+bounces-27299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA451A4B202
	for <lists+linux-media@lfdr.de>; Sun,  2 Mar 2025 15:05:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CFCB3B238A
	for <lists+linux-media@lfdr.de>; Sun,  2 Mar 2025 14:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05DC01E7C0B;
	Sun,  2 Mar 2025 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="krIMDmk9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7131E008B;
	Sun,  2 Mar 2025 14:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740924330; cv=none; b=NqOs4DNVYqR2Luyn/Yn7Nkp2PjhkNrxz1QMSTx27EjcD+OmI9u1TBZiuzjxeZLElwb6fBwUrjRBIEwAUC0YXEYMklgK2Z9HUhubqzb05WCOB0wRJL7M5e6HcOI5BM85Ue82ln15OgmLPi7h05TEA5dCVwPnhLX+aISVCRaIwC8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740924330; c=relaxed/simple;
	bh=hw8I/WRR6FZFtRKEDJVVXsvf0y2KaAdSHISslHB68sM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r63IhsGdR8uv0+5kGZaDzp7gLE/RsdLJfRhhj8F9j23QzuMtrK7T7ALB4n/iHtp6CsrOEKeCy8JqhY+MtWou9iXkNo78GdO2zeGD2kWE9f5SdpYH+0KhveEA/Nf7Us/mfBS8BzwMJ2UaFaTIXAc6u8prJNn8AwlsMCTL/JK5uEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=krIMDmk9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0DAE2D5;
	Sun,  2 Mar 2025 15:03:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740924236;
	bh=hw8I/WRR6FZFtRKEDJVVXsvf0y2KaAdSHISslHB68sM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=krIMDmk9FqRwwpYykiRJKGSDjQR1RtGOYWBz4UloPYMN33Ve+fIdnQEaPtyWoCwqE
	 IebwpHCtJwt6Wvw0UE6a7/IVyEi5eeqT8qpaR8kXjjlP1D/f/tgHwKqb02fmNeEj3g
	 7aoqLnsdMV3Gh+WT+tZdb6UaFcioP0sMT1gKgdDY=
Date: Sun, 2 Mar 2025 16:05:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 6/6] media: vsp1: rwpf: Support operations with IIF
Message-ID: <20250302140509.GN18557@pendragon.ideasonboard.com>
References: <20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com>
 <20250224-v4h-iif-v2-6-0305e3c1fe2d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250224-v4h-iif-v2-6-0305e3c1fe2d@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Mon, Feb 24, 2025 at 09:19:46PM +0100, Jacopo Mondi wrote:
> When the RPF/WPF units are used for ISP interfacing through
> the IIF, the set of accessible registers is limited compared to
> the regular VSPD operations.
> 
> Support ISP interfacing in the rpf and wpf drivers by checking if

s/drivers/entities/ maybe

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> the pipe features an IIF instance and writing only the relevant
> registers.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_rpf.c | 11 +++++++++--
>  drivers/media/platform/renesas/vsp1/vsp1_wpf.c | 14 ++++++++++----
>  2 files changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> index e10ed836153633c4fe27224d0df39c77d4c8ab89..dae94129a105a646917353dba0181f9c93327132 100644
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
>  		u32 ext_infmt0;
>  		u32 ext_infmt1;
>  		u32 ext_infmt2;
> @@ -174,6 +174,13 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
>  		       (left << VI6_RPF_LOC_HCOORD_SHIFT) |
>  		       (top << VI6_RPF_LOC_VCOORD_SHIFT));
>  
> +	/* No further configuration for VSPX. */
> +	if (pipe->iif) {
> +		/* VSPX wants alpha_sel to be set to 0. */
> +		vsp1_rpf_write(rpf, dlb, VI6_RPF_ALPH_SEL, 0);
> +		return;
> +	}
> +
>  	/*
>  	 * On Gen2 use the alpha channel (extended to 8 bits) when available or
>  	 * a fixed alpha value set through the V4L2_CID_ALPHA_COMPONENT control
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> index f176750ccd9847fdb8d51f7f51a6bd5092b70197..88db60596f0f2f459eddbbc2ea7247620d675dd8 100644
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

