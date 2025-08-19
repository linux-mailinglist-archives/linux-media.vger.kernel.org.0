Return-Path: <linux-media+bounces-40325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAE0B2CF94
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 00:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D02DB1C2069A
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 22:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA71023F26A;
	Tue, 19 Aug 2025 22:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gnQEnlDT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351EE1F0E53
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 22:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755644291; cv=none; b=TbgRyLua/Sf+WM/bJfBiwMQpK+F0McTEusxrEObnHNXdJkXirlpW2yjqzzpRAq1uw0wYvjK0Hz6/lWFqw0qtHsX8noSasFLh0xMadiG0o6mn1SazKm0+16LVQrYqeRXkpbrUNuJ8Jpb4VtVmwHYDEAoSDyvItqPlAT4/bo6wAYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755644291; c=relaxed/simple;
	bh=E4LX9dPz6lz1RHQaIxgEI9CY+59ZNo0/n5RaGhDo6T4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PUJXaufJDdHE7rpP39ZIKy4D5DVH81bYk3DAwTzR9G16fmYlLZkOK/Pya0Lrnzmgyn4hM0wYR6sHIr1q7OHSlKxd3VB9ZTmmwypI5dm4mbGT9kxIxTAVc7TAiMOtPK7rN2jHzfeIXZfJs2Tkxaq4ITrYz5dBSRv/KtUI0TkSCaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gnQEnlDT; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55ce50afeceso499667e87.0
        for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 15:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755644287; x=1756249087; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdsFwPUZXdwZTKthKuPOn3mlFq/GkAaD0f0ovHBevv4=;
        b=gnQEnlDTxXoX9jA439bA3NPZif1yq9l9KKhxg4bDm0XELYXOzSOSVslsgZgMzb1Jke
         P/pbu9oj4iq3j9du+9dFT+j5pRAdMh1mqOr++nb5MYl0nWQU4EBfb9CIFTOPockV4BI+
         Zl9lLiJAn/z+7xgdNZPHsILbHIVp3vRNRlhjeotvZXvThVh129l4jGIKnkZYYRtmWQBl
         CxZgkvIY5Wb6M7ulTGWXic6zxLnTBu24ZW6RzRNPDbJ3u+PrsPDQIRyUw8wlulKbjwhE
         B0UVIG3w8eOBqZ9pMN+Tm2KB3p6UiBAZAvuEHU8PwEdiWQ88KJAlfzBsy/pBnz7WTVHk
         9XMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755644287; x=1756249087;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HdsFwPUZXdwZTKthKuPOn3mlFq/GkAaD0f0ovHBevv4=;
        b=VLZnuf0YTSBPzWjA46Pz/D1iVT8AimEwGuN+kaSvb8EoDUkpayCyueV60kjSZRDAvb
         lYoIIN/UxTmF0bPQH2Bhv/5WIvprm89tecxUeEJQuEWNrGLiC6OroHZYw7Ip5RA+tdR6
         tb/U9v6p9vEJ5ORoFwjQf5IRnGWGXrKhlLVHtGRHarnooVQNHI6D6Wgj4bE+q6nm+dGG
         9HYSLTmCiniDkORqLS952M4aUtPF5A/XToIZSYEqUVBYDwJ35yNKw+yfSnx7n1Kdfuox
         5WJbYqZixRILgcYPt1uzLTySDhOXQ2gjcHfuQ51RycliE7ZI92TxpbZRN+UCKTxYz0a3
         W+Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXSq35JMQg16BEot3FD5q6yBeYiyS/kgz4u/5Rx1KZlZ0b9neSQlghPcaVaj5kWPySvPKfe5K6i99R2Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4BX4uCuyRX30UWcA/ig+2RfiomBinM61sA1cPfyBhnLTy8INr
	8OqB7+iN1Nsvg5SL0wNGATukAougrrAUx4t1AF4evtPQgMoATe0m7O86sJhMaoEn67VeR/zFP3A
	h9lfx
X-Gm-Gg: ASbGnctsRdbR6BhNYNHl2fOn/uhlMUxql+ga04lHa4LrFZv9z/WjsbK2W+pp5DAKt4V
	Uh6qV5en82TPC5buXHj0QX/AW2WZrht8HQ6g+XvfKsJsltzBCQdIIB+MOJDemMuEDkCshLPZVIn
	BiXnrcIU/BVITaVCl6I7ZD7esz7wyxzivaBb1nTC1J4THjrXR8CVUWXICsPYl2o663Ju3Bz2XKX
	v1qU+6zCqkDJ7UO0PtEFqgXYohej3cgCAKMrCoRs9RXEg6Tmr0ZOGrqzoyMIq0oItRq5EJnWUUr
	jv6LiTg+9j2MQeKji3kcjUVqbFJuOh6Cl+hVDLMwioGOFz4w1lFzRHLjj7EsXzmlYatNL/ikb+I
	L9R5lH+40TPQcMuZE2NIjtNIo5CUdXDkzDJeIhyGulE3lJTgXc1HoOwqiEE11d5891LbaMC8TT4
	NG
X-Google-Smtp-Source: AGHT+IFgVtLfnI+yZbajjW0ShH/nw4lyqgYozKMTqpeh1jbUqnzxV+DizeAW9/HhLvwBJAkIq/WQDQ==
X-Received: by 2002:a05:6512:3f1e:b0:55b:8f40:32c9 with SMTP id 2adb3069b0e04-55e06bce5efmr77401e87.6.1755644287217;
        Tue, 19 Aug 2025 15:58:07 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3f3e91sm2259731e87.124.2025.08.19.15.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 15:58:06 -0700 (PDT)
Message-ID: <03690367-aff0-4128-86aa-65a6d489b6cb@linaro.org>
Date: Wed, 20 Aug 2025 01:57:52 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] media: i2c: Add OmniVision OV6211 image sensor
 driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Tarang Raval <tarang.raval@siliconsignals.io>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250812213024.361267-1-vladimir.zapolskiy@linaro.org>
 <20250812213024.361267-3-vladimir.zapolskiy@linaro.org>
 <aKMXy_L0eBRJRcsn@kekkonen.localdomain>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <aKMXy_L0eBRJRcsn@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sakari,

thank you so much for review. Please find a few comments below.

On 8/18/25 15:08, Sakari Ailus wrote:
> Hi Vladimir,
> 
> Thanks for the update.
> 
> On Wed, Aug 13, 2025 at 12:30:24AM +0300, Vladimir Zapolskiy wrote:
>> OmniVision OV6211 is a monochrome image sensor, which produces frames in
>> 8/10-bit raw output format and supports 400x400, 200x200 and 100x100
>> output image resolution modes.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

<snip>

>> +static int ov6211_set_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +	struct ov6211 *ov6211 = container_of(ctrl->handler, struct ov6211,
>> +					     ctrl_handler);
>> +	int ret;
>> +
>> +	/* V4L2 controls values will be applied only when power is already up */
>> +	if (!pm_runtime_get_if_in_use(ov6211->dev))
> 
> I think this should be pm_runtime_get_if_active() as no writes will now
> take place even if the sensor is powered on.

Ack.

>> +		return 0;
>> +
>> +	switch (ctrl->id) {
>> +	case V4L2_CID_ANALOGUE_GAIN:
>> +		ret = cci_write(ov6211->regmap, OV6211_REG_ANALOGUE_GAIN,
>> +				ctrl->val, NULL);
>> +		break;
>> +	case V4L2_CID_EXPOSURE:
>> +		ret = cci_write(ov6211->regmap, OV6211_REG_EXPOSURE,
>> +				ctrl->val << 4, NULL);
>> +		break;
>> +	default:
>> +		ret = -EINVAL;
>> +		break;
>> +	}
>> +
>> +	pm_runtime_put(ov6211->dev);
>> +
>> +	return ret;
>> +}
>> +
>> +static const struct v4l2_ctrl_ops ov6211_ctrl_ops = {
>> +	.s_ctrl = ov6211_set_ctrl,
>> +};
>> +
>> +static int ov6211_init_controls(struct ov6211 *ov6211)
>> +{
>> +	struct v4l2_ctrl_handler *ctrl_hdlr = &ov6211->ctrl_handler;
>> +	const struct ov6211_mode *mode = &supported_modes[0];
>> +	struct v4l2_fwnode_device_properties props;
>> +	s64 exposure_max, pixel_rate, h_blank;
>> +	struct v4l2_ctrl *ctrl;
>> +	int ret;
>> +
>> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
>> +	if (ret)
>> +		return ret;
> 
> This check can be omitted. Up to you.

This check I would prefer to keep, otherwise I have a feeling that under
ENOMEM the following code would make an attempt to insert the controls
data over an NULL pointer...

I'll mock it to check it explicitly though, but I'm inclined to keep it.

<snip>

>> +
>> +	ret = cci_write(ov6211->regmap, OV6211_REG_MODE_SELECT,
>> +			OV6211_MODE_STREAMING, NULL);
>> +	if (ret) {
>> +		dev_err(ov6211->dev, "failed to start streaming: %d\n", ret);
>> +		goto error;
>> +	}
>> +
>> +	return 0;
>> +
>> +error:
>> +	pm_runtime_mark_last_busy(ov6211->dev);
> 
> Please omit direct calls to pm_runtime_mark_last_busy(); this is now called
> via the runtime PM put autosuspend etc. functions.
> 

Ack.

<snip>

>> +	if (bus_cfg.nr_of_link_frequencies != 1 ||
>> +	    bus_cfg.link_frequencies[0] != link_freq_menu_items[0]) {
> 
> Could you use v4l2_link_freq_to_bitmap()? I think it'd simplify the
> function and possibly error handling, too.
> 

Ack, let it be so.

>> +		dev_err(ov6211->dev, "Unsupported MIPI CSI2 link frequency\n");
>> +		ret = -EINVAL;
>> +		goto error;
>> +	}
>> +
>> +error:
>> +	v4l2_fwnode_endpoint_free(&bus_cfg);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ov6211_power_on(struct device *dev)
>> +{
>> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>> +	struct ov6211 *ov6211 = to_ov6211(sd);
>> +	int ret;
>> +
>> +	if (ov6211->avdd) {
>> +		ret = regulator_enable(ov6211->avdd);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	if (ov6211->dovdd) {
>> +		ret = regulator_enable(ov6211->dovdd);
>> +		if (ret)
>> +			goto avdd_disable;
>> +	}
>> +
>> +	if (ov6211->dvdd) {
>> +		ret = regulator_enable(ov6211->dvdd);
>> +		if (ret)
>> +			goto dovdd_disable;
>> +	}
> 
> Can you use the regulator bulk functions? Or if the order is required, add
> a comment about it? Otherwise someone will provide a "fix" soon afterwards.
> :-)

I've already responded to a similar review comment from Krzysztof on v1,
here the rationale is to follow a deliberately selected model of having
some of regulators as optional. Moreover the "digital core" DVDD regulator
is truly optional, there is a working sensor configuration to omit it.

Unfortunately so far there is no bulk regulator helper, which deals properly
with optional regulators, so I would prefer to keep it registered this way.

>> +
>> +	gpiod_set_value_cansleep(ov6211->reset_gpio, 0);
>> +	usleep_range(10 * USEC_PER_MSEC, 15 * USEC_PER_MSEC);
>> +
>> +	ret = clk_prepare_enable(ov6211->xvclk);
> 
> Is the clock really supposed to be enabled here, and not e.g. before
> lifting reset?
> 

The so called "gated" mode of XVCLK clock says that is should be enabled
after releasing XSHUTDOWN pin, so I don't see a mistake here.

Please note, it's basically a common part with other OmniVision sensors,
for instance you may get a reference from OG01A1B product specification etc.

Thank you for review. Shortly I'll send another new but very similar
image sensor driver acknowledging your given comments.

-- 
Best wishes,
Vladimir

