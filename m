Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61205748FA7
	for <lists+linux-media@lfdr.de>; Wed,  5 Jul 2023 23:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231562AbjGEVX5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jul 2023 17:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbjGEVX4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jul 2023 17:23:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F015919AC;
        Wed,  5 Jul 2023 14:23:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-160-42-71.reb.o2.cz [85.160.42.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00DBC814;
        Wed,  5 Jul 2023 23:23:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688592186;
        bh=mVKQWcInE/02nRlaf5o9UWQQ40Fi6TOUZNaa723ObdY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ccductrnQXwDm9XkJKW1dtrOIQyBAeCVlcgEgbXI1KCjHtBdxkgwvfd6bh3UztBSF
         4l3w2ZzsdLn7/Ll2TxkNqIAjA+piOI10i6gDSaObQ2o0lpxo+mBTSj+1n5PVCfnuOS
         /vCWlqg0kbgyAdGkqJ32GzyAePhMT5fy3IZBOvXI=
Date:   Thu, 6 Jul 2023 00:23:51 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 1/2] media: dt-bindings: Add binding doc for i.MX93 MIPI
 CSI-2
Message-ID: <20230705212351.GC11949@pendragon.ideasonboard.com>
References: <20230703113734.762307-1-guoniu.zhou@oss.nxp.com>
 <20230703113734.762307-2-guoniu.zhou@oss.nxp.com>
 <2292421.ElGaqSPkdT@steina-w>
 <AS8PR04MB90805B1F91BCDB7FDC058392FA2FA@AS8PR04MB9080.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB90805B1F91BCDB7FDC058392FA2FA@AS8PR04MB9080.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 05, 2023 at 01:36:46AM +0000, G.N. Zhou (OSS) wrote:
> Hi Alexander,
> 
> Thanks for you comment.
> 
> > -----Original Message-----
> > From: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Sent: 2023年7月4日 16:39
> > To: linux-media@vger.kernel.org; devicetree@vger.kernel.org; dl-linux-imx
> > <linux-imx@nxp.com>; G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>
> > Cc: mchehab@kernel.org; laurent.pinchart@ideasonboard.com;
> > robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org;
> > jacopo.mondi@ideasonboard.com
> > Subject: Re: [PATCH 1/2] media: dt-bindings: Add binding doc for i.MX93 MIPI
> > CSI-2
> > 
> > Hi Guoniu,
> > 
> > thanks for posting this driver.
> > 
> > Am Montag, 3. Juli 2023, 13:37:33 CEST schrieb guoniu.zhou@oss.nxp.com:
> > >
> > > From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> > >
> > > Add new binding documentation for DesignWare Core MIPI CSI-2 receiver
> > > and DPHY found on NXP i.MX93.
> > >
> > > Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> > > ---
> > >  .../bindings/media/nxp,dwc-mipi-csi2.yaml     | 140 ++++++++++++++++++
> > >  1 file changed, 140 insertions(+)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/media/nxp,dwc-mipi-csi2.yaml
> > > b/Documentation/devicetree/bindings/media/nxp,dwc-mipi-csi2.yaml new
> > > file mode 100644 index 000000000000..ece6fb8991d4
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/nxp,dwc-mipi-csi2.yaml
> > > @@ -0,0 +1,140 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/nxp,dwc-mipi-csi2.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: NXP i.MX93 MIPI CSI-2 Host Controller receiver
> > > +
> > > +maintainers:
> > > +  - G.N. Zhou <guoniu.zhou@nxp.com>
> > > +
> > > +description: |-
> > > +  The MIPI CSI-2 receiver found on i.MX93 originates from Synopsys
> > > +  DesignWare Core and it implements the CSI-2 protocol on the host
> > > +  side and a DPHY configured as a Slave acts as the physical layer.
> > > +  Two data lanes are supported on i.MX93 family devices and the data
> > > +  rate of each lane support up to 1.5Gbps.
> > > +
> > > +  While the CSI-2 receiver is separate from the MIPI D-PHY IP core,
> > > + the PHY is completely wrapped by the CSI-2 controller and expose  a
> > > + control interface which only can communicate with CSI-2 controller
> > > + This binding thus covers both IP cores.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - fsl,imx93-mipi-csi2
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: The peripheral clock (a.k.a. APB clock)
> > > +      - description: The pixel clock
> > > +      - description: The MIPI D-PHY clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: per
> > > +      - const: pixel
> > > +      - const: phy_cfg
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > > +        description:
> > > +          Input port node, single endpoint describing the CSI-2 transmitter.
> > > +
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: video-interfaces.yaml#
> > > +            unevaluatedProperties: false
> > > +
> > > +            properties:
> > > +              data-lanes:
> > > +                minItems: 1
> > > +                items:
> > > +                  - const: 1
> > > +                  - const: 2
> > > +
> > > +              fsl,hsfreqrange:
> > > +                $ref: /schemas/types.yaml#/definitions/uint32
> > > +                description:
> > > +                  Used to select the desired high speed frequency range
> > > +                  according to data lane bit rate. Please refer to i.MX93
> > > +                  reference manual MIPI CSI-2 DPHY chapter to get a valid
> > > +                  value.
> > 
> > If this is data lane bit rate specific, shouldn't it be set in s_stream callback or
> > similar?
> 
> That's correct if we have a formula to calculate it and get data rate from sensor. But Synopsys only
> provide a table to search the valid hsfreqrange according to data rate and the values are nonlinear
> so I export a property to handle this issue.

We have multiple drivers in mainline that do the same, so it's not a
problem, you can have a table of values in the driver and search for the
right entry at runtime. See
drivers/media/platform/renesas/rcar-vin/rcar-csi2.c for instance.

> > > +
> > > +            required:
> > > +              - data-lanes
> > > +              - fsl,hsfreqrange
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description:
> > > +          Output port node
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - clocks
> > > +  - clock-names
> > > +  - power-domains
> > > +  - ports
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/imx93-clock.h>
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +    #include <dt-bindings/power/fsl,imx93-power.h>
> > > +
> > > +    mipi-csi@4ae00000 {
> > > +        compatible = "fsl,imx93-mipi-csi2";
> > > +        reg = <0x4ae00000 0x10000>;
> > > +        interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
> > > +        clocks = <&clks IMX93_CLK_MIPI_CSI_GATE>,
> > > +                 <&clks IMX93_CLK_CAM_PIX>,
> > > +                 <&clks IMX93_CLK_MIPI_PHY_CFG>;
> > > +        clock-names = "per", "pixel", "phy_cfg";
> > > +        power-domains = <&media_blk_ctrl IMX93_MEDIABLK_PD_MIPI_CSI>;
> > > +
> > > +        ports {
> > > +            #address-cells = <1>;
> > > +            #size-cells = <0>;
> > > +
> > > +            port@0 {
> > > +                reg = <0>;
> > > +
> > > +                mipi_from_sensor: endpoint {
> > > +                    remote-endpoint = <&ap1302_to_mipi>;
> > > +                    data-lanes = <1 2>;
> > > +                    fsl,hsfreqrange = <0x2c>;
> > > +                };
> > > +            };
> > > +
> > > +            port@1 {
> > > +                reg = <1>;
> > > +
> > > +                mipi_to_isi: endpoint {
> > > +                    remote-endpoint = <&isi_in>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +...

-- 
Regards,

Laurent Pinchart
