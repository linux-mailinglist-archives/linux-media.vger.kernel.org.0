Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0774E1E83F0
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 18:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgE2QpK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 12:45:10 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:52874 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgE2QpJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 12:45:09 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04TGj61X123903;
        Fri, 29 May 2020 11:45:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590770706;
        bh=+BsaNXkX96cr4oyzkZvNbppPpMOHw0Q+X59UUJg7nAI=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=oKDEn1qhMwnhKFGHwnuO1P7Fu04LvOExZnrR7Z+O3IysqX2u5fEczdZkSm68LWtWf
         epkijJD8ZP8AFf/6txzEUOsic0yUhe2QxfC2EjbwjOGZU1027ySwTvYeXhUzaZZV74
         ZjrZUKdpYotNqPeY+C4UXN5rcYvR+gNJV5CKnhVs=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04TGj5QM001262;
        Fri, 29 May 2020 11:45:06 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 29
 May 2020 11:45:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 29 May 2020 11:45:05 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with SMTP id 04TGj40c005218;
        Fri, 29 May 2020 11:45:04 -0500
Date:   Fri, 29 May 2020 11:45:02 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Rob Herring <robh@kernel.org>
CC:     Hans Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 1/2] dt-binbings: media: ti-vpe: Document the VIP driver
Message-ID: <20200529164502.iuecqrirwm34mcyx@ti.com>
References: <20200522225412.29440-1-bparrot@ti.com>
 <20200522225412.29440-2-bparrot@ti.com>
 <20200528233933.GA881467@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200528233933.GA881467@bogus>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

Thanks for the review.

Rob Herring <robh@kernel.org> wrote on Thu [2020-May-28 17:39:33 -0600]:
> On Fri, May 22, 2020 at 05:54:11PM -0500, Benoit Parrot wrote:
> > Device Tree bindings for the Video Input Port (VIP) driver.
> 
> Bindings document h/w, not drivers.

I'll fix that.

> 
> > 
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  .../devicetree/bindings/media/ti,vip.yaml     | 394 ++++++++++++++++++
> >  MAINTAINERS                                   |   1 +
> >  2 files changed, 395 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/ti,vip.yaml b/Documentation/devicetree/bindings/media/ti,vip.yaml
> > new file mode 100644
> > index 000000000000..8a9084e42329
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/ti,vip.yaml
> > @@ -0,0 +1,394 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/ti,vip.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Texas Instruments DRA7x VIDEO INPUT PORT (VIP) Device Tree Bindings
> > +
> > +maintainers:
> > +  - Benoit Parrot <bparrot@ti.com>
> > +
> > +description: |-
> > +  The Video Input Port (VIP) is a key component for image capture
> > +  applications. The capture module provides the system interface and the
> > +  processing capability to connect parallel image-sensor as well as
> > +  BT.656/1120 capable encoder chip to DRA7x device.
> > +
> > +  Each VIP instance supports 2 independently configurable external video
> > +  input capture slices (Slice 0 and Slice 1) each providing up to two video
> > +  input ports (Port A and Port B) where Port A can be configured as
> > +  24/16/8-bit port and Port B is fixed as 8-bit port.
> > +  Here these ports a represented as follows
> > +    port@0 -> Slice 0 Port A
> > +    port@1 -> Slice 0 Port B
> > +    port@2 -> Slice 1 Port A
> > +    port@3 -> Slice 1 Port B
> > +
> > +  Each camera port nodes should contain a 'port' child node with child
> > +  'endpoint' node. Please refer to the bindings defined in
> > +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> > +
> > +properties:
> > +  compatible:
> > +    const: ti,dra7-vip
> > +
> > +  label:
> > +    description: Instance name
> 
> Kind of odd for this type of binding. Are there a define set or pattern 
> of values.

The label here are used to 'name' each H/W instance. And so far there can
be a up to 3 instances with the currently available devices, but that
doesn't mean there couldn't be more in the future. So I did not want to
limit it here.

> 
> > +
> > +  reg:
> > +    items:
> > +      - description: The VIP main register region
> > +      - description: Video Data Parser (PARSER) register region for Slice0
> > +      - description: Color Space Conversion (CSC) register region for Slice0
> > +      - description: Scaler (SC) register region for Slice0
> > +      - description: Video Data Parser (PARSER) register region for Slice1
> > +      - description: Color Space Conversion (CSC) register region for Slice1
> > +      - description: Scaler (SC) register region for Slice1
> > +      - description: Video Port Direct Memory Access (VPDMA) register region
> > +
> > +  reg-names:
> > +    items:
> > +      - const: vip
> > +      - const: parser0
> > +      - const: csc0
> > +      - const: sc0
> > +      - const: parser1
> > +      - const: csc1
> > +      - const: sc1
> > +      - const: vpdma
> > +
> > +  interrupts:
> > +    minItems: 2
> > +    description:
> > +      IRQ index 0 is used for Slice0 interrupts
> > +      IRQ index 1 is used for Slice1 interrupts
> > +
> > +  ti,vip-clk-polarity:
> > +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> > +    description:
> > +      phandle to the device control module. The 1st argument should
> > +      contain the register offset to the CTRL_CORE_SMA_SW_1 register.
> > +      2nd argument contains the bit field to slice 0 port A,
> > +      3rd argument contains the bit field to slice 0 port B,
> > +      4th argument contains the bit field to slice 1 port A,
> > +      5th argument contains the bit field to slice 1 port B.
> > +
> > +  # See ./video-interfaces.txt for details
> > +  ports:
> > +    type: object
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +      port@0:
> > +        type: object
> > +        additionalProperties: false
> > +
> > +        properties:
> > +          reg:
> > +            const: 0
> > +            description: Slice 0 Port A
> > +
> > +          label:
> > +            description: Port name. Usually the pin group name
> > +
> > +        patternProperties:
> > +          endpoint:
> > +            type: object
> > +            additionalProperties: false
> > +
> > +            properties:
> > +              hsync-active:
> > +                maxItems: 1
> 
> Not an array. Just:
> 
> hsync-active: true

OK I'll fix all of those.

> 
> > +
> > +              vsync-active:
> > +                maxItems: 1
> > +
> > +              pclk-sample:
> > +                maxItems: 1
> > +
> > +              bus-width:
> > +                maxItems: 1
> 
> Not an array. What subset of values are allowed?

So something like oneOf with a list then?

> 
> > +
> > +              ti,vip-pixel-mux:
> > +                type: boolean
> > +                description:
> > +                  In BT656/1120 mode, this enable pixel-muxing if
> > +                  the number of channels is either 1, 2 or 4. If this
> > +                  property is present then pixel-muxing is enabled
> > +                  otherwise it will use line-muxing.
> > +
> > +              ti,vip-channels:
> > +                $ref: "/schemas/types.yaml#definitions/uint8-array"
> > +                minItems: 1
> > +                maxItems: 16
> > +                description: |-
> > +                  In BT656/1120 mode, list of channel ids to be captured.
> > +                  If the property is not present then 1 channel is assumed.
> > +
> > +              remote-endpoint: true
> > +
> > +        required:
> > +          - reg
> > +          - label
> > +
> > +      port@1:
> > +        type: object
> > +        additionalProperties: false
> > +
> > +        properties:
> > +          reg:
> > +            const: 1
> > +            description: Slice 0 Port B
> > +
> > +          label:
> > +            description: Port name. Usually the pin group name
> > +
> > +        patternProperties:
> > +          endpoint:
> > +            type: object
> > +            additionalProperties: false
> > +
> > +            properties:
> > +              hsync-active:
> > +                maxItems: 1
> > +
> > +              vsync-active:
> > +                maxItems: 1
> > +
> > +              pclk-sample:
> > +                maxItems: 1
> > +
> > +              bus-width:
> > +                maxItems: 1
> > +
> > +              ti,vip-pixel-mux:
> > +                type: boolean
> > +                description:
> > +                  In BT656/1120 mode, this enable pixel-muxing if
> > +                  the number of channels is either 1, 2 or 4. If this
> > +                  property is present then pixel-muxing is enabled
> > +                  otherwise it will use line-muxing.
> > +
> > +              ti,vip-channels:
> > +                $ref: "/schemas/types.yaml#definitions/uint8-array"
> > +                minItems: 1
> > +                maxItems: 16
> > +                description:
> > +                  In BT656/1120 mode, list of channel ids to be captured.
> > +                  If the property is not present then 1 channel is assumed.
> > +
> > +              remote-endpoint: true
> > +
> > +        required:
> > +          - reg
> > +          - label
> > +
> > +      port@2:
> > +        type: object
> > +        additionalProperties: false
> > +
> > +        properties:
> > +          reg:
> > +            const: 2
> > +            description: Slice 1 Port A
> > +
> > +          label:
> > +            description: Port name. Usually the pin group name
> > +
> > +        patternProperties:
> > +          endpoint:
> > +            type: object
> > +            additionalProperties: false
> > +
> > +            properties:
> > +              hsync-active:
> > +                maxItems: 1
> > +
> > +              vsync-active:
> > +                maxItems: 1
> > +
> > +              pclk-sample:
> > +                maxItems: 1
> > +
> > +              bus-width:
> > +                maxItems: 1
> > +
> > +              ti,vip-pixel-mux:
> > +                type: boolean
> > +                description:
> > +                  In BT656/1120 mode, this enable pixel-muxing if
> > +                  the number of channels is either 1, 2 or 4. If this
> > +                  property is present then pixel-muxing is enabled
> > +                  otherwise it will use line-muxing.
> > +
> > +              ti,vip-channels:
> > +                $ref: "/schemas/types.yaml#definitions/uint8-array"
> > +                minItems: 1
> > +                maxItems: 16
> > +                description:
> > +                  In BT656/1120 mode, list of channel ids to be captured.
> > +                  If the property is not present then 1 channel is assumed.
> > +
> > +              remote-endpoint: true
> > +
> > +        required:
> > +          - reg
> > +          - label
> > +
> > +      port@3:
> > +        type: object
> > +        additionalProperties: false
> > +
> > +        properties:
> > +          reg:
> > +            const: 3
> > +            description: Slice 1 Port B
> > +
> > +          label:
> > +            description: Port name. Usually the pin group name
> > +
> > +        patternProperties:
> > +          endpoint:
> > +            type: object
> > +            additionalProperties: false
> > +
> > +            properties:
> > +              hsync-active:
> > +                maxItems: 1
> > +
> > +              vsync-active:
> > +                maxItems: 1
> > +
> > +              pclk-sample:
> > +                maxItems: 1
> > +
> > +              bus-width:
> > +                maxItems: 1
> > +
> > +              ti,vip-pixel-mux:
> > +                type: boolean
> > +                description:
> > +                  In BT656/1120 mode, this enable pixel-muxing if
> > +                  the number of channels is either 1, 2 or 4. If this
> > +                  property is present then pixel-muxing is enabled
> > +                  otherwise it will use line-muxing.
> > +
> > +              ti,vip-channels:
> > +                $ref: "/schemas/types.yaml#definitions/uint8-array"
> > +                minItems: 1
> > +                maxItems: 16
> > +                description:
> > +                  In BT656/1120 mode, list of channel ids to be captured.
> > +                  If the property is not present then 1 channel is assumed.
> > +
> > +              remote-endpoint: true
> 
> If all the properties are the same across ports, then do a 
> patternProperties with '^port@' and define them there. You'll still need 
> 'port@0', etc. to define what each port is.

Yeah I had tried to define something like that but I couldn't make pass
dt-binding-check wihtout any errors/warnings.

Can you point me to a recent example using this syntax?
Last time I check I couldn't find one.

Also I am not quite clear on the mechanism, you said to create a
patterProperties and then I wouols also have to define the individual port
themselves so I would have something like this:

      port@0:
        type: object
        additionalProperties: false

        properties:
          reg:
            const: 0
            description: Slice 0 Port A

          label:
            description: Port name. Usually the pin group name

      port@1:
        type: object
        additionalProperties: false

        properties:
          reg:
            const: 1
            description: Slice 0 Port B

          label:
            description: Port name. Usually the pin group name

      port@2:
        type: object
        additionalProperties: false

        properties:
          reg:
            const: 2
            description: Slice 1 Port A

          label:
            description: Port name. Usually the pin group name

      port@3:
        type: object
        additionalProperties: false

        properties:
          reg:
            const: 3
            description: Slice 1 Port B

          label:
            description: Port name. Usually the pin group name

And then in some way reference the patternProperties?
Or just put it before the individual ports?

> 
> > +
> > +        required:
> > +          - reg
> > +          - label
> > +
> > +    required:
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +      - port@0
> > +
> > +required:
> > +  - compatible
> > +  - label
> > +  - reg
> > +  - reg-names
> > +  - interrupts
> > +  - ti,vip-clk-polarity
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    vip1: vip@48970000 {
> > +        compatible = "ti,dra7-vip";
> > +        label = "vip1";
> > +        reg = <0x48970000 0x114>,
> > +              <0x48975500 0xD8>,
> > +              <0x48975700 0x18>,
> > +              <0x48975800 0x80>,
> > +              <0x48975a00 0xD8>,
> > +              <0x48975c00 0x18>,
> > +              <0x48975d00 0x80>,
> > +              <0x4897d000 0x400>;
> > +        reg-names = "vip",
> > +                    "parser0",
> > +                    "csc0",
> > +                    "sc0",
> > +                    "parser1",
> > +                    "csc1",
> > +                    "sc1",
> > +                    "vpdma";
> > +        interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
> > +        ti,vip-clk-polarity = <&scm_conf 0x534 0x1 0x4 0x2 0x8>;
> > +
> > +        ports {
> > +              #address-cells = <1>;
> > +              #size-cells = <0>;
> > +
> > +              vin1a: port@0 {
> > +                    reg = <0>;
> > +                    label = "vin1a";
> > +
> > +                    vin1a_ep: endpoint {
> > +                           remote-endpoint = <&camera1>;
> > +                           hsync-active = <1>;
> > +                           vsync-active = <1>;
> > +                           pclk-sample = <0>;
> > +                           bus-width = <8>;
> > +                    };
> > +              };
> > +              vin1b: port@1 {
> > +                    reg = <1>;
> > +                    label = "vin1b";
> > +              };
> > +              vin2a: port@2 {
> > +                    reg = <2>;
> > +                    label = "vin2a";
> > +              };
> > +              vin2b: port@3 {
> > +                    reg = <3>;
> > +                    label = "vin2b";
> > +              };
> > +         };
> > +    };
> > +
> > +    i2c {
> > +        clock-frequency = <400000>;
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +         camera@37 {
> > +              compatible = "ovti,ov10633";
> > +              reg = <0x37>;
> > +
> > +              clocks = <&fixed_clock>;
> > +              clocks-names = "xvclk";
> > +
> > +              port {
> > +                   camera1: endpoint {
> > +                           remote-endpoint = <&vin1a_ep>;
> > +                           hsync-active = <1>;
> > +                           vsync-active = <1>;
> > +                           pclk-sample = <0>;
> > +                           bus-width = <8>;
> > +                   };
> > +              };
> > +         };
> > +    };
> > +
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 2e9a5f6e4ff7..06856d05b53b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16947,6 +16947,7 @@ S:	Maintained
> >  W:	http://linuxtv.org/
> >  Q:	http://patchwork.linuxtv.org/project/linux-media/list/
> >  F:	Documentation/devicetree/bindings/media/ti,cal.yaml
> > +F:	Documentation/devicetree/bindings/media/ti,vip.yaml
> >  F:	Documentation/devicetree/bindings/media/ti,vpe.yaml
> >  F:	drivers/media/platform/ti-vpe/
> >  
> > -- 
> > 2.17.1
> > 

Regards,
Benoit
