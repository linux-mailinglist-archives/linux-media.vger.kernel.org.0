Return-Path: <linux-media+bounces-6250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7724986E6B7
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 18:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E3522882A4
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 17:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE048495;
	Fri,  1 Mar 2024 17:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iJJfoCi0"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B88522C;
	Fri,  1 Mar 2024 17:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709312776; cv=none; b=toUcFVyrQ/AAO8mPT5nAJpnsk8XKJf2ZriI1ztqFNp7HRnclqowmc0tY0kOJuKcAjL583HryMRjuWkDH0qoH4xN4v0L6BvHQDdOn30naMeMWpsRmKm4qVC9tUF0W/1ByYGyxgQM+VNLehiwsxAI/6rdqIMKo8LG+FyzSKRNrBw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709312776; c=relaxed/simple;
	bh=id7HKy1iRPkh/X8oX93ETVq/oQ55UfgJENLJylkOgs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWCOshICfWGC+Kfx2C9itvgE1RcRuz1Dm1llR+/CWOAwPKAfSazOAhlKkHLg1zwvwT/DBkGisjOi3Nb36JYtLCxaD2PcDqxjaYp83sq0SeOvN3OOaI3gyMQ9BsYcgjhyVXGPJblMOUfSRL8awFgnelMshH+ikHzCuLB05yhgCDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iJJfoCi0; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709312773;
	bh=id7HKy1iRPkh/X8oX93ETVq/oQ55UfgJENLJylkOgs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJJfoCi0FiBs6A3R8jLo/TErc9BGBVY+4htdWwuMkfseSX9ckWC9f7H125N4I6oEF
	 3tx2WH6D5VoHc+BsQO0P1C1D69Ax2bep6tnllteR4zwhzczsYm2yRnJ4SyAb1WDwKj
	 vrsHhhYHfgow9POYKQUwcYhHHjWos1e0pBq2TzCCV/Qa2FP52yrR998qzgzPse1IBo
	 LVTw4THUvTv6LQ9HPQQWiv8nN18gE6GA+m2DyodND5OHks9qRTUXfOHHsHPFVDU0Xr
	 f7LOtrvgWeQtqBmsiZJ17JHoDvSLEW62emYWUTvq+CuFQwXrvLEHUSsLGS0twM62Rb
	 EKNj1V6/6uuZw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C9B8837813F2;
	Fri,  1 Mar 2024 17:06:12 +0000 (UTC)
Date: Fri, 1 Mar 2024 18:06:11 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com,
	laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
	vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
	detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com,
	andrzej.p@collabora.com, nicolas@ndufresne.ca, afd@ti.com,
	milkfafa@gmail.com
Subject: Re: [PATCH v6 1/3] media: dt-bindings: Add Imagination E5010 JPEG
 Encoder
Message-ID: <20240301170611.tknj7ncwvgqjwkx5@basti-XPS-13-9310>
References: <20240228141140.3530612-1-devarsht@ti.com>
 <20240228141140.3530612-2-devarsht@ti.com>
 <20240229102623.ihwhbba4qwzvxzzq@basti-XPS-13-9310>
 <7a83fe91-5afa-6aee-a8a4-44f6e3d713c2@ti.com>
 <20240229133046.64h2f4n27emvdhnq@basti-XPS-13-9310>
 <eff7080b-42e9-19ae-6022-bfbcc337b4a0@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eff7080b-42e9-19ae-6022-bfbcc337b4a0@ti.com>

Hey Devarsh,

On 01.03.2024 22:02, Devarsh Thakkar wrote:
>Hi Sebastian,
>
>On 29/02/24 19:00, Sebastian Fricke wrote:
>> Hey Devarsh,
>>
>> On 29.02.2024 16:50, Devarsh Thakkar wrote:
>>> Hi Sebastian,
>>>
>>> Thanks for the review.
>>>
>>> On 29/02/24 15:56, Sebastian Fricke wrote:
>>>> Hey Devarsh,
>>>>
>>>> On 28.02.2024 19:41, Devarsh Thakkar wrote:
>>>>> Add dt-bindings for Imagination E5010 JPEG Encoder [1] which is implemented
>>>>> as stateful V4L2 M2M driver.
>>>>>
>>>>> The device supports baseline encoding with two different quantization
>>>>> tables and compression ratio as demanded.
>>>>>
>>>>> Minimum resolution supported is 64x64 and Maximum resolution supported is
>>>>> 8192x8192.
>>>>>
>>>>> [1]:  AM62A TRM (Section 7.6 is for JPEG Encoder)
>>>>> Link: https://www.ti.com/lit/pdf/spruj16
>>>>>
>>>>> Co-developed-by: David Huang <d-huang@ti.com>
>>>>> Signed-off-by: David Huang <d-huang@ti.com>
>>>>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>>>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>>
>>>> hmmm when did Rob give his reviewed by on this patch? (As this is not a
>>>> DT binding I find that odd)
>>>
>>> [PATCH v6 1/3] media: dt-bindings: Add Imagination E5010 JPEG Encoder : This
>>> is indeed the dt-binding patch. Also As shared in version history it is at V4
>>> where Rob Herring added a Reviewed-By as seen here [0]
>>>
>>>> And where is the Reviewed by tag from Benjamin that he provided on V5?
>>>>
>>>
>>> As captured in patch version history here [1] I thought to remove the
>>> Reviewed-By since the Reviewed-By tag was on V5 and with V6 the driver got
>>> updated with some changes to handle reported sparse warnings and so I have
>>> asked Benjamin to check the range-diff and help with a quick review again if
>>> possible.
>>>
>>> Kindly let me know if I missed something or anything needs to be done from
>>> my end.
>>
>> Yes thanks I was a bit too swift to write here, sorry for the noise.
>> We'll have a look.
>>
>
>Sorry for the back and forth, but on the hindsight and re-looking at the
>kernel patch guidelines [0] they suggest that Reviewed-By tag should only be
>removed if substantial changes were made in further revisions.
>
>So looks to me in-fact it was a mistake on my part to remove the Reviewed-by
>considering the change made in the following patch series was not a
>substantial one as seen in the range-diff [1].
>
>Considering this, just wanted to check with you if it's possible for you to
>consider the Reviewed-by tag :
>`Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com`
>if it helps consolidate things faster to get this series in given we are close
>to final RC's ?

Yup I think we can keep it as the changes are very minor. Otherwise the
series is pretty much good to go, I'll prepare the PR asap.

Greetings,
Sebastian

>
>[0]:
>https://docs.kernel.org/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes:~:text=changed%20substantially
>
>[1]: https://gist.github.com/devarsht/c89180ac2b0d2814614f2b59d0705c19
>
>Regards
>Devarsh
>
>>
>> Greetings,
>> Sebastian
>>
>>>
>>> [0] :
>>> https://lore.kernel.org/all/170716378412.295212.11603162949482063011.robh@kernel.org/
>>> [1] : https://lore.kernel.org/all/20240228141140.3530612-4-devarsht@ti.com/
>>>
>>>
>>> Regards
>>> Devarsh
>>>>> ---
>>>>> V2: No change
>>>>> V3:
>>>>> - Add vendor specific compatible
>>>>> - Update reg names
>>>>> - Update clocks to 1
>>>>> - Fix dts example with proper naming
>>>>> V4:
>>>>> - Use ti-specific compatible ti,am62a-jpeg-enc as secondary one
>>>>> - Update commit message and title
>>>>> - Remove clock-names as only single clock
>>>>> V5:
>>>>> - Add Reviewed-By tag
>>>>> V6:
>>>>> - No change
>>>>>
>>>>> .../bindings/media/img,e5010-jpeg-enc.yaml    | 75 +++++++++++++++++++
>>>>> MAINTAINERS                                   |  5 ++
>>>>> 2 files changed, 80 insertions(+)
>>>>> create mode 100644
>>>>> Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml
>>>>> b/Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..085020cb9e61
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml
>>>>> @@ -0,0 +1,75 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/media/img,e5010-jpeg-enc.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Imagination E5010 JPEG Encoder
>>>>> +
>>>>> +maintainers:
>>>>> +  - Devarsh Thakkar <devarsht@ti.com>
>>>>> +
>>>>> +description: |
>>>>> +  The E5010 is a JPEG encoder from Imagination Technologies implemented on
>>>>> +  TI's AM62A SoC. It is capable of real time encoding of YUV420 and YUV422
>>>>> +  inputs to JPEG and M-JPEG. It supports baseline JPEG Encoding up to
>>>>> +  8Kx8K resolution.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    oneOf:
>>>>> +      - items:
>>>>> +          - const: ti,am62a-jpeg-enc
>>>>> +          - const: img,e5010-jpeg-enc
>>>>> +      - const: img,e5010-jpeg-enc
>>>>> +
>>>>> +  reg:
>>>>> +    items:
>>>>> +      - description: The E5010 core register region
>>>>> +      - description: The E5010 mmu register region
>>>>> +
>>>>> +  reg-names:
>>>>> +    items:
>>>>> +      - const: core
>>>>> +      - const: mmu
>>>>> +
>>>>> +  power-domains:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  resets:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  clocks:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  interrupts:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - reg
>>>>> +  - reg-names
>>>>> +  - interrupts
>>>>> +  - clocks
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    #include <dt-bindings/soc/ti,sci_pm_domain.h>
>>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>>>> +
>>>>> +    soc {
>>>>> +      #address-cells = <2>;
>>>>> +      #size-cells = <2>;
>>>>> +      jpeg-encoder@fd20000 {
>>>>> +          compatible = "img,e5010-jpeg-enc";
>>>>> +          reg = <0x00 0xfd20000 0x00 0x100>,
>>>>> +                <0x00 0xfd20200 0x00 0x200>;
>>>>> +          reg-names = "core", "mmu";
>>>>> +          clocks = <&k3_clks 201 0>;
>>>>> +          power-domains = <&k3_pds 201 TI_SCI_PD_EXCLUSIVE>;
>>>>> +          interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
>>>>> +      };
>>>>> +    };
>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>> index e1475ca38ff2..6b34ee8d92b5 100644
>>>>> --- a/MAINTAINERS
>>>>> +++ b/MAINTAINERS
>>>>> @@ -10572,6 +10572,11 @@ S:    Maintained
>>>>> F:    Documentation/devicetree/bindings/auxdisplay/img,ascii-lcd.yaml
>>>>> F:    drivers/auxdisplay/img-ascii-lcd.c
>>>>>
>>>>> +IMGTEC JPEG ENCODER DRIVER
>>>>> +M:    Devarsh Thakkar <devarsht@ti.com>
>>>>> +S:    Supported
>>>>> +F:    Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml
>>>>> +
>>>>> IMGTEC IR DECODER DRIVER
>>>>> S:    Orphan
>>>>> F:    drivers/media/rc/img-ir/
>>>>> -- 
>>>>> 2.39.1
>>>>>

