Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F419396A62
	for <lists+linux-media@lfdr.de>; Tue,  1 Jun 2021 02:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232132AbhFAArj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 20:47:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231714AbhFAAri (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 20:47:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD05C061574;
        Mon, 31 May 2021 17:45:57 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97EE588C;
        Tue,  1 Jun 2021 02:45:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622508354;
        bh=aaRaIinwqCNhQXmrnWaLPdMOsD1/sPsbMK/Wqq0cc9o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hZpfMmrkCtS/ht7hbbbEOf9dQV7C/WtkS2JxTddCj851tjWgVmXd3ev+l2jYpK+Lq
         5sz09PgOwsdrMexPRg4yAEuKNdsnDuORUqbE65dDqeRuRQYBrTSbJLQn4HD/T1pq49
         qSAMEc0wkKPzcurbBnx6WsIGxnd4OmEYDeNHRGeM=
Date:   Tue, 1 Jun 2021 03:45:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     festevam@gmail.com, krzk@kernel.org, mchehab@kernel.org,
        robh@kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de,
        kernel@puri.sm, linux-arm-kernel@lists.infradead.org,
        linux-imx@nxp.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        shawnguo@kernel.org, slongerbeam@gmail.com,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: document the
 nxp,imx8mq-mipi-csi2 receiver phy and controller
Message-ID: <YLWDOBHqnDQpXx5Z@pendragon.ideasonboard.com>
References: <20210531112326.90094-1-martin.kepplinger@puri.sm>
 <20210531112326.90094-2-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210531112326.90094-2-martin.kepplinger@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

Thank you for the patch.

On Mon, May 31, 2021 at 01:23:24PM +0200, Martin Kepplinger wrote:
> The i.MX8MQ SoC integrates a different MIPI CSI receiver as the i.MX8MM so
> describe the DT bindings for it.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml  | 162 ++++++++++++++++++
>  1 file changed, 162 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> new file mode 100644
> index 000000000000..4e3b17c220fc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> @@ -0,0 +1,162 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/nxp,imx8mq-mipi-csi2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP and i.MX8MQ MIPI CSI-2 receiver

s/and //

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
> +    minItems: 4

A description of each clock would be nice.

> +
> +  clock-names:
> +    minItems: 4

You can drop this, it's the default with 4 items listed below.

> +    items:
> +      - const: core
> +      - const: esc
> +      - const: pxl
> +      - const: clko2
> +
> +  assigned-clocks:
> +    maxItems: 3
> +
> +  assigned-clock-rates:
> +    maxItems: 3
> +
> +  assigned-clock-parents:
> +    maxItems: 3

Those properties shouldn't be part of the bindings, it's a system
configuration policy.

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  phy-reset:
> +    description:
> +      The phandle to the imx8mq reset-controller.
> +    maxItems: 1
> +
> +  phy-gpr:
> +    description:
> +      The phandle to the imx8mq syscon iomux-gpr.
> +    maxItems: 1
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

    required:
      - port@0
      - port@1

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - assigned-clocks
> +  - assigned-clock-rates
> +  - assigned-clock-parents
> +  - power-domains
> +  - phy-reset
> +  - phy-gpr
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mq-clock.h>
> +    #include <dt-bindings/interconnect/imx8mq.h>
> +
> +    mipi_csi1@30a70000 {
> +        compatible = "fsl,imx8mq-mipi-csi2";
> +        reg = <0x30a70000 0x1000>; /* MIPI CSI1 Controller base addr */
> +        clocks = <&clk IMX8MQ_CLK_CSI1_CORE>,
> +                 <&clk IMX8MQ_CLK_CSI1_ESC>,
> +                 <&clk IMX8MQ_CLK_CSI1_PHY_REF>,
> +                 <&clk IMX8MQ_CLK_CLKO2>;
> +        clock-names = "core", "esc", "pxl", "clko2";
> +        assigned-clocks = <&clk IMX8MQ_CLK_CSI1_CORE>,
> +                          <&clk IMX8MQ_CLK_CSI1_PHY_REF>,
> +                          <&clk IMX8MQ_CLK_CSI1_ESC>;
> +        assigned-clock-rates = <266000000>, <200000000>, <66000000>;
> +        assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_266M>,
> +                                 <&clk IMX8MQ_SYS2_PLL_1000M>,
> +                                 <&clk IMX8MQ_SYS1_PLL_800M>;
> +        power-domains = <&pgc_mipi_csi1>;
> +        phy-reset = <&src>;
> +        phy-gpr = <&iomuxc_gpr>;
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
