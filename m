Return-Path: <linux-media+bounces-41062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 848E0B356AA
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 10:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72AB11B6319C
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 08:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F052F83C4;
	Tue, 26 Aug 2025 08:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XyRlxjK0"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA402248A4;
	Tue, 26 Aug 2025 08:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756196537; cv=none; b=rdtsOl5H9iQ4GGb6zAw0qUiixyN448mq/GYFug9kvvcCrYRoZwBZrvxoFWB/am+KCtzPg7zE74sJyTHnCYgEh2aZJlv+vi8EmHA4IjVdwKxURiQ9n7SkpS6lybo6JXJoUUhgbAtmcmUy2wUY2TeGZwaeNhnEU4uArMH3eD0ViRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756196537; c=relaxed/simple;
	bh=pcjGN8tbRkK+7AhA3wU4O1n5nnLI3pmMLYSMTl94ZBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=R8tSPnn1mkoTrCgr98MgV/zSHecd87ZokqavHFe6fwlsFpAXQNnjsypBAA+7HjOsikHvCRC55D5xKLSXemnYJ6wDiVJZcYMVbwr3pHVmmOzOK18gIpbEFJVgWhkvSl8LfhaKw0IsauaZhZQE4Uc1Wm+Ba0eUjMUbo21g2LE8Tp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=XyRlxjK0; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57Q8LDBH1489926;
	Tue, 26 Aug 2025 03:21:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756196473;
	bh=6ySDUI/SRrsPsEOYJNldpl+U5ofgDVVIZVNgOk0hoDs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XyRlxjK0Batfes1D08n0MNc+H4i0i2X7zCm6W0V+KG1P/vZdmeoPDlyfPiJrg5hFc
	 uGvlX6o4QLM9d4Bq6MQU4jkmO8AHHq0U+lIeJe6WrqRf94x0bJ6MOFbKvjQ8EbNX2C
	 J5CJOXhUYl1DoBLSSdK/rmxGmKZK/X06wY2O+oE4=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57Q8LC1m1538655
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 26 Aug 2025 03:21:12 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 26
 Aug 2025 03:21:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 26 Aug 2025 03:21:11 -0500
Received: from [10.24.68.198] (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57Q8L4uR842435;
	Tue, 26 Aug 2025 03:21:05 -0500
Message-ID: <35d6e8f4-2bac-454a-8098-425225437521@ti.com>
Date: Tue, 26 Aug 2025 13:51:03 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/4] dt-bindings: media: ti: vpe: Add bindings for
 Video Input Port
To: Krzysztof Kozlowski <krzk@kernel.org>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux@armlinux.org.uk>, <ardb@kernel.org>, <ebiggers@kernel.org>,
        <geert+renesas@glider.be>, <claudiu.beznea@tuxon.dev>,
        <bparrot@ti.com>, <andre.draszik@linaro.org>,
        <kuninori.morimoto.gx@renesas.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <heikki.krogerus@linux.intel.com>, <kory.maincent@bootlin.com>,
        <florian.fainelli@broadcom.com>, <lumag@kernel.org>,
        <dale@farnsworth.org>, <sbellary@baylibre.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <dagriego@biglakesoftware.com>, <u-kumar1@ti.com>
References: <20250716111912.235157-1-y-abhilashchandra@ti.com>
 <20250716111912.235157-4-y-abhilashchandra@ti.com>
 <a585e539-9847-4252-bfb0-860b5c372d01@kernel.org>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <a585e539-9847-4252-bfb0-860b5c372d01@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Krzysztof,
Thanks for the review.

On 16/07/25 19:35, Krzysztof Kozlowski wrote:
> On 16/07/2025 13:19, Yemike Abhilash Chandra wrote:
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
>> Changelog:
>> Changes in v2:
>> - Remove array and just use hsync: true in bindings
>> - Remove array and use enum for bus width in bindings
>> - Use pattern properties since properties across ports are same
>> - Update copyright year
>>
> 
> This fails testing so limited review follows.
> 
>>   .../devicetree/bindings/media/ti,vip.yaml     | 211 ++++++++++++++++++
>>   MAINTAINERS                                   |   1 +
>>   2 files changed, 212 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/ti,vip.yaml b/Documentation/devicetree/bindings/media/ti,vip.yaml
>> new file mode 100644
>> index 000000000000..44091c15a537
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/ti,vip.yaml
>> @@ -0,0 +1,211 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) 2025 Texas Instruments Incorporated -  http://www.ti.com/
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/ti,vip.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Texas Instruments DRA7x VIDEO INPUT PORT (VIP).
>> +
>> +maintainers:
>> +  - Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> +
>> +description: |-
>> +  The Video Input Port (VIP) is a key component for image capture
>> +  applications. The capture module provides the system interface and the
>> +  processing capability to connect parallel image-sensor as well as
>> +  BT.656/1120 capable encoder chip to DRA7x device.
>> +
>> +  Each VIP instance supports 2 independently configurable external video
>> +  input capture slices (Slice 0 and Slice 1) each providing up to two video
>> +  input ports (Port A and Port B) where Port A can be configured as
>> +  24/16/8-bit port and Port B is fixed as 8-bit port.
>> +  Here these ports a represented as follows
>> +    port@0 -> Slice 0 Port A
>> +    port@1 -> Slice 0 Port B
>> +    port@2 -> Slice 1 Port A
>> +    port@3 -> Slice 1 Port B
>> +
>> +  Each camera port nodes should contain a 'port' child node with child
>> +  'endpoint' node. Please refer to the bindings defined in
>> +  Documentation/devicetree/bindings/media/video-interfaces.yaml.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ti,dra7-vip
>> +
>> +  label:
>> +    description: Instance name
> 
> Why do you need it? How many instances are there per SoC?
> 

I now understand that specifying instance id is not allowed.
I will fix this v3.

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
>> +    minItems: 2
> 
> Which makes 10 interrupts valid :/
> 

Understood, will fix this in v3.

>> +    description:
>> +      IRQ index 0 is used for Slice0 interrupts
>> +      IRQ index 1 is used for Slice1 interrupts
> 
> No, list the items with description, just like most bindings.
> 

Understood. will do that way in v3.

>> +
>> +  ti,vip-clk-polarity:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description:
>> +      phandle to the device control module. The 1st argument should
> 
> Polarity is not a phandle... The name is confusing, especially that
> nothing in description matches it. Explain what is the purpose of this
> in THIS device. For what this device needs it?
> 

Thanks, I Will name this better and also provide rationale on why it is
needed in v3.

>> +      contain the register offset to the CTRL_CORE_SMA_SW_1 register.
>> +      2nd argument contains the bit field to slice 0 port A,
>> +      3rd argument contains the bit field to slice 0 port B,
>> +      4th argument contains the bit field to slice 1 port A,
>> +      5th argument contains the bit field to slice 1 port B.
> 
> Don't open code schema in any case. Look at other examples how such this
> is encoded.
> 

Understood, will fix this in v3

>> +
>> +patternProperties:
>> +  '^port@[0-3]$':
>> +    type: object
>> +    additionalProperties: false
> 
> Missing ref. From which binding did you take port without ref?
> 
> What are these ports? Look below:
> 
> 

Apologies. I will fix this entire hierarchy using appropriate
refs and description. Thanks.

>> +
>> +    properties:
>> +      "#address-cells":
>> +        const: 1
>> +
>> +      "#size-cells":
>> +        const: 0
>> +      reg:
>> +        description: The port number
> 
> You add redundant, obvious descriptions, but you do not add description
> what each port is.
> 
>> +        maxItems: 1
> 
> 
> Order this according to DTS coding style. See other bindings.
> 
>> +
>> +      label:
>> +        description: Port name. Usually the pin group name
> 
> Why do you have labels everywhere?
> 

I will remove this in v3.

>> +
>> +      endpoint:
>> +        $ref: /schemas/graph.yaml#/properties/endpoint
>> +        type: object
>> +        additionalProperties: false
>> +
>> +        properties:
>> +          hsync-active: true
>> +          vsync-active: true
>> +          pclk-sample: true
> 
> Where are definitions of above?
> 
>> +          bus-width:
>> +            enum: [8, 24]
>> +            default: 8
>> +
>> +          remote-endpoint: true
>> +
>> +    required:
>> +      - "#address-cells"
>> +      - "#size-cells"
>> +      - port@0
>> +      - reg
>> +      - label
> 
> So port@0 is next to label, yes? Let's go to your example
> 
>> +
>> +required:
>> +  - compatible
>> +  - label
>> +  - reg
>> +  - reg-names
>> +  - interrupts
>> +  - ti,vip-clk-polarity
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    vip1: vip@48970000 {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 

Understood, will correct this in v3.

> 
>> +        compatible = "ti,dra7-vip1";
>> +        label = "vip1";
>> +        reg = <0x48970000 0x114>,
>> +              <0x48975500 0xD8>,
>> +              <0x48975700 0x18>,
>> +              <0x48975800 0x80>,
>> +              <0x48975a00 0xD8>,
>> +              <0x48975c00 0x18>,
>> +              <0x48975d00 0x80>,
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
>> +        ti,vip-clk-polarity = <&scm_conf 0x534 0x1 0x4 0x2 0x8>;
>> +
>> +        ports {
>> +              #address-cells = <1>;
>> +              #size-cells = <0>;
>> +
> 
> Where is the label? It is supposed to be required just like port@0 is.
> 

I will fix this in v3.

> 
>> +              vin1a: port@0 {
> 
> 
>> +                    reg = <0>;
>> +                    label = "vin1a";
>> +
>> +                    vin1a_ep: endpoint {
>> +                           remote-endpoint = <&camera1>;
>> +                           hsync-active = <1>;
>> +                           vsync-active = <1>;
>> +                           pclk-sample = <0>;
>> +                           bus-width = <8>;
>> +                    };
>> +              };
>> +              vin1b: port@1 {
>> +                    reg = <1>;
>> +                    label = "vin1b";
>> +              };
>> +              vin2a: port@2 {
>> +                    reg = <2>;
>> +                    label = "vin2a";
>> +              };
>> +              vin2b: port@3 {
>> +                    reg = <3>;
>> +                    label = "vin2b";
>> +              };
>> +         };
>> +    };
>> +
>> +    i2c {
> 
> Drop entire node, not relevant.
>

I will remove this in v3.

Thanks and Regards
Yemike Abhilash Chandra

> 
> Best regards,
> Krzysztof


