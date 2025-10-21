Return-Path: <linux-media+bounces-45120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6EFBF5C1E
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 12:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3260A3A5828
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 10:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C292EC541;
	Tue, 21 Oct 2025 10:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iWBddjNw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF2C1F1538
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 10:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761042217; cv=none; b=evnPCU9mF20m2rtzktJ7TCj6mfDaL6vrPg5FYxpnShBfGZNizrL6jfMkUDVqIeEXd1mL87ZZ2fzW4awpmE6lsZyreBhP445kUVPEi4cpJegqmzMujcWAvZu1iY5qnCCwzy1pNPSX6cXb/MQDIhYvdwSJnywvnAbCDKGTK5Yq3O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761042217; c=relaxed/simple;
	bh=X6IIhRe0Q9eNfiS+uuiP44nevUMCv7gW+vko/Kql2Gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=afwas8Bbyl+rF+GtVyQilNEq4pw7hUUmLDL7/W7PoWx1a0f1KT+aSgRoEOCTmr7pM7G4a9zeoEGqHHVFAp+/KlyQNKbyiXLmGopkfhNRe+FDXV+gO3vp+faF5LBb1BHMUvyWnymbkyzxqL+ght/lOh8EfxUpfP7P1N5YBhQRv/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iWBddjNw; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37645b8c09bso8489141fa.2
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 03:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761042214; x=1761647014; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUXq1wMCFkLfNEQhg7BlbcPT5IjdyWTTFBn75zMt1J8=;
        b=iWBddjNwgL1E0AB1E2aG0/nJrHpJnYoyMNCBrqXKlLzKEE8kwFLnkopJonIICQ7Qig
         PUlbmMctH6g0gBPVbjoGv1O3aSUHKE1fApmYKMhrZCrHDcVYQZiJoIgNeoF219c+gfYT
         24pEE49ZMVZkDdF0vWqB2YHvYVt7HBQsJ5ONddHao6S4jO66p2xPDWfieilc0YOQQEew
         y+jVnmEqAvBXmMXZdw9zcdCSS5F7M7uUfcP+be9Sc0K7jICtcQjpyc8LNmA6QEcLa8vY
         ud9p8JO2iS6cRHSDnjkkrK/AN1E30KW7Ql1pvj2CzuArkoUUARG3rg6B2dpEJAA7uZw8
         LQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761042214; x=1761647014;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LUXq1wMCFkLfNEQhg7BlbcPT5IjdyWTTFBn75zMt1J8=;
        b=YNDQFovFA+B4861m/CNE9JMAAAR0+geoIldn6ACAmzPBCsvVh6v7C8UKVfVn+1r/bH
         KkhbEBLM3a0n/8uHWAAL098mrJWhBj034hN7QeFn145FL//l4Pfdl5GcCoUSVpm3P5ET
         2u0F+GAYOu0t6/pLPTp6TaEDNnUUSTdZClz11H48m+96FUYRjUYmeMr5rZU5mfDwvBL2
         KLKlAvt1FzQw32KuWLpn2K8qomecG2+gDDub5+p0mx4s1mOGPHYLsY8velXzFNkHSJNG
         SXiBpUnmbeFd9Z1XyDczkcYevE5tlc9V7XVvqpqppIgwhb5M9UrrEkCJvmFzLW2VBP0S
         oZng==
X-Forwarded-Encrypted: i=1; AJvYcCViG/3DIiz/IFCbNcZDYTD9r2orDiymTSGrXk5mgQp+q/fUHeA4l+riVT/UXtIOdI+DaOiujkDbqYkhZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqLhf6H4W7qJAUdggzFjthQ6OkvEgXF6JQaYf7HaEWmyhKoZat
	XihrWhcahO9vvlzaJaMXg6q1li8JwzUwok0U5Cw02nyjnlbgqbAOAg/V7DYoHt4SQHE=
X-Gm-Gg: ASbGncsK3sodn5z4DI1n00ItUD0Ru1UPRU+b/NCazV6NxS2LToEHfzJcjV6AJMne6Dn
	VgHRiZRxtIQpqnUwCEKldLjCM4rDoxp6pq0+pgFIfW+CDGeulEpxHFP1VMWGqJqGaYb2/u2mGaG
	30F3zzpM2MO57XZmPqg08qVtqfPVTLMvX02oVxVoMJIQM5iqJs90QfupK4YCHljgb1N1ti4leBG
	yDe3dp9TaR3+mpMck4SCdIZMs8vBi4xK+nCfxtfUJJe83FKsxKIHEsoNj2tyx9ZOyZXcYsMWe2r
	739G5wZJN0my3zM1vPqc1GZjIdGYvddSKa8Yj/eiOOKj5i38awNmbfn0SC/zhYh+UWvg2x4EsgL
	scv6Hu5VN7FYs0KC/c+aB6zqrNhVuNSW7hGZJEhKmsaqpMIKqflzIbmgHr+vJWIiTVYAbEPd0Uv
	RAScYDyVC+2Vacn4G+cai5/zvXP2/UKtMe8ea6Ykt46XlWgSt1aJDJxcocQFJsyKgQcA==
X-Google-Smtp-Source: AGHT+IEmPJoxY08aLmDM49o2ysU16rKo0CM7DE9R2OnTtCJfVmyvlQ+fs6BweAM4cs7iO7W0+JAWDg==
X-Received: by 2002:a05:6512:3181:b0:581:8db3:d5fe with SMTP id 2adb3069b0e04-591ea2eef26mr526688e87.2.1761042213800;
        Tue, 21 Oct 2025 03:23:33 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def1b261sm3492866e87.85.2025.10.21.03.23.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 03:23:33 -0700 (PDT)
Message-ID: <f3e66a7e-873b-4299-9ec9-be3aa7e100d6@linaro.org>
Date: Tue, 21 Oct 2025 13:23:31 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add Samsung S5KJN1 image
 sensor
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251016020419.2137290-1-vladimir.zapolskiy@linaro.org>
 <20251016020419.2137290-2-vladimir.zapolskiy@linaro.org>
 <aPaaLZoLMH3TfyJl@kekkonen.localdomain>
 <060938d1-9c9e-4a0b-a4ca-838b4b9cfa1d@linaro.org>
 <aPdOICr8bqP5a-EM@kekkonen.localdomain>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <aPdOICr8bqP5a-EM@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/25 12:10, Sakari Ailus wrote:
> Hi Vladimir,
> 
> On Tue, Oct 21, 2025 at 11:00:35AM +0300, Vladimir Zapolskiy wrote:
>> Hi Sakari.
>>
>> On 10/20/25 23:23, Sakari Ailus wrote:
>>> Hi Vladimir,
>>>
>>> Thanks for the set.
>>>
>>> On Thu, Oct 16, 2025 at 05:04:18AM +0300, Vladimir Zapolskiy wrote:
>>>> Add device tree bindings documentation for Samsung S5KJN1 image sensor.
>>>>
>>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>> ---
>>>>    .../bindings/media/i2c/samsung,s5kjn1.yaml    | 95 +++++++++++++++++++
>>>>    1 file changed, 95 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
>>>> new file mode 100644
>>>> index 000000000000..2220b3e528d4
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
>>>> @@ -0,0 +1,95 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/media/i2c/samsung,s5kjn1.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Samsung S5KJN1 Image Sensor
>>>> +
>>>> +description:
>>>> +  Samsung S5KJN1 (ISOCELL JN1) image sensor is a 50MP image sensor.
>>>> +  The sensor is controlled over a serial camera control bus protocol,
>>>> +  the widest supported output image frame size is 8160x6144 at 10 frames
>>>> +  per second rate, data output format is RAW10 transferred over 4-lane
>>>> +  MIPI D-PHY interface.
>>>
>>> Can the sensor work with fewer lanes? This is almost always the case. In
>>> this case you'd need data-lanes property but feel free to make 4 the
>>> default if you like.
>>
>> As usual I don't have access to the sensor datasheet, what is known to me
>> is that
>>
>> 1) there is no examples in the downstream, when MIPI CSI interface is
>> configured in any other mode but 4 lanes D-PHY RAW10,
>>
>> 2) right the same information is given in the official scarce booklet:
>>
>> https://semiconductor.samsung.com/image-sensor/mobile-image-sensor/isocell-jn1/
>>
>> The same reasoning as above is directly applicable to the second sent
>> sensor driver of Samsung S5K3M5.
>>
>> There is a known practical pattern that if it happens to be of necessity
>> any new properties can be added to device's dt bindings later on, thus
>> it should be safe to omit any presumably non-configurable hardware
>> properties from the description on an early stage.
> 
> Even if the driver supports four lanes only, it's very unlikely the sensor

Well, the second point given above is not about the driver, but it leads
to the shortest possible sensor hardware spec:

https://semiconductor.samsung.com/image-sensor/mobile-image-sensor/isocell-jn1/

If you scroll right to the bottom, it says

Interface: 4 lanes (2.15 Gbps per lane)

It does not completely or clearly exclude 1 or 2 lane configuration,
I know, but "exclusions" are not documented anyway, only something
presenting gets documented.

> is limited to this. There are two options here:
> 
> 1. make data-lanes mandatory or
> 
> 2. add data-lanes as optional with default of four, which the driver
>     supports and which is known to function.

If you ask, I'd rather prefer to implement the second option in the dt
binding documentation and driver, let me know if there are any other
asked changes to be done in a bulk.

Thank you for review!

-- 
Best wishes,
Vladimir

