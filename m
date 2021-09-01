Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09E0A3FD906
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 13:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243873AbhIALwD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 07:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243259AbhIALwC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 07:52:02 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67D17C061764
        for <linux-media@vger.kernel.org>; Wed,  1 Sep 2021 04:51:05 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id i21so6069651ejd.2
        for <linux-media@vger.kernel.org>; Wed, 01 Sep 2021 04:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uOKShc+WYnMIyB9CjzG3Z7cKQEUyUYeyvbUWTQN1OA8=;
        b=A2VXQJcZyRdsMmFVn55x/9V+Wes21QUSR4y2zTr3dlLBLRC4nV3ov0V5JB3Nv2rktX
         Vj5Es6BLGHEN6UGYgEcZnjy/luVor5j2rGxsyR8e3qRz6TsA5tSGL1LQu6xbDViMYJfB
         UZd5MuTs2n8nNWPb4SiFnZ7JmsegQa3H7Gi5r8unB3BNkKsb8JKlxczHXyswWD+XSKR3
         V6A6wz0xB8JwcimJGFXJwkR33UB9JFum2Z6Ezxiq8dOs6rRp6EXHgQDN5P2ITugUW79q
         uoPMIYSdmolesOPcseqhtPVljinE3Z+m+Nl1ANCBVwZzIuUQRR4YayIACa2KCDEhyJYl
         r1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uOKShc+WYnMIyB9CjzG3Z7cKQEUyUYeyvbUWTQN1OA8=;
        b=ugYVdvQw522VGFD5CO9nmK9V4wK3oW8aBDTcnve1jHLC64ZF41iVtp7KcANAl3li12
         rWeHYVlieguTIdwo42Ur0qaERDqOaAmc/q6D353+gNSwCNXCoHtNqht+UiAZFJoQ0EKv
         eBFFOvEeDL4q5dlljAXuxsrdvIqz2etlBrW040A/FSiyhCekLEbcqqGXlbYzguq3q2wp
         fs7xWVbm3mWu6yEWQLVkexwi66knfkzxhc1mIIng12fumenoCYNruZhF5LXJfx9UTPOG
         Cr58iGQlJ7NE7NZnJxxummLv4DELkl/1ScsUU8KYvR/8rRZLPuQSjOdLc7uj5Rxa22mF
         Jtkg==
X-Gm-Message-State: AOAM532/hUCCn33d4PYSe/QwtIiE/J5GWTqMoeiPBj1FrxyU/lEAzczq
        Qwoi4AEAQvbbday15UVsnwE72faChPeFzrIOS1tU+g==
X-Google-Smtp-Source: ABdhPJwjFkys34+/Kq9OTrga8NV7WQe+xOMBu0yoIqzEl2gh/Thkm/Ncu6x6UaVnu4XPasukDVHMUjbCXCYs0832saM=
X-Received: by 2002:a17:906:408c:: with SMTP id u12mr37218674ejj.413.1630497063860;
 Wed, 01 Sep 2021 04:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <20210811025801.21597-14-yunfei.dong@mediatek.com> <YRQQBL8AN0925zj9@pendragon.ideasonboard.com>
 <952c219de7595f7f814d3006fbe25b8089a35212.camel@mediatek.com>
 <CAAEAJfB_qZtVpxk8P=26GkZ1j66v+RzzJTqf3UrfMkWNJ1fmFg@mail.gmail.com> <fb85e6287a0d269593fa72d745dc2c573bcfe7bc.camel@mediatek.com>
In-Reply-To: <fb85e6287a0d269593fa72d745dc2c573bcfe7bc.camel@mediatek.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Wed, 1 Sep 2021 08:50:52 -0300
Message-ID: <CAAEAJfBAnvc4cL98aaQgAg1xKSZ3ciCVjbg34raGMOOskDSogg@mail.gmail.com>
Subject: Re: [PATCH v5, 13/15] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for mt8192
To:     "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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

On Wed, 1 Sept 2021 at 00:49, yunfei.dong@mediatek.com
<yunfei.dong@mediatek.com> wrote:
>
> Hi Ezequiel,
>
> Thanks for your feedback.
> On Sun, 2021-08-29 at 17:54 -0300, Ezequiel Garcia wrote:
> > On Tue, 17 Aug 2021 at 00:52, yunfei.dong@mediatek.com
> > <yunfei.dong@mediatek.com> wrote:
> > >
> > > Hi Laurent,
> > >
> > > Thanks for your detail suggestion.
> > >
> > > On Wed, 2021-08-11 at 20:59 +0300, Laurent Pinchart wrote:
> > > > Hi Yunfei,
> > > >
> > > > Thank you for the patch.
> > > >
> > > > On Wed, Aug 11, 2021 at 10:57:59AM +0800, Yunfei Dong wrote:
> > > > > Adds decoder dt-bindings for mt8192.
> > > > >
> > > > > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > > > > ---
> > > > > v5: no changes
> > > > >
> > > > > This patch depends on "Mediatek MT8192 clock support"[1].
> > > > >
> > > > > The definition of decoder clocks are in mt8192-clk.h, need to
> > > > > include them in case of build fail [1].
> > > > >
> > > > > [1]
> > > > >
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=511175
> > > > > ---
> > > > >  .../media/mediatek,vcodec-comp-decoder.yaml   | 172
> > > > > ++++++++++++++++++
> > > > >  1 file changed, 172 insertions(+)
> > > > >  create mode 100644
> > > > > Documentation/devicetree/bindings/media/mediatek,vcodec-comp-
> > > > > decoder.yaml
> > > > >
> > > > > diff --git
> > > > > a/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-
> > > > > decoder.yaml
> > > > > b/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-
> > > > > decoder.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..083c89933917
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > > > > comp-
> > > > > decoder.yaml
> > > > > @@ -0,0 +1,172 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id:
> > > > >
> http://devicetree.org/schemas/iommu/mediatek,vcodec-comp-decoder.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Mediatek Video Decode Accelerator With Component
> > > > > +
> > > > > +maintainers:
> > > > > +  - Yunfei Dong <yunfei.dong@mediatek.com>
> > > > > +
> > > > > +description: |+
> > > > > +  Mediatek Video Decode is the video decode hardware present
> > > > > in
> > > > > Mediatek
> > > > > +  SoCs which supports high resolution decoding
> > > > > functionalities.
> > > > > Required
> > > > > +  master and component node.
> > > >
> > > > This should explain how the three IP cores relate to each other.
> > > >
> > >
> > > I will explain it in next patch.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    oneOf:
> > > > > +      - enum:
> > > > > +          - mediatek,mt8192-vcodec-dec  # for lat hardware
> > > > > +          - mediatek,mtk-vcodec-lat     # for core hardware
> > > > > +          - mediatek,mtk-vcodec-core
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  interrupts:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  clocks:
> > > > > +    maxItems: 5
> > > > > +
> > > > > +  clock-names:
> > > > > +    items:
> > > > > +      - const: vdec-sel
> > > > > +      - const: vdec-soc-vdec
> > > > > +      - const: vdec-soc-lat
> > > > > +      - const: vdec-vdec
> > > > > +      - const: vdec-top
> > > > > +
> > > > > +  assigned-clocks: true
> > > > > +
> > > > > +  assigned-clock-parents: true
> > > > > +
> > > > > +  power-domains:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  iommus:
> > > > > +    minItems: 1
> > > > > +    maxItems: 32
> > > > > +    description: |
> > > > > +      List of the hardware port in respective IOMMU block for
> > > > > current Socs.
> > > > > +      Refer to bindings/iommu/mediatek,iommu.yaml.
> > > > > +
> > > > > +  dma-ranges:
> > > > > +    maxItems: 1
> > > > > +    description: |
> > > > > +      Describes the physical address space of IOMMU maps to
> > > > > memory.
> > > > > +
> > > > > +  mediatek,scp:
> > > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > > +    maxItems: 1
> > > > > +    description:
> > > > > +      Describes point to scp.
> > > > > +
> > > > > +required:
> > > > > +      - compatible
> > > > > +      - reg
> > > > > +      - iommus
> > > > > +      - dma-ranges
> > > > > +
> > > > > +allOf:
> > > > > +  - if: #master node
> > > > > +      properties:
> > > > > +        compatible:
> > > > > +          contains:
> > > > > +            enum:
> > > > > +              - mediatek,mt8192-vcodec-dec  # for lat hardware
> > > > > +
> > > > > +    then:
> > > > > +      required:
> > > > > +        - mediatek,scp
> > > > > +
> > > > > +  - if: #component node
> > > > > +      properties:
> > > > > +        compatible:
> > > > > +          contains:
> > > > > +            enum:
> > > > > +              - mediatek,mtk-vcodec-lat     # for core
> > > > > hardware
> > > > > +              - mediatek,mtk-vcodec-core
> > > > > +
> > > > > +    then:
> > > > > +      required:
> > > > > +        - interrupts
> > > > > +        - clocks
> > > > > +        - clock-names
> > > > > +        - assigned-clocks
> > > > > +        - assigned-clock-parents
> > > > > +        - power-domains
> > > > > +
> > > > > +
> > > > > +additionalProperties: false
> > > > > +
> > > > > +examples:
> > > > > +  - |
> > > > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > > > +    #include <dt-bindings/memory/mt8192-larb-port.h>
> > > > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > > > +    #include <dt-bindings/clock/mt8192-clk.h>
> > > > > +    #include <dt-bindings/power/mt8192-power.h>
> > > > > +
> > > > > +    vcodec_dec: vcodec_dec@16000000 {
> > > > > +        compatible = "mediatek,mt8192-vcodec-dec";
> > > > > +        reg = <0 0x16000000 0 0x1000>;             /* VDEC_SYS
> > > > > */
> > > > > +        mediatek,scp = <&scp>;
> > > > > +        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> > > > > +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> > > > > +    };
> > > > > +
> > > > > +    vcodec_lat: vcodec_lat@0x16010000 {
> > > > > +        compatible = "mediatek,mtk-vcodec-lat";
> > > > > +        reg = <0 0x16010000 0 0x800>;              /*
> > > > > VDEC_MISC */
> > > > > +        interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
> > > > > +        iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
> > > > > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
> > > > > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
> > > > > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
> > > > > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
> > > > > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
> > > > > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
> > > > > +             <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
> > > > > +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> > > > > +        clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> > > > > +             <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
> > > > > +             <&vdecsys_soc CLK_VDEC_SOC_LAT>,
> > > > > +             <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
> > > > > +             <&topckgen CLK_TOP_MAINPLL_D4>;
> > > > > +        clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-
> > > > > lat",
> > > > > +              "vdec-vdec", "vdec-top";
> > > > > +        assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> > > > > +        assigned-clock-parents = <&topckgen
> > > > > CLK_TOP_MAINPLL_D4>;
> > > > > +        power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
> > > > > +    };
> > > > > +
> > > > > +    vcodec_core: vcodec_core@0x16025000 {
> > > > > +        compatible = "mediatek,mtk-vcodec-core";
> > > > > +        reg = <0 0x16025000 0 0x1000>;             /*
> > > > > VDEC_CORE_MISC */
> > > > > +        interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
> > > > > +        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
> > > > > +             <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
> > > > > +             <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
> > > > > +             <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
> > > > > +             <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
> > > > > +             <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
> > > > > +             <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
> > > > > +             <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
> > > > > +             <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
> > > > > +             <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
> > > > > +             <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
> > > > > +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> > > > > +        clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> > > > > +             <&vdecsys CLK_VDEC_VDEC>,
> > > > > +             <&vdecsys CLK_VDEC_LAT>,
> > > > > +             <&vdecsys CLK_VDEC_LARB1>,
> > > > > +             <&topckgen CLK_TOP_MAINPLL_D4>;
> > > > > +        clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-
> > > > > lat",
> > > > > +              "vdec-vdec", "vdec-top";
> > > > > +        assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> > > > > +        assigned-clock-parents = <&topckgen
> > > > > CLK_TOP_MAINPLL_D4>;
> > > > > +        power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
> > > > > +    };
> > > >
> > > > I'm a bit late in the game, reviewing v5 only, but I'm wondering
> > > > if
> > > > those IP cores need to be modelled in separate nodes. It would be
> > > > much
> > > > easier, from a software point of view, to have a single node,
> > > > with
> > > > multiple register ranges.
> > > >
> > > > Are some of those IP cores used in different SoCs, combined in
> > > > different
> > > > ways, that make a modular design better ?
> > > >
> > >
> > > Different platform has different hardware, for mt8192 only has
> > > three
> > > nodes. but mt8195 will has five nodes. and the clk/power/irq/iommu
> > > are
> > > different. It is not easy to manage all hardware at the same time
> > > in
> > > one node, need to enable different hardware at the same time, the
> > > logic
> > > will be very complex.
> > > It is much easier to handle different hardware using component,
> > > enable
> > > different hardware when we need it.
> > >
> > >
> >
> > You can still have one device-tree node for each device, which means
> > you can still manage your resources (clk/power/irq/iommu) easily, but
> > doing
> > this so that it avoids an async framework to pull the parts together.
> >
> It mean that v4l2 async also can't be used?

No, I don't think it's needed. I will take a look at the device tree
and see if I can show you an alternative approach that doesn't
require an async framework.

> > I gave you this feedback several times, and you have been objecting
> > it
> > every time  without even trying to consider a different approach.
> >
> I'm not objecting your suggestion every time, for our driver is
> designed for component api, need to spend a lot of time to change it in
> many platforms. We need to get a final solution for this architecture,
> or it's not easy to change all patches in the feature.
> > Thanks,
> > Ezequiel
> 1. Each a node should respect a HW node. Defining a complex node that
> contain multiple register is not better, for they belong to different
> hardware. Different platforms has different hardware count, mt8195 has
> five hardwares.
> 2. Another reason is from the IOMMU point, the vcodec HW include core
> and lat hardwares, each of them connect to the independent IOMMU
> hardware for mt8195, can't write all iommu ports together, or hardware
> can't access dram data, so we must separate them.
>
> For these limitation, can't combine all hardware together. I will write
> the hardware diagram in next patch.
>

No need for another patch, you can write that hardware diagram
now, so we can help with some design ideas.

Thanks!
Ezequiel
