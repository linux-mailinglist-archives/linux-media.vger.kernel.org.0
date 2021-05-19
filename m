Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 502393890CF
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 16:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347541AbhESOaF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 10:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241764AbhESOaE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 10:30:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 067CEC06175F;
        Wed, 19 May 2021 07:28:45 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 865D2BA7;
        Wed, 19 May 2021 16:28:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621434522;
        bh=0+5VCbtkiIDim7GlHlKBCPXn/uByoOsuGrJFJo6ix8c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N07SYwlMZ0d8nSWLEP/hcdWm/19/O7cGfcs7RxFAvNwJrEHirifa96Nku4hcp2z3v
         8KCVRsL3Nu06bFbYTxFukhVmXyBgSzfph0VQZd0ZXslFEiJqoPTnyLJN2eoA6OkHyB
         WYjJE93WnmnuKi/JRfcXRtKowNDrN7MpfkC7zUss=
Date:   Wed, 19 May 2021 17:28:40 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: renesas,jpu: Convert to json-schema
Message-ID: <YKUgmGeFtcJn6KeV@pendragon.ideasonboard.com>
References: <ded1a61cbaa39fa7a15efdaa2fdfa4fdb307b930.1621429165.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ded1a61cbaa39fa7a15efdaa2fdfa4fdb307b930.1621429165.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Wed, May 19, 2021 at 03:00:56PM +0200, Geert Uytterhoeven wrote:
> Convert the Renesas JPEG Processing Unit Device Tree binding
> documentation to json-schema.
> 
> Document missing properties.
> Update the example to match reality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> I have listed Mikhail as the maintainer, as he wrote the original driver
> and bindings.  Mikhail: Please scream if this is inappropriate ;-)
> ---
>  .../devicetree/bindings/media/renesas,jpu.txt | 25 -------
>  .../bindings/media/renesas,jpu.yaml           | 65 +++++++++++++++++++
>  2 files changed, 65 insertions(+), 25 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,jpu.txt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,jpu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,jpu.txt b/Documentation/devicetree/bindings/media/renesas,jpu.txt
> deleted file mode 100644
> index d3436e5190f9196a..0000000000000000
> --- a/Documentation/devicetree/bindings/media/renesas,jpu.txt
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -* Renesas JPEG Processing Unit
> -
> -The JPEG processing unit (JPU) incorporates the JPEG codec with an encoding
> -and decoding function conforming to the JPEG baseline process, so that the JPU
> -can encode image data and decode JPEG data quickly.
> -
> -Required properties:
> -- compatible: "renesas,jpu-<soctype>", "renesas,rcar-gen2-jpu" as fallback.
> -	Examples with soctypes are:
> -	  - "renesas,jpu-r8a7790" for R-Car H2
> -	  - "renesas,jpu-r8a7791" for R-Car M2-W
> -	  - "renesas,jpu-r8a7792" for R-Car V2H
> -	  - "renesas,jpu-r8a7793" for R-Car M2-N
> -
> -  - reg: Base address and length of the registers block for the JPU.
> -  - interrupts: JPU interrupt specifier.
> -  - clocks: A phandle + clock-specifier pair for the JPU functional clock.
> -
> -Example: R8A7790 (R-Car H2) JPU node
> -	jpeg-codec@fe980000 {
> -		compatible = "renesas,jpu-r8a7790", "renesas,rcar-gen2-jpu";
> -		reg = <0 0xfe980000 0 0x10300>;
> -		interrupts = <0 272 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&mstp1_clks R8A7790_CLK_JPU>;
> -	};
> diff --git a/Documentation/devicetree/bindings/media/renesas,jpu.yaml b/Documentation/devicetree/bindings/media/renesas,jpu.yaml
> new file mode 100644
> index 0000000000000000..2f55968e864fe2f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,jpu.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/renesas,jpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas JPEG Processing Unit
> +
> +maintainers:
> +  - Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
> +
> +description:
> +  The JPEG processing unit (JPU) incorporates the JPEG codec with an encoding
> +  and decoding function conforming to the JPEG baseline process, so that the
> +  JPU can encode image data and decode JPEG data quickly.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,jpu-r8a7790      # R-Car H2
> +          - renesas,jpu-r8a7791      # R-Car M2-W
> +          - renesas,jpu-r8a7792      # R-Car V2H
> +          - renesas,jpu-r8a7793      # R-Car M2-N
> +      - const: renesas,rcar-gen2-jpu # R-Car Gen2
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
> +    #include <dt-bindings/clock/r8a7790-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a7790-sysc.h>
> +
> +    jpeg-codec@fe980000 {
> +            compatible = "renesas,jpu-r8a7790", "renesas,rcar-gen2-jpu";
> +            reg = <0xfe980000 0x10300>;
> +            interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&cpg CPG_MOD 106>;
> +            power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> +            resets = <&cpg 106>;
> +    };

-- 
Regards,

Laurent Pinchart
