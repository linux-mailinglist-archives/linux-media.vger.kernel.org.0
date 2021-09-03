Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0412B3FF937
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 06:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231865AbhICEDr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 00:03:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231721AbhICEDo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 00:03:44 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4728EC061575
        for <linux-media@vger.kernel.org>; Thu,  2 Sep 2021 21:02:44 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id l18so7483214lji.12
        for <linux-media@vger.kernel.org>; Thu, 02 Sep 2021 21:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hsqolKVO4nOJoFFGBqwd8L+i7kJ81PMtNw0t/34Bbxc=;
        b=a+IMKpSwOaBkBCR2jhE3eDJFkMxdZGfrTPA91s5BiAXKK1vbq/JCB59IkKv6KCUtql
         f9BVn1U4h9ANDqU8CgHzLZporyLsDXCdf9/2C09SchnyqGNjRUj1gU+lBRQT2AnAqztU
         9rW80S9PDgEp8TtrnhFEFze2kWMWQAwV71cl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hsqolKVO4nOJoFFGBqwd8L+i7kJ81PMtNw0t/34Bbxc=;
        b=rkRaQyzAbn4rLZ/KTXJbv6k8PzH+iUsykzW9RQOMXRCwQh8kkecmxYS/WGVw+fd6uh
         BhNETcWTvAiXa8589Yl2tYfeVXsDEprOgo4QTwEAgrQdxhJQoSRccTXdcv8uGgx7IgzJ
         oTBJMMMNtcgIKcXYdpKOULDeRKcZoHGtNINi8LcDb9TdR5edFcBYrTDVPrGBsr5Tizr3
         qmer1gmsheYRCRiaEIgReBeNVdW3SrYt9v0whLlW8zlSxBfTt2tJnz7TcyLUYCY8KbE8
         n1dJT5bierswmcV2E8/9UwFdCJvA265rtrTB4TZHcPTjtlKDLgHS49OImG2KuGxlXTYJ
         68QA==
X-Gm-Message-State: AOAM532v1tau9IssVLGCiYuaIG6R9BwyzefJUzcMFcOLwiTPf8EXEzNX
        BOnHhSljfSNUaiXZAh/pAFMA7HxV3hwJ68TFueqTyw==
X-Google-Smtp-Source: ABdhPJxar47W9Hxbv7flNSitG5YspCZFWGxl4kNdEZYVIQGwUadVu8hYMZ5WnWzdLG9zy7rzurwuo3xhXN7yB8eeMJg=
X-Received: by 2002:a2e:7d0e:: with SMTP id y14mr1247904ljc.251.1630641762596;
 Thu, 02 Sep 2021 21:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <20210811025801.21597-14-yunfei.dong@mediatek.com> <YRQQBL8AN0925zj9@pendragon.ideasonboard.com>
 <952c219de7595f7f814d3006fbe25b8089a35212.camel@mediatek.com>
 <CAAEAJfB_qZtVpxk8P=26GkZ1j66v+RzzJTqf3UrfMkWNJ1fmFg@mail.gmail.com>
 <fb85e6287a0d269593fa72d745dc2c573bcfe7bc.camel@mediatek.com>
 <CAAEAJfBAnvc4cL98aaQgAg1xKSZ3ciCVjbg34raGMOOskDSogg@mail.gmail.com> <9c3f871b3b58b8456e40c43fe402a7a4acb66660.camel@mediatek.com>
In-Reply-To: <9c3f871b3b58b8456e40c43fe402a7a4acb66660.camel@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 3 Sep 2021 12:02:31 +0800
Message-ID: <CAGXv+5G=qJoXqt1vSurV9CTjwfbZOHvjE9fy2FVjPjkw_uWE+Q@mail.gmail.com>
Subject: Re: [PATCH v5, 13/15] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for mt8192
To:     "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        George Sun <george.sun@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 2, 2021 at 2:09 PM yunfei.dong@mediatek.com
<yunfei.dong@mediatek.com> wrote:
>
> Hi Ezequiel,
>
> Thanks for your suggestion.
> On Wed, 2021-09-01 at 08:50 -0300, Ezequiel Garcia wrote:
> > On Wed, 1 Sept 2021 at 00:49, yunfei.dong@mediatek.com
> > <yunfei.dong@mediatek.com> wrote:
> > >
> > > Hi Ezequiel,
> > >
> > > Thanks for your feedback.
> > > On Sun, 2021-08-29 at 17:54 -0300, Ezequiel Garcia wrote:
> > > > On Tue, 17 Aug 2021 at 00:52, yunfei.dong@mediatek.com
> > > > <yunfei.dong@mediatek.com> wrote:
> > > > >
> > > > > Hi Laurent,
> > > > >
> > > > > Thanks for your detail suggestion.
> > > > >
> > > > > On Wed, 2021-08-11 at 20:59 +0300, Laurent Pinchart wrote:
> > > > > > Hi Yunfei,
> > > > > >
> > > > > > Thank you for the patch.
> > > > > >
> > > > > > On Wed, Aug 11, 2021 at 10:57:59AM +0800, Yunfei Dong wrote:
> > > > > > > Adds decoder dt-bindings for mt8192.
> > > > > > >
> > > > > > > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > > > > > > ---
> > > > > > > v5: no changes
> > > > > > >
> > > > > > > This patch depends on "Mediatek MT8192 clock support"[1].
> > > > > > >
> > > > > > > The definition of decoder clocks are in mt8192-clk.h, need
> > > > > > > to
> > > > > > > include them in case of build fail [1].
> > > > > > >
> > > > > > > [1]
> > > > > > >
> > >
> > >
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=511175
> > > > > > > ---
> > > > > > >  .../media/mediatek,vcodec-comp-decoder.yaml   | 172
> > > > > > > ++++++++++++++++++
> > > > > > >  1 file changed, 172 insertions(+)
> > > > > > >  create mode 100644
> > > > > > > Documentation/devicetree/bindings/media/mediatek,vcodec-
> > > > > > > comp-
> > > > > > > decoder.yaml
> > > > > > >
> > > > > > > diff --git
> > > > > > > a/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > > > > > > comp-
> > > > > > > decoder.yaml
> > > > > > > b/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > > > > > > comp-
> > > > > > > decoder.yaml
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..083c89933917
> > > > > > > --- /dev/null
> > > > > > > +++
> > > > > > > b/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > > > > > > comp-
> > > > > > > decoder.yaml
> > > > > > > @@ -0,0 +1,172 @@
> > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > +%YAML 1.2
> > > > > > > +---
> > > > > > > +$id:
> > > > > > >
> > >
> > >
> http://devicetree.org/schemas/iommu/mediatek,vcodec-comp-decoder.yaml#
> > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > +
> > > > > > > +title: Mediatek Video Decode Accelerator With Component
> > > > > > > +
> > > > > > > +maintainers:
> > > > > > > +  - Yunfei Dong <yunfei.dong@mediatek.com>
> > > > > > > +
> > > > > > > +description: |+
> > > > > > > +  Mediatek Video Decode is the video decode hardware
> > > > > > > present
> > > > > > > in
> > > > > > > Mediatek
> > > > > > > +  SoCs which supports high resolution decoding
> > > > > > > functionalities.
> > > > > > > Required
> > > > > > > +  master and component node.
> > > > > >
> > > > > > This should explain how the three IP cores relate to each
> > > > > > other.
> > > > > >
> > > > >
> > > > > I will explain it in next patch.
> > > > > > > +
> > > > > > > +properties:
> > > > > > > +  compatible:
> > > > > > > +    oneOf:
> > > > > > > +      - enum:
> > > > > > > +          - mediatek,mt8192-vcodec-dec  # for lat hardware
> > > > > > > +          - mediatek,mtk-vcodec-lat     # for core
> > > > > > > hardware
> > > > > > > +          - mediatek,mtk-vcodec-core
> > > > > > > +
> > > > > > > +  reg:
> > > > > > > +    maxItems: 1
> > > > > > > +
> > > > > > > +  interrupts:
> > > > > > > +    maxItems: 1
> > > > > > > +
> > > > > > > +  clocks:
> > > > > > > +    maxItems: 5
> > > > > > > +
> > > > > > > +  clock-names:
> > > > > > > +    items:
> > > > > > > +      - const: vdec-sel
> > > > > > > +      - const: vdec-soc-vdec
> > > > > > > +      - const: vdec-soc-lat
> > > > > > > +      - const: vdec-vdec
> > > > > > > +      - const: vdec-top
> > > > > > > +
> > > > > > > +  assigned-clocks: true
> > > > > > > +
> > > > > > > +  assigned-clock-parents: true
> > > > > > > +
> > > > > > > +  power-domains:
> > > > > > > +    maxItems: 1
> > > > > > > +
> > > > > > > +  iommus:
> > > > > > > +    minItems: 1
> > > > > > > +    maxItems: 32
> > > > > > > +    description: |
> > > > > > > +      List of the hardware port in respective IOMMU block
> > > > > > > for
> > > > > > > current Socs.
> > > > > > > +      Refer to bindings/iommu/mediatek,iommu.yaml.
> > > > > > > +
> > > > > > > +  dma-ranges:
> > > > > > > +    maxItems: 1
> > > > > > > +    description: |
> > > > > > > +      Describes the physical address space of IOMMU maps
> > > > > > > to
> > > > > > > memory.
> > > > > > > +
> > > > > > > +  mediatek,scp:
> > > > > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > > > > +    maxItems: 1
> > > > > > > +    description:
> > > > > > > +      Describes point to scp.
> > > > > > > +
> > > > > > > +required:
> > > > > > > +      - compatible
> > > > > > > +      - reg
> > > > > > > +      - iommus
> > > > > > > +      - dma-ranges
> > > > > > > +
> > > > > > > +allOf:
> > > > > > > +  - if: #master node
> > > > > > > +      properties:
> > > > > > > +        compatible:
> > > > > > > +          contains:
> > > > > > > +            enum:
> > > > > > > +              - mediatek,mt8192-vcodec-dec  # for lat
> > > > > > > hardware
> > > > > > > +
> > > > > > > +    then:
> > > > > > > +      required:
> > > > > > > +        - mediatek,scp
> > > > > > > +
> > > > > > > +  - if: #component node
> > > > > > > +      properties:
> > > > > > > +        compatible:
> > > > > > > +          contains:
> > > > > > > +            enum:
> > > > > > > +              - mediatek,mtk-vcodec-lat     # for core
> > > > > > > hardware
> > > > > > > +              - mediatek,mtk-vcodec-core
> > > > > > > +
> > > > > > > +    then:
> > > > > > > +      required:
> > > > > > > +        - interrupts
> > > > > > > +        - clocks
> > > > > > > +        - clock-names
> > > > > > > +        - assigned-clocks
> > > > > > > +        - assigned-clock-parents
> > > > > > > +        - power-domains
> > > > > > > +
> > > > > > > +
> > > > > > > +additionalProperties: false
> > > > > > > +
> > > > > > > +examples:
> > > > > > > +  - |
> > > > > > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > > > > > +    #include <dt-bindings/memory/mt8192-larb-port.h>
> > > > > > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > > > > > +    #include <dt-bindings/clock/mt8192-clk.h>
> > > > > > > +    #include <dt-bindings/power/mt8192-power.h>
> > > > > > > +
> > > > > > > +    vcodec_dec: vcodec_dec@16000000 {
> > > > > > > +        compatible = "mediatek,mt8192-vcodec-dec";
> > > > > > > +        reg = <0 0x16000000 0 0x1000>;             /*
> > > > > > > VDEC_SYS
> > > > > > > */
> > > > > > > +        mediatek,scp = <&scp>;
> > > > > > > +        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> > > > > > > +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0
> > > > > > > 0xfff00000>;
> > > > > > > +    };
> > > > > > > +
> > > > > > > +    vcodec_lat: vcodec_lat@0x16010000 {
> > > > > > > +        compatible = "mediatek,mtk-vcodec-lat";
> > > > > > > +        reg = <0 0x16010000 0 0x800>;              /*
> > > > > > > VDEC_MISC */
> > > > > > > +        interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
> > > > > > > +        iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
> > > > > > > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
> > > > > > > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
> > > > > > > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
> > > > > > > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
> > > > > > > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
> > > > > > > +             <&iommu0
> > > > > > > M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
> > > > > > > +             <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
> > > > > > > +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0
> > > > > > > 0xfff00000>;
> > > > > > > +        clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> > > > > > > +             <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
> > > > > > > +             <&vdecsys_soc CLK_VDEC_SOC_LAT>,
> > > > > > > +             <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
> > > > > > > +             <&topckgen CLK_TOP_MAINPLL_D4>;
> > > > > > > +        clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-
> > > > > > > soc-
> > > > > > > lat",
> > > > > > > +              "vdec-vdec", "vdec-top";
> > > > > > > +        assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> > > > > > > +        assigned-clock-parents = <&topckgen
> > > > > > > CLK_TOP_MAINPLL_D4>;
> > > > > > > +        power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
> > > > > > > +    };
> > > > > > > +
> > > > > > > +    vcodec_core: vcodec_core@0x16025000 {
> > > > > > > +        compatible = "mediatek,mtk-vcodec-core";
> > > > > > > +        reg = <0 0x16025000 0 0x1000>;             /*
> > > > > > > VDEC_CORE_MISC */
> > > > > > > +        interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
> > > > > > > +        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
> > > > > > > +             <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
> > > > > > > +             <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
> > > > > > > +             <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
> > > > > > > +             <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
> > > > > > > +             <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
> > > > > > > +             <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
> > > > > > > +             <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
> > > > > > > +             <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
> > > > > > > +             <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
> > > > > > > +             <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
> > > > > > > +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0
> > > > > > > 0xfff00000>;
> > > > > > > +        clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> > > > > > > +             <&vdecsys CLK_VDEC_VDEC>,
> > > > > > > +             <&vdecsys CLK_VDEC_LAT>,
> > > > > > > +             <&vdecsys CLK_VDEC_LARB1>,
> > > > > > > +             <&topckgen CLK_TOP_MAINPLL_D4>;
> > > > > > > +        clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-
> > > > > > > soc-
> > > > > > > lat",
> > > > > > > +              "vdec-vdec", "vdec-top";
> > > > > > > +        assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> > > > > > > +        assigned-clock-parents = <&topckgen
> > > > > > > CLK_TOP_MAINPLL_D4>;
> > > > > > > +        power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
> > > > > > > +    };
> > > > > >
> > > > > > I'm a bit late in the game, reviewing v5 only, but I'm
> > > > > > wondering
> > > > > > if
> > > > > > those IP cores need to be modelled in separate nodes. It
> > > > > > would be
> > > > > > much
> > > > > > easier, from a software point of view, to have a single node,
> > > > > > with
> > > > > > multiple register ranges.
> > > > > >
> > > > > > Are some of those IP cores used in different SoCs, combined
> > > > > > in
> > > > > > different
> > > > > > ways, that make a modular design better ?
> > > > > >
> > > > >
> > > > > Different platform has different hardware, for mt8192 only has
> > > > > three
> > > > > nodes. but mt8195 will has five nodes. and the
> > > > > clk/power/irq/iommu
> > > > > are
> > > > > different. It is not easy to manage all hardware at the same
> > > > > time
> > > > > in
> > > > > one node, need to enable different hardware at the same time,
> > > > > the
> > > > > logic
> > > > > will be very complex.
> > > > > It is much easier to handle different hardware using component,
> > > > > enable
> > > > > different hardware when we need it.
> > > > >
> > > > >
> > > >
> > > > You can still have one device-tree node for each device, which
> > > > means
> > > > you can still manage your resources (clk/power/irq/iommu) easily,
> > > > but
> > > > doing
> > > > this so that it avoids an async framework to pull the parts
> > > > together.
> > > >
> > >
> > > It mean that v4l2 async also can't be used?
> >
> > No, I don't think it's needed. I will take a look at the device tree
> > and see if I can show you an alternative approach that doesn't
> > require an async framework.
> >
> Thanks.
> > > > I gave you this feedback several times, and you have been
> > > > objecting
> > > > it
> > > > every time  without even trying to consider a different approach.
> > > >
> > >
> > > I'm not objecting your suggestion every time, for our driver is
> > > designed for component api, need to spend a lot of time to change
> > > it in
> > > many platforms. We need to get a final solution for this
> > > architecture,
> > > or it's not easy to change all patches in the feature.
> > > > Thanks,
> > > > Ezequiel
> > >
> > > 1. Each a node should respect a HW node. Defining a complex node
> > > that
> > > contain multiple register is not better, for they belong to
> > > different
> > > hardware. Different platforms has different hardware count, mt8195
> > > has
> > > five hardwares.
> > > 2. Another reason is from the IOMMU point, the vcodec HW include
> > > core
> > > and lat hardwares, each of them connect to the independent IOMMU
> > > hardware for mt8195, can't write all iommu ports together, or
> > > hardware
> > > can't access dram data, so we must separate them.
> > >
> > > For these limitation, can't combine all hardware together. I will
> > > write
> > > the hardware diagram in next patch.
> > >
> >
> > No need for another patch, you can write that hardware diagram
> > now, so we can help with some design ideas.
> >
> You can see the block diagram in patch:
>
> https://patchwork.linuxtv.org/project/linux-media/patch/20210901083215.25984-14-yunfei.dong@mediatek.com/

This isn't what was really requested though. This is a diagram of how you
designed the software to operate the hardware. Ezequiel is asking for a
diagram of how the hardware is actually designed, how the different blocks
fit together, and how the hardware itself operates. Something like the
block diagrams commonly seen in the datasheets.


ChenYu
