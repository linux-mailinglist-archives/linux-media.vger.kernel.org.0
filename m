Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16BF42A0B35
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 17:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbgJ3Qdk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 12:33:40 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33992 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgJ3Qdj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 12:33:39 -0400
Received: by mail-oi1-f196.google.com with SMTP id l62so1575333oig.1;
        Fri, 30 Oct 2020 09:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MwY/vQiiKvOTnY+5d4Wh+IuN2OSwrlDI1QDv3JPHT60=;
        b=GYC7eeF9CT4KXheEAhAKMOtPnr2Gk492SLREAbyfI8A42sjtKXKHm2aBNGo88UIhv3
         iqQYiQ4UMSPfvOQk7J3YK/K3v2jo+aQwxrRTrmLk5c2JImcZ/O9bwF2oF7+V+5jpTW8J
         TAqmlKFYFlvVdM57h4wnJYSeJFf8u7vZdzDRTBTIDUVE/ZDpQxAQQ4tED263njBFrPUa
         vm95o3JjdyVerawuxZTNaRZ+Ci3jhPNX49b7v2Lnhk9MEJDxAtO688+FP9qa+0UsSGaZ
         vAQC9pegfnwbRt/hJyWbqPWCG588vnrSYa6EIYAHlX6RpP5BomWnfaSxdfiw4dzNiT4s
         AdBg==
X-Gm-Message-State: AOAM530UWidXWWynGdKgWku5lJlLMIhZ6m4LdcxR8GnIzh62Asxk3tks
        C2u1hw21qFeXDgDGIbIR/Q==
X-Google-Smtp-Source: ABdhPJy1NHaacIWHlnsek2tAF8Q1rBIIxcawIvq0Pez4qO1EJ2wmCFxJGI5JBYbP/xiW+nLe4IG4XA==
X-Received: by 2002:aca:d401:: with SMTP id l1mr702570oig.96.1604075618577;
        Fri, 30 Oct 2020 09:33:38 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h135sm1509717oib.23.2020.10.30.09.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 09:33:37 -0700 (PDT)
Received: (nullmailer pid 3958664 invoked by uid 1000);
        Fri, 30 Oct 2020 16:33:36 -0000
Date:   Fri, 30 Oct 2020 11:33:36 -0500
From:   Rob Herring <robh@kernel.org>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Yong Deng <yong.deng@magewell.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kevin.lhopital@hotmail.com
Subject: Re: [PATCH 07/14] dt-bindings: media: i2c: Add A31 MIPI CSI-2
 bindings documentation
Message-ID: <20201030163336.GA3909744@bogus>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
 <20201023174546.504028-8-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201023174546.504028-8-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 23, 2020 at 07:45:39PM +0200, Paul Kocialkowski wrote:
> This introduces YAML bindings documentation for the A31 MIPI CSI-2
> controller.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../media/allwinner,sun6i-a31-mipi-csi2.yaml  | 168 ++++++++++++++++++
>  1 file changed, 168 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml
> new file mode 100644
> index 000000000000..9adc0bc27033
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml
> @@ -0,0 +1,168 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/allwinner,sun6i-a31-mipi-csi2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A31 MIPI CSI-2 Device Tree Bindings
> +
> +maintainers:
> +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: allwinner,sun6i-a31-mipi-csi2
> +      - items:
> +          - const: allwinner,sun8i-v3s-mipi-csi2
> +          - const: allwinner,sun6i-a31-mipi-csi2
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Bus Clock
> +      - description: Module Clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: mod
> +
> +  phys:
> +    items:
> +      - description: MIPI D-PHY
> +
> +  phy-names:
> +    items:
> +      - const: dphy
> +
> +  resets:
> +    maxItems: 1
> +
> +  # See ./video-interfaces.txt for details
> +  ports:
> +    type: object
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: Input port, connect to a MIPI CSI-2 sensor
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +          endpoint:
> +            type: object
> +
> +            properties:
> +              remote-endpoint: true
> +
> +              bus-type:
> +                const: 4
> +
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - bus-type
> +              - data-lanes
> +              - remote-endpoint
> +
> +            additionalProperties: false
> +
> +        required:
> +          - endpoint
> +
> +        additionalProperties: false
> +
> +      port@1:
> +        type: object
> +        description: Output port, connect to a CSI controller
> +
> +        properties:
> +          reg:
> +            const: 1
> +
> +          endpoint:
> +            type: object
> +
> +            properties:
> +              remote-endpoint: true
> +
> +              bus-type:
> +                const: 4
> +
> +            additionalProperties: false
> +
> +        required:
> +          - endpoint
> +
> +        additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/sun8i-v3s-ccu.h>
> +    #include <dt-bindings/reset/sun8i-v3s-ccu.h>
> +
> +    mipi_csi2: mipi-csi2@1cb1000 {

I agree with using 'csi' here as that is at least aligned with 'dsi' 
meaning the host side of the protocol. We've not been consistent here...

> +        compatible = "allwinner,sun8i-v3s-mipi-csi2",
> +                     "allwinner,sun6i-a31-mipi-csi2";
> +        reg = <0x01cb1000 0x1000>;
> +        interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&ccu CLK_BUS_CSI>,
> +                 <&ccu CLK_CSI1_SCLK>;
> +        clock-names = "bus", "mod";
> +        resets = <&ccu RST_BUS_CSI>;
> +
> +        phys = <&dphy>;
> +        phy-names = "dphy";
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            mipi_csi2_in: port@0 {
> +                reg = <0>;
> +
> +                mipi_csi2_in_ov5648: endpoint {
> +                    bus-type = <4>; /* MIPI CSI-2 D-PHY */
> +                    clock-lanes = <0>;
> +                    data-lanes = <1 2 3 4>;
> +
> +                    remote-endpoint = <&ov5648_out_mipi_csi2>;
> +                };
> +            };
> +
> +            mipi_csi2_out: port@1 {
> +                reg = <1>;
> +
> +                mipi_csi2_out_csi0: endpoint {
> +                    bus-type = <4>; /* MIPI CSI-2 D-PHY */
> +                    remote-endpoint = <&csi0_in_mipi_csi2>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.28.0
> 
