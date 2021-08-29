Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51DBE3FAE93
	for <lists+linux-media@lfdr.de>; Sun, 29 Aug 2021 22:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234243AbhH2Uvi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Aug 2021 16:51:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234568AbhH2Uvh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Aug 2021 16:51:37 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 151E1C061760
        for <linux-media@vger.kernel.org>; Sun, 29 Aug 2021 13:50:45 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id s25so18634506edw.0
        for <linux-media@vger.kernel.org>; Sun, 29 Aug 2021 13:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bdNYVnY8wew5VKV8LOdUkcIS13QxalxT7B4uy/fmPwU=;
        b=XZidhiGGeZHDe0k1/vjoba3xx0Zek1MPYwws0fBuZuQfZCHvE9gFzJahUipyyF9pEx
         az0Y4VAokmxqq1+HBUWytSLzqZNgDtxlvMKMLAMgKFo4Ne3GFtslK7IsJcNXqK7WINyg
         R01vqgdhHItsymuoUX4yGGgKLsuUI/ws9KV09shFCyhyRTLV9QXESf00woZGJWkkXw7l
         5RnLxcP+yCJ9AI6r9QiHDhJuQcAKNgr1WgSS8e/0IsQeKnK48toJvUo3L/vsgET0xWFR
         6D8XI+UBxApXehLnd+jtJGfmsJlr2NAzLwz8q0/0CyBvxqPPioDiSpzXd1u+NsslpR3O
         qLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bdNYVnY8wew5VKV8LOdUkcIS13QxalxT7B4uy/fmPwU=;
        b=t59TNjjb+5iifur3gw5kC9WTkdfuiHbqu3E6H3roPnpIZX5PtJLHaTk2IwnzmXYHT7
         R8GtV7OcDSuz7OcBEkkc3F4rLTv9YqS+uAP/e5oKxgf/+u/NzdgfGG/gzHA6IzzWmDhh
         Vsl4hmFGXttB7Rl9hcJ0Ljv0/Hm0WiTcyMZzme6zuUnBulhXieg8OMS9QH+zXlXqWe+Z
         M9XtrfsUSHtkKcHDJrNpsALB7MmuHceBGYoCztxP0PyBqr0kkSQRjLb4NzurqPHNY8Yq
         4TVSSz63oMmYMG0aIrLpz0emqoPhHAuzQnvaEIm9T7oCKtAfQszymyid+roDhMG9fx6D
         cnYA==
X-Gm-Message-State: AOAM532HT10rDv1yea0w5Ok2RGQEO+sp6nSNEBr528EgfOeqVGOQ2bV4
        +Ug7dhnnh4OJbv1RezxpM2dbk61IrppZqyyclH+A/Q==
X-Google-Smtp-Source: ABdhPJyTYIXkeNUZ78XZeBzzgBGieSJ37P8sW+ZQpTHTbP0ZiZXot4HF8VDGsgAhSnXVEMcHGQJEAR4F+Yz13AYvoZA=
X-Received: by 2002:aa7:db8b:: with SMTP id u11mr20368778edt.362.1630270243611;
 Sun, 29 Aug 2021 13:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <20210811025801.21597-14-yunfei.dong@mediatek.com> <YRQQBL8AN0925zj9@pendragon.ideasonboard.com>
In-Reply-To: <YRQQBL8AN0925zj9@pendragon.ideasonboard.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sun, 29 Aug 2021 17:50:31 -0300
Message-ID: <CAAEAJfAwUfwK=Cn7ocedhOaPyMqjL6phwSypkKDXGk6EV4D-vg@mail.gmail.com>
Subject: Re: [PATCH v5, 13/15] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for mt8192
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
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

On Wed, 11 Aug 2021 at 14:59, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Yunfei,
>
> Thank you for the patch.
>
> On Wed, Aug 11, 2021 at 10:57:59AM +0800, Yunfei Dong wrote:
> > Adds decoder dt-bindings for mt8192.
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> > v5: no changes
> >
> > This patch depends on "Mediatek MT8192 clock support"[1].
> >
> > The definition of decoder clocks are in mt8192-clk.h, need to include them in case of build fail [1].
> >
> > [1]https://patchwork.kernel.org/project/linux-mediatek/list/?series=511175
> > ---
> >  .../media/mediatek,vcodec-comp-decoder.yaml   | 172 ++++++++++++++++++
> >  1 file changed, 172 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
> > new file mode 100644
> > index 000000000000..083c89933917
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
> > @@ -0,0 +1,172 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/iommu/mediatek,vcodec-comp-decoder.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek Video Decode Accelerator With Component
> > +
> > +maintainers:
> > +  - Yunfei Dong <yunfei.dong@mediatek.com>
> > +
> > +description: |+
> > +  Mediatek Video Decode is the video decode hardware present in Mediatek
> > +  SoCs which supports high resolution decoding functionalities. Required
> > +  master and component node.
>
> This should explain how the three IP cores relate to each other.
>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - mediatek,mt8192-vcodec-dec  # for lat hardware
> > +          - mediatek,mtk-vcodec-lat     # for core hardware
> > +          - mediatek,mtk-vcodec-core
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 5
> > +
> > +  clock-names:
> > +    items:
> > +      - const: vdec-sel
> > +      - const: vdec-soc-vdec
> > +      - const: vdec-soc-lat
> > +      - const: vdec-vdec
> > +      - const: vdec-top
> > +
> > +  assigned-clocks: true
> > +
> > +  assigned-clock-parents: true
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  iommus:
> > +    minItems: 1
> > +    maxItems: 32
> > +    description: |
> > +      List of the hardware port in respective IOMMU block for current Socs.
> > +      Refer to bindings/iommu/mediatek,iommu.yaml.
> > +
> > +  dma-ranges:
> > +    maxItems: 1
> > +    description: |
> > +      Describes the physical address space of IOMMU maps to memory.
> > +
> > +  mediatek,scp:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    maxItems: 1
> > +    description:
> > +      Describes point to scp.
> > +
> > +required:
> > +      - compatible
> > +      - reg
> > +      - iommus
> > +      - dma-ranges
> > +
> > +allOf:
> > +  - if: #master node
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt8192-vcodec-dec  # for lat hardware
> > +
> > +    then:
> > +      required:
> > +        - mediatek,scp
> > +
> > +  - if: #component node
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mtk-vcodec-lat     # for core hardware
> > +              - mediatek,mtk-vcodec-core
> > +
> > +    then:
> > +      required:
> > +        - interrupts
> > +        - clocks
> > +        - clock-names
> > +        - assigned-clocks
> > +        - assigned-clock-parents
> > +        - power-domains
> > +
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/memory/mt8192-larb-port.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/clock/mt8192-clk.h>
> > +    #include <dt-bindings/power/mt8192-power.h>
> > +
> > +    vcodec_dec: vcodec_dec@16000000 {
> > +        compatible = "mediatek,mt8192-vcodec-dec";
> > +        reg = <0 0x16000000 0 0x1000>;               /* VDEC_SYS */
> > +        mediatek,scp = <&scp>;
> > +        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> > +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> > +    };
> > +
> > +    vcodec_lat: vcodec_lat@0x16010000 {
> > +        compatible = "mediatek,mtk-vcodec-lat";
> > +        reg = <0 0x16010000 0 0x800>;                /* VDEC_MISC */
> > +        interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
> > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
> > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
> > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
> > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
> > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
> > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
> > +             <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
> > +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> > +        clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> > +             <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
> > +             <&vdecsys_soc CLK_VDEC_SOC_LAT>,
> > +             <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
> > +             <&topckgen CLK_TOP_MAINPLL_D4>;
> > +        clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
> > +              "vdec-vdec", "vdec-top";
> > +        assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> > +        assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> > +        power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
> > +    };
> > +
> > +    vcodec_core: vcodec_core@0x16025000 {
> > +        compatible = "mediatek,mtk-vcodec-core";
> > +        reg = <0 0x16025000 0 0x1000>;               /* VDEC_CORE_MISC */
> > +        interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
> > +             <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
> > +             <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
> > +             <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
> > +             <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
> > +             <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
> > +             <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
> > +             <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
> > +             <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
> > +             <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
> > +             <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
> > +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> > +        clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> > +             <&vdecsys CLK_VDEC_VDEC>,
> > +             <&vdecsys CLK_VDEC_LAT>,
> > +             <&vdecsys CLK_VDEC_LARB1>,
> > +             <&topckgen CLK_TOP_MAINPLL_D4>;
> > +        clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
> > +              "vdec-vdec", "vdec-top";
> > +        assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> > +        assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> > +        power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
> > +    };
>
> I'm a bit late in the game, reviewing v5 only, but I'm wondering if
> those IP cores need to be modelled in separate nodes. It would be much
> easier, from a software point of view, to have a single node, with
> multiple register ranges.
>
> Are some of those IP cores used in different SoCs, combined in different
> ways, that make a modular design better ?
>

Yeah, I agree with Laurent here. This way of modelling the different parts
of the CODEC as different pieces is the reason why you need a framework
to pull them together, such as the component API (I guess v4l2-async
could have been used as well).

I normally don't bother with driver internals, as its up to each driver
author to decide what is best. However, I believe this design is too
convoluted, and it may lead other developers to follow the same pattern,
so please avoid it.

There are several ways of modelling this and initializing or probing
the sub-devices,
without using any async framework.

Thanks,
Ezequiel
