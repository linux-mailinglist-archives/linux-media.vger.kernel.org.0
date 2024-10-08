Return-Path: <linux-media+bounces-19253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96513994938
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 14:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50B682825D8
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 12:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD62A1DE89A;
	Tue,  8 Oct 2024 12:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dH4tfhBP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0801DEFF3
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 12:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728390035; cv=none; b=Gj8w9SKvc/LQBAYQBNccI6Bmcq/fhZngahyOskE7UAWgkj1oQjT6K6JLq60xdKI+51/dw0Bu/aOMgViHB7nlSIqSv2XXYjYPu6aak9jaZmpzpGPYI4zLY3bdBhCybAAttpcAovA13DmnJGvXKAl21z8hSvhi6lHcn7b4KCERIwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728390035; c=relaxed/simple;
	bh=5y/cz5R08rOxJCHK0Aj/mnQ+ztZX2npGMkE7PNgHu6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oYpt96kY6yLt7cOLZaEPeAex3x4qnphycem3clwHzmi34DKcZmlsCWi3tbRb6/U4X5svvJimr3ChbIeGZTJkAXRMf8uq4dP4FDIp+nWyTdpHYrLSGGDuh9VDMqUzOzoZS1+rJUIojVpaX5qGsSlbuMyglDVoXpMk2Nn0iKwyh3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dH4tfhBP; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5398bc32bd9so620115e87.3
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2024 05:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728390031; x=1728994831; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o4ywl6VI0bSfSJ7uxcOzTs5VABfElpBNGL9ce9UraIM=;
        b=dH4tfhBPben+Puc0RDD0jKQlOfzZBZmmb/HWJjFkqDBYodP3CC+f2C68UWC1JrL5cB
         BC58omwn3t9BbVlWwnClBuL3/7Ig+PV2GaqDebGYn2sIHFqFIZCAeYMfB9R3C/yKynL/
         L2Pe+oYk0OkS8kuOfMsf7s0n0xJpJrh/X3KbZAB75DD+uPg3Jc/GRzRmBHrIGoLR1J76
         oVWpLvfjwHyp1v1Z7zIGxFiQ1SnNQMn7TnM/7BQd1TElQXmeBBab8uNg3NaZeOxCd82K
         hy/UhmQXlKzWUGTVWcppjRRbAuOjTuAU9qjejT5N+aWUKfNOfkuYUgo80hOsEMK6pOa2
         eSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728390031; x=1728994831;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o4ywl6VI0bSfSJ7uxcOzTs5VABfElpBNGL9ce9UraIM=;
        b=nphye2aB3axU7ijyB4uRpelJEWmd5Xq+tKIz1tq70Xdyn6JkimGyrfJZimf/hUFbQC
         7NnRpoHxfvsVG4bLknsajlgAhiLA7u0GfBb6mypI1d/Ee+uwnJ76RUYwV/z0EVQRrlNV
         MkS9Y+HQ1BcCwU3OQdGvCo64mIzhgZjm5jKRYbViuTsrjFOaiIE6RAgfale4cOZEMuSd
         sajAc7aG6FJpGzwRkZDwiIAKRY7hrfrJH0Ac8kzULrSpf/9OZbV+w6S6Hfjo9iJv/miG
         yQgN7agZlEMlqfTQtK+nySs0jA2CbOYO1EgNJFMVm8MvhxgC/mI0Rh579mGaHYZPKy7k
         sulw==
X-Forwarded-Encrypted: i=1; AJvYcCWjafT+phURCNuTKqqWtEbVtJtsaN6XDOIOiv7g0GbfOeW1mdC+Elx4KP+3ZLuiI3P2JuRC8ZNgb7fBmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz54M7SR76S4NTtrXjQ1IwTYce97G1TV70aFvlTFIy4aByDKAK1
	z2BC8isxC+VX/Wo70Cx+lEiPEkx8t1SYENwlne9DXbrqAoN5bAFARzjuiFaX5AQ=
X-Google-Smtp-Source: AGHT+IGymtG1stGaLIEddofyRWh4PDJDMQ6v/DjXHnxk8nnHcuv85Ktp65IIT7bGYpbTHQbYBWdcbg==
X-Received: by 2002:a05:6512:3190:b0:536:55a9:4b62 with SMTP id 2adb3069b0e04-539ab866580mr1980570e87.3.1728390031057;
        Tue, 08 Oct 2024 05:20:31 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec1187sm1185026e87.32.2024.10.08.05.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 05:20:29 -0700 (PDT)
Message-ID: <f446c493-17d5-41ec-9848-8c8e31702fc4@linaro.org>
Date: Tue, 8 Oct 2024 15:20:28 +0300
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
 <80744e19-71f8-4ae7-b2e8-1dc14e55385c@linaro.org>
 <268d0dd0-a65f-4eaa-a317-fe9fcc06e718@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <268d0dd0-a65f-4eaa-a317-fe9fcc06e718@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/24 15:06, Krzysztof Kozlowski wrote:
> On 08/10/2024 14:03, Vladimir Zapolskiy wrote:
>>
>>
>> On 10/8/24 14:45, Krzysztof Kozlowski wrote:
>>> On 08/10/2024 13:37, Vladimir Zapolskiy wrote:
>>>> Hi Krzysztof.
>>>>
>>>> On 10/8/24 14:15, Krzysztof Kozlowski wrote:
>>>>> On 08/10/2024 12:02, Vladimir Zapolskiy wrote:
>>>>>> Hi Bjorn,
>>>>>>
>>>>>> On 10/6/24 05:36, Bjorn Andersson wrote:
>>>>>>> On Mon, Sep 23, 2024 at 10:28:22AM GMT, Vladimir Zapolskiy wrote:
>>>>>>>> The expected type of all CAMSS interrupts is edge rising, fix it in
>>>>>>>> the documented example from CAMSS device tree bindings for sc8280xp.
>>>>>>>>
>>>>>>>
>>>>>>> Who/what expects them to be RISING?
>>>>>>
>>>>>> I've checked CAMSS device tree bindings in a number of downstream kernels,
>>>>>> all of them describe interrupt types as edge rising.
>>>>>>
>>>>>> $ grep -Hn IRQF_TRIGGER drivers/media/platform/qcom/camss/*
>>>>>> drivers/media/platform/qcom/camss/camss-csid.c:619:			       IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN,
>>>>>> drivers/media/platform/qcom/camss/camss-csiphy.c:605:			       IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN,
>>>>>> drivers/media/platform/qcom/camss/camss-ispif.c:1164:			       IRQF_TRIGGER_RISING, ispif->irq_name, ispif);
>>>>>> drivers/media/platform/qcom/camss/camss-ispif.c:1168:			       IRQF_TRIGGER_RISING, ispif->irq_name, ispif);
>>>>>> drivers/media/platform/qcom/camss/camss-vfe.c:1327:			       IRQF_TRIGGER_RISING, vfe->irq_name, vfe);
>>>>>
>>>>> Downstream has a lot of bad code, so I am not sure how good argument
>>>>> this is.
>>>>>
>>>>> I acked the patch because I assumed you *checked in hardware*.
>>>>>
>>>>>>
>>>>>>     From runtime point of view it's more important to get re-probed camss
>>>>>> driver, see an absolutely similar and previously discussed case (in the
>>>>>> cover letter):
>>>>>>
>>>>>> https://lore.kernel.org/lkml/20220530080842.37024-4-manivannan.sadhasivam@linaro.org/
>>>>>>
>>>>>> Now in runtime I get this error, it's easy to check by unbinding/binding any
>>>>>> camss device:
>>>>>>
>>>>>> irq: type mismatch, failed to map hwirq-509 for interrupt-controller@17a00000!
>>>>>>
>>>>>> Basically camss devices can not be bound on the second time on the
>>>>>> number of platforms touched by this changeset.
>>>>>
>>>>> This is solveable different way and I do not understand this rationale.
>>>>> The driver should not request trigger type but use what DTS is
>>>>> providing, unless of course only one valid trigger is possible.
>>>>
>>>> Right at the moment the driver uses rising edge type of interrupts, and
>>>> it works properly.
>>>>
>>>>> But so
>>>>> far you did not provide any arguments for this. Downstream crappy code?
>>>>
>>>> Downstream code works, that's the argument to support the change.
>>>
>>> That is not acceptable argument. If downstream has a bug, but somehow
>>> works, you will implement the same bug upstream?
>>>
>>> Downstream is well known of shortcuts, incomplete solutions and crappy
>>> code, which passes some tests but might not be really correct.
>>>
>>> I understand that downstream can be a supportive case, but not for level
>>> of interrupts! People, not only downstream but it's even worse there, do
>>> not see the difference between level and edge, between GPIO ACTIVE_HIGH
>>> and ACTIVE_LOW.
>>>
>>>>
>>>>> Nope. Existing driver? Same.
>>>>
>>>> The existing driver works, that's the argument to support the change.
>>>
>>> We are not going to get into such discussions. Code might be incorrect,
>>> but mostly works because race issues are very tricky to spot, yet you
>>> use that code as argument to say hardware is like that.
>>>
>>> No. Hardware is not because driver is written that way.
>>>
>>>
>>>>
>>>>> Was anything here actually checked with datasheets/hardware?
>>>>
>>>> The initially open question is unanswered, why sc8280xp CAMSS does
>>>
>>> This is about all CAMSS, not only sc8280xp.
>>>
>>>> specify interrupts as level high type, was it actually checked with
>>>> datasheets/hardware, as you say it? It has never been tested by anyone
>>>> and anywhere, downstream or upstream wise, only rising edge interrupts
>>>> were tested, and they do work.
>>>
>>> I did not ask about testing. I ask how the manual, hardware engineers
>>> designed it.
>>>
>>>>
>>>> I don't have access to datasheets or hardware of sc8280xp powered board,
>>>> someone may either verify, if CAMSS level high type interrupts are> supported/working at all or not (obviously its current presence in dts is
>>>> insufficient), or check the SoC datasheet.
>>>>
>>>> To sum up, the intention of this change:
>>>> 1) fix the unpleasant runtime issue with no regressions (it's been tested),
>>>
>>> Did you test races and all the tricky issues arising when you use
>>> incorrectly edged interrupts? Or you just checked that "interrupt works"?
>>
>> Right from the beginning and any other day CAMSS interrupts are tested as
>> rising edge interrupts. So, I don't undestand your point here, please
>> elaborate.
> 
> So you did not test whether these are correct interrupt types. What to
> elaborate more? You have very tricky race condition, for example, so you
> test that it is not possible.

Krzysztof, we are going rounds...

Every single user of CAMSS test only rising edge type of interrupts of
the IP. What are the races you are talking about? I kindly ask to read
the cover letter, it describes the problem fixed by the changeset.

>>>> 2) align CAMSS device description in firmware with known to work well
>>>> IP hardware configuration.
>>>
>>> Where is this description in firmware? Where is this IP hardware
>>> configuration? You just said it is purely on downstream driver.
>>
>> CAMSS IP configuration, in particular interrupt type, is done by the
>> upstream driver, note that the fixes in this changeset is also sent
>> against the upstream driver, tested on the upstream driver etc.
> 
> What does it even mean? You said "device description in firmware" and

"Device description in firmware" is DTB.

> "IP hardware configuration", but now speak about drivers.
> 

"IP hardware configuration" is done by the driver, this terminology does
not cause any surprises or ambiguity, I hope.

It's been always that "IP hardware configuration" of CAMSS interrupt types
completely ignores "device description in firmware" of CAMSS interrupt types.

By design due to endless problems with firmware like the one under discussion
interrupt types derived from firmware are ignored, and their correction in DTS
is problematic for whatever reason.

--
Best wishes,
Vladimir

