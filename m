Return-Path: <linux-media+bounces-44630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA42BE08CA
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 21:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 71166506C50
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 19:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7C33064BF;
	Wed, 15 Oct 2025 19:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ObYaBkA0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40A830101E
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 19:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760557959; cv=none; b=WMHnkdkhghlZbwetgaK5H5ssruvUyQ4W5Sem/uVQJrm+hfx0r91tt2YdFRqoe91lusa/GU/5TjlmkXlT4oQ5XtPrneP0jA+wQkkmMi2EFM8cqE/89ZJcXqJHNfeGAr2LUWNhIqOEY33cgYDcZpvXp7LPblkw23qn9k2q9SLuAWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760557959; c=relaxed/simple;
	bh=af8Xe6TRc+JzmwAuvgEbc4JHLFA1oiSBVP44j7jh3EU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jTF6X9Cev3ZrOGKR5uT33qGsLuUv0BKeXYWmI7ILFfVl+rbkU32+OiF/qCGSnsWdf8Ubv0LoujC0vHR557zrCjCDFRwaVeO4luaoKUnvkMtlyAq7+4EupEVGS4bmw0J3aWettG4xS7mj9bq316d9ZUm/vjIrmpTyuEn+eYwyWrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ObYaBkA0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-471076f819bso7075875e9.3
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 12:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760557956; x=1761162756; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9GS1idVixeI5e2i+7QHqAFbRFPE0KaUN0lsPmnrv+9w=;
        b=ObYaBkA01lQyxQhQ8kKSQS/RPGNqcvyHVTldqN5eRNylfz7gCGR5SvaQoP/MB4iNVT
         3DchSRkM+24PNgUiYDUXTMT/dNu9OEwYdp3YbvMvEtQad0m4DRNZ3PZZbl3z//pLOWSw
         kjfknvKRcAs40ttBipcx0cvgoj1ZQ/0Yd4fPYEn2+XLSettgAgu7H9aagLhvuIavhXb9
         U+6Uxv9GLmntVcWFMCsZDezMt6fqklBHMw5dEBa6+G6SG7LBEIqh0lrp6qqexrUGLzMY
         9P7CRhdbq+Q4XA+0KtpcOy5MrztJB//q8ay1nAAPwNgHAuzxeMfAEWchvccMoKrOVQR0
         h3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760557956; x=1761162756;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9GS1idVixeI5e2i+7QHqAFbRFPE0KaUN0lsPmnrv+9w=;
        b=EVUqCqd35SRvCZ+DftATm8a//9PVioxNRVQa+iWQzxyCWR4g1BGkB26P2TwSOtafjU
         1+4GPJqSHMD1N1G89ZtaqUaiyfp1Wln/G/HUX8qjx/UgnRV2vUS/orsE4OEf1E6uOPj7
         bAaWUDpqs9qkYUW4zjMwIAmSfnkIKN9pSRjKSykjmGKUrRjJ2Q5TCt3osk/ji/BD9EE7
         fN+WcgkYIHKu7f8f3hxju3wMvxK/m6tpSBcrhzXPNZ7NTqszP+VLdpJNIJRv57JJtlPf
         jeBTTPxwMiaKiJeziEvyZ80irNBWY6/1zdpG5zzJLOnm2Grv10eXfbCZJBQQtISY3MVj
         4/1g==
X-Forwarded-Encrypted: i=1; AJvYcCVAlU7RHA6jpplFIjt0oPqWKuT9KoXT8+8vT/ZN26XjKaKserPkROZ/4JZPH7jsEbHnpQ5HYpl9A2rgbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YybHPUwgY4QuJpwT6tXqjp9nPIM2U8MeOokBweJwILyjsbWDzoY
	pMCSYghym+6e+JFQSeKqc4D96L4M1z/1FTMRYFqitpoG0lyGTpa60lxrtmRNHdSRTB8=
X-Gm-Gg: ASbGnctBMpMlXlIJdjSWpzSQv5y3aLdbNIaHf21wRA7Ulds4KcBDw/oxtsH8QIFDpgN
	rtvJsDGSlV+NWga+MNCTUKszSPNjEF+rYWqrddcp4VO5gbGb3dCY0P3jTTvnXWUVXytHA3SCmlJ
	a8A6qK52qWhbv7lPs38tGHQ+zkbjh4y0c7SpJ8pfarhuPpa/GtCzImRwzBNbDiysQBWwI0SgWjL
	xEijC4huVMZXLvnHCe69JsZodXLKiZ8yy0JVKtrecLpO/7GWSEeiK80US43aHjl/XvsSDAMimed
	ccyPK2U0JLKpQE4Nn01GYcTMHPzMGL2B8s75o+XIP/iMUr9QLmmisGWiRkkDaHKJi9lXsAy7BML
	58pK9yKwn6h8p/tGRQD8iZ2HATwKAGHF+7URi/XQchU45kvv3duBVHiVF2Bw9wpVGTUtUY251r+
	PN0c/EoaQtbWL5uHkagKOATLsaXTG30DLH+gEHu17dTOoFI/Wrn8FFX7EghXT6rz13lAM=
X-Google-Smtp-Source: AGHT+IGkZ6+GeFJQTzXCmHptwwr4bo+TRjYBptncrFFbipQ1Aojn7DOqu6C8j1sCaiyxrTrPkDJUeQ==
X-Received: by 2002:a05:600c:a4a:b0:471:672:3486 with SMTP id 5b1f17b1804b1-471067234b4mr23258485e9.15.1760557956297;
        Wed, 15 Oct 2025 12:52:36 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47101c2359fsm48647285e9.11.2025.10.15.12.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 12:52:35 -0700 (PDT)
Message-ID: <aae11951-35c2-48f8-b919-e32393279c79@linaro.org>
Date: Wed, 15 Oct 2025 20:52:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Use a macro to specify the initial
 buffer count
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20251014-use-marco-to-denote-image-buffer-number-v1-1-f782e4cc622d@oss.qualcomm.com>
 <62da6efb-24d0-4a6b-9a52-c8f981f09d30@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <62da6efb-24d0-4a6b-9a52-c8f981f09d30@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2025 20:22, Vladimir Zapolskiy wrote:
> On 10/15/25 05:42, Hangxiang Ma wrote:
>> Replace the hardcoded buffer count value with a macro to enable
>> operating on these buffers elsewhere in the CAMSS driver based on this
>> count. Some of the hardware architectures require deferring the AUP and
>> REG update until after the CSID configuration and this macro is expected
>> to be useful in such scenarios.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>> This change use a global macro to specify the initial buffer count. It
>> meets the requirement that some hardware architectures need to defer the
>> AUP and REG update to CSID configuration stage.
> 
> Both the commit message and the explanation above brings no clarity on
> the necessity of this change at all.

I don't agree. Removing a hard-coded value for a define is an obviously 
correct change.

> This is a dangling useless commit, if you'd like to connect it to
> something meaningful, please include it into a series.

No. It is fine as is.

---
bod

