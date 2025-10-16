Return-Path: <linux-media+bounces-44726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5722ABE32C9
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 13:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE7CE5870C8
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 11:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8418131A541;
	Thu, 16 Oct 2025 11:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A/M7Hfdp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269052E11C6
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 11:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760615414; cv=none; b=IiLaNfFVXIJ9buFUwULsJblZlngkA0D4MLNDjZKSkaeR9cITNYgqafIvCURN5CEFWT1YFSfIGdP9rKdh38RMvU21AlQ9WizOhuEUMLbyqf8F1l9grul2YLud5LfpVyTG/Y1orLIIYXglMnfcZ/MmztyM8Q+N9u156CRmsN9uqQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760615414; c=relaxed/simple;
	bh=N2WgTs/5T5fCBqZ4ODa1es3MMlQZNO1srOLrkvYjBhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Znw4jk9AhiP4whvlhIUuCGhwO6XoiBvB6UrCweqvae15xkBT+AuC0KXAsQqfSa1OE/v8kPJia/UttWDGtKPKFzLYjV4ohDQNSNPXt3LNo66Iscp0b4ujLz4YZXvttGEDwxHCfQCYRZy0pRLOMsgLJ7MJ6Zp891lTJnQKQNmvYyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A/M7Hfdp; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b3d80891c6cso334063866b.1
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 04:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760615411; x=1761220211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eEbqZZLSc+qwF2fltsWM8Kb5Qy0LiCcBgh/Rt+CAz50=;
        b=A/M7HfdpMMCcgHIQsnEoPSfDOLdfL2GtalxzoU4elXCRSNPtciJDaOchf3uzyYuXcJ
         9Q4RSi1JFIorxdpZeYjTRVsdT0tcX05KZw+qyCLCv+nilTnDS/hT3FRP82qBY3mBDRKh
         Td8JdQ1ZybSR/jLzCJ8SL2SI2rDEIb8sfmEXQ4IdtTBVH9uGJZ8douDR68l1XUiNX3aV
         KZmfuDi+SieOsm4rcmakS9CXSF9sCjmkVvKPAkUTMmnqHZRKDC/U34MQbZqI96kAVwLI
         Xai91kaKVbgD0qcn97ay/54xnuYEaNUrAagD5uCt67eOQBADkZjAlZoy50gWhq5IteWl
         2JYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760615411; x=1761220211;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eEbqZZLSc+qwF2fltsWM8Kb5Qy0LiCcBgh/Rt+CAz50=;
        b=kUEEMvXXsOYcepbSCXmDXRfRgqJafo/M0h0oNOO0+5LYRkX+x9az4WTugauPeV3z7o
         TDzpP9vKU4ejj5qVgDMaYTlS/hPXGVec6KiZfXt9wDCCQ/9peL499G6RyNVYfxZcKi7G
         ZViQ9rc3aLW3L3Xg2etdPTwUvlXXs4QUW9D6F1XdVlG1hiS85Wpr/jLL+WfmfvJ5I7tH
         rJZeDhgbfywlYJcSm7GXHghsZPpaEbsMnWHP+q9TJGh1GWNFGLBfjEaftTXjc0TDzwzD
         EBvqoazvJSWjcZlYma18PNlA/jf5/aZv7bpiFGSGg1r/Etjws2miVZjU6snhRRDbwKhc
         51Wg==
X-Forwarded-Encrypted: i=1; AJvYcCXo/wbBODn5xZ/5kXXcvqD9bA8Seo/FRIsZwKs7/E06f7FB02jll2ivf2syWKbaVL8R+yDl/Y9R+a7XLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYo54eB7wAV3uFK4BC3PQAnNek0Hq6ErSdO6XmtBNaok5ioSNJ
	Lsf/Ixh010YUDNbKp3/3iYeWVa5LWril8uYagkEud85GcLttdsS/op/l2ul1UoKESrw=
X-Gm-Gg: ASbGncv65sp1vsERdIpEXuOQAt5zDDs3PFxEwhTLZlX0/1g1d9yt5YohvOkk5Hq8rnt
	BzurgsWd8rpNFsL5EWvF9Xp/EOLXOfzZAlSXuO9W3aGiBm/48K73alce/9vmw/HkDrwDuEzEKCQ
	4OCacVa9NyLB2Mrs8Ec8eFNFbccYcp/LAhxK6bahDsda05KlHUdCeFMXAdG7r9/tTXbpMqK67CV
	PXEJ0GbAaoTeERnbkRaeujAnK0C/CCUvxWUdiFiexLh9lJ8Ic/33u6Ek7UZvRZCMBfSEG9+1Msw
	zVSHDgmz/cEUZJ+PrXb5qbi0oO0Xv5t1rXkRNVtJgSNyYkVKb+XDM1Bb98RjyQWhU9uj/qJl31l
	O/FwEu1HSFyCrvGlH7VqxnVen8on3E2UBddxkbHKwukufiQnh99uIwUZ0iuKGetCRVIqc22+Sgc
	uQC1pZ7PnD5ipn142AiLUvtZ5uWj+IJpRs1Ntnvf5Icwgh/g==
X-Google-Smtp-Source: AGHT+IEW+wnaN71oLRojt+JZzgYMxYoG0XidbWJwYAOsWETEDggOgPEoiox0/+MITAms2gR7IjA89A==
X-Received: by 2002:a17:907:96a7:b0:b2f:4970:8720 with SMTP id a640c23a62f3a-b6052a71b33mr472940466b.8.1760615411486;
        Thu, 16 Oct 2025 04:50:11 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cb965c35csm489533266b.8.2025.10.16.04.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 04:50:11 -0700 (PDT)
Message-ID: <c4fd6bfc-cc9a-4f37-99b3-f36466691a1e@linaro.org>
Date: Thu, 16 Oct 2025 12:50:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Enable setting the rate to
 camnoc_rt_axi clock
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com>
 <9984bc23-05ef-4d46-aeb8-feb0a18e5762@kernel.org>
 <bc0caeb8-c99b-4bef-a69e-5ce433e6b890@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <bc0caeb8-c99b-4bef-a69e-5ce433e6b890@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2025 12:30, Konrad Dybcio wrote:
> On 10/16/25 7:54 AM, Krzysztof Kozlowski wrote:
>> On 15/10/2025 04:43, Hangxiang Ma wrote:
>>> On hardware architectures where a single CAMNOC module is split into
>>> two, one for each of the real time (RT) and non real time (NRT) modules
>>> within camera sub system, processing VFE output over the AXI bus
>>> requires enabling and setting the appropriate clock rate for the RT
>>> CAMNOC. This change lays the groundwork for supporting such
>>> configurations.
>>>
>>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>> ---
>>> This change lays the groundwork for supporting configurations for
>>> hardware architectures that split a single CAMNOC module into real time
>>> (RT) and non real time (NRT).
>>> ---
>>>   drivers/media/platform/qcom/camss/camss-vfe.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>>> index ee08dbbddf88..09b29ba383f1 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>>> @@ -914,7 +914,8 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
>>>   	return (!strcmp(clock->name, vfe_name) ||
>>>   		!strcmp(clock->name, vfe_lite_name) ||
>>>   		!strcmp(clock->name, "vfe_lite") ||
>>> -		!strcmp(clock->name, "camnoc_axi"));
>>> +		!strcmp(clock->name, "camnoc_axi") ||
>>> +		!strcmp(clock->name, "camnoc_rt_axi"));
>>
>> Just use camnoc_axi for both. Look at your bindings - why do you keep
>> different names for same signal?
> 
> I think the correct question to ask is:
> 
> Is camnoc_axi going to represent the other (NRT) clock in this
> setting?
> 
> Konrad

I'm - perhaps naively - assuming this clock really is required ... and 
that both will be needed concurrently.

---
bod

