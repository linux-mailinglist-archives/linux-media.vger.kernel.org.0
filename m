Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73C684132CE
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 13:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232228AbhIULt2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 07:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231778AbhIULt1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 07:49:27 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11193C061574
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 04:47:59 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id d21so38227282wra.12
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 04:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=K+FeIFeIbZJLbVAsu9iSEgmfWKA1XoWyw94m5ZuuPXQ=;
        b=MK0BbwnvHQWxpmUxUEaV2f30v+OSmZhKMI4K4aFRwiG1z5F6f4+0XsGa6Vl2ETMBe3
         PuaZfcB/K0hhbebfY6DFnIw3xyLq1o/TPwKcJNfSLIejUWPg0mnWowyD0GSHHJHi8PoO
         U5T55Grz4p3hiw7j+6FFjkUseOTCYBviSnvgCtQTz5htjkV0glG0HUiNqj2j786mPjsV
         4M7HxuEJkM0/gR7MScqtMT/gWNrrNPnhveSeKl0FgdgWvGk+ueE7dEiSOUuBauFtDA0l
         FdDu0tHfTbp/5ZSL/0kocoW4TSAfub1unfLikJE6MwvIsYtPPsRVJ/r5HQN+OoPao7/7
         MDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=K+FeIFeIbZJLbVAsu9iSEgmfWKA1XoWyw94m5ZuuPXQ=;
        b=GFeHyMhRes25MoTfUzV6mkm59js2QKUA6w8OolUYdDx0O9ihlLD90wLLDd0JSXvJKx
         YlUj1YzgXv2VGL3VMYFSfL93djJvn6zzeg98w2yDd87wjDQAnYc7iQPGzFLQn5Ba8NDi
         rV+koKclLZHV3NI8gbXaZPDPzIqd87/DSPSmkWIdzSZP+fE5S7X8qV3Pt+jqy332v7c/
         iNxSqtG8HpE3r3fgdkeBmokanFm8dyKHKpiZQB/6822hYzr0RN07SiNcKm+xDhEIQEIK
         aORv8rxLRamGfNqLwwqAtV9pJF96e6IUSGzSfn3D9Pf45E0+qAmMTQpsncwnDvu8bS9K
         4QAg==
X-Gm-Message-State: AOAM533ZgvCboPI/KJYcTNepYam85/53LhbXXe4+5CNORuRX6ZbPKLTU
        PB18qin9ia6tfEc9Ese3Wd8=
X-Google-Smtp-Source: ABdhPJzuIckFV4LvQK6VULmC+NnqfkySpJl+JWTY+XI3SOY863y/27bPaTSHUChCtqAhZ5aMVxivuA==
X-Received: by 2002:a5d:67c8:: with SMTP id n8mr34089349wrw.122.1632224877514;
        Tue, 21 Sep 2021 04:47:57 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id y197sm3061405wmc.18.2021.09.21.04.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 04:47:57 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] media: i2c: Add support for ov5693 sensor
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kieran.bingham@ideasonboard.com,
        jeanmichel.hautbois@ideasonboard.com
References: <20210920225422.42618-1-djrscally@gmail.com>
 <20210920225422.42618-3-djrscally@gmail.com>
 <YUmhuYiFoSL21bj4@paasikivi.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <6fda38af-2556-4796-b3c5-a80a864466f4@gmail.com>
Date:   Tue, 21 Sep 2021 12:47:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUmhuYiFoSL21bj4@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On 21/09/2021 10:11, Sakari Ailus wrote:
> Hi Daniel,
>
> Thanks for the patch.
>
> On Mon, Sep 20, 2021 at 11:54:22PM +0100, Daniel Scally wrote:
>> The OV5693 is a 5 Mpx CMOS image sensor, connected via MIPI CSI-2. The
>> chip is capable of a single lane configuration, but currently only two
>> lanes are supported.
>>
>> Most of the sensor's features are supported, with the main exception
>> being the lens correction algorithm.
>>
>> The driver provides all mandatory, optional and recommended V4L2 controls
>> for maximum compatibility with libcamera.
>>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>>  MAINTAINERS                |    7 +
>>  drivers/media/i2c/Kconfig  |   11 +
>>  drivers/media/i2c/Makefile |    1 +
>>  drivers/media/i2c/ov5693.c | 1558 ++++++++++++++++++++++++++++++++++++
>>  4 files changed, 1577 insertions(+)
>>  create mode 100644 drivers/media/i2c/ov5693.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ca6d6fde85cf..83b4523ef899 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -13855,6 +13855,13 @@ S:	Maintained
>>  T:	git git://linuxtv.org/media_tree.git
>>  F:	drivers/media/i2c/ov5675.c
>>  
>> +OMNIVISION OV5693 SENSOR DRIVER
>> +M:	Daniel Scally <djrscally@gmail.com>
>> +L:	linux-media@vger.kernel.org
>> +S:	Maintained
>> +T:	git git://linuxtv.org/media_tree.git
>> +F:	drivers/media/i2c/ov5693.c
>> +
>>  OMNIVISION OV5695 SENSOR DRIVER
>>  M:	Shunqian Zheng <zhengsq@rock-chips.com>
>>  L:	linux-media@vger.kernel.org
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index 08feb3e8c1bf..82d5c9b7f540 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -1042,6 +1042,17 @@ config VIDEO_OV5675
>>  	  To compile this driver as a module, choose M here: the
>>  	  module will be called ov5675.
>>  
>> +config VIDEO_OV5693
>> +	tristate "OmniVision OV5693 sensor support"
>> +	depends on I2C && VIDEO_V4L2
>> +	select V4L2_FWNODE
>> +	help
>> +	  This is a Video4Linux2 sensor driver for the OmniVision
>> +	  OV5693 camera.
>> +
>> +	  To compile this driver as a module, choose M here: the
>> +	  module will be called ov5693.
>> +
>>  config VIDEO_OV5695
>>  	tristate "OmniVision OV5695 sensor support"
>>  	depends on I2C && VIDEO_V4L2
>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>> index 83268f20aa3a..6b910ba2dde2 100644
>> --- a/drivers/media/i2c/Makefile
>> +++ b/drivers/media/i2c/Makefile
>> @@ -75,6 +75,7 @@ obj-$(CONFIG_VIDEO_OV5647) += ov5647.o
>>  obj-$(CONFIG_VIDEO_OV5648) += ov5648.o
>>  obj-$(CONFIG_VIDEO_OV5670) += ov5670.o
>>  obj-$(CONFIG_VIDEO_OV5675) += ov5675.o
>> +obj-$(CONFIG_VIDEO_OV5693) += ov5693.o
>>  obj-$(CONFIG_VIDEO_OV5695) += ov5695.o
>>  obj-$(CONFIG_VIDEO_OV6650) += ov6650.o
>>  obj-$(CONFIG_VIDEO_OV7251) += ov7251.o
>> diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
>> new file mode 100644
>> index 000000000000..1e5c465112c5
>> --- /dev/null
>> +++ b/drivers/media/i2c/ov5693.c
>> @@ -0,0 +1,1558 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2013 Intel Corporation. All Rights Reserved.
> Are there any other copyrights? I'm just noting this, not necessarily
> requesting them.


Not to my knowledge; the Intel one is inherited from the atomisp-ov5693
driver, nobody else involved has mentioned it to me.

>
>> + *
>> + * Adapted from the atomisp-ov5693 driver, with contributions from:
>> + *
>> + * Daniel Scally
>> + * Jean-Michel Hautbois
>> + * Fabian Wuthrich
>> + * Tsuchiya Yuto
>> + * Jordan Hand
>> + * Jake Day
> Well done!


Thanks!

> +
> +static int ov5693_get_exposure(struct ov5693_device *ov5693, s32 *value)
> +{
> +	u8 exposure_hh = 0, exposure_h = 0, exposure_l = 0;
> +	int ret;
> +
> +	ret = ov5693_read_reg(ov5693, OV5693_EXPOSURE_L_CTRL_HH_REG, &exposure_hh);
> +	if (ret)
> +		return ret;
> +
> +	ret = ov5693_read_reg(ov5693, OV5693_EXPOSURE_L_CTRL_H_REG, &exposure_h);
> +	if (ret)
> +		return ret;
> +
> +	ret = ov5693_read_reg(ov5693, OV5693_EXPOSURE_L_CTRL_L_REG, &exposure_l);
> +	if (ret)
> +		return ret;
> Does the sensor not allow reading this register as a single operation?
>
> Just a question. Some sensors from the vendor do not. Same for the writes.


It does; if I'm honest I just preferred the individual read/writes. I
find it's easier to see exactly what's going on. Happy to change it if
you prefer though - it's less important now that the work is mostly done.

>> +static int ov5693_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +	struct ov5693_device *ov5693 =
>> +	    container_of(ctrl->handler, struct ov5693_device, ctrls.handler);
> Tab for indentation, please. And wrap if needed to stay under 80.


Ack

>> +};
>> +
>> +/* System Control Functions */
>> +
>> +static int ov5693_mode_configure(struct ov5693_device *ov5693)
>> +{
>> +	const struct ov5693_mode *mode = &ov5693->mode;
>> +	int ret = 0;
>> +
>> +	/* Crop Start X */
>> +	ov5693_write_reg(ov5693, OV5693_CROP_START_X_H_REG,
>> +			 OV5693_CROP_START_X_H(mode->crop.left), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_CROP_START_X_L_REG,
>> +			 OV5693_CROP_START_X_L(mode->crop.left), &ret);
>> +
>> +	/* Offset X */
>> +	ov5693_write_reg(ov5693, OV5693_OFFSET_START_X_H_REG,
>> +			 OV5693_OFFSET_START_X_H(0), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_OFFSET_START_X_L_REG,
>> +			 OV5693_OFFSET_START_X_L(0), &ret);
>> +
>> +	/* Output Size X */
>> +	ov5693_write_reg(ov5693, OV5693_OUTPUT_SIZE_X_H_REG,
>> +			 OV5693_OUTPUT_SIZE_X_H(mode->format.width), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_OUTPUT_SIZE_X_L_REG,
>> +			 OV5693_OUTPUT_SIZE_X_L(mode->format.width), &ret);
>> +
>> +	/* Crop End X */
>> +	ov5693_write_reg(ov5693, OV5693_CROP_END_X_H_REG,
>> +			 OV5693_CROP_END_X_H(mode->crop.left + mode->crop.width),
>> +			 &ret);
>> +	ov5693_write_reg(ov5693, OV5693_CROP_END_X_L_REG,
>> +			 OV5693_CROP_END_X_L(mode->crop.left + mode->crop.width),
>> +			 &ret);
>> +
>> +	/* Horizontal Total Size */
>> +	ov5693_write_reg(ov5693, OV5693_TIMING_HTS_H_REG,
>> +			 OV5693_TIMING_HTS_H(OV5693_FIXED_PPL), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_TIMING_HTS_L_REG,
>> +			 OV5693_TIMING_HTS_L(OV5693_FIXED_PPL), &ret);
>> +
>> +	/* Crop Start Y */
>> +	ov5693_write_reg(ov5693, OV5693_CROP_START_Y_H_REG,
>> +			 OV5693_CROP_START_Y_H(mode->crop.top), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_CROP_START_Y_L_REG,
>> +			 OV5693_CROP_START_Y_L(mode->crop.top), &ret);
>> +
>> +	/* Offset Y */
>> +	ov5693_write_reg(ov5693, OV5693_OFFSET_START_Y_H_REG,
>> +			 OV5693_OFFSET_START_Y_H(0), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_OFFSET_START_Y_L_REG,
>> +			 OV5693_OFFSET_START_Y_L(0), &ret);
>> +
>> +	/* Output Size Y */
>> +	ov5693_write_reg(ov5693, OV5693_OUTPUT_SIZE_Y_H_REG,
>> +			 OV5693_OUTPUT_SIZE_Y_H(mode->format.height), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_OUTPUT_SIZE_Y_L_REG,
>> +			 OV5693_OUTPUT_SIZE_Y_L(mode->format.height), &ret);
>> +
>> +	/* Crop End Y */
>> +	ov5693_write_reg(ov5693, OV5693_CROP_END_Y_H_REG,
>> +			 OV5693_CROP_END_Y_H(mode->crop.top + mode->crop.height),
>> +			 &ret);
>> +	ov5693_write_reg(ov5693, OV5693_CROP_END_Y_L_REG,
>> +			 OV5693_CROP_END_Y_L(mode->crop.top + mode->crop.height),
>> +			 &ret);
>> +
>> +	/* Vertical Total Size */
>> +	ov5693_write_reg(ov5693, OV5693_TIMING_VTS_H_REG,
>> +			 OV5693_TIMING_VTS_H(mode->vts), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_TIMING_VTS_L_REG,
>> +			 OV5693_TIMING_VTS_L(mode->vts), &ret);
> ov5693_vts_configure() does write the same registers. Why is it being done
> here, too?


Ah, yes. And ov5693_vts_configure() will get called by
__v4l2_ctrl_handler_setup() in ov5693_s_stream(), so you're right that's
superfluous. I'll remove it, thanks.


> That said, it's very nice the driver does more than just rely on plain
> register lists.


Laurent's influence (and patience) :)

> +}
> +
> +static int ov5693_probe(struct i2c_client *client)
> +{
> +	struct fwnode_handle *fwnode = dev_fwnode(&client->dev);
> +	struct fwnode_handle *endpoint;
> +	struct ov5693_device *ov5693;
> +	u32 clk_rate;
> +	int ret = 0;
> +
> +	endpoint = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (!endpoint && !IS_ERR_OR_NULL(fwnode->secondary))
> +		endpoint = fwnode_graph_get_next_endpoint(fwnode->secondary, NULL);
> I think this should be done by fwnode_graph_get_next_endpoint() instead.


Argh; sorry. It actually _is_ done by fwnode_graph_get_next_endpoint(),
I patched it [1] a little while ago and then forgot to update this
driver. That patch went into v5.15-rc1 - I'll update this driver.


> There seem to be a large number of lines over 80 chars per line, for no
> apparent reason. Please wrap when it's feasible to do so.


I'll do a pass through and clean them up

>
>> +	if (!endpoint)
>> +		return -EPROBE_DEFER;
> Where is the endpoint put?
>
> I know this is does nothing on ACPI but fwnode-API-wise it does matter.


Ah, it's not - my bad. Thanks

>
> Where do you get the bus parameters, including link frequencies (that do
> not seem to be validated in any way at the moment)?


Nowhere currently, I'll add a section to fetch and validate.

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
> There's been discussion on this and I think the current best practice is
> seen to be to warn, but still proceed. Sometimes there are slight
> differences from the intended frequency but it's hard to say how much
> tolerance there really is.


OK, no problem. I'll switch to doing that.

>
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
>> +
>> +	ov5693->mode.crop = ov5693_default_crop;
>> +	ov5693->mode.format = ov5693_default_fmt;
>> +	ov5693->mode.vts = __ov5693_calc_vts(ov5693->mode.format.height);
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
>> +	ret = v4l2_async_register_subdev_sensor(&ov5693->sd);
>> +	if (ret) {
>> +		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
>> +			ret);
>> +		goto err_pm_runtime;
>> +	}
>> +
>> +	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
>> +	pm_runtime_use_autosuspend(&client->dev);
>> +	pm_runtime_put_autosuspend(&client->dev);
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
> MODULE_AUTHOR(), maybe?


[1] https://lore.kernel.org/all/20210806220906.326758-2-djrscally@gmail.com/

>
