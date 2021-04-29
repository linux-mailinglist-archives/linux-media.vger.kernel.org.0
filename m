Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5AE36E300
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 03:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232992AbhD2Bem (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 21:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231564AbhD2Bel (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 21:34:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4547AC06138B
        for <linux-media@vger.kernel.org>; Wed, 28 Apr 2021 18:33:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A77578E5;
        Thu, 29 Apr 2021 03:33:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619660034;
        bh=1ZFmJzHTZQgg6mNfnbenAnEXZxCFxVmVGAdxqlFng+M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AmqqCm0cvE/8J2ccsd4Duq4Q2FLYrfQokSUv1wAxu6tol5quHIyfdk1WbStIUheqU
         FZULVMd6MkE09sjNGRwd2GwKjA0J26cBwOnOlOHHCsCc3vKUdHh9fh2i3EYnopnfYf
         hUKElb/mgfj8d3hdzc8NN5Yu9HA+Gjt1ChIuVb6w=
Date:   Thu, 29 Apr 2021 04:33:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 12/24] media: entity: Add an iterator helper for
 connected pads
Message-ID: <YIoM/E938uHWMDaJ@pendragon.ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-13-tomi.valkeinen@ideasonboard.com>
 <YHx4U8F/g8dTusc+@pendragon.ideasonboard.com>
 <20210420114825.GN3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210420114825.GN3@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Tue, Apr 20, 2021 at 02:48:25PM +0300, Sakari Ailus wrote:
> On Sun, Apr 18, 2021 at 09:20:03PM +0300, Laurent Pinchart wrote:
> > On Thu, Apr 15, 2021 at 04:04:38PM +0300, Tomi Valkeinen wrote:
> > > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > 
> > > Add a helper macro for iterating over pads that are connected through
> > > enabled routes. This can be used to find all the connected pads within an
> > > entity, for instance starting from the pad which has been obtained during
> > > the graph walk.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > 
> > > - Make __media_entity_next_routed_pad() return NULL and adjust the
> > >   iterator to handle that
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  include/media/media-entity.h | 27 +++++++++++++++++++++++++++
> > >  1 file changed, 27 insertions(+)
> > > 
> > > diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> > > index 73de1c335e4e..edd6f60ed6b4 100644
> > > --- a/include/media/media-entity.h
> > > +++ b/include/media/media-entity.h
> > > @@ -916,6 +916,33 @@ __must_check int media_graph_walk_init(
> > >  bool media_entity_has_route(struct media_entity *entity, unsigned int pad0,
> > >  			    unsigned int pad1);
> > >  
> > > +static inline struct media_pad *__media_entity_next_routed_pad(
> > > +	struct media_pad *start, struct media_pad *iter)
> > > +{
> > > +	struct media_entity *entity = start->entity;
> > > +
> > > +	for (; iter < &entity->pads[entity->num_pads]; iter++)
> > > +		if (media_entity_has_route(entity, start->index, iter->index))
> > > +			return iter;
> > 
> > I'd use curly braces.
> > 
> > > +
> > > +	return NULL;
> > > +}
> > 
> > Does this need to be inlined ?
> 
> I guess it doesn't have to. It's used inside loops and it's rather small so
> I think it should be fine that way.

It may not be that small. I'd rather let the compiler decide whether to
inline it or not.

> > > +
> > > +/**
> > > + * media_entity_for_each_routed_pad - Iterate over entity pads connected by routes
> > 
> > "routed" sounds a bit weird. Would media_entity_for_each_connected_pad()
> > be a better name ?
> 
> "Connected" is often used in context of links. We're dealing with routes
> here, so I thought "routed" is appropriate to avoid confusion.

I understand the confusion, maybe we can find a better term that would
be different than "connected". "routed" really sounds weird in this
context.

> > > + *
> > > + * @start: The stating pad
> > 
> > s/stating/starting/
> > 
> > > + * @iter: The iterator pad
> > > + *
> > > + * Iterate over all pads connected through routes from a given pad
> > 
> > "from the @start pad"
> > 
> > > + * within an entity. The iteration will include the starting pad itself.
> > 
> > s/starting/@start/
> > 
> > I wonder if it wouldn't be more logical to not include the start pad.
> > That wouldn't match the current usage patterns, which would need to be
> > adapted accordingly, but I'm worried that including the start pad will
> > lead to annoying bugs in the future. Maybe I worry too much.
> 
> The aim here is to find all pads that are routed to another pad within the
> same entity. If you remove the start pad, it becomes a task harder than
> difficult.

Intuitively, "all pads that are routed to another pad" doesn't include
the "another pad". I'm not opposed to including the start pad as that's
what the current usage patterns need, but we should then rename the
macro accordingly as its current name is counter-intuitive.

> > And now that I reread the patch, I also wonder if "start" is a good
> > name, as it implies we start the enumeration from a given pad, while we
> > enumerate all pads connected to a given pad. I'm not sure what a better
> > name would be though, maybe just pad ?
> 
> There are two pads here. Therefore explicitly calling them something else
> makes sense IMO.

Makes sense, but "start" isn't a good name as we're not starting
anything.

> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> I agree on the comments I didn't reply to.
> 
> Thank you!
> 
> > > + */
> > > +#define media_entity_for_each_routed_pad(start, iter)			\
> > > +	for (iter = __media_entity_next_routed_pad(			\
> > > +		     start, (start)->entity->pads);			\
> > > +	     iter != NULL;						\
> > > +	     iter = __media_entity_next_routed_pad(start, iter + 1))
> > > +
> > >  /**
> > >   * media_graph_walk_cleanup - Release resources used by graph walk.
> > >   *

-- 
Regards,

Laurent Pinchart
