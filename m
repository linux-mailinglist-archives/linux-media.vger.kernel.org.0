Return-Path: <linux-media+bounces-35495-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 750C5AE1DDF
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 16:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4E0C1895F7C
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 14:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168682836AF;
	Fri, 20 Jun 2025 14:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AG//5gO2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A1686334;
	Fri, 20 Jun 2025 14:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750431178; cv=none; b=lERTXnJmYu7Ett1C4CZdsypcSEYw/PuTw8M8lFDvmQ3igpIrolOSWUiPcFyjEm4i00RT2U0RxkgVDoZGSZE3RpN33xNyZQFguV/5p4BJ9hotSgJC35KCoUFYTGNKD1Nj7yNjbFxl8WEJF98Wu+ZXcdt150iCqOONysHF8jdV5Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750431178; c=relaxed/simple;
	bh=ZgQEB60w6UqtiFd6A8aQGI0WM2R66I1WY6Jy68Ywk6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bknnp0IXQzyF2ximjpAZ7vR+mpIKmgI72Vs18fzOxdiISXT3tVyqju6UColWSgoHKSaQVxcV3b0SFLiDh4t9tbF55I6OFB9osl0uSBd6/Aart6hl3rLzxkG5vAG0J5ukbgXvVPKqISFRx/ZMlxfN1/6JP8hRug/QhrawPUbymjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AG//5gO2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 860647E6;
	Fri, 20 Jun 2025 16:52:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750431159;
	bh=ZgQEB60w6UqtiFd6A8aQGI0WM2R66I1WY6Jy68Ywk6s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AG//5gO2YZzYBe7p+P743mUhJLU8fdxeTBMfXeLUcS0TpGxUEyPHOF6N5k04VKEjW
	 AoLx7iN5IugGbY1x98ZSP8hkbZfz3AVCdPnVijCel7+kPH5KGrIrt6s8hp5Nxzf3kW
	 jEYyH0jYUBHjyawDsW5KJ8fwFjD431MGHz0lF4h0=
Message-ID: <51b6e000-c01e-4d5e-a72a-0817d6745e3e@ideasonboard.com>
Date: Fri, 20 Jun 2025 15:52:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: Add bindings for the RZ/V2H IVC
 block
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>
References: <20250519145754.454005-1-dan.scally@ideasonboard.com>
 <20250519145754.454005-2-dan.scally@ideasonboard.com>
 <TY3PR01MB113467229C60E42AA67F9384C869FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <TY3PR01MB113467229C60E42AA67F9384C869FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Biju

On 20/05/2025 07:55, Biju Das wrote:
> Hi Daniel,
>
> Thanks for the patch.
>
>> -----Original Message-----
>> From: Daniel Scally <dan.scally@ideasonboard.com>
>
>> Subject: [PATCH 1/3] dt-bindings: media: Add bindings for the RZ/V2H IVC block
>>
>> The RZ/V2H SoC has a block called the Input Video Control block which feeds image data into the Image
>> Signal Processor. Add dt bindings to describe the IVC.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>>   .../bindings/media/renesas,rzv2h-ivc.yaml     | 99 +++++++++++++++++++
>>   1 file changed, 99 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml
>> b/Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml
>> new file mode 100644
>> index 000000000000..29d522f7d365
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml
>> @@ -0,0 +1,99 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/renesas,rzv2h-ivc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Renesas RZ/V2H Input Video Control Block
>> +
>> +maintainers:
>> +  - Daniel Scally <dan.scally@ideasonboard.com>
>> +
>> +description:
>> +  The IVC block is a module that takes video frames from memory and
>> +feeds them
>> +  to the Image Signal Processor for processing.
>> +
>> +properties:
>> +  compatible:
>> +    const: renesas,r9a09g057-ivc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Input Video Control block register access clock
>> +      - description: Video input data AXI bus clock
>> +      - description: ISP system clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: pclk
>> +      - const: vin_aclk
>> +      - const: sclk
>
> power-domains:
> 	maxItems: 1 ??

Thanks; I'd missed this entirely - I'll add it in.


Dan

>
>> +
>> +  resets:
>> +    items:
>> +      - description: Input Video Control block register access reset
>> +      - description: Video input data AXI bus reset
>> +      - description: ISP core reset
>> +
>> +  reset-names:
>> +    items:
>> +      - const: presetn
>> +      - const: vin_aresetn
>> +      - const: sresetn
>> +
>> +  port:
>> +    $ref: /schemas/graph.yaml#/properties/port
>> +    description: Output parallel video bus
>> +
>> +    properties:
>> +      endpoint:
>> +        $ref: /schemas/graph.yaml#/properties/endpoint
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
> - power-domains ??
>
>
>> +  - resets
>> +  - reset-names
>> +  - port
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    ivc: ivc@16040000 {
>> +      compatible = "renesas,r9a09g057-ivc";
>> +      reg = <0x16040000 0x230>;
>> +
>> +      clocks = <&cpg CPG_MOD R9A09G057_ISP0_PCLK>,
>> +      <&cpg CPG_MOD R9A09G057_ISP0_VIN_ACLK>,
>> +      <&cpg CPG_MOD R9A09G057_ISP0_SCLK>;
>> +      clock-names = "pclk", "vin_aclk", "sclk";
> power-domains??
>
> Cheers,
> Biju
>
>> +
>> +      resets = <&cpg R9A09G057_ISP_0_PRESETN>,
>> +      <&cpg R9A09G057_ISP_0_VIN_ARESETN>,
>> +      <&cpg R9A09G057_ISP_0_ISP_SRESETN>;
>> +      reset-names = "presetn", "vin_aresetn", "sresetn";
>> +
>> +      interrupts = <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
>> +
>> +      status = "okay";
>> +
>> +      port {
>> +        ivc_out: endpoint {
>> +          remote-endpoint = <&isp_in>;
>> +        };
>> +      };
>> +    };
>> +...
>> --
>> 2.34.1
>>

