Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50735D431D
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 16:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbfJKOlb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 10:41:31 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36364 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbfJKOlb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 10:41:31 -0400
Received: by mail-ot1-f67.google.com with SMTP id 67so8154508oto.3;
        Fri, 11 Oct 2019 07:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TKLBwidlY8Z3JTq5wxCnvHpvRsZmPGpUIR8JC3vLZ08=;
        b=ies2Yx2W/892O54NitJ4+cR2BxIN68x+85zj/qhFdFRj+Suz0iydCR63zrhtJf8g9R
         KUQO3b9HmK4O0FWBUrBT/BkJ4E71cs0sbmVchQTv9fTWS3kZyAT39mUtP9pKRPbfBYdN
         PnTEm94PdNA3FEDfI9UFKJkMedmLXgfcsHRAqU/TEOdeMpz20G5pDkmherJvfGblTBxR
         CQYt3h/e74X1fBhotLVUY+Ch0+6vLfm4EN/igXSnsbq2rcMsv3lk5fTT8e8BkO9tZ25C
         L9i0ESS95PntkR1DJfpGCvYL0p3DcWGfiPA2HK402/KJ+n0ID6w2Lt+dyIY/+axnlgzc
         RMTQ==
X-Gm-Message-State: APjAAAUSNfYtGc0jE4jOoTsiR66J/+j1Nzwg2KCCRrgSRbZLk4UiIpZ8
        Vef/1mk7drWeacmi7yPv6Q==
X-Google-Smtp-Source: APXvYqzPDmMOHoPxKw0K4wdBgFxJQJ0ExuW4XED8tlQ8I9P4txCzqKFc3qva5tX8kT2AJFqdUPh2mQ==
X-Received: by 2002:a9d:6d11:: with SMTP id o17mr9430840otp.333.1570804889780;
        Fri, 11 Oct 2019 07:41:29 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r3sm2642930otk.31.2019.10.11.07.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 07:41:29 -0700 (PDT)
Date:   Fri, 11 Oct 2019 09:41:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     mripard@kernel.org, wens@csie.org, mark.rutland@arm.com,
        mchehab@kernel.org, hverkuil@xs4all.nl, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 4/6] dt-bindings: media: Add Allwinner H3 Deinterlace
 binding
Message-ID: <20191011144128.GA24245@bogus>
References: <20190929161653.160158-1-jernej.skrabec@siol.net>
 <20190929161653.160158-5-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190929161653.160158-5-jernej.skrabec@siol.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Sep 29, 2019 at 06:16:51PM +0200, Jernej Skrabec wrote:
> Allwinner H3 Deinterlace core is used for deinterlacing interlaced video
> content. Core can also be found on some later SoCs, like H5 and R40.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  .../media/allwinner,sun8i-h3-deinterlace.yaml | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterlace.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterlace.yaml b/Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterlace.yaml
> new file mode 100644
> index 000000000000..55a5d4e4f0f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterlace.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/allwinner,sun8i-h3-deinterlace.yaml#

Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterlace.yaml: $id: path/filename 'arm/allwinner,sun8i-h3-deinterlace.yaml' doesn't match actual filename
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterlace.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterlace.example.dts] Error 1
Makefile:1282: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

With that fixed,

Reviewed-by: Rob Herring <robh@kernel.org>

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner H3 Deinterlace Device Tree Bindings
> +
> +maintainers:
> +  - Chen-Yu Tsai <wens@csie.org>
> +  - Maxime Ripard <mripard@kernel.org>
> +
> +description: |-
> +  The Allwinner H3 and later has a deinterlace core used for
> +  deinterlacing interlaced video content.
> +
> +properties:
> +  compatible:
> +    const: allwinner,sun8i-h3-deinterlace
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Deinterlace interface clock
> +      - description: Deinterlace module clock
> +      - description: Deinterlace DRAM clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: mod
> +      - const: ram
> +
> +  resets:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 1
> +
> +  interconnect-names:
> +    const: dma-mem
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/sun8i-h3-ccu.h>
> +    #include <dt-bindings/reset/sun8i-h3-ccu.h>
> +
> +    deinterlace: deinterlace@1400000 {
> +        compatible = "allwinner,sun8i-h3-deinterlace";
> +        reg = <0x01400000 0x20000>;
> +        clocks = <&ccu CLK_BUS_DEINTERLACE>,
> +                 <&ccu CLK_DEINTERLACE>,
> +                 <&ccu CLK_DRAM_DEINTERLACE>;
> +        clock-names = "bus", "mod", "ram";
> +        resets = <&ccu RST_BUS_DEINTERLACE>;
> +        interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> +        interconnects = <&mbus 9>;
> +        interconnect-names = "dma-mem";
> +    };
> +
> +...
> -- 
> 2.23.0
> 
