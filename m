Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01F95554757
	for <lists+linux-media@lfdr.de>; Wed, 22 Jun 2022 14:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352939AbiFVJWn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jun 2022 05:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352467AbiFVJWm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jun 2022 05:22:42 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 891E435261
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 02:22:41 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 4605FFF807;
        Wed, 22 Jun 2022 09:22:32 +0000 (UTC)
Date:   Wed, 22 Jun 2022 11:22:31 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, paul.elder@ideasonboard.com
Subject: Re: [PATCH 1/2] media: media-entity.h: Add iterator for entity data
 links
Message-ID: <20220622092231.2dwa6besmff6732x@uno.localdomain>
References: <20220621163457.766496-1-djrscally@gmail.com>
 <20220621163457.766496-2-djrscally@gmail.com>
 <20220622090859.xdmi5aldtqihgjve@uno.localdomain>
 <YrLeRGSUZ9dnCM1v@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YrLeRGSUZ9dnCM1v@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hi Laurent,

On Wed, Jun 22, 2022 at 12:17:56PM +0300, Laurent Pinchart wrote:
> On Wed, Jun 22, 2022 at 11:08:59AM +0200, Jacopo Mondi wrote:
> > Hi Dan
> >
> > On Tue, Jun 21, 2022 at 05:34:56PM +0100, Daniel Scally wrote:
> > > Iterating over the links for an entity is a somewhat common need
> > > through the media subsystem, but generally the assumption is that
> > > they will all be data links. To meet that assumption add a new macro
> > > that iterates through an entity's links and skips non-data links.
> >
> > Do you foresee usages of a similar iterator but for ancillary (or
> > interface) links ?
> >
> > In that case you could add a 'link_type' flag to
> > __media_entity_next_data_link
> >
> > >
> > > Signed-off-by: Daniel Scally <djrscally@gmail.com>
> > > ---
> > >  include/media/media-entity.h | 26 ++++++++++++++++++++++++++
> > >  1 file changed, 26 insertions(+)
> > >
> > > diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> > > index a9a1c0ec5d1c..b13f67f33508 100644
> > > --- a/include/media/media-entity.h
> > > +++ b/include/media/media-entity.h
> > > @@ -550,6 +550,32 @@ static inline bool media_entity_enum_intersects(
> > >  				 min(ent_enum1->idx_max, ent_enum2->idx_max));
> > >  }
> > >
> > > +static inline struct media_link *
> >
> > Isn't this a bit too much for inlining ? Also I heard many times that
> > it's not worth anymore trying to outsmart the compiler and inline is
> > discouraged in most cases ? (and it kind of makes sense to me, but I
> > sometimes wonder if that's some form of cargo cult..)
>
> That's right, but in .h files you need to manually inline, otherwise
> you'll end up with one copy per compilation unit.
>

I was suggesting to move it to a .c file in facts, likely mc-entity.c
