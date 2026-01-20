Return-Path: <linux-media+bounces-51121-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GA+fIFAccGkEVwAAu9opvQ
	(envelope-from <linux-media+bounces-51121-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 01:22:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2934E764
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 01:22:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 50E9C5AC646
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 12:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE033EFD36;
	Tue, 20 Jan 2026 12:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kE738k1u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5103EF0A0
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 12:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913072; cv=none; b=u7C2kLnqe/hRpiFJKb82sa7ph+3O7VuaY3dFjjM1iL1sgIjomWgOEdBAuvchgTHWWuLmQbM8Ljv6/Ra57/pEJRRtQfdQZVp71BGXmk9pYq1Wu1fIMwObVolAQIKaMtSdOV4Tkz63PQPhANbphsizSRv3GGCeLZiZHuWR0Lo0eRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913072; c=relaxed/simple;
	bh=IS8rUR5sEdGEUkR4PIDgTLZLVHe9z6U/zU7WLBOIono=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MjWbIffvctpxuWGBrl7K4XnhUmkCKQUmzVLsQQHR8Yv50y/vQ+B79piNsRpVxR175V1a4w9rrW9c49Qjsq6vEqv/B3ceteXRRCEI+VHb3u9DLjw5lJ5sj7FGHpAztc0tsidR/bVkS0Nz2Xg4Vd9zCcH1hMJR43O9hOVgP83Ch2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kE738k1u; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so27822325e9.0
        for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 04:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768913068; x=1769517868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XERyzWRrypJfozC0Mdo9IWYRT9E2luhxzdFITS/kknw=;
        b=kE738k1ub1mpy/W5SCbw8O5Siha0VdEPKVCQ76ehtdrSlLTs+4NvA2ngAs9mhfQsqx
         umF0eSuuCVpTI9s+DxvRVuBpEaJ6rk1kT510cL8bqSNV6jDcTnPBalyVn9c1pajRYpIB
         ukwFN1QblcxC6B0v3m64hCE/rGjzXb2PvKBV5rXvNzEEm7tu/63yD2xz6XCkCo6VYGrr
         YO68j1pvUVN/ZLZ3gLzomFqtYr4eEFaogeWnFaO7WGODKr2KfynhimAalTfKMjMbBZBr
         NoTo6WWif74g8usY9clfLxWaQalVkUBsoTmHDUDaO1SSxmQ4JvW9FSSs1A+eytgGpuE9
         DXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768913068; x=1769517868;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XERyzWRrypJfozC0Mdo9IWYRT9E2luhxzdFITS/kknw=;
        b=UFRtuX1mifobPMxMwGbbrGz6y1mk616rHc2K9WPYQgQX2byOxjVlMtFaSnV/KX0uPX
         DGRD+n93bcbqddX+veJ9y1TcoF+FFSAXnw+TskrNxVVPMN2hEVlIKK6zwAEGp4cH/ik9
         uzZ20dSbx9zl9dOfLt3gOvY2iKr5HQjPBl+UNFL82nmifF3WHRMQE6OLSBkVIPFBiAMK
         Wl89EaqjpjIxoPNAUB6keBA7tfz8fX3s9THm2Feu3XQbfbRIkh/OFldRmBvHQlNoIXFC
         NbnGnWKCN6domTyjsn1174/Us8O/2v1/OxlZdSjOGl5V4evOvTTUalEglDHW/evhj15B
         2+4w==
X-Forwarded-Encrypted: i=1; AJvYcCXGP4KITntGBwI0zs5Wz+d/bhNNHUW7RAGzwrfkpkyTx0H3WTAnogkDVrsJ/mbEa0+Om8m7RRDaQObIHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZZyoILyjK6T4XwQ+yrABZG+8BjG8NWM/iCL0+VVg0dvXd9sQs
	kh2gSaugN9q5bxsp81E620A498M2jSVJOEQvJublp+wVx8Q5QWMeVhCR92oSi393/ug=
X-Gm-Gg: AY/fxX4Ghkp+4vMRnNw4Q+N8ST2qYr14gM5dEsVTrgQY3g3VUYHH06f2Q1gEeOprm10
	7eJyj0AIujvzH0Q8eclRG8mdxV3gQ43CKmoJJHl5gdVA7yVntPX1Sx89cGLIdavGI6hcmQUo9W7
	Pajl3LJo7RYRyevSXXcSZgjAKjJdKnQR3jojLlDixC6NZrtWK+MYrj35B4ubhyTSW9+2WVap36x
	dL0ldIhCLJcOHoT67hFo9AZGiO3dYsyP39SCVF5tp0rcoMvhZGlezXqtxDpXplh3Pl7Swl9l432
	AKGeiVDv2o3oq1UhqbyMMxeIQ8yFg/tC8ss1Od8J4tkmOfy+h9fHfoXo/A1xfIvdqQ1gdi3zTHJ
	YculZpLc7nVzJbGqmyBAKYaqFCrSHZ3lo2OjT5eY8LXdOj01iHBT/FR3kNDvainCy4JZPueZbU7
	Y81/EXIVcSgsQWnlgsJJdGIQQxW95W9gNaeUnE+WPrtwm/gDfY8SLA
X-Received: by 2002:a05:600c:474d:b0:477:7b16:5f77 with SMTP id 5b1f17b1804b1-4801eab5193mr147622475e9.3.1768913068176;
        Tue, 20 Jan 2026 04:44:28 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c0499sm251053925e9.9.2026.01.20.04.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 04:44:27 -0800 (PST)
Message-ID: <578668b0-cba2-4550-b676-26ed0b447bf2@linaro.org>
Date: Tue, 20 Jan 2026 12:44:24 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] media: i2c: imx355: Support devicetree and power
 management
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
References: <20260117040657.27043-1-mailingradian@gmail.com>
 <20260117040657.27043-3-mailingradian@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260117040657.27043-3-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-51121-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linux.intel.com,intel.com,vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 1C2934E764
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17/01/2026 04:06, Richard Acayan wrote:
> A device tree compatible makes it possible for this driver to be used on
> Open Firmware devices. Initialization of power-managed resources such as
> the reset GPIO and voltage regulators can be specified in the device
> tree and handled by the driver. Add support for this so the Pixel 3a can
> use the driver.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   drivers/media/i2c/imx355.c | 116 ++++++++++++++++++++++++++++++++++---
>   1 file changed, 108 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 776107efe386..5a8da035ba5f 100644
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
> +	usleep_range(1000, 2000);
> +	gpiod_set_value_cansleep(imx355->reset_gpio, 0);
> +	usleep_range(10000, 11000);
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
> +					    ARRAY_SIZE(imx355_supplies),
> +					    imx355_supplies,
> +					    &imx355->supplies);
>   	if (ret) {
> -		dev_err(imx355->dev, "failed to find sensor: %d", ret);
> +		dev_err_probe(imx355->dev, ret, "could not get regulators");
>   		goto error_probe;
>   	}
>   
> +	imx355->reset_gpio = devm_gpiod_get_optional(imx355->dev, "reset",
> +						     GPIOD_OUT_HIGH);
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
> +static const struct of_device_id imx355_match_table[] = {
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

I think reset should be asserted before regulators and power are 
switched on. i.e. before you try to switch the chip on, you should 
establish that the reset pin is in the state that the timing diagram 
calls for.

If we look at imx214 which someone has posted on the internet

https://www.v-visiontech.com/web/userfiles/download/IMX214-0AQH5-C_2.0.0ExcellenceCommsen-281-29_mASEw.pdf

Pages 28 and 29

See timing value T4 - you need to provide power and clock for T4 before 
de-asserting reset and then wait for T7 before starting to stream.

We don't have the imx315 spec but likely imx355 has a similar start-up 
state machine.

1. Assert reset
2. Power up
3. Start clock
4. t4
5. De-assert reset
6. T6 - wait time to first i2c transaction
7. T7 - wait time to first stream on

You should definitely set the reset to logical on in power_on() as you 
don't necessarily know the state of the reset pin each time you power on.

---
bod

