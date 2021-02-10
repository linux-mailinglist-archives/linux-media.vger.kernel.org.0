Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE243173C0
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 23:56:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233448AbhBJWz4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 17:55:56 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:46374 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232565AbhBJWzv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 17:55:51 -0500
Received: by mail-ot1-f50.google.com with SMTP id r21so3425803otk.13;
        Wed, 10 Feb 2021 14:55:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w1YK7UNTu1HB40IxkkqVRuEb+aW6wO4/KWDnve1zAtI=;
        b=j622xV6i335Ob57prvUAHcWBMznlhTmdlEWCUletyIAK2o0pNbYQMkHeTJ1xd5CEmn
         kTWS27BBxj6L6ynV2BG2RJHMY+35D4165aZQHvsSsBkE1hEch9kP3tohqz6szvnf+vt+
         VZcz3B+uIpkpPGMq6wAiDwHoxjbUw+I4FhcTrvIINvw/TeJsQ5VkZTIcXFjzJZea7skx
         OcA3N6igWJRNnO4W1qZIqx7rbL9RYD3REdjOlbBmp1rSEl3GMt1T8y1AcTE+7pjgALVy
         W4id8+Xef7zG1lozkqZj13NbPcXAcTscTn8zr9GhfAqMJLBy7If1Ae1dQR9iZidrT5DL
         dyXg==
X-Gm-Message-State: AOAM533KIh2PdUoB2D7ZCAwpXQDwz8TOq5Qv4kZVUxqy73YVINAy/tHI
        rTYEMgZQnunREJm+m8tb2A==
X-Google-Smtp-Source: ABdhPJzumyrQ1giKRY0y9McaknWrNANEdMLFRDns2459jtzKfyWuRGrA0MEhtV2VvNn0xyldNSZDMw==
X-Received: by 2002:a9d:12c1:: with SMTP id g59mr2602649otg.116.1612997708883;
        Wed, 10 Feb 2021 14:55:08 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p67sm777226oih.21.2021.02.10.14.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 14:55:08 -0800 (PST)
Received: (nullmailer pid 2967891 invoked by uid 1000);
        Wed, 10 Feb 2021 22:54:12 -0000
Date:   Wed, 10 Feb 2021 16:54:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Irui Wang <irui.wang@mediatek.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/5] dt-bindings: media: mtk-vcodec: Add binding for
 MT8192 VENC
Message-ID: <20210210225412.GA2966579@robh.at.kernel.org>
References: <20210203083752.12586-1-irui.wang@mediatek.com>
 <20210203083752.12586-4-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203083752.12586-4-irui.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 03, 2021 at 04:37:50PM +0800, Irui Wang wrote:
> Updates binding document for mt8192 encoder driver.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  .../bindings/media/mediatek-vcodec.txt        | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> index e4644f8caee9..c7fac557006f 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> @@ -9,6 +9,7 @@ Required properties:
>    "mediatek,mt8173-vcodec-avc-enc" for mt8173 avc encoder.
>    "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
>    "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
> +  "mediatek,mt8192-vcodec-enc" for MT8192 encoder.
>  - reg : Physical base address of the video codec registers and length of
>    memory mapped region.
>  - interrupts : interrupt number to the cpu.
> @@ -128,3 +129,28 @@ vcodec_enc_lt: vcodec@19002000 {
>      assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
>      assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>;
>    };
> +
> +vcodec_enc: vcodec@0x17020000 {

Don't add an example just for a new compatible.

> +    compatible = "mediatek,mt8192-vcodec-enc";
> +    reg = <0 0x17020000 0 0x2000>;
> +    iommus = <&iommu0 M4U_PORT_L7_VENC_RCPU>,
> +             <&iommu0 M4U_PORT_L7_VENC_REC>,
> +             <&iommu0 M4U_PORT_L7_VENC_BSDMA>,
> +             <&iommu0 M4U_PORT_L7_VENC_SV_COMV>,
> +             <&iommu0 M4U_PORT_L7_VENC_RD_COMV>,
> +             <&iommu0 M4U_PORT_L7_VENC_CUR_LUMA>,
> +             <&iommu0 M4U_PORT_L7_VENC_CUR_CHROMA>,
> +             <&iommu0 M4U_PORT_L7_VENC_REF_LUMA>,
> +             <&iommu0 M4U_PORT_L7_VENC_REF_CHROMA>,
> +             <&iommu0 M4U_PORT_L7_VENC_SUB_R_LUMA>,
> +             <&iommu0 M4U_PORT_L7_VENC_SUB_W_LUMA>;
> +    interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH 0>;
> +    dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> +    mediatek,scp = <&scp>;
> +    power-domains = <&scpsys MT8192_POWER_DOMAIN_VENC>;
> +    clocks = <&vencsys CLK_VENC_SET1_VENC>;
> +    clock-names = "venc-set1";
> +    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
> +    assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D4>;
> +};
> +
> -- 
> 2.25.1
> 
