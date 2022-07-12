Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 422FA571C7D
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 16:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbiGLO2P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jul 2022 10:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233598AbiGLO2B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jul 2022 10:28:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1E6FB9695;
        Tue, 12 Jul 2022 07:27:23 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DB2225B;
        Tue, 12 Jul 2022 16:27:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657636041;
        bh=I5T9PZSBGeN46b1/EaWw0e4Go6uK1CgXTNN/ntOPNMc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VN7cCKnK3YH6IuE+1i8wGWBe5mZXRyhFVLPD7YsQJSz/HJ73qO5inOpX72Kocj6Kr
         g2dmHqWQTAhh3GVLB3DoBhnu0MngeKu73OKrhP/WJwFJEB23CIqZBJojBugYEY0KH/
         svoun3XVjr68bUzloxdkQdsknQNM/0/sKEdFvtD8=
Date:   Tue, 12 Jul 2022 17:26:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v2 6/7] dt-bindings: media: Add i.MX8 ISI DT bindings
Message-ID: <Ys2ErJr3gymnw2Qx@pendragon.ideasonboard.com>
References: <20220712000251.13607-1-laurent.pinchart@ideasonboard.com>
 <20220712000251.13607-7-laurent.pinchart@ideasonboard.com>
 <d8b124f4-9ed7-7cc1-a978-60997696646f@linaro.org>
 <Ys1MKFknchDYKR/1@pendragon.ideasonboard.com>
 <3359e1bc-54c4-0b10-af9f-05e9f2fb2162@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3359e1bc-54c4-0b10-af9f-05e9f2fb2162@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Tue, Jul 12, 2022 at 02:49:06PM +0200, Krzysztof Kozlowski wrote:
> On 12/07/2022 12:25, Laurent Pinchart wrote:
> > On Tue, Jul 12, 2022 at 09:49:45AM +0200, Krzysztof Kozlowski wrote:
> >> On 12/07/2022 02:02, Laurent Pinchart wrote:
> >>> The Image Sensing Interface (ISI) combines image processing pipelines
> >>> with DMA engines to process and capture frames originating from a
> >>> variety of sources. The inputs to the ISI go through Pixel Link
> >>> interfaces, and their number and nature is SoC-dependent. They cover
> >>> both capture interfaces (MIPI CSI-2 RX, HDMI RX) and memory inputs.
> >>>
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> ---
> >>> Changes since v1:
> >>>
> >>> - Fix compatible string checks in conditional schema
> >>> - Fix interrupts property handling
> >>> ---
> >>>  .../bindings/media/nxp,imx8-isi.yaml          | 148 ++++++++++++++++++
> >>>  1 file changed, 148 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> >>> new file mode 100644
> >>> index 000000000000..390dfa03026b
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> >>> @@ -0,0 +1,148 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/media/nxp,imx8-isi.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: i.MX8 Image Sensing Interface
> >>> +
> >>> +maintainers:
> >>> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> +
> >>> +description: |
> >>> +  The Image Sensing Interface (ISI) combines image processing pipelines with
> >>> +  DMA engines to process and capture frames originating from a variety of
> >>> +  sources. The inputs to the ISI go through Pixel Link interfaces, and their
> >>> +  number and nature is SoC-dependent. They cover both capture interfaces (MIPI
> >>> +  CSI-2 RX, HDMI RX, ...) and display engine outputs for writeback support.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - fsl,imx8mn-isi
> >>> +      - fsl,imx8mp-isi
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  clocks:
> >>> +    items:
> >>> +      - description: The AXI clock
> >>> +      - description: The APB clock
> >>> +      # TODO: Check if the per-channel ipg_proc_clk clocks need to be specified
> >>> +      # as well, in case some SoCs have the ability to control them separately.
> >>> +      # This may be the case of the i.MX8[DQ]X(P)
> >>> +
> >>> +  clock-names:
> >>> +    items:
> >>> +      - const: axi
> >>> +      - const: apb
> >>> +
> >>> +  fsl,blk-ctrl:
> >>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>> +    description:
> >>> +      A phandle referencing the block control that contains the CSIS to ISI
> >>> +      gasket.
> >>> +
> >>> +  interrupts: true
> >>
> >> Need generic constraints - min/maxItems.
> > 
> > I can't set maxItems here, as the value depends on the compatible
> > string. It's set below as part of the "allOf". I could set minItems to
> > 1, but I don't really see a point in doing so.
> 
> Of course you can, just like all other files could.
> 
> https://elixir.bootlin.com/linux/v5.19-rc6/source/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml#L57

I meant I can't set a fixed maximum, other than the max of all max. Is
there a point in doing do ?

> >>> +
> >>> +  power-domains: true
> >>
> >> Ditto.
> > 
> > I'll fix this one.
> > 
> >>> +
> >>> +  ports:
> >>> +    $ref: /schemas/graph.yaml#/properties/ports
> >>> +    description: |
> >>> +      Ports represent the Pixel Link inputs to the ISI. Their number and
> >>> +      assignment are model-dependent. Each port shall have a single endpoint.
> >>> +
> >>> +    patternProperties:
> >>> +      "^port@[0-9]$":
> >>> +        $ref: /schemas/graph.yaml#/properties/port
> >>> +        unevaluatedProperties: false
> >>> +
> >>> +    unevaluatedProperties: false
> >>
> >> At least one port is always required?
> > 
> > That's a fair assumption I think. How would you express that ? There's
> > no patternRequired as far as I know. Note that the device-dependent
> > ports are described in the "allOf" section below, where "required" is
> > set per device model.
> 
> required:
>  - port@0

What if an SoC has port@1 only, or another port ? It's likely not a
concern in this binding though, so I could add required: - port@0, but
is there a point in doing so if the per-compatible constraints list the
required ports ?

> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +  - interrupts
> >>> +  - clocks
> >>> +  - clock-names
> >>> +  - fsl,blk-ctrl
> >>> +  - ports
> >>> +
> >>> +allOf:
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            const: fsl,imx8mn-isi
> >>> +    then:
> >>> +      properties:
> >>> +        interrupts:
> >>> +          maxItems: 1
> >>> +        ports:
> >>> +          properties:
> >>> +            port@0:
> >>> +              description: MIPI CSI-2 RX
> >>> +          required:
> >>> +            - port@0
> >>> +
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            const: fsl,imx8mp-isi
> >>> +    then:
> >>> +      properties:
> >>> +        interrupts:
> >>> +          maxItems: 2
> >>
> >> You need to describe the items.
> > 
> > It's one interrupt per pipeline. Can I add the description to the
> > generic interrupts property instead of documenting each item
> > individually ? Something along the lines of
> > 
> >   interrupts:
> >     description: Processing pipeline interrupts, one per pipeline
> 
> This sounds good, thanks!

Thanks, I'll do that then.

-- 
Regards,

Laurent Pinchart
