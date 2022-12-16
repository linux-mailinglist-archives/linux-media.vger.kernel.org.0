Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83FC964E8E8
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 10:53:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbiLPJxM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Dec 2022 04:53:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbiLPJw5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Dec 2022 04:52:57 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72D274A062;
        Fri, 16 Dec 2022 01:52:55 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 2338B4000F;
        Fri, 16 Dec 2022 09:52:51 +0000 (UTC)
Date:   Fri, 16 Dec 2022 10:52:51 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 04/12] media: i2c: max9286: Add support for port
 regulators
Message-ID: <20221216095251.o5jirlbgfl5ye7qi@uno.localdomain>
References: <20221214233825.13050-1-laurent.pinchart+renesas@ideasonboard.com>
 <20221214233825.13050-5-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221214233825.13050-5-laurent.pinchart+renesas@ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, Dec 15, 2022 at 01:38:17AM +0200, Laurent Pinchart wrote:
> From: Thomas Nizan <tnizan@witekio.com>
>
> Allow users to use one PoC regulator per port, instead of a global
> regulator.
>
> The properties '^port[0-3]-poc-supply$' in the DT node are used to
> indicate the regulators for individual ports.
>
> Signed-off-by: Thomas Nizan <tnizan@witekio.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v2:
>
> - Adapt to the poc-gpio support
>
> Changes since v1:
>
> - Use to_index()
> - Use dev_err_probe()
> - Fix error path in probe()
> - Use devm_regulator_get_optional() instead of
>   devm_regulator_get_exclusive()
> ---
>  drivers/media/i2c/max9286.c | 138 ++++++++++++++++++++++++++++++------
>  1 file changed, 115 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 9c083cf14231..d79077939847 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -139,6 +139,7 @@
>  struct max9286_source {
>  	struct v4l2_subdev *sd;
>  	struct fwnode_handle *fwnode;
> +	struct regulator *regulator;
>  };
>
>  struct max9286_asd {
> @@ -169,6 +170,7 @@ struct max9286_priv {
>  	u32 init_rev_chan_mv;
>  	u32 rev_chan_mv;
>
> +	bool use_gpio_poc;
>  	u32 gpio_poc[2];
>
>  	struct v4l2_ctrl_handler ctrls;
> @@ -1088,9 +1090,6 @@ static int max9286_parse_gpios(struct max9286_priv *priv)
>  	struct device *dev = &priv->client->dev;
>  	int ret;
>
> -	/* GPIO values default to high */
> -	priv->gpio_state = BIT(0) | BIT(1);
> -
>  	/*
>  	 * Parse the "gpio-poc" vendor property. If the property is not
>  	 * specified the camera power is controlled by a regulator.
> @@ -1102,18 +1101,7 @@ static int max9286_parse_gpios(struct max9286_priv *priv)
>  		 * If gpio lines are not used for the camera power, register
>  		 * a gpio controller for consumers.
>  		 */
> -		ret = max9286_register_gpio(priv);
> -		if (ret)
> -			return ret;
> -
> -		priv->regulator = devm_regulator_get(dev, "poc");
> -		if (IS_ERR(priv->regulator)) {
> -			return dev_err_probe(dev, PTR_ERR(priv->regulator),
> -					     "Unable to get PoC regulator (%ld)\n",
> -					     PTR_ERR(priv->regulator));
> -		}
> -
> -		return 0;
> +		return max9286_register_gpio(priv);
>  	}
>
>  	/* If the property is specified make sure it is well formed. */
> @@ -1124,21 +1112,75 @@ static int max9286_parse_gpios(struct max9286_priv *priv)
>  		return -EINVAL;
>  	}
>
> +	priv->use_gpio_poc = true;
>  	return 0;
>  }
>
> +static int max9286_poc_power_on(struct max9286_priv *priv)
> +{
> +	struct max9286_source *source;
> +	unsigned int enabled = 0;
> +	int ret;
> +
> +	/* Enable the global regulator if available. */
> +	if (priv->regulator)
> +		return regulator_enable(priv->regulator);
> +
> +	if (priv->use_gpio_poc)
> +		return max9286_gpio_set(priv, priv->gpio_poc[0],
> +					!priv->gpio_poc[1]);

#define GPIO_ACTIVE_HIGH 0
#define GPIO_ACTIVE_LOW 1

So negating it is correct

> +
> +	/* Otherwise use the per-port regulators. */
> +	for_each_source(priv, source) {
> +		ret = regulator_enable(source->regulator);
> +		if (ret < 0)
> +			goto error;
> +
> +		enabled |= BIT(to_index(priv, source));
> +	}
> +
> +	return 0;
> +
> +error:
> +	for_each_source(priv, source) {
> +		if (enabled & BIT(to_index(priv, source)))
> +			regulator_disable(source->regulator);
> +	}
> +
> +	return ret;
> +}
> +
> +static int max9286_poc_power_off(struct max9286_priv *priv)
> +{
> +	struct max9286_source *source;
> +	int ret = 0;
> +
> +	if (priv->regulator)
> +		return regulator_disable(priv->regulator);
> +
> +	if (priv->use_gpio_poc)
> +		return max9286_gpio_set(priv, priv->gpio_poc[0],
> +					priv->gpio_poc[1]);
> +
> +	for_each_source(priv, source) {
> +		int err;
> +
> +		err = regulator_disable(source->regulator);
> +		if (!ret)

Should this be err ?

And I wonder if
                ret |= regulator_disable(..)

isn't enough

> +			ret = err;
> +	}
> +
> +	return ret;
> +}
> +
>  static int max9286_poc_enable(struct max9286_priv *priv, bool enable)
>  {
>  	int ret;
>
> -	/* If the regulator is not available, use gpio to control power. */
> -	if (!priv->regulator)
> -		ret = max9286_gpio_set(priv, priv->gpio_poc[0],
> -				       enable ^ priv->gpio_poc[1]);
> -	else if (enable)
> -		ret = regulator_enable(priv->regulator);
> +	if (enable)
> +		ret = max9286_poc_power_on(priv);
>  	else
> -		ret = regulator_disable(priv->regulator);
> +		ret = max9286_poc_power_off(priv);
>
>  	if (ret < 0)
>  		dev_err(&priv->client->dev, "Unable to turn power %s\n",
> @@ -1317,6 +1359,47 @@ static int max9286_parse_dt(struct max9286_priv *priv)
>  	return 0;
>  }
>
> +static int max9286_get_poc_supplies(struct max9286_priv *priv)
> +{
> +	struct device *dev = &priv->client->dev;
> +	struct max9286_source *source;
> +	int ret;
> +
> +	/* Start by getting the global regulator. */
> +	priv->regulator = devm_regulator_get_optional(dev, "poc");
> +	if (!IS_ERR(priv->regulator))
> +		return 0;
> +
> +	if (PTR_ERR(priv->regulator) != -ENODEV) {
> +		if (PTR_ERR(priv->regulator) != -EPROBE_DEFER)
> +			dev_err(dev, "Unable to get PoC regulator: %ld\n",
> +				PTR_ERR(priv->regulator));
> +		return PTR_ERR(priv->regulator);

Could this be dev_err_probe ? Or you want to avoid the dev_dbg message ?

> +	}
> +
> +	/* If there's no global regulator, get per-port regulators. */
> +	dev_dbg(dev,
> +		"No global PoC regulator, looking for per-port regulators\n");
> +	priv->regulator = NULL;
> +
> +	for_each_source(priv, source) {
> +		unsigned int index = to_index(priv, source);
> +		char name[10];

Will overflow with index > 9 ? But I don't think we can have more than
9 ports ?

> +
> +		snprintf(name, sizeof(name), "port%u-poc", index);
> +		source->regulator = devm_regulator_get(dev, name);
> +		if (IS_ERR(source->regulator)) {
> +			ret = PTR_ERR(source->regulator);
> +			dev_err_probe(dev, ret,
> +				      "Unable to get port %u PoC regulator\n",
> +				      index);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int max9286_probe(struct i2c_client *client)
>  {
>  	struct max9286_priv *priv;
> @@ -1330,6 +1413,9 @@ static int max9286_probe(struct i2c_client *client)
>
>  	priv->client = client;
>
> +	/* GPIO values default to high */
> +	priv->gpio_state = BIT(0) | BIT(1);
> +
>  	priv->gpiod_pwdn = devm_gpiod_get_optional(&client->dev, "enable",
>  						   GPIOD_OUT_HIGH);
>  	if (IS_ERR(priv->gpiod_pwdn))
> @@ -1362,7 +1448,13 @@ static int max9286_probe(struct i2c_client *client)
>
>  	ret = max9286_parse_dt(priv);
>  	if (ret)
> -		goto err_powerdown;
> +		goto err_cleanup_dt;
> +
> +	if (!priv->use_gpio_poc) {
> +		ret = max9286_get_poc_supplies(priv);
> +		if (ret)
> +			goto err_cleanup_dt;
> +	}
>
>  	ret = max9286_init(priv);
>  	if (ret < 0)

Do you need to powerdown here ?

> --
> Regards,
>
> Laurent Pinchart
>
