Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A83DD35512E
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 12:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245181AbhDFKu1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 06:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245177AbhDFKu0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Apr 2021 06:50:26 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9046C06174A;
        Tue,  6 Apr 2021 03:50:18 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id x7so13693449wrw.10;
        Tue, 06 Apr 2021 03:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=C1JdH9qMTW9Ct0cY1by9NdoLJ5D/IrcneC7TbnQot4U=;
        b=APVJ86nA+ezkgBslLllPedosijYCehd73iMhlwkNMVDrebQAbIUO949N9bX1f16lXP
         Puozc8Ict2gEwTlJ3JEL99ksHK17NVlb5XJBaj+l/YhmnHlGpEKvkWapOoSN5fyeaKlC
         1ramhmb2uUbCoKIu0BTZuW5NZQvAe2XbUqAqARSTXK3vV5F2sAd/pN2EvdxHN33PuzRU
         70NiqqGkf5f1tpXt54Hu5xerDphos5e3cPg/7yTbbfrhSoaFBfs6NUGCHW5Ar9Bf6qKa
         du49yXti9LYC8oUsIIJLWeet8v/rtbbjgG3QDQSBTJKthGcghU1u0ljkigMnntt/DfhW
         Vukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C1JdH9qMTW9Ct0cY1by9NdoLJ5D/IrcneC7TbnQot4U=;
        b=oUVB23Wh2No2UyXVuO7/NKcqrMCtA10W1mGt1/hXuVOKpJHPLRoMmbHWouZUzn/rnR
         uvFGj7XVhSuAiqocC1wyG71xTOCgXn4POgcpTWrQBBIEyjk+znJI3F1T0dYT3AmgQx0E
         WIrwtDP8QslQm6sQG7gS1PAhM/6STMdz8lIvqk+5PUTC3mHVsDwJ9dFuNOsAJPOTrCpY
         k9h2iJtZQuwpru6dCQXPOWqaOHtssSK0eYDpEzxZXiS2ciuDieI3eeL9mX04iaV/fGxM
         LJDDpe2zbUS5dpUCE+TJekhY09PgnYfuz9FLbd7q5Z0aOXeuiMsWvVwFR33sSREnH156
         ltMw==
X-Gm-Message-State: AOAM532VfZqO9YoYNTVZEv9kpuII5t2ES1HPWbD4Ifqrq4yfiMulW0nb
        yVtX6dKFiiUO83hW/rI1Ecg=
X-Google-Smtp-Source: ABdhPJy2a8YOzQ5NrFn1DlBHGsLFv04sefVLfR7KIezOh75tsd5Xy3kNyYeGS3gXeoNGZH74FSzwPg==
X-Received: by 2002:adf:ec88:: with SMTP id z8mr16164322wrn.315.1617706217556;
        Tue, 06 Apr 2021 03:50:17 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
        by smtp.gmail.com with ESMTPSA id u9sm2304351wmc.38.2021.04.06.03.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Apr 2021 03:50:17 -0700 (PDT)
Subject: Re: [PATCH v4,2/3] arm64: dts: mt8173: Separating mtk-vcodec-enc
 device node
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Irui Wang <irui.wang@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>, yong.wu@mediatek.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org
References: <20210325122625.15100-1-irui.wang@mediatek.com>
 <20210325122625.15100-2-irui.wang@mediatek.com>
 <245594e6-a4c9-0f53-58e3-1b32ca6dc651@xs4all.nl>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <dd87cbf6-1c79-63e1-a92e-7831eaa63f52@gmail.com>
Date:   Tue, 6 Apr 2021 12:50:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <245594e6-a4c9-0f53-58e3-1b32ca6dc651@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 06/04/2021 12:46, Hans Verkuil wrote:
> Hi Irui,
> 
> On 25/03/2021 13:26, Irui Wang wrote:
>> There are two separate hardware encoder blocks inside MT8173.
>> Split the current mtk-vcodec-enc node to match the hardware architecture.
> 
> I've accepted patches 1 & 3, so this patch can be merged by whoever maintains these dts
> files.

Thanks for the info, patch 2 is now part of v5.12-next/dts64-2

Regards,
Matthias

> 
> Regards,
> 
> 	Hans
> 
>>
>> Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>> Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
>> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
>> ---
>>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 60 ++++++++++++------------
>>  1 file changed, 31 insertions(+), 29 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>> index 7fa870e4386a..f5950e9fc51d 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>> @@ -1458,14 +1458,11 @@
>>  			clock-names = "apb", "smi";
>>  		};
>>  
>> -		vcodec_enc: vcodec@18002000 {
>> +		vcodec_enc_avc: vcodec@18002000 {
>>  			compatible = "mediatek,mt8173-vcodec-enc";
>> -			reg = <0 0x18002000 0 0x1000>,	/* VENC_SYS */
>> -			      <0 0x19002000 0 0x1000>;	/* VENC_LT_SYS */
>> -			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>,
>> -				     <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
>> -			mediatek,larb = <&larb3>,
>> -					<&larb5>;
>> +			reg = <0 0x18002000 0 0x1000>;	/* VENC_SYS */
>> +			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
>> +			mediatek,larb = <&larb3>;
>>  			iommus = <&iommu M4U_PORT_VENC_RCPU>,
>>  				 <&iommu M4U_PORT_VENC_REC>,
>>  				 <&iommu M4U_PORT_VENC_BSDMA>,
>> @@ -1476,29 +1473,12 @@
>>  				 <&iommu M4U_PORT_VENC_REF_LUMA>,
>>  				 <&iommu M4U_PORT_VENC_REF_CHROMA>,
>>  				 <&iommu M4U_PORT_VENC_NBM_RDMA>,
>> -				 <&iommu M4U_PORT_VENC_NBM_WDMA>,
>> -				 <&iommu M4U_PORT_VENC_RCPU_SET2>,
>> -				 <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
>> -				 <&iommu M4U_PORT_VENC_BSDMA_SET2>,
>> -				 <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
>> -				 <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
>> -				 <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
>> -				 <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
>> -				 <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
>> -				 <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
>> +				 <&iommu M4U_PORT_VENC_NBM_WDMA>;
>>  			mediatek,vpu = <&vpu>;
>> -			clocks = <&topckgen CLK_TOP_VENCPLL_D2>,
>> -				 <&topckgen CLK_TOP_VENC_SEL>,
>> -				 <&topckgen CLK_TOP_UNIVPLL1_D2>,
>> -				 <&topckgen CLK_TOP_VENC_LT_SEL>;
>> -			clock-names = "venc_sel_src",
>> -				      "venc_sel",
>> -				      "venc_lt_sel_src",
>> -				      "venc_lt_sel";
>> -			assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>,
>> -					  <&topckgen CLK_TOP_VENC_LT_SEL>;
>> -			assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>,
>> -						 <&topckgen CLK_TOP_VCODECPLL_370P5>;
>> +			clocks = <&topckgen CLK_TOP_VENC_SEL>;
>> +			clock-names = "venc_sel";
>> +			assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
>> +			assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
>>  		};
>>  
>>  		jpegdec: jpegdec@18004000 {
>> @@ -1530,5 +1510,27 @@
>>  				 <&vencltsys CLK_VENCLT_CKE0>;
>>  			clock-names = "apb", "smi";
>>  		};
>> +
>> +		vcodec_enc_vp8: vcodec@19002000 {
>> +			compatible = "mediatek,mt8173-vcodec-enc-vp8";
>> +			reg =  <0 0x19002000 0 0x1000>; /* VENC_LT_SYS */
>> +			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
>> +			iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
>> +				 <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
>> +				 <&iommu M4U_PORT_VENC_BSDMA_SET2>,
>> +				 <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
>> +				 <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
>> +				 <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
>> +				 <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
>> +				 <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
>> +				 <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
>> +			mediatek,larb = <&larb5>;
>> +			mediatek,vpu = <&vpu>;
>> +			clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
>> +			clock-names = "venc_lt_sel";
>> +			assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
>> +			assigned-clock-parents =
>> +				 <&topckgen CLK_TOP_VCODECPLL_370P5>;
>> +		};
>>  	};
>>  };
>>
> 
