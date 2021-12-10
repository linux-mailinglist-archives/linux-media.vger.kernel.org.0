Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B06C46F7C1
	for <lists+linux-media@lfdr.de>; Fri, 10 Dec 2021 00:57:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234715AbhLJABI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Dec 2021 19:01:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234698AbhLJABH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Dec 2021 19:01:07 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA86AC0617A2
        for <linux-media@vger.kernel.org>; Thu,  9 Dec 2021 15:57:33 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id m192so6411462qke.2
        for <linux-media@vger.kernel.org>; Thu, 09 Dec 2021 15:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uki05wBt2Curw3Rk1sCic8HVPmQ/onh9arpdABDNhZE=;
        b=Lx73rRhgsqhUQaq2ygcCUymM7fIcuNnfcFeVbUxwD4LvPpxCgPAdvZ+us2j5P0S0jG
         qhNF9BmUY0cqiJcxQX/H4oxcFCz4hRaYAJD7ARBi58y7PGyKnMRXut/xnqbwbmOogJx1
         rQkDuM1oiyGSNkU/IoqhRxoxesnfzWKAwbBBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uki05wBt2Curw3Rk1sCic8HVPmQ/onh9arpdABDNhZE=;
        b=riE6XjVL1EH2bRpe+hzjIyOfoIrwScU+FPfcH86ECWR9g1xWxUHBeMrT8hB0N9eR3I
         JONueFCNWoe/ZnvfGtC2UKBXn0ckK8mZIdvJibW9JT2ZYmjAS7fyr9o504D/J6VTCcvI
         dQmocxJs+p6eVlwnl6tsRtx9RTpImM6f8hybuImFNmIMafGZ73c5EVTqGuIjbbFP61er
         MDelSTl+LurnjRAzIW/D4GKKyXVHdgrRx8cOCSJgBNKMjmis1gmxkyn/qN1LkWgH+NkB
         8Hi5hbqr30rL3iDqu8GX+ge3FNxWR3YGIEoqqcORw608bmzOnZlbNPrd2FL7enOuw3Dk
         Bbhg==
X-Gm-Message-State: AOAM530pmj03eCAIAM1sKhqlu+NJLMTvhviV/9H6WIUkayBTULbzLtx3
        sA6e8Cx8ciQv/UAzZep7jodm7NF2+9S9DPHyrOu/yg==
X-Google-Smtp-Source: ABdhPJxoC/884U4HksLH+wuiXs0WNjfeYhB0s6I4Zf+ZCyxoMZNQDfLnuG+wprFJ15I8geJzMLWy+Mi42/aX2oXvpjU=
X-Received: by 2002:a05:620a:4446:: with SMTP id w6mr17194393qkp.273.1639094252842;
 Thu, 09 Dec 2021 15:57:32 -0800 (PST)
MIME-Version: 1.0
References: <20211202034544.2750-1-yunfei.dong@mediatek.com> <20211202034544.2750-16-yunfei.dong@mediatek.com>
In-Reply-To: <20211202034544.2750-16-yunfei.dong@mediatek.com>
From:   Steve Cho <stevecho@chromium.org>
Date:   Thu, 9 Dec 2021 15:57:22 -0800
Message-ID: <CAC-pXoNYXSoL0L8OEoVg+tU1JoMU5VU-voXNKQD1is0HBYmT_A@mail.gmail.com>
Subject: Re: [PATCH v12, 15/19] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for mt8192
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
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
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reviewed-by: Steve Cho <stevecho@chromium.org>

On Wed, Dec 1, 2021 at 7:46 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> Adds decoder dt-bindings for mt8192.

basic question: what is dt-bindings?

Is this yaml file supposed to be used for some settings?

>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 266 ++++++++++++++++++
>  1 file changed, 266 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> new file mode 100644
> index 000000000000..67cbcf8b3373
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> @@ -0,0 +1,266 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/mediatek,vcodec-subdev-decoder.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Mediatek Video Decode Accelerator With Multi Hardware

Is Multi Hardware supposed to mean parent & child devices in this context?

> +
> +maintainers:
> +  - Yunfei Dong <yunfei.dong@mediatek.com>
> +
> +description: |
> +  Mediatek Video Decode is the video decode hardware present in Mediatek
> +  SoCs which supports high resolution decoding functionalities. Required
> +  parent and child device node.
> +
> +  About the Decoder Hardware Block Diagram, please check below:

Great to see this diagram and description!


> +
> +    +---------------------------------+------------------------------------+
> +    |                                 |                                    |
> +    | input -> lat HW -> lat buffer --|--> lat buffer -> core HW -> output |
> +    |            ||                   |                     ||             |
> +    +------------||-------------------+---------------------||-------------+
> +              lat workqueue           |              core workqueue     <parent>
> +    -------------||-----------------------------------------||------------------
> +                 ||                                         ||          <child>
> +                 \/ <----------------HW index-------------->\/
> +           +------------------------------------------------------+
> +           |                    enable/disable                    |
> +           |           clk     power    irq    iommu              |
> +           |                 (lat/lat soc/core0/core1)            |
> +           +------------------------------------------------------+
> +
> +  As above, there are parent and child devices, child mean each hardware. The child device
> +  controls the information of each hardware independent which include clk/power/irq.
> +
> +  There are two workqueues in parent device: lat workqueue and core workqueue. They are used
> +  to lat and core hardware deocder. Lat workqueue need to get input bitstream and lat buffer,
> +  then enable lat to decode, writing the result to lat buffer, dislabe hardware when lat decode
> +  done. Core workqueue need to get lat buffer and output buffer, then enable core to decode,
> +  writing the result to output buffer, disable hardware when core decode done. These two
> +  hardwares will decode each frame cyclically.
> +
> +  For the smi common may not the same for each hardware, can't combine all hardware in one node,
> +  or leading to iommu fault when access dram data.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8192-vcodec-dec
> +
> +  reg:
> +    maxItems: 1
> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 32
> +    description: |
> +      List of the hardware port in respective IOMMU block for current Socs.
> +      Refer to bindings/iommu/mediatek,iommu.yaml.
> +
> +  mediatek,scp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
> +    description: |
> +      The node of system control processor (SCP), using
> +      the remoteproc & rpmsg framework.
> +      $ref: /schemas/remoteproc/mtk,scp.yaml
> +
> +  dma-ranges:
> +    maxItems: 1
> +    description: |
> +      Describes the physical address space of IOMMU maps to memory.
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +# Required child node:
> +patternProperties:
> +  vcodec-lat:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: mediatek,mtk-vcodec-lat
> +
> +      reg:
> +        maxItems: 1
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      iommus:
> +        minItems: 1
> +        maxItems: 32
> +        description: |
> +          List of the hardware port in respective IOMMU block for current Socs.
> +          Refer to bindings/iommu/mediatek,iommu.yaml.
> +
> +      clocks:
> +        maxItems: 5
> +
> +      clock-names:
> +        items:
> +          - const: sel
> +          - const: soc-vdec
> +          - const: soc-lat
> +          - const: vdec
> +          - const: top
> +
> +      assigned-clocks:
> +        maxItems: 1
> +
> +      assigned-clock-parents:
> +        maxItems: 1
> +
> +      power-domains:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +      - interrupts
> +      - iommus
> +      - clocks
> +      - clock-names
> +      - assigned-clocks
> +      - assigned-clock-parents
> +      - power-domains
> +
> +    additionalProperties: false
> +
> +  vcodec-core:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: mediatek,mtk-vcodec-core
> +
> +      reg:
> +        maxItems: 1
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      iommus:
> +        minItems: 1
> +        maxItems: 32
> +        description: |
> +          List of the hardware port in respective IOMMU block for current Socs.
> +          Refer to bindings/iommu/mediatek,iommu.yaml.
> +
> +      clocks:
> +        maxItems: 5
> +
> +      clock-names:
> +        items:
> +          - const: sel
> +          - const: soc-vdec
> +          - const: soc-lat
> +          - const: vdec
> +          - const: top
> +
> +      assigned-clocks:
> +        maxItems: 1
> +
> +      assigned-clock-parents:
> +        maxItems: 1
> +
> +      power-domains:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +      - interrupts
> +      - iommus
> +      - clocks
> +      - clock-names
> +      - assigned-clocks
> +      - assigned-clock-parents
> +      - power-domains
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - iommus
> +  - mediatek,scp
> +  - dma-ranges
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/mt8192-larb-port.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/mt8192-clk.h>
> +    #include <dt-bindings/power/mt8192-power.h>
> +
> +    video-codec@16000000 {
> +        compatible = "mediatek,mt8192-vcodec-dec";
> +        mediatek,scp = <&scp>;
> +        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0 0x16000000 0x40000>;
> +        reg = <0x16000000 0x1000>;             /* VDEC_SYS */
> +        vcodec-lat@10000 {
> +            compatible = "mediatek,mtk-vcodec-lat";
> +            reg = <0x10000 0x800>;
> +            interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
> +            iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
> +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
> +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
> +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
> +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
> +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
> +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
> +                <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
> +            clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> +                <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
> +                <&vdecsys_soc CLK_VDEC_SOC_LAT>,
> +                <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
> +                <&topckgen CLK_TOP_MAINPLL_D4>;
> +            clock-names = "sel", "soc-vdec", "soc-lat", "vdec", "top";
> +            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> +            assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> +            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
> +        };
> +
> +        vcodec-core@25000 {
> +            compatible = "mediatek,mtk-vcodec-core";
> +            reg = <0x25000 0x1000>;
> +            interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
> +            iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
> +            clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> +                <&vdecsys CLK_VDEC_VDEC>,
> +                <&vdecsys CLK_VDEC_LAT>,
> +                <&vdecsys CLK_VDEC_LARB1>,
> +                <&topckgen CLK_TOP_MAINPLL_D4>;
> +            clock-names = "sel", "soc-vdec", "soc-lat", "vdec", "top";
> +            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> +            assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> +            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
> +        };
> +    };
> --
> 2.25.1
>
