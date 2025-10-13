Return-Path: <linux-media+bounces-44241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BACA9BD1A40
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 08:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2861188CCB2
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 06:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F2C2E6CD4;
	Mon, 13 Oct 2025 06:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tsKZzBgw"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1AB2E2299;
	Mon, 13 Oct 2025 06:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760336489; cv=none; b=c5fwrfD4uBEoLOCmXuRXdGIEYDo682QT8QGYKX37brWbI93O8nxHj1JQMZcFSDRKQT078ju0uOLLaNA9qG3BEXIT0HMEGVc++nz5IFwyj56eknXDpQNDtDFVkpp2WIv3doIhMWzrJo7JxHSgFsHJhR4gTARjYAhT6oGhLqpRXR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760336489; c=relaxed/simple;
	bh=780NLLiz415B4cv3pDlI8MxWiWsjr354tdA+jVlAGkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JtxrKbVDWUMkQcTLYkIO8mS0DNKtov+y0e6B1YWK+JpGpCO15x+TBjRrF2abYLmj60UEJVcn6lDy2lvOuq1kQpOshnd2OiIj/s6u98zX1VT+WnjsxWz28eYPb3yJ2M/cKNGsOMEQJETsRmeiOzPj+bvKfq3J6Ctr4Krz1OUTA+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tsKZzBgw; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59D6LCAJ757928;
	Mon, 13 Oct 2025 01:21:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760336472;
	bh=fBY5z944Lo62WVLzBqU3bUkUNEjxyWe8jeJ1LNGJb2w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=tsKZzBgwnjYpTfWdPQiisvr2Tzh5nVQ5MPLU/ZhdS/gkQbEkaaWFtLlAsdTukw83D
	 tnRRjkUGadKkV2T4aFg4vJ/j23gPN87sPnAX/aSf+ILq6qFv1jf4Ij8YJ/5NBAQOx9
	 k6YyZlTqepZ/Y4O0ZHH8366jJZaFwwvLLJDM9CBI=
Received: from DLEE203.ent.ti.com (dlee203.ent.ti.com [157.170.170.78])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59D6LB1Y3607212
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Oct 2025 01:21:12 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Oct
 2025 01:21:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Oct 2025 01:21:11 -0500
Received: from [10.24.68.198] (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59D6L7OV1349311;
	Mon, 13 Oct 2025 01:21:07 -0500
Message-ID: <7d183747-af9e-4607-8219-e89ddcb79654@ti.com>
Date: Mon, 13 Oct 2025 11:51:06 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/5] dt-bindings: media: ti: vpe: Add support for Video
 Input Port
To: Krzysztof Kozlowski <krzk@kernel.org>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <hverkuil+cisco@kernel.org>
CC: <sakari.ailus@linux.intel.com>, <bparrot@ti.com>,
        <jai.luthra@ideasonboard.com>, <dale@farnsworth.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        Sukrut Bellary
	<sbellary@baylibre.com>
References: <20250909080718.1381758-1-y-abhilashchandra@ti.com>
 <20250909080718.1381758-5-y-abhilashchandra@ti.com>
 <56a961c4-d11b-448c-81a6-a3a970627dda@kernel.org>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <56a961c4-d11b-448c-81a6-a3a970627dda@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Krzysztof,
Apologies for the delay in response.

On 09/09/25 14:06, Krzysztof Kozlowski wrote:
> On 09/09/2025 10:07, Yemike Abhilash Chandra wrote:
>> From: Dale Farnsworth <dale@farnsworth.org>
>>
>> Add device tree bindings for the Video Input Port. Video Input Port (VIP)
>> can be found on devices such as DRA7xx and provides a parallel interface
>> to a video source such as a sensor or TV decoder.
>>
>> Signed-off-by: Dale Farnsworth <dale@farnsworth.org>
>> Signed-off-by: Benoit Parrot <bparrot@ti.com>
>> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> ---
>> Change log:
>> Changes in v3:
>> - Remove redundant labels in bindings
>> - Remove minItems in interrupts and mandate exactly 2 interrupts using items
>> - Rename phandle from ti,vip-clk-polarity to ti,ctrl-module and explain why this is required by the device
>> - Make the phandle verifiable instead of just descriptive
>> - Drop entire sensor node from example DT
>> - Fix ports hierarchy using appropriate references and descriptions
>> - Use generic node names
>> - Add two new properties ti,vip-pixel-mux and ti,vip-channels with appropriate types and descriptions
>>
>>   .../devicetree/bindings/media/ti,vip.yaml     | 178 ++++++++++++++++++
>>   MAINTAINERS                                   |   1 +
>>   2 files changed, 179 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/ti,vip.yaml b/Documentation/devicetree/bindings/media/ti,vip.yaml
>> new file mode 100644
>> index 000000000000..c0bce44725db
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/ti,vip.yaml
>> @@ -0,0 +1,178 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) 2025 Texas Instruments Incorporated -  http://www.ti.com/
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/ti,vip.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Texas Instruments DRA7x VIDEO INPUT PORT (VIP).
> 
> Titles are not sentences.
> 
> Also, drop CAPS, WE DO NOT NEED TO EMPHASIZE THAT. It is a Video Input Port.
> 

I will fix this in v4.

> 
>> +
>> +maintainers:
>> +  - Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> +
>> +description: |-
>> +  Video Input Port (VIP) can be found on devices such as DRA7xx and
>> +  provides the system interface and the processing capability to
>> +  connect parallel image-sensor as well as BT.656/1120 capable encoder
>> +  chip to DRA7x device.
>> +
>> +  Each VIP instance supports 2 independently configurable external
>> +  video input capture slices (Slice 0 and Slice 1) each providing
>> +  up to two video input ports (Port A and Port B).
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ti,dra7-vip
>> +
>> +  reg:
>> +    items:
>> +      - description: The VIP main register region
>> +      - description: Video Data Parser (PARSER) register region for Slice0
>> +      - description: Color Space Conversion (CSC) register region for Slice0
>> +      - description: Scaler (SC) register region for Slice0
>> +      - description: Video Data Parser (PARSER) register region for Slice1
>> +      - description: Color Space Conversion (CSC) register region for Slice1
>> +      - description: Scaler (SC) register region for Slice1
>> +      - description: Video Port Direct Memory Access (VPDMA) register region
>> +
>> +  reg-names:
>> +    items:
>> +      - const: vip
>> +      - const: parser0
>> +      - const: csc0
>> +      - const: sc0
>> +      - const: parser1
>> +      - const: csc1
>> +      - const: sc1
>> +      - const: vpdma
>> +
>> +  interrupts:
>> +    items:
>> +      - description: IRQ index 0 is used for Slice0 interrupts
>> +      - description: IRQ index 1 is used for Slice1 interrupts
>> +
>> +  ti,ctrl-module:
>> +    description:
>> +      Reference to the device control module that provides clock-edge
>> +      inversion control for VIP ports. These controls allow the
>> +      VIP to sample pixel data on the correct clock edge.
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      items:
>> +        - description: phandle to device control module
>> +        - description: offset to the CTRL_CORE_SMA_SW_1 register
>> +        - description: Bit field to slice 0 port A
>> +        - description: Bit field to slice 0 port B
>> +        - description: Bit field to slice 1 port A
>> +        - description: Bit field to slice 1 port B
>> +    maxItems: 1
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    patternProperties:
>> +      '^port@[0-3]$':
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: |
>> +          Each VIP instance supports 2 independently configurable external video
>> +          input capture slices (Slice 0 and Slice 1) each providing up to two video
>> +          input ports (Port A and Port B). These ports represent the following
>> +          port@0 -> Slice 0 Port A
>> +          port@1 -> Slice 0 Port B
>> +          port@2 -> Slice 1 Port A
>> +          port@3 -> Slice 1 Port B
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              bus-width:
>> +                enum: [8, 16, 24]
>> +                default: 8
>> +
>> +              ti,vip-pixel-mux:
>> +                type: boolean
>> +                description:
>> +                  In BT656/1120 mode, this will enable pixel-muxing if
>> +                  the number of channels is either 1, 2 or 4. If this
>> +                  property is present then pixel-muxing is enabled
>> +                  otherwise it will use line-muxing.
> 
> This feels like runtime choice.
> 
>> +
>> +              ti,vip-channels:
>> +                $ref: /schemas/types.yaml#/definitions/uint8-array
>> +                minItems: 1
>> +                maxItems: 16
>> +                description:
>> +                  In BT656/1120 mode, list of channel ids to be captured.
>> +                  If the property is not present then 1 channel is assumed.
> 
> Also feels like runtime.
> 

I will drop these in v4.

>> +
>> +              remote-endpoint: true
> 
> Drop
> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - interrupts
>> +  - ti,ctrl-module
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    vip1: video@48970000 {
>> +        compatible = "ti,dra7-vip";
>> +        reg = <0x48970000 0x114>,
>> +              <0x48975500 0xD8>,
>> +              <0x48975700 0x18>,
>> +              <0x48975800 0x80>,
>> +              <0x48975a00 0xD8>,
>> +              <0x48975c00 0x18>,
>> +              <0x48975d00 0x80>,
> 
> Are you really, REALLY sure these are separate address spaces? Some
> people thing that gaps means address space finishes...
> 
> 
> How does your datasheet define these?
> 

These are not separate address spaces. The datasheet defines them as a
single address region: VIP1 (0x4897_0000 –> 0x4897_FFFF, 64 KiB).

We created three common libraries sc.c (scalar), csc.c (color space 
converter),
and vpdma.c, which are used by both VPE and VIP drivers. The helper 
functions
in these libraries were originally written in a way that assumes sc0, csc0,
sc1, and csc1 are separate address spaces. Since VPE has already been
upstreamed using this approach. I have tried to use the same kind of 
approach.
But I now understand that, this might not be correct to define these as 
separate
address spaces.

One solution would be to rewrite these helpers and update both VPE and
VIP accordingly, but changing these helpers now may risk breaking backward
compatibility for VPE.

Alternatively, we could make the VIP driver standalone by avoiding the 
use of these
helpers. I was able to achieve this for csc.c and sc.c, but for vpdma.c, 
I had to
export a specific function from vpdma.c, since the VIP driver no longer 
relies on the
helpers provided by vpdma.c (In the previous approach the helper would 
call this function)

I request suggestions on how to proceed here.

>> +              <0x4897d000 0x400>;
>> +        reg-names = "vip",
>> +                    "parser0",
>> +                    "csc0",
>> +                    "sc0",
>> +                    "parser1",
>> +                    "csc1",
>> +                    "sc1",
>> +                    "vpdma";
>> +        interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
>> +        ti,ctrl-module = <&scm_conf 0x534 0x0 0x2 0x1 0x3>;
>> +
>> +        ports {
>> +              #address-cells = <1>;
>> +              #size-cells = <0>;
>> +
>> +              vin1a: port@0 {
>> +                    reg = <0>;
>> +
>> +                    vin1a_ep: endpoint {
>> +                           remote-endpoint = <&camera1>;
>> +                           hsync-active = <1>;
>> +                           vsync-active = <1>;
>> +                           pclk-sample = <0>;
>> +                           bus-width = <8>;
> 
> Make example complete, also other properties.
> 
>> +                    };
>> +              };
>> +              vin1b: port@1 {
>> +                    reg = <1>;
> 
> Why no endpoints?
> 

Thanks, I will add endpoints and make example complete.

>> +              };
>> +              vin2a: port@2 {
>> +                    reg = <2>;
>> +              };
>> +              vin2b: port@3 {
>> +                    reg = <3>;
> 
> 
> 
> Best regards,
> Krzysztof

Thanks and Regards,
Yemike Abhilash Chandra

