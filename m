Return-Path: <linux-media+bounces-37881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C492BB07886
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 16:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1972E4E437C
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 14:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3889A2F5320;
	Wed, 16 Jul 2025 14:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iCa2Q3dJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F74A2F50B7;
	Wed, 16 Jul 2025 14:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752677184; cv=none; b=jBAKa5+Pzm3hGzw0F1BR1DI3oQjuh1Pa2zukIjpJjbRj6fYfPkLsjA/gvBjgLbPsVdwFb27pymPV9Hh+QBVUq/DVfHVOUo245uNSfwTW/LM3ksdKbQpFy4MY2BGVhA6Co+vg+mktqO+WwUB7M//GiHRgAhRQClegy3ztMFULm7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752677184; c=relaxed/simple;
	bh=EwQuVRRqhzSFkyoipJzJdDpUARFU3jeQp88V2KcXOH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGKhm3CMFqGQLuZ5fklPGjVcox+2eyrHlfBlDIQuZ7jQSr9zjhCksBHXKqm29nEA4gYbTWzHbXAuRZLnWW+aDZemw6dqQ2+HoDdYc+TeykZ6nNwJPA2q+2xX6fb8l6i0faARHkXKu0Ls9/iSHf7SuMxiyFUYJDx9Bh/cjQjImvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iCa2Q3dJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752677183; x=1784213183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EwQuVRRqhzSFkyoipJzJdDpUARFU3jeQp88V2KcXOH4=;
  b=iCa2Q3dJSleEwVwE8mKKe+rccg8rIT9HkRvpLllkdXhQurjNq1CufJCy
   StoWPNaentvsSkW+Q9pHgm6I8CTYgWzQ90pxiKcjrsVfcA10nvQBzI/9P
   yOTN8DoBzf5kTqy6i9XMkmC2hqFrxKXMb8GWqPDY9HgsUmrzhv8JNbZzw
   7NGMT2DFBqGqNrELsNhFfDwbHGTeUGtiC7IN72GEIboXl4jJpQZ4s+0VV
   prbB1p1ZpJ0R/AfxDOJuGJCYAW5/wMijjSAvKxDtu8jG2g7+oIkp6QyWa
   TeIjQrnwP/nUvPfjVrnZDF4IDl8y05y1RX305myb+nzqEA/BVhl2vq+qp
   A==;
X-CSE-ConnectionGUID: gFbO7haIQfO8ZfVngfLhzw==
X-CSE-MsgGUID: 8K+Y8CyYQ8+xVaC57GOtBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58694687"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="58694687"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 07:46:22 -0700
X-CSE-ConnectionGUID: JBFIvyIjR3CiO8xAoc+pfA==
X-CSE-MsgGUID: E8hpjauJQmu3Iz0MBHv2+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="161829674"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 07:46:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uc3Oe-0000000Fy0H-2ivG;
	Wed, 16 Jul 2025 17:46:12 +0300
Date: Wed, 16 Jul 2025 17:46:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
	krzk+dt@kernel.org,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hans de Goede <hansg@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] media: i2c: add ov2735 image sensor driver
Message-ID: <aHe7NFJz6aCUqZXL@smile.fi.intel.com>
References: <20250716134426.8348-1-hardevsinh.palaniya@siliconsignals.io>
 <20250716134426.8348-3-hardevsinh.palaniya@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716134426.8348-3-hardevsinh.palaniya@siliconsignals.io>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 16, 2025 at 07:14:17PM +0530, Hardevsinh Palaniya wrote:
> Add a v4l2 subdevice driver for the Omnivision OV2735 sensor.
> 
> The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an
> active array size of 1920 x 1080.
> 
> The following features are supported:
> - Manual exposure an gain control support
> - vblank/hblank control support
> - Test pattern support control
> - Supported resolution: 1920 x 1080 @ 30fps (SGRBG10)

...

> +static int ov2735_page_access(struct ov2735 *ov2735,
> +			      u32 reg, void *val, int *err, bool is_read)
> +{
> +	u8 page = (reg >> CCI_REG_PRIVATE_SHIFT) & 0xff;
> +	u32 addr = reg & ~CCI_REG_PRIVATE_MASK;
> +	int ret = 0;
> +
> +	if (err && *err)
> +		return *err;
> +
> +	mutex_lock(&ov2735->page_lock);
> +
> +	/* Perform page access before read/write */
> +	if (ov2735->current_page != page) {
> +		ret = cci_write(ov2735->cci, OV2735_REG_PAGE_SELECT, page, &ret);
> +		if (ret)
> +			goto err_mutex_unlock;
> +		ov2735->current_page = page;
> +	}
> +
> +	if (is_read)
> +		ret = cci_read(ov2735->cci, addr, (u64 *)val, err);
> +	else
> +		ret = cci_write(ov2735->cci, addr, *(u64 *)val, err);
> +
> +err_mutex_unlock:

> +	if (ret && err)

Why do you need to check for ret != 0?

> +		*err = ret;
> +
> +	mutex_unlock(&ov2735->page_lock);
> +	return ret;
> +}

...

> +{
> +	struct ov2735_pll_parameters *pll_parameters;
> +	u8 pll_ctrl;
> +	u8 pll_outdiv;
> +	int ret = 0;
> +
> +	pll_parameters = &pll_configs[ov2735->link_freq_index];
> +
> +	/* BIT[7]: pll_clk_sel, BIT[6:2]: pll_nc, BIT[1:0]: pll_mc */
> +	pll_ctrl = ((pll_parameters->pll_nc << 2) |
> +		    (pll_parameters->pll_mc)) & OV2735_REG_PLL_ENABLE;

Not sure why here are the parentheses. Perhaps you wanted to show the 0 shift?

		    (pll_parameters->pll_mc << 0)) & OV2735_REG_PLL_ENABLE;

> +	pll_outdiv = pll_parameters->pll_outdiv;
> +
> +	ov2735_write(ov2735, OV2735_REG_PLL_CTRL, pll_ctrl, &ret);
> +	ov2735_write(ov2735, OV2735_REG_PLL_OUTDIV, pll_outdiv, &ret);
> +
> +	return ret;
> +}

...

> +static int ov2735_get_selection(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *sd_state,
> +				struct v4l2_subdev_selection *sel)
> +{
> +	switch (sel->target) {

> +	case V4L2_SEL_TGT_CROP: {
> +		sel->r = *v4l2_subdev_state_get_crop(sd_state, 0);
> +		return 0;
> +	}

Why {} ?

> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> +		sel->r = ov2735_native_area;
> +		return 0;

> +

This blank line is inconsistent with the rest.

> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +		sel->r = ov2735_active_area;
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}

...

> +static int ov2735_init_state(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_subdev_format fmt = {
> +		.which = V4L2_SUBDEV_FORMAT_TRY,

> +		.pad = 0,

It's zeroed by default.

> +		.format = {
> +			.code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +			.width = supported_modes[0].width,
> +			.height = supported_modes[0].height,
> +		},
> +	};

> +	ov2735_set_pad_format(sd, state, &fmt);
> +
> +	return 0;
> +}

...

> +static int ov2735_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov2735 *ov2735 = to_ov2735(sd);
> +	int ret;
> +
> +	gpiod_set_value_cansleep(ov2735->enable_gpio, 0);
> +	/* Ensure device is inactive (PWDN high) before enabling power rails.
> +	 * As per datasheet, the PWDN pin (named 'enable_gpio' here) should be
> +	 * pulled low only after all power rails are stable.
> +	 */

/*
 * Use correct multi-line style
 * for the comments. Here is an
 * example.
 *.

> +	fsleep(3000);

Here and everywhere else consider using

	fsleep(3 * USEC_PER_MSEC);

which will hint the user what is the units of the value
(i.e. 3ms in this case).

> +	ret = regulator_bulk_enable(ARRAY_SIZE(ov2735_supply_name),
> +				    ov2735->supplies);
> +	if (ret) {
> +		dev_err(ov2735->dev, "failed to enable regulators\n");
> +		return ret;
> +	}
> +
> +	gpiod_set_value_cansleep(ov2735->enable_gpio, 1);
> +	/* T4: Delay from PWDN pulling low to RSTB pulling high. */
> +	fsleep(4000);
> +
> +	ret = clk_prepare_enable(ov2735->xclk);
> +	if (ret) {
> +		dev_err(ov2735->dev, "failed to enable clock\n");
> +		goto err_regulator_off;
> +	}
> +
> +	gpiod_set_value_cansleep(ov2735->reset_gpio, 0);
> +	/* T5: Delay from RSTB pulling high to first I2C command. */
> +	fsleep(5000);
> +
> +	return 0;
> +
> +err_regulator_off:
> +	regulator_bulk_disable(ARRAY_SIZE(ov2735_supply_name), ov2735->supplies);
> +	return ret;
> +}

...

> +static int ov2735_parse_endpoint(struct ov2735 *ov2735)
> +{
> +	struct fwnode_handle *fwnode;
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> +	};
> +	struct fwnode_handle *ep;
> +	unsigned long link_freq_bitmap;
> +	int ret;

> +	fwnode = dev_fwnode(ov2735->dev);

This one can be combined with the definition:

	struct fwnode_handle *fwnode;= dev_fwnode(ov2735->dev);

> +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (!ep)
> +		return dev_err_probe(ov2735->dev,
> +				     -ENXIO, "Failed to get next endpoint\n");

There is a room for the return code on the previous line.

> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return ret;
> +
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 2) {
> +		ret = dev_err_probe(ov2735->dev,
> +				    -EINVAL, "only 2 data lanes are supported\n");

Ditto.

> +		goto error_out;
> +	}
> +
> +	ret = v4l2_link_freq_to_bitmap(ov2735->dev, bus_cfg.link_frequencies,
> +				       bus_cfg.nr_of_link_frequencies,
> +				       link_freq_menu_items,
> +				       ARRAY_SIZE(link_freq_menu_items),
> +				       &link_freq_bitmap);
> +	if (ret) {
> +		ret = dev_err_probe(ov2735->dev,
> +				    -EINVAL, "only 420MHz frequency is available\n");

Ditto.

> +		goto error_out;
> +	}
> +
> +	ov2735->link_freq_index = __ffs(link_freq_bitmap);
> +
> +error_out:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +};

...

> +static int ov2735_probe(struct i2c_client *client)
> +{
> +	struct ov2735 *ov2735;
> +	unsigned int xclk_freq;
> +	int ret;
> +
> +	ov2735 = devm_kzalloc(&client->dev, sizeof(*ov2735), GFP_KERNEL);
> +	if (!ov2735)
> +		return -ENOMEM;

> +	ov2735->client = client;

I have found no used of this. Seems a dead field in the structure.

> +	ov2735->dev = &client->dev;
> +
> +	v4l2_i2c_subdev_init(&ov2735->sd, client, &ov2735_subdev_ops);
> +	ov2735->sd.internal_ops = &ov2735_internal_ops;
> +
> +	ov2735->cci = devm_cci_regmap_init_i2c(client, 8);
> +	if (IS_ERR(ov2735->cci))
> +		return dev_err_probe(ov2735->dev, PTR_ERR(ov2735->cci),
> +				     "failed to initialize CCI\n");
> +
> +	/* Set Current page to 0 */
> +	ov2735->current_page = 0;
> +
> +	ret = devm_mutex_init(ov2735->dev, &ov2735->page_lock);

> +		if (ret)
> +			return dev_err_probe(ov2735->dev, ret,
> +					     "Failed to initialize lock\n");

Wrong indentation.

> +	/* Get system clock (xvclk) */
> +	ov2735->xclk = devm_v4l2_sensor_clk_get(ov2735->dev, NULL);
> +	if (IS_ERR(ov2735->xclk))
> +		return dev_err_probe(ov2735->dev, PTR_ERR(ov2735->xclk),
> +				     "failed to get xclk\n");
> +
> +	xclk_freq = clk_get_rate(ov2735->xclk);
> +	if (xclk_freq != OV2735_XCLK_FREQ)
> +		return dev_err_probe(ov2735->dev, -EINVAL,
> +				     "xclk frequency not supported: %d Hz\n",

Please, revisit all printf() specifiers. Are you sure that xclk_freq can ever
be negative?

> +				     xclk_freq);
> +
> +	ret = ov2735_get_regulators(ov2735);
> +	if (ret)
> +		return dev_err_probe(ov2735->dev, ret, "failed to get regulators\n");
> +
> +	ret = ov2735_parse_endpoint(ov2735);
> +	if (ret)
> +		return dev_err_probe(ov2735->dev, ret,
> +				     "failed to parse endpoint configuration\n");
> +
> +	ov2735->reset_gpio = devm_gpiod_get_optional(ov2735->dev,
> +						     "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ov2735->reset_gpio))
> +		return dev_err_probe(ov2735->dev, PTR_ERR(ov2735->reset_gpio),
> +				     "failed to get reset GPIO\n");
> +
> +	ov2735->enable_gpio = devm_gpiod_get_optional(ov2735->dev,
> +						      "enable", GPIOD_OUT_LOW);
> +	if (IS_ERR(ov2735->enable_gpio))
> +		return dev_err_probe(ov2735->dev, PTR_ERR(ov2735->enable_gpio),
> +				     "failed to get enable GPIO\n");
> +
> +	ret = ov2735_power_on(ov2735->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = ov2735_identify_module(ov2735);
> +	if (ret)
> +		goto error_power_off;
> +
> +	ret = ov2735_init_controls(ov2735);
> +	if (ret)
> +		goto error_power_off;
> +
> +	/* Initialize subdev */
> +	ov2735->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	ov2735->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	ov2735->pad.flags = MEDIA_PAD_FL_SOURCE;
> +
> +	ret = media_entity_pads_init(&ov2735->sd.entity, 1, &ov2735->pad);
> +	if (ret) {
> +		dev_err_probe(ov2735->dev, ret, "failed to init entity pads\n");
> +		goto error_handler_free;
> +	}
> +
> +	ov2735->sd.state_lock = ov2735->handler.lock;
> +	ret = v4l2_subdev_init_finalize(&ov2735->sd);
> +	if (ret) {
> +		dev_err_probe(ov2735->dev, ret, "subdev init error\n");
> +		goto error_media_entity;
> +	}
> +
> +	devm_pm_runtime_set_active_enabled(ov2735->dev);
> +	devm_pm_runtime_get_noresume(ov2735->dev);
> +
> +	ret = v4l2_async_register_subdev_sensor(&ov2735->sd);
> +	if (ret) {
> +		dev_err_probe(ov2735->dev, ret,
> +			      "failed to register ov2735 sub-device\n");
> +		goto error_subdev_cleanup;
> +	}
> +
> +	return 0;
> +
> +error_subdev_cleanup:
> +	v4l2_subdev_cleanup(&ov2735->sd);
> +
> +error_media_entity:
> +	media_entity_cleanup(&ov2735->sd.entity);
> +
> +error_handler_free:
> +	v4l2_ctrl_handler_free(ov2735->sd.ctrl_handler);
> +
> +error_power_off:
> +	ov2735_power_off(ov2735->dev);
> +
> +	return ret;
> +}

...

> +static void ov2735_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov2735 *ov2735 = to_ov2735(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(&ov2735->sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(ov2735->sd.ctrl_handler);
> +}

You can even wrap all of them to be managed resources, but since the order
looks okay to me it's up to you.

-- 
With Best Regards,
Andy Shevchenko



