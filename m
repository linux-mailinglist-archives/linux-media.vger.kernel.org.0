Return-Path: <linux-media+bounces-20888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B56D69BC7FD
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 09:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C3F91F236FA
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 08:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2EB41CEEB4;
	Tue,  5 Nov 2024 08:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D2G7/MxM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A20F1CCED2
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 08:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730795247; cv=none; b=F12fwRi0RHQJTQJkZchxOglWrEfl68S0x59uQfPY79bGaA/WdBM5bLN3sP4IiQiKeD3s/ihtYg+p9usjAVuCRhpD6n2/+xeakOZTKRP9iuR7jAOMq9iEL6DWoHBYAfxY/PhatsgGc2h94dykeHVBS1xXsqhLqzxvlxHqbLpSll8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730795247; c=relaxed/simple;
	bh=ZXoBy5rQfvgcdWshPjfzGeRVzsJyQlCHAIWIhVHqQRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYEEiWMQ3AIsZ99wjkHENIhOj7/ia00nk5OiRgBf42LX1LPEAOSLKQqn56x+XEKAOT/lqRQPhAoMx9JBzTjtL6VcgDg6qtApcj0qneOKGD1+qTzxs5gaop70vcr3/GBBhWIk4psjnPsEfKIymcJrhdiRgbnfmHx2H+wvtRXFSBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D2G7/MxM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F73122E;
	Tue,  5 Nov 2024 09:27:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730795236;
	bh=ZXoBy5rQfvgcdWshPjfzGeRVzsJyQlCHAIWIhVHqQRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D2G7/MxMqUONHq1CxKWe2JFy+d8o12G8rWnWD53ZfyKzCDUrq3l+5qsbG7pfVfDb8
	 mqY2iI1I7u+JCts+UKpBF3HykQ3jpyystp5F2Eu3tp2GM5qb9jEvcNE4Alxbr2VIG4
	 FILvoGtJOSk56l0gIo7sjkIGdfMPqPWAj4oih7Xk=
Date: Tue, 5 Nov 2024 10:27:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/1] media: mc: Rename pad as origin in
 __media_pipeline_start()
Message-ID: <20241105082717.GF27775@pendragon.ideasonboard.com>
References: <20241105064012.500501-1-sakari.ailus@linux.intel.com>
 <20241105080307.GE27775@pendragon.ideasonboard.com>
 <ZynT8-cdKqOiQlrE@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZynT8-cdKqOiQlrE@kekkonen.localdomain>

On Tue, Nov 05, 2024 at 08:14:43AM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> Thanks for the review.
> 
> On Tue, Nov 05, 2024 at 10:03:07AM +0200, Laurent Pinchart wrote:
> > Hi Sakari,
> > 
> > Thank you for the patch.
> > 
> > On Tue, Nov 05, 2024 at 08:40:12AM +0200, Sakari Ailus wrote:
> > > Rename the pad field in __media_pipeline_start() to both better describe
> > > what it is and avoid masking it during the loop.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > > since v1:
> > > 
> > > - Also change the argument name in the prototype.
> > > 
> > >  drivers/media/mc/mc-entity.c | 8 ++++----
> > >  include/media/media-entity.h | 4 ++--
> > >  2 files changed, 6 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > > index 96dd0f6ccd0d..0df9fc90cf33 100644
> > > --- a/drivers/media/mc/mc-entity.c
> > > +++ b/drivers/media/mc/mc-entity.c
> > > @@ -768,10 +768,10 @@ static int media_pipeline_populate(struct media_pipeline *pipe,
> > >  	return ret;
> > >  }
> > >  
> > > -__must_check int __media_pipeline_start(struct media_pad *pad,
> > > +__must_check int __media_pipeline_start(struct media_pad *origin,
> > >  					struct media_pipeline *pipe)
> > >  {
> > > -	struct media_device *mdev = pad->graph_obj.mdev;
> > > +	struct media_device *mdev = origin->graph_obj.mdev;
> > >  	struct media_pipeline_pad *err_ppad;
> > >  	struct media_pipeline_pad *ppad;
> > >  	int ret;
> > > @@ -782,7 +782,7 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
> > >  	 * If the pad is already part of a pipeline, that pipeline must be the
> > >  	 * same as the pipe given to media_pipeline_start().
> > >  	 */
> > > -	if (WARN_ON(pad->pipe && pad->pipe != pipe))
> > > +	if (WARN_ON(origin->pipe && origin->pipe != pipe))
> > >  		return -EINVAL;
> > >  
> > >  	/*
> > > @@ -799,7 +799,7 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
> > >  	 * with media_pipeline_pad instances for each pad found during graph
> > >  	 * walk.
> > >  	 */
> > > -	ret = media_pipeline_populate(pipe, pad);
> > > +	ret = media_pipeline_populate(pipe, origin);
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> > > index 0393b23129eb..2fca4556c311 100644
> > > --- a/include/media/media-entity.h
> > > +++ b/include/media/media-entity.h
> > > @@ -1143,7 +1143,7 @@ struct media_entity *media_graph_walk_next(struct media_graph *graph);
> > >  
> > >  /**
> > >   * media_pipeline_start - Mark a pipeline as streaming
> > > - * @pad: Starting pad
> > > + * @origin: Starting pad
> > >   * @pipe: Media pipeline to be assigned to all pads in the pipeline.
> > >   *
> > >   * Mark all pads connected to a given pad through enabled links, either
> > 
> > s/to a given pad/to the given @starting pad/
> 
> s/to a given pad/@origin pad/
>
> ?

I meant

 * Mark all pads connected to the given @starting pad through enabled links,

> > > @@ -1155,7 +1155,7 @@ struct media_entity *media_graph_walk_next(struct media_graph *graph);
> > >   * pipeline pointer must be identical for all nested calls to
> > >   * media_pipeline_start().
> > >   */
> > > -__must_check int media_pipeline_start(struct media_pad *pad,
> > > +__must_check int media_pipeline_start(struct media_pad *origin,
> > >  				      struct media_pipeline *pipe);
> > >  /**
> > >   * __media_pipeline_start - Mark a pipeline as streaming
> > 
> > The documentation for __media_pipeline_start needs a similar update.
> 
> Too many similarly named functions. :-P
> 
> I'll address this in v3.

-- 
Regards,

Laurent Pinchart

