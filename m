Return-Path: <linux-media+bounces-38055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3929B0A088
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 12:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B36B5A55D2
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 10:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 409302BCF72;
	Fri, 18 Jul 2025 10:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J/wWWskB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADAF29CB52
	for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 10:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752834073; cv=none; b=Zn2C4DsJH465WAnH8wz3N24cr+3eFdvzIsUIxoT/nwRzkD6OC6U6S93zxLLOIdzdV8YOQgKaLFlrKZesuxN0e7qOFxtfJ2VNL3EVTMziCBmquuySoeGGwl/musHfud1PzaK3+osqbuIgCM4jB12PV5kr+HiT2n1rX2b7qfT6+tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752834073; c=relaxed/simple;
	bh=g0MCGJ7YaYbAjDt3WhSX/LOOkU6F6Pxo7BkKvNMJkvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nl0N86wXKM391/9eHAoLQQtkQI7vi1ZfMSdKdry281bcMsGyu+DqtcryWE8txSqV1DFOP1bh2N/vux6Q/1NMlChjXhis8zkg+qkQX4R/8Iw1O6qIgfSk8TItTe/eRzvEl4GM+27IBzdUv3ianLPQyFHMBmI84rWKIIYMWIoey7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J/wWWskB; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a54700a46eso1135419f8f.1
        for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 03:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752834070; x=1753438870; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0OAIcBL70630f3jMfmSHdEwCAV/8PODlKAUzq5Lxgf4=;
        b=J/wWWskBzPKPx1yaR7a+bWgJi8A/MIVn7ItK7/YQCis1Xz+EY+YQKZAX0kgMHw/OKO
         jERX7ACjBL0auwz409G0hE/JClq/5/Y8kMUCPU9B5e2E54eXhyXGrXwBfvWoZpoYPfhy
         +YPW/szg4MpecksdbkFdvkKAmZ5GMYYMuVlA4FGplKVfPmg46y4NC2Vr0AlJGn5H9JqJ
         l9Da2T7Xv8UjiNlf9gGKhTausYqcspHyHCZWNnRKShJlg4MyaW+m07P6H/HZzwmOxCgc
         w7DMVzmRNhYzA7NGZMIdtFEsElqijKyHldkztsn1vLf+DIdvpi580AObPJRJt/0RY/4v
         ir0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752834070; x=1753438870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0OAIcBL70630f3jMfmSHdEwCAV/8PODlKAUzq5Lxgf4=;
        b=hGcf3ECau6gEJrk6grhUmzm5H6t/9wkVEL5YzYobNtmqXPaSZB90iO4YTyxPDen07k
         217I2wP9JNB9bGRB12zaLXBZxaZ9cAXsB/fTQOFujxS/m5KZ72HRRZaDWWXGxmGs77BC
         JJnGvwAfNeHFQSLJFuXuj6pYV8AMEXIh7j3bGI9x5sYDU6zyjHFw8T5/E4YhTJxDyoPC
         oJPuC6kyL9eRVKPOS18+hAsLWa4RbMqfwJh38Q5HSBuQUIwSNVxvzvrHuU2c74Nuo4ko
         pYwyGjTtqc0WslCeuBIIK7k0Xs/PCU+zlgBp5YwiZmzSnqFEs5GLS4XXTWekB3wgRy6b
         AS6A==
X-Forwarded-Encrypted: i=1; AJvYcCUzJg+JRWrqFtRd/C6droKfbbufiqUK3m8+9H9sp4Az6Y9HbiM3pW4oqxhthgBF+gTpXgpQxJvkUuYRSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSRM3/e14+kvEGDlBiXLMhyEdn55Ry0D1/OZeMzRLc6gE5L3Us
	CjKW6l3MWNWawTjLV/KGJn9Csmaf3IwK+CaJiBGoqsyodolooUJxGtLRYqpdZqWg1yg=
X-Gm-Gg: ASbGncu8f21OJ/AQ1QkCwnR0/2p0rV3kAJVHEcjTqDyGE4MBLYPRrd7p6DXPPhC4kxD
	l+yoKW0dcR6QAcJg4GfkywYLChK/331pwadcTp1Y6PbUin/1a/kuBFkGf2OjHOlhuuUZbRhndUT
	qlOLERk6d6iaroqtdresV/S3rZLrrU60VFNc8USlh/DuRXjK8b97+4lb+CfdTWnS2EfReWReDfb
	OVSIbEL69j1nsVahNCUuCopxQKkViyEvn1Djiq8CAgDLTkraa2/bCoiKGX7HOtE2PlE6HH0MZiT
	3F04HVsfK7Fw4oPtwQmUMY3qJ35Oy/FPrgNxiocuFJW02vQkQkb9iY/0N99GP43ssWnWetaJLq5
	2pyHq5ODWeMzkCr4kWKMBIvG14NjhE6uQ4zz6RQVL9W249xJfX6hVlqsbrr4jFmx86Y69sgtxcX
	0=
X-Google-Smtp-Source: AGHT+IFb4UrEaIgReWQNYtGNnuAGOrUAMETqNaFcLfwK/JPQUJ9ADxpbWpnghscMDuTHhPHpfNW4tw==
X-Received: by 2002:a05:6000:26c9:b0:3a5:3b03:3bc6 with SMTP id ffacd0b85a97d-3b613e983bemr5609226f8f.28.1752834069708;
        Fri, 18 Jul 2025 03:21:09 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca2b945sm1427254f8f.22.2025.07.18.03.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 03:21:09 -0700 (PDT)
Message-ID: <1402a52f-639c-4872-a153-b549603c13a7@linaro.org>
Date: Fri, 18 Jul 2025 11:21:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] media: dt-bindings: venus: Add qcm2290 dt schema
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, krzk+dt@kernel.org,
 konradybcio@kernel.org, mchehab@kernel.org, andersson@kernel.org,
 conor+dt@kernel.org, amit.kucheria@oss.qualcomm.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-2-jorge.ramirez@oss.qualcomm.com>
 <8a63f517-a443-48e4-9b9c-0c4b362f59f8@linaro.org> <aHiZpnFhhR5O0h97@trex>
 <0bb2867a-393b-46f9-ad6f-1aeee5a3a9d4@kernel.org> <aHjbjw8Z79Xcd/ZJ@trex>
 <aHksJum91s4ZmI56@trex> <5afbaf46-bbb1-47d8-84aa-29b18987564f@kernel.org>
 <18d013e5-352e-457b-ba96-3dd19f1cbaed@oss.qualcomm.com>
 <56d4e911-5bec-458e-acd1-3594a6d8b91d@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <56d4e911-5bec-458e-acd1-3594a6d8b91d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/07/2025 11:04, Krzysztof Kozlowski wrote:
> On 18/07/2025 12:02, Konrad Dybcio wrote:
>> On 7/18/25 8:27 AM, Krzysztof Kozlowski wrote:
>>> On 17/07/2025 19:00, Jorge Ramirez wrote:
>>>> On 17/07/25 13:16:31, Jorge Ramirez wrote:

>>>> Not sure if I’ve shared this before, but following an internal
>>>> discussion, I think it’s worth highlighting a functional dependency in
>>>> the current kernel:
>>>>
>>>>   - the driver only works if the first two IOMMUs in the list — the
>>>> non-secure ones — are placed at the beginning. Reordering them breaks
>>>> functionality, which introduces unexpected fragility.
>>>>
>>>> Regardless, this seems like a valid concern to me — a driver shouldn't
>>>> rely on the order of phandles — and I just wanted to make sure you're
>>>> aware of it before I post a v8 (likely sometime next week or the
>>>> following, as I’ll be taking a short break soon).
>>>
>>>
>>> Hm? Order of lists is strictly defined. That's actually an overlook that
>>> we never do it for iommus, but the core rule stays.
>>
>> (FWIW "items:" is an ordered list, "enum:" is unordered)
> 
> enum is not a list, but enumeration, meaning one item of multiple values.
> 
> Best regards,
> Krzysztof

As Krzysztof says the ordering is strict.

I think the right-thing-to-do is to document in the commit log the 
dependency.

The final three entries are secure entries and the ordering is important.

---
bod

