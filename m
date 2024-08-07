Return-Path: <linux-media+bounces-15941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB6394AD08
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 17:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F15721C20E1F
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 15:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A54084DF8;
	Wed,  7 Aug 2024 15:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N/3co653"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3493784DE4
	for <linux-media@vger.kernel.org>; Wed,  7 Aug 2024 15:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723045030; cv=none; b=eYD95cUB39o7qaMN3YFAyud1DaG5ftGHaxNN4UUdRes+yXLfsenETt4Z+TClU1ATKDWYTed9bbNbPsuEOvxvn4Vz6ai0x7qDyvm9uqnUvrF/B7Oqr/GuZc6DZAHRxzPoX+5mmnZpQJCm1Z6bmYwhVOskmt04rrhAtwHFjDw21dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723045030; c=relaxed/simple;
	bh=TnQEyb0TlgRVKqCdGgpXS/fUm2oWRGW1oabB34py4bg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JqL4TRN1mlZGAcYTKbl7Z27V12gwQ702v1GXmai9ikpCqyUdLMvDkDfshSI4OCBbrb8FUwqUJ7UKy5ihiyVZboX93DIrOOGdgbH5L4CM69dQNHUHA37Jju8A7oY+iyV0M7QHYgXmxgwhBLmLZ5l1ohT6pvgROd96tVaa8Uut5qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N/3co653; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42816ca797fso2125e9.2
        for <linux-media@vger.kernel.org>; Wed, 07 Aug 2024 08:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723045027; x=1723649827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hbpU8BGJSDy9tSmR37aKx0UzOOARJ4TFknyzCo/3gdo=;
        b=N/3co653IyjPYikGfIFszGhOtPFqaijB22y+1pXtpm2GURfC2INI4qJiosINxl8u0F
         iX2xYIxV6P0neRNpopZrGZXD6GQfq4XyH4LzHlFnqNWDH5HVstW/s0BCYdHeAVQGN3VO
         eWB/7NyjtDL9eFN2jEa1ghIUo+1PHXWa+yyJpqvauPI3AY8q4pk2IV9b8okdgTYvDM1h
         n3W7v2nf0yPgc6YfNvCifJB8OSMQlsNxKFM7MvS5f7NVifLdnMoScHw2CRWCMDRgtYlQ
         wAOWPpRQSGFgDN19qIzS1PaaVuWx8sYy9vakNwtftsTkgKrMlhvcR81rs+vftMr6uf72
         r6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723045027; x=1723649827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hbpU8BGJSDy9tSmR37aKx0UzOOARJ4TFknyzCo/3gdo=;
        b=D8hlz1BZlmbIiDip3floS4QlSIARZKV+6kPlinaUjdliDhvjwVgZSDMzYvJzPbIOTt
         oVYMxp60MFydCPuNkZSCzQj6WMlRS+HPwxjGYXAiSaE6SU3Puf0kkVObqVtHdcX76iYi
         Y9FQedeaikPdWTLYfMfbYsRMJraiJS+/Jl8Wu/YAhwYrv3BKbhM1pp0MDhQj4bATM7XB
         DgmrrZrQ37honHYDhRknFkupDdz8jZS1gUBsESWnzB6Bae/LEuzBrRj2J1RB0pceHlr2
         WouS1gnBl+LP55sH3ef/h64D8NNL7K+4NQrfEwmtAlaymANvAOlbF19PE/WqJe1FMTb3
         M8UQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7dn92wo3FOutLfHIe8ALjB+5YQcgo3nyHnN0PV9rFksfxOtqkWzvt8D4XUO+zKjiItEY3CZC6/CiI3rKyhDBYHGsaomJGqArMkrw=
X-Gm-Message-State: AOJu0Yzz2HoYEwfZqUFPdWd0c7UW5dJUvTX83N8cA6TojsUHFMh7i+eR
	/cIiX75GIL07EJ36kNLjYLz5LfHQqlNBXgUQ7/QyWQHVIEjg7bNpv7fxc4q4V4I=
X-Google-Smtp-Source: AGHT+IEqJQdYKe2aGkUMUTlf/XKpYzvifcfU8LhAtDUz7xW59bDxFNzJvVrYScEyagfTJNRrKgoQHA==
X-Received: by 2002:a05:600c:3501:b0:427:9922:4526 with SMTP id 5b1f17b1804b1-428e6aebc74mr141633305e9.7.1723045027306;
        Wed, 07 Aug 2024 08:37:07 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42905971993sm35089695e9.16.2024.08.07.08.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 08:37:06 -0700 (PDT)
Message-ID: <ff12ce12-41d6-4aa5-ab97-222b07146e36@linaro.org>
Date: Wed, 7 Aug 2024 16:37:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] media: qcom: camss: csiphy: Add an init callback to
 CSI PHY devices
To: Depeng Shao <quic_depengs@quicinc.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-5-quic_depengs@quicinc.com>
 <6dfc2c79-fc6d-4eed-bf3f-94396130cb4f@linaro.org>
 <fafda7d5-3853-428a-b0eb-9993fc2d4f56@linaro.org>
 <4426c0e0-f877-409c-b2d2-a5aac5e8c645@linaro.org>
 <1226d080-d1fc-4e06-ac81-84e93cb314e0@quicinc.com>
 <8f935a7d-87b5-479c-a98e-c95671dbe259@linaro.org>
 <7c03280f-908d-435d-acef-b6bf4f865029@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <7c03280f-908d-435d-acef-b6bf4f865029@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/08/2024 16:03, Depeng Shao wrote:
> Hi Bryan,
> 
> On 8/7/2024 10:04 PM, Bryan O'Donoghue wrote:
>> On 07/08/2024 14:08, Depeng Shao wrote:
>>> Hi Vladimir,
>>>
>>> On 8/5/2024 5:26 AM, Vladimir Zapolskiy wrote:
>>>> Hi Bryan,
>>>>
>>>> On 8/1/24 11:16, Bryan O'Donoghue wrote:
>>>>> On 01/08/2024 00:43, Vladimir Zapolskiy wrote:
>>>>>>> +    ret = csiphy->res->hw_ops->init(csiphy);
>>>>>>
>>>>>> Here.
>>>>>
>>>>> What name would make more sense to you ?
>>>>
>>>> according to the implementation the .init() call just fills some 
>>>> data in
>>>> memory, so I believe this could be handled at build time, if it's done
>>>> carefully enough...
>>>>
>>>
>>> This camss-csiphy-3ph-1-0.c is reused by many platforms, the old 
>>> platforms have same CSI_COMMON_CTR register offset, their offset are 
>>> 0x800, but some new platforms may have different CSI_COMMON_CTR 
>>> register offset, for example, the CSI_COMMON_CTR register offset is 
>>> 0x1000 in sm8550, then we need to add new file to support the new 
>>> csiphy HW, e.g., camss-csiphy-3ph-2-0.c, so Bryan asked me to develop 
>>> the CSIPHY driver based on his changes, then we just need few code to 
>>> enable new CSIPHY.
>>>
>>> Regarding the hw_ops->init interface, since it fills HW register 
>>> configurations and HW register offset, then maybe, it also can be 
>>> called as HW operation.
>>>
>>> And looks like we can't move it to camss-csiphy.c since it does 
>>> platform specific operation and it is related to the registers.
>>>
>>> Please feel free to share other comments if you don't agree with it. 
>>> Thanks.
>>>
>>>
>>> Thanks,
>>> Depeng
>>
>> So, I agree the phy init data could be obtained via resource structs 
>> but, rather than add yet more patches to this series, I'd say we can 
>> make the move to a separate resource struct pointer at a later date.
>>
>> Lets drop this patch and @Depeng we can then do
>>
> 
>> +    regs->offset = 0x800;
>>
>> media: qcom: camss: csiphy-3ph: Use an offset variable to find common 
>> control regs
>>
> 
> 
> Do you mean only drop "[PATCH 04/13] media: qcom: camss: csiphy: Add an 
> init callback to CSI PHY devices"?
> 
> 
> [PATCH 05/13] media: qcom: camss: csiphy-3ph: Move CSIPHY variables to 
> data field inside csiphy struct
> Do you mean this is still needed? Just don't move the code from 
> csiphy_gen2_config_lanes to csiphy_init, right?
> 
> 
> [PATCH 06/13] media: qcom: camss: csiphy-3ph: Use an offset variable to 
> find common control regs
> The offset change is also needed, just need to add the offset for 
> different platform in csiphy_gen2_config_lanes .
> 
> Please correct me if my understanding is wrong. Thanks.

Correct.

---
bod


