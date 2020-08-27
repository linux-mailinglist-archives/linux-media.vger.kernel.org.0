Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65A992543A5
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 12:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728373AbgH0KXN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 06:23:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726938AbgH0KXM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 06:23:12 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05124C061264;
        Thu, 27 Aug 2020 03:23:12 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id o21so4624630wmc.0;
        Thu, 27 Aug 2020 03:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zSpMJELFSrYc8zHtKHbtKdtP/qKMyKq7CRfuycoBJuc=;
        b=mmQIllJ3TIVOxngFQAjmyon/FmWNIjtrOkvuCZETlEuUwN7/DokWUW1HP8vxeqWNCC
         8lS0u6EjhsIlb31rV9QOWhSz5nq65Kj7zWD4GQI3twwD3XZMlMRmv80rmFcBw/O58+ye
         SVZWohQaQKWVfmdi4ubz+BE84nRzwXHgkHyabgtcfM+6qxHCNilc6DK+CcTcur6URnmX
         WnEB/PMImDo+Vh2gOJOTmaREKZ5PB8ZUK0236qJVBoB01iTEj84YhaSO+D9Bm0fIRNo+
         2f8NatTX3uoSHaPHZqthsaq38HbjRmvnyo273iFyGDXtxoSkr3Dg1PMfXWZUkREfj1Xv
         afag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zSpMJELFSrYc8zHtKHbtKdtP/qKMyKq7CRfuycoBJuc=;
        b=VyAt8UFSLT7Bu5QVA4ZgFK0r0aLbymmgHuYSDN2zhK1uRRRiTdu5T6ZufrJXrThaJH
         EvtxXWW7yMzEYELmMeNTlmVkfkEP+IKvP0inaaZMLElYtrmD4rcAHFpIrSh2dORBVswT
         OT0vLIh5w+f/uRpn2kDFF46XV6BgNVdTa7EZmJiHucBicXc9Hjs88HJPATTxOGwS4bRl
         BOA1ovjHAUiWUbdXeF5nMgg2lK+H9omw/w1+0xDeEAd5Vbl2f4I7Kq34471AMZ9q//5K
         ri8bwSy+ZmdalRx76ThJZWdXuBQ8c8bHYaXVrwWfPCzz1ppchOusGQ7WC7WX3ityKaTG
         AK/Q==
X-Gm-Message-State: AOAM532oF8ai2pyUNhlOuAZapFKmANfJaS8bdDgh8wFmb875rjlbLa2E
        FZMiK9dwk1/tiEnf8WbCOrHEdk+HZQ29nw==
X-Google-Smtp-Source: ABdhPJxkhUUlXNeNhX7dt2O1ZPnSB3gR9fqJCDPTLQ9UZy7+biPGWzbLJ31liQVDQ52R4/+A0Tsfzg==
X-Received: by 2002:a05:600c:2283:: with SMTP id 3mr3866767wmf.37.1598523790404;
        Thu, 27 Aug 2020 03:23:10 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.187])
        by smtp.gmail.com with ESMTPSA id g8sm4439367wme.13.2020.08.27.03.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2020 03:23:09 -0700 (PDT)
Subject: Re: [PATCH v4 09/17] arm64: dts: mt8183: add encoder node
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
 <20200821103608.2310097-10-acourbot@chromium.org>
 <02eaeace-22dd-02ea-7162-90200fe1cffe@gmail.com>
 <CAPBb6MWZRKpg-rs7X_j3tqqsYHy=NkEMN1NdZwPS9zo-0whTJw@mail.gmail.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <184d895c-239e-3f23-970e-6a9563235cd9@gmail.com>
Date:   Thu, 27 Aug 2020 12:23:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAPBb6MWZRKpg-rs7X_j3tqqsYHy=NkEMN1NdZwPS9zo-0whTJw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexandre,

On 27/08/2020 12:10, Alexandre Courbot wrote:
> On Thu, Aug 27, 2020 at 7:03 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>>
>>
>>
>> On 21/08/2020 12:36, Alexandre Courbot wrote:
>>> Now that the MT8183 encoder driver is ready, add its DT node. Also pull
>>> the iommu and scp ones, which the encoder depends upon.
>>
>> Please don't do that. Instead of pulling in other DT nodes, it would be handy to
>> get a reference of the series this is based on.
>>
>> Let me try to hunt them down now :)
> 
> Sorry, I'm not sure to understand - do you mean each node should come
> with its own patch? Or that all the code should be merged before
> sending these nodes? The rest of this series should land into the
> media tree soon, if you prefer I can resend this patch separately once
> that happens.
> 

What I'm talking about is the case when you send a series that's based on 
another one and the latter is not yet accepted in Torvalds tree. In that case it 
helps to point to the series you expect to be included as well.

In this case the SCP series was merged long time ago, but I missed the DTS 
change. It would have been good if you would have added that information in your 
series, instead of directly pulling in the SCP node.

For the iommu node: I understand that there was never a patch adding the node 
(at least I wasn't able to find one). So I'd prefer to have it send as a 
separate patch of this series.

Regarding this series now. If you want just resend the two DTS patches (iommu 
and vcodec_enc) once the rest of this series got accpeted. If for any other 
reason you have to send a v5, then feel free to include both in v5.

Hope I explained myself now :)

Regards,
Matthias

>>
>> Regards,
>> Matthias
>>
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
>>> ---
>>>    arch/arm64/boot/dts/mediatek/mt8183-evb.dts   | 10 ++++++
>>>    .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 12 +++++++
>>>    arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 36 +++++++++++++++++++
>>>    3 files changed, 58 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
>>> index ae405bd8f06b..9e77b420eee8 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
>>> @@ -25,6 +25,16 @@ memory@40000000 {
>>>        chosen {
>>>                stdout-path = "serial0:921600n8";
>>>        };
>>> +     reserved-memory {
>>> +             #address-cells = <2>;
>>> +             #size-cells = <2>;
>>> +             ranges;
>>> +             scp_mem_reserved: scp_mem_region {
>>> +                     compatible = "shared-dma-pool";
>>> +                     reg = <0 0x50000000 0 0x2900000>;
>>> +                     no-map;
>>> +             };
>>> +     };
>>>    };
>>>
>>>    &auxadc {
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>>> index f0a070535b34..3c763be658da 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>>> @@ -90,6 +90,18 @@ pp3300_alw: regulator6 {
>>>                regulator-max-microvolt = <3300000>;
>>>        };
>>>
>>> +     reserved_memory: reserved-memory {
>>> +             #address-cells = <2>;
>>> +             #size-cells = <2>;
>>> +             ranges;
>>> +
>>> +             scp_mem_reserved: scp_mem_region {
>>> +                     compatible = "shared-dma-pool";
>>> +                     reg = <0 0x50000000 0 0x2900000>;
>>> +                     no-map;
>>> +             };
>>> +     };
>>> +
>>>        max98357a: codec0 {
>>>                compatible = "maxim,max98357a";
>>>                sdmode-gpios = <&pio 175 0>;
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>>> index 102105871db2..8f77eea6df27 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>>> @@ -8,6 +8,7 @@
>>>    #include <dt-bindings/clock/mt8183-clk.h>
>>>    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>    #include <dt-bindings/interrupt-controller/irq.h>
>>> +#include <dt-bindings/memory/mt8183-larb-port.h>
>>>    #include <dt-bindings/reset-controller/mt8183-resets.h>
>>>    #include <dt-bindings/phy/phy.h>
>>>    #include "mt8183-pinfunc.h"
>>> @@ -339,6 +340,25 @@ pwrap: pwrap@1000d000 {
>>>                        clock-names = "spi", "wrap";
>>>                };
>>>
>>> +             iommu: iommu@10205000 {
>>> +                     compatible = "mediatek,mt8183-m4u";
>>> +                     reg = <0 0x10205000 0 0x1000>;
>>> +                     interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_LOW>;
>>> +                     #iommu-cells = <1>;
>>> +             };
>>> +
>>> +             scp: scp@10500000 {
>>> +                     compatible = "mediatek,mt8183-scp";
>>> +                     reg = <0 0x10500000 0 0x80000>,
>>> +                           <0 0x105c0000 0 0x19080>;
>>> +                     reg-names = "sram", "cfg";
>>> +                     interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>>> +                     clocks = <&infracfg CLK_INFRA_SCPSYS>;
>>> +                     clock-names = "main";
>>> +                     memory-region = <&scp_mem_reserved>;
>>> +                     status = "disabled";
>>> +             };
>>> +
>>>                systimer: timer@10017000 {
>>>                        compatible = "mediatek,mt8183-timer",
>>>                                     "mediatek,mt6765-timer";
>>> @@ -772,6 +792,22 @@ vencsys: syscon@17000000 {
>>>                        #clock-cells = <1>;
>>>                };
>>>
>>> +             vcodec_enc: vcodec@17020000 {
>>> +                     compatible = "mediatek,mt8183-vcodec-enc";
>>> +                     reg = <0 0x17020000 0 0x1000>;
>>> +                     interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_LOW>;
>>> +                     iommus = <&iommu M4U_PORT_VENC_REC>,
>>> +                              <&iommu M4U_PORT_VENC_BSDMA>,
>>> +                              <&iommu M4U_PORT_VENC_RD_COMV>,
>>> +                              <&iommu M4U_PORT_VENC_CUR_LUMA>,
>>> +                              <&iommu M4U_PORT_VENC_CUR_CHROMA>,
>>> +                              <&iommu M4U_PORT_VENC_REF_LUMA>,
>>> +                              <&iommu M4U_PORT_VENC_REF_CHROMA>;
>>> +                     mediatek,scp = <&scp>;
>>> +                     clocks = <&vencsys CLK_VENC_VENC>;
>>> +                     clock-names = "MT_CG_VENC";
>>> +             };
>>> +
>>>                ipu_conn: syscon@19000000 {
>>>                        compatible = "mediatek,mt8183-ipu_conn", "syscon";
>>>                        reg = <0 0x19000000 0 0x1000>;
>>>
