Return-Path: <linux-media+bounces-15935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D399694A95B
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 16:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5307E1F2A859
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 14:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9CB2C69B;
	Wed,  7 Aug 2024 14:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TFwku4uf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627982D05D
	for <linux-media@vger.kernel.org>; Wed,  7 Aug 2024 14:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723039495; cv=none; b=pBQ1gGB9knEXw1IjgXEjX6jGnNzVTv3+ouiz+KtgNnsbQjC+oin4Lz5yrzGMVHrL5daBaGhIDCOgiiw/ng9dk7rtM1cJy913s+Q2xub5NnwFURMx0PonRlR2rhYcj4fGtYZeLDwXgWDOV1zfbXompJYEkriJt6kfYugP5VYd5PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723039495; c=relaxed/simple;
	bh=WQ9uPDaWROddBS2N7w2xkZdRI2oIhxXEqLzEXPO7isQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sd6JUlD8l6yeMHMbfqn1913EFImGCxc/DHqlCmIdfScizvVyvmSfx9bmpICu7JJOh+fFCx+BXRLf1GrF+KhHAXtDzjzWAsr9DuKztLU/7W8OndaZwN8xrK5yKHIVy1iMr4Uk92lzbcGVhBeKQKWljkc3dZlkCFqAeeSxjHwA81s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TFwku4uf; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52efd855adbso2589538e87.2
        for <linux-media@vger.kernel.org>; Wed, 07 Aug 2024 07:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723039491; x=1723644291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NAGWcvgFvuED6d18zQ9q2rPiFhp8BlIgeZI4PNLcmd0=;
        b=TFwku4uf57/+nIr0QyNk4RaKkdQEGA9GSPrtylWUpF3lUTZIXVLcDCHR8N6ax9ca2i
         KmCrSK6hpNYL9qVh+3ay8gD7Ol4Km+AWGtaao6LnFHcwdUzoz82lSw+qWDfQq2KELYH7
         swEVDQfangewVjyHGlkgH2WryHZ81L2dBvYf2hE3o0L8Yhr2CD7h/NB/tcd4cfLAPIWp
         2YoduaCT153mPh3U2oYcGf4hUGdcYeFqSX2/p09sFlwFz+CmaCY0q+CLFGXtSfmXNczF
         LnieZ14yJor+XsnRS6bFYpVzJwUPM1FZ00oJi4C2vott5NbOISYExImRDI7F+5/mlVfM
         PTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723039491; x=1723644291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NAGWcvgFvuED6d18zQ9q2rPiFhp8BlIgeZI4PNLcmd0=;
        b=SoezAj6k6D/yivkEqa0LBLap+4RLY2lXrkSqf42tRYDyek30gHVHD4hQE5ht7lFQgZ
         Zj10Nxsh/IKfJFo1NFCBbdYhmzOwldHiHqBSxoQPjDzIlQdW5ZYVwRuxGJyQUu+S/IOZ
         gVIerZ0GI6I+H6qDBVcn5SMtJat3M2qUNeAXpBW3nmc2e1Usb+wllXpOn3bqxAdkPle2
         bklCAhm+gleW3PWsNDvWntjMgRhSQl00Idlim9aMlUSYywHDBgJ+2Qei6C/s/8wpTZhk
         8LvbeQL6dR1bfKK0ozH/8YkCKHw9/crLuynHvr+5OF9hUvg7qyeqPs8+LZBrwUp6oyYe
         x98Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjNdwhqzkngNMNCPyeh5uaMk+GSY2ACt6/t9L9eHaFSMumQpA15DvWPrM730fkxva+/S8le7QxNUlARQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrTaf7AvlLXvEOamYZLdYv4wQ69xuWLf/a6FkB7qtga7WkWKyp
	ty9xwEcpEtx5H111e+JwI9TjVWEuZCOulqqdIk0ncjztxRRwgNvviyLoVsKO2zg=
X-Google-Smtp-Source: AGHT+IF/8jPxz9C4n7VrAIshmVfxZmmurEoO7p+zRJ5jBhuBgup8Xnfw6CErz09zqa7Zn3wwojgELg==
X-Received: by 2002:a05:6512:4004:b0:52c:e312:2082 with SMTP id 2adb3069b0e04-530bb3b527fmr11202930e87.54.1723039491198;
        Wed, 07 Aug 2024 07:04:51 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059a6703sm31093925e9.37.2024.08.07.07.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 07:04:50 -0700 (PDT)
Message-ID: <8f935a7d-87b5-479c-a98e-c95671dbe259@linaro.org>
Date: Wed, 7 Aug 2024 15:04:48 +0100
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
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1226d080-d1fc-4e06-ac81-84e93cb314e0@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/08/2024 14:08, Depeng Shao wrote:
> Hi Vladimir,
> 
> On 8/5/2024 5:26 AM, Vladimir Zapolskiy wrote:
>> Hi Bryan,
>>
>> On 8/1/24 11:16, Bryan O'Donoghue wrote:
>>> On 01/08/2024 00:43, Vladimir Zapolskiy wrote:
>>>>> +    ret = csiphy->res->hw_ops->init(csiphy);
>>>>
>>>> Here.
>>>
>>> What name would make more sense to you ?
>>
>> according to the implementation the .init() call just fills some data in
>> memory, so I believe this could be handled at build time, if it's done
>> carefully enough...
>>
> 
> This camss-csiphy-3ph-1-0.c is reused by many platforms, the old 
> platforms have same CSI_COMMON_CTR register offset, their offset are 
> 0x800, but some new platforms may have different CSI_COMMON_CTR register 
> offset, for example, the CSI_COMMON_CTR register offset is 0x1000 in 
> sm8550, then we need to add new file to support the new csiphy HW, e.g., 
> camss-csiphy-3ph-2-0.c, so Bryan asked me to develop the CSIPHY driver 
> based on his changes, then we just need few code to enable new CSIPHY.
> 
> Regarding the hw_ops->init interface, since it fills HW register 
> configurations and HW register offset, then maybe, it also can be called 
> as HW operation.
> 
> And looks like we can't move it to camss-csiphy.c since it does platform 
> specific operation and it is related to the registers.
> 
> Please feel free to share other comments if you don't agree with it. 
> Thanks.
> 
> 
> Thanks,
> Depeng

So, I agree the phy init data could be obtained via resource structs 
but, rather than add yet more patches to this series, I'd say we can 
make the move to a separate resource struct pointer at a later date.

Lets drop this patch and @Depeng we can then do

+	regs->offset = 0x800;

media: qcom: camss: csiphy-3ph: Use an offset variable to find common 
control regs

As a bonus that's one less patch for this series which @ 13 patches is 
already large.

---
bod

