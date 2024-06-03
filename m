Return-Path: <linux-media+bounces-12434-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 304BB8D7D0B
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 10:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C2C11F21364
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 08:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2B955C08;
	Mon,  3 Jun 2024 08:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLK/KxvT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154FE4EB30;
	Mon,  3 Jun 2024 08:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717402268; cv=none; b=U5Dnpi7Suons4o2jEyw/vomTAtS0Ia/VORuEkjK/grRVSSLasChaM4e1QPiwKI9DBv3NEqg6TTxdCFsc2JHEJMfrPYPSjTSJvN6M8FXUuSQVYtH7/ITs2UfMVe8hUR/AQSUpZbJByJ47RBaaOFbxt+AJxVM4mQ1ss9pjdLH0Y5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717402268; c=relaxed/simple;
	bh=5OoZFgoQGPMngn4562roUro26Yi1b3WkPbU2TVYp5II=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aScxRWpQolEWKq2wCbjG7VIWlDma8aUeVHEPSmpv+RHYSana8CORfX6MFf41CqmNmf4Ieyatp/OtuBbaZrud9sgaeyho9RWMyDxgEezqznmZHk/OvqBCOnblJgcZFbihPhYezXSvigXmGiBMIVtl+RwPiHJ6fceAxKtUOd8oJDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLK/KxvT; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57a31d63b6bso3356578a12.0;
        Mon, 03 Jun 2024 01:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717402265; x=1718007065; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u0iEFgdOgvP8ilqiWdq7v8OaqOOUugnJDJ9/FR98Crw=;
        b=YLK/KxvTz9pdgsp3TzWgmMHprxYvMbL+ADt8C/WlsqPtwXyGbNz+QQzivxNFicHsUu
         9tL1gGD5DdFNtbrv24646/HpmepsSA2WvCCyUIvAT7c/wmPm9oKPDftlky7q/q4vtLCQ
         XUw8pua7+W7kgHGGEMzW0oOuxXMdcqmXV/Am6Jc7O8iIzhbJgXKup/HQUVEGv2MRypTe
         tnGUv1ddancel0MANHSEz9fWMtwQI4F01AG0mHMRDSmpAfhjiAH/UQCOegzMj4h0exln
         0OMWSVPgddTcGysL1JVazc25PmIg6X+Y3/Ge23L7zBjk3IClFvHP5d8BSanYRFqv7Lmn
         3WHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717402265; x=1718007065;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u0iEFgdOgvP8ilqiWdq7v8OaqOOUugnJDJ9/FR98Crw=;
        b=dS/RWsgg+Hy+30QqbvtqehNO7QySfQb/yY6GIcNayEe9QUSONlb50pX8T0awON3S7F
         YsVFug04z21i3jdc03wLLbDxRX9En6Pu+h+peFp63JzNMITTdtFxXXH6WDRr1ErSkp7k
         npywr1EE7QHSrU1ciERC14SmZu1LKoC6Cw3sEMEvy4CaZVzDNq+ySSKFayeQuS8NkBLZ
         fGSsQhanL5Q/zX939kwZk/WkksgHuPwsv5T580hQ5w3bwYkyPWVbLs+ehKlV1MxRw48l
         3/27nuhZJXLBLrV8LrmV7nqDszMnYrSr9zOKKP4KJqCfTuHQP11M07YCfQJhEwhy1a1G
         75dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHNgj8QDaEjm3UPdf03zsRh8sGoNZBBOPA5F+2ei2iKgl0p0h40bNBXqLg6chhWPhNvQ109pgJLKwAVf2cOxUVVttOn7CVStZAo4igJMYcypMUDCT5egk06GYkuODEdarSXiNvXni01otzcS6KfYFGM7H+YcPUXjvcvnwa++iUjoXkxMYQ
X-Gm-Message-State: AOJu0YzMx7rdSscXVO5NlqqDAn/XAfoN0CHpySDkJwnnjzskXRka9p/B
	IZw45WCP6Ux+WhuhRCEs/7QcgUyEOgoIgPwgDnSGy6xBwNV/te4r
X-Google-Smtp-Source: AGHT+IH6pWS9A6Vbq2Fi3kiLwfN9CRE8W4TLtLaMd2BEzlaTgHeBZGoT0/sgdITW73FJ4YD6wggPRg==
X-Received: by 2002:a50:9992:0:b0:57a:215a:5cb9 with SMTP id 4fb4d7f45d1cf-57a3638f923mr5604168a12.19.1717402265020;
        Mon, 03 Jun 2024 01:11:05 -0700 (PDT)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-57a31c9c0b8sm4974672a12.86.2024.06.03.01.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 01:11:04 -0700 (PDT)
Message-ID: <16e8b71d-ae71-42e9-afb3-bd8d02a3dd06@gmail.com>
Date: Mon, 3 Jun 2024 10:11:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] dt-bindings: media: convert Mediatek consumer IR to
 the json-schema
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240209085616.1062-1-zajec5@gmail.com>
 <c6a8fdc1-0230-4438-8b80-c07daf80f1ce@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <c6a8fdc1-0230-4438-8b80-c07daf80f1ce@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mauro,

On 23.04.2024 06:22, Rafał Miłecki wrote:
> On 9.02.2024 09:56, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> This helps validating DTS files. Introduced changes:
>> 1. Reworded title
>> 2. Made "bus" clock required on MT7623 as well
>> 3. Added required #include-s and adjusted "reg" & clocks in example
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> 
> could you take my patch throught your tree?

did you have a chance to look at this? Can you take it to your tree?


>> ---
>> V2: Extended "IR" in title
>>      Made "bus" required at MT7623 needs it as well
>>      Updated example
>>
>> Thanks AngeloGioacchino!
>>
>>   .../bindings/media/mediatek,mt7622-cir.yaml   | 55 +++++++++++++++++++
>>   .../devicetree/bindings/media/mtk-cir.txt     | 28 ----------
>>   2 files changed, 55 insertions(+), 28 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/media/mtk-cir.txt
>>
>> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml b/Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml
>> new file mode 100644
>> index 000000000000..c01210e053f9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml
>> @@ -0,0 +1,55 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek Consumer Infrared Receiver on-SoC Controller
>> +
>> +maintainers:
>> +  - Sean Wang <sean.wang@mediatek.com>
>> +
>> +allOf:
>> +  - $ref: rc.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - mediatek,mt7622-cir
>> +      - mediatek,mt7623-cir
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: clk
>> +      - const: bus
>> +
>> +required:
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/mt2701-clk.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    ir@10013000 {
>> +        compatible = "mediatek,mt7623-cir";
>> +        reg = <0x10013000 0x1000>;
>> +        interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
>> +        clocks = <&infracfg CLK_INFRA_IRRX>, <&topckgen CLK_TOP_AXI_SEL>;
>> +        clock-names = "clk", "bus";
>> +        linux,rc-map-name = "rc-rc6-mce";
>> +    };
>> diff --git a/Documentation/devicetree/bindings/media/mtk-cir.txt b/Documentation/devicetree/bindings/media/mtk-cir.txt
>> deleted file mode 100644
>> index 5e18087ce11f..000000000000
>> --- a/Documentation/devicetree/bindings/media/mtk-cir.txt
>> +++ /dev/null
>> @@ -1,28 +0,0 @@
>> -Device-Tree bindings for Mediatek consumer IR controller
>> -found in Mediatek SoC family
>> -
>> -Required properties:
>> -- compatible        : Should be
>> -            "mediatek,mt7623-cir": for MT7623 SoC
>> -            "mediatek,mt7622-cir": for MT7622 SoC
>> -- clocks        : list of clock specifiers, corresponding to
>> -              entries in clock-names property;
>> -- clock-names        : should contain
>> -            - "clk" entries: for MT7623 SoC
>> -            - "clk", "bus" entries: for MT7622 SoC
>> -- interrupts        : should contain IR IRQ number;
>> -- reg            : should contain IO map address for IR.
>> -
>> -Optional properties:
>> -- linux,rc-map-name : see rc.txt file in the same directory.
>> -
>> -Example:
>> -
>> -cir: cir@10013000 {
>> -    compatible = "mediatek,mt7623-cir";
>> -    reg = <0 0x10013000 0 0x1000>;
>> -    interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
>> -    clocks = <&infracfg CLK_INFRA_IRRX>;
>> -    clock-names = "clk";
>> -    linux,rc-map-name = "rc-rc6-mce";
>> -};
> 


