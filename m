Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF43F6899
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2019 11:46:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbfKJKqf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Nov 2019 05:46:35 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:41081 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726609AbfKJKqe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Nov 2019 05:46:34 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id TkjkiNJnGQBsYTkjni1XlF; Sun, 10 Nov 2019 11:46:31 +0100
Subject: Re: [PATCH 3/3] dt-bindings: rcar-vin: Convert bindings to
 json-schema
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20191108021609.2584272-1-niklas.soderlund+renesas@ragnatech.se>
 <20191108021609.2584272-4-niklas.soderlund+renesas@ragnatech.se>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <aca0ea95-bf76-dc62-7922-228a9fe94d78@xs4all.nl>
Date:   Sun, 10 Nov 2019 11:46:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191108021609.2584272-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfLOOP6nieVrImAL8/Ye0qWpi2dEe+32InLlJfVjOrCQNwpYjZY0Ugq7wDIAVDvCe3XWmllD4J2sQFKN5KbNEiLBaihlXAUX+Q9X41vbnrMg6lhKegYhf
 +LngW6RNOBBwzeAQyR2Zf81wB/5tG947Fl8jc3SbvJN9IoMNJptP1Sm0nt9SMrM3nt5upa8aEbq4HVOJo9MqViIO2SUXPXXEPjfMBCi1RoDD9UArHz6Tr1/a
 wGhpbz28iHPnAejqLhIMtdznEkkr8kwYZAzPG0raGQFvFJO/EbnMsKThFu4g/7W01GICvRCXQXFP+gADEQBF9WVQW1gMUOT7xpKLKapm8xJe3fUXo4oKu7nb
 NGQUmET7
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/8/19 3:16 AM, Niklas Söderlund wrote:
> Convert Renesas R-Car VIN bindings documentation to json-schema.
> 
> As the examples in the bindings now can be tested add a new one which
> describes how the both a parallel and a CSI-2 source can be connected on
> Gen3 SoCs.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Same here: you forgot to update MAINTAINERS.

Regards,

	Hans

> ---
>  .../devicetree/bindings/media/renesas,vin.txt | 217 ----------
>  .../bindings/media/renesas,vin.yaml           | 409 ++++++++++++++++++
>  2 files changed, 409 insertions(+), 217 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,vin.txt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,vin.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,vin.txt b/Documentation/devicetree/bindings/media/renesas,vin.txt
> deleted file mode 100644
> index 5eefd62ac5c5b9fd..0000000000000000
> --- a/Documentation/devicetree/bindings/media/renesas,vin.txt
> +++ /dev/null
> @@ -1,217 +0,0 @@
> -Renesas R-Car Video Input driver (rcar_vin)
> --------------------------------------------
> -
> -The rcar_vin device provides video input capabilities for the Renesas R-Car
> -family of devices.
> -
> -Each VIN instance has a single parallel input that supports RGB and YUV video,
> -with both external synchronization and BT.656 synchronization for the latter.
> -Depending on the instance the VIN input is connected to external SoC pins, or
> -on Gen3 and RZ/G2 platforms to a CSI-2 receiver.
> -
> - - compatible: Must be one or more of the following
> -   - "renesas,vin-r8a7743" for the R8A7743 device
> -   - "renesas,vin-r8a7744" for the R8A7744 device
> -   - "renesas,vin-r8a7745" for the R8A7745 device
> -   - "renesas,vin-r8a77470" for the R8A77470 device
> -   - "renesas,vin-r8a774a1" for the R8A774A1 device
> -   - "renesas,vin-r8a774b1" for the R8A774B1 device
> -   - "renesas,vin-r8a774c0" for the R8A774C0 device
> -   - "renesas,vin-r8a7778" for the R8A7778 device
> -   - "renesas,vin-r8a7779" for the R8A7779 device
> -   - "renesas,vin-r8a7790" for the R8A7790 device
> -   - "renesas,vin-r8a7791" for the R8A7791 device
> -   - "renesas,vin-r8a7792" for the R8A7792 device
> -   - "renesas,vin-r8a7793" for the R8A7793 device
> -   - "renesas,vin-r8a7794" for the R8A7794 device
> -   - "renesas,vin-r8a7795" for the R8A7795 device
> -   - "renesas,vin-r8a7796" for the R8A7796 device
> -   - "renesas,vin-r8a77965" for the R8A77965 device
> -   - "renesas,vin-r8a77970" for the R8A77970 device
> -   - "renesas,vin-r8a77980" for the R8A77980 device
> -   - "renesas,vin-r8a77990" for the R8A77990 device
> -   - "renesas,vin-r8a77995" for the R8A77995 device
> -   - "renesas,rcar-gen2-vin" for a generic R-Car Gen2 or RZ/G1 compatible
> -     device.
> -
> -   When compatible with the generic version nodes must list the
> -   SoC-specific version corresponding to the platform first
> -   followed by the generic version.
> -
> - - reg: the register base and size for the device registers
> - - interrupts: the interrupt for the device
> - - clocks: Reference to the parent clock
> -
> -The per-board settings for Gen2 and RZ/G1 platforms:
> -
> -- port - sub-node describing a single endpoint connected to the VIN
> -  from external SoC pins as described in video-interfaces.txt[1].
> -  Only the first one will be considered as each vin interface has one
> -  input port.
> -
> -  - Optional properties for endpoint nodes:
> -    - hsync-active: see [1] for description. Default is active high.
> -    - vsync-active: see [1] for description. Default is active high.
> -      If both HSYNC and VSYNC polarities are not specified, embedded
> -      synchronization is selected.
> -    - field-active-even: see [1] for description. Default is active high.
> -    - bus-width: see [1] for description. The selected bus width depends on
> -      the SoC type and selected input image format.
> -      Valid values are: 8, 10, 12, 16, 24 and 32.
> -    - data-shift: see [1] for description. Valid values are 0 and 8.
> -    - data-enable-active: polarity of CLKENB signal, see [1] for
> -      description. Default is active high.
> -
> -The per-board settings for Gen3 and RZ/G2 platforms:
> -
> -Gen3 and RZ/G2 platforms can support both a single connected parallel input
> -source from external SoC pins (port@0) and/or multiple parallel input sources
> -from local SoC CSI-2 receivers (port@1) depending on SoC.
> -
> -- renesas,id - ID number of the VIN, VINx in the documentation.
> -- ports
> -    - port@0 - sub-node describing a single endpoint connected to the VIN
> -      from external SoC pins as described in video-interfaces.txt[1].
> -      Describing more than one endpoint in port@0 is invalid. Only VIN
> -      instances that are connected to external pins should have port@0.
> -
> -      Endpoint nodes of port@0 support the optional properties listed in
> -      the Gen2 per-board settings description.
> -
> -    - port@1 - sub-nodes describing one or more endpoints connected to
> -      the VIN from local SoC CSI-2 receivers. The endpoint numbers must
> -      use the following schema.
> -
> -        - endpoint@0 - sub-node describing the endpoint connected to CSI20
> -        - endpoint@1 - sub-node describing the endpoint connected to CSI21
> -        - endpoint@2 - sub-node describing the endpoint connected to CSI40
> -        - endpoint@3 - sub-node describing the endpoint connected to CSI41
> -
> -      Endpoint nodes of port@1 do not support any optional endpoint property.
> -
> -Device node example for Gen2 platforms
> ---------------------------------------
> -
> -        aliases {
> -                vin0 = &vin0;
> -        };
> -
> -        vin0: vin@e6ef0000 {
> -                compatible = "renesas,vin-r8a7790", "renesas,rcar-gen2-vin";
> -                clocks = <&mstp8_clks R8A7790_CLK_VIN0>;
> -                reg = <0 0xe6ef0000 0 0x1000>;
> -                interrupts = <0 188 IRQ_TYPE_LEVEL_HIGH>;
> -                status = "disabled";
> -        };
> -
> -Board setup example for Gen2 platforms (vin1 composite video input)
> --------------------------------------------------------------------
> -
> -&i2c2   {
> -        status = "okay";
> -        pinctrl-0 = <&i2c2_pins>;
> -        pinctrl-names = "default";
> -
> -        adv7180@20 {
> -                compatible = "adi,adv7180";
> -                reg = <0x20>;
> -                remote = <&vin1>;
> -
> -                port {
> -                        adv7180: endpoint {
> -                                bus-width = <8>;
> -                                remote-endpoint = <&vin1ep0>;
> -                        };
> -                };
> -        };
> -};
> -
> -/* composite video input */
> -&vin1 {
> -        pinctrl-0 = <&vin1_pins>;
> -        pinctrl-names = "default";
> -
> -        status = "okay";
> -
> -        port {
> -                vin1ep0: endpoint {
> -                        remote-endpoint = <&adv7180>;
> -                        bus-width = <8>;
> -                };
> -        };
> -};
> -
> -Device node example for Gen3 platforms
> ---------------------------------------
> -
> -        vin0: video@e6ef0000 {
> -                compatible = "renesas,vin-r8a7795";
> -                reg = <0 0xe6ef0000 0 0x1000>;
> -                interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
> -                clocks = <&cpg CPG_MOD 811>;
> -                power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> -                resets = <&cpg 811>;
> -                renesas,id = <0>;
> -
> -                ports {
> -                        #address-cells = <1>;
> -                        #size-cells = <0>;
> -
> -                        port@1 {
> -                                #address-cells = <1>;
> -                                #size-cells = <0>;
> -
> -                                reg = <1>;
> -
> -                                vin0csi20: endpoint@0 {
> -                                        reg = <0>;
> -                                        remote-endpoint= <&csi20vin0>;
> -                                };
> -                                vin0csi21: endpoint@1 {
> -                                        reg = <1>;
> -                                        remote-endpoint= <&csi21vin0>;
> -                                };
> -                                vin0csi40: endpoint@2 {
> -                                        reg = <2>;
> -                                        remote-endpoint= <&csi40vin0>;
> -                                };
> -                        };
> -                };
> -        };
> -
> -        csi20: csi2@fea80000 {
> -                compatible = "renesas,r8a7795-csi2";
> -                reg = <0 0xfea80000 0 0x10000>;
> -                interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
> -                clocks = <&cpg CPG_MOD 714>;
> -                power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> -                resets = <&cpg 714>;
> -
> -                ports {
> -                        #address-cells = <1>;
> -                        #size-cells = <0>;
> -
> -                        port@0 {
> -                                reg = <0>;
> -                                csi20_in: endpoint {
> -                                        clock-lanes = <0>;
> -                                        data-lanes = <1>;
> -                                        remote-endpoint = <&adv7482_txb>;
> -                                };
> -                        };
> -
> -                        port@1 {
> -                                #address-cells = <1>;
> -                                #size-cells = <0>;
> -
> -                                reg = <1>;
> -
> -                                csi20vin0: endpoint@0 {
> -                                        reg = <0>;
> -                                        remote-endpoint = <&vin0csi20>;
> -                                };
> -                        };
> -                };
> -        };
> -
> -[1] video-interfaces.txt common video media interface
> diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> new file mode 100644
> index 0000000000000000..be261d9a98d62dcd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> @@ -0,0 +1,409 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (C) 2019 Renesas Electronics Corp.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/renesas,vin.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car Video Input (VIN)
> +
> +maintainers:
> +  - Niklas Söderlund <niklas.soderlund@ragnatech.se>
> +
> +description: |-
> +  The R-Car Video Input (VIN) device provides video input capabilities for the
> +  Renesas R-Car family of devices.
> +
> +  Each VIN instance has a single parallel input that supports RGB and YUV video,
> +  with both external synchronization and BT.656 synchronization for the latter.
> +  Depending on the instance the VIN input is connected to external SoC pins, or
> +  on Gen3 and RZ/G2 platforms to a CSI-2 receiver.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +        - enum:
> +          - renesas,vin-r8a7743  # RZ/G1M
> +          - renesas,vin-r8a7744  # RZ/G1N
> +          - renesas,vin-r8a7745  # RZ/G1E
> +          - renesas,vin-r8a77470 # RZ/G1C
> +          - renesas,vin-r8a7790  # R-Car H2
> +          - renesas,vin-r8a7791  # R-Car M2-W
> +          - renesas,vin-r8a7792  # R-Car V2H
> +          - renesas,vin-r8a7793  # R-Car M2-N
> +          - renesas,vin-r8a7794  # R-Car E2
> +        - const: renesas,rcar-gen2-vin # Generic R-Car Gen2 or RZ/G1
> +
> +      - items:
> +        - enum:
> +          - renesas,vin-r8a774a1 # RZ/G2M
> +          - renesas,vin-r8a774b1 # RZ/G2N
> +          - renesas,vin-r8a774c0 # RZ/G2E
> +          - renesas,vin-r8a7778  # R-Car M1
> +          - renesas,vin-r8a7779  # R-Car H1
> +          - renesas,vin-r8a7795  # R-Car H3
> +          - renesas,vin-r8a7796  # R-Car M3-W
> +          - renesas,vin-r8a77965 # R-Car M3-N
> +          - renesas,vin-r8a77970 # R-Car V3M
> +          - renesas,vin-r8a77980 # R-Car V3H
> +          - renesas,vin-r8a77990 # R-Car E3
> +          - renesas,vin-r8a77995 # R-Car D3
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  #The per-board settings for Gen2 and RZ/G1 platforms:
> +  port:
> +    type: object
> +    description: |-
> +      A node containing a parallel input with a singel endpoint definitions as
> +      documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +    properties:
> +      reg:
> +        const: 1
> +
> +      endpoint:
> +        type: object
> +
> +        properties:
> +          hsync-active:
> +            description: |-
> +              Default is active high. If both HSYNC and VSYNC polarities are not
> +              specified, embedded synchronization is selected.
> +            enum: [ 0, 1 ]
> +
> +          vsync-active:
> +            description: |-
> +              Default is active high. If both HSYNC and VSYNC polarities are not
> +              specified, embedded synchronization is selected.
> +            enum: [ 0, 1 ]
> +
> +          field-active-even:
> +            description: Default is active high.
> +            enum: [ 0, 1 ]
> +
> +          bus-width:
> +            enum: [ 8, 10, 12, 16, 24, 32 ]
> +
> +          data-shift:
> +            enum: [ 0, 8 ]
> +
> +          data-enable-active:
> +            description: Polarity of CLKENB signal, default is active high.
> +            enum: [ 0, 1 ]
> +
> +          pclk-sample:
> +            enum: [ 0, 1 ]
> +
> +          data-active:
> +            enum: [ 0, 1 ]
> +
> +          remote-endpoint:
> +            maxItems: 1
> +
> +        required:
> +          - remote-endpoint
> +
> +        additionalProperties: false
> +
> +    additionalProperties: false
> +
> +  #The per-board settings for Gen3 and RZ/G2 platforms:
> +  renesas,id:
> +    description: VIN channel number
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 ]
> +
> +  ports:
> +    type: object
> +    description: |-
> +      A node containing input nodes with endpoint definitions as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: |-
> +          Input port node, single endpoint describing a parallel input source.
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +          endpoint:
> +            type: object
> +
> +            properties:
> +              hsync-active:
> +                description: |-
> +                  Default is active high. If both HSYNC and VSYNC polarities are not
> +                  specified, embedded synchronization is selected.
> +                enum: [ 0, 1 ]
> +
> +              vsync-active:
> +                description: |-
> +                  Default is active high. If both HSYNC and VSYNC polarities are not
> +                  specified, embedded synchronization is selected.
> +                enum: [ 0, 1 ]
> +
> +              field-active-even:
> +                description: Default is active high.
> +                enum: [ 0, 1 ]
> +
> +              bus-width:
> +                enum: [ 8, 10, 12, 16, 24, 32 ]
> +
> +              data-shift:
> +                enum: [ 0, 8 ]
> +
> +              data-enable-active:
> +                description: Polarity of CLKENB signal, default is active high.
> +                enum: [ 0, 1 ]
> +
> +              pclk-sample:
> +                enum: [ 0, 1 ]
> +
> +              data-active:
> +                enum: [ 0, 1 ]
> +
> +              remote-endpoint:
> +                maxItems: 1
> +
> +            required:
> +              - remote-endpoint
> +
> +            additionalProperties: false
> +
> +        additionalProperties: false
> +
> +      port@1:
> +        type: object
> +        description: |-
> +          Input port node, multiple endpoints describing all the R-Car CSI-2
> +          modules connected the VIN.
> +
> +        properties:
> +          '#address-cells':
> +            const: 1
> +
> +          '#size-cells':
> +            const: 0
> +
> +          reg:
> +            const: 1
> +
> +          endpoint@0:
> +            type: object
> +            description: Endpoint connected to CSI20.
> +
> +            properties:
> +              reg:
> +                const: 0
> +
> +              remote-endpoint:
> +                maxItems: 1
> +
> +            required:
> +              - reg
> +              - remote-endpoint
> +
> +            additionalProperties: false
> +
> +          endpoint@1:
> +            type: object
> +            description: Endpoint connected to CSI21.
> +
> +            properties:
> +              reg:
> +                const: 1
> +
> +              remote-endpoint:
> +                maxItems: 1
> +
> +            required:
> +              - reg
> +              - remote-endpoint
> +
> +            additionalProperties: false
> +
> +          endpoint@2:
> +            type: object
> +            description: Endpoint connected to CSI40.
> +
> +            properties:
> +              reg:
> +                const: 2
> +
> +              remote-endpoint:
> +                maxItems: 1
> +
> +            required:
> +              - reg
> +              - remote-endpoint
> +
> +            additionalProperties: false
> +
> +          endpoint@3:
> +            type: object
> +            description: Endpoint connected to CSI41.
> +
> +            properties:
> +              reg:
> +                const: 3
> +
> +              remote-endpoint:
> +                maxItems: 1
> +
> +            required:
> +              - reg
> +              - remote-endpoint
> +
> +            additionalProperties: false
> +
> +        additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - power-domains
> +  - resets
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        anyOf:
> +          - const: renesas,vin-r8a7778
> +          - const: renesas,vin-r8a7779
> +          - const: renesas,rcar-gen2-vin
> +then:
> +  required:
> +    - port
> +else:
> +  required:
> +    - renesas,id
> +    - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  # Device node example for Gen2 platform
> +  - |
> +    #include <dt-bindings/clock/r8a7790-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a7790-sysc.h>
> +
> +    vin1: vin@e6ef1000 {
> +            compatible = "renesas,vin-r8a7790",
> +                         "renesas,rcar-gen2-vin";
> +            reg = <0 0xe6ef1000 0 0x1000>;
> +            interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&cpg CPG_MOD 810>;
> +            power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> +            resets = <&cpg 810>;
> +
> +            port {
> +                    vin1ep0: endpoint {
> +                            remote-endpoint = <&adv7180>;
> +                            bus-width = <8>;
> +                    };
> +            };
> +    };
> +
> +  # Device node example for Gen3 platform with only CSI-2
> +  - |
> +    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a7795-sysc.h>
> +
> +    vin0: video@e6ef0000 {
> +            compatible = "renesas,vin-r8a7795";
> +            reg = <0 0xe6ef0000 0 0x1000>;
> +            interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&cpg CPG_MOD 811>;
> +            power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +            resets = <&cpg 811>;
> +            renesas,id = <0>;
> +
> +            ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    port@1 {
> +                            #address-cells = <1>;
> +                            #size-cells = <0>;
> +
> +                            reg = <1>;
> +
> +                            vin0csi20: endpoint@0 {
> +                                    reg = <0>;
> +                                    remote-endpoint= <&csi20vin0>;
> +                            };
> +                            vin0csi40: endpoint@2 {
> +                                    reg = <2>;
> +                                    remote-endpoint= <&csi40vin0>;
> +                            };
> +                    };
> +            };
> +    };
> +
> +  # Device node example for Gen3 platform with CSI-2 and parallel
> +  - |
> +    #include <dt-bindings/clock/r8a77970-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a77970-sysc.h>
> +
> +    vin2: video@e6ef2000 {
> +            compatible = "renesas,vin-r8a77970";
> +            reg = <0 0xe6ef2000 0 0x1000>;
> +            interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&cpg CPG_MOD 809>;
> +            power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> +            resets = <&cpg 809>;
> +            renesas,id = <2>;
> +
> +            ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    port@0 {
> +                            reg = <0>;
> +
> +                            vin2_in: endpoint {
> +                                    remote-endpoint = <&adv7612_out>;
> +                                    hsync-active = <0>;
> +                                    vsync-active = <0>;
> +                            };
> +                    };
> +
> +                    port@1 {
> +                            #address-cells = <1>;
> +                            #size-cells = <0>;
> +
> +                            reg = <1>;
> +
> +                            vin2csi40: endpoint@2 {
> +                                    reg = <2>;
> +                                    remote-endpoint = <&csi40vin2>;
> +                            };
> +                    };
> +            };
> +    };
> 

