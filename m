Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3453F3A71D2
	for <lists+linux-media@lfdr.de>; Tue, 15 Jun 2021 00:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbhFNWRn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 18:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbhFNWRn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 18:17:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3DD6C061574;
        Mon, 14 Jun 2021 15:15:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2A1945E;
        Tue, 15 Jun 2021 00:15:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623708938;
        bh=uof6MHaXIUCea8ZGufIpi8adFFgRzaC/cX7r8VPzFfc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sG1TQO+Nl15DBxFBkLJdveiJPNBNvgaRucmDjpMNbeykvqBGk0pXObhBmPrq0DUW/
         hgyPRiEhX8iinkkMkdcOoluZwsFMEWkvGZq4oWFKIDG2mrOtIEyzqmbykLJbyzU+TL
         atNDbj6Xh80iOQl9CMu4QROaxtATFQxpiqxT1n1Y=
Date:   Tue, 15 Jun 2021 01:15:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     devicetree@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, kernel@puri.sm, krzk@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mchehab@kernel.org,
        phone-devel@vger.kernel.org, robh@kernel.org, shawnguo@kernel.org,
        slongerbeam@gmail.com, m.felsch@pengutronix.de
Subject: Re: [PATCH v4 1/3] dt-bindings: media: document the
 nxp,imx8mq-mipi-csi2 receiver phy and controller
Message-ID: <YMfU9jjGU49IKe3Y@pendragon.ideasonboard.com>
References: <20210614121522.2944593-1-martin.kepplinger@puri.sm>
 <20210614121522.2944593-2-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210614121522.2944593-2-martin.kepplinger@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

Thank you for the patch.

On Mon, Jun 14, 2021 at 02:15:20PM +0200, Martin Kepplinger wrote:
> The i.MX8MQ SoC integrates a different MIPI CSI receiver as the i.MX8MM so
> describe the DT bindings for it.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml  | 171 ++++++++++++++++++
>  1 file changed, 171 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> new file mode 100644
> index 000000000000..4fed224ebfdd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> @@ -0,0 +1,171 @@
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
> +      - description: pxl is the pixel clock (phy_ref up to 333Mhz).
> +      - description: clko2 is the CLKO2 clock root.
> +                     See the reference manual for details.

Copying comments from 4/4:

I can't figure out what the clko2 clock is used for based on the
datasheet. It seems to be a clock output by the SoC on GPIO1_IO15, and
doesn't seem to belong here.

Regarding core, esc and pix, do these clock correspond to the clk,
clk_esc and clk_ui listed in table 13-36 (section 13.8.3.3.1 "RX Local
Interface Description") of the TRM ? If so, should they be renamed
accordingly, to either "clk", "clk_esc" and "clk_ui", or, if we want to
drop the prefixes, "core", "esc" and "ui" ?

> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: esc
> +      - const: pxl
> +      - const: clko2
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
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

I'll let Rob comment on this one :-)

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
> +        resets = <&src>;
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
