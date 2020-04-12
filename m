Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15E0D1A5CE0
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2020 07:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbgDLFNk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Apr 2020 01:13:40 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:42477 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbgDLFNk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Apr 2020 01:13:40 -0400
Received: by mail-vs1-f66.google.com with SMTP id s10so3639790vsi.9
        for <linux-media@vger.kernel.org>; Sat, 11 Apr 2020 22:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VHkuUdeEPi0+7niwJqWPOkmkckN1u3oo2P+RqXA92Z4=;
        b=S0ht9WgHyybeoHczyRndT5jh05Ap75SOojZOmFx3ZB6Y7aPD9k8dd9d2RE4HkRm2xp
         6bF01bSfQzoj760rJ7oovF7F6sUJbWcP5ki8OHSINM7ILM2es9ZanVeEDTB3PhHPTEAk
         8c0c/p+TO4vx97LaxtVs8Or+AAsD4Gbao7dDtHuUsSzSd8GV77N06R1oLhcFjW9mgt67
         mTDGK3qvDHqdnFBM2lqT6JyaN6yv37AxHcKznIRpgSzjg1Wol6z8vgJ9GSHs6B95dh7C
         ckZ1zFiRz0vMQ+/c4QtD03Rjms67vqjlEFHLa8BUYT6dh3QV8p50CBBw6zkUV3jQ9D37
         EgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VHkuUdeEPi0+7niwJqWPOkmkckN1u3oo2P+RqXA92Z4=;
        b=AYRhsA3Y+nSXCwt+Qa92FAOsxWmkAXLNxoqCIPy2eZ9hy7Z2+tr4c0tfpM00giKtiZ
         V4xQ/5Qofzyo3IA9++n2XIDk48OmU2COteK3IQC4V6cxwRghN8S/k6tpFKsgoyoocPLC
         DuOVRCK4f9erXmbc/zwef2gKrFzRMwHWjWhwCQsQ03TzCcYpsn06YvkRQs6xp25+S7N9
         ZDjwT5q1dgcJtE60EwbvsH5yXwU4bYRh9cOVUJTkqVBso2MUr0NW9tU5C25i4uJb7WbU
         qN+o4ZnwVrY5pfXNAEjevm8jVLAarL7/QIwbT8VmpmwusA6VqaGa7e3loKeLVKoC6ZWo
         CAQg==
X-Gm-Message-State: AGi0PuYeV2yzv1zsqkFA+2sQayibCqkRAzr4+AxxQK8rR2qfJcYGltgB
        o57U8Z/CaxdCDTL4yEmd4aIUD9LQ8t88xUGvJ5E=
X-Google-Smtp-Source: APiQypJG91PocYX9obWM0xAdPvZfUC/7YkwZVrJTKzgFswLe0ctNgp5R78tGbaEUcoSRSdCBWRRkWOzEfLjzu0OJlSM=
X-Received: by 2002:a05:6102:31b7:: with SMTP id d23mr8254971vsh.25.1586668418542;
 Sat, 11 Apr 2020 22:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <karthik.poduval@gmail.com> <20200406073017.19462-1-karthik.poduval@gmail.com>
 <20200406073017.19462-4-karthik.poduval@gmail.com> <2fc95890-f938-30a5-a163-bf3fa2e223df@gmail.com>
In-Reply-To: <2fc95890-f938-30a5-a163-bf3fa2e223df@gmail.com>
From:   karthik poduval <karthik.poduval@gmail.com>
Date:   Sat, 11 Apr 2020 22:13:27 -0700
Message-ID: <CAFP0Ok-NxDDF8TMP4pN=xn6w3H=TYqN3DMfGW-vuiC5qB-Oj5g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: rockchip: add rk3288 ISP and DPHY
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        heiko@sntech.de, linux-rockchip@lists.infradead.org,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Johan for your valuable comments.

On Wed, Apr 8, 2020 at 6:19 PM Johan Jonker <jbx6244@gmail.com> wrote:
>
> Hi Karthik and others,
>
> Include all mail lists found with:
> ./scripts/get_maintainer.pl --nogit-fallback --nogit
>
> Helen is moving isp1 bindings out of staging.
> Clocks and other things don't fit with her patch serie.
> Maybe fix this while still in staging?
>
> arch/arm/boot/dts/rk3288-tinker.dt.yaml: isp@ff910000:
> 'phys' is a required property
> arch/arm/boot/dts/rk3288-tinker.dt.yaml: isp@ff910000:
> 'phy-names' is a required property
> arch/arm/boot/dts/rk3288-tinker.dt.yaml: isp@ff910000:
> 'ports' is a required property
>
> arch/arm/boot/dts/rk3288-tinker.dt.yaml: isp@ff910000:
> 'assigned-clock-rates', 'assigned-clocks'
> do not match any of the regexes: 'pinctrl-[0-9]+'
> arch/arm/boot/dts/rk3288-tinker.dt.yaml: isp@ff910000:
> clock-names:2: 'aclk_isp_wrap' was expected
> arch/arm/boot/dts/rk3288-tinker.dt.yaml: isp@ff910000:
> clock-names:3: 'hclk_isp' was expected
> arch/arm/boot/dts/rk3288-tinker.dt.yaml: isp@ff910000:
> clock-names:4: 'hclk_isp_wrap' was expected
>
> arch/arm/boot/dts/rk3288-tinker.dt.yaml: mipi-phy-rx0: 'power-domains'
> is a required property
>
> arch/arm/boot/dts/rk3288-tinker.dt.yaml: mipi-phy-rx0: clock-names:1:
> 'dphy-cfg' was expected
> arch/arm/boot/dts/rk3288-tinker.dt.yaml: mipi-phy-rx0: clock-names:
> ['dphy-ref', 'pclk'] is too short
> arch/arm/boot/dts/rk3288-tinker.dt.yaml: mipi-phy-rx0: clocks: [[7,
> 126], [7, 358]] is too short
>
>
> Inside yaml:
> Use enum and sort.
> >>  properties:
> >>    compatible:
>
> >>      const: rockchip,rk3399-cif-isp
> >> +    const: rockchip,rk3288-rkisp1
>
>     enum:
>       - rockchip,rk3288-rkisp1
>       - rockchip,rk3399-cif-isp
>
> >>  properties:
> >>    compatible:
> >>      const: rockchip,rk3399-mipi-dphy-rx0
> >> +    const: rockchip,rk3288-mipi-dphy-rx0
>
>     enum:
>       - rockchip,rk3288-mipi-dphy-rx0
>       - rockchip,rk3399-mipi-dphy-rx0
>
> >
> > Please, keep consistency, or rk3288-cif-isp, or we change rk3399-cif-isp to be rk3399-rkisp1.
>
>
> On 4/6/20 9:30 AM, Karthik Poduval wrote:
> > ISP and DPHY device entries missing so add them.
> >
>
> > tested on tinkerbaord with ov5647 using command
> > cam -c 1 -C -F cap
>
> Disclose dts node for ov5647 in cover letter, so people can reproduce
> this experiment.
>
> Caution!
> Without dts node this command doesn't work correct.
>
> make ARCH=arm dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-isp1.yaml
>
> make ARCH=arm dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
>
> Needed to detect missing: phys, phy-names and ports ,etc.
>
> &isp {
>         status = "okay";
> };
>
Makes sense, that's why my kernel compilation passed and I didn't
these errors. Thanks for the command, I will verify dts for
correctness in next patch series.

> Needed to detect missing: power-domains, etc.
>
> &mipi_phy_rx0 {
>         status = "okay";
> };
>
> >
> > Reported-by: Karthik Poduval <karthik.poduval@gmail.com>
> > Signed-off-by: Karthik Poduval <karthik.poduval@gmail.com>
> > ---
> >  arch/arm/boot/dts/rk3288.dtsi | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> > index 9beb662166aa..adea8189abd9 100644
> > --- a/arch/arm/boot/dts/rk3288.dtsi
> > +++ b/arch/arm/boot/dts/rk3288.dtsi
> > @@ -247,6 +247,23 @@
> >               ports = <&vopl_out>, <&vopb_out>;
> >       };
> >
>
> > +     isp: isp@ff910000 {
>
> For nodes:
> Sort things without reg alphabetical first,
> then sort the rest by reg address.
>
Sure
> > +             compatible = "rockchip,rk3288-rkisp1";
> > +             reg = <0x0 0xff910000 0x0 0x4000>;
> > +             interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> > +             clocks = <&cru SCLK_ISP>, <&cru ACLK_ISP>,
> > +                      <&cru HCLK_ISP>, <&cru PCLK_ISP_IN>,
> > +                      <&cru SCLK_ISP_JPE>;
> > +             clock-names = "clk_isp", "aclk_isp",
> > +                           "hclk_isp", "pclk_isp_in",
> > +                           "sclk_isp_jpe";
> > +             assigned-clocks = <&cru SCLK_ISP>, <&cru SCLK_ISP_JPE>;
> > +             assigned-clock-rates = <400000000>, <400000000>;
>
> > +             power-domains = <&power RK3288_PD_VIO>;
> > +             iommus = <&isp_mmu>;
>
> sort
>
> Something missing?
> Where are the ports and port nodes?

I was assuming that this would be a part of the board specific dtsi or
dts entry where the isp node would be overriden and the i2c camera
port
and the isp port remote-endpoints would be connected. I had this as a
part of my first patch series. However I was advised by Helen to not
include the ov5647
dtsi as it isn't hardwired to the SoC and resides on an camera adapter board.

Should this be defined without the remote-endpoint phandle since we
don't know exactly which sensor gets connected in this dtsi file ?

>
> > +             status = "disabled";
> > +     };
> > +
> >       sdmmc: mmc@ff0c0000 {
> >               compatible = "rockchip,rk3288-dw-mshc";
> >               max-frequency = <150000000>;
> > @@ -891,6 +908,14 @@
> >                       status = "disabled";
> >               };
> >
>
> > +             mipi_phy_rx0: mipi-phy-rx0 {
>
> Use separate patch.
>
> For nodes:
> Sort things without reg alphabetical first,
> then sort the rest by reg address.
>
Sure

> > +                     compatible = "rockchip,rk3288-mipi-dphy-rx0";
> > +                     clocks = <&cru SCLK_MIPIDSI_24M>, <&cru PCLK_MIPI_CSI>;
> > +                     clock-names = "dphy-ref", "pclk";
> Something missing?
> Does this phy have a power domain?
The tinkerboard debian kernel (where I referred to for this patch)
didn't have it defined for the DPHY. I would guess that it would be
the same as the ISP i.e. RK3288_PD_VIO,
does anyone know the answer to this or do I have to reach out to
Rockchip engineering ?
>
> > +                     #phy-cells = <0>;
> > +                     status = "disabled";
> > +             };
> > +
> >               io_domains: io-domains {
> >                       compatible = "rockchip,rk3288-io-voltage-domain";
> >                       status = "disabled";
> >
>


-- 
Regards,
Karthik Poduval
