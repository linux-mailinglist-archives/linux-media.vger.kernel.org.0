Return-Path: <linux-media+bounces-20893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AAC9BC83F
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 09:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDCEC1F248A3
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 08:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E851CEE90;
	Tue,  5 Nov 2024 08:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qygz1FAf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D736B188587
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 08:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730796278; cv=none; b=akQU90qzKOR1mASqaa+F2F/3O2gmYCMvc7uNPI9zrSW0EgWA4wVCiEgKlgXiz2WNOEQ+LLOsbQkizATTnbgVuyjOA3R9WHOCbAwRoV+qvDqI1tHcCWi6BxCfSV0EHjs32ai8YwefZuDFVcsBos+4WngiuZcB2oK2TVl0M1yFJYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730796278; c=relaxed/simple;
	bh=CWr+grijAyBApD4Cw/koGw8ALYzfUcBWO6sGM+nvLZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nmUYNJ9WavMOZRAkMSeCQhe+LhqLPC+RbuS74zG5Ou2UoYul6wzXyvR5lbdlfBeJOGyuCqZBP4vO4jpxkNUnh02QY5PhWMprpO2WjedLLrw2TR/1xW4JrFAjXh5yc/AgrJT5efnrMrI9SddmIWnFUt+DAPLfqtGw1N/6u32mYPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qygz1FAf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730796276; x=1762332276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CWr+grijAyBApD4Cw/koGw8ALYzfUcBWO6sGM+nvLZQ=;
  b=Qygz1FAf53UBxyaCFNX7sH+z7gSU04I+7gxALVDRClVd3RScnYIS/9MF
   5m/DzuWDqjP834qq+YWEFJGxmL/U/yyvY4ZUUMK0RpblQgMp1466qi8N2
   Fy/+0F0immN86dtfLE3XVkeM69TYHKUcVupG3Kq2a03xmyJ0zomS7i/MM
   1QfS3kqdAQpXkuk/RQFnT1oH84K1SSZJWm7RX98GECZAIUmYN75BkioOA
   xSgrjZUW/oy4qosHupgeYudDB37/8qySb67MP7Zaq8PQxOtHiGFv4JRmV
   xywCoM+XjyKO4KT6QxX//OugRVy+5B7jAAKvh6us9jFoV1Lcy7p+vcybi
   w==;
X-CSE-ConnectionGUID: 8ACeJWvlRKa2UdRwhnjsnw==
X-CSE-MsgGUID: zbr/BIqHT1KvcwYP2jMIBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30303878"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30303878"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 00:44:35 -0800
X-CSE-ConnectionGUID: QfwOaIsER3i/MnplsfxrzA==
X-CSE-MsgGUID: P/nc+Yj/QwWSUY1F8w3c3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="114711685"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 00:44:32 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E1C2211FA28;
	Tue,  5 Nov 2024 10:44:28 +0200 (EET)
Date: Tue, 5 Nov 2024 08:44:28 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/1] media: mc: Rename pad as origin in
 __media_pipeline_start()
Message-ID: <Zyna7C3H9vR9n9cR@kekkonen.localdomain>
References: <20241105064012.500501-1-sakari.ailus@linux.intel.com>
 <20241105080307.GE27775@pendragon.ideasonboard.com>
 <ZynT8-cdKqOiQlrE@kekkonen.localdomain>
 <20241105082717.GF27775@pendragon.ideasonboard.com>
 <ZynXTPkMdLHn2PLT@kekkonen.localdomain>
 <20241105083744.GG27775@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105083744.GG27775@pendragon.ideasonboard.com>

On Tue, Nov 05, 2024 at 10:37:44AM +0200, Laurent Pinchart wrote:
> On Tue, Nov 05, 2024 at 08:29:00AM +0000, Sakari Ailus wrote:
> > On Tue, Nov 05, 2024 at 10:27:17AM +0200, Laurent Pinchart wrote:
> > > On Tue, Nov 05, 2024 at 08:14:43AM +0000, Sakari Ailus wrote:
> > > > On Tue, Nov 05, 2024 at 10:03:07AM +0200, Laurent Pinchart wrote:
> > > > > On Tue, Nov 05, 2024 at 08:40:12AM +0200, Sakari Ailus wrote:
> > > > > > Rename the pad field in __media_pipeline_start() to both better describe
> > > > > > what it is and avoid masking it during the loop.
> > > > > > 
> > > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > > ---
> > > > > > since v1:
> > > > > > 
> > > > > > - Also change the argument name in the prototype.
> > > > > > 
> > > > > >  drivers/media/mc/mc-entity.c | 8 ++++----
> > > > > >  include/media/media-entity.h | 4 ++--
> > > > > >  2 files changed, 6 insertions(+), 6 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > > > > > index 96dd0f6ccd0d..0df9fc90cf33 100644
> > > > > > --- a/drivers/media/mc/mc-entity.c
> > > > > > +++ b/drivers/media/mc/mc-entity.c
> > > > > > @@ -768,10 +768,10 @@ static int media_pipeline_populate(struct media_pipeline *pipe,
> > > > > >  	return ret;
> > > > > >  }
> > > > > >  
> > > > > > -__must_check int __media_pipeline_start(struct media_pad *pad,
> > > > > > +__must_check int __media_pipeline_start(struct media_pad *origin,
> > > > > >  					struct media_pipeline *pipe)
> > > > > >  {
> > > > > > -	struct media_device *mdev = pad->graph_obj.mdev;
> > > > > > +	struct media_device *mdev = origin->graph_obj.mdev;
> > > > > >  	struct media_pipeline_pad *err_ppad;
> > > > > >  	struct media_pipeline_pad *ppad;
> > > > > >  	int ret;
> > > > > > @@ -782,7 +782,7 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
> > > > > >  	 * If the pad is already part of a pipeline, that pipeline must be the
> > > > > >  	 * same as the pipe given to media_pipeline_start().
> > > > > >  	 */
> > > > > > -	if (WARN_ON(pad->pipe && pad->pipe != pipe))
> > > > > > +	if (WARN_ON(origin->pipe && origin->pipe != pipe))
> > > > > >  		return -EINVAL;
> > > > > >  
> > > > > >  	/*
> > > > > > @@ -799,7 +799,7 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
> > > > > >  	 * with media_pipeline_pad instances for each pad found during graph
> > > > > >  	 * walk.
> > > > > >  	 */
> > > > > > -	ret = media_pipeline_populate(pipe, pad);
> > > > > > +	ret = media_pipeline_populate(pipe, origin);
> > > > > >  	if (ret)
> > > > > >  		return ret;
> > > > > >  
> > > > > > diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> > > > > > index 0393b23129eb..2fca4556c311 100644
> > > > > > --- a/include/media/media-entity.h
> > > > > > +++ b/include/media/media-entity.h
> > > > > > @@ -1143,7 +1143,7 @@ struct media_entity *media_graph_walk_next(struct media_graph *graph);
> > > > > >  
> > > > > >  /**
> > > > > >   * media_pipeline_start - Mark a pipeline as streaming
> > > > > > - * @pad: Starting pad
> > > > > > + * @origin: Starting pad
> > > > > >   * @pipe: Media pipeline to be assigned to all pads in the pipeline.
> > > > > >   *
> > > > > >   * Mark all pads connected to a given pad through enabled links, either
> > > > > 
> > > > > s/to a given pad/to the given @starting pad/
> > > > 
> > > > s/to a given pad/@origin pad/
> > > >
> > > > ?
> > > 
> > > I meant
> > > 
> > >  * Mark all pads connected to the given @starting pad through enabled links,
> > 
> > There's no "starting" among the arguments.
> 
> Seems I need to wake up.

I thought so. ;-)

> 
>  * Mark all pads connected to the given @origin pad through enabled links,

The pad is specified here so there's no need for "the given".

> 
> > > > > > @@ -1155,7 +1155,7 @@ struct media_entity *media_graph_walk_next(struct media_graph *graph);
> > > > > >   * pipeline pointer must be identical for all nested calls to
> > > > > >   * media_pipeline_start().
> > > > > >   */
> > > > > > -__must_check int media_pipeline_start(struct media_pad *pad,
> > > > > > +__must_check int media_pipeline_start(struct media_pad *origin,
> > > > > >  				      struct media_pipeline *pipe);
> > > > > >  /**
> > > > > >   * __media_pipeline_start - Mark a pipeline as streaming
> > > > > 
> > > > > The documentation for __media_pipeline_start needs a similar update.
> > > > 
> > > > Too many similarly named functions. :-P
> > > > 
> > > > I'll address this in v3.
> 

-- 
Sakari Ailus

