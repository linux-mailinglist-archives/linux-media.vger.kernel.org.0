Return-Path: <linux-media+bounces-32498-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9BFAB6FA3
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 17:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D46E4C5D89
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 15:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2011C5D4C;
	Wed, 14 May 2025 15:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I7PftzNH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897011865FA
	for <linux-media@vger.kernel.org>; Wed, 14 May 2025 15:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235780; cv=none; b=ouJ1kO5S0Q5SDA9KA8H0b4yueQ49KjBEdccvA4Ho7vAX9HGqZHPIAPQpwHVgr5F/jrUVikP5t9JXeXDpQoO4HFQpcPx2Tp2wZ/lCiFX8ZfQy9lRtqAbtdVRX/7Ch4AIWnXwq30qn4X4ziWKI9VJv4YIiFDf3HSoKJNGKMNb4uHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235780; c=relaxed/simple;
	bh=A+ZREnFnjy7WnbyzA04zfHjDIR84YL3agT01BU5S4iA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PkWYiTIE5HFNfIRqRtimkcymq1thojQxERtaO3+Z6kw8/+75GjcDtrFtpiGyBQuadjv9NjUCTdKaJjNvUfxCeSMqcXM46/Xymf8+q/0KjpLwr+osyVGrlI4uJ60bitVlQhMFRNIU6pRMiM6xnPu7lZancZQWAjofbFNilC9hEQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I7PftzNH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so8861765e9.2
        for <linux-media@vger.kernel.org>; Wed, 14 May 2025 08:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747235777; x=1747840577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kLLB2JgoE/wciIQn8PJQyEZ3gk5gElbJqmLV5zYv7MQ=;
        b=I7PftzNH9+uKqbxwPT8FNhThm+8VDi7N3xAfWoH6ZPEs2V92vDzWVMEIPwCuuWd1/e
         NNwnQ3agYhkAwf4qJ5qTw8s7GF0f+a4eepwksjgeRHYUgxqpd4Sd7B+gbpFemxJMziDS
         qYEq8sH2U5x45XcfLJCM/iJhcBdMNgREfeKGlxPd/avCHGmWe7zfKaw+CoFe3oV2PQzf
         uT500UZcAmx5oz8hV0ptOgRG3d+QMFjF2Dg/kL0/1bLtnnc3irB2ZiwK2PORq4XEuM5T
         ROvj2LFy4mzvrfKNPrwddLZ2CO/Lu1vDJEDDbtXpHVyWthpJ0AMR4rqgpcmgxzBrD02P
         IbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235777; x=1747840577;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kLLB2JgoE/wciIQn8PJQyEZ3gk5gElbJqmLV5zYv7MQ=;
        b=GqjogcuOTA1ZCRijxCLC1c+XobiYaux3Npii0fTuq7kT12R5zF90F7ZgIYxANccice
         k5oNhgK3OUraocQ5Je74yLB93Umcm3qkPXGAef+6a2e1+TPE/o2ISGzeCjraoGZY8JIW
         TbGUWbBO2XWg+3mjP0248EZxC7SsztxnqcriR+idBCcn66WmarGf6emBHhS08zbfuHbI
         SF1jGC/F/B9CYZmExG/XAV0sPMXS8OrJQZO8WIRip24o8eM4WwQLAy+DD0lZVv8SLblo
         xE7Rp0fQrdIqDcZVEmCgvUi1pP4/DmjLgbAzeqL5rOMhB90Gzz9V5kw7y0smFQ6ja5RH
         yxVA==
X-Gm-Message-State: AOJu0YzJ/Au0pVJJ3vhJktsbqaGmGrqlMUqykuJFXyhXP7XD6L61jBxM
	A4D3eN2HvQDEKpr9VibhH5Wprdp36XiW6hq28LihHBQioN64+L5i4ndAq2r+5oU=
X-Gm-Gg: ASbGncuiXst5Xlbk4+mt0NNdeTM8iiidN+NotBM7Uq63MXo8RJigA6XCo/lh3AW0rzN
	Q9jf3VF3l1dC17k8kUW63CH4FxPLGDnDDXwzwKJwqc9EJuP4Pm4V2qcG2+4iMcZHc3HF2e0BqvU
	8RRSycN4qFB5/FXBW/jJO5FSXkbBiUdlA2hw0nPWyo9EyZm9SU+JjI7Pw0jw4ntPeyCpKKluSh3
	WVno0jSOfXmQrgDxTv5fA3gUzXR1wDN+7cesqr/njhWLHg1/+SQdG04htL8lFnyS+8dbgKyrkmi
	HxYK/G93eD+OV9AGcck9J3zni/7uJ6uMauEVcA85hjfKWBIPtz4P1X/s5luclA5KK6inDyUzDiI
	ePKlPT7SyZ2GMQfQV
X-Google-Smtp-Source: AGHT+IGRdqEZoH0m8g2XpOtD2dtSxKfER2HIpxDhVxDms9lqGHZslGS6DbXQ+jZD7wxOe3qZZbBy/w==
X-Received: by 2002:a05:600c:3582:b0:439:9a40:aa1a with SMTP id 5b1f17b1804b1-442f21778d8mr12217105e9.6.1747235776744;
        Wed, 14 May 2025 08:16:16 -0700 (PDT)
Received: from [10.61.0.69] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3368f36sm36810025e9.1.2025.05.14.08.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 08:16:16 -0700 (PDT)
Message-ID: <4184cb3a-bbdb-481a-9a82-f487f9ac3689@linaro.org>
Date: Wed, 14 May 2025 18:16:15 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] media: qcom: camss: unconditionally set async
 notifier of subdevices
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <20250513142353.2572563-6-vladimir.zapolskiy@linaro.org>
 <33caa974-75f7-4054-9f75-9b97981335f1@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <33caa974-75f7-4054-9f75-9b97981335f1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan.

On 5/13/25 18:46, Bryan O'Donoghue wrote:
> On 13/05/2025 15:23, Vladimir Zapolskiy wrote:
>> For sake of simplicity it makes sense to register async notifier
>> for all type of subdevices, both CAMSS components and sensors.
>>
>> The case of sensors not connected to CAMSS is extraordinary and
>> degenerate, it does not deserve any specific optimization.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>    drivers/media/platform/qcom/camss/camss.c | 30 ++++++-----------------
>>    1 file changed, 8 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 976b70cc6d6a..4e91e4b6ef52 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -3556,7 +3556,6 @@ static int camss_probe(struct platform_device *pdev)
>>    {
>>    	struct device *dev = &pdev->dev;
>>    	struct camss *camss;
>> -	int num_subdevs;
>>    	int ret;
>>    
>>    	camss = devm_kzalloc(dev, sizeof(*camss), GFP_KERNEL);
>> @@ -3627,11 +3626,9 @@ static int camss_probe(struct platform_device *pdev)
>>    
>>    	pm_runtime_enable(dev);
>>    
>> -	num_subdevs = camss_of_parse_ports(camss);
>> -	if (num_subdevs < 0) {
>> -		ret = num_subdevs;
>> +	ret = camss_of_parse_ports(camss);
>> +	if (ret < 0)
>>    		goto err_v4l2_device_unregister;
>> -	}
>>    
>>    	ret = camss_register_entities(camss);
>>    	if (ret < 0)
>> @@ -3647,23 +3644,12 @@ static int camss_probe(struct platform_device *pdev)
>>    		goto err_register_subdevs;
>>    	}
>>    
>> -	if (num_subdevs) {
>> -		camss->notifier.ops = &camss_subdev_notifier_ops;
>> -
>> -		ret = v4l2_async_nf_register(&camss->notifier);
>> -		if (ret) {
>> -			dev_err(dev,
>> -				"Failed to register async subdev nodes: %d\n",
>> -				ret);
>> -			goto err_media_device_unregister;
>> -		}
>> -	} else {
>> -		ret = v4l2_device_register_subdev_nodes(&camss->v4l2_dev);
>> -		if (ret < 0) {
>> -			dev_err(dev, "Failed to register subdev nodes: %d\n",
>> -				ret);
>> -			goto err_media_device_unregister;
>> -		}
>> +	camss->notifier.ops = &camss_subdev_notifier_ops;
>> +	ret = v4l2_async_nf_register(&camss->notifier);
>> +	if (ret) {
>> +		dev_err(dev,
>> +			"Failed to register async subdev nodes: %d\n", ret);
>> +		goto err_media_device_unregister;
>>    	}
>>    
>>    	return 0;
> 
> If I've understood the intent here, don't think this is right.

Please elaborate, so far it's not completely clear.

> For cases where we want to run CSID TPG or standalone TPG we would not
> necessarily have a sensor connected.
> 

That's correct, and this is not broken by any means.

As you mention it there might be so many usecases, but fortunately all of them
are covered by the code, which is noticeably simpler than the original one, and
which opens the path for even further code optimization and simplification, as
you find it in this changeset.

--
Best wishes,
Vladimir

