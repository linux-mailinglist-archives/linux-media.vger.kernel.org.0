Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B72247885F
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 11:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234669AbhLQKHO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 05:07:14 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:46475 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231968AbhLQKHN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 05:07:13 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id B396F240015;
        Fri, 17 Dec 2021 10:07:10 +0000 (UTC)
Date:   Fri, 17 Dec 2021 11:08:02 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 2/2] media: subdev: Extend routing validation helper
Message-ID: <20211217100802.yb5fskdyhhknmzxk@uno.localdomain>
References: <20211216131510.12308-1-laurent.pinchart+renesas@ideasonboard.com>
 <20211216131510.12308-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211216131510.12308-3-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Dec 16, 2021 at 03:15:10PM +0200, Laurent Pinchart wrote:
> There are more common constraints on routing than the ones validated by
> v4l2_subdev_routing_validate_1_to_1(). Extend the function to support
> more validation, conditioned by constraint flags.
>

I'm debated: is this sweet or over-designed ? :)

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 97 ++++++++++++++++++++++++---
>  include/media/v4l2-subdev.h           | 41 ++++++++---
>  2 files changed, 121 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 73ee7f01838f..e7fb694cc5df 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -9,6 +9,7 @@
>   */
>
>  #include <linux/ioctl.h>
> +#include <linux/limits.h>
>  #include <linux/mm.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> @@ -1582,29 +1583,107 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
>
> -int v4l2_subdev_routing_validate_1_to_1(const struct v4l2_subdev_krouting *routing)
> +int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
> +				 const struct v4l2_subdev_krouting *routing,
> +				 enum v4l2_subdev_routing_restriction disallow)
>  {
> +	u32 *remote_pads = NULL;
>  	unsigned int i, j;
> +	int ret = -EINVAL;
> +
> +	if (disallow & V4L2_SUBDEV_ROUTING_NO_STREAM_MIX) {

The STREAM_MIX in particular makes me wonder what use case is this
for.

> +		remote_pads = kcalloc(sd->entity.num_pads, sizeof(*remote_pads),
> +				      GFP_KERNEL);
> +		if (!remote_pads)
> +			return -ENOMEM;
> +
> +		for (i = 0; i < sd->entity.num_pads; ++i)
> +			remote_pads[i] = U32_MAX;
> +	}
>
>  	for (i = 0; i < routing->num_routes; ++i) {
>  		const struct v4l2_subdev_route *route = &routing->routes[i];
>
> +		/* Validate the sink and source pad numbers. */
> +		if (route->sink_pad >= sd->entity.num_pads ||
> +		    !(sd->entity.pads[route->sink_pad].flags & MEDIA_PAD_FL_SINK)) {
> +			dev_dbg(sd->dev, "route %u sink (%u) is not a sink pad\n",
> +				i, route->sink_pad);
> +			goto out;
> +		}
> +
> +		if (route->source_pad >= sd->entity.num_pads ||
> +		    !(sd->entity.pads[route->source_pad].flags & MEDIA_PAD_FL_SOURCE)) {
> +			dev_dbg(sd->dev, "route %u source (%u) is not a source pad\n",
> +				i, route->source_pad);
> +			goto out;
> +		}
> +
> +		/*
> +		 * V4L2_SUBDEV_ROUTING_NO_STREAM_MIX: Streams on the same pad
> +		 * may not be routed to streams on different pads.

s/on the same/from the same/ ?
s/may/shall ?

> +		 */
> +		if (disallow & V4L2_SUBDEV_ROUTING_NO_STREAM_MIX) {
> +			if (remote_pads[route->sink_pad] != U32_MAX &&
> +			    remote_pads[route->sink_pad] != route->source_pad) {
> +				dev_dbg(sd->dev,
> +					"route %u attempts to mix %s streams\n",
> +					i, "sink");
> +				goto out;
> +			}
> +
> +			if (remote_pads[route->source_pad] != U32_MAX &&
> +			    remote_pads[route->source_pad] != route->sink_pad) {
> +				dev_dbg(sd->dev,
> +					"route %u attempts to mix %s streams\n",
> +					i, "source");
> +				goto out;
> +			}
> +
> +			remote_pads[route->sink_pad] = route->source_pad;
> +			remote_pads[route->source_pad] = route->sink_pad;
> +		}
> +
>  		for (j = i + 1; j < routing->num_routes; ++j) {
>  			const struct v4l2_subdev_route *r = &routing->routes[j];
>
> -			if (route->sink_pad == r->sink_pad &&
> -			    route->sink_stream == r->sink_stream)
> -				return -EINVAL;
> +			/*
> +			 * V4L2_SUBDEV_ROUTING_NO_1_TO_N: No two routes can
> +			 * originate from the same (sink) stream.
> +			 */
> +			if ((disallow & V4L2_SUBDEV_ROUTING_NO_1_TO_N) &&
> +			    route->sink_pad == r->sink_pad &&
> +			    route->sink_stream == r->sink_stream) {
> +				dev_dbg(sd->dev,
> +					"routes %u and %u originate from same sink (%u/%u)\n",
> +					i, j, route->sink_pad,
> +					route->sink_stream);
> +				goto out;
> +			}
>
> -			if (route->source_pad == r->source_pad &&
> -			    route->source_stream == r->source_stream)
> -				return -EINVAL;
> +			/*
> +			 * V4L2_SUBDEV_ROUTING_NO_N_TO_1: No two routes can end
> +			 * at the same (source) stream.
> +			 */
> +			if ((disallow & V4L2_SUBDEV_ROUTING_NO_N_TO_1) &&
> +			    route->source_pad == r->source_pad &&
> +			    route->source_stream == r->source_stream) {
> +				dev_dbg(sd->dev,
> +					"routes %u and %u end at same source (%u/%u)\n",
> +					i, j, route->source_pad,
> +					route->source_stream);
> +				goto out;
> +			}
>  		}
>  	}
>
> -	return 0;
> +	ret = 0;
> +
> +out:
> +	kfree(remote_pads);
> +	return ret;
>  }
> -EXPORT_SYMBOL_GPL(v4l2_subdev_routing_validate_1_to_1);
> +EXPORT_SYMBOL_GPL(v4l2_subdev_routing_validate);
>
>  struct v4l2_subdev_route *
>  __v4l2_subdev_next_active_route(const struct v4l2_subdev_krouting *routing,
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index aff1fb3a30d5..65c3e419a57d 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1573,18 +1573,43 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>  			struct v4l2_subdev_format *format);
>
>  /**
> - * v4l2_subdev_routing_validate_1_to_1() - Verify that all streams are
> - *                                         non-overlapping 1-to-1 streams
> - * @routing: routing to verify
> + * enum v4l2_subdev_routing_restriction - Subdevice internal routing restrictions
>   *
> - * This verifies that the given routing contains only non-overlapping 1-to-1
> - * streams. In other words, no two streams have the same source or sink
> - * stream ID on a single pad. This is the most common case of routing
> - * supported by devices.
> + * @V4L2_SUBDEV_ROUTING_NO_1_TO_N:
> + * 	an input stream may not be routed to multiple output streams (stream

very minor nit: can we enforce the usage of 'sink' and 'source' for
streams instead of using 'input' and 'output' ?

> + * 	duplication)
> + * @V4L2_SUBDEV_ROUTING_NO_N_TO_1:
> + *	multiple input streams may not be routed to the same output stream
> + *	(stream merging)
> + * @V4L2_SUBDEV_ROUTING_NO_STREAM_MIX:
> + *	streams on the same pad may not be routed to streams on different pads
> + * @V4L2_SUBDEV_ROUTING_ONLY_1_TO_1:
> + *	only non-overlapping 1-to-1 stream routing is allowed (a combination of
> + *	@V4L2_SUBDEV_ROUTING_NO_1_TO_N and @V4L2_SUBDEV_ROUTING_NO_N_TO_1)
> + */
> +enum v4l2_subdev_routing_restriction {

I've seen that you rebased max9286 on this and there the
v4l2_subdev_routing_validate() function is called with a '0' disallow
flag. Should a V4L2_SUBDEV_ROUTING_SIMPLE = 0 field be added here ?

> +	V4L2_SUBDEV_ROUTING_NO_1_TO_N = BIT(0),
> +	V4L2_SUBDEV_ROUTING_NO_N_TO_1 = BIT(1),
> +	V4L2_SUBDEV_ROUTING_NO_STREAM_MIX = BIT(2),
> +	V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 =
> +		V4L2_SUBDEV_ROUTING_NO_1_TO_N |
> +		V4L2_SUBDEV_ROUTING_NO_N_TO_1,

OR-ing NO_1_TO_N, NO_N_TO_1 and NO_STREAM_MIX gives a
ROUTING_PASSTHROUGH ? (ie all the streams from one sink pad are routed to
exactly one stream on a source pad). Is this a valid constraint ?

Using the max9286 as an example, and for the sake of discussion I
would have defined constrains in terms of the entity capabilities

- A MUXER can route streams from multiple sink pads to streams of a
  source pad -> sink streams shall be equal to 0 - This is the typical
  CSI-2 transmitter

- A DEMUXER can route streams from a single sink pad to streams of
  multiple source pad -> source streams shall be equal to 0 - This is
  the typical CSI-2 receiver

Which is a simpler case to start with (and would have allowed me to
remove most of the custom validation from the driver).

On top of this, the validation above about how streams could be
demuxed/coalesced together might apply on top ? (I admit it is not
totally clear to how streams coalescing would work, in example for
video/embedded data transmission on the same VC).

Thanks
   j

> +};
> +
> +/**
> + * v4l2_subdev_routing_validate() - Verify that routes comply with driver
> + *				    constraints
> + * @sd: The subdevice
> + * @routing: Routing to verify
> + * @disallow: Restrictions on routes
> + *
> + * This verifies that the given routing complies with the @disallow contraints.
>   *
>   * Returns 0 on success, error value otherwise.
>   */
> -int v4l2_subdev_routing_validate_1_to_1(const struct v4l2_subdev_krouting *routing);
> +int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
> +				 const struct v4l2_subdev_krouting *routing,
> +				 enum v4l2_subdev_routing_restriction disallow);
>
>  struct v4l2_subdev_route *
>  __v4l2_subdev_next_active_route(const struct v4l2_subdev_krouting *routing,
> --
> Regards,
>
> Laurent Pinchart
>
