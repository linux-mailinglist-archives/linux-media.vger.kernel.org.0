Return-Path: <linux-media+bounces-13691-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F6A90EB27
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 14:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74AEFB23A16
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 12:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E43214291E;
	Wed, 19 Jun 2024 12:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rodi/qzm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BF881737;
	Wed, 19 Jun 2024 12:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718800324; cv=none; b=RNMpLnO3lLKC6vY2yzNo87YtOre1BRW0RVWRguaPb6NW50cKm9NQy0BQh74hn4z2IJ2qR6VEUHjzdmShIlOVpjkTVtUEO1DjwJEq0UHYgkjjXQjkVAXRrDADF5wjzaGvvw3qM4iEqe2MFG+T7BsPq4Cdj6B6fo3m04aKA4ZO7f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718800324; c=relaxed/simple;
	bh=QRrOp+Vau6wu0t1fLIbTXgRzJn8k+2sXjvkyAztT+qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMqawfmEljhzwMpLQ1I8WFZFSvqRiLLgXK40iU6mnFE48DLsd9aPsN933bHvDtAF/+F0DhDD234dw1MX5pz7Ucqf233AFLeOXMaVHa9QqHG9F9pRb1omZym7oPHrLUlOGWy6toJoEGfm4BicWeVpGFkpYeS/CUpFv+AWmZAXV1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rodi/qzm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09F4C541;
	Wed, 19 Jun 2024 14:31:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718800302;
	bh=QRrOp+Vau6wu0t1fLIbTXgRzJn8k+2sXjvkyAztT+qo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rodi/qzmHOSX/s7siMI7A+WuySrTxw+tZEYq+JnX/znKu6vPvEV4HmRn5BxRxeCzw
	 98a7WvMzng0+OGovPTj3b797cA2ddPlZ0UIDXjYcog+2KC+LDi+QU6Hz8oDUowG1y4
	 wwCd/g6NKbPhDQwlyzrFafkMWQ8xwYbQwecNNQv8=
Date: Wed, 19 Jun 2024 15:31:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 12/19] media: renesas: vsp1: Keep the DRM pipeline
 entities sorted
Message-ID: <20240619123138.GA3125@pendragon.ideasonboard.com>
References: <20240619001722.9749-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240619001722.9749-13-laurent.pinchart+renesas@ideasonboard.com>
 <171879964925.2248009.4044816953897425991@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171879964925.2248009.4044816953897425991@ping.linuxembedded.co.uk>

On Wed, Jun 19, 2024 at 01:20:49PM +0100, Kieran Bingham wrote:
> Quoting Laurent Pinchart (2024-06-19 01:17:15)
> > Some of the code that handles pipeline configuration assumes that
> > entities in a pipeline's entities list are sorted from sink to source.
> > To prepare for using that code with the DRM pipeline, insert the BRx
> > just before the WPF, and the RPFs at the head of the list.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/media/platform/renesas/vsp1/vsp1_drm.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > index 1aa59a74672f..e44359b661b6 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > @@ -317,7 +317,10 @@ static int vsp1_du_pipeline_setup_brx(struct vsp1_device *vsp1,
> >                         list_add_tail(&released_brx->list_pipe,
> >                                       &pipe->entities);
> >  
> > -               /* Add the BRx to the pipeline. */
> > +               /*
> > +                * Add the BRx to the pipeline, inserting it just before the
> > +                * WPF.
> 
> So - the pipe->output is from what I recall/can see the output wpf.
>  (struct vsp1_rwpf *output)
> 
> > +                */
> >                 dev_dbg(vsp1->dev, "%s: pipe %u: acquired %s\n",
> >                         __func__, pipe->lif->index, BRX_NAME(brx));
> >  
> > @@ -326,7 +329,8 @@ static int vsp1_du_pipeline_setup_brx(struct vsp1_device *vsp1,
> >                 pipe->brx->sink = &pipe->output->entity;
> >                 pipe->brx->sink_pad = 0;
> >  
> > -               list_add_tail(&pipe->brx->list_pipe, &pipe->entities);
> > +               list_add_tail(&pipe->brx->list_pipe,
> > +                             &pipe->output->entity.list_pipe);
> 
> But this reads to me as if we're adding the brx after ('the tail') of
> the output WPF....
> 
> Now ... of course if we open up list_add_tail()
> 
>  * Insert a new entry before the specified head.
> 
> And that checks out - because of course the list_add adds it as the
> 'next' item in the list... and we're using list_add_tail as a convenient
> way to provide list_add_before() ...
> 
> So I believe this is correct, but the nuance of it reads back to front to me.
> 
> Because of that it possibly deserves a better comment to be explicit on
> what it's doing, or makes me wonder if list.h should have something that
> explicitly impliments
> 
> #define list_add_before list_add_tail

https://lore.kernel.org/all/alpine.LSU.2.11.1406061242370.16010@eggly.anvils/

I'll let you argue :-)

> but otherwise - it does check out.
> 
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> >         }
> >  
> >         /*
> > @@ -420,7 +424,7 @@ static int vsp1_du_pipeline_setup_inputs(struct vsp1_device *vsp1,
> >  
> >                 if (!rpf->entity.pipe) {
> >                         rpf->entity.pipe = pipe;
> > -                       list_add_tail(&rpf->entity.list_pipe, &pipe->entities);
> > +                       list_add(&rpf->entity.list_pipe, &pipe->entities);
> >                 }
> >  
> >                 brx->inputs[i].rpf = rpf;

-- 
Regards,

Laurent Pinchart

