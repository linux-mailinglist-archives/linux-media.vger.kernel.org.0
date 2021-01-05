Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6322EAF21
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728041AbhAEPoY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:44:24 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38284 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbhAEPoY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:44:24 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA34B3D7;
        Tue,  5 Jan 2021 16:43:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609861421;
        bh=nhstVHHWOEEMLzQ92yAPy5JAoJxo1w88iRoV9MIBG7Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O0py2Qd1NANGjVgcDchvk8WzIIS65uvtVReUAHWjDdS7UYSXWXITTI1Pok4Jn0eHg
         /CdaFESQzMnvtWh3oy2QfU3uUZjxi5WKeeoq97tJ4NhvUn5rgTVP2tq233IVmTyOXl
         +ecIjcmWuzepSu6OfLXW9FfTDoU/0WlWdP34BGas=
Date:   Tue, 5 Jan 2021 17:43:29 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 57/75] dt-bindings: media: Convert i.MX7 MIPI CSI-2
 receiver binding to YAML
Message-ID: <X/SJIU7+pw91ZIAM@pendragon.ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
 <20210105152852.5733-58-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210105152852.5733-58-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This isn't applicable anymore as Rui had already converted the DT
bindings. Sorry for the noise.

(I may however send additional patches, for instance to add descriptions
for the clocks).

On Tue, Jan 05, 2021 at 05:28:34PM +0200, Laurent Pinchart wrote:
> Convert the DT binding for the i.MX7 MIPI CSI-2 receiver to YAML. Add
> Rui to the maintainers list as he's the original author of the binding.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../bindings/media/fsl,imx7-mipi-csi2.yaml    | 204 ++++++++++++++++++
>  .../bindings/media/imx7-mipi-csi2.txt         |  90 --------
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 205 insertions(+), 91 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx7-mipi-csi2.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/fsl,imx7-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/fsl,imx7-mipi-csi2.yaml
> new file mode 100644
> index 000000000000..2df997293780
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/fsl,imx7-mipi-csi2.yaml
> @@ -0,0 +1,204 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/fsl,imx7-mipi-csi2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX7 MIPI CSI-2 receiver
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +  - Rui Miguel Silva <rui.silva@linaro.org>
> +
> +description: |-
> +  The NXP i.MX7 SoC family includes a MIPI CSI-2 receiver IP core, documented
> +  as "CSIS V3.3". The IP core seems to originate from Samsung, and may be
> +  compatible with some of the Exynos4 ad S5P SoCs.
> +
> +  While the CSI-2 receiver is separate from the MIPI D-PHY IP core, the PHY is
> +  completely wrapped by the CSIS and doesn't expose a control interface of its
> +  own. This binding thus covers both IP cores.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx7-mipi-csi2
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: The peripheral clock (a.k.a. APB clock)
> +      - description: The external clock (optionally used as the pixel clock)
> +      - description: The MIPI D-PHY clock
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: wrap
> +      - const: phy
> +
> +  resets:
> +    items:
> +      - description: MIPI D-PHY slave reset
> +
> +  reset-names:
> +    items:
> +      - const: mrst
> +
> +  power-domains: true
> +
> +  phy-supply:
> +    description: The MIPI D-PHY digital power supply
> +
> +  clock-frequency:
> +    description: The desired external clock ("wrap") frequency, in Hz
> +    default: 166000000
> +
> +  fsl,csis-hs-settle:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: HS-SETTLE time (unit unknown)
> +
> +  ports:
> +    # See ./video-interfaces.txt for details
> +    type: object
> +
> +    properties:
> +      "#address-cells":
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        const: 1
> +
> +      "#size-cells":
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        description: The input port, connected to the CSI-2 source
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +          endpoint:
> +            type: object
> +
> +            properties:
> +              data-lanes:
> +                $ref: /schemas/types.yaml#/definitions/uint32-array
> +                items:
> +                  minItems: 1
> +                  maxItems: 2
> +                  items:
> +                    - const: 1
> +                    - const: 2
> +
> +              remote-endpoint:
> +                $ref: /schemas/types.yaml#/definitions/phandle
> +
> +            required:
> +              - data-lanes
> +              - remote-endpoint
> +
> +            additionalProperties: false
> +
> +        required:
> +          - reg
> +
> +        additionalProperties: false
> +
> +      port@1:
> +        type: object
> +        description: The output port
> +
> +        properties:
> +          reg:
> +            const: 1
> +
> +          endpoint:
> +            type: object
> +
> +            properties:
> +              remote-endpoint:
> +                $ref: /schemas/types.yaml#/definitions/phandle
> +
> +            required:
> +              - remote-endpoint
> +
> +            additionalProperties: false
> +
> +        required:
> +          - reg
> +
> +        additionalProperties: false
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - port@0
> +      - port@1
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - power-domains
> +  - phy-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx7d-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/imx7-reset.h>
> +
> +    mipi_csi: mipi-csi@30750000 {
> +        compatible = "fsl,imx7-mipi-csi2";
> +        reg = <0x30750000 0x10000>;
> +        interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clks IMX7D_IPG_ROOT_CLK>,
> +                 <&clks IMX7D_MIPI_CSI_ROOT_CLK>,
> +                 <&clks IMX7D_MIPI_DPHY_ROOT_CLK>;
> +        clock-names = "pclk", "wrap", "phy";
> +        clock-frequency = <166000000>;
> +        power-domains = <&pgc_mipi_phy>;
> +        phy-supply = <&reg_1p0d>;
> +        resets = <&src IMX7_RESET_MIPI_PHY_MRST>;
> +        reset-names = "mrst";
> +        fsl,csis-hs-settle = <3>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                mipi_csi_in: endpoint {
> +                    remote-endpoint = <&ov2680_out>;
> +                    data-lanes = <1>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                mipi_csi_out: endpoint {
> +                    remote-endpoint = <&csi_mux_from_mipi_vc0>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt b/Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
> deleted file mode 100644
> index 71fd74ed3ec8..000000000000
> --- a/Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
> +++ /dev/null
> @@ -1,90 +0,0 @@
> -Freescale i.MX7 Mipi CSI2
> -=========================
> -
> -mipi_csi2 node
> ---------------
> -
> -This is the device node for the MIPI CSI-2 receiver core in i.MX7 SoC. It is
> -compatible with previous version of Samsung D-phy.
> -
> -Required properties:
> -
> -- compatible    : "fsl,imx7-mipi-csi2";
> -- reg           : base address and length of the register set for the device;
> -- interrupts    : should contain MIPI CSIS interrupt;
> -- clocks        : list of clock specifiers, see
> -        Documentation/devicetree/bindings/clock/clock-bindings.txt for details;
> -- clock-names   : must contain "pclk", "wrap" and "phy" entries, matching
> -                  entries in the clock property;
> -- power-domains : a phandle to the power domain, see
> -          Documentation/devicetree/bindings/power/power_domain.txt for details.
> -- reset-names   : should include following entry "mrst";
> -- resets        : a list of phandle, should contain reset entry of
> -                  reset-names;
> -- phy-supply    : from the generic phy bindings, a phandle to a regulator that
> -	          provides power to MIPI CSIS core;
> -
> -Optional properties:
> -
> -- clock-frequency : The IP's main (system bus) clock frequency in Hz, default
> -		    value when this property is not specified is 166 MHz;
> -- fsl,csis-hs-settle : differential receiver (HS-RX) settle time;
> -
> -The device node should contain two 'port' child nodes with one child 'endpoint'
> -node, according to the bindings defined in:
> - Documentation/devicetree/bindings/ media/video-interfaces.txt.
> - The following are properties specific to those nodes.
> -
> -port node
> ----------
> -
> -- reg		  : (required) can take the values 0 or 1, where 0 shall be
> -                     related to the sink port and port 1 shall be the source
> -                     one;
> -
> -endpoint node
> --------------
> -
> -- data-lanes    : (required) an array specifying active physical MIPI-CSI2
> -		    data input lanes and their mapping to logical lanes; this
> -                    shall only be applied to port 0 (sink port), the array's
> -                    content is unused only its length is meaningful,
> -                    in this case the maximum length supported is 2;
> -
> -example:
> -
> -        mipi_csi: mipi-csi@30750000 {
> -                #address-cells = <1>;
> -                #size-cells = <0>;
> -
> -                compatible = "fsl,imx7-mipi-csi2";
> -                reg = <0x30750000 0x10000>;
> -                interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> -                clocks = <&clks IMX7D_IPG_ROOT_CLK>,
> -                                <&clks IMX7D_MIPI_CSI_ROOT_CLK>,
> -                                <&clks IMX7D_MIPI_DPHY_ROOT_CLK>;
> -                clock-names = "pclk", "wrap", "phy";
> -                clock-frequency = <166000000>;
> -                power-domains = <&pgc_mipi_phy>;
> -                phy-supply = <&reg_1p0d>;
> -                resets = <&src IMX7_RESET_MIPI_PHY_MRST>;
> -                reset-names = "mrst";
> -                fsl,csis-hs-settle = <3>;
> -
> -                port@0 {
> -                        reg = <0>;
> -
> -                        mipi_from_sensor: endpoint {
> -                                remote-endpoint = <&ov2680_to_mipi>;
> -                                data-lanes = <1>;
> -                        };
> -                };
> -
> -                port@1 {
> -                        reg = <1>;
> -
> -                        mipi_vc0_to_csi_mux: endpoint {
> -                                remote-endpoint = <&csi_mux_from_mipi_vc0>;
> -                        };
> -                };
> -        };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 970d9cee509d..584ea2116c38 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10842,8 +10842,8 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/admin-guide/media/imx7.rst
> +F:	Documentation/devicetree/bindings/media/fsl,imx7-mipi-csi2.yaml
>  F:	Documentation/devicetree/bindings/media/imx7-csi.txt
> -F:	Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
>  F:	drivers/staging/media/imx/imx7-media-csi.c
>  F:	drivers/staging/media/imx/imx7-mipi-csis.c
>  

-- 
Regards,

Laurent Pinchart
