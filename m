Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73093F6894
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2019 11:45:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbfKJKpP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Nov 2019 05:45:15 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:53615 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726609AbfKJKpO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Nov 2019 05:45:14 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id TkiQiNJMpQBsYTkiUi1XUT; Sun, 10 Nov 2019 11:45:12 +0100
Subject: Re: [PATCH] dt-bindings: rcar-csi2: Convert bindings to json-schema
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20191108021748.2584486-1-niklas.soderlund+renesas@ragnatech.se>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <40d8f61d-819c-e40f-6424-6058c5f985f1@xs4all.nl>
Date:   Sun, 10 Nov 2019 11:45:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191108021748.2584486-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMFk1fWQcLuZYDn/YrYNOlwYATaFlXUd8gqH6J4xSsQoq69n9RqBJwQt95ZU9c4VRw+sNGmMWLJwyxlA+TSn7vVR4Q4Xxh+3wdV/xIPVAhuwEMOSMBc8
 Tgd3CIMf8oLqrVjK1OQKA8Ckpz3N925oS1gmd9ARNiySbwoVLNFInTn+oZan99Q3ASXL5VR0FS1JVxvUm4RrqdRsUERujlc6PKyVb8CCH1Zrs1dMYIOXHIYv
 D54ox9hFCX0WZVnM75ePwuMEdfGm6d0ivTdi03VnChGYjkAh4mDfPQ75+VL4ui+fbzCaoSOEOljznFu0vmQlc9sY51TVhbRsj2hifXUQVEhx0cVl4pH2iR64
 rc1P0Jhk
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/8/19 3:17 AM, Niklas Söderlund wrote:
> Convert Renesas R-Car MIPI CSI-2 receiver bindings documentation to
> json-schema.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  .../bindings/media/renesas,csi2.txt           | 107 ----------
>  .../bindings/media/renesas,csi2.yaml          | 200 ++++++++++++++++++
>  2 files changed, 200 insertions(+), 107 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,csi2.txt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,csi2.yaml

Please update MAINTAINERS as well since it still refers to the old .txt file.

Regards,

	Hans

> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.txt b/Documentation/devicetree/bindings/media/renesas,csi2.txt
> deleted file mode 100644
> index 2da6f60b2b5659f6..0000000000000000
> --- a/Documentation/devicetree/bindings/media/renesas,csi2.txt
> +++ /dev/null
> @@ -1,107 +0,0 @@
> -Renesas R-Car MIPI CSI-2
> -------------------------
> -
> -The R-Car CSI-2 receiver device provides MIPI CSI-2 capabilities for the
> -Renesas R-Car and RZ/G2 family of devices. It is used in conjunction with the
> -R-Car VIN module, which provides the video capture capabilities.
> -
> -Mandatory properties
> ---------------------
> - - compatible: Must be one or more of the following
> -   - "renesas,r8a774a1-csi2" for the R8A774A1 device.
> -   - "renesas,r8a774b1-csi2" for the R8A774B1 device.
> -   - "renesas,r8a774c0-csi2" for the R8A774C0 device.
> -   - "renesas,r8a7795-csi2" for the R8A7795 device.
> -   - "renesas,r8a7796-csi2" for the R8A7796 device.
> -   - "renesas,r8a77965-csi2" for the R8A77965 device.
> -   - "renesas,r8a77970-csi2" for the R8A77970 device.
> -   - "renesas,r8a77980-csi2" for the R8A77980 device.
> -   - "renesas,r8a77990-csi2" for the R8A77990 device.
> -
> - - reg: the register base and size for the device registers
> - - interrupts: the interrupt for the device
> - - clocks: A phandle + clock specifier for the module clock
> - - resets: A phandle + reset specifier for the module reset
> -
> -The device node shall contain two 'port' child nodes according to the
> -bindings defined in Documentation/devicetree/bindings/media/
> -video-interfaces.txt. port@0 shall connect to the CSI-2 source. port@1
> -shall connect to all the R-Car VIN modules that have a hardware
> -connection to the CSI-2 receiver.
> -
> -- port@0- Video source (mandatory)
> -	- endpoint@0 - sub-node describing the endpoint that is the video source
> -
> -- port@1 - VIN instances (optional)
> -	- One endpoint sub-node for every R-Car VIN instance which is connected
> -	  to the R-Car CSI-2 receiver.
> -
> -Example:
> -
> -	csi20: csi2@fea80000 {
> -		compatible = "renesas,r8a7796-csi2";
> -		reg = <0 0xfea80000 0 0x10000>;
> -		interrupts = <0 184 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&cpg CPG_MOD 714>;
> -		power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> -		resets = <&cpg 714>;
> -
> -		ports {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			port@0 {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				reg = <0>;
> -
> -				csi20_in: endpoint@0 {
> -					reg = <0>;
> -					clock-lanes = <0>;
> -					data-lanes = <1>;
> -					remote-endpoint = <&adv7482_txb>;
> -				};
> -			};
> -
> -			port@1 {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				reg = <1>;
> -
> -				csi20vin0: endpoint@0 {
> -					reg = <0>;
> -					remote-endpoint = <&vin0csi20>;
> -				};
> -				csi20vin1: endpoint@1 {
> -					reg = <1>;
> -					remote-endpoint = <&vin1csi20>;
> -				};
> -				csi20vin2: endpoint@2 {
> -					reg = <2>;
> -					remote-endpoint = <&vin2csi20>;
> -				};
> -				csi20vin3: endpoint@3 {
> -					reg = <3>;
> -					remote-endpoint = <&vin3csi20>;
> -				};
> -				csi20vin4: endpoint@4 {
> -					reg = <4>;
> -					remote-endpoint = <&vin4csi20>;
> -				};
> -				csi20vin5: endpoint@5 {
> -					reg = <5>;
> -					remote-endpoint = <&vin5csi20>;
> -				};
> -				csi20vin6: endpoint@6 {
> -					reg = <6>;
> -					remote-endpoint = <&vin6csi20>;
> -				};
> -				csi20vin7: endpoint@7 {
> -					reg = <7>;
> -					remote-endpoint = <&vin7csi20>;
> -				};
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.yaml b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> new file mode 100644
> index 0000000000000000..a6d2b597c4944693
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> @@ -0,0 +1,200 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (C) 2019 Renesas Electronics Corp.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/renesas,csi2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car MIPI CSI-2 receiver
> +
> +maintainers:
> +  - Niklas Söderlund <niklas.soderlund@ragnatech.se>
> +
> +description: |-
> +  The R-Car CSI-2 receiver device provides MIPI CSI-2 capabilities for the
> +  Renesas R-Car and RZ/G2 family of devices. It is used in conjunction with the
> +  R-Car VIN module, which provides the video capture capabilities.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - renesas,r8a774a1-csi2 # RZ/G2M
> +        - renesas,r8a774b1-csi2 # RZ/G2N
> +        - renesas,r8a774c0-csi2 # RZ/G2E
> +        - renesas,r8a7795-csi2  # R-Car H3
> +        - renesas,r8a7796-csi2  # R-Car M3-W
> +        - renesas,r8a77965-csi2 # R-Car M3-N
> +        - renesas,r8a77970-csi2 # R-Car V3M
> +        - renesas,r8a77980-csi2 # R-Car V3H
> +        - renesas,r8a77990-csi2 # R-Car E3
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
> +  ports:
> +    type: object
> +    description: |-
> +      A node containing input and output port nodes with endpoint definitions
> +      as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: |-
> +          Input port node, single endpoint describing the CSI-2 transmitter.
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +          endpoint:
> +            type: object
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                maxItems: 1
> +
> +              remote-endpoint:
> +                maxItems: 1
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +              - remote-endpoint
> +
> +            additionalProperties: false
> +
> +        additionalProperties: false
> +
> +      port@1:
> +        type: object
> +        description: |-
> +          Output port node, multiple endpoints describing all the R-Car VIN
> +          modules connected the CSI-2 receiver.
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
> +        patternProperties:
> +          "^endpoint@[0-9]+$":
> +            type: object
> +
> +            properties:
> +              reg:
> +                maxItems: 1
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
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a7796-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a7796-sysc.h>
> +
> +    csi20: csi2@fea80000 {
> +            compatible = "renesas,r8a7796-csi2";
> +            reg = <0 0xfea80000 0 0x10000>;
> +            interrupts = <0 184 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&cpg CPG_MOD 714>;
> +            power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +            resets = <&cpg 714>;
> +
> +            ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    port@0 {
> +                            reg = <0>;
> +
> +                            csi20_in: endpoint {
> +                                    clock-lanes = <0>;
> +                                    data-lanes = <1>;
> +                                    remote-endpoint = <&adv7482_txb>;
> +                            };
> +                    };
> +
> +                    port@1 {
> +                            #address-cells = <1>;
> +                            #size-cells = <0>;
> +
> +                            reg = <1>;
> +
> +                            csi20vin0: endpoint@0 {
> +                                    reg = <0>;
> +                                    remote-endpoint = <&vin0csi20>;
> +                            };
> +                            csi20vin1: endpoint@1 {
> +                                    reg = <1>;
> +                                    remote-endpoint = <&vin1csi20>;
> +                            };
> +                            csi20vin2: endpoint@2 {
> +                                    reg = <2>;
> +                                    remote-endpoint = <&vin2csi20>;
> +                            };
> +                            csi20vin3: endpoint@3 {
> +                                    reg = <3>;
> +                                    remote-endpoint = <&vin3csi20>;
> +                            };
> +                            csi20vin4: endpoint@4 {
> +                                    reg = <4>;
> +                                    remote-endpoint = <&vin4csi20>;
> +                            };
> +                            csi20vin5: endpoint@5 {
> +                                    reg = <5>;
> +                                    remote-endpoint = <&vin5csi20>;
> +                            };
> +                            csi20vin6: endpoint@6 {
> +                                    reg = <6>;
> +                                    remote-endpoint = <&vin6csi20>;
> +                            };
> +                            csi20vin7: endpoint@7 {
> +                                    reg = <7>;
> +                                    remote-endpoint = <&vin7csi20>;
> +                            };
> +                    };
> +            };
> +    };
> 

