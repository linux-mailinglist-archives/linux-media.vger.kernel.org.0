Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF5D83BDBC6
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 18:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbhGFRAb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 13:00:31 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:56645 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbhGFRAb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 13:00:31 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 6CB0A240003;
        Tue,  6 Jul 2021 16:57:50 +0000 (UTC)
Date:   Tue, 6 Jul 2021 18:58:39 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 06/11] rcar-vin: Move group async notifier
Message-ID: <20210706165839.3zf2b6ef6cnyfgl2@uno.localdomain>
References: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
 <20210413180253.2575451-7-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210413180253.2575451-7-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Tue, Apr 13, 2021 at 08:02:48PM +0200, Niklas Söderlund wrote:
> The VIN group notifier code is intertwined with the media graph layout
> code for R-Car CSI-2 subdevices, this makes it hard to extend the group
> to also support the R-Car ISP channel selector.
>
> Before breaking the two concepts apart and extending it move the group
> code to its final location. There is no functional change and all
> functions are moved verbatim.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Seems there are no functional changes indeed!

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 460 ++++++++++----------
>  1 file changed, 230 insertions(+), 230 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index cc980cad805c022c..d951f739b3a9a034 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -383,6 +383,176 @@ static void rvin_group_put(struct rvin_dev *vin)
>  	kref_put(&group->refcount, rvin_group_release);
>  }
>
> +static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
> +{
> +	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
> +	const struct rvin_group_route *route;
> +	unsigned int i;
> +	int ret;
> +
> +	ret = media_device_register(&vin->group->mdev);
> +	if (ret)
> +		return ret;
> +
> +	ret = v4l2_device_register_subdev_nodes(&vin->v4l2_dev);
> +	if (ret) {
> +		vin_err(vin, "Failed to register subdev nodes\n");
> +		return ret;
> +	}
> +
> +	/* Register all video nodes for the group. */
> +	for (i = 0; i < RCAR_VIN_NUM; i++) {
> +		if (vin->group->vin[i] &&
> +		    !video_is_registered(&vin->group->vin[i]->vdev)) {
> +			ret = rvin_v4l2_register(vin->group->vin[i]);
> +			if (ret)
> +				return ret;
> +		}
> +	}
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
> +static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
> +				     struct v4l2_subdev *subdev,
> +				     struct v4l2_async_subdev *asd)
> +{
> +	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
> +	unsigned int i;
> +
> +	for (i = 0; i < RCAR_VIN_NUM; i++)
> +		if (vin->group->vin[i])
> +			rvin_v4l2_unregister(vin->group->vin[i]);
> +
> +	mutex_lock(&vin->group->lock);
> +
> +	for (i = 0; i < RVIN_CSI_MAX; i++) {
> +		if (vin->group->remotes[i].asd != asd)
> +			continue;
> +		vin->group->remotes[i].subdev = NULL;
> +		vin_dbg(vin, "Unbind %s from slot %u\n", subdev->name, i);
> +		break;
> +	}
> +
> +	mutex_unlock(&vin->group->lock);
> +
> +	media_device_unregister(&vin->group->mdev);
> +}
> +
> +static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
> +				   struct v4l2_subdev *subdev,
> +				   struct v4l2_async_subdev *asd)
> +{
> +	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
> +	unsigned int i;
> +
> +	mutex_lock(&vin->group->lock);
> +
> +	for (i = 0; i < RVIN_CSI_MAX; i++) {
> +		if (vin->group->remotes[i].asd != asd)
> +			continue;
> +		vin->group->remotes[i].subdev = subdev;
> +		vin_dbg(vin, "Bound %s to slot %u\n", subdev->name, i);
> +		break;
> +	}
> +
> +	mutex_unlock(&vin->group->lock);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_async_notifier_operations rvin_group_notify_ops = {
> +	.bound = rvin_group_notify_bound,
> +	.unbind = rvin_group_notify_unbind,
> +	.complete = rvin_group_notify_complete,
> +};
> +
> +static int rvin_mc_parse_of(struct rvin_dev *vin, unsigned int id)
> +{
> +	struct fwnode_handle *ep, *fwnode;
> +	struct v4l2_fwnode_endpoint vep = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> +	};
> +	struct v4l2_async_subdev *asd;
> +	int ret;
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 1, id, 0);
> +	if (!ep)
> +		return 0;
> +
> +	fwnode = fwnode_graph_get_remote_endpoint(ep);
> +	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> +	fwnode_handle_put(ep);
> +	if (ret) {
> +		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	if (!of_device_is_available(to_of_node(fwnode))) {
> +		vin_dbg(vin, "OF device %pOF disabled, ignoring\n",
> +			to_of_node(fwnode));
> +		ret = -ENOTCONN;
> +		goto out;
> +	}
> +
> +	asd = v4l2_async_notifier_add_fwnode_subdev(&vin->group->notifier,
> +						    fwnode,
> +						    struct v4l2_async_subdev);
> +	if (IS_ERR(asd)) {
> +		ret = PTR_ERR(asd);
> +		goto out;
> +	}
> +
> +	vin->group->remotes[vep.base.id].asd = asd;
> +
> +	vin_dbg(vin, "Add group OF device %pOF to slot %u\n",
> +		to_of_node(fwnode), vep.base.id);
> +out:
> +	fwnode_handle_put(fwnode);
> +
> +	return ret;
> +}
> +
>  static void rvin_group_notifier_cleanup(struct rvin_dev *vin)
>  {
>  	mutex_lock(&vin->group->lock);
> @@ -393,6 +563,65 @@ static void rvin_group_notifier_cleanup(struct rvin_dev *vin)
>  	mutex_unlock(&vin->group->lock);
>  }
>
> +static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
> +{
> +	unsigned int count = 0, vin_mask = 0;
> +	unsigned int i, id;
> +	int ret;
> +
> +	mutex_lock(&vin->group->lock);
> +
> +	/* If not all VIN's are registered don't register the notifier. */
> +	for (i = 0; i < RCAR_VIN_NUM; i++) {
> +		if (vin->group->vin[i]) {
> +			count++;
> +			vin_mask |= BIT(i);
> +		}
> +	}
> +
> +	if (vin->group->count != count) {
> +		mutex_unlock(&vin->group->lock);
> +		return 0;
> +	}
> +
> +	mutex_unlock(&vin->group->lock);
> +
> +	v4l2_async_notifier_init(&vin->group->notifier);
> +
> +	/*
> +	 * Have all VIN's look for CSI-2 subdevices. Some subdevices will
> +	 * overlap but the parser function can handle it, so each subdevice
> +	 * will only be registered once with the group notifier.
> +	 */
> +	for (i = 0; i < RCAR_VIN_NUM; i++) {
> +		if (!(vin_mask & BIT(i)))
> +			continue;
> +
> +		for (id = 0; id < RVIN_CSI_MAX; id++) {
> +			if (vin->group->remotes[id].asd)
> +				continue;
> +
> +			ret = rvin_mc_parse_of(vin->group->vin[i], id);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	if (list_empty(&vin->group->notifier.asd_list))
> +		return 0;
> +
> +	vin->group->notifier.ops = &rvin_group_notify_ops;
> +	ret = v4l2_async_notifier_register(&vin->v4l2_dev,
> +					   &vin->group->notifier);
> +	if (ret < 0) {
> +		vin_err(vin, "Notifier registration failed\n");
> +		v4l2_async_notifier_cleanup(&vin->group->notifier);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * Controls
>   */
> @@ -720,238 +949,9 @@ static int rvin_parallel_init(struct rvin_dev *vin)
>  }
>
>  /* -----------------------------------------------------------------------------
> - * Group async notifier
> + * CSI-2
>   */
>
> -static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
> -{
> -	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
> -	const struct rvin_group_route *route;
> -	unsigned int i;
> -	int ret;
> -
> -	ret = media_device_register(&vin->group->mdev);
> -	if (ret)
> -		return ret;
> -
> -	ret = v4l2_device_register_subdev_nodes(&vin->v4l2_dev);
> -	if (ret) {
> -		vin_err(vin, "Failed to register subdev nodes\n");
> -		return ret;
> -	}
> -
> -	/* Register all video nodes for the group. */
> -	for (i = 0; i < RCAR_VIN_NUM; i++) {
> -		if (vin->group->vin[i] &&
> -		    !video_is_registered(&vin->group->vin[i]->vdev)) {
> -			ret = rvin_v4l2_register(vin->group->vin[i]);
> -			if (ret)
> -				return ret;
> -		}
> -	}
> -
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
> -}
> -
> -static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
> -				     struct v4l2_subdev *subdev,
> -				     struct v4l2_async_subdev *asd)
> -{
> -	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
> -	unsigned int i;
> -
> -	for (i = 0; i < RCAR_VIN_NUM; i++)
> -		if (vin->group->vin[i])
> -			rvin_v4l2_unregister(vin->group->vin[i]);
> -
> -	mutex_lock(&vin->group->lock);
> -
> -	for (i = 0; i < RVIN_CSI_MAX; i++) {
> -		if (vin->group->remotes[i].asd != asd)
> -			continue;
> -		vin->group->remotes[i].subdev = NULL;
> -		vin_dbg(vin, "Unbind %s from slot %u\n", subdev->name, i);
> -		break;
> -	}
> -
> -	mutex_unlock(&vin->group->lock);
> -
> -	media_device_unregister(&vin->group->mdev);
> -}
> -
> -static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
> -				   struct v4l2_subdev *subdev,
> -				   struct v4l2_async_subdev *asd)
> -{
> -	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
> -	unsigned int i;
> -
> -	mutex_lock(&vin->group->lock);
> -
> -	for (i = 0; i < RVIN_CSI_MAX; i++) {
> -		if (vin->group->remotes[i].asd != asd)
> -			continue;
> -		vin->group->remotes[i].subdev = subdev;
> -		vin_dbg(vin, "Bound %s to slot %u\n", subdev->name, i);
> -		break;
> -	}
> -
> -	mutex_unlock(&vin->group->lock);
> -
> -	return 0;
> -}
> -
> -static const struct v4l2_async_notifier_operations rvin_group_notify_ops = {
> -	.bound = rvin_group_notify_bound,
> -	.unbind = rvin_group_notify_unbind,
> -	.complete = rvin_group_notify_complete,
> -};
> -
> -static int rvin_mc_parse_of(struct rvin_dev *vin, unsigned int id)
> -{
> -	struct fwnode_handle *ep, *fwnode;
> -	struct v4l2_fwnode_endpoint vep = {
> -		.bus_type = V4L2_MBUS_CSI2_DPHY,
> -	};
> -	struct v4l2_async_subdev *asd;
> -	int ret;
> -
> -	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 1, id, 0);
> -	if (!ep)
> -		return 0;
> -
> -	fwnode = fwnode_graph_get_remote_endpoint(ep);
> -	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> -	fwnode_handle_put(ep);
> -	if (ret) {
> -		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
> -		ret = -EINVAL;
> -		goto out;
> -	}
> -
> -	if (!of_device_is_available(to_of_node(fwnode))) {
> -		vin_dbg(vin, "OF device %pOF disabled, ignoring\n",
> -			to_of_node(fwnode));
> -		ret = -ENOTCONN;
> -		goto out;
> -	}
> -
> -	asd = v4l2_async_notifier_add_fwnode_subdev(&vin->group->notifier,
> -						    fwnode,
> -						    struct v4l2_async_subdev);
> -	if (IS_ERR(asd)) {
> -		ret = PTR_ERR(asd);
> -		goto out;
> -	}
> -
> -	vin->group->remotes[vep.base.id].asd = asd;
> -
> -	vin_dbg(vin, "Add group OF device %pOF to slot %u\n",
> -		to_of_node(fwnode), vep.base.id);
> -out:
> -	fwnode_handle_put(fwnode);
> -
> -	return ret;
> -}
> -
> -static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
> -{
> -	unsigned int count = 0, vin_mask = 0;
> -	unsigned int i, id;
> -	int ret;
> -
> -	mutex_lock(&vin->group->lock);
> -
> -	/* If not all VIN's are registered don't register the notifier. */
> -	for (i = 0; i < RCAR_VIN_NUM; i++) {
> -		if (vin->group->vin[i]) {
> -			count++;
> -			vin_mask |= BIT(i);
> -		}
> -	}
> -
> -	if (vin->group->count != count) {
> -		mutex_unlock(&vin->group->lock);
> -		return 0;
> -	}
> -
> -	mutex_unlock(&vin->group->lock);
> -
> -	v4l2_async_notifier_init(&vin->group->notifier);
> -
> -	/*
> -	 * Have all VIN's look for CSI-2 subdevices. Some subdevices will
> -	 * overlap but the parser function can handle it, so each subdevice
> -	 * will only be registered once with the group notifier.
> -	 */
> -	for (i = 0; i < RCAR_VIN_NUM; i++) {
> -		if (!(vin_mask & BIT(i)))
> -			continue;
> -
> -		for (id = 0; id < RVIN_CSI_MAX; id++) {
> -			if (vin->group->remotes[id].asd)
> -				continue;
> -
> -			ret = rvin_mc_parse_of(vin->group->vin[i], id);
> -			if (ret)
> -				return ret;
> -		}
> -	}
> -
> -	if (list_empty(&vin->group->notifier.asd_list))
> -		return 0;
> -
> -	vin->group->notifier.ops = &rvin_group_notify_ops;
> -	ret = v4l2_async_notifier_register(&vin->v4l2_dev,
> -					   &vin->group->notifier);
> -	if (ret < 0) {
> -		vin_err(vin, "Notifier registration failed\n");
> -		v4l2_async_notifier_cleanup(&vin->group->notifier);
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
>  static void rvin_csi2_cleanup(struct rvin_dev *vin)
>  {
>  	rvin_group_notifier_cleanup(vin);
> --
> 2.31.1
>
