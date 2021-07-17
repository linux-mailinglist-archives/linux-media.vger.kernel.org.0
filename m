Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56F5D3CC2A5
	for <lists+linux-media@lfdr.de>; Sat, 17 Jul 2021 12:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233065AbhGQK2x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Jul 2021 06:28:53 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:45287 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbhGQK2w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Jul 2021 06:28:52 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id DE1331BF205;
        Sat, 17 Jul 2021 10:25:53 +0000 (UTC)
Date:   Sat, 17 Jul 2021 12:26:41 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 08/11] rcar-vin: Create a callback to setup media links
Message-ID: <20210717102641.qcxy5mxx57cqwrqu@uno.localdomain>
References: <20210709142600.651718-1-niklas.soderlund+renesas@ragnatech.se>
 <20210709142600.651718-9-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210709142600.651718-9-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Fri, Jul 09, 2021 at 04:25:57PM +0200, Niklas Söderlund wrote:
> New IP versions will have different media graphs and require a different
> link setup. Breakout the specific link setup to a callback that are
> associated with the group.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

> ---
> * Changes since v1
> - Allow the link_setup() to return an error code.
> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 101 +++++++++++---------
>  drivers/media/platform/rcar-vin/rcar-vin.h  |   3 +
>  2 files changed, 59 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index ae2a145b04f681f8..d04c222702ba03d1 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -247,7 +247,8 @@ static void rvin_group_cleanup(struct rvin_group *group)
>  	mutex_destroy(&group->lock);
>  }
>
> -static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
> +static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin,
> +			   int (*link_setup)(struct rvin_dev *))
>  {
>  	struct media_device *mdev = &group->mdev;
>  	const struct of_device_id *match;
> @@ -263,6 +264,8 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
>
>  	vin_dbg(vin, "found %u enabled VIN's in DT", group->count);
>
> +	group->link_setup = link_setup;
> +
>  	mdev->dev = vin->dev;
>  	mdev->ops = &rvin_media_ops;
>
> @@ -295,7 +298,8 @@ static void rvin_group_release(struct kref *kref)
>  	mutex_unlock(&rvin_group_lock);
>  }
>
> -static int rvin_group_get(struct rvin_dev *vin)
> +static int rvin_group_get(struct rvin_dev *vin,
> +			  int (*link_setup)(struct rvin_dev *))
>  {
>  	struct rvin_group *group;
>  	u32 id;
> @@ -327,7 +331,7 @@ static int rvin_group_get(struct rvin_dev *vin)
>  			goto err_group;
>  		}
>
> -		ret = rvin_group_init(group, vin);
> +		ret = rvin_group_init(group, vin, link_setup);
>  		if (ret) {
>  			kfree(group);
>  			vin_err(vin, "Failed to initialize group\n");
> @@ -386,7 +390,6 @@ static void rvin_group_put(struct rvin_dev *vin)
>  static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
>  {
>  	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
> -	const struct rvin_group_route *route;
>  	unsigned int i;
>  	int ret;
>
> @@ -410,46 +413,7 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
>  		}
>  	}
>
> -	/* Create all media device links between VINs and CSI-2's. */
> -	mutex_lock(&vin->group->lock);
> -	for (route = vin->info->routes; route->mask; route++) {
> -		struct media_pad *source_pad, *sink_pad;
> -		struct media_entity *source, *sink;
> -		unsigned int source_idx;
> -
> -		/* Check that VIN is part of the group. */
> -		if (!vin->group->vin[route->vin])
> -			continue;
> -
> -		/* Check that VIN' master is part of the group. */
> -		if (!vin->group->vin[rvin_group_id_to_master(route->vin)])
> -			continue;
> -
> -		/* Check that CSI-2 is part of the group. */
> -		if (!vin->group->remotes[route->csi].subdev)
> -			continue;
> -
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
> -			break;
> -		}
> -	}
> -	mutex_unlock(&vin->group->lock);
> -
> -	return ret;
> +	return vin->group->link_setup(vin);
>  }
>
>  static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
> @@ -953,6 +917,53 @@ static int rvin_parallel_init(struct rvin_dev *vin)
>   * CSI-2
>   */
>
> +static int rvin_csi2_setup_links(struct rvin_dev *vin)
> +{
> +	const struct rvin_group_route *route;
> +	int ret = -EINVAL;
> +
> +	/* Create all media device links between VINs and CSI-2's. */
> +	mutex_lock(&vin->group->lock);
> +	for (route = vin->info->routes; route->mask; route++) {
> +		struct media_pad *source_pad, *sink_pad;
> +		struct media_entity *source, *sink;
> +		unsigned int source_idx;
> +
> +		/* Check that VIN is part of the group. */
> +		if (!vin->group->vin[route->vin])
> +			continue;
> +
> +		/* Check that VIN' master is part of the group. */
> +		if (!vin->group->vin[rvin_group_id_to_master(route->vin)])
> +			continue;
> +
> +		/* Check that CSI-2 is part of the group. */
> +		if (!vin->group->remotes[route->csi].subdev)
> +			continue;
> +
> +		source = &vin->group->remotes[route->csi].subdev->entity;
> +		source_idx = rvin_group_csi_channel_to_pad(route->channel);
> +		source_pad = &source->pads[source_idx];
> +
> +		sink = &vin->group->vin[route->vin]->vdev.entity;
> +		sink_pad = &sink->pads[0];
> +
> +		/* Skip if link already exists. */
> +		if (media_entity_find_link(source_pad, sink_pad))
> +			continue;
> +
> +		ret = media_create_pad_link(source, source_idx, sink, 0, 0);
> +		if (ret) {
> +			vin_err(vin, "Error adding link from %s to %s\n",
> +				source->name, sink->name);
> +			break;
> +		}
> +	}
> +	mutex_unlock(&vin->group->lock);
> +
> +	return ret;
> +}
> +
>  static void rvin_csi2_cleanup(struct rvin_dev *vin)
>  {
>  	rvin_parallel_cleanup(vin);
> @@ -974,7 +985,7 @@ static int rvin_csi2_init(struct rvin_dev *vin)
>  	if (ret < 0)
>  		return ret;
>
> -	ret = rvin_group_get(vin);
> +	ret = rvin_group_get(vin, rvin_csi2_setup_links);
>  	if (ret)
>  		goto err_controls;
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> index 39207aaf39ef9391..49c148c40ea52b79 100644
> --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> @@ -269,6 +269,7 @@ struct rvin_dev {
>   * @count:		number of enabled VIN instances found in DT
>   * @notifier:		group notifier for CSI-2 async subdevices
>   * @vin:		VIN instances which are part of the group
> + * @link_setup:		Callback to create all links for the media graph
>   * @remotes:		array of pairs of fwnode and subdev pointers
>   *			to all remote subdevices.
>   */
> @@ -282,6 +283,8 @@ struct rvin_group {
>  	struct v4l2_async_notifier notifier;
>  	struct rvin_dev *vin[RCAR_VIN_NUM];
>
> +	int (*link_setup)(struct rvin_dev *vin);
> +
>  	struct {
>  		struct v4l2_async_subdev *asd;
>  		struct v4l2_subdev *subdev;
> --
> 2.32.0
>
