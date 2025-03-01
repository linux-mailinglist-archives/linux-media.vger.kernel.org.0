Return-Path: <linux-media+bounces-27264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1CFA4AB35
	for <lists+linux-media@lfdr.de>; Sat,  1 Mar 2025 14:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 416DC7A8BDE
	for <lists+linux-media@lfdr.de>; Sat,  1 Mar 2025 13:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2DC1DF24F;
	Sat,  1 Mar 2025 13:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U9Kg56qZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1767979CD;
	Sat,  1 Mar 2025 13:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740835817; cv=none; b=nhK38LQPtsBZ6VW8Afp92r/Ra7OQ9XZPDWjfDB7hgZRDUAv/LvWX1d9MbyGdMHPLMyKo+XpHyws3LPvL+UTSahGV2e1F0aMsSBbOVuErWhchVBaG6joEEsOrf+IcVkj+/3MZxIjG4G90s2hhhuerFxDy5c7UNR08Nt1QLbZDtO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740835817; c=relaxed/simple;
	bh=SwyPErKy/wkrfdSz6Hn5/KDvLA6mTfMxR9RzDkps5p8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IJLojqsdsYYXO6XQgJ2EuC/7FSz36hqSyHynP5wjyRoeXZE5VChQkjGIA5lbl0lOrDIe5N0uERmPGBkZ2FtEzgV0wkhDyRtj5DKX4AbZwiwHN9Jq2VBtnpQkXN3cyVqra5F005llZPgMEgJFdnFd/fMOb3TxnyoDQ/CkSWtkcQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U9Kg56qZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08773C4CEDD;
	Sat,  1 Mar 2025 13:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740835816;
	bh=SwyPErKy/wkrfdSz6Hn5/KDvLA6mTfMxR9RzDkps5p8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U9Kg56qZUmctik01QXLmTJzNAFKcFB6l3pBoWghT31e699On7lAyuXkRsZ1Wtkywb
	 h6b8uedjZNdj6S+vAYP6z4IFXc9KkuRQnUH7BKGaaKJilLS/CTBD9+qXFvbTx2R1No
	 wYZDfDbwUpzavOkKERCf8pc7v5J2lABZSx95GGrJETY7HSJLRoKd+rUAM5screheQ6
	 uTQ146SrQBkajE6DEaliwja0IRBGmzjRnWmLSBPOzGLr40kaoUk9oW2sKr9IYQx4O7
	 EHjSle9WiFlwGkcEWKbnjBFkVbDX1pg7Wasf2F6yB+1Xc6z0fWOuzmYWCgHOSrDQr4
	 opy6EUu2oDJhw==
Message-ID: <03c3e6bf-9688-446d-9b45-5b186a1d5b0e@kernel.org>
Date: Sat, 1 Mar 2025 14:30:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: Add OV05C camera sensor driver
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com
References: <20250228165317.3468075-1-pratap.nirujogi@amd.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250228165317.3468075-1-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/02/2025 17:53, Pratap Nirujogi wrote:
> Add driver for OmniVision 5.2M OV05C10 sensor. This driver
> supports only the full size normal 2888x1808@30fps 2-lane
> sensor profile.
> 
> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> ---
>  drivers/media/i2c/Kconfig  |   10 +
>  drivers/media/i2c/Makefile |    1 +
>  drivers/media/i2c/ov05c.c  | 1031 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 1042 insertions(+)
>  create mode 100644 drivers/media/i2c/ov05c.c
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 8ba096b8ebca..fd160feabc41 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -337,6 +337,16 @@ config VIDEO_OG01A1B
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called og01a1b.
>  
> +config VIDEO_OV05C
> +	tristate "OmniVision OV05 sensor support"
> +	select V4L2_CCI_I2C
> +	help
> +	  This is a Video4Linux2 sensor driver for the OmniVision
> +	  OV05C camera.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called OV05C.
> +
>  config VIDEO_OV01A10
>  	tristate "OmniVision OV01A10 sensor support"
>  	help
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index fbb988bd067a..08bfc2d59be2 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -80,6 +80,7 @@ obj-$(CONFIG_VIDEO_MT9V011) += mt9v011.o
>  obj-$(CONFIG_VIDEO_MT9V032) += mt9v032.o
>  obj-$(CONFIG_VIDEO_MT9V111) += mt9v111.o
>  obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
> +obj-$(CONFIG_VIDEO_OV05C) += ov05c.o
>  obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
>  obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
>  obj-$(CONFIG_VIDEO_OV08D10) += ov08d10.o
> diff --git a/drivers/media/i2c/ov05c.c b/drivers/media/i2c/ov05c.c
> new file mode 100644
> index 000000000000..96c4f74af4a9
> --- /dev/null
> +++ b/drivers/media/i2c/ov05c.c
> @@ -0,0 +1,1031 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc. All rights reserved.
> + * All Rights Reserved.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the
> + * "Software"), to deal in the Software without restriction, including
> + * without limitation the rights to use, copy, modify, merge, publish,
> + * distribute, sub license, and/or sell copies of the Software, and to
> + * permit persons to whom the Software is furnished to do so, subject to
> + * the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the
> + * next paragraph) shall be included in all copies or substantial portions
> + * of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> + * USE OR OTHER DEALINGS IN THE SOFTWARE.

What's with AMD? Second patch that day, same issues.

Drop license boilerplate.

> + *
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/delay.h>
> +#include <linux/units.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/gpio.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-cci.h>


...

> +
> +static int ov05c_probe(struct i2c_client *client)
> +{
> +	struct ov05c *ov05c;
> +	int i, ret;
> +
> +	ov05c = devm_kzalloc(&client->dev, sizeof(*ov05c), GFP_KERNEL);
> +	if (!ov05c)
> +		return -ENOMEM;
> +
> +	client->dev.init_name = DRV_NAME;
> +
> +	/* create sensor enable gpio control */
> +	ov05c->enable_gpio = devm_gpiod_get(&client->dev, "sensor0_enable", GPIOD_OUT_LOW);


s/sensor0_enable/enable/

> +	if (IS_ERR_OR_NULL(ov05c->enable_gpio))
> +		return PTR_ERR(ov05c->enable_gpio);
> +
> +	/* Initialize subdev */
> +	v4l2_i2c_subdev_init(&ov05c->sd, client, &ov05c_subdev_ops);
> +
> +	/* Initialize CCI */
> +	ov05c->regmap = devm_cci_regmap_init_i2c(client, 8);
> +	if (IS_ERR(ov05c->regmap)) {
> +		dev_err(&client->dev, "Failed to initialize CCI\n");

Syntax is: return dev_err_probe

> +		return PTR_ERR(ov05c->regmap);
> +	}
> +
> +	/* Set default mode to max resolution */
> +	ov05c->cur_mode = &supported_modes[0];
> +
> +	/* Initialize V4L2 controls */
> +	ret = ov05c_init_controls(ov05c);
> +	if (ret)
> +		return ret;
> +
> +	/* Initialize V4L2 subdev */
> +	ov05c->sd.internal_ops = &ov05c_internal_ops;
> +	ov05c->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	ov05c->sd.entity.ops = &ov05c_subdev_entity_ops;
> +	ov05c->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	ov05c->sd.entity.name = "OV05C";
> +
> +	/* Initialize source pad */
> +	for (i = 0; i < NUM_OF_PADS; i++)
> +		ov05c->pads[i].flags = MEDIA_PAD_FL_SOURCE;
> +
> +	ret = media_entity_pads_init(&ov05c->sd.entity, NUM_OF_PADS, ov05c->pads);
> +	if (ret)
> +		goto error_handler_free;
> +
> +	ret = v4l2_async_register_subdev_sensor(&ov05c->sd);
> +	if (ret)
> +		goto error_media_entity;
> +
> +	/*
> +	 * Device is already turned on by i2c-core with ACPI domain PM.
> +	 * Enable runtime PM and turn off the device.
> +	 */
> +	pm_runtime_set_active(&client->dev);
> +	pm_runtime_enable(&client->dev);
> +	pm_runtime_idle(&client->dev);
> +
> +	dev_info(&client->dev, "%s success", __func__);

Drop, useless. Kernel has infrastructure for simple function exit
debugging. For probing as well.

> +
> +	return 0;
> +
> +error_media_entity:
> +	media_entity_cleanup(&ov05c->sd.entity);
> +
> +error_handler_free:
> +	ov05c_free_controls(ov05c);
> +
> +	return ret;
> +}
> +
> +static void ov05c_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov05c *ov05c = to_ov05c(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	media_entity_cleanup(&sd->entity);
> +	ov05c_free_controls(ov05c);
> +
> +	pm_runtime_disable(&client->dev);
> +	pm_runtime_set_suspended(&client->dev);
> +}
> +
> +static const struct i2c_device_id ov05c_id[] = {
> +	{"ov05c", 0 },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, ov05c_id);
> +
> +static struct i2c_driver ov05c_i2c_driver = {
> +	.driver = {
> +		.name = DRV_NAME,
> +	},
> +	.id_table = ov05c_id,
> +	.probe = ov05c_probe,
> +	.remove = ov05c_remove,
> +};
> +
> +module_i2c_driver(ov05c_i2c_driver);
> +
> +MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
> +MODULE_DESCRIPTION("OmniVision OV05C sensor driver");
> +MODULE_ALIAS("ov05c");

Drop, not correct alias.

> +MODULE_LICENSE("GPL and additional rights");

No, use proper license and matching tag. Your top said this is not GPL!


Best regards,
Krzysztof

