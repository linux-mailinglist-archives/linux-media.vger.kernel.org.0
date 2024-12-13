Return-Path: <linux-media+bounces-23384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF3B9F0B5F
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 12:37:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A119161BFF
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 11:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866B01DFD9A;
	Fri, 13 Dec 2024 11:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t8yg3K4H"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF9C1DEFF7
	for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 11:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734089670; cv=none; b=iooltYHkjvqzmRRpwnYX3XB0vuKKjRSGavntUlGzeqg4D5Xurei0/G+zndIl4jWTMyAE5mLpu9uGpEhgLuRHdnJG2PPmUQAkj9cz95smcahUJFDeUuY/YGaWv65fJjkWwzhd7++nObPYnPeIYymHBvU0EG38FMHgHx5hiKhfr94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734089670; c=relaxed/simple;
	bh=4XfO9sgRR89Q+W9l3UVT/d7WgRINh0RFlj7iisUzSSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nX0BEaIR3b31UmPYMTMJ/9zK7DJ9GEkBHlgAX/1JggGwLScsgGabwcFroj2HXg56TXW5Qb2U9a/8ghq3kSH/AVah9yAUU23FWio9SvU1/Ryqs4EEeLZuOfrMZkChNXKE2VsbyRDOazWZO2IRR9x6mDQXQ3AqP+Eo+ehtiRW+bJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t8yg3K4H; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43618283dedso15481205e9.3
        for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 03:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734089666; x=1734694466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VoLSaqzOSgXTHhnrnBIXiVWZQerMmrmkF4OQm6gfaXQ=;
        b=t8yg3K4HuJOQUWWwhafEpqBrJaKiZKZmA5y1s36J0W4dUmZmLI6y0nzF0S3u5eBbyU
         thHcVU5L+OdrrnXZft4OTJK6APLOMrD7jaWmsFZvZZiPKuCTFXsk9h6NiezLuJej3QYj
         fTrLxnSXOFrlgQGNxRbrA3KuUWmqK9Y6lx64vnsvFfEuZ6aGYDwNZ0YJGQyfi/0dtdVS
         6fGEyGW7vBg3j/yLwMHqZjiRs2PIIU4wUQ+qjAR6irmZU/EowyNM7Ph7/KEky7hXLM2L
         ZkiKZldsU9dpj2bvjOPaPHH5jYUF5dd15Lv/1UzXWDk1w458WwHAQfhAXRL3DZaBJL+D
         v0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734089666; x=1734694466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VoLSaqzOSgXTHhnrnBIXiVWZQerMmrmkF4OQm6gfaXQ=;
        b=Scb/gxkqBzFu5uUI6t7YXoXJyccq8xTfSuhIQRXsaYc7VZEBseEaRR4GG0HF0WIQsV
         wtHF37Y0nPPxhb19mjoMYJb5kuoAu0ZJYko25rGnqvemqfYZ0ZMscTaxdFjfA5m9YMWA
         XSBZ1ody9Xrrle+9QXefP48MWsriQHPr/G0Hwuq+nnT7veWug/oYW9OOsNKfkX6BSnSu
         8Ltg7ljdyHzRB4YlDCcflq/d2fTo7Kt00XIkrVQ9+4f3bt0PvsiNRhHlKe1ksF62kzwj
         nqS64xjOyGzttXjvenfp5UmX00W1/rMmjf/0epuSKlKBq0Gb9M+P/1/1P4gE5+bX+p81
         HpYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR+fz3r1dIbb5ssC/Vpq+e99fYmQKQVlAaeVWREnVmKnmAnh9zgFMqstxInkg2BRzC5aycDEE/rxKbvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YznvbMlfPXFNN7kCM/mGyMjCYKicwxXF+YZZkJKl357NR1HXZz2
	3ANYXdd+gyOw4TLHLjudbexWw68ToPcN9QuutcWldfEzSSUuINBQczUCHygOD/RBkC1fOs5OPLn
	P
X-Gm-Gg: ASbGncvsddh8raj6Du1ObwqmpUVUB1Cm63DQGH2Dz+0SrE8Ve9CVBz7bsLG8b34al2b
	T3ix/edPPGbhmW35QNo78bri1KBTB7TV/M392gdIc8W+vgfNTQFcUfl07g2LMxZKuTLck/AeUdz
	WQo1Vza76B0pU8BLgdw2OyfKkrrc9JF9CuiRIP4xHAhI4sF/gW+QzlnPNhbnJTtGyR18XfhIo8Q
	9Rdg0baELTGX5EYGcGPg/v/7a6aIHrtHldor2a9Olu3lTXVBBpMqrMLpD7HGnCaCiqnFA==
X-Google-Smtp-Source: AGHT+IFa8ec15w1W+mCJa8qiRjb8wSbVwQDAXu4RYHaXXbcgV53ag8xsVJvsFwXS3y/+5di8npaPTQ==
X-Received: by 2002:a05:600c:384e:b0:431:12a8:7f1a with SMTP id 5b1f17b1804b1-4362aa52e39mr20921645e9.16.1734089666146;
        Fri, 13 Dec 2024 03:34:26 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824ca9absm6818336f8f.61.2024.12.13.03.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 03:34:25 -0800 (PST)
Message-ID: <d7e3076e-5b32-4ab8-afe8-f52458769f23@linaro.org>
Date: Fri, 13 Dec 2024 11:34:24 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: dt-bindings: media: camss: Restrict bus-type
 property
To: Luca Weiss <luca.weiss@fairphone.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Barnabas Czeman <barnabas.czeman@mainlining.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, David Heidelberg
 <david@ixit.cz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>
 <20241209-camss-dphy-v1-1-5f1b6f25ed92@fairphone.com>
 <nqggstwkytqxpxy3iuhkl6tup5elf45lqi3qlgyv6eaizvnfdr@2uy57umdzqfa>
 <e4bd515a-eb98-4ea1-8d73-4ba5e7c9b66e@linaro.org>
 <D6AJ9U23ANWI.1DLHNPU5A6HQ4@fairphone.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <D6AJ9U23ANWI.1DLHNPU5A6HQ4@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/12/2024 11:24, Luca Weiss wrote:
> On Fri Dec 13, 2024 at 11:50 AM CET, Vladimir Zapolskiy wrote:
>> On 12/13/24 11:34, Krzysztof Kozlowski wrote:
>>> On Mon, Dec 09, 2024 at 01:01:05PM +0100, Luca Weiss wrote:
>>>> The CSIPHY of Qualcomm SoCs support both D-PHY and C-PHY standards for
>>>> CSI-2, but not any others so restrict the bus-type property describing
>>>> this to the supported values.
>>>>
>>>> The only exception here is MSM8916 which only supports D-PHY. C-PHY was
>>>> introduced with newer SoCs.
>>>>
>>>> Do note, that currently the Linux driver only supports D-PHY.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>    .../bindings/media/qcom,msm8916-camss.yaml         |  8 ++++++
>>>>    .../bindings/media/qcom,msm8953-camss.yaml         | 15 +++++++++++
>>>>    .../bindings/media/qcom,msm8996-camss.yaml         | 20 +++++++++++++++
>>>>    .../bindings/media/qcom,sc8280xp-camss.yaml        | 20 +++++++++++++++
>>>>    .../bindings/media/qcom,sdm660-camss.yaml          | 20 +++++++++++++++
>>>>    .../bindings/media/qcom,sdm845-camss.yaml          | 20 +++++++++++++++
>>>>    .../bindings/media/qcom,sm8250-camss.yaml          | 30 ++++++++++++++++++++++
>>>>    7 files changed, 133 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
>>>> index 9cc0a968a401836814560c1af3ee84d946500b4f..3de2a3d2b5b761106975aab65ff614b2ef579ef5 100644
>>>> --- a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
>>>> @@ -94,6 +94,10 @@ properties:
>>>>                    minItems: 1
>>>>                    maxItems: 4
>>>>    
>>>> +              bus-type:
>>>> +                enum:
>>>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>>>> +
>>>>                required:
>>>>                  - data-lanes
>>>>    
>>>> @@ -113,6 +117,10 @@ properties:
>>>>                    minItems: 1
>>>>                    maxItems: 4
>>>>    
>>>> +              bus-type:
>>>> +                enum:
>>>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>>>> +
>>
>> But is it really needed to specify the single supported bus-type?
>>
>> I believe it is not, at least it's not ever done for other media devices
>> like sensors.
> 
> Through video-interfaces.yaml 'bus-type' is already allowed but not
> restricted to the values that actually make any sense on such hardware,
> so in my opinion this makes sense to have here.
This is additive not prescriptive.

New additions should include this bus-type number as we will need it 
when we add CPHY support and the subsequently move to the PHY API for 
CAMSS PHYs.

So still in favour of this amendment.

---
bod

