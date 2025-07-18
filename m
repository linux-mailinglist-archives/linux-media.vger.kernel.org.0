Return-Path: <linux-media+bounces-38066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFEBB0A68E
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 16:48:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89F3D7B2EE6
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 14:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934D81EF1D;
	Fri, 18 Jul 2025 14:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HJ61Pe28"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D8918024
	for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 14:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752850075; cv=none; b=TU3KfC6X3CUbYiwT3LM+iEX48OjvAiRPcD5kUxO1x9Gp8x/8lZIAIiVUPfPxmpGIsV/FYUxKrSBYOllfEzXlP6STv331gajL+lay8bNjpsUEkfpUjALZYPaV/NLaRpakakoz+pjRf2h3pUUpGi9VlWrH+wE3oKnGtnmbbwpsO0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752850075; c=relaxed/simple;
	bh=SGS7vNJMXiIIoIjQRQtUQaHpMKEFAP3awdktnoVE/vs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZHOkqBrGuSb7TCgJ2j7F2x1gEHnacckE9yrau7u7fNoknBmcbndBjnZOuVz9BkA1BPbyd/1KpTjNeWXx4D82OmawPtEb4JAkJX1w7YxWEq7lud+eU31lAeCVRCRKkq+Mkcnbvb1FlolZBmRMK0ZurICtmExbx/L6kcW5qgXYfcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HJ61Pe28; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553affea534so333761e87.2
        for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 07:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752850071; x=1753454871; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0wrXIKhwaKHW7DC3rbsM0aYXtZFOnbkt4Tlcd+Ix0O8=;
        b=HJ61Pe28AEMIOtWxq55M0ef6lJOp8UJyWXXOC/0xPstfHwzkVUdtHbUYqwmGUvMT+G
         cLUxvQwIqKVu2syD5cSDzNKshgamO7PD3qlhV2MUiQG7XCz6Fq+2cKt5JvDoGZL+ATE0
         LcfTKo1i7ESkpTqtndiMGbX6z77QzfxekF+FWDYunxHcq7YThEfpsayk1+4gdT3tOGeV
         aSH1jVZml0dllw8cs+lCbaU3eM5cv69/CpP4f4LDp8GrfCfwWhuZh046oR6+OBOGqon0
         dNoFERT2+nAniXfm6nlJ2DdjrAV8qqfwye16lP8mi7jxstgZS2HB+r0aGrsCKPVToB4J
         7etQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752850071; x=1753454871;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0wrXIKhwaKHW7DC3rbsM0aYXtZFOnbkt4Tlcd+Ix0O8=;
        b=utQMISKdM4hMFGVwjEWbAgnSC4L3xtnhQw+gvTNxrzDpwJ6/I8ikVULfeaPMNNkR+t
         7rE/ZTmJbc1rVKqnAiw9SYgeWvZcb/cFeDLl5aWFThFY0UK3PWuKkVeZ0FPlRxrfufLm
         6oxgTZShxVxiMXxAylMcOrpDRQRHSfJPbH5muPV0Dv4TUweeAa4yaS0Im0yolguehlRq
         DQrNw0ulVhZRWoohXVrbpXL3jr99tULZpEilshk1hTb2j43bl/kInHMu+IFhr9oiHtz1
         M/VsKq9EU20FHRJlR5oqhFDBOBFaEl6FmEfHi8Kszi5qAj7kfVeIvE0ghYsUsyfWPh+r
         OKSA==
X-Gm-Message-State: AOJu0YxBnyqezm5ZzWyv+FHz1yqJZ/nbuvH5C/zyjMEhNCUUiQMdVrKc
	aJBFiuhJjeTib14d2W0UkIeC/yNF88vIM4W/1sw1yr0dOwef/zkAYjefT3d9izd+aw0=
X-Gm-Gg: ASbGncuic0ZVNCaK5NprytMQPUFtG+bWGnUhuplqwbaEngDUrONijiXdcttyik+cVRt
	F97LR9+0jamRA+E3WY2OMh/AZaAHM+2SEdB20dhhIDoLMDMrACfxCGqH+HII45QVLZtK6fIiyta
	zPI43yuJEfgZC9HZGa9Ff6PTyRxQotikvFbiexCKhdsnq86yteClz39yvRTBGDWITxJ79FeVXk8
	JIl0NiYgm5at+zFozVpoRuqaDLrt1RzrKh7YgN81LcRTHD4Q4hnW6qfMgn9fu4Va3RzYlLtiUn4
	1OXrNTUh0uyZrBZr3S52ebmoKTaHq66suS6Sp1A4WeR9VGRjQDE2HXkQarYixtymNP225m9AFxv
	Jm2p81iG7A2pgyzebduD9yZkfbuLOAuxGh0cc+kMazr1ltI8rWOZBtgjpnYplKxSLhdaVEXPHwg
	lZ
X-Google-Smtp-Source: AGHT+IHmeCCgliflJieJcxYaVeEiJeaG5eaZXTCq0nZO0tyPaHN+CmG0r7M7PG8TjgEvup/ql7ymUA==
X-Received: by 2002:a05:6512:618:10b0:54f:c2ab:c6be with SMTP id 2adb3069b0e04-55a2333f9e1mr813845e87.7.1752850071221;
        Fri, 18 Jul 2025 07:47:51 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31da69f2sm278610e87.198.2025.07.18.07.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 07:47:50 -0700 (PDT)
Message-ID: <c4a2b0b9-4e91-4ad1-b27a-7f948de86825@linaro.org>
Date: Fri, 18 Jul 2025 17:47:44 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: Add OmniVision OV6211 image sensor driver
Content-Language: ru-RU
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250717124001.108486-1-vladimir.zapolskiy@linaro.org>
 <20250717124001.108486-3-vladimir.zapolskiy@linaro.org>
 <fa9a1084-9e90-497a-bf28-579a20a293bc@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <fa9a1084-9e90-497a-bf28-579a20a293bc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/18/25 10:07, Krzysztof Kozlowski wrote:
> On 17/07/2025 14:40, Vladimir Zapolskiy wrote:
>> +
>> +static int ov6211_power_on(struct device *dev)
>> +{
>> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>> +	struct ov6211 *ov6211 = to_ov6211(sd);
>> +	int ret;
>> +
>> +	if (ov6211->avdd) {
>> +		ret = regulator_enable(ov6211->avdd);
> 
> You should just use bulk API and simplify all the regulator handling code.

There is no bulk API for optional regulators.

<snip>

>> +	ov6211->xvclk = devm_clk_get_optional(&client->dev, NULL);
>> +	if (IS_ERR(ov6211->xvclk)) {
>> +		ret = PTR_ERR(ov6211->xvclk);
>> +		dev_err(&client->dev, "failed to get XVCLK clock: %d\n", ret);
>> +		return ret;
> 
> syntax is always: return dev_err_probe
> 

Ack.

>> +	}
>> +
>> +	freq = clk_get_rate(ov6211->xvclk);
>> +	if (freq && freq != OV6211_MCLK_FREQ_24MHZ)
>> +		return dev_err_probe(&client->dev, -EINVAL,
>> +				"XVCLK clock frequency %lu is not supported\n",
>> +				freq);
>> +
>> +	ret = ov6211_check_hwcfg(ov6211);
>> +	if (ret) {
>> +		dev_err(&client->dev, "failed to check HW configuration: %d",
>> +			ret);
>> +		return ret;
>> +	}
>> +
>> +	ov6211->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
>> +						     GPIOD_OUT_HIGH);
>> +	if (IS_ERR(ov6211->reset_gpio)) {
>> +		dev_err(&client->dev, "cannot get reset GPIO\n");
>> +		return PTR_ERR(ov6211->reset_gpio);
> 
> syntax is always: return dev_err_probe
> 

Ack.

Thanks for the review.

-- 
Best wishes,
Vladimir

