Return-Path: <linux-media+bounces-24979-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 529A9A16DF5
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 15:01:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F67A1889EF4
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 14:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B216E1E2859;
	Mon, 20 Jan 2025 13:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NuSpdEZP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FD21E5721;
	Mon, 20 Jan 2025 13:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737381564; cv=none; b=PCJq9n7gSvHgE7KXAf/1l/lnn8ICT2U6ApH8vs3SwZKq+/6tGshRtZa8wCESdzo60CRlYtUr35grR1k0i05fADOVv0sByKL+xWKDhvKImLso49fhpQEcLpOIJjuVybSEnZivzXBrTRYGFKWH32Z/YtwaIgLVPIUWeAwTXY2rp/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737381564; c=relaxed/simple;
	bh=k9h+/5R4Ryv1JBapgOfcV4qZgCAtLCDgf6s0K6M4h9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fpy6cbC/FURHXyJLWUUQpqdcbdR0SSGX+0WFyNgOYRLiJYf4qphNbFY44JKT8TsVjSSOP6LxhOBidLCdGHdg3xEPlGhEy7olHomMBaMrVdaGU973ez4krILgUaOZoNAUSm+OPWe//x14S6ZPUfuSsLFogowrwGRoVXGNqOndaJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NuSpdEZP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EDF62E0;
	Mon, 20 Jan 2025 14:58:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737381499;
	bh=k9h+/5R4Ryv1JBapgOfcV4qZgCAtLCDgf6s0K6M4h9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NuSpdEZP64nhmcaTzVSLQR45loQZsR7h0nVPQ5bA9zb9PxuFRmVlPHJunodsyn0UR
	 N+R1UfS8gAjF/cicGWKNmchoOeEJB6URqmu60mvyyyRZ9NQxc/wPFwZ0NGHj3QKa+H
	 TPsZLOEZc2mTwEs6lhj6qVn9df0JnSt6AYbntqms=
Date: Mon, 20 Jan 2025 15:59:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, robh+dt@kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	peter.griffin@linaro.org, ezequiel@collabora.com
Subject: Re: [PATCH v3 2/2] media: i2c: Add driver for Sony IMX219 sensor
Message-ID: <20250120135913.GH9249@pendragon.ideasonboard.com>
References: <20200110200915.22575-1-andrey.konovalov@linaro.org>
 <20200110200915.22575-3-andrey.konovalov@linaro.org>
 <Z44soIWngnmCjoe6@kekkonen.localdomain>
 <CAPY8ntBXwUmjSgb2z65mUZ1GSEUT8oczQMN+dewaevz9HemYag@mail.gmail.com>
 <Z45RNl5bV-MruxNZ@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z45RNl5bV-MruxNZ@kekkonen.localdomain>

On Mon, Jan 20, 2025 at 01:35:50PM +0000, Sakari Ailus wrote:
> On Mon, Jan 20, 2025 at 12:28:04PM +0000, Dave Stevenson wrote:
> > On Mon, 20 Jan 2025 at 10:59, Sakari Ailus wrote:
> > > On Fri, Jan 10, 2020 at 11:09:15PM +0300, Andrey Konovalov wrote:
> > > > +/* Power/clock management functions */
> > > > +static int imx219_power_on(struct device *dev)
> > > > +{
> > > > +     struct i2c_client *client = to_i2c_client(dev);
> > > > +     struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > > +     struct imx219 *imx219 = to_imx219(sd);
> > > > +     int ret;
> > > > +
> > > > +     ret = regulator_bulk_enable(IMX219_NUM_SUPPLIES,
> > > > +                                 imx219->supplies);
> > > > +     if (ret) {
> > > > +             dev_err(&client->dev, "%s: failed to enable regulators\n",
> > > > +                     __func__);
> > > > +             return ret;
> > > > +     }
> > > > +
> > > > +     ret = clk_prepare_enable(imx219->xclk);
> > > > +     if (ret) {
> > > > +             dev_err(&client->dev, "%s: failed to enable clock\n",
> > > > +                     __func__);
> > > > +             goto reg_off;
> > > > +     }
> > > > +
> > > > +     gpiod_set_value_cansleep(imx219->reset_gpio, 1);
> > > > +     msleep(IMX219_XCLR_DELAY_MS);
> > > > +
> > > > +     return 0;
> > > > +reg_off:
> > > > +     regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static int imx219_power_off(struct device *dev)
> > > > +{
> > > > +     struct i2c_client *client = to_i2c_client(dev);
> > > > +     struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > > +     struct imx219 *imx219 = to_imx219(sd);
> > > > +
> > > > +     gpiod_set_value_cansleep(imx219->reset_gpio, 0);
> > >
> > > The polarity of the reset GPIO appears to be wrong above. Given it works
> > > somewhere (arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso), the
> > > existing DTS files have it wrong, too. The bindings still appear to
> > > document it correctly.
> > 
> > Why do you say it is wrong?
> > I don't recall why this got called reset-gpio - the signal on the
> > sensor is XCLR, and that is documented in the binding.
> > The datasheet says low is standby and high is active, which matches
> > what the driver does.
> 
> Documentation/driver-api/gpio/consumer.rst:
> 
> 	As a consumer should not have to care about the physical line
> 	level, all of the gpiod_set_value_xxx() or
> 	gpiod_set_array_value_xxx() functions operate with the *logical*
> 	value. With this they take the active low property into account.
> 	This means that they check whether the GPIO is configured to be
> 	active low, and if so, they manipulate the passed value before the
> 	physical line level is driven.
> 
> In other words, if the driver calls gpiod_set_value_cansleep(, 0), it
> enables reset signal on the device, bringing the device to hard reset. This
> is the opposite of what the driver does in its resume callback.
> 
> So in order to function, the DT must have wrong polarity as well.
> Similarly, if someone writes a correct DT for a board connecting the reset
> GPIO, the imx219 driver simply won't work.
> 
> Looking at the arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso overlay,
> it is for the RPi IMX219 module that does not connect the reset GPIO at
> all. In other words, there doesn't seem to be a upstream user of the reset
> GPIO in IMX219.
> 
> > > Laurent confirmed xcrl isn't controllable in the RPi imx219 camera module.
> > >
> > > How about fixing this? Currently correctly written DTBs including imx219
> > > won't work.
> > 
> > Seeing as the DTB is ABI, the only improvement I can see is to rename
> > "imx219->reset_gpio" to "imx219->xclr_gpio".
> > What else would you be proposing?
> 
> If there's a concern this could break existing DTs, the driver could try
> inverting the polarity of the GPIO if the sensor isn't immediately
> accessible.

I don't think that's a good idea.

> I wonder what others think.
> 
> Cc Laurent.

The real question is whether or not this could cause regressions.
Technically speaking, you're not changing the bindings, just the
driver. One could argue that it's not a DT ABI issue, but a driver
regression issue. The kernel still doesn't allow regressions. If you
can't be reasonably sure that nobody will be affected by a driver
change, you'll need to change the bindings to document the incorrect
polarity.

One could also argue that drivers for other operating systems implement
the correct behaviour, as documented in the bindings. This would mean
that the bindings can't be changed. It sounds more of a theoritical
situation though.

All things considered, this ship has probably sailed, and we'll likely
have to live with the incorrect polarity.

> > > I noticed this while fixing the power sequences in this and a few other
> > > drivers.
> > >
> > > > +     regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
> > > > +     clk_disable_unprepare(imx219->xclk);
> > > > +
> > > > +     return 0;
> > > > +}
> > >
> > > ...
> > >
> > > > +static int imx219_probe(struct i2c_client *client,
> > > > +                     const struct i2c_device_id *id)
> > > > +{
> > > > +     struct device *dev = &client->dev;
> > > > +     struct fwnode_handle *endpoint;
> > > > +     struct imx219 *imx219;
> > > > +     int ret;
> > > > +
> > > > +     imx219 = devm_kzalloc(&client->dev, sizeof(*imx219), GFP_KERNEL);
> > > > +     if (!imx219)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     imx219->dev = dev;
> > > > +
> > > > +     v4l2_i2c_subdev_init(&imx219->sd, client, &imx219_subdev_ops);
> > > > +
> > > > +     /* Get CSI2 bus config */
> > > > +     endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
> > > > +                                               NULL);
> > > > +     if (!endpoint) {
> > > > +             dev_err(dev, "endpoint node not found\n");
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > > > +     ret = v4l2_fwnode_endpoint_parse(endpoint, &imx219->ep);
> > > > +     fwnode_handle_put(endpoint);
> > > > +     if (ret) {
> > > > +             dev_err(dev, "could not parse endpoint\n");
> > > > +             return ret;
> > > > +     }
> > > > +
> > > > +     /* Check the number of MIPI CSI2 data lanes */
> > > > +     if (imx219->ep.bus_type != V4L2_MBUS_CSI2_DPHY ||
> > > > +         imx219->ep.bus.mipi_csi2.num_data_lanes != 2) {
> > > > +             dev_err(dev, "only 2 data lanes are currently supported\n");
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > > > +     /* Get system clock (xclk) */
> > > > +     imx219->xclk = devm_clk_get(dev, NULL);
> > > > +     if (IS_ERR(imx219->xclk)) {
> > > > +             dev_err(dev, "failed to get xclk\n");
> > > > +             return PTR_ERR(imx219->xclk);
> > > > +     }
> > > > +
> > > > +     imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > > > +     if (imx219->xclk_freq != IMX219_XCLK_FREQ) {
> > > > +             dev_err(dev, "xclk frequency not supported: %d Hz\n",
> > > > +                     imx219->xclk_freq);
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > > > +     ret = imx219_get_regulators(imx219);
> > > > +     if (ret) {
> > > > +             dev_err(dev, "failed to get regulators\n");
> > > > +             return ret;
> > > > +     }
> > > > +
> > > > +     /* Request optional enable pin */
> > > > +     imx219->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> > > > +                                                   GPIOD_OUT_HIGH);
> > > > +
> > > > +     /*
> > > > +      * The sensor must be powered for imx219_identify_module()
> > > > +      * to be able to read the CHIP_ID register
> > > > +      */
> > > > +     ret = imx219_power_on(dev);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     ret = imx219_identify_module(imx219);
> > > > +     if (ret)
> > > > +             goto error_power_off;
> > > > +
> > > > +     /* Set default mode to max resolution */
> > > > +     imx219->mode = &supported_modes[0];
> > > > +
> > > > +     ret = imx219_init_controls(imx219);
> > > > +     if (ret)
> > > > +             goto error_power_off;
> > > > +
> > > > +     /* Initialize subdev */
> > > > +     imx219->sd.internal_ops = &imx219_internal_ops;
> > > > +     imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > > +     imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > > > +
> > > > +     /* Initialize source pad */
> > > > +     imx219->pad.flags = MEDIA_PAD_FL_SOURCE;
> > > > +
> > > > +     ret = media_entity_pads_init(&imx219->sd.entity, 1, &imx219->pad);
> > > > +     if (ret) {
> > > > +             dev_err(dev, "failed to init entity pads: %d\n", ret);
> > > > +             goto error_handler_free;
> > > > +     }
> > > > +
> > > > +     ret = v4l2_async_register_subdev_sensor_common(&imx219->sd);
> > > > +     if (ret < 0) {
> > > > +             dev_err(dev, "failed to register sensor sub-device: %d\n", ret);
> > > > +             goto error_media_entity;
> > > > +     }
> > > > +
> > > > +     /* Enable runtime PM and turn off the device */
> > > > +     pm_runtime_set_active(dev);
> > > > +     pm_runtime_enable(dev);
> > > > +     pm_runtime_idle(dev);
> > > > +
> > > > +     return 0;
> > > > +
> > > > +error_media_entity:
> > > > +     media_entity_cleanup(&imx219->sd.entity);
> > > > +
> > > > +error_handler_free:
> > > > +     imx219_free_controls(imx219);
> > > > +
> > > > +error_power_off:
> > > > +     imx219_power_off(dev);
> > > > +
> > > > +     return ret;
> > > > +}

-- 
Regards,

Laurent Pinchart

