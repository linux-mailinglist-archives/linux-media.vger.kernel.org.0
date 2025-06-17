Return-Path: <linux-media+bounces-35110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7FAADD692
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 18:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9890167F6B
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 16:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB442DFF3D;
	Tue, 17 Jun 2025 16:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wumJfGyo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7107A2DFF39
	for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 16:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750177374; cv=none; b=eSHbNF5SsyKYiVqYJY6VJoX+H4a7h6mNtgUvnVKV9V2dq/8K3VMT5yG6vx90OPJHMPutWFRTPmkrTgNbPDONJaAnPU/P22orHBpePn/9qbPewG2RNF3MFZSmpDKGR/flmrQgb+g+I9kd7YLUmiGnvNzX0+g3ZGfMKbW85GEhEkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750177374; c=relaxed/simple;
	bh=MhwFtxAlravvczw0JfhOul+bnIosi3MCsdE1UFu1e/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UWD6+Dp7T2RMYUi9lq+TcjsALYis2F9AXwSfwRxfQ5NGQbT7p2/nBlsO95d2ztzIB8pp33XWYuNT12kykUrjhkZYPAj6bqupa9m3jZrSvHexfJ28HmIAL4RGjedR4mW6GUqmUHeXrGFSSJMTbKiPogjaA/4kGFnzXDMOSPTjlck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wumJfGyo; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553affea534so476444e87.2
        for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 09:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750177370; x=1750782170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PsoeicGOSSqRUjsJsDG6LBXx49UWTO0GwrK8vHTZV54=;
        b=wumJfGyoXwYpGHfpQLWBUsI/Lm9bwRJY5XNNRnlkVs3hX+QLEBjx/Ic7cT1f+Gz9E1
         XMKM62mVcaXDXbEXxbEIMNWxlBKYfqzqC/iUVHQmRGGjHTt6d7hmfGJwoL18Vo88Xx1z
         FOEqaHCJZc+IFnb8qkxX6j+1pPulryiNcfVPfts83Mk6T6WiHBya2XzY4hIpHnJ161LA
         qqmvZMN3xVWmrW2Uws4x8l7cd1TMDTPjASK3vBctB8qXlVixslLq2OLswMDD9W2hte7B
         x/SbAjcwu8VviWTR5ljAmz78a55XLph/xgU+S0ek752onVKmsGpmHrcBdF0MQF56Rz84
         dHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750177370; x=1750782170;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PsoeicGOSSqRUjsJsDG6LBXx49UWTO0GwrK8vHTZV54=;
        b=Oz18OANeJJboghoiTH4JfLpFFIlmkIfyREsnnLkKk1dlchRU+xgG6hcB+auQElL/28
         dpRN96l+CuiNPWNgo4HUAursCDMJrpjsXdVbtQjpUO1qq/hgQOIqG2z52iBcAzd5PS+d
         b/iy9kxV5t6Clem8MFru3r7YhGRa2De+uV9G7mhhM1PQNB7+NRqo+Qz5vEN+PvqHif1g
         O7ZnnoP4rMAIhE+oQI/AZOsT7RcvZPjmAho7tFpuSk+syjV6pZ+CfZ3oFzqJPx8Zu4rP
         axY8g+rwkU2uHOeeSd3gy3B2FvQqQ8JrMgdRE9hqV+6aOUOh7dDDP1Tc9YNnJMswFn4I
         vo8w==
X-Gm-Message-State: AOJu0YyDg4SB3zPWuOrasQRHsMbZFaLJRl6QDdHI3WPzbA7tarfP0WMA
	NB6EHGqzcoZ6Zy+3rEQXB80/iqEbexO6SsMIoZKJMVzQRRWrsmtWpmnZ3Nm6G0qnYUg=
X-Gm-Gg: ASbGncuPr1uV42ANEADtkDQFmjXXbDputSB48UmutKpG++IdC8rthZKockluS+O00hI
	vd+pMaG0cohcjt36kXOehf2KFtq6ScGLjA5IBsQfSrdJfATRPoygWXSzCa4A6PdQP0l3D0hPMCA
	vh8s6w5FvhKWSwGgQLhN4MDUgCa2kdZeKA5UV8Y7OE1s93lzofFFdGH0knoq/bXc0sxfxb4r7wk
	MeARId9ABR3GMVeu9kKNjDaRmhC0pUiDAnX4LOzigdy/oK/HAsQfxaRya+yGu9IEiy9RSU0CGcQ
	t7Oi5Us5+HFulXwBXASLVfwZYN6SUZ1S5Inzi+DykT50xde5YoeRbYfaqUZFP4MosHPpPd90DCs
	wjFxyVevaoq6RAkGUFHCjj2VHAD0weL192CtktPaJ58c2/euXoMs=
X-Google-Smtp-Source: AGHT+IFUlwulBeBW+bhEpLJ2Qe4Oxt3ON2DjPUtoN45ku2zX2tmviv7zPbSQch2uU/1FVIFysizEJQ==
X-Received: by 2002:a05:6512:398b:b0:553:35f5:7aa5 with SMTP id 2adb3069b0e04-553b6f13a34mr1088543e87.9.1750177370379;
        Tue, 17 Jun 2025 09:22:50 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1cb193sm1969179e87.169.2025.06.17.09.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 09:22:50 -0700 (PDT)
Message-ID: <6378b7f3-969d-4a98-a0a1-e410c63c1ede@linaro.org>
Date: Tue, 17 Jun 2025 19:22:49 +0300
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
 <zBer3I3HLlZQo2k4k2sL3uFKCBxznED-ZHOnvQLXBVcNUBIy9DndjcOE1TxMSdb8Kkpj9xCmWGPpX9mdLHE-uA==@protonmail.internalid>
 <20250513142353.2572563-6-vladimir.zapolskiy@linaro.org>
 <91792283-8b61-42f8-b16d-e7f468325b42@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <91792283-8b61-42f8-b16d-e7f468325b42@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan.

On 6/13/25 12:11, Bryan O'Donoghue wrote:
> On 13/05/2025 15:23, Vladimir Zapolskiy wrote:
>> For sake of simplicity it makes sense to register async notifier
>> for all type of subdevices, both CAMSS components and sensors.
>>
>> The case of sensors not connected to CAMSS is extraordinary and
>> degenerate, it does not deserve any specific optimization.
> 
> Degenerate is an odd word to use.

Well, here the wording "degenerate case" is a direct borrowing from a
mathematical term "degenerate case" with no intended change of meaning:

https://en.wikipedia.org/wiki/Degeneracy_(mathematics)

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
> I'm a little concerned about changing the current flow. Have you tested
> this out without sensors attached, the TPG on rb5 for example ?

Yes, I have tested this out with the TPG on RB5 by removing a sensor
description from the RB5 vision mezzanine, I don't find any regression.

Please let me know, if you find any issues with the change.

--
Best wishes,
Vladimir

