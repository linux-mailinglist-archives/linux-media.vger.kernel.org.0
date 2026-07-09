Return-Path: <linux-media+bounces-67190-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u4CjEgfHT2r8oAIAu9opvQ
	(envelope-from <linux-media+bounces-67190-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 18:06:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D49273348B
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 18:06:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=SoTo8QRY;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67190-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67190-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ADD08307E579
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 15:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF3442A79F;
	Thu,  9 Jul 2026 15:50:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A011A429817
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 15:50:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783612233; cv=none; b=CQnOZYyhzl2md/Gll+meubh2gXjOZMPe/wWv0D0jrO8xW6j9BqitPU2E7lCKzasvT9jqrCkLhZwSP2DeoqzqP0rm5lGIF1lfHPTK4ggAysNl3t+dmiJVeg5GDNjNl2bnkgv+0c6h2CDp5GqECgBKZK5w3eM3raH/TP2YYVWMHUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783612233; c=relaxed/simple;
	bh=eom0WPIbBG5Lak9ChFz39EfdnHARVndwf2X4ZpXwW98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YxMIvXWkYEM0ZhbDg20XzIlCSm3rrMb9XbKibA7grnn8wClX0N9q7EEAd6/9mV9IuwVCHgkfdutBgzOcegxShy9Yqq7+16b7Zvgmk6a9Ks2uWNMf2J8Jk/9fzPgtLDrGpiSriReWQ+SYqKxJ8IGkHKafEBTLGb2wnIKcPARZRxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SoTo8QRY; arc=none smtp.client-ip=209.85.218.52
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c12614b81c9so1791766b.3
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 08:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783612230; x=1784217030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AzNulL+Y3yaGtB2zj4UUmjmsfxIxbrKupidFWaMr/Xg=;
        b=SoTo8QRYzRgHEUewqesNyHLSKMU+2EsHm5msBTW8T3pOQQwRvr/IdtPDiVVrbcr5aj
         da0ZqE/P/r/vmA8IYiMkWaWovEFNXBEJyIVIAgGakNfRFZz1Cw3+Av8eBJsSFHUnQRGu
         fYZc2cYEbfAOR7aHlzHhV6muKdaAmppCY0cmm5uWvZLgpN2+0+sthCOAXuDErb6Lbrgl
         WPMqZAmVlEKmJSuRTnVrJoleRonRhrfb6pbd2LPy5aVqIEeqvm/UVjE9JrAUzs5bQzPq
         Wjn6ww9AiqvFpnOIGCe7LdrmFrkhH6BGhDRuoeY72378cH/poF643VJFEQKcWaoIb+D8
         v2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783612230; x=1784217030;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AzNulL+Y3yaGtB2zj4UUmjmsfxIxbrKupidFWaMr/Xg=;
        b=OrmPfCL3Z/IjsosDDmafamqqmDSYJVsYaw5mXwvYbVUeWTC4t5pYLx3mr25Z5RgYCY
         kRCnzAMBoJC0O50KCGWuM4xrdZYnUS2sGWKk+cgaFMO+lx3dJKUwljtSe27MsffoozD/
         07Ke927/UK9/JYuZKBhH6zDiw+gRvKWzqdeza19K+SbrjVZeIeG1zfMbE5atPuygr707
         3w1FwKnFmncJ95dta3QxVnrsDyik336Qrlc8xHIhpKxfI4fwsryIoz0DaWSXeTwXe4S0
         ScHv7X9lpdDLtKIikpvgM1DbnLMHJ/rIxmXgz3ZOSJCqghHMQ/VyYHGu1SDuuxRzeq/t
         Qs0w==
X-Forwarded-Encrypted: i=1; AHgh+RpuLqhj51MXBuzNYOQdehHWqbkpVhPrwxDDOPpEubuM3dywUFTye1uJsQcKg2bUtDkP9mwR1h/O7sA3Gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsJeTyEtDyDYq8q/20FmG0yRpztJEYWA2bF3Pg7m/uGOG3/rSh
	1AdXMIWRPsYzNmAWd9XjgI4zSicW+vFmS8BId4gSkABYri4zqAvaZnZuiM6YPndafOw=
X-Gm-Gg: AfdE7cnsb4LSaaD0VX+Ahk1Lfe4obomYMv0qlRsRBjB5Pb9ryD7ETPbeEkbEeQknpke
	bJZTcLeCgihlrf5CAGWDCWUt2TzydLNwfpXNC8uq99BAxOKvmRo4nbkKEFuaMqpOJA1fBannWV0
	JftMcKmqWK+xGvOfT9CDk/GvHsYJIzsTCc8cZhUPdafD4ejMhi/+jiTGjlkeDBeZqH8MncfjFDy
	dUnDzlY61POSymr4n/+rd1uN61b2pzDFU5RNO6frr0TbD4Sg2vvGtzh/8GkK/AVxzfKbG0hRjnP
	TFvoVsyu83SH5xOQgf9a3CtxeK4Li2OfqzgbrXvNzRCV6Vz/N9cw//oAwO29875oTKIkRqFsdA3
	tAUI3hwLI4ayOUxvogqMYqA+BBTDOf9K8f+fqZ4syLZIjJtq9yIQXPRjPMl68/naKlrcKTvcDQc
	Cu4BDmTjrcmXLsKdrpFXyCtvkn
X-Received: by 2002:a17:907:2684:b0:c12:cacc:92c6 with SMTP id a640c23a62f3a-c15ce229e98mr373985966b.59.1783612229849;
        Thu, 09 Jul 2026 08:50:29 -0700 (PDT)
Received: from [192.168.0.101] ([93.107.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d4bffdbesm284895766b.45.2026.07.09.08.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 08:50:29 -0700 (PDT)
Message-ID: <abb179ca-a3fb-4bcf-bf7c-9766f939431c@linaro.org>
Date: Thu, 9 Jul 2026 16:50:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/6] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
To: Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-2-f8588da41f16@linaro.org>
 <HCPw5KYwtYb7jBFED4lssTvcaMo2bK808SHkTWNR77q0DXGPQklaADJXvuyeBrXh_GsEMKdiaaktkzQ9_xeseg==@protonmail.internalid>
 <cbc1b1eb-0064-4999-b829-2bec451c682a@oss.qualcomm.com>
 <f307848d-6abd-4e96-9183-36f8599026ce@kernel.org>
 <85a05836-6298-4111-97ca-80d7e3b3a9c4@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <85a05836-6298-4111-97ca-80d7e3b3a9c4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67190-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_RECIPIENTS(0.00)[m:vikram.sharma@oss.qualcomm.com,m:bod@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:konradybcio@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:krzk@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:from_mime,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D49273348B

On 09/07/2026 16:28, Vikram Sharma wrote:
> 
> On 7/9/2026 3:02 AM, Bryan O'Donoghue wrote:
>> On 08/07/2026 16:15, Vikram Sharma wrote:
>>>
>>> On 7/8/2026 5:36 AM, Bryan O'Donoghue wrote:
>>>>                iommus = <&apps_smmu 0x800 0x60>,
>>>> +                     <&apps_smmu 0x820 0x60>,
>>>> +                     <&apps_smmu 0x840 0x60>,
>>>>                         <&apps_smmu 0x860 0x60>,
>>>
>>> I think only "iommus = <&apps_smmu 0x800 0x60>" should be enough as mask which 0x60 is implicitly covering sids like 0x820, 0x840 and 0x860.
>>>
>>> Regards,
>>> Vikram
>>>
>>
>> These all come from the Hamoa iommu defintions in qcom docs.
>>
>> Can you double check for yourself and let me know.
> Hi Bryan,
> 
> Confirmed — all four SIDs (0x800, 0x820, 0x840, 0x860) are valid and documented for IFE/SFE. My point was specifically about how the ARM SMMU SMR matching logic handles these with the given mask.
> 
> In SMR hardware, the mask field marks bits as "don't care" during stream ID comparison. With SID = 0x800 and MASK = 0x60:
> 
> MASK = 0x60 = 0b 0110 0000  →  bits [6:5] are don't-care
> The four SIDs differ only in bits [6:5]:
> 
> 0x800 = 0b 1000 0000 0000  → bits[6:5] = 00
> 0x820 = 0b 1000 0010 0000  → bits[6:5] = 01
> 0x840 = 0b 1000 0100 0000  → bits[6:5] = 10
> 0x860 = 0b 1000 0110 0000  → bits[6:5] = 11
> 
> Since 0x60 masks out exactly those differing bits, a single entry <&apps_smmu 0x800 0x60> will match all four SIDs.
> 
> That said, I'd say this is more of a preference — both forms are functionally correct, and if you prefer keeping the four explicit entries for clarity or to stay aligned with how the Qcom docs enumerate them, that's perfectly fine too.
> 
> Regards,
> Vikram

I rote-copied with my brain switched off.

Your suggestion seems correct to me.

---
bod

