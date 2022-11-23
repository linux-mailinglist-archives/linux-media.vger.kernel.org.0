Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA6C6635A01
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 11:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236199AbiKWKcg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 05:32:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237236AbiKWKcA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 05:32:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A245A11A704
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 02:16:21 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0603F88F;
        Wed, 23 Nov 2022 11:16:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669198580;
        bh=FqC9UY7tgk9azFLIuV2sI6UDFx/RZot0hz5R6KH9w38=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oQh0xQIv7+0CgqscmmOnqlAQPQlExFE1ffq3m4fgSw510g30bO9LomVDEedKwGsjD
         yl+7wrl74YzqlHofjRs/VlNMtvcaZFhE5fEk2O1CcX0pjLYV+n8r7ZgqVO0+A7Fkoa
         IkhkyTpwqDTX7OAn0KkD7sxQ+3KckPeN2sBpCVf0=
Date:   Wed, 23 Nov 2022 12:16:04 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v1 08/15] media: i2c: imx290: Factor out DT parsing to
 separate function
Message-ID: <Y33y5NWdLVUnCzR5@pendragon.ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com>
 <20221122223250.21233-9-laurent.pinchart@ideasonboard.com>
 <3708802.kQq0lBPeGt@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3708802.kQq0lBPeGt@steina-w>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Wed, Nov 23, 2022 at 09:14:34AM +0100, Alexander Stein wrote:
> Am Dienstag, 22. November 2022, 23:32:43 CET schrieb Laurent Pinchart:
> > Make the probe() function more readable by factoring out the DT parsing
> > code to a separate function. No functional change intended.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx290.c | 97 +++++++++++++++++++++-----------------
> >  1 file changed, 53 insertions(+), 44 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index d9fc6c44b0f0..655f676df3d2 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -1139,112 +1139,125 @@ static s64 imx290_check_link_freqs(const struct
> > imx290 *imx290, return 0;
> >  }
> > 
> > -static int imx290_probe(struct i2c_client *client)
> > +static int imx290_parse_dt(struct imx290 *imx290)
> >  {
> > -	struct device *dev = &client->dev;
> > -	struct fwnode_handle *endpoint;
> >  	/* Only CSI2 is supported for now: */
> >  	struct v4l2_fwnode_endpoint ep = {
> >  		.bus_type = V4L2_MBUS_CSI2_DPHY
> >  	};
> > -	struct imx290 *imx290;
> > -	u32 xclk_freq;
> > -	u32 chip_id;
> 
> I assume your patch for reading the chip ID slipped into this series.
> Either add it to the series or rearrange your patches.

Oops. I'll fix that.

> > +	struct fwnode_handle *endpoint;
> > +	int ret;
> >  	s64 fq;
> > -	int ret;
> > 
> > -	imx290 = devm_kzalloc(dev, sizeof(*imx290), GFP_KERNEL);
> > -	if (!imx290)
> > -		return -ENOMEM;
> > -
> > -	imx290->dev = dev;
> > -	imx290->regmap = devm_regmap_init_i2c(client, &imx290_regmap_config);
> > -	if (IS_ERR(imx290->regmap)) {
> > -		dev_err(dev, "Unable to initialize I2C\n");
> > -		return -ENODEV;
> > -	}
> > -
> > -	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
> > +	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(imx290->dev), NULL);
> >  	if (!endpoint) {
> > -		dev_err(dev, "Endpoint node not found\n");
> > +		dev_err(imx290->dev, "Endpoint node not found\n");
> >  		return -EINVAL;
> >  	}
> > 
> >  	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
> >  	fwnode_handle_put(endpoint);
> >  	if (ret == -ENXIO) {
> > -		dev_err(dev, "Unsupported bus type, should be CSI2\n");
> > -		goto err_endpoint;
> > +		dev_err(imx290->dev, "Unsupported bus type, should be CSI2\n");
> > +		goto done;
> >  	} else if (ret) {
> > -		dev_err(dev, "Parsing endpoint node failed\n");
> > -		goto err_endpoint;
> > +		dev_err(imx290->dev, "Parsing endpoint node failed\n");
> > +		goto done;
> >  	}
> > 
> >  	/* Get number of data lanes */
> >  	imx290->nlanes = ep.bus.mipi_csi2.num_data_lanes;
> >  	if (imx290->nlanes != 2 && imx290->nlanes != 4) {
> > -		dev_err(dev, "Invalid data lanes: %d\n", imx290->nlanes);
> > +		dev_err(imx290->dev, "Invalid data lanes: %d\n", imx290->nlanes);
> >  		ret = -EINVAL;
> > -		goto err_endpoint;
> > +		goto done;
> >  	}
> > 
> > -	dev_dbg(dev, "Using %u data lanes\n", imx290->nlanes);
> > +	dev_dbg(imx290->dev, "Using %u data lanes\n", imx290->nlanes);
> > 
> >  	if (!ep.nr_of_link_frequencies) {
> > -		dev_err(dev, "link-frequency property not found in DT\n");
> > +		dev_err(imx290->dev, "link-frequency property not found in DT\n");
> >  		ret = -EINVAL;
> > -		goto err_endpoint;
> > +		goto done;
> >  	}
> > 
> >  	/* Check that link frequences for all the modes are in device tree 
> */
> >  	fq = imx290_check_link_freqs(imx290, &ep);
> >  	if (fq) {
> > -		dev_err(dev, "Link frequency of %lld is not supported\n", fq);
> > +		dev_err(imx290->dev, "Link frequency of %lld is not supported\n",
> > +			fq);
> >  		ret = -EINVAL;
> > -		goto err_endpoint;
> > +		goto done;
> >  	}
> > 
> > +	ret = 0;
> > +
> > +done:
> > +	v4l2_fwnode_endpoint_free(&ep);
> > +	return ret;
> > +}
> > +
> > +static int imx290_probe(struct i2c_client *client)
> > +{
> > +	struct device *dev = &client->dev;
> > +	struct imx290 *imx290;
> > +	u32 xclk_freq;
> > +	u32 chip_id;
> > +	int ret;
> > +
> > +	imx290 = devm_kzalloc(dev, sizeof(*imx290), GFP_KERNEL);
> > +	if (!imx290)
> > +		return -ENOMEM;
> > +
> > +	imx290->dev = dev;
> > +	imx290->regmap = devm_regmap_init_i2c(client, &imx290_regmap_config);
> > +	if (IS_ERR(imx290->regmap)) {
> > +		dev_err(dev, "Unable to initialize I2C\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	ret = imx290_parse_dt(imx290);
> > +	if (ret)
> > +		return ret;
> > +
> >  	/* get system clock (xclk) */
> >  	imx290->xclk = devm_clk_get(dev, "xclk");
> >  	if (IS_ERR(imx290->xclk)) {
> >  		dev_err(dev, "Could not get xclk");
> > -		ret = PTR_ERR(imx290->xclk);
> > -		goto err_endpoint;
> > +		return PTR_ERR(imx290->xclk);
> 
> Mh, using dev_err_probe this can be a one-liner.

It's done later in the series :-)

> >  	}
> > 
> >  	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> >  				       &xclk_freq);
> >  	if (ret) {
> >  		dev_err(dev, "Could not get xclk frequency\n");
> > -		goto err_endpoint;
> > +		return ret;
> >  	}
> > 
> >  	/* external clock must be 37.125 MHz */
> >  	if (xclk_freq != 37125000) {
> >  		dev_err(dev, "External clock frequency %u is not supported\n",
> >  			xclk_freq);
> > -		ret = -EINVAL;
> > -		goto err_endpoint;
> > +		return -EINVAL;
> >  	}
> > 
> >  	ret = clk_set_rate(imx290->xclk, xclk_freq);
> >  	if (ret) {
> >  		dev_err(dev, "Could not set xclk frequency\n");
> > -		goto err_endpoint;
> > +		return ret;
> >  	}
> > 
> >  	ret = imx290_get_regulators(dev, imx290);
> >  	if (ret < 0) {
> >  		dev_err(dev, "Cannot get regulators\n");
> > -		goto err_endpoint;
> > +		return ret;
> 
> Using dev_err_probe this can be a one-liner as well.
> 
> >  	}
> > 
> >  	imx290->rst_gpio = devm_gpiod_get_optional(dev, "reset",
> >  						   
> GPIOD_OUT_HIGH);
> >  	if (IS_ERR(imx290->rst_gpio)) {
> >  		dev_err(dev, "Cannot get reset gpio\n");
> > -		ret = PTR_ERR(imx290->rst_gpio);
> > -		goto err_endpoint;
> > +		return PTR_ERR(imx290->rst_gpio);
> 
> Using dev_err_probe this can be a one-liner as well.
> 
> >  	}
> > 
> >  	mutex_init(&imx290->lock);
> > @@ -1279,16 +1292,12 @@ static int imx290_probe(struct i2c_client *client)
> >  	pm_runtime_enable(dev);
> >  	pm_runtime_idle(dev);
> > 
> > -	v4l2_fwnode_endpoint_free(&ep);
> > -
> >  	return 0;
> > 
> >  err_subdev:
> >  	imx290_subdev_cleanup(imx290);
> >  err_mutex:
> >  	mutex_destroy(&imx290->lock);
> > -err_endpoint:
> > -	v4l2_fwnode_endpoint_free(&ep);
> > 
> >  	return ret;
> >  }

-- 
Regards,

Laurent Pinchart
