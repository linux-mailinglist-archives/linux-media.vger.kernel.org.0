Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DAA0669BC7
	for <lists+linux-media@lfdr.de>; Fri, 13 Jan 2023 16:19:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbjAMPT1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Jan 2023 10:19:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbjAMPSH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Jan 2023 10:18:07 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0DA090E47
        for <linux-media@vger.kernel.org>; Fri, 13 Jan 2023 07:09:45 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pGLge-000623-6Q; Fri, 13 Jan 2023 16:09:44 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pGLgd-0000lN-4k; Fri, 13 Jan 2023 16:09:43 +0100
Date:   Fri, 13 Jan 2023 16:09:43 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 01/16] dt-bindings: media: fsl-pxp: convert to yaml
Message-ID: <20230113150943.GC20866@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org
References: <20230112-imx-pxp-v2-0-e2281da1db55@pengutronix.de>
 <20230112-imx-pxp-v2-1-e2281da1db55@pengutronix.de>
 <bba093d0-e648-61b3-f4d7-b48d43e35920@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bba093d0-e648-61b3-f4d7-b48d43e35920@linaro.org>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 13 Jan 2023 12:56:12 +0100, Krzysztof Kozlowski wrote:
> On 13/01/2023 10:54, Michael Tretter wrote:
> > Convert the bindings of the Freescale Pixel Pipeline to YAML.
> > 
> > The conversion drops the previously listed compatibles for several SoCs.
> > It is unclear, if the PXP on these SoCs is compatible to any of the PXPs
> > on the existing SoCs and would allow to reuse the already defined
> > compatibles. The missing compatibles should be brought back when the
> > support for the PXP on these SoCs is added.
> > 
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> > Changelog:
> > 
> > v2:
> > 
> > - add fsl,imx6sll-pxp and fsl,imx6sx-pxp compatibles
> > - restrict number of interrupts per variant
> > - cleanup syntax
> > ---
> >  .../devicetree/bindings/media/fsl,imx6ull-pxp.yaml | 82 ++++++++++++++++++++++
> >  .../devicetree/bindings/media/fsl-pxp.txt          | 26 -------
> >  2 files changed, 82 insertions(+), 26 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml b/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
> > new file mode 100644
> > index 000000000000..c1232689a261
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
> > @@ -0,0 +1,82 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/fsl,imx6ull-pxp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale Pixel Pipeline
> > +
> > +maintainers:
> > +  - Philipp Zabel <p.zabel@pengutronix.de>
> > +  - Michael Tretter <m.tretter@pengutronix.de>
> > +
> > +description:
> > +  The Pixel Pipeline (PXP) is a memory-to-memory graphics processing engine
> > +  that supports scaling, colorspace conversion, alpha blending, rotation, and
> > +  pixel conversion via lookup table. Different versions are present on various
> > +  i.MX SoCs from i.MX23 to i.MX7.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: fsl,imx6ul-pxp
> > +      - const: fsl,imx6ull-pxp
> > +      - const: fsl,imx7d-pxp
> 
> These three are an enum.

These are alternatives to the 'items:' entry below.

Are you suggesting to use the following statement?

oneOf:
  - enum:
      - fsl,imx6ul-pxp
      - fsl,imx6ull-pxp
      - fsl,imx7d-pxp
  - items:
      - enum:
          - fsl,imx6sll-pxp
          - fsl,imx6sx-pxp

Why is this better than the one that I used?

> 
> > +      - items:
> > +          - enum:
> > +              - fsl,imx6sll-pxp
> > +              - fsl,imx6sx-pxp
> > +          - const: fsl,imx6ull-pxp
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: axi
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx6sx-pxp
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          numItems: 1
> 
> That's not correct syntax... I am surprised that it works. Did you test
> the bindings?

I copied this syntax from renesas,wdt.yaml and ran

	make ARCH=arm dtbs_check DT_SCHEMA_FILES=fsl,imx6ull-pxp.yaml

with SOC_IMX7D=y, SOC_IMX6UL=y, SOC_IMX6SLL=y, and SOC_IMX6SX=y. The latter
two were not enabled in the v1, which is why it didn't catch the missing
compatibles.

On a closer look, I just saw that the checker ignored the schema due to the
incorrect syntax and didn't produce any further errors. With the syntax fixed,
the checker now produces also a few more errors about power-domains, which I
will fix in v3.

Is this syntax correct?

allOf:
  - if:
      properties:
        compatible:
          contains:
            enum:
              - fsl,imx6sx-pxp
    then:
      properties:
        interrupts:
          minItems: 1
          maxItems: 1
    else:
      properties:
        interrupts:
          minItems: 2
          maxItems: 2

Michael
