Return-Path: <linux-media+bounces-25258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EADA1B1F7
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 09:54:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62E477A58E8
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 08:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35902219A76;
	Fri, 24 Jan 2025 08:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Pj1SzEIO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0392C205AC5;
	Fri, 24 Jan 2025 08:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737708836; cv=none; b=XvHICGNTcPOedME5Pb7WZbemXfIrNTZ4eU5OR208lHcedaXbK+DWBxo1wUofyTkE8rs9dKbclDkejl7hLwtx34S9Sav1YP3Nr18KYtx0k5hQsOksm+eHobVMSO2zPDy0ElovM9M4nCfQdl1W36c3t8JuHUUVqmoMpU7iUSukKgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737708836; c=relaxed/simple;
	bh=a7YR5HTjak9ilkwwoeeNNVdgfearYTpmv/EMXtNGWe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4gFjEsBwlWOIqw3CjT+OtAKs4q6W8UGPDlXlz8h0nDGgyw3fGWYFMPGgKmG1a4mSsnNajc5KeDbP4aO/hflx+CyIFIEyF4qaaN1sl5fjAD/6rhK9PDlYsGltBUPrWLbj7xMvikR1zyqx3cIxPurdbZPnuncHVbwsZi6mrb5NLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Pj1SzEIO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1BCEE514;
	Fri, 24 Jan 2025 09:52:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737708769;
	bh=a7YR5HTjak9ilkwwoeeNNVdgfearYTpmv/EMXtNGWe8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pj1SzEIOzn2XPUIGOKizKrkzSGiMIwLjLDvnetwzi2a2k2YmnHSdU6JBc3RxBvuQt
	 vk0u1A36Pz4YhuLV0Fuyw7Bq5siKDBT7AYnety4KNExCUHenkhG6euRu55E+z/CL53
	 lXJYNC8716HTu2qpxCKn6vPj4KOkhRseM/LsRMp0=
Date: Fri, 24 Jan 2025 09:53:49 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/6] media: vsp1: Enable FREE interrupt
Message-ID: <n7qgvzzq2zqjln2beqv6e4wulofhdr7a4qcyhbgt6ahk6wgpax@xlmaqmyrikfc>
References: <20250123-v4h-iif-v1-0-7b4e5299939f@ideasonboard.com>
 <20250123-v4h-iif-v1-2-7b4e5299939f@ideasonboard.com>
 <20250123213307.GB10642@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250123213307.GB10642@pendragon.ideasonboard.com>

Hi Laurent

On Thu, Jan 23, 2025 at 11:33:07PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> s/FREE/FRE/ in the subject line, as FREE stands for "FRameEnd Enable",
> so the interrupt is FRE.
>
> On Thu, Jan 23, 2025 at 06:04:03PM +0100, Jacopo Mondi wrote:
> > Enable the "FrameEnd" interrupt to support the VSPX operations.
> >
> > The frame completion interrupt signals that the transfer of
> > the config buffer and image buffer to the ISP has completed.
> >
> > Enable the interrupt source if the pipe has an IIF entity, such as
> > in the VSPX case.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > ---
> >  drivers/media/platform/renesas/vsp1/vsp1_drv.c | 3 ++-
> >  drivers/media/platform/renesas/vsp1/vsp1_wpf.c | 5 +++--
> >  2 files changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > index cbaad0ea0b73f90f3994bbdfb4304d2f71eabccd..5aa0751a896f8a58bd11128ccaa092c9596cdb5d 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > @@ -69,7 +69,8 @@ static irqreturn_t vsp1_irq_handler(int irq, void *data)
> >  				i, wpf->entity.pipe->underrun_count);
> >  		}
> >
> > -		if (status & VI6_WPF_IRQ_STA_DFE) {
> > +		if (status & VI6_WPF_IRQ_STA_DFE ||
> > +		    status & VI6_WPF_IRQ_STA_FRE) {
> >  			vsp1_pipeline_frame_end(wpf->entity.pipe);
> >  			ret = IRQ_HANDLED;
> >  		}
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> > index f176750ccd9847fdb8d51f7f51a6bd5092b70197..93a663f58a5930a3c7c40a96a30888d0b8ccb2ed 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> > @@ -239,6 +239,7 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
> >  	const struct v4l2_mbus_framefmt *source_format;
> >  	const struct v4l2_mbus_framefmt *sink_format;
> >  	unsigned int index = wpf->entity.index;
> > +	u32 irqmask = 0;
>
> No need to initialize this to 0.
>
> >  	unsigned int i;
> >  	u32 outfmt = 0;
> >  	u32 srcrpf = 0;
> > @@ -312,9 +313,9 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
> >  	vsp1_wpf_write(wpf, dlb, VI6_WPF_SRCRPF, srcrpf);
> >
> >  	/* Enable interrupts. */
> > +	irqmask = VI6_WPF_IRQ_ENB_DFEE | (pipe->iif ? VI6_WPF_IRQ_ENB_FREE : 0);
>
> Do we need te DFE interrupt for VSPX ? If both DFE and FRE fire,
> vsp1_pipeline_frame_end() will be called twice per frame, and that
> doesn't sound like what you need. If DFE is not generated, I'd rather
> not enable the interrupt, to be on the safe side.
>
> Another option, which may be better, is to use the DFE interrupt. As far
> as I understand, generation of the DFE interrupt is controlled by a bit
> in the display list. Is there a reason you can't use that and need FRE ?

Documentation mentions the FRE interrupt only for VSPX.

In example:

6. Waiting complete of one frame processing
ISP core and VSPX asserts end of frame interrupts. To notify complete
of one frame processing, wait both interrupts from ISP core and VSPX
(FRE interrupt).

in the ISP documentation and

Use frame end interrupt (VI6_WPF0_IRQ_ENB.FRE) for VSPX.

in the VSPX chapter.

I concur for VSPX I don't need DFE though. Actually, I currently get
two interrupts per transfer, I thought one was for the config DMA
buffer and one for image buffer, but it might actually be one DFE and
one FRE. I'll investigate.


>
> >  	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_STA(index), 0);
> > -	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_ENB(index),
> > -			   VI6_WPF_IRQ_ENB_DFEE);
> > +	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_ENB(index), irqmask);
> >
> >  	/*
> >  	 * Configure writeback for display pipelines (the wpf writeback flag is
> >
>
> --
> Regards,
>
> Laurent Pinchart

