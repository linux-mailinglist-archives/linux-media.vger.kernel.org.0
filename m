Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D4FE442F6E
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 14:51:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbhKBNyO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 09:54:14 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:41505 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231161AbhKBNyN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Nov 2021 09:54:13 -0400
Received: by mail-ot1-f41.google.com with SMTP id v2-20020a05683018c200b0054e3acddd91so30067926ote.8;
        Tue, 02 Nov 2021 06:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XpVdRouFdaAwA7SuTkxvVAfzf38XTZnlT5W12MFMumo=;
        b=KI83Kk/rL2DcjALtuOn00Ktyz920PCArSWo3Bpqq102Hgsfq4TZXVObyb1qo57plp8
         kDiXzEOS99d8lQTfxiPTK4lwJDmduHz/wA+zv9YN9RvZSh3CCvS5FOhVgBtiCfitRw9h
         xUge7bO1ajYlIKn96gmdawE3iIOvkMyZVjhwhx9aa9XaArZUdOS2wTDpgEChyF15SEap
         WD7guvqGbo2yxB9jny0EbFZ2QZe1//02yTfzVPO15i+AzG/6PE9SZA0gqWObJlBH9DOX
         KO11+gQT5RHTNc2Y0ZoqqbH5BgOz675LLrkq+DUa1hP7bXqe7WaCuZvDfunB+/bFTYFq
         7fHg==
X-Gm-Message-State: AOAM533qlVRPglRreqo0bC1S61/fCXOO92Db34K+dVrAbo8bmCShKtDN
        SDw1jVYTT+UOUFtnn76/wA==
X-Google-Smtp-Source: ABdhPJyXYK0bH/5cyUilPJ+LyLIhOVaNej7ZknJgC1RMseweL5eKVOB8xNTTYf38hN9eyjDIury2mA==
X-Received: by 2002:a9d:470d:: with SMTP id a13mr26745698otf.75.1635861098494;
        Tue, 02 Nov 2021 06:51:38 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id z25sm35974oic.1.2021.11.02.06.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 06:51:37 -0700 (PDT)
Received: (nullmailer pid 2767023 invoked by uid 1000);
        Tue, 02 Nov 2021 13:51:36 -0000
Date:   Tue, 2 Nov 2021 08:51:36 -0500
From:   Rob Herring <robh@kernel.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v8, 15/17] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for mt8192
Message-ID: <YYFCaHI/DASUz+Vu@robh.at.kernel.org>
References: <20211029035527.454-1-yunfei.dong@mediatek.com>
 <20211029035527.454-16-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211029035527.454-16-yunfei.dong@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 29, 2021 at 11:55:25AM +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for mt8192.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v8: fix yaml file check fail
> ---
>  .../media/mediatek,vcodec-comp-decoder.yaml   | 273 ++++++++++++++++++
>  1 file changed, 273 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
> new file mode 100644
> index 000000000000..40a076756439
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
> @@ -0,0 +1,273 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/mediatek,vcodec-comp-decoder.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Mediatek Video Decode Accelerator With Multi Hardware
> +
> +maintainers:
> +  - Yunfei Dong <yunfei.dong@mediatek.com>
> +
> +description: |
> +  Mediatek Video Decode is the video decode hardware present in Mediatek
> +  SoCs which supports high resolution decoding functionalities. Required
> +  master and component node.
> +
> +  About the Decoder Hardware Block Diagram, please check below:
> +
> +    +---------------------------------+------------------------------------+
> +    |                                 |                                    |
> +    | input -> lat HW -> lat buffer --|--> lat buffer -> core HW -> output |
> +    |            ||                   |                     ||             |
> +    +------------||-------------------+---------------------||-------------+
> +                 ||       lat thread  |  core thread        ||     <master>
> +    -------------||-----------------------------------------||----------------
> +                 ||                                         ||     <component>
> +                 \/ <----------------HW index-------------->\/
> +           +------------------------------------------------------+
> +           |                    enable/disable                    |
> +           |           clk     power    irq    iommu port         |
> +           |                 (lat/lat soc/core0/core1)            |
> +           +------------------------------------------------------+
> +
> +  As above, <master> mean in master device, <component> mean in component device.
> +  The information of each hardware will be stored in each component device. There
> +  are two workqueue in master device: lat and core. Enable/disable the lat clk/power/irq
> +  when lat hardware need to work through hardware index, core is the same.
> +
> +  Normally the smi common may not the same for each hardware, can't combine all
> +  hardware in one node, or leading to iommu fault when access dram data.
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
> +      reg-names:
> +        maxItems: 1

You have to document what the names are. But 'misc' is isn't really 
specific and you don't need -names when there is only 1, so I'd just 
drop it.

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
> +          - const: vdec-sel
> +          - const: vdec-soc-vdec
> +          - const: vdec-soc-lat
> +          - const: vdec-vdec
> +          - const: vdec-top

'vdec-' is redundant. Names are local to the node.

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
> +      - reg-names
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
> +      reg-names:
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
> +          - const: vdec-sel
> +          - const: vdec-soc-vdec
> +          - const: vdec-soc-lat
> +          - const: vdec-vdec
> +          - const: vdec-top
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
> +      - reg-names
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
> +    vcodec_dec: vcodec_dec@16000000 {

video-codec@...

> +        compatible = "mediatek,mt8192-vcodec-dec";
> +        reg = <0x16000000 0x1000>;		/* VDEC_SYS */
> +        mediatek,scp = <&scp>;
> +        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +        lat: vcodec-lat@16010000 {
> +            compatible = "mediatek,mtk-vcodec-lat";
> +            reg = <0x16010000 0x800>;
> +            reg-names = "misc";
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
> +            clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
> +                "vdec-vdec", "vdec-top";
> +            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> +            assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> +            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
> +        };
> +
> +        core: vcodec-core@16025000 {
> +            compatible = "mediatek,mtk-vcodec-core";
> +            reg = <0x16025000 0x1000>;
> +            reg-names = "misc";
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
> +            clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
> +                "vdec-vdec", "vdec-top";
> +            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> +            assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> +            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
> +        };
> +    };
> -- 
> 2.25.1
> 
> 
