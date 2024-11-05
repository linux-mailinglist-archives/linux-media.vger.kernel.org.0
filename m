Return-Path: <linux-media+bounces-20886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 869BF9BC7CD
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 09:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37C231F212AE
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 08:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACE8200C9D;
	Tue,  5 Nov 2024 08:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kwc8E+wH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4F8200B83
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 08:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730794489; cv=none; b=tqcEDH9BD5rcS9acArO2EIYO5LX2wK2cRWnYJyK90mzca0pfcm/+8YxJaFOikxKT1wvGsikhRBC90HwIanyq80IzJbyt/jprdQCr3A6pZdTrcshTc/DjI7Fywjc0SyAejQ0lP8oMKyn8I47E83ToPgltz635erzPDlzNBqwnad4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730794489; c=relaxed/simple;
	bh=A9MnEI0235LnkicZEStfkZdJBlxIgeXIxKnttqH9KCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sB4X0eA7dw65z73Wg0jPdvA9Gg3oeMSmkbzZL6fcMUAqNxx3SoUwMViRm6F2hOiiRLznGKbOeS5shyK8Uha3wzAUZUt7YSU/6NnjQWLmhX7sd3/qPh55IVR/C0HRk8VBCwljnNFvW7JWA45AD0b0xHMGyGDWOwCPW75tynlqL8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kwc8E+wH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730794487; x=1762330487;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A9MnEI0235LnkicZEStfkZdJBlxIgeXIxKnttqH9KCc=;
  b=Kwc8E+wHN6NMhP1OBSIKwnCZwSxIqpglJ5D/UuccFsQn5RF9L4l+uyOF
   Xx3Uu3HtgAQanT4hkKrUKLFTbR7uzbrrghtMze6xZLSPhyU7oSj8EZ0ic
   u13s7mXTnz1dQ/ShRJ7GIgKzUYsqenlN782CGhvm4s//EVVo4+BVkibKe
   nTI8POx8XTT0v3mIl/Yswrh8AePWy32gQAKO4+Q8bGAW+rGskOwl8gaN6
   k22gnMnb+Q+VLfaq1+v7AH71J5w29ft/x3TF0caR0RUYq3Ob7bSUOE7Yo
   qAQYOV/SE8TvEkL6ImnsJICQajMbPE001VlyeriWWQHyDuPlPRKqAZ0tP
   A==;
X-CSE-ConnectionGUID: ND18GO4RQp6GSYjBfPcEEQ==
X-CSE-MsgGUID: K8JBuUbNTrmQ4yzN5P39xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41119303"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="41119303"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 00:14:46 -0800
X-CSE-ConnectionGUID: RFI55ndwQSGDy0voCmWZng==
X-CSE-MsgGUID: oss2UmP4RiKHC4OhQTbpJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="83446440"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 00:14:46 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A87DA11FA28;
	Tue,  5 Nov 2024 10:14:43 +0200 (EET)
Date: Tue, 5 Nov 2024 08:14:43 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/1] media: mc: Rename pad as origin in
 __media_pipeline_start()
Message-ID: <ZynT8-cdKqOiQlrE@kekkonen.localdomain>
References: <20241105064012.500501-1-sakari.ailus@linux.intel.com>
 <20241105080307.GE27775@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105080307.GE27775@pendragon.ideasonboard.com>

Hi Laurent,

Thanks for the review.

On Tue, Nov 05, 2024 at 10:03:07AM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Tue, Nov 05, 2024 at 08:40:12AM +0200, Sakari Ailus wrote:
> > Rename the pad field in __media_pipeline_start() to both better describe
> > what it is and avoid masking it during the loop.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > since v1:
> > 
> > - Also change the argument name in the prototype.
> > 
> >  drivers/media/mc/mc-entity.c | 8 ++++----
> >  include/media/media-entity.h | 4 ++--
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > index 96dd0f6ccd0d..0df9fc90cf33 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -768,10 +768,10 @@ static int media_pipeline_populate(struct media_pipeline *pipe,
> >  	return ret;
> >  }
> >  
> > -__must_check int __media_pipeline_start(struct media_pad *pad,
> > +__must_check int __media_pipeline_start(struct media_pad *origin,
> >  					struct media_pipeline *pipe)
> >  {
> > -	struct media_device *mdev = pad->graph_obj.mdev;
> > +	struct media_device *mdev = origin->graph_obj.mdev;
> >  	struct media_pipeline_pad *err_ppad;
> >  	struct media_pipeline_pad *ppad;
> >  	int ret;
> > @@ -782,7 +782,7 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
> >  	 * If the pad is already part of a pipeline, that pipeline must be the
> >  	 * same as the pipe given to media_pipeline_start().
> >  	 */
> > -	if (WARN_ON(pad->pipe && pad->pipe != pipe))
> > +	if (WARN_ON(origin->pipe && origin->pipe != pipe))
> >  		return -EINVAL;
> >  
> >  	/*
> > @@ -799,7 +799,7 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
> >  	 * with media_pipeline_pad instances for each pad found during graph
> >  	 * walk.
> >  	 */
> > -	ret = media_pipeline_populate(pipe, pad);
> > +	ret = media_pipeline_populate(pipe, origin);
> >  	if (ret)
> >  		return ret;
> >  
> > diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> > index 0393b23129eb..2fca4556c311 100644
> > --- a/include/media/media-entity.h
> > +++ b/include/media/media-entity.h
> > @@ -1143,7 +1143,7 @@ struct media_entity *media_graph_walk_next(struct media_graph *graph);
> >  
> >  /**
> >   * media_pipeline_start - Mark a pipeline as streaming
> > - * @pad: Starting pad
> > + * @origin: Starting pad
> >   * @pipe: Media pipeline to be assigned to all pads in the pipeline.
> >   *
> >   * Mark all pads connected to a given pad through enabled links, either
> 
> s/to a given pad/to the given @starting pad/

s/to a given pad/@origin pad/

?

> 
> > @@ -1155,7 +1155,7 @@ struct media_entity *media_graph_walk_next(struct media_graph *graph);
> >   * pipeline pointer must be identical for all nested calls to
> >   * media_pipeline_start().
> >   */
> > -__must_check int media_pipeline_start(struct media_pad *pad,
> > +__must_check int media_pipeline_start(struct media_pad *origin,
> >  				      struct media_pipeline *pipe);
> >  /**
> >   * __media_pipeline_start - Mark a pipeline as streaming
> 
> The documentation for __media_pipeline_start needs a similar update.

Too many similarly named functions. :-P

I'll address this in v3.

-- 
Regards,

Sakari Ailus

