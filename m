Return-Path: <linux-media+bounces-6060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0354886A8F3
	for <lists+linux-media@lfdr.de>; Wed, 28 Feb 2024 08:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3849DB260AE
	for <lists+linux-media@lfdr.de>; Wed, 28 Feb 2024 07:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ABE1250EC;
	Wed, 28 Feb 2024 07:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="km/Hm0N5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F99A24A06
	for <linux-media@vger.kernel.org>; Wed, 28 Feb 2024 07:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709105292; cv=none; b=Aa4ovjFKR9+2oAMGl08FzJPAXcYhlXTx12zRpSeXfsxoLa8X7rd3j1vGdPxY/Y+1TQourOdd6/9IMu7LuZg9EgvPq85V3uXxHUugcVbpblI1W6FUzdvtYYnk7M8eu+u+ZA9wLwMO6XR+3MvVA0iIMQjjBol6jm07VxjvkivFY3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709105292; c=relaxed/simple;
	bh=7ey5g7zO7vsPThLxFqRRla5M4J4jK/rW388FMFA42pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oH4WiDp3/PGHZkXw4PG1g2VpuFvHWBdqDO1oMU+YD+hwqkLy9zIwEqjHiB4rx55Le8srbFNolgTuPGc8ERzYU9SHq2Neuudm8sCdU/FSYABbND0o8fJN6kT5e2Rzd+W+2i5O0uQa8AOcFLFhRnyNuZyYDoJDaZaJTRuEYqHywPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=km/Hm0N5; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-564fd9eea75so6517652a12.3
        for <linux-media@vger.kernel.org>; Tue, 27 Feb 2024 23:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709105288; x=1709710088; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WFLcJJee259JIrk4DVS+FE6qZgBM9LZf/wuGod93q6E=;
        b=km/Hm0N5ptvZotk8WCVsYp7DnkDJDYQaf04l+pRGmCfR//Q+3NLxiLdP/Z+28oquGo
         xn6DVBgKaH2FDnFjVDEjT50VEWaNCnvOTX/ab3cKjqY30nYBRHI1uLrkUYveIrEZ/mBb
         S1uL1EjR2kvAadxqzLRAIc+T4QYQXwW59SR04KflXj1ssKwJVzvWC3T1sehZ0qMdzkZP
         om46hO8nBj+9R3A3/fq1+7usrs48ekRfCmT0Flz8Im1WK7h5D3ODGhzLDgOEwaNxk5g4
         9oGCtHTp4+H4j4Al3MFIfynLNBm2TeflKOhUNkbZ5dex3lEfcQ6H6phRo1ra2KVsk9yp
         iPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709105288; x=1709710088;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WFLcJJee259JIrk4DVS+FE6qZgBM9LZf/wuGod93q6E=;
        b=OhaJpIZIXLZDrCRmu2y+T7nrHCiXXYC2mNUVS4QM4UrD1BXe2sv4OIwACObNIhspRe
         km4uk9Byaba1ZNPkeDjUPWuAmcvPAwdjqgh1zQf9VQWlOcY4TCmYhwYkfu27c4AbhHEq
         r5WmKe2Dv7KQLGmV/cSthS4Cm5BaHKfurw2Rr+XFpkYmRwjsBeZgqeYmlXLOrnYay30z
         /JkcNQLlEN5Y0cOie7rksslsYzU0kbGJtKv63puQ8Ca1SPt6Eg3gyOHZaJfi9Ug0Eb0n
         yjals9pw9Z+//eeMyYSMECv5Jq/8CEfbIVGNlUYvLmEpCbzrktn4d5JsqgvF9wR2duKp
         8YtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPY5mkk4/rBAsbJUjfg9lLWh8Fn0cxK35OXhzevyAQ+Ysq0t/k9RGFZ+Z1hdRdJZ2CmOX7739GeHEBvAjdjEg9iuzjO2Y4uRczM7Q=
X-Gm-Message-State: AOJu0Yyp8UsH9P1KFDac8QKQJ/5RSLcE1gZJkCX9J1Wbld0Npw3xifA/
	nME/e23wOrTkwc798mziX7bvQyUXBgqkE7TjMVN8km8yMnZnN1/BZzqFv2Xrar0=
X-Google-Smtp-Source: AGHT+IH2GW07nyyPZlJBIhQlHwDOvgu3sHI8ZoZanWd7zoQ1boLFcvCer/d4+r5wraTosaLmy2C5rQ==
X-Received: by 2002:a05:6402:1606:b0:565:ffa5:becd with SMTP id f6-20020a056402160600b00565ffa5becdmr5196923edv.37.1709105288573;
        Tue, 27 Feb 2024 23:28:08 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id p15-20020aa7cc8f000000b005667629f6e1sm133626edt.39.2024.02.27.23.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 23:28:08 -0800 (PST)
Message-ID: <bd4bf6ae-350e-4ee6-a924-7dd31b2c6034@linaro.org>
Date: Wed, 28 Feb 2024 08:28:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/18] ASoC: dt-bindings: mediatek,mt8365-afe: Add audio
 afe document
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-1-4fa1cea1667f@baylibre.com>
 <ce5f71a9-1b5f-4724-89db-dae2f64e8008@linaro.org>
 <eeb3329b-0558-4237-8343-4e11f65a6a35@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <eeb3329b-0558-4237-8343-4e11f65a6a35@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/02/2024 16:18, Alexandre Mergnat wrote:
>>
>>> +    type: boolean
>>> +
>>> +  mediatek,dmic-iir-on:
>>> +    description:
>>> +      Boolean which specifies whether the DMIC IIR is enabled.
>>> +      If this property is not present the IIR is disabled.
>>
>> "is enabled" or "enable it"?
>>
>> You described the desired Linux feature or behavior, not the actual
>> hardware. The bindings are about the latter, so instead you need to
>> rephrase the property and its description to match actual hardware
>> capabilities/features/configuration etc.
> 
> I will rephrase:
> 
> True to enable the Infinite Impulse Response (IIR) filter
> on the digital microphone inputs.

I still don't know why this is DT-specific. You still tell driver what
to do...

> 
>>
>>> +    type: boolean
>>> +
>>> +  mediatek,dmic-irr-mode:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description:
>>> +      Selects stop band of IIR DC-removal filter.
>>> +      0 = Software programmable custom coeff loaded by the driver.
>>
>> Bindings are for hardware, not drivers. Why is this a property of board DTS?
> 
> Actually this is a hardware feature. Mode 1 t 5 are predefined filters. 
> Mode 0, the HW will read some "coef filter registers" to setup the 
> custom filter. the "coef filter regs" are written by the driver. 
> Currently the coef values are hardcoded in the driver.

You don't get the point. Just because you choose some mode it does not
mean is hardware feature for DT. Sampling frequency done by hardware is
also "hardware feature", but do you put it to DT? No.

Explain why this is board-specific, not runtime configuration.

> 
>>
>>> +      1 = 5Hz if 48KHz mode.
>>> +      2 = 10Hz if 48KHz mode.
>>> +      3 = 25Hz if 48KHz mode.
>>> +      4 = 50Hz if 48KHz mode.
>>> +      5 = 65Hz if 48KHz mode.
>>
>> Use proper unit suffixes - hz.
>>
>>
>>> +    enum:
>>> +      - 0
>>> +      - 1
>>> +      - 2
>>> +      - 3
>>> +      - 4
>>> +      - 5
>>> +
>>> +  mediatek,dmic-two-wire-mode:
>>> +    description:
>>> +      Boolean which turns on digital microphone for two wire mode.
>>> +      If this property is not present the two wire mode is disabled.
>>
>> This looks like hardware property, but the naming looks like SW. Again
>> you instruct what driver should do. Standard disclaimer:
>>
>> You described the desired Linux feature or behavior, not the actual
>> hardware. The bindings are about the latter, so instead you need to
>> rephrase the property and its description to match actual hardware
>> capabilities/features/configuration etc.
> 
> Actually this is a hardware feature. This is ALL I have to describe the 
> HW behavior from the datasheet:
> "
> bit name: ul_dmic_two_wire_ctl
> Turns on digital microphone for two wire mode.
> 0: Turn off
> 1: Turn on

That's rather suggestion it is not a description of hardware but you
want driver to do something...

> "
> 
> On the board schematic, SoC and DMIC and linked by 3 pins:
> - clk
> - data0
> - data1
> 
> IMHO, "two-wire-mode" means the HW use 2 pins for data, and the SoC must 
> be aware of that by reading the register value written by the driver, 
> using the value found in the DTS.

So this depends on type of connection of DMIC? Then rephrase description
property like this.

> 
> I don't get why you think it wouldn't be hardware behavior.

Because telling what to write to the registers which is typical sign of
people stuffing to DT whatever they need to configure the hardware.

> 
> Rephrase description:
> "True to enable the two wire mode of the digital microphone"
> Is it better ?

No, because again you describe some sort of mode. If you insist on such
description, then my answer is: it's runtime, so not suitable for DT.
Instead describe what is the hardware problem/configuration, e.g. "DMIC
is connected with only CLK and DATA0, without third pin" etc.

> 
> About the property name, "mediatek,dmic-two-wire-ctl" sound better for you ?

To sound more like a register less like physical characteristic of the
board? No. The name can stay, I don't have better ideas.


Best regards,
Krzysztof


