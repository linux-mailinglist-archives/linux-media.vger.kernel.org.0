Return-Path: <linux-media+bounces-2023-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A43380AD2E
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 20:37:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE494B20C1D
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 19:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774B44E1C5;
	Fri,  8 Dec 2023 19:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nx5QLKoS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3755A173B
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 11:37:15 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3332fc9b9b2so2271324f8f.1
        for <linux-media@vger.kernel.org>; Fri, 08 Dec 2023 11:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702064233; x=1702669033; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S/wYLxzvaIWrvwXXlhk8RVTXkUjgKIJV8Rq7ARVCREI=;
        b=nx5QLKoSF3K/0JzHTJH6Jpz2yiFO6vj+BMq30vB+1PIXUWnRmP8uB6rv7Qj3jM782v
         qKccfLVGBtV12zxsIdsjxVylEQzazD+f9GkfA0mo0/HjMOcjlOuaQ8y8SPK9h9pg784z
         Z114SjCwvDemmReF3InMhvu3XYNb5Ba+GjkfCFKbIBQXjy1Xk0wWSYdPNMOBIOR1H7ly
         2Lixur5io4aY3aVytFdECAN6/cwYO0cw3qzkpWX+KU767Dz440J4wARr1hcm0V/XOnxx
         aMQ8P877lnOiz5fvSou/2IHl0BpeZM5XbXw2m/vt0BRx1ch1LuJQbpRJVhll8E+JZ4hW
         crjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702064233; x=1702669033;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/wYLxzvaIWrvwXXlhk8RVTXkUjgKIJV8Rq7ARVCREI=;
        b=fZvfltg/8I5OtfPF+ORDZg2g+YyYRPvjH2+z6szwKC43FqQDbns0rkRn/TRRAQUCrQ
         1Wew9S5qgqf7E37zf9ULn7RrmshjJExDzW6nemISFkGqkKm3CM7gAOJt3p6lwciBVBbY
         ncnFaGY+h1bV4iO2/B9W0HgR/ViNqmzNvADzJT0vyOH4hNZgQgkQM0kXsmSa03BJNC2U
         bY/HjKesfCBoE/7PeW0U2+gc5ASEpk2Xvl1TykYW+EnAv7OIPiuBI38GPAsBqkpHIQyo
         2VjfKrIiHJT+K9ZbcS/eygfObTB1x4s6ItdVXbipFFJ2QHb95khhOU0bi4M4ScMkLuW1
         LpWA==
X-Gm-Message-State: AOJu0YxV4MNrvlApuyowEVKzC9ejrQGIywsZZb9fRkBY7QnKg73bPB3P
	VB+WE+prKIo3thigVzB9zuyLw1O+g7guXWpVg5U=
X-Google-Smtp-Source: AGHT+IHUIrQp8Rbx+yUpeu6a7wLaCy2uVwr7ShS4VFCMjALg2WZda5UaY/g5di89zubm8Lt48KyA+Q==
X-Received: by 2002:a7b:ce89:0:b0:40c:373a:a10 with SMTP id q9-20020a7bce89000000b0040c373a0a10mr134809wmj.145.1702064233357;
        Fri, 08 Dec 2023 11:37:13 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c310900b0040c3953cda5sm707897wmo.45.2023.12.08.11.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Dec 2023 11:37:12 -0800 (PST)
Message-ID: <ce8a7040-2667-4046-8542-f698bd8a9af1@linaro.org>
Date: Fri, 8 Dec 2023 20:37:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: dt-bindings: ov8856: decouple lanes and link
 frequency from driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231207142356.100453-1-krzysztof.kozlowski@linaro.org>
 <ZXNbTUg3QrCwKBpp@kekkonen.localdomain>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZXNbTUg3QrCwKBpp@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/12/2023 19:07, Sakari Ailus wrote:
> Hi Krzysztof,
> 
> Thanks for the update.
> 
> On Thu, Dec 07, 2023 at 03:23:56PM +0100, Krzysztof Kozlowski wrote:
>> The data lanes and link frequency were set to match exiting Linux driver
>> limitations, however bindings should be independent of chosen Linux
>> driver support.
>>
>> Decouple these properties from the driver to match what is actually
>> supported by the hardware.
>>
>> This also fixes DTS example:
>>
>>   ov8856.example.dtb: camera@10: port:endpoint:link-frequencies:0: [360000000] is too short
>>
>> Fixes: 066a94e28a23 ("media: dt-bindings: media: Use graph and video-interfaces schemas")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Changes in v2:
>> 1. Rework approach: decouple bindings from driver instead of fixing
>>    DTS example (Sakari)
>> ---
>>  .../devicetree/bindings/media/i2c/ov8856.yaml | 21 +++++++++++--------
>>  1 file changed, 12 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
>> index 57f5e48fd8e0..71102a71cf81 100644
>> --- a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
>> +++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
>> @@ -67,19 +67,22 @@ properties:
>>  
>>          properties:
>>            data-lanes:
>> -            description: |-
>> -              The driver only supports four-lane operation.
>> -            items:
>> -              - const: 1
>> -              - const: 2
>> -              - const: 3
>> -              - const: 4
>> +            oneOf:
>> +              - items:
>> +                  - const: 1
>> +              - items:
>> +                  - const: 1
>> +                  - const: 2
>> +              - items:
>> +                  - const: 1
>> +                  - const: 2
>> +                  - const: 3
>> +                  - const: 4
>>  
>>            link-frequencies:
>>              description: Frequencies listed are driver, not h/w limitations.
> 
> This should be dropped, too.

Ack, I forgot.

> 
>> -            maxItems: 2
>>              items:
>> -              enum: [ 360000000, 180000000 ]
>> +              enum: [ 1440000000, 720000000, 360000000, 180000000 ]
> 
> These frequencies are listed in the datasheet but they're just an
> example---the sensor hardware isn't limited to these, the resulting
> frequency on the CSI-2 bus is simply up to the external clock frequency and
> PLL configuration. I'd remove the values here altogether.

Hm, are you sure? Isn't it quite difficult to program device to any
frequency? But if that's not the case here, I can drop it.


Best regards,
Krzysztof


