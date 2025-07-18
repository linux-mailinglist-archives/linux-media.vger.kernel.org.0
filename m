Return-Path: <linux-media+bounces-38048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2079B09BF3
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 09:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2C173B62ED
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 07:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7403215043;
	Fri, 18 Jul 2025 07:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tc//UP8r"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACA8D517;
	Fri, 18 Jul 2025 07:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752822442; cv=none; b=uVmN+XN79wXKogxuYFBw8EWgrA9GkQoQtBoDHetkcb051PXwyFkbOqKC+brULuyn7mgVOxZiU5Kugcfvt9hmdD6UDKCHuPDrirT0RvYRLxpwjwa2jtH/kcYf2/IeqwNTBXgTmNhrHbG9Iaed8Ms2WHJdnUMWe0+x8p0TNBAnH4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752822442; c=relaxed/simple;
	bh=4c2a7Bf7SzZQuDn6bOjk/Af9Oa+gBXsgstRW7CT10dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XM6Yu8LHlnaR3WVMdnAg/vzi8CMOfBgLHOKnHFrDGZzMDyPpJzxwhpXfpk7L8/xqTpCzw9An4OoZIpwGnuOwxN5DRAm1+WWqmGr5QHD+81/uo5SnmQzriIrgQDsv1t43aCfulunUYnlmd6AVWHsZBPzM1tgqPeFNYiiAohKi6x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tc//UP8r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D1E4C4CEED;
	Fri, 18 Jul 2025 07:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752822440;
	bh=4c2a7Bf7SzZQuDn6bOjk/Af9Oa+gBXsgstRW7CT10dw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tc//UP8rLfblzzA4U6DaXbfNePdWI/eoOccX2Q/taebW84mcX1ldkxLjPOqLUeUUQ
	 k8TgbLvQVzzHUhHDAJTQnWyADrwzRU6VMyIiNtIvU4o5H6Ea7FuyVTE8zDiZVdn3+9
	 59qfAvN6fLVTveUIVPYafRY2R/1jLrESINm6iixK3tK/Of/1MpOzNrHO9gTIn3uEfo
	 J86Wq8AE38L/2qM3ratay24V+7Ap2rK03S1bNMNDwry1EEcwaToM3A0+CQMplfhnKB
	 QghcS6U9dZCUgNu1NQVh2zJn3vu56tgn/NLxoeJUj/IdW0FPOYpChQr3iTiqFbWKaw
	 493+6SCfyXlSQ==
Message-ID: <fa9a1084-9e90-497a-bf28-579a20a293bc@kernel.org>
Date: Fri, 18 Jul 2025 09:07:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: Add OmniVision OV6211 image sensor driver
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250717124001.108486-1-vladimir.zapolskiy@linaro.org>
 <20250717124001.108486-3-vladimir.zapolskiy@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250717124001.108486-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/07/2025 14:40, Vladimir Zapolskiy wrote:
> +
> +static int ov6211_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov6211 *ov6211 = to_ov6211(sd);
> +	int ret;
> +
> +	if (ov6211->avdd) {
> +		ret = regulator_enable(ov6211->avdd);

You should just use bulk API and simplify all the regulator handling code.

> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (ov6211->dovdd) {
> +		ret = regulator_enable(ov6211->dovdd);
> +		if (ret)
> +			goto avdd_disable;
> +	}
> +
> +	if (ov6211->dvdd) {
> +		ret = regulator_enable(ov6211->dvdd);
> +		if (ret)
> +			goto dovdd_disable;
> +	}
> +
> +	gpiod_set_value_cansleep(ov6211->reset_gpio, 0);
> +	usleep_range(10 * USEC_PER_MSEC, 15 * USEC_PER_MSEC);
> +
> +	ret = clk_prepare_enable(ov6211->xvclk);
> +	if (ret)
> +		goto dvdd_disable;
> +
> +	return 0;
> +
> +dvdd_disable:
> +	if (ov6211->dvdd)
> +		regulator_disable(ov6211->dvdd);
> +dovdd_disable:
> +	if (ov6211->dovdd)
> +		regulator_disable(ov6211->dovdd);
> +avdd_disable:
> +	if (ov6211->avdd)
> +		regulator_disable(ov6211->avdd);
> +
> +	return ret;
> +}
> +
> +static int ov6211_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov6211 *ov6211 = to_ov6211(sd);
> +
> +	clk_disable_unprepare(ov6211->xvclk);
> +
> +	gpiod_set_value_cansleep(ov6211->reset_gpio, 1);
> +
> +	if (ov6211->dvdd)
> +		regulator_disable(ov6211->dvdd);
> +
> +	if (ov6211->dovdd)
> +		regulator_disable(ov6211->dovdd);
> +
> +	if (ov6211->avdd)
> +		regulator_disable(ov6211->avdd);
> +
> +	return 0;
> +}
> +
> +static void ov6211_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov6211 *ov6211 = to_ov6211(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(sd->ctrl_handler);
> +	pm_runtime_disable(&client->dev);
> +	mutex_destroy(&ov6211->mutex);
> +}
> +
> +static int ov6211_probe(struct i2c_client *client)
> +{
> +	struct ov6211 *ov6211;
> +	unsigned long freq;
> +	int ret;
> +
> +	ov6211 = devm_kzalloc(&client->dev, sizeof(*ov6211), GFP_KERNEL);
> +	if (!ov6211)
> +		return -ENOMEM;
> +
> +	v4l2_i2c_subdev_init(&ov6211->sd, client, &ov6211_subdev_ops);
> +
> +	ov6211->xvclk = devm_clk_get_optional(&client->dev, NULL);
> +	if (IS_ERR(ov6211->xvclk)) {
> +		ret = PTR_ERR(ov6211->xvclk);
> +		dev_err(&client->dev, "failed to get XVCLK clock: %d\n", ret);
> +		return ret;

syntax is always: return dev_err_probe

> +	}
> +
> +	freq = clk_get_rate(ov6211->xvclk);
> +	if (freq && freq != OV6211_MCLK_FREQ_24MHZ)
> +		return dev_err_probe(&client->dev, -EINVAL,
> +				"XVCLK clock frequency %lu is not supported\n",
> +				freq);
> +
> +	ret = ov6211_check_hwcfg(ov6211);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to check HW configuration: %d",
> +			ret);
> +		return ret;
> +	}
> +
> +	ov6211->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
> +						     GPIOD_OUT_HIGH);
> +	if (IS_ERR(ov6211->reset_gpio)) {
> +		dev_err(&client->dev, "cannot get reset GPIO\n");
> +		return PTR_ERR(ov6211->reset_gpio);

syntax is always: return dev_err_probe

> +	}
> +
> +	ov6211->avdd = devm_regulator_get_optional(&client->dev, "avdd");
> +	if (IS_ERR(ov6211->avdd)) {
> +		ret = PTR_ERR(ov6211->avdd);
> +		if (ret != -ENODEV) {
> +			dev_err_probe(&client->dev, ret,
> +				      "Failed to get 'avdd' regulator\n");

syntax is always: return dev_err_probe

> +			return ret;
> +		}
> +
> +		ov6211->avdd = NULL;
> +	}
> +
> +	ov6211->dovdd = devm_regulator_get_optional(&client->dev, "dovdd");
> +	if (IS_ERR(ov6211->dovdd)) {
> +		ret = PTR_ERR(ov6211->dovdd);
> +		if (ret != -ENODEV) {
> +			dev_err_probe(&client->dev, ret,
> +				      "Failed to get 'dovdd' regulator\n");
> +			return ret;
> +		}
> +
> +		ov6211->dovdd = NULL;
> +	}
> +
> +	ov6211->dvdd = devm_regulator_get_optional(&client->dev, "dvdd");
> +	if (IS_ERR(ov6211->dvdd)) {
> +		ret = PTR_ERR(ov6211->dvdd);
> +		if (ret != -ENODEV) {
> +			dev_err_probe(&client->dev, ret,
> +				      "Failed to get 'dvdd' regulator\n");
> +			return ret;
> +		}
> +
> +		ov6211->dvdd = NULL;
> +	}
> +
> +	/* The sensor must be powered on to read the CHIP_ID register */
> +	ret = ov6211_power_on(&client->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = ov6211_identify_module(ov6211);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to find sensor: %d\n", ret);
> +		goto power_off;
> +	}
> +
> +	mutex_init(&ov6211->mutex);
> +	ov6211->cur_mode = &supported_modes[0];
> +	ret = ov6211_init_controls(ov6211);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to init controls: %d\n", ret);
> +		goto probe_error_v4l2_ctrl_handler_free;
> +	}
Best regards,
Krzysztof

