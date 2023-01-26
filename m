Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ECB067C963
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 12:05:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232897AbjAZLFu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 06:05:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbjAZLFt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 06:05:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00C64B472;
        Thu, 26 Jan 2023 03:05:47 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 186882B3;
        Thu, 26 Jan 2023 12:05:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674731146;
        bh=6SJnRTNNhHta/yQ0xWC67dfT+At50MxF/e+q3mbMRXI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jb4mV9WYV5kl+7ikcUiG7/2GY2mCe3QW7+ftwSvPQii7QIH1kDz0CfFBBKlpZt2oq
         9/nVz21w2uFbCc21Gng1FyTQ0MJhqvj/d7pSERsOdeL6KbfuHe8omVaIJDj/EAPCiZ
         7PFRBoKH7HEExJ0KliJu96zGxhbnN4Lq3eYS57fo=
Date:   Thu, 26 Jan 2023 13:05:42 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: media: Add i.MX8 ISI DT bindings
Message-ID: <Y9Jehk+qOXkaI3SH@pendragon.ideasonboard.com>
References: <20230126003320.10047-1-laurent.pinchart@ideasonboard.com>
 <20230126003320.10047-2-laurent.pinchart@ideasonboard.com>
 <CAHCN7x+PcBk-Y+t3AP4saJK=tntYr85btTzQMFD=WL+KYQfHGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHCN7x+PcBk-Y+t3AP4saJK=tntYr85btTzQMFD=WL+KYQfHGg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

On Wed, Jan 25, 2023 at 08:36:41PM -0600, Adam Ford wrote:
> On Wed, Jan 25, 2023 at 6:33 PM Laurent Pinchart wrote:
> >
> > The Image Sensing Interface (ISI) combines image processing pipelines
> > with DMA engines to process and capture frames originating from a
> > variety of sources. The inputs to the ISI go through Pixel Link
> > interfaces, and their number and nature is SoC-dependent. They cover
> > both capture interfaces (MIPI CSI-2 RX, HDMI RX) and memory inputs.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v2:
> >
> > - Describe the interrupts property
> > - Set global minItems and maxItems for interrupts
> > - Set maxItems for power-domains
> >
> > Changes since v1:
> >
> > - Fix compatible string checks in conditional schema
> > - Fix interrupts property handling
> > ---
> >  .../bindings/media/nxp,imx8-isi.yaml          | 152 ++++++++++++++++++
> >  1 file changed, 152 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > new file mode 100644
> > index 000000000000..130fa41b9d8e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > @@ -0,0 +1,152 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/nxp,imx8-isi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: i.MX8 Image Sensing Interface
> > +
> > +maintainers:
> > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +
> > +description: |
> > +  The Image Sensing Interface (ISI) combines image processing pipelines with
> > +  DMA engines to process and capture frames originating from a variety of
> > +  sources. The inputs to the ISI go through Pixel Link interfaces, and their
> > +  number and nature is SoC-dependent. They cover both capture interfaces (MIPI
> > +  CSI-2 RX, HDMI RX, ...) and display engine outputs for writeback support.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8mn-isi
> > +      - fsl,imx8mp-isi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: The AXI clock
> > +      - description: The APB clock
> > +      # TODO: Check if the per-channel ipg_proc_clk clocks need to be specified
> > +      # as well, in case some SoCs have the ability to control them separately.
> > +      # This may be the case of the i.MX8[DQ]X(P)
> > +
> > +  clock-names:
> > +    items:
> > +      - const: axi
> > +      - const: apb
> > +
> > +  fsl,blk-ctrl:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      A phandle referencing the block control that contains the CSIS to ISI
> > +      gasket.
> > +
> > +  interrupts:
> > +    description: Processing pipeline interrupts, one per pipeline
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    description: |
> > +      Ports represent the Pixel Link inputs to the ISI. Their number and
> > +      assignment are model-dependent. Each port shall have a single endpoint.
> > +
> > +    patternProperties:
> > +      "^port@[0-9]$":
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        unevaluatedProperties: false
> > +
> > +    unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - fsl,blk-ctrl
> > +  - ports
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: fsl,imx8mn-isi
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          maxItems: 1
> > +        ports:
> > +          properties:
> > +            port@0:
> > +              description: MIPI CSI-2 RX
> > +          required:
> > +            - port@0
> 
> The imx8mn only has one port for the ISI.  When I compile the device
> tree with W=1, I get the following:
> arch/arm64/boot/dts/freescale/imx8mn.dtsi:1058.11-1068.7: Warning
> (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph
> node has single child node 'port@0', #address-cells/#size-cells are
> not necessary

The only appropriate answer to this is of course aaaarrrrghhhhhhhh.

> Should the "ports" node be replaced with a single port with port@0 removed?
> 
> The device tree would look something like:
> 
> port {
>     isi_in: endpoint {
>         remote-endpoint = <&mipi_csi_out>;
>     };
> };

I understand why DT tools (and before them, DT maintainers) recommend
(or require ?) single-port devices to use the short-hand syntax without
a ports node. In this specific case, or in the more general case of
devices that can have a variable number of ports depending on how
they're instantiated in a particular SoC, allowing a ports node to have
a single port child would be best I believe, as it would make DT
bindings more consistent, and simpler.

> With the above, the messages go away, and I can still see the media
> pipeline and the video captures.  I am not good with YAML, so I am not
> exactly sure how to code that in YAML form.

It's possible, and I can do so, but I'll wait for feedback from DT
maintainers.

> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: fsl,imx8mp-isi
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          maxItems: 2
> > +        ports:
> > +          properties:
> > +            port@0:
> > +              description: MIPI CSI-2 RX 0
> > +            port@1:
> > +              description: MIPI CSI-2 RX 1
> > +          required:
> > +            - port@0
> > +            - port@1
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/imx8mp-clock.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    isi@32e00000 {
> > +        compatible = "fsl,imx8mp-isi";
> > +        reg = <0x32e00000 0x4000>;
> > +        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks = <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
> > +                 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
> > +        clock-names = "axi", "apb";
> > +        fsl,blk-ctrl = <&media_blk_ctrl>;
> > +        power-domains = <&mediamix_pd>;
> > +
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +                isi_in_0: endpoint {
> > +                    remote-endpoint = <&mipi_csi_0_out>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg = <1>;
> > +                isi_in_1: endpoint {
> > +                    remote-endpoint = <&mipi_csi_1_out>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...

-- 
Regards,

Laurent Pinchart
