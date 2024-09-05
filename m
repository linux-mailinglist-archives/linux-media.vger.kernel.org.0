Return-Path: <linux-media+bounces-17698-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D723E96DF23
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 18:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 826D31F21C3C
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 16:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6407819F475;
	Thu,  5 Sep 2024 16:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sLDRtVDh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2A119E7E3
	for <linux-media@vger.kernel.org>; Thu,  5 Sep 2024 16:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725552324; cv=none; b=Xy7458GDCnS24GVUVcsVSKrOCTBcdxsjIJ3xAqYIbX8ZfzVtBr15J2B9Hg5LXMo+r+FIXHFdBMtjqkBUK4vCMlZstGBOkagKDO5Kiw29m55oh9lbbU41fCOUrbFgtxVd7ycwNZTfKCEWCcSRf5L+77h+nZ9zEN8s6QBddeJsDoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725552324; c=relaxed/simple;
	bh=HE6La4IqnKi2giZOdBmLMWGr1Jcgz+tbpv4xmLX3J2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AZ2A7xpGYEaJtoWDr5E/I5rvXNET1O29nb5wS+VDPpWPp/aS1x4S4Ib2QLcpRRAbdomZa4f2XZx7NV0Acb2VDNm7crk9G8H2O5XavV3NBvBWAXIc3Cm5SGYgsjg61rXSMYltd+KziAnqsxN/YeBcspUoZLC6melZfrFbKmupJKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sLDRtVDh; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a7a81bd549eso115758266b.3
        for <linux-media@vger.kernel.org>; Thu, 05 Sep 2024 09:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725552321; x=1726157121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A3SjbsSfqya3DyiG1kDui0xSVYDrbm2AN9/r4f/fNL4=;
        b=sLDRtVDhqmjMyzZvgEIupTbP3hfR9t6ck1KC1bdZ5InXzJj8rWZ7uOdWrnQC+ESf4s
         aNJwXlcUipnJrwcKpZV5Q2IGgnh0gm6mvvgpGGx1MEJHApVvgHyBzEkKIB7eAt9U5U+c
         Ovl9CTrcMzpHY8oA7YHu0SzJb795UW/HdflOPjKOnJMtuyFc2B+kYsxBtFTzG9qHD1xl
         FhJzUVYJy2QY0jpd/QPvUYSGnZws3abBM3W4RXRBx1hL7PUQUkrY+yePW+F5YQ1QYFc5
         uLI4yncs0UjUVA65/jxBFgWkAWXvK5oaNIbjjB6H0hjiteokbb6s4iPbwPEkkujpUkW0
         7PRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725552321; x=1726157121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A3SjbsSfqya3DyiG1kDui0xSVYDrbm2AN9/r4f/fNL4=;
        b=b9TyHthj1YZKeB5GLnFcNKcRLDYlLyP1RUkA34i+IVLOn0uHQT31V6ucW+Pb/cLHTX
         IfKaag8teVOME2sxYODLHRUXHsYhENZW6tuiHzorNXIGUEpot8w3KdzYhq5b2iKOJZA8
         L60/H4Us8kEvhu/K8UIRtU/zSOdXy9AwPzaCjq6kDj+8Dz4T3H1t0z1ZIVhZV9VYfhZ8
         QxWlWifMAB9rZsQRxL2g4JqzzkGubvSb1NpzRu2Wi4S9rUG2fHS5i9I9Z8cBgcNzc1ih
         8hLOLa1b4k0PyODkI+DbSVl01Z4e0YxFa8bjIPkdveXMvtnS6j6YEylzcUGjqXlEMDWi
         3xgg==
X-Forwarded-Encrypted: i=1; AJvYcCX2dl7StW/Q0uhFC6bHDhYMqVgNkgtA9Age77N1M9kimdL5dfGwN/tt25PHTrZ80+tIaH0bxuULrx/jUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2CfC8DH/A9MAxQlTuLgPeCGKgWnfLrGoreTWtlYZRaAaTR9l0
	MK4x1UMP9oOyNWthFM3HiE2MEqZaJURKzBCW6qgVekZDcbgt7pugh6ksDivCizQ=
X-Google-Smtp-Source: AGHT+IGKLIiZ8CzLoWVbsna5e8H1ecKT4pb77ee4/Gxsp14Hf8qUmzgZH4wljbjzNM628eXRI0oSuA==
X-Received: by 2002:a17:907:3f1c:b0:a86:789c:2d07 with SMTP id a640c23a62f3a-a8a1d29bc25mr883588166b.4.1725552320548;
        Thu, 05 Sep 2024 09:05:20 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a796a2bd6sm70318666b.189.2024.09.05.09.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 09:05:20 -0700 (PDT)
Message-ID: <1914fc07-d7be-4747-971b-40ef360d050a@linaro.org>
Date: Thu, 5 Sep 2024 17:05:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] i2c: qcom-cci: Stop complaining about DT set clock
 rate
To: Konrad Dybcio <konradybcio@kernel.org>,
 Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20240904020448.52035-9-mailingradian@gmail.com>
 <20240904020448.52035-12-mailingradian@gmail.com>
 <917917cc-3e78-4ab6-8fa4-82d9a6fe3fdd@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <917917cc-3e78-4ab6-8fa4-82d9a6fe3fdd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2024 14:57, Konrad Dybcio wrote:
> On 4.09.2024 4:04 AM, Richard Acayan wrote:
>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> It is common practice in the downstream and upstream CCI dt to set CCI
>> clock rates to 19.2 MHz. It appears to be fairly common for initial code to
>> set the CCI clock rate to 37.5 MHz.
>>
>> Applying the widely used CCI clock rates from downstream ought not to cause
>> warning messages in the upstream kernel where our general policy is to
>> usually copy downstream hardware clock rates across the range of Qualcomm
>> drivers.
>>
>> Drop the warning it is pervasive across CAMSS users but doesn't add any
>> information or warrant any changes to the DT to align the DT clock rate to
>> the bootloader clock rate.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Link: https://lore.kernel.org/linux-arm-msm/20240824115900.40702-1-bryan.odonoghue@linaro.org
>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>> ---
> 
> I.. am not sure this is really a problem? On some platforms the core
> clock is only 19.2 Mhz, but e.g. on sdm845 we have:
> 
> static const struct freq_tbl ftbl_cam_cc_cci_clk_src[] = {
>          F(19200000, P_BI_TCXO, 1, 0, 0),
>          F(37500000, P_CAM_CC_PLL0_OUT_EVEN, 16, 0, 0),
>          F(50000000, P_CAM_CC_PLL0_OUT_EVEN, 12, 0, 0),
>          F(100000000, P_CAM_CC_PLL0_OUT_EVEN, 6, 0, 0),
>          { }
> };

CCI latches the code from DT and I assume that people submitting dts 
have actually tested their sensors when they do so.

The complaint about not being 19.2 MHz is surely not valid since, it can 
be any number of frequencies.

Its a redundant and useless warning.

We can do extra work to align to a set of frequencies sure but, the 
warning is not a warning about a real thing.

---
bod


