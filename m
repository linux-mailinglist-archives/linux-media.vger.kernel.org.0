Return-Path: <linux-media+bounces-16993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 021C79621E5
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 09:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75FA31F26169
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 07:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCEF815B107;
	Wed, 28 Aug 2024 07:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeVygJH+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27EE157481;
	Wed, 28 Aug 2024 07:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724831859; cv=none; b=SL6fBOZ0Tl8W7RocXx5emEIsP7AO4ACttZwArHnMlGi3GI+BzgxM+3XpHpxbzvb3VmtUtmDx85tAP6HjgAAkERk2qKTYqqy3eziMpuTdzN8rpn5ElblkaaI+Wqc0ffTYOty6r0cqCxV3TwhirN3SoU2lMOe9DGluZAHcXrphIf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724831859; c=relaxed/simple;
	bh=K05FAUrcORe/ubjhrV0cVi3teIVNufzeXBPHAZQoR8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HFScB3Gbovlr2r0GUm9kA51eUFfUtvvP9wuRfKsH3rE8AkSZYXv6lobfyuRd8bA60sgDfY+vWZGF7Zd5yOfVQzlIvTqyFJOtYtcorpWDFH+QKzxQcHoKKBPUkToKTaanX2j6Le8UnXVWMozhG7IAA0G+H/b6aULdCbP58EmxqVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeVygJH+; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2d3dacaccfaso4316733a91.0;
        Wed, 28 Aug 2024 00:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724831857; x=1725436657; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GfqHwI8DhzI+oBVoPKsWjmnloLfBOCfpckFVyP5GIik=;
        b=aeVygJH+Fj9VOSSGpY6cVL1004ZD2yu6hl2B72riU+DkPFmZGxtfj2Ptx4Je4YcORO
         fyRhv2xiN7YpAQrQ5Jl2yIN2BvmX/PdW/OLYCdY8dHPXLg14zg7rKtWkCcGdcCG5jljt
         pGVz9jlbCzMsKYIS92/PErODlg+f0Mmac08iYYI6gDeUpfzYWCGiZb3qdHt3awEa9fK1
         X3V6cQ4aosqOjotNlkCNL9kOvi/Z4HTGbxueFmBQN5o8A+IViyZagx88wShGYjLn/gli
         NYcWvvd5Q5VqwVXEXlSs5U/IjIHMN3teM/IO/lqd6V6TWvZKrhKtRLo22b2J1PTh4XIB
         CTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724831857; x=1725436657;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GfqHwI8DhzI+oBVoPKsWjmnloLfBOCfpckFVyP5GIik=;
        b=NGH4SvVl23/N41LmYPWtzim4gcmHT2PV1X7B5aMtWkBhXVXvi7c2VUSnSGMAnsyfEV
         FtiLXgDBVTpyFH2ubzrr19SPbuPo1fgmvKiTa+fBiaX7scxxCQfUd/A+nuPGIEgkmudh
         oVBT5H+rdUDduqDtaF24j/UOYMmIuQHYJ/901eCjc6uN0HzPcBk70BIDmTFkjPnbSAaL
         6tdGezVDGH4E8HQZYYHt6IoA5txngSDtuZZexZl6E2j3SuByCm5HT/16uSTSAw4PLaSm
         UZ/BozBviSyrCssXCiulF8aM6/UWq52RAvTLQm6pFfQ+zP1P6ptRjyLP0fMJ9T/K/WHg
         ff+g==
X-Forwarded-Encrypted: i=1; AJvYcCUPYS1Fqx0CxFwfTpQySauaxqEPaApjIafEK+HXm0bM/IeXr1LX6QBFXR+cFACyispXEsKncGnVA6BO@vger.kernel.org, AJvYcCUc9JSJA8iS/kfs7Axz0eP7JrZPSEXAyrvQDJWuMHlcDB3kL4QKqnrhgpRu7VFmhWrK75+uagp0NmMrRzo=@vger.kernel.org, AJvYcCUh00Ln4C52Q1p+1cv1EegzeYWNNDez0meyEPyZCqb4JCxu4gmDt8NCZWj4tXsA9LK2knPUTzSDB/dx+YNf@vger.kernel.org
X-Gm-Message-State: AOJu0YzHXxqt4cCVNlv0WTK+fKWVhtQ47Qd070t6pPvZj0+2MH+OMgHs
	dUrOmCaUB0g1l1iLM8V+x/OgE5NmYnpWNovgbn/ihSwC9415gS5N
X-Google-Smtp-Source: AGHT+IFVTQ3LfaXYubmmh//jrLLb1bQzxGTiF8xttq0VDGjJnNc/pBZNhv6nCpqY0o/0dZ2GXjw0+w==
X-Received: by 2002:a17:90a:600c:b0:2c8:da73:af82 with SMTP id 98e67ed59e1d1-2d646bb1094mr15667628a91.10.1724831856982;
        Wed, 28 Aug 2024 00:57:36 -0700 (PDT)
Received: from [172.19.1.53] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d844641416sm992321a91.44.2024.08.28.00.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 00:57:36 -0700 (PDT)
Message-ID: <1d2d2637-b897-4fb5-ab4e-c419c154a744@gmail.com>
Date: Wed, 28 Aug 2024 15:57:32 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new
 bindings
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 esben@geanix.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240821071132.281018-1-hpchen0nvt@gmail.com>
 <20240821071132.281018-2-hpchen0nvt@gmail.com>
 <20240823182616.5a85e1ae@xps-13>
 <fd0d73cf-6bce-4f7b-9513-5f434ab9ae00@gmail.com>
 <20240828094846.166c7de6@xps-13>
Content-Language: en-US
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
In-Reply-To: <20240828094846.166c7de6@xps-13>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Miquel,

Thank you for your reply.



On 2024/8/28 下午 03:48, Miquel Raynal wrote:
> Hi Hui-Ping,
>
> hpchen0nvt@gmail.com wrote on Wed, 28 Aug 2024 10:47:17 +0800:
>
>> Dear Miquèl,
>>
>> Thank you for your reply.
>>
>>
>>
>> On 2024/8/24 上午 12:26, Miquel Raynal wrote:
>>> Hi,
>>>
>>> hpchen0nvt@gmail.com wrote on Wed, 21 Aug 2024 07:11:31 +0000:
>>>   
>>>> Add dt-bindings for the Nuvoton MA35 SoC NAND Controller.
>>>>
>>>> Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> ---
>>>>    .../bindings/mtd/nuvoton,ma35d1-nand.yaml     | 93 +++++++++++++++++++
>>>>    1 file changed, 93 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
>>>> new file mode 100644
>>>> index 000000000000..152784e73263
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
>>>> @@ -0,0 +1,93 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/mtd/nuvoton,ma35d1-nand.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Nuvoton MA35D1 NAND Flash Interface (NFI) Controller
>>>> +
>>>> +maintainers:
>>>> +  - Hui-Ping Chen <hpchen0nvt@gmail.com>
>>>> +
>>>> +allOf:
>>>> +  - $ref: nand-controller.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - nuvoton,ma35d1-nand
>>> Can we please use the -nand-controller suffix. A NAND is a the common
>>> name for a chip with storage inside. You are describing a host
>>> controller that can be connected to in order to talk to a NAND.
>>
>> Okay, I will change it to nuvoton,ma35d1-nfi.
>>
>> Because in our platform, it is the NAND Flash Interface.
> nfi is not an acronym that is understandable by everyone. Please use
> -nand-controller. Don't be worried by the size of the string.
>
> You can use the acronym as prefix for your NAND controller functions
> though.

Okay, I will change it to nuvoton,ma35d1-nand-controller.



> Thanks,
> Miquèl


Best regards,

Hui-Ping Chen



