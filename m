Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7F54771F8
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 13:39:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234404AbhLPMjO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 07:39:14 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37048 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbhLPMjO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 07:39:14 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4C9B3F6;
        Thu, 16 Dec 2021 13:39:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639658353;
        bh=yv6a7OIfZwnB5j0HMiQW5n8V5kL9wz6Q/Dy9DoEX12w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FROHEYg/rJ9omALe8S3++KciLd4hP85/89+lPyXB2vljkFEeZsll5mdPxDheFwFVc
         he5i7GVc8f3tFDC6NafOLoUI48NYZFGqRqz/G3/bRzUV2qsKf96x7gobF5waRgcvnO
         wWrpyI5HjKghK/l6d/i9RIDoFiIu47VIRpF4pV+U=
Date:   Thu, 16 Dec 2021 14:39:09 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        niklas.soderlund@ragnatech.se, kieran.bingham@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 01/13] media: max9286: Add support for
 v4l2_subdev_state
Message-ID: <YbszbYppvy7M9KIw@pendragon.ideasonboard.com>
References: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
 <20211017182449.64192-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211017182449.64192-2-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Sun, Oct 17, 2021 at 08:24:37PM +0200, Jacopo Mondi wrote:
> Create and initialize the v4l2_subdev_state for the max9286 driver in
> order to prepare to support routing operations and multiplexed streams.
> 
> Create the subdevice state with v4l2_subdev_init_finalize() and
> implement the init_cfg() operation to guarantee the state is initialized
> correctly with the default device format.
> 
> Remove the max9286_open() subdev internal operation as the format of the
> file-handle state is now initialized by init_cfg().
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 90 +++++++++++++++++++++++--------------
>  1 file changed, 57 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 1b92d18a1f94..5997fe40509f 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -215,6 +215,17 @@ static inline struct max9286_priv *sd_to_max9286(struct v4l2_subdev *sd)
>  	return container_of(sd, struct max9286_priv, sd);
>  }
>  
> +static const struct v4l2_mbus_framefmt max9286_default_format = {
> +	.width		= 1280,
> +	.height		= 800,
> +	.code		= MEDIA_BUS_FMT_UYVY8_1X16,
> +	.colorspace	= V4L2_COLORSPACE_SRGB,
> +	.field		= V4L2_FIELD_NONE,
> +	.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
> +	.quantization	= V4L2_QUANTIZATION_DEFAULT,
> +	.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * I2C IO
>   */
> @@ -822,11 +833,45 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int max9286_init_cfg(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_subdev_route routes[MAX9286_NUM_GMSL];
> +	struct max9286_priv *priv = sd_to_max9286(sd);
> +	struct v4l2_subdev_krouting routing;
> +	struct max9286_source *source;
> +	unsigned int num_routes = 0;
> +	int ret;
> +
> +	/* Create a route for each enable source. */
> +	for_each_source(priv, source) {
> +		struct v4l2_subdev_route *route = &routes[num_routes++];
> +		unsigned int idx = to_index(priv, source);
> +
> +		route->sink_pad = idx;
> +		route->sink_stream = 0;
> +		route->source_pad = MAX9286_SRC_PAD;
> +		route->source_stream = idx;
> +		route->flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
> +	}
> +
> +	routing.num_routes = num_routes;
> +	routing.routes = routes;
> +
> +	state = v4l2_subdev_validate_and_lock_state(sd, state);
> +	ret = v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
> +					       &max9286_default_format);
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
> +}
> +
>  static const struct v4l2_subdev_video_ops max9286_video_ops = {
>  	.s_stream	= max9286_s_stream,
>  };
>  
>  static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
> +	.init_cfg	= max9286_init_cfg,
>  	.enum_mbus_code = max9286_enum_mbus_code,
>  	.get_fmt	= max9286_get_fmt,
>  	.set_fmt	= max9286_set_fmt,
> @@ -837,35 +882,6 @@ static const struct v4l2_subdev_ops max9286_subdev_ops = {
>  	.pad		= &max9286_pad_ops,
>  };
>  
> -static void max9286_init_format(struct v4l2_mbus_framefmt *fmt)
> -{
> -	fmt->width		= 1280;
> -	fmt->height		= 800;
> -	fmt->code		= MEDIA_BUS_FMT_UYVY8_1X16;
> -	fmt->colorspace		= V4L2_COLORSPACE_SRGB;
> -	fmt->field		= V4L2_FIELD_NONE;
> -	fmt->ycbcr_enc		= V4L2_YCBCR_ENC_DEFAULT;
> -	fmt->quantization	= V4L2_QUANTIZATION_DEFAULT;
> -	fmt->xfer_func		= V4L2_XFER_FUNC_DEFAULT;
> -}
> -
> -static int max9286_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
> -{
> -	struct v4l2_mbus_framefmt *format;
> -	unsigned int i;
> -
> -	for (i = 0; i < MAX9286_N_SINKS; i++) {
> -		format = v4l2_subdev_get_try_format(subdev, fh->state, i);
> -		max9286_init_format(format);
> -	}
> -
> -	return 0;
> -}
> -
> -static const struct v4l2_subdev_internal_ops max9286_subdev_internal_ops = {
> -	.open = max9286_open,
> -};
> -
>  static int max9286_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	switch (ctrl->id) {
> @@ -897,11 +913,11 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
>  	/* Configure V4L2 for the MAX9286 itself */
>  
>  	for (i = 0; i < MAX9286_N_SINKS; i++)
> -		max9286_init_format(&priv->fmt[i]);
> +		priv->fmt[i] = max9286_default_format;
>  
>  	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max9286_subdev_ops);
> -	priv->sd.internal_ops = &max9286_subdev_internal_ops;
> -	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +			  V4L2_SUBDEV_FL_MULTIPLEXED;
>  
>  	v4l2_ctrl_handler_init(&priv->ctrls, 1);
>  	priv->pixelrate = v4l2_ctrl_new_std(&priv->ctrls,
> @@ -933,14 +949,21 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
>  	}
>  	priv->sd.fwnode = ep;
>  
> +	ret = v4l2_subdev_init_finalize(&priv->sd);
> +	if (ret)
> +		goto err_put_node;
> +
>  	ret = v4l2_async_register_subdev(&priv->sd);
>  	if (ret < 0) {
>  		dev_err(dev, "Unable to register subdevice\n");
> -		goto err_put_node;
> +		goto err_free_state;
>  	}
>  
>  	return 0;
>  
> +err_free_state:

I'd call this new label err_subdev_cleanup.

> +	v4l2_subdev_cleanup(&priv->sd);
> +
>  err_put_node:
>  	fwnode_handle_put(ep);
>  err_async:
> @@ -953,6 +976,7 @@ static void max9286_v4l2_unregister(struct max9286_priv *priv)
>  {
>  	fwnode_handle_put(priv->sd.fwnode);
>  	v4l2_async_unregister_subdev(&priv->sd);
> +	v4l2_subdev_cleanup(&priv->sd);
>  	max9286_v4l2_notifier_unregister(priv);
>  }
>  

-- 
Regards,

Laurent Pinchart
