Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9531638911F
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 16:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348092AbhESOh7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 10:37:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45016 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348218AbhESOh6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 10:37:58 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB3AEBA7;
        Wed, 19 May 2021 16:36:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621434996;
        bh=4WNnDYwWQ9KxLCfoxwzFzT4oBs1jTEj0bUz9/kkQ+3w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Lq7JZAVlX5YixRbW3QnwLt07h9evlbvsEW6+AsLY+OaaVkMEU9xiFthkIgA5p55DS
         YyNHtLc/4wDxw9LTj6AdV4EH6n0Tn+wkD5ikF3FJdVH2oQapa+3zka8chMQFuA0TtY
         YZtYQMPruLqrf4TjyE1KxRShX6QM20pNZraAbgx4=
Date:   Wed, 19 May 2021 17:36:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: renesas,imr: Convert to json-schema
Message-ID: <YKUic3pypkSOwvTy@pendragon.ideasonboard.com>
References: <353c2d181ceb6a5dfc553f88a201c6b18ee6914d.1621429265.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <353c2d181ceb6a5dfc553f88a201c6b18ee6914d.1621429265.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Wed, May 19, 2021 at 03:01:43PM +0200, Geert Uytterhoeven wrote:
> Convert the Renesas R-Car Image Renderer Tree binding documentation to
> json-schema.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I have listed Sergei as the maintainer, as he wrote the original
> bindings.  Sergei: Please scream if this is inappropriate ;-)
> ---
>  .../devicetree/bindings/media/renesas,imr.txt | 31 ---------
>  .../bindings/media/renesas,imr.yaml           | 66 +++++++++++++++++++
>  2 files changed, 66 insertions(+), 31 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,imr.txt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,imr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,imr.txt b/Documentation/devicetree/bindings/media/renesas,imr.txt
> deleted file mode 100644
> index b0614153ed3682eb..0000000000000000
> --- a/Documentation/devicetree/bindings/media/renesas,imr.txt
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -Renesas R-Car Image Renderer (Distortion Correction Engine)
> ------------------------------------------------------------
> -
> -The image renderer, or the distortion correction engine, is a drawing processor
> -with a simple instruction system capable of referencing video capture data or
> -data in an external memory as 2D texture data and performing texture mapping
> -and drawing with respect to any shape that is split into triangular objects.
> -
> -Required properties:
> -
> -- compatible: "renesas,<soctype>-imr-lx4", "renesas,imr-lx4" as a fallback for
> -  the image renderer light extended 4 (IMR-LX4) found in the R-Car gen3 SoCs,
> -  where the examples with <soctype> are:
> -  - "renesas,r8a7795-imr-lx4" for R-Car H3,
> -  - "renesas,r8a7796-imr-lx4" for R-Car M3-W.
> -- reg: offset and length of the register block;
> -- interrupts: single interrupt specifier;
> -- clocks: single clock phandle/specifier pair;
> -- power-domains: power domain phandle/specifier pair;
> -- resets: reset phandle/specifier pair.
> -
> -Example:
> -
> -	imr-lx4@fe860000 {
> -		compatible = "renesas,r8a7795-imr-lx4", "renesas,imr-lx4";
> -		reg = <0 0xfe860000 0 0x2000>;
> -		interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&cpg CPG_MOD 823>;
> -		power-domains = <&sysc R8A7795_PD_A3VC>;
> -		resets = <&cpg 823>;
> -	};
> diff --git a/Documentation/devicetree/bindings/media/renesas,imr.yaml b/Documentation/devicetree/bindings/media/renesas,imr.yaml
> new file mode 100644
> index 0000000000000000..ea4579209e81660f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,imr.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/renesas,imr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car Image Renderer (Distortion Correction Engine)
> +
> +maintainers:
> +  - Sergei Shtylyov <sergei.shtylyov@gmail.com>
> +
> +description:
> +  The image renderer, or the distortion correction engine, is a drawing
> +  processor with a simple instruction system capable of referencing video
> +  capture data or data in an external memory as 2D texture data and performing
> +  texture mapping and drawing with respect to any shape that is split into
> +  triangular objects.

I'd add a blank line between paragraphs.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +  The image renderer light extended 4 (IMR-LX4) is found in R-Car Gen3 SoCs.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r8a7795-imr-lx4 # R-Car H3
> +          - renesas,r8a7796-imr-lx4 # R-Car M3-W
> +      - const: renesas,imr-lx4      # R-Car Gen3
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - power-domains
> +  - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a7795-sysc.h>
> +
> +    imr-lx4@fe860000 {
> +            compatible = "renesas,r8a7795-imr-lx4", "renesas,imr-lx4";
> +            reg = <0xfe860000 0x2000>;
> +            interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&cpg CPG_MOD 823>;
> +            power-domains = <&sysc R8A7795_PD_A3VC>;
> +            resets = <&cpg 823>;
> +    };

-- 
Regards,

Laurent Pinchart
