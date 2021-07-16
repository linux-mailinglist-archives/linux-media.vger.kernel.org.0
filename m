Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE4AF3CB65F
	for <lists+linux-media@lfdr.de>; Fri, 16 Jul 2021 12:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232146AbhGPKv4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jul 2021 06:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231937AbhGPKv4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jul 2021 06:51:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7ABDC06175F;
        Fri, 16 Jul 2021 03:49:01 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8376B3F0;
        Fri, 16 Jul 2021 12:48:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1626432539;
        bh=N1ac1SzTjIyKVcWZzvXMxpBtvh+6zyfqWW+6DOMn/44=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P3lHtiVjrUbjmMV/wIy0TlDd152PWLOhR29u7jTRggbakRv0zFEP/0U701RS+QiEd
         iqCPQauKeplD4OCrCF8PU+UO7eyR067k1QsFA2nENRh71U9WKcPdm49ilsp7gSHOnu
         ug4FhpSwBQKFxgoTXccRtozXlxuNtTMX4SeMlGJk=
Date:   Fri, 16 Jul 2021 13:48:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     shawnguo@kernel.org, devicetree@vger.kernel.org,
        festevam@gmail.com, kernel@pengutronix.de, kernel@puri.sm,
        krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-imx@nxp.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        m.felsch@pengutronix.de, mchehab@kernel.org,
        phone-devel@vger.kernel.org, robh@kernel.org, slongerbeam@gmail.com
Subject: Re: [PATCH v7 1/3] dt-bindings: media: document the
 nxp,imx8mq-mipi-csi2 receiver phy and controller
Message-ID: <YPFkGbF083LpopP0@pendragon.ideasonboard.com>
References: <20210716102244.581182-1-martin.kepplinger@puri.sm>
 <20210716102244.581182-2-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210716102244.581182-2-martin.kepplinger@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

Thank you for the patch.

On Fri, Jul 16, 2021 at 12:22:42PM +0200, Martin Kepplinger wrote:
> The i.MX8MQ SoC integrates a different MIPI CSI receiver as the i.MX8MM so
> describe the DT bindings for it.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml  | 174 ++++++++++++++++++
>  1 file changed, 174 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> new file mode 100644
> index 000000000000..9c04fa85ee5c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> @@ -0,0 +1,174 @@
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
> +    #include <dt-bindings/reset/imx8mq-reset.h>
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
