Return-Path: <linux-media+bounces-5500-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AE585BD24
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 14:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EC3F288846
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 13:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAFE96A320;
	Tue, 20 Feb 2024 13:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kqYcX0wX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A166A00F
	for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 13:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708435663; cv=none; b=trcnJr0vMtAjHfJutbAjaXHO08oPWiBQhJM/tt52cAuYjw4jrvZnYY9Z+Pn081fDUId4RFuwhWARKUH6jwrzoMEvxRIm1vbO+ME3EUs5w4JcsJFSVFb+1vAgTpZT8zNxr17IQYJfAH/ca6qNmM2iGfzV1r1G8y9GZEon7cNeC7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708435663; c=relaxed/simple;
	bh=GqZsr72GuQGHO/PRwmvYnyAfD6tFEmmZjEEL+qo1oRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VwV0O67NW/3/qtJVnRjnEgu4iLG97y0zSwNzFG7106AW11OfSRbXN778zIabFXj+OdIDwcfq9aPYx9yICLthMXq2HkcprPy7Wvt3GMyB9nIEqwKWnoHAPURXCSbWC8j1fgWFOl4/zUg0kqaIkNU/lb0QykH383ad9eeTzkOnmns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kqYcX0wX; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-512ab55fde6so3626811e87.2
        for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 05:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708435660; x=1709040460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X6T/7d20C+4Zv6X6LRQvf2jjVf4/H04QqTDUqq4SYnY=;
        b=kqYcX0wXmyXbPT202MKtPIBJn8TIiOSLHow5fa6VJfVZLEiXVG/yUqAl8mhf3P6DbF
         LR/QTn0Kgh9OovLIg29JF4AK1nliiz+Xbl9/L76+eXXBtjGgefAQWE5joI3YnqZt+gMI
         +zK0NIljq5jSPVHvqlYw3zBEYsX79DSxkgo+IAuBRSv8vEJBozuts5Pci6NZow3GDCJp
         qzhitMk9nykMVgFNZm3Yc0vaQZBtDDm5AkmB30sZgs7hjTdAOwr5jgQarXy8A5DgdErB
         4wdbIugqgfErCcybwfLGj/h0D7D4Uj7VoCE406VSv9KN1V5CtYw9I/oDvrLg/RgHYZSi
         eNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708435660; x=1709040460;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6T/7d20C+4Zv6X6LRQvf2jjVf4/H04QqTDUqq4SYnY=;
        b=YYZ+hx86X6k0U3CCMDDfI0pFhQTCvUYHFO9G88GiCya4FJ9sGXS6st00vNB6foC7Y1
         VRhL1fx7mNY+vv5+Qv3rO1fzjSP2DtAAYGzARpJ4ZqnJflPDBlpt9F+t8iifhoQ+Grm5
         0+n85d0D6RWfeG51twPzNla7Dgc/PKdLsVpYUzjJevMOkP4s1jSQhOiFvD3A/QviRuMP
         Ej7Z6aeTq7pNq1lsgQcAiAXCHNyreKZY+h9CSCPSlCB3u//xmitp86j7/cf4Qf09inV3
         ujliODJpJro5YSue9s5G0bUQQ4N83aW1pI/rjP/wnMGv06rX3b2vodNkNqk5+68UoBjm
         JSLA==
X-Forwarded-Encrypted: i=1; AJvYcCViIxDl3x98sfyfWYcqzvwdHVR6Andjd8bpcRwa3r9Htc/Y8JyKnOU3E55Rj8HV0t9FSOxf968Q4uF1dr3O7okwxTqHfwSrw5kp6qc=
X-Gm-Message-State: AOJu0YxHy0DbLU6K7Rm9j5RhQBliUOwSEGjWjjCzuyM4z+PPgdbOMIUF
	XlafKkkmC2QFGwgADOs/cTE4ZhVjYPMNYDNnZZHmVKbcg109dw8mRI/m5/hVAyGu6XyAGJClqUB
	4
X-Google-Smtp-Source: AGHT+IF5Ax6fJ3YfoRw3NVbOKhR0+D2G7hYa26aiFmygISgYGOgRXWU+yhVh/hWg2Gv0PPdd3OjxJw==
X-Received: by 2002:a19:8c03:0:b0:512:a7f8:b75f with SMTP id o3-20020a198c03000000b00512a7f8b75fmr5452740lfd.48.1708435659641;
        Tue, 20 Feb 2024 05:27:39 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id h2-20020a1709062dc200b00a3cf8cb80c1sm3962205eji.156.2024.02.20.05.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 05:27:39 -0800 (PST)
Message-ID: <4ab95e87-c912-469b-b8d4-be0cf0e4710b@linaro.org>
Date: Tue, 20 Feb 2024 14:27:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC WIP PATCH] venus: add qcom,no-low-power property
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: DT <devicetree@vger.kernel.org>, linux-media
 <linux-media@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phh@phh.me>
References: <0843621b-386b-4173-9e3c-9538cdb4641d@freebox.fr>
 <f6e68756-72a1-4c32-968d-3d6adaa153c9@linaro.org>
 <CAA8EJpq=G21h87W69_4U-BZ=Sa5VEs15Y-zE-G5x9VxVx4qjsA@mail.gmail.com>
 <81dc6452-4039-4eb4-92ba-df248215fca2@linaro.org>
 <b8325dbf-67c5-4898-bc23-ff093ae6e14a@freebox.fr>
 <87db77f7-fda4-4cf7-adfd-8545c40c3365@linaro.org>
 <10fe67af-0572-4faa-91c6-fce9c8f9dc92@linaro.org>
 <6342e92d-eed0-45c2-8f04-3779aa2e521d@freebox.fr>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <6342e92d-eed0-45c2-8f04-3779aa2e521d@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/02/2024 13:34, Marc Gonzalez wrote:
> On 20/02/2024 12:37, Krzysztof Kozlowski wrote:
> 
>> On 20/02/2024 12:21, Bryan O'Donoghue wrote:
>>
>>> On 20/02/2024 10:56 a.m., Marc Gonzalez wrote:
>>>
>>>> On 19/02/2024 20:24, Bryan O'Donoghue wrote:
>>>>
>>>>> On 19/02/2024 5:44 p.m., Dmitry Baryshkov wrote:
>>>>>
>>>>>> On Mon, 19 Feb 2024 at 19:29, Konrad Dybcio wrote:
>>>>>>>
>>>>>>> On 19.02.2024 18:18, Marc Gonzalez wrote:
>>>>>>>
>>>>>>>> On our msm8998-based device, calling venus_sys_set_power_control()
>>>>>>>> breaks playback. Since the vendor kernel never calls it, we assume
>>>>>>>> it should not be called for this device/FW combo.
>>>>>>>
>>>>>>> FWIW, this is also broken on other SoCs.. 8280/8350 and 6115
>>>>>>> to name a couple.
>>>>>>
>>>>>> Then let's just disable it until it gets unbroken?
>>>>>
>>>>> Its functional on most of our upstream stuff though, why switch if off
>>>>> unless necessary ?
>>>>>
>>>>> Maybe it should be an opt-in instead of an opt-out, TBH my own feeling
>>>>> is its better to minimize the amount of work and opt as per the proposed
>>>>> patch.
>>>>>
>>>>> Perhaps the qcom vidc team can give insights on 8280xp and 8350 when we
>>>>> come to tackling new HFI6XX and later SoCs ...
>>>>
>>>> I was wondering if the chosen property name might cause issues later...
>>>>
>>>> Thinking "qcom,no-low-power" might be a bit too general?
>>>> Perhaps would need to mention venus somewhere in the name,
>>>> to limit this to the video decoder?
>>>
>>> Yep, the word venus should probably appear in the property name.
>>
>> This is RFC, so I am ignoring it, but just in case before you send v2
>> with the same:
>>
>> You described the desired Linux feature or behavior, not the actual
>> hardware. The bindings are about the latter, so instead you need to
>> rephrase the property and its description to match actual hardware
>> capabilities/features/configuration etc.
> 
> I added the RFC tag explicitly because I was hoping for the DT folks
> and msm maintainers to comment on the property name ;)

And for the PATCH we would not comment? RFC means not ready and you
gather opinion before doing more work. Some maintainers ignore entirely
RFC patches.

> 
> Thanks for your comment!
> 
> Here's the proposal for v2:
> 
> qcom,venus-broken-low-power-mode
> 
> Description:
> This property is defined for devices where playback does not work
> when the video decoder is in low power mode.

Would be nice to know what's broken but if that's tricky to get, then
sounds fine.

Best regards,
Krzysztof


