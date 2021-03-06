Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B61532FD39
	for <lists+linux-media@lfdr.de>; Sat,  6 Mar 2021 21:54:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbhCFUrX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Mar 2021 15:47:23 -0500
Received: from mail-qv1-f53.google.com ([209.85.219.53]:37970 "EHLO
        mail-qv1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbhCFUq5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Mar 2021 15:46:57 -0500
Received: by mail-qv1-f53.google.com with SMTP id bh3so2778639qvb.5;
        Sat, 06 Mar 2021 12:46:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y/bwRZFE+81GxJ819/dzmZmbJ5VhND4GcsCvXIq1kmU=;
        b=g07XtYLZmZNzx4a8DKzjR0IeVmWy74e/+EIwzvcOO1bLIgmEil+jaRqux3FVD82o+C
         mMhhhNeDp0b71SyFJUZVA7sKqxOoZtVIyuiPaR5EMpW9jyyjX9kw9Z9R/Q2qNYfR9kfb
         TXeSLXtQoJL1d9L5aicEuMFG48XnBHKhzoCQ9Wof3hrqEP2bNorI0t+xY8DRcKLKHPGU
         EvGEV0VUwma7TsbsSY6qFFz+8kuehEHwLA9YqJhGgWQPAThfQJLfWkRA0HKNG6BCmPwE
         JxGT/3bFYnQOMrKkIF0l/05ZJUDvTYgTpPgGoKs/R8WrPWVpliMzrjEhxLjuZpDKq1FQ
         xu9Q==
X-Gm-Message-State: AOAM533x1Ig+jh+vz1syR0xo5/ZTbMWUqxOB7CWkFBf3iP48NGzMlmpm
        uTAYIHt45TLPoviqiyWF7A==
X-Google-Smtp-Source: ABdhPJzkozUHpwvVJzF8cjeIVjY27mE83sREQIGN2MFZZWdBK+eZETiFMTsf8hZMF9Av6T7XR/Zk8g==
X-Received: by 2002:a0c:b894:: with SMTP id y20mr14731003qvf.43.1615063617136;
        Sat, 06 Mar 2021 12:46:57 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
        by smtp.gmail.com with ESMTPSA id v135sm4603573qka.98.2021.03.06.12.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 12:46:56 -0800 (PST)
Received: (nullmailer pid 1186613 invoked by uid 1000);
        Sat, 06 Mar 2021 20:46:49 -0000
Date:   Sat, 6 Mar 2021 13:46:49 -0700
From:   Rob Herring <robh@kernel.org>
To:     Irui Wang <irui.wang@mediatek.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>, yong.wu@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2,1/3] dt-bindings: media: mtk-vcodec: Separating mtk
 vcodec encoder node
Message-ID: <20210306204649.GA1177075@robh.at.kernel.org>
References: <20210225073603.5881-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210225073603.5881-1-irui.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 25, 2021 at 03:36:01PM +0800, Irui Wang wrote:
> Updates binding document since the avc and vp8 hardware encoder in
> MT8173 are now separated. Separate "mediatek,mt8173-vcodec-enc" to
> "mediatek,mt8173-vcodec-enc-vp8" and "mediatek,mt8173-vcodec-enc".

This is not a compatible change. Please explain that here and why that's 
okay (if it is).

> 
> This is a preparing patch for smi cleaning up "mediatek,larb".
> 
> Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
> Change since v1:
> - rename compatible and device node
> ---
>  .../bindings/media/mediatek-vcodec.txt        | 55 ++++++++++---------
>  1 file changed, 29 insertions(+), 26 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> index 8217424fd4bd..03209cbd7540 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> @@ -4,7 +4,9 @@ Mediatek Video Codec is the video codec hw present in Mediatek SoCs which
>  supports high resolution encoding and decoding functionalities.
>  
>  Required properties:
> -- compatible : "mediatek,mt8173-vcodec-enc" for MT8173 encoder
> +- compatible : must be one of the following string:
> +  "mediatek,mt8173-vcodec-enc-vp8" for mt8173 vp8 encoder.
> +  "mediatek,mt8173-vcodec-enc" for mt8173 avc encoder.
>    "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
>    "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
>  - reg : Physical base address of the video codec registers and length of
> @@ -13,10 +15,10 @@ Required properties:
>  - mediatek,larb : must contain the local arbiters in the current Socs.
>  - clocks : list of clock specifiers, corresponding to entries in
>    the clock-names property.
> -- clock-names: encoder must contain "venc_sel_src", "venc_sel",,
> -  "venc_lt_sel_src", "venc_lt_sel", decoder must contain "vcodecpll",
> -  "univpll_d2", "clk_cci400_sel", "vdec_sel", "vdecpll", "vencpll",
> -  "venc_lt_sel", "vdec_bus_clk_src".
> +- clock-names:
> +   encoder must contain "venc_sel";

What happened to the other clocks?

Seems like you are dropping what are parent clocks? That seems unrelated 
to the VP8 split? If so, that's a separate change.

> +   decoder  must contain "vcodecpll", "univpll_d2", "clk_cci400_sel",
> +   "vdec_sel", "vdecpll", "vencpll", "venc_lt_sel", "vdec_bus_clk_src".
>  - iommus : should point to the respective IOMMU block with master port as
>    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>    for details.
> @@ -80,14 +82,10 @@ vcodec_dec: vcodec@16000000 {
>      assigned-clock-rates = <0>, <0>, <0>, <1482000000>, <800000000>;
>    };
>  
> -  vcodec_enc: vcodec@18002000 {
> +vcodec_enc_avc: vcodec@18002000 {
>      compatible = "mediatek,mt8173-vcodec-enc";
> -    reg = <0 0x18002000 0 0x1000>,    /*VENC_SYS*/
> -          <0 0x19002000 0 0x1000>;    /*VENC_LT_SYS*/
> -    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>,
> -		 <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> -    mediatek,larb = <&larb3>,
> -		    <&larb5>;
> +    reg = <0 0x18002000 0 0x1000>;
> +    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
>      iommus = <&iommu M4U_PORT_VENC_RCPU>,
>               <&iommu M4U_PORT_VENC_REC>,
>               <&iommu M4U_PORT_VENC_BSDMA>,
> @@ -98,8 +96,20 @@ vcodec_dec: vcodec@16000000 {
>               <&iommu M4U_PORT_VENC_REF_LUMA>,
>               <&iommu M4U_PORT_VENC_REF_CHROMA>,
>               <&iommu M4U_PORT_VENC_NBM_RDMA>,
> -             <&iommu M4U_PORT_VENC_NBM_WDMA>,
> -             <&iommu M4U_PORT_VENC_RCPU_SET2>,
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
>               <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
>               <&iommu M4U_PORT_VENC_BSDMA_SET2>,
>               <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
> @@ -108,17 +118,10 @@ vcodec_dec: vcodec@16000000 {
>               <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
>               <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
>               <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
> +    mediatek,larb = <&larb5>;
>      mediatek,vpu = <&vpu>;
> -    clocks = <&topckgen CLK_TOP_VENCPLL_D2>,
> -             <&topckgen CLK_TOP_VENC_SEL>,
> -             <&topckgen CLK_TOP_UNIVPLL1_D2>,
> -             <&topckgen CLK_TOP_VENC_LT_SEL>;
> -    clock-names = "venc_sel_src",
> -                  "venc_sel",
> -                  "venc_lt_sel_src",
> -                  "venc_lt_sel";
> -    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>,
> -                      <&topckgen CLK_TOP_VENC_LT_SEL>;
> -    assigned-clock-parents = <&topckgen CLK_TOP_VENCPLL_D2>,
> -                             <&topckgen CLK_TOP_UNIVPLL1_D2>;
> +    clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> +    clock-names = "venc_lt_sel";
> +    assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> +    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>;
>    };
> -- 
> 2.25.1
> 
