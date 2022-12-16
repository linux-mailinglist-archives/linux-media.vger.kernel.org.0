Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DDDC64E908
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 11:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbiLPKDU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Dec 2022 05:03:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbiLPKDO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Dec 2022 05:03:14 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6F014A590;
        Fri, 16 Dec 2022 02:03:13 -0800 (PST)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65366570;
        Fri, 16 Dec 2022 11:03:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671184992;
        bh=AvVnceqxnu0KjP3v8ihWd5ABmZC+g/BeEdKFvBg1I9Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fo46JPO+9rAyVN5adrwEvdIfX49uYBhfmY0iq388zOJulmk0XK/W7ndotnOWLe+ap
         R3WrnAhWJMpQAs3o27c17oG8bfbKn/wgw8Hx+Cz2AN2iW84MKLLo4xdhg6YORrqAdx
         l+HDZ4TI7RUYt+bQh1jhR/BUNtmIRA9n1DwwqpQw=
Date:   Fri, 16 Dec 2022 11:03:08 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
Subject: Re: [PATCH v3 09/12] media: i2c: max9286: Configure remote I2C speed
 from device tree
Message-ID: <20221216100308.w4wdwuthbwbdok7b@uno.localdomain>
References: <20221214233825.13050-1-laurent.pinchart+renesas@ideasonboard.com>
 <20221214233825.13050-10-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221214233825.13050-10-laurent.pinchart+renesas@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, Dec 15, 2022 at 01:38:22AM +0200, Laurent Pinchart wrote:
> Read the maxim,i2c-clock-frequency DT property that specifies the speed
> of the remote I2C bus, and configure the MAX9286 accordingly. The remote
> serializers must all have a matching configuration.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v2:
>
> - Rename DT property to "maxim,i2c-remote-bus-hz"
> ---
>  drivers/media/i2c/max9286.c | 56 +++++++++++++++++++++++++++++++------
>  1 file changed, 47 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index e78456c8d24c..fffb0d2da416 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -144,6 +144,11 @@ struct max9286_format_info {
>  	u8 datatype;
>  };
>
> +struct max9286_i2c_speed {
> +	u32 rate;
> +	u8 mstbt;
> +};
> +
>  struct max9286_source {
>  	struct v4l2_subdev *sd;
>  	struct fwnode_handle *fwnode;
> @@ -177,6 +182,7 @@ struct max9286_priv {
>  	/* The initial reverse control channel amplitude. */
>  	u32 init_rev_chan_mv;
>  	u32 rev_chan_mv;
> +	u8 i2c_mstbt;
>
>  	bool use_gpio_poc;
>  	u32 gpio_poc[2];
> @@ -254,6 +260,17 @@ static const struct max9286_format_info max9286_formats[] = {
>  	},
>  };
>
> +static const struct max9286_i2c_speed max9286_i2c_speeds[] = {
> +	{ .rate =   8470, .mstbt = MAX9286_I2CMSTBT_8KBPS },
> +	{ .rate =  28300, .mstbt = MAX9286_I2CMSTBT_28KBPS },
> +	{ .rate =  84700, .mstbt = MAX9286_I2CMSTBT_84KBPS },
> +	{ .rate = 105000, .mstbt = MAX9286_I2CMSTBT_105KBPS },
> +	{ .rate = 173000, .mstbt = MAX9286_I2CMSTBT_173KBPS },
> +	{ .rate = 339000, .mstbt = MAX9286_I2CMSTBT_339KBPS },
> +	{ .rate = 533000, .mstbt = MAX9286_I2CMSTBT_533KBPS },
> +	{ .rate = 837000, .mstbt = MAX9286_I2CMSTBT_837KBPS },
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * I2C IO
>   */
> @@ -374,7 +391,7 @@ static int max9286_i2c_mux_init(struct max9286_priv *priv)
>  static void max9286_configure_i2c(struct max9286_priv *priv, bool localack)
>  {
>  	u8 config = MAX9286_I2CSLVSH_469NS_234NS | MAX9286_I2CSLVTO_1024US |
> -		    MAX9286_I2CMSTBT_105KBPS;
> +		    priv->i2c_mstbt;
>
>  	if (localack)
>  		config |= MAX9286_I2CLOCACK;
> @@ -1387,6 +1404,8 @@ static int max9286_parse_dt(struct max9286_priv *priv)
>  	struct device_node *node = NULL;
>  	unsigned int i2c_mux_mask = 0;
>  	u32 reverse_channel_microvolt;
> +	u32 i2c_clk_freq = 105000;
> +	unsigned int i;
>
>  	/* Balance the of_node_put() performed by of_find_node_by_name(). */
>  	of_node_get(dev->of_node);
> @@ -1477,6 +1496,23 @@ static int max9286_parse_dt(struct max9286_priv *priv)
>  	}
>  	of_node_put(node);
>
> +	of_property_read_u32(dev->of_node, "maxim,i2c-remote-bus-hz",
> +			     &i2c_clk_freq);

i2c_clk_freq is only overwritten if the property is present, so I
guess this is right.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> +	for (i = 0; i < ARRAY_SIZE(max9286_i2c_speeds); ++i) {
> +		const struct max9286_i2c_speed *speed = &max9286_i2c_speeds[i];
> +
> +		if (speed->rate == i2c_clk_freq) {
> +			priv->i2c_mstbt = speed->mstbt;
> +			break;
> +		}
> +	}
> +
> +	if (i == ARRAY_SIZE(max9286_i2c_speeds)) {
> +		dev_err(dev, "Invalid %s value %u\n", "maxim,i2c-remote-bus-hz",
> +			i2c_clk_freq);
> +		return -EINVAL;
> +	}
> +
>  	/*
>  	 * Parse the initial value of the reverse channel amplitude from
>  	 * the firmware interface and convert it to millivolts.
> @@ -1553,10 +1589,16 @@ static int max9286_probe(struct i2c_client *client)
>  	/* GPIO values default to high */
>  	priv->gpio_state = BIT(0) | BIT(1);
>
> +	ret = max9286_parse_dt(priv);
> +	if (ret)
> +		goto err_cleanup_dt;
> +
>  	priv->gpiod_pwdn = devm_gpiod_get_optional(&client->dev, "enable",
>  						   GPIOD_OUT_HIGH);
> -	if (IS_ERR(priv->gpiod_pwdn))
> -		return PTR_ERR(priv->gpiod_pwdn);
> +	if (IS_ERR(priv->gpiod_pwdn)) {
> +		ret = PTR_ERR(priv->gpiod_pwdn);
> +		goto err_cleanup_dt;
> +	}
>
>  	gpiod_set_consumer_name(priv->gpiod_pwdn, "max9286-pwdn");
>  	gpiod_set_value_cansleep(priv->gpiod_pwdn, 1);
> @@ -1583,10 +1625,6 @@ static int max9286_probe(struct i2c_client *client)
>  	if (ret)
>  		goto err_powerdown;
>
> -	ret = max9286_parse_dt(priv);
> -	if (ret)
> -		goto err_cleanup_dt;
> -
>  	if (!priv->use_gpio_poc) {
>  		ret = max9286_get_poc_supplies(priv);
>  		if (ret)
> @@ -1599,10 +1637,10 @@ static int max9286_probe(struct i2c_client *client)
>
>  	return 0;
>
> -err_cleanup_dt:
> -	max9286_cleanup_dt(priv);
>  err_powerdown:
>  	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
> +err_cleanup_dt:
> +	max9286_cleanup_dt(priv);
>
>  	return ret;
>  }
> --
> Regards,
>
> Laurent Pinchart
>
