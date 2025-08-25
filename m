Return-Path: <linux-media+bounces-41009-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DC1B33EAA
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 14:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 833781721F5
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 12:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F46A24A066;
	Mon, 25 Aug 2025 12:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z6pfJwqb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C08266568
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 12:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756123384; cv=none; b=d9CTsbEBd5ib70bkxP4jEDqIvKdqh4lWMk7a90NVwySMdlfwiOKNOtYBQHa52zlwg91qA8YTBx7xXRx5VXLy/0UyqaznRUKLPkMaLbxVotLjh/USDL6joSwitNZb4/G21LRgEWB9xQgiAvjMYkSKXMP+bQ/kugq+Pf2kb8+XN3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756123384; c=relaxed/simple;
	bh=ZlhfK0/2P69P87bEUDsxJDEFjTWF1f/6DouDWwcAwS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RwqWEY9Jh3RpOgUe8iPXToz/MXkBlto+6I5oYezLgDpPObHN5k69VDmIiiethTKTF8g4kF38blS4f1JTkpeo007Y0oKFDCIF/WbC9Ov3F3Mnef2pjEpqfFboHXitIlBsJQ3eoUMv9l5qtA5UaS2Z2dmevlS/9ZChtsI7RR6kNuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z6pfJwqb; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afe6a3ba50aso6282766b.1
        for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 05:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756123381; x=1756728181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Mf2mRUvQjEaytK6URbb7jtr9FhugXWYARb3EBCriAq8=;
        b=Z6pfJwqbfiHq3GLoac4kCBMvI1CmfwXQpFXAOAq/wj8Fi6MSNDzXjxV4hBXgyofizJ
         uyw2J5IRYJqcuZMv9MnQzoIz2yZ/cfFir35r9TEl/wEZFw36wibJoRSjHTNztMRNII21
         0WJMGORd9xucVbxpuOMITPB2JBWOsITWi4aDKysYtyKWY1ygkIhE15lapcuHMTZtYl6L
         o1ENHP8iQNKgt0L102odXawYa+/y9+zU+nhi35npM8G68c4X8YUA7RBwpoDFY74GLMIB
         zG4eJBC5GfWZLWLCIa1aKeidPOoBAP986swiwVx5sb75I48wwJlktfsyvGNRwxFmJ5g9
         FYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756123381; x=1756728181;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mf2mRUvQjEaytK6URbb7jtr9FhugXWYARb3EBCriAq8=;
        b=eBxuD8W1v4wPep4GnfZ6yngXRn0JKUZaDPfuB2fSAusd7nm/P/SXEV4IWsg8F38t0B
         YJtG1p1RGRAMUSVeZN/SfJbSxr8EAQEaXbRl9cuBEtpXPjeHleNYIUI6gtcg7y/OF2Wz
         pohHuWHLgKARoSly0/0kRWAMuXZsjU5Qivkii1e8k/VMV95OL1vtj/0eaqTuSH3qmk8K
         JWNLaMUmdlfvFLFNaOOZnDCKQ28cUXBx7wFe8z3K80sxDGc8kNZsSdhZKAFmpDHk/SQB
         fA7c1owyW68GMenN1hK8LyGhT5W0nNHi9Ua1JlwqvvRwyW7GCG6BgXewjkl9aRHAb64Y
         pEIg==
X-Forwarded-Encrypted: i=1; AJvYcCV8twIK9H/2VSuiuOqWeC1YFjgMC3HY83EtkWgm6bQQ9ftH9sd7r8ZCj+ana2L/b9aelFvkCsbIYjxENw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV+N1KaRHcbqUtmkRuMIqjdCOajQ3tETFQ8+tcYPYod7eIkoM1
	UWpRkgxJgx/h7PgmPb1yPxoiplLHkp1hcxQov8ZMWXNKNHHL+cgffTrx+bkRvsJfdJY=
X-Gm-Gg: ASbGnctzxkbWTFKOOlsJZZYXzvqDFVbeSqMjLUYN8eUNtovj7d7AzDKDbplJ7Laru2n
	SRVGDxTposDb9gXsP4FOEqkAMtybdJQG8pUQoqytm7v93t+lcGUkxxFfFLWk334LLReUVqaDo4q
	Rwq4Dw72xOBdXRBMUns94Ln/rBk9UvIXrihv01xdNy6hGdNa7xFKs0ReKLOiZhbTxJHMS5uZsP2
	r65G/wBqi3uNtac9wjsb16tMewaYKvJxIoaOnFQLPRXMJNJC2ERb29yS6A5QPNht2ZM3UDW4BL3
	LukelF8Fr8Cpy/t03TOKfVLpY3YP0LkeK+g8Z04gVS88SSn2GifD43/oK0alYJE9gajCOMuGDf8
	S8ZrP7rqxoV7ySLMz/+wcCuzsh9g7ETJYBW15PMBQ
X-Google-Smtp-Source: AGHT+IEcBuCR6/r62UtCPJs3co2BNMFrVufjLm66B/o1rQQRjxpq5swzg4+kfnX48ZQUbQibdBprzw==
X-Received: by 2002:a17:906:64d:b0:afe:7575:df0e with SMTP id a640c23a62f3a-afe7575e61fmr190506266b.11.1756123381153;
        Mon, 25 Aug 2025 05:03:01 -0700 (PDT)
Received: from [10.41.1.12] ([213.244.170.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe48fc3d82sm538000466b.44.2025.08.25.05.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 05:03:00 -0700 (PDT)
Message-ID: <a3325bf1-2a3f-416a-ba2a-4fb1e9f85e61@linaro.org>
Date: Mon, 25 Aug 2025 14:02:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: qcom,sm8550-iris: Do not reference
 legacy venus properties
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250823155349.22344-2-krzysztof.kozlowski@linaro.org>
 <20250825113734.iekrgyvctamhb5y7@hu-mojha-hyd.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250825113734.iekrgyvctamhb5y7@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/08/2025 13:37, Mukesh Ojha wrote:
> On Sat, Aug 23, 2025 at 05:53:50PM +0200, Krzysztof Kozlowski wrote:
>> The Qualcomm SoC Iris video codec is an evolution of previous Venus and
>> it comes with its own Iris Linux drivers.  These new drivers were
>> accepted under condition they actually improve state of afairs, instead
>> of duplicating old, legacy solutions.
>>
>> Unfortunately binding still references common parts of Venus without
>> actual need and benefit.  For example Iris does not use fake
>> "video-firmware" device node (fake because there is no actual device
>> underlying it and it was added only to work around some Linux issues
>> with IOMMU mappings).
>>
>> Stop referencing venus-common schema in the new Qualcomm Iris bindings
>> and move all necessary properties, except unused "video-firmware" (no
>> driver usage, no DTS).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../devicetree/bindings/media/qcom,sm8550-iris.yaml | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> index c79bf2101812..320227f437a1 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> @@ -26,6 +26,9 @@ properties:
>>            - qcom,sm8550-iris
>>            - qcom,sm8650-iris
>>  
>> +  reg:
>> +    maxItems: 1
>> +
>>    power-domains:
>>      maxItems: 4
>>  
>> @@ -45,6 +48,12 @@ properties:
>>        - const: core
>>        - const: vcodec0_core
>>  
>> +  firmware-name:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>>    interconnects:
>>      maxItems: 2
>>  
>> @@ -69,6 +78,9 @@ properties:
>>  
>>    dma-coherent: true
>>  
>> +  memory-region:
>> +    maxItems: 1
>> +
>>    operating-points-v2: true
>>  
>>    opp-table:
>> @@ -85,7 +97,6 @@ required:
>>    - dma-coherent
>>  
>>  allOf:
>> -  - $ref: qcom,venus-common.yaml#
>>    - if:
> 
> Saw your reply on 
> https://lore.kernel.org/lkml/59951c47-1015-4598-a885-25f8f1a27c64@kernel.org/
> 
> Just trying to understand ABI here, how all of a sudden we remove a binding
> for a hardware just because it did not get noticed until yet that as it is
> not a real device and we always say device tree binding should not depend on
> drivers but the device but we are saying Iris does not use fake "video-firmware"
> device node for removal. I am a bit confused.

About what? What is unclear in standard DT ABI rules?

> 
> Whether removing will not break any ABI as initial binding enables the IRIS
> related code to use video-firmware, now we are removing it.
> I believe, removing binding always break ABI ? or is it depend on driver
> code not using it ?

There is no single user of this, out of tree (I briefly checked) and
in-tree, so there is no ABI impact. I am changing the documentation of
the ABI, but there is no actual ABI break because impact is 0.

I am really sorry but it seems you ask about basics of DT, so please
first get into docs and other existing discussions.

Best regards,
Krzysztof

