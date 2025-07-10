Return-Path: <linux-media+bounces-37305-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30411B00444
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 15:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9251C3A70AC
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 13:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A819F271471;
	Thu, 10 Jul 2025 13:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnTbEQhB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E62270EA9;
	Thu, 10 Jul 2025 13:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752155202; cv=none; b=vEOzYeoNK18kGAXm8Gh1tD1zWDrWDda1S5tIwVAiCqQ32vT0sBaY50fPNc6yT2wf2mGcycWj475Dw1qMTQW6o+eChUCJSqON/VKkMVKLXjA5zs/v5Fg59ASQfuJTbpAkpouUDZC4AzTv7GdYKsM14Y/rn1AgIBLKBJ9KBkDRSXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752155202; c=relaxed/simple;
	bh=OVtgMPc0CQoRlk43yzhtRg7aNj1rLH3NKRXpvLy18Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QhRR+/rWW5lOdx+fCtkAvm7EoPr5Fi027KSGW/xrX6Ja1TDHCc7izkB1tpRLOrxjlyg5fFVILDMPm5Ri+v321GSZE+b8qNAUA6KJ1vVNNF20FTho0qTR1lBPKoRgysKYuI0fz3G2+e6EyLpvU7sTKpg8mdWP8eVE3ZnMyC3BdmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnTbEQhB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752155200; x=1783691200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OVtgMPc0CQoRlk43yzhtRg7aNj1rLH3NKRXpvLy18Yc=;
  b=SnTbEQhBaDs2xUOlkRPJGTuIakKmqVVgtN88kTk3JYuvrFXjnEjYLFgz
   AeQZuC+dP4uehqgjGSCXxXWvi4jXTByrhXzQDI8sFAAQpWlKqfa9+JvX6
   UnEqQ4Y4miqnJXH/2VVjsaXQCw0neSpUb85G4QMNM1uHvkXRULNN5Jmkj
   raqXMxV9FIhtveuLV1EG065MJqKnaZMbGHqJL4kmfvCCp4twFPGaayrry
   hDt/l27urXgdOHNAGK0I9GUDIjICn+y2IWwF1JODakhqQXVEYnheXAJB7
   mJl4HzVpfU3I4Y1Is+MF/dApbGZjV5C6unQ3b7J8A6eyKmDKGfOJcl6n5
   w==;
X-CSE-ConnectionGUID: mU2c4KDwQoeKC257gJHmbg==
X-CSE-MsgGUID: 7yqrDgCnSMmHrGJQTuWTsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54367994"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="54367994"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 06:46:39 -0700
X-CSE-ConnectionGUID: BrLGrabfRO2Po3XitXTxBQ==
X-CSE-MsgGUID: mFK0NA3SRIOCqjzXAonquw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="160415307"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 06:46:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uZrbY-0000000EDS5-06P6;
	Thu, 10 Jul 2025 16:46:28 +0300
Date: Thu, 10 Jul 2025 16:46:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, krzk+dt@kernel.org,
	kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
	pratap.nirujogi@amd.com, laurent.pinchart@ideasonboard.com,
	tarang.raval@siliconsignals.io,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Matthias Fend <matthias.fend@emfend.at>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Hans de Goede <hansg@kernel.org>, Hao Yao <hao.yao@intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: i2c: add ov2735 image sensor driver
Message-ID: <aG_EM2SaL1dkueKW@smile.fi.intel.com>
References: <20250710131107.69017-1-hardevsinh.palaniya@siliconsignals.io>
 <20250710131107.69017-3-hardevsinh.palaniya@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710131107.69017-3-hardevsinh.palaniya@siliconsignals.io>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 10, 2025 at 06:40:59PM +0530, Hardevsinh Palaniya wrote:
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

> +static int ov2735_cci_access(struct ov2735 *ov2735,
> +			     u32 reg, void *val, int *err, bool is_read)
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
> +		cci_read(ov2735->cci, addr, (u64 *)val, &ret);
> +	else
> +		cci_write(ov2735->cci, addr, *(u64 *)val, &ret);
> +
> +	if (!ret && err)

ret here is never non-0. I believe the check is unneeded and this should be
inside the below label. Otherwise, what's the point?

> +		*err = ret;
> +
> +err_mutex_unlock:
> +	mutex_unlock(&ov2735->page_lock);
> +	return ret;
> +}

Have you researched on how hard is to implement a page access framework as
being suggested in previous review?

...

> +static int ov2735_enable_test_pattern(struct ov2735 *ov2735, u32 pattern)
> +{
> +	int ret = 0;
> +	u64 val;
> +
> +	ov2735_cci_read(ov2735, OV2735_REG_TEST_PATTERN, &val, &ret);

In this case is better to have the NULL form with no assignment done.
Use a common sense.

> +	if (ret)
> +		return ret;
> +
> +	switch (pattern) {
> +	case 0:
> +		val &= ~OV2735_TEST_PATTERN_ENABLE;
> +		break;
> +	case 1:
> +		val |= OV2735_TEST_PATTERN_ENABLE;
> +		break;
> +	}
> +
> +	return ov2735_cci_write(ov2735, OV2735_REG_TEST_PATTERN, val, NULL);
> +}

...

> +static int ov2735_enable_streams(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state, u32 pad,
> +				 u64 streams_mask)
> +{
> +	struct ov2735 *ov2735 = to_ov2735(sd);
> +	const struct ov2735_mode *mode;
> +	const struct ov2735_reglist *reg_list;
> +	const struct v4l2_mbus_framefmt *fmt;
> +	int ret;
> +
> +	fmt = v4l2_subdev_state_get_format(state, 0);
> +	mode = v4l2_find_nearest_size(supported_modes,
> +				      ARRAY_SIZE(supported_modes),
> +				      width, height,
> +				      fmt->width, fmt->height);
> +
> +	ret = pm_runtime_resume_and_get(ov2735->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	reg_list = &mode->reg_list;

> +	ov2735_cci_multi_reg_write(ov2735, reg_list->regvals, reg_list->num_regs, &ret);

NULL-variant is better here. Revisit all these again, please.

> +	if (ret) {
> +		dev_err(ov2735->dev, "%s failed to send mfg header\n", __func__);
> +		goto err_rpm_put;
> +	}
> +
> +	/* Apply customized values from user */
> +	ret = __v4l2_ctrl_handler_setup(ov2735->sd.ctrl_handler);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	/* set stream on register */
> +	ov2735_cci_write(ov2735, OV2735_REG_STREAM_CTRL, OV2735_STREAM_ON, &ret);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	return 0;
> +
> +err_rpm_put:
> +	pm_runtime_put(ov2735->dev);
> +	return ret;
> +}

...

> +static int ov2735_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov2735 *ov2735 = to_ov2735(sd);
> +	unsigned long delay_us;
> +	int ret;
> +
> +	gpiod_set_value_cansleep(ov2735->enable_gpio, 0);
> +	fsleep(3000);

Can you add a comment with a datasheet reference to explain the value used
here?

> +	ret = regulator_bulk_enable(ARRAY_SIZE(ov2735_supply_name),
> +				    ov2735->supplies);
> +	if (ret) {
> +		dev_err(ov2735->dev, "failed to enable regulators\n");
> +		return ret;
> +	}
> +
> +	gpiod_set_value_cansleep(ov2735->enable_gpio, 1);
> +	fsleep(3000);

Ditto.

> +	gpiod_set_value_cansleep(ov2735->reset_gpio, 0);
> +	fsleep(3000);

Ditto.

> +	ret = clk_prepare_enable(ov2735->xclk);
> +	if (ret) {
> +		dev_err(ov2735->dev, "failed to enable clock\n");
> +		goto err_regulator_off;
> +	}
> +
> +	/* 8192 cycles prior to first SCCB transaction */
> +	delay_us = DIV_ROUND_UP(8192, OV2735_XCLK_FREQ / 1000 / 1000);

Shouldn't these / 1000 / 1000 be simply / HZ_PER_MHZ?
Or if you want to keep it precise to the physics, use MEGA from units.h.

> +	fsleep(delay_us);
> +
> +	return 0;
> +
> +err_regulator_off:
> +	regulator_bulk_disable(ARRAY_SIZE(ov2735_supply_name), ov2735->supplies);
> +	return ret;
> +}

...

> +static int ov2735_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov2735 *ov2735 = to_ov2735(sd);
> +
> +	gpiod_set_value_cansleep(ov2735->enable_gpio, 1);

Power off enables the chip?! Perhaps you missed polarity in DT?

> +	clk_disable_unprepare(ov2735->xclk);
> +	gpiod_set_value_cansleep(ov2735->reset_gpio, 0);

In the similar way.

> +	regulator_bulk_disable(ARRAY_SIZE(ov2735_supply_name), ov2735->supplies);
> +
> +	return 0;
> +}

...

> +static int ov2735_parse_endpoint(struct ov2735 *ov2735)
> +{
> +	struct fwnode_handle *fwnode;
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> +	};
> +	struct fwnode_handle *ep;
> +	int ret;
> +
> +	fwnode = dev_fwnode(ov2735->dev);
> +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (!ep) {

> +		dev_err(ov2735->dev, "Failed to get next endpoint\n");
> +		return -ENXIO;

Please, be consistent, use dev_err_probe().

> +	}
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return ret;
> +
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 2) {
> +		dev_err_probe(ov2735->dev, -EINVAL, "only 2 data lanes are supported\n");

		ret = dev_err_probe(...);

Otherwise it's 0.

> +		goto error_out;
> +	}
> +
> +	return 0;
> +
> +error_out:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +};

...

> +	ov2735->cci = devm_cci_regmap_init_i2c(client, 8);
> +	if (IS_ERR(ov2735->cci)) {
> +		ret = PTR_ERR(ov2735->cci);
> +		return dev_err_probe(ov2735->dev, ret, "failed to initialize CCI\n");

Why not in a single expression?

> +	}

...

> +	/* Set Current page to 0 */
> +	ov2735->current_page = 0;
> +	mutex_init(&ov2735->page_lock);

	ret = devm_mutex_init(...);

i.o.w. do not mix devm chain with non-devm allocations.

...

> +	ov2735->xclk = devm_v4l2_sensor_clk_get(ov2735->dev, NULL);
> +	if (IS_ERR(ov2735->xclk)) {
> +		return dev_err_probe(ov2735->dev, PTR_ERR(ov2735->xclk),
> +				     "failed to get xclk\n");
> +	}

You can drop {}.

> +	xclk_freq = clk_get_rate(ov2735->xclk);
> +	if (xclk_freq != OV2735_XCLK_FREQ)
> +		return dev_err_probe(ov2735->dev, -EINVAL,
> +				     "xclk frequency not supported: %d Hz\n",
> +				     xclk_freq);

You see, the code is full of inconsistencies, please take your time (no need to
hurry with a new version, you have at least two months for this series to be
reviewed and applied if okay).

...

> +	ret = ov2735_get_regulators(ov2735);
> +	if (ret)
> +		return dev_err_probe(ov2735->dev, ret, "failed to get regulators\n");
> +
> +	ret = ov2735_parse_endpoint(ov2735);
> +	if (ret) {
> +		dev_err(ov2735->dev, "failed to parse endpoint configuration\n");
> +		return ret;

		return dev_error_probe(...);

> +	}

Again, read above.

...

> +	ret = v4l2_async_register_subdev_sensor(&ov2735->sd);
> +	if (ret < 0) {

Why ' < 0'? What is the meaning of the positive return?
Same Q to all these inconsistencies (note, in some cases it's needed
but I doubt here and in many other places it's the case).

> +		dev_err_probe(ov2735->dev, ret,
> +			      "failed to register ov2735 sub-device\n");
> +		goto error_subdev_cleanup;
> +	}

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

> +	pm_runtime_disable(ov2735->dev);

Why not devm variant being used in probe?

> +	if (!pm_runtime_status_suspended(ov2735->dev))
> +		ov2735_power_off(ov2735->dev);
> +	pm_runtime_set_suspended(ov2735->dev);

So, you probably want SMART_SUSPEND or something like that when enabling
runtime PM in probe. These lines looks like duplication of what PM runtime may
do for you.

> +}

-- 
With Best Regards,
Andy Shevchenko



