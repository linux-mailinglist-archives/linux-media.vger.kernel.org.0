Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 135E64888A3
	for <lists+linux-media@lfdr.de>; Sun,  9 Jan 2022 11:03:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235268AbiAIKDR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jan 2022 05:03:17 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:39525 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235266AbiAIKDR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jan 2022 05:03:17 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id CCDA3FF803;
        Sun,  9 Jan 2022 10:03:11 +0000 (UTC)
Date:   Sun, 9 Jan 2022 11:04:12 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v2 04/11] media: i2c: max9286: Add support for port
 regulators
Message-ID: <20220109100412.z2twzgkeum4fzbaw@uno.localdomain>
References: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220101182806.19311-5-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220101182806.19311-5-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sat, Jan 01, 2022 at 08:27:59PM +0200, Laurent Pinchart wrote:
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

The patch looks almost good, but it will really conflict with gpio-poc work I
have on the list. Should we decide an ordering and send a single
series with both efforts in to ease collecting it ?

> ---
> Changes since v1:
>
> - Use to_index()
> - Use dev_err_probe()
> - Fix error path in probe()
> - Use devm_regulator_get_optional() instead of
>   devm_regulator_get_exclusive()
> ---
>  drivers/media/i2c/max9286.c | 107 +++++++++++++++++++++++++++++++-----
>  1 file changed, 94 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index eb2b8e42335b..15c80034e3a4 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -138,6 +138,7 @@
>  struct max9286_source {
>  	struct v4l2_subdev *sd;
>  	struct fwnode_handle *fwnode;
> +	struct regulator *regulator;
>  };
>
>  struct max9286_asd {
> @@ -1071,6 +1072,49 @@ static int max9286_register_gpio(struct max9286_priv *priv)
>  	return ret;
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
> +static void max9286_poc_power_off(struct max9286_priv *priv)
> +{
> +	struct max9286_source *source;
> +
> +	if (priv->regulator) {
> +		regulator_disable(priv->regulator);
> +		return;
> +	}
> +
> +	for_each_source(priv, source)
> +		regulator_disable(source->regulator);
> +}
> +
>  static int max9286_init(struct device *dev)
>  {
>  	struct max9286_priv *priv;
> @@ -1081,9 +1125,9 @@ static int max9286_init(struct device *dev)
>  	priv = i2c_get_clientdata(client);
>
>  	/* Enable the bus power. */
> -	ret = regulator_enable(priv->regulator);
> +	ret = max9286_poc_power_on(priv);
>  	if (ret < 0) {
> -		dev_err(&client->dev, "Unable to turn PoC on\n");
> +		dev_err(dev, "Unable to turn PoC on\n");
>  		return ret;
>  	}
>
> @@ -1117,7 +1161,7 @@ static int max9286_init(struct device *dev)
>  err_v4l2_register:
>  	max9286_v4l2_unregister(priv);
>  err_regulator:
> -	regulator_disable(priv->regulator);
> +	max9286_poc_power_off(priv);
>
>  	return ret;
>  }
> @@ -1248,6 +1292,47 @@ static int max9286_parse_dt(struct max9286_priv *priv)
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
> +
> +		snprintf(name, sizeof(name), "port%u-poc", index);
> +		source->regulator = devm_regulator_get(dev, name);

Are you ok with a dummy being returned ?

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
> @@ -1292,17 +1377,13 @@ static int max9286_probe(struct i2c_client *client)
>  	if (ret)
>  		goto err_powerdown;
>
> -	priv->regulator = devm_regulator_get(&client->dev, "poc");
> -	if (IS_ERR(priv->regulator)) {
> -		ret = PTR_ERR(priv->regulator);
> -		dev_err_probe(&client->dev, ret,
> -			      "Unable to get PoC regulator\n");
> -		goto err_powerdown;
> -	}
> -
>  	ret = max9286_parse_dt(priv);
>  	if (ret)
> -		goto err_powerdown;
> +		goto err_cleanup_dt;

Shouldn't this be still err_powerdown ?

> +
> +	ret = max9286_get_poc_supplies(priv);
> +	if (ret)
> +		goto err_cleanup_dt;
>
>  	ret = max9286_init(&client->dev);
>  	if (ret < 0)
> @@ -1326,7 +1407,7 @@ static int max9286_remove(struct i2c_client *client)
>
>  	max9286_v4l2_unregister(priv);
>
> -	regulator_disable(priv->regulator);
> +	max9286_poc_power_off(priv);
>
>  	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
>
> --
> Regards,
>
> Laurent Pinchart
>
