Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7D0496939
	for <lists+linux-media@lfdr.de>; Sat, 22 Jan 2022 02:34:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231710AbiAVBeC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jan 2022 20:34:02 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56386 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbiAVBeB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jan 2022 20:34:01 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD1D1E1E;
        Sat, 22 Jan 2022 02:33:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642815240;
        bh=i5tIWYOQuKbuw9bj9FA5fEcAthGy31rqzUtE1VtpKCA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e1vwerw/OFszpInfq5uMu3Y1TGD2AMnecEIqC8vFs5UyhqE2AGynVu2buoYMfOF9M
         vBalO0byLJKienvHGhi+qIej7djf/HkPRz0b1SLJT3cXIUaoOJuS91czTIbDELF82X
         gE+gFtnAyZKPx1XopYKnisEzXvbqA9b4kx0aQOAw=
Date:   Sat, 22 Jan 2022 03:33:43 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        niklas.soderlund@ragnatech.se, kieran.bingham@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 03/13] media: max9286: Use enabled routes to calculate
 pixelrate
Message-ID: <Yete92DqYXebYhi+@pendragon.ideasonboard.com>
References: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
 <20211017182449.64192-4-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211017182449.64192-4-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Sun, Oct 17, 2021 at 08:24:39PM +0200, Jacopo Mondi wrote:
> Now that the device supports routing, use the enabled routes instead
> of the connected sources to compute the output pixel rate.
> 
> To do so, update the route_mask after a set_routing() call with the
> ACTIVE format, and re-calculate the pixel rate just after.
> 
> At the same time, start and stop only the enabled routes at s_stream()
> time.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 63 ++++++++++++++++++++++++++++++-------
>  1 file changed, 51 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 54b4067168df..2e635179aec0 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -189,8 +189,11 @@ struct max9286_priv {
>  	struct v4l2_async_notifier notifier;
>  };
>  
> +#define to_index(priv, source) ((source) - &(priv)->sources[0])
> +
>  static struct max9286_source *next_source(struct max9286_priv *priv,
> -					  struct max9286_source *source)
> +					  struct max9286_source *source,
> +					  bool routed)
>  {
>  	if (!source)
>  		source = &priv->sources[0];
> @@ -198,17 +201,27 @@ static struct max9286_source *next_source(struct max9286_priv *priv,
>  		source++;
>  
>  	for (; source < &priv->sources[MAX9286_NUM_GMSL]; source++) {
> -		if (source->fwnode)
> +		unsigned int index = to_index(priv, source);
> +
> +		if (!source->fwnode)
> +			continue;
> +
> +		/*
> +		 * Careful here! A very unfortunate call to set_routing() can
> +		 * change priv->route_mask behind our back!
> +		 */
> +		if (!routed || priv->route_mask & BIT(index))
>  			return source;
>  	}
>  
>  	return NULL;
>  }
>  
> -#define for_each_source(priv, source) \
> -	for ((source) = NULL; ((source) = next_source((priv), (source))); )
> +#define for_each_route(priv, source) \
> +	for ((source) = NULL; ((source) = next_source((priv), (source), true)); )

Could we call this for_each_active_source() ? There's a
for_each_active_route() macro in include/media/v4l2-subdev.h, so
defining for_each_route() here is confusing. Furthermore, the macro
iterates over sources, not routes.

The routed parameter to next_source() could be renamed accordingly to
active.

>  
> -#define to_index(priv, source) ((source) - &(priv)->sources[0])
> +#define for_each_source(priv, source) \
> +	for ((source) = NULL; ((source) = next_source((priv), (source), false)); )
>  
>  static inline struct max9286_priv *sd_to_max9286(struct v4l2_subdev *sd)
>  {
> @@ -410,7 +423,7 @@ static int max9286_check_video_links(struct max9286_priv *priv)
>  		if (ret < 0)
>  			return -EIO;
>  
> -		if ((ret & MAX9286_VIDEO_DETECT_MASK) == priv->source_mask)
> +		if ((ret & MAX9286_VIDEO_DETECT_MASK) == priv->route_mask)
>  			break;
>  
>  		usleep_range(350, 500);
> @@ -494,9 +507,10 @@ static int max9286_check_config_link(struct max9286_priv *priv,
>  static int max9286_set_pixelrate(struct max9286_priv *priv)
>  {
>  	struct max9286_source *source = NULL;
> +	unsigned int num_routes = 0;
>  	u64 pixelrate = 0;
>  
> -	for_each_source(priv, source) {
> +	for_each_route(priv, source) {
>  		struct v4l2_ctrl *ctrl;
>  		u64 source_rate = 0;
>  
> @@ -517,6 +531,8 @@ static int max9286_set_pixelrate(struct max9286_priv *priv)
>  				"Unable to calculate pixel rate\n");
>  			return -EINVAL;
>  		}
> +
> +		num_routes++;
>  	}
>  
>  	if (!pixelrate) {
> @@ -530,7 +546,7 @@ static int max9286_set_pixelrate(struct max9286_priv *priv)
>  	 * by the number of available sources.
>  	 */
>  	return v4l2_ctrl_s_ctrl_int64(priv->pixelrate,
> -				      pixelrate * priv->nsources);
> +				      pixelrate * num_routes);
>  }
>  
>  static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
> @@ -692,8 +708,8 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>  		 */
>  		max9286_i2c_mux_open(priv);
>  
> -		/* Start all cameras. */
> -		for_each_source(priv, source) {
> +		/* Start cameras. */
> +		for_each_route(priv, source) {
>  			ret = v4l2_subdev_call(source->sd, video, s_stream, 1);
>  			if (ret)
>  				return ret;
> @@ -734,8 +750,8 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>  	} else {
>  		max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_0X15_RESV);
>  
> -		/* Stop all cameras. */
> -		for_each_source(priv, source)
> +		/* Stop cameras. */
> +		for_each_route(priv, source)
>  			v4l2_subdev_call(source->sd, video, s_stream, 0);
>  
>  		max9286_i2c_mux_close(priv);
> @@ -912,6 +928,29 @@ static int max9286_set_routing(struct v4l2_subdev *sd,
>  
>  	state = v4l2_subdev_validate_and_lock_state(sd, state);
>  	ret = _max9286_set_routing(sd, state, routing);
> +	if (ret)
> +		goto out;
> +
> +	if (which == V4L2_SUBDEV_FORMAT_TRY)
> +		goto out;
> +
> +	/*
> +	 * Update the active routes mask and the pixel rate according to the
> +	 * routed sources.
> +	 */
> +	priv->route_mask = 0;
> +	for (i = 0; i < routing->num_routes; ++i) {
> +		struct v4l2_subdev_route *route = &routing->routes[i];
> +
> +		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> +			continue;
> +
> +		priv->route_mask |= BIT(route->sink_pad);
> +	}
> +
> +	max9286_set_pixelrate(priv);
> +
> +out:
>  	v4l2_subdev_unlock_state(state);
>  
>  	return ret;

-- 
Regards,

Laurent Pinchart
