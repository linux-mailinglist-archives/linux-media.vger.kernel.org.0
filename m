Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 380E6347C91
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 16:29:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236532AbhCXP2s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 11:28:48 -0400
Received: from mail-io1-f41.google.com ([209.85.166.41]:47050 "EHLO
        mail-io1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236517AbhCXP22 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 11:28:28 -0400
Received: by mail-io1-f41.google.com with SMTP id j26so21892180iog.13;
        Wed, 24 Mar 2021 08:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6xcBXMMCaVDuU5qnrC5kX42d8TK5pM5OgA40PNY4QmM=;
        b=DPaN4ykJuuwTI6UAc82aigGJ55OGoG0qRGIFIS0G/lkhGQ5mRCQPU3SILq4eolNQtO
         4jxqikE0ynEBESbcBefqGo6ejWLHu3zRM9q7tppGguB5aC6dPEhyQz+tV3PEqMOKyJxt
         ww76OBz0Ra8y8lBP9LW07HarIg5+Mpo/qGeFVmtyVfBPDgYf39XfPOanQ8TISe/NS6bd
         i7P7rOHwf1shC2EwirhOmLIxPhSC8jijjfzcSxmKg6bfcyX1E8AM9PQxsAEsj/1rKzld
         1GxgrtJwzjHIraHQZoA1MGAUq6SCCwsG5fcVexJ+zkeScuxJqY3XkeEO8g98G4nGUS9E
         tYmA==
X-Gm-Message-State: AOAM5315Yrh4qPIFxICT3slJqUzs7Iyn74P9Z+7tKuoRPR6rPuqJBCyC
        n/PmHwCeRib3spQa4HTK0Q==
X-Google-Smtp-Source: ABdhPJxY497goQhHxgfca1nf0rj5C+sTusKlHXSWJVMBsqhPpHO9cDYw+mu2Uqn6j4u/NoIqTAqzEA==
X-Received: by 2002:a05:6638:58f:: with SMTP id a15mr3319656jar.35.1616599708016;
        Wed, 24 Mar 2021 08:28:28 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id i18sm840950ilk.83.2021.03.24.08.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:28:26 -0700 (PDT)
Received: (nullmailer pid 3100117 invoked by uid 1000);
        Wed, 24 Mar 2021 15:28:24 -0000
Date:   Wed, 24 Mar 2021 09:28:24 -0600
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
Subject: Re: [v3,PATCH 1/3] dt-bindings: media: mtk-vcodec: Separating mtk
 vcodec encoder node
Message-ID: <20210324152824.GA3093851@robh.at.kernel.org>
References: <20210312073540.4922-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312073540.4922-1-irui.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 12, 2021 at 03:35:38PM +0800, Irui Wang wrote:
> Updates binding document since the avc and vp8 hardware encoder in
> MT8173 are now separated. Separate "mediatek,mt8173-vcodec-enc" to
> "mediatek,mt8173-vcodec-enc-vp8" and "mediatek,mt8173-vcodec-enc".
> 
> This patch separates the two devices, it's a preparing patch for adding
> device_link between the larbs and venc-device. It's mainly for fixing
> the problem:
> https://lkml.org/lkml/2019/9/3/316

This is not a compatible change. That needs to be explained here with 
why that is okay.

> 
> Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
> Change since v2:
> - update dt-bindings commit message
> ---
> 
>  .../bindings/media/mediatek-vcodec.txt        | 55 ++++++++++---------
>  1 file changed, 29 insertions(+), 26 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> index 8217424fd4bd..8318f0ed492d 100644
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
> +- clock-names: avc encoder must contain "venc_sel", vp8 encoder must
> +  contain "venc_lt_sel", decoder must contain "vcodecpll", "univpll_d2",
> +  "clk_cci400_sel", "vdec_sel", "vdecpll", "vencpll", "venc_lt_sel",
> +  "vdec_bus_clk_src".
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
> 2.18.0
> 
