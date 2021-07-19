Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25F813CD006
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 11:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236083AbhGSIYt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 04:24:49 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34036 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235795AbhGSIYt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 04:24:49 -0400
Received: from [IPv6:2a02:810a:880:f54:121:b44d:bc4b:65bc] (unknown [IPv6:2a02:810a:880:f54:121:b44d:bc4b:65bc])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 00DF41F42371;
        Mon, 19 Jul 2021 10:05:26 +0100 (BST)
Subject: Re: [PATCH v2, 04/14] dt-bindings: media: mtk-vcodec: Separate video
 encoder and decoder dt-bindings
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
Cc:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Collabora Kernel ML <kernel@collabora.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <20210717081233.7809-1-yunfei.dong@mediatek.com>
 <20210717081233.7809-5-yunfei.dong@mediatek.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <aa7b0ea8-293d-5844-6b52-522983d58b44@collabora.com>
Date:   Mon, 19 Jul 2021 11:05:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717081233.7809-5-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, new dt-binding files should be yaml files.

Thanks,
Dafna

On 17.07.21 10:12, Yunfei Dong wrote:
> Decoder will use component framework to manage hardware, it is big
> difference with encoder.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v2: Remove useless code for this patch.
> ---
>   ...vcodec.txt => mediatek-vcodec-decoder.txt} | 62 ++--------------
>   .../media/mediatek-vcodec-encoder.txt         | 73 +++++++++++++++++++
>   2 files changed, 79 insertions(+), 56 deletions(-)
>   rename Documentation/devicetree/bindings/media/{mediatek-vcodec.txt => mediatek-vcodec-decoder.txt} (56%)
>   create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-encoder.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec-decoder.txt
> similarity index 56%
> rename from Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> rename to Documentation/devicetree/bindings/media/mediatek-vcodec-decoder.txt
> index c44a6e6943af..7c6e608df8a9 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec-decoder.txt
> @@ -1,26 +1,20 @@
> -Mediatek Video Codec
> +Mediatek Video Decoder
>   
> -Mediatek Video Codec is the video codec hw present in Mediatek SoCs which
> -supports high resolution encoding and decoding functionalities.
> +Mediatek Video Decoder is the video decode hw present in Mediatek SoCs which
> +supports high resolution decoding functionalities.
>   
>   Required properties:
>   - compatible : must be one of the following string:
> -  "mediatek,mt8173-vcodec-enc-vp8" for mt8173 vp8 encoder.
> -  "mediatek,mt8173-vcodec-enc" for mt8173 avc encoder.
> -  "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
>     "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
> -  "mediatek,mt8192-vcodec-enc" for MT8192 encoder.
>     "mediatek,mt8183-vcodec-dec" for MT8183 decoder.
> -- reg : Physical base address of the video codec registers and length of
> +- reg : Physical base address of the video decoder registers and length of
>     memory mapped region.
>   - interrupts : interrupt number to the cpu.
>   - mediatek,larb : must contain the local arbiters in the current Socs.
>   - clocks : list of clock specifiers, corresponding to entries in
>     the clock-names property.
> -- clock-names: avc encoder must contain "venc_sel", vp8 encoder must
> -  contain "venc_lt_sel", decoder must contain "vcodecpll", "univpll_d2",
> -  "clk_cci400_sel", "vdec_sel", "vdecpll", "vencpll", "venc_lt_sel",
> -  "vdec_bus_clk_src".
> +- clock-names: must contain "vcodecpll", "univpll_d2", "clk_cci400_sel"
> +  "vdec_sel", "vdecpll", "vencpll", "venc_lt_sel", "vdec_bus_clk_src".
>   - iommus : should point to the respective IOMMU block with master port as
>     argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
>     for details.
> @@ -84,47 +78,3 @@ vcodec_dec: vcodec@16000000 {
>                                <&topckgen CLK_TOP_VCODECPLL>;
>       assigned-clock-rates = <0>, <0>, <0>, <1482000000>, <800000000>;
>     };
> -
> -vcodec_enc_avc: vcodec@18002000 {
> -    compatible = "mediatek,mt8173-vcodec-enc";
> -    reg = <0 0x18002000 0 0x1000>;
> -    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
> -    iommus = <&iommu M4U_PORT_VENC_RCPU>,
> -             <&iommu M4U_PORT_VENC_REC>,
> -             <&iommu M4U_PORT_VENC_BSDMA>,
> -             <&iommu M4U_PORT_VENC_SV_COMV>,
> -             <&iommu M4U_PORT_VENC_RD_COMV>,
> -             <&iommu M4U_PORT_VENC_CUR_LUMA>,
> -             <&iommu M4U_PORT_VENC_CUR_CHROMA>,
> -             <&iommu M4U_PORT_VENC_REF_LUMA>,
> -             <&iommu M4U_PORT_VENC_REF_CHROMA>,
> -             <&iommu M4U_PORT_VENC_NBM_RDMA>,
> -             <&iommu M4U_PORT_VENC_NBM_WDMA>;
> -    mediatek,larb = <&larb3>;
> -    mediatek,vpu = <&vpu>;
> -    clocks = <&topckgen CLK_TOP_VENC_SEL>;
> -    clock-names = "venc_sel";
> -    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
> -    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
> -  };
> -
> -vcodec_enc_vp8: vcodec@19002000 {
> -    compatible = "mediatek,mt8173-vcodec-enc-vp8";
> -    reg =  <0 0x19002000 0 0x1000>;	/* VENC_LT_SYS */
> -    interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> -    iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
> -             <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
> -             <&iommu M4U_PORT_VENC_BSDMA_SET2>,
> -             <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
> -             <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
> -             <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
> -             <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
> -             <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
> -             <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
> -    mediatek,larb = <&larb5>;
> -    mediatek,vpu = <&vpu>;
> -    clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> -    clock-names = "venc_lt_sel";
> -    assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> -    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>;
> -  };
> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec-encoder.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec-encoder.txt
> new file mode 100644
> index 000000000000..81c47fd44958
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec-encoder.txt
> @@ -0,0 +1,73 @@
> +Mediatek Video Encoder
> +
> +Mediatek Video Encoder is the video encode hw present in Mediatek SoCs which
> +supports high resolution encoding functionalities.
> +
> +Required properties:
> +- compatible : must be one of the following string:
> +  "mediatek,mt8173-vcodec-enc-vp8" for mt8173 vp8 encoder.
> +  "mediatek,mt8173-vcodec-enc" for mt8173 avc encoder.
> +  "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
> +  "mediatek,mt8192-vcodec-enc" for MT8192 encoder.
> +- reg : Physical base address of the video encoder registers and length of
> +  memory mapped region.
> +- interrupts : interrupt number to the cpu.
> +- mediatek,larb : must contain the local arbiters in the current Socs.
> +- clocks : list of clock specifiers, corresponding to entries in
> +  the clock-names property.
> +- clock-names: avc encoder must contain "venc_sel", vp8 encoder must
> +  contain "venc_lt_sel".
> +- iommus : should point to the respective IOMMU block with master port as
> +  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +  for details.
> +- dma-ranges : describes the dma address range space that the codec hw access.
> +One of the two following nodes:
> +- mediatek,vpu : the node of the video processor unit, if using VPU.
> +- mediatek,scp : the node of the SCP unit, if using SCP.
> +
> +
> +Example:
> +
> +vcodec_enc_avc: vcodec@18002000 {
> +    compatible = "mediatek,mt8173-vcodec-enc";
> +    reg = <0 0x18002000 0 0x1000>;
> +    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
> +    iommus = <&iommu M4U_PORT_VENC_RCPU>,
> +             <&iommu M4U_PORT_VENC_REC>,
> +             <&iommu M4U_PORT_VENC_BSDMA>,
> +             <&iommu M4U_PORT_VENC_SV_COMV>,
> +             <&iommu M4U_PORT_VENC_RD_COMV>,
> +             <&iommu M4U_PORT_VENC_CUR_LUMA>,
> +             <&iommu M4U_PORT_VENC_CUR_CHROMA>,
> +             <&iommu M4U_PORT_VENC_REF_LUMA>,
> +             <&iommu M4U_PORT_VENC_REF_CHROMA>,
> +             <&iommu M4U_PORT_VENC_NBM_RDMA>,
> +             <&iommu M4U_PORT_VENC_NBM_WDMA>;
> +    mediatek,larb = <&larb3>;
> +    mediatek,vpu = <&vpu>;
> +    clocks = <&topckgen CLK_TOP_VENC_SEL>;
> +    clock-names = "venc_sel";
> +    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
> +    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
> +  };
> +
> +vcodec_enc_vp8: vcodec@19002000 {
> +    compatible = "mediatek,mt8173-vcodec-enc-vp8";
> +    reg =  <0 0x19002000 0 0x1000>;	/* VENC_LT_SYS */
> +    interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> +    iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
> +             <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
> +             <&iommu M4U_PORT_VENC_BSDMA_SET2>,
> +             <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
> +             <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
> +             <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
> +             <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
> +             <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
> +             <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
> +    mediatek,larb = <&larb5>;
> +    mediatek,vpu = <&vpu>;
> +    clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> +    clock-names = "venc_lt_sel";
> +    assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> +    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>;
> +  };
> 
