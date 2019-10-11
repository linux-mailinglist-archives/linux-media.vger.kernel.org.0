Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 192D9D4004
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 14:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728033AbfJKM4b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 08:56:31 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35518 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727589AbfJKM4b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 08:56:31 -0400
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B259C290FCB;
        Fri, 11 Oct 2019 13:56:28 +0100 (BST)
Date:   Fri, 11 Oct 2019 14:56:25 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Rob Herring <robh+dt@kernel.org>
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
Subject: Re: [RESEND PATCH v2 2/4] media: dt-bindings: rockchip: Document
 RK3399 Video Decoder bindings
Message-ID: <20191011145625.694238b1@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <CAL_JsqL_6xPyb4kTDR3dbLc4Uptwox=1F4zaGjHVmahNyk25=w@mail.gmail.com>
References: <20191011093342.3471-1-boris.brezillon@collabora.com>
        <20191011093342.3471-3-boris.brezillon@collabora.com>
        <CAL_JsqL_6xPyb4kTDR3dbLc4Uptwox=1F4zaGjHVmahNyk25=w@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 11 Oct 2019 07:50:16 -0500
Rob Herring <robh+dt@kernel.org> wrote:

> On Fri, Oct 11, 2019 at 4:33 AM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > Document the Rockchip RK3399 Video Decoder bindings.  
> 
> You need some more headers for the example (or drop defines):
> 
> Error: Documentation/devicetree/bindings/media/rockchip,vdec.example.dts:23.28-29
> syntax error
> FATAL ERROR: Unable to parse input tree
> scripts/Makefile.lib:321: recipe for target
> 'Documentation/devicetree/bindings/media/rockchip,vdec.example.dt.yaml'
> failed
> make[1]: *** [Documentation/devicetree/bindings/media/rockchip,vdec.example.dt.yaml]
> Error 1
> Makefile:1282: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2

Will fix that. BTW, I tried running make dtbs_check and faced a few
errors on other yaml files (which is why I ended up sending the patch
without fully validating the schema). Maybe those have been fixed (I'm
based on the media tree which is based on 5.4-rc1).

Oh, and I also noticed that the generated example has
#address-cells = <1>, #size-cells = <1> in the parent node, while my
example expects <2>. Is there any way I can specify that somewhere, or
should I just tweak the example to use 1 cell instead?

> 
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  .../bindings/media/rockchip,vdec.yaml         | 71 +++++++++++++++++++
> >  1 file changed, 71 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > new file mode 100644
> > index 000000000000..7167c3d6a389
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > @@ -0,0 +1,71 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/rockchip,vdec.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Rockchip Video Decoder (VDec) Device Tree Bindings
> > +
> > +maintainers:
> > +  - Heiko Stuebner <heiko@sntech.de>
> > +
> > +description: |-
> > +  The Rockchip rk3399 has a stateless Video Decoder that can decodes H.264,
> > +  HEVC an VP9 streams.
> > +
> > +properties:
> > +  compatible:
> > +    const: rockchip,rk3399-vdec
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: The Video Decoder AXI interface clock
> > +      - description: The Video Decoder AHB interface clock
> > +      - description: The Video Decoded CABAC clock
> > +      - description: The Video Decoder core clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: aclk
> > +      - const: iface
> > +      - const: cabac
> > +      - const: core
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    vdec: video-codec@ff660000 {
> > +        compatible = "rockchip,rk3399-vdec";
> > +        reg = <0x0 0xff660000 0x0 0x400>;
> > +        interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        clocks = <&cru ACLK_VDU>, <&cru HCLK_VDU>,
> > +                 <&cru SCLK_VDU_CA>, <&cru SCLK_VDU_CORE>;
> > +        clock-names = "aclk", "iface", "cabac", "core";
> > +        power-domains = <&power RK3399_PD_VDU>;
> > +        iommus = <&vdec_mmu>;
> > +    };
> > +
> > +...
> > --
> > 2.21.0
> >  

