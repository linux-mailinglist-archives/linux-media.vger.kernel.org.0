Return-Path: <linux-media+bounces-19266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 566909950A4
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 15:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79D9B1C23EF3
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2EC1DF279;
	Tue,  8 Oct 2024 13:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MrXuKXHh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61C71DF27A
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728395413; cv=none; b=UX0BdVEXSNtBTlLvz4BHNVww4/GV4F2YptwD7f/Jy+JbPxPhF2eeflUoMURgMC4NTPwD6JwSPBfvJB/JqQWY5bnHprA0IWS3Fp4E7nB105pWNBjCx7PmpZNQDXiE4PO1DDn4hDoXHqD7C8hGW7amr2JT5Wj9/901rIswdDo+sEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728395413; c=relaxed/simple;
	bh=VlikFOOadkZ0FXGNOiqEJI3JCeW2l+bF3hf/oo4lAtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lDsZFYj73l6KnGBvRnpq88uAimQuHTqyC6xRqzyNcz8ed9C7uhDSMvLIeFhjG2CPEYe+pLtVKVI5SqlfQgR2tg9srouHuLDKCwQr60VRFKfFcEXvg5+36DbtqVPftHMem7OMehaTvNdQJLUzuH0qH1MBTisLNGrPJQ8I1t19TQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MrXuKXHh; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5389fca1fdbso746403e87.2
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2024 06:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728395410; x=1729000210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WpfdK0DkSLSW2fAjRxdwV8F/aWadlnjGjQ8QBOWzH/4=;
        b=MrXuKXHh3mN/uRnW4sDK9jQT8B4hXgwY1k3dKUFxViPw4wFXmsBaIA7zLxp5UsN+nd
         wZzZhFlMglTx9/ge2Lj4bs7suP+eoZYXA7Eif6e0Rt7Yz5uqePfOJjrHPqjhBCAL33Lt
         QWvVU1ftBg3dMyWCiMCyGJLQMJc10KUid2EuJbELJeqEEHAve+qJVKqozwTQzlhaLCQR
         jIkAYfHpkwvHYrmHILKVCM2QKoThKQhQ9CidZ2HxOXluPN4nS5hTIn3G+bcl+Yv6klA+
         Je312ZEojkify6kwzS0Zu1aFVCRKkjrvZioMY7U4B61ojE7YIikPcNb00qQWVfurfqpy
         eSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728395410; x=1729000210;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WpfdK0DkSLSW2fAjRxdwV8F/aWadlnjGjQ8QBOWzH/4=;
        b=LNyvM6yauj3Pq14p4PCi+sLtflNWCFxshs+HfRampOhvpo+LUBDK+C24hTFRINSwMp
         qMF0BcRQwlaFhKGHobNgC5qEZpYn0rUAjTZPIfB5buon7F78MeVMPxhFW3wiqZqLhR5w
         sa9RCJVgN2SHjAemjWgA+qRUeY/nBM0Yw2aFZZ1G8gXFfS5JKjhfkz+RAIatJN5g1pV5
         AcgTkHhJo5XbfNYOXIqgDtcCwWKmTLx/j9s5qDPX6ugQpZmrCJvAXgTQThQRRfEXkhOI
         AXsXdarYlqimhERCR9rn91wDIt5qDRF7227rZzryXIJqm0BJZaL4AebAacuIRHUc3JCC
         1wUw==
X-Forwarded-Encrypted: i=1; AJvYcCXnhuccEkhsKumKh0lHId3jKGSR+Lfi7bdoQqsyfVYBaKWgG6LBPdBaHMT1JfyQr7aAinR+/iUv16Qk2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRW6/efcjfd3WdtjjACWWj/D7RKhjinB6rZ6YggHJsGw5fzvTt
	2yV7Q/6MDR5MX/3rEuZuDlcKpSyAzUwjBdZJ+C2KwP1FNxJASLEw2ObSLFx9iDI=
X-Google-Smtp-Source: AGHT+IGGDDy/C3JNq8sdXqLgFX4dPMMWga1oSVN0B8s30L1lSj5q2xVN4nsf1rKLRKkvbZcCirzniA==
X-Received: by 2002:a05:6512:158e:b0:536:7c0d:e54c with SMTP id 2adb3069b0e04-539ab9ec64cmr2040832e87.9.1728395409820;
        Tue, 08 Oct 2024 06:50:09 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec84f7sm1219959e87.92.2024.10.08.06.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 06:50:09 -0700 (PDT)
Message-ID: <2b5f4043-1e23-446a-aba4-96e40fb8d197@linaro.org>
Date: Tue, 8 Oct 2024 16:50:08 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
Content-Language: en-US
To: Depeng Shao <quic_depengs@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, krzk+dt@kernel.org,
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <53d2b30d-6480-41eb-8dc8-7b3970ad82ef@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Depeng.

On 9/30/24 12:26, Depeng Shao wrote:
> Hi Bryan,
> 
> On 9/25/2024 11:40 PM, Depeng Shao wrote:
>> Hi Vladimir, Bryan,
>>
>> On 9/18/2024 7:16 AM, Vladimir Zapolskiy wrote:
>>> Hi Bryan,
>>>
>>> On 9/18/24 01:40, Bryan O'Donoghue wrote:
>>>> On 13/09/2024 06:06, Vladimir Zapolskiy wrote:
>>>>> On 9/13/24 01:41, Bryan O'Donoghue wrote:
>>>>>> On 12/09/2024 21:57, Vladimir Zapolskiy wrote:
>>>>>>>> 3. Required not optional in the yaml
>>>>>>>>
>>>>>>>>         => You can't use the PHY without its regulators
>>>>>>>
>>>>>>> No, the supplies shall be optional, since it's absolutely possible to
>>>>>>> have
>>>>>>> such a board, where supplies are merely not connected to the SoC.
>>>>>>
>>>>>> For any _used_ PHY both supplies are certainly required.
>>>>>>
>>>>>> That's what the yaml/dts check for this should achieve.
>>>>>
>>>>> I believe it is technically possible by writing an enormously complex
>>>>> scheme, when all possible "port" cases and combinations are listed.
>>>>>
>>>>> Do you see any simpler way? Do you insist that it is utterly needed?
>>>>
>>>> I asked Krzysztof about this offline.
>>>>
>>>> He said something like
>>>>
>>>> Quote:
>>>> This is possible, but I think not between child nodes.
>>>> https://elixir.bootlin.com/linux/v6.11-rc7/source/Documentation/
>>>> devicetree/bindings/example-schema.yaml#L194
>>>>
>>>> You could require something in children, but not in parent node. For
>>>> children something around:
>>>> https://elixir.bootlin.com/linux/v6.4-rc7/source/Documentation/
>>>> devicetree/bindings/net/qcom,ipa.yaml#L174
>>>>
>>>> allOf:
>>>>      - if:
>>>>          required:
>>>>            - something-in-parent
>>>>        then:
>>>>          properties:
>>>>            child-node:
>>>>              required:
>>>>                - something-in-child
>>>>
>>>> I will see if I can turn that into a workable proposal/patch.
>>>>
>>>
>>> thank you for pushing my review request forward.
>>>
>>> Overall I believe making supply properties as optional ones is
>>> sufficient,
>>> technically straightforward and merely good enough, thus please let me
>>> ask you to ponder on this particular variant one more time.
>>>
>>
>> So, we are discussing two things.
>>
>> 1# Use separate supplies for each CSI block, looks like there is no
>> doubt about it anymore. So, I will update it just like based on suggestion.
>>
>> csiphyX-vdda-phy-supply
>> csiphyX-vdda-pll-supply
>>
>> Then I will need below items in the required list if they are required.
>> required:
>>     - csiphy0-vdda-phy-supply
>>     - csiphy0-vdda-pll-supply
>>     - csiphy1-vdda-phy-supply
>>     - csiphy1-vdda-pll-supply
>> ...
>>     - csiphy7-vdda-phy-supply
>>     - csiphy7-vdda-pll-supply
>>
>> 2# Regarding the CSI supplies, if they need to be making as optional?
>> Looks like there is no conclusion now.
>>
>> @Bryan, do you agree with this?
>>
> 
> I'm preparing the new version patches, and will send out for reviewing
> in few days. I will follow Vladimir's comments if you have no response,
> it means making supply properties as optional one, so they won't be
> added to the required list.
> 

Recently I published the change, which moves regulator supplies from CSID
to CSIPHY, I believe it makes sense to base the SM8550 change and regulators
under discussion on top of the series:

https://lore.kernel.org/all/20240926211957.4108692-1-vladimir.zapolskiy@linaro.org/

Note, that SM8250 regulators are not changed, however their names are wrong,
the correction shall be a separate change later on...

Next, I developed my opinion regarding the supply regulator property names:

1) voltage supply regulator property names match the pattern "*v*-supply",
    and the most common name is "vdd*-supply", the match to the pattern shall
    be preserved,
2) also it would be much better and it will exclude any confusion, if SoC pin
    names are put into the name, like it is done in a multitude of similar
    cases.

So, in my opinion for SM8550 CAMSS a proposed set of voltage supply regulator
names should be this one:

- vdda-csi01-0p9-supply
- vdda-csi01-1p2-supply
- vdda-csi23-0p9-supply
- vdda-csi23-1p2-supply
- vdda-csi46-0p9-supply
- vdda-csi46-1p2-supply
- vdda-csi57-0p9-supply
- vdda-csi57-1p2-supply

Comments, corrections and objections are always welcome.

--
Best wishes,
Vladimir

