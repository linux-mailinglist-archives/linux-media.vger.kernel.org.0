Return-Path: <linux-media+bounces-63769-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z0Z2EKs/IWqvBwEAu9opvQ
	(envelope-from <linux-media+bounces-63769-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 11:04:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C4763E503
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 11:04:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=TrGhWNKe;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63769-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63769-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A66530B8DC3
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 08:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2523FD152;
	Thu,  4 Jun 2026 08:46:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF543E63B3
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 08:46:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780562778; cv=none; b=W3Nkir9oQTc5OKk2Z5h9uwRcy6Uo+u/YmkwmsOO2aaydCLWsbwoXNUWk/am+SUrP7l5zQQ70m+X5JzFbHGgOq8rqzIb5I39mNKVNBDKZBBRFR4lTUhNMsypSfVvCSt/tYykwDdI++xsne4yilmwLnWtZYT5oa470Fon1y5hcjNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780562778; c=relaxed/simple;
	bh=DKBAaG/N5R4rrztzGTcNqmxNSYvmbc4YOW44ZQWDhZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bEODKf29socC529tcWxXRayfneABkWFfZ+O9O5pHGahLdboSWq+MJdsHZICA7qke1FuDQ2Tb1JDkQEuBJmSDplRbR1HnNTxd7yEKXM7Wfcsq41/c15ofRk5J4K93KjabfmZE9yNQx50zoiqKocMOrH0IAbtvqVnnt2FTTpzjPZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TrGhWNKe; arc=none smtp.client-ip=209.85.167.53
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aa68daa847so11458e87.2
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 01:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780562776; x=1781167576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysCy4i0ZuZGHTLV0NNKNvTSVjrjWNaqQ7rMKNBVAW0s=;
        b=TrGhWNKesFMoOF8eV2aRD6QPSe1hm37sPWKH58MN2wL4Rmi+DbKnafC1zFjBDFHVWu
         DsNfED04TBlgLFeQypnahib8eiuR4MSfTKMv/jrXfO8ZiNZwt90wlL0Vddcr0m7Bub1g
         kKbSmtBVFVT0yfwKWZGYakYf+2F0IicrJmB9SUhK8g6JDEfSfDsyZ/qniDdyqpiSWBUK
         P5fU8kjwYG9IRTklbFraqBMqPccMRVlxWCx2inALca4ceIzwHTJJHnN6ikvrtezk8Uxi
         mpsRp8GMqKIEvw42y7o2CeDoxk13g5Hh3sICBkzR35g9UaFLBZ9/syaz9mXsiYCAscVI
         ZmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780562776; x=1781167576;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ysCy4i0ZuZGHTLV0NNKNvTSVjrjWNaqQ7rMKNBVAW0s=;
        b=r7fprSKgvmfh/k4xZA9ep/xoOe2WFXdseD6ft4P7ljJ3XeEu7ciHR/I3J//ca/k7GK
         SRHYEuAHkoUXJcc81Z9vlg2Xs6Dz4Dz7xs3spIRFQu5jvNVzB+yVFQpEZKgZPXBK9va7
         snnVrh3c7G98lNs41hS+O6p5L/pdpMCVHAHICq+oJ6ho0HVnco3bNcBwcHlOvIsIP7ZZ
         c77KUkqwDfuaoAbe22YJlt2xIzN+mVJmZkn+48nhaFB7lkKZo7Ofrv39HzXe1OGO9+ru
         ogrJ0QZ0u9IqXrYGgsUc9nL5NwvbMXJSdJXwW1zx/QiTVJYW2ZgbZQqfCKzBcUYR0VML
         9oUA==
X-Forwarded-Encrypted: i=1; AFNElJ9ExHtDFh5u0V+YbbNRcvUBaRH4aR4UFiR5wCknX281gBHiVYM+TR00vs72tRgSYdvRXuorZwEibbIqnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlzha4P9OxTgWxCETYjkhTEDpEUmTjiPaELbfdkYnrxOZYeSM7
	ITgu1FnmrwcidB6+dh4awVf4VAVwO9IWcWYMIW33ZLgpeKyPtdHkKE4fBPG27VGzZcrXYo4BvKL
	uvVrueSw=
X-Gm-Gg: Acq92OE0/p36AQj8yLYFLtr+sNcI2pA0wyh5MuqqiVcv3+APSsIP9TJCoS40Ie/Ypr8
	FIb4x2X+maaV5kht/XFmBcpZrV76KZrN9sbOAdtYCLbgRzZXfYhjfWM6xEdSO99gIj0+wN9TL49
	YLHs0sMms/VwYCUNMDnoBRZhvnWhdmhM4w/E2gPXTSTNSKPhF+JubakWMl+4KfZe2hoy8OxhAYr
	PU1WTX9Dusz+axerzJZsCwInqh4hOH2tWpE+Rsr0uTv3lJmuwAE/PaDqLPIhkgGIiPTvowpFCz6
	NfXcfDO2CjtYZ7Am8/x4H2U48ytVMv4AIdphqJKeNtIQp3Vff6Hl5VXj+1cFoPf25rsJTF1I/B+
	+Deq8ALGx2Qkb9CIU86BUObKHL8RtbnS5RvgI+ug6V7/Ebj/Ok3yPcvFHjfyJ4yDAbVkSErxtli
	SgP1ABMp5SEYb1xgELzcs7viujIYJpwrsqgaNQOtGn34jhJXTFvCg7zWg1DQHWiDEzh+G+eqprX
	wFSIoqM9qhD4lVS
X-Received: by 2002:a05:6512:24d8:10b0:5a8:7317:540b with SMTP id 2adb3069b0e04-5aa81f36e3dmr159818e87.7.1780562775465;
        Thu, 04 Jun 2026 01:46:15 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99c74esm1075006e87.81.2026.06.04.01.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 01:46:14 -0700 (PDT)
Message-ID: <1b107aca-a857-4e58-a763-39c82af67747@linaro.org>
Date: Thu, 4 Jun 2026 11:46:14 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <83c12dc5-fcb4-4089-9917-9f0fcc4f940d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63769-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vijay.tumati@oss.qualcomm.com,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:mid,linaro.org:from_mime,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4C4763E503

On 6/4/26 03:30, Bryan O'Donoghue wrote:
> On 04/06/2026 01:07, Vladimir Zapolskiy wrote:
>> On 6/4/26 00:18, Bryan O'Donoghue wrote:
>>> On 03/06/2026 21:51, Vladimir Zapolskiy wrote:
>>>>> Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
>>>> If CSIPHYs are true subdevices under the umbrella CAMSS device and well
>>>> described as subnodes, then likely none of power domains are needed
>>>> to be
>>>> repeatedly described in the children device nodes, since this
>>>> information
>>>> can be obtained from the parent device by the driver.
>>>>
>>>> Technically 'power-domains' property can be safely removed, I believe.
>>>
>>> The policy is to describe the power-domain dependency fully since DT
>>> describes hardware not software architecture.
>>
>> It brings no contardiction to the statement I've given above, the needed
>> power domans will be properly described in the parent device, and there
>> is no
>> sense to repeat the properties it again and again in every child subdevice.
>>
>>> Also for a very practical reason a sub-devices can probe/run
>>> asynchronously of the parent device being active so in fact we do need
>>> to describe the PDs fully.
>>
>> In opposite to the above this one is precisely a software centric argument,
>> which should be excluded from the consideration, as well it's not a big
>> deal to make a proper async initialization, removing excessive dt
>> properties
>> is worth it.
>>
> 
> Right look forget about that.
> 
> - DT requires you to describe your hardware. You're not entitled to have
>     some other device vote for a clock or a PD you rely on.
> 

Above are two uncorrelated between each other sentences.

A device ("consumer") can ask another device ("provider") to behave in
one or another way, this is the only possible and thus natually selected
system design, and nothing behind it was asked. There is no justification
for the proposed flood of multiply repeated data, it's avoidable.

>     That's exactly the type of downstream short cut we are trying to zap.
> 
> - In our case we also need to vote on PDs individually when the PHY
>     is active.
> 
> In extremis say we are only running the TPG then we have no reason to
> vote for CSIPHY specific rails or operating points in the parent device.

So, TPG shall communicate with CAMSS, there is no CSIPHY in the equation.

> We could make the parent power-domain argument for CAMSS and CCI but we
> have TITAN_TOP_GDSC in CCI specifically because we have to model the
> hardware - including the PDs for that device.

CCI is not described as a child of CAMSS, here the situation is different.

> If tomorrow we put CCI as a sub-device of top-level CAMSS, that won't
> negate the need to include that GDSC.

Of course in this case a phandle to Titan GDSC will be marked as obsolete
or unused for CCI, no problem here.

-- 
Best wishes,
Vladimir

