Return-Path: <linux-media+bounces-19267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8DC995118
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 16:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2A0F1C2508C
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 14:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2505A1E04AB;
	Tue,  8 Oct 2024 14:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hhXUDw8q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C5C1E009D
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 14:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728396392; cv=none; b=i4RrgPVL+QFqMXFDgoRrQ5EsFdWkmIN6LJh2uGM5AgZUdk50ZRQdnkpnqPIm3Dd1i+33ojQz2Ne0r7+R/WkOMTtFXWa0QtZyF5izUVUYyCXLo9usWpn01ovIms1I8xR8//NyNwdhgI1AZdOJZp38Ncax+P/F+LEA61Fd7R8kTbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728396392; c=relaxed/simple;
	bh=BXOGQA6mvWgbyjnw+Dpeyg4FhDykouyx7I2lmxPK/Ew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vh+k9iT4N8VDM7ZdoQY4Z6LpGa9kgLnXls8/A2aoHiQ0ADt3Jg6XiT8UGgV1kW4cHZHkFqT4coJVlilBiTwT5dt7D3lDiCU8FimcpbQwKbPYXox80x8aY8KFvdKR2WV8lDRIYyLjQH78rPhQS4lIo1GAeP1pcLMngA3UvJtwupY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hhXUDw8q; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fad100dd9fso81089841fa.3
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2024 07:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728396389; x=1729001189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L4YJLWqBXYOC24Bw1ONw1fQX4wAbzBRC8sG3hZFWAGE=;
        b=hhXUDw8q+LurIQb/aMpbB4bQG3TczdP5UW2OjmCLSmRbnfetN1Ic2XGU06YJ/Kuj0L
         eP6el9zIYqeSM8Xt5t8qyDI9/lfbUh2lyVsNnsHP9+5I2Td8kpGIwxOYHwtWMnST1nDc
         cds+vTD/YXivX3Vn1InTfL6sbGsEMpRQ8bj60nvq1V2zkE9rxUlOrWKKZxatqdA6EXg+
         EYKl/Sk/zU5f/gA+rLbfFj1CzONtMol7f1RsQK2IuuJPUj2nYcohe4UEh7O3X42i5R9k
         /jEh1W7y3qMyYSDu06aPGuFPdvTREvpHgrFYUr5+XOZZIbgyU6aVuh+ToFJypSF2pAEt
         b4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396389; x=1729001189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L4YJLWqBXYOC24Bw1ONw1fQX4wAbzBRC8sG3hZFWAGE=;
        b=LGP75K8p4Oi9tyhlYikAHNfivIc3mXJ0AO9ffDedPR0+81HTNfZWySDJB5WCwn79Z8
         LxH114g5PE2aDM3ottmx60VKB2iV8Jbt5jyUt5GQ5roi8cwoawSApp4LzDRlp+B6bnIX
         O+ebtaYkx6nIgm7gcyXpg+sV7AdweO+U93kTRlX0Sh7E45y5we7Sl0owJUs23234YFPa
         4l0gEp602VWJ4ihDSu2mIHs81IQjbvFHp4wsBMDximSHbUpqrMYAf5YfYQSP0nkHG8w7
         0t+M0AOKcaiYXwxQnuuTR839OWNA5+atfhmCBqdMJ4Uo7DaVazxBr85LZ7k52wwIlAUe
         EQIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsxxjbvdEMW0R3O88jfWw4oJyLw2wnhh7ewfHO0JKaC+OZOZXTfG+Y/AEYZXk71ladpQxP3TJebKeXmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGj7h39AKqAzNhs1+eWfXQgpBeTimFUYXTEXtIJbDojLCXnP7H
	0i/zPTiWRkImg0AKgS180CUkxP0OUidmb70umhL2TT9CF9ESQtGQSXRLh41RUgs=
X-Google-Smtp-Source: AGHT+IEtXKRVvXCTBO+Hn+2lXi+dDepJNjwT3ZoxXz/aKFuaRDewqMiBd/3inniqYPigQyAxPcFhvw==
X-Received: by 2002:a05:651c:1545:b0:2f7:712d:d08 with SMTP id 38308e7fff4ca-2faf3c2978amr107548661fa.23.1728396388703;
        Tue, 08 Oct 2024 07:06:28 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a994787fa61sm377678766b.169.2024.10.08.07.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 07:06:28 -0700 (PDT)
Message-ID: <7dd6132f-52c2-4f0a-8eec-26791f250111@linaro.org>
Date: Tue, 8 Oct 2024 15:06:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Depeng Shao <quic_depengs@quicinc.com>, krzk+dt@kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, todor.too@gmail.com, rfoss@kernel.org, conor+dt@kernel.org
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-8-quic_depengs@quicinc.com>
 <b1b4a866-fa64-4844-a49b-dfdcfca536df@linaro.org>
 <82dd61ab-83c0-4f9c-a2ee-e00473f4ff23@linaro.org>
 <da60cf71-13a4-465d-a0ee-ca2ad3775262@linaro.org>
 <97e4f888-1ed7-4d82-b972-3e0b95610198@linaro.org>
 <6eadc285-f413-4bf0-8795-59ff19c734da@linaro.org>
 <6562a958-47e9-4a49-b235-fe8deba3c051@linaro.org>
 <cab95caa-9ffb-446a-858b-342939e80811@mleia.com>
 <4e94106d-5ca9-485b-8c51-c18dcd4e64b0@linaro.org>
 <b779182f-a963-400a-8fc1-2468710082d2@linaro.org>
 <a0f66292-fb97-40ae-9fb1-d79160e70bb3@quicinc.com>
 <53d2b30d-6480-41eb-8dc8-7b3970ad82ef@quicinc.com>
 <2b5f4043-1e23-446a-aba4-96e40fb8d197@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <2b5f4043-1e23-446a-aba4-96e40fb8d197@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/10/2024 14:50, Vladimir Zapolskiy wrote:
> Hi Depeng.
> 
> On 9/30/24 12:26, Depeng Shao wrote:
>> Hi Bryan,
>>
>> On 9/25/2024 11:40 PM, Depeng Shao wrote:
>>> Hi Vladimir, Bryan,
>>>
>>> On 9/18/2024 7:16 AM, Vladimir Zapolskiy wrote:
>>>> Hi Bryan,
>>>>
>>>> On 9/18/24 01:40, Bryan O'Donoghue wrote:
>>>>> On 13/09/2024 06:06, Vladimir Zapolskiy wrote:
>>>>>> On 9/13/24 01:41, Bryan O'Donoghue wrote:
>>>>>>> On 12/09/2024 21:57, Vladimir Zapolskiy wrote:
>>>>>>>>> 3. Required not optional in the yaml
>>>>>>>>>
>>>>>>>>>         => You can't use the PHY without its regulators
>>>>>>>>
>>>>>>>> No, the supplies shall be optional, since it's absolutely 
>>>>>>>> possible to
>>>>>>>> have
>>>>>>>> such a board, where supplies are merely not connected to the SoC.
>>>>>>>
>>>>>>> For any _used_ PHY both supplies are certainly required.
>>>>>>>
>>>>>>> That's what the yaml/dts check for this should achieve.
>>>>>>
>>>>>> I believe it is technically possible by writing an enormously complex
>>>>>> scheme, when all possible "port" cases and combinations are listed.
>>>>>>
>>>>>> Do you see any simpler way? Do you insist that it is utterly needed?
>>>>>
>>>>> I asked Krzysztof about this offline.
>>>>>
>>>>> He said something like
>>>>>
>>>>> Quote:
>>>>> This is possible, but I think not between child nodes.
>>>>> https://elixir.bootlin.com/linux/v6.11-rc7/source/Documentation/
>>>>> devicetree/bindings/example-schema.yaml#L194
>>>>>
>>>>> You could require something in children, but not in parent node. For
>>>>> children something around:
>>>>> https://elixir.bootlin.com/linux/v6.4-rc7/source/Documentation/
>>>>> devicetree/bindings/net/qcom,ipa.yaml#L174
>>>>>
>>>>> allOf:
>>>>>      - if:
>>>>>          required:
>>>>>            - something-in-parent
>>>>>        then:
>>>>>          properties:
>>>>>            child-node:
>>>>>              required:
>>>>>                - something-in-child
>>>>>
>>>>> I will see if I can turn that into a workable proposal/patch.
>>>>>
>>>>
>>>> thank you for pushing my review request forward.
>>>>
>>>> Overall I believe making supply properties as optional ones is
>>>> sufficient,
>>>> technically straightforward and merely good enough, thus please let me
>>>> ask you to ponder on this particular variant one more time.
>>>>
>>>
>>> So, we are discussing two things.
>>>
>>> 1# Use separate supplies for each CSI block, looks like there is no
>>> doubt about it anymore. So, I will update it just like based on 
>>> suggestion.
>>>
>>> csiphyX-vdda-phy-supply
>>> csiphyX-vdda-pll-supply
>>>
>>> Then I will need below items in the required list if they are required.
>>> required:
>>>     - csiphy0-vdda-phy-supply
>>>     - csiphy0-vdda-pll-supply
>>>     - csiphy1-vdda-phy-supply
>>>     - csiphy1-vdda-pll-supply
>>> ...
>>>     - csiphy7-vdda-phy-supply
>>>     - csiphy7-vdda-pll-supply
>>>
>>> 2# Regarding the CSI supplies, if they need to be making as optional?
>>> Looks like there is no conclusion now.
>>>
>>> @Bryan, do you agree with this?
>>>
>>
>> I'm preparing the new version patches, and will send out for reviewing
>> in few days. I will follow Vladimir's comments if you have no response,
>> it means making supply properties as optional one, so they won't be
>> added to the required list.
>>
> 
> Recently I published the change, which moves regulator supplies from CSID
> to CSIPHY, I believe it makes sense to base the SM8550 change and 
> regulators
> under discussion on top of the series:
> 
> https://lore.kernel.org/all/20240926211957.4108692-1- 
> vladimir.zapolskiy@linaro.org/
> 
> Note, that SM8250 regulators are not changed, however their names are 
> wrong,
> the correction shall be a separate change later on...
> 
> Next, I developed my opinion regarding the supply regulator property names:
> 
> 1) voltage supply regulator property names match the pattern "*v*-supply",
>     and the most common name is "vdd*-supply", the match to the pattern 
> shall
>     be preserved,
> 2) also it would be much better and it will exclude any confusion, if 
> SoC pin
>     names are put into the name, like it is done in a multitude of similar
>     cases.
> 
> So, in my opinion for SM8550 CAMSS a proposed set of voltage supply 
> regulator
> names should be this one:
> 
> - vdda-csi01-0p9-supply
> - vdda-csi01-1p2-supply
> - vdda-csi23-0p9-supply
> - vdda-csi23-1p2-supply
> - vdda-csi46-0p9-supply
> - vdda-csi46-1p2-supply
> - vdda-csi57-0p9-supply
> - vdda-csi57-1p2-supply

So I communicated to Depeng to take the patch for the regulators but, I 
still don't think the above is the right way to do this.

I will take a pass at constructing something in the schema to capture 
the case where a regulator is required if and only if it is instantiated.

May not be possible with our current syntax/tools but is 100% how the 
hardware works so IMO is the right thing to try to do.

---
bod


