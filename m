Return-Path: <linux-media+bounces-22134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 976179DA3FA
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 09:32:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03E57B25B4B
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 08:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094B818C34B;
	Wed, 27 Nov 2024 08:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lHSrWOwd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D12DC133;
	Wed, 27 Nov 2024 08:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732696317; cv=none; b=R+zTP+hyq3kpo+05u8I0ueVO/vGfNJUtlLYnpw37H98bfogZdlcPY6RzAR39UDzYt0SKn/yIwblYYSFQv3S9ujjz8FTSfVzku3SHPnTnU3zYBCvUxBfj6ymCeClx2uIix/tGybkevupUGu8PpqEjOq/msb0VbyZF7SuuZJIyMCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732696317; c=relaxed/simple;
	bh=zQqXeiGh/GI1HhfGcPBEm+TPwHWnClOwK1Q+tF6nli4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EdhaicEvvL2Vw2efAofLP0G/pg2A1pnUQu6BMbPkiYzz0thCGkG6UQIplxLYqRnoltKlPvRCyjl2eQgDgYymm7FcxfE9z1k6KuXRA0Tk1tZCxw838Tjp94l9zU418X4hB+giweSHkUph5eL8SmmNjCCRg+BTk6oPX1LAarPoyOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lHSrWOwd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4634EC4CECC;
	Wed, 27 Nov 2024 08:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732696316;
	bh=zQqXeiGh/GI1HhfGcPBEm+TPwHWnClOwK1Q+tF6nli4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lHSrWOwdKV8m+2HYch+WjdXi8HmkCUH/x7xKqPxwn4TeG25QumOQLf2P69okIOETJ
	 HM3zJYYAdVsEL82uQHAkQtIdftd0gjTDSTG/zjuEitq58nGsLHuK46L9C00rGiN2YO
	 22//QLjcYYlLsRBhSVmX9MJMOJkdZ1laZSJIvM1xZT83Swq+yfYwwx0xRd2I3TWHJS
	 rmgY/+BdwACSN/wJd8OSGJZ7pwVWVbHr+VTrnkugj6ONtOl3iNt2GSoUy+PIxaES6A
	 pWqDaMddme+GGxzHOFLUQEl6Z+7Ehw6rbqejGfELbYmlB5KKrBbPmrjShjJjJTbCjB
	 jg78029B7pBog==
Date: Wed, 27 Nov 2024 09:31:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	hverkuil-cisco@xs4all.nl, laurent.pinchart+renesas@ideasonboard.com, robh@kernel.org, 
	krzk+dt@kernel.org, bryan.odonoghue@linaro.org, laurentiu.palcu@nxp.com, 
	robert.chiras@nxp.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	LnxRevLi@nxp.com, kieran.bingham@ideasonboard.com, hdegoede@redhat.com, 
	dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com, alain.volmat@foss.st.com, 
	devicetree@vger.kernel.org, conor+dt@kernel.org, alexander.stein@ew.tq-group.com, 
	umang.jain@ideasonboard.com, zhi.mao@mediatek.com, festevam@denx.de, 
	julien.vuillaumier@nxp.com, alice.yuan@nxp.com
Subject: Re: [PATCH v2 2/4] media: ox05b1s: Add omnivision OX05B1S raw sensor
 driver
Message-ID: <3g7utet7n4gkhuc4wmq23n45u35n2nmuoyizled5lb3ra23ar4@nuf2ekb7houm>
References: <20241126155100.1263946-1-mirela.rabulea@nxp.com>
 <20241126155100.1263946-3-mirela.rabulea@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241126155100.1263946-3-mirela.rabulea@nxp.com>

On Tue, Nov 26, 2024 at 05:50:58PM +0200, Mirela Rabulea wrote:
> +struct ox05b1s {
> +	struct i2c_client *i2c_client;
> +	struct regmap *regmap;
> +	struct gpio_desc *rst_gpio;
> +	struct regulator_bulk_data supplies[OX05B1S_NUM_SUPPLIES];
> +	struct clk *sensor_clk;
> +	const struct ox05b1s_plat_data *model;
> +	struct v4l2_subdev subdev;
> +	struct media_pad pads[OX05B1S_SENS_PADS_NUM];
> +	const struct ox05b1s_mode *mode;
> +	struct mutex lock; /* sensor lock */
> +	u32 stream_status;
> +	struct ox05b1s_ctrls ctrls;
> +};
> +
> +static struct ox05b1s_mode ox05b1s_supported_modes[] = {

This is const, I think.

> +	{
> +		.index		= 0,
> +		.width		= 2592,
> +		.height		= 1944,
> +		.code		= MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.bpp		= 10,
> +		.vts		= 0x850,
> +		.hts		= 0x2f0,
> +		.exp		= 0x850 - 8,
> +		.h_bin		= false,
> +		.fps		= 30,
> +		.reg_data	= ox05b1s_reglist_2592x1944,
> +	}, {
> +		/* sentinel */
> +	}
> +};

...

> +	ret = ox05b1s_read_reg(sensor, OX05B1S_REG_CHIP_ID_23_16, &reg_val);
> +	chip_id |= reg_val << 16;
> +	ret |= ox05b1s_read_reg(sensor, OX05B1S_REG_CHIP_ID_15_8, &reg_val);
> +	chip_id |= reg_val << 8;
> +	ret |= ox05b1s_read_reg(sensor, OX05B1S_REG_CHIP_ID_7_0, &reg_val);
> +	chip_id |= reg_val;
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
> +		dev_info(dev, "Camera %s detected, chip_id=%x\n", camera_name, chip_id);

Device should be silent on success. This can be dev_dbg.

> +	} else {
> +		dev_err(dev, "Detected %s camera (chip_id=%x), but expected %s (chip_id=%x)\n",
> +			camera_name, chip_id, sensor->model->name, sensor->model->chip_id);
> +		ret = -ENODEV;
> +	}
> +
> +	return ret;
> +}
> +
> +static int ox05b1s_probe(struct i2c_client *client)
> +{
> +	int retval;
> +	struct device *dev = &client->dev;
> +	struct v4l2_subdev *sd;
> +	struct ox05b1s *sensor;
> +
> +	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
> +	if (!sensor)
> +		return -ENOMEM;
> +
> +	sensor->regmap = devm_regmap_init_i2c(client, &ox05b1s_regmap_config);
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
> +	if (IS_ERR(sensor->sensor_clk)) {

No need for {}, some left-over from old version.

Best regards,
Krzysztof


