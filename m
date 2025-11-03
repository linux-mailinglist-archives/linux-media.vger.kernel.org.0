Return-Path: <linux-media+bounces-46223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD27C2D238
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 17:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C24343B9471
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 16:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E32C14A4F9;
	Mon,  3 Nov 2025 16:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tQRQPOTh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96DB280CE5;
	Mon,  3 Nov 2025 16:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762186652; cv=none; b=j+zoWT6fApA7DlXBmX3hJ5v0NR0a7bZcXS4XoaMuYi/HESLqRrKqCALkcIbuOdcfD8JoXTUkb4bSjffuYKxfMWmFoPhknkt5yotMehI7T+wA0yQV0A4ezwXW9Bm1EvA/dJDf+ObmQ0fTE3KI16IaVDZ4uS7475jZkxyLYo+U7LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762186652; c=relaxed/simple;
	bh=tU20dHhvzTic1V34oCJnXHvxilHx8SjrMcH9p7oyPPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N1SK+UE5urCMhsjFPc4v/bSLM6GYkzGDhv/l9lRqpt8tZtTBWzX81qtskdlbMXHUAmdferGtyufEO9tqXXRRcSRKF1LsEkwwSxo2UNkRrCay/uo3866zR3pwmWHu3MtpnqOPUu1OLgqAj4Z5WWZ6jSv5snLiVHAlmu2NC9gwcfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tQRQPOTh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43F9B22E;
	Mon,  3 Nov 2025 17:15:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762186534;
	bh=tU20dHhvzTic1V34oCJnXHvxilHx8SjrMcH9p7oyPPg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tQRQPOThqW29KOusEVJeufmpzOaCbYCbNbLbWE1NpG84mKLRIWv77MbLFXjZkhVXJ
	 QDs/t6uzSZDbGhk6r85U8+COeUQjXNnUrpYgcy3MftX22HYkHu8Im67VyQPnFVAIvg
	 WFufq9+zZbS7jmnGDJ4O+oOSXwHihz1FxnS5mhTk=
Message-ID: <8c5a4c68-8299-4d8f-96b2-8db232df70fe@ideasonboard.com>
Date: Mon, 3 Nov 2025 16:17:24 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 03/15] dt-bindings: media: Add bindings for ARM
 mali-c55
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
 jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com, robh+dt@kernel.org,
 mchehab@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com>
 <20251002-c55-v12-3-3eda2dba9554@ideasonboard.com>
 <CA+V-a8sg4c697WTS=wXoWvgc_UCFM3+Qjh1br=rMm4F84NVw-Q@mail.gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <CA+V-a8sg4c697WTS=wXoWvgc_UCFM3+Qjh1br=rMm4F84NVw-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Prabhakar

On 28/10/2025 18:23, Lad, Prabhakar wrote:
> Hi Daniel,
> 
> Thank you for the patch.
> 
> On Thu, Oct 2, 2025 at 11:19 AM Daniel Scally
> <dan.scally@ideasonboard.com> wrote:
>>
>> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
>>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
>> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>> Changes in v12:
>>
>>          - _Actually_ dropped the arm,inline property mode, having forgotten to
>>            do so in v11.
>>
>> Changes in v11:
>>
>>          - Dropped in arm,inline_mode property. This is now identical to the
>>            reviewed version 8, so I have kept the tags on there.
>>
>> Changes in v10:
>>
>>          - None
>>
>> Changes in v9:
>>
>>          - Added the arm,inline_mode property to differentiate between inline and
>>            memory input configurations
>>
>> Changes in v8:
>>
>>          - Added the video clock back in. Now that we have actual hardware it's
>>            clear that it's necessary.
>>          - Added reset lines
>>          - Dropped R-bs
>>
>> Changes in v7:
>>
>>          - None
>>
>> Changes in v6:
>>
>>          - None
>>
>> Changes in v5:
>>
>>          - None
>>
>> Changes in v4:
>>
>>          - Switched to port instead of ports
>>
>> Changes in v3:
>>
>>          - Dropped the video clock as suggested by Laurent. I didn't retain it
>>          for the purposes of the refcount since this driver will call .s_stream()
>>          for the sensor driver which will refcount the clock anyway.
>>          - Clarified that the port is a parallel input port rather (Sakari)
>>
>> Changes in v2:
>>
>>          - Added clocks information
>>          - Fixed the warnings raised by Rob
>> ---
>>   .../devicetree/bindings/media/arm,mali-c55.yaml    | 82 ++++++++++++++++++++++
>>   1 file changed, 82 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..efc88fd2c447e98dd82a1fc1bae234147eb967a8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
>> @@ -0,0 +1,82 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/arm,mali-c55.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: ARM Mali-C55 Image Signal Processor
>> +
>> +maintainers:
>> +  - Daniel Scally <dan.scally@ideasonboard.com>
>> +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: arm,mali-c55
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: ISP Video Clock
>> +      - description: ISP AXI clock
>> +      - description: ISP AHB-lite clock
> As per RZ/V2H HW manual we have reg clock looking at the driver code
> it does have readl. IVC has reg clock if IVC driver fails are you
> still able to read/write regs from ISP driver?
 >
 > I think we do need to pass reg clock too.

Yes - but I should clarify that the names are from the arm documentation that we had when we 
originally developed the ISP driver. The RZ/V2H documentation treats the ISP and IVC as one block 
that shares 4 clocks and resets, but when we originally developed the ISP driver the platform we 
used had the ISP implemented as an inline configuration (taking data directly from a csi-2 receiver 
without an IVC equivalent), and the documentation detailed just the three clocks and resets. The 
dtsi changes for the RZ/V2H(P) [1] assign clocks 226, 228 and 229 to the ISP which are named 
reg_aclk, vin_aclk and isp_sclk in the renesas documentation.

The IVC gets pclk, vin_aclk and isp_sclk.

[1] https://lore.kernel.org/linux-renesas-soc/20251010-kakip_dts-v1-1-64f798ad43c9@ideasonboard.com/

> Also for IVC we do have a main clock (which is a system clock).  Can
> you please educate me on what is the purpose of it. Just curious as we
> pass to IVC and not ISP.

The IVC uniquely gets the one called "pclk" in renesas documentation, with the description "Input 
Video Control block register access APB clock".

Thanks
Dan

> 
>> +
>> +  clock-names:
>> +    items:
>> +      - const: vclk
>> +      - const: aclk
>> +      - const: hclk
> Not sure if we want to have the same names as IVC or vice versa.
> 
>> +
>> +  resets:
>> +    items:
>> +      - description: vclk domain reset
>> +      - description: aclk domain reset
>> +      - description: hclk domain reset
> Same query here, wrt register reset.
> 
>> +
>> +  reset-names:
>> +    items:
>> +      - const: vresetn
>> +      - const: aresetn
>> +      - const: hresetn
> ditto naming.
> 
>> +
>> +  port:
>> +    $ref: /schemas/graph.yaml#/properties/port
>> +    description: Input parallel video bus
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
>> +  - port
> maybe also resets and rest-names should be part of required properties?
> 
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    mali_c55: isp@400000 {
> we could drop `mali_c55`
> 
>> +      compatible = "arm,mali-c55";
>> +      reg = <0x400000 0x200000>;
>> +      clocks = <&clk 0>, <&clk 1>, <&clk 2>;
>> +      clock-names = "vclk", "aclk", "hclk";
>> +      resets = <&resets 0>, <&resets 1>, <&resets 2>;
>> +      reset-names = "vresetn", "aresetn", "hresetn";
>> +      interrupts = <0>;
> I would have a non-zero val here.
> 
> Cheers,
> Prabhakar
> 
>> +
>> +      port {
>> +        isp_in: endpoint {
>> +            remote-endpoint = <&csi2_rx_out>;
>> +        };
>> +      };
>> +    };
>> +...
>>
>> --
>> 2.43.0
>>
>>


