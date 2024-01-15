Return-Path: <linux-media+bounces-3694-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A5D82D7DE
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 11:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3D5DB2140C
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 10:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919EF1E86A;
	Mon, 15 Jan 2024 10:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oy0id38W"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A09818E00
	for <linux-media@vger.kernel.org>; Mon, 15 Jan 2024 10:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCC3F326;
	Mon, 15 Jan 2024 11:54:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1705316053;
	bh=9meZnGifHcGMJYs9wcV2f7CE7sIWTEN+Cy/DBglgG8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oy0id38WFDgPAILnabon6SsSnatFfvYQOB4zWl7h3VFfc4izAuMUmHG2EewncPC0i
	 4a5n1t9fCjsLmXH9qgl92NBOYm3v9y78lIdBNVqjez/0joQ+7XrvECERspn8U0c2nK
	 P8i1iXOIcUymucpSSJMMR3OZKSXftZE0qDvdIQRI=
Date: Mon, 15 Jan 2024 12:55:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Marek Vasut <marex@denx.de>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Purism Kernel Team <kernel@puri.sm>
Subject: Re: [PATCH 6/7] media: mc: Expand MUST_CONNECT flag to always
 require an enabled link
Message-ID: <20240115105525.GC5869@pendragon.ideasonboard.com>
References: <20240115103029.28055-1-laurent.pinchart@ideasonboard.com>
 <20240115103029.28055-7-laurent.pinchart@ideasonboard.com>
 <ZaUMbP8e_Ng_WxCT@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZaUMbP8e_Ng_WxCT@valkosipuli.retiisi.eu>

Hi Sakari,

On Mon, Jan 15, 2024 at 10:43:56AM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> Many thanks for working on this.

You're welcome. It was somehow fun.

> On Mon, Jan 15, 2024 at 12:30:28PM +0200, Laurent Pinchart wrote:
> > The MEDIA_PAD_FL_MUST_CONNECT flag indicates that the pad requires an
> > enabled link to stream, but only if it has any link at all. This makes
> > little sense, as if a pad is part of a pipeline, there are very few use
> > cases for an active link to be mandatory only if links exist at all. A
> > review of in-tree drivers confirms they all need an enabled link for
> > pads marked with the MEDIA_PAD_FL_MUST_CONNECT flag.
> > 
> > Expand the scope of the flag by rejecting pads that have no links at
> > all. This requires modifying the pipeline build code to add those pads
> > to the pipeline.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../media/mediactl/media-types.rst            | 11 ++--
> >  drivers/media/mc/mc-entity.c                  | 53 +++++++++++++++----
> >  2 files changed, 48 insertions(+), 16 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> > index 0ffeece1e0c8..1ce87c0b705f 100644
> > --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> > +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> > @@ -375,12 +375,11 @@ Types and flags used to represent the media graph elements
> >  	  are origins of links.
> >  
> >      *  -  ``MEDIA_PAD_FL_MUST_CONNECT``
> > -       -  If this flag is set and the pad is linked to any other pad, then
> > -	  at least one of those links must be enabled for the entity to be
> > -	  able to stream. There could be temporary reasons (e.g. device
> > -	  configuration dependent) for the pad to need enabled links even
> > -	  when this flag isn't set; the absence of the flag doesn't imply
> > -	  there is none.
> > +       -  If this flag, then at least one link connected to the pad must be
> > +          enabled for the pad to be able to stream. There could be temporary
> > +          reasons (e.g. device configuration dependent) for the pad to need
> > +          enabled links even when this flag isn't set; the absence of the flag
> > +          doesn't imply there is none.
> 
> Shoudln't you indent by tabs first here?

My text editor picked the option it liked best. I'll fix indentation to
avoid switching from tabs to spaces.

> Would it be possible to backport this, too? I'm pretty sure there will be
> NULL pointer dereferences due to this, even previous to the graph walk
> rework.

Patches 1/7 and 2/7 should be simple to backport (hopefully). Patch 3/7
should as well, which will fix the crash in the imx8-isi driver. Patches
4/7 to 6/7 may be more difficult to backport as they could generate more
conflicts, it depends how far back you want to go. That would be my
preferred option though.

> It may require reworking this to apply it to the pre-rework implementation
> and that's outside the scope of this set obviously.

The rework (v6.1) predates the imx8-isi driver (v6.4), so from an
imx8-isi point of view, we don't have to backport this earlier than
v6.4.

> For the set:
> 
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> >  One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > index 5907925ffd89..0e28b9a7936e 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -535,14 +535,15 @@ static int media_pipeline_walk_push(struct media_pipeline_walk *walk,
> >  
> >  /*
> >   * Move the top entry link cursor to the next link. If all links of the entry
> > - * have been visited, pop the entry itself.
> > + * have been visited, pop the entry itself. Return true if the entry has been
> > + * popped.
> >   */
> > -static void media_pipeline_walk_pop(struct media_pipeline_walk *walk)
> > +static bool media_pipeline_walk_pop(struct media_pipeline_walk *walk)
> >  {
> >  	struct media_pipeline_walk_entry *entry;
> >  
> >  	if (WARN_ON(walk->stack.top < 0))
> > -		return;
> > +		return false;
> >  
> >  	entry = media_pipeline_walk_top(walk);
> >  
> > @@ -552,7 +553,7 @@ static void media_pipeline_walk_pop(struct media_pipeline_walk *walk)
> >  			walk->stack.top);
> >  
> >  		walk->stack.top--;
> > -		return;
> > +		return true;
> >  	}
> >  
> >  	entry->links = entry->links->next;
> > @@ -560,6 +561,8 @@ static void media_pipeline_walk_pop(struct media_pipeline_walk *walk)
> >  	dev_dbg(walk->mdev->dev,
> >  		"media pipeline: moved entry %u to next link\n",
> >  		walk->stack.top);
> > +
> > +	return false;
> >  }
> >  
> >  /* Free all memory allocated while walking the pipeline. */
> > @@ -609,11 +612,12 @@ static int media_pipeline_explore_next_link(struct media_pipeline *pipe,
> >  	struct media_link *link;
> >  	struct media_pad *local;
> >  	struct media_pad *remote;
> > +	bool last_link;
> >  	int ret;
> >  
> >  	origin = entry->pad;
> >  	link = list_entry(entry->links, typeof(*link), list);
> > -	media_pipeline_walk_pop(walk);
> > +	last_link = media_pipeline_walk_pop(walk);
> >  
> >  	dev_dbg(walk->mdev->dev,
> >  		"media pipeline: exploring link '%s':%u -> '%s':%u\n",
> > @@ -638,7 +642,7 @@ static int media_pipeline_explore_next_link(struct media_pipeline *pipe,
> >  					   local->index)) {
> >  		dev_dbg(walk->mdev->dev,
> >  			"media pipeline: skipping link (no route)\n");
> > -		return 0;
> > +		goto done;
> >  	}
> >  
> >  	/*
> > @@ -653,13 +657,44 @@ static int media_pipeline_explore_next_link(struct media_pipeline *pipe,
> >  	if (!(link->flags & MEDIA_LNK_FL_ENABLED)) {
> >  		dev_dbg(walk->mdev->dev,
> >  			"media pipeline: skipping link (disabled)\n");
> > -		return 0;
> > +		goto done;
> >  	}
> >  
> >  	ret = media_pipeline_add_pad(pipe, walk, remote);
> >  	if (ret)
> >  		return ret;
> >  
> > +done:
> > +	/*
> > +	 * If we're done iterating over links, iterate over pads of the entity.
> > +	 * This is necessary to discover pads that are not connected with any
> > +	 * link. Those are dead ends from a pipeline exploration point of view,
> > +	 * but are still part of the pipeline and need to be added to enable
> > +	 * proper validation.
> > +	 */
> > +	if (!last_link)
> > +		return 0;
> > +
> > +	dev_dbg(walk->mdev->dev,
> > +		"media pipeline: adding unconnected pads of '%s'\n",
> > +		local->entity->name);
> > +
> > +	media_entity_for_each_pad(origin->entity, local) {
> > +		/*
> > +		 * Skip the origin pad (already handled), pad that have links
> > +		 * (already discovered through iterating over links) and pads
> > +		 * not internally connected.
> > +		 */
> > +		if (origin == local || !local->num_links ||
> > +		    !media_entity_has_pad_interdep(origin->entity, origin->index,
> > +						   local->index))
> > +			continue;
> > +
> > +		ret = media_pipeline_add_pad(pipe, walk, local);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > @@ -771,7 +806,6 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
> >  		struct media_pad *pad = ppad->pad;
> >  		struct media_entity *entity = pad->entity;
> >  		bool has_enabled_link = false;
> > -		bool has_link = false;
> >  		struct media_link *link;
> >  
> >  		dev_dbg(mdev->dev, "Validating pad '%s':%u\n", pad->entity->name,
> > @@ -801,7 +835,6 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
> >  			/* Record if the pad has links and enabled links. */
> >  			if (link->flags & MEDIA_LNK_FL_ENABLED)
> >  				has_enabled_link = true;
> > -			has_link = true;
> >  
> >  			/*
> >  			 * Validate the link if it's enabled and has the
> > @@ -839,7 +872,7 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
> >  		 * 3. If the pad has the MEDIA_PAD_FL_MUST_CONNECT flag set,
> >  		 * ensure that it has either no link or an enabled link.
> >  		 */
> > -		if ((pad->flags & MEDIA_PAD_FL_MUST_CONNECT) && has_link &&
> > +		if ((pad->flags & MEDIA_PAD_FL_MUST_CONNECT) &&
> >  		    !has_enabled_link) {
> >  			dev_dbg(mdev->dev,
> >  				"Pad '%s':%u must be connected by an enabled link\n",

-- 
Regards,

Laurent Pinchart

