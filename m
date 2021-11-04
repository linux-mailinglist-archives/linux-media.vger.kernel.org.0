Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E78A445850
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 18:28:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232116AbhKDRbY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 13:31:24 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:37463 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231709AbhKDRbY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Nov 2021 13:31:24 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 48B3F200004;
        Thu,  4 Nov 2021 17:28:41 +0000 (UTC)
Date:   Thu, 4 Nov 2021 18:29:33 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] media: rcar-{csi2,vin}: Move to full Virtual Channel
 routing per CSI-2 IP
Message-ID: <20211104172933.tsnkcrp3hf6mixy7@uno.localdomain>
References: <20211020200225.1956048-1-niklas.soderlund+renesas@ragnatech.se>
 <20211020200225.1956048-4-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211020200225.1956048-4-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Wed, Oct 20, 2021 at 10:02:25PM +0200, Niklas Söderlund wrote:
> When Gen3 support was first added to this R-Car VIN and CSI-2 driver the
> routing was centred around the CHSEL register which multiplex the

multiplexes

> different parallel buses that sits between the CSI-2 receivers source

buses -> sit

> side and the VIN dma engines. This was a bad design as the multiplexing
> do allow for only a few combinations and do not play nice with many
> video streams in the system.
>
> For example it's only possible for CSI-2 Virtual Channels 0 and 1 of any
> given CSI-2 receiver to be used together with the scaler.
>
> Later datasheets have expanded the documentation and it is now possible
> to improve on this design by allowing any Virtual Channel to be routed
> to any R-Car VIN instance, provided that there exists a parallel bus
> between them. This increases the flexibility as all Virtual Channels can
> now be used together with the scaler for example.
>
> The redesign is not however perfect. While the new design allows for
> many more routes, two constrains limit a small portion of routes that
> was possible in the old design but are no more.
>
> - It is no longer possible to route the same CSI-2 and VC to more then
>   one VIN at a time. This was theoretically possible before if the
>   specific SoC allowed for the same CSI-2 and VC to be routed to two
>   different VIN capture groups.

I think that's acceptable

>
> - It is no longer possible to simultaneously mix links from two CSI-2 IP
>   blocks to the same VIN capture group.

This one is a little bit bothering but I don't see it as a huge blocker
personally.

>
>   For example if VIN2 is capturing from CSI40 then VIN{0,1,3} must also
>   capture from CSI40. While VIN{4,5,6,7} is still free to capture from
>   any other CSI-2 IP in the system. Once all VIN{0,1,2,3} links to CSI40
>   are disabled that VIN capture group is free again to capture from any
>   other CSI-2 IP it is connected to.
>
> At the core of the redesign is greater cooperator of the R-Car VIN and
> CSI-2 drivers in configuring the routing. The VIN driver is after this
> change only responsible to configure the full VIN capture groups
> parallel buses to be to a particular CSI-2 IP. While the configuration
> of which CSI-2 Virtual Channel is outputted on which of the R-Car CSI-2
> IP output ports is handled by the CSI-2 driver.
>
> Before this change the CSI-2 Virtual Channel to output port was static
> in the CSI-2 driver and the different links only manipulated the VIN
> capture groups CHSEL register. With this change both the CHSEl register
> and the CSI-2 routing VCDT registers are modified for greater
> flexibility.
>
> This change touches both the R-Car VIN and R-Car CSI-2 drivers in the
> same commit as both drivers cooperate closely and one change without the
> other would more or less break video capture.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 318 +++++---------------
>  drivers/media/platform/rcar-vin/rcar-csi2.c |  58 +++-
>  drivers/media/platform/rcar-vin/rcar-dma.c  |   2 +-
>  drivers/media/platform/rcar-vin/rcar-vin.h  |  18 +-
>  4 files changed, 136 insertions(+), 260 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 65ab66a072e9d635..6b05ad10e8aa66f9 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -745,27 +745,6 @@ static int rvin_parallel_init(struct rvin_dev *vin)
>   * CSI-2
>   */
>
> -static unsigned int rvin_csi2_get_mask(struct rvin_dev *vin,
> -				       enum rvin_csi_id csi_id,
> -				       unsigned char channel)
> -{
> -	const struct rvin_group_route *route;
> -	unsigned int mask = 0;
> -
> -	for (route = vin->info->routes; route->mask; route++) {
> -		if (route->vin == vin->id &&
> -		    route->csi == csi_id &&
> -		    route->channel == channel) {
> -			vin_dbg(vin,
> -				"Adding route: vin: %d csi: %d channel: %d\n",
> -				route->vin, route->csi, route->channel);
> -			mask |= route->mask;
> -		}
> -	}
> -
> -	return mask;
> -}
> -
>  /*
>   * Link setup for the links between a VIN and a CSI-2 receiver is a bit
>   * complex. The reason for this is that the register controlling routing
> @@ -852,9 +831,9 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
>  			link->source->entity->name);
>  		ret = -ENODEV;
>  	} else {
> -		unsigned int master_id, channel, mask_new;
> -		unsigned int mask = ~0;
> -		struct media_pad *csi_pad;
> +		const struct rvin_group_route *route;
> +		unsigned int chsel = -1;
> +		unsigned int master_id;
>
>  		master_id = rvin_group_id_to_master(vin->id);
>
> @@ -863,8 +842,10 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
>  			goto out;
>  		}
>
> -		/* Build a mask for already enabled links. */
> +		/* Make sure group is connected to same CSI-2 */
>  		for (i = master_id; i < master_id + 4; i++) {
> +			struct media_pad *csi_pad;
> +
>  			if (!group->vin[i])
>  				continue;

Are you sure this checks for all VINs in the group to be connected to
the same CSI-2 receiver ? The loop goes one as

		/* Make sure group is connected to same CSI-2 */
		for (i = master_id; i < master_id + 4; i++) {
			struct media_pad *csi_pad;

			if (!group->vin[i])
				continue;

			/* Get remote CSI-2, if any. */
			csi_pad = media_entity_remote_pad(
					&group->vin[i]->vdev.entity.pads[0]);
			if (!csi_pad)
				continue;

			if (csi_pad->entity != link->source->entity) {
				vin_dbg(vin, "Already attached to %s\n",
					csi_pad->entity->name);
				ret = -EBUSY;
				goto out;
			}
		}

Which if I got it right verifies that entity at the other end of the
link is the same as the link's source entity, which seems to be a
tautology to me, am I wrong ?

Shouldn't you

        struct media_entity *csi2 = nullptr;
        for (i = master_id; i < master_id + 4; i++) {
                struct media_pad *csi_pad;

                if (!group->vin[i])
                        continue;

                csi_pad = media_entity_remote_pad(
                                &group->vin[i]->vdev.entity.pads[0]);

                if (!csi2) {
                        csi2 = csi_pad->entity;
                        continue;
                }

                if (csi2 != csi2_pad->entity)
                        return -EINVAL;

        }

>
> @@ -874,26 +855,24 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
>  			if (!csi_pad)
>  				continue;
>
> -			csi_id = rvin_group_entity_to_remote_id(group,
> -								csi_pad->entity);
> -			channel = rvin_group_csi_pad_to_channel(csi_pad->index);
> -
> -			mask &= rvin_csi2_get_mask(group->vin[i], csi_id, channel);
> +			if (csi_pad->entity != link->source->entity) {
> +				vin_dbg(vin, "Already attached to %s\n",
> +					csi_pad->entity->name);
> +				ret = -EBUSY;
> +				goto out;
> +			}
>  		}
>
> -		channel = rvin_group_csi_pad_to_channel(link->source->index);
> -		mask_new = mask & rvin_csi2_get_mask(vin, csi_id, channel);
> -		vin_dbg(vin, "Try link change mask: 0x%x new: 0x%x\n", mask,
> -			mask_new);
> -
> -		if (!mask_new) {
> -			ret = -EMLINK;
> -			goto out;
> +		for (route = vin->info->routes; route->chsel; route++) {
> +			if (route->master == master_id && route->csi == csi_id) {
> +				chsel = route->chsel;
> +				break;
> +			}
>  		}
>
> -		/* New valid CHSEL found, set the new value. */
> -		ret = rvin_set_channel_routing(group->vin[master_id],
> -					       __ffs(mask_new));
> +		BUG_ON(chsel < 0);
> +
> +		ret = rvin_set_channel_routing(group->vin[master_id], chsel);
>  		if (ret)
>  			goto out;
>
> @@ -909,46 +888,59 @@ static const struct media_device_ops rvin_csi2_media_ops = {
>  	.link_notify = rvin_csi2_link_notify,
>  };
>
> -static int rvin_csi2_add_route(struct rvin_group *group,
> -			       const struct rvin_group_route *route)
> +static int rvin_csi2_add_routes(struct rvin_group *group, unsigned int id,
> +				const struct rvin_group_route *route)
>
>  {
>  	struct media_entity *source = &group->remotes[route->csi].subdev->entity;
> -	unsigned int source_idx = rvin_group_csi_channel_to_pad(route->channel);
> -	struct media_entity *sink = &group->vin[route->vin]->vdev.entity;
> -	struct media_pad *source_pad = &source->pads[source_idx];
> +	struct media_entity *sink = &group->vin[id]->vdev.entity;
>  	struct media_pad *sink_pad = &sink->pads[0];
> +	unsigned int channel;
> +	int ret;
>
> -	if (media_entity_find_link(source_pad, sink_pad))
> -		return 0;
> +	for (channel = 0; channel < 4; channel++) {
> +		unsigned int source_idx = rvin_group_csi_channel_to_pad(channel);
> +		struct media_pad *source_pad = &source->pads[source_idx];
>
> -	return media_create_pad_link(source, source_idx, sink, 0, 0);
> +		if (media_entity_find_link(source_pad, sink_pad))
> +			continue;
> +
> +		ret = media_create_pad_link(source, source_idx, sink, 0, 0);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
>  }
>
>  static int rvin_csi2_setup_links(struct rvin_dev *vin)
>  {
>  	const struct rvin_group_route *route;
> +	unsigned int id;
>  	int ret = -EINVAL;
>
>  	/* Create all media device links between VINs and CSI-2's. */
>  	mutex_lock(&vin->group->lock);
> -	for (route = vin->info->routes; route->mask; route++) {
> -		/* Check that VIN is part of the group. */
> -		if (!vin->group->vin[route->vin])
> -			continue;
> -
> +	for (route = vin->info->routes; route->chsel; route++) {
>  		/* Check that VIN' master is part of the group. */
> -		if (!vin->group->vin[rvin_group_id_to_master(route->vin)])
> +		if (!vin->group->vin[route->master])
>  			continue;
>
>  		/* Check that CSI-2 is part of the group. */
>  		if (!vin->group->remotes[route->csi].subdev)
>  			continue;
>
> -		ret = rvin_csi2_add_route(vin->group, route);
> -		if (ret)
> -			break;
> +		for (id = route->master; id < route->master + 4; id++) {
> +			/* Check that VIN is part of the group. */
> +			if (!vin->group->vin[id])
> +				continue;
> +
> +			ret = rvin_csi2_add_routes(vin->group, id, route);
> +			if (ret)
> +				goto out;
> +		}
>  	}
> +out:
>  	mutex_unlock(&vin->group->lock);
>
>  	return ret;
> @@ -1158,30 +1150,9 @@ static const struct rvin_info rcar_info_gen2 = {
>  };
>
>  static const struct rvin_group_route rcar_info_r8a774e1_routes[] = {
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 0, .mask = BIT(0) | BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 0, .mask = BIT(1) | BIT(4) },
> -	{ .csi = RVIN_CSI40, .channel = 1, .vin = 0, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 1, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI40, .channel = 1, .vin = 1, .mask = BIT(1) | BIT(3) },
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 1, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 1, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 2, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 2, .mask = BIT(1) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 2, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI40, .channel = 2, .vin = 2, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 2, .vin = 2, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI40, .channel = 1, .vin = 3, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 3, .mask = BIT(1) | BIT(2) },
> -	{ .csi = RVIN_CSI40, .channel = 3, .vin = 3, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 3, .vin = 3, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 4, .mask = BIT(1) | BIT(4) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 5, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 5, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 6, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 6, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI20, .channel = 2, .vin = 6, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 7, .mask = BIT(1) | BIT(2) },
> -	{ .csi = RVIN_CSI20, .channel = 3, .vin = 7, .mask = BIT(4) },
> +	{ .master = 0, .csi = RVIN_CSI20, .chsel = 0x04 },
> +	{ .master = 0, .csi = RVIN_CSI40, .chsel = 0x03 },
> +	{ .master = 4, .csi = RVIN_CSI20, .chsel = 0x04 },
>  	{ /* Sentinel */ }
>  };
>
> @@ -1194,38 +1165,10 @@ static const struct rvin_info rcar_info_r8a774e1 = {
>  };
>
>  static const struct rvin_group_route rcar_info_r8a7795_routes[] = {
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 0, .mask = BIT(0) | BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 0, .mask = BIT(1) | BIT(4) },
> -	{ .csi = RVIN_CSI40, .channel = 1, .vin = 0, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 1, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI40, .channel = 1, .vin = 1, .mask = BIT(1) | BIT(3) },
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 1, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 1, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 2, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 2, .mask = BIT(1) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 2, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI40, .channel = 2, .vin = 2, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 2, .vin = 2, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI40, .channel = 1, .vin = 3, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 3, .mask = BIT(1) | BIT(2) },
> -	{ .csi = RVIN_CSI40, .channel = 3, .vin = 3, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 3, .vin = 3, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI41, .channel = 0, .vin = 4, .mask = BIT(0) | BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 4, .mask = BIT(1) | BIT(4) },
> -	{ .csi = RVIN_CSI41, .channel = 1, .vin = 4, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 5, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI41, .channel = 1, .vin = 5, .mask = BIT(1) | BIT(3) },
> -	{ .csi = RVIN_CSI41, .channel = 0, .vin = 5, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 5, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 6, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI41, .channel = 0, .vin = 6, .mask = BIT(1) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 6, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI41, .channel = 2, .vin = 6, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 2, .vin = 6, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI41, .channel = 1, .vin = 7, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 7, .mask = BIT(1) | BIT(2) },
> -	{ .csi = RVIN_CSI41, .channel = 3, .vin = 7, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 3, .vin = 7, .mask = BIT(4) },
> +	{ .master = 0, .csi = RVIN_CSI20, .chsel = 0x04 },
> +	{ .master = 0, .csi = RVIN_CSI40, .chsel = 0x03 },
> +	{ .master = 4, .csi = RVIN_CSI20, .chsel = 0x04 },
> +	{ .master = 4, .csi = RVIN_CSI41, .chsel = 0x03 },
>  	{ /* Sentinel */ }
>  };
>
> @@ -1239,48 +1182,12 @@ static const struct rvin_info rcar_info_r8a7795 = {
>  };
>
>  static const struct rvin_group_route rcar_info_r8a7795es1_routes[] = {
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 0, .mask = BIT(0) | BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 0, .mask = BIT(1) | BIT(4) },
> -	{ .csi = RVIN_CSI21, .channel = 0, .vin = 0, .mask = BIT(2) | BIT(5) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 1, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI21, .channel = 0, .vin = 1, .mask = BIT(1) },
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 1, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI40, .channel = 1, .vin = 1, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 1, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI21, .channel = 1, .vin = 1, .mask = BIT(5) },
> -	{ .csi = RVIN_CSI21, .channel = 0, .vin = 2, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 2, .mask = BIT(1) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 2, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI40, .channel = 2, .vin = 2, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 2, .vin = 2, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI21, .channel = 2, .vin = 2, .mask = BIT(5) },
> -	{ .csi = RVIN_CSI40, .channel = 1, .vin = 3, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 3, .mask = BIT(1) },
> -	{ .csi = RVIN_CSI21, .channel = 1, .vin = 3, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI40, .channel = 3, .vin = 3, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 3, .vin = 3, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI21, .channel = 3, .vin = 3, .mask = BIT(5) },
> -	{ .csi = RVIN_CSI41, .channel = 0, .vin = 4, .mask = BIT(0) | BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 4, .mask = BIT(1) | BIT(4) },
> -	{ .csi = RVIN_CSI21, .channel = 0, .vin = 4, .mask = BIT(2) | BIT(5) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 5, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI21, .channel = 0, .vin = 5, .mask = BIT(1) },
> -	{ .csi = RVIN_CSI41, .channel = 0, .vin = 5, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI41, .channel = 1, .vin = 5, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 5, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI21, .channel = 1, .vin = 5, .mask = BIT(5) },
> -	{ .csi = RVIN_CSI21, .channel = 0, .vin = 6, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI41, .channel = 0, .vin = 6, .mask = BIT(1) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 6, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI41, .channel = 2, .vin = 6, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 2, .vin = 6, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI21, .channel = 2, .vin = 6, .mask = BIT(5) },
> -	{ .csi = RVIN_CSI41, .channel = 1, .vin = 7, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 7, .mask = BIT(1) },
> -	{ .csi = RVIN_CSI21, .channel = 1, .vin = 7, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI41, .channel = 3, .vin = 7, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 3, .vin = 7, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI21, .channel = 3, .vin = 7, .mask = BIT(5) },
> +	{ .master = 0, .csi = RVIN_CSI20, .chsel = 0x04 },
> +	{ .master = 0, .csi = RVIN_CSI20, .chsel = 0x05 },
> +	{ .master = 0, .csi = RVIN_CSI40, .chsel = 0x03 },
> +	{ .master = 4, .csi = RVIN_CSI20, .chsel = 0x04 },
> +	{ .master = 4, .csi = RVIN_CSI20, .chsel = 0x05 },
> +	{ .master = 4, .csi = RVIN_CSI40, .chsel = 0x03 },

This is really bothering, as otherwise in all other routes

        .csi == RVIN_CSI4x -> chsel = 0x03
        .csi == RVIN_CSI2x -> chsel = 0x04

>  	{ /* Sentinel */ }
>  };
>
> @@ -1293,34 +1200,10 @@ static const struct rvin_info rcar_info_r8a7795es1 = {
>  };
>
>  static const struct rvin_group_route rcar_info_r8a7796_routes[] = {
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 0, .mask = BIT(0) | BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 0, .mask = BIT(1) | BIT(4) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 1, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 1, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI40, .channel = 1, .vin = 1, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 1, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 2, .mask = BIT(1) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 2, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI40, .channel = 2, .vin = 2, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 2, .vin = 2, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI40, .channel = 1, .vin = 3, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 3, .mask = BIT(1) },
> -	{ .csi = RVIN_CSI40, .channel = 3, .vin = 3, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 3, .vin = 3, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 4, .mask = BIT(0) | BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 4, .mask = BIT(1) | BIT(4) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 5, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 5, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI40, .channel = 1, .vin = 5, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 5, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 6, .mask = BIT(1) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 6, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI40, .channel = 2, .vin = 6, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 2, .vin = 6, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI40, .channel = 1, .vin = 7, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 7, .mask = BIT(1) },
> -	{ .csi = RVIN_CSI40, .channel = 3, .vin = 7, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 3, .vin = 7, .mask = BIT(4) },
> +	{ .master = 0, .csi = RVIN_CSI20, .chsel = 0x04 },
> +	{ .master = 0, .csi = RVIN_CSI40, .chsel = 0x03 },
> +	{ .master = 4, .csi = RVIN_CSI20, .chsel = 0x04 },
> +	{ .master = 4, .csi = RVIN_CSI40, .chsel = 0x03 },
>  	{ /* Sentinel */ }
>  };
>
> @@ -1334,38 +1217,10 @@ static const struct rvin_info rcar_info_r8a7796 = {
>  };
>
>  static const struct rvin_group_route rcar_info_r8a77965_routes[] = {
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 0, .mask = BIT(0) | BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 0, .mask = BIT(1) | BIT(4) },
> -	{ .csi = RVIN_CSI40, .channel = 1, .vin = 0, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 1, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI40, .channel = 1, .vin = 1, .mask = BIT(1) | BIT(3) },
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 1, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 1, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 2, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 2, .mask = BIT(1) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 2, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI40, .channel = 2, .vin = 2, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 2, .vin = 2, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI40, .channel = 1, .vin = 3, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 3, .mask = BIT(1) | BIT(2) },
> -	{ .csi = RVIN_CSI40, .channel = 3, .vin = 3, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 3, .vin = 3, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 4, .mask = BIT(0) | BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 4, .mask = BIT(1) | BIT(4) },
> -	{ .csi = RVIN_CSI40, .channel = 1, .vin = 4, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 5, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI40, .channel = 1, .vin = 5, .mask = BIT(1) | BIT(3) },
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 5, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 5, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 6, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 6, .mask = BIT(1) },
> -	{ .csi = RVIN_CSI20, .channel = 0, .vin = 6, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI40, .channel = 2, .vin = 6, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 2, .vin = 6, .mask = BIT(4) },
> -	{ .csi = RVIN_CSI40, .channel = 1, .vin = 7, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI20, .channel = 1, .vin = 7, .mask = BIT(1) | BIT(2) },
> -	{ .csi = RVIN_CSI40, .channel = 3, .vin = 7, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI20, .channel = 3, .vin = 7, .mask = BIT(4) },
> +	{ .master = 0, .csi = RVIN_CSI20, .chsel = 0x04 },
> +	{ .master = 0, .csi = RVIN_CSI40, .chsel = 0x03 },
> +	{ .master = 4, .csi = RVIN_CSI20, .chsel = 0x04 },
> +	{ .master = 4, .csi = RVIN_CSI40, .chsel = 0x03 },
>  	{ /* Sentinel */ }
>  };
>
> @@ -1379,13 +1234,7 @@ static const struct rvin_info rcar_info_r8a77965 = {
>  };
>
>  static const struct rvin_group_route rcar_info_r8a77970_routes[] = {
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 0, .mask = BIT(0) | BIT(3) },
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 1, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI40, .channel = 1, .vin = 1, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 2, .mask = BIT(1) },
> -	{ .csi = RVIN_CSI40, .channel = 2, .vin = 2, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI40, .channel = 1, .vin = 3, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI40, .channel = 3, .vin = 3, .mask = BIT(3) },
> +	{ .master = 0, .csi = RVIN_CSI40, .chsel = 0x03 },
>  	{ /* Sentinel */ }
>  };
>
> @@ -1398,22 +1247,8 @@ static const struct rvin_info rcar_info_r8a77970 = {
>  };
>
>  static const struct rvin_group_route rcar_info_r8a77980_routes[] = {
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 0, .mask = BIT(0) | BIT(3) },
> -	{ .csi = RVIN_CSI40, .channel = 1, .vin = 0, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 1, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI40, .channel = 1, .vin = 1, .mask = BIT(1) | BIT(3) },
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 2, .mask = BIT(1) },
> -	{ .csi = RVIN_CSI40, .channel = 2, .vin = 2, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI40, .channel = 1, .vin = 3, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI40, .channel = 3, .vin = 3, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI41, .channel = 0, .vin = 4, .mask = BIT(0) | BIT(3) },
> -	{ .csi = RVIN_CSI41, .channel = 1, .vin = 4, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI41, .channel = 0, .vin = 5, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI41, .channel = 1, .vin = 5, .mask = BIT(1) | BIT(3) },
> -	{ .csi = RVIN_CSI41, .channel = 0, .vin = 6, .mask = BIT(1) },
> -	{ .csi = RVIN_CSI41, .channel = 2, .vin = 6, .mask = BIT(3) },
> -	{ .csi = RVIN_CSI41, .channel = 1, .vin = 7, .mask = BIT(0) },
> -	{ .csi = RVIN_CSI41, .channel = 3, .vin = 7, .mask = BIT(3) },
> +	{ .master = 0, .csi = RVIN_CSI40, .chsel = 0x03 },
> +	{ .master = 4, .csi = RVIN_CSI41, .chsel = 0x03 },
>  	{ /* Sentinel */ }
>  };
>
> @@ -1427,10 +1262,7 @@ static const struct rvin_info rcar_info_r8a77980 = {
>  };
>
>  static const struct rvin_group_route rcar_info_r8a77990_routes[] = {
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 4, .mask = BIT(0) | BIT(3) },
> -	{ .csi = RVIN_CSI40, .channel = 0, .vin = 5, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI40, .channel = 1, .vin = 4, .mask = BIT(2) },
> -	{ .csi = RVIN_CSI40, .channel = 1, .vin = 5, .mask = BIT(1) | BIT(3) },
> +	{ .master = 0, .csi = RVIN_CSI40, .chsel = 0x03 },
>  	{ /* Sentinel */ }
>  };
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index 11848d0c4a55cb4c..b8c56d248454efbf 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -468,6 +468,8 @@ struct rcar_csi2 {
>  	struct v4l2_subdev *remote;
>  	unsigned int remote_pad;
>
> +	int channel_vc[4];
> +
>  	struct mutex lock; /* Protects mf and stream_count. */
>  	struct v4l2_mbus_framefmt mf;
>  	int stream_count;
> @@ -664,8 +666,11 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
>  	for (i = 0; i < priv->info->num_channels; i++) {
>  		u32 vcdt_part;
>
> -		vcdt_part = VCDT_SEL_VC(i) | VCDT_VCDTN_EN | VCDT_SEL_DTN_ON |
> -			VCDT_SEL_DT(format->datatype);
> +		if (priv->channel_vc[i] < 0)
> +			continue;
> +
> +		vcdt_part = VCDT_SEL_VC(priv->channel_vc[i]) | VCDT_VCDTN_EN |
> +			VCDT_SEL_DTN_ON | VCDT_SEL_DT(format->datatype);
>
>  		/* Store in correct reg and offset. */
>  		if (i < 2)
> @@ -1240,7 +1245,53 @@ static int rcsi2_init_phtw_v3u(struct rcar_csi2 *priv,
>   * Platform Device Driver.
>   */
>
> +static int rcsi2_link_setup(struct media_entity *entity,
> +			    const struct media_pad *local,
> +			    const struct media_pad *remote, u32 flags)
> +{
> +	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> +	struct rcar_csi2 *priv = sd_to_csi2(sd);
> +	struct video_device *vdev;
> +	int channel, vc;
> +	u32 id;
> +
> +	if (!is_media_entity_v4l2_video_device(remote->entity)) {

Can this happen ?

> +		dev_err(priv->dev, "Remote is not a video device\n");
> +		return -EINVAL;
> +	}
> +
> +	vdev = media_entity_to_video_device(remote->entity);
> +
> +	if (of_property_read_u32(vdev->dev_parent->of_node, "renesas,id", &id)) {

Reading properties from a remote device node usually makes people
scream but I understand the purpose here and it doesn't sound -that-
bad

> +		dev_err(priv->dev, "No renesas,id, can't configure routing\n");
> +		return -EINVAL;
> +	}

Ouch, I take back my initial assumption that is harmless to not being
able anymore to capture the same VC from multiple VIN, in particular
in regards to embedded data.

CHSEL[3] allows to select if a specific VC or "CSI-2 embedded data
of Virtual Channel 0" has to be captured. This setup prevents to
output on two channels VC0 and filter out embedded data if I'm not
mistaken...

> +
> +	channel = id % 4;
> +
> +	if (flags & MEDIA_LNK_FL_ENABLED) {
> +		if (media_entity_remote_pad(local)) {
> +			dev_dbg(priv->dev,
> +				"Each VC can only be routed to one output channel\n");

Can this limitation be lifted to support capturing embedded data from
VC0 ? That would require mixing media links and formats though :(

> +			return -EINVAL;
> +		}
> +
> +		vc = local->index - 1;
> +
> +		dev_dbg(priv->dev, "Route VC%d to VIN%u on output channel %d\n",
> +			vc, id, channel);
> +	} else {
> +		vc = -1;
> +	}
> +
> +	priv->channel_vc[channel] = vc;
> +
> +	return 0;
> +}
> +
> +
>  static const struct media_entity_operations rcar_csi2_entity_ops = {
> +	.link_setup = rcsi2_link_setup,
>  	.link_validate = v4l2_subdev_link_validate,
>  };
>
> @@ -1459,6 +1510,9 @@ static int rcsi2_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto error_async;
>
> +	for (i = 0; i < ARRAY_SIZE(priv->channel_vc); i++)
> +		priv->channel_vc[i] = -1;
> +
>  	pm_runtime_enable(&pdev->dev);
>
>  	ret = v4l2_async_register_subdev(&priv->subdev);
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index 25ead9333d0046e7..b72ae27a407dc96c 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -1490,7 +1490,7 @@ int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
>  	 * register. IFMD_DES1 controls data expansion mode for CSI20/21,
>  	 * IFMD_DES0 controls data expansion mode for CSI40/41.
>  	 */
> -	for (route = vin->info->routes; route->mask; route++) {
> +	for (route = vin->info->routes; route->chsel; route++) {
>  		if (route->csi == RVIN_CSI20 || route->csi == RVIN_CSI21)
>  			ifmd |= VNCSI_IFMD_DES1;
>  		else
> diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> index 6c06320174a2ed96..ddc1830be9a5d6c3 100644
> --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> @@ -128,11 +128,9 @@ struct rvin_parallel_entity {
>   * struct rvin_group_route - describes a route from a channel of a
>   *	CSI-2 receiver to a VIN
>   *
> + * @master:	VIN group master ID.
>   * @csi:	CSI-2 receiver ID.
> - * @channel:	Output channel of the CSI-2 receiver.
> - * @vin:	VIN ID.
> - * @mask:	Bitmask of the different CHSEL register values that
> - *		allow for a route from @csi + @chan to @vin.
> + * @chsel:	CHSEL register values that connects VIN group to CSI-2.
>   *
>   * .. note::
>   *	Each R-Car CSI-2 receiver has four output channels facing the VIN
> @@ -140,19 +138,11 @@ struct rvin_parallel_entity {
>   *	There is no correlation between channel number and CSI-2 VC. It's
>   *	up to the CSI-2 receiver driver to configure which VC is output
>   *	on which channel, the VIN devices only care about output channels.
> - *
> - *	There are in some cases multiple CHSEL register settings which would
> - *	allow for the same route from @csi + @channel to @vin. For example
> - *	on R-Car H3 both the CHSEL values 0 and 3 allow for a route from
> - *	CSI40/VC0 to VIN0. All possible CHSEL values for a route need to be
> - *	recorded as a bitmask in @mask, in this example bit 0 and 3 should
> - *	be set.
>   */
>  struct rvin_group_route {
> +	unsigned int master;
>  	enum rvin_csi_id csi;
> -	unsigned int channel;
> -	unsigned int vin;
> -	unsigned int mask;
> +	unsigned int chsel;
>  };
>
>  /**
> --
> 2.33.1
>
