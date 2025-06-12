Return-Path: <linux-media+bounces-34613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E24AAD6EFD
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 13:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2351C7A8099
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 11:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B69E23C51F;
	Thu, 12 Jun 2025 11:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WdCn39G2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78B5229B38
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 11:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749727671; cv=none; b=Uazj3ELdVFRd5a6z7OMCt3gyxWhiEkzjqNF4b3DKYsD/o8gmXlyaXh7Fejj8LDUyj38LCmFwkRM6Ah6h6txgz32y7krvLVMzfiSC9QjskKRO+Uda07B4kAa2JMONUUCvYBgYLBbPuOpDVdLQDCDO03D6hh7j3tzkU9PHHD5wdI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749727671; c=relaxed/simple;
	bh=baOh6JNrNs+y+44obXR/Ufj9U6PUWPAjBVng4c8Z9hM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A2ROOB/eCI6RnnjndpStse2f0FICUv5YSowWfSkqBhgyIG/nGzNISM7HPN6ICjLftFapTiJCrn0BfbsxYLariP9f+c1eX/UKRH/FqFiBVnLSfaBQRaQ9aByLvCel+Vm3AxQ9aeRpooyKfqIiQibV+fXIy09VHHLim6hss8fW1RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WdCn39G2; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32a73a2594fso977731fa.3
        for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 04:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749727668; x=1750332468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UMJIO+9hxF2T1hW8fxlUtSq3+LhB5vVChGg7nGiwpMk=;
        b=WdCn39G2E6CPs7UXaqW5eAx6v5HgjxmSyrVlYtyLsQdM2ITwC1kp2CUndzUoHt+FOA
         EWeix5toMcAZ3uDE8TwSyL5+b6F2aNyZVQpwT4hmBLOvNqvFPHd8AElsa5Ttp3YkyTHV
         llYqxZRCy582KbrH0NaWtru6HJqx5MM2sBtT/0mHwGA76lFcyA4jxn7IDZEF4GplP+/2
         JXdl/yFRm3Y/AfmZxuLs43t4go5nBwtPY7I+OujwlCkJQ/8zUtvoPo+WAOM8wNuibtml
         dKQg4AOOFiMCayfZMMUQIf3/j/Yeb6MabczG1MnO869I1mRZXEELzTU/UfAlXwx8v7Ku
         5YoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749727668; x=1750332468;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UMJIO+9hxF2T1hW8fxlUtSq3+LhB5vVChGg7nGiwpMk=;
        b=rJ8js9i0EaW4qhDLYIoTY8MFolazLLsT2S/RT3ZhbtelL96B1XwDdwD75ae1aJ+9Xc
         TPWv8m3qwOVLqWr4J3Pl3okg7qQF854MjpZz5tf37YsTn4QVedaCKvLwKFyhKC53WxQz
         x7FTO7abzugsMLteKo0wIviPPKwUsNDJu+JQIRJi8qgT/3C7Xv5DM2HNW7z91wsbmgoz
         y+PhUXRtYDpduETBJYe5KV5ZSx03nO12mjnjRmdSbJUO5fFDWxQtUXfJv6q2lgKf8Pr4
         1mmIWou/Llztc06zNmokUkJgPKrUUiZqbZrWLdI7wCoWPu+5BSbQMlnFowQcV6TZ+R4W
         pbRA==
X-Forwarded-Encrypted: i=1; AJvYcCUeoT1ctwqA/1B5pFx3X1kkFC/JCEPUFFJdnXK+SJ3UZpOS+mEy4G1+2AdyRKQTumjS49jMpCJRr29bXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYQzjDA9IDwnqhqMm2WwY8IuNeEDSlSoLktnPUdf6y8t8zsjNm
	cAsYfEybeECtl9RKTiX53eSu8T2ta4u8I434/FbEvvmkv8rUoWXWMvvIgqr8QguiN2s=
X-Gm-Gg: ASbGnctZkhA9sIBSNYPvKDmKQzaFomgVtYi31bYCcj8hP4fYpNcQt+8R74KPt37wVCO
	bm2jI3aFxzEMkgugUBxRHKPR6Fmaw8sRwZ1olVkUeXpVuKmrpOdIbNY5L/MIi/mRYHOVwJwat/U
	Zw8DghVqd7IKTgoDSnVbzVaMQGtgPRsx+hyZfszO7DEItHX4D95iSjy/rnRrwDIIUvivyvZQ5LU
	6GIc8LHplmf3y7zFPoTVt5m52WdoONLT/KRlGWnU6PRVSVNSc7+BWkmFyqbgMxrK+BjTkHHcxDm
	AFflA+2prfLnvWpdSd0aXqTln3O1kyoLzWuZopPRjsG3Tt3QDkJx2tcMnS6kkVeF7XQpI7ovXjJ
	l2Z5qfMH5pqCS0O6Mc9eTAGBabnrYGf9/+6O1tmGerIGkQbBHC8w=
X-Google-Smtp-Source: AGHT+IHim72L19yadAXZGJXEuLrBbBbuXPX7tGYPhPYpnsQljqwHSSz7SjlCn5GLRjBPKu2TFNsZbw==
X-Received: by 2002:a05:651c:1a0a:b0:32a:6236:7094 with SMTP id 38308e7fff4ca-32b21d8c15fmr7846241fa.9.1749727667784;
        Thu, 12 Jun 2025 04:27:47 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3321f973sm1821551fa.112.2025.06.12.04.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 04:27:47 -0700 (PDT)
Message-ID: <51a91c84-c83f-4b22-9861-88929b222432@linaro.org>
Date: Thu, 12 Jun 2025 14:27:46 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] dt-bindings: media: qcom: Add Qualcomm MIPI
 C-/D-PHY schema for CSIPHY IPs
Content-Language: ru-RU
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-9-vladimir.zapolskiy@linaro.org>
 <6e411e89-ce1e-4d6a-8d48-b800554f830e@kernel.org>
 <e02cead0-665d-443a-a884-c3a307409c66@kernel.org>
 <9e38a09b-1521-4196-b179-d29c62e143bc@linaro.org>
 <d424481b-cb06-4bee-8d36-5e31ca2838a2@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <d424481b-cb06-4bee-8d36-5e31ca2838a2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/25 14:02, Krzysztof Kozlowski wrote:
> On 12/06/2025 09:57, Vladimir Zapolskiy wrote:
>> On 6/12/25 10:39, Krzysztof Kozlowski wrote:
>>> On 12/06/2025 09:38, Krzysztof Kozlowski wrote:
>>>> On 12/06/2025 03:15, Vladimir Zapolskiy wrote:
>>>>> Add dt-binding schema for Qualcomm CAMSS CSIPHY IP, which provides
>>>>> MIPI C-PHY/D-PHY interfaces on Qualcomm SoCs.
>>>>>
>>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>>> ---
>>>>> RFC verion of the change:
>>>>> * https://lore.kernel.org/all/20250513143918.2572689-1-vladimir.zapolskiy@linaro.org/
>>>>>
>>>>> Changes from RFC to v1:
>>>>> * moved from phy/qcom,csiphy.yaml to media/qcom,csiphy.yaml,
>>>>> * added 'clock-names' property,
>>>>> * removed SM8250 CSIPHY specifics, a generic binding is good enough for now,
>>>
>>>
>>> Now I noticed this... weird change and clearly a no-go.
>>>
>>> Device binding cannot be generic, so it is not good enough for now.
>>> Please write specific bindings for specific hardware.
>>>
>>
>> Can I add platform specific changes on top of the displayed generic one
>> like in Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
>> etc?
>>
>> The generic compatible is sufficienlty good for adding the enhanced
>> CSIPHY support to any currently present in the upstream platform CAMSS.
>>
>> Obviously I can rename it to something SoC-specific, but then a question
>> arises, if a selected platform has to be a totally new one in the upstream,
>> or it could be among any of platforms with a ready CAMSS, and a backward
>> compatibility is preserved by these series and the new CSIPHY dt bindings.
> 
> Just use a specific compatible for the actual hardware this is being
> added for. I don't understand why this is different than all other work
> upstream.

There are very close examples in upstream, for instance that's a generic
value from Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml:

properties:
   compatible:
     enum:
       - qcom,dsi-phy-10nm
       - qcom,dsi-phy-10nm-8998

To save time reviewing the next version of the same change, will you
accept a list of acceptable compatible properties like this one?

properties:
   compatible:
     enum:
       - qcom,csiphy
       - qcom,sm8250-csiphy

--
Best wishes,
Vladimir

