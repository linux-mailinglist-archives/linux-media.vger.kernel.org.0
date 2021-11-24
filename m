Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2CE545B71E
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 10:06:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbhKXJKB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 04:10:01 -0500
Received: from mail-vk1-f179.google.com ([209.85.221.179]:45976 "EHLO
        mail-vk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbhKXJKA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 04:10:00 -0500
Received: by mail-vk1-f179.google.com with SMTP id m19so1023580vko.12;
        Wed, 24 Nov 2021 01:06:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wYsjDsehKErDpqg4qBvaQ2frcS98nKEajTa8vTIyayI=;
        b=WbO4oEVMaVewHjsLAQeFsEDMLmcBU1BXdC0VjgMR/Viejhmz9o5FOkfB3+iUw+nYH9
         qgg1+1RTLRpOV+LRNvDa0bN27UlxKHjRmefVp1vt5pQ8ckVLPgtRaWThnEQ3wX6usDTc
         OZZC6di7yQBnQd5sVtILHJ+VlybQafDnstRqICmr4G9Kr5XL7hXE8ov+nRXf1wH56fnf
         Ui1ApBH2niFLxnV2okESOld9V7mHKcXw9sDt7aBF2pzO4Ei+FyfD8c+Djn6N+d1aOCMP
         rC4XdRfnIdEag050nfGYcAYoItNMIX/PtFoggpbQ9cwnBUs9nY8lSQhUGjNM7I92fLO9
         6GEA==
X-Gm-Message-State: AOAM533SWtWPWt4aFpy+uUjIlrfyX114t/d9qQA66yuKEi3HVbY1OcQd
        kyRDSgd8YJK87cjiwzPhxTf30hHZycOOpw==
X-Google-Smtp-Source: ABdhPJx/1G13S3f6Q15/q7WzCth6RvXzR1X9iiDD02f5K2Qkl8K8cj+1P48QI3VHGtklfFjy5WOFrA==
X-Received: by 2002:a1f:aa48:: with SMTP id t69mr22506525vke.2.1637744810920;
        Wed, 24 Nov 2021 01:06:50 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id v68sm7761896vkb.30.2021.11.24.01.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 01:06:50 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id ay21so3540775uab.12;
        Wed, 24 Nov 2021 01:06:49 -0800 (PST)
X-Received: by 2002:a9f:248b:: with SMTP id 11mr7838182uar.14.1637744809754;
 Wed, 24 Nov 2021 01:06:49 -0800 (PST)
MIME-Version: 1.0
References: <4f8526dafcd3a88631ef2bc8bd2bb4652368d3cb.1626261172.git.geert+renesas@glider.be>
In-Reply-To: <4f8526dafcd3a88631ef2bc8bd2bb4652368d3cb.1626261172.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Nov 2021 10:06:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX3M1ZUBF+fs3LHrx8fdWqJ0Mv9XC3Yb9mTkXRmhctTvQ@mail.gmail.com>
Message-ID: <CAMuHMdX3M1ZUBF+fs3LHrx8fdWqJ0Mv9XC3Yb9mTkXRmhctTvQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: media: renesas,jpu: Convert to json-schema
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro, Sakari,

On Wed, Jul 14, 2021 at 1:17 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Convert the Renesas JPEG Processing Unit Device Tree binding
> documentation to json-schema.
>
> Document missing properties.
> Update the example to match reality.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>   - Add Reviewed-by.

Why was the status of this patch changed from "Reviewed" to "Not
Applicable" in the linux-media patchwork?
https://patchwork.linuxtv.org/project/linux-media/patch/4f8526dafcd3a88631ef2bc8bd2bb4652368d3cb.1626261172.git.geert+renesas@glider.be/

Who's gonna take it?

Thanks!

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
> -       Examples with soctypes are:
> -         - "renesas,jpu-r8a7790" for R-Car H2
> -         - "renesas,jpu-r8a7791" for R-Car M2-W
> -         - "renesas,jpu-r8a7792" for R-Car V2H
> -         - "renesas,jpu-r8a7793" for R-Car M2-N
> -
> -  - reg: Base address and length of the registers block for the JPU.
> -  - interrupts: JPU interrupt specifier.
> -  - clocks: A phandle + clock-specifier pair for the JPU functional clock.
> -
> -Example: R8A7790 (R-Car H2) JPU node
> -       jpeg-codec@fe980000 {
> -               compatible = "renesas,jpu-r8a7790", "renesas,rcar-gen2-jpu";
> -               reg = <0 0xfe980000 0 0x10300>;
> -               interrupts = <0 272 IRQ_TYPE_LEVEL_HIGH>;
> -               clocks = <&mstp1_clks R8A7790_CLK_JPU>;
> -       };
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

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
