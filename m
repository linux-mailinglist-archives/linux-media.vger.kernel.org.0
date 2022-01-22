Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C510496922
	for <lists+linux-media@lfdr.de>; Sat, 22 Jan 2022 02:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231570AbiAVBOw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jan 2022 20:14:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231402AbiAVBOw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jan 2022 20:14:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7894DC06173B;
        Fri, 21 Jan 2022 17:14:51 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 826B7E1E;
        Sat, 22 Jan 2022 02:14:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642814088;
        bh=IRkEefOSAWfAFwXQNBJaCv6DbO002gzb2Em3rxEhRLU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oOrn84uoYWMnpJT7sQJlkCgDkJi2xYKXLZbF0MfSvIpKnbsDiXEORIh+KVIILIfWZ
         vEk2k+9gXbk+ZLMCt3DXo3AzXLs3whPT28XL8yN/0SeK/ffTrgP367fvAAhPA0X8nC
         zwGt/WEA/ThqqRUtvqjQ4IXp/JY38nftUsV1WGUM=
Date:   Sat, 22 Jan 2022 03:14:32 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        niklas.soderlund@ragnatech.se, kieran.bingham@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 04/13] media: max9286: Use routes to configure link
 order
Message-ID: <YetaeGNZdqelweo+@pendragon.ideasonboard.com>
References: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
 <20211017182449.64192-5-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211017182449.64192-5-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Sun, Oct 17, 2021 at 08:24:40PM +0200, Jacopo Mondi wrote:
> Use the routing table to configure the link output order and link
> masking.
> 
> The link output order defines the CSI-2 virtual channel a GSML stream

s/GSML/GMSL/

> is output on. Configure ordering at stream start time and at chip
> setup time. This last step requires to move the chip initialization
> function after the V4L2 setup phase as it requires the subdev state from
> where the routing table is retrieved from to be initialized.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 103 ++++++++++++++++++++++--------------
>  1 file changed, 64 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 2e635179aec0..3485478f08a5 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -500,6 +500,61 @@ static int max9286_check_config_link(struct max9286_priv *priv,
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

Shouldn't this be BIT(route->sink_pad), has route_mask stores a bitmask
of sink pads (see max9286_set_routing()) ?

> +			continue;
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
> @@ -701,6 +756,8 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>  	int ret;
>  
>  	if (enable) {
> +		max9286_config_links(priv);
> +
>  		/*
>  		 * The frame sync between cameras is transmitted across the
>  		 * reverse channel as GPIO. We must open all channels while
> @@ -1109,32 +1166,6 @@ static void max9286_v4l2_unregister(struct max9286_priv *priv)
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
> @@ -1144,13 +1175,7 @@ static int max9286_setup(struct max9286_priv *priv)
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

We could actually skip this, and only call

	max9286_write(priv, 0x00, MAX9286_MSTLINKSEL_AUTO | priv->route_mask);

to enable the links. The link order and link masking is only needed when
starting the streams, which is done by calling max9286_config_links() in
max9286_s_stream().

>  
>  	/*
>  	 * Video format setup:
> @@ -1324,12 +1349,6 @@ static int max9286_init(struct device *dev)
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
> @@ -1340,6 +1359,12 @@ static int max9286_init(struct device *dev)
>  		goto err_poc_disable;
>  	}
>  
> +	ret = max9286_setup(priv);
> +	if (ret) {
> +		dev_err(dev, "Unable to setup max9286\n");
> +		goto err_poc_disable;
> +	}
> +

And with the above change, I think you can keep the max9286_setup() call
where it was.

>  	ret = max9286_i2c_mux_init(priv);
>  	if (ret) {
>  		dev_err(dev, "Unable to initialize I2C multiplexer\n");

-- 
Regards,

Laurent Pinchart
