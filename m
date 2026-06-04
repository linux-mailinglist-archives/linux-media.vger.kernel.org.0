Return-Path: <linux-media+bounces-63781-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nvALNUFdIWqMFAEAu9opvQ
	(envelope-from <linux-media+bounces-63781-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 13:10:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3433463F509
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 13:10:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=egzYeACY;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63781-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63781-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B51D30A4942
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 11:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3462AD35;
	Thu,  4 Jun 2026 11:04:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A040E3DD869
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 11:04:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780571045; cv=none; b=aDaAn/O01eukpgS5o/b+NU9RZIAiXasNnvnFwwC0L2ohhLwxYcKblU51nVZ9l2/kcqZUPB5EIj/9h/wft7fJNxLI52JEz0HUb3aShjnTXy3jWmO/NdhdqLKT3AlKDDsjgnYU6CBiF4MEopzQFiRDfbchEcpEhTA2Pgmk1kBhZhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780571045; c=relaxed/simple;
	bh=B/gjocXEAZZGmLbh3FhqexUI+meJYXHmU7OgkVbES/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WUycPdT/SyewWmJP/oOeeDBD4C0Wyp7Swkw1nvTDIcqz2CWFpxvyHt5BA6sVYzY9v1qImOaTN2GBiPqX+vzZ9Bcs47auli9z0DJrSjghejPzH2+cs5eFCorzbpcmFkkXHHilzIm4V+uC/dBl5JEki5hdf4PlEs3VxI+fNOAhfkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=egzYeACY; arc=none smtp.client-ip=209.85.208.45
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-68852a4fc68so967472a12.3
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 04:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780571042; x=1781175842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qrF+chW03A8IR47Oi/Ih5ziYJf7j0S60VPCDD4Eshmo=;
        b=egzYeACY/cONw7OtjXY7yu5siA2UTWV/K0rYaoBh+KK42Bt4hbXMaTSmyvSURtFfl6
         8HfdqpDHtDDGic9XQmrWdJ7bwiR0xoCClRtjhwZQO9gNDRkAg/tXOkrVo32JWGeS9DSo
         GE0Tv/6gSbU1xM1SwBptsp6UxopG3cnoJGbFuhonWKkWOzd9DLinpT5GeWi8XOWN2AAf
         uF3UESuyavQuhU2UgqNYyE+PxDI3m8BvKPBUCn3lf4KPFj7AXmGA3JDkjzqpMSo8A7cq
         wSb3I7Sb+/3FHmLIM51JAZSBY0qnHJuaftxSW9gy+EEtoVCtUeB/T9YPZf1NSYYpD9no
         oT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780571042; x=1781175842;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qrF+chW03A8IR47Oi/Ih5ziYJf7j0S60VPCDD4Eshmo=;
        b=lBBiEaeEQI0CRqZw5vSjhlFgPnYz4GSww4fyY8lMp2nOD59nKDF2UR+rAp5sro7Dl7
         VPpLTKt07rpOyu0sU4pV+gbdxIz/qWl/cKXk9XOzmyAWvcL3lXLJ5XjEQVaNAIv2W7lq
         dskjx+Su5RG8s24ZGu3KaKzXO7V1eQje3cfmwfKdlrZJyqqWXjM6VQVpqFeKyy8MOXrP
         C8dyc7clSK87A6QcDV1uNKJlaOrEcij5TvAoq/t8dgxM04X409o40UeQ72WkuSBsjS1E
         Oa45QU5+q9iuevvYEB4cXi2oVidwWIIZDbxszWJvrFypTFlT1LECUSEupfH+a5oWPAb7
         RB/Q==
X-Forwarded-Encrypted: i=1; AFNElJ++g0ElYpYC6DPcbsnkDXBttRh68OI7wUT+ZsSPveVT75bbqBbtqiQWioqDhIMSUORVmBNTdh3u/5sFBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4/eyMDP43s2M0G5Dr/Hj7ItUogithTGAm5lDF9DgMu6XHtjta
	G6T+nNvZu2IDgSuFpjg8SO+lWzd58uXxdnIfw//TDHdqhaHSRa0QF8d1hjZzgzeoTMc=
X-Gm-Gg: Acq92OHo7b5rLV4XqGiqxBNAAU+VSeGVWYJ/KEGHJLOG0rDM52ME/pP726acvREI7bo
	+x/VKNlFUbjQFLTLUqz7kKjVIX1sG1W7CVHj6DeKHfvy7pEb6Ts5fyXOTniYG/PQScXrzRuLNgx
	cmW4cueVK6yW2+Dn8mu46+X3yDF7I0bZQ9xFM3bOZByUtc4CNZM02DtYkFiMwCLYeHywZqdkc8b
	fxq1WHC+nlJdF3ZeEyrKlpkjtvfybrT+xLXjbD0lfMyoBz605cBmzzLrslVrgJQxGLl/+yNzVqQ
	5JEAwSW2+PG3uk2eW1sbDi0jgLidKzPeB50L/hd39ADxoGnrRdDan4wo2c80se+MBhAmX/l0sn0
	+1TQ4FIcGOngomcwUoN1Izk8sylzJ51OMFrw36F7qW8IF/HVwsr2OcZfyMAVVL1MkSnNjjZ2vSx
	1CEVthyN3HYQuYPHBFZVgIOo354Em+LXFKPeub/3AUpqLn4Gc=
X-Received: by 2002:a17:907:6092:b0:bd2:bd3:1ef8 with SMTP id a640c23a62f3a-bf0ab021c93mr446755866b.35.1780571041852;
        Thu, 04 Jun 2026 04:04:01 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.175.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05228a16csm287937966b.28.2026.06.04.04.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 04:04:01 -0700 (PDT)
Message-ID: <139130d0-1f59-49aa-b174-9e1860eb8465@linaro.org>
Date: Thu, 4 Jun 2026 12:04:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
 <478df3ed-d4ef-43aa-bb84-e2075798542b@kernel.org>
 <ec98ef2f-02b4-4086-8b4b-07b6953dbd20@oss.qualcomm.com>
 <514cf213-5778-45e1-8d70-d3fe27991fcc@oss.qualcomm.com>
 <7JNJ4dUNz4ennJ5dkzhfLSuVo72JpfZAbprICPRqlRYnSzVDJw6x3h-1nESd_PK-3us9f1V3qOiLiywsTqP8vQ==@protonmail.internalid>
 <f01c0e22-4e5c-44e7-9ea4-4bc8d53aea2e@linaro.org>
 <29e8491f-20e8-4082-8943-66bee7e3af1d@kernel.org>
 <5ca611b1-0663-4975-bd56-b1343851e5fd@linaro.org>
 <83c12dc5-fcb4-4089-9917-9f0fcc4f940d@linaro.org>
 <1b107aca-a857-4e58-a763-39c82af67747@linaro.org>
 <67b6f6ae-bfca-4afd-adfb-6ec1741105d8@linaro.org>
 <9ab0d8f4-e1b6-415b-976b-721ab7a29194@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <9ab0d8f4-e1b6-415b-976b-721ab7a29194@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-63781-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:vijay.tumati@oss.qualcomm.com,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3433463F509

On 04/06/2026 10:20, Vladimir Zapolskiy wrote:
> On 6/4/26 12:06, Bryan O'Donoghue wrote:
>> On 04/06/2026 09:46, Vladimir Zapolskiy wrote:
>>> On 6/4/26 03:30, Bryan O'Donoghue wrote:
>>>> On 04/06/2026 01:07, Vladimir Zapolskiy wrote:
>>>>> On 6/4/26 00:18, Bryan O'Donoghue wrote:
>>>>>> On 03/06/2026 21:51, Vladimir Zapolskiy wrote:
>>>>>>>> Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
>>>>>>> If CSIPHYs are true subdevices under the umbrella CAMSS device and
>>>>>>> well
>>>>>>> described as subnodes, then likely none of power domains are needed
>>>>>>> to be
>>>>>>> repeatedly described in the children device nodes, since this
>>>>>>> information
>>>>>>> can be obtained from the parent device by the driver.
>>>>>>>
>>>>>>> Technically 'power-domains' property can be safely removed, I 
>>>>>>> believe.
>>>>>>
>>>>>> The policy is to describe the power-domain dependency fully since DT
>>>>>> describes hardware not software architecture.
>>>>>
>>>>> It brings no contardiction to the statement I've given above, the 
>>>>> needed
>>>>> power domans will be properly described in the parent device, and 
>>>>> there
>>>>> is no
>>>>> sense to repeat the properties it again and again in every child
>>>>> subdevice.
>>>>>
>>>>>> Also for a very practical reason a sub-devices can probe/run
>>>>>> asynchronously of the parent device being active so in fact we do 
>>>>>> need
>>>>>> to describe the PDs fully.
>>>>>
>>>>> In opposite to the above this one is precisely a software centric
>>>>> argument,
>>>>> which should be excluded from the consideration, as well it's not a 
>>>>> big
>>>>> deal to make a proper async initialization, removing excessive dt
>>>>> properties
>>>>> is worth it.
>>>>>
>>>>
>>>> Right look forget about that.
>>>>
>>>> - DT requires you to describe your hardware. You're not entitled to 
>>>> have
>>>>      some other device vote for a clock or a PD you rely on.
>>>>
>>>
>>> Above are two uncorrelated between each other sentences.
>>>
>>> A device ("consumer") can ask another device ("provider") to behave in
>>> one or another way, this is the only possible and thus natually selected
>>> system design, and nothing behind it was asked. There is no 
>>> justification
>>> for the proposed flood of multiply repeated data, it's avoidable.
>>
>> CAMSS or rather the components of CAMSS modelled in the current node,
>> is/are not the provider of the GDSCs or the power-domains, it/they are
>> consumers themselves from CAMCC.
> 
> Well, this is the argument about software, and software can be changed.
> 
>> The producer/consumer model is CAMCC to components within the Camera
>> block. Some components depend on say MXA, MXC, some do not. Nothing in
>> CAMSS itself is a power-domain provider.
>>>>      That's exactly the type of downstream short cut we are trying 
>>>> to zap.
>>>>
>>>> - In our case we also need to vote on PDs individually when the PHY
>>>>      is active.
>>>>
>>>> In extremis say we are only running the TPG then we have no reason to
>>>> vote for CSIPHY specific rails or operating points in the parent 
>>>> device.
>>>
>>> So, TPG shall communicate with CAMSS, there is no CSIPHY in the 
>>> equation.
>>
>> Right but it would be inappropriate to enable all of the PDs for all of
>> the components in the CAMSS block when we can do so more granularly.
> 
> Whenever it is actually necessary, it should be possible to split PDs into
> generic/parent and subdevice specific groups, it's a part of software
> implementation. In some cases there might be no need to define any child
> side PDs, likely CSIPHY falls into this category.


Completely not a discussion about software. DT needs to represent 
hardware. Its a different mindset.

I don't think we are going to resolve this debating the same thing again.

My position is the CSIPHY should list the set of power-domain 
dependencies it has. The PDs don't come from any other thing in the 
CAMSS block so the producer/consumer model is CSIPHY to CAMCC and CSIPHY 
to RPMPD respectively.

I'll just ask @Rob, @Krzysztof or @Conor to offer up their opinion as DT 
maintainers and work from there.

---
bod

