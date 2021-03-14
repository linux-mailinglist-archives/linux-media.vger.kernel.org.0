Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDD3A33A861
	for <lists+linux-media@lfdr.de>; Sun, 14 Mar 2021 22:56:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbhCNVzu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Mar 2021 17:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhCNVzS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Mar 2021 17:55:18 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C737DC061574;
        Sun, 14 Mar 2021 14:55:17 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id t5-20020a1c77050000b029010e62cea9deso18363066wmi.0;
        Sun, 14 Mar 2021 14:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=4me8kroM2eJZs5YaPw0y1CB5H0hQcdFD1Lrn8thTxd4=;
        b=WOMn7e5Y2zGTQ/A6eFyajMp1V8+kYjU6WtT4I3eT68vOw5ZinttUHn15xu3f3MsF87
         Jrm5Mt58F84o9t1MKakalCTxcBXjogXacnKPTD7eeUw8+Ef8ipCMHTQDNKOce2KiFaDm
         kdArr11GKA4QkBOvzv6qmHXqTwrJSPDImWFtynN6dOxJ2VaQ+q/78lvFooF+IabOK9Iu
         4mztxHHtsw+eOVY0XsPhYkVcaQ/DXsH0aT5colOM7ZX4Okgp0sqD49iynehaAEJOGOZP
         u7jH8hzmzcQDww+hv2wRwTmv9b8rLJnQL9/kmu8VXKwmHPwlwRvw6omITA9InoOHnFth
         a0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=4me8kroM2eJZs5YaPw0y1CB5H0hQcdFD1Lrn8thTxd4=;
        b=tdAD8b/fthTEiA/tiSoZDgRuyHwL3N1OZYAMTuQElX2BDAHi4rllS5dydQoo5j0Tdm
         In8u9MjbnqMkXF9yO+tJ6tM8weLHVHSqKayRJdIvz5P6QXwbxrgsHDPlCUMq3b9XH/mk
         HJdClzbBcwnaEhOuLvSzoXi0+sTcb4mBZhCZyiyBNVKIyzRK0m9wWWIGLgFtOC3F87OA
         99OjbvclIZj0daYXsG4wEFW7QxTy4FAzU+lGq6hlurUvu5zpdNffp6rLAJFcZgRoMGpx
         8DKlDYG2bDy2I/o/ZyyFs3OgeQXfrlOqerjGM2n6gLAzt4bvcZBmgaDqb2a9DXCMX/5m
         6ZEw==
X-Gm-Message-State: AOAM531NgGHpCw5go4ToOcczboZMPuTik4zOMEdP4Kfwx1W7XKU2C7KA
        2FvkD1VkWQvIblTQP/eGVmg=
X-Google-Smtp-Source: ABdhPJz1Mlg0eAOD32JMWR2WMKYeKNzpRkw69ip/DP7QXNbIv4GGjdUOCaSeUBQA7UTM0WGbLKTLMQ==
X-Received: by 2002:a1c:dd89:: with SMTP id u131mr22674649wmg.54.1615758916146;
        Sun, 14 Mar 2021 14:55:16 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.208.22])
        by smtp.gmail.com with ESMTPSA id v18sm16996088wru.85.2021.03.14.14.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Mar 2021 14:55:15 -0700 (PDT)
Subject: Re: [PATCH 1/1] media: i2c: Add support for ov5693 sensor
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        dongchun.zhu@mediatek.com, tian.shu.qiu@intel.com,
        luzmaximilian@gmail.com, me@fabwu.ch,
        jeanmichel.hautbois@ideasonboard.com, kitakar@gmail.com,
        jorhand@linux.microsoft.com
References: <20210312103239.279523-1-djrscally@gmail.com>
 <20210312103239.279523-2-djrscally@gmail.com>
 <20210314104058.7oj4bfbnadgelys3@uno.localdomain>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <0f03163b-7713-ab4b-3d4a-2d6e9b373f5a@gmail.com>
Date:   Sun, 14 Mar 2021 21:55:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210314104058.7oj4bfbnadgelys3@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo, thanks for the review

On 14/03/2021 10:40, Jacopo Mondi wrote:
>> +#define OV5693_REG_CHIP_ID_H			0x300A
>> +#define OV5693_REG_CHIP_ID_L			0x300B
> Please use lower case letters in hex identifiers


Will do

>> +
>> +/* Miscellaneous */
>> +#define OV5693_NUM_MBUS_FMTS			1
> Nit: Only used in one place, maybe could be removed


Okedokey

>> +#define OV5693_NUM_RESOLUTIONS		ARRAY_SIZE(ov5693_resolutions)
>> +struct ov5693_resolution ov5693_resolutions[] = {
>> +	{
>> +		.desc = "ov5693_2592x1944_30fps",
>> +		.fps = 30,
>> +
>> +		.crop_start_x = 16,
>> +		.offset_x = 0,
>> +		.output_size_x = 2592,
>> +		.crop_end_x = 2608,
>> +		.hts = 2688,
> Aren't the crop information here duplicated in the .crop field ? Do
> you need to have them separate ?


They don't need to separate, but I wonder if it's a bit confusing
because only crop.left and crop.top can be used. We couldn't draw the
output sizes from crop.width or crop.height because those values are
pre-scaling/binning. So it just seemed a bit clearer to treat them
separately.


>> +
>> +		.crop_start_y = 6,
>> +		.offset_y = 0,
>> +		.output_size_y = 1944,
>> +		.crop_end_y = 1950,
>> +		.vts = 1984,
>> +
>> +		.inc_x_odd = 1,
>> +		.inc_x_even = 1,
>> +		.inc_y_odd = 1,
>> +		.inc_y_even = 1,
>> +
>> +		.crop = {
>> +			.left = 16,
>> +			.top = 6,
>> +			.width = 2592,
>> +			.height = 1944
>> +		},
>> +	},
>> +	{
>> +		.desc = "ov5693_1920x1080_30fps",
> What's desc used for ?


Actually it's a leftover from the atomisp version that I've been using
as a handy label...it never even crossed my mind to change it. But it
should be a comment of course, I'll swap to that.

>> +static int ov5693_update_bits(struct ov5693_device *ov5693, u16 address,
>> +			      u16 mask, u16 bits)
>> +{
>> +	u8 value = 0;
>> +	int ret;
>> +
>> +	ret = ov5693_read_reg(ov5693, address, &value);
>> +	if (ret)
>> +		return ret;
>> +
>> +	value &= ~mask;
>> +	value |= bits;
>> +
>> +	ov5693_write_reg(ov5693, address, value, &ret);
> Shouldn't ret be initialized to 0 ?


Isn't that done by the return of ov5693_read_reg()?

>
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
> You can just return ret I guess


Oops, yes. Thanks

>
>> +}
>> +
>> +/* V4L2 Controls Functions */
>> +
>> +static int ov5693_flip_vert_configure(struct ov5693_device *ov5693, bool enable)
>> +{
>> +	u8 bits = OV5693_FORMAT1_FLIP_VERT_ISP_EN |
>> +		  OV5693_FORMAT1_FLIP_VERT_SENSOR_EN;
>> +	int ret;
>> +
>> +	ret = ov5693_update_bits(ov5693, OV5693_FORMAT1_REG, bits,
>> +				 enable ? bits : 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ov5693_flip_horz_configure(struct ov5693_device *ov5693, bool enable)
>> +{
>> +	u8 bits = OV5693_FORMAT2_FLIP_HORZ_ISP_EN |
>> +		  OV5693_FORMAT2_FLIP_HORZ_SENSOR_EN;
>> +	int ret;
>> +
>> +	ret = ov5693_update_bits(ov5693, OV5693_FORMAT2_REG, bits,
>> +				 enable ? bits : 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ov5693_get_exposure(struct ov5693_device *ov5693, s32 *value)
>> +{
> Out of curiosity, what's the unit of the exposure for this chip ?


1/16ths of a line, but the 4 fractional bits are unsupported, so
effectively in units of lines.


>> +	u8 exposure_hh = 0, exposure_h = 0, exposure_l = 0;
>> +	int ret;
>> +
>> +	ret = ov5693_read_reg(ov5693, OV5693_EXPOSURE_L_CTRL_HH_REG, &exposure_hh);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ov5693_read_reg(ov5693, OV5693_EXPOSURE_L_CTRL_H_REG, &exposure_h);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ov5693_read_reg(ov5693, OV5693_EXPOSURE_L_CTRL_L_REG, &exposure_l);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* The lowest 4 bits are unsupported fractional bits */
>> +	*value = ((exposure_hh << 16) | (exposure_h << 8) | exposure_l) >> 4;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ov5693_exposure_configure(struct ov5693_device *ov5693, u32 exposure)
>> +{
>> +	int ret = 0;
> No intialization required here, it will be overwritten below.


Thanks


>> +
>> +	gpiod_set_value_cansleep(ov5693->reset, 1);
>> +	gpiod_set_value_cansleep(ov5693->powerdown, 1);
>> +
>> +	ret = clk_prepare_enable(ov5693->clk);
>> +	if (ret) {
>> +		dev_err(ov5693->dev, "Failed to enable clk\n");
>> +		goto fail_power;
>> +	}
>> +
>> +	ret = regulator_bulk_enable(OV5693_NUM_SUPPLIES, ov5693->supplies);
>> +	if (ret) {
>> +		dev_err(ov5693->dev, "Failed to enable regulators\n");
>> +		goto fail_power;
>> +	}
>> +
>> +	gpiod_set_value_cansleep(ov5693->reset, 0);
>> +	gpiod_set_value_cansleep(ov5693->powerdown, 0);
> I would release powerdown first then reset


OK, I'll switch to that.

>> +
>> +	usleep_range(20000, 25000);
> Quite a long delay, does the chip manual quantify it ?


No actually, it's 8192 xvclk cycles - I increased this whilst debugging
something and and forgot to change it back. I'll drop it down.


> +static int ov5693_set_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_pad_config *cfg,
> +			  struct v4l2_subdev_format *format)
> +{
> +	struct ov5693_device *ov5693 = to_ov5693_sensor(sd);
> +	const struct ov5693_resolution *mode;
> +	int exposure_max;
> +	int ret = 0;
> +	int hblank;
> +
> +	if (format->pad)
> +		return -EINVAL;
> The core checks this for you


Ah - TIL, thanks.

>> +
>> +	mutex_lock(&ov5693->lock);
>> +
>> +	mode = v4l2_find_nearest_size(ov5693_resolutions,
>> +				      OV5693_NUM_RESOLUTIONS, output_size_x,
>> +				      output_size_y, format->format.width,
>> +				      format->format.height);
>> +
>> +	if (!mode)
>> +		return -EINVAL;
> Bailing out without releseing the mutex ?
> I would actually only lock when V4L2_SUBDEV_FORMAT_ACTIVE ...


Ah whoops, sorry. Yes that's a good idea, I'll do that.


>> +	ov5693->mode = mode;
>> +
>> +	/* Update limits and set FPS to default */
>> +	__v4l2_ctrl_modify_range(ov5693->ctrls.vblank,
>> +				 OV5693_TIMING_MIN_VTS,
>> +				 OV5693_TIMING_MAX_VTS - mode->output_size_y,
>> +				 1, mode->vts - mode->output_size_y);
>> +	__v4l2_ctrl_s_ctrl(ov5693->ctrls.vblank,
>> +			   mode->vts - mode->output_size_y);
>> +
>> +	hblank = mode->hts - mode->output_size_x;
>> +	__v4l2_ctrl_modify_range(ov5693->ctrls.hblank, hblank, hblank, 1,
>> +				 hblank);
> Aren't there any VTS or HTS margins for this chip ?


Not that I'm aware of, but it could easily simply be me not
understanding something. I assume you're referring to something like the
minimum VTS defined for modes in some drivers, like the ov5670 [2]:


    {
        .width = 1296,
        .height = 972,
        .vts_def = OV5670_VTS_30FPS,
        .vts_min = 996,
        .reg_list = {
            .num_of_regs = ARRAY_SIZE(mode_1296x972_regs),
            .regs = mode_1296x972_regs,
        },
        .link_freq_index = OV5670_LINK_FREQ_422MHZ_INDEX,
    },


Right? I thought they just reflected what the author saw as sensible
minimums rather than a hardware limitation or anything.

>
>> +
>> +	exposure_max = mode->vts - OV5693_INTEGRATION_TIME_MARGIN;
>> +	__v4l2_ctrl_modify_range(ov5693->ctrls.exposure,
>> +				 ov5693->ctrls.exposure->minimum, exposure_max,
>> +				 ov5693->ctrls.exposure->step,
>> +				 ov5693->ctrls.exposure->val < exposure_max ?
>> +				 ov5693->ctrls.exposure->val : exposure_max);
> min(ov5693->ctrls.exposure->val, exposure_max) ?


Hah derp, of course. That was silly - thanks!


>> +static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
>> +{
>> +	struct ov5693_device *ov5693 = to_ov5693_sensor(sd);
>> +	int ret;
>> +
>> +	if (enable) {
>> +		ret = pm_runtime_get_sync(ov5693->dev);
>> +		if (ret < 0)
>> +			goto err_power_down;
>> +	}
>> +
>> +	ret = __v4l2_ctrl_handler_setup(&ov5693->ctrls.handler);
> Do you want this when !enable ?


No I guess not, good point - thanks


>> +	if (ret)
>> +		goto err_power_down;
>> +
>> +	mutex_lock(&ov5693->lock);
>> +	ret = ov5693_sw_standby(ov5693, !enable);
> if this fail the ov5693->streaming flag should probably not be updated


It shouldn't be right? It has the goto err_power_down below.

>
>> +	mutex_unlock(&ov5693->lock);
>> +
>> +	if (ret)
>> +		goto err_power_down;
>> +	ov5693->streaming = !!enable;
>> +
>> +	if (!enable)
>> +		pm_runtime_put(ov5693->dev);
>> +
>> +	return 0;
>> +err_power_down:
>> +	pm_runtime_put_noidle(ov5693->dev);
>> +	return ret;
>> +}
>> +
>> +/* Sensor and Driver Configuration Functions */
>> +
>> +static int ov5693_init_controls(struct ov5693_device *ov5693)
>> +{
>> +	const struct v4l2_ctrl_ops *ops = &ov5693_ctrl_ops;
>> +	struct v4l2_fwnode_device_properties props;
>> +	int vblank_max, vblank_def;
>> +	int exposure_max;
>> +	int hblank;
>> +	int ret;
>> +
>> +	ret = v4l2_ctrl_handler_init(&ov5693->ctrls.handler, 14);
> I do count 10 controls, am I mistkaen ?


12, v4l2_ctrl_new_fwnode_properties() creates rotation and orientation
controls. I'll drop to that.

>> +static int ov5693_probe(struct i2c_client *client)
>> +{
>> +	struct fwnode_handle *fwnode = dev_fwnode(&client->dev);
>> +	struct fwnode_handle *endpoint;
>> +	struct ov5693_device *ov5693;
>> +	u32 clk_rate;
>> +	int ret = 0;
>> +
>> +	endpoint = fwnode_graph_get_next_endpoint(fwnode, NULL);
>> +	if (!endpoint && !IS_ERR_OR_NULL(fwnode->secondary))
>> +		endpoint = fwnode_graph_get_next_endpoint(fwnode->secondary, NULL);
>> +	if (!endpoint)
>> +		return -EPROBE_DEFER;
> mmm, if the endpoint is not specified in firmware it's an
> unrecoverable error, deplaying probe won't help ? Or is this due to
> the 'secondary' (which I'm not actually sure what it represents :)


Not so unrecoverable any more; the ipu3-cio2 driver can now build
endpoints from software nodes [1], which is what's happening for the
Microsoft Surface devices. The sensor driver can actually probe fine
before the ipu3-cio2 one, but in that case because the firmware node
properties won't have been created yet,
v4l2_ctrl_new_fwnode_properties() can't create the rotation and
orientation controls from them. So that's why it defers, to give
ipu3-cio2 time to probe.


I think it's probably better to extend fwnode_graph_get_next_endpoint()
to do the check of fwnode->secondary though in retrospect.

>> +
>> +	ov5693 = devm_kzalloc(&client->dev, sizeof(*ov5693), GFP_KERNEL);
>> +	if (!ov5693)
>> +		return -ENOMEM;
>> +
>> +	ov5693->client = client;
>> +	ov5693->dev = &client->dev;
>> +
>> +	mutex_init(&ov5693->lock);
>> +
>> +	v4l2_i2c_subdev_init(&ov5693->sd, client, &ov5693_ops);
>> +
>> +	ov5693->clk = devm_clk_get(&client->dev, "xvclk");
>> +	if (IS_ERR(ov5693->clk)) {
>> +		dev_err(&client->dev, "Error getting clock\n");
>> +		return PTR_ERR(ov5693->clk);
>> +	}
>> +
>> +	clk_rate = clk_get_rate(ov5693->clk);
>> +	if (clk_rate != OV5693_XVCLK_FREQ) {
>> +		dev_err(&client->dev, "Unsupported clk freq %u, expected %u\n",
>> +			clk_rate, OV5693_XVCLK_FREQ);
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = ov5693_configure_gpios(ov5693);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ov5693_get_regulators(ov5693);
>> +	if (ret) {
>> +		dev_err(&client->dev, "Error fetching regulators\n");
>> +		return ret;
>> +	}
>> +
>> +	ov5693->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +	ov5693->pad.flags = MEDIA_PAD_FL_SOURCE;
>> +	ov5693->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>> +	ov5693->mode = &ov5693_resolutions[OV5693_NUM_RESOLUTIONS - 1];
>> +
>> +	ret = ov5693_init_controls(ov5693);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = media_entity_pads_init(&ov5693->sd.entity, 1, &ov5693->pad);
>> +	if (ret)
>> +		goto err_ctrl_handler_free;
>> +
>> +	/*
>> +	 * We need the driver to work in the event that pm runtime is disable in
>> +	 * the kernel, so power up and verify the chip now. In the event that
>> +	 * runtime pm is disabled this will leave the chip on, so that streaming
>> +	 * will work.
>> +	 */
>> +
>> +	ret = ov5693_sensor_powerup(ov5693);
>> +	if (ret)
>> +		goto err_media_entity_cleanup;
>> +
>> +	ret = ov5693_detect(ov5693);
>> +	if (ret)
>> +		goto err_powerdown;
>> +
>> +	pm_runtime_set_active(&client->dev);
>> +	pm_runtime_get_noresume(&client->dev);
>> +	pm_runtime_enable(&client->dev);
>> +
>> +	ret = v4l2_async_register_subdev_sensor_common(&ov5693->sd);
>> +	if (ret) {
>> +		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
>> +			ret);
>> +		goto err_pm_runtime;
>> +	}
>> +
>> +	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
>> +	pm_runtime_use_autosuspend(&client->dev);
>> +	pm_runtime_put_autosuspend(&client->dev);
> This sequence smells funny to me, but that's maybe beacuse of the
> usage of v4l2_async_register_subdev_sensor_common(). And it's anyway
> the same as in the CCS driver, so I assume it's ok


I also assume it's ok, on the grounds that it's on Laurent's advice :D


>> +
>> +	return ret;
>> +
>> +err_pm_runtime:
>> +	pm_runtime_disable(&client->dev);
>> +	pm_runtime_put_noidle(&client->dev);
>> +err_powerdown:
>> +	ov5693_sensor_powerdown(ov5693);
>> +err_media_entity_cleanup:
>> +	media_entity_cleanup(&ov5693->sd.entity);
>> +err_ctrl_handler_free:
>> +	v4l2_ctrl_handler_free(&ov5693->ctrls.handler);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ov5693_remove(struct i2c_client *client)
>> +{
>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>> +	struct ov5693_device *ov5693 = to_ov5693_sensor(sd);
>> +
>> +	v4l2_async_unregister_subdev(sd);
>> +	media_entity_cleanup(&ov5693->sd.entity);
>> +	v4l2_ctrl_handler_free(&ov5693->ctrls.handler);
>> +	mutex_destroy(&ov5693->lock);
>> +
>> +	/*
>> +	 * Disable runtime PM. In case runtime PM is disabled in the kernel,
>> +	 * make sure to turn power off manually.
>> +	 */
>> +	pm_runtime_disable(&client->dev);
>> +	if (!pm_runtime_status_suspended(&client->dev))
>> +		ov5693_sensor_powerdown(ov5693);
>> +	pm_runtime_set_suspended(&client->dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct dev_pm_ops ov5693_pm_ops = {
>> +	SET_RUNTIME_PM_OPS(ov5693_sensor_suspend, ov5693_sensor_resume, NULL)
>> +};
>> +
>> +static const struct acpi_device_id ov5693_acpi_match[] = {
>> +	{"INT33BE"},
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(acpi, ov5693_acpi_match);
>> +
>> +static struct i2c_driver ov5693_driver = {
>> +	.driver = {
>> +		.name = "ov5693",
>> +		.acpi_match_table = ov5693_acpi_match,
>> +		.pm = &ov5693_pm_ops,
>> +	},
>> +	.probe_new = ov5693_probe,
>> +	.remove = ov5693_remove,
>> +};
>> +module_i2c_driver(ov5693_driver);
>> +
>> +MODULE_DESCRIPTION("A low-level driver for OmniVision 5693 sensors");
>> +MODULE_LICENSE("GPL");
> Maybe you want MODULE_AUTHOR too ?


I was going to just leave it as the "contributions by" comment at the top

>
> Questions for maintainers, drivers for sensors developed with ACPI
> support do not need bindings, right ?
>
> Mostly minor comments though, the driver looks good to me, and with
> minor fixes addressed you can add
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>


Thanks! Much appreciated.

>
> Thanks
>    j
>
>> --
>> 2.25.1
>>

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=803abec64ef9d31ba068088e90fc20556ab5f605

[2]
https://elixir.bootlin.com/linux/latest/source/drivers/media/i2c/ov5670.c#L1751

