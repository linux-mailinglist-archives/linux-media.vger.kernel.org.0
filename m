Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD42B445754
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 17:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231500AbhKDQio (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 12:38:44 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:52507 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbhKDQin (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Nov 2021 12:38:43 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 57F42200002;
        Thu,  4 Nov 2021 16:36:03 +0000 (UTC)
Date:   Thu, 4 Nov 2021 17:36:54 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] media: rcar-vin: Refactor link notify
Message-ID: <20211104163654.fjjcpmj2gnt5aaul@uno.localdomain>
References: <20211020200225.1956048-1-niklas.soderlund+renesas@ragnatech.se>
 <20211020200225.1956048-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211020200225.1956048-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Wed, Oct 20, 2021 at 10:02:23PM +0200, Niklas Söderlund wrote:
> The code have grown organically and a lot of checks are preformed for

code -> has
preformed -> performed

> the CSI-2 use-case even if the link notify is for a subdevice connected
> to the parallel interface.
>
> Before reworking the CSI-2 routing logic split the CSI-2 and parallel
> link notify code in two separate blocks to make it clearer. There is no
> functional change.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 87 +++++++++++----------
>  1 file changed, 45 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 1d92cc8ede8f8a3e..bd960c348ba5228c 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -795,12 +795,10 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
>  {
>  	struct rvin_group *group = container_of(link->graph_obj.mdev,
>  						struct rvin_group, mdev);
> -	unsigned int master_id, channel, mask_new, i;
> -	unsigned int mask = ~0;
>  	struct media_entity *entity;
>  	struct video_device *vdev;
> -	struct media_pad *csi_pad;
> -	struct rvin_dev *vin = NULL;
> +	struct rvin_dev *vin;
> +	unsigned int i;
>  	int csi_id, ret;
>
>  	ret = v4l2_pipeline_link_notify(link, flags, notification);
> @@ -826,33 +824,9 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
>  	/* Find the master VIN that controls the routes. */
>  	vdev = media_entity_to_video_device(link->sink->entity);
>  	vin = container_of(vdev, struct rvin_dev, vdev);
> -	master_id = rvin_group_id_to_master(vin->id);
>
> -	if (WARN_ON(!group->vin[master_id])) {
> -		ret = -ENODEV;
> -		goto out;
> -	}
>
> -	/* Build a mask for already enabled links. */
> -	for (i = master_id; i < master_id + 4; i++) {
> -		if (!group->vin[i])
> -			continue;
> -
> -		/* Get remote CSI-2, if any. */
> -		csi_pad = media_entity_remote_pad(
> -				&group->vin[i]->vdev.entity.pads[0]);
> -		if (!csi_pad)
> -			continue;
> -
> -		csi_id = rvin_group_entity_to_remote_id(group, csi_pad->entity);
> -		channel = rvin_group_csi_pad_to_channel(csi_pad->index);
> -
> -		mask &= rvin_csi2_get_mask(group->vin[i], csi_id, channel);
> -	}
> -

There are now two empty lines here

> -	/* Add the new link to the existing mask and check if it works. */
>  	csi_id = rvin_group_entity_to_remote_id(group, link->source->entity);
> -
>  	if (csi_id == -ENODEV) {
>  		struct v4l2_subdev *sd;
>
> @@ -877,25 +851,54 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
>  		vin_err(vin, "Subdevice %s not registered to any VIN\n",
>  			link->source->entity->name);
>  		ret = -ENODEV;
> -		goto out;
> -	}
> +	} else {

I wonder if the group mutex should be locked in the else branch only
and simplify the whole thing as:

        if (csi_id == -ENODEV) {
                /* subdev is parallel. */
                for () {
                        return 0;
                }

                return -ENODEV;
        }

        /* subdev is CSI-2 */
        mutex_lock(group->mutex);

        ...

        mutex_unlock(group->mutex);

Even if I see above:

	/*
	 * Don't allow link changes if any stream in the graph is active as
	 * modifying the CHSEL register fields can disrupt running streams.
	 */
	media_device_for_each_entity(entity, &group->mdev) {
		struct media_pad *iter;

		media_entity_for_each_pad(entity, iter) {
			if (iter->stream_count)
				return -EBUSY;
		}
	}

Being run out of the critical session, but that was already the case.



> +		unsigned int master_id, channel, mask_new;
> +		unsigned int mask = ~0;
> +		struct media_pad *csi_pad;
>
> -	channel = rvin_group_csi_pad_to_channel(link->source->index);
> -	mask_new = mask & rvin_csi2_get_mask(vin, csi_id, channel);
> -	vin_dbg(vin, "Try link change mask: 0x%x new: 0x%x\n", mask, mask_new);
> +		master_id = rvin_group_id_to_master(vin->id);
>
> -	if (!mask_new) {
> -		ret = -EMLINK;
> -		goto out;
> -	}
> +		if (WARN_ON(!group->vin[master_id])) {
> +			ret = -ENODEV;
> +			goto out;
> +		}
> +
> +		/* Build a mask for already enabled links. */
> +		for (i = master_id; i < master_id + 4; i++) {
> +			if (!group->vin[i])
> +				continue;
> +
> +			/* Get remote CSI-2, if any. */
> +			csi_pad = media_entity_remote_pad(
> +					&group->vin[i]->vdev.entity.pads[0]);
> +			if (!csi_pad)
> +				continue;
>
> -	/* New valid CHSEL found, set the new value. */
> -	ret = rvin_set_channel_routing(group->vin[master_id], __ffs(mask_new));
> -	if (ret)
> -		goto out;
> +			csi_id = rvin_group_entity_to_remote_id(group,
> +								csi_pad->entity);
> +			channel = rvin_group_csi_pad_to_channel(csi_pad->index);
>
> -	vin->is_csi = true;
> +			mask &= rvin_csi2_get_mask(group->vin[i], csi_id, channel);
> +		}
>
> +		channel = rvin_group_csi_pad_to_channel(link->source->index);
> +		mask_new = mask & rvin_csi2_get_mask(vin, csi_id, channel);
> +		vin_dbg(vin, "Try link change mask: 0x%x new: 0x%x\n", mask,
> +			mask_new);
> +
> +		if (!mask_new) {
> +			ret = -EMLINK;
> +			goto out;
> +		}
> +
> +		/* New valid CHSEL found, set the new value. */
> +		ret = rvin_set_channel_routing(group->vin[master_id],
> +					       __ffs(mask_new));
> +		if (ret)
> +			goto out;
> +
> +		vin->is_csi = true;
> +	}
>  out:
>  	mutex_unlock(&group->lock);
>
> --
> 2.33.1
>
