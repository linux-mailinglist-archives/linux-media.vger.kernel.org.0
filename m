Return-Path: <linux-media+bounces-42164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 857D9B511B6
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 10:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A52D84E37C7
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 08:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B354F3115A2;
	Wed, 10 Sep 2025 08:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bx1M4qmF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E44E31076B
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 08:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757493769; cv=none; b=Tdm0/mQc4YNCjsJjR/jpN9Y2BZSSEA9X3zdnYtMaTkmvAfBZ0ShRAHMEd4Ss/e2ffpuYnpjlU4nuuEM8vAxkv8Z8bID0wCaGPLTiT8pIKyO/K98j6Xt+ML3lq5MKppa4+V/hgr8x4b5CRYru4Rob5rLK0Say3DuRDsDAU8VA7Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757493769; c=relaxed/simple;
	bh=sI6ml4hTh+NeJSK15fW+krN1+UqokRd841kdomv2beQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sXNJVpa8OMXQAZCFbwGV1Wn0/N2OyWDIIsSZ9DFBeWJ8q56q22FRy4hk7aDAI2XpWJfyCfkGfEoheCQrjTldTc0hDcEuZ4wxLGlJlvQWe51gib43/DcpUvLpufssdgGGwDDL0al0CJF9y59QtdfzN4NtLgWIbrBjVaK5aviFeGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bx1M4qmF; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45dde353b47so19016585e9.3
        for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 01:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757493766; x=1758098566; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lquJ5PztwzuglOeRIwX9xUr/VMazVnds3G/8YT7Fvc4=;
        b=Bx1M4qmFf/fvaj3xSI0o53J5qtElAsxAMW1njKe6tJotp2Wb/bA4qKFPyEtv7gXFdj
         8N4jddmgJAxc9vNGVLYGK1UefzsF45pDTMRResB/tREqius0PgCZX40EZqfdXzvPc5uA
         l0f/6i4hCZqC7Xfqe4u2yQ4UEPurbbJYkDxtF96QC7e361+U+DurXtgYBBwg7E0mK9WO
         At9ECdgJOu2PLhWbvjhGxomW/tRoSr/5CvK5HOz45T54WwhH1utv8jA/Ygn9PjfgHkQj
         I5QQeLK1xYSZKCM9ECgV8CyJFI+79OTFB0FetDgbvylR1agpfuMZf0S23ra73H6uI/gF
         KdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757493766; x=1758098566;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lquJ5PztwzuglOeRIwX9xUr/VMazVnds3G/8YT7Fvc4=;
        b=o0hVgP9tOYIFKJhP/xJ4dMkoVhamyf/dLCfw+a2tcJc3K9xB46YoTGlGjSfhbIiPaa
         QrbNMO8b0Zj4hAwNQ6+VFbSh1IxRYFGnUat0gs8d0E70jqtQ4utMKhemN4dq53QsKwM2
         Ogdor8sAAQCnyp3zMugZ5V+8BBqwiImhHT2I3Ia/Q4oJhOscLcpSdinHy8zHqYl2yZdU
         h58zJwdH/tUsjsHoVtx3i4XddBI9k2Mc5sO5yyfFQ2azIZ3n5YjIwsE8GnzZXKwtnP8F
         kbirWLcnqQWZbqtoRIS1XJdlY5gODvIzOEpn3jVB659cDrfIU+NgnbWTkPFiS6ESd4WB
         kmnA==
X-Forwarded-Encrypted: i=1; AJvYcCU/SSYvlTL198S7P3jOX1Aw4UFl/G0uZieDRmKGYyvO877p1bC+CqwUxZSSFc+NUclDgys72qVvcKBDIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMXlJcqzPFjOLIGzKoG/c9vuE39cP3va5Hd1jVDgHkEWmvA4JD
	ZqyZo/yrKchw6Px7N1+LutrAK9+9Zb8SoIBx5OGqcgPzn5DH9/AkwEa0KoKMzhrtTmw=
X-Gm-Gg: ASbGncvvtG9c+YjAqDE/iI3MsCX1FkEGF47Dnh2s5ftNFjpQCy/9w7LqiWZwiCYrcT7
	ltYZfv1CDhReX/c/RjCDyzthFUCAQsoCsQc+p2+xd82bkXsiQxEHyER9v5lwrwS6KBwuokNG0BN
	4ur1aeQZRZZYHnL6in6P74qpMN/QnWOS96f8yvAYu/gdhYSz8hCHDNBqdXsEpYJwMzXMGwHK0zJ
	KGMk/rorCqdbmQhueBZLmmyx8hLvSzLfk2JO6g3zm4NG2dbmMntZJem0KdowOEoPYJBksn9md6L
	7NTXL8cfVw1eirU5gV5qiwXmcjfikx6ePMZ5dQrFrcc4xPbT2zZYGzJPguFrRpQ7miqHVFVgVJg
	/3rsVbSQ5Icwdqbo3KfuOtJhla+fR1i+YZrrdaNxmD9G6W30jfY0T1LjZnuaI1jvFY9UK36dTjr
	n3AO3sSV779zK9080FqB8=
X-Google-Smtp-Source: AGHT+IHVjNthO4SktB1Xz75HnDS8/BmjdCNmc8dzepzAh2MGw5GBwzE8aoUhNAen8jMgrcMcoay5OA==
X-Received: by 2002:a05:600c:474e:b0:456:1b6f:c888 with SMTP id 5b1f17b1804b1-45dddecd894mr125340515e9.23.1757493765680;
        Wed, 10 Sep 2025 01:42:45 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8247acbsm19112915e9.13.2025.09.10.01.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 01:42:45 -0700 (PDT)
Message-ID: <c7635e11-d606-4e65-b48e-d8c26ee7be1d@linaro.org>
Date: Wed, 10 Sep 2025 09:42:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] media: dt-bindings: Add qcom,qcs8300-camss
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
 <20250813053724.232494-2-quic_vikramsa@quicinc.com>
 <f1e3c3a9-9929-477a-b1ad-e485c059cbc2@linaro.org>
 <d16d40ab-8a35-4886-b11f-2eee15849e1c@quicinc.com>
 <8c1163ad-6e65-450b-ae44-c9a71a045333@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <8c1163ad-6e65-450b-ae44-c9a71a045333@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/2025 08:42, Krzysztof Kozlowski wrote:
> On 10/09/2025 09:26, Vikram Sharma wrote:
>>
>> On 9/10/2025 12:35 PM, Krzysztof Kozlowski wrote:
>>> On 13/08/2025 07:37, Vikram Sharma wrote:
>>>> Add the compatible string "qcom,qcs8300-camss" to support the
>>>> Camera Subsystem (CAMSS) on the Qualcomm QCS8300 platform.
>>>>
>>>> The QCS8300 platform provides:
>>>> - 2 x VFE (version 690), each with 3 RDI
>>>> - 5 x VFE Lite (version 690), each with 6 RDI
>>>> - 2 x CSID (version 690)
>>>> - 5 x CSID Lite (version 690)
>>>> - 3 x CSIPHY (version 690)
>>>> - 3 x TPG
>>>>
>>>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> ---
>>>>    .../bindings/media/qcom,qcs8300-camss.yaml    | 336 ++++++++++++++++++
>>>>    1 file changed, 336 insertions(+)
>>> So it turns out this code is wrong and you already sent fixes for it.
>>
>> Hi Krzysztof,
>> Thanks for your comments. These bindings are tested with TPG (Test Pattern Generator), As camera sensor testing was not possible at that point.
> 
> You cannot test bindings with TPG. It's impossible.
> 
>> This is because Monaco-evk kit was not ready which can be used to enable sensor.
>>
>> These Bindings are complete in its own, If someone want to use TPG.
> 
> No. You do not understand - they are not complete if you add new
> properties to them!
> 
> How bindings could be complete if you add now supplies!?!?
> 
>>
>> My latest update in these bindings are for camera sensor enablement which needs supplies too.
>>
>> Please let me know if this justification works to accept these bindings it its current form and add supplies as a separate patch.
> 
> NAK. Read writing bindings doc. Or internal docs.
> 
> Best regards,
> Krzysztof

@Vikram

Could you send an updated dt-bindings with the supplies included ASAP as 
a v4 of this series ?

The -supplies in your email here look fine

20250909114241.840842-5-quic_vikramsa@quicinc.com

Otherwise we will have to drop this binding and the associated driver 
changes.

---
bod

