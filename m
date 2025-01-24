Return-Path: <linux-media+bounces-25252-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 274A8A1B0AD
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 08:05:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 687AE16C99D
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 07:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF501DB123;
	Fri, 24 Jan 2025 07:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="b1GB69mb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-71.smtpout.orange.fr [80.12.242.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD1B33998;
	Fri, 24 Jan 2025 07:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737702341; cv=none; b=KODPSizHHZ7CPMt4w/TsE8Y3VJGtoF0zG6Zpa41TSfVpkAG9h142gse/xULtuHF4c5B6YKiVxqLxr5C46sJiZ2JX0NHXrKkCztRrxenupctN2ZBb2VPDpY+8c6T/faK7FFHJt5ZA6aNLn+suvFQwa5wVkAlgnoeKEeoQ52Is6RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737702341; c=relaxed/simple;
	bh=08uoD3woXjERLG5JzZv6BFt+o7geQ9cqxyIA9Yj/fI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GYQulL2f9pZxH3OnWeGM8LdmCtsnJdLFB+UOwlSAy6/1L0z4zS3ui8MkErAKTQDyOXixfFsUm0JrNrO0LJRwqrNV9gHg+jIznNpLJ9UwcCf3VFBmF328+j3q2s+R26Hl8M6et+U3FrWCrGtFKsXvpOjiBWHsFVJPJVMvgt9cbYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=b1GB69mb; arc=none smtp.client-ip=80.12.242.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id bDc5toKkkk1FUbDc8tQVJk; Fri, 24 Jan 2025 07:56:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1737701789;
	bh=+PMaPjaDgkEmBs+qk3oGEtVev1zbxLFsascDcXBSXIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=b1GB69mb3/DSkvBNjCUnEDIbW0woSzabdhRaU2AziXeCBxRwTSwL3/xxIOnAYV6bf
	 ZFh/TN7q4NYStWjZ5R3Z2E+HFUBmaSZ6xedEFJVWsa3JEEc1fRteVY6KMDQdTT4OVt
	 4ynHhBO1jWh0tSA4yCKgg09HTG8Ip1Rl22EirbeRwM62Nl5vq/tOWZYDGCtoP1+Dd6
	 ShPVvGbuR1lcaH8vtUeR+M3063XuHCy3kLfYhLpHPZxGroVxEvs/X1mV2t7Gq6hqAU
	 ZNsZqWeXFp33oV6tyfcCZa88ZGsENS7O9yvwgZuG9lpkEiaHzz//smv6rCHERu1jua
	 kkxbd/Dxb2pWg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 24 Jan 2025 07:56:29 +0100
X-ME-IP: 90.11.132.44
Message-ID: <3e47eadc-59b7-4730-89bc-b18e9483fca2@wanadoo.fr>
Date: Fri, 24 Jan 2025 07:56:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: ox05b1s: Add omnivision OX05B1S raw sensor
 driver
To: Mirela Rabulea <mirela.rabulea@nxp.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, robh@kernel.org,
 krzk+dt@kernel.org, bryan.odonoghue@linaro.org, laurentiu.palcu@nxp.com,
 robert.chiras@nxp.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 LnxRevLi@nxp.com, kieran.bingham@ideasonboard.com, hdegoede@redhat.com,
 dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com,
 alain.volmat@foss.st.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 alexander.stein@ew.tq-group.com, umang.jain@ideasonboard.com,
 zhi.mao@mediatek.com, festevam@denx.de, julien.vuillaumier@nxp.com,
 alice.yuan@nxp.com
References: <20250124001243.446511-1-mirela.rabulea@nxp.com>
 <20250124001243.446511-3-mirela.rabulea@nxp.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250124001243.446511-3-mirela.rabulea@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 24/01/2025 à 01:12, Mirela Rabulea a écrit :
> Add a v4l2 subdevice driver for the Omnivision OX05B1S RGB-IR sensor.
> 
> The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an
> active array size of 2592 x 1944.
> 
> The following features are supported for OX05B1S:
> - Manual exposure an gain control support
> - vblank/hblank control support
> - Supported resolution: 2592 x 1944 @ 30fps (SGRBG10)
> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---

...

> +static int ox05b1s_power_on(struct ox05b1s *sensor)
> +{
> +	struct device *dev = &sensor->i2c_client->dev;
> +	int ret = 0;

No need to init.

> +
> +	ret = regulator_bulk_enable(OX05B1S_NUM_SUPPLIES, sensor->supplies);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable regulators\n");
> +		return ret;
> +	}
> +
> +	/* get out of powerdown and reset */
> +	gpiod_set_value_cansleep(sensor->rst_gpio, 0);
> +
> +	ret = clk_prepare_enable(sensor->sensor_clk);
> +	if (ret < 0) {
> +		dev_err(dev, "Enable sensor clk fail ret=%d\n", ret);
> +		goto reg_off;
> +	}
> +
> +	/* with XVCLK@24MHz, t2 = 6ms required delay for ox05b1s before first SCCB transaction */
> +	fsleep(6000);
> +
> +	return ret;

return 0;

> +
> +reg_off:
> +	regulator_bulk_disable(OX05B1S_NUM_SUPPLIES, sensor->supplies);
> +
> +	return ret;
> +}

...

> +/* needs sensor lock and power on */
> +static int ox05b1s_apply_current_mode(struct ox05b1s *sensor)
> +{
> +	struct device *dev = &sensor->i2c_client->dev;
> +	struct ox05b1s_reglist *reg_data = sensor->mode->reg_data;
> +	u32 w = sensor->mode->width;
> +	u32 h = sensor->mode->height;
> +	int ret = 0;
> +
> +	cci_write(sensor->regmap, OX05B1S_REG_SW_RST, 0x01, NULL);
> +
> +	while (reg_data->regs) {
> +		ret = ox05b1s_write_reg_array(sensor, reg_data->regs);
> +		if (ret)
> +			goto out;
> +		reg_data++;
> +	}
> +
> +	cci_write(sensor->regmap, OX05B1S_REG_X_OUTPUT_SIZE, w, &ret);
> +	cci_write(sensor->regmap, OX05B1S_REG_Y_OUTPUT_SIZE, h, &ret);
> +	if (ret)
> +		goto out;
> +
> +	/* setup handler will write actual controls into sensor registers */
> +	ret =  __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);

2 spaces after '='

> +
> +out:
> +	if (ret < 0)
> +		dev_err(dev, "Failed to apply mode %dx%d,bpp=%d\n", w, h,
> +			sensor->mode->bpp);
> +
> +	return ret;
> +}

...

> +static int ox05b1s_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +				  struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> +	struct ox05b1s *sensor = client_to_ox05b1s(client);
> +
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +	fd->num_entries = 1;
> +
> +	/* get sensor current code*/

Missing space before */

> +	mutex_lock(&sensor->lock);
> +	fd->entry[0].pixelcode = sensor->mode->code;
> +	mutex_unlock(&sensor->lock);
> +
> +	fd->entry[0].bus.csi2.vc = 0;
> +	fd->entry[0].bus.csi2.dt = ox05b1s_code2dt(fd->entry[0].pixelcode);
> +
> +	return 0;
> +}

...

> +static void ox05b1s_get_gpios(struct ox05b1s *sensor)
> +{
> +	struct device *dev = &sensor->i2c_client->dev;
> +
> +	sensor->rst_gpio = devm_gpiod_get_optional(dev, "reset",
> +						   GPIOD_OUT_HIGH);
> +	if (IS_ERR(sensor->rst_gpio))
> +		dev_warn(dev, "No sensor reset pin available");

Missing ending \n

> +}
> +
> +static int ox05b1s_get_regulators(struct ox05b1s *sensor)
> +{
> +	struct device *dev = &sensor->i2c_client->dev;
> +	unsigned int i;
> +
> +	for (i = 0; i < OX05B1S_NUM_SUPPLIES; i++)
> +		sensor->supplies[i].supply = ox05b1s_supply_name[i];
> +
> +	return devm_regulator_bulk_get(dev, OX05B1S_NUM_SUPPLIES, sensor->supplies);
> +}
> +
> +static int ox05b1s_read_chip_id(struct ox05b1s *sensor)
> +{
> +	struct device *dev = &sensor->i2c_client->dev;
> +	u64 chip_id = 0;
> +	char *camera_name;
> +	int ret = 0;

No need to init.

> +
> +	ret = cci_read(sensor->regmap, OX05B1S_REG_CHIP_ID, &chip_id, NULL);
> +	if (ret) {
> +		dev_err(dev, "Camera chip_id read error\n");
> +		return -ENODEV;
> +	}
> +
> +	switch (chip_id) {
> +	case 0x580542:
> +		camera_name = "ox05b1s";
> +		break;
> +	default:
> +		camera_name = "unknown";
> +		break;
> +	}
> +
> +	if (chip_id == sensor->model->chip_id) {
> +		dev_dbg(dev, "Camera %s detected, chip_id=%llx\n", camera_name, chip_id);
> +	} else {
> +		dev_err(dev, "Detected %s camera (chip_id=%llx), but expected %s (chip_id=%x)\n",
> +			camera_name, chip_id, sensor->model->name, sensor->model->chip_id);
> +		ret = -ENODEV;

Could be return -ENODEV;
and return 0; below, to ease reading.

> +	}
> +
> +	return ret;
> +}
> +
> +static int ox05b1s_probe(struct i2c_client *client)
> +{
> +	int retval;

Using just 'ret' would be slighly shorter and more consistent with other 
functions above.

> +	struct device *dev = &client->dev;
> +	struct v4l2_subdev *sd;
> +	struct ox05b1s *sensor;
> +
> +	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
> +	if (!sensor)
> +		return -ENOMEM;
> +
> +	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(sensor->regmap))
> +		return PTR_ERR(sensor->regmap);
> +
> +	sensor->i2c_client = client;
> +
> +	sensor->model = of_device_get_match_data(dev);
> +
> +	ox05b1s_get_gpios(sensor);
> +
> +	/* Get system clock, xvclk */
> +	sensor->sensor_clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(sensor->sensor_clk))
> +		return dev_err_probe(dev, PTR_ERR(sensor->sensor_clk),
> +				     "Failed to get xvclk\n");
> +
> +	retval = ox05b1s_get_regulators(sensor);
> +	if (retval)
> +		return dev_err_probe(dev, retval, "Failed to get regulators\n");
> +
> +	sd = &sensor->subdev;
> +	v4l2_i2c_subdev_init(sd, client, &ox05b1s_subdev_ops);
> +	sd->internal_ops = &ox05b1s_internal_ops;
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	sd->dev = &client->dev;
> +	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	sensor->pads[OX05B1S_SENS_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
> +	retval = media_entity_pads_init(&sd->entity, OX05B1S_SENS_PADS_NUM,
> +					sensor->pads);
> +	if (retval)
> +		goto probe_out;
> +
> +	mutex_init(&sensor->lock);

This could be devm_mutex_init().
This would slighlty simplify the remove function.
Otherwise, a mutex_destroy() is potentialy missing in the error handling 
of the probe.

> +
> +	retval = ox05b1s_init_controls(sensor);
> +	if (retval)
> +		goto probe_err_entity_cleanup;
> +
> +	/* power on manually */
> +	retval = ox05b1s_power_on(sensor);
> +	if (retval) {
> +		dev_err(dev, "Failed to power on\n");

dev_err_probe() can still be used to be consistent with other error path 
above.

> +		goto probe_err_free_ctrls;
> +	}
> +
> +	pm_runtime_set_active(dev);
> +	pm_runtime_get_noresume(dev);
> +	pm_runtime_enable(dev);
> +
> +	retval = ox05b1s_read_chip_id(sensor);
> +	if (retval)
> +		goto probe_err_pm_runtime;
> +
> +	v4l2_i2c_subdev_set_name(sd, client, sensor->model->name, NULL);
> +
> +	/* Centrally managed subdev active state */
> +	sd->state_lock = &sensor->lock;
> +	retval = v4l2_subdev_init_finalize(sd);
> +	if (retval < 0) {
> +		dev_err(dev, "Subdev init error: %d\n", retval);

Same

> +		goto probe_err_pm_runtime;
> +	}
> +
> +	retval = v4l2_async_register_subdev_sensor(sd);
> +	if (retval < 0) {
> +		dev_err(&client->dev, "Async register failed, ret=%d\n", retval);

Same

> +		goto probe_err_subdev_cleanup;
> +	}
> +
> +	sensor->mode = &sensor->model->supported_modes[0];
> +	ox05b1s_update_controls(sensor);
> +
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_put_autosuspend(dev);
> +
> +	return 0;
> +
> +probe_err_subdev_cleanup:
> +	v4l2_subdev_cleanup(sd);
> +probe_err_pm_runtime:
> +	pm_runtime_put_noidle(dev);
> +	pm_runtime_disable(dev);
> +	ox05b1s_runtime_suspend(dev);
> +probe_err_free_ctrls:
> +	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> +probe_err_entity_cleanup:
> +	media_entity_cleanup(&sd->entity);
> +probe_out:
> +	return retval;
> +}

...

> +static struct i2c_driver ox05b1s_i2c_driver = {
> +	.driver = {
> +		.name  = "ox05b1s",

2 spaces after .name.

> +		.pm = pm_ptr(&ox05b1s_pm_ops),
> +		.of_match_table	= ox05b1s_of_match,
> +	},
> +	.probe	= ox05b1s_probe,
> +	.remove = ox05b1s_remove,
> +};
> +
> +module_i2c_driver(ox05b1s_i2c_driver);
> +MODULE_DESCRIPTION("Omnivision OX05B1S MIPI Camera Subdev Driver");
> +MODULE_AUTHOR("Mirela Rabulea <mirela.rabulea@nxp.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_modes.c b/drivers/media/i2c/ox05b1s/ox05b1s_modes.c
> new file mode 100644
> index 000000000000..1f3b822d4482
> --- /dev/null
> +++ b/drivers/media/i2c/ox05b1s/ox05b1s_modes.c
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Register configurations for all sensor supported modes
> + * Copyright (C) 2024, NXP
> + * Copyright (C) 2024, Omnivision
> + * Copyright (C) 2024, Verisilicon
> + *
> + */
> +
> +#include "ox05b1s.h"
> +
> +/*
> + * Register configuration for Omnivision OX05B1S raw camera
> + * 2592X1944_30FPS_FULL_RGBIr 2592 1944
> + */
> +struct ox05b1s_reg ovx5b_init_setting_2592x1944[] = {

I think this could easily be made a const struct.

> +	{ 0x0107, 0x01 },
> +	{ 0x0307, 0x02 },
> +	{ 0x034a, 0x05 },
> +	{ 0x040b, 0x5c },
> +	{ 0x040c, 0xcd },
> +	{ 0x3009, 0x2e },
> +	{ 0x3219, 0x08 },
> +	{ 0x3684, 0x6d },
> +	{ 0x3685, 0x6d },
> +	{ 0x3686, 0x6d },
> +	{ 0x3687, 0x6d },
> +	{ 0x368c, 0x07 },
> +	{ 0x368d, 0x07 },
> +	{ 0x368e, 0x07 },
> +	{ 0x368f, 0x00 },
> +	{ 0x3690, 0x04 },
> +	{ 0x3691, 0x04 },
> +	{ 0x3692, 0x04 },
> +	{ 0x3693, 0x04 },
> +	{ 0x3698, 0x00 },
> +	{ 0x36a0, 0x05 },
> +	{ 0x36a2, 0x16 },
> +	{ 0x36a3, 0x03 },
> +	{ 0x36a4, 0x07 },
> +	{ 0x36a5, 0x24 },
> +	{ 0x36e3, 0x09 },
> +	{ 0x3702, 0x0a },
> +	{ 0x3821, 0x04 }, /* mirror */
> +	{ 0x3822, 0x10 },
> +	{ 0x382b, 0x03 },
> +	{ 0x3866, 0x10 },
> +	{ 0x386c, 0x46 },
> +	{ 0x386d, 0x08 },
> +	{ 0x386e, 0x7b },
> +	{ 0x4802, 0x00 },
> +	{ 0x481b, 0x3c },
> +	{ 0x4837, 0x19 },
> +	{ /* sentinel*/ },

Nitpick: no need for ending comma after a terminator.

> +};
> +
> +struct ox05b1s_reglist ox05b1s_reglist_2592x1944[] = {

I think this could easily be made a const struct.

> +	{
> +		.regs = ovx5b_init_setting_2592x1944
> +	}, {
> +		/* sentinel */
> +	}
> +};


