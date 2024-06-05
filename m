Return-Path: <linux-media+bounces-12585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C40E8FCE46
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 15:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28CD9B2EB24
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 12:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11513188CDE;
	Wed,  5 Jun 2024 12:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="q4umy/UR"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24771D24D5;
	Wed,  5 Jun 2024 12:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717589291; cv=none; b=GNAwm0AXxc28Eef6F3uqkv5V60wL13UYJCtvTCgOGa8eGKlC+/G4FGZ7I1CsF7+aDYZ7yxIP2Czh2oFRd+355m/eyKX1u/kjNeMFfuI7yYhc01xIQSMRyvSQxse7mAZxB1agWLsv+bhKURMF2IMjL6im1z6jcJFOMixNXZ76sq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717589291; c=relaxed/simple;
	bh=SEelAXJG08W65CGyIkQNJoq9sAMJ1WDyzRM79iKUXRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YonIYs70COX4fSp32LlDeFC0OlnqOjRrpSfKeEsoukfp262m4xnjVkr4d7HY7q3TVxCKAvtcY8K8lRUekjl/giCi0WwPWadH/Ijv+HJsL+s87ZY1xglbt4Z+Eiwaelg+6zgVQlSik8oRMEChlbDONwPbNxogIHASkLOaGnMQcM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=q4umy/UR; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717589287;
	bh=SEelAXJG08W65CGyIkQNJoq9sAMJ1WDyzRM79iKUXRg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q4umy/URL73BSCdwadNG+zMBW0WyFzpLdzU7QUN9h1ffq1JWcUCnyf7v1PiPLHBdG
	 8Wx9dm/te1pzrfMcbIO565ZK26aWPMPpTtWaIUyTbNGsJh8p4DxkD8Z1vo4wOssR7g
	 kYfcxYV/5ouZbvra3P3f9ln8JVaFO3j2jBLk7yiygZaZGpdxwfjVJ1yL9SKMWedYP1
	 Wz2Y4P1B1VHNN4dl/irJzCqyt7dVbyhyTfTdROa7ZdLA2eqHlz3xP3iEHUqRkFGmPs
	 ZYXYRCCodStjOWqDr+Iy8xKjNPtC5VSYQzWo8MAT8jIc1eD34H6gYSaISEbEQsNy8j
	 W5b79ZDQ100Ig==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0334D3781185;
	Wed,  5 Jun 2024 12:08:05 +0000 (UTC)
Message-ID: <d6bbd959-93fc-4374-af60-310859b266dc@collabora.com>
Date: Wed, 5 Jun 2024 14:08:05 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] media: i2c: Add GC05A2 image sensor driver
To: Zhi Mao <zhi.mao@mediatek.com>, mchehab@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sakari.ailus@linux.intel.com
Cc: laurent.pinchart@ideasonboard.com, shengnan.wang@mediatek.com,
 yaya.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 yunkec@chromium.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 jacopo.mondi@ideasonboard.com, 10572168@qq.com, hverkuil-cisco@xs4all.nl,
 heiko@sntech.de, jernej.skrabec@gmail.com, macromorgan@hotmail.com,
 linus.walleij@linaro.org, hdegoede@redhat.com,
 tomi.valkeinen@ideasonboard.com, gerald.loacker@wolfvision.net,
 andy.shevchenko@gmail.com, bingbu.cao@intel.com,
 dan.scally@ideasonboard.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240605105540.17937-1-zhi.mao@mediatek.com>
 <20240605105540.17937-3-zhi.mao@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240605105540.17937-3-zhi.mao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 05/06/24 12:55, Zhi Mao ha scritto:
> Add a V4L2 sub-device driver for Galaxycore GC05A2 image sensor.
> 
> Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
> ---
>   drivers/media/i2c/Kconfig  |   10 +
>   drivers/media/i2c/Makefile |    1 +
>   drivers/media/i2c/gc05a2.c | 1361 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 1372 insertions(+)
>   create mode 100644 drivers/media/i2c/gc05a2.c
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index c6d3ee472d81..4e7c71c95143 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -70,6 +70,16 @@ config VIDEO_GC0308
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called gc0308.
>   
> +config VIDEO_GC05A2
> +	tristate "GalaxyCore gc05a2 sensor support"
> +	select V4L2_CCI_I2C
> +	help
> +	  This is a Video4Linux2 sensor driver for the GalaxyCore gc05a2
> +	  camera.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called gc05a2.
> +
>   config VIDEO_GC2145
>   	select V4L2_CCI_I2C
>   	tristate "GalaxyCore GC2145 sensor support"
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index dfbe6448b549..8ed6faf0f854 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -38,6 +38,7 @@ obj-$(CONFIG_VIDEO_DW9768) += dw9768.o
>   obj-$(CONFIG_VIDEO_DW9807_VCM) += dw9807-vcm.o
>   obj-$(CONFIG_VIDEO_ET8EK8) += et8ek8/
>   obj-$(CONFIG_VIDEO_GC0308) += gc0308.o
> +obj-$(CONFIG_VIDEO_GC05A2) += gc05a2.o
>   obj-$(CONFIG_VIDEO_GC2145) += gc2145.o
>   obj-$(CONFIG_VIDEO_HI556) += hi556.o
>   obj-$(CONFIG_VIDEO_HI846) += hi846.o
> diff --git a/drivers/media/i2c/gc05a2.c b/drivers/media/i2c/gc05a2.c
> new file mode 100644
> index 000000000000..87a209b27fc2
> --- /dev/null
> +++ b/drivers/media/i2c/gc05a2.c
> @@ -0,0 +1,1361 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for GalaxyCore gc05a2 image sensor
> + *
> + * Copyright 2024 MediaTek
> + *
> + * Zhi Mao <zhi.mao@mediatek.com>
> + */
> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/container_of.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/math64.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/property.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/types.h>
> +#include <linux/units.h>
> +
> +#include <media/v4l2-cci.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-subdev.h>
> +
> +#define GC05A2_REG_TEST_PATTERN_EN CCI_REG8(0x008c)
> +#define GC05A2_REG_TEST_PATTERN_IDX CCI_REG8(0x008d)
> +#define GC05A2_TEST_PATTERN_EN 0x01
> +
> +#define GC05A2_STREAMING_REG CCI_REG8(0x0100)
> +
> +#define GC05A2_FLIP_REG CCI_REG8(0x0101)
> +#define GC05A2_FLIP_H_MASK BIT(0)
> +#define GC05A2_FLIP_V_MASK BIT(1)
> +
> +#define GC05A2_EXP_REG CCI_REG16(0x0202)
> +#define GC05A2_EXP_MARGIN 16
> +#define GC05A2_EXP_MIN 4
> +#define GC05A2_EXP_STEP 1
> +
> +#define GC05A2_AGAIN_REG CCI_REG16(0x0204)
> +#define GC05A2_AGAIN_MIN 1024
> +#define GC05A2_AGAIN_MAX (1024 * 16)
> +#define GC05A2_AGAIN_STEP 1
> +
> +#define GC05A2_FRAME_LENGTH_REG CCI_REG16(0x0340)
> +#define GC05A2_VTS_MAX 0xffff
> +
> +#define GC05A2_REG_CHIP_ID CCI_REG16(0x03f0)
> +#define GC05A2_CHIP_ID 0x05a2
> +
> +#define GC05A2_NATIVE_WIDTH 2592
> +#define GC05A2_NATIVE_HEIGHT 1944
> +
> +#define GC05A2_DEFAULT_CLK_FREQ (24 * HZ_PER_MHZ)
> +#define GC05A2_MBUS_CODE MEDIA_BUS_FMT_SGRBG10_1X10
> +#define GC05A2_DATA_LANES 2
> +#define GC05A2_RGB_DEPTH 10
> +#define GC05A2_SLEEP_US  (2 * USEC_PER_MSEC)
> +

..snip..

> +static int gc05a2_parse_fwnode(struct gc05a2 *gc05a2)
> +{
> +	struct fwnode_handle *endpoint;
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> +	};
> +	int ret;
> +	struct device *dev = gc05a2->dev;
> +
> +	endpoint =
> +		fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
> +						FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!endpoint) {
> +		dev_err(dev, "endpoint node not found\n");

This function is used only in probe stage, and logging should be consistent.
Check below :-)

> +		return -EINVAL;
> +	}
> +

..snip..

> +
> +static int gc05a2_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct gc05a2 *gc05a2;
> +	int ret;
> +
> +	gc05a2 = devm_kzalloc(dev, sizeof(*gc05a2), GFP_KERNEL);
> +	if (!gc05a2)
> +		return -ENOMEM;
> +
> +	gc05a2->dev = dev;
> +
> +	ret = gc05a2_parse_fwnode(gc05a2);
> +	if (ret)
> +		return ret;
> +
> +	gc05a2->regmap = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(gc05a2->regmap))
> +		return dev_err_probe(dev, PTR_ERR(gc05a2->regmap),
> +				     "failed to init CCI\n");
> +
> +	gc05a2->xclk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(gc05a2->xclk))
> +		return dev_err_probe(dev, PTR_ERR(gc05a2->xclk),
> +				     "failed to get xclk\n");
> +
> +	ret = clk_set_rate(gc05a2->xclk, GC05A2_DEFAULT_CLK_FREQ);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to set xclk frequency\n");
> +
> +	ret = gc05a2_get_regulators(dev, gc05a2);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret,
> +				     "failed to get regulators\n");
> +
> +	gc05a2->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(gc05a2->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(gc05a2->reset_gpio),
> +				     "failed to get gpio\n");
> +
> +	v4l2_i2c_subdev_init(&gc05a2->sd, client, &gc05a2_subdev_ops);
> +	gc05a2->sd.internal_ops = &gc05a2_internal_ops;
> +	gc05a2->cur_mode = &gc05a2_modes[0];
> +
> +	ret = gc05a2_init_controls(gc05a2);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to init controls\n");
> +
> +	gc05a2->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +			    V4L2_SUBDEV_FL_HAS_EVENTS;
> +	gc05a2->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	gc05a2->sd.dev = &client->dev;
> +	gc05a2->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +
> +	ret = media_entity_pads_init(&gc05a2->sd.entity, 1, &gc05a2->pad);
> +	if (ret < 0) {
> +		dev_err(dev, "could not register media entity\n");

For logging strings consistency, you should use dev_err_probe() everywhere,
at this point, because that's printing the error code.

So here it'd be

if (ret < 0) {
	dev_err_probe(dev, ret, "could not register media entity\n");
	goto err_v4l2_ctrl_handler_free;
}

> +		goto err_v4l2_ctrl_handler_free;
> +	}
> +
> +	gc05a2->sd.state_lock = gc05a2->ctrls.lock;
> +	ret = v4l2_subdev_init_finalize(&gc05a2->sd);
> +	if (ret < 0) {
> +		dev_err(dev, "v4l2 subdev init error: %d\n", ret);

same here

> +		goto err_media_entity_cleanup;
> +	}
> +
> +	pm_runtime_enable(gc05a2->dev);
> +	pm_runtime_set_autosuspend_delay(gc05a2->dev, 1000);
> +	pm_runtime_use_autosuspend(gc05a2->dev);
> +	pm_runtime_idle(gc05a2->dev);
> +
> +	ret = v4l2_async_register_subdev_sensor(&gc05a2->sd);
> +	if (ret < 0) {
> +		dev_err(dev, "could not register v4l2 device\n");

ditto

> +		goto err_rpm;
> +	}
> +
> +	return 0;
> +
> +err_rpm:
> +	pm_runtime_disable(gc05a2->dev);
> +	v4l2_subdev_cleanup(&gc05a2->sd);
> +
> +err_media_entity_cleanup:
> +	media_entity_cleanup(&gc05a2->sd.entity);
> +
> +err_v4l2_ctrl_handler_free:
> +	v4l2_ctrl_handler_free(&gc05a2->ctrls);
> +
> +	return ret;
> +}
> +
> +static void gc05a2_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct gc05a2 *gc05a2 = to_gc05a2(sd);
> +
> +	v4l2_async_unregister_subdev(&gc05a2->sd);
> +	v4l2_subdev_cleanup(sd);
> +	media_entity_cleanup(&gc05a2->sd.entity);
> +	v4l2_ctrl_handler_free(&gc05a2->ctrls);
> +
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		gc05a2_power_off(gc05a2->dev);
> +	pm_runtime_set_suspended(&client->dev);
> +}
> +
> +static const struct of_device_id gc05a2_of_match[] = {
> +	{ .compatible = "galaxycore,gc05a2" },
> +	{}

{ /* sentinel */ }


After which, looks good to me, so, after addressing my comments:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +};
> +MODULE_DEVICE_TABLE(of, gc05a2_of_match);
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(gc05a2_pm_ops,
> +				 gc05a2_power_off,
> +				 gc05a2_power_on,
> +				 NULL);
> +
> +static struct i2c_driver gc05a2_i2c_driver = {
> +	.driver = {
> +		.of_match_table = gc05a2_of_match,
> +		.pm = pm_ptr(&gc05a2_pm_ops),
> +		.name  = "gc05a2",
> +	},
> +	.probe = gc05a2_probe,
> +	.remove = gc05a2_remove,
> +};
> +module_i2c_driver(gc05a2_i2c_driver);
> +
> +MODULE_DESCRIPTION("GalaxyCore gc05a2 Camera driver");
> +MODULE_AUTHOR("Zhi Mao <zhi.mao@mediatek.com>");
> +MODULE_LICENSE("GPL");

-- 
AngeloGioacchino Del Regno
Senior Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718


