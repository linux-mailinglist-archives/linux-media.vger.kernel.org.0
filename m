Return-Path: <linux-media+bounces-34971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FF3ADB581
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 17:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4930B3AFBA1
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E72A25A2BB;
	Mon, 16 Jun 2025 15:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="SWU8ZoOV"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A0D38FB0;
	Mon, 16 Jun 2025 15:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087883; cv=pass; b=uSqh0G2ADeKUWDFrhr8B+20dI97uPNhZZdgcWP0/9Ezb9K6yXZD486wDWYAb4XZi1wDKL8MaIFTeXIfnbq7hAaPXUIGD7C/YwoYdZb2JPTlpCaCrhDIh4nQHb5w/oeN47xbdnk0uiidRRheYiod3JlN44UccDrIqN7cCvLusn9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087883; c=relaxed/simple;
	bh=IyNyE4rK4hkY3z7uAZZgkVqTnSDkDqzal28PUmVRGsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q6Faip4G97I632KhZ8NwHK/aOtgujaCI4+aYoW3ZgbvcsJ6CX3HTckPap9ltugckGZQ+t5AZSQfHGK24mgTYw/MXgERX3smwmqLPHLlf45sGWB3/vNPtHTGYfVvFlgIhZ4cMt/wua4xjjzZJF+nhM7l7xE51HM7jfu2zWKHLl+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=SWU8ZoOV; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1750087851; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Cgga3I8jF2zVzJLMOxq+Vn/77I5PkLmkTEtFZ7zNvJouifQS8tbvClE2MYxzRvqgv5KVzPwkMsKX2c8dbRw5aHEE/3p6BawvJT7ELQd2A/dXTwS/Q232zAh7k72IfEqxMWj/wct0nfysdOtrsy6wmTBOQ1YWREv9UelFbSUtMMk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750087851; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0BL+aG/UNNGLP1x4xgnCt14zsxQCcrfboSBpn0n95Mc=; 
	b=dNmPhDbLjmWo3vNDqZAV9EaDNH0C+Nd6EWaKjh/gurcELJAgpGBk3PZFA3qlTTe9rbCGWjQHk9g5ZmMoK1gP/8stAwxj+jZv7f9YjMebrb1NxZXxPxGUcya6gQHqL98FvYUFoIJOBgFVMeycR6esHS9i3XNPYNIsO5Bha0wQpgI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750087851;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=0BL+aG/UNNGLP1x4xgnCt14zsxQCcrfboSBpn0n95Mc=;
	b=SWU8ZoOVqPfce4bWTOatjItj8sFTpIKwVX2258AwFPU8OkUv2qfeu9ySMT7l9ZJU
	hOApFkMODZXMLbz4r7F2gtSRAFjq/z0WgTx1z/VEEVumTMuhTO23GeTEzAmQRhghH5a
	DDVTRNOSby77h75bM5LvF0eCcqcswZ36jcaAHcnw=
Received: by mx.zohomail.com with SMTPS id 1750087849499697.6715293869444;
	Mon, 16 Jun 2025 08:30:49 -0700 (PDT)
Message-ID: <5c971c09-c398-40a3-9ed5-ec38b6645e1d@collabora.com>
Date: Mon, 16 Jun 2025 17:30:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: iommu: verisilicon: Add binding for VSI
 IOMMU
To: Conor Dooley <conor@kernel.org>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 kernel@collabora.com
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
 <20250616145607.116639-3-benjamin.gaignard@collabora.com>
 <20250616-winter-strict-db98f85db22d@spud>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20250616-winter-strict-db98f85db22d@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 16/06/2025 à 17:14, Conor Dooley a écrit :
> On Mon, Jun 16, 2025 at 04:55:50PM +0200, Benjamin Gaignard wrote:
>> Add a device tree binding for the Verisilicon (VSI) IOMMU. This IOMMU sits
>> in front of hardware encoder and decoder blocks on SoCs using Verisilicon IP,
>> such as the Rockchip RK3588.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   .../bindings/iommu/verisilicon,iommu.yaml     | 71 +++++++++++++++++++
>>   1 file changed, 71 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml b/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
>> new file mode 100644
>> index 000000000000..acef855fc61d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
>> @@ -0,0 +1,71 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/iommu/verisilicon,iommu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Verisilicon IOMMU
>> +
>> +maintainers:
>> +  - Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> +
>> +description: |+
>> +  A Versilicon iommu translates io virtual addresses to physical addresses for
>> +  its associated video decoder.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - const: verisilicon,iommu
> You're missing a soc-specific compatible at the very least here, but is
> there really no versioning on the IP at all? I'd be surprised if
> verisilicon only produced exactly one version of an iommu IP.

I only aware this version of the iommu for the moment.
Does adding verisilicon,rk3588-iommu sound good for you ?

>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Core clock
>> +      - description: Interface clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: aclk
>> +      - const: iface
> Why "aclk" rather than core, to match the description?

I will change that, the driver doesn't care of the clock name anyway

>
>> +
>> +  "#iommu-cells":
>> +    const: 0
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - "#iommu-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    bus {
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +
>> +      vsi_mmu: iommu@fdca0000 {
> The "vsi_mmu" label can be dropped here, it has no users.

ok.

Thanks,
Benjamin

>
> Cheers,
> Conor.
>
>> +        compatible = "verisilicon,iommu";
>> +        reg = <0x0 0xfdca0000 0x0 0x600>;
>> +        interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH 0>;
>> +        clocks = <&cru ACLK_AV1>, <&cru PCLK_AV1>;
>> +        clock-names = "aclk", "iface";
>> +        #iommu-cells = <0>;
>> +      };
>> +    };
>> -- 
>> 2.43.0
>>

