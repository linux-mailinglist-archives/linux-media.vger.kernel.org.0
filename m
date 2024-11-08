Return-Path: <linux-media+bounces-21149-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6BE9C1C60
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 12:44:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 099AB1C22EB6
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 11:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2999C1E5721;
	Fri,  8 Nov 2024 11:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d3lAuRG6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAD01E4937
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 11:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731066236; cv=none; b=CUuXFo2qvLJG08ZjD7hkBbmbF1y5IoxNZ45J6Hx5ud/iGVFPwmYPxAW3GqaJZJa8+NnUlDNETpGGlhpBoEifRvHp18jOYTY6R1xc/vYqJ+0UdgxF10xJOtQr/mXq0ZDv1Xfj0M36OCKrYYhodMIPZ6uNt4tnQx2aqLq3BNHhYpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731066236; c=relaxed/simple;
	bh=qjv8Nskk+avwjBuYyWopHdeHY0bXMOaLNpB/xYD+XcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qVdP/UJX1elGEBZZeFpMPJTcY7CkmoHMKg66PZohxi94DZ1fpmgomhsjJbumy922JDiQcY0pBMlMTwU2sHleZf7TmQJtViBIROchqkd5unXkrpeWkdeCfGdpEgyqMGIAVUPi+RR9eBS10nKIdH1c4OF+tSn6y+fKZ2gmPh4POPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d3lAuRG6; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d473c4bb6so1694696f8f.3
        for <linux-media@vger.kernel.org>; Fri, 08 Nov 2024 03:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731066232; x=1731671032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ouVSbkAT3+S3WMSHYg6HVwCj00MU4w8dzA4pzxSauU=;
        b=d3lAuRG6hA9xd+PYJBznZkyI1cz/xYM1tqJkqaJdCHlr8K39DYX0opc9h+xQQ373nH
         qLotlvCaW2g2YuAUHs5sB8eeP2kk0Xqy9hAA91vII5yTn+/wHM52tr0Gm2xd+Hb51YhL
         b8Yo1U+ChMlJh3aHOW3zV3LPsWbWdb55F/vpVlyGtAJn16evmRd63aKDw1JWFoUJsRoG
         tQVK/p7qJyrUzcaDIcT/6teccvBFW6tUTxBEQpxzKn6S2veyjmaagP+/SuDQ0QsQ/zai
         QIWdV8znnMWQF6wKtV/NXtOSUGg0wLhBA3hq7RA4k+glwkKvEJrEAuTHaHeQoPXOE6SL
         0lgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731066232; x=1731671032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ouVSbkAT3+S3WMSHYg6HVwCj00MU4w8dzA4pzxSauU=;
        b=miXUFHl2OS43X1HdHfR/wk3mDKElDRoyeqs5KeHa2BXfFbSpKnqFHUnufE2ZJwc3Ol
         /jabY4hcXeo4dEbOYu23ouFo6iRwgpD2Dz272MNYGecJRpyd357Nug8ECmpgVO0BVaV0
         1+yvHg7QhIOc7i8iNhMCpf5L8RyOJU6/a2EpPQgwJYRRzqU0n7fbXkgUapnvSWbaoYYc
         sNP4ZdX9WVf+Jq9RnbF3GTbue5bfLqH9WBfPVL6QRubV5ysjspPmb0cuQeH96wCD3VcD
         MssL0gxpWRuhhdB4Omz9bn/A0ulvGzPeKSbT5NQvaf0OQDtDVlXAT1Oa7ME6qu9R0ObV
         E49Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEb4qvkMEPBOEsN5pDmtzgo2wtlQWVHvpkmskn7IzRE7KNeqIhQ2VXHK7nc4P1Z/diBfab+ifL1Q8M6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWCyPzL5T6slZY3LjmY9xDPjhsRAiuBzIXl+8zdXaAECLkut0h
	UdltN1KxwRgY3DiKN66S7CKX6KfJI3cM5CYT0bsMSJhH+g0i0pZiijgjnMvqkuE=
X-Google-Smtp-Source: AGHT+IHenYE2IrQEIw1RwXn2xALrnPWJbFU0VRWzYGh03YSwh3hgPhVUGtDNitZVrXDo/IEmoPy9YA==
X-Received: by 2002:a05:6000:1541:b0:37d:2ea4:bfcc with SMTP id ffacd0b85a97d-381f186bc9bmr2308261f8f.13.1731066232510;
        Fri, 08 Nov 2024 03:43:52 -0800 (PST)
Received: from [172.16.24.72] ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b05e5871sm60742135e9.37.2024.11.08.03.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 03:43:52 -0800 (PST)
Message-ID: <37982a05-2057-45f4-923e-7562c683706d@linaro.org>
Date: Fri, 8 Nov 2024 11:43:56 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: venus: hfi_parser: add check to avoid out of
 bound access
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
 <20241105-venus_oob-v1-1-8d4feedfe2bb@quicinc.com>
 <b2yvyaycylsxo2bmynlrqp3pzhge2tjvtvzhmpvon2lzyx3bb4@747g3erapcro>
 <81d6a054-e02a-7c98-0479-0e17076fabd7@quicinc.com>
 <ndlf4bsijb723cctkvd7hkwmo7plbzr3q2dhqc3tpyujbfcr3z@g4rvg5p7vhfs>
 <975f4ecd-2029-469a-8ecf-fbd6397547d4@linaro.org>
 <57544d01-a7c6-1ea6-d408-ffe1678e0b5e@quicinc.com>
 <ql6hftuo7udkqachofws6lcpwx7sbjakonoehm7zsh43kqndsf@rwmiwqngldn2>
 <781ea2fd-637f-b896-aad4-d70f43ad245c@quicinc.com>
 <oxbpd3tfemwci6aiv5gs6rleg6lmsuabvvccqibbqddczjklpi@aln6hfloqizo>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <oxbpd3tfemwci6aiv5gs6rleg6lmsuabvvccqibbqddczjklpi@aln6hfloqizo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2024 13:54, Dmitry Baryshkov wrote:
>>> I'd say, don't overwrite the array. Instead the driver should extend it
>>> with the new information.
>> That is exactly the existing patch is currently doing.
> _new_ information, not a copy of the existing information.

But is this _really_ new information or is it guarding from "malicious" 
additional messages ?

@Vikash is it even a valid use-case for firmware to send one set of 
capabilities and then send a new set ?

It seems to me this should only happen once when the firmware starts up 
- the firmware won't acquire any new abilities once it has enumerated 
its set to APSS.

So why is it valid to process an additional message at all ?

Shouldn't we instead be throwing away redundant updates either silently 
or with some kind of complaint ?

If there's no new data - then this is data we shouldn't bother processing.

If it is new data then surely it should be the _current_ and _only_ 
valid set of data.

And if the update is considered "invalid" then why _would_ we accept the 
update ?

I get we're fixing the OOB but I think we should be clear on the 
validity of the content of the packet.

---
bod

