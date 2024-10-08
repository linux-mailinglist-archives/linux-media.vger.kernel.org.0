Return-Path: <linux-media+bounces-19234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D18D994761
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 739D3B25B8D
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 11:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E6918BC11;
	Tue,  8 Oct 2024 11:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FeXrsJGM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193A817C21E
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 11:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728387476; cv=none; b=tC03Ygod2F1Go/Q0psiEU3znOU+aBVIDqbLIKxMajbF+hU9T6CqwrzT7bjAceC+jm355iXbqOUaQagAs3safgrlv7PH0t1tyQaDusmLSTEMfCKwObnL7SFidhv++/aNyAUbjQPiDWB2M3bB2+MZ36rw8y0NADsGcQDvq6ABkwf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728387476; c=relaxed/simple;
	bh=FR2taoYdNh6APucBP6uh45baOLttMV+R2lVZvZQMxrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YPWzWQn0hC84BPnsmvK0gGNs/wqzjol8HpqpJ4/HWlg3cLsJrSjrvKCP7NiZpcCtacM+ayk9RNoee90eQptxevz9ajmGp/ga2UMppYidSoCAlkiXu2GdMAqpszrFwSFc+G+K9DvpBk1DiVHnZpR9qx8BdM8MnWP2mVGwnDqYp1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FeXrsJGM; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fabc7ca034so2690091fa.0
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2024 04:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728387472; x=1728992272; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R8uLMb91DkzW43odhG5R0KAnBmoBDxrnzRhBJzgNaWI=;
        b=FeXrsJGMmiYoYjVmRF6BAUGg9pVZs2WHkvbbwVGk3uSe+9avUc8QWesR8UD533omth
         jFAqdDpRKqxAwafgLHi9dqVQK6/XPjqquzlqeJxjn6kp855NdaocHzvGpoySK1rbFTW6
         P9OCIYKOv5/dLUK6+vxvyLp/JnWlBbsZR5m0j+SyjCThGZhw9XOOYuP4h4EJv+jRhyKy
         rb0NNzwivq0Dd88/8MYWeusK+PqMqUZkx3JKvt/DeVKsqtf5pZMLmQ/VYcM/u1b4F8im
         SVogd1Fnh0aKZ78ElTgTtmBAw674DEPLfCv3R/pyQHZryZkUVoM9JNREWjmbPo3iOhLg
         4C/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728387472; x=1728992272;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R8uLMb91DkzW43odhG5R0KAnBmoBDxrnzRhBJzgNaWI=;
        b=ZdcBrH1Uuznir5pvnpaFXv6/WKzZ9nUFNOkRHx22kRVZyjnJwsB95WbfLIp5ujXG+A
         3xGmPorrH0uNC9FYQYh9RGO/Bbqiv4oqksE+GieUnEY3K84RUlXxVZZ50xYrHKTUipUN
         4C9XAO6vc71w3OWFEYicXV4Feign0hP3P7gw0b2YdVm+KkZGsnk4CjiDZ1AfCLdapu7L
         +QNHp8hQ/XolR10865zHM01gvoKqde3v0WcD+QPWgCb62/cpR+NiF79cl9kIawO1YRsw
         yx2e8Fqfw4c8+BwSQuwOccm2oypSQ7U976/Af+yxnYbZegiULepKrKMNeZN3t2QQUBZV
         m1uw==
X-Forwarded-Encrypted: i=1; AJvYcCVoqQzeR1+9ruJMCb8nSaVz9HCu83O6BEkfvbN62WO25FIVITwTcEcEO8Obpkr3bGZ3KFzKjdIfe/cU9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVRWcGBWrCzgoeTDUwuboJTr6o0wKPRBOdzi4QmcpdnyOkKpI0
	tziXG4LZyxvCSFocK4Jc6/RwWF0G1k71OF673o0Wn3Vb1M6Ok1hJp2g0Z/cDt8I=
X-Google-Smtp-Source: AGHT+IG7oaEnlMHbMwR/uHJTMvjZOz7dxsEEyzIbBVpNsVmWfCQirwrKYeDwT+CEe1LQgq96/XV9Nw==
X-Received: by 2002:a05:651c:1549:b0:2fa:ddb5:77fd with SMTP id 38308e7fff4ca-2faf3c13936mr21946091fa.6.1728387472047;
        Tue, 08 Oct 2024 04:37:52 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9ac452dsm11373461fa.48.2024.10.08.04.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 04:37:50 -0700 (PDT)
Message-ID: <4bf490cb-228d-4f01-a956-cacbafa94e2a@linaro.org>
Date: Tue, 8 Oct 2024 14:37:48 +0300
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <313667a6-afcd-44cb-a6f6-0d550e8f68a0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof.

On 10/8/24 14:15, Krzysztof Kozlowski wrote:
> On 08/10/2024 12:02, Vladimir Zapolskiy wrote:
>> Hi Bjorn,
>>
>> On 10/6/24 05:36, Bjorn Andersson wrote:
>>> On Mon, Sep 23, 2024 at 10:28:22AM GMT, Vladimir Zapolskiy wrote:
>>>> The expected type of all CAMSS interrupts is edge rising, fix it in
>>>> the documented example from CAMSS device tree bindings for sc8280xp.
>>>>
>>>
>>> Who/what expects them to be RISING?
>>
>> I've checked CAMSS device tree bindings in a number of downstream kernels,
>> all of them describe interrupt types as edge rising.
>>
>> $ grep -Hn IRQF_TRIGGER drivers/media/platform/qcom/camss/*
>> drivers/media/platform/qcom/camss/camss-csid.c:619:			       IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN,
>> drivers/media/platform/qcom/camss/camss-csiphy.c:605:			       IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN,
>> drivers/media/platform/qcom/camss/camss-ispif.c:1164:			       IRQF_TRIGGER_RISING, ispif->irq_name, ispif);
>> drivers/media/platform/qcom/camss/camss-ispif.c:1168:			       IRQF_TRIGGER_RISING, ispif->irq_name, ispif);
>> drivers/media/platform/qcom/camss/camss-vfe.c:1327:			       IRQF_TRIGGER_RISING, vfe->irq_name, vfe);
> 
> Downstream has a lot of bad code, so I am not sure how good argument
> this is.
> 
> I acked the patch because I assumed you *checked in hardware*.
> 
>>
>>   From runtime point of view it's more important to get re-probed camss
>> driver, see an absolutely similar and previously discussed case (in the
>> cover letter):
>>
>> https://lore.kernel.org/lkml/20220530080842.37024-4-manivannan.sadhasivam@linaro.org/
>>
>> Now in runtime I get this error, it's easy to check by unbinding/binding any
>> camss device:
>>
>> irq: type mismatch, failed to map hwirq-509 for interrupt-controller@17a00000!
>>
>> Basically camss devices can not be bound on the second time on the
>> number of platforms touched by this changeset.
> 
> This is solveable different way and I do not understand this rationale.
> The driver should not request trigger type but use what DTS is
> providing, unless of course only one valid trigger is possible.

Right at the moment the driver uses rising edge type of interrupts, and
it works properly.

> But so
> far you did not provide any arguments for this. Downstream crappy code?

Downstream code works, that's the argument to support the change.

> Nope. Existing driver? Same.

The existing driver works, that's the argument to support the change.

> Was anything here actually checked with datasheets/hardware?

The initially open question is unanswered, why sc8280xp CAMSS does
specify interrupts as level high type, was it actually checked with
datasheets/hardware, as you say it? It has never been tested by anyone
and anywhere, downstream or upstream wise, only rising edge interrupts
were tested, and they do work.

I don't have access to datasheets or hardware of sc8280xp powered board,
someone may either verify, if CAMSS level high type interrupts are
supported/working at all or not (obviously its current presence in dts is
insufficient), or check the SoC datasheet.

To sum up, the intention of this change:
1) fix the unpleasant runtime issue with no regressions (it's been tested),
2) align CAMSS device description in firmware with known to work well
IP hardware configuration.

--
Best wishes,
Vladimir

