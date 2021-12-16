Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 283D1477218
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 13:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236897AbhLPMog (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 07:44:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232070AbhLPMof (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 07:44:35 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9547C061574;
        Thu, 16 Dec 2021 04:44:35 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45EF73F6;
        Thu, 16 Dec 2021 13:44:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639658673;
        bh=iYAR0vVeij0f/OkIbA2oCC/R0wn2qfRcGMA2wDPn85w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E7LFhUyOpE5sDR7vhHCYfJtfVWQnibYO1mZ4I8lkFY549EUa+6hq/+JKSGzHkaGJY
         ZJGXsRGiUuPwGwUnnhgvvrXFnvbmEgufIsuI7SXmWJr6ix9iK8KrSN2lk1svvIOUFZ
         G9EOjO6L+eSnYXIrFoyzO1/fCzTkw8ES2eRFHOF8=
Date:   Thu, 16 Dec 2021 14:44:31 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        niklas.soderlund@ragnatech.se, kieran.bingham@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 02/13] media: max9286: Implement set_routing
Message-ID: <Ybs0r4ysfpdfUJda@pendragon.ideasonboard.com>
References: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
 <20211017182449.64192-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211017182449.64192-3-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Sun, Oct 17, 2021 at 08:24:38PM +0200, Jacopo Mondi wrote:
> Add the set_routing() subdev operation to allow userspace to configure
> routing on the max9286 deserializer.
> 
> Implement route verification but do not take routing into consideration
> when configuring the CSI-2 output and pixel rate yet.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 88 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 86 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 5997fe40509f..54b4067168df 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -833,6 +833,90 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int max9286_routing_verify(struct max9286_priv *priv,
> +				  struct v4l2_subdev_krouting *routing)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	ret = v4l2_routing_simple_verify(routing);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Make sure all routes points to the single source pad which can have
> +	 * up to 4 streams. All routes shall start from a sink pad and shall not
> +	 * have more than one sink stream. The GMSL link for the sink has to be
> +	 * enabled.
> +	 */
> +	for (i = 0; i < routing->num_routes; ++i) {
> +		const struct v4l2_subdev_route *route = &routing->routes[i];
> +		struct max9286_source *source = &priv->sources[i];
> +
> +		if (route->source_pad != MAX9286_SRC_PAD ||
> +		    route->source_stream > 4) {
> +			dev_err(&priv->client->dev,
> +				"Invalid (%u,%u) source in route %u\n",
> +				route->source_pad, route->source_stream, i);
> +			return -EINVAL;
> +		}
> +
> +		if (route->sink_pad >= MAX9286_N_SINKS ||
> +		    route->sink_stream != 0) {
> +			dev_err(&priv->client->dev,
> +				"Invalid (%u,%u) sink in route %u\n",
> +				route->sink_pad, route->sink_stream, i);
> +			return -EINVAL;
> +		}
> +
> +		source = &priv->sources[route->sink_pad];
> +		if (!source->fwnode) {
> +			dev_err(&priv->client->dev,
> +				"Cannot set route for non-active source %u\n",
> +				route->sink_pad);
> +			return -EINVAL;
> +		}
> +	}

I have a patch on top of muxed streams v10 that will simplify this, I'll
post it shortly and CC you.

> +
> +	return 0;
> +}
> +
> +static int _max9286_set_routing(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *state,
> +				struct v4l2_subdev_krouting *routing)
> +{
> +	struct max9286_priv *priv = sd_to_max9286(sd);
> +	int ret;
> +
> +	ret = max9286_routing_verify(priv, routing);
> +	if (ret)
> +		return ret;
> +
> +	/* Re-initialize the format on a routing change. */
> +	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing,
> +					       &max9286_default_format);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int max9286_set_routing(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_state *state,
> +			       enum v4l2_subdev_format_whence which,
> +			       struct v4l2_subdev_krouting *routing)
> +{
> +	struct max9286_priv *priv = sd_to_max9286(sd);
> +	unsigned int i;
> +	int ret;
> +
> +	state = v4l2_subdev_validate_and_lock_state(sd, state);
> +	ret = _max9286_set_routing(sd, state, routing);
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
> +}
> +
>  static int max9286_init_cfg(struct v4l2_subdev *sd,
>  			    struct v4l2_subdev_state *state)
>  {
> @@ -859,8 +943,7 @@ static int max9286_init_cfg(struct v4l2_subdev *sd,
>  	routing.routes = routes;
>  
>  	state = v4l2_subdev_validate_and_lock_state(sd, state);
> -	ret = v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
> -					       &max9286_default_format);
> +	ret = _max9286_set_routing(sd, state, &routing);
>  	v4l2_subdev_unlock_state(state);
>  
>  	return ret;
> @@ -875,6 +958,7 @@ static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
>  	.enum_mbus_code = max9286_enum_mbus_code,
>  	.get_fmt	= max9286_get_fmt,
>  	.set_fmt	= max9286_set_fmt,
> +	.set_routing	= max9286_set_routing,
>  };
>  
>  static const struct v4l2_subdev_ops max9286_subdev_ops = {

-- 
Regards,

Laurent Pinchart
