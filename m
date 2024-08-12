Return-Path: <linux-media+bounces-16129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6831094EA36
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 11:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A02E61C2100E
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 09:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF5E16E883;
	Mon, 12 Aug 2024 09:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/6J2eS1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5661C3E;
	Mon, 12 Aug 2024 09:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723455978; cv=none; b=KhUqrGsOCJ3H198l+ra9o3AX1q+mJSQH/AbI7wKo/OccymXvXKKMwk+1RuPJYAtuvUeKr1BZIWMdMBWQQ5pnrtB8a4dodUBhu7KO6jQCWjxJ+2dqVCpBy+AQBOHuy3rT3OC0ABYHzS51jBirUoLmRJ4PkDV1m2XeFJyjmkJnZ8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723455978; c=relaxed/simple;
	bh=yOE2mc5cU3Ike/C/o6AZ6ex5/MryW/D7i3oyQt06Vng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i4qVVBtGkHzjIHQmYbWZLYtq+c1mdKGKUD9MD1dUippy1rMM4d22wpuQf913afCHq1KqqNRTDihP8bOA6agceMj4r3NdOGVy4vllVOGTAFmgHsrkxthlGL6hWKQ3XzJEkVdbgfo/16FvxDI71JScGZiG6CqiIS+l/XRmA2jtKZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/6J2eS1; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fd69e44596so27895125ad.1;
        Mon, 12 Aug 2024 02:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723455976; x=1724060776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MUxh3YwlPzmy+PcO3DHdAzw/4G592svoiNiI2B6pc4k=;
        b=k/6J2eS1Iwvl+F7eb875p59kZIqEfpKxL647wuqs++U3OoH2hRgAXyU/n1GABRBgfp
         AusbpIChRJUuRCao/HTSHV44RmSrOq3nlyxZBO2KxCiGSfYiB5ojutKJn77lXxiMLz2+
         zzO5Yux8K1GvTm/EbbpJcdFY0SHfBkVgzYq6yh6dWMmUbdQ7bDwdiFK/EfafKl0iA8ok
         X0fOBLClybm8b12j1zywAFeeJdMn84decshe76xKv4NjHRghlDYcU2zlyYiOz17FgC+a
         AK5jO5IPoU5FAm7fuC3D7kwtn6iIMIfMUbpx9mND53ljMgQ5wi7w/HoTZH2G9jlg7xH5
         73EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723455976; x=1724060776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MUxh3YwlPzmy+PcO3DHdAzw/4G592svoiNiI2B6pc4k=;
        b=XlRTmT7T1UvmGLPzKH6Kv/KbCxHCZzeJLXMSpVYLYIanUIdZN+xjELBFKQvpO7bQyi
         lvHIhB7m+nXeyVuBxdRALk8RV0wRYX6eJ1O17X3MofWXNlpZTdw+01h0p9VmR3i+nz3h
         +xkPpwgBYooPZt40BCeKawzDWThIS8ZR7riIPxKH2PUNxec5+soWUCNwbHSRlVkzvDlx
         pjhktPh5UWa1EgCdFH5w4VzVo7JLQod4rNBPQuRQLlB5txjVzxbOjMndwR19SygTUt50
         V+x7Np7HL1RhMondRfTDEliXxuVn57IfLiXroov5PulFi9jengJJlbtO9K3kQ6cB86eU
         GM+A==
X-Forwarded-Encrypted: i=1; AJvYcCXtyUbofISxU0Xlmwj9VNC0t35GqxoLijyGG8SlY/25790CtJHhjmQMF7hukhweYvrrusVxehRfxDPH8cEQnip4ij3UvgCVZtilAQdOPyPZ55SSv09yJEXN6KmCoH9fHvHEjUSeJ3ucADwOzN7xRqvAX1SDETRmyoVh+/MKIvPgKwTQrc8q
X-Gm-Message-State: AOJu0YwrAgIdxp7XXxUxR6XZAvzw83loFWQM4tVNVZHEOsWV0EgjjglG
	xpSjoMFgnlfFfYwkRJJSetFvBNpm6sqbouBQ/+laLtlUNKMFluKq
X-Google-Smtp-Source: AGHT+IEhL4arKcRb/xw7OVPVg6BiQe2H2AJSFtWsVZ5BkuWfnuoclUhY2oj8Zy9Gy/7Hw/+kdf10Dg==
X-Received: by 2002:a17:902:ea01:b0:1fb:8e29:621f with SMTP id d9443c01a7336-200ae567dd3mr136423225ad.16.1723455976170;
        Mon, 12 Aug 2024 02:46:16 -0700 (PDT)
Received: from [172.19.1.53] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bb9b17dasm34061725ad.137.2024.08.12.02.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 02:46:15 -0700 (PDT)
Message-ID: <b9f9cbae-c4d8-420e-865b-e0f48dfa9667@gmail.com>
Date: Mon, 12 Aug 2024 17:46:12 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mtd: rawnand: nuvoton: add new driver for the Nuvoton
 MA35 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240812030045.20831-1-hpchen0nvt@gmail.com>
 <20240812030045.20831-3-hpchen0nvt@gmail.com>
 <06d627d5-947c-4da4-826a-76033386b575@kernel.org>
 <3b7b629e-0085-4821-932c-e89faad15c1a@gmail.com>
 <33ae3c93-81cb-491c-a5b3-239c7c413eb3@kernel.org>
Content-Language: en-US
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
In-Reply-To: <33ae3c93-81cb-491c-a5b3-239c7c413eb3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Krzysztof,

Thank you for your reply.




On 2024/8/12 下午 05:13, Krzysztof Kozlowski wrote:
> On 12/08/2024 11:10, Hui-Ping Chen wrote:
>>>> +
>>>> +/* NAND-type Flash BCH Error Data Registers */
>>>> +#define MA35_NFI_REG_NANDECCED0	(0x960)
>>>> +#define MA35_NFI_REG_NANDECCED1	(0x964)
>>>> +#define MA35_NFI_REG_NANDECCED2	(0x968)
>>>> +#define MA35_NFI_REG_NANDECCED3	(0x96C)
>>>> +#define MA35_NFI_REG_NANDECCED4	(0x970)
>>>> +#define MA35_NFI_REG_NANDECCED5	(0x974)
>>>> +
>>>> +/* NAND-type Flash Redundant Area Registers */
>>>> +#define MA35_NFI_REG_NANDRA0		(0xA00)
>>>> +#define MA35_NFI_REG_NANDRA1		(0xA04)
>>>> +
>>>> +#define SKIP_SPARE_BYTES	4
>>>> +
>>>> +/* BCH algorithm related constants and variables */
>>>> +enum {
>>>> +	eBCH_NONE = 0,
>>>> +	eBCH_T8,
>>>> +	eBCH_T12,
>>>> +	eBCH_T24,
>>>> +	eBCH_CNT
>>>> +} E_BCHALGORITHM;
>>>> +
>>>> +static const int g_i32BCHAlgoIdx[eBCH_CNT] = {BCH_T8, BCH_T8, BCH_T12, BCH_T24};
>>>> +static struct nand_ecclayout_user ma35_nand_oob;
>>> Why this is file-scope?
>> I will remove the `static`.
> No, why this cannot be instance dependent? Quick looks says it could.
> And should.

I will add this variable to the ma35_nand_info structure.



>
> Best regards,
> Krzysztof


Best regards,

Hui-Ping Chen



