Return-Path: <linux-media+bounces-16128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D01994EA10
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 11:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F6911C2100E
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 09:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C91716DEDB;
	Mon, 12 Aug 2024 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+ItNqJz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189BB16DC1F;
	Mon, 12 Aug 2024 09:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723455604; cv=none; b=iojISm006Tq6c3E2Q1oAVrQcxORdfh7aGWlR4IAVRHhX15VPQ+TJnWPFQh2tkAQLSkKqJRiV3P79uVNch6KPndLzpyUht92NbgzLatJ5Xr1rPsZA8kLANbCrC4FWqWVh1Cph0Uj5OB6RtvOwVTkHHsE4cBuyqEI4lm5xR4aUkEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723455604; c=relaxed/simple;
	bh=ArrySmWgDNdiqjHMG4mdAvCkv8roGfqS6pl8kC2NcbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WPfbmy4RLpsq8QfS84gzDxNQGLjmBID2azNF+LoNz13ShI7yJHKpk1wsC9yqQBK7qbRYbG79n544OitspKPgj4tszvhkHO9hAFdRPJbNVvgyyEob8Qts5sQmOpZCCfpm3VUllcuG9Y0F1/gs3rGPiEis6mwn1mNaaNWxwJn0/aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+ItNqJz; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7aa7703cf08so2871601a12.2;
        Mon, 12 Aug 2024 02:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723455602; x=1724060402; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OztDY7ZPfTGf5Muvo37QHTCCUOwm+trCdPseFsE1yRA=;
        b=H+ItNqJz09PpQaNjn3kh2DDXKQTuLxURe/r0suXSDP43BprSvhbfKFPJUDORfRHg56
         1V6e8joSC0/0qlKpfwKbeG4Q/0ipuLp7NXPFLS/Zl9/XpS/j8D5OEcy8vs59v3PSHy6O
         PFd+pDY1z74G0K4omCziD6DS+mdzVkLb91820sCYpMp7n58lC0WPFh6uQ+meDO+Eb2rb
         /0zDXphdlaJEpAKw7uPar3EleN8jCbeAJXhS+HYM7uuGbTwQfNOUMgQBu60P0NAfHyoD
         VLRKHoynggit8uEgJm/W0qIm6VHPAag4aHL7Ip8NDRf4wJnU0Ff+8P5oLwHljkyrjmfm
         YFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723455602; x=1724060402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OztDY7ZPfTGf5Muvo37QHTCCUOwm+trCdPseFsE1yRA=;
        b=SXLnhAaEHjsQXE/YGvJh8TJHnGTxGLg0uBPoA7+dHNxJ2Nmj2avC/DxUS+P1W8xMey
         vItCCoEDx3XR0I8Ev/gYud5HWLQ3eg1oLZXNr+1gDjd1vPuqmRfaNcbO/Xoq79ZI0QoA
         +LP5Ewut7ST0pQK8yZUbjMk88d/XAhvDCYdXrQppERkNe/bkMhSQsYIudMXey7VV0SCg
         RYuTszrfE4AHa0u0d+wRXwjKGwK/ob/q2zDwif0azWiTZHb2i5v0N2GLL5rQX/Ib7ufT
         RWX9qvuFnSYo0WFxC68paBL5Kw7h2x6NWXM1lOFubpUoqV7SabieuctMhZVK2unn0iU1
         rGng==
X-Forwarded-Encrypted: i=1; AJvYcCVG/e4B2dZ89IEATWKEp7EPo2M9esUKuOjYUnNq7UmPfksvuD34hVYMqWewkCKCPyeExNJ2nbyuwM+LmT+M8MY3fsd9twHMSVFS68cPZQCTA7z+Q2qt/IAatdNhTBs6wJtPR9V1+gDLATIm9RROL22wYcPEBYHJamZQTtj6a2Stri90gHDp
X-Gm-Message-State: AOJu0Yz/P6S7Q7liUNh2KSOITQPULvgMwclgRD0Yw6/Hl4yy8Qg9ZK5v
	ZNljhpu/KLlDf8BBdYaIHDbTkZygKejMqmLz+Gh16TsoUIf5yX3x
X-Google-Smtp-Source: AGHT+IF8GalHrE+IH6YmoY+AWa/Rdr4SG6ZeFor8rn3B92ikuRnTgV5mAn7M3QFJgEWdF8wkCr2t8g==
X-Received: by 2002:a05:6a20:d817:b0:1c4:2134:dd54 with SMTP id adf61e73a8af0-1c8a0137366mr13333355637.45.1723455602341;
        Mon, 12 Aug 2024 02:40:02 -0700 (PDT)
Received: from [172.19.1.53] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bbb49fb7sm33981255ad.293.2024.08.12.02.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 02:40:02 -0700 (PDT)
Message-ID: <26c61825-3488-4a9c-9426-b804c1e00b07@gmail.com>
Date: Mon, 12 Aug 2024 17:39:58 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new
 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240812030045.20831-1-hpchen0nvt@gmail.com>
 <20240812030045.20831-2-hpchen0nvt@gmail.com>
 <7a8b9bdf-f4df-4da0-83ca-157175817e99@kernel.org>
 <203578df-11a6-425a-b2be-cc09dae62f8f@gmail.com>
 <1f823600-68c4-418f-b2bf-6d5d64a1ee56@kernel.org>
Content-Language: en-US
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
In-Reply-To: <1f823600-68c4-418f-b2bf-6d5d64a1ee56@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Krzysztof,

Thank you for your reply.



On 2024/8/12 下午 05:12, Krzysztof Kozlowski wrote:
> On 12/08/2024 11:02, Hui-Ping Chen wrote:
>>
>>>> +
>>>> +      nand-ecc-step-size:
>>>> +        enum: [512, 1024]
>>> No defaults? So is this required?
>> This is required, but I will also add a default.
> If this is required and should be in required: list. Default does not
> make sense then... it contradicts the point of being required.

I will add it to the required list.



>>
>>
>>>> +
>>>> +      nand-ecc-strength:
>>>> +        enum: [8, 12, 24]
>>> No defaults? So is this required?
>> This is required, but I will also add a default.
> Ditto

I will add it to the required list.



>
> Best regards,
> Krzysztof


Best regards,

Hui-Ping Chen



