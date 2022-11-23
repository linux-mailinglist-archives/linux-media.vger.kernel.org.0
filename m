Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01E7263520A
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 09:15:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235966AbiKWIOh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 03:14:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235969AbiKWIOg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 03:14:36 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F1EF1D86
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 00:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669191274; x=1700727274;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WdYbUzna63LMa6pDawKbFrqNJiy66gHLwsgvfMUGYfY=;
  b=IpP5g/zeueZWUppqevmn310NnxzdQ7WHqVw3+3Kd+gU4TeDo6CXD34Zb
   nQovTebthgOe6o5BMH9VQzvc4PeQZuK/xKMdsLieKYQAxmF3KNK/8oHOn
   bLTbi6NlJOXB/3K15kAKu7POCjasuMAJJvJrJy0beE3T7RRYzJyMTVt1c
   /Mmufr0MMqa4MhLN3f8258M6gXyQRywLJwEtnevss2txO5V7NmGUh4B5o
   w1aNO0QGlyLvETftIskCr+2s44kFriO7m1Y8qC9lLeOlAdVsAQlAT6vzW
   YqNRyVRENzNcz17DeajAfhBnW1sVlGY6e8Ul4SiX3yu/k9wgbcbe5B0Z4
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27527131"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 23 Nov 2022 09:14:32 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 23 Nov 2022 09:14:32 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 23 Nov 2022 09:14:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669191272; x=1700727272;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WdYbUzna63LMa6pDawKbFrqNJiy66gHLwsgvfMUGYfY=;
  b=PCE4jztVEZ1+s9HtXGxADfk8dkXHYUPWVq7c0Bl0fihRVQlDa+TqLiTh
   Ri0APf65Zu4OaxFhr/ddk7AgCaFlJOGYeN6E2Qp3w07prfUxE2YT1lPGU
   Rw8Mcvq9gTgIqmKa0YBwaLWKitQS29U525n1tw954iio9LOZxD5Rl9DDY
   C2cLbgmNBXhzn8KAzqFd9yIHKFHZqbdJq3vQj9Sy0thgMq+9oJc4+7UwW
   XudjRmH4JZOH/gS6jdTAYe0Y0u0d6Bk8PwXikOJHaULQ6enmfidwMjDb+
   2e/oAVuoZy/ZBBlKkvJC7aLUQRLPkvjSpPndxclSvtZAnkuJ5ZuVZn4Az
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27527130"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 23 Nov 2022 09:14:32 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A0BEE280056;
        Wed, 23 Nov 2022 09:14:32 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v1 08/15] media: i2c: imx290: Factor out DT parsing to separate function
Date:   Wed, 23 Nov 2022 09:14:34 +0100
Message-ID: <3708802.kQq0lBPeGt@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20221122223250.21233-9-laurent.pinchart@ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com> <20221122223250.21233-9-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Laurent,

thanks for working on this.

Am Dienstag, 22. November 2022, 23:32:43 CET schrieb Laurent Pinchart:
> Make the probe() function more readable by factoring out the DT parsing
> code to a separate function. No functional change intended.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 97 +++++++++++++++++++++-----------------
>  1 file changed, 53 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index d9fc6c44b0f0..655f676df3d2 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -1139,112 +1139,125 @@ static s64 imx290_check_link_freqs(const struct
> imx290 *imx290, return 0;
>  }
> 
> -static int imx290_probe(struct i2c_client *client)
> +static int imx290_parse_dt(struct imx290 *imx290)
>  {
> -	struct device *dev = &client->dev;
> -	struct fwnode_handle *endpoint;
>  	/* Only CSI2 is supported for now: */
>  	struct v4l2_fwnode_endpoint ep = {
>  		.bus_type = V4L2_MBUS_CSI2_DPHY
>  	};
> -	struct imx290 *imx290;
> -	u32 xclk_freq;
> -	u32 chip_id;

I assume your patch for reading the chip ID slipped into this series.
Either add it to the series or rearrange your patches.

> +	struct fwnode_handle *endpoint;
> +	int ret;
>  	s64 fq;
> -	int ret;
> 
> -	imx290 = devm_kzalloc(dev, sizeof(*imx290), GFP_KERNEL);
> -	if (!imx290)
> -		return -ENOMEM;
> -
> -	imx290->dev = dev;
> -	imx290->regmap = devm_regmap_init_i2c(client, 
&imx290_regmap_config);
> -	if (IS_ERR(imx290->regmap)) {
> -		dev_err(dev, "Unable to initialize I2C\n");
> -		return -ENODEV;
> -	}
> -
> -	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
> +	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(imx290->dev), 
NULL);
>  	if (!endpoint) {
> -		dev_err(dev, "Endpoint node not found\n");
> +		dev_err(imx290->dev, "Endpoint node not found\n");
>  		return -EINVAL;
>  	}
> 
>  	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
>  	fwnode_handle_put(endpoint);
>  	if (ret == -ENXIO) {
> -		dev_err(dev, "Unsupported bus type, should be CSI2\n");
> -		goto err_endpoint;
> +		dev_err(imx290->dev, "Unsupported bus type, should be 
CSI2\n");
> +		goto done;
>  	} else if (ret) {
> -		dev_err(dev, "Parsing endpoint node failed\n");
> -		goto err_endpoint;
> +		dev_err(imx290->dev, "Parsing endpoint node failed\n");
> +		goto done;
>  	}
> 
>  	/* Get number of data lanes */
>  	imx290->nlanes = ep.bus.mipi_csi2.num_data_lanes;
>  	if (imx290->nlanes != 2 && imx290->nlanes != 4) {
> -		dev_err(dev, "Invalid data lanes: %d\n", imx290->nlanes);
> +		dev_err(imx290->dev, "Invalid data lanes: %d\n", imx290-
>nlanes);
>  		ret = -EINVAL;
> -		goto err_endpoint;
> +		goto done;
>  	}
> 
> -	dev_dbg(dev, "Using %u data lanes\n", imx290->nlanes);
> +	dev_dbg(imx290->dev, "Using %u data lanes\n", imx290->nlanes);
> 
>  	if (!ep.nr_of_link_frequencies) {
> -		dev_err(dev, "link-frequency property not found in DT\n");
> +		dev_err(imx290->dev, "link-frequency property not found in 
DT\n");
>  		ret = -EINVAL;
> -		goto err_endpoint;
> +		goto done;
>  	}
> 
>  	/* Check that link frequences for all the modes are in device tree 
*/
>  	fq = imx290_check_link_freqs(imx290, &ep);
>  	if (fq) {
> -		dev_err(dev, "Link frequency of %lld is not supported\n", 
fq);
> +		dev_err(imx290->dev, "Link frequency of %lld is not 
supported\n",
> +			fq);
>  		ret = -EINVAL;
> -		goto err_endpoint;
> +		goto done;
>  	}
> 
> +	ret = 0;
> +
> +done:
> +	v4l2_fwnode_endpoint_free(&ep);
> +	return ret;
> +}
> +
> +static int imx290_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct imx290 *imx290;
> +	u32 xclk_freq;
> +	u32 chip_id;
> +	int ret;
> +
> +	imx290 = devm_kzalloc(dev, sizeof(*imx290), GFP_KERNEL);
> +	if (!imx290)
> +		return -ENOMEM;
> +
> +	imx290->dev = dev;
> +	imx290->regmap = devm_regmap_init_i2c(client, 
&imx290_regmap_config);
> +	if (IS_ERR(imx290->regmap)) {
> +		dev_err(dev, "Unable to initialize I2C\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = imx290_parse_dt(imx290);
> +	if (ret)
> +		return ret;
> +
>  	/* get system clock (xclk) */
>  	imx290->xclk = devm_clk_get(dev, "xclk");
>  	if (IS_ERR(imx290->xclk)) {
>  		dev_err(dev, "Could not get xclk");
> -		ret = PTR_ERR(imx290->xclk);
> -		goto err_endpoint;
> +		return PTR_ERR(imx290->xclk);

Mh, using dev_err_probe this can be a one-liner.

>  	}
> 
>  	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
>  				       &xclk_freq);
>  	if (ret) {
>  		dev_err(dev, "Could not get xclk frequency\n");
> -		goto err_endpoint;
> +		return ret;
>  	}
> 
>  	/* external clock must be 37.125 MHz */
>  	if (xclk_freq != 37125000) {
>  		dev_err(dev, "External clock frequency %u is not 
supported\n",
>  			xclk_freq);
> -		ret = -EINVAL;
> -		goto err_endpoint;
> +		return -EINVAL;
>  	}
> 
>  	ret = clk_set_rate(imx290->xclk, xclk_freq);
>  	if (ret) {
>  		dev_err(dev, "Could not set xclk frequency\n");
> -		goto err_endpoint;
> +		return ret;
>  	}
> 
>  	ret = imx290_get_regulators(dev, imx290);
>  	if (ret < 0) {
>  		dev_err(dev, "Cannot get regulators\n");
> -		goto err_endpoint;
> +		return ret;

Using dev_err_probe this can be a one-liner as well.

>  	}
> 
>  	imx290->rst_gpio = devm_gpiod_get_optional(dev, "reset",
>  						   
GPIOD_OUT_HIGH);
>  	if (IS_ERR(imx290->rst_gpio)) {
>  		dev_err(dev, "Cannot get reset gpio\n");
> -		ret = PTR_ERR(imx290->rst_gpio);
> -		goto err_endpoint;
> +		return PTR_ERR(imx290->rst_gpio);

Using dev_err_probe this can be a one-liner as well.

Regards,
Alexander

>  	}
> 
>  	mutex_init(&imx290->lock);
> @@ -1279,16 +1292,12 @@ static int imx290_probe(struct i2c_client *client)
>  	pm_runtime_enable(dev);
>  	pm_runtime_idle(dev);
> 
> -	v4l2_fwnode_endpoint_free(&ep);
> -
>  	return 0;
> 
>  err_subdev:
>  	imx290_subdev_cleanup(imx290);
>  err_mutex:
>  	mutex_destroy(&imx290->lock);
> -err_endpoint:
> -	v4l2_fwnode_endpoint_free(&ep);
> 
>  	return ret;
>  }




