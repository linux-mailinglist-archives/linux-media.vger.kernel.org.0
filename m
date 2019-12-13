Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9811911E679
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 16:23:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727762AbfLMPXo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 10:23:44 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:55416 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727536AbfLMPXo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 10:23:44 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02C04E41;
        Fri, 13 Dec 2019 16:23:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576250622;
        bh=9YNy9xTU5XimeURCP7Sp1qumv4WSHztJ66YuDPP2q/M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lP57kF262X0/Yg4V8og2glamOK5n6U+VScNg78VEBGo7DcBAmygHqGH8IFR720RiQ
         GuVYu1QoCorwQP3984jpVDTfsdzttoem/n3xSoLfNXXnvvgdWlwmQjeWA7Xv7q2Fpw
         PPZ6vsIVlhxpqgDBg8v/fViFeBorsDzRjx7UyCmI=
Date:   Fri, 13 Dec 2019 17:23:32 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 5/7] media: dt-bindings: rockchip: Document RK3399
 Video Decoder bindings
Message-ID: <20191213152332.GF4860@pendragon.ideasonboard.com>
References: <20191213125414.90725-1-boris.brezillon@collabora.com>
 <20191213125414.90725-6-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191213125414.90725-6-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Boris,

Thank you for the patch.

On Fri, Dec 13, 2019 at 01:54:12PM +0100, Boris Brezillon wrote:
> Document the Rockchip RK3399 Video Decoder bindings.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v3:
> * Fix dtbs_check failures
> ---
>  .../bindings/media/rockchip,vdec.yaml         | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> new file mode 100644
> index 000000000000..7167c3d6a389
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/rockchip,vdec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip Video Decoder (VDec) Device Tree Bindings
> +
> +maintainers:
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +description: |-
> +  The Rockchip rk3399 has a stateless Video Decoder that can decodes H.264,
> +  HEVC an VP9 streams.
> +
> +properties:
> +  compatible:
> +    const: rockchip,rk3399-vdec
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: The Video Decoder AXI interface clock
> +      - description: The Video Decoder AHB interface clock
> +      - description: The Video Decoded CABAC clock
> +      - description: The Video Decoder core clock
> +
> +  clock-names:
> +    items:
> +      - const: aclk

How about calling it "axi" ? None of the other clock names have "clk".

> +      - const: iface

And "ahb" here, as the AXI interface clock is also an interface clock ?

> +      - const: cabac
> +      - const: core
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    vdec: video-codec@ff660000 {
> +        compatible = "rockchip,rk3399-vdec";
> +        reg = <0x0 0xff660000 0x0 0x400>;
> +        interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH 0>;
> +        clocks = <&cru ACLK_VDU>, <&cru HCLK_VDU>,
> +                 <&cru SCLK_VDU_CA>, <&cru SCLK_VDU_CORE>;
> +        clock-names = "aclk", "iface", "cabac", "core";
> +        power-domains = <&power RK3399_PD_VDU>;
> +        iommus = <&vdec_mmu>;
> +    };
> +
> +...

-- 
Regards,

Laurent Pinchart
