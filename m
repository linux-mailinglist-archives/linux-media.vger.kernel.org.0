Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F160365815
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 13:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231840AbhDTLtS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 07:49:18 -0400
Received: from mga09.intel.com ([134.134.136.24]:34518 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231837AbhDTLtF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 07:49:05 -0400
IronPort-SDR: 9e0i0mGQD85xXJsl0IAmqyLQ0mFq6HgW+UNR/UWfQDfZVLVn89K30Ausm1Pri2mvyHNDpHFm7G
 qEsCBbw4zx7g==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="195605287"
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; 
   d="scan'208";a="195605287"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 04:48:29 -0700
IronPort-SDR: xagz8tak6mPLeaVyUDhtC5h/NH8yoGu6ZjsJf/Fhx46uoPIzKLaQPqUkEZ5iJfQez/qELkKjWq
 DAURXXURWv8A==
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; 
   d="scan'208";a="445485533"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 04:48:27 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 01D01202EC;
        Tue, 20 Apr 2021 14:48:25 +0300 (EEST)
Date:   Tue, 20 Apr 2021 14:48:25 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 12/24] media: entity: Add an iterator helper for
 connected pads
Message-ID: <20210420114825.GN3@paasikivi.fi.intel.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-13-tomi.valkeinen@ideasonboard.com>
 <YHx4U8F/g8dTusc+@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YHx4U8F/g8dTusc+@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the review.

On Sun, Apr 18, 2021 at 09:20:03PM +0300, Laurent Pinchart wrote:
> Hi Tomi and Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Apr 15, 2021 at 04:04:38PM +0300, Tomi Valkeinen wrote:
> > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > 
> > Add a helper macro for iterating over pads that are connected through
> > enabled routes. This can be used to find all the connected pads within an
> > entity, for instance starting from the pad which has been obtained during
> > the graph walk.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > 
> > - Make __media_entity_next_routed_pad() return NULL and adjust the
> >   iterator to handle that
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  include/media/media-entity.h | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> > index 73de1c335e4e..edd6f60ed6b4 100644
> > --- a/include/media/media-entity.h
> > +++ b/include/media/media-entity.h
> > @@ -916,6 +916,33 @@ __must_check int media_graph_walk_init(
> >  bool media_entity_has_route(struct media_entity *entity, unsigned int pad0,
> >  			    unsigned int pad1);
> >  
> > +static inline struct media_pad *__media_entity_next_routed_pad(
> > +	struct media_pad *start, struct media_pad *iter)
> > +{
> > +	struct media_entity *entity = start->entity;
> > +
> > +	for (; iter < &entity->pads[entity->num_pads]; iter++)
> > +		if (media_entity_has_route(entity, start->index, iter->index))
> > +			return iter;
> 
> I'd use curly braces.
> 
> > +
> > +	return NULL;
> > +}
> 
> Does this need to be inlined ?

I guess it doesn't have to. It's used inside loops and it's rather small so
I think it should be fine that way.

> 
> > +
> > +/**
> > + * media_entity_for_each_routed_pad - Iterate over entity pads connected by routes
> 
> "routed" sounds a bit weird. Would media_entity_for_each_connected_pad()
> be a better name ?

"Connected" is often used in context of links. We're dealing with routes
here, so I thought "routed" is appropriate to avoid confusion.

> 
> > + *
> > + * @start: The stating pad
> 
> s/stating/starting/
> 
> > + * @iter: The iterator pad
> > + *
> > + * Iterate over all pads connected through routes from a given pad
> 
> "from the @start pad"
> 
> > + * within an entity. The iteration will include the starting pad itself.
> 
> s/starting/@start/
> 
> I wonder if it wouldn't be more logical to not include the start pad.
> That wouldn't match the current usage patterns, which would need to be
> adapted accordingly, but I'm worried that including the start pad will
> lead to annoying bugs in the future. Maybe I worry too much.

The aim here is to find all pads that are routed to another pad within the
same entity. If you remove the start pad, it becomes a task harder than
difficult.

> 
> And now that I reread the patch, I also wonder if "start" is a good
> name, as it implies we start the enumeration from a given pad, while we
> enumerate all pads connected to a given pad. I'm not sure what a better
> name would be though, maybe just pad ?

There are two pads here. Therefore explicitly calling them something else
makes sense IMO.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I agree on the comments I didn't reply to.

Thank you!

> 
> > + */
> > +#define media_entity_for_each_routed_pad(start, iter)			\
> > +	for (iter = __media_entity_next_routed_pad(			\
> > +		     start, (start)->entity->pads);			\
> > +	     iter != NULL;						\
> > +	     iter = __media_entity_next_routed_pad(start, iter + 1))
> > +
> >  /**
> >   * media_graph_walk_cleanup - Release resources used by graph walk.
> >   *
> 

-- 
Kind regards,

Sakari Ailus
