Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 195112543C1
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 12:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728329AbgH0K3y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 06:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728172AbgH0K3v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 06:29:51 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF49C06121B
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 03:29:51 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id j18so4191771oig.5
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 03:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VqVqosFrIbjcMckf+U3+gM0HZKqC0WuU3mUX+w73JZU=;
        b=fKkwMSCT3+pj22gsTIywq7R4LB1He2LTSACwbCTdIGXidzMgQfHh+U6FSnM8xecppd
         QbXBqCxhAsd24Zw+4HglaCDRXu6RFTP2NAQgwkA/Ipe/S4qcfzbCDRpQJMhf3j420AC1
         7T9kCyCWVet5iClQ592TiqqC6sAFi5/3YYlm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VqVqosFrIbjcMckf+U3+gM0HZKqC0WuU3mUX+w73JZU=;
        b=Cz/AaliH8ZGBrd3S0Qz+I2C66aH7/mmjzDS4d8dVeIaK1cv9qzD/VrAN+EdXDMPKGm
         +VT8ogZXbtAQ2YpNV2ZhE+HUtra9S1EbnJ9J3Y2RxPDTCXRc04Cqx/K+cqfML93tpzZ/
         YX6g0aTFT7JaiOI73ykni4RVSzUOg5jEDjTYbeXZrSzHfkIMVJjw2No4fMj7nmE8ngqo
         Xs3KWtHxkdgq6AKV05KoJC1VgxDR5tNcv9lmQ4cfef5N4/5cZ4I0g9XsIlTJ33/0SlL0
         lFNRabMapDBib9WtptF8FPNUvqB0FSQhd7xlR2yhA2AlDAe0Kc14UOl8S3QDRDyNmsw/
         ss/Q==
X-Gm-Message-State: AOAM531HRQqwgYtfVcZCZOXLh5iolWjVYrX/Y0YBQG7wxQIRWrY1nWT5
        wm2xXk5HO6P/fsszt1KQ1yMAhrDoe21KoA==
X-Google-Smtp-Source: ABdhPJy+gR+Lh3KRglVoCyL/qw79Mb9/FkFZ94Lzc6HXyQ2PVipoYlO4CEfmK9nog/m07QUbix7hTA==
X-Received: by 2002:a54:4117:: with SMTP id l23mr6708382oic.177.1598524189606;
        Thu, 27 Aug 2020 03:29:49 -0700 (PDT)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com. [209.85.210.44])
        by smtp.gmail.com with ESMTPSA id g34sm367767ooi.31.2020.08.27.03.29.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2020 03:29:48 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id k2so3986513ots.4
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 03:29:48 -0700 (PDT)
X-Received: by 2002:a9d:5f0c:: with SMTP id f12mr12086496oti.141.1598524187719;
 Thu, 27 Aug 2020 03:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200821103608.2310097-1-acourbot@chromium.org>
 <20200821103608.2310097-10-acourbot@chromium.org> <02eaeace-22dd-02ea-7162-90200fe1cffe@gmail.com>
 <CAPBb6MWZRKpg-rs7X_j3tqqsYHy=NkEMN1NdZwPS9zo-0whTJw@mail.gmail.com> <184d895c-239e-3f23-970e-6a9563235cd9@gmail.com>
In-Reply-To: <184d895c-239e-3f23-970e-6a9563235cd9@gmail.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 27 Aug 2020 19:29:35 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXrUNqWr=3KBPbJkXGmz=gL0aq_QuUQ5u_crR3yyDBvpw@mail.gmail.com>
Message-ID: <CAPBb6MXrUNqWr=3KBPbJkXGmz=gL0aq_QuUQ5u_crR3yyDBvpw@mail.gmail.com>
Subject: Re: [PATCH v4 09/17] arm64: dts: mt8183: add encoder node
To:     Matthias Brugger <matthias.bgg@gmail.com>
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Matthias,

On Thu, Aug 27, 2020 at 7:23 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
> Hi Alexandre,
>
> On 27/08/2020 12:10, Alexandre Courbot wrote:
> > On Thu, Aug 27, 2020 at 7:03 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> >>
> >>
> >>
> >> On 21/08/2020 12:36, Alexandre Courbot wrote:
> >>> Now that the MT8183 encoder driver is ready, add its DT node. Also pull
> >>> the iommu and scp ones, which the encoder depends upon.
> >>
> >> Please don't do that. Instead of pulling in other DT nodes, it would be handy to
> >> get a reference of the series this is based on.
> >>
> >> Let me try to hunt them down now :)
> >
> > Sorry, I'm not sure to understand - do you mean each node should come
> > with its own patch? Or that all the code should be merged before
> > sending these nodes? The rest of this series should land into the
> > media tree soon, if you prefer I can resend this patch separately once
> > that happens.
> >
>
> What I'm talking about is the case when you send a series that's based on
> another one and the latter is not yet accepted in Torvalds tree. In that case it
> helps to point to the series you expect to be included as well.
>
> In this case the SCP series was merged long time ago, but I missed the DTS
> change. It would have been good if you would have added that information in your
> series, instead of directly pulling in the SCP node.

Sorry about that, actually I was not even aware of this patch (or
maybe I just forgot about it due to its date).

>
> For the iommu node: I understand that there was never a patch adding the node
> (at least I wasn't able to find one). So I'd prefer to have it send as a
> separate patch of this series.
>
> Regarding this series now. If you want just resend the two DTS patches (iommu
> and vcodec_enc) once the rest of this series got accpeted. If for any other
> reason you have to send a v5, then feel free to include both in v5.

Absolutely. I will wait until the patches land into the media tree and
send you two DT-only patches.

Thanks for the explanation!

>
> Hope I explained myself now :)
>
> Regards,
> Matthias
>
> >>
> >> Regards,
> >> Matthias
> >>
> >>>
> >>> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> >>> ---
> >>>    arch/arm64/boot/dts/mediatek/mt8183-evb.dts   | 10 ++++++
> >>>    .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 12 +++++++
> >>>    arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 36 +++++++++++++++++++
> >>>    3 files changed, 58 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> >>> index ae405bd8f06b..9e77b420eee8 100644
> >>> --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> >>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> >>> @@ -25,6 +25,16 @@ memory@40000000 {
> >>>        chosen {
> >>>                stdout-path = "serial0:921600n8";
> >>>        };
> >>> +     reserved-memory {
> >>> +             #address-cells = <2>;
> >>> +             #size-cells = <2>;
> >>> +             ranges;
> >>> +             scp_mem_reserved: scp_mem_region {
> >>> +                     compatible = "shared-dma-pool";
> >>> +                     reg = <0 0x50000000 0 0x2900000>;
> >>> +                     no-map;
> >>> +             };
> >>> +     };
> >>>    };
> >>>
> >>>    &auxadc {
> >>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> >>> index f0a070535b34..3c763be658da 100644
> >>> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> >>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> >>> @@ -90,6 +90,18 @@ pp3300_alw: regulator6 {
> >>>                regulator-max-microvolt = <3300000>;
> >>>        };
> >>>
> >>> +     reserved_memory: reserved-memory {
> >>> +             #address-cells = <2>;
> >>> +             #size-cells = <2>;
> >>> +             ranges;
> >>> +
> >>> +             scp_mem_reserved: scp_mem_region {
> >>> +                     compatible = "shared-dma-pool";
> >>> +                     reg = <0 0x50000000 0 0x2900000>;
> >>> +                     no-map;
> >>> +             };
> >>> +     };
> >>> +
> >>>        max98357a: codec0 {
> >>>                compatible = "maxim,max98357a";
> >>>                sdmode-gpios = <&pio 175 0>;
> >>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> >>> index 102105871db2..8f77eea6df27 100644
> >>> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> >>> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> >>> @@ -8,6 +8,7 @@
> >>>    #include <dt-bindings/clock/mt8183-clk.h>
> >>>    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>>    #include <dt-bindings/interrupt-controller/irq.h>
> >>> +#include <dt-bindings/memory/mt8183-larb-port.h>
> >>>    #include <dt-bindings/reset-controller/mt8183-resets.h>
> >>>    #include <dt-bindings/phy/phy.h>
> >>>    #include "mt8183-pinfunc.h"
> >>> @@ -339,6 +340,25 @@ pwrap: pwrap@1000d000 {
> >>>                        clock-names = "spi", "wrap";
> >>>                };
> >>>
> >>> +             iommu: iommu@10205000 {
> >>> +                     compatible = "mediatek,mt8183-m4u";
> >>> +                     reg = <0 0x10205000 0 0x1000>;
> >>> +                     interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_LOW>;
> >>> +                     #iommu-cells = <1>;
> >>> +             };
> >>> +
> >>> +             scp: scp@10500000 {
> >>> +                     compatible = "mediatek,mt8183-scp";
> >>> +                     reg = <0 0x10500000 0 0x80000>,
> >>> +                           <0 0x105c0000 0 0x19080>;
> >>> +                     reg-names = "sram", "cfg";
> >>> +                     interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> >>> +                     clocks = <&infracfg CLK_INFRA_SCPSYS>;
> >>> +                     clock-names = "main";
> >>> +                     memory-region = <&scp_mem_reserved>;
> >>> +                     status = "disabled";
> >>> +             };
> >>> +
> >>>                systimer: timer@10017000 {
> >>>                        compatible = "mediatek,mt8183-timer",
> >>>                                     "mediatek,mt6765-timer";
> >>> @@ -772,6 +792,22 @@ vencsys: syscon@17000000 {
> >>>                        #clock-cells = <1>;
> >>>                };
> >>>
> >>> +             vcodec_enc: vcodec@17020000 {
> >>> +                     compatible = "mediatek,mt8183-vcodec-enc";
> >>> +                     reg = <0 0x17020000 0 0x1000>;
> >>> +                     interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_LOW>;
> >>> +                     iommus = <&iommu M4U_PORT_VENC_REC>,
> >>> +                              <&iommu M4U_PORT_VENC_BSDMA>,
> >>> +                              <&iommu M4U_PORT_VENC_RD_COMV>,
> >>> +                              <&iommu M4U_PORT_VENC_CUR_LUMA>,
> >>> +                              <&iommu M4U_PORT_VENC_CUR_CHROMA>,
> >>> +                              <&iommu M4U_PORT_VENC_REF_LUMA>,
> >>> +                              <&iommu M4U_PORT_VENC_REF_CHROMA>;
> >>> +                     mediatek,scp = <&scp>;
> >>> +                     clocks = <&vencsys CLK_VENC_VENC>;
> >>> +                     clock-names = "MT_CG_VENC";
> >>> +             };
> >>> +
> >>>                ipu_conn: syscon@19000000 {
> >>>                        compatible = "mediatek,mt8183-ipu_conn", "syscon";
> >>>                        reg = <0 0x19000000 0 0x1000>;
> >>>
