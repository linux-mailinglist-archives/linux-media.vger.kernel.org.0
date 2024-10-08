Return-Path: <linux-media+bounces-19248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0159947FC
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 14:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 647E2281F3E
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 12:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238DB1DD867;
	Tue,  8 Oct 2024 12:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LYFHIeOd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E9B1D6DA3
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 12:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728389040; cv=none; b=QLuRRk2Oky5rlLC9b0BayNvB6Yy+BY0d13pLwuQAIsrT2/M5VymODnAXylRYsXq+jHfHKbU4yL0DrVZGkQHlqelxmzmvWPWaZvGU55xN5kTzjYhzS5Uh2vMhPOHLh66p0LurfJVbv2f/0bjhMOv1AkRvFVf7wHajbFTneisLzA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728389040; c=relaxed/simple;
	bh=85lAxkbS8xbg0YNXfWOKqL4WqLN/8Bi+ATrvVTJlxhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cG9ov0J46BsMNjEWRb16HfMQ1+bnnuFVFc53jLvCyV47v2FoI0w629VbdvCIFAl3bI975MUcC7rry8jqM+06yoUZWrUqVrkkOkEA5im0g1jqf7FXxZB77TlxqxRzJnjqKeWgEjDjHH6hkrOjC4dBKQaP5ewyc7SW143PgnkgYes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LYFHIeOd; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5398d424b0cso670425e87.3
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2024 05:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728389037; x=1728993837; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nAQf1RwfX9fvboGB1fihooukV4EYODxstQDe/1FsuVM=;
        b=LYFHIeOdXDxmuPBZcnEGbymzIT5Dv4ntituzXyIfssksVJkS5zhDeQT76hDkJ/xQ1M
         dEx7N8zJ3uoG+puPdkUXThk0xseszvgEaQossX19OjiZeSuWTbh9mX3NVQwc26GKtKYs
         rCh1rLA5x8URl5X4O+DX2edAI2ekrg/mW/kzINVzsJtugP8sTRxsc/SCsDYneXVZTvRf
         yhH9TZ+YAPHoFI2clTnuTJPBwZ9IFeCtnlm534Unh+ajpUk1LP+nO1jaxNJAEOv8TbGL
         Tl1MKZlDtN+hCsfK6g5aoARIFMbePHPIlN6WZgJjBCdG9is7/vMrDayC+i33BY8Baofv
         DJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728389037; x=1728993837;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nAQf1RwfX9fvboGB1fihooukV4EYODxstQDe/1FsuVM=;
        b=vvWVgX8qfeLcu4kAe/oA21ZbkuHdXlda6Rq8uVCf1mX6+CUqxN3Ho43IcJ4BhF2XlL
         xpsohbiqeWJlcSYkhrnWoBeN0OQnhZdE73nPk7rVoUCwsl1BbYrJfGXkbwo3nypqbp9I
         r0trd4Qy6rIOWFpN5OnP4UPorlv4khDuaO3xCTFY0rk+VeN1GQX7ofmrVxd7kLxkAGi0
         MVvBalwu7/il4pRCciTufgLClaKHcNuPuELMgYTS/VJzMV5mGGJw2uEDe9HSgQ8jzDBw
         r4CTKcvIWW72vxbjVMCHA+LFgtuOYijoGOL1VIafS3anfCzxzg/NP6lF8CfvGrV3N5XD
         4HlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqsqd/zZ65zihrw2cikNw9cu620FDxWgYc3gVZ+0xNmZZoVsZ/A73jBD8p6Y9Yal/CY+ACyd3aktWd+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz66m65PT6dObwW3u6tcOghYtEm/Fj1x7YYATWdLMUb0mdmQmn4
	NcgP0XjGhASqvAj8Pmn2TXLWm5iry+iZNZ5Si7Pl6IAULQL2QX3oCq3y7HpI/SA=
X-Google-Smtp-Source: AGHT+IHiqT/frXMNV4/pOLqA30mhBxVW1WxZ88DYASmxpZ7kJNqvQyDYDxhzNYNHWr9VtnJK/yUqCQ==
X-Received: by 2002:a05:6512:3190:b0:52f:413:30de with SMTP id 2adb3069b0e04-539ab9e885bmr2125790e87.7.1728389036782;
        Tue, 08 Oct 2024 05:03:56 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff23334sm1171893e87.184.2024.10.08.05.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 05:03:55 -0700 (PDT)
Message-ID: <80744e19-71f8-4ae7-b2e8-1dc14e55385c@linaro.org>
Date: Tue, 8 Oct 2024 15:03:54 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: media: qcom,sc8280xp-camss: Fix
 interrupt types
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20240923072827.3772504-1-vladimir.zapolskiy@linaro.org>
 <20240923072827.3772504-2-vladimir.zapolskiy@linaro.org>
 <datahu33nmsser2p4fb2hyncsujtkwaca377ivwmpc6yj2naut@2sjsbebfm3gf>
 <3f87e855-8779-4df3-8f26-e3d2b611d3e9@linaro.org>
 <313667a6-afcd-44cb-a6f6-0d550e8f68a0@linaro.org>
 <4bf490cb-228d-4f01-a956-cacbafa94e2a@linaro.org>
 <5ea36051-1e1b-44ca-b5ef-d6305079201b@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <5ea36051-1e1b-44ca-b5ef-d6305079201b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/8/24 14:45, Krzysztof Kozlowski wrote:
> On 08/10/2024 13:37, Vladimir Zapolskiy wrote:
>> Hi Krzysztof.
>>
>> On 10/8/24 14:15, Krzysztof Kozlowski wrote:
>>> On 08/10/2024 12:02, Vladimir Zapolskiy wrote:
>>>> Hi Bjorn,
>>>>
>>>> On 10/6/24 05:36, Bjorn Andersson wrote:
>>>>> On Mon, Sep 23, 2024 at 10:28:22AM GMT, Vladimir Zapolskiy wrote:
>>>>>> The expected type of all CAMSS interrupts is edge rising, fix it in
>>>>>> the documented example from CAMSS device tree bindings for sc8280xp.
>>>>>>
>>>>>
>>>>> Who/what expects them to be RISING?
>>>>
>>>> I've checked CAMSS device tree bindings in a number of downstream kernels,
>>>> all of them describe interrupt types as edge rising.
>>>>
>>>> $ grep -Hn IRQF_TRIGGER drivers/media/platform/qcom/camss/*
>>>> drivers/media/platform/qcom/camss/camss-csid.c:619:			       IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN,
>>>> drivers/media/platform/qcom/camss/camss-csiphy.c:605:			       IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN,
>>>> drivers/media/platform/qcom/camss/camss-ispif.c:1164:			       IRQF_TRIGGER_RISING, ispif->irq_name, ispif);
>>>> drivers/media/platform/qcom/camss/camss-ispif.c:1168:			       IRQF_TRIGGER_RISING, ispif->irq_name, ispif);
>>>> drivers/media/platform/qcom/camss/camss-vfe.c:1327:			       IRQF_TRIGGER_RISING, vfe->irq_name, vfe);
>>>
>>> Downstream has a lot of bad code, so I am not sure how good argument
>>> this is.
>>>
>>> I acked the patch because I assumed you *checked in hardware*.
>>>
>>>>
>>>>    From runtime point of view it's more important to get re-probed camss
>>>> driver, see an absolutely similar and previously discussed case (in the
>>>> cover letter):
>>>>
>>>> https://lore.kernel.org/lkml/20220530080842.37024-4-manivannan.sadhasivam@linaro.org/
>>>>
>>>> Now in runtime I get this error, it's easy to check by unbinding/binding any
>>>> camss device:
>>>>
>>>> irq: type mismatch, failed to map hwirq-509 for interrupt-controller@17a00000!
>>>>
>>>> Basically camss devices can not be bound on the second time on the
>>>> number of platforms touched by this changeset.
>>>
>>> This is solveable different way and I do not understand this rationale.
>>> The driver should not request trigger type but use what DTS is
>>> providing, unless of course only one valid trigger is possible.
>>
>> Right at the moment the driver uses rising edge type of interrupts, and
>> it works properly.
>>
>>> But so
>>> far you did not provide any arguments for this. Downstream crappy code?
>>
>> Downstream code works, that's the argument to support the change.
> 
> That is not acceptable argument. If downstream has a bug, but somehow
> works, you will implement the same bug upstream?
> 
> Downstream is well known of shortcuts, incomplete solutions and crappy
> code, which passes some tests but might not be really correct.
> 
> I understand that downstream can be a supportive case, but not for level
> of interrupts! People, not only downstream but it's even worse there, do
> not see the difference between level and edge, between GPIO ACTIVE_HIGH
> and ACTIVE_LOW.
> 
>>
>>> Nope. Existing driver? Same.
>>
>> The existing driver works, that's the argument to support the change.
> 
> We are not going to get into such discussions. Code might be incorrect,
> but mostly works because race issues are very tricky to spot, yet you
> use that code as argument to say hardware is like that.
> 
> No. Hardware is not because driver is written that way.
> 
> 
>>
>>> Was anything here actually checked with datasheets/hardware?
>>
>> The initially open question is unanswered, why sc8280xp CAMSS does
> 
> This is about all CAMSS, not only sc8280xp.
> 
>> specify interrupts as level high type, was it actually checked with
>> datasheets/hardware, as you say it? It has never been tested by anyone
>> and anywhere, downstream or upstream wise, only rising edge interrupts
>> were tested, and they do work.
> 
> I did not ask about testing. I ask how the manual, hardware engineers
> designed it.
> 
>>
>> I don't have access to datasheets or hardware of sc8280xp powered board,
>> someone may either verify, if CAMSS level high type interrupts are> supported/working at all or not (obviously its current presence in dts is
>> insufficient), or check the SoC datasheet.
>>
>> To sum up, the intention of this change:
>> 1) fix the unpleasant runtime issue with no regressions (it's been tested),
> 
> Did you test races and all the tricky issues arising when you use
> incorrectly edged interrupts? Or you just checked that "interrupt works"?

Right from the beginning and any other day CAMSS interrupts are tested as
rising edge interrupts. So, I don't undestand your point here, please
elaborate.

>> 2) align CAMSS device description in firmware with known to work well
>> IP hardware configuration.
> 
> Where is this description in firmware? Where is this IP hardware
> configuration? You just said it is purely on downstream driver.

CAMSS IP configuration, in particular interrupt type, is done by the
upstream driver, note that the fixes in this changeset is also sent
against the upstream driver, tested on the upstream driver etc.

--
Best wishes,
Vladimir

