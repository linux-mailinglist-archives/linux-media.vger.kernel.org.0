Return-Path: <linux-media+bounces-37044-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF8AAFBC8B
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 22:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0ECBD42183C
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 20:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81CB21D5AA;
	Mon,  7 Jul 2025 20:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hIMct+nT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0108221ADCB;
	Mon,  7 Jul 2025 20:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751920208; cv=none; b=kDVMYXKTNzUXE8JTk/4UxcAqO6Tt7/NH75kbeYZ2foGEkgs94lBtc1yOEU0s2pjdDyV6sUSEf0j3ttzNFC4cGj1qfr8g0Dw3JBsbRcUi7sQGGUjyVjF2Mod9uDTjl0albUXj9qBqMOLUx+lBn7Y9HGMmpqOfjr/YwkBKH+8hFlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751920208; c=relaxed/simple;
	bh=CC3n4Vr6kWi2tQKPF606Tq0gsd/QHsjt5Qt5/WATDvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fC9vszULq4PCHxhfJvPdhyoUSrC3CxrYzeKyJ/w47jQkgowzOhGfB5YuejDYXIle3bp/PCbJlCDy0uiWBThUa+/VWkoMTFbO6wBPtwKPt1Ju7xnS4C73eNL42oGSdq/kU+xCnppAjEkFsCSOat9gRnv3mXMgwhqWA5ypjZ4BiwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hIMct+nT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751920207; x=1783456207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CC3n4Vr6kWi2tQKPF606Tq0gsd/QHsjt5Qt5/WATDvA=;
  b=hIMct+nT0KjVd/Dn7LJUGirhWBVQ971OzewPixmqKs1i9BpJNZAm5ZJ6
   PJ6ubDQNq08QQ+JZrQRkkoFbJw8hbpudjJL3p1yNGI3aj26qmXhU0JPDD
   6uETZDe6aJDKe27GjB/NjO3h2fT/9Wf0ku3Kk6IotG4d2FFafqGzsR0HY
   Z4pGklDYviHkh3Ao7Qxc0wW6y7sWZ/pMoHh/DGr/whJ8sf7eVYHSgBtvE
   8kkYPo7KBh/47L5zFQSBWJ7QgbI3nQT/SxmF2MNUTzCKyTl3+y69wzG1y
   uIWssNpxmpDw01UUt9Wn76wQrslwyZQqp5EnFLsy2r9lXf7dpBi3ZoCm5
   Q==;
X-CSE-ConnectionGUID: 2KxzCl4ySDCpb4jEqQcfAw==
X-CSE-MsgGUID: 9PDfuhPFSbS4zBTHLxbtQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54291192"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="54291192"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 13:30:06 -0700
X-CSE-ConnectionGUID: sKZFyNstTvWwE+XWp8mqxw==
X-CSE-MsgGUID: Zgyl3wLWQUWcSjLjHI54pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="155886911"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 13:30:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uYsTN-0000000DOJD-1mUH;
	Mon, 07 Jul 2025 23:29:57 +0300
Date: Mon, 7 Jul 2025 23:29:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hans de Goede <hansg@kernel.org>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Arnd Bergmann <arnd@arndb.de>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: add ov2735 image sensor driver
Message-ID: <aGwuRP42mtFZmLT8@smile.fi.intel.com>
References: <20250707150118.20536-1-hardevsinh.palaniya@siliconsignals.io>
 <20250707150118.20536-3-hardevsinh.palaniya@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707150118.20536-3-hardevsinh.palaniya@siliconsignals.io>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 07, 2025 at 08:31:06PM +0530, Hardevsinh Palaniya wrote:
> Add a v4l2 subdevice driver for the Omnivision OV2735 sensor.
> 
> The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an
> active array size of 1920 x 1080.
> 
> - Manual exposure an gain control support
> - vblank/hblank control support
> - Supported resolution: 1920 x 1080 @ 30fps (SGRBG10)

...

> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/units.h>

More stuff is in use than just these headers provide.
E.g.,

+ array_size.h
+ container_of.h
+ gpio/consumer.h
+ types.h

And so on... Also in some cases the forward declarations are enough to have.

.,,

> +#define OV2735_LINK_FREQ_420MHZ			420000000

HZ_PER_MHZ ?

...

> +#define OV2735_PIXEL_RATE			168000000

What's the unit?

...

> +static const s64 link_freq_menu_items[] = {
> +	OV2735_LINK_FREQ_420MHZ

Keep the trailing comma like you have done in other cases.

> +};

...

> +static int ov2735_enable_test_pattern(struct ov2735 *ov2735, u32 pattern)
> +{
> +	int ret;
> +	u64 val;
> +
> +	ret = cci_read(ov2735->cci, OV2735_REG_TEST_PATTERN, &val, NULL);
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

> +	ret = cci_write(ov2735->cci, OV2735_REG_TEST_PATTERN, val, NULL);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

Is this the required style? Because these 5 LoCs is just a simple

	return cci_write(ov2735->cci, OV2735_REG_TEST_PATTERN, val, NULL);

> +}

...

> +static int ov2735_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct ov2735 *ov2735 = container_of(ctrl->handler, struct ov2735,
> +					     handler);
> +	const struct ov2735_mode *mode;
> +	struct v4l2_mbus_framefmt *fmt;
> +	struct v4l2_subdev_state *state;

> +	int vts;

Can be negative?

> +	int ret = 0;

How is this assignment useful?

> +	state = v4l2_subdev_get_locked_active_state(&ov2735->sd);
> +	fmt = v4l2_subdev_state_get_format(state, 0);
> +
> +	mode = v4l2_find_nearest_size(supported_modes,
> +				      ARRAY_SIZE(supported_modes),
> +				      width, height,
> +				      fmt->width, fmt->height);
> +
> +	if (ctrl->id == V4L2_CID_VBLANK) {
> +		/* Honour the VBLANK limits when setting exposure. */
> +		s64 max = mode->height + ctrl->val - 4;
> +
> +		ret = __v4l2_ctrl_modify_range(ov2735->exposure,
> +					       ov2735->exposure->minimum, max,
> +					 ov2735->exposure->step,
> +					 ov2735->exposure->default_value);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/*
> +	 * Applying V4L2 control value only happens
> +	 * when power is up for streaming

Multi-line comments shouldn't neglect punctuation.

> +	 */
> +	if (pm_runtime_get_if_in_use(ov2735->dev) == 0)
> +		return 0;
> +
> +	ret = cci_write(ov2735->cci, OV2735_REG_PAGE_SELECT, 0x01, NULL);
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_EXPOSURE:
> +		ret |= cci_write(ov2735->cci, OV2735_REG_LONG_EXPOSURE, ctrl->val, NULL);
> +		break;
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		ret |= cci_write(ov2735->cci, OV2735_REG_ANALOG_GAIN, ctrl->val, NULL);
> +		break;
> +	case V4L2_CID_HBLANK:
> +		ret |= cci_write(ov2735->cci, OV2735_REG_HBLANK, ctrl->val, NULL);
> +		break;
> +	case V4L2_CID_VBLANK:
> +		vts = ctrl->val + mode->height;
> +		ret |= cci_write(ov2735->cci, OV2735_REG_FRAME_EXP_SEPERATE_EN,
> +				 OV2735_FRAME_EXP_SEPERATE_EN, NULL);
> +		ret |= cci_write(ov2735->cci, OV2735_REG_FRAME_LENGTH, vts, NULL);
> +		break;
> +	case V4L2_CID_TEST_PATTERN:
> +		ret = ov2735_enable_test_pattern(ov2735, ctrl->val);
> +		break;
> +	default:
> +		dev_err(ov2735->dev, "ctrl(id:0x%x, val:0x%x) is not handled\n",
> +			ctrl->id, ctrl->val);
> +		break;
> +	}
> +	ret |= cci_write(ov2735->cci, OV2735_REG_FRAME_SYNC, 0x01, NULL);
> +
> +	pm_runtime_put(ov2735->dev);
> +
> +	return ret;
> +}

...

> +static int ov2735_init_controls(struct ov2735 *ov2735)
> +{
> +	struct v4l2_ctrl_handler *ctrl_hdlr;
> +	struct v4l2_fwnode_device_properties props;
> +	const struct ov2735_mode *mode = &supported_modes[0];
> +	u64 hblank_def, vblank_def, exp_max;
> +	int ret;
> +
> +	ctrl_hdlr = &ov2735->handler;
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 7);
> +	if (ret)
> +		return ret;
> +
> +	ov2735->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov2735_ctrl_ops, V4L2_CID_PIXEL_RATE,
> +					       0, OV2735_PIXEL_RATE, 1, OV2735_PIXEL_RATE); 

Besides it's too long, it has trailing space.

> +
> +	ov2735->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov2735_ctrl_ops,
> +						   V4L2_CID_LINK_FREQ,
> +						   0, 0, link_freq_menu_items);
> +	if (ov2735->link_freq)
> +		ov2735->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	hblank_def =  mode->hts_def - mode->width;
> +	ov2735->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov2735_ctrl_ops, V4L2_CID_HBLANK,
> +					   hblank_def, hblank_def, 1, hblank_def);
> +
> +	vblank_def = mode->vts_def - mode->height;
> +	ov2735->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov2735_ctrl_ops,
> +					   V4L2_CID_VBLANK, vblank_def,
> +				OV2735_VTS_MAX - mode->height,
> +				1, vblank_def);

It's weird indentation.

> +
> +	exp_max = mode->vts_def - 4;
> +	ov2735->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov2735_ctrl_ops,
> +					     V4L2_CID_EXPOSURE, OV2735_EXPOSURE_MIN,
> +				exp_max, OV2735_EXPOSURE_STEP, mode->exp_def);
> +
> +	ov2735->gain = v4l2_ctrl_new_std(ctrl_hdlr, &ov2735_ctrl_ops,
> +					 V4L2_CID_ANALOGUE_GAIN, ANALOG_GAIN_MIN,
> +				ANALOG_GAIN_MAX, ANALOG_GAIN_STEP,
> +				ANALOG_GAIN_DEFAULT);

Ditto.

> +	ov2735->test_pattern = v4l2_ctrl_new_std_menu_items(ctrl_hdlr,
> +							    &ov2735_ctrl_ops, V4L2_CID_TEST_PATTERN,
> +			ARRAY_SIZE(ov2735_test_pattern_menu) - 1,
> +			0, 0, ov2735_test_pattern_menu);

Ditto.

> +	if (ctrl_hdlr->error) {
> +		ret = ctrl_hdlr->error;
> +		dev_err(ov2735->dev, "control init failed (%d)\n", ret);
> +		goto error;
> +	}
> +
> +	ret = v4l2_fwnode_device_parse(ov2735->dev, &props);
> +	if (ret)
> +		goto error;
> +
> +	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov2735_ctrl_ops,
> +					      &props);
> +	if (ret)
> +		goto error;
> +
> +	ov2735->sd.ctrl_handler = ctrl_hdlr;
> +
> +	return 0;
> +error:

Usual way of naming labels is to explain what is going to  happen when goto.
Moreover it's even inconsistent, the below code use err prefix, but better
naming.

Here the

err_handler_free:

for example is better.

> +	v4l2_ctrl_handler_free(ctrl_hdlr);
> +
> +	return ret;
> +}

...

> +static int ov2735_enable_streams(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state, u32 pad,
> +				u64 streams_mask)

Indentation issue.

> +{
> +	struct ov2735 *ov2735 = to_ov2735(sd);
> +	const struct ov2735_mode *mode;
> +	const struct ov2735_reglist *reg_list;
> +	const struct v4l2_mbus_framefmt *fmt;
> +	int ret = 0;

Needless assignment.

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
> +	ret = cci_multi_reg_write(ov2735->cci, reg_list->regvals, reg_list->num_regs, NULL);
> +	if (ret) {
> +		dev_err(ov2735->dev, "%s failed to send mfg header\n", __func__);
> +		goto err_rpm_put;
> +	}
> +
> +	/* Apply customized values from user */
> +	ret =  __v4l2_ctrl_handler_setup(ov2735->sd.ctrl_handler);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	/* set stream on register */
> +	ret = cci_write(ov2735->cci, OV2735_REG_PAGE_SELECT, 0x01, NULL);
> +	ret |= cci_write(ov2735->cci, OV2735_REG_STREAM_CTRL, OV2735_STREAM_ON, NULL);
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

> +static int ov2735_disable_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state, u32 pad,
> +				  u64 streams_mask)
> +{
> +	struct ov2735 *ov2735 = to_ov2735(sd);
> +	int ret = 0;
> +
> +	/* set stream off register */
> +	ret = cci_write(ov2735->cci, OV2735_REG_PAGE_SELECT, 0x01, NULL);
> +	ret |= cci_write(ov2735->cci, OV2735_REG_STREAM_CTRL, OV2735_STREAM_OFF, NULL);

Why not using the ret parameter? Same for other similar cases above and beyond.

> +	if (ret)
> +		dev_err(ov2735->dev, "%s failed to set stream\n", __func__);
> +
> +	pm_runtime_put(ov2735->dev);
> +
> +	return ret;
> +}

...

> +static int ov2735_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov2735 *ov2735 = to_ov2735(sd);

> +	int ret;
> +	unsigned long delay_us;

Why this order?

> +	gpiod_set_value_cansleep(ov2735->pwdn_gpio, 0);
> +	usleep_range(2000, 5000);

Use fsleep().

> +	ret = regulator_bulk_enable(ARRAY_SIZE(ov2735_supply_name),
> +				    ov2735->supplies);
> +	if (ret) {
> +		dev_err(ov2735->dev, "failed to enable regulators\n");
> +		return ret;
> +	}
> +
> +	gpiod_set_value_cansleep(ov2735->pwdn_gpio, 1);
> +	usleep_range(2000, 5000);

Ditto.

> +	gpiod_set_value_cansleep(ov2735->reset_gpio, 0);
> +	usleep_range(2000, 5000);

Ditto.

> +	ret = clk_prepare_enable(ov2735->xclk);
> +	if (ret) {
> +		dev_err(ov2735->dev, "failed to enable clock\n");
> +		goto regulator_off;
> +	}
> +
> +	/* 8192 cycles prior to first SCCB transaction */
> +	delay_us = DIV_ROUND_UP(8192, OV2735_XCLK_FREQ / 1000 / 1000);
> +	usleep_range(delay_us, delay_us * 2);

Ditto.

> +	return 0;
> +
> +regulator_off:

If you use 'err' prefix for error paths, here makes sense to continue.

> +	regulator_bulk_disable(ARRAY_SIZE(ov2735_supply_name), ov2735->supplies);
> +	return ret;
> +}

...

> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY

Keep trailing comma.

> +	};

...

> +	ov2735 = devm_kzalloc(&client->dev, sizeof(*ov2735), GFP_KERNEL);

This requires device/devres.h.

> +	if (!ov2735)
> +		return -ENOMEM;

...

> +	ov2735->cci = devm_cci_regmap_init_i2c(client, 8);
> +	if (IS_ERR(ov2735->cci)) {
> +		ret = PTR_ERR(ov2735->cci);
> +		dev_err(ov2735->dev, "failed to initialize CCI: %d\n", ret);
> +		return ret;

Why not dev_err_probe()?

The code is full of inconsistency, please make sure it's one style.

> +	}

...

> +static DEFINE_RUNTIME_DEV_PM_OPS(ov2735_pm_ops, ov2735_power_off,
> +				 ov2735_power_on, NULL);

Make the logical split:

static DEFINE_RUNTIME_DEV_PM_OPS(ov2735_pm_ops,
				 ov2735_power_off, ov2735_power_on, NULL);

...

> +static struct i2c_driver ov2735_driver = {
> +	.driver = {
> +		.name = "ov2735",
> +		.pm = pm_ptr(&ov2735_pm_ops),
> +		.of_match_table = ov2735_id,

> +

Stray.

> +	},
> +	.probe = ov2735_probe,
> +	.remove = ov2735_remove,
> +};

> +

Unneeded.

> +module_i2c_driver(ov2735_driver);

-- 
With Best Regards,
Andy Shevchenko



