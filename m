Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 339573FAE98
	for <lists+linux-media@lfdr.de>; Sun, 29 Aug 2021 22:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233841AbhH2Uz6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Aug 2021 16:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232450AbhH2Uz5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Aug 2021 16:55:57 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C824C0613D9
        for <linux-media@vger.kernel.org>; Sun, 29 Aug 2021 13:55:04 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id z19so18545104edi.9
        for <linux-media@vger.kernel.org>; Sun, 29 Aug 2021 13:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AqtMNiioIDL4ACYgjDdzLfylmCCKYY7rQn1WqTkUY6Y=;
        b=rmfs+0kqWuZFMMLTXE8SLLVEW9bJ1Rp4S64dAmsmAVdh59PY5jk/DK0MSCunjolYQX
         8b/c1VqVPdZQIu3k2T9myVQUKLpndM9dnvvunRH1i2J20WnlMAkV46DD38xdGvGERsBm
         JFyjObQobsdg18+I9xZ57Q4u4HLVmTx9FWz9umwcWHZwM0oV7c8a+OCJV68fx//7yWG0
         sIUwHbfL8JWpeBVEzaojdjQoZ07u0nuaxWqDBZuZFZrh+otrbHBqfuBKcdt+dtuyiqXv
         OVE3dWC8lDS/dDbO5qb5OVybSWRDQ38elFgPGDKfqm9cQE/JT1VG0xqjaNSZLeKxNsVY
         oulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AqtMNiioIDL4ACYgjDdzLfylmCCKYY7rQn1WqTkUY6Y=;
        b=m0m03fdQelGoi92BiZjNf6pGIAzld1QG4bew3Kil2OGoMp2ib91wh34K/1rU8kjk57
         WaFDijsxVRLClRD7K4ykIP+h81Y8TlbtB+Hbd98TGLWArid0GHq3B+LUxM7bXv+XRfD0
         s9qei1LO9Tz2tccGA2FSRzjQspMIdaOfWqkB3MYmYUy/VVp73OBjjGWLREEQLXk/k7CB
         ud3E81AdrO9o297dgGfIDArMlYDNo90MQnwNAvk3FtsD7hLPwNYoFDFQbmgKHVwlidTD
         gbNj1BzUIYMKtfDnAXiVsXT0CHtw2G1gVVgG0EM7dXYyhGADiKthYFMHCLdz7Fdnevog
         ILOg==
X-Gm-Message-State: AOAM533qKIFTDEV9DVV/y9trYO5NpCxhddtk5Qa3KdZkYZovIOy+nfhk
        Epi1ohshHikkQKR4tcADPahj2zzf5zl7cFpaSmpdJQ==
X-Google-Smtp-Source: ABdhPJxigLoyQLS8ZtoXqPvF+AjahKw1yZIoMxRbzGTNv9xpSOeNeo6pCPyZ5XLu0Kp4T/DC4Ul/kgsSkSWC7NJopcI=
X-Received: by 2002:a05:6402:11c9:: with SMTP id j9mr20372184edw.134.1630270502889;
 Sun, 29 Aug 2021 13:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <20210811025801.21597-14-yunfei.dong@mediatek.com> <YRQQBL8AN0925zj9@pendragon.ideasonboard.com>
 <952c219de7595f7f814d3006fbe25b8089a35212.camel@mediatek.com>
In-Reply-To: <952c219de7595f7f814d3006fbe25b8089a35212.camel@mediatek.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sun, 29 Aug 2021 17:54:50 -0300
Message-ID: <CAAEAJfB_qZtVpxk8P=26GkZ1j66v+RzzJTqf3UrfMkWNJ1fmFg@mail.gmail.com>
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

On Tue, 17 Aug 2021 at 00:52, yunfei.dong@mediatek.com
<yunfei.dong@mediatek.com> wrote:
>
> Hi Laurent,
>
> Thanks for your detail suggestion.
>
> On Wed, 2021-08-11 at 20:59 +0300, Laurent Pinchart wrote:
> > Hi Yunfei,
> >
> > Thank you for the patch.
> >
> > On Wed, Aug 11, 2021 at 10:57:59AM +0800, Yunfei Dong wrote:
> > > Adds decoder dt-bindings for mt8192.
> > >
> > > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > > ---
> > > v5: no changes
> > >
> > > This patch depends on "Mediatek MT8192 clock support"[1].
> > >
> > > The definition of decoder clocks are in mt8192-clk.h, need to
> > > include them in case of build fail [1].
> > >
> > > [1]
> > > https://patchwork.kernel.org/project/linux-mediatek/list/?series=511175
> > > ---
> > >  .../media/mediatek,vcodec-comp-decoder.yaml   | 172
> > > ++++++++++++++++++
> > >  1 file changed, 172 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/media/mediatek,vcodec-comp-
> > > decoder.yaml
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-
> > > decoder.yaml
> > > b/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-
> > > decoder.yaml
> > > new file mode 100644
> > > index 000000000000..083c89933917
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-
> > > decoder.yaml
> > > @@ -0,0 +1,172 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id:
> > > http://devicetree.org/schemas/iommu/mediatek,vcodec-comp-decoder.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Mediatek Video Decode Accelerator With Component
> > > +
> > > +maintainers:
> > > +  - Yunfei Dong <yunfei.dong@mediatek.com>
> > > +
> > > +description: |+
> > > +  Mediatek Video Decode is the video decode hardware present in
> > > Mediatek
> > > +  SoCs which supports high resolution decoding functionalities.
> > > Required
> > > +  master and component node.
> >
> > This should explain how the three IP cores relate to each other.
> >
> I will explain it in next patch.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - enum:
> > > +          - mediatek,mt8192-vcodec-dec  # for lat hardware
> > > +          - mediatek,mtk-vcodec-lat     # for core hardware
> > > +          - mediatek,mtk-vcodec-core
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 5
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: vdec-sel
> > > +      - const: vdec-soc-vdec
> > > +      - const: vdec-soc-lat
> > > +      - const: vdec-vdec
> > > +      - const: vdec-top
> > > +
> > > +  assigned-clocks: true
> > > +
> > > +  assigned-clock-parents: true
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  iommus:
> > > +    minItems: 1
> > > +    maxItems: 32
> > > +    description: |
> > > +      List of the hardware port in respective IOMMU block for
> > > current Socs.
> > > +      Refer to bindings/iommu/mediatek,iommu.yaml.
> > > +
> > > +  dma-ranges:
> > > +    maxItems: 1
> > > +    description: |
> > > +      Describes the physical address space of IOMMU maps to
> > > memory.
> > > +
> > > +  mediatek,scp:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    maxItems: 1
> > > +    description:
> > > +      Describes point to scp.
> > > +
> > > +required:
> > > +      - compatible
> > > +      - reg
> > > +      - iommus
> > > +      - dma-ranges
> > > +
> > > +allOf:
> > > +  - if: #master node
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - mediatek,mt8192-vcodec-dec  # for lat hardware
> > > +
> > > +    then:
> > > +      required:
> > > +        - mediatek,scp
> > > +
> > > +  - if: #component node
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - mediatek,mtk-vcodec-lat     # for core hardware
> > > +              - mediatek,mtk-vcodec-core
> > > +
> > > +    then:
> > > +      required:
> > > +        - interrupts
> > > +        - clocks
> > > +        - clock-names
> > > +        - assigned-clocks
> > > +        - assigned-clock-parents
> > > +        - power-domains
> > > +
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/memory/mt8192-larb-port.h>
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +    #include <dt-bindings/clock/mt8192-clk.h>
> > > +    #include <dt-bindings/power/mt8192-power.h>
> > > +
> > > +    vcodec_dec: vcodec_dec@16000000 {
> > > +        compatible = "mediatek,mt8192-vcodec-dec";
> > > +        reg = <0 0x16000000 0 0x1000>;             /* VDEC_SYS */
> > > +        mediatek,scp = <&scp>;
> > > +        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> > > +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> > > +    };
> > > +
> > > +    vcodec_lat: vcodec_lat@0x16010000 {
> > > +        compatible = "mediatek,mtk-vcodec-lat";
> > > +        reg = <0 0x16010000 0 0x800>;              /* VDEC_MISC */
> > > +        interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
> > > +        iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
> > > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
> > > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
> > > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
> > > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
> > > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
> > > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
> > > +             <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
> > > +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> > > +        clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> > > +             <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
> > > +             <&vdecsys_soc CLK_VDEC_SOC_LAT>,
> > > +             <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
> > > +             <&topckgen CLK_TOP_MAINPLL_D4>;
> > > +        clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
> > > +              "vdec-vdec", "vdec-top";
> > > +        assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> > > +        assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> > > +        power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
> > > +    };
> > > +
> > > +    vcodec_core: vcodec_core@0x16025000 {
> > > +        compatible = "mediatek,mtk-vcodec-core";
> > > +        reg = <0 0x16025000 0 0x1000>;             /*
> > > VDEC_CORE_MISC */
> > > +        interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
> > > +        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
> > > +             <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
> > > +             <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
> > > +             <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
> > > +             <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
> > > +             <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
> > > +             <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
> > > +             <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
> > > +             <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
> > > +             <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
> > > +             <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
> > > +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> > > +        clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> > > +             <&vdecsys CLK_VDEC_VDEC>,
> > > +             <&vdecsys CLK_VDEC_LAT>,
> > > +             <&vdecsys CLK_VDEC_LARB1>,
> > > +             <&topckgen CLK_TOP_MAINPLL_D4>;
> > > +        clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
> > > +              "vdec-vdec", "vdec-top";
> > > +        assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> > > +        assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> > > +        power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
> > > +    };
> >
> > I'm a bit late in the game, reviewing v5 only, but I'm wondering if
> > those IP cores need to be modelled in separate nodes. It would be
> > much
> > easier, from a software point of view, to have a single node, with
> > multiple register ranges.
> >
> > Are some of those IP cores used in different SoCs, combined in
> > different
> > ways, that make a modular design better ?
> >
> Different platform has different hardware, for mt8192 only has three
> nodes. but mt8195 will has five nodes. and the clk/power/irq/iommu are
> different. It is not easy to manage all hardware at the same time in
> one node, need to enable different hardware at the same time, the logic
> will be very complex.
> It is much easier to handle different hardware using component, enable
> different hardware when we need it.
>
>

You can still have one device-tree node for each device, which means
you can still manage your resources (clk/power/irq/iommu) easily, but doing
this so that it avoids an async framework to pull the parts together.

I gave you this feedback several times, and you have been objecting it
every time  without even trying to consider a different approach.

Thanks,
Ezequiel
