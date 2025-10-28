Return-Path: <linux-media+bounces-45781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E763C13F56
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 10:57:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2A3204F1E79
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 09:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3BE43054F9;
	Tue, 28 Oct 2025 09:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IrpHMJ/r"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CAF302CC2;
	Tue, 28 Oct 2025 09:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761645240; cv=none; b=mmHjDNd8ZBOFiFFsfjt74GL41Ee9CQ46vyEF0TY7Zg0DbfRGjPrNhV5B/K/nXvQKpCCSTW66vThWglpziOFPUkAiCbhTGMGQDei4oMy331oarJbdOZ8PLoyANF+pfAKFEULWJMxBdY8UDmXEkbQo37wtnP53dty3N0eERO11OdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761645240; c=relaxed/simple;
	bh=+58CVtXnt3w5k1YenKlBxrXneK4IFpaNCV8YTq5NzcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p0UaV+qtX52e8duNRph3DjmKQv4RAQA8oiEZTrF09WTW+F0GCOr7ou5KGaWKMLi940EMPxQKXZvHh16rc5QHOx34kSzSHDbaO+fNvbWz67PGpIBDK/+bOIysjkJAO0AY/UpxiBDlkdkmLSEqoIcTz12t4baJb9ZStq2Rxp2l6/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IrpHMJ/r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56353AB4;
	Tue, 28 Oct 2025 10:52:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761645127;
	bh=+58CVtXnt3w5k1YenKlBxrXneK4IFpaNCV8YTq5NzcY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IrpHMJ/rffkKqPBly8M6fO/5qd3dmtEt4jMcsksXuhd0kXx6TWopVRehD25nn4TEs
	 jQs8em1dB6LWVe39egZ/rrwfyaF/Dy0bSSc+esq7rTbPWuT3CWp6VAToDX9bmz1dXt
	 PJ6cFK/l95mLYFiGdxUjTRGcoSEQTE7V3v9x9AVU=
Message-ID: <5a3f30c7-fecd-4354-94bc-773dd44b4189@ideasonboard.com>
Date: Tue, 28 Oct 2025 09:53:52 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: media: Add bindings for the RZ/V2H(P)
 IVC block
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com,
 laurent.pinchart@ideasonboard.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20251002-ivc-v5-0-192c663fa70b@ideasonboard.com>
 <20251002-ivc-v5-1-192c663fa70b@ideasonboard.com>
 <CA+V-a8sCvhepEL1RnsemN_84U9gcLLoGBnOUtY0zLsZO+kcu7Q@mail.gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <CA+V-a8sCvhepEL1RnsemN_84U9gcLLoGBnOUtY0zLsZO+kcu7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Prabhakar

On 23/10/2025 22:49, Lad, Prabhakar wrote:
> Hi Daniel,
> 
> Thank you for the patch.
> 
> On Thu, Oct 2, 2025 at 11:38 AM Daniel Scally
> <dan.scally@ideasonboard.com> wrote:
>>
>> The RZ/V2H(P) SoC has a block called the Input Video Control block which
>> feeds image data into the Image Signal Processor. Add dt bindings to
>> describe the IVC.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>> Changes in v5:
>>
>>          - Rename RZ/V2H to RZ/V2H(P)
>>
>> Changes in v3:
>>
>>          - Rename from rzv2h-ivc.yaml to r9a09g057-ivc.yaml
>>          - Update clock and reset names
>>
>> Changes in v2:
>>
>>          - compatible matches filename
>>          - Added power-domains
>>          - Aligned clock and reset entries on opening "<"
>>          - Removed status = "okay"; from example
>> ---
>>   .../bindings/media/renesas,r9a09g057-ivc.yaml      | 103 +++++++++++++++++++++
>>   1 file changed, 103 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..8e236e46882668b2660d175e8b2cffe204aa781c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
>> @@ -0,0 +1,103 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/renesas,r9a09g057-ivc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Renesas RZ/V2H(P) Input Video Control Block
>> +
>> +maintainers:
>> +  - Daniel Scally <dan.scally@ideasonboard.com>
>> +
>> +description:
>> +  The IVC block is a module that takes video frames from memory and feeds them
>> +  to the Image Signal Processor for processing.
>> +
>> +properties:
>> +  compatible:
>> +    const: renesas,r9a09g057-ivc
> Nit, `const: renesas,r9a09g057-ivc # RZ/V2H(P)` as done for the rest
> of the Renesas bindings.

Ack>
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
>> +      - const: reg
>> +      - const: axi
>> +      - const: isp
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    items:
>> +      - description: Input Video Control block register access reset
>> +      - description: Video input data AXI bus reset
>> +      - description: ISP core reset
>> +
>> +  reset-names:
>> +    items:
>> +      - const: reg
>> +      - const: axi
>> +      - const: isp
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
>> +  - power-domains
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
>> +    isp-input@16040000 {
>> +      compatible = "renesas,r9a09g057-ivc";
>> +      reg = <0x16040000 0x230>;
>> +
>> +      clocks = <&cpg CPG_MOD 0xe3>,
>> +               <&cpg CPG_MOD 0xe4>,
>> +               <&cpg CPG_MOD 0xe5>;
>> +      clock-names = "reg", "axi", "isp";
>> +
>> +      power-domains = <&cpg>;
>> +
>> +      resets = <&cpg 0xd4>,
>> +               <&cpg 0xd1>,
>> +               <&cpg 0xd3>;
>> +      reset-names = "reg", "axi", "isp";
>> +
>> +      interrupts = <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
> I understand we split this up from ISP, there are other interrupts for
> ISP for example 860 which is similar to 861 where it outputs signal on
> rising instead of falling. Do you foresee this interrupt being used
> for IVC?  Rest LGTM.

I don't think so...as far as I can tell that interrupt is used for determining when the transfer has 
started, but I'm not aware of any decisions that we'd want to base on that event over the transfer 
finished interrupt.

Thanks
Dan


> 
> Cheers,
> Prabhakar
> 
>> +
>> +      port {
>> +        ivc_out: endpoint {
>> +          remote-endpoint = <&isp_in>;
>> +        };
>> +      };
>> +    };
>> +...
>>
>> --
>> 2.43.0
>>
>>


