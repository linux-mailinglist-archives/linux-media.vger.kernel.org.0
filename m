Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFE27493CC0
	for <lists+linux-media@lfdr.de>; Wed, 19 Jan 2022 16:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355336AbiASPO5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jan 2022 10:14:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355311AbiASPOz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jan 2022 10:14:55 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92306C061574
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 07:14:54 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id c66so5585178wma.5
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 07:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=HoCeV+fz1xm11cH46LqDjmJJcdOPkzqxB6zzq+apyX8=;
        b=BJUxwMUp3XKE59kVYD9aYqnyAKsSbI51/d/aEDlGcJe8H18TjGRtVZtHb5BaWSeH7W
         YBN82UXt3bXEtckLu0tdQDxBpnwB2HgdX0DpZo9eYSh/f/puCpU9rLMuhIaZ+/jtCPPd
         U7uU2gSsIRTsCL5xdHyva3I13v5FyerS2BieEeN81MRxca7ZjYwDTd8SgUBp3QQMu8yc
         KyKS50uDtz/cIWwyVr8gRTc0uLvh+Cu5CTjTbufMpFxql/U0RmOFtbSLS+tJs0zFHhvu
         kJyviJYwcQeK+UmoxxdYq5ezuo6J75wnHoV7EvdoUiVamLbAkJ1HdLBNhgjwBelWLFi1
         0/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HoCeV+fz1xm11cH46LqDjmJJcdOPkzqxB6zzq+apyX8=;
        b=jfwUK2Z7XZkXcEdPDgb8tNePFlSflxYfxMn52nz3jidx94g9GBwhIIlNbDPVOfsGU0
         l8cQT25Qux5vnvEET/QrCuY/HTuWZb6QlajTzsLbR2f3ZLM01hwK2JBb/WEFSYY4v4Qg
         WK7IwSVx7Q4+SFd+WFi6ci3nqzASqvSfrT69bszFIVCyBLAQZxLYmNphrdZDSqHzI6yS
         Mlv9411X7N1UlV3Kxhx4Tv47qN28+7mTwDTHuuQPlvXo19MBIlzcXDxeIOIiUaCZYy0q
         oeaWift+Hw6mBUb/u3X+AJ18KNl/zb/lcd0mxgrWKyqjnNrGE9mueVNgAk8D3OfMcPAh
         17yg==
X-Gm-Message-State: AOAM532gE0X2SDYekjBUzUDkMhl4DHvw63aXx/IZYhIQWsfnzhyQo3zp
        SpKXVDtG1D5ex8Vknkgsmfk=
X-Google-Smtp-Source: ABdhPJwRPSiBNXjShHjJCnkg74i6afvGJTsOKXzCZ5I26YcyCk/OSSmo5vZ5YqCTguZ9ppHMMJOpBQ==
X-Received: by 2002:a5d:564b:: with SMTP id j11mr8561379wrw.527.1642605293011;
        Wed, 19 Jan 2022 07:14:53 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id l13sm133146wry.87.2022.01.19.07.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jan 2022 07:14:52 -0800 (PST)
Subject: Re: [PATCH] media: i2c: Add driver for DW9719 VCM
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hdegoede@redhat.com,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
References: <20211128232115.38833-1-djrscally@gmail.com>
 <YegBuoyPYXDJ7ncN@paasikivi.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <0c66f9d0-5f52-cda1-f356-e04e0b166677@gmail.com>
Date:   Wed, 19 Jan 2022 15:14:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YegBuoyPYXDJ7ncN@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On 19/01/2022 12:19, Sakari Ailus wrote:
> Hi Daniel,
>
> Apologies for the late review.


No problem at all - thanks for taking a look

> On Sun, Nov 28, 2021 at 11:21:15PM +0000, Daniel Scally wrote:
>> Add a driver for the DW9719 VCM. The driver creates a v4l2 subdevice
>> and registers a control to set the desired focus.
>>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>>  MAINTAINERS                |   7 +
>>  drivers/media/i2c/Kconfig  |  11 +
>>  drivers/media/i2c/Makefile |   1 +
>>  drivers/media/i2c/dw9719.c | 427 +++++++++++++++++++++++++++++++++++++
>>  4 files changed, 446 insertions(+)
>>  create mode 100644 drivers/media/i2c/dw9719.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 6e0763ff55db..99d2bc961bc0 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -5789,6 +5789,13 @@ T:	git git://linuxtv.org/media_tree.git
>>  F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.txt
>>  F:	drivers/media/i2c/dw9714.c
>>  
>> +DONGWOON DW9719 LENS VOICE COIL DRIVER
>> +M:	Daniel Scally <djrscally@gmail.com>
>> +L:	linux-media@vger.kernel.org
>> +S:	Maintained
>> +T:	git git://linuxtv.org/media_tree.git
>> +F:	drivers/media/i2c/dw9719.c
>> +
>>  DONGWOON DW9768 LENS VOICE COIL DRIVER
>>  M:	Dongchun Zhu <dongchun.zhu@mediatek.com>
>>  L:	linux-media@vger.kernel.org
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index 8761a90a7a86..096c9be6c402 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -1465,6 +1465,17 @@ config VIDEO_DW9714
>>  	  capability. This is designed for linear control of
>>  	  voice coil motors, controlled via I2C serial interface.
>>  
>> +config VIDEO_DW9719
>> +	tristate "DW9719 lens voice coil support"
>> +	depends on I2C && VIDEO_V4L2
>> +	select MEDIA_CONTROLLER
>> +	select VIDEO_V4L2_SUBDEV_API
>> +	select V4L2_ASYNC
>> +	help
>> +	  This is a driver for the DW9719 camera lens voice coil.
>> +	  This is designed for linear control of  voice coil motors,
>> +	  controlled via I2C serial interface.
>> +
>>  config VIDEO_DW9768
>>  	tristate "DW9768 lens voice coil support"
>>  	depends on I2C && VIDEO_V4L2
>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>> index b01f6cd05ee8..ba8b31d79222 100644
>> --- a/drivers/media/i2c/Makefile
>> +++ b/drivers/media/i2c/Makefile
>> @@ -24,6 +24,7 @@ obj-$(CONFIG_VIDEO_SAA6752HS) += saa6752hs.o
>>  obj-$(CONFIG_VIDEO_AD5820)  += ad5820.o
>>  obj-$(CONFIG_VIDEO_AK7375)  += ak7375.o
>>  obj-$(CONFIG_VIDEO_DW9714)  += dw9714.o
>> +obj-$(CONFIG_VIDEO_DW9719)  += dw9719.o
>>  obj-$(CONFIG_VIDEO_DW9768)  += dw9768.o
>>  obj-$(CONFIG_VIDEO_DW9807_VCM)  += dw9807-vcm.o
>>  obj-$(CONFIG_VIDEO_ADV7170) += adv7170.o
>> diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
>> new file mode 100644
>> index 000000000000..8451c75b696b
>> --- /dev/null
>> +++ b/drivers/media/i2c/dw9719.c
>> @@ -0,0 +1,427 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (c) 2012 Intel Corporation
>> +
>> +/*
>> + * Based on linux/modules/camera/drivers/media/i2c/imx/dw9719.c in this repo:
>> + * https://github.com/ZenfoneArea/android_kernel_asus_zenfone5
>> + */
>> +
>> +#include <asm/unaligned.h>
>> +
>> +#include <linux/delay.h>
>> +#include <linux/i2c.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/types.h>
>> +
>> +#include <media/v4l2-common.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-subdev.h>
>> +
>> +#define DW9719_MAX_FOCUS_POS	1023
>> +#define DW9719_CTRL_STEPS	16
>> +#define DW9719_CTRL_DELAY_US	1000
>> +#define DELAY_MAX_PER_STEP_NS	(1000000 * 1023)
>> +
>> +#define DW9719_INFO			0
>> +#define DW9719_ID			0xF1
>> +#define DW9719_CONTROL			2
>> +#define DW9719_VCM_CURRENT		3
>> +
>> +#define DW9719_MODE			6
>> +#define DW9719_VCM_FREQ			7
>> +
>> +#define DW9719_MODE_SAC3		0x40
>> +#define DW9719_DEFAULT_VCM_FREQ		0x60
>> +#define DW9719_ENABLE_RINGING		0x02
> I guess you could have defaults but these are probably specific to the
> module (spring and lens) rather than to this chip (which is just a current
> sink).


Ah ok, that would make sense.

>
> Still it'd be much better to have these bound to the platform. See e.g.
>
> 	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml


In this case it's an ACPI platform; those devices are currently being
created by the cio2-bridge code (because the less-than-optimal DSDT
tables for these devices only describe them as a second I2cSerialBusV2
against the camera sensor...). I can create fwnode properties against
the device for those settings in the cio2-bridge and optionally read
(using those existing macros as defaults) them from fwnode in the driver
the same as the dw9768 driver does...how's that sound? Out of curiosity,
is there a list of established property names somewhere?



> +
>> +#define NUM_REGULATORS			2
>> +
>> +#define to_dw9719_device(x) container_of(x, struct dw9719_device, sd)
>> +
>> +struct dw9719_device {
>> +	struct device *dev;
>> +	struct i2c_client *client;
>> +	struct regulator_bulk_data regulators[NUM_REGULATORS];
>> +	struct v4l2_subdev sd;
>> +
>> +	struct dw9719_v4l2_ctrls {
>> +		struct v4l2_ctrl_handler handler;
>> +		struct v4l2_ctrl *focus;
>> +	} ctrls;
>> +};
>> +
>> +static int dw9719_i2c_rd8(struct i2c_client *client, u8 reg, u8 *val)
>> +{
>> +	struct i2c_msg msg[2];
>> +	u8 buf[2] = { reg };
>> +	int ret;
>> +
>> +	msg[0].addr = client->addr;
>> +	msg[0].flags = 0;
>> +	msg[0].len = 1;
>> +	msg[0].buf = buf;
>> +
>> +	msg[1].addr = client->addr;
>> +	msg[1].flags = I2C_M_RD;
>> +	msg[1].len = 1;
>> +	msg[1].buf = &buf[1];
>> +	*val = 0;
>> +
>> +	ret = i2c_transfer(client->adapter, msg, 2);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	*val = buf[1];
>> +
>> +	return 0;
>> +}
>> +
>> +static int dw9719_i2c_wr8(struct i2c_client *client, u8 reg, u8 val)
>> +{
>> +	struct i2c_msg msg;
>> +	int ret;
>> +
>> +	u8 buf[2] = { reg, val };
>> +
>> +	msg.addr = client->addr;
>> +	msg.flags = 0;
>> +	msg.len = sizeof(buf);
>> +	msg.buf = buf;
>> +
>> +	ret = i2c_transfer(client->adapter, &msg, 1);
>> +
>> +	return ret < 0 ? ret : 0;
>> +}
>> +
>> +static int dw9719_i2c_wr16(struct i2c_client *client, u8 reg, u16 val)
>> +{
>> +	struct i2c_msg msg;
>> +	u8 buf[3] = { reg };
>> +	int ret;
>> +
>> +	put_unaligned_be16(val, buf + 1);
>> +
>> +	msg.addr = client->addr;
>> +	msg.flags = 0;
>> +	msg.len = sizeof(buf);
>> +	msg.buf = buf;
>> +
>> +	ret = i2c_transfer(client->adapter, &msg, 1);
>> +
>> +	return ret < 0 ? ret : 0;
>> +}
>> +
>> +static int dw9719_detect(struct dw9719_device *dw9719)
>> +{
>> +	int ret;
>> +	u8 val;
>> +
>> +	ret = dw9719_i2c_rd8(dw9719->client, DW9719_INFO, &val);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (val != DW9719_ID) {
>> +		dev_err(dw9719->dev, "Failed to detect correct id\n");
>> +		ret = -ENXIO;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int dw9719_power_down(struct dw9719_device *dw9719)
>> +{
>> +	return regulator_bulk_disable(NUM_REGULATORS, dw9719->regulators);
>> +}
>> +
>> +static int dw9719_power_up(struct dw9719_device *dw9719)
>> +{
>> +	int ret;
>> +
>> +	ret = regulator_bulk_enable(NUM_REGULATORS, dw9719->regulators);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Jiggle SCL pin to wake up device */
>> +	ret = dw9719_i2c_wr8(dw9719->client, DW9719_CONTROL, 1);
>> +
>> +	/* Need 100us to transit from SHUTDOWN to STANDBY*/
>> +	usleep_range(100, 1000);
>> +
>> +	ret = dw9719_i2c_wr8(dw9719->client, DW9719_CONTROL,
>> +			     DW9719_ENABLE_RINGING);
>> +	if (ret < 0)
>> +		goto fail_powerdown;
>> +
>> +	ret = dw9719_i2c_wr8(dw9719->client, DW9719_MODE, DW9719_MODE_SAC3);
>> +	if (ret < 0)
>> +		goto fail_powerdown;
>> +
>> +	ret = dw9719_i2c_wr8(dw9719->client, DW9719_VCM_FREQ,
>> +			     DW9719_DEFAULT_VCM_FREQ);
>> +	if (ret < 0)
>> +		goto fail_powerdown;
>> +
>> +	return 0;
>> +
>> +fail_powerdown:
>> +	dw9719_power_down(dw9719);
>> +	return ret;
>> +}
>> +
>> +static int dw9719_t_focus_abs(struct dw9719_device *dw9719, s32 value)
>> +{
>> +	int ret;
>> +
>> +	value = clamp(value, 0, DW9719_MAX_FOCUS_POS);
>> +	ret = dw9719_i2c_wr16(dw9719->client, DW9719_VCM_CURRENT, value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int dw9719_set_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +	struct dw9719_device *dw9719 = container_of(ctrl->handler,
>> +						    struct dw9719_device,
>> +						    ctrls.handler);
>> +	int ret;
>> +
>> +	/* Only apply changes to the controls if the device is powered up */
>> +	if (!pm_runtime_get_if_in_use(dw9719->dev))
>> +		return 0;
>> +
>> +	switch (ctrl->id) {
>> +	case V4L2_CID_FOCUS_ABSOLUTE:
>> +		ret = dw9719_t_focus_abs(dw9719, ctrl->val);
>> +		break;
>> +	default:
>> +		ret = -EINVAL;
>> +	}
>> +
>> +	pm_runtime_put(dw9719->dev);
>> +
>> +	return ret;
>> +}
>> +
>> +static const struct v4l2_ctrl_ops dw9719_ctrl_ops = {
>> +	.s_ctrl = dw9719_set_ctrl,
>> +};
>> +
>> +static int __maybe_unused dw9719_suspend(struct device *dev)
>> +{
>> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>> +	struct dw9719_device *dw9719 = to_dw9719_device(sd);
>> +	int ret;
>> +	int val;
>> +
>> +	for (val = dw9719->ctrls.focus->val; val >= 0;
>> +	     val -= DW9719_CTRL_STEPS) {
>> +		ret = dw9719_t_focus_abs(dw9719, val);
>> +		if (ret)
>> +			return ret;
>> +
>> +		usleep_range(DW9719_CTRL_DELAY_US, DW9719_CTRL_DELAY_US + 10);
>> +	}
>> +
>> +	return dw9719_power_down(dw9719);
>> +}
>> +
>> +static int __maybe_unused dw9719_resume(struct device *dev)
>> +{
>> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>> +	struct dw9719_device *dw9719 = to_dw9719_device(sd);
>> +	int current_focus = dw9719->ctrls.focus->val;
>> +	int ret;
>> +	int val;
>> +
>> +	ret = dw9719_power_up(dw9719);
>> +	if (ret)
>> +		return ret;
>> +
>> +	for (val = current_focus % DW9719_CTRL_STEPS; val < current_focus;
>> +	     val += DW9719_CTRL_STEPS) {
>> +		ret = dw9719_t_focus_abs(dw9719, val);
>> +		if (ret)
>> +			goto err_power_down;
>> +
>> +		usleep_range(DW9719_CTRL_DELAY_US, DW9719_CTRL_DELAY_US + 10);
>> +	}
>> +
>> +	return 0;
>> +
>> +err_power_down:
>> +	dw9719_power_down(dw9719);
>> +	return ret;
>> +}
>> +
>> +static int dw9719_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>> +{
>> +	return pm_runtime_resume_and_get(sd->dev);
>> +}
>> +
>> +static int dw9719_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>> +{
>> +	pm_runtime_put(sd->dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_subdev_internal_ops dw9719_internal_ops = {
>> +	.open = dw9719_open,
>> +	.close = dw9719_close,
>> +};
>> +
>> +static int dw9719_init_controls(struct dw9719_device *dw9719)
>> +{
>> +	const struct v4l2_ctrl_ops *ops = &dw9719_ctrl_ops;
>> +	int ret;
>> +
>> +	ret = v4l2_ctrl_handler_init(&dw9719->ctrls.handler, 1);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dw9719->ctrls.focus = v4l2_ctrl_new_std(&dw9719->ctrls.handler, ops,
>> +						V4L2_CID_FOCUS_ABSOLUTE, 0,
>> +						DW9719_MAX_FOCUS_POS, 1, 0);
>> +
>> +	if (dw9719->ctrls.handler.error) {
>> +		dev_err(dw9719->dev, "Error initialising v4l2 ctrls\n");
>> +		ret = dw9719->ctrls.handler.error;
>> +		goto err_free_handler;
>> +	}
>> +
>> +	dw9719->sd.ctrl_handler = &dw9719->ctrls.handler;
>> +
>> +	return ret;
>> +
>> +err_free_handler:
>> +	v4l2_ctrl_handler_free(&dw9719->ctrls.handler);
>> +	return ret;
>> +}
>> +
>> +static const struct v4l2_subdev_ops dw9719_ops = { };
>> +
>> +static int dw9719_probe(struct i2c_client *client)
>> +{
>> +	struct dw9719_device *dw9719;
>> +	int ret;
>> +
>> +	dw9719 = devm_kzalloc(&client->dev, sizeof(*dw9719), GFP_KERNEL);
>> +	if (!dw9719)
>> +		return -ENOMEM;
>> +
>> +	dw9719->client = client;
>> +	dw9719->dev = &client->dev;
>> +
>> +	dw9719->regulators[0].supply = "vdd";
>> +	/*
>> +	 * The DW9719 has only the 1 VDD voltage input, but some PMICs such as
>> +	 * the TPS68470 PMIC have I2C passthrough capability, to disconnect the
>> +	 * sensor's I2C pins from the I2C bus when the sensors VSIO (Sensor-IO)
>> +	 * is off, because some sensors then short these pins to ground;
>> +	 * and the DW9719 might sit behind this passthrough, this it needs to
>> +	 * enable VSIO as that will also enable the I2C passthrough.
>> +	 */
>> +	dw9719->regulators[1].supply = "vsio";
> Urgh.


Yup

> That should have been handled in ACPI.


Yup

> Do you know if such a sensor actually exists or is this motivated by the
> PMIC chip's feature?


Yup - the ov8865 on the Surface Go 1/2/3 models. Without setting it up
this way the driver won't probe unless you're already streaming with the
camera sensor.

>
>> +
>> +	ret = devm_regulator_bulk_get(&client->dev, NUM_REGULATORS,
>> +				      dw9719->regulators);
>> +	if (ret)
>> +		return dev_err_probe(&client->dev, ret, "getting regulators\n");
>> +
>> +	v4l2_i2c_subdev_init(&dw9719->sd, client, &dw9719_ops);
>> +	dw9719->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +	dw9719->sd.internal_ops = &dw9719_internal_ops;
>> +
>> +	ret = dw9719_init_controls(dw9719);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = media_entity_pads_init(&dw9719->sd.entity, 0, NULL);
>> +	if (ret < 0)
>> +		goto err_free_ctrl_handler;
>> +
>> +	dw9719->sd.entity.function = MEDIA_ENT_F_LENS;
>> +
>> +	/*
>> +	 * We need the driver to work in the event that pm runtime is disable in
>> +	 * the kernel, so power up and verify the chip now. In the event that
>> +	 * runtime pm is disabled this will leave the chip on, so that the lens
>> +	 * will work.
>> +	 */
>> +
>> +	ret = dw9719_power_up(dw9719);
>> +	if (ret)
>> +		goto err_cleanup_media;
>> +
>> +	ret = dw9719_detect(dw9719);
>> +	if (ret)
>> +		goto err_powerdown;
>> +
>> +	pm_runtime_set_active(&client->dev);
>> +	pm_runtime_get_noresume(&client->dev);
>> +	pm_runtime_enable(&client->dev);
>> +
>> +	ret = v4l2_async_register_subdev(&dw9719->sd);
>> +	if (ret < 0)
>> +		goto err_pm_runtime;
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
>> +	dw9719_power_down(dw9719);
>> +err_cleanup_media:
>> +	media_entity_cleanup(&dw9719->sd.entity);
>> +err_free_ctrl_handler:
>> +	v4l2_ctrl_handler_free(&dw9719->ctrls.handler);
>> +
>> +	return ret;
>> +}
>> +
>> +static int dw9719_remove(struct i2c_client *client)
>> +{
>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>> +	struct dw9719_device *dw9719 = container_of(sd, struct dw9719_device,
>> +						    sd);
>> +
>> +	pm_runtime_disable(&client->dev);
>> +	v4l2_async_unregister_subdev(sd);
>> +	v4l2_ctrl_handler_free(&dw9719->ctrls.handler);
>> +	media_entity_cleanup(&dw9719->sd.entity);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct i2c_device_id dw9719_id_table[] = {
>> +	{ "dw9719" },
> Hmm. Do you need the ID table?


Err, I think so? There's no dt / acpi matching, how would the driver and
device bind without the i2c ID? Is there a 4th method I've not noticed?

>
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(i2c, dw9719_id_table);
>> +
>> +static const struct dev_pm_ops dw9719_pm_ops = {
>> +	SET_RUNTIME_PM_OPS(dw9719_suspend, dw9719_resume, NULL)
>> +};
>> +
>> +static struct i2c_driver dw9719_i2c_driver = {
>> +	.driver = {
>> +		.name = "dw9719",
>> +		.pm = &dw9719_pm_ops,
>> +	},
>> +	.probe_new = dw9719_probe,
>> +	.remove = dw9719_remove,
>> +	.id_table = dw9719_id_table,
>> +};
>> +module_i2c_driver(dw9719_i2c_driver);
>> +
>> +MODULE_AUTHOR("Daniel Scally <djrscally@gmail.com>");
>> +MODULE_DESCRIPTION("DW9719 VCM Driver");
>> +MODULE_LICENSE("GPL");
