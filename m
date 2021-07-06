Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C48313BDBB1
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 18:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbhGFQzn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 12:55:43 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:37341 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbhGFQzm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 12:55:42 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 23DD3200003;
        Tue,  6 Jul 2021 16:53:01 +0000 (UTC)
Date:   Tue, 6 Jul 2021 18:53:50 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 05/11] rcar-vin: Rename array storing subdevice
 information
Message-ID: <20210706165350.fq3xyh2ukoj5gvyo@uno.localdomain>
References: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
 <20210413180253.2575451-6-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210413180253.2575451-6-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Tue, Apr 13, 2021 at 08:02:47PM +0200, Niklas Söderlund wrote:
> The VIN group have always been connected to CSI-2 receivers and this
> have spilled over to the naming of the array storing the subdevice
> information. In preparation for connecting other types of subdevices
> rename the array to remotes.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Seems a rather good idea!

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j
> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 32 ++++++++++-----------
>  drivers/media/platform/rcar-vin/rcar-vin.h  |  8 ++++--
>  2 files changed, 21 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 81574bf33116ad59..cc980cad805c022c 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -49,16 +49,16 @@
>   */
>
>  /* group lock should be held when calling this function. */
> -static int rvin_group_entity_to_csi_id(struct rvin_group *group,
> -				       struct media_entity *entity)
> +static int rvin_group_entity_to_remote_id(struct rvin_group *group,
> +					  struct media_entity *entity)
>  {
>  	struct v4l2_subdev *sd;
>  	unsigned int i;
>
>  	sd = media_entity_to_v4l2_subdev(entity);
>
> -	for (i = 0; i < RVIN_CSI_MAX; i++)
> -		if (group->csi[i].subdev == sd)
> +	for (i = 0; i < RVIN_REMOTES_MAX; i++)
> +		if (group->remotes[i].subdev == sd)
>  			return i;
>
>  	return -ENODEV;
> @@ -163,14 +163,14 @@ static int rvin_group_link_notify(struct media_link *link, u32 flags,
>  		if (!csi_pad)
>  			continue;
>
> -		csi_id = rvin_group_entity_to_csi_id(group, csi_pad->entity);
> +		csi_id = rvin_group_entity_to_remote_id(group, csi_pad->entity);
>  		channel = rvin_group_csi_pad_to_channel(csi_pad->index);
>
>  		mask &= rvin_group_get_mask(group->vin[i], csi_id, channel);
>  	}
>
>  	/* Add the new link to the existing mask and check if it works. */
> -	csi_id = rvin_group_entity_to_csi_id(group, link->source->entity);
> +	csi_id = rvin_group_entity_to_remote_id(group, link->source->entity);
>
>  	if (csi_id == -ENODEV) {
>  		struct v4l2_subdev *sd;
> @@ -766,10 +766,10 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
>  			continue;
>
>  		/* Check that CSI-2 is part of the group. */
> -		if (!vin->group->csi[route->csi].subdev)
> +		if (!vin->group->remotes[route->csi].subdev)
>  			continue;
>
> -		source = &vin->group->csi[route->csi].subdev->entity;
> +		source = &vin->group->remotes[route->csi].subdev->entity;
>  		source_idx = rvin_group_csi_channel_to_pad(route->channel);
>  		source_pad = &source->pads[source_idx];
>
> @@ -806,10 +806,10 @@ static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
>  	mutex_lock(&vin->group->lock);
>
>  	for (i = 0; i < RVIN_CSI_MAX; i++) {
> -		if (vin->group->csi[i].asd != asd)
> +		if (vin->group->remotes[i].asd != asd)
>  			continue;
> -		vin->group->csi[i].subdev = NULL;
> -		vin_dbg(vin, "Unbind CSI-2 %s from slot %u\n", subdev->name, i);
> +		vin->group->remotes[i].subdev = NULL;
> +		vin_dbg(vin, "Unbind %s from slot %u\n", subdev->name, i);
>  		break;
>  	}
>
> @@ -828,10 +828,10 @@ static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
>  	mutex_lock(&vin->group->lock);
>
>  	for (i = 0; i < RVIN_CSI_MAX; i++) {
> -		if (vin->group->csi[i].asd != asd)
> +		if (vin->group->remotes[i].asd != asd)
>  			continue;
> -		vin->group->csi[i].subdev = subdev;
> -		vin_dbg(vin, "Bound CSI-2 %s to slot %u\n", subdev->name, i);
> +		vin->group->remotes[i].subdev = subdev;
> +		vin_dbg(vin, "Bound %s to slot %u\n", subdev->name, i);
>  		break;
>  	}
>
> @@ -883,7 +883,7 @@ static int rvin_mc_parse_of(struct rvin_dev *vin, unsigned int id)
>  		goto out;
>  	}
>
> -	vin->group->csi[vep.base.id].asd = asd;
> +	vin->group->remotes[vep.base.id].asd = asd;
>
>  	vin_dbg(vin, "Add group OF device %pOF to slot %u\n",
>  		to_of_node(fwnode), vep.base.id);
> @@ -928,7 +928,7 @@ static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
>  			continue;
>
>  		for (id = 0; id < RVIN_CSI_MAX; id++) {
> -			if (vin->group->csi[id].asd)
> +			if (vin->group->remotes[id].asd)
>  				continue;
>
>  			ret = rvin_mc_parse_of(vin->group->vin[i], id);
> diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> index b263ead4db2bfb08..39207aaf39ef9391 100644
> --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> @@ -48,6 +48,8 @@ enum rvin_csi_id {
>  	RVIN_CSI_MAX,
>  };
>
> +#define RVIN_REMOTES_MAX RVIN_CSI_MAX
> +
>  /**
>   * enum rvin_dma_state - DMA states
>   * @STOPPED:   No operation in progress
> @@ -267,8 +269,8 @@ struct rvin_dev {
>   * @count:		number of enabled VIN instances found in DT
>   * @notifier:		group notifier for CSI-2 async subdevices
>   * @vin:		VIN instances which are part of the group
> - * @csi:		array of pairs of fwnode and subdev pointers
> - *			to all CSI-2 subdevices.
> + * @remotes:		array of pairs of fwnode and subdev pointers
> + *			to all remote subdevices.
>   */
>  struct rvin_group {
>  	struct kref refcount;
> @@ -283,7 +285,7 @@ struct rvin_group {
>  	struct {
>  		struct v4l2_async_subdev *asd;
>  		struct v4l2_subdev *subdev;
> -	} csi[RVIN_CSI_MAX];
> +	} remotes[RVIN_REMOTES_MAX];
>  };
>
>  int rvin_dma_register(struct rvin_dev *vin, int irq);
> --
> 2.31.1
>
