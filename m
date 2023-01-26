Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B587F67CB9D
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 14:04:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232090AbjAZNEZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 08:04:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbjAZNEY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 08:04:24 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C0F5B9D;
        Thu, 26 Jan 2023 05:04:22 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id ay1so935719pfb.7;
        Thu, 26 Jan 2023 05:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DWm7eTwMrQ0nGf/JK2vIcHfVCjcE6fqVapxuyiP5nZs=;
        b=QjQ/mw7zS0d8OuG50f45yMu6roPKZx4ifq/QIBEmBHXF7CdRotHToMgqOISjMIX8H3
         UuHdqSafkG6DeCD8Ucx5LR02WsAxn5NO1cqikERyNwyz1FCU9gQ+/NFSOst05HWr0Bbr
         RM9YZb2YVf8smjIirsqQJnovKAkkcxLddAqV5+hSa6ucEOr7DmgMsX26oypBdSZj6/54
         wkbom29UlpJaMCXJHufTYSKD9QIchNjR77+/aRtdjvdwHRZu67V5eNg1JS8u8j8dTLBq
         AlDBaYcBUXBT9rPYmM6ixjErejCr7MuzLgSkDycznkLKzcaZbFWeBmD5WtB0X7ttUC2p
         ICqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DWm7eTwMrQ0nGf/JK2vIcHfVCjcE6fqVapxuyiP5nZs=;
        b=ZuZjMBzlzM5yccICQNjgvLIXMZmdgrVjPrJ8CAGBNL2RST+baeML5t7FGLJVQB3NeT
         3YlVcoCwP5n7X1bfvZ2Oubt20IUiBhsI/IX4dGLABDuhwZTouYa1Nc1U6IzUXD1NFEzL
         xph4OiLxZP2srKz9kRRpQ2cBU916VYWlKbG8otvkfFev+mAMueaC/LnA4zcOyyhnr6rc
         JrWRnWMoyPhlZLeylFBICyK2/lyjYREPfJVAayNOjOHiD6v/3SizEH9lA0kRzm0o56qn
         qz2wbDXAickxSDU4xL3RSrEPTXYEW1D2KjzUXtq1tTXrTnFOiTt6NLm+JBsF2lTxOmjV
         2LUg==
X-Gm-Message-State: AFqh2kqouzHyQfpE0HCx25F0XFmSWhS756xfj2872qeuP5Hh5rff3mzR
        U9NX4u85Pcpe8BSr66OTlpLOznIMpMQq/BwBu/c=
X-Google-Smtp-Source: AMrXdXtCeVQoLv6CyfSO3ueCDjKx91U9VwCMOiXexoV2QAmArRgcvHyw2ygCiNUsT+BnHtM8ZYxZbSlyG88bESwCDWI=
X-Received: by 2002:a63:cc01:0:b0:4d0:370b:5027 with SMTP id
 x1-20020a63cc01000000b004d0370b5027mr3485511pgf.8.1674738261053; Thu, 26 Jan
 2023 05:04:21 -0800 (PST)
MIME-Version: 1.0
References: <20230126003320.10047-1-laurent.pinchart@ideasonboard.com>
 <20230126003320.10047-2-laurent.pinchart@ideasonboard.com>
 <CAHCN7x+PcBk-Y+t3AP4saJK=tntYr85btTzQMFD=WL+KYQfHGg@mail.gmail.com>
 <Y9Jehk+qOXkaI3SH@pendragon.ideasonboard.com> <Y9Jvm1GxfNRhPBP/@pendragon.ideasonboard.com>
In-Reply-To: <Y9Jvm1GxfNRhPBP/@pendragon.ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 26 Jan 2023 07:04:09 -0600
Message-ID: <CAHCN7x+GO7mL9myhqP4xGe12_wAF37rr8n5TcN7Cx8a=gOytPQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: Add i.MX8 ISI DT bindings
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 26, 2023 at 6:18 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Jan 26, 2023 at 01:05:43PM +0200, Laurent Pinchart wrote:
> > Hi Adam,
> >
> > On Wed, Jan 25, 2023 at 08:36:41PM -0600, Adam Ford wrote:
> > > On Wed, Jan 25, 2023 at 6:33 PM Laurent Pinchart wrote:
> > > >
> > > > The Image Sensing Interface (ISI) combines image processing pipelines
> > > > with DMA engines to process and capture frames originating from a
> > > > variety of sources. The inputs to the ISI go through Pixel Link
> > > > interfaces, and their number and nature is SoC-dependent. They cover
> > > > both capture interfaces (MIPI CSI-2 RX, HDMI RX) and memory inputs.
> > > >
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > > Changes since v2:
> > > >
> > > > - Describe the interrupts property
> > > > - Set global minItems and maxItems for interrupts
> > > > - Set maxItems for power-domains
> > > >
> > > > Changes since v1:
> > > >
> > > > - Fix compatible string checks in conditional schema
> > > > - Fix interrupts property handling
> > > > ---
> > > >  .../bindings/media/nxp,imx8-isi.yaml          | 152 ++++++++++++++++++
> > > >  1 file changed, 152 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > > > new file mode 100644
> > > > index 000000000000..130fa41b9d8e
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > > > @@ -0,0 +1,152 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/media/nxp,imx8-isi.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: i.MX8 Image Sensing Interface
> > > > +
> > > > +maintainers:
> > > > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > +
> > > > +description: |
> > > > +  The Image Sensing Interface (ISI) combines image processing pipelines with
> > > > +  DMA engines to process and capture frames originating from a variety of
> > > > +  sources. The inputs to the ISI go through Pixel Link interfaces, and their
> > > > +  number and nature is SoC-dependent. They cover both capture interfaces (MIPI
> > > > +  CSI-2 RX, HDMI RX, ...) and display engine outputs for writeback support.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - fsl,imx8mn-isi
> > > > +      - fsl,imx8mp-isi
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    items:
> > > > +      - description: The AXI clock
> > > > +      - description: The APB clock
> > > > +      # TODO: Check if the per-channel ipg_proc_clk clocks need to be specified
> > > > +      # as well, in case some SoCs have the ability to control them separately.
> > > > +      # This may be the case of the i.MX8[DQ]X(P)
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: axi
> > > > +      - const: apb
> > > > +
> > > > +  fsl,blk-ctrl:
> > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > +    description:
> > > > +      A phandle referencing the block control that contains the CSIS to ISI
> > > > +      gasket.
> > > > +
> > > > +  interrupts:
> > > > +    description: Processing pipeline interrupts, one per pipeline
> > > > +    minItems: 1
> > > > +    maxItems: 2
> > > > +
> > > > +  power-domains:
> > > > +    maxItems: 1
> > > > +
> > > > +  ports:
> > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > +    description: |
> > > > +      Ports represent the Pixel Link inputs to the ISI. Their number and
> > > > +      assignment are model-dependent. Each port shall have a single endpoint.
> > > > +
> > > > +    patternProperties:
> > > > +      "^port@[0-9]$":
> > > > +        $ref: /schemas/graph.yaml#/properties/port
> > > > +        unevaluatedProperties: false
> > > > +
> > > > +    unevaluatedProperties: false
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - interrupts
> > > > +  - clocks
> > > > +  - clock-names
> > > > +  - fsl,blk-ctrl
> > > > +  - ports
> > > > +
> > > > +allOf:
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            const: fsl,imx8mn-isi
> > > > +    then:
> > > > +      properties:
> > > > +        interrupts:
> > > > +          maxItems: 1
> > > > +        ports:
> > > > +          properties:
> > > > +            port@0:
> > > > +              description: MIPI CSI-2 RX
> > > > +          required:
> > > > +            - port@0
> > >
> > > The imx8mn only has one port for the ISI.  When I compile the device
> > > tree with W=1, I get the following:
> > > arch/arm64/boot/dts/freescale/imx8mn.dtsi:1058.11-1068.7: Warning
> > > (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph
> > > node has single child node 'port@0', #address-cells/#size-cells are
> > > not necessary
> >
> > The only appropriate answer to this is of course aaaarrrrghhhhhhhh.
> >
> > > Should the "ports" node be replaced with a single port with port@0 removed?
> > >
> > > The device tree would look something like:
> > >
> > > port {
> > >     isi_in: endpoint {
> > >         remote-endpoint = <&mipi_csi_out>;
> > >     };
> > > };
> >
> > I understand why DT tools (and before them, DT maintainers) recommend
> > (or require ?) single-port devices to use the short-hand syntax without
> > a ports node. In this specific case, or in the more general case of
> > devices that can have a variable number of ports depending on how
> > they're instantiated in a particular SoC, allowing a ports node to have
> > a single port child would be best I believe, as it would make DT
> > bindings more consistent, and simpler.
> >
> > > With the above, the messages go away, and I can still see the media
> > > pipeline and the video captures.  I am not good with YAML, so I am not
> > > exactly sure how to code that in YAML form.
> >
> > It's possible, and I can do so, but I'll wait for feedback from DT
> > maintainers.
>
> Here's a patch on top of this one to support port/ports depending on the
> number of ports. Adam, could you test it ? Could you also share the

I can test it tonight.

> i.MX8MN DT node for the ISI ? I'd like to add it as an example to the
> bindings.

Here is git repo where took your stuff and added the Nano stuff:

https://github.com/aford173/linux/commit/f1ab727b4f6429aab281a3269ff4567008b72de3

Once the bindings are accepted, I'll push this (or similar) patch to the LKML.

adam

>
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> index cead41a017bf..8bbdc4ed929d 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> @@ -52,11 +52,21 @@ properties:
>    power-domains:
>      maxItems: 1
>
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: |
> +      The port represents the Pixel Link input to the ISI. It shall have a
> +      single endpoint. This property is only used for ISI instances with a
> +      single port (as in the i.MX8MN). For instances that includes multiple
> +      ports, the 'ports' property shall be used instead.
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>      description: |
>        Ports represent the Pixel Link inputs to the ISI. Their number and
> -      assignment are model-dependent. Each port shall have a single endpoint.
> +      assignment are model-dependent. For ISI instances that have a single
> +      port, the 'port' property should be used instead. Each port shall have a
> +      single endpoint.
>
>  required:
>    - compatible
> @@ -65,7 +75,6 @@ required:
>    - clocks
>    - clock-names
>    - fsl,blk-ctrl
> -  - ports
>
>  allOf:
>    - if:
> @@ -77,12 +86,11 @@ allOf:
>        properties:
>          interrupts:
>            maxItems: 1
> -        ports:
> -          properties:
> -            port@0:
> -              description: MIPI CSI-2 RX
> -          required:
> -            - port@0
> +        port:
> +          description: MIPI CSI-2 RX
> +        ports: false
> +      required:
> +        - port
>
>    - if:
>        properties:
> @@ -93,6 +101,7 @@ allOf:
>        properties:
>          interrupts:
>            maxItems: 2
> +        port: false
>          ports:
>            properties:
>              port@0:
> @@ -102,6 +111,8 @@ allOf:
>            required:
>              - port@0
>              - port@1
> +      required:
> +        - ports
>
>  additionalProperties: false
>
> > > > +
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            const: fsl,imx8mp-isi
> > > > +    then:
> > > > +      properties:
> > > > +        interrupts:
> > > > +          maxItems: 2
> > > > +        ports:
> > > > +          properties:
> > > > +            port@0:
> > > > +              description: MIPI CSI-2 RX 0
> > > > +            port@1:
> > > > +              description: MIPI CSI-2 RX 1
> > > > +          required:
> > > > +            - port@0
> > > > +            - port@1
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/clock/imx8mp-clock.h>
> > > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > > +
> > > > +    isi@32e00000 {
> > > > +        compatible = "fsl,imx8mp-isi";
> > > > +        reg = <0x32e00000 0x4000>;
> > > > +        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> > > > +                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> > > > +        clocks = <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
> > > > +                 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
> > > > +        clock-names = "axi", "apb";
> > > > +        fsl,blk-ctrl = <&media_blk_ctrl>;
> > > > +        power-domains = <&mediamix_pd>;
> > > > +
> > > > +        ports {
> > > > +            #address-cells = <1>;
> > > > +            #size-cells = <0>;
> > > > +
> > > > +            port@0 {
> > > > +                reg = <0>;
> > > > +                isi_in_0: endpoint {
> > > > +                    remote-endpoint = <&mipi_csi_0_out>;
> > > > +                };
> > > > +            };
> > > > +
> > > > +            port@1 {
> > > > +                reg = <1>;
> > > > +                isi_in_1: endpoint {
> > > > +                    remote-endpoint = <&mipi_csi_1_out>;
> > > > +                };
> > > > +            };
> > > > +        };
> > > > +    };
> > > > +
> > > > +...
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>
> --
> Regards,
>
> Laurent Pinchart
