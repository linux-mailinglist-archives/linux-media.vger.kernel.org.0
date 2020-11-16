Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 667042B4BC2
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 17:56:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731128AbgKPQyS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 11:54:18 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:49279 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730379AbgKPQyS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 11:54:18 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 48F781BF203;
        Mon, 16 Nov 2020 16:54:14 +0000 (UTC)
Date:   Mon, 16 Nov 2020 17:54:18 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] rcar-vin: Route events to correct video device
Message-ID: <20201116165418.tdv52il2hup3pk5y@uno.localdomain>
References: <20201112225147.1672622-1-niklas.soderlund+renesas@ragnatech.se>
 <20201112225147.1672622-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201112225147.1672622-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Thu, Nov 12, 2020 at 11:51:45PM +0100, Niklas Söderlund wrote:
> The event route for VIN running with a media controller (Gen3) is
> incorrect as all events are only routed to the video device that are
> used to register the async notifier.
>
> Remedy this be examining which subdevice generated the event and route
> it to all VIN(s) that are connected to that subdevice.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

This was easy to miss indeed!

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 44 ++++++++++++++++++---
>  1 file changed, 38 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 3e7a3ae2a6b97045..dca3ab1656a66cef 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -966,18 +966,50 @@ void rvin_v4l2_unregister(struct rvin_dev *vin)
>  	video_unregister_device(&vin->vdev);
>  }
>
> +static void rvin_notify_video_device(struct rvin_dev *vin,
> +				     unsigned int notification, void *arg)
> +{
> +	switch (notification) {
> +	case V4L2_DEVICE_NOTIFY_EVENT:
> +		v4l2_event_queue(&vin->vdev, arg);
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
>  static void rvin_notify(struct v4l2_subdev *sd,
>  			unsigned int notification, void *arg)
>  {
> +	struct v4l2_subdev *remote;
> +	struct rvin_group *group;
> +	struct media_pad *pad;
>  	struct rvin_dev *vin =
>  		container_of(sd->v4l2_dev, struct rvin_dev, v4l2_dev);
> +	unsigned int i;
>
> -	switch (notification) {
> -	case V4L2_DEVICE_NOTIFY_EVENT:
> -		v4l2_event_queue(&vin->vdev, arg);
> -		break;
> -	default:
> -		break;
> +	/* If no media controller, no need to route the event. */
> +	if (!vin->info->use_mc) {
> +		rvin_notify_video_device(vin, notification, arg);
> +		return;
> +	}
> +
> +	group = vin->group;
> +
> +	for (i = 0; i < RCAR_VIN_NUM; i++) {
> +		vin = group->vin[i];
> +		if (!vin)
> +			continue;
> +
> +		pad = media_entity_remote_pad(&vin->pad);
> +		if (!pad)
> +			continue;
> +
> +		remote = media_entity_to_v4l2_subdev(pad->entity);
> +		if (remote != sd)
> +			continue;
> +
> +		rvin_notify_video_device(vin, notification, arg);
>  	}
>  }
>
> --
> 2.29.2
>
