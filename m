Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6BBA445768
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 17:42:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231669AbhKDQo4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 12:44:56 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:57885 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231635AbhKDQo4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Nov 2021 12:44:56 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 2868A24000D;
        Thu,  4 Nov 2021 16:42:14 +0000 (UTC)
Date:   Thu, 4 Nov 2021 17:43:06 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] media: rcar-vin: Breakout media link creation
Message-ID: <20211104164306.ia33awmr5rcnnxtg@uno.localdomain>
References: <20211020200225.1956048-1-niklas.soderlund+renesas@ragnatech.se>
 <20211020200225.1956048-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211020200225.1956048-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas

On Wed, Oct 20, 2021 at 10:02:24PM +0200, Niklas Söderlund wrote:
> In preparation of creating more links to allow for full Virtual Channel
> routing within the CSI-2 block break out the link creation logic to a
> helper function as the logic will grow in future work.
>
> There is no functional change.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 38 ++++++++++-----------
>  1 file changed, 18 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index bd960c348ba5228c..65ab66a072e9d635 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -909,6 +909,22 @@ static const struct media_device_ops rvin_csi2_media_ops = {
>  	.link_notify = rvin_csi2_link_notify,
>  };
>
> +static int rvin_csi2_add_route(struct rvin_group *group,

How about rvin_csi2_create_link() ?
> +			       const struct rvin_group_route *route)
> +
> +{
> +	struct media_entity *source = &group->remotes[route->csi].subdev->entity;
> +	unsigned int source_idx = rvin_group_csi_channel_to_pad(route->channel);
> +	struct media_entity *sink = &group->vin[route->vin]->vdev.entity;
> +	struct media_pad *source_pad = &source->pads[source_idx];
> +	struct media_pad *sink_pad = &sink->pads[0];
> +
And keep the comment here to re-state that if the linke existed
already is not a fatal error

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j


> +	if (media_entity_find_link(source_pad, sink_pad))
> +		return 0;
> +
> +	return media_create_pad_link(source, source_idx, sink, 0, 0);
> +}
> +
>  static int rvin_csi2_setup_links(struct rvin_dev *vin)
>  {
>  	const struct rvin_group_route *route;
> @@ -917,10 +933,6 @@ static int rvin_csi2_setup_links(struct rvin_dev *vin)
>  	/* Create all media device links between VINs and CSI-2's. */
>  	mutex_lock(&vin->group->lock);
>  	for (route = vin->info->routes; route->mask; route++) {
> -		struct media_pad *source_pad, *sink_pad;
> -		struct media_entity *source, *sink;
> -		unsigned int source_idx;
> -
>  		/* Check that VIN is part of the group. */
>  		if (!vin->group->vin[route->vin])
>  			continue;
> @@ -933,23 +945,9 @@ static int rvin_csi2_setup_links(struct rvin_dev *vin)
>  		if (!vin->group->remotes[route->csi].subdev)
>  			continue;
>
> -		source = &vin->group->remotes[route->csi].subdev->entity;
> -		source_idx = rvin_group_csi_channel_to_pad(route->channel);
> -		source_pad = &source->pads[source_idx];
> -
> -		sink = &vin->group->vin[route->vin]->vdev.entity;
> -		sink_pad = &sink->pads[0];
> -
> -		/* Skip if link already exists. */
> -		if (media_entity_find_link(source_pad, sink_pad))
> -			continue;
> -
> -		ret = media_create_pad_link(source, source_idx, sink, 0, 0);
> -		if (ret) {
> -			vin_err(vin, "Error adding link from %s to %s\n",
> -				source->name, sink->name);
> +		ret = rvin_csi2_add_route(vin->group, route);
> +		if (ret)
>  			break;
> -		}
>  	}
>  	mutex_unlock(&vin->group->lock);
>
> --
> 2.33.1
>
