Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82CD13B9647
	for <lists+linux-media@lfdr.de>; Thu,  1 Jul 2021 20:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233802AbhGAS5r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jul 2021 14:57:47 -0400
Received: from mail-il1-f178.google.com ([209.85.166.178]:46927 "EHLO
        mail-il1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233723AbhGAS5q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jul 2021 14:57:46 -0400
Received: by mail-il1-f178.google.com with SMTP id t12so7362121ile.13;
        Thu, 01 Jul 2021 11:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AjIdIvaKWs/g3YQH2y/9gcvEvxeRXnLIJy5WplUdJ10=;
        b=bjIyfNy1nA99HYTyO/yiS7CRNUiwoMQoje9Bbf83RS3uBYpq5Ujl/n/1ZyJj/p/dP4
         eXyC24qwKi90Z01+NPOee/ZYC2liXAY6fQGBkdamIM6wa0HYYqIqFqOcZeMzasznSQeF
         Qoxa3ZO0c+Gu4kkWohRkxBnS/xLHUt6tnHaxOUEkQppxN40hRMJK+TyZAAGcCK/BOakH
         GqViGW6DXI2QDgaVGVstMCvrAzDMclvNal9Yw48L06oIUChaD9NU1WhlSiCMLjJg6AoB
         KpTdPcbDq/3Fe8XOODLxWeAU+mKt0aUBj5eDzqG/iDUpUDU3LYrY1uzVx8cslx0WeKnC
         tpfw==
X-Gm-Message-State: AOAM532/+bPl85OUUgt9BDol4e1lHVlplra+dwsTdl8emFjUc/KC2It3
        8SVCgymWxoMawVAhqLq1bw==
X-Google-Smtp-Source: ABdhPJwR2HQJJlZDFXRkP5IbkhozwMMQL8sc0gfhmj6y5COI1lXIuBJo2mO4kcKvs+Ld3Z1dYQ+rlw==
X-Received: by 2002:a92:d246:: with SMTP id v6mr583454ilg.191.1625165715216;
        Thu, 01 Jul 2021 11:55:15 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id z3sm368840ior.14.2021.07.01.11.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 11:55:13 -0700 (PDT)
Received: (nullmailer pid 2729152 invoked by uid 1000);
        Thu, 01 Jul 2021 18:55:09 -0000
Date:   Thu, 1 Jul 2021 12:55:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Pratyush Yadav <p.yadav@ti.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 11/11] media: dt-bindings: Convert Cadence CSI2RX
 binding to YAML
Message-ID: <20210701185509.GA2653882@robh.at.kernel.org>
References: <20210624192200.22559-1-p.yadav@ti.com>
 <20210624192200.22559-12-p.yadav@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624192200.22559-12-p.yadav@ti.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 25, 2021 at 12:52:00AM +0530, Pratyush Yadav wrote:
> Convert the Cadence CSI2RX binding to use YAML schema.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> 
> ---
> 
> Changes in v3:
> - Add compatible: contains: const: cdns,csi2rx to allow SoC specific
>   compatible.
> - Add more constraints for data-lanes property.
> 
> Changes in v2:
> - New in v2.
> 
>  .../devicetree/bindings/media/cdns,csi2rx.txt | 100 -----------
>  .../bindings/media/cdns,csi2rx.yaml           | 169 ++++++++++++++++++
>  2 files changed, 169 insertions(+), 100 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/cdns,csi2rx.txt
>  create mode 100644 Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.txt b/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
> deleted file mode 100644
> index 6b02a0657ad9..000000000000
> --- a/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
> +++ /dev/null
> @@ -1,100 +0,0 @@
> -Cadence MIPI-CSI2 RX controller
> -===============================
> -
> -The Cadence MIPI-CSI2 RX controller is a CSI-2 bridge supporting up to 4 CSI
> -lanes in input, and 4 different pixel streams in output.
> -
> -Required properties:
> -  - compatible: must be set to "cdns,csi2rx" and an SoC-specific compatible
> -  - reg: base address and size of the memory mapped region
> -  - clocks: phandles to the clocks driving the controller
> -  - clock-names: must contain:
> -    * sys_clk: main clock
> -    * p_clk: register bank clock
> -    * pixel_if[0-3]_clk: pixel stream output clock, one for each stream
> -                         implemented in hardware, between 0 and 3
> -
> -Optional properties:
> -  - phys: phandle to the external D-PHY, phy-names must be provided
> -  - phy-names: must contain "dphy", if the implementation uses an
> -               external D-PHY
> -
> -Required subnodes:
> -  - ports: A ports node with one port child node per device input and output
> -           port, in accordance with the video interface bindings defined in
> -           Documentation/devicetree/bindings/media/video-interfaces.txt. The
> -           port nodes are numbered as follows:
> -
> -           Port Description
> -           -----------------------------
> -           0    CSI-2 input
> -           1    Stream 0 output
> -           2    Stream 1 output
> -           3    Stream 2 output
> -           4    Stream 3 output
> -
> -           The stream output port nodes are optional if they are not
> -           connected to anything at the hardware level or implemented
> -           in the design.Since there is only one endpoint per port,
> -           the endpoints are not numbered.
> -
> -
> -Example:
> -
> -csi2rx: csi-bridge@0d060000 {
> -	compatible = "cdns,csi2rx";
> -	reg = <0x0d060000 0x1000>;
> -	clocks = <&byteclock>, <&byteclock>
> -		 <&coreclock>, <&coreclock>,
> -		 <&coreclock>, <&coreclock>;
> -	clock-names = "sys_clk", "p_clk",
> -		      "pixel_if0_clk", "pixel_if1_clk",
> -		      "pixel_if2_clk", "pixel_if3_clk";
> -
> -	ports {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		port@0 {
> -			reg = <0>;
> -
> -			csi2rx_in_sensor: endpoint {
> -				remote-endpoint = <&sensor_out_csi2rx>;
> -				clock-lanes = <0>;
> -				data-lanes = <1 2>;
> -			};
> -		};
> -
> -		port@1 {
> -			reg = <1>;
> -
> -			csi2rx_out_grabber0: endpoint {
> -				remote-endpoint = <&grabber0_in_csi2rx>;
> -			};
> -		};
> -
> -		port@2 {
> -			reg = <2>;
> -
> -			csi2rx_out_grabber1: endpoint {
> -				remote-endpoint = <&grabber1_in_csi2rx>;
> -			};
> -		};
> -
> -		port@3 {
> -			reg = <3>;
> -
> -			csi2rx_out_grabber2: endpoint {
> -				remote-endpoint = <&grabber2_in_csi2rx>;
> -			};
> -		};
> -
> -		port@4 {
> -			reg = <4>;
> -
> -			csi2rx_out_grabber3: endpoint {
> -				remote-endpoint = <&grabber3_in_csi2rx>;
> -			};
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
> new file mode 100644
> index 000000000000..8e42c9fdaaa3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
> @@ -0,0 +1,169 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/cdns,csi2rx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence MIPI-CSI2 RX controller
> +
> +description: |
> +  The Cadence MIPI-CSI2 RX controller is a CSI-2 bridge supporting up to 4 CSI
> +  lanes in input, and 4 different pixel streams in output.
> +
> +maintainers:
> +  - Pratyush Yadav <p.yadav@ti.com>
> +
> +properties:
> +  compatible:
> +    contains:
> +      const: cdns,csi2rx
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 3
> +    maxItems: 6
> +
> +  clock-names:
> +    minItems: 3
> +    maxItems: 6

maxItems can be dropped here. Implied by items length.

> +    items:
> +      - const: sys_clk # main clock
> +      - const: p_clk # register bank clock
> +      - const: pixel_if0_clk # pixel stream 0 output clock
> +      - const: pixel_if1_clk # pixel stream 1 output clock
> +      - const: pixel_if2_clk # pixel stream 2 output clock
> +      - const: pixel_if3_clk # pixel stream 3 output clock
> +
> +  phys:
> +    maxItems: 1
> +    description: phandle to the external D-PHY
> +
> +  phy-names:
> +    items:
> +      - const: dphy
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI-2 input
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                $ref: /schemas/types.yaml#/definitions/uint32-array

Don't need a type here.

> +                minItems: 1
> +                maxItems: 4
> +                uniqueItems: true

uniqueItems should be added in video-interfaces.yaml.

> +                items:
> +                  maximum: 4
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Stream 0 output
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Stream 1 output
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Stream 2 output
> +
> +      port@4:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Stream 3 output
> +
> +    required:
> +      - port@0
> +
> +
> +dependencies:
> +  phys: [ 'phy-names' ]
> +  phy-names: [ 'phys' ]
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    csi2rx: csi-bridge@d060000 {
> +      compatible = "cdns,csi2rx";
> +      reg = <0x0d060000 0x1000>;
> +      clocks = <&byteclock>, <&byteclock>,
> +        <&coreclock>, <&coreclock>,
> +        <&coreclock>, <&coreclock>;
> +      clock-names = "sys_clk", "p_clk",
> +              "pixel_if0_clk", "pixel_if1_clk",
> +              "pixel_if2_clk", "pixel_if3_clk";
> +      phys = <&dphy0>;
> +      phy-names = "dphy";
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          reg = <0>;
> +
> +          csi2rx_in_sensor: endpoint {
> +            remote-endpoint = <&sensor_out_csi2rx>;
> +            clock-lanes = <0>;
> +            data-lanes = <1 2>;
> +          };
> +        };
> +
> +        port@1 {
> +          reg = <1>;
> +
> +          csi2rx_out_grabber0: endpoint {
> +            remote-endpoint = <&grabber0_in_csi2rx>;
> +          };
> +        };
> +
> +        port@2 {
> +          reg = <2>;
> +
> +          csi2rx_out_grabber1: endpoint {
> +            remote-endpoint = <&grabber1_in_csi2rx>;
> +          };
> +        };
> +
> +        port@3 {
> +          reg = <3>;
> +
> +          csi2rx_out_grabber2: endpoint {
> +            remote-endpoint = <&grabber2_in_csi2rx>;
> +          };
> +        };
> +
> +        port@4 {
> +          reg = <4>;
> +
> +          csi2rx_out_grabber3: endpoint {
> +            remote-endpoint = <&grabber3_in_csi2rx>;
> +          };
> +        };
> +      };
> +    };
> -- 
> 2.30.0
> 
> 
