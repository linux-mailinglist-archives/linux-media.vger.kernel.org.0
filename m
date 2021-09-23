Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C672415521
	for <lists+linux-media@lfdr.de>; Thu, 23 Sep 2021 03:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238807AbhIWBdR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 21:33:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34086 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238177AbhIWBdR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 21:33:17 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF72D45E;
        Thu, 23 Sep 2021 03:31:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632360705;
        bh=uXTQqtiTaeRZ1y01GbPagVgXEtwI1y+AlWrWF9rXAeo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y6IHdJYImighqSxmpCf0wt//igLAacXzKlB+cW5ZaVkmljwqZrU/MREStVwjUwwZd
         nhn60gviYmiiXYlfgu0VaFWhA9Fv0e0YO60vEJQQYuZ22wk1wORD5dEve4sdxZJl/5
         qOjL6fjlD9DSAFkBNF6DUP1CjFmnVsYe4oOTDObw=
Date:   Thu, 23 Sep 2021 04:31:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        niklas.soderlund@ragnatech.se, kieran.bingham@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Thomas NIZAN <tnizan@witekio.com>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/5] media: max9286: Implement multiplexed support
Message-ID: <YUvY/4snwoBDdsGC@pendragon.ideasonboard.com>
References: <20210918150507.987294-1-jacopo+renesas@jmondi.org>
 <20210918150507.987294-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210918150507.987294-2-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Sat, Sep 18, 2021 at 05:05:03PM +0200, Jacopo Mondi wrote:
> Implement support for multiplexed streams to the max9286 driver.
> 
> Add support for the init_cfg, get_frame_desc and set_routing operations
> and move format handling to the subdevice state.

It may make sense to split part of this out (namely the switch to
.init_cfg() and the move to subdevice state, either as separate patches
or grouped together).

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 235 ++++++++++++++++++++++++------------
>  1 file changed, 160 insertions(+), 75 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 1b92d18a1f94..baff86a4dcec 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -476,6 +476,18 @@ static int max9286_check_config_link(struct max9286_priv *priv,
>  	return 0;
>  }
>  
> +static void max9286_init_format(struct v4l2_mbus_framefmt *fmt)
> +{
> +	fmt->width		= 1280;
> +	fmt->height		= 800;
> +	fmt->code		= MEDIA_BUS_FMT_UYVY8_1X16;
> +	fmt->colorspace		= V4L2_COLORSPACE_SRGB;
> +	fmt->field		= V4L2_FIELD_NONE;
> +	fmt->ycbcr_enc		= V4L2_YCBCR_ENC_DEFAULT;
> +	fmt->quantization	= V4L2_QUANTIZATION_DEFAULT;
> +	fmt->xfer_func		= V4L2_XFER_FUNC_DEFAULT;
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * V4L2 Subdev
>   */
> @@ -745,28 +757,18 @@ static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -static struct v4l2_mbus_framefmt *
> -max9286_get_pad_format(struct max9286_priv *priv,
> -		       struct v4l2_subdev_state *sd_state,
> -		       unsigned int pad, u32 which)
> -{
> -	switch (which) {
> -	case V4L2_SUBDEV_FORMAT_TRY:
> -		return v4l2_subdev_get_try_format(&priv->sd, sd_state, pad);
> -	case V4L2_SUBDEV_FORMAT_ACTIVE:
> -		return &priv->fmt[pad];
> -	default:
> -		return NULL;
> -	}
> -}
> -
>  static int max9286_set_fmt(struct v4l2_subdev *sd,
>  			   struct v4l2_subdev_state *sd_state,
>  			   struct v4l2_subdev_format *format)
>  {
> -	struct max9286_priv *priv = sd_to_max9286(sd);
> -	struct v4l2_mbus_framefmt *cfg_fmt;
> +	struct v4l2_mbus_framefmt *fmt;
> +	struct v4l2_subdev_state *state;
> +	int ret = 0;
>  
> +	/*
> +	 * Refuse to set format on the multiplexed source pad.
> +	 * Format is propagated from sinks streams to source streams.
> +	 */
>  	if (format->pad == MAX9286_SRC_PAD)
>  		return -EINVAL;
>  
> @@ -782,44 +784,143 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
>  		break;
>  	}
>  
> -	cfg_fmt = max9286_get_pad_format(priv, sd_state, format->pad,
> -					 format->which);
> -	if (!cfg_fmt)
> +	state = v4l2_subdev_validate_and_lock_state(sd, sd_state);

I really want RAII semantics... __attribute__((__cleanup__)) would give
us that. It's used in two places in the kernel (lib/locking-selftest.c
and include/linux/kcsan-checks.h), but I'm not sure it's supported by
all compilers (namely ICC) :-S

> +	fmt = v4l2_state_get_stream_format(state, format->pad,
> +					   format->stream);
> +	if (!fmt) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +	*fmt = format->format;
> +
> +	/* Propagate format to the other end of the route. */
> +	fmt = v4l2_state_get_opposite_stream_format(state, format->pad,
> +						    format->stream);
> +	if (!fmt) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +	*fmt = format->format;
> +
> +out:
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
> +}
> +
> +static int max9286_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +				  struct v4l2_mbus_frame_desc *fd)
> +{
> +	const struct v4l2_subdev_krouting *routing;
> +	struct v4l2_subdev_state *state;
> +	unsigned int i;
> +	int ret = 0;
> +
> +	if (pad != MAX9286_SRC_PAD)
>  		return -EINVAL;
>  
> -	mutex_lock(&priv->mutex);
> -	*cfg_fmt = format->format;
> -	mutex_unlock(&priv->mutex);
> +	state = v4l2_subdev_lock_active_state(sd);
> +	routing = &state->routing;
>  
> -	return 0;
> +	/* One stream per each connected route. */
> +	memset(fd, 0, sizeof(*fd));

Should the memset() be done by the caller ?

> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +
> +	for (i = 0; i < routing->num_routes; ++i) {
> +		const struct v4l2_subdev_route *route = &routing->routes[i];
> +		unsigned int idx = fd->num_entries;
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> +			continue;

Do we need a for_each_active_route(routing, route) macro ?

> +
> +		if (route->source_pad != pad)
> +			continue;

As we have a single source pad, is this possible ?

> +
> +		fmt = v4l2_state_get_stream_format(state, pad,
> +						   route->source_stream);
> +		if (!fmt) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		/*
> +		 * Assume a YUYV format (0x1e DT) and 16 bpp: we only support
> +		 * these formats at the moment.
> +		 */

I would have defined a

		struct v4l2_mbus_frame_desc_entry *entry;

with

		entry = &fd->entry[fd->num_entries];

here.

> +		fd->entry[idx].stream = idx;
> +		fd->entry[idx].flags = V4L2_MBUS_FRAME_DESC_FL_LEN_MAX;
> +		fd->entry[idx].length = fmt->width * fmt->height * 16 / 8;
> +		fd->entry[idx].pixelcode = fmt->code;
> +
> +		fd->entry[idx].bus.csi2.vc = route->source_stream;

A comment to explain that we hardcode the VC of each input to the input
number would be useful.

> +		fd->entry[idx].bus.csi2.dt = 0x1e;

We should define macros for the CSI-2 data types in a common header in
include/media/.

> +
> +		fd->num_entries++;
> +	}
> +
> +out:
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
>  }
>  
> -static int max9286_get_fmt(struct v4l2_subdev *sd,
> -			   struct v4l2_subdev_state *sd_state,
> -			   struct v4l2_subdev_format *format)
> +static int max9286_set_routing(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_state *state,
> +			       struct v4l2_subdev_krouting *routing)
>  {
> -	struct max9286_priv *priv = sd_to_max9286(sd);
> -	struct v4l2_mbus_framefmt *cfg_fmt;
> -	unsigned int pad = format->pad;
> +	struct v4l2_mbus_framefmt format;
> +	int ret;
>  
>  	/*
> -	 * Multiplexed Stream Support: Support link validation by returning the
> -	 * format of the first bound link. All links must have the same format,
> -	 * as we do not support mixing and matching of cameras connected to the
> -	 * max9286.
> +	 * Note: we can only support up to V4L2_FRAME_DESC_ENTRY_MAX, until
> +	 * frame desc is made dynamically allocated.
>  	 */
> -	if (pad == MAX9286_SRC_PAD)
> -		pad = __ffs(priv->bound_sources);
>  
> -	cfg_fmt = max9286_get_pad_format(priv, sd_state, pad, format->which);
> -	if (!cfg_fmt)
> +	if (routing->num_routes >= V4L2_FRAME_DESC_ENTRY_MAX)
>  		return -EINVAL;

Where does this limitation come from ? It doesn't seem to originate from
the max9286 driver itself. If it's related to one of the helpers below,
maybe that's where it should be checked ?

>  
> -	mutex_lock(&priv->mutex);
> -	format->format = *cfg_fmt;
> -	mutex_unlock(&priv->mutex);
> +	ret = v4l2_routing_simple_verify(routing);
> +	if (ret)
> +		return ret;
>  
> -	return 0;
> +	state = v4l2_subdev_validate_and_lock_state(sd, state);
> +
> +	max9286_init_format(&format);

You could replace this with a static const v4l2_mbus_framefmt variable
that contains the default format.

> +	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
> +
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
> +}
> +
> +static int max9286_init_cfg(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_subdev_route routes[MAX9286_NUM_GMSL];
> +	struct max9286_priv *priv = sd_to_max9286(sd);
> +	struct v4l2_subdev_krouting routing;
> +	struct max9286_source *source;
> +	unsigned int num_routes = 0;
> +	u32 which = state->which;
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
> +	routing.which = which;
> +	routing.num_routes = num_routes;
> +	routing.routes = routes;
> +
> +	return max9286_set_routing(sd, state, &routing);
>  }
>  
>  static const struct v4l2_subdev_video_ops max9286_video_ops = {
> @@ -827,9 +928,12 @@ static const struct v4l2_subdev_video_ops max9286_video_ops = {
>  };
>  
>  static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
> +	.init_cfg	= max9286_init_cfg,
>  	.enum_mbus_code = max9286_enum_mbus_code,
> -	.get_fmt	= max9286_get_fmt,
> +	.get_fmt	= v4l2_subdev_get_fmt,

That's so nice :-)

>  	.set_fmt	= max9286_set_fmt,
> +	.get_frame_desc = max9286_get_frame_desc,
> +	.set_routing	= max9286_set_routing,
>  };
>  
>  static const struct v4l2_subdev_ops max9286_subdev_ops = {
> @@ -837,35 +941,6 @@ static const struct v4l2_subdev_ops max9286_subdev_ops = {
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
> @@ -900,8 +975,8 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
>  		max9286_init_format(&priv->fmt[i]);

As far as I can tell, priv->fmt isn't used anymore, so you can drop it,
as well as the code above. The MAX9286_N_SINKS macro can also be
dropped.

>  
>  	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max9286_subdev_ops);
> -	priv->sd.internal_ops = &max9286_subdev_internal_ops;
> -	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +			  V4L2_SUBDEV_FL_MULTIPLEXED;
>  
>  	v4l2_ctrl_handler_init(&priv->ctrls, 1);
>  	priv->pixelrate = v4l2_ctrl_new_std(&priv->ctrls,
> @@ -933,14 +1008,23 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
>  	}
>  	priv->sd.fwnode = ep;
>  
> +	ret = v4l2_subdev_alloc_state(&priv->sd);
> +	if (ret) {
> +		dev_err(dev, "Unable to allocate subdevice state/\n");
> +		ret = -ENOENT;
> +		goto err_put_node;
> +	}
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
> +	v4l2_subdev_free_state(&priv->sd);
>  err_put_node:
>  	fwnode_handle_put(ep);
>  err_async:
> @@ -952,6 +1036,7 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
>  static void max9286_v4l2_unregister(struct max9286_priv *priv)
>  {
>  	fwnode_handle_put(priv->sd.fwnode);
> +	v4l2_subdev_free_state(&priv->sd);
>  	v4l2_async_unregister_subdev(&priv->sd);
>  	max9286_v4l2_notifier_unregister(priv);
>  }

-- 
Regards,

Laurent Pinchart
