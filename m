Return-Path: <linux-media+bounces-14155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0AF917AFE
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 10:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 502451C23115
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 08:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2089168493;
	Wed, 26 Jun 2024 08:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dud3sBF2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E36F166305
	for <linux-media@vger.kernel.org>; Wed, 26 Jun 2024 08:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719390608; cv=none; b=CbxOBeWvoIS3BkM69jGgLMDv0n85OmXht62JhighWX4o8yr16hwccGtXlNsoSXRvW+I1uTLgIWbSvV0PPK5MlBx16M4xmdwNYQuyBhzbIhIRkq3efOPU1KCwH9+oVxvZvKAiSXc7YNsJlOG2S7klOWcdsJTDnGio4wUSSwnxNos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719390608; c=relaxed/simple;
	bh=QeqkQtniBpxvd+UitRjWWYVFy5iXjPy7xv5fji8+3L8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DwdgWmjsXBfiImJSrN40/5McV2jmT16M9yOGMOLeXQyhwB6d9SYNOqJaCOdMovdY579XcukeiIbnye7vLyrNKTJQ2PL+dDFdkzjWcZq3sQ5OlIXN+x1vLDVk67jYG4sX99Q4+uJMZX6ylILZdGyl5buB1orsq8Zmkro+Tp1f/0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dud3sBF2; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52cdcd26d61so4589352e87.2
        for <linux-media@vger.kernel.org>; Wed, 26 Jun 2024 01:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719390603; x=1719995403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yyQdICgaO84yFawHrHyVyr2QToU/+XJGR839rOrXaR0=;
        b=dud3sBF2tVPRThcYciFuClucski/fMejwvP58nN7PA2C4550Bo1BWAmdARVLHwVjwE
         iG/VckS1SBkJmwhbUhUdrTvAXJa+qUkiUvwTUbwY7JDSg6nlUbhVGjV0lzJQfSBsWl7t
         AJbsBQHNfkMxtODpUfkOdbbmC5LdHOE2YbM/1zX9IQm+GjXcAzEnR1Z7KPWP516s9y35
         SWqG/skTT6LKFroJwByr0mw4jxtc5bvFQL2GWGqMKF6U4LBQLf7fwKM9+PjfzENn0O9+
         m1wQXj+ZuAtRrWRqMYubFa0aj+njwlJO76nffH00lHmh2ntyx6AAOpjQdprKcvep0tCW
         AKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719390603; x=1719995403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yyQdICgaO84yFawHrHyVyr2QToU/+XJGR839rOrXaR0=;
        b=YWtKeZYWlCVo85k8d/88K6P1bAtl+h9Uz2+Zcq9A27F/b9ErrBf4sYuhNrXWoNbF70
         8ES6xNnCOFqrrD5fBeVQKSDnqwKZN/TwZSMMr4H37Mund4cSREfNLrCzLf418HoEe9ZK
         WX/a3eeFuRojV78KrFaj/ejVK2G8tW5Y3ULTAD81/mfMM3FqaojAz5buphJbyXsR7Ph9
         mEi9EW300mdedWRQoGRtCmuO8k59SKGr31z+FUny27coSjYYHq1pOQ42p++U4+NRob0I
         Bap3tUbajo1HrYclChY8j8Uv30Yiuz3vI2avN1KfUmaP0A3etfWwwbxh421rEpg/Slnq
         5UQg==
X-Forwarded-Encrypted: i=1; AJvYcCWTRZNUm/cjn0nGhqBfLKbtMHMp5fJF/XTUy7g5Dj5yt7oAHrTgBHoMaN6p/grVdxglL8hhpFxO2AhtzQ/5+sjBYpbi5sWxMpul2n8=
X-Gm-Message-State: AOJu0Yx9LX+zfX4xUtTsxtQEhBYm9OXCjmqiwaTrFVcEEIRNfncGmOJY
	nwY4yJPAoQYSl9HuuRcnmsnCBGM4MQChZvxGCzndjr5geWJkez3rYa3nt9vvcgU=
X-Google-Smtp-Source: AGHT+IEca5cJU5ZW212x9C2okoEwkWZvRgPivrrUuJX0Y9+4JhwZuZye4d1Yr/SDCtFZrF/eM34AgA==
X-Received: by 2002:a05:6512:607:b0:52c:d84b:93b2 with SMTP id 2adb3069b0e04-52ce18341f9mr5698467e87.15.1719390603394;
        Wed, 26 Jun 2024 01:30:03 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c84245f0sm16687705e9.33.2024.06.26.01.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 01:30:03 -0700 (PDT)
Message-ID: <79811fff-4fdf-4121-9cea-6ed7e1329dad@baylibre.com>
Date: Wed, 26 Jun 2024 10:30:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/16] dt-bindings: mfd: mediatek: Add codec property
 for MT6357 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
 <20240226-audio-i350-v6-3-f754ec1a7634@baylibre.com>
 <cd190d35-1658-43d8-9606-5e73257bbf3a@linaro.org>
 <95bab90f-b196-4e79-bb88-7fd534cca721@baylibre.com>
 <5c9ab5bf-95f2-4195-8797-335010223aac@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <5c9ab5bf-95f2-4195-8797-335010223aac@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/06/2024 15:44, Krzysztof Kozlowski wrote:
> On 25/06/2024 11:23, Alexandre Mergnat wrote:
>>
>>
>> On 21/06/2024 17:00, Krzysztof Kozlowski wrote:
>>> On 19/06/2024 16:46, Alexandre Mergnat wrote:
>>>> Add the audio codec sub-device. This sub-device is used to set the
>>>> optional voltage values according to the hardware.
>>>> The properties are:
>>>>     - Setup of microphone bias voltage.
>>>>     - Setup of the speaker pin pull-down.
>>>>
>>>> Also, add the audio power supply property which is dedicated for
>>>> the audio codec sub-device.
>>>>
>>>> Signed-off-by: Alexandre Mergnat<amergnat@baylibre.com>
>>>> ---
>>>>    .../devicetree/bindings/mfd/mediatek,mt6357.yaml   | 33 ++++++++++++++++++++++
>>>>    1 file changed, 33 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
>>>> index 37423c2e0fdf..d95307393e75 100644
>>>> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
>>>> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
>>>> @@ -37,6 +37,32 @@ properties:
>>>>      "#interrupt-cells":
>>>>        const: 2
>>>>    
>>>> +  vaud28-supply:
>>>> +    description: 2.8 volt supply phandle for the audio codec
>>>> +
>>>> +  audio-codec:
>>>> +    type: object
>>> Still not much improved. You do not have any resources there, so these
>>> should go to the parent node.
>>
>> Hi Krzysztof,
>>
>> vaud28-supply seems to be a mistake that I forward port.
>> In the V4, AFAII, your feedback [1] suggested me to move the vaud28-supply from the "audio-codec"
>> sub-node to the parent node, which for me is the "pmic" (mfd), because the property is considered as
>> power-supply.
>>
>>       pwrap {
>>           pmic {
>>               ...
>>               audio-codec {
>>                   ...
>>
>> Hardware side, vaud28-supply is the output of PMIC-regulator subsystem, and AVDD28 is the input of
>> PMIC-audio-codec subsystem. Then:
>> - The property name is wrong and must be change to AVDD28, which is a consumer (power input), not a
>> power-supply. => description: 2.8 volt power input for microphones (AU_VIN0, AU_VIN1, AU_VIN2)
>> - IMHO, move this property to the next parent (pwrap) isn't consistent. It should be moved back to
>> Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml (Done in the V4) into audio-codec
>> substystem, beside mediatek,micbias0-microvolt
> 
> I don't understand why do we talk again about supply. My comment was not
> under the supply.

Because your word are:
"
And now you should see how odd it looks. Supplies are part of entire
chip, not subblock, even if they supply dedicated domain within that chip.

That's why I asked to put it in the parent node.
"

My bad, I forgot to link you the old message in my previous answer [1]

[1] https://lore.kernel.org/all/6d21da37-8be7-467c-8878-d57af0b0201b@kernel.org/#t

-- 
Regards,
Alexandre

