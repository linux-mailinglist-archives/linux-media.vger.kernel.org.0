Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7630C4DAEAF
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 12:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355261AbiCPLMC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 07:12:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355220AbiCPLMC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 07:12:02 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D589F64BE4
        for <linux-media@vger.kernel.org>; Wed, 16 Mar 2022 04:10:47 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 7E7D11BF203;
        Wed, 16 Mar 2022 11:10:44 +0000 (UTC)
Date:   Wed, 16 Mar 2022 12:10:42 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v11 32/36] media: subdev: add
 v4l2_subdev_routing_validate() helper
Message-ID: <20220316111042.gi6sjgp6nditlut4@uno.localdomain>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
 <20220301161156.1119557-33-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220301161156.1119557-33-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi

On Tue, Mar 01, 2022 at 06:11:52PM +0200, Tomi Valkeinen wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Add a v4l2_subdev_routing_validate() helper for verifying routing for
> common cases like only allowing non-overlapping 1-to-1 streams.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 102 ++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           |  39 ++++++++++
>  2 files changed, 141 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 1ceee8313246..a19236cf11b8 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1551,6 +1551,108 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
>
> +int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
> +				 const struct v4l2_subdev_krouting *routing,
> +				 enum v4l2_subdev_routing_restriction disallow)
> +{
> +	u32 *remote_pads = NULL;
> +	unsigned int i, j;
> +	int ret = -EINVAL;
> +
> +	if (disallow & V4L2_SUBDEV_ROUTING_NO_STREAM_MIX) {
> +		remote_pads = kcalloc(sd->entity.num_pads, sizeof(*remote_pads),
> +				      GFP_KERNEL);
> +		if (!remote_pads)
> +			return -ENOMEM;
> +
> +		for (i = 0; i < sd->entity.num_pads; ++i)
> +			remote_pads[i] = U32_MAX;
> +	}
> +
> +	for (i = 0; i < routing->num_routes; ++i) {
> +		const struct v4l2_subdev_route *route = &routing->routes[i];

I guess validating non-active routes is intentional.

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> +
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
> +		for (j = i + 1; j < routing->num_routes; ++j) {
> +			const struct v4l2_subdev_route *r = &routing->routes[j];
> +
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
> +
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
> +		}
> +	}
> +
> +	ret = 0;
> +
> +out:
> +	kfree(remote_pads);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_routing_validate);
> +
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>
>  void v4l2_subdev_init(struct v4l2_subdev *sd, const struct v4l2_subdev_ops *ops)
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 97db6dfc0b7a..f75e161d646b 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1514,6 +1514,45 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
>  int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>  			struct v4l2_subdev_format *format);
>
> +/**
> + * enum v4l2_subdev_routing_restriction - Subdevice internal routing restrictions
> + *
> + * @V4L2_SUBDEV_ROUTING_NO_1_TO_N:
> + *	an input stream may not be routed to multiple output streams (stream
> + *	duplication)
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
> +	V4L2_SUBDEV_ROUTING_NO_1_TO_N = BIT(0),
> +	V4L2_SUBDEV_ROUTING_NO_N_TO_1 = BIT(1),
> +	V4L2_SUBDEV_ROUTING_NO_STREAM_MIX = BIT(2),
> +	V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 =
> +		V4L2_SUBDEV_ROUTING_NO_1_TO_N |
> +		V4L2_SUBDEV_ROUTING_NO_N_TO_1,
> +};
> +
> +/**
> + * v4l2_subdev_routing_validate() - Verify that routes comply with driver
> + *				    constraints
> + * @sd: The subdevice
> + * @routing: Routing to verify
> + * @disallow: Restrictions on routes
> + *
> + * This verifies that the given routing complies with the @disallow constraints.
> + *
> + * Returns 0 on success, error value otherwise.
> + */
> +int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
> +				 const struct v4l2_subdev_krouting *routing,
> +				 enum v4l2_subdev_routing_restriction disallow);
> +
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>
>  /**
> --
> 2.25.1
>
