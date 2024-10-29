Return-Path: <linux-media+bounces-20475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F13E9B4244
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 07:17:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E7F128360A
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 06:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA1520103B;
	Tue, 29 Oct 2024 06:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EHZxBMVb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B9A200B86;
	Tue, 29 Oct 2024 06:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730182634; cv=none; b=dVoTFTN6s9sPvt8P7KM8a55T7Q35gntj1Ciu6UytMFy6LFyM6YwulXn0kiAQ3n7fNTmfU3bdF+8Qgz9aE/Lf1f1+BQvCjXQOFKop0b/pqjNslRSmY1NP4B3aLGlhsEimhmCxh6xuwHDKmrLi+FR7kj4MFpjsaJ42g50fIpjekbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730182634; c=relaxed/simple;
	bh=CYehLBoeRXbHeH5sFuUstCJj5i/2RXTD4+e01QgW2To=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rDVBIZGen4k6Nr5J1zEisjZSCpMEOst3mjPvkkwNIfwcvree9s5DxzVEIH72uZBOXiinpDfPnHPLfnwFF35KOF1l0/7jlHD4WDlqndh0nY0RgB93DVp/HBcY/+q+byZfomCgiXZ94pfh1PZC0kibMX5m3ZyisQws8CtzTjQRoUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EHZxBMVb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855B1C4CECD;
	Tue, 29 Oct 2024 06:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730182633;
	bh=CYehLBoeRXbHeH5sFuUstCJj5i/2RXTD4+e01QgW2To=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EHZxBMVb2AjxWEz8ZWZ2LDAj5oeedux4gQc0Mr8Wy1hjO+xqLqLiTbMjH3R5S1O9v
	 GyOkgIKyuwI44tkRh6u0XMVVTok8BgUKOFV/B6H+0wVAxM68YcsBHRqAPifAzEGWGl
	 6RJWZbV8Q/0+6903TWuDRQrpYP51HQEgJXu3/isJBCKo7p56F+0twk20wTqK/6G5tz
	 MnpK3xeo0rjWTL5BtCal9b+sd1AaGhb1oyNmWb05pBIM9zD4cR5kl//gxn61pfQPsR
	 ygGeedhbCBFlkZbMxXSu8amSMb1clsPM4OAcJ5sh/j+J+DtvHNf7avk1USjw5oMdYG
	 NAMzskYLjgmnw==
Message-ID: <f20c0e4a-488e-4e4e-8c15-a27df312280e@kernel.org>
Date: Tue, 29 Oct 2024 07:17:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] media: ox05b1s: Add omnivision OX05B1S raw sensor
 driver
To: Mirela Rabulea <mirela.rabulea@nxp.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, laurentiu.palcu@nxp.com,
 robert.chiras@nxp.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 LnxRevLi@nxp.com, kieran.bingham@ideasonboard.com, hdegoede@redhat.com,
 dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com,
 alain.volmat@foss.st.com, julien.vuillaumier@nxp.com, alice.yuan@nxp.com
References: <20241028190628.257249-1-mirela.rabulea@nxp.com>
 <20241028190628.257249-3-mirela.rabulea@nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241028190628.257249-3-mirela.rabulea@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/10/2024 20:06, Mirela Rabulea wrote:
> Add a v4l2 subdevice driver for the Omnivision OX05B1S RGB-IR sensor.
> 
> The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an
> active array size of 2592 x 1944.
> 
> The following features are supported for OX05B1S:
> - Manual exposure an gain control support
> - vblank/hblank control support
> - Supported resolution: 2592 x 1944 @ 30fps (SGRBG10)

...

> +
> +static const struct v4l2_subdev_ops ox05b1s_subdev_ops = {
> +	.video = &ox05b1s_subdev_video_ops,
> +	.pad   = &ox05b1s_subdev_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops ox05b1s_internal_ops = {
> +	.init_state = ox05b1s_init_state,
> +};
> +
> +static void ox05b1s_get_gpios(struct ox05b1s *sensor)
> +{
> +	struct device *dev = &sensor->i2c_client->dev;
> +
> +	sensor->rst_gpio = devm_gpiod_get_optional(dev, "reset",
> +						   GPIOD_OUT_HIGH);
> +	if (IS_ERR(sensor->rst_gpio))
> +		dev_warn(dev, "No sensor reset pin available");

Same comment as for clock further.

> +}
> +

...

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
> +	if (IS_ERR(sensor->regmap)) {
> +		dev_err(dev, "Failed to allocate sensor register map\n");

Allocation errors never result with error msg. Unless you meant
something else than allocation, but then syntax is return dev_err_probe.

> +		return PTR_ERR(sensor->regmap);
> +	}
> +
> +	sensor->i2c_client = client;
> +
> +	sensor->model = of_device_get_match_data(dev);
> +
> +	ox05b1s_get_gpios(sensor);
> +
> +	sensor->sensor_clk = devm_clk_get(dev, "csi_mclk");
> +	if (IS_ERR(sensor->sensor_clk)) {
> +		sensor->sensor_clk = NULL;
> +		dev_warn(dev, "Sensor csi_mclk is missing, using oscillator from sensor module\n");

Nope, syntax is return dev_err_probe. Why would you warn on probe deferral?

> +	}
> +


...

> +
> +module_i2c_driver(ox05b1s_i2c_driver);
> +MODULE_DESCRIPTION("Omnivision OX05B1S MIPI Camera Subdev Driver");
> +MODULE_AUTHOR("Mirela Rabulea <mirela.rabulea@nxp.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_regs_5mp.h b/drivers/media/i2c/ox05b1s/ox05b1s_regs_5mp.h
> new file mode 100644
> index 000000000000..3c34724c1d7e
> --- /dev/null
> +++ b/drivers/media/i2c/ox05b1s/ox05b1s_regs_5mp.h
> @@ -0,0 +1,1160 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * A register configuration for Omnivision OX05B1S raw camera, 2592 x 1944 @30fps BGGR10
> + * Copyright (C) 2024, NXP
> + * Copyright (C) 2024, Omnivision
> + *
> + */
> +#ifndef _OX05B1S_REGS_2592x1944_H_
> +#define _OX05B1S_REGS_2592x1944_H_
> +
> +/* 2592X1944_30FPS_FULL_RGBIr 2592 1944 */
> +static struct ox05b1s_reg ovx5b_init_setting_2592x1944[] = {

How this could be in the header? Why do you need multiple of copies of
it? No, move to the driver.



Best regards,
Krzysztof


