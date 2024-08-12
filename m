Return-Path: <linux-media+bounces-16123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D1794E922
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 11:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89F931F210BA
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 09:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8202916CD09;
	Mon, 12 Aug 2024 09:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfMyxGzh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7351514C1;
	Mon, 12 Aug 2024 09:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723453381; cv=none; b=dYPBglF70ji8/fIcnkhYKjI7gp4anT6wkJpQvf+I6tJ0QRZPWQ+2H4/esZGmj6oxdMjHgAP7eqoV5kCTxgzPHF64To4j+ZuQ+5BiASXpI1akJdeaGYT8at1IoCaCN89++IeDPf5/E7uPUkn48gAAkOHZM6TzkW0e0dtwD3rgDI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723453381; c=relaxed/simple;
	bh=e2BATKzHHB1ouQjHYqOMvGTSFviOp8WIICsO64ATfcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nm3yT5CD2zxZGtzHIwETv1sgqiUNGRcFFUElO6WOkg0paKkIHCr3CfnWaOwob3eqH80Oklfk8uRus0BUZ7p4jLJIe0OYDEE4dPOHIiiBVEACFWtWeUReprLsmwteGIm/w2oZojpiKBQJU8ra3hgssDmh+14ZKkauVNXctFeWhIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfMyxGzh; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7c68b71ada4so240459a12.1;
        Mon, 12 Aug 2024 02:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723453379; x=1724058179; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oA9UkiOfhBYAJUcDeMhwvbpEk5g3FJTd40aP2H5//4I=;
        b=SfMyxGzhyTA4agqpeth8JiEaEA6IiDTBE5wg0j25OvJAtytjGvkljOuxkr0Vs0DDA2
         XW2RYrV5oAnVG0Zklrtx6tGz9OUVV80xcCKTvHVXZWR/iziaa+uNykF9+kz7tQP9poSO
         HskCG6fVkDytqz9b0bTYfUdkIoPGrXKinPSNxA5aD/gtdQaySkMkjxX21pd0PRXfY6Io
         dSiJ0lsou+bcK3CjwUHEuLrw1UmY5ivfyfwerQKLxnfE4JcZ45vkDHCdx4tOpTnhmdr6
         4y/uhartSfQg2MLRxVt4HXxgPyFt45J3VmkOaUegwzoBQFKuwKcVHLWZnMWBqbO6jiSD
         PBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723453379; x=1724058179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oA9UkiOfhBYAJUcDeMhwvbpEk5g3FJTd40aP2H5//4I=;
        b=aMDSfHmdAPfiX6XA5smrrwVD7RCj1pmEfRNYUuKNFgpG/5kqYHCN06W4ebgbV134MN
         GMBJm2KwRFxowALmNdXzMu3HrNqCF/SyMq2LpyvHfYWqcpYiR+NsQHMLk7oOL9PVwWPu
         wzwJjU8tglpz7qCuSQ+uACCWJq50Gw1SeLgXaZXn78TbhO09PmL1g2nqsczIU5mjt+6d
         x5KmyrD03FkEYddqSzapDeQKZPMMhCzveKYpgFiaHHMRVLwNYlULl0csgG0qLbvEVy4d
         6b1efHPuYgl2G8hroLeF10ZTEyx6foTcZiNkCPmcXD40ENof6OTB56fIpeAqrXerHydk
         eQoA==
X-Forwarded-Encrypted: i=1; AJvYcCVEBpkDoF4cgTsnUoPKSA8TtDUdgSW5zM0akgjZVR1Q9e/wb3gooDm02/bL+S4EOuYefHRI5JxkpG2gQMEPiB9btoxSD9uqAgMR/IZ4dnaMNC9dy0MnT6TrrWhJoZbrwjAsn/Nz24Uwc4IIASwCqyKqyd6sa6/OiBpEiUOyyq5l3hOaJLzP
X-Gm-Message-State: AOJu0Yy47CddWlFqQLgxIfJmi3YoQax1yHL1I2OShreKshq45rllY82D
	D1p+Bc6WMHwUBOzsVRNxN/uszXsFbBDY1u6J76YnNrYENNVo01jN
X-Google-Smtp-Source: AGHT+IF1ltQ1rctffvZF5tYbkcGNp85XKx9gVHMvRsFPaQ95OUNPSPLfEIQJ2BniEwB8x2dmsNN4Rw==
X-Received: by 2002:a05:6a20:d50c:b0:1c4:dc2a:3775 with SMTP id adf61e73a8af0-1c89fee7304mr10402030637.27.1723453378691;
        Mon, 12 Aug 2024 02:02:58 -0700 (PDT)
Received: from [172.19.1.53] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bba0db27sm33487765ad.239.2024.08.12.02.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 02:02:58 -0700 (PDT)
Message-ID: <203578df-11a6-425a-b2be-cc09dae62f8f@gmail.com>
Date: Mon, 12 Aug 2024 17:02:56 +0800
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
Content-Language: en-US
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
In-Reply-To: <7a8b9bdf-f4df-4da0-83ca-157175817e99@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Krzysztof,

Thank you for your reply.



On 2024/8/12 下午 02:25, Krzysztof Kozlowski wrote:
> On 12/08/2024 05:00, Hui-Ping Chen wrote:
>> Add dt-bindings for the Nuvoton MA35 SoC NAND Controller.
>>
>> Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
>> ---
>>   .../bindings/mtd/nuvoton,ma35d1-nand.yaml     | 97 +++++++++++++++++++
>>   1 file changed, 97 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
>> new file mode 100644
>> index 000000000000..988c43bc6e99
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
>> @@ -0,0 +1,97 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mtd/nuvoton,ma35d1-nand.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 NAND Flash Interface (NFI) Controller
>> +
>> +allOf:
>> +  - $ref: nand-controller.yaml#
> allOf goes usually just before properties.

Okay. I will modify this order.



>> +
>> +maintainers:
>> +  - Hui-Ping Chen <hpchen0nvt@gmail.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nuvoton,ma35d1-nand
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 1
> This cannot be min only. It's unconstrained. maxItems instead. There is
> no existing code like this so this should make you wonder...

Yes, it should be `maxItems`. I will correct this mistake.



>> +
>> +patternProperties:
>> +  "^nand@[a-f0-9]$":
>> +    type: object
>> +    $ref: raw-nand-chip.yaml
>> +    properties:
>> +      nand-ecc-mode:
>> +        const: hw
> No, drop the property. It does not make sense to have it const.
> Compatible defines it.

Okay. I will remove it.



>> +
>> +      nand-ecc-step-size:
>> +        enum: [512, 1024]
> No defaults? So is this required?

This is required, but I will also add a default.



>> +
>> +      nand-ecc-strength:
>> +        enum: [8, 12, 24]
> No defaults? So is this required?

This is required, but I will also add a default.



>> +
>> +      nand-bus-width:
>> +        const: 8
> Drop property.

Okay. I will remove it.



>> +
>> +    unevaluatedProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        nand-controller@401A0000 {
>> +            compatible = "nuvoton,ma35d1-nand";
>> +            reg = <0x0 0x401A0000 0x0 0x1000>;
>> +            interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&clk NAND_GATE>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            nand@0 {
>> +                reg = <0>;
>> +
>> +                nand-on-flash-bbt;
>> +                nand-ecc-mode = "hw";
> Drop

Okay. I will remove it.



>> +                nand-ecc-step-size = <512>;
>> +                nand-ecc-strength = <8>;
>> +                nand-bus-width = <8>;
> Drop

Okay. I will remove it.



>> +
>> +                partitions {
>> +                    compatible = "fixed-partitions";
>> +                    #address-cells = <1>;
>> +                    #size-cells = <1>;
>> +
>> +                    uboot@0 {
>> +                        label = "nand-uboot";
>> +                        read-only;
>> +                        reg = <0x0 0x300000>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +...
> Best regards,
> Krzysztof


Best regards,

Hui-Ping Chen



