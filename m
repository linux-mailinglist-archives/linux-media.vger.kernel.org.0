Return-Path: <linux-media+bounces-37878-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F529B07793
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 16:05:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2395D1AA6262
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 14:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5F521C19A;
	Wed, 16 Jul 2025 14:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T8HQvqt7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20CD1C2335;
	Wed, 16 Jul 2025 14:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752674725; cv=none; b=Xfd9tiQdLtKtKgJ0z9zouAHvkNfUZK3CrLpadIFNFWEIMPSqNW9xTIhB5tzCYDw6WglmAgIfIYjSW1s7KqGa5A1NSUKuvykXCbS/EnmOxHUly0c6t8cV9zHgF+St7ZLWFjvj1YshCuLKLpamjrBDhOMUSdjZ7CrMEDGf+/JPFnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752674725; c=relaxed/simple;
	bh=Kw5fbr0AUuPCrIitZzWwqC7O9jix80yk2fcOuypmmb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RxwRatBOEHIgIh48QLeHk8lUhCTP3+3y3q7O7sVMHNmvyLjGcaNc6PAm8KH8X9NbkaOYIoCyTyKxbnyH1D6nlqMxt3k/mJu0epeKpYNd8LD8IS6Nd+1wXmEj9kcDwVKmogtF+nR/yL1LhPGGYPmqgbbFGrwo0/FmCNi0rr4Cj/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T8HQvqt7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50661C4CEE7;
	Wed, 16 Jul 2025 14:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752674725;
	bh=Kw5fbr0AUuPCrIitZzWwqC7O9jix80yk2fcOuypmmb8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T8HQvqt7azcz5K0DJHOnoghoojUGQUORNqMdv81wLCtVNeNun7d87UXUPg2lYD71X
	 3//FtYHHfTvYyDvRg2ppbJMAY8ANgt0ZsAV8kxdHuWB7ynDzkhuC8pN1vzm9fCcVdA
	 SAX9ceslE+M3ugRknHFBmoCIXKBbhFkLDcE9ldo/N2QlZwh+/YhhxvgR59Qmd18bAI
	 x54EwnPCQJQlW8+jfS5f3pYrZy/z7fVQXT4eyllxHATeHs3XuAr1meraBr4TrRkyM/
	 zjTBg4NRb/C4MA2eBBV/ZGLDgBVYr8Htu2dEpNqjat/3Jky/OMXh9bi7K719QDmaOi
	 8BuYWg0C2N0fQ==
Message-ID: <a585e539-9847-4252-bfb0-860b5c372d01@kernel.org>
Date: Wed, 16 Jul 2025 16:05:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/4] dt-bindings: media: ti: vpe: Add bindings for
 Video Input Port
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux@armlinux.org.uk, ardb@kernel.org, ebiggers@kernel.org,
 geert+renesas@glider.be, claudiu.beznea@tuxon.dev, bparrot@ti.com,
 andre.draszik@linaro.org, kuninori.morimoto.gx@renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, heikki.krogerus@linux.intel.com,
 kory.maincent@bootlin.com, florian.fainelli@broadcom.com, lumag@kernel.org,
 dale@farnsworth.org, sbellary@baylibre.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dagriego@biglakesoftware.com,
 u-kumar1@ti.com
References: <20250716111912.235157-1-y-abhilashchandra@ti.com>
 <20250716111912.235157-4-y-abhilashchandra@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250716111912.235157-4-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/07/2025 13:19, Yemike Abhilash Chandra wrote:
> From: Dale Farnsworth <dale@farnsworth.org>
> 
> Add device tree bindings for the Video Input Port. Video Input Port (VIP)
> can be found on devices such as DRA7xx and provides a parallel interface
> to a video source such as a sensor or TV decoder.
> 
> Signed-off-by: Dale Farnsworth <dale@farnsworth.org>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
> Changelog:
> Changes in v2:
> - Remove array and just use hsync: true in bindings
> - Remove array and use enum for bus width in bindings
> - Use pattern properties since properties across ports are same
> - Update copyright year
> 

This fails testing so limited review follows.

>  .../devicetree/bindings/media/ti,vip.yaml     | 211 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 212 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/ti,vip.yaml b/Documentation/devicetree/bindings/media/ti,vip.yaml
> new file mode 100644
> index 000000000000..44091c15a537
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/ti,vip.yaml
> @@ -0,0 +1,211 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2025 Texas Instruments Incorporated -  http://www.ti.com/
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/ti,vip.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments DRA7x VIDEO INPUT PORT (VIP).
> +
> +maintainers:
> +  - Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> +
> +description: |-
> +  The Video Input Port (VIP) is a key component for image capture
> +  applications. The capture module provides the system interface and the
> +  processing capability to connect parallel image-sensor as well as
> +  BT.656/1120 capable encoder chip to DRA7x device.
> +
> +  Each VIP instance supports 2 independently configurable external video
> +  input capture slices (Slice 0 and Slice 1) each providing up to two video
> +  input ports (Port A and Port B) where Port A can be configured as
> +  24/16/8-bit port and Port B is fixed as 8-bit port.
> +  Here these ports a represented as follows
> +    port@0 -> Slice 0 Port A
> +    port@1 -> Slice 0 Port B
> +    port@2 -> Slice 1 Port A
> +    port@3 -> Slice 1 Port B
> +
> +  Each camera port nodes should contain a 'port' child node with child
> +  'endpoint' node. Please refer to the bindings defined in
> +  Documentation/devicetree/bindings/media/video-interfaces.yaml.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,dra7-vip
> +
> +  label:
> +    description: Instance name

Why do you need it? How many instances are there per SoC?

> +
> +  reg:
> +    items:
> +      - description: The VIP main register region
> +      - description: Video Data Parser (PARSER) register region for Slice0
> +      - description: Color Space Conversion (CSC) register region for Slice0
> +      - description: Scaler (SC) register region for Slice0
> +      - description: Video Data Parser (PARSER) register region for Slice1
> +      - description: Color Space Conversion (CSC) register region for Slice1
> +      - description: Scaler (SC) register region for Slice1
> +      - description: Video Port Direct Memory Access (VPDMA) register region
> +
> +  reg-names:
> +    items:
> +      - const: vip
> +      - const: parser0
> +      - const: csc0
> +      - const: sc0
> +      - const: parser1
> +      - const: csc1
> +      - const: sc1
> +      - const: vpdma
> +
> +  interrupts:
> +    minItems: 2

Which makes 10 interrupts valid :/

> +    description:
> +      IRQ index 0 is used for Slice0 interrupts
> +      IRQ index 1 is used for Slice1 interrupts

No, list the items with description, just like most bindings.

> +
> +  ti,vip-clk-polarity:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      phandle to the device control module. The 1st argument should

Polarity is not a phandle... The name is confusing, especially that
nothing in description matches it. Explain what is the purpose of this
in THIS device. For what this device needs it?

> +      contain the register offset to the CTRL_CORE_SMA_SW_1 register.
> +      2nd argument contains the bit field to slice 0 port A,
> +      3rd argument contains the bit field to slice 0 port B,
> +      4th argument contains the bit field to slice 1 port A,
> +      5th argument contains the bit field to slice 1 port B.

Don't open code schema in any case. Look at other examples how such this
is encoded.

> +
> +patternProperties:
> +  '^port@[0-3]$':
> +    type: object
> +    additionalProperties: false

Missing ref. From which binding did you take port without ref?

What are these ports? Look below:


> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +      reg:
> +        description: The port number

You add redundant, obvious descriptions, but you do not add description
what each port is.

> +        maxItems: 1


Order this according to DTS coding style. See other bindings.

> +
> +      label:
> +        description: Port name. Usually the pin group name

Why do you have labels everywhere?

> +
> +      endpoint:
> +        $ref: /schemas/graph.yaml#/properties/endpoint
> +        type: object
> +        additionalProperties: false
> +
> +        properties:
> +          hsync-active: true
> +          vsync-active: true
> +          pclk-sample: true

Where are definitions of above?

> +          bus-width:
> +            enum: [8, 24]
> +            default: 8
> +
> +          remote-endpoint: true
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - port@0
> +      - reg
> +      - label

So port@0 is next to label, yes? Let's go to your example

> +
> +required:
> +  - compatible
> +  - label
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - ti,vip-clk-polarity
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    vip1: vip@48970000 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +        compatible = "ti,dra7-vip1";
> +        label = "vip1";
> +        reg = <0x48970000 0x114>,
> +              <0x48975500 0xD8>,
> +              <0x48975700 0x18>,
> +              <0x48975800 0x80>,
> +              <0x48975a00 0xD8>,
> +              <0x48975c00 0x18>,
> +              <0x48975d00 0x80>,
> +              <0x4897d000 0x400>;
> +        reg-names = "vip",
> +                    "parser0",
> +                    "csc0",
> +                    "sc0",
> +                    "parser1",
> +                    "csc1",
> +                    "sc1",
> +                    "vpdma";
> +        interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
> +        ti,vip-clk-polarity = <&scm_conf 0x534 0x1 0x4 0x2 0x8>;
> +
> +        ports {
> +              #address-cells = <1>;
> +              #size-cells = <0>;
> +

Where is the label? It is supposed to be required just like port@0 is.


> +              vin1a: port@0 {


> +                    reg = <0>;
> +                    label = "vin1a";
> +
> +                    vin1a_ep: endpoint {
> +                           remote-endpoint = <&camera1>;
> +                           hsync-active = <1>;
> +                           vsync-active = <1>;
> +                           pclk-sample = <0>;
> +                           bus-width = <8>;
> +                    };
> +              };
> +              vin1b: port@1 {
> +                    reg = <1>;
> +                    label = "vin1b";
> +              };
> +              vin2a: port@2 {
> +                    reg = <2>;
> +                    label = "vin2a";
> +              };
> +              vin2b: port@3 {
> +                    reg = <3>;
> +                    label = "vin2b";
> +              };
> +         };
> +    };
> +
> +    i2c {

Drop entire node, not relevant.


Best regards,
Krzysztof

