Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F57930D7DE
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 11:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233807AbhBCKpF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Feb 2021 05:45:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233671AbhBCKpD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Feb 2021 05:45:03 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9794C061573
        for <linux-media@vger.kernel.org>; Wed,  3 Feb 2021 02:44:22 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id i187so32590696lfd.4
        for <linux-media@vger.kernel.org>; Wed, 03 Feb 2021 02:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UVYgR0aHyH4TOhEE7rZV5p4LY8T3JU2tUPS7qdZdVJs=;
        b=Go7e9XN/EbFgTf9camnwQMfNtcYyFJXJGG8c3QHl29lPWMBBRzA6WyxcJCe6As6Rlg
         9jNG/z7bQNP7ZTelzCvVCdpYYE8BwNvBeGgNrYaXs8MfioVY/9IfUriRZdPcphmW+pUe
         RblYL+fzvfciS8bjPMm+ye163uRT+oMPHtBFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UVYgR0aHyH4TOhEE7rZV5p4LY8T3JU2tUPS7qdZdVJs=;
        b=IHJJQ7C9RNnByzS9LQH1/csehm7yduW79s5qK8U2MqtNZT2Hvgwq23OiNGoAI3aMPz
         wmyjZ2sOz3NySwEq6acqhUdqbNqM5+oUCxHNxGI7ey9kqXkXC9YKIxuwHeDOPsG3v0Fh
         A3/S9Bjv73RGdMFQsVdMRCtaORz+bpCJeceAzrSq5woZH1/xfh/5vDYW5q4YhFwhoMeI
         ksoHI1Y3Nxdm73i772nBJ+KQW8cTqXahNGK8RwmfMVFgPrXx4hmoow6gB5pP2eROOQEZ
         MYS4GP3DorXdh+OtelUszwwg5RRDShZh+GTcrD3o3FVp5iaZBFAJiDJc9BgJ+3GH7Mz4
         wTZg==
X-Gm-Message-State: AOAM533yhykWik2Oxn6Egc0bnIvALuUfvWUXx99ZB9U1ar9cenO+d8+X
        Hg8W6tp5ubGwiF5ai4l24pbMZpyrVBHX6Q==
X-Google-Smtp-Source: ABdhPJx6UvD3auqAbbQ5lIR90eV1TW+ymLbXC9/UGJ+NOjlkC9+P7Us0oviABeB8Um/+Cg1lnU+x2w==
X-Received: by 2002:a19:b01:: with SMTP id 1mr1316879lfl.643.1612349060367;
        Wed, 03 Feb 2021 02:44:20 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id u11sm201785lfr.124.2021.02.03.02.44.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Feb 2021 02:44:20 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id t8so27650330ljk.10
        for <linux-media@vger.kernel.org>; Wed, 03 Feb 2021 02:44:20 -0800 (PST)
X-Received: by 2002:a2e:8616:: with SMTP id a22mr1383065lji.237.1612349059539;
 Wed, 03 Feb 2021 02:44:19 -0800 (PST)
MIME-Version: 1.0
References: <20210121061804.26423-1-irui.wang@mediatek.com>
In-Reply-To: <20210121061804.26423-1-irui.wang@mediatek.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 3 Feb 2021 19:44:07 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVqQ=gBb79Ey-n=WogXBC=Vr5iN7gwKPzVwLUu-9YkGRg@mail.gmail.com>
Message-ID: <CAPBb6MVqQ=gBb79Ey-n=WogXBC=Vr5iN7gwKPzVwLUu-9YkGRg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: media: mtk-vcodec: Separating mtk vcodec
 encoder node
To:     Irui Wang <irui.wang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        srv_heupstream@mediatek.com,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 21, 2021 at 3:18 PM Irui Wang <irui.wang@mediatek.com> wrote:
>
> Updates binding document since the avc and vp8 hardware encoder in
> MT8173 are now separated. Separate "mediatek,mt8173-vcodec-enc" to
> "mediatek,mt8173-vcodec-vp8-enc" and "mediatek,mt8173-vcodec-avc-enc".
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
>
> ---
>  .../bindings/media/mediatek-vcodec.txt        | 58 ++++++++++---------
>  1 file changed, 31 insertions(+), 27 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> index 8217424fd4bd..f85276e629bf 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> @@ -4,7 +4,9 @@ Mediatek Video Codec is the video codec hw present in Mediatek SoCs which
>  supports high resolution encoding and decoding functionalities.
>
>  Required properties:
> -- compatible : "mediatek,mt8173-vcodec-enc" for MT8173 encoder
> +- compatible : must be one of the following string:
> +  "mediatek,mt8173-vcodec-vp8-enc" for mt8173 vp8 encoder.
> +  "mediatek,mt8173-vcodec-avc-enc" for mt8173 avc encoder.

IMHO "mediatek,mt8173-vcodec-enc-vp8" and
"mediatek,mt8173-vcodec-enc-avc" would be more logical. Also to keep a
bit of backward compatibility, shall we also allow
"mediatek,mt8173-vcodec-enc" to be an alias for
"mediatek,mt8173-vcodec-enc-avc"? The line above would become

  "mediatek,mt8173-vcodec-enc-avc" or "mediatek,mt8173-vcodec-enc" for
mt8173 avc encoder.

>    "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
>    "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
>  - reg : Physical base address of the video codec registers and length of
> @@ -13,10 +15,11 @@ Required properties:
>  - mediatek,larb : must contain the local arbiters in the current Socs.
>  - clocks : list of clock specifiers, corresponding to entries in
>    the clock-names property.
> -- clock-names: encoder must contain "venc_sel_src", "venc_sel",,
> -  "venc_lt_sel_src", "venc_lt_sel", decoder must contain "vcodecpll",
> -  "univpll_d2", "clk_cci400_sel", "vdec_sel", "vdecpll", "vencpll",
> -  "venc_lt_sel", "vdec_bus_clk_src".
> +- clock-names:
> +   avc venc must contain "venc_sel";
> +   vp8 venc must contain "venc_lt_sel";

Can't we use "venc_sel" for both avc and vp8, since they are different
nodes now? That way we can just say

  encoder must contain "venc_sel"

which is clearer and also simpler on the code side.

> +   decoder  must contain "vcodecpll", "univpll_d2", "clk_cci400_sel",
> +   "vdec_sel", "vdecpll", "vencpll", "venc_lt_sel", "vdec_bus_clk_src".
>  - iommus : should point to the respective IOMMU block with master port as
>    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>    for details.
> @@ -80,14 +83,10 @@ vcodec_dec: vcodec@16000000 {
>      assigned-clock-rates = <0>, <0>, <0>, <1482000000>, <800000000>;
>    };
>
> -  vcodec_enc: vcodec@18002000 {
> -    compatible = "mediatek,mt8173-vcodec-enc";
> -    reg = <0 0x18002000 0 0x1000>,    /*VENC_SYS*/
> -          <0 0x19002000 0 0x1000>;    /*VENC_LT_SYS*/
> -    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>,
> -                <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> -    mediatek,larb = <&larb3>,
> -                   <&larb5>;
> +vcodec_enc: vcodec@18002000 {

Let's use vcodec_enc_avc as a label?

> +    compatible = "mediatek,mt8173-vcodec-avc-enc";
> +    reg = <0 0x18002000 0 0x1000>;
> +    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
>      iommus = <&iommu M4U_PORT_VENC_RCPU>,
>               <&iommu M4U_PORT_VENC_REC>,
>               <&iommu M4U_PORT_VENC_BSDMA>,
> @@ -98,8 +97,20 @@ vcodec_dec: vcodec@16000000 {
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
> +vcodec_enc_lt: vcodec@19002000 {

And here the label should probably be "vcodec_enc_vp8" for consistency.



> +    compatible = "mediatek,mt8173-vcodec-vp8-enc";
> +    reg =  <0 0x19002000 0 0x1000>;    /* VENC_LT_SYS */
> +    interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> +    iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
>               <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
>               <&iommu M4U_PORT_VENC_BSDMA_SET2>,
>               <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
> @@ -108,17 +119,10 @@ vcodec_dec: vcodec@16000000 {
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
