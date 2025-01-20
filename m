Return-Path: <linux-media+bounces-24942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEF6A16B21
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 11:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C32653A6716
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 10:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE34C1B87F5;
	Mon, 20 Jan 2025 10:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ms0j49jh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633121B6CFD;
	Mon, 20 Jan 2025 10:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737370791; cv=none; b=AxJpMZ+kVj/Ph0WJIB5NvFy5M1B1fll7SUkopxp7CTbXFEHmPsW3rmT490IjHqreoNDKUqjzTfLGQsb98ab5pnxniefZEVR/wpSczW9F+YTTwdzqOWueXbaC9GdgYLtwarFUJqE2hyT8LExda6uxuLhk6HNyR14/bvfC0pFXsjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737370791; c=relaxed/simple;
	bh=czZOrmuFCfN+t9SlxQpEPbuxvYuKqXh2/X4yUYN7MIk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdfwzsfPunHRrKb8oWslcMRcWGkNvdNNDqw3UdY8Vt52bTsOrQukkFSHGZtTFySdj1A1BZntYSM3MEo9E//PUU0ys9TOidsaY4ZjoeeD5WFkyTGF44A/+xPLcCvxf0Wbrlg+gpcCpftNycndnz/ghCNsrjY8Za4xLZKdtngwM80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ms0j49jh; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737370790; x=1768906790;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=czZOrmuFCfN+t9SlxQpEPbuxvYuKqXh2/X4yUYN7MIk=;
  b=ms0j49jhyJ3uMQqIhe6KlqwDif7p4AJGaqehA1SiBe0vSBL0vYiQ4dFa
   ZiR3ZiRjZ+fxSmoZnmn9AWgl+5bbH4Q811Ic6jxeRcLTL0J/hxkIPRfL3
   w+p0jLzakKsoM/2Ltdjl3aIK6K7WJex1m0Xow+51zEyUtXdgLqapnQZQg
   jN10An1FNA1M1uBqUdhTUwpaLMrwbr9Fa46jQE+QFEAXGL3j6iny3K6YX
   1pBW6242klZldu7fvzW7A6tWd7KiPArhl2K5yf1MVsDmewJFP1ECkMyBH
   TGUqqkApF+cdSQLeDjBDATDGy420gTUAUkceYYtam1bsmXbdQ31GRu5xm
   Q==;
X-CSE-ConnectionGUID: luYI4LvVRA+xambZqOymOQ==
X-CSE-MsgGUID: LvALCHcrQLi15d5uiZHsdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37444185"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="37444185"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 02:59:49 -0800
X-CSE-ConnectionGUID: ltWkhw8wTG+PPy7GAEkTUw==
X-CSE-MsgGUID: bnuFSv+LTjipjBu0K6wJXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106919588"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 02:59:47 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8F69711F94F;
	Mon, 20 Jan 2025 12:59:44 +0200 (EET)
Date: Mon, 20 Jan 2025 10:59:44 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: robh+dt@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, peter.griffin@linaro.org,
	dave.stevenson@raspberrypi.com, ezequiel@collabora.com
Subject: Re: [PATCH v3 2/2] media: i2c: Add driver for Sony IMX219 sensor
Message-ID: <Z44soIWngnmCjoe6@kekkonen.localdomain>
References: <20200110200915.22575-1-andrey.konovalov@linaro.org>
 <20200110200915.22575-3-andrey.konovalov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200110200915.22575-3-andrey.konovalov@linaro.org>

Hi Dave,

On Fri, Jan 10, 2020 at 11:09:15PM +0300, Andrey Konovalov wrote:
> +/* Power/clock management functions */
> +static int imx219_power_on(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx219 *imx219 = to_imx219(sd);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(IMX219_NUM_SUPPLIES,
> +				    imx219->supplies);
> +	if (ret) {
> +		dev_err(&client->dev, "%s: failed to enable regulators\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(imx219->xclk);
> +	if (ret) {
> +		dev_err(&client->dev, "%s: failed to enable clock\n",
> +			__func__);
> +		goto reg_off;
> +	}
> +
> +	gpiod_set_value_cansleep(imx219->reset_gpio, 1);
> +	msleep(IMX219_XCLR_DELAY_MS);
> +
> +	return 0;
> +reg_off:
> +	regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
> +	return ret;
> +}
> +
> +static int imx219_power_off(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx219 *imx219 = to_imx219(sd);
> +
> +	gpiod_set_value_cansleep(imx219->reset_gpio, 0);

The polarity of the reset GPIO appears to be wrong above. Given it works
somewhere (arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso), the
existing DTS files have it wrong, too. The bindings still appear to
document it correctly.

Laurent confirmed xcrl isn't controllable in the RPi imx219 camera module.

How about fixing this? Currently correctly written DTBs including imx219
won't work.

I noticed this while fixing the power sequences in this and a few other
drivers.

> +	regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
> +	clk_disable_unprepare(imx219->xclk);
> +
> +	return 0;
> +}

...

> +static int imx219_probe(struct i2c_client *client,
> +			const struct i2c_device_id *id)
> +{
> +	struct device *dev = &client->dev;
> +	struct fwnode_handle *endpoint;
> +	struct imx219 *imx219;
> +	int ret;
> +
> +	imx219 = devm_kzalloc(&client->dev, sizeof(*imx219), GFP_KERNEL);
> +	if (!imx219)
> +		return -ENOMEM;
> +
> +	imx219->dev = dev;
> +
> +	v4l2_i2c_subdev_init(&imx219->sd, client, &imx219_subdev_ops);
> +
> +	/* Get CSI2 bus config */
> +	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
> +						  NULL);
> +	if (!endpoint) {
> +		dev_err(dev, "endpoint node not found\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = v4l2_fwnode_endpoint_parse(endpoint, &imx219->ep);
> +	fwnode_handle_put(endpoint);
> +	if (ret) {
> +		dev_err(dev, "could not parse endpoint\n");
> +		return ret;
> +	}
> +
> +	/* Check the number of MIPI CSI2 data lanes */
> +	if (imx219->ep.bus_type != V4L2_MBUS_CSI2_DPHY ||
> +	    imx219->ep.bus.mipi_csi2.num_data_lanes != 2) {
> +		dev_err(dev, "only 2 data lanes are currently supported\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Get system clock (xclk) */
> +	imx219->xclk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(imx219->xclk)) {
> +		dev_err(dev, "failed to get xclk\n");
> +		return PTR_ERR(imx219->xclk);
> +	}
> +
> +	imx219->xclk_freq = clk_get_rate(imx219->xclk);
> +	if (imx219->xclk_freq != IMX219_XCLK_FREQ) {
> +		dev_err(dev, "xclk frequency not supported: %d Hz\n",
> +			imx219->xclk_freq);
> +		return -EINVAL;
> +	}
> +
> +	ret = imx219_get_regulators(imx219);
> +	if (ret) {
> +		dev_err(dev, "failed to get regulators\n");
> +		return ret;
> +	}
> +
> +	/* Request optional enable pin */
> +	imx219->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						      GPIOD_OUT_HIGH);
> +
> +	/*
> +	 * The sensor must be powered for imx219_identify_module()
> +	 * to be able to read the CHIP_ID register
> +	 */
> +	ret = imx219_power_on(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = imx219_identify_module(imx219);
> +	if (ret)
> +		goto error_power_off;
> +
> +	/* Set default mode to max resolution */
> +	imx219->mode = &supported_modes[0];
> +
> +	ret = imx219_init_controls(imx219);
> +	if (ret)
> +		goto error_power_off;
> +
> +	/* Initialize subdev */
> +	imx219->sd.internal_ops = &imx219_internal_ops;
> +	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +
> +	/* Initialize source pad */
> +	imx219->pad.flags = MEDIA_PAD_FL_SOURCE;
> +
> +	ret = media_entity_pads_init(&imx219->sd.entity, 1, &imx219->pad);
> +	if (ret) {
> +		dev_err(dev, "failed to init entity pads: %d\n", ret);
> +		goto error_handler_free;
> +	}
> +
> +	ret = v4l2_async_register_subdev_sensor_common(&imx219->sd);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to register sensor sub-device: %d\n", ret);
> +		goto error_media_entity;
> +	}
> +
> +	/* Enable runtime PM and turn off the device */
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);
> +
> +	return 0;
> +
> +error_media_entity:
> +	media_entity_cleanup(&imx219->sd.entity);
> +
> +error_handler_free:
> +	imx219_free_controls(imx219);
> +
> +error_power_off:
> +	imx219_power_off(dev);
> +
> +	return ret;
> +}

-- 
Kind regards,

Sakari Ailus

