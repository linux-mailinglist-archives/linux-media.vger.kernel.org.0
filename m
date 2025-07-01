Return-Path: <linux-media+bounces-36417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF5CAEF906
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 14:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A674B1C04700
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 12:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2160E18DB27;
	Tue,  1 Jul 2025 12:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oQ8XjfBp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6B026D4D0
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 12:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373806; cv=none; b=C9rDq0/adoavZTEDtLtiT0WfJSoWpaGnv9rHKuhKYENcK+QqziOBP8ng0eafCH0sCx/rQWkRdC8y8YeOiiNqYsMlB1u2HjOClxQG7q2S587rV5Pa9emRTXq98K9eFoJTptCdnnXmeWbQp6y1EITJsRBY/19WxS2WeHCd1hN8eNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373806; c=relaxed/simple;
	bh=7NWxO7PaQI8/4JG0A3Vx4+jVhpSF8WKBKHv2nqV56Ck=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oDrjViLDn8ao/ozwXRrgztzn//uVLGXxw0s1tB83CB5cEqG4g3/Hmiu8qcgRSG8vjGlTiXa0qOBGMxCS6PK+T/vs9N4L1pGSEKkyf/gFARVM4rzt+QK+fuxZ/OIVUzp+ToCztpY9vGBaWG0QBAlXQNTN03IYCfTfRKB6sWjFJqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oQ8XjfBp; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ade76b8356cso636742566b.2
        for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 05:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751373803; x=1751978603; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vO82p+Ymyw4qd8ylLEXsAIS4Z9o8M8tSvKaMqhmYjc8=;
        b=oQ8XjfBpvw1Pv2n4JNw1ODJ5YmJXXVaE4qUY/fOmm4FLQguPgLstiDTsKIj3RFabKZ
         fKYL6spcRYFIYp9a+U9SjyM+CdoclLepxWGwAqcyVQlrhLpNSMdTDfZ0rsjxOO47+gow
         nBpD2/6Qae1Vn4EVMY3say8QvyahDhv/MVNK/nkyeh+nxiemFj3mbtLSFTpsH0Wx+GT6
         +WWjGcc6aUemqC0QzUDFtSNCHXiM0oKj6zxYGdmH7idXlzy4NiDIpJGXCWwim3D6ySkS
         Cd5iiDXIOA5oCBkVHZ4rlznsgqRh1vv+V0UJx7sw8DLx4+Ow/aPo5mQkRKEG/PhSMcaW
         uixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751373803; x=1751978603;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vO82p+Ymyw4qd8ylLEXsAIS4Z9o8M8tSvKaMqhmYjc8=;
        b=HeFAaCYZVsmPuRSpHa7+C9/YTY/pr5ej67D2xeVXDU69Oz7uUHEZx265t4GEFJwKnl
         FMFFzAmOCZaxuVqPyIJ45HkfBP9//TNUAdbCXUdt1418KbO9ixQCaYFcKNfzjAPHoo+g
         zHVfPAXEe4STjo12IdTr4HMaVQ6Nc92cGuqgpkoMwE5ymO1MjCY4BHtAgC5BhTEV6evH
         bCO6HKUvEpRnwxETT7u5dSqiv61G/nliW9ryqC0yirhzmtR0FwyAIbCga0JiUZ5Y2TCk
         2X8oCKMIV+IFg+k73K8aBLZaLHBVWGlGNvRnYcHhsCoPh86SfDDLuhyNVK/YqepRlSOs
         dPng==
X-Forwarded-Encrypted: i=1; AJvYcCXVQ/0+olMuhjOcsMcms+4NiaNRV49esLehUJtxVlgi30s7le/QDVUzkyPEoNV0wpuP0s/eXYoNGGcd6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx65RvG1Nvv6q1XhtzLhZSXglsD/v1REgi+A/ObHxbxsOTd33Fx
	vm/IIxs7ai2ms6kafYI67dy/koxWsh9m4S92lzd0p9Ss/W/VCwwryiEe30EMclBYz08=
X-Gm-Gg: ASbGncv2FI5DbmpZA8uaU7NiuF24gFj5JFdvKHkG7zP+ryPpNk3Ohs7dn9ok2M8Wqkq
	anhw4adxZjqp5VOCFDriSccEDE9eW6ViziGAynlWAd52/Ff2wwu32971OhuKaFE4vsu9c+OilPs
	fjiH0S5daAuFLIVlDllLD0lU3O4TYEE3RqT0+Z2+0IFK6f5ujwoJgvhvPc97kdx3P+i1fe35tJx
	3gF63nkRfLBATKMdDp96GFrE+XC5711WrBjFCrUWT8A4tz/+5iDtYfqAF6uTwGjbIL5gLyCu7M5
	fFQCPxM1KZMTHn9q83RIT2yofZdkUk8q6jdBBGJEC5Tfj9FyYLfxNeKEvW0ZzuL5lpL7L/SWhWR
	LNV5IovWeWia+SbENbqn3CygvHnY=
X-Google-Smtp-Source: AGHT+IE6xeF663Ehtkx+Tn7K0YByRaw3WGT5qhe7eblpPQ0dM4VjdYTgHjq2bWdoW1KfC5x11Xkqkg==
X-Received: by 2002:a17:907:c78b:b0:ade:cdec:7085 with SMTP id a640c23a62f3a-ae34fee181emr1637881166b.26.1751373803200;
        Tue, 01 Jul 2025 05:43:23 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353659fdesm872608566b.69.2025.07.01.05.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:43:22 -0700 (PDT)
Message-ID: <177a3018-1170-4c92-8657-32edc165bb47@linaro.org>
Date: Tue, 1 Jul 2025 13:43:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] media: i2c: imx355: Support device tree probing and
 resource management
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250630225944.320755-7-mailingradian@gmail.com>
 <Vrnknr6oE7SMsU5fexDRxfCdLZypJp6UaPEae_ubAOcQuXsTWz6kOpoQB3jZWXUlEu09hp5XjfLAXD2AhuOK9A==@protonmail.internalid>
 <20250630225944.320755-9-mailingradian@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250630225944.320755-9-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/06/2025 23:59, Richard Acayan wrote:
> A device tree compatible makes it possible for this driver to be used on
> Open Firmware devices. Initialization of resources such as the reset
> GPIO and voltage regulators can be specified in the device tree and
> handled by the driver. Add support for this so the Pixel 3a can use the
> driver.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   drivers/media/i2c/imx355.c | 63 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 63 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index b2dce67c0b6b..42bd08e8ac50 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -3,9 +3,14 @@
> 
>   #include <linux/unaligned.h>
>   #include <linux/acpi.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>   #include <linux/i2c.h>
>   #include <linux/module.h>
> +#include <linux/of.h>
>   #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>   #include <media/v4l2-ctrls.h>
>   #include <media/v4l2-device.h>
>   #include <media/v4l2-event.h>
> @@ -121,6 +126,16 @@ struct imx355 {
>   	 * Protect access to sensor v4l2 controls.
>   	 */
>   	struct mutex mutex;
> +
> +	struct clk *mclk;
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data supplies[3];
> +};
> +
> +static const char * const imx355_supply_names[] = {
> +	"vana",
> +	"vdig",
> +	"vio",
>   };
> 
>   static const struct imx355_reg imx355_global_regs[] = {
> @@ -1683,6 +1698,7 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
>   static int imx355_probe(struct i2c_client *client)
>   {
>   	struct imx355 *imx355;
> +	size_t i;
>   	int ret;
> 
>   	imx355 = devm_kzalloc(&client->dev, sizeof(*imx355), GFP_KERNEL);
> @@ -1694,6 +1710,42 @@ static int imx355_probe(struct i2c_client *client)
>   	/* Initialize subdev */
>   	v4l2_i2c_subdev_init(&imx355->sd, client, &imx355_subdev_ops);
> 
> +	for (i = 0; i < ARRAY_SIZE(imx355_supply_names); i++)
> +		imx355->supplies[i].supply = imx355_supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(&client->dev,
> +				      ARRAY_SIZE(imx355->supplies),
> +				      imx355->supplies);
> +	if (ret) {
> +		dev_err_probe(&client->dev, ret, "could not get regulators");
> +		return ret;
> +	}
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(imx355->supplies),
> +				    imx355->supplies);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}

You should stick to dev_err_probe().

There's no reason to enable the rails this early either, should be in a 
dedicated power_on() function called in the right place with its own 
cleanup logic for error - to save us from replicating cleanup with jump 
labels.

> +
> +	imx355->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
> +						     GPIOD_OUT_HIGH);
> +	if (IS_ERR(imx355->reset_gpio)) {
> +		ret = PTR_ERR(imx355->reset_gpio);
> +		dev_err_probe(&client->dev, ret, "failed to get gpios");
> +		goto error_vreg_disable;
> +	}
> +
> +	imx355->mclk = devm_clk_get(&client->dev, "mclk");
> +	if (IS_ERR(imx355->mclk)) {
> +		ret = PTR_ERR(imx355->mclk);
> +		dev_err_probe(&client->dev, ret, "failed to get mclk");
> +		goto error_vreg_disable;
> +	}
> +
> +	clk_prepare_enable(imx355->mclk);
> +	usleep_range(12000, 13000);
This should go into a dedicated power_on() routine which is reusable, so 
that we have one place to get the power-on sequence right.

Something like drivers/media/i2c/ov02e10.c::ov02e10_power_on()

> +
>   	/* Check module identity */
>   	ret = imx355_identify_module(imx355);

If you move identify_module to come after get_hwcfg then all of the 
above code can be buried inside of get_hwcfg which IMO would be a nice 
pattern to follow.

driver/media/i2c/ov02[c|e].c

---bod

