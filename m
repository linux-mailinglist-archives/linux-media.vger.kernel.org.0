Return-Path: <linux-media+bounces-28582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AB4A6BECA
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 16:54:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81A4A484D3E
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 15:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AFA8225A20;
	Fri, 21 Mar 2025 15:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oaHaHYtO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE6042A94;
	Fri, 21 Mar 2025 15:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742572336; cv=none; b=rYg7drnUbPR10MiRjJTAU0zw6GDUx6K6Jl5IMNHQzHTlyLLNg53AIcSz/GVfh6UrM2KzA6FZjCmkdWKf56JQSwPv/HlHYxH6sZzy4L4N1jjLM1xcGsiM8n8O+2FpxqylkPS/ntW6gnUeZGTIyFukegYgAyW720zK1kr+g6Tcohs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742572336; c=relaxed/simple;
	bh=g1DDnj5fD1ZAtu0cPRAYle7RyFlSUuFSlUaHm4oy8gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/Ucnymkyd+VNG2RzcscQaSZIlxrNxuzil+GRKzuBCoIPAEm6k8Ddq3ynm95J+CyFaow2P9LhAL7PeNepkMyqrEYo2ZwJxdtmlZQUJs4InNteUUO1q2au8hUdJNGBld5I8k1qp9l2vU9itfE/KKl9IX5Wet69wNcsoZq3byjJTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oaHaHYtO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 459D12C5;
	Fri, 21 Mar 2025 16:50:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742572228;
	bh=g1DDnj5fD1ZAtu0cPRAYle7RyFlSUuFSlUaHm4oy8gA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oaHaHYtOo9bV4KMSNdhULofTmTKihTEM8zaKPpI4nTHirL2tIHGnXU57RNYahtVmV
	 SXh1To6IquYNipoe50Ucmnie0vNkHj9BNWksCdvhhKUMIA07QgldXZLdDr//STatzg
	 nT8oFIVvtLq3g7Ua+BGDHxqr4Re4kmMrKdT3Va/M=
Date: Fri, 21 Mar 2025 16:52:09 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v5 6/7] media: vsp1: rwpf: Support operations with IIF
Message-ID: <3yyktuikkxbj64ajc2zcq6zgclecyuvq4wdsmsyqphn3cio65a@jc3dbz62z7sr>
References: <20250319-v4h-iif-v5-0-0a10456d792c@ideasonboard.com>
 <20250319-v4h-iif-v5-6-0a10456d792c@ideasonboard.com>
 <20250321120942.GB1752@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321120942.GB1752@pendragon.ideasonboard.com>

Hi Laurent

On Fri, Mar 21, 2025 at 02:09:42PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Wed, Mar 19, 2025 at 12:28:19PM +0100, Jacopo Mondi wrote:
> > When the RPF/WPF units are used for ISP interfacing through
> > the IIF, the set of accessible registers is limited compared to
> > the regular VSPD operations.
> >
> > Support ISP interfacing in the rpf and wpf entities by checking if
> > the pipe features an IIF instance and writing only the relevant
> > registers.
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > ---
> >  drivers/media/platform/renesas/vsp1/vsp1_rpf.c | 11 +++++++++--
> >  drivers/media/platform/renesas/vsp1/vsp1_wpf.c | 14 ++++++++++----
> >  2 files changed, 19 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> > index 056491286577cc8e9e7a6bd096f1107da6009ea7..4e960fc910c16600b875286c2efec558ebdc1ee7 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> > @@ -84,7 +84,7 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
> >  	sink_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
> >  	source_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SOURCE);
> >
> > -	infmt = VI6_RPF_INFMT_CIPM
> > +	infmt = (pipe->iif ? 0 : VI6_RPF_INFMT_CIPM)
> >  	      | (fmtinfo->hwfmt << VI6_RPF_INFMT_RDFMT_SHIFT);
> >
> >  	if (fmtinfo->swap_yc)
> > @@ -98,7 +98,7 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
> >  	vsp1_rpf_write(rpf, dlb, VI6_RPF_INFMT, infmt);
> >  	vsp1_rpf_write(rpf, dlb, VI6_RPF_DSWAP, fmtinfo->swap);
> >
> > -	if (entity->vsp1->info->gen == 4) {
> > +	if (entity->vsp1->info->gen == 4 && !pipe->iif) {
>
> I think this can be dropped, because ...
>
> >  		u32 ext_infmt0;
> >  		u32 ext_infmt1;
> >  		u32 ext_infmt2;
> > @@ -163,6 +163,13 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
> >  	if (pipe->interlaced)
> >  		top /= 2;
> >
> > +	/* No further configuration for VSPX. */
> > +	if (pipe->iif) {
> > +		/* VSPX wants alpha_sel to be set to 0. */
> > +		vsp1_rpf_write(rpf, dlb, VI6_RPF_ALPH_SEL, 0);
> > +		return;
> > +	}
> > +
>
> This block can be moved right after DSWAP. I can handle this when
> applying the series if there's no need to resend for other reasons (I
> would appreciate the change being tested first though).

Indeed, this is way nicer.

I've sent v6 with the change you have suggested and re-tested it
again.

Thanks
  j

>
> >  	vsp1_rpf_write(rpf, dlb, VI6_RPF_LOC,
> >  		       (left << VI6_RPF_LOC_HCOORD_SHIFT) |
> >  		       (top << VI6_RPF_LOC_VCOORD_SHIFT));
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> > index a32e4b3527db41e7fac859ad8e13670141c1ef04..fafef9eeb3f898b774287d615bb4a99fed0b4cfe 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> > @@ -247,8 +247,11 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
> >  	sink_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
> >  	source_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SOURCE);
> >
> > -	/* Format */
> > -	if (!pipe->lif || wpf->writeback) {
> > +	/*
> > +	 * Format configuration. Skip for IIF (VSPX) or if the pipe doesn't
> > +	 * write to memory.
> > +	 */
> > +	if (!pipe->iif && (!pipe->lif || wpf->writeback)) {
> >  		const struct v4l2_pix_format_mplane *format = &wpf->format;
> >  		const struct vsp1_format_info *fmtinfo = wpf->fmtinfo;
> >
> > @@ -291,7 +294,7 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
> >  	 * Sources. If the pipeline has a single input and BRx is not used,
> >  	 * configure it as the master layer. Otherwise configure all
> >  	 * inputs as sub-layers and select the virtual RPF as the master
> > -	 * layer.
> > +	 * layer. For VSPX configure the enabled sources as masters.
> >  	 */
> >  	for (i = 0; i < vsp1->info->rpf_count; ++i) {
> >  		struct vsp1_rwpf *input = pipe->inputs[i];
> > @@ -299,7 +302,7 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
> >  		if (!input)
> >  			continue;
> >
> > -		srcrpf |= (!pipe->brx && pipe->num_inputs == 1)
> > +		srcrpf |= (pipe->iif || (!pipe->brx && pipe->num_inputs == 1))
> >  			? VI6_WPF_SRCRPF_RPF_ACT_MST(input->entity.index)
> >  			: VI6_WPF_SRCRPF_RPF_ACT_SUB(input->entity.index);
> >  	}
> > @@ -316,6 +319,9 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
> >  	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_ENB(index),
> >  			   VI6_WPF_IRQ_ENB_DFEE);
> >
> > +	if (pipe->iif)
> > +		return;
> > +
> >  	/*
> >  	 * Configure writeback for display pipelines (the wpf writeback flag is
> >  	 * never set for memory-to-memory pipelines). Start by adding a chained
>
> --
> Regards,
>
> Laurent Pinchart

