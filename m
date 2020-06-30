Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC0A20FE67
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 23:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728392AbgF3VCU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 17:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbgF3VCT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 17:02:19 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42286C061755
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 14:02:19 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id y18so12218673lfh.11
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 14:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uWt7/06d177SfGjZmfsBPnXSQpNbyy3gFoJVxWVDYA8=;
        b=dWiHaRI9VnBeDGP7DBdo1Kn3R0l0ukl7bAyOh3hYflvX56bsicOIXT5eyoKQWEpgsz
         uN9qZDGUHmCtaXEgbq1ILRdXaP9pcO/LGjNWSRvrnFvBT6kq+ldPBPE1be9HDX/19O7A
         iWGAdSE6l3c12NiLsgAB84yc61rnyoDyWmBzm2/gNBYBPWrnwENbAydJ8FO5PtRPzQAL
         t6uP2/j1ogqW3zWVKRMe5UrDRGSpUwGBsSTzvv2nMcBVhfBSAd9s1m4fk+cQdSzZI3yk
         7lsBtXifH+ssoUg9bVGV0mg546Es98wXaPD4VkWqNu1WhhVL0mFu4pQabXDR7z3LAr/+
         KGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uWt7/06d177SfGjZmfsBPnXSQpNbyy3gFoJVxWVDYA8=;
        b=darlF81D36MtmtAY5Iw9jRxZF9lRhz34LP0ooQs3AdfpD+aB+FbHFIdaBPjc7sJ5h5
         7QWp0Ik3ybk3YrxwC5Fc81fNMJAqa1DFBflC+DiXzLOOgo8cw+jgT9coOY9GNyzhWZee
         EpkTM1iQwImCHPuN7k/LoBvZmPNe0WdfxRfpWajnC/NsUTX41LyBL+IDGnlDW9scyH1Y
         Z2dbmUzNCfhxCWU1MYw6Slq8c4LFrxW4pk3RwF/d4loOYsoIg5Cu1Q9wXU9BmgU5AZMl
         8s7X1Md2ReQEcrn/zavpx9C4UTZCcTl2xjS/F/cslo7cqhWTjcauom1D7745IoW+Qy8S
         AgGQ==
X-Gm-Message-State: AOAM531Og19K1NrREFpdqALDKDXZ1jFycgl/k3UEyJTbVA78ALDw3gSm
        Op7fNOK/di7Izb8aXfBt6xdtJ5UE3tM=
X-Google-Smtp-Source: ABdhPJwZjvJqCkP+feeQt9eJNqt+pF2IsjHIAxp+Ix8bRXd77wLBq2nhoq0jT6XBaRy6ZcqVrj+ttQ==
X-Received: by 2002:a19:c744:: with SMTP id x65mr13370113lff.133.1593550935782;
        Tue, 30 Jun 2020 14:02:15 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id u15sm1087979ljh.56.2020.06.30.14.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 14:02:14 -0700 (PDT)
Date:   Tue, 30 Jun 2020 23:02:14 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 7/8] dt-bindings: media: renesas,vsp1: Convert binding
 to YAML
Message-ID: <20200630210214.GG2365286@oden.dyn.berto.se>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-8-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200621004734.28602-8-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for your patch.

On 2020-06-21 03:47:33 +0300, Laurent Pinchart wrote:
> Convert the Renesas R-Car VSP1 text binding to YAML.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Changes since v1:
> 
> - Simplify comments on compatible strings
> - Update MAINTAINERS
> ---
>  .../bindings/media/renesas,vsp1.txt           | 30 -------
>  .../bindings/media/renesas,vsp1.yaml          | 83 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 84 insertions(+), 31 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,vsp1.txt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.txt b/Documentation/devicetree/bindings/media/renesas,vsp1.txt
> deleted file mode 100644
> index cd5a955b2ea0..000000000000
> --- a/Documentation/devicetree/bindings/media/renesas,vsp1.txt
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -* Renesas VSP Video Processing Engine
> -
> -The VSP is a video processing engine that supports up-/down-scaling, alpha
> -blending, color space conversion and various other image processing features.
> -It can be found in the Renesas R-Car Gen2, R-Car Gen3, RZ/G1, and RZ/G2 SoCs.
> -
> -Required properties:
> -
> -  - compatible: Must contain one of the following values
> -    - "renesas,vsp1" for the R-Car Gen2 and RZ/G1 VSP1
> -    - "renesas,vsp2" for the R-Car Gen3 and RZ/G2 VSP2
> -
> -  - reg: Base address and length of the registers block for the VSP.
> -  - interrupts: VSP interrupt specifier.
> -  - clocks: A phandle + clock-specifier pair for the VSP functional clock.
> -
> -Optional properties:
> -
> -  - renesas,fcp: A phandle referencing the FCP that handles memory accesses
> -                 for the VSP. Not needed on Gen2, mandatory on Gen3.
> -
> -
> -Example: R8A7790 (R-Car H2) VSP1-S node
> -
> -	vsp@fe928000 {
> -		compatible = "renesas,vsp1";
> -		reg = <0 0xfe928000 0 0x8000>;
> -		interrupts = <0 267 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&mstp1_clks R8A7790_CLK_VSP1_S>;
> -	};
> diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> new file mode 100644
> index 000000000000..65e8ee61ce90
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/renesas,vsp1.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas VSP Video Processing Engine
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +description:
> +  The VSP is a video processing engine that supports up-/down-scaling, alpha
> +  blending, color space conversion and various other image processing features.
> +  It can be found in the Renesas R-Car Gen2, R-Car Gen3, RZ/G1, and RZ/G2 SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,vsp1 # R-Car Gen2 and RZ/G1
> +      - renesas,vsp2 # R-Car Gen3 and RZ/G2
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
> +  renesas,fcp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle referencing the FCP that handles memory accesses for the VSP.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +if:
> +  properties:
> +    compatible:
> +      items:
> +        - const: renesas,vsp1
> +then:
> +  properties:
> +    renesas,fcp: false
> +else:
> +  required:
> +    - renesas,fcp
> +
> +examples:
> +  # R8A7790 (R-Car H2) VSP1-S
> +  - |
> +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    vsp@fe928000 {
> +        compatible = "renesas,vsp1";
> +        reg = <0xfe928000 0x8000>;
> +        interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cpg CPG_MOD 131>;
> +    };
> +
> +  # R8A77951 (R-Car H3) VSP2-BC
> +  - |
> +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    vsp@fe920000 {
> +        compatible = "renesas,vsp2";
> +        reg = <0xfe920000 0x8000>;
> +        interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cpg CPG_MOD 624>;
> +
> +        renesas,fcp = <&fcpvb1>;
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7383dfa510a3..22e079cc3e3f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10730,7 +10730,7 @@ L:	linux-media@vger.kernel.org
>  L:	linux-renesas-soc@vger.kernel.org
>  S:	Supported
>  T:	git git://linuxtv.org/media_tree.git
> -F:	Documentation/devicetree/bindings/media/renesas,vsp1.txt
> +F:	Documentation/devicetree/bindings/media/renesas,vsp1.yaml
>  F:	drivers/media/platform/vsp1/
>  
>  MEDIA DRIVERS FOR ST STV0910 DEMODULATOR ICs
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Regards,
Niklas Söderlund
