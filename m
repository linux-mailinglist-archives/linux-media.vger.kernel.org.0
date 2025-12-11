Return-Path: <linux-media+bounces-48628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89323CB595A
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 12:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47AA4301C95B
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 11:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1440830505C;
	Thu, 11 Dec 2025 11:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cmrz+G+E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716A32F5A1A
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 11:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765450845; cv=none; b=mDi8zOYfnGAZVy5eURLa4RDPXx46DwOLp2FFYc9AJsOwzhUmCarn9XCg9gEvNjItmc+wfpCKF0UO9V1COhlnEjLM7GdT2sgZ7295XjBgwaqb4Q4dBfFQdpCfViqYWsAOzquBUhlM4Fp6/7OD9WEptPbQnQ08U/8W2fer20rFbn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765450845; c=relaxed/simple;
	bh=iZJNr8wGYjJDo/oSnm9i1nI00leRuZURZDPAswQced0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fEd1kkAl690AOhXrNNH8jk8LW3kGrok0Wywv6o0rWbP9C41o8CCzeuNZcDQQdlfhHpml4i3Ae5tviZr6rOKxFE8UA+jR0fEtgHXu0leTb3G+kZq7dug/ojBNjUEimU1AT5ixG+lhJbaGVUF633sGb6ZYxv+ecQoEfjSIdLEjuL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cmrz+G+E; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59425885f65so97872e87.1
        for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 03:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765450842; x=1766055642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hv9IuqbOtQ3uusfU6qVOOauEdK2hbd/Qu+GXS7Djfi8=;
        b=cmrz+G+EbiqAUQH7uiWADDJYZtIs6ZJvE/qKXwAkx1u9WB5Iuq25LK7ABdkn9QR4Sl
         Nb7VgXOxX9kFF5Q2q0ZoZlDdBk4Ry3JHoA5Y0lLzq41kgjTysFtlI5Q08IPNqVBdy6vs
         oJZJEGxlbAtlK/tzt1RmyRVbV2LpzT+JLt2JfHl2py4djlZyHx8KBMKHG9a2v+m1jaYe
         iJjcPdmHw+IDjGOx6o5pGLhj2pRxXy/9bw9IG+91qNNlVWf4In6vJF/ZXYLcxiiYAp/3
         rVTiJqg0CRjCDbBm5TTvtTZXdwzWm9TQfDqjEo8aYnuAxegSTVVb29ZSbKqNzuyDQjLx
         yA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765450842; x=1766055642;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hv9IuqbOtQ3uusfU6qVOOauEdK2hbd/Qu+GXS7Djfi8=;
        b=DkH4t7g29uAbUVExgI/f1L5TTLD7pbdnlOT3W3coijRNTPMgwzt2XJw0pGwzigtNwE
         wE34g6WyW4V7f2MpUcZqoT8RRxjvdov+lWAh7G6eWtwmkUp+Sk1iLsoYIeGf9jzj7jUB
         2X4hJKPeISARYKu6cDpFijCsr7YB0DuzzPnTiEgQOxwKyyliycB5rGzmeRES+dTLc3k2
         +eVWEUsgcQCurvvOinbJjmejPEjKwbmYTmfQ7wG8nRVDNgvqNkTucVE7ANgjKdvcxX9i
         FUH/zMFtHC2xvBYOR5jbXgOOzXqAbJCRPjWabfG+9IH+P29ArYIYS7f4GXRIye8v49oj
         KbrA==
X-Forwarded-Encrypted: i=1; AJvYcCUIubGSioi1IlVkaGM4lS4hJ4C6UcRkCWwPAJSGxmlAKghx6HnTgd4iNt/fIQZBCy/tzdgGyJ5/Is6wmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVOaq/OELfwgw4qg/CatZqtp4Vv2GvVgr+5AwewybRnz5UgXIF
	w5U2kEsGqGlMKuGrmZVFe6kHDRFJZcwzAhTUVvfROhmgqTZH8Q51RPXSLadqNnoeEKk=
X-Gm-Gg: AY/fxX7h2knoeatrQROYtQ1iUmHTtvronO+vWPkVbikiUbncYkkU2SQWRTwISdnHMmZ
	ptreb/144nlOinaCCOOIPoi/D3d6LXYA1WryIelNLMFrqM74ldpPINCQuMJdekb/UIBh4OQn5Ph
	pACL2bPfVvBu2vMBB15c27QQSwUjThQt+mdgXkt+0+HkoQveOYawlSgCPPP7NCRFnwAOScIoe2H
	RARALSMG2C37D8IGB3BmrDz9Q+JqiJ9ljtI7Q/x6KGvKeMrQ38wDiAcbngxrK5+Byk0xXsuAWDL
	0GhyMm6aF1NI8JbsviEiMQ3rFTT1gJSY+KHdMjeKyWjozhTge4ktVb1AS2xS/foFygZ2m5eLe/l
	T3xzOU+cpYTDeL2PglOIYf7T3IdA20XHo+YNpDI8CWeuiY2NTkZWvzYttBQBXim6dBBWW9+3cDX
	kFgUe8q034HJivgmD8XPHXKdoN0VLJo9A5lGwTzwoVyYPxXli3qjiGv2VIGn+Ate38jA==
X-Google-Smtp-Source: AGHT+IHhOy430i8BtGgE+7ZoJ27YNG+ut0yP2hwm5owdYsUVdYH25iWr+ums5RvZOSsrQe7nffo7hQ==
X-Received: by 2002:a05:6512:33cc:b0:592:f7b4:e5fb with SMTP id 2adb3069b0e04-598f37e57bfmr407382e87.3.1765450841320;
        Thu, 11 Dec 2025 03:00:41 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2f44d02sm776250e87.38.2025.12.11.03.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 03:00:40 -0800 (PST)
Message-ID: <de052bc2-4712-4b95-ac1d-ac22552d6d3b@linaro.org>
Date: Thu, 11 Dec 2025 13:00:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] media: i2c: imx355: Support devicetree and power
 management
Content-Language: ru-RU
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-3-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251211014846.16602-3-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/25 03:48, Richard Acayan wrote:
> A device tree compatible makes it possible for this driver to be used on
> Open Firmware devices. Initialization of power-managed resources such as
> the reset GPIO and voltage regulators can be specified in the device
> tree and handled by the driver. Add support for this so the Pixel 3a can
> use the driver.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   drivers/media/i2c/imx355.c | 118 ++++++++++++++++++++++++++++++++++---
>   1 file changed, 110 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 776107efe386..c225bb8959bd 100644
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
> +	struct regulator_bulk_data supplies[3];
> +};
> +
> +static const char * const imx355_supply_names[] = {
> +	"avdd",
> +	"dvdd",
> +	"dovdd",
>   };
>   
>   static const struct imx355_reg imx355_global_regs[] = {
> @@ -1515,6 +1528,54 @@ static const struct v4l2_subdev_internal_ops imx355_internal_ops = {
>   	.open = imx355_open,
>   };
>   
> +static int imx355_power_off(struct device *dev)
> +{
> +	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx355 *imx355 = to_imx355(sd);
> +
> +	gpiod_set_value_cansleep(imx355->reset_gpio, 0);

It's expected that the reset/shutdown GPIO is active low.

> +
> +	regulator_bulk_disable(ARRAY_SIZE(imx355->supplies), imx355->supplies);
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
> +	ret = regulator_bulk_enable(ARRAY_SIZE(imx355->supplies),
> +				    imx355->supplies);
> +	if (ret) {
> +		dev_err(dev, "failed to enable regulators: %d\n", ret);
> +		goto error_disable_clocks;
> +	}
> +
> +	usleep_range(5000, 5100);
> +	gpiod_set_value_cansleep(imx355->reset_gpio, 1);
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
> @@ -1668,6 +1729,7 @@ static int imx355_probe(struct i2c_client *client)
>   {
>   	struct imx355 *imx355;
>   	unsigned long freq;
> +	size_t i;
>   	int ret;
>   
>   	imx355 = devm_kzalloc(&client->dev, sizeof(*imx355), GFP_KERNEL);
> @@ -1678,7 +1740,7 @@ static int imx355_probe(struct i2c_client *client)
>   
>   	mutex_init(&imx355->mutex);
>   
> -	imx355->clk = devm_v4l2_sensor_clk_get(imx355->dev, NULL);
> +	imx355->clk = devm_v4l2_sensor_clk_get(imx355->dev, "mclk");

Please keep an unset clock name, NULL is fine here, and it removes
a risk of the regression.

>   	if (IS_ERR(imx355->clk))
>   		return dev_err_probe(imx355->dev, PTR_ERR(imx355->clk),
>   				     "failed to get clock\n");
> @@ -1689,16 +1751,28 @@ static int imx355_probe(struct i2c_client *client)
>   				     "external clock %lu is not supported\n",
>   				     freq);
>   
> -	/* Initialize subdev */
> -	v4l2_i2c_subdev_init(&imx355->sd, client, &imx355_subdev_ops);
> +	for (i = 0; i < ARRAY_SIZE(imx355_supply_names); i++)
> +		imx355->supplies[i].supply = imx355_supply_names[i];
>   
> -	/* Check module identity */
> -	ret = imx355_identify_module(imx355);
> +	ret = devm_regulator_bulk_get(imx355->dev,
> +				      ARRAY_SIZE(imx355->supplies),
> +				      imx355->supplies);
>   	if (ret) {
> -		dev_err(imx355->dev, "failed to find sensor: %d", ret);
> +		dev_err_probe(imx355->dev, ret, "could not get regulators");
>   		goto error_probe;
>   	}
>   
> +	imx355->reset_gpio = devm_gpiod_get_optional(imx355->dev, "reset",
> +						     GPIOD_OUT_LOW);

While switching the logic to active low GPIO, it should be GPIOD_OUT_HIGH here.

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
> @@ -1706,13 +1780,26 @@ static int imx355_probe(struct i2c_client *client)
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
> @@ -1752,6 +1839,9 @@ static int imx355_probe(struct i2c_client *client)
>   error_handler_free:
>   	v4l2_ctrl_handler_free(imx355->sd.ctrl_handler);
>   
> +error_power_off:
> +	imx355_power_off(imx355->dev);
> +
>   error_probe:
>   	mutex_destroy(&imx355->mutex);
>   
> @@ -1768,7 +1858,11 @@ static void imx355_remove(struct i2c_client *client)
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
> @@ -1779,10 +1873,18 @@ static const struct acpi_device_id imx355_acpi_ids[] __maybe_unused = {
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

