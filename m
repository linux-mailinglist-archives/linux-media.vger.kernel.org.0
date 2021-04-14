Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7F035FD45
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 23:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232559AbhDNV0u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 17:26:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231167AbhDNV0r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 17:26:47 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09C17C061756
        for <linux-media@vger.kernel.org>; Wed, 14 Apr 2021 14:26:25 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id u20so24792049lja.13
        for <linux-media@vger.kernel.org>; Wed, 14 Apr 2021 14:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=P1hOBamynUxE5Ahteh8eMyUde+7o+FPvnuntgy3ekNM=;
        b=mQ4lQf7+qErMrMUZh5zi+d044YnIkDFBPmKL8K1YRBWdc9Xl4I1WcOnfarc4a+7ICD
         y4n0muxmGHQTAKnuHfJQDxblye38zu9stm6OR395cvs3QF6IgBK3LxonkxuxFVt09Wq/
         Ioc79hrOGlrkLd0hIA1gyU72A+zEYAYO23IgaCuQn8tZCKKIhzeRL01D5sebIRHN+qNh
         NpQMN+BKKPwXxFNXyzydTNDp2YNmEMOWjrjB7nF4GddaORmgxGRs9FF/dD/ndBRb18L9
         sFFBLXNTXq5259Gn/fq9MM3IwcW1+5FuygQTKls4CpI4s6pRPqfKJA5u/3vYw9+BLPJZ
         dCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=P1hOBamynUxE5Ahteh8eMyUde+7o+FPvnuntgy3ekNM=;
        b=qMMKLzZrdGEx2nQlFhvBikWHjW8tR4B/bXY9pZavETgpM8+DKxYCwW6FKTddDYxRRz
         s0Ikg7wPTsSVTtW14r4y7AHWKo5rXx9ltf/hQaXep/u5lfLr1sJ3zByRUVP5jObwbbaO
         oPQCl1uCt/Eelm1QnrF8btoOy/9dDCf7fsq04iiFKh0hfr+ixBWkl+POKB1EMsgnNPnW
         /WDbhH7rCcdeOTUDg1wNrv8ZTsPiOdgi/eMzq2kMd0Jg9qLuxHypzXTQWq4FvWSSSAdh
         raVV1QLZPYjzzNBwAWM2iuSs0nSG7WKDQ4GDWjM6dHNAlzNk39USLPWC+DTq9F3hfu29
         suGw==
X-Gm-Message-State: AOAM530E0nv9KdaJCon9t6VyL5ezQDNRlf6ZFf6JuurCR7Il6jGj47NB
        Ep1y7rfpMGolhJeI/zwgfRx7yQ==
X-Google-Smtp-Source: ABdhPJwj2X9hN9ckj+zm7A+aR7ukKi1EvY8Ds6CvIWfMzqfnvPLJu1Q7wAtps9mMpVJvKFpg4JqcHA==
X-Received: by 2002:a2e:5808:: with SMTP id m8mr16321ljb.354.1618435583361;
        Wed, 14 Apr 2021 14:26:23 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id x25sm241457lfn.307.2021.04.14.14.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 14:26:22 -0700 (PDT)
Date:   Wed, 14 Apr 2021 23:26:21 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: media: renesas,isp: Add bindings for
 ISP Channel Selector
Message-ID: <YHdd/XZQ3fypBZ9m@oden.dyn.berto.se>
References: <20210413172708.2519173-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210413172708.2519173-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Niklas,

On 2021-04-13 19:27:08 +0200, Niklas Söderlund wrote:
> Add bindings for Renesas R-Car ISP Channel Selector IP. The ISP is
> responsible for filtering the MIPI CSI-2 bus and directing the different
> CSI-2 virtual channels to different R-Car VIN instances (DMA engines)
> for capture.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  .../bindings/media/renesas,isp.yaml           | 197 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 198 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,isp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,isp.yaml b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> new file mode 100644
> index 0000000000000000..99a1556d21d00106
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> @@ -0,0 +1,197 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +# Copyright (C) 2021 Renesas Electronics Corp.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/renesas,isp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car ISP Channel Selector
> +
> +maintainers:
> +  - Niklas Söderlund <niklas.soderlund@ragnatech.se>
> +
> +description:
> +  The R-Car ISP Channel Selector provides MIPI CSI-2 VC and DT filtering
> +  capabilities for the Renesas R-Car family of devices. It is used in
> +  conjunction with the R-Car VIN and CSI-2 modules, which provides the video
> +  capture capabilities.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,isp-r8a779a0 # V3U

This should of course be renesas,r8a779a0-isp.

(un)lucky for me I managed to get it wrong in all three of bindings, 
driver and DT files on the first try. I will fix this in a v2. Thanks 
Geert for spotting this.

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
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description:
> +          Input port node, multiple endpoints describing the connected R-Car
> +          CSI-2 receivers.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Single endpoint describing the R-Car VIN connected to output port 0.
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Single endpoint describing the R-Car VIN connected to output port 1.
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Single endpoint describing the R-Car VIN connected to output port 2.
> +
> +      port@4:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Single endpoint describing the R-Car VIN connected to output port 3.
> +
> +      port@5:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Single endpoint describing the R-Car VIN connected to output port 4.
> +
> +      port@6:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Single endpoint describing the R-Car VIN connected to output port 5.
> +
> +      port@7:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Single endpoint describing the R-Car VIN connected to output port 6.
> +
> +      port@8:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Single endpoint describing the R-Car VIN connected to output port 7.
> +
> +    required:
> +      - port@0
> +      - port@1
> +      - port@2
> +      - port@3
> +      - port@4
> +      - port@5
> +      - port@6
> +      - port@7
> +      - port@8
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - power-domains
> +  - resets
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a779a0-sysc.h>
> +
> +    isp1: isp@fed20000 {
> +            compatible = "renesas,isp-r8a779a0";
> +            reg = <0xfed20000 0x10000>;
> +            interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&cpg CPG_MOD 613>;
> +            power-domains = <&sysc R8A779A0_PD_A3ISP01>;
> +            resets = <&cpg 613>;
> +            status = "disabled";
> +
> +            ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    port@0 {
> +                            #address-cells = <1>;
> +                            #size-cells = <0>;
> +
> +                            reg = <0>;
> +                            isp1csi41: endpoint@1 {
> +                                    reg = <1>;
> +                                    remote-endpoint = <&csi41isp1>;
> +                            };
> +                    };
> +
> +                    port@1 {
> +                            reg = <1>;
> +                            isp1vin08: endpoint {
> +                                    remote-endpoint = <&vin08isp1>;
> +                            };
> +                    };
> +
> +                    port@2 {
> +                            reg = <2>;
> +                            isp1vin09: endpoint {
> +                                    remote-endpoint = <&vin09isp1>;
> +                            };
> +                    };
> +
> +                    port@3 {
> +                            reg = <3>;
> +                            isp1vin10: endpoint {
> +                                    remote-endpoint = <&vin10isp1>;
> +                            };
> +                    };
> +
> +                    port@4 {
> +                            reg = <4>;
> +                            isp1vin11: endpoint {
> +                                    remote-endpoint = <&vin11isp1>;
> +                            };
> +                    };
> +
> +                    port@5 {
> +                            reg = <5>;
> +                            isp1vin12: endpoint {
> +                                    remote-endpoint = <&vin12isp1>;
> +                            };
> +                    };
> +
> +                    port@6 {
> +                            reg = <6>;
> +                            isp1vin13: endpoint {
> +                                    remote-endpoint = <&vin13isp1>;
> +                            };
> +                    };
> +
> +                    port@7 {
> +                            reg = <7>;
> +                            isp1vin14: endpoint {
> +                                    remote-endpoint = <&vin14isp1>;
> +                            };
> +                    };
> +
> +                    port@8 {
> +                            reg = <8>;
> +                            isp1vin15: endpoint {
> +                                    remote-endpoint = <&vin15isp1>;
> +                            };
> +                    };
> +            };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b265a7ba60e709f3..e125d0eed7b021a0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11144,6 +11144,7 @@ L:	linux-renesas-soc@vger.kernel.org
>  S:	Supported
>  T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/renesas,csi2.yaml
> +F:	Documentation/devicetree/bindings/media/renesas,isp.yaml
>  F:	Documentation/devicetree/bindings/media/renesas,vin.yaml
>  F:	drivers/media/platform/rcar-vin/
>  
> -- 
> 2.31.1
> 

-- 
Regards,
Niklas Söderlund
