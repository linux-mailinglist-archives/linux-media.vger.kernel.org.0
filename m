Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8E1D66BC20
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 11:48:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbjAPKsi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 05:48:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbjAPKsb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 05:48:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03F5019686
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 02:48:30 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E7E9802;
        Mon, 16 Jan 2023 11:48:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673866108;
        bh=LsjXMHYzE5m4TXe3hmJ9X0BHpocVP17hILgAskronnA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DqKebJlGPHPcbiRBicVv/Ej+q5kv2RgwFvGo3v5TmDJtzV2RshjzXp6upKX0ep4Gb
         BvqFWiFx0jRdEP+hGcCwSEwljnignzzUH2veZhOhDjkkTRTnKVvDJdJ4tbYXU/4fFZ
         /UYvuo1XPytZbt5HOxKPO/izXxUnZj7Rs2AaMVFs=
Date:   Mon, 16 Jan 2023 12:48:28 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 08/17] media: i2c: imx290: Factor out DT parsing to
 separate function
Message-ID: <Y8UrfCfELkwfJX/4@pendragon.ideasonboard.com>
References: <20230114171727.13830-1-laurent.pinchart@ideasonboard.com>
 <20230114171802.13878-1-laurent.pinchart@ideasonboard.com>
 <20230114171802.13878-8-laurent.pinchart@ideasonboard.com>
 <3218497.44csPzL39Z@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3218497.44csPzL39Z@steina-w>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Mon, Jan 16, 2023 at 11:33:47AM +0100, Alexander Stein wrote:
> Am Samstag, 14. Januar 2023, 18:17:53 CET schrieb Laurent Pinchart:
> > Make the probe() function more readable by factoring out the DT parsing
> > code to a separate function. No functional change intended.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx290.c | 95 +++++++++++++++++++++-----------------
> >  1 file changed, 52 insertions(+), 43 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index 0dc536893ebf..18c1e5c429a2 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -1144,111 +1144,124 @@ static s64 imx290_check_link_freqs(const struct
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
> > +		dev_err(imx290->dev, "Invalid data lanes: %d\n", imx290-
> >nlanes);
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
> >  	/* Check that link frequences for all the modes are in device tree */
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
> Please use dev_err_probe() here.

It's done in the next patch in this series, which converts the driver to
dev_err_probe(). This patch only factors out code.

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
> Please use dev_err_probe() here.
> 
> >  	}
> > 
> >  	imx290->rst_gpio = devm_gpiod_get_optional(dev, "reset",
> >  						   GPIOD_OUT_HIGH);
> >  	if (IS_ERR(imx290->rst_gpio)) {
> >  		dev_err(dev, "Cannot get reset gpio\n");
> > -		ret = PTR_ERR(imx290->rst_gpio);
> > -		goto err_endpoint;
> > +		return PTR_ERR(imx290->rst_gpio);
> >  	}
> > 
> >  	mutex_init(&imx290->lock);
> > @@ -1274,16 +1287,12 @@ static int imx290_probe(struct i2c_client *client)
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
