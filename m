Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29212424ABB
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 01:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239827AbhJFX4L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 19:56:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbhJFX4J (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 19:56:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF4DC061746;
        Wed,  6 Oct 2021 16:54:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E45F9DC;
        Thu,  7 Oct 2021 01:54:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633564455;
        bh=Z6feZR14n1Mgmum2gHz6jmPTomodaD/WK+wssPCkRnc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dKhtYRJdpwaRLFhOx9B6hROLVjl1pUt6dEYo0gmN1Tb6MfO7j7+Ddh3cXC38CWm6m
         6vm3P5lPBMkpeU17Kt222w8nC4Moyn05Mk4AYVXzrNPN7gHxzkwQh57c3VkP7KJJOp
         hrpW/fYOJ9sUGFYtEq2Ato2Wc3lga0dg/4mN3Oss=
Date:   Thu, 7 Oct 2021 02:54:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Pratyush Yadav <p.yadav@ti.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Benoit Parrot <bparrot@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 11/11] media: dt-bindings: Convert Cadence CSI2RX
 binding to YAML
Message-ID: <YV43HyrkATcZrHm/@pendragon.ideasonboard.com>
References: <20210915120240.21572-1-p.yadav@ti.com>
 <20210915120240.21572-12-p.yadav@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210915120240.21572-12-p.yadav@ti.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pratyush,

Thank you for the patch.

On Wed, Sep 15, 2021 at 05:32:40PM +0530, Pratyush Yadav wrote:
> Convert the Cadence CSI2RX binding to use YAML schema.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> 
> ---
> 
> Changes in v4:
> - Add power-domains property.
> - Drop maxItems from clock-names.
> - Drop the type for data-lanes.
> - Drop uniqueItems from data-lanes. Move it to video-interfaces.yaml
>   instead.
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
> index 000000000000..fbd7f0503832
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

The comments in clock-names can be moved here with

  clocks:
    minItems: 3
    items:
      - description: Main clock
      - description: Register bank clock
      - description: Rixel stream 0 output clock
      - description: Rixel stream 1 output clock
      - description: Rixel stream 2 output clock
      - description: Rixel stream 3 output clock

> +
> +  clock-names:
> +    minItems: 3
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
> +  power-domains:
> +    maxItems: 1
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
> +                minItems: 1
> +                maxItems: 4
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

Shouldn't "ports" be required too ?

With those comments addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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

-- 
Regards,

Laurent Pinchart
