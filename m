Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F05A39CBBD
	for <lists+linux-media@lfdr.de>; Sun,  6 Jun 2021 01:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbhFEXoJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Jun 2021 19:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbhFEXoI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Jun 2021 19:44:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 416E7C061766
        for <linux-media@vger.kernel.org>; Sat,  5 Jun 2021 16:42:20 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98A723E7;
        Sun,  6 Jun 2021 01:42:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622936537;
        bh=gcI1u63OOdgwzova0RJN+3B9zK/EjIBJnjkKsjdlnJI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GKSblxCKPRcoxe5/oBwPQUc1kJtt3iqPvUgGIZYEQ94yFAVaBYogslxDjhkzhltJ6
         jvzHARiANexbbY6RYCRuNR4BhTuOFvkz/4U92EvpRrNa86QfBC5cCjc/lVwL1t0yKA
         CKT8ODDfhouxhHxa2YxbOh23tdvTtOzK9uDbUYec=
Date:   Sun, 6 Jun 2021 02:42:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v7 22/27] v4l: subdev: add stream based configuration
Message-ID: <YLwLzNfyjNN5ASWa@pendragon.ideasonboard.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
 <20210524104408.599645-23-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210524104408.599645-23-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, May 24, 2021 at 01:44:03PM +0300, Tomi Valkeinen wrote:
> Add support to manage configurations (format, crop, compose) per stream,
> instead of per pad. This is accomplished with data structures that hold
> an array of all subdev's stream configurations.
> 
> The number of streams can vary at runtime based on routing. Every time
> the routing is changed, the stream configurations need to be
> re-initialized.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 62 +++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 55 ++++++++++++++++++++++++
>  2 files changed, 117 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index ef18682dbc6f..da6ea9b14631 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1112,3 +1112,65 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
>  	v4l2_subdev_notify(sd, V4L2_DEVICE_NOTIFY_EVENT, (void *)ev);
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_notify_event);
> +
> +int v4l2_init_stream_configs(struct v4l2_subdev_stream_configs *stream_configs,
> +			     const struct v4l2_subdev_krouting *routing)
> +{
> +	u32 num_configs = 0;
> +	unsigned int i;
> +	u32 format_idx = 0;
> +
> +	v4l2_uninit_stream_configs(stream_configs);
> +
> +	/* Count number of formats needed */
> +	for (i = 0; i < routing->num_routes; ++i) {
> +		struct v4l2_subdev_route *route = &routing->routes[i];
> +
> +		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> +			continue;
> +
> +		/* Each route needs a format on both ends of the route */
> +		num_configs += 2;
> +	}
> +
> +	if (num_configs) {
> +		stream_configs->configs =
> +			kvcalloc(num_configs, sizeof(*stream_configs->configs),
> +				 GFP_KERNEL);
> +
> +		if (!stream_configs->configs)
> +			return -ENOMEM;
> +
> +		stream_configs->num_configs = num_configs;
> +	}
> +
> +	/* Fill in the 'pad' and stream' value for each item in the array from the routing table */
> +	for (i = 0; i < routing->num_routes; ++i) {
> +		struct v4l2_subdev_route *route = &routing->routes[i];
> +		u32 idx;
> +
> +		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> +			continue;
> +
> +		idx = format_idx++;
> +
> +		stream_configs->configs[idx].pad = route->sink_pad;
> +		stream_configs->configs[idx].stream = route->sink_stream;
> +
> +		idx = format_idx++;
> +
> +		stream_configs->configs[idx].pad = route->source_pad;
> +		stream_configs->configs[idx].stream = route->source_stream;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_init_stream_configs);
> +
> +void v4l2_uninit_stream_configs(struct v4l2_subdev_stream_configs *stream_configs)
> +{
> +	kvfree(stream_configs->configs);
> +	stream_configs->configs = NULL;
> +	stream_configs->num_configs = 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_uninit_stream_configs);
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 87f6bb78bbe9..39c6b811463a 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -661,6 +661,37 @@ struct v4l2_subdev_pad_config {
>  	struct v4l2_rect try_compose;
>  };
>  
> +/**
> + * struct v4l2_subdev_stream_config - Used for storing stream configuration.
> + *
> + * @pad: pad number
> + * @stream: stream number
> + * @fmt: &struct v4l2_mbus_framefmt
> + * @crop: &struct v4l2_rect to be used for crop
> + * @compose: &struct v4l2_rect to be used for compose
> + *
> + * This structure stores configuration for a stream.
> + */
> +struct v4l2_subdev_stream_config {
> +	u32 pad;
> +	u32 stream;
> +
> +	struct v4l2_mbus_framefmt fmt;
> +	struct v4l2_rect crop;
> +	struct v4l2_rect compose;
> +};
> +
> +/**
> + * struct v4l2_subdev_stream_configs - A collection of stream configs.
> + *
> + * @num_configs: number of entries in @config.
> + * @config: an array of &struct v4l2_subdev_stream_configs.
> + */
> +struct v4l2_subdev_stream_configs {
> +	u32 num_configs;
> +	struct v4l2_subdev_stream_config *configs;
> +};

Honestly, this feels over-complicated and under-specified. What happens
to formats that have been previously configured when routing is changed
? What happens when changing routing while streaming is in progress ?
All these use cases need to be clearly specified.

If you want to go in this direction, this needs to be integrated with
v4l2_subdev_state (which I think you do in a later patch), but also
handled completely in the core. There's no way drivers will get this
right, I don't want them to see v4l2_subdev_stream_configs. On the
upside, embedding v4l2_subdev_state in subdevs would help, but I'm not
sure if it will be enough.

Making subdev pad operations handle streams explicitly opens the door to
thousands of questions, and each of them needs to be answered. I fear
that's a daunting task.

> +
>  /**
>   * struct v4l2_subdev_krouting - subdev routing table
>   *
> @@ -1317,4 +1348,28 @@ int v4l2_subdev_dup_routing(struct v4l2_subdev_krouting *dst,
>  bool v4l2_subdev_has_route(struct v4l2_subdev_krouting *routing,
>  			   unsigned int pad0, unsigned int pad1);
>  
> +
> +/**
> + * v4l2_init_stream_configs() - Initialize stream configs according to routing
> + *
> + * @stream_configs: The stream configs to initialize
> + * @routing: The routing used for the stream configs
> + *
> + * Initializes @stream_configs according to @routing, allocating enough
> + * space to hold configuration for each route endpoint.
> + *
> + * Must be freed with v4l2_uninit_stream_configs().
> + */
> +int v4l2_init_stream_configs(struct v4l2_subdev_stream_configs *stream_configs,
> +			     const struct v4l2_subdev_krouting *routing);
> +
> +/**
> + * v4l2_uninit_stream_configs() - Uninitialize stream configs
> + *
> + * @stream_configs: The stream configs to uninitialize
> + *
> + * Frees any allocated memory in @stream_configs.
> + */
> +void v4l2_uninit_stream_configs(struct v4l2_subdev_stream_configs *stream_configs);
> +
>  #endif

-- 
Regards,

Laurent Pinchart
