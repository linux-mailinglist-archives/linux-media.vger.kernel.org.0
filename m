Return-Path: <linux-media+bounces-50095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BFDCFC05F
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 05:55:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F3E6302C4C3
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 04:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310E225A655;
	Wed,  7 Jan 2026 04:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C6Eb3WuU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25E923BCFD
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 04:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767761743; cv=none; b=FyVk2UiPHXihABBDzE18zt2yMwuff9/wLaKffeDj8zVanrCGBMvVvO1A/EbBITW74f6Qs35d68+7SADk2pAWL53ZbNSVtW3NrGThKwO2gY0SabpqN7Ci77vP7WOSjmsWnvI+FEZKlj2P1cCUIGE4Wm576c/GeswFdniq2kxNXzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767761743; c=relaxed/simple;
	bh=k3VU8pVa+zcArKJSszjtlu1gt5+JqWQlAg0N74VpWnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=me4QN2HHsRzB4mAgj84V/AnNB0/bFAIjQDJeCROuHS082dLVvWC3l1xcnumwRLmab6A//of8CEbEoMo7uoh+QZ+p8ddCgQmU16AZx8cG9MYu4OtllakkNl4yPclGk/30ekjgetw5BdjRU74OD4P+16k9vgjjxLwdyhH8z/LbmQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C6Eb3WuU; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-382ff96b169so607161fa.2
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 20:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767761739; x=1768366539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lY/y610Y+So4BY1xbixWu44nr5W6Pip/emTP4NAOVU=;
        b=C6Eb3WuUROpyJFWIckBuCb7U4JcbD54D8nW0y/Uo7LhccPmMhpnmaLp2hxwGz5H+Am
         L8Pn9sXYHud9arXqMlipf0AW+FnQoxuvP852jzX01Ho0QN2OFpVtgV9DEchW7gI7OXHb
         e+SFRjahUYytsqE/+SVjIThFy3O78ZJ2RdUfaiPW1K4aH9bjQxY9OfehFLcU8HpE7vg0
         RzDyG30XneqQgoyqTLu7bJXBLvPdeMpTMpBy4sAnTEf+/VH+9kvynzsG36rpyJtUzblq
         VDBrZcdc11Or3zxsBRc9136sRWCAfXejPheAL0wjrjlgTJBtwMtsq54G1RPtYN9/Ir6n
         UofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767761739; x=1768366539;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6lY/y610Y+So4BY1xbixWu44nr5W6Pip/emTP4NAOVU=;
        b=VpXMplCcgFxuK93kqkHkbVh0mF14Eshaw9sIGqj5iDa4Ur53QLssMjGE18kZva7WIh
         mjK82WboVxJYSe13V9JiiMGip3tCu9AACfNn7lfhUF6UlQ2noQ77O/wHlXDC9m4xZ4Rb
         tz71Oe2+25BqPz76npORMgQjxWj3ICCr/hbJIAClhUrMb2a52TWQkIml2AusRwk9jQfR
         qja0uj7Ddijk+t0bELeaew7fViB26/CMx2Gz2xS7o4b3mqhoPDUNvJxJ5t5swXPfTOzB
         ztUFuDUerTb+hrJiKTCyorQZyuskyeotuf4N14wkK2ZNOMwJaCUkCn3kEGy3onQPY1yA
         BVXA==
X-Forwarded-Encrypted: i=1; AJvYcCWd6260fX09yHO8ijybpoJlsOATzV0PlOsCD+++HGw0mF9ZYnPOvLFN2cj1sBQgVF8WfomMDL8fhJu8Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzii+kHQvMTHfBjdulw6BeajR7vt/zw390kkEnCjN+2kHrKenwE
	z91j4+F+J/IN66p3AjN6EfeDKlIdvLDxc+zDHlaSv5+O37aqwSbKZLOdvfyTdYEYDxw=
X-Gm-Gg: AY/fxX7gvPTSS1UaSm0ItyEsxqrHbQpaij559E/YMubw7fTFOctSVDWq0j/T6R+SFDd
	/4+R7intKRc5D6HdbdiptdpOvI4MNxDmyDm5hl7O+72CE+HU6R4b7b4uy1K9KqVhHVg4KM0RsXE
	Tu26Q+SHCM1pLpZFZfkhPDpOkXHUvAw+6O1TYOA1mRBgP/FyB1gL90gbottYxYflDrefEYycmxQ
	iGVqvfdaMt3kTc/sdQUfclzu6gWohvNZbLSRLnooQeExRLbBZj2CN6YzMaaOcED5MV33VumbDX9
	acmPOxAvtpjMWniY1cNMphcpqilreg/CxEFX8hILOHbanWFs3LbUJoUcfKK1ZGx8DjB/Lo10Ie3
	mK6Uz1VKYeqkkvTv4yyyfsr0lAv2rRbrWzQwX577w7+hDS31WGNmp+CW2C7G22RyzyvuL9CD5rP
	OsgotuZhM3kiTJJl1UtYVV1AtpUnKhZliz1+RtNeeohBgfGsGGABCAMncJXjJ1E4iKTw==
X-Google-Smtp-Source: AGHT+IHmkWmOO+nGVqeuCNPRI+VNLyup7W3uSelUr3ewjpzNVcpS+K9l2rJoq4TzXrKyh6/IjFCz7g==
X-Received: by 2002:a05:6512:3e03:b0:597:d790:a1a2 with SMTP id 2adb3069b0e04-59b6f0430c5mr251151e87.8.1767761738866;
        Tue, 06 Jan 2026 20:55:38 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6ff62808sm224654e87.100.2026.01.06.20.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 20:55:38 -0800 (PST)
Message-ID: <60c1b9d1-f6bf-456f-aa2f-a9854024c755@linaro.org>
Date: Wed, 7 Jan 2026 06:55:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] media: i2c: imx355: Support devicetree and power
 management
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Robert Mader <robert.mader@collabora.com>, Bryan O'Donoghue
 <bod@kernel.org>, David Heidelberg <david@ixit.cz>,
 phone-devel@vger.kernel.org
References: <20260107043044.92485-1-mailingradian@gmail.com>
 <20260107043044.92485-3-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260107043044.92485-3-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Richard.

On 1/7/26 06:30, Richard Acayan wrote:
> A device tree compatible makes it possible for this driver to be used on
> Open Firmware devices. Initialization of power-managed resources such as
> the reset GPIO and voltage regulators can be specified in the device
> tree and handled by the driver. Add support for this so the Pixel 3a can
> use the driver.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Nacked-by: Krzysztof Kozlowski <krzk@kernel.org>

Eventually you (almost) resolved the asks to have active low reset GPIO
in the driver, thus you should not add the imaginary "Nacked" tag, unless
you wish your changes to be plainly ignored.

> ---
>   drivers/media/i2c/imx355.c | 116 ++++++++++++++++++++++++++++++++++---
>   1 file changed, 108 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 776107efe386..4ac8495d1a3d 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -3,9 +3,13 @@
>   
>   #include <linux/acpi.h>
>   #include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>   #include <linux/i2c.h>
>   #include <linux/module.h>
> +#include <linux/of.h>
>   #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>   #include <linux/unaligned.h>
>   
>   #include <media/v4l2-ctrls.h>
> @@ -125,6 +129,15 @@ struct imx355 {
>   	 * Protect access to sensor v4l2 controls.
>   	 */
>   	struct mutex mutex;
> +
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data *supplies;
> +};
> +
> +static const struct regulator_bulk_data imx355_supplies[] = {
> +	{ .supply = "avdd" },
> +	{ .supply = "dvdd" },
> +	{ .supply = "dovdd" },
>   };
>   
>   static const struct imx355_reg imx355_global_regs[] = {
> @@ -1515,6 +1528,55 @@ static const struct v4l2_subdev_internal_ops imx355_internal_ops = {
>   	.open = imx355_open,
>   };
>   
> +static int imx355_power_off(struct device *dev)
> +{
> +	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx355 *imx355 = to_imx355(sd);
> +
> +	gpiod_set_value_cansleep(imx355->reset_gpio, 1);
> +
> +	regulator_bulk_disable(ARRAY_SIZE(imx355_supplies), imx355->supplies);
> +	clk_disable_unprepare(imx355->clk);
> +
> +	return 0;
> +}
> +
> +static int imx355_power_on(struct device *dev)
> +{
> +	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx355 *imx355 = to_imx355(sd);
> +	int ret;
> +
> +	ret = clk_prepare_enable(imx355->clk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(imx355_supplies),
> +				    imx355->supplies);
> +	if (ret) {
> +		dev_err(dev, "failed to enable regulators: %d\n", ret);
> +		goto error_disable_clocks;
> +	}
> +
> +	gpiod_set_value_cansleep(imx355->reset_gpio, 1);
> +	usleep_range(5000, 5100);
> +	gpiod_set_value_cansleep(imx355->reset_gpio, 0);
> +	usleep_range(8000, 8100);
> +
> +	return 0;
> +
> +error_disable_clocks:
> +	clk_disable_unprepare(imx355->clk);
> +	return ret;
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(imx355_pm_ops, imx355_power_off,
> +				 imx355_power_on, NULL);
> +
>   /* Initialize control handlers */
>   static int imx355_init_controls(struct imx355 *imx355)
>   {
> @@ -1689,16 +1751,26 @@ static int imx355_probe(struct i2c_client *client)
>   				     "external clock %lu is not supported\n",
>   				     freq);
>   
> -	/* Initialize subdev */
> -	v4l2_i2c_subdev_init(&imx355->sd, client, &imx355_subdev_ops);
> -
> -	/* Check module identity */
> -	ret = imx355_identify_module(imx355);
> +	ret = devm_regulator_bulk_get_const(imx355->dev,
> +				      ARRAY_SIZE(imx355_supplies),
> +				      imx355_supplies,
> +				      &imx355->supplies);
>   	if (ret) {
> -		dev_err(imx355->dev, "failed to find sensor: %d", ret);
> +		dev_err_probe(imx355->dev, ret, "could not get regulators");
>   		goto error_probe;
>   	}
>   
> +	imx355->reset_gpio = devm_gpiod_get_optional(imx355->dev, "reset",
> +						     GPIOD_OUT_LOW);

Like I stated it before, it should be GPIOD_OUT_HIGH here, the driver probe
shall be done, when a sensor is in the defined reset state. Make this change.

> +	if (IS_ERR(imx355->reset_gpio)) {
> +		ret = dev_err_probe(imx355->dev, PTR_ERR(imx355->reset_gpio),
> +				    "failed to get gpios");
> +		goto error_probe;
> +	}
> +
> +	/* Initialize subdev */
> +	v4l2_i2c_subdev_init(&imx355->sd, client, &imx355_subdev_ops);
> +
>   	imx355->hwcfg = imx355_get_hwcfg(imx355->dev);
>   	if (!imx355->hwcfg) {
>   		dev_err(imx355->dev, "failed to get hwcfg");
> @@ -1706,13 +1778,26 @@ static int imx355_probe(struct i2c_client *client)
>   		goto error_probe;
>   	}
>   
> +	ret = imx355_power_on(imx355->dev);
> +	if (ret) {
> +		dev_err(imx355->dev, "failed to power on sensor: %d", ret);
> +		goto error_probe;
> +	}
> +
> +	/* Check module identity */
> +	ret = imx355_identify_module(imx355);
> +	if (ret) {
> +		dev_err(imx355->dev, "failed to find sensor: %d", ret);
> +		goto error_power_off;
> +	}
> +
>   	/* Set default mode to max resolution */
>   	imx355->cur_mode = &supported_modes[0];
>   
>   	ret = imx355_init_controls(imx355);
>   	if (ret) {
>   		dev_err(imx355->dev, "failed to init controls: %d", ret);
> -		goto error_probe;
> +		goto error_power_off;
>   	}
>   
>   	/* Initialize subdev */
> @@ -1752,6 +1837,9 @@ static int imx355_probe(struct i2c_client *client)
>   error_handler_free:
>   	v4l2_ctrl_handler_free(imx355->sd.ctrl_handler);
>   
> +error_power_off:
> +	imx355_power_off(imx355->dev);
> +
>   error_probe:
>   	mutex_destroy(&imx355->mutex);
>   
> @@ -1768,7 +1856,11 @@ static void imx355_remove(struct i2c_client *client)
>   	v4l2_ctrl_handler_free(sd->ctrl_handler);
>   
>   	pm_runtime_disable(imx355->dev);
> -	pm_runtime_set_suspended(imx355->dev);
> +
> +	if (!pm_runtime_status_suspended(imx355->dev)) {
> +		imx355_power_off(imx355->dev);
> +		pm_runtime_set_suspended(imx355->dev);
> +	}
>   
>   	mutex_destroy(&imx355->mutex);
>   }
> @@ -1779,10 +1871,18 @@ static const struct acpi_device_id imx355_acpi_ids[] __maybe_unused = {
>   };
>   MODULE_DEVICE_TABLE(acpi, imx355_acpi_ids);
>   
> +static const struct of_device_id imx355_match_table[] __maybe_unused = {
> +	{ .compatible = "sony,imx355", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx355_match_table);
> +
>   static struct i2c_driver imx355_i2c_driver = {
>   	.driver = {
>   		.name = "imx355",
>   		.acpi_match_table = ACPI_PTR(imx355_acpi_ids),
> +		.of_match_table = imx355_match_table,
> +		.pm = &imx355_pm_ops,
>   	},
>   	.probe = imx355_probe,
>   	.remove = imx355_remove,

-- 
Best wishes,
Vladimir

