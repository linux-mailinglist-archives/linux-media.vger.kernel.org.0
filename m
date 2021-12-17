Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C495A478337
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 03:35:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbhLQCfY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 21:35:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbhLQCfX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 21:35:23 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AE8DC061574;
        Thu, 16 Dec 2021 18:35:23 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B57EA92A;
        Fri, 17 Dec 2021 03:35:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639708521;
        bh=JKCU1TQ3w+E9tjQPYhgR7w6gqTT61xpxnFewRIrC1mI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wczHTU8rCHLOWIQ4MAAU+QtFgl/1fHy9prltl8GObzzbk6k7+mvwh+ZagaNTAJ/1a
         EeJ9OsWOhP4u15mooimFf5VBXMyLsqYQynlk9Ui+UvjSGIkLLw9mng/FkU79mPPR4O
         sihoP8+6CpOQRcdoKAETns2o4muI6U9lwpNgZYJY=
Date:   Fri, 17 Dec 2021 04:35:19 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        niklas.soderlund@ragnatech.se, kieran.bingham@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 4/6] media: max9286: Use routes to configure link order
Message-ID: <Ybv3Z9bd51KTwvqD@pendragon.ideasonboard.com>
References: <20211216174746.147233-1-jacopo+renesas@jmondi.org>
 <20211216174746.147233-5-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211216174746.147233-5-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Dec 16, 2021 at 06:47:44PM +0100, Jacopo Mondi wrote:
> Use the routing table to configure the link output order and link
> masking.
> 
> The link output order defines the CSI-2 virtual channel a GSML stream
> is output on. Configure ordering at stream start time and at chip
> setup time. This last step requires to move the chip initialization
> function after the V4L2 setup phase as it requires the subdev state from
> where the routing table is retrieved from to be initialized.

I wonder if we could drop some of the configuration from
max9286_setup().

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 103 ++++++++++++++++++++++--------------
>  1 file changed, 64 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 1395eb783dc0..5d728fa23f01 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -499,6 +499,61 @@ static int max9286_check_config_link(struct max9286_priv *priv,
>  	return 0;
>  }
>  
> +/*
> + * Configure the links output order (which defines on which CSI-2 VC a
> + * link is output on) and configure link masking.
> + */
> +static void max9286_config_links(struct max9286_priv *priv)
> +{
> +	const struct v4l2_subdev_krouting *routing;
> +	struct v4l2_subdev_state *state;
> +	u8 link_order = 0;
> +	u8 vc_mask = 0xf;
> +	unsigned int i;
> +
> +	state = v4l2_subdev_lock_active_state(&priv->sd);
> +	routing = &state->routing;
> +
> +	for (i = 0; i < routing->num_routes; ++i) {
> +		struct v4l2_subdev_route *route = &routing->routes[i];
> +
> +		if (!(priv->route_mask & BIT(i)))
> +			continue;

Is this check needed ?

> +
> +		/* Assign the CSI-2 VC using the source stream number. */
> +		link_order |= route->source_stream << (2 * route->sink_pad);
> +		vc_mask &= ~BIT(route->source_stream);
> +	}
> +
> +	/*
> +	 * This might look rather silly, but now that we have assigned a
> +	 * VC to the enabled routes, we have to assign one to the disabled
> +	 * routes as well, as there cannot be two sources with the same VC.
> +	 */
> +	for (i = 0; i < MAX9286_NUM_GMSL; ++i) {
> +		unsigned int vc;
> +
> +		if (priv->route_mask & BIT(i))
> +			continue;
> +
> +		/* ffs() counts from 1. */
> +		vc = ffs(vc_mask) - 1;

You can use __ffs(), which counts from 0 (but has an undefined behaviour
when no bit is set).

> +		link_order |= vc << (2 * i);
> +		vc_mask &= ~BIT(vc);
> +	}
> +
> +	/*
> +	 * Use the enabled routes to enable GMSL links, configure the CSI-2
> +	 * output order, mask unused links and autodetect link used as CSI
> +	 * clock source.
> +	 */
> +	max9286_write(priv, 0x00, MAX9286_MSTLINKSEL_AUTO | priv->route_mask);
> +	max9286_write(priv, 0x0b, link_order);
> +	max9286_write(priv, 0x69, 0xf & ~priv->route_mask);
> +
> +	v4l2_subdev_unlock_state(state);
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * V4L2 Subdev
>   */
> @@ -700,6 +755,8 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>  	int ret;
>  
>  	if (enable) {
> +		max9286_config_links(priv);
> +
>  		/*
>  		 * The frame sync between cameras is transmitted across the
>  		 * reverse channel as GPIO. We must open all channels while
> @@ -1108,32 +1165,6 @@ static void max9286_v4l2_unregister(struct max9286_priv *priv)
>  
>  static int max9286_setup(struct max9286_priv *priv)
>  {
> -	/*
> -	 * Link ordering values for all enabled links combinations. Orders must
> -	 * be assigned sequentially from 0 to the number of enabled links
> -	 * without leaving any hole for disabled links. We thus assign orders to
> -	 * enabled links first, and use the remaining order values for disabled
> -	 * links are all links must have a different order value;
> -	 */
> -	static const u8 link_order[] = {
> -		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* xxxx */
> -		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* xxx0 */
> -		(3 << 6) | (2 << 4) | (0 << 2) | (1 << 0), /* xx0x */
> -		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* xx10 */
> -		(3 << 6) | (0 << 4) | (2 << 2) | (1 << 0), /* x0xx */
> -		(3 << 6) | (1 << 4) | (2 << 2) | (0 << 0), /* x1x0 */
> -		(3 << 6) | (1 << 4) | (0 << 2) | (2 << 0), /* x10x */
> -		(3 << 6) | (1 << 4) | (1 << 2) | (0 << 0), /* x210 */
> -		(0 << 6) | (3 << 4) | (2 << 2) | (1 << 0), /* 0xxx */
> -		(1 << 6) | (3 << 4) | (2 << 2) | (0 << 0), /* 1xx0 */
> -		(1 << 6) | (3 << 4) | (0 << 2) | (2 << 0), /* 1x0x */
> -		(2 << 6) | (3 << 4) | (1 << 2) | (0 << 0), /* 2x10 */
> -		(1 << 6) | (0 << 4) | (3 << 2) | (2 << 0), /* 10xx */
> -		(2 << 6) | (1 << 4) | (3 << 2) | (0 << 0), /* 21x0 */
> -		(2 << 6) | (1 << 4) | (0 << 2) | (3 << 0), /* 210x */
> -		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* 3210 */
> -	};
> -
>  	/*
>  	 * Set the I2C bus speed.
>  	 *
> @@ -1143,13 +1174,7 @@ static int max9286_setup(struct max9286_priv *priv)
>  	max9286_configure_i2c(priv, true);
>  	max9286_reverse_channel_setup(priv, priv->init_rev_chan_mv);
>  
> -	/*
> -	 * Enable GMSL links, mask unused ones and autodetect link
> -	 * used as CSI clock source.
> -	 */
> -	max9286_write(priv, 0x00, MAX9286_MSTLINKSEL_AUTO | priv->route_mask);
> -	max9286_write(priv, 0x0b, link_order[priv->route_mask]);
> -	max9286_write(priv, 0x69, (0xf & ~priv->route_mask));
> +	max9286_config_links(priv);
>  
>  	/*
>  	 * Video format setup:
> @@ -1321,12 +1346,6 @@ static int max9286_init(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> -	ret = max9286_setup(priv);
> -	if (ret) {
> -		dev_err(dev, "Unable to setup max9286\n");
> -		goto err_poc_disable;
> -	}
> -
>  	/*
>  	 * Register all V4L2 interactions for the MAX9286 and notifiers for
>  	 * any subdevices connected.
> @@ -1337,6 +1356,12 @@ static int max9286_init(struct device *dev)
>  		goto err_poc_disable;
>  	}
>  
> +	ret = max9286_setup(priv);
> +	if (ret) {
> +		dev_err(dev, "Unable to setup max9286\n");
> +		goto err_poc_disable;
> +	}
> +
>  	ret = max9286_i2c_mux_init(priv);
>  	if (ret) {
>  		dev_err(dev, "Unable to initialize I2C multiplexer\n");

-- 
Regards,

Laurent Pinchart
