Return-Path: <linux-media+bounces-36515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FACAF0C48
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 09:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CABB34E3077
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 07:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E566C22A1EF;
	Wed,  2 Jul 2025 07:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oHysoo3e"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4774818EAB;
	Wed,  2 Jul 2025 07:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751440423; cv=none; b=WKuKUUPY/FgSQMFawU47nupyYgS+XMO0o74a0cnLUsWa07GvcDiEFQE3W9OfNS1SMx7ffbrCJ28xlRg57cQBflnkNWHznRaxJGRSfppPJNEgFl7res2D2kfGJrW0IOCuDJ/ex3TcZRjZCvDdp9ycyTzkAW0nmaM4XuHNtW1oB8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751440423; c=relaxed/simple;
	bh=fMb7qkyIL05M6PVmQgqY3NmHUrJFgW+GaqQoqPtVyFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sKrO0owRetcvoDOXyMxKug4bfFqqKjzw7CmaWe3SmIM6vx+o4wbPYbLTAJt+h6vXfeM3zQ+bSx2VD7OgY7+gYgzG4rvkIZs3Fu4/uaKpGzflD53RiHyMAmMVsQnXOy2TAwHhKZ/f3ah5w+gEjo/HzWdI3PUHfs99tEC5RpU6Chs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oHysoo3e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AECEC4CEEE;
	Wed,  2 Jul 2025 07:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751440421;
	bh=fMb7qkyIL05M6PVmQgqY3NmHUrJFgW+GaqQoqPtVyFY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oHysoo3eS2WcL+wlBnT/aQB2WejukmPkWXQ9UfJL2skbfxTDoGe3pxUSZAn8+CqJs
	 Iy/rvrpnoSy4YzlEV5UdKOtGKCktbPr/D5u2GVycse3gXNSqhV0xPylAX99/34JHLp
	 jP22pM2X9LC92iGxf3zZzvQm1kleguMHz6T3qy6F7sRglDDRvqVLxbW7KFrmdZicEi
	 G9UlXTFLNNQINSBRmkU+Dfg1qLRs2vI1F5xGo80NDugxOHZ+2HvGdKb/iziKpc9UmI
	 sT4mQP+xW655d6YNt1IdliKgAb/eq4a8LOaY7sLM2qcZV0oDO7tXbJsOg0CEUI+UzE
	 QUhb6BwyYDxlg==
Message-ID: <5cba2560-075c-4cd3-998e-30bd4ebb1d8b@kernel.org>
Date: Wed, 2 Jul 2025 09:13:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] Add a driver for the NIR-enhanced Mira220
 1600x1400 global shutter image sensor.
To: Philippe Baetens <philippebaetens@gmail.com>, mchehab@kernel.org,
 robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <aGP7j-8Beu-ekPT1@raspberrypi>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aGP7j-8Beu-ekPT1@raspberrypi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/07/2025 17:15, Philippe Baetens wrote:
> This driver implements 12b, 10b and 8b RAW RGB color format.
> The output datarate is
> 1500Mbit/s, 2 lane. Framerate is up to 90 fps.
> Note: this sensor does not support analog gain.
> 
> Signed-off-by: philippe baetens <philippebaetens@gmail.com>
> ---
> Changes in v3:
> 	- Add people to mailing list
> 	- Improve commit description
> Changes in v2:
> 	- Fix checkpatch warnings

Subject: missing prefixes
Subject: no full stop, this is not a sentence. Look at git log how this
is created.

> ---
>  drivers/media/i2c/Kconfig   |   39 +
>  drivers/media/i2c/Makefile  |    3 +
>  drivers/media/i2c/mira220.c | 1973 +++++++++++++++++++++++++++++++++++
>  3 files changed, 2015 insertions(+)
>  create mode 100644 drivers/media/i2c/mira220.c
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index e68202954..0267f2440 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -127,6 +127,31 @@ config VIDEO_HI847
>            To compile this driver as a module, choose M here: the
>            module will be called hi847.
>  
> +config VIDEO_PONCHA110

What is this?

> +	tristate "ams PONCHA110 sensor support"
> +	depends on I2C && VIDEO_DEV
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
> +	select V4L2_FWNODE
> +	help
> +	  This is a Video4Linux2 sensor driver for the ams
> +	  PONCHA110 camera.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called poncha110.
> +
> +config VIDEO_PONCHA110COLOR

Hm?

> +	tristate "ams PONCHA110COLOR sensor support"
> +	depends on I2C && VIDEO_DEV
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
> +	select V4L2_FWNODE
> +	help
> +	  This is a Video4Linux2 sensor driver for the ams
> +	  PONCHA110 camera.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called poncha110.
>  config VIDEO_IMX208
>  	tristate "Sony IMX208 sensor support"
>  	help
> @@ -269,6 +294,20 @@ config VIDEO_IMX415
>  config VIDEO_MAX9271_LIB
>  	tristate
>  
> +config VIDEO_MIRA220
> +	tristate "ams MIRA220 sensor support"
> +	depends on I2C && VIDEO_DEV
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
> +	select V4L2_CCI_I2C
> +	select V4L2_FWNODE
> +	help
> +	  This is a Video4Linux2 sensor driver for the ams
> +	  MIRA220 camera.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called mira220.
> +
>  config VIDEO_MT9M001
>  	tristate "mt9m001 support"
>  	help
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index 5873d2943..3b5e9d242 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -45,6 +45,8 @@ obj-$(CONFIG_VIDEO_HI556) += hi556.o
>  obj-$(CONFIG_VIDEO_HI846) += hi846.o
>  obj-$(CONFIG_VIDEO_HI847) += hi847.o
>  obj-$(CONFIG_VIDEO_I2C) += video-i2c.o
> +obj-$(CONFIG_VIDEO_PONCHA110)	+= poncha110.o
> +obj-$(CONFIG_VIDEO_PONCHA110COLOR)	+= poncha110color.o

What?


...

> +
> +struct mira220 {

Type declarations go before variable definitions.

> +	struct v4l2_subdev sd;
> +	struct media_pad pad;
> +
> +	struct v4l2_mbus_framefmt fmt;
> +
> +	struct clk *xclk; /* system clock to MIRA220 */
> +	u32 xclk_freq;
> +
> +	struct regulator_bulk_data supplies[MIRA220_NUM_SUPPLIES];
> +
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	struct v4l2_ctrl *pixel_rate;
> +	struct v4l2_ctrl *vflip;
> +	struct v4l2_ctrl *hflip;
> +	struct v4l2_ctrl *vblank;
> +	struct v4l2_ctrl *hblank;
> +	struct v4l2_ctrl *exposure;
> +	struct v4l2_ctrl *gain;
> +
> +	/* Current mode */
> +	const struct mira220_mode *mode;
> +
> +	struct mutex mutex; //comment
> +	/* mutex ensures correct initialization */
> +
> +	struct regmap *regmap;
> +};
> +
> +static inline struct mira220 *to_mira220(struct v4l2_subdev *_sd)
> +{
> +	return container_of(_sd, struct mira220, sd);
> +}
> +
> +/* Power/clock management functions */
> +static int mira220_power_on(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct mira220 *mira220 = to_mira220(sd);
> +	int ret = -EINVAL;
> +
> +	ret = regulator_bulk_enable(MIRA220_NUM_SUPPLIES, mira220->supplies);
> +	if (ret) {
> +		dev_err(&client->dev, "%s: failed to enable regulators\n",
> +			__func__);
> +		goto reg_off;
> +	}
> +	ret = clk_prepare_enable(mira220->xclk);
> +	if (ret) {
> +		dev_err(&client->dev, "%s: failed to enable clock\n", __func__);
> +		goto clk_off;
> +	}
> +	fsleep(MIRA220_XCLR_MIN_DELAY_US);

No. Look at your probe code, this makes no sense.

> +
> +	return 0;
> +
> +clk_off:
> +	clk_disable_unprepare(mira220->xclk);
> +reg_off:
> +	ret = regulator_bulk_disable(MIRA220_NUM_SUPPLIES, mira220->supplies);

So you return 0 on error?
Why are you disabling regulators which were not enabled? This is wrong -
bug.

> +	return ret;
> +}
> +
> +static int mira220_power_off(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct mira220 *mira220 = to_mira220(sd);
> +	(void)mira220;
> +
> +	clk_disable_unprepare(mira220->xclk);
> +	regulator_bulk_disable(MIRA220_NUM_SUPPLIES, mira220->supplies);
> +
> +	return 0;
> +}
> +


...

> +
> +static int mira220_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct mira220 *mira220;
> +	int ret;
> +
> +	mira220 = devm_kzalloc(&client->dev, sizeof(*mira220), GFP_KERNEL);
> +	if (!mira220)
> +		return -ENOMEM;
> +
> +	v4l2_i2c_subdev_init(&mira220->sd, client, &mira220_subdev_ops);
> +	mira220->sd.internal_ops = &mira220_internal_ops;
> +
> +	mira220->regmap = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(mira220->regmap))
> +		return dev_err_probe(dev, PTR_ERR(mira220->regmap),
> +				     "failed to initialize CCI\n");

Blank line

> +	/* Get system clock (xclk) */
> +	mira220->xclk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(mira220->xclk)) {
> +		dev_err(dev, "failed to get xclk\n");
> +		return PTR_ERR(mira220->xclk);

Syntax is: return dev_err_probe()

> +	}
> +	mira220->xclk_freq = clk_get_rate(mira220->xclk);
> +	if (mira220->xclk_freq != MIRA220_SUPPORTED_XCLK_FREQ) {
> +		dev_err(dev, "xclk frequency not supported: %d Hz\n",
> +			mira220->xclk_freq);
> +		return -EINVAL;

return dev_err_probe

> +	}
> +
> +	ret = mira220_get_regulators(mira220);
> +	if (ret) {
> +		dev_err(dev, "failed to get regulators\n");
> +		return ret;

Same

> +	}
> +
> +	fsleep(10000);

Uh... Why? This sleep makes no sense at all.

> +
> +	// The sensor must be powered for mira220_identify_module()
> +	// to be able to read the CHIP_ID register
> +
> +	 ret = mira220_power_on(dev);
> +	if (ret)
> +		return ret;

You just slept here!

> +
> +	fsleep(100000);

Oh... so entire probe is delayed by 100 ms + 10 ms (!!!). This is just
some arbitrary and not suspicious delay. Maybe you miss regulator ramps,
but 100 ms here is just wrong.

> +
> +	ret = mira220_identify_module(mira220);
> +	if (ret)
> +		goto error_power_off;
> +
> +	/* Set default mode to max resolution */
> +	mira220->mode = &supported_modes[0];
> +
> +	ret = mira220_init_controls(mira220);
> +	if (ret)
> +		goto error_power_off;
> +
> +	/* Initialize subdev */
> +	mira220->sd.internal_ops = &mira220_internal_ops;
> +	mira220->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +		V4L2_SUBDEV_FL_HAS_EVENTS;
> +	mira220->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +
> +	/* Initialize source pads */
> +	mira220->pad.flags = MEDIA_PAD_FL_SOURCE;
> +
> +	ret = media_entity_pads_init(&mira220->sd.entity, 1, &mira220->pad);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to init entity pads\n");
> +		goto error_handler_free;
> +	}
> +
> +	mira220->sd.state_lock = mira220->ctrl_handler.lock;
> +	ret = v4l2_subdev_init_finalize(&mira220->sd);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "subdev init error\n");
> +		goto error_media_entity;
> +	}
> +
> +	ret = v4l2_async_register_subdev_sensor(&mira220->sd);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret,
> +			      "failed to register sensor sub-device\n");
> +		goto error_subdev_cleanup;
> +	}
> +
> +	/* Enable runtime PM and turn off the device */
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);
> +
> +	return 0;
> +
> +error_subdev_cleanup:
> +	v4l2_subdev_cleanup(&mira220->sd);
> +
> +error_media_entity:
> +	media_entity_cleanup(&mira220->sd.entity);
> +
> +error_handler_free:
> +	mira220_free_controls(mira220);
> +
> +error_power_off:
> +	mira220_power_off(dev);
> +
> +	return ret;
> +}
> +
> +static void mira220_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct mira220 *mira220 = to_mira220(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	media_entity_cleanup(&sd->entity);
> +	mira220_free_controls(mira220);
> +
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		mira220_power_off(&client->dev);
> +	pm_runtime_set_suspended(&client->dev);
> +}
> +
> +static const struct dev_pm_ops mira220_pm_ops = {
> +		SET_RUNTIME_PM_OPS(mira220_power_off, mira220_power_on, NULL)
> +};
> +
> +static const struct of_device_id mira220_dt_ids[] = {
> +	{ .compatible = "ams,mira220" },
> +	{ /* sentinel */ } };

}; is always in new line.

> +MODULE_DEVICE_TABLE(of, mira220_dt_ids);
> +



Best regards,
Krzysztof

