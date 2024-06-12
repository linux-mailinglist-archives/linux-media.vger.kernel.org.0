Return-Path: <linux-media+bounces-12994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 645E4904C5A
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 09:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 567001C224BC
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 07:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F71316C693;
	Wed, 12 Jun 2024 07:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QqI6QVlx"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816B057CAB;
	Wed, 12 Jun 2024 07:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718176070; cv=none; b=Anpptp42j1G8EpuYdLW4JAkbFbO96F3zyJZvH6CikgWcC1GA5jKCCL7I8LSwR7g98RnJntvR9+iz1vUxTAYSR9frt074Y7AjD9V/F1bWQuMBNWJAyxED9TzNDHpMxuYI3Q6sjHGFgP44oz5lyDwJV/RKQQ/l/QVrxkSYzbFJg8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718176070; c=relaxed/simple;
	bh=0FgsU6j7T4RtfSQxL6glhcvtiU7T8QVoGJB2s91r5tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IBFjgJOwnnMRRF21y9nV6CHR5rPlX+EYv88jyiy3G2ge/z+Ll/R5mOiSzbYFrHny2qASGSPaxnMYSO8A0jhAkRfcPuCen7UsZ5Vw6GsqHhpjeW9Qq6FZRw5b0CTQongHM5MdLNqNzkloWPEcYOv7KrHtyZ2hQGuRou3NF2VQXJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QqI6QVlx; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718176066;
	bh=0FgsU6j7T4RtfSQxL6glhcvtiU7T8QVoGJB2s91r5tw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QqI6QVlxLv+L7Nq4DGysBlxuKtnkM9NyEjNvt6a3A4Ma35OYUrmlDir87kYqgM9IV
	 kLAo9rkMWM21cae7H45qOu4Iah0Lcau7f8/GMZPrzNauQBGoCP7D/8CgCTUNLKaoYD
	 o+3TAvEJOC68JZsobWQFAmC/TsmNssngNDwVFtA734TZlhTX2nOkcIeLA8GL2N6X/C
	 QPQ06B7ipzSV20boeII+fxzwHqr4S9K2SzPl1rVZ6CX1lM2/u3/Spj4UlIk9c9Kvks
	 +Sbdh1gIc2xL1ZV19aKOYner0i/8kP+ITUFTXynykTaSboEa9k0ErEW4usGxYReurP
	 CxGu8Ku0hC+0w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id F33583780016;
	Wed, 12 Jun 2024 07:07:44 +0000 (UTC)
Message-ID: <7c71534f-9815-4ea3-969f-c04d249d35d2@collabora.com>
Date: Wed, 12 Jun 2024 09:07:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] media: i2c: Add GT97xx VCM driver
To: Zhi Mao <zhi.mao@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Heiko Stuebner <heiko@sntech.de>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Hans de Goede <hdegoede@redhat.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@bootlin.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 shengnan.wang@mediatek.com, yaya.chang@mediatek.com, yunkec@chromium.org,
 10572168@qq.com
References: <20240612012019.19078-1-zhi.mao@mediatek.com>
 <20240612012019.19078-3-zhi.mao@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240612012019.19078-3-zhi.mao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 12/06/24 03:20, Zhi Mao ha scritto:
> Add a V4L2 sub-device driver for Giantec GT97xx VCM.
> 
> Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>

Hello Zhi,

I fail to see why would you need to upstream this new driver instead of
simply adding the IC_INFO_REG to the already existing (and more featureful)
dw9768 driver, which also seems to support the Giantec GT9769 VCM.

Cheers,
Angelo

> ---
>   drivers/media/i2c/Kconfig  |  13 ++
>   drivers/media/i2c/Makefile |   1 +
>   drivers/media/i2c/gt97xx.c | 436 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 450 insertions(+)
>   create mode 100644 drivers/media/i2c/gt97xx.c
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 5498128773c7..9976f02575a3 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -772,6 +772,19 @@ config VIDEO_DW9807_VCM
>   	  capability. This is designed for linear control of
>   	  voice coil motors, controlled via I2C serial interface.
>   
> +config VIDEO_GT97XX
> +	tristate "GT97xx lens voice coil support"
> +	depends on I2C && VIDEO_DEV
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
> +	select V4L2_FWNODE
> +	select V4L2_CCI_I2C
> +	help
> +	  This is a driver for the GT97xx camera lens voice coil.
> +	  GT97xx is a 10 bit DAC with 100mA output current sink
> +	  capability. It is designed for linear control of
> +	  voice coil motors, controlled via I2C serial interface.
> +
>   endmenu
>   
>   menu "Flash devices"
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index d1403e3273ca..0009d3d6d6af 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -39,6 +39,7 @@ obj-$(CONFIG_VIDEO_DW9807_VCM) += dw9807-vcm.o
>   obj-$(CONFIG_VIDEO_ET8EK8) += et8ek8/
>   obj-$(CONFIG_VIDEO_GC0308) += gc0308.o
>   obj-$(CONFIG_VIDEO_GC2145) += gc2145.o
> +obj-$(CONFIG_VIDEO_GT97XX) += gt97xx.o
>   obj-$(CONFIG_VIDEO_HI556) += hi556.o
>   obj-$(CONFIG_VIDEO_HI846) += hi846.o
>   obj-$(CONFIG_VIDEO_HI847) += hi847.o
> diff --git a/drivers/media/i2c/gt97xx.c b/drivers/media/i2c/gt97xx.c
> new file mode 100644
> index 000000000000..ccae190ffba6
> --- /dev/null
> +++ b/drivers/media/i2c/gt97xx.c
> @@ -0,0 +1,436 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for Giantec gt97xx VCM lens device
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
> +/* gt97xx chip info register and name */
> +#define GT97XX_IC_INFO_REG CCI_REG8(0x00)
> +#define GT9768_ID 0xE9
> +#define GT9769_ID 0xE1
> +#define GT97XX_NAME "gt97xx"
> +
> +/*
> + * Ring control and Power control register
> + * Bit[1] RING_EN
> + * 0: Direct mode
> + * 1: AAC mode (ringing control mode)
> + * Bit[0] PD
> + * 0: Normal operation mode
> + * 1: Power down mode
> + * requires waiting time after PD reset takes place.
> + */
> +#define GT97XX_RING_PD_CONTROL_REG CCI_REG8(0x02)
> +#define GT97XX_PD_MODE_OFF 0x00
> +#define GT97XX_PD_MODE_EN BIT(0)
> +#define GT97XX_AAC_MODE_EN BIT(1)
> +
> +/*
> + * DAC is a 10bit address to control the VCM position.
> + * DAC_MSB: D[9:8] (ADD: 0x03)
> + * DAC_LSB: D[7:0] (ADD: 0x04)
> + */
> +#define GT97XX_DAC_ADDR_REG CCI_REG16(0x03)
> +
> +#define GT97XX_MOVE_STEPS 16
> +#define GT97XX_MAX_FOCUS_POS (BIT(10) - 1)
> +
> +#define GT97XX_SLEEP_US (1 * USEC_PER_MSEC)
> +
> +enum vcm_giantec_reg_desc {
> +	GT_IC_INFO_REG,
> +	GT_RING_PD_CONTROL_REG,
> +	GT_DAC_ADDR_REG,
> +	GT_MAX_REG
> +};
> +
> +struct vcm_giantec_of_data {
> +	unsigned int id;
> +	unsigned int regs[GT_MAX_REG];
> +};
> +
> +static const char *const gt97xx_supply_names[] = {
> +	"vin",
> +	"vdd",
> +};
> +
> +/* gt97xx device structure */
> +struct gt97xx {
> +	struct v4l2_subdev sd;
> +
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(gt97xx_supply_names)];
> +
> +	struct v4l2_ctrl_handler ctrls;
> +	struct v4l2_ctrl *focus;
> +
> +	struct regmap *regmap;
> +
> +	const struct vcm_giantec_of_data *chip;
> +};
> +
> +static inline struct gt97xx *sd_to_gt97xx(struct v4l2_subdev *subdev)
> +{
> +	return container_of(subdev, struct gt97xx, sd);
> +}
> +
> +struct regval_list {
> +	u8 reg_num;
> +	u8 value;
> +};
> +
> +static int gt97xx_set_dac(struct gt97xx *gt97xx, u16 val)
> +{
> +	/* Write VCM position to registers */
> +	return cci_write(gt97xx->regmap,
> +			 gt97xx->chip->regs[GT_DAC_ADDR_REG], val, NULL);
> +}
> +
> +static int gt97xx_identify_module(struct gt97xx *gt97xx)
> +{
> +	int ret;
> +	u64 ic_id;
> +	struct i2c_client *client = v4l2_get_subdevdata(&gt97xx->sd);
> +
> +	ret = cci_read(gt97xx->regmap, gt97xx->chip->regs[GT_IC_INFO_REG],
> +		       &ic_id, NULL);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ic_id != gt97xx->chip->id) {
> +		dev_err(&client->dev, "chip id mismatch: 0x%x!=0x%llx",
> +			gt97xx->chip->id, ic_id);
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +
> +static int gt97xx_init(struct gt97xx *gt97xx)
> +{
> +	int ret, val;
> +
> +	ret = gt97xx_identify_module(gt97xx);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Reset PD_CONTROL */
> +	ret = cci_write(gt97xx->regmap,
> +			gt97xx->chip->regs[GT_RING_PD_CONTROL_REG],
> +			GT97XX_PD_MODE_OFF, NULL);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Need waiting delay time after PD reset */
> +	fsleep(GT97XX_SLEEP_US);
> +
> +	/* Enable ACC mode */
> +	ret = cci_write(gt97xx->regmap,
> +			gt97xx->chip->regs[GT_RING_PD_CONTROL_REG],
> +			GT97XX_AAC_MODE_EN, NULL);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (val = gt97xx->focus->val % GT97XX_MOVE_STEPS;
> +	     val <= gt97xx->focus->val; val += GT97XX_MOVE_STEPS) {
> +		ret = gt97xx_set_dac(gt97xx, val);
> +		if (ret)
> +			return ret;
> +
> +		fsleep(GT97XX_SLEEP_US);
> +	}
> +
> +	return 0;
> +}
> +
> +static int gt97xx_release(struct gt97xx *gt97xx)
> +{
> +	int ret, val;
> +
> +	val = round_down(gt97xx->focus->val, GT97XX_MOVE_STEPS);
> +	for (; val >= 0; val -= GT97XX_MOVE_STEPS) {
> +		ret = gt97xx_set_dac(gt97xx, val);
> +		if (ret)
> +			return ret;
> +
> +		fsleep(GT97XX_SLEEP_US);
> +	}
> +
> +	return 0;
> +}
> +
> +static int gt97xx_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct gt97xx *gt97xx = sd_to_gt97xx(sd);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(gt97xx_supply_names),
> +				    gt97xx->supplies);
> +	if (ret < 0)
> +		dev_err(dev, "failed to enable regulators\n");
> +
> +	return ret;
> +}
> +
> +static int gt97xx_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct gt97xx *gt97xx = sd_to_gt97xx(sd);
> +	int ret;
> +
> +	ret = regulator_bulk_disable(ARRAY_SIZE(gt97xx_supply_names),
> +				     gt97xx->supplies);
> +	if (ret < 0)
> +		dev_err(dev, "failed to disable regulators\n");
> +
> +	return ret;
> +}
> +
> +static int gt97xx_runtime_suspend(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct gt97xx *gt97xx = sd_to_gt97xx(sd);
> +
> +	gt97xx_release(gt97xx);
> +	gt97xx_power_off(dev);
> +
> +	return 0;
> +}
> +
> +static int gt97xx_runtime_resume(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct gt97xx *gt97xx = sd_to_gt97xx(sd);
> +	int ret;
> +
> +	ret = gt97xx_power_on(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to power_on\n");
> +		return ret;
> +	}
> +
> +	/* Need waited before sending I2C commands after power-up */
> +	fsleep(GT97XX_SLEEP_US);
> +
> +	ret = gt97xx_init(gt97xx);
> +	if (ret < 0)
> +		goto disable_power;
> +
> +	return 0;
> +
> +disable_power:
> +	gt97xx_power_off(dev);
> +
> +	return ret;
> +}
> +
> +static int gt97xx_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct gt97xx *gt97xx =
> +		container_of(ctrl->handler, struct gt97xx, ctrls);
> +
> +	if (ctrl->id == V4L2_CID_FOCUS_ABSOLUTE)
> +		return gt97xx_set_dac(gt97xx, ctrl->val);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops gt97xx_ctrl_ops = {
> +	.s_ctrl = gt97xx_set_ctrl,
> +};
> +
> +static int gt97xx_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	return pm_runtime_resume_and_get(sd->dev);
> +}
> +
> +static int gt97xx_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	return pm_runtime_put(sd->dev);
> +}
> +
> +static const struct v4l2_subdev_internal_ops gt97xx_int_ops = {
> +	.open = gt97xx_open,
> +	.close = gt97xx_close,
> +};
> +
> +static const struct v4l2_subdev_core_ops gt97xx_core_ops = {
> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_ops gt97xx_ops = {
> +	.core = &gt97xx_core_ops,
> +};
> +
> +static int gt97xx_init_controls(struct gt97xx *gt97xx)
> +{
> +	struct v4l2_ctrl_handler *hdl = &gt97xx->ctrls;
> +	const struct v4l2_ctrl_ops *ops = &gt97xx_ctrl_ops;
> +
> +	v4l2_ctrl_handler_init(hdl, 1);
> +
> +	gt97xx->focus = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FOCUS_ABSOLUTE, 0,
> +					  GT97XX_MAX_FOCUS_POS,
> +					  1, 0);
> +
> +	if (hdl->error)
> +		return hdl->error;
> +
> +	gt97xx->sd.ctrl_handler = hdl;
> +
> +	return 0;
> +}
> +
> +static int gt97xx_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct gt97xx *gt97xx;
> +	unsigned int i;
> +	int ret;
> +
> +	gt97xx = devm_kzalloc(dev, sizeof(*gt97xx), GFP_KERNEL);
> +	if (!gt97xx)
> +		return -ENOMEM;
> +
> +	gt97xx->regmap = devm_cci_regmap_init_i2c(client, 8);
> +	if (IS_ERR(gt97xx->regmap))
> +		return dev_err_probe(dev, PTR_ERR(gt97xx->regmap),
> +				     "failed to init CCI\n");
> +
> +	/* Initialize subdev */
> +	v4l2_i2c_subdev_init(&gt97xx->sd, client, &gt97xx_ops);
> +
> +	gt97xx->chip = device_get_match_data(dev);
> +
> +	for (i = 0; i < ARRAY_SIZE(gt97xx_supply_names); i++)
> +		gt97xx->supplies[i].supply = gt97xx_supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(gt97xx_supply_names),
> +				      gt97xx->supplies);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret,
> +				     "failed to get regulators\n");
> +
> +	/* Initialize controls */
> +	ret = gt97xx_init_controls(gt97xx);
> +	if (ret)
> +		goto err_free_handler;
> +
> +	/* Initialize subdev */
> +	gt97xx->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	gt97xx->sd.internal_ops = &gt97xx_int_ops;
> +	gt97xx->sd.entity.function = MEDIA_ENT_F_LENS;
> +
> +	ret = media_entity_pads_init(&gt97xx->sd.entity, 0, NULL);
> +	if (ret < 0)
> +		goto err_free_handler;
> +
> +	/* Power on and initialize hardware */
> +	ret = gt97xx_runtime_resume(dev);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "failed to power on\n");
> +		goto err_clean_entity;
> +	}
> +
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_idle(dev);
> +
> +	ret = v4l2_async_register_subdev(&gt97xx->sd);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "failed to register V4L2 subdev\n");
> +		goto err_power_off;
> +	}
> +
> +	return 0;
> +
> +err_power_off:
> +	pm_runtime_disable(dev);
> +err_clean_entity:
> +	media_entity_cleanup(&gt97xx->sd.entity);
> +err_free_handler:
> +	v4l2_ctrl_handler_free(&gt97xx->ctrls);
> +
> +	return ret;
> +}
> +
> +static void gt97xx_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct gt97xx *gt97xx = sd_to_gt97xx(sd);
> +
> +	v4l2_async_unregister_subdev(&gt97xx->sd);
> +	v4l2_ctrl_handler_free(&gt97xx->ctrls);
> +	media_entity_cleanup(&gt97xx->sd.entity);
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		gt97xx_runtime_suspend(&client->dev);
> +	pm_runtime_set_suspended(&client->dev);
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(gt97xx_pm_ops,
> +				 gt97xx_runtime_suspend,
> +				 gt97xx_runtime_resume,
> +				 NULL);
> +
> +static const struct vcm_giantec_of_data gt9768_data = {
> +	.id = GT9768_ID,
> +	.regs[GT_IC_INFO_REG] = GT97XX_IC_INFO_REG,
> +	.regs[GT_RING_PD_CONTROL_REG] = GT97XX_RING_PD_CONTROL_REG,
> +	.regs[GT_DAC_ADDR_REG] = GT97XX_DAC_ADDR_REG,
> +};
> +
> +static const struct vcm_giantec_of_data gt9769_data = {
> +	.id = GT9769_ID,
> +	.regs[GT_IC_INFO_REG] = GT97XX_IC_INFO_REG,
> +	.regs[GT_RING_PD_CONTROL_REG] = GT97XX_RING_PD_CONTROL_REG,
> +	.regs[GT_DAC_ADDR_REG] = GT97XX_DAC_ADDR_REG,
> +};
> +
> +static const struct of_device_id gt97xx_of_table[] = {
> +	{ .compatible = "giantec,gt9768", .data = &gt9768_data },
> +	{ .compatible = "giantec,gt9769", .data = &gt9769_data },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, gt97xx_of_table);
> +
> +static struct i2c_driver gt97xx_i2c_driver = {
> +	.driver = {
> +		.name = GT97XX_NAME,
> +		.pm = pm_ptr(&gt97xx_pm_ops),
> +		.of_match_table = gt97xx_of_table,
> +	},
> +	.probe = gt97xx_probe,
> +	.remove = gt97xx_remove,
> +};
> +module_i2c_driver(gt97xx_i2c_driver);
> +
> +MODULE_AUTHOR("Zhi Mao <zhi.mao@mediatek.com>");
> +MODULE_DESCRIPTION("GT97xx VCM driver");
> +MODULE_LICENSE("GPL");




