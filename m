Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A578361454
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 23:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236219AbhDOVqi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 17:46:38 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:34612 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236050AbhDOVqi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 17:46:38 -0400
Received: by mail-oi1-f181.google.com with SMTP id k18so20880132oik.1;
        Thu, 15 Apr 2021 14:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=tL/ubmEFjEXAoF0GooN3VADxcHCWk7aWPeNUPhAqGj8=;
        b=LRWqinJQqz8PtGrf4YDWZP3S1BJHRqEbwbt4pdyDuu3spm3Pe3TWyDJNFJBQjN1IV+
         nQbt2W4+MQEA29EDle/7V+noGwCCT6HKkfUQpEZaamDceR6VvvbAnsmPzmMS5p0CA5Ci
         XhN4fKOzZsCTe7s5frWnOgdz/lZxovjhop8i0UrYAtWwLcy8o5Qt3gyKUq8dJLOnw/7J
         FNX6X4PloTUtCGQdgSVyPO3ugD7i1ou5wUkmGpXPp9NC8V2XuC/qHWsWc6BYibVkYket
         kym/MWOFd6yEVx/h4Izn8wjyIiGrtVbPfOawHWzaakl7WYAosZZsTb8dMCOcqtr7I6P0
         3VEQ==
X-Gm-Message-State: AOAM531RK1yzWmg92+5gKBs4TFsnKw79AFM9sVCrPKEo3uLWTEpQ8dnb
        mR+95tx+Iyc9C2TAOZQtNJ0l4BFSSQ==
X-Google-Smtp-Source: ABdhPJwcVLdRkNdFxLV842KkM4pZir299CL+E5e+L3gV3xJcpmtCb8IYqq5UjTWQOWBZTofX418tKg==
X-Received: by 2002:aca:4284:: with SMTP id p126mr3853094oia.178.1618523173533;
        Thu, 15 Apr 2021 14:46:13 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 104sm953617oti.45.2021.04.15.14.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 14:46:12 -0700 (PDT)
Received: (nullmailer pid 1936105 invoked by uid 1000);
        Thu, 15 Apr 2021 21:46:11 -0000
Date:   Thu, 15 Apr 2021 16:46:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: media: renesas,isp: Add bindings for
 ISP Channel Selector
Message-ID: <20210415214611.GA1929236@robh.at.kernel.org>
References: <20210413172708.2519173-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210413172708.2519173-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 13, 2021 at 07:27:08PM +0200, Niklas Söderlund wrote:
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

Why port-base on this one? That should be used if you have custom 
properties in the port or endpoint nodes.

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

Don't show 'status' in examples.

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
