Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0B455498A
	for <lists+linux-media@lfdr.de>; Wed, 22 Jun 2022 14:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357560AbiFVJSo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jun 2022 05:18:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241832AbiFVJSO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jun 2022 05:18:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D60E730F52
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 02:18:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91C32DD;
        Wed, 22 Jun 2022 11:18:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655889491;
        bh=/GJgLXkGFiSaOsJEw7CHybrO6XGDt7tZ9mKgjHYcB2c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Db8rvJd7D+ln1C5h2dvnMLqzS8hIJmxacGp5JHFUe7dPGDhwsCHDZgtwdMUjdrJAV
         RnlodB5Wtf0RIPKnSjaY+EoIIniG8QElLBg/A/eGOXZys80yEmJ/R2uLwhQRCIsdRp
         nTA7c0DRm37OE3R9XF69o1UBR2xvovWRBG7SPQYM=
Date:   Wed, 22 Jun 2022 12:17:56 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, paul.elder@ideasonboard.com
Subject: Re: [PATCH 1/2] media: media-entity.h: Add iterator for entity data
 links
Message-ID: <YrLeRGSUZ9dnCM1v@pendragon.ideasonboard.com>
References: <20220621163457.766496-1-djrscally@gmail.com>
 <20220621163457.766496-2-djrscally@gmail.com>
 <20220622090859.xdmi5aldtqihgjve@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220622090859.xdmi5aldtqihgjve@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 22, 2022 at 11:08:59AM +0200, Jacopo Mondi wrote:
> Hi Dan
> 
> On Tue, Jun 21, 2022 at 05:34:56PM +0100, Daniel Scally wrote:
> > Iterating over the links for an entity is a somewhat common need
> > through the media subsystem, but generally the assumption is that
> > they will all be data links. To meet that assumption add a new macro
> > that iterates through an entity's links and skips non-data links.
> 
> Do you foresee usages of a similar iterator but for ancillary (or
> interface) links ?
> 
> In that case you could add a 'link_type' flag to
> __media_entity_next_data_link
> 
> >
> > Signed-off-by: Daniel Scally <djrscally@gmail.com>
> > ---
> >  include/media/media-entity.h | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> > index a9a1c0ec5d1c..b13f67f33508 100644
> > --- a/include/media/media-entity.h
> > +++ b/include/media/media-entity.h
> > @@ -550,6 +550,32 @@ static inline bool media_entity_enum_intersects(
> >  				 min(ent_enum1->idx_max, ent_enum2->idx_max));
> >  }
> >
> > +static inline struct media_link *
> 
> Isn't this a bit too much for inlining ? Also I heard many times that
> it's not worth anymore trying to outsmart the compiler and inline is
> discouraged in most cases ? (and it kind of makes sense to me, but I
> sometimes wonder if that's some form of cargo cult..)

That's right, but in .h files you need to manually inline, otherwise
you'll end up with one copy per compilation unit.

> > +__media_entity_next_data_link(struct media_entity *entity,
> > +			      struct media_link *pos)
> > +{
> > +	if (!pos) {
> > +		list_for_each_entry(pos, &entity->links, list)
> 
> nit: coding style requires you to have braces
> 
> ------------------------------------------------------------------------------
> from Documentation/process/coding-style.rst:
> Also, use braces when a loop contains more than a single simple statement:
> 
> .. code-block:: c
> 
> 	while (condition) {
> 		if (test)
> 			do_something();
> 	}
> ------------------------------------------------------------------------------
> 
> > +			if ((pos->flags & MEDIA_LNK_FL_LINK_TYPE) ==
> > +			    MEDIA_LNK_FL_DATA_LINK)
> > +				return pos;
> > +
> > +		return NULL;
> > +	}
> > +
> > +	list_for_each_entry_continue(pos, &entity->links, list)
> > +		if ((pos->flags & MEDIA_LNK_FL_LINK_TYPE) ==
> > +		    MEDIA_LNK_FL_DATA_LINK)
> > +			return pos;
> > +
> > +	return NULL;
> 
> I wonder if the same could be achieved with list_for_each_entry_from() ?
> 
> 	pos = pos ? list_next_entry(pos, list)
> 		  : list_first_entry(&entity->links, typeof(*pos), list);
> 
>         list_for_each_entry_from(pos, ...) {
>                 if (...)
>                         return pos;
> 
>         }
> 
>         return NULL;

That's even better than what I've suggested.

> If I'm not mistaken the two versions are functionally equivalent..
> 
> The iterator seems a good idea. Do you plan to use it for
> "media: rkisp1: Don't create data links for non-sensor subdevs" too,
> or changing the list of subdevs to iterate is enough there ?
> 
> > +}
> > +
> > +#define for_each_media_entity_data_link(entity, pos)		\
> > +	for (pos = __media_entity_next_data_link(entity, NULL);	\
> > +	     pos;						\
> > +	     pos = __media_entity_next_data_link(entity, pos))
> > +
> >  /**
> >   * gobj_to_entity - returns the struct &media_entity pointer from the
> >   *	@gobj contained on it.

-- 
Regards,

Laurent Pinchart
