Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72C1CF8C08
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 10:40:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbfKLJkg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 04:40:36 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:58461 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbfKLJkg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 04:40:36 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 405E4240009;
        Tue, 12 Nov 2019 09:40:31 +0000 (UTC)
Date:   Tue, 12 Nov 2019 10:42:31 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: rcar-vin: Convert bindings to
 json-schema
Message-ID: <20191112094231.ssi2qaksvn7djxmq@uno.localdomain>
References: <20191108021609.2584272-1-niklas.soderlund+renesas@ragnatech.se>
 <20191108021609.2584272-4-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5dwd7ba4h2pv3zwl"
Content-Disposition: inline
In-Reply-To: <20191108021609.2584272-4-niklas.soderlund+renesas@ragnatech.se>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--5dwd7ba4h2pv3zwl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Niklas,
   thanks for the patch

On Fri, Nov 08, 2019 at 03:16:09AM +0100, Niklas S=C3=B6derlund wrote:
> Convert Renesas R-Car VIN bindings documentation to json-schema.
>
> As the examples in the bindings now can be tested add a new one which
> describes how the both a parallel and a CSI-2 source can be connected on
> Gen3 SoCs.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
>  .../devicetree/bindings/media/renesas,vin.txt | 217 ----------
>  .../bindings/media/renesas,vin.yaml           | 409 ++++++++++++++++++
>  2 files changed, 409 insertions(+), 217 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,vin.t=
xt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,vin.y=
aml
>
> diff --git a/Documentation/devicetree/bindings/media/renesas,vin.txt b/Do=
cumentation/devicetree/bindings/media/renesas,vin.txt
> deleted file mode 100644
> index 5eefd62ac5c5b9fd..0000000000000000
> --- a/Documentation/devicetree/bindings/media/renesas,vin.txt
> +++ /dev/null
> @@ -1,217 +0,0 @@
> -Renesas R-Car Video Input driver (rcar_vin)
> --------------------------------------------
> -
> -The rcar_vin device provides video input capabilities for the Renesas R-=
Car
> -family of devices.
> -
> -Each VIN instance has a single parallel input that supports RGB and YUV =
video,
> -with both external synchronization and BT.656 synchronization for the la=
tter.
> -Depending on the instance the VIN input is connected to external SoC pin=
s, or
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
> -    - bus-width: see [1] for description. The selected bus width depends=
 on
> -      the SoC type and selected input image format.
> -      Valid values are: 8, 10, 12, 16, 24 and 32.
> -    - data-shift: see [1] for description. Valid values are 0 and 8.
> -    - data-enable-active: polarity of CLKENB signal, see [1] for
> -      description. Default is active high.
> -
> -The per-board settings for Gen3 and RZ/G2 platforms:
> -
> -Gen3 and RZ/G2 platforms can support both a single connected parallel in=
put
> -source from external SoC pins (port@0) and/or multiple parallel input so=
urces
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
> -        - endpoint@0 - sub-node describing the endpoint connected to CSI=
20
> -        - endpoint@1 - sub-node describing the endpoint connected to CSI=
21
> -        - endpoint@2 - sub-node describing the endpoint connected to CSI=
40
> -        - endpoint@3 - sub-node describing the endpoint connected to CSI=
41
> -
> -      Endpoint nodes of port@1 do not support any optional endpoint prop=
erty.
> -
> -Device node example for Gen2 platforms
> ---------------------------------------
> -
> -        aliases {
> -                vin0 =3D &vin0;
> -        };
> -
> -        vin0: vin@e6ef0000 {
> -                compatible =3D "renesas,vin-r8a7790", "renesas,rcar-gen2=
-vin";
> -                clocks =3D <&mstp8_clks R8A7790_CLK_VIN0>;
> -                reg =3D <0 0xe6ef0000 0 0x1000>;
> -                interrupts =3D <0 188 IRQ_TYPE_LEVEL_HIGH>;
> -                status =3D "disabled";
> -        };
> -
> -Board setup example for Gen2 platforms (vin1 composite video input)
> --------------------------------------------------------------------
> -
> -&i2c2   {
> -        status =3D "okay";
> -        pinctrl-0 =3D <&i2c2_pins>;
> -        pinctrl-names =3D "default";
> -
> -        adv7180@20 {
> -                compatible =3D "adi,adv7180";
> -                reg =3D <0x20>;
> -                remote =3D <&vin1>;
> -
> -                port {
> -                        adv7180: endpoint {
> -                                bus-width =3D <8>;
> -                                remote-endpoint =3D <&vin1ep0>;
> -                        };
> -                };
> -        };
> -};
> -
> -/* composite video input */
> -&vin1 {
> -        pinctrl-0 =3D <&vin1_pins>;
> -        pinctrl-names =3D "default";
> -
> -        status =3D "okay";
> -
> -        port {
> -                vin1ep0: endpoint {
> -                        remote-endpoint =3D <&adv7180>;
> -                        bus-width =3D <8>;
> -                };
> -        };
> -};
> -
> -Device node example for Gen3 platforms
> ---------------------------------------
> -
> -        vin0: video@e6ef0000 {
> -                compatible =3D "renesas,vin-r8a7795";
> -                reg =3D <0 0xe6ef0000 0 0x1000>;
> -                interrupts =3D <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
> -                clocks =3D <&cpg CPG_MOD 811>;
> -                power-domains =3D <&sysc R8A7795_PD_ALWAYS_ON>;
> -                resets =3D <&cpg 811>;
> -                renesas,id =3D <0>;
> -
> -                ports {
> -                        #address-cells =3D <1>;
> -                        #size-cells =3D <0>;
> -
> -                        port@1 {
> -                                #address-cells =3D <1>;
> -                                #size-cells =3D <0>;
> -
> -                                reg =3D <1>;
> -
> -                                vin0csi20: endpoint@0 {
> -                                        reg =3D <0>;
> -                                        remote-endpoint=3D <&csi20vin0>;
> -                                };
> -                                vin0csi21: endpoint@1 {
> -                                        reg =3D <1>;
> -                                        remote-endpoint=3D <&csi21vin0>;
> -                                };
> -                                vin0csi40: endpoint@2 {
> -                                        reg =3D <2>;
> -                                        remote-endpoint=3D <&csi40vin0>;
> -                                };
> -                        };
> -                };
> -        };
> -
> -        csi20: csi2@fea80000 {
> -                compatible =3D "renesas,r8a7795-csi2";
> -                reg =3D <0 0xfea80000 0 0x10000>;
> -                interrupts =3D <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
> -                clocks =3D <&cpg CPG_MOD 714>;
> -                power-domains =3D <&sysc R8A7795_PD_ALWAYS_ON>;
> -                resets =3D <&cpg 714>;
> -
> -                ports {
> -                        #address-cells =3D <1>;
> -                        #size-cells =3D <0>;
> -
> -                        port@0 {
> -                                reg =3D <0>;
> -                                csi20_in: endpoint {
> -                                        clock-lanes =3D <0>;
> -                                        data-lanes =3D <1>;
> -                                        remote-endpoint =3D <&adv7482_tx=
b>;
> -                                };
> -                        };
> -
> -                        port@1 {
> -                                #address-cells =3D <1>;
> -                                #size-cells =3D <0>;
> -
> -                                reg =3D <1>;
> -
> -                                csi20vin0: endpoint@0 {
> -                                        reg =3D <0>;
> -                                        remote-endpoint =3D <&vin0csi20>;
> -                                };
> -                        };
> -                };
> -        };
> -
> -[1] video-interfaces.txt common video media interface
> diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/D=
ocumentation/devicetree/bindings/media/renesas,vin.yaml
> new file mode 100644
> index 0000000000000000..be261d9a98d62dcd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> @@ -0,0 +1,409 @@
> +# SPDX-License-Identifier: GPL-2.0

I think you should use GPL-2.0-only

> +# Copyright (C) 2019 Renesas Electronics Corp.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/renesas,vin.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car Video Input (VIN)
> +
> +maintainers:
> +  - Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se>

I also put the mailing lists here, not sure if that's desired.

> +
> +description: |-
> +  The R-Car Video Input (VIN) device provides video input capabilities f=
or the
> +  Renesas R-Car family of devices.
> +
> +  Each VIN instance has a single parallel input that supports RGB and YU=
V video,
> +  with both external synchronization and BT.656 synchronization for the =
latter.
> +  Depending on the instance the VIN input is connected to external SoC p=
ins, or
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
> +      A node containing a parallel input with a singel endpoint definiti=
ons as
> +      documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +    properties:
> +      reg:
> +        const: 1

Do you need reg for the single 'port' ?

> +
> +      endpoint:
> +        type: object
> +
> +        properties:
> +          hsync-active:
> +            description: |-
> +              Default is active high. If both HSYNC and VSYNC polarities=
 are not
> +              specified, embedded synchronization is selected.
> +            enum: [ 0, 1 ]
> +
> +          vsync-active:
> +            description: |-
> +              Default is active high. If both HSYNC and VSYNC polarities=
 are not
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
> +            description: Polarity of CLKENB signal, default is active hi=
gh.
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
> +      A node containing input nodes with endpoint definitions as documen=
ted in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: |-
> +          Input port node, single endpoint describing a parallel input s=
ource.
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
> +                  Default is active high. If both HSYNC and VSYNC polari=
ties are not
> +                  specified, embedded synchronization is selected.
> +                enum: [ 0, 1 ]
> +
> +              vsync-active:
> +                description: |-
> +                  Default is active high. If both HSYNC and VSYNC polari=
ties are not
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

Why are those two not described ? I feel like or you either refrain
=66rom describing all poperties and point the reader to
video-interfaces.txt, or you describe all of them, at least to provide
an indication of the default if the property is not specified.

> +
> +              data-enable-active:
> +                description: Polarity of CLKENB signal, default is activ=
e high.
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
> +          Input port node, multiple endpoints describing all the R-Car C=
SI-2
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

Here and in the other endpoints of port@1, do you need required
properties ? As I read in writing-schema.rts:
"Unless noted otherwise, all properties are required."

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
> +            compatible =3D "renesas,vin-r8a7790",
> +                         "renesas,rcar-gen2-vin";
> +            reg =3D <0 0xe6ef1000 0 0x1000>;
> +            interrupts =3D <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks =3D <&cpg CPG_MOD 810>;
> +            power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
> +            resets =3D <&cpg 810>;
> +
> +            port {
> +                    vin1ep0: endpoint {
> +                            remote-endpoint =3D <&adv7180>;
> +                            bus-width =3D <8>;
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
> +            compatible =3D "renesas,vin-r8a7795";
> +            reg =3D <0 0xe6ef0000 0 0x1000>;
> +            interrupts =3D <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks =3D <&cpg CPG_MOD 811>;
> +            power-domains =3D <&sysc R8A7795_PD_ALWAYS_ON>;
> +            resets =3D <&cpg 811>;
> +            renesas,id =3D <0>;
> +
> +            ports {
> +                    #address-cells =3D <1>;
> +                    #size-cells =3D <0>;
> +
> +                    port@1 {
> +                            #address-cells =3D <1>;
> +                            #size-cells =3D <0>;
> +
> +                            reg =3D <1>;
> +
> +                            vin0csi20: endpoint@0 {
> +                                    reg =3D <0>;
> +                                    remote-endpoint=3D <&csi20vin0>;
> +                            };
> +                            vin0csi40: endpoint@2 {
> +                                    reg =3D <2>;
> +                                    remote-endpoint=3D <&csi40vin0>;
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
> +            compatible =3D "renesas,vin-r8a77970";
> +            reg =3D <0 0xe6ef2000 0 0x1000>;
> +            interrupts =3D <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks =3D <&cpg CPG_MOD 809>;
> +            power-domains =3D <&sysc R8A77970_PD_ALWAYS_ON>;
> +            resets =3D <&cpg 809>;
> +            renesas,id =3D <2>;
> +
> +            ports {
> +                    #address-cells =3D <1>;
> +                    #size-cells =3D <0>;
> +
> +                    port@0 {
> +                            reg =3D <0>;
> +
> +                            vin2_in: endpoint {
> +                                    remote-endpoint =3D <&adv7612_out>;
> +                                    hsync-active =3D <0>;
> +                                    vsync-active =3D <0>;
> +                            };
> +                    };
> +
> +                    port@1 {
> +                            #address-cells =3D <1>;
> +                            #size-cells =3D <0>;
> +
> +                            reg =3D <1>;
> +
> +                            vin2csi40: endpoint@2 {
> +                                    reg =3D <2>;
> +                                    remote-endpoint =3D <&csi40vin2>;
> +                            };
> +                    };
> +            };
> +    };

I can't really comment on the json-schema most complex parts, but from
a device point of view, minors apart, it seems sane to me.

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> --
> 2.23.0
>

--5dwd7ba4h2pv3zwl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3KfocACgkQcjQGjxah
VjxiTw//VfCQlO31p/VvVI/poP8PlBo2x+5kR53iYZLzFv288orRfXXutI4x63aW
n/e6ajQzwu/LSxQ6RlaJbUFGhuEIfQiuz6kuGrRM9065qLncLxyrDcO7PwDLIogc
n88rCsKaH14Z+7osGAEUNy7exfOJCLpSXATZD9pOYCCRmSHIvQpNm0FTxwX9ATzc
WzlJmkTlEVWKCXcHHoFzjcTG3szlk+p9t+LWQE1lBtWf+dBzX8c3TiFW3OmOvo6s
aOTTQh7mMTii47wBieL6xQadJiBH2H0mGEYhubPoj8IHx7oIi3TKaKKN4dof+wS5
OWHziqZzCDyS/szqif2flyxmIYtEcGJcdToO7JZ+wyDFxXGb+HwC+mLhgIQON0XI
vi2Yy9SSxhEM8sqlEWIDbiQt8zr/KoQpJAWXRaiVJeySH2pzSEu2gJ3lPHP6z+RO
MxaK33oNf4XPLjx25pkSzn3BcWFYyaqjjfXhoAZKjanoAns8fzP7Ujol+eMtPQxQ
khvzXetk+ptuICc+O7fMAtI7Ug+P7tobMKP/r07TQNVCr1B2vjl/N1GAiSauTA7S
ox8HNT9M/h0QwY+2mHilc8FYkB8LATW6Tvv1x6A3mlssK858gxrLGrMw0f6yvU4k
PPKx54eF2Z4ux/LBx4tumzCpZ22MBPu7IU8RJ79poRvfOj3tgo8=
=bgb8
-----END PGP SIGNATURE-----

--5dwd7ba4h2pv3zwl--
