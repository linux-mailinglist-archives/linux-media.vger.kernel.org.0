Return-Path: <linux-media+bounces-42212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F212B5177B
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 14:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E36C3BE3B1
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 12:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D43431D736;
	Wed, 10 Sep 2025 12:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JQ9SZMpE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAA931C576
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 12:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757509149; cv=none; b=dxUD3baO+6Dz11nIjVYqAJzLtpX4BV5QFRJIF3nxI6CIvqUmd3kF0ksRm/9VI1bv+9FXh0Cf7+LftY8Yg8ChTw4Z3Lt8a9SVB+lJyOw6Zroj9Ac/QfjfElG3sDRrJd3YUhZxuIisY4EFokt47fh3oo7SiU78X6VZ6i3t5/lGG0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757509149; c=relaxed/simple;
	bh=/IAl3c3EYOoYwYw+XjY3kagWIsE4eP8CBIYYAfbZtn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nC52PTrT6kJyXFhLvMfcYfOlOsRoXzFoUM6mK7MkblDC8ClTQ8e3bfc8aB8v9lTYb5mFa27dkDt8hF/VC6fCOFeCSZ0fNGZVk8yL7FqH6MWVOoBVWJJClJkZwwYKRQMh7cKdup3ZrMhmyjo1jfEx9pn2Mv/anASY9aakk6W8zD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JQ9SZMpE; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b0411b83aafso1105194766b.1
        for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 05:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757509146; x=1758113946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MB4gaimWoDJk3NhrrABBopa5Fo6F6OnWDi3KrUcJvnA=;
        b=JQ9SZMpEsb/SUDDlJgz2IzBTIYmG1dwNFYDd3EPvv5OOpA9cW45y58zBakr0ZThuk0
         vCJ4mouOrs686mSRSpwv8gUj2o7j0Xy9ImyHl8WMlvDt8ouGdlZRHl2o5p46LeD3G/AY
         5S6jThsvX84LhYUXZdhpZhACT8csSqv6Rcr5qr6dkPgASzhGjWEZ+HB9SdXwlNcwMUIU
         ocb+AaPmkm3XujUARPBu0+7XskWf5sOYbTTpO4ZWwP95tHLHduLE5mJh9QZu8I+KVldH
         b9WnsIIbw2+Nli2bL19clAzenQxrMmtL4OFthZ+hnsdXt7mVdTV/lApdwLY5HHytSWms
         XssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757509146; x=1758113946;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MB4gaimWoDJk3NhrrABBopa5Fo6F6OnWDi3KrUcJvnA=;
        b=E9gTBpL7s4UZLD4pHCJ9kDopushYcsY5YG1N1zwd3t9hwl479sinZ62+mXqMZ4BxYf
         wjPToYqWniteiqSjSn2tMs6UQuTECvn10GGkYsozfR49+VZypgYmF2mO/iPfF8DJPKHl
         l4JYGZTW8F4UPa75zZRslvYefxQ/IrdG+OkZYuD8wbU2znF1XcSgcymOCimaiGCLWXAi
         jUbzazsf2tL5jbWCHxZLGHp0WDqxAcd79Tm/xr7S3s1tW0icz9quG8poJu+O/aq9WuFH
         CdPUXUMkZghpddDdvkNKIsFEB5Tytd4/VHNbmCF1B7/NTkLA9MaszEv+6zEhMtnd5ubu
         ZBUw==
X-Forwarded-Encrypted: i=1; AJvYcCXu7Fo8C3yWc6bu0Gv2hMNgj5ZtiE/T7D1SPlPxg8wgFZRBL8y2elUf49aVxGFRCs1l2d4iG5rmUdoIfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaItWA+e9qIceku7UHp41SM0ebIMPGDvmcZcuoRaWXBmgomkEE
	js6bBvifM9KNEKJ1QtrxZJzfWX05yJxQHsVQ32UD5QUNmd3Ay0nYaAqj7FjRp1ihNU8=
X-Gm-Gg: ASbGncsPAKA9kuH2e6YHI8J6F8tVy/Eo/ov9ol8ZVJW0D2W7yERdRwnDS6H4yZ0btmP
	qNrQD7G0CwLCM+iqwvs0ffRU2FZIa5WL35WToymvPUL+CT3V5MNXpjRn2bWlwt0/ah69kPupO52
	GEsonrp5fJsnEMjzD8tHgqVZHwyQuuXCsWNKZdqeSdAvYd4rtiZ0Zz9hj/P4gtDtdEaK4vM9UUu
	Bhgb+x5/5HJr11NE0xyjjeV0uF3NGZdSFYvxjCtOKnUvXpChWQLBuR3+wOvd4wpJUHbez73XP2E
	X2Gio7Muce9ndZKvNrzUYK/h0L+8uPl/wme8l/ztCjl3QVEbQzNeptxL/ove+jj61zOExuDD8uv
	pGwEG/roycWJwaoq285TdwyOju5n7NGd+GzepEPdXIMyCD6L6EV5ddM83xCfHqxYW9a63b5u0Ny
	vF05pr/sO9HXgzpT1b6N9dqJpFarunkeg/Q/Ayr7Pj
X-Google-Smtp-Source: AGHT+IHo42Ln/UQnJWBf+4snnXCY6UqBRGuJxVk3ykkRWA2Up2JqPWEeup1W5Piw4s3VUCTN4TNccw==
X-Received: by 2002:a17:907:3d90:b0:af9:eace:8a52 with SMTP id a640c23a62f3a-b04b1712177mr1353371566b.50.1757509146401;
        Wed, 10 Sep 2025 05:59:06 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07830e613csm164708866b.46.2025.09.10.05.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 05:59:05 -0700 (PDT)
Message-ID: <8ea6406e-0312-4ecc-8527-3b3740c4c01c@linaro.org>
Date: Wed, 10 Sep 2025 13:59:03 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3.1] media: dt-bindings: Add qcom,qcs8300-camss
 compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
References: <20250813053724.232494-2-quic_vikramsa@quicinc.com>
 <20250910104915.1444669-1-quic_vikramsa@quicinc.com>
 <5a087d08-273e-4740-b47d-fc25be952ebd@kernel.org>
 <2a7bd0cd-a6c4-47c3-a6ca-f9d94c9b65ec@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <2a7bd0cd-a6c4-47c3-a6ca-f9d94c9b65ec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/2025 13:25, Konrad Dybcio wrote:
> On 9/10/25 1:38 PM, Krzysztof Kozlowski wrote:
>> On 10/09/2025 12:49, Vikram Sharma wrote:
>>> Add the compatible string "qcom,qcs8300-camss" to support the
>>> Camera Subsystem (CAMSS) on the Qualcomm QCS8300 platform.
>>>
>>> The QCS8300 platform provides:
>>> - 2 x VFE (version 690), each with 3 RDI
>>> - 5 x VFE Lite (version 690), each with 6 RDI
>>> - 2 x CSID (version 690)
>>> - 5 x CSID Lite (version 690)
>>> - 3 x CSIPHY (version 690)
>>> - 3 x TPG
>>>
>>> Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>>> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>>
>> Do not attach (thread) your patchsets to some other threads (unrelated
>> or older versions). This buries them deep in the mailbox and might
>> interfere with applying entire sets. See also:
>> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830
>>
>> Please version your patches correctly, e.g. use b4 or git format-patch
>> -vX, and add changelog in cover letter or under '---' of individual
>> patches describing changes from previous version.
>>
>> What is v3.1? How to compare it? Try yourself:
> 
> This is a weird invention that some media maintainers seem to promote..
> 
> As a b4 user, I would also like it to stop, as doing anything other than
> v(integer) will open the door for unlimited craziness
> 
> Konrad

This is from me, I asked Vikram for 3.1 instead of a whole new series.

Anyway the fix isn't this patch its 
20250909114241.840842-5-quic_vikramsa@quicinc.com

---
bod

