Return-Path: <linux-media+bounces-39030-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1677B1D63D
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 13:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 899FB7A330F
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 10:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED3926C385;
	Thu,  7 Aug 2025 11:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KVqbMAMO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA301278146
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 11:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754564405; cv=none; b=jCLQmRkNVMmQpC/BggRscml6ZI86ngd8MJu4NPHyN46rR9wxY0pNkjnZqxtL9Mlbg+mOwEITGfxfuZ0+0d5WFJZ7R31OPY/Wz5DkxZVbF2lJEK5hBxVJUwtTe6GAifVrTWipkE/efGBQkUCvdjl3mdZgrp8d9Kqo4dtLiATnSlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754564405; c=relaxed/simple;
	bh=D/2194UFKbY+CEUSW1tbupVZ0CZVyou6ZfeJ1mmvBHU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=iGINsCLHaG3r2kyp38gclmNNmLk6qgUE+kC7DAlMIbKwwtVVUPFu/SBZBFFcnuIdZEaTGbzCR5J+ilFVdLg3/nna20GGSj86DXpmsLuFtbRoG0blUpaSYoOlbrEJ+U/JSws02jvNSOi4VeNohRmIIYx/XHCOd9Y3RU+y6Bnge1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KVqbMAMO; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-af92aa183bbso16069266b.0
        for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 04:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754564402; x=1755169202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pQRfyzai7ZWY+ER9WAmrVRipd4P7HvZq4QOb0oXkcEo=;
        b=KVqbMAMOqcWbF6Zg92FviUTNN0XQzdmXjSmaOWNrBIZVgrMhrMds57w9q1/OmScUFm
         +7H47Fb1oPeopDGYTTeuZkvOztjHWflOmJREX17i9k6tR04G9wjHm4b+S+m/I5PpsDy6
         A1X/o5JCjJbB0WCP0RDxSos71KLShHB2iI2FV9hshARrKYD2Bi8DNz1qzhIrSiYU1j55
         4I44ytksXm9vsTUwmoiL1Uhj3EfHWbvQnyQmC8zM8EskF+kwp3YwwATOX/xjrW1eqsqg
         Ax4zAcYyQPFW93u+gl1UPW+/Do5ovAM+gXtiSzVp2wS2xvBl1HcWosfIS88ognOKittd
         AxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754564402; x=1755169202;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQRfyzai7ZWY+ER9WAmrVRipd4P7HvZq4QOb0oXkcEo=;
        b=geu6dpeq4AR1wZffMxyZ6MACcDTqdYoHjg/pR7ZnZOj9vZs9TgJlBlZiz9mw0kmj1t
         gOGPCSXc5IPZj5FAw6jIXxIcx9k4zrVP22vxUU6/0hYQJE7+5qkCLqG8hYqndq/q5Wwi
         wZrXRrTaH/FxRdnvmwvR9P1h1ftWj8XNB6XF0/nL5V72EveqJX49bgaueKW/XQ/Zt/7G
         XY6yLwxvYUKHkhfdSnByW0N87o8LwCDHWZegIh6EeCOKI8l3/bQGNB2wjt1lG0EmDh29
         c/uYbuaoEv09zvPHQrEVSNtuNOPCBilR2MpNr3KhcAYMtewbmfqzbNVxOrVuEYTtK3TM
         2Z4w==
X-Forwarded-Encrypted: i=1; AJvYcCW8qpD+Y7uBxfmNSlesC+WoLpaN0gKpO2eygtZr9M/gnW43ML3uhloaf2bn5t9QMrSsRCqd2LrPYLok1A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4vPK/7Tj0Vy4U3AY+WfVXC3w+nj85RKqDPeuu5i9g4Pdad8q4
	f5K0CGJvSioMCUkQm98bRa6mCyv0USlLRfVqhPqkWf/NYMGG4JR9o1WzuTWe9/owMBc=
X-Gm-Gg: ASbGncsqfnzBghVUI57JzvwDL/uKrHL9/Rp6ih9wTl6s9OUAwYJtxnErrZ1TFaCrnR+
	BRumo3BDArxgwJtGwTebOemynSSOViBDkHdV0eExmn/A6cZfPYsvfLBKGK/VVABtLzHBMRthZGj
	Ax+x9W5CQcf9ZkF9CtbUC3e8FlAxsjjoYlHZ67rDhi35FY4/lzuUoIGaRghTe6+tpukaadZGE8N
	ZhSPiq7VvkqsgDlZRbaA70lh+vYzlJUSzFYJrH5kvy8wBB1ClCFFim9ybnFIDCf3d6Hgc6DsrZ5
	SBON+r00w+WHvR7HL2xpBBwL+y3nfzpN4n4P/tteCMrEFjhyK9GmalW6zXbhnp/0cxoMKmHfhdJ
	aqLHDdI+BHBAHeQOH1+18DXtXr8pp/tJArzBBsSakUEJ87WIK06cNFQ==
X-Google-Smtp-Source: AGHT+IE4kHUsCaFrOmMEP4qyRP98QlRLge4KS7mWMGaAZOWXRlwTk01SGGX5ntkel70axSn5eoZ2qg==
X-Received: by 2002:a17:907:3f8c:b0:af9:3d0a:f379 with SMTP id a640c23a62f3a-af98feffb63mr271235666b.0.1754564401932;
        Thu, 07 Aug 2025 04:00:01 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af92b650c8asm1138206266b.65.2025.08.07.03.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 04:00:00 -0700 (PDT)
Message-ID: <0d835f3a-cc28-44f6-801f-c787f5e363d1@linaro.org>
Date: Thu, 7 Aug 2025 12:59:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] ARM: dts: samsung: exynos4: Use SoC-specific
 compatible string for MFC
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Aakarsh Jain <aakarsh.jain@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
 andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
 anindya.sg@samsung.com
References: <20250807032449.92770-1-aakarsh.jain@samsung.com>
 <CGME20250807032508epcas5p416a3af567faba6a4fe3d6f6af5c0dd80@epcas5p4.samsung.com>
 <20250807032449.92770-3-aakarsh.jain@samsung.com>
 <419c8b19-da07-4972-892c-9f8a55a546c5@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <419c8b19-da07-4972-892c-9f8a55a546c5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/08/2025 12:59, Krzysztof Kozlowski wrote:
> On 07/08/2025 05:24, Aakarsh Jain wrote:
>> Modify the MFC device tree node to use a SoC-specific
>> compatible string instead of a generic one.
> 
> Why?
> 
>>
>> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
>> ---
>>  arch/arm/boot/dts/samsung/exynos4.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/samsung/exynos4.dtsi b/arch/arm/boot/dts/samsung/exynos4.dtsi
>> index ed47d0ce04e1..a2f15fbe98cb 100644
>> --- a/arch/arm/boot/dts/samsung/exynos4.dtsi
>> +++ b/arch/arm/boot/dts/samsung/exynos4.dtsi
>> @@ -435,7 +435,7 @@ i2s2: i2s@13970000 {
>>  		};
>>  
>>  		mfc: codec@13400000 {
>> -			compatible = "samsung,mfc-v5";
>> +			compatible = "samsung,exynos4-mfc";
> 
> There are so many things wrong here...
> 
> 1. This breaks all users
> 2. Not a correct compatible - there is no exynos4 (see writing bindings)
> 3. Commit msg does not explain why breaking users is reasonable

Ah and 4: there is no such compatible, so this fails tests.

Best regards,
Krzysztof

