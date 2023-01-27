Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2224D67DB3B
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 02:26:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233076AbjA0B0k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 20:26:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbjA0B0j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 20:26:39 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36786728C3;
        Thu, 26 Jan 2023 17:26:37 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id nm12-20020a17090b19cc00b0022c2155cc0bso3462979pjb.4;
        Thu, 26 Jan 2023 17:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9pJQyN7faLrYE8EO01AciosWjQyfo4DJHwV4xwI/r4A=;
        b=Ron3n+FDTmbB3Ny8uWavRki07ohYmqrhRi+g81ERwiZQzyS75hdrbwe2y8tQEyJQ/o
         eHWjpJZlOjawAkMihU0YTx8rpqi4eERzG1dakimjCuiM+bgmTtwh4GqOt0mHwWx++Fhx
         gUQK9a5DQaHUEpW8cUdqTqu0GXdWov607xpFviWi5gv6MrYwzx96pql/rVwT90XvUcuU
         2R02t66aKB218HORtLQipY43R9UPEKt4ROG/ywhCwtInLNJgGibvr/1F9DF6tw8emcH3
         3JFDxG5FLTRSXoG9+MVdhcpfnsqvVUhR2ao5Qf2uRaDYGSFckY2l5wm+5NMUgn9NIfiq
         63tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9pJQyN7faLrYE8EO01AciosWjQyfo4DJHwV4xwI/r4A=;
        b=m6WCGAeqKKffRcBMjRpKQ4zatOR5uhyTVTpRMIXbYOoIEp/4hMhYreBmsAJ8GfBuUl
         Wp+0AYrvSwW6Q5CfD6kvBhnCEnoFrL6NNfqmAL9OmRYOkMLub6RA0BR5NfstZuaqqhwa
         4Am3TA/RVfrkrfuU99mWb0pP2C8tCCKeCnWi9t/je0G3wYW4eCG4pkE+aYXp3ZN1HjEk
         FD12xj6HoZIuRB0u20uE6nIRCQyM+IwrXyxnUKZtUMW/mBgujAw5dT7MtYmhvpplZXca
         xxS6ApKQmN+HaeoihQbClRJNsIy+PzOcO7M4WCa3GLBeT4CwMGGQvfEaymG8l193ZuLF
         jlHQ==
X-Gm-Message-State: AFqh2koEVBihCLRn9pHdvNiObmuptEo8nD1oRQ65q99NAE2q7EDNeUfy
        fAl5gxOlOGhU521rVCNYEaPteBg6DjvxavgCeck=
X-Google-Smtp-Source: AMrXdXtyYtizWODHV57rm7EKOYp1lLdm48iOPp/yWhpioZKLnZmtxcPLw0uRj3ABDDrRL3gxNonmJw9uJC2kMs8pI4A=
X-Received: by 2002:a17:902:714c:b0:195:eb15:6ed0 with SMTP id
 u12-20020a170902714c00b00195eb156ed0mr2970428plm.19.1674782795984; Thu, 26
 Jan 2023 17:26:35 -0800 (PST)
MIME-Version: 1.0
References: <20230126003320.10047-1-laurent.pinchart@ideasonboard.com>
 <20230126003320.10047-2-laurent.pinchart@ideasonboard.com>
 <CAHCN7x+PcBk-Y+t3AP4saJK=tntYr85btTzQMFD=WL+KYQfHGg@mail.gmail.com>
 <Y9Jehk+qOXkaI3SH@pendragon.ideasonboard.com> <Y9Jvm1GxfNRhPBP/@pendragon.ideasonboard.com>
 <CAHCN7x+GO7mL9myhqP4xGe12_wAF37rr8n5TcN7Cx8a=gOytPQ@mail.gmail.com>
 <Y9KsHnQWIRTWzVoT@pendragon.ideasonboard.com> <CAHCN7xLT512MxNhdysqNTO38fiCVpAdu1Z-Qen3Mjp+pPKGEhQ@mail.gmail.com>
In-Reply-To: <CAHCN7xLT512MxNhdysqNTO38fiCVpAdu1Z-Qen3Mjp+pPKGEhQ@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 26 Jan 2023 19:26:24 -0600
Message-ID: <CAHCN7xL_TYHthQLPvtphqhn70LQsEPXayQTu_3WFVqibLrLKVw@mail.gmail.com>
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

On Thu, Jan 26, 2023 at 12:25 PM Adam Ford <aford173@gmail.com> wrote:
>
> On Thu, Jan 26, 2023 at 10:36 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Adam,
> >
> > On Thu, Jan 26, 2023 at 07:04:09AM -0600, Adam Ford wrote:
> > > On Thu, Jan 26, 2023 at 6:18 AM Laurent Pinchart wrote:
> > > > On Thu, Jan 26, 2023 at 01:05:43PM +0200, Laurent Pinchart wrote:
> > > > > On Wed, Jan 25, 2023 at 08:36:41PM -0600, Adam Ford wrote:
> > > > > > On Wed, Jan 25, 2023 at 6:33 PM Laurent Pinchart wrote:
> > > > > > >
> > > > > > > The Image Sensing Interface (ISI) combines image processing pipelines
> > > > > > > with DMA engines to process and capture frames originating from a
> > > > > > > variety of sources. The inputs to the ISI go through Pixel Link
> > > > > > > interfaces, and their number and nature is SoC-dependent. They cover
> > > > > > > both capture interfaces (MIPI CSI-2 RX, HDMI RX) and memory inputs.
> > > > > > >
> > > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > > > ---
> > > > > > > Changes since v2:
> > > > > > >
> > > > > > > - Describe the interrupts property
> > > > > > > - Set global minItems and maxItems for interrupts
> > > > > > > - Set maxItems for power-domains
> > > > > > >
> > > > > > > Changes since v1:
> > > > > > >
> > > > > > > - Fix compatible string checks in conditional schema
> > > > > > > - Fix interrupts property handling
> > > > > > > ---
> > > > > > >  .../bindings/media/nxp,imx8-isi.yaml          | 152 ++++++++++++++++++
> > > > > > >  1 file changed, 152 insertions(+)
> > > > > > >  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..130fa41b9d8e
> > > > > > > --- /dev/null
> > > > > > > +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > > > > > > @@ -0,0 +1,152 @@
> > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > +%YAML 1.2
> > > > > > > +---
> > > > > > > +$id: http://devicetree.org/schemas/media/nxp,imx8-isi.yaml#
> > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > +
> > > > > > > +title: i.MX8 Image Sensing Interface
> > > > > > > +
> > > > > > > +maintainers:
> > > > > > > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > > > +
> > > > > > > +description: |
> > > > > > > +  The Image Sensing Interface (ISI) combines image processing pipelines with
> > > > > > > +  DMA engines to process and capture frames originating from a variety of
> > > > > > > +  sources. The inputs to the ISI go through Pixel Link interfaces, and their
> > > > > > > +  number and nature is SoC-dependent. They cover both capture interfaces (MIPI
> > > > > > > +  CSI-2 RX, HDMI RX, ...) and display engine outputs for writeback support.
> > > > > > > +
> > > > > > > +properties:
> > > > > > > +  compatible:
> > > > > > > +    enum:
> > > > > > > +      - fsl,imx8mn-isi
> > > > > > > +      - fsl,imx8mp-isi
> > > > > > > +
> > > > > > > +  reg:
> > > > > > > +    maxItems: 1
> > > > > > > +
> > > > > > > +  clocks:
> > > > > > > +    items:
> > > > > > > +      - description: The AXI clock
> > > > > > > +      - description: The APB clock
> > > > > > > +      # TODO: Check if the per-channel ipg_proc_clk clocks need to be specified
> > > > > > > +      # as well, in case some SoCs have the ability to control them separately.
> > > > > > > +      # This may be the case of the i.MX8[DQ]X(P)
> > > > > > > +
> > > > > > > +  clock-names:
> > > > > > > +    items:
> > > > > > > +      - const: axi
> > > > > > > +      - const: apb
> > > > > > > +
> > > > > > > +  fsl,blk-ctrl:
> > > > > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > > > > +    description:
> > > > > > > +      A phandle referencing the block control that contains the CSIS to ISI
> > > > > > > +      gasket.
> > > > > > > +
> > > > > > > +  interrupts:
> > > > > > > +    description: Processing pipeline interrupts, one per pipeline
> > > > > > > +    minItems: 1
> > > > > > > +    maxItems: 2
> > > > > > > +
> > > > > > > +  power-domains:
> > > > > > > +    maxItems: 1
> > > > > > > +
> > > > > > > +  ports:
> > > > > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > > > > +    description: |
> > > > > > > +      Ports represent the Pixel Link inputs to the ISI. Their number and
> > > > > > > +      assignment are model-dependent. Each port shall have a single endpoint.
> > > > > > > +
> > > > > > > +    patternProperties:
> > > > > > > +      "^port@[0-9]$":
> > > > > > > +        $ref: /schemas/graph.yaml#/properties/port
> > > > > > > +        unevaluatedProperties: false
> > > > > > > +
> > > > > > > +    unevaluatedProperties: false
> > > > > > > +
> > > > > > > +required:
> > > > > > > +  - compatible
> > > > > > > +  - reg
> > > > > > > +  - interrupts
> > > > > > > +  - clocks
> > > > > > > +  - clock-names
> > > > > > > +  - fsl,blk-ctrl
> > > > > > > +  - ports
> > > > > > > +
> > > > > > > +allOf:
> > > > > > > +  - if:
> > > > > > > +      properties:
> > > > > > > +        compatible:
> > > > > > > +          contains:
> > > > > > > +            const: fsl,imx8mn-isi
> > > > > > > +    then:
> > > > > > > +      properties:
> > > > > > > +        interrupts:
> > > > > > > +          maxItems: 1
> > > > > > > +        ports:
> > > > > > > +          properties:
> > > > > > > +            port@0:
> > > > > > > +              description: MIPI CSI-2 RX
> > > > > > > +          required:
> > > > > > > +            - port@0
> > > > > >
> > > > > > The imx8mn only has one port for the ISI.  When I compile the device
> > > > > > tree with W=1, I get the following:
> > > > > > arch/arm64/boot/dts/freescale/imx8mn.dtsi:1058.11-1068.7: Warning
> > > > > > (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph
> > > > > > node has single child node 'port@0', #address-cells/#size-cells are
> > > > > > not necessary
> > > > >
> > > > > The only appropriate answer to this is of course aaaarrrrghhhhhhhh.
> > > > >
> > > > > > Should the "ports" node be replaced with a single port with port@0 removed?
> > > > > >
> > > > > > The device tree would look something like:
> > > > > >
> > > > > > port {
> > > > > >     isi_in: endpoint {
> > > > > >         remote-endpoint = <&mipi_csi_out>;
> > > > > >     };
> > > > > > };
> > > > >
> > > > > I understand why DT tools (and before them, DT maintainers) recommend
> > > > > (or require ?) single-port devices to use the short-hand syntax without
> > > > > a ports node. In this specific case, or in the more general case of
> > > > > devices that can have a variable number of ports depending on how
> > > > > they're instantiated in a particular SoC, allowing a ports node to have
> > > > > a single port child would be best I believe, as it would make DT
> > > > > bindings more consistent, and simpler.
> > > > >
> > > > > > With the above, the messages go away, and I can still see the media
> > > > > > pipeline and the video captures.  I am not good with YAML, so I am not
> > > > > > exactly sure how to code that in YAML form.
> > > > >
> > > > > It's possible, and I can do so, but I'll wait for feedback from DT
> > > > > maintainers.
> > > >
> > > > Here's a patch on top of this one to support port/ports depending on the
> > > > number of ports. Adam, could you test it ? Could you also share the
> > >
> > > I can test it tonight.
> > >
> > > > i.MX8MN DT node for the ISI ? I'd like to add it as an example to the
> > > > bindings.
> > >
> > > Here is git repo where took your stuff and added the Nano stuff:
> > >
> > > https://github.com/aford173/linux/commit/f1ab727b4f6429aab281a3269ff4567008b72de3
> >
> > Thanks. I notice you list two interrupt lines there, while the ISI has a
> > single channel. Is that an oversight ?
>
> The Nano TRM lists interrupt 16 as "ISI Camera Channel 0 Interrupt"
> and lists interrupt 42 as "ISI Camera Channel 1 Interrupt"
> It didn't occur to me that channels 1 and 2 are superfluous, but
> looking at NXP's downstream kernel, they only use 16.
>
> The TRM also lists a Channel 2 interrupt as well, but I modeled it
> after the 8MP example. I can try it again tonight with the 2nd
> interrupt removed and let you know the outcome.
> I agree that removing it is likely the right thing to do.

I removed the channel 2 interrupt, and it still works as expected.
I'll update my git repo.
>
> adam
>
> >
> > > Once the bindings are accepted, I'll push this (or similar) patch to the LKML.
> > >
> > > > diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > > > index cead41a017bf..8bbdc4ed929d 100644
> > > > --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > > > @@ -52,11 +52,21 @@ properties:
> > > >    power-domains:
> > > >      maxItems: 1
> > > >
> > > > +  port:
> > > > +    $ref: /schemas/graph.yaml#/properties/port
> > > > +    description: |
> > > > +      The port represents the Pixel Link input to the ISI. It shall have a
> > > > +      single endpoint. This property is only used for ISI instances with a
> > > > +      single port (as in the i.MX8MN). For instances that includes multiple
> > > > +      ports, the 'ports' property shall be used instead.
> > > > +
> > > >    ports:
> > > >      $ref: /schemas/graph.yaml#/properties/ports
> > > >      description: |
> > > >        Ports represent the Pixel Link inputs to the ISI. Their number and
> > > > -      assignment are model-dependent. Each port shall have a single endpoint.
> > > > +      assignment are model-dependent. For ISI instances that have a single
> > > > +      port, the 'port' property should be used instead. Each port shall have a
> > > > +      single endpoint.
> > > >
> > > >  required:
> > > >    - compatible
> > > > @@ -65,7 +75,6 @@ required:
> > > >    - clocks
> > > >    - clock-names
> > > >    - fsl,blk-ctrl
> > > > -  - ports
> > > >
> > > >  allOf:
> > > >    - if:
> > > > @@ -77,12 +86,11 @@ allOf:
> > > >        properties:
> > > >          interrupts:
> > > >            maxItems: 1
> > > > -        ports:
> > > > -          properties:
> > > > -            port@0:
> > > > -              description: MIPI CSI-2 RX
> > > > -          required:
> > > > -            - port@0
> > > > +        port:
> > > > +          description: MIPI CSI-2 RX
> > > > +        ports: false
> > > > +      required:
> > > > +        - port
> > > >
> > > >    - if:
> > > >        properties:
> > > > @@ -93,6 +101,7 @@ allOf:
> > > >        properties:
> > > >          interrupts:
> > > >            maxItems: 2
> > > > +        port: false
> > > >          ports:
> > > >            properties:
> > > >              port@0:
> > > > @@ -102,6 +111,8 @@ allOf:
> > > >            required:
> > > >              - port@0
> > > >              - port@1
> > > > +      required:
> > > > +        - ports
> > > >
> > > >  additionalProperties: false
> > > >
> > > > > > > +
> > > > > > > +  - if:
> > > > > > > +      properties:
> > > > > > > +        compatible:
> > > > > > > +          contains:
> > > > > > > +            const: fsl,imx8mp-isi
> > > > > > > +    then:
> > > > > > > +      properties:
> > > > > > > +        interrupts:
> > > > > > > +          maxItems: 2
> > > > > > > +        ports:
> > > > > > > +          properties:
> > > > > > > +            port@0:
> > > > > > > +              description: MIPI CSI-2 RX 0
> > > > > > > +            port@1:
> > > > > > > +              description: MIPI CSI-2 RX 1
> > > > > > > +          required:
> > > > > > > +            - port@0
> > > > > > > +            - port@1
> > > > > > > +
> > > > > > > +additionalProperties: false
> > > > > > > +
> > > > > > > +examples:
> > > > > > > +  - |
> > > > > > > +    #include <dt-bindings/clock/imx8mp-clock.h>
> > > > > > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > > > > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > > > > > +
> > > > > > > +    isi@32e00000 {
> > > > > > > +        compatible = "fsl,imx8mp-isi";
> > > > > > > +        reg = <0x32e00000 0x4000>;
> > > > > > > +        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> > > > > > > +                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> > > > > > > +        clocks = <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
> > > > > > > +                 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
> > > > > > > +        clock-names = "axi", "apb";
> > > > > > > +        fsl,blk-ctrl = <&media_blk_ctrl>;
> > > > > > > +        power-domains = <&mediamix_pd>;
> > > > > > > +
> > > > > > > +        ports {
> > > > > > > +            #address-cells = <1>;
> > > > > > > +            #size-cells = <0>;
> > > > > > > +
> > > > > > > +            port@0 {
> > > > > > > +                reg = <0>;
> > > > > > > +                isi_in_0: endpoint {
> > > > > > > +                    remote-endpoint = <&mipi_csi_0_out>;
> > > > > > > +                };
> > > > > > > +            };
> > > > > > > +
> > > > > > > +            port@1 {
> > > > > > > +                reg = <1>;
> > > > > > > +                isi_in_1: endpoint {
> > > > > > > +                    remote-endpoint = <&mipi_csi_1_out>;
> > > > > > > +                };
> > > > > > > +            };
> > > > > > > +        };
> > > > > > > +    };
> > > > > > > +
> > > > > > > +...
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
