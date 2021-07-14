Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A10C13C8A37
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 19:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239689AbhGNRz7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 13:55:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56618 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbhGNRz7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 13:55:59 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C23E5CC;
        Wed, 14 Jul 2021 19:53:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1626285186;
        bh=QmqvQmDf4z1Kd6Zmw2Kq3TefduwoDoEibMPZSd0M0zo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SDlyhHpnyDHYplmZMtdo8UXlIuupS1UsLJ1CliPOqH75cS8mRiEhg+cHoezcgHaPi
         iE9AVUiOnodGGaE4yshoMfLqxtaIVp+GiW1gTmaMU6/v4tsfFnAnJoLbIMIeuDC2lt
         ByeQrZaPUBh3tOcg2dUmU12LaHsNryDUoxfDAn9U=
Date:   Wed, 14 Jul 2021 20:53:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     festevam@gmail.com, krzk@kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, kernel@puri.sm,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, m.felsch@pengutronix.de,
        mchehab@kernel.org, phone-devel@vger.kernel.org, robh@kernel.org,
        shawnguo@kernel.org, slongerbeam@gmail.com
Subject: Re: [PATCH v6 1/3] dt-bindings: media: document the
 nxp,imx8mq-mipi-csi2 receiver phy and controller
Message-ID: <YO8kgHoV/PVlF3oV@pendragon.ideasonboard.com>
References: <20210714111931.324485-1-martin.kepplinger@puri.sm>
 <20210714111931.324485-2-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210714111931.324485-2-martin.kepplinger@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

Thank you for the patch.

On Wed, Jul 14, 2021 at 01:19:29PM +0200, Martin Kepplinger wrote:
> The i.MX8MQ SoC integrates a different MIPI CSI receiver as the i.MX8MM so
> describe the DT bindings for it.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml  | 173 ++++++++++++++++++
>  1 file changed, 173 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> new file mode 100644
> index 000000000000..97222485f223
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> @@ -0,0 +1,173 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/nxp,imx8mq-mipi-csi2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX8MQ MIPI CSI-2 receiver
> +
> +maintainers:
> +  - Martin Kepplinger <martin.kepplinger@puri.sm>
> +
> +description: |-
> +  This binding covers the CSI-2 RX PHY and host controller included in the
> +  NXP i.MX8MQ SoC. It handles the sensor/image input and process for all the
> +  input imaging devices.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8mq-mipi-csi2
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: core is the RX Controller Core Clock input. This clock
> +                     must be exactly equal to or faster than the receive
> +                     byteclock from the RX DPHY.
> +      - description: esc is the Rx Escape Clock. This must be the same escape
> +                     clock that the RX DPHY receives.
> +      - description: ui is the pixel clock (phy_ref up to 333Mhz).

Where did you get the 333MHz limit from ? The information I've received
indicate a limit of 125MHz for the UI clock (and 266 and 133 MHz for the
core and esc clocks respectively).

With this addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +                     See the reference manual for details.
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: esc
> +      - const: ui
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: CORE_RESET reset register bit definition
> +      - description: PHY_REF_RESET reset register bit definition
> +      - description: ESC_RESET reset register bit definition
> +
> +  fsl,mipi-phy-gpr:
> +    description: |
> +      The phandle to the imx8mq syscon iomux-gpr with the register
> +      for setting RX_ENABLE for the mipi receiver.
> +
> +      The format should be as follows:
> +      <gpr req_gpr>
> +      gpr is the phandle to general purpose register node.
> +      req_gpr is the gpr register offset of RX_ENABLE for the mipi phy.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
> +        - description: The 'gpr' is the phandle to general purpose register node.
> +        - description: The 'req_gpr' is the gpr register offset containing
> +                       CSI2_1_RX_ENABLE or CSI2_2_RX_ENABLE respectively.
> +          maximum: 0xff
> +
> +  interconnects:
> +    maxItems: 1
> +
> +  interconnect-names:
> +    const: dram
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port node, single endpoint describing the CSI-2 transmitter.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                items:
> +                  minItems: 1
> +                  maxItems: 4
> +                  items:
> +                    - const: 1
> +                    - const: 2
> +                    - const: 3
> +                    - const: 4
> +
> +            required:
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output port node
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - resets
> +  - fsl,mipi-phy-gpr
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mq-clock.h>
> +    #include <dt-bindings/interconnect/imx8mq.h>
> +
> +    csi@30a70000 {
> +        compatible = "fsl,imx8mq-mipi-csi2";
> +        reg = <0x30a70000 0x1000>;
> +        clocks = <&clk IMX8MQ_CLK_CSI1_CORE>,
> +                 <&clk IMX8MQ_CLK_CSI1_ESC>,
> +                 <&clk IMX8MQ_CLK_CSI1_PHY_REF>;
> +        clock-names = "core", "esc", "ui";
> +        assigned-clocks = <&clk IMX8MQ_CLK_CSI1_CORE>,
> +                          <&clk IMX8MQ_CLK_CSI1_PHY_REF>,
> +                          <&clk IMX8MQ_CLK_CSI1_ESC>;
> +        assigned-clock-rates = <266000000>, <200000000>, <66000000>;
> +        assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_266M>,
> +                                 <&clk IMX8MQ_SYS2_PLL_1000M>,
> +                                 <&clk IMX8MQ_SYS1_PLL_800M>;
> +        power-domains = <&pgc_mipi_csi1>;
> +        resets = <&src IMX8MQ_RESET_MIPI_CSI1_CORE_RESET>,
> +                 <&src IMX8MQ_RESET_MIPI_CSI1_PHY_REF_RESET>,
> +                 <&src IMX8MQ_RESET_MIPI_CSI1_ESC_RESET>;
> +        fsl,mipi-phy-gpr = <&iomuxc_gpr 0x88>;
> +        interconnects = <&noc IMX8MQ_ICM_CSI1 &noc IMX8MQ_ICS_DRAM>;
> +        interconnect-names = "dram";
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                imx8mm_mipi_csi_in: endpoint {
> +                    remote-endpoint = <&imx477_out>;
> +                    data-lanes = <1 2 3 4>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                imx8mm_mipi_csi_out: endpoint {
> +                    remote-endpoint = <&csi_in>;
> +                };
> +            };
> +        };
> +    };
> +
> +...

-- 
Regards,

Laurent Pinchart
