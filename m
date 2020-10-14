Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C166728E4D4
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 18:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388681AbgJNQup (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 12:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388548AbgJNQum (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 12:50:42 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD15CC061755
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2020 09:50:41 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id i5so168637edr.5
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2020 09:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wuBPfResUSYyKIfZ5ftJfMdcgNsOdysiwgfFsxwVLOk=;
        b=Up9k1hmuJ3kQYCc/XiiZHeN6dxC3+Bt4DXTUrZ0NInm0Fv3mzKgsGybP05RAJynIda
         wcRLSsd72x7Z10Br5P7MB+uj08NwnOnz4n+UuiHKT9qmbalwarQbSv1POTDEGTi+WWlQ
         Py4YTDI4zmSAjy6qGOi1NgBJDRqd+sy9wEldc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wuBPfResUSYyKIfZ5ftJfMdcgNsOdysiwgfFsxwVLOk=;
        b=rBZTm1O3Yi4ZPHKWeo7MNv5b0/DAGyRhzO4eVaLhT3e5QofaqYyxNtXf32Ht1GN+qw
         8eT+3l3ti1gsxkWWieGaaG8DJrIF41fgaZLJM2TZzwTKItamWIxA3pONVUAq9ZpohaJN
         qt8tC50FXU7IF6L32jLJWnD/nTz4L7/o+e1Ikc1txMv5RegZZKIsOzeGKept7DA21mGh
         7RU4ts4rGHEN1CqLgByiiIUpjQSL00FcJaBdMCuXdJ3w1v+IBJNV37kzk2haKGdwLjUC
         Q5Be3bgyE9lLMwtlkyWsmKVx+nu1WtVOx9ZkD3uVcIDlLo3eNvGT1cnyiklKsPv/NOKV
         v5nw==
X-Gm-Message-State: AOAM532MaLYvuicVsrtTSSNmOuyFCVLsDnjXzLwEqZtBXJxZu8Ul1jUM
        lXVHJoz90AgOUmp17GicIvWm+NL8yUVf8Q==
X-Google-Smtp-Source: ABdhPJxqJQz5rdQv5ln/BSYUPikjDR2tdy1Fr3Zff3w5QF1CnZfRGW/eFQsZhc+ZMiXA4D06kycomA==
X-Received: by 2002:a50:e8c9:: with SMTP id l9mr6504633edn.317.1602694240048;
        Wed, 14 Oct 2020 09:50:40 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id x2sm40879edr.65.2020.10.14.09.50.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 09:50:39 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id md26so5774432ejb.10
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2020 09:50:39 -0700 (PDT)
X-Received: by 2002:adf:f1cd:: with SMTP id z13mr6554663wro.197.1602693817757;
 Wed, 14 Oct 2020 09:43:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200722155533.252844-1-helen.koike@collabora.com>
 <20200722155533.252844-9-helen.koike@collabora.com> <20200926130005.GC3781977@chromium.org>
 <905118dd-f108-6bc0-4cf0-9544fab51690@collabora.com>
In-Reply-To: <905118dd-f108-6bc0-4cf0-9544fab51690@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 14 Oct 2020 18:43:25 +0200
X-Gmail-Original-Message-ID: <CAAFQd5C4BcXyee58DpL4TfVJmaLQ-58_mwQucEm-df899va2Lw@mail.gmail.com>
Message-ID: <CAAFQd5C4BcXyee58DpL4TfVJmaLQ-58_mwQucEm-df899va2Lw@mail.gmail.com>
Subject: Re: [PATCH v5 8/9] arm64: dts: rockchip: add isp0 node for rk3399
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-devicetree <devicetree@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devel@driverdev.osuosl.org, Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mark Rutland <mark.rutland@arm.com>, karthik.poduval@gmail.com,
        jbx6244@gmail.com, Eddie Cai <eddie.cai.linux@gmail.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 14, 2020 at 6:27 PM Helen Koike <helen.koike@collabora.com> wrote:
>
> Hi Tomasz,
>
> On 9/26/20 10:00 AM, Tomasz Figa wrote:
> > Hi Helen,
> >
> > On Wed, Jul 22, 2020 at 12:55:32PM -0300, Helen Koike wrote:
> >> From: Shunqian Zheng <zhengsq@rock-chips.com>
> >>
> >> RK3399 has two ISPs, but only isp0 was tested.
> >> Add isp0 node in rk3399 dtsi
> >>
> >> Verified with:
> >> make ARCH=arm64 dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> >>
> >> Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
> >> Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
> >> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> >>
> >> ---
> >>
> >> V4:
> >> - update clock names
> >>
> >> V3:
> >> - clean up clocks
> >>
> >> V2:
> >> - re-order power-domains property
> >>
> >> V1:
> >> This patch was originally part of this patchset:
> >>
> >>     https://patchwork.kernel.org/patch/10267431/
> >>
> >> The only difference is:
> >> - add phy properties
> >> - add ports
> >> ---
> >>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 25 ++++++++++++++++++++++++
> >>  1 file changed, 25 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> >> index dba9641947a3a..ed8ba75dbbce8 100644
> >> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> >> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> >> @@ -1721,6 +1721,31 @@ vopb_mmu: iommu@ff903f00 {
> >>              status = "disabled";
> >>      };
> >>
> >> +    isp0: isp0@ff910000 {
> >> +            compatible = "rockchip,rk3399-cif-isp";
> >> +            reg = <0x0 0xff910000 0x0 0x4000>;
> >> +            interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH 0>;
> >> +            clocks = <&cru SCLK_ISP0>,
> >> +                     <&cru ACLK_ISP0_WRAPPER>,
> >> +                     <&cru HCLK_ISP0_WRAPPER>;
> >> +            clock-names = "isp", "aclk", "hclk";
> >> +            iommus = <&isp0_mmu>;
> >> +            phys = <&mipi_dphy_rx0>;
> >> +            phy-names = "dphy";
> >> +            power-domains = <&power RK3399_PD_ISP0>;
> >
> > Should this have status = "disabled" too? The mipi_dphy_rx0 node is
> > disabled by default too, so in the default configuration the driver
> > would always fail to probe.
>
> I'm thinking what is the overall guideline here.
> Since isp and mipi_dphy are always present in the rk3399, shouldn't they always be enabled?
> Or since they are only useful if a sensor is present, we should let the dts of the board to
> enable it?

I don't have a strong opinion. I'm fine with enabling both by default
as well, as it shouldn't hurt.

That said, I recall some alternative CIF IP block being present on
this SoC as well (and patches posted recently), which AFAIR can't be
activated at the same time as the ISP, so perhaps both of the
alternatives should be disabled by default?

Best regards,
Tomasz
