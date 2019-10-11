Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22AEBD3FE2
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 14:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727907AbfJKMua (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 08:50:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:37916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727243AbfJKMua (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 08:50:30 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E331C21D7F;
        Fri, 11 Oct 2019 12:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570798229;
        bh=EfojI4EoVWU2yfRZn2ScGSFtRiMdCIkAn9NDwS3CwlA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=u+tLzoR+umDMKcOt1dhqpHIrJhBahkb22lGmGzvgaajzBJ4Ozv2rTbwd40uxHS4nc
         XCtcWdyoi3TsrpCGwN70ux5WEEqF6TqFGvpX81aKEif8Ajxfa1ZQV+qiVhFSzboCdb
         kzZ5ZbUCoj6dwEE3Y4DiDialOgV6s2o3DrHAMfns=
Received: by mail-qk1-f174.google.com with SMTP id 4so8728180qki.6;
        Fri, 11 Oct 2019 05:50:28 -0700 (PDT)
X-Gm-Message-State: APjAAAUW1tSWWZT8lQzj04EvaBQw9vKvZHAXcLtwUTU5NwEWhzfvlEgN
        RCUbMesY/GFGiEzjeM7vdtwl5oqoWY3bd+9hag==
X-Google-Smtp-Source: APXvYqy68MfKQ6ZT8PUVdbTV+Iw25M6gw7fZf1no+MYCTvfil/qKqpseUKv2PMMTDcjsJsX+oNUu/JAr4hm8qtTm7OI=
X-Received: by 2002:a05:620a:136e:: with SMTP id d14mr15175113qkl.393.1570798227949;
 Fri, 11 Oct 2019 05:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20191011093342.3471-1-boris.brezillon@collabora.com> <20191011093342.3471-3-boris.brezillon@collabora.com>
In-Reply-To: <20191011093342.3471-3-boris.brezillon@collabora.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 11 Oct 2019 07:50:16 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL_6xPyb4kTDR3dbLc4Uptwox=1F4zaGjHVmahNyk25=w@mail.gmail.com>
Message-ID: <CAL_JsqL_6xPyb4kTDR3dbLc4Uptwox=1F4zaGjHVmahNyk25=w@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 2/4] media: dt-bindings: rockchip: Document
 RK3399 Video Decoder bindings
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 11, 2019 at 4:33 AM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Document the Rockchip RK3399 Video Decoder bindings.

You need some more headers for the example (or drop defines):

Error: Documentation/devicetree/bindings/media/rockchip,vdec.example.dts:23.28-29
syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:321: recipe for target
'Documentation/devicetree/bindings/media/rockchip,vdec.example.dt.yaml'
failed
make[1]: *** [Documentation/devicetree/bindings/media/rockchip,vdec.example.dt.yaml]
Error 1
Makefile:1282: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
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
> +      - const: iface
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
> --
> 2.21.0
>
