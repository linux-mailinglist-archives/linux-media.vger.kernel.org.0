Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D82544C68A
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 18:53:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232091AbhKJR4B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 12:56:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbhKJR4A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 12:56:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F5E4C061764;
        Wed, 10 Nov 2021 09:53:13 -0800 (PST)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FD798BB;
        Wed, 10 Nov 2021 18:53:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636566791;
        bh=xTfRRqY3cHc9lK2SuELErzk/Fqdc/Sl2sJFMUQMtqgQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TsJxKaxIVspQ6dKHa8VGw+14Hzfies6iJCu0vflnnVZLCig5NH0qyKT5sxHt9+br4
         kE+Rr4EmNVf798/8JzVAbmTXZzynDO9PJSMlyLUIsBA1sLoRUYlh+DDZbBt+XCQNIW
         dLNy85QPLSHasrqaSmDzzrg2PRc2zMkIjt7M5PMA=
Date:   Wed, 10 Nov 2021 19:52:51 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] media: rcar-vin: Breakout media link creation
Message-ID: <YYwG8/4qeOuV7cDG@pendragon.ideasonboard.com>
References: <20211020200225.1956048-1-niklas.soderlund+renesas@ragnatech.se>
 <20211020200225.1956048-3-niklas.soderlund+renesas@ragnatech.se>
 <20211104164306.ia33awmr5rcnnxtg@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211104164306.ia33awmr5rcnnxtg@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Thu, Nov 04, 2021 at 05:43:06PM +0100, Jacopo Mondi wrote:
> On Wed, Oct 20, 2021 at 10:02:24PM +0200, Niklas Söderlund wrote:
> > In preparation of creating more links to allow for full Virtual Channel
> > routing within the CSI-2 block break out the link creation logic to a
> > helper function as the logic will grow in future work.

Are links the right option, should we switch to subdev internal routing
configuration ?

> > There is no functional change.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-core.c | 38 ++++++++++-----------
> >  1 file changed, 18 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> > index bd960c348ba5228c..65ab66a072e9d635 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > @@ -909,6 +909,22 @@ static const struct media_device_ops rvin_csi2_media_ops = {
> >  	.link_notify = rvin_csi2_link_notify,
> >  };
> >
> > +static int rvin_csi2_add_route(struct rvin_group *group,
> 
> How about rvin_csi2_create_link() ?
>
> > +			       const struct rvin_group_route *route)
> > +
> > +{
> > +	struct media_entity *source = &group->remotes[route->csi].subdev->entity;
> > +	unsigned int source_idx = rvin_group_csi_channel_to_pad(route->channel);
> > +	struct media_entity *sink = &group->vin[route->vin]->vdev.entity;
> > +	struct media_pad *source_pad = &source->pads[source_idx];
> > +	struct media_pad *sink_pad = &sink->pads[0];
> > +
>
> And keep the comment here to re-state that if the linke existed
> already is not a fatal error
> 
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

With those comments addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > +	if (media_entity_find_link(source_pad, sink_pad))
> > +		return 0;
> > +
> > +	return media_create_pad_link(source, source_idx, sink, 0, 0);
> > +}
> > +
> >  static int rvin_csi2_setup_links(struct rvin_dev *vin)
> >  {
> >  	const struct rvin_group_route *route;
> > @@ -917,10 +933,6 @@ static int rvin_csi2_setup_links(struct rvin_dev *vin)
> >  	/* Create all media device links between VINs and CSI-2's. */
> >  	mutex_lock(&vin->group->lock);
> >  	for (route = vin->info->routes; route->mask; route++) {
> > -		struct media_pad *source_pad, *sink_pad;
> > -		struct media_entity *source, *sink;
> > -		unsigned int source_idx;
> > -
> >  		/* Check that VIN is part of the group. */
> >  		if (!vin->group->vin[route->vin])
> >  			continue;
> > @@ -933,23 +945,9 @@ static int rvin_csi2_setup_links(struct rvin_dev *vin)
> >  		if (!vin->group->remotes[route->csi].subdev)
> >  			continue;
> >
> > -		source = &vin->group->remotes[route->csi].subdev->entity;
> > -		source_idx = rvin_group_csi_channel_to_pad(route->channel);
> > -		source_pad = &source->pads[source_idx];
> > -
> > -		sink = &vin->group->vin[route->vin]->vdev.entity;
> > -		sink_pad = &sink->pads[0];
> > -
> > -		/* Skip if link already exists. */
> > -		if (media_entity_find_link(source_pad, sink_pad))
> > -			continue;
> > -
> > -		ret = media_create_pad_link(source, source_idx, sink, 0, 0);
> > -		if (ret) {
> > -			vin_err(vin, "Error adding link from %s to %s\n",
> > -				source->name, sink->name);
> > +		ret = rvin_csi2_add_route(vin->group, route);
> > +		if (ret)
> >  			break;
> > -		}
> >  	}
> >  	mutex_unlock(&vin->group->lock);
> >

-- 
Regards,

Laurent Pinchart
