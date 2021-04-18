Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02868363738
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 20:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbhDRS4O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 14:56:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60934 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhDRS4N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 14:56:13 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BB6D4AB;
        Sun, 18 Apr 2021 20:55:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618772144;
        bh=Vz3nugUin9eIjbHnWzKDolbZrjz06VmUrjH5/7XjYLQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hsOUNGyelIE5Y3glTvPyNViDROHXZMUCKUdx0FOEgIDr+KxkgkzUvS2mwn6XY/mHc
         9hOGAc2ttMbItFJf5eCvwxtIryrC1i3A+hxK3Y+iuPW4fuUH3QLWYDjtA6AkW5JivO
         TxuaVCkGgv+9h32JwNHqtYhjdKVwhJbatTIwBSqs=
Date:   Sun, 18 Apr 2021 21:55:40 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 20/24] v4l: mc: Add an S_ROUTING helper function for
 power state changes
Message-ID: <YHyArMhUhcamSf++@pendragon.ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-21-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210415130450.421168-21-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi and Sakari,

Thank you for the patch.

On Thu, Apr 15, 2021 at 04:04:46PM +0300, Tomi Valkeinen wrote:
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> With the addition of the has_route() media entity operation, all pads of an
> entity are no longer interconnected. The S_ROUTING IOCTL for sub-devices can
> be used to enable and disable routes for an entity. The consequence is that
> the routing information has to be taken into account in use count
> calculation: disabling a route has a very similar effect on use counts as
> has disabling a link.
> 
> Add a helper function for drivers implementing VIDIOC_SUBDEV_S_ROUTING
> IOCTL to take the change into account.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/v4l2-core/v4l2-mc.c | 34 +++++++++++++++++++++++++++++++
>  include/media/v4l2-mc.h           | 22 ++++++++++++++++++++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
> index 35d18ed89fa5..71acb389aa7b 100644
> --- a/drivers/media/v4l2-core/v4l2-mc.c
> +++ b/drivers/media/v4l2-core/v4l2-mc.c
> @@ -588,3 +588,37 @@ int v4l2_pipeline_link_notify(struct media_link *link, u32 flags,
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_pipeline_link_notify);
> +
> +int v4l2_subdev_routing_pm_use(struct media_entity *entity,
> +			       struct v4l2_subdev_route *route)
> +{
> +	struct media_graph *graph =
> +		&entity->graph_obj.mdev->pm_count_walk;
> +	struct media_pad *source = &entity->pads[route->source_pad];
> +	struct media_pad *sink = &entity->pads[route->sink_pad];
> +	int source_use;
> +	int sink_use;
> +	int ret;
> +
> +	source_use = pipeline_pm_use_count(source, graph);
> +	sink_use = pipeline_pm_use_count(sink, graph);
> +
> +	if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE)) {
> +		/* Route disabled. */
> +		pipeline_pm_power(source, -sink_use, graph);
> +		pipeline_pm_power(sink, -source_use, graph);
> +		return 0;
> +	}
> +
> +	/* Route enabled. */
> +	ret = pipeline_pm_power(source, sink_use, graph);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = pipeline_pm_power(sink, source_use, graph);
> +	if (ret < 0)
> +		pipeline_pm_power(source, -sink_use, graph);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_routing_pm_use);

.s_power() is getting deprecated for sensors. Sakari, should we move
away from pipeline-based power management and drop this patch, or is it
too early ?

> diff --git a/include/media/v4l2-mc.h b/include/media/v4l2-mc.h
> index c181685923d5..ab8f4dc143aa 100644
> --- a/include/media/v4l2-mc.h
> +++ b/include/media/v4l2-mc.h
> @@ -18,6 +18,7 @@
>  /* We don't need to include pci.h or usb.h here */
>  struct pci_dev;
>  struct usb_device;
> +struct v4l2_subdev_route;
>  
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  /**
> @@ -184,6 +185,22 @@ void v4l2_pipeline_pm_put(struct media_entity *entity);
>  int v4l2_pipeline_link_notify(struct media_link *link, u32 flags,
>  			      unsigned int notification);
>  
> +/**
> + * v4l2_subdev_routing_pm_use - Handle power state changes due to S_ROUTING
> + * @entity: The entity
> + * @route: The new state of the route
> + *
> + * Propagate the use count across a route in a pipeline whenever the
> + * route is enabled or disabled. The function is called before
> + * changing the route state when enabling a route, and after changing
> + * the route state when disabling a route.
> + *
> + * Return 0 on success or a negative error code on failure. Powering entities
> + * off is assumed to never fail. This function will not fail for disconnection
> + * events.

"disconnection events" make me think about hotplug. How about "will not
fail when disabling a route" ?

> + */
> +int v4l2_subdev_routing_pm_use(struct media_entity *entity,
> +			       struct v4l2_subdev_route *route);
>  #else /* CONFIG_MEDIA_CONTROLLER */
>  
>  static inline int v4l2_mc_create_media_graph(struct media_device *mdev)
> @@ -219,5 +236,10 @@ static inline int v4l2_pipeline_link_notify(struct media_link *link, u32 flags,
>  	return 0;
>  }
>  
> +static inline int v4l2_subdev_routing_pm_use(struct media_entity *entity,
> +					     struct v4l2_subdev_route *route)
> +{
> +	return 0;
> +}

Missing blank line.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

(assuming we want to keep the patch)

>  #endif /* CONFIG_MEDIA_CONTROLLER */
>  #endif /* _V4L2_MC_H */

-- 
Regards,

Laurent Pinchart
