Return-Path: <linux-media+bounces-40727-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FF2B311B5
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 10:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA01B3B5E4B
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 08:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E052EAB8E;
	Fri, 22 Aug 2025 08:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F7IriSGN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D887121256B
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 08:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755850949; cv=none; b=K+a8jQ8cr/TEQVR4ScLCVQqiu0lVblCq7Oslx3WE6b1u0IZOdrhJD2LQH794I0rSkuXR6IEWgwFU6PpgGwhz6eIemEzGK1H0NfHw8lu1kFpW8iLl74ldmjvwwF8S5ag/VRNTIlTei/j0I6scHMwdUj1JrGMkYSyQwrSV8Zkc4NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755850949; c=relaxed/simple;
	bh=wSFuJQEtqfZ1oytRi29ghlaifGfrK4PFYsjEiiTPgKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RLqIn/T21Sk0PwFAG9uXhH5tlP+veEXfPbmK/3AjmWlPNPbYB2JihDgVJP8otogIr8ULuY9drGyAyT0RLktD0nd8faPc07PT/v3MKEu1UrnaEd7KdZev/X60WFnjeBaU0ajmPtrMw7wl1b0idc5WENjFEr5bWuLkKCtJyh6ztmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F7IriSGN; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55e00f938dfso269764e87.0
        for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 01:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755850946; x=1756455746; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXucF9UGdHPxrEiNPI7ijZXyi7uTg15VZKasLKSvsIU=;
        b=F7IriSGNGRQUT2Ox2/oAWQmQQoPmBgXZshDd5HCid0onj1aio1RIPvi2VoLzAE7tXp
         33lZO7/a2gH/66kxoFQspSKbQ69aJhq58pM3wrfmNE6JMUXYbyc81vJPiz5RlNBaa9x8
         Oqm2B8bFJ8p1r+AJN9d124M/8HTsjCQ9GXwlID8InLKcsy790LwGZOdlUn66x4WOQI3q
         +ZRzcgOqVlk9CYjIVPBPj7bbu7/T5vAxIzxssxU2J9lzEF8jRyB3E7ii+/pfQm/fBWTL
         oVKWShjvTjGa0jQhJKBdiI5uKUAULPAmuSJ022HT24/3WQEad5HMwdoyU7dsficHyxCG
         0Mmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755850946; x=1756455746;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RXucF9UGdHPxrEiNPI7ijZXyi7uTg15VZKasLKSvsIU=;
        b=XSL5ZkBqhP7cyRNbcFfoFGB0hkBagwI+LBga1fSNTWuTR+xJW9+LMb2zd4nq7We7p1
         wl7tBELh/NuwzQqrHtC10dsTPNwnswvzUAe7bg+HCOfEQ4P6n2DCiyCcw1qGD0nBlYCJ
         Szn5c+3MlHKSAWZcCNi8wWNCg5MA17XrwcGL7n55iC2bdB1GvppgOf7IX7vaEk44nszJ
         9KqLCbUMPNRPoEfJxzmV4zK6Qeb8IEIoybpUUjel5m3CGoIwuQ+7BFiWAmlaM3jrLabo
         bCo1IDA5m94ynw/LnsPXQox++rumzvPEhrIjPS0DcM6erxPWyaWAsIfnpyJwlvH9KuJm
         z5Ig==
X-Forwarded-Encrypted: i=1; AJvYcCW53RvmY2h3J40O2NUxBVxP7pQOJFhtM2nKH+A5UQyjS2RhVOTSyOUdniKw/bF99xfLO/92Y9xAkNW1Bw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/sDJfIgNwsv3YgorSWzHI/B4ysCvGxTJkwB+IUxXFjJrpJFgJ
	Werid2qOE4oroXUahhF7FCLdmf6L6dKqb5UjveOHHg6huXHpjvaZ2WOGmFbiw3WF3js=
X-Gm-Gg: ASbGncseZX1Uj1jdBU4VRigg7nctO67Yd1a7w1UdAsa+DedBztKkmZ7ZMFLnoVRrUCx
	Jz0peh0Uu2xpFMYp/kaI/le9iVvIMIkVAtb1NUhKSK2NccdVATyTgmEzUr+sSbojVPM+sJMFjJL
	SacgfUNHmtuqKiqMDXWAn8zb44mKgTw3pizgXOefPZuFCjG666cQEfF0gk+qA2ADR5q9ck40wO5
	3WwMX8C8ndmjcWbai2Hmqq/5o4ok5N5pHtWfniyBb5+0SAnRyCNi6ycY6yvonr4/BdkJQr2n9ZT
	v/ck6lAic0t+8N5fGU2heMmYBAihLeH9SYGPHDqx6zue2Uo8SDr/oJzVacMXr9Hy1UGl/jBuaOX
	XjOAS44axGJtHq/BcxpZgSse9yEozJpPjbz3QipzUg7ZD3rsqpGg8t3CrGwjTmdJqMM+O5XNDOF
	Bp
X-Google-Smtp-Source: AGHT+IGpgXZXed8TIdIcBY5n9kfb6hKzzrVjL/aXpieY0KpoSwWRRcW2tG4FpiZUs4rMd5UYpnMPPw==
X-Received: by 2002:a05:6512:e94:b0:55c:c9d5:d342 with SMTP id 2adb3069b0e04-55f0ccfc3d4mr372602e87.4.1755850945934;
        Fri, 22 Aug 2025 01:22:25 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef459153sm3477792e87.156.2025.08.22.01.22.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 01:22:25 -0700 (PDT)
Message-ID: <9c8a9dd4-416e-4cb1-930d-29e7710b42ad@linaro.org>
Date: Fri, 22 Aug 2025 11:22:24 +0300
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
 <03690367-aff0-4128-86aa-65a6d489b6cb@linaro.org>
 <aKbkcL_j3LsdoMo4@kekkonen.localdomain>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <aKbkcL_j3LsdoMo4@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sakari.

On 8/21/25 12:18, Sakari Ailus wrote:
> Hi Vladimir,
> 
> On Wed, Aug 20, 2025 at 01:57:52AM +0300, Vladimir Zapolskiy wrote:
>> Hi Sakari,
>>
>> thank you so much for review. Please find a few comments below.
>>
>> On 8/18/25 15:08, Sakari Ailus wrote:
>>> Hi Vladimir,
>>>
>>> Thanks for the update.
>>>
>>> On Wed, Aug 13, 2025 at 12:30:24AM +0300, Vladimir Zapolskiy wrote:
>>>> OmniVision OV6211 is a monochrome image sensor, which produces frames in
>>>> 8/10-bit raw output format and supports 400x400, 200x200 and 100x100
>>>> output image resolution modes.
>>>>
>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>
>> <snip>
>>
>>>> +static int ov6211_set_ctrl(struct v4l2_ctrl *ctrl)
>>>> +{
>>>> +	struct ov6211 *ov6211 = container_of(ctrl->handler, struct ov6211,
>>>> +					     ctrl_handler);
>>>> +	int ret;
>>>> +
>>>> +	/* V4L2 controls values will be applied only when power is already up */
>>>> +	if (!pm_runtime_get_if_in_use(ov6211->dev))
>>>
>>> I think this should be pm_runtime_get_if_active() as no writes will now
>>> take place even if the sensor is powered on.
>>
>> Ack.
>>
>>>> +		return 0;
>>>> +
>>>> +	switch (ctrl->id) {
>>>> +	case V4L2_CID_ANALOGUE_GAIN:
>>>> +		ret = cci_write(ov6211->regmap, OV6211_REG_ANALOGUE_GAIN,
>>>> +				ctrl->val, NULL);
>>>> +		break;
>>>> +	case V4L2_CID_EXPOSURE:
>>>> +		ret = cci_write(ov6211->regmap, OV6211_REG_EXPOSURE,
>>>> +				ctrl->val << 4, NULL);
>>>> +		break;
>>>> +	default:
>>>> +		ret = -EINVAL;
>>>> +		break;
>>>> +	}
>>>> +
>>>> +	pm_runtime_put(ov6211->dev);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static const struct v4l2_ctrl_ops ov6211_ctrl_ops = {
>>>> +	.s_ctrl = ov6211_set_ctrl,
>>>> +};
>>>> +
>>>> +static int ov6211_init_controls(struct ov6211 *ov6211)
>>>> +{
>>>> +	struct v4l2_ctrl_handler *ctrl_hdlr = &ov6211->ctrl_handler;
>>>> +	const struct ov6211_mode *mode = &supported_modes[0];
>>>> +	struct v4l2_fwnode_device_properties props;
>>>> +	s64 exposure_max, pixel_rate, h_blank;
>>>> +	struct v4l2_ctrl *ctrl;
>>>> +	int ret;
>>>> +
>>>> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
>>>> +	if (ret)
>>>> +		return ret;
>>>
>>> This check can be omitted. Up to you.
>>
>> This check I would prefer to keep, otherwise I have a feeling that under
>> ENOMEM the following code would make an attempt to insert the controls
>> data over an NULL pointer...
>>
>> I'll mock it to check it explicitly though, but I'm inclined to keep it.
> 
> The control framework will handle that internally.
> 

Right, I've tested a mocked version before sending v4, and it worked
expectedly with no issues, the check for a return value has been removed.

>>
>> <snip>
>>
>>>> +
>>>> +	ret = cci_write(ov6211->regmap, OV6211_REG_MODE_SELECT,
>>>> +			OV6211_MODE_STREAMING, NULL);
>>>> +	if (ret) {
>>>> +		dev_err(ov6211->dev, "failed to start streaming: %d\n", ret);
>>>> +		goto error;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +
>>>> +error:
>>>> +	pm_runtime_mark_last_busy(ov6211->dev);
>>>
>>> Please omit direct calls to pm_runtime_mark_last_busy(); this is now called
>>> via the runtime PM put autosuspend etc. functions.
>>>
>>
>> Ack.
>>
>> <snip>
>>
>>>> +	if (bus_cfg.nr_of_link_frequencies != 1 ||
>>>> +	    bus_cfg.link_frequencies[0] != link_freq_menu_items[0]) {
>>>
>>> Could you use v4l2_link_freq_to_bitmap()? I think it'd simplify the
>>> function and possibly error handling, too.
>>>
>>
>> Ack, let it be so.
>>
>>>> +		dev_err(ov6211->dev, "Unsupported MIPI CSI2 link frequency\n");
>>>> +		ret = -EINVAL;
>>>> +		goto error;
>>>> +	}
>>>> +
>>>> +error:
>>>> +	v4l2_fwnode_endpoint_free(&bus_cfg);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int ov6211_power_on(struct device *dev)
>>>> +{
>>>> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>>>> +	struct ov6211 *ov6211 = to_ov6211(sd);
>>>> +	int ret;
>>>> +
>>>> +	if (ov6211->avdd) {
>>>> +		ret = regulator_enable(ov6211->avdd);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +	}
>>>> +
>>>> +	if (ov6211->dovdd) {
>>>> +		ret = regulator_enable(ov6211->dovdd);
>>>> +		if (ret)
>>>> +			goto avdd_disable;
>>>> +	}
>>>> +
>>>> +	if (ov6211->dvdd) {
>>>> +		ret = regulator_enable(ov6211->dvdd);
>>>> +		if (ret)
>>>> +			goto dovdd_disable;
>>>> +	}
>>>
>>> Can you use the regulator bulk functions? Or if the order is required, add
>>> a comment about it? Otherwise someone will provide a "fix" soon afterwards.
>>> :-)
>>
>> I've already responded to a similar review comment from Krzysztof on v1,
>> here the rationale is to follow a deliberately selected model of having
>> some of regulators as optional. Moreover the "digital core" DVDD regulator
>> is truly optional, there is a working sensor configuration to omit it.
>>
>> Unfortunately so far there is no bulk regulator helper, which deals properly
>> with optional regulators, so I would prefer to keep it registered this way.
> 
> Won't the regulator framework provide you a dummy regulator if a given
> regulator isn't assigned to the device in DT?
> 
> E.g. the CCS driver unconditionally requests regulators and fails on error.
> It still works on ACPI platforms without any regulators (as in terms of the
> regulator framework).
> 

You are right here, bulk version of regulator API falls back to a dummy
regulator usage, I've tested that it works totally fine, and therefore I'll
change to it in the next version of the driver.

>>>> +	gpiod_set_value_cansleep(ov6211->reset_gpio, 0);
>>>> +	usleep_range(10 * USEC_PER_MSEC, 15 * USEC_PER_MSEC);
>>>> +
>>>> +	ret = clk_prepare_enable(ov6211->xvclk);
>>>
>>> Is the clock really supposed to be enabled here, and not e.g. before
>>> lifting reset?
>>>
>>
>> The so called "gated" mode of XVCLK clock says that is should be enabled
>> after releasing XSHUTDOWN pin, so I don't see a mistake here.
>>
>> Please note, it's basically a common part with other OmniVision sensors,
>> for instance you may get a reference from OG01A1B product specification etc.
>>
>> Thank you for review. Shortly I'll send another new but very similar
>> image sensor driver acknowledging your given comments.
> 

-- 
Best wishes,
Vladimir

