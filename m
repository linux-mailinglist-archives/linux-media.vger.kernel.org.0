Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE8B66BBC9
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 11:33:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbjAPKdw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 05:33:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbjAPKdv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 05:33:51 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAD081ABC1
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 02:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673865228; x=1705401228;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XdEYTQSPlTqOhmvlT9+Dg9CnnN0qelPRLuJMiOPnDWU=;
  b=iNvkCQm+gXQOfCCI3UvpIyrqI/dfb4CjXlXUniB24V3Lc28I+fHGQ3WQ
   uVUHDzZnJhO6rlnPO2igUU2L2j8fvPjPE686THOkoyseG1hI9uj9iC75H
   os8iAxKML+f8CI1yqYxQjaSRYZdZwJTECP/e8+zQGZ9VvEw1EKItI1pT0
   RszKO/bGZtIsN/oedBt5u5qYfIn3PIBvGm6EXgBGkRHMNdgaixj5EmBg4
   jJb49DOD/iqy5/5UKrIPhe6bjPiYI/Dfvic74xuIvNtF2XVMEBzf70eDP
   zpSlM/RCNFU15ddEXIcUQW2BYTbhnDtn2F1nO+s8bk7t/Czlhlq9ibnZV
   A==;
X-IronPort-AV: E=Sophos;i="5.97,220,1669071600"; 
   d="scan'208";a="28445921"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Jan 2023 11:33:47 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 16 Jan 2023 11:33:47 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 16 Jan 2023 11:33:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673865227; x=1705401227;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XdEYTQSPlTqOhmvlT9+Dg9CnnN0qelPRLuJMiOPnDWU=;
  b=qCRNjInukqIhjfd9892uMaU/hOHA8iN4Px1Z1LTTDCqiu/KdOySDrbLD
   2VfNzOx5FXE9zH+0/X0EY0SPCFzXRiw0eSS9UG++wBkB4lnVmYedx6uUh
   XwFgIRr/p8B1UoKOkVEt9YFrlgDkDQP1fCYrgAlsh3Z7gVee0TplIzrO4
   GoQNUuS5E6d1gJjBaskmosJsV6AheUbbGFFyRCEGmCuJfss4ASTieBsOl
   fdCNRYWG8wVQ4iELGu88nRPKKf6vom+y+ml6p4fViP0uH/y8IkiAIgYkf
   1Nt92cZmf7MQo+/gkPYPQnxiQsU26rFq9/IbTU5/ZjRIUbzZkcTGNabGm
   A==;
X-IronPort-AV: E=Sophos;i="5.97,220,1669071600"; 
   d="scan'208";a="28445920"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Jan 2023 11:33:46 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 9A5EC280072;
        Mon, 16 Jan 2023 11:33:46 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 08/17] media: i2c: imx290: Factor out DT parsing to separate function
Date:   Mon, 16 Jan 2023 11:33:47 +0100
Message-ID: <3218497.44csPzL39Z@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230114171802.13878-8-laurent.pinchart@ideasonboard.com>
References: <20230114171727.13830-1-laurent.pinchart@ideasonboard.com> <20230114171802.13878-1-laurent.pinchart@ideasonboard.com> <20230114171802.13878-8-laurent.pinchart@ideasonboard.com>
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

Hi Laurent,

thanks for the update.

Am Samstag, 14. Januar 2023, 18:17:53 CET schrieb Laurent Pinchart:
> Make the probe() function more readable by factoring out the DT parsing
> code to a separate function. No functional change intended.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 95 +++++++++++++++++++++-----------------
>  1 file changed, 52 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 0dc536893ebf..18c1e5c429a2 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -1144,111 +1144,124 @@ static s64 imx290_check_link_freqs(const struct
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

Please use dev_err_probe() here.

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

Please use dev_err_probe() here.

Regards,
Alexander

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
>  	}
> 
>  	mutex_init(&imx290->lock);
> @@ -1274,16 +1287,12 @@ static int imx290_probe(struct i2c_client *client)
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




