Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 716DB47B020
	for <lists+linux-media@lfdr.de>; Mon, 20 Dec 2021 16:25:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240196AbhLTPZr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Dec 2021 10:25:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238321AbhLTPY4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Dec 2021 10:24:56 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F94C08EADE;
        Mon, 20 Dec 2021 07:06:29 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id o19-20020a1c7513000000b0033a93202467so78756wmc.2;
        Mon, 20 Dec 2021 07:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/TNnKJsYSf1uPqvI2vKIYhgVT+bHBsIJzKjGkvivO5Q=;
        b=YgTXUXG2GthSp3Tgwyy+vg2G2yOjm/8UdcT0eXP/TGpfLaH40c5icZyku2hPmynx08
         UMeRWJVmkO6N6b/0tbRNZx/D3kj/njaHZHMi6U48JCevGA24paLREoSpzHLEAAKvJjI9
         zpoqpv02/WnWT1PVYK/hOInUEZvrKYZHdEdRVWEUEjFyG8mpFgoYTa7m85l7zNVf456h
         8PPMVs6NJ5tpWHMVkmvFlFQj2AcyZpe117dDHpp3eRPbk7KijlaD62DvgjtPg9ra4cGt
         xIUCR8rly1INeEwSVXrqLAjSa1SCtbHCyxwcG7+u1hirOWeJtivemeS89IBsL2ZI89tN
         RgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/TNnKJsYSf1uPqvI2vKIYhgVT+bHBsIJzKjGkvivO5Q=;
        b=uI7mp4GgDMaP2b3oRP7ZrFup4jqP9Qmd1tCDjyJZXyvO3kk3DFa5oLpfYydfc4An90
         WtpfKtUkci6YIgj6sek7p98QjxNKO6GxIDr+ag9xcs/vlxkPJdN3hJo30que1DCzdRrs
         y3cyyHSKCI8rviFOD/uRVQGKFu9q13WryXrTOEk9tIwcamfsE8mWfdrZNtIEobdIobEt
         QGuO//bzjLfdhF6iubEzbnf3HRpGQsZXtsjTZmIU+1YOVW9yX6IIPUSNlCGuzwpb1MAm
         I2f27z0/41/rbhYmsdoa7fM3FF+cTEmQaxci5TbY+EPrxvQNKDqumWr2hKobMqhw4+5B
         RiJw==
X-Gm-Message-State: AOAM5302RVPaviSDWeXwhm9QOapIglqEbHtKjSvjT4O2FaQFDDZzXakJ
        wg11JHwIkaobZSa6G+fU6PlWBkn7etSnBg==
X-Google-Smtp-Source: ABdhPJycseMxLoL95NdftKbWYmS05CTN/c6X2tbiNdaht/0R7LZUL0GiiczdW1qHQz7CBpCWskUy7w==
X-Received: by 2002:a1c:287:: with SMTP id 129mr21357377wmc.49.1640012787660;
        Mon, 20 Dec 2021 07:06:27 -0800 (PST)
Received: from ?IPv6:2001:861:3dc1:7340:e42c:3e5b:309c:db01? ([2001:861:3dc1:7340:e42c:3e5b:309c:db01])
        by smtp.gmail.com with ESMTPSA id p62sm15226707wmp.10.2021.12.20.07.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 07:06:27 -0800 (PST)
Subject: Re: [PATCH 2/3] media: i2c: max9286: Add support for port regulators
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
References: <20211216220946.20771-1-laurent.pinchart+renesas@ideasonboard.com>
 <20211216220946.20771-3-laurent.pinchart+renesas@ideasonboard.com>
From:   Thomas Nizan <tomniz035@gmail.com>
Message-ID: <351eddd4-fc73-420e-0817-7282e413c126@gmail.com>
Date:   Mon, 20 Dec 2021 16:06:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20211216220946.20771-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
On 2021-12-16 11:09 p.m., Laurent Pinchart wrote:
> From: Thomas Nizan <tnizan@witekio.com>
> 
> Allow users to use one PoC regulator per port, instead of a global
> regulator.
> 
> The properties '^port[0-3]-poc-supply$' in the DT node are used to
> indicate the regulators for individual ports.
> 
Signed-off-by: Thomas Nizan <tnizan@witekio.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/max9286.c | 112 +++++++++++++++++++++++++++++++-----
>  1 file changed, 98 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 7c663fd587bb..fa2f6a823fe6 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -136,8 +136,10 @@
>  #define MAX9286_SRC_PAD			4
>  
>  struct max9286_source {
> +	unsigned int index;
>  	struct v4l2_subdev *sd;
>  	struct fwnode_handle *fwnode;
> +	struct regulator *regulator;
>  };
>  
>  struct max9286_asd {
> @@ -1072,6 +1074,49 @@ static int max9286_register_gpio(struct max9286_priv *priv)
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
> +		enabled |= BIT(source->index);
> +	}
> +
> +	return 0;
> +
> +error:
> +	for_each_source(priv, source) {
> +		if (enabled & BIT(source->index))
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
> @@ -1082,9 +1127,9 @@ static int max9286_init(struct device *dev)
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
> @@ -1118,7 +1163,7 @@ static int max9286_init(struct device *dev)
>  err_v4l2_register:
>  	max9286_v4l2_unregister(priv);
>  err_regulator:
> -	regulator_disable(priv->regulator);
> +	max9286_poc_power_off(priv);
>  
>  	return ret;
>  }
> @@ -1215,6 +1260,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
>  		}
>  
>  		source = &priv->sources[ep.port];
> +		source->index = ep.port;
>  		source->fwnode = fwnode_graph_get_remote_endpoint(
>  						of_fwnode_handle(node));
>  		if (!source->fwnode) {
> @@ -1249,6 +1295,50 @@ static int max9286_parse_dt(struct max9286_priv *priv)
>  	return 0;
>  }
>  
> +static int max9286_get_poc_supplies(struct max9286_priv *priv)
> +{
> +	struct device *dev = &priv->client->dev;
> +	struct max9286_source *source;
> +
> +	/*
> +	 * Start by getting the global regulator. Usage of the exclusive API is
> +	 * required to receive an error in case the supply isn't specified in
> +	 * the device tree.
> +	 */
> +	priv->regulator = devm_regulator_get_exclusive(dev, "poc");
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
> +		char name[10];
> +
> +		snprintf(name, sizeof(name), "port%u-poc", source->index);
> +		source->regulator = devm_regulator_get_exclusive(dev, name);
> +		if (IS_ERR(source->regulator)) {
> +			if (PTR_ERR(source->regulator) != -EPROBE_DEFER)
> +				dev_err(dev,
> +					"Unable to get port %u PoC regulator: %ld\n",
> +					source->index,
> +					PTR_ERR(source->regulator));
> +			return PTR_ERR(source->regulator);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int max9286_probe(struct i2c_client *client)
>  {
>  	struct max9286_priv *priv;
> @@ -1293,17 +1383,11 @@ static int max9286_probe(struct i2c_client *client)
>  	if (ret)
>  		goto err_powerdown;
>  
> -	priv->regulator = devm_regulator_get(&client->dev, "poc");
> -	if (IS_ERR(priv->regulator)) {
> -		if (PTR_ERR(priv->regulator) != -EPROBE_DEFER)
> -			dev_err(&client->dev,
> -				"Unable to get PoC regulator (%ld)\n",
> -				PTR_ERR(priv->regulator));
> -		ret = PTR_ERR(priv->regulator);
> -		goto err_powerdown;
> -	}
> -
>  	ret = max9286_parse_dt(priv);
> +	if (ret)
> +		goto err_cleanup_dt;
> +
> +	ret = max9286_get_poc_supplies(priv);
>  	if (ret)
>  		goto err_powerdown;
>  
> @@ -1329,7 +1413,7 @@ static int max9286_remove(struct i2c_client *client)
>  
>  	max9286_v4l2_unregister(priv);
>  
> -	regulator_disable(priv->regulator);
> +	max9286_poc_power_off(priv);
>  
>  	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
>  
> 
Regards,
Thomas

