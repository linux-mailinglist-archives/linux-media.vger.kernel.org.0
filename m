Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6FA44C675
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 18:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232426AbhKJRv4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 12:51:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232667AbhKJRve (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 12:51:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AD83C061228;
        Wed, 10 Nov 2021 09:48:27 -0800 (PST)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91F798BB;
        Wed, 10 Nov 2021 18:48:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636566505;
        bh=BaOefk5oOikAU5Ua5RacIBzIeC33++qlAxEYBwnGoK0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=orM8PM+LL+KblkYev9hisy8IHGssYI5tKj4goHCsoUBBlEDgkdPr+jJuXuNBI1zc4
         SUiT5nbarjG1QX5/WXDTPalV2gevVPb2rk69SQ1kXvphTkEBeBJurBV7vpxO3wLTUT
         yFFhJGN4vXk+9HEkylGwo3f/LY4NUwNbFqFqLOJk=
Date:   Wed, 10 Nov 2021 19:48:05 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] media: rcar-vin: Refactor link notify
Message-ID: <YYwF1dg1/2b68rgH@pendragon.ideasonboard.com>
References: <20211020200225.1956048-1-niklas.soderlund+renesas@ragnatech.se>
 <20211020200225.1956048-2-niklas.soderlund+renesas@ragnatech.se>
 <20211104163654.fjjcpmj2gnt5aaul@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211104163654.fjjcpmj2gnt5aaul@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 04, 2021 at 05:36:54PM +0100, Jacopo Mondi wrote:
> On Wed, Oct 20, 2021 at 10:02:23PM +0200, Niklas Söderlund wrote:
> > The code have grown organically and a lot of checks are preformed for
> 
> code -> has
> preformed -> performed
> 
> > the CSI-2 use-case even if the link notify is for a subdevice connected
> > to the parallel interface.
> >
> > Before reworking the CSI-2 routing logic split the CSI-2 and parallel
> > link notify code in two separate blocks to make it clearer. There is no
> > functional change.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-core.c | 87 +++++++++++----------
> >  1 file changed, 45 insertions(+), 42 deletions(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> > index 1d92cc8ede8f8a3e..bd960c348ba5228c 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > @@ -795,12 +795,10 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
> >  {
> >  	struct rvin_group *group = container_of(link->graph_obj.mdev,
> >  						struct rvin_group, mdev);
> > -	unsigned int master_id, channel, mask_new, i;
> > -	unsigned int mask = ~0;
> >  	struct media_entity *entity;
> >  	struct video_device *vdev;
> > -	struct media_pad *csi_pad;
> > -	struct rvin_dev *vin = NULL;
> > +	struct rvin_dev *vin;
> > +	unsigned int i;
> >  	int csi_id, ret;
> >
> >  	ret = v4l2_pipeline_link_notify(link, flags, notification);
> > @@ -826,33 +824,9 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
> >  	/* Find the master VIN that controls the routes. */
> >  	vdev = media_entity_to_video_device(link->sink->entity);
> >  	vin = container_of(vdev, struct rvin_dev, vdev);
> > -	master_id = rvin_group_id_to_master(vin->id);
> >
> > -	if (WARN_ON(!group->vin[master_id])) {
> > -		ret = -ENODEV;
> > -		goto out;
> > -	}
> >
> > -	/* Build a mask for already enabled links. */
> > -	for (i = master_id; i < master_id + 4; i++) {
> > -		if (!group->vin[i])
> > -			continue;
> > -
> > -		/* Get remote CSI-2, if any. */
> > -		csi_pad = media_entity_remote_pad(
> > -				&group->vin[i]->vdev.entity.pads[0]);
> > -		if (!csi_pad)
> > -			continue;
> > -
> > -		csi_id = rvin_group_entity_to_remote_id(group, csi_pad->entity);
> > -		channel = rvin_group_csi_pad_to_channel(csi_pad->index);
> > -
> > -		mask &= rvin_csi2_get_mask(group->vin[i], csi_id, channel);
> > -	}
> > -
> 
> There are now two empty lines here
> 
> > -	/* Add the new link to the existing mask and check if it works. */
> >  	csi_id = rvin_group_entity_to_remote_id(group, link->source->entity);
> > -
> >  	if (csi_id == -ENODEV) {
> >  		struct v4l2_subdev *sd;
> >
> > @@ -877,25 +851,54 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
> >  		vin_err(vin, "Subdevice %s not registered to any VIN\n",
> >  			link->source->entity->name);
> >  		ret = -ENODEV;
> > -		goto out;
> > -	}
> > +	} else {
> 
> I wonder if the group mutex should be locked in the else branch only
> and simplify the whole thing as:

Isn't the lock required to call rvin_group_entity_to_remote_id() ? I
think the two lines before:

	vdev = media_entity_to_video_device(link->sink->entity);
	vin = container_of(vdev, struct rvin_dev, vdev);

could however be moved before mutex_lock().

>         if (csi_id == -ENODEV) {
>                 /* subdev is parallel. */
>                 for () {

Unless I'm mistaken, this needs locking in order to access group->vin[]
safely.

>                         return 0;
>                 }
> 
>                 return -ENODEV;
>         }
> 
>         /* subdev is CSI-2 */
>         mutex_lock(group->mutex);
> 
>         ...
> 
>         mutex_unlock(group->mutex);
> 
> Even if I see above:
> 
> 	/*
> 	 * Don't allow link changes if any stream in the graph is active as
> 	 * modifying the CHSEL register fields can disrupt running streams.
> 	 */
> 	media_device_for_each_entity(entity, &group->mdev) {
> 		struct media_pad *iter;
> 
> 		media_entity_for_each_pad(entity, iter) {
> 			if (iter->stream_count)
> 				return -EBUSY;
> 		}
> 	}
> 
> Being run out of the critical session, but that was already the case.
> 
> 
> 
> > +		unsigned int master_id, channel, mask_new;
> > +		unsigned int mask = ~0;
> > +		struct media_pad *csi_pad;
> >
> > -	channel = rvin_group_csi_pad_to_channel(link->source->index);
> > -	mask_new = mask & rvin_csi2_get_mask(vin, csi_id, channel);
> > -	vin_dbg(vin, "Try link change mask: 0x%x new: 0x%x\n", mask, mask_new);
> > +		master_id = rvin_group_id_to_master(vin->id);
> >
> > -	if (!mask_new) {
> > -		ret = -EMLINK;
> > -		goto out;
> > -	}
> > +		if (WARN_ON(!group->vin[master_id])) {
> > +			ret = -ENODEV;
> > +			goto out;
> > +		}
> > +
> > +		/* Build a mask for already enabled links. */
> > +		for (i = master_id; i < master_id + 4; i++) {
> > +			if (!group->vin[i])
> > +				continue;
> > +
> > +			/* Get remote CSI-2, if any. */
> > +			csi_pad = media_entity_remote_pad(
> > +					&group->vin[i]->vdev.entity.pads[0]);
> > +			if (!csi_pad)
> > +				continue;
> >
> > -	/* New valid CHSEL found, set the new value. */
> > -	ret = rvin_set_channel_routing(group->vin[master_id], __ffs(mask_new));
> > -	if (ret)
> > -		goto out;
> > +			csi_id = rvin_group_entity_to_remote_id(group,
> > +								csi_pad->entity);
> > +			channel = rvin_group_csi_pad_to_channel(csi_pad->index);
> >
> > -	vin->is_csi = true;
> > +			mask &= rvin_csi2_get_mask(group->vin[i], csi_id, channel);
> > +		}
> >
> > +		channel = rvin_group_csi_pad_to_channel(link->source->index);
> > +		mask_new = mask & rvin_csi2_get_mask(vin, csi_id, channel);
> > +		vin_dbg(vin, "Try link change mask: 0x%x new: 0x%x\n", mask,
> > +			mask_new);
> > +
> > +		if (!mask_new) {
> > +			ret = -EMLINK;
> > +			goto out;
> > +		}
> > +
> > +		/* New valid CHSEL found, set the new value. */
> > +		ret = rvin_set_channel_routing(group->vin[master_id],
> > +					       __ffs(mask_new));
> > +		if (ret)
> > +			goto out;
> > +
> > +		vin->is_csi = true;

I'm tempted to factor code out to two functions for the parallel and
CSI-2 case, but it could be done later too.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > +	}
> >  out:
> >  	mutex_unlock(&group->lock);
> >

-- 
Regards,

Laurent Pinchart
