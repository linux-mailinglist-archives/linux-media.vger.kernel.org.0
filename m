Return-Path: <linux-media+bounces-24975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF249A16D73
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 14:36:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AD19168755
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 13:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153C61E1A3E;
	Mon, 20 Jan 2025 13:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iYsBb2ur"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF4D1E0DD1;
	Mon, 20 Jan 2025 13:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737380157; cv=none; b=rRVB3EyREAV+J6Kipo425CqIXqSKsADUYpORGr/tWg+LtMSbEQuqueBYF3pT2FpHn+xMYuaJm1Z1ZTq2BAecYqjhHNGHvU4B7yRNtMKop/2/fzYArkIA2nuy5G3hQM/aypwDpscqwHk9va1l2TZXeJIrSrMBH8LZa+fHgqgUQpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737380157; c=relaxed/simple;
	bh=7ZdI6t4IK7dfNc6DKpH64lVUQY//O/FFxIeW6PD5Fa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5Uok4P57j47Wraqy95/b41hthlpl3UQtuC+FjIDyP8fX/YSUfnh4M+Clv1E7K8gXk5XjIw+YnMJfzmqYXNHvXnStKPpmLtPurLB5QgZ6F9/bll8hIBIHafINcVR9eokVC9FSukNA1Z/weYHQ03waNVM20+SxCapVLhbcWb3PPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iYsBb2ur; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737380155; x=1768916155;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7ZdI6t4IK7dfNc6DKpH64lVUQY//O/FFxIeW6PD5Fa0=;
  b=iYsBb2urDTfWvKMoDbcjn+UPz3n1uFsaWFaYSTPp1wqpS9mXEYzjaexh
   KUH3EXOZh1n0x9DFNiRwreS9P+EFxxVkN6cAy5k8OMnCYhg5GiNeh2HTO
   OTwVxkcgw+KItRh1PBptlQfaiDyMou0heoJfVYtBDX4P9vjmGBZyHphmS
   OrWuGgOpX9CQGZ5PCWDfpuiDCG08KSTMTWWU90HXF0Hyk0w4yrkicrQuZ
   OR2adGeVUUg2JZt67zLMtJpXZG4xtaLFllzRYoEFsbwXOwKp6APXSndT/
   p2DnUJLt7WGpGEAIDCC7NMAf8hbP/ah301edixdlFCsL0ZfdFH3OvWEWY
   w==;
X-CSE-ConnectionGUID: 9/st6586TJSpjswxj3Xo2Q==
X-CSE-MsgGUID: V7ysOx8+QPaYMbAVk1uNvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="55179249"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="55179249"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 05:35:55 -0800
X-CSE-ConnectionGUID: wSdVuZc/TOSUZSrwMiFrBg==
X-CSE-MsgGUID: s/hN1pVsRr6ayyTg/dYObg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143797479"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 05:35:53 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6485111F94F;
	Mon, 20 Jan 2025 15:35:50 +0200 (EET)
Date: Mon, 20 Jan 2025 13:35:50 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: robh+dt@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, peter.griffin@linaro.org,
	ezequiel@collabora.com, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v3 2/2] media: i2c: Add driver for Sony IMX219 sensor
Message-ID: <Z45RNl5bV-MruxNZ@kekkonen.localdomain>
References: <20200110200915.22575-1-andrey.konovalov@linaro.org>
 <20200110200915.22575-3-andrey.konovalov@linaro.org>
 <Z44soIWngnmCjoe6@kekkonen.localdomain>
 <CAPY8ntBXwUmjSgb2z65mUZ1GSEUT8oczQMN+dewaevz9HemYag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntBXwUmjSgb2z65mUZ1GSEUT8oczQMN+dewaevz9HemYag@mail.gmail.com>

Hi Dave,

On Mon, Jan 20, 2025 at 12:28:04PM +0000, Dave Stevenson wrote:
> Hi Sakari
> 
> On Mon, 20 Jan 2025 at 10:59, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Dave,
> >
> > On Fri, Jan 10, 2020 at 11:09:15PM +0300, Andrey Konovalov wrote:
> > > +/* Power/clock management functions */
> > > +static int imx219_power_on(struct device *dev)
> > > +{
> > > +     struct i2c_client *client = to_i2c_client(dev);
> > > +     struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > +     struct imx219 *imx219 = to_imx219(sd);
> > > +     int ret;
> > > +
> > > +     ret = regulator_bulk_enable(IMX219_NUM_SUPPLIES,
> > > +                                 imx219->supplies);
> > > +     if (ret) {
> > > +             dev_err(&client->dev, "%s: failed to enable regulators\n",
> > > +                     __func__);
> > > +             return ret;
> > > +     }
> > > +
> > > +     ret = clk_prepare_enable(imx219->xclk);
> > > +     if (ret) {
> > > +             dev_err(&client->dev, "%s: failed to enable clock\n",
> > > +                     __func__);
> > > +             goto reg_off;
> > > +     }
> > > +
> > > +     gpiod_set_value_cansleep(imx219->reset_gpio, 1);
> > > +     msleep(IMX219_XCLR_DELAY_MS);
> > > +
> > > +     return 0;
> > > +reg_off:
> > > +     regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
> > > +     return ret;
> > > +}
> > > +
> > > +static int imx219_power_off(struct device *dev)
> > > +{
> > > +     struct i2c_client *client = to_i2c_client(dev);
> > > +     struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > +     struct imx219 *imx219 = to_imx219(sd);
> > > +
> > > +     gpiod_set_value_cansleep(imx219->reset_gpio, 0);
> >
> > The polarity of the reset GPIO appears to be wrong above. Given it works
> > somewhere (arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso), the
> > existing DTS files have it wrong, too. The bindings still appear to
> > document it correctly.
> 
> Why do you say it is wrong?
> I don't recall why this got called reset-gpio - the signal on the
> sensor is XCLR, and that is documented in the binding.
> The datasheet says low is standby and high is active, which matches
> what the driver does.

Documentation/driver-api/gpio/consumer.rst:

	As a consumer should not have to care about the physical line
	level, all of the gpiod_set_value_xxx() or
	gpiod_set_array_value_xxx() functions operate with the *logical*
	value. With this they take the active low property into account.
	This means that they check whether the GPIO is configured to be
	active low, and if so, they manipulate the passed value before the
	physical line level is driven.

In other words, if the driver calls gpiod_set_value_cansleep(, 0), it
enables reset signal on the device, bringing the device to hard reset. This
is the opposite of what the driver does in its resume callback.

So in order to function, the DT must have wrong polarity as well.
Similarly, if someone writes a correct DT for a board connecting the reset
GPIO, the imx219 driver simply won't work.

Looking at the arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso overlay,
it is for the RPi IMX219 module that does not connect the reset GPIO at
all. In other words, there doesn't seem to be a upstream user of the reset
GPIO in IMX219.

> 
> > Laurent confirmed xcrl isn't controllable in the RPi imx219 camera module.
> >
> > How about fixing this? Currently correctly written DTBs including imx219
> > won't work.
> 
> Seeing as the DTB is ABI, the only improvement I can see is to rename
> "imx219->reset_gpio" to "imx219->xclr_gpio".
> What else would you be proposing?

If there's a concern this could break existing DTs, the driver could try
inverting the polarity of the GPIO if the sensor isn't immediately
accessible.

I wonder what others think.

Cc Laurent.

> 
>   Dave
> 
> > I noticed this while fixing the power sequences in this and a few other
> > drivers.
> >
> > > +     regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
> > > +     clk_disable_unprepare(imx219->xclk);
> > > +
> > > +     return 0;
> > > +}
> >
> > ...
> >
> > > +static int imx219_probe(struct i2c_client *client,
> > > +                     const struct i2c_device_id *id)
> > > +{
> > > +     struct device *dev = &client->dev;
> > > +     struct fwnode_handle *endpoint;
> > > +     struct imx219 *imx219;
> > > +     int ret;
> > > +
> > > +     imx219 = devm_kzalloc(&client->dev, sizeof(*imx219), GFP_KERNEL);
> > > +     if (!imx219)
> > > +             return -ENOMEM;
> > > +
> > > +     imx219->dev = dev;
> > > +
> > > +     v4l2_i2c_subdev_init(&imx219->sd, client, &imx219_subdev_ops);
> > > +
> > > +     /* Get CSI2 bus config */
> > > +     endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
> > > +                                               NULL);
> > > +     if (!endpoint) {
> > > +             dev_err(dev, "endpoint node not found\n");
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     ret = v4l2_fwnode_endpoint_parse(endpoint, &imx219->ep);
> > > +     fwnode_handle_put(endpoint);
> > > +     if (ret) {
> > > +             dev_err(dev, "could not parse endpoint\n");
> > > +             return ret;
> > > +     }
> > > +
> > > +     /* Check the number of MIPI CSI2 data lanes */
> > > +     if (imx219->ep.bus_type != V4L2_MBUS_CSI2_DPHY ||
> > > +         imx219->ep.bus.mipi_csi2.num_data_lanes != 2) {
> > > +             dev_err(dev, "only 2 data lanes are currently supported\n");
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     /* Get system clock (xclk) */
> > > +     imx219->xclk = devm_clk_get(dev, NULL);
> > > +     if (IS_ERR(imx219->xclk)) {
> > > +             dev_err(dev, "failed to get xclk\n");
> > > +             return PTR_ERR(imx219->xclk);
> > > +     }
> > > +
> > > +     imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > > +     if (imx219->xclk_freq != IMX219_XCLK_FREQ) {
> > > +             dev_err(dev, "xclk frequency not supported: %d Hz\n",
> > > +                     imx219->xclk_freq);
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     ret = imx219_get_regulators(imx219);
> > > +     if (ret) {
> > > +             dev_err(dev, "failed to get regulators\n");
> > > +             return ret;
> > > +     }
> > > +
> > > +     /* Request optional enable pin */
> > > +     imx219->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> > > +                                                   GPIOD_OUT_HIGH);
> > > +
> > > +     /*
> > > +      * The sensor must be powered for imx219_identify_module()
> > > +      * to be able to read the CHIP_ID register
> > > +      */
> > > +     ret = imx219_power_on(dev);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     ret = imx219_identify_module(imx219);
> > > +     if (ret)
> > > +             goto error_power_off;
> > > +
> > > +     /* Set default mode to max resolution */
> > > +     imx219->mode = &supported_modes[0];
> > > +
> > > +     ret = imx219_init_controls(imx219);
> > > +     if (ret)
> > > +             goto error_power_off;
> > > +
> > > +     /* Initialize subdev */
> > > +     imx219->sd.internal_ops = &imx219_internal_ops;
> > > +     imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > +     imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > > +
> > > +     /* Initialize source pad */
> > > +     imx219->pad.flags = MEDIA_PAD_FL_SOURCE;
> > > +
> > > +     ret = media_entity_pads_init(&imx219->sd.entity, 1, &imx219->pad);
> > > +     if (ret) {
> > > +             dev_err(dev, "failed to init entity pads: %d\n", ret);
> > > +             goto error_handler_free;
> > > +     }
> > > +
> > > +     ret = v4l2_async_register_subdev_sensor_common(&imx219->sd);
> > > +     if (ret < 0) {
> > > +             dev_err(dev, "failed to register sensor sub-device: %d\n", ret);
> > > +             goto error_media_entity;
> > > +     }
> > > +
> > > +     /* Enable runtime PM and turn off the device */
> > > +     pm_runtime_set_active(dev);
> > > +     pm_runtime_enable(dev);
> > > +     pm_runtime_idle(dev);
> > > +
> > > +     return 0;
> > > +
> > > +error_media_entity:
> > > +     media_entity_cleanup(&imx219->sd.entity);
> > > +
> > > +error_handler_free:
> > > +     imx219_free_controls(imx219);
> > > +
> > > +error_power_off:
> > > +     imx219_power_off(dev);
> > > +
> > > +     return ret;
> > > +}
> >
> > --
> > Kind regards,
> >
> > Sakari Ailus

-- 
Kind regards,

Sakari Ailus

