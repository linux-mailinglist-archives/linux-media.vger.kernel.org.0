Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C74A65FF9D
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 12:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbjAFLfa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 06:35:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232487AbjAFLf1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 06:35:27 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EAAB7148F;
        Fri,  6 Jan 2023 03:35:26 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F8AE4AE;
        Fri,  6 Jan 2023 12:35:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673004924;
        bh=Npo5IIBmCbegYNeQclrVJonEiEvw8/xFIfsywaa8voM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cXrSxbvkjGp55Om5z/KEB6yPlpAebTo78gwxq8At1GlKZpx2CEhOElxR99kktCNEa
         U5HIEbLxZEYvX4F6xyOwgEegYfyogNrhHls+v4AVWrDBWGY/J7b+oZL4ngZrWIc5Mi
         TQ/9bqTODBUNLFOuwg9fWuNXCdJts+vNqpxah7FQ=
Date:   Fri, 6 Jan 2023 13:35:19 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/8] media: dt-bindings: media: fsl-pxp: convert to yaml
Message-ID: <Y7gHd0HoG70ntuHM@pendragon.ideasonboard.com>
References: <20230105134729.59542-1-m.tretter@pengutronix.de>
 <20230105134729.59542-2-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230105134729.59542-2-m.tretter@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Thu, Jan 05, 2023 at 02:47:22PM +0100, Michael Tretter wrote:
> Convert the bindings of the Freescale Pixel Pipeline to YAML.
> 
> The conversion drops the previously listed compatibles for several SoCs.
> It is unclear, if the PXP on these SoCs is compatible to any of the PXPs
> on the existing SoCs and would allow to reuse the already defined
> compatibles. The missing compatibles should be brought back when the
> support for the PXP on these SoCs is added.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  .../bindings/media/fsl,imx6ull-pxp.yaml       | 62 +++++++++++++++++++
>  .../devicetree/bindings/media/fsl-pxp.txt     | 26 --------
>  2 files changed, 62 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/fsl-pxp.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml b/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
> new file mode 100644
> index 000000000000..e5f227b84759
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/fsl,imx6ull-pxp.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Freescale Pixel Pipeline
> +
> +maintainers:
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +  - Michael Tretter <m.tretter@pengutronix.de>
> +
> +description:
> +  The Pixel Pipeline (PXP) is a memory-to-memory graphics processing engine
> +  that supports scaling, colorspace conversion, alpha blending, rotation, and
> +  pixel conversion via lookup table. Different versions are present on various
> +  i.MX SoCs from i.MX23 to i.MX7.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx6ul-pxp
> +      - fsl,imx6ull-pxp
> +      - fsl,imx7d-pxp
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 2

Can you make the number of items conditional on the compatible string ?

> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: axi

I think this could be simplified to

  clock-names:
    const: axi

Up to you.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: False

s/False/false/

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx6ul-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    pxp: pxp@21cc000 {
> +        compatible = "fsl,imx6ull-pxp";
> +        reg = <0x021cc000 0x4000>;
> +        interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +        clock-names = "axi";
> +        clocks = <&clks IMX6UL_CLK_PXP>;
> +    };
> diff --git a/Documentation/devicetree/bindings/media/fsl-pxp.txt b/Documentation/devicetree/bindings/media/fsl-pxp.txt
> deleted file mode 100644
> index f8090e06530d..000000000000
> --- a/Documentation/devicetree/bindings/media/fsl-pxp.txt
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -Freescale Pixel Pipeline
> -========================
> -
> -The Pixel Pipeline (PXP) is a memory-to-memory graphics processing engine
> -that supports scaling, colorspace conversion, alpha blending, rotation, and
> -pixel conversion via lookup table. Different versions are present on various
> -i.MX SoCs from i.MX23 to i.MX7.
> -
> -Required properties:
> -- compatible: should be "fsl,<soc>-pxp", where SoC can be one of imx23, imx28,
> -  imx6dl, imx6sl, imx6sll, imx6ul, imx6sx, imx6ull, or imx7d.
> -- reg: the register base and size for the device registers
> -- interrupts: the PXP interrupt, two interrupts for imx6ull and imx7d.
> -- clock-names: should be "axi"
> -- clocks: the PXP AXI clock
> -
> -Example:
> -
> -pxp@21cc000 {
> -	compatible = "fsl,imx6ull-pxp";
> -	reg = <0x021cc000 0x4000>;
> -	interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> -		     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> -	clock-names = "axi";
> -	clocks = <&clks IMX6UL_CLK_PXP>;
> -};

-- 
Regards,

Laurent Pinchart
