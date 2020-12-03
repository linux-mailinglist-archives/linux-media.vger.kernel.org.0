Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C19D22CDB7D
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 17:46:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387464AbgLCQpT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 11:45:19 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34711 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbgLCQpS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 11:45:18 -0500
Received: by mail-lf1-f66.google.com with SMTP id d8so3699101lfa.1;
        Thu, 03 Dec 2020 08:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gSKKMnPPwvy/Gv2/NSqLNOEr9O1XfSpR38BNRVeZqQg=;
        b=R0NXaKKjBgzfvPUAvoKQUtO9dwisLyKf8qNq09HHDDiFpEYrmNQalQfuczPaAOvGE9
         mkgR2+JIo3AyOcH8Y9C16lH90ggUnQEzzpCOYB5lQK8fp19VupQAD4ryLTcL6SZ3uP0E
         idab8U92HewBr9PMqqfdX/l6dAstb1fBCav1FwvC34iQz/Vgu+aQ854Y7T9G7M0p14+b
         Sc2ZaTiSQlAkEmm+c7MzeI3WJjFngDe2VXKTcud3BWK7db+n+mGwbjXhc3x2qC60Uv78
         zE+22MWtP+/psNFIm8ZaNCDvvFtIXBIyvOUkG8POFVNQRRzR3tNun7n1QZS05yE1BiOG
         fncg==
X-Gm-Message-State: AOAM5305huPCP4Rw0yM60r3IcIf1io9NMmd8Y03pi6VDHIGPNHOXgjol
        bwPIvG4jyGqdEZM3/RI2MTphgJxMM/5Ziw==
X-Google-Smtp-Source: ABdhPJwxE4X/64DjbH+i3bspzyYxKRpi4Bx7iIvDgyyI1tP69HuTvmqBmdQZ6oWcs9ojvJy0Q9ADnQ==
X-Received: by 2002:a19:348:: with SMTP id 69mr1681889lfd.152.1607013876478;
        Thu, 03 Dec 2020 08:44:36 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id d3sm689509lfj.206.2020.12.03.08.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Dec 2020 08:44:35 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id f24so3208807ljk.13;
        Thu, 03 Dec 2020 08:44:34 -0800 (PST)
X-Received: by 2002:a2e:85ce:: with SMTP id h14mr1596115ljj.190.1607013874724;
 Thu, 03 Dec 2020 08:44:34 -0800 (PST)
MIME-Version: 1.0
References: <20201116125617.7597-1-m.cerveny@computer.org> <20201116125617.7597-4-m.cerveny@computer.org>
 <CAGb2v66T9aakxRQNBbA+=EC-d5EpmUrZSK5xTW=orK6Z7PyG9Q@mail.gmail.com> <alpine.GSO.2.00.2012031617500.7044@dmz.c-home.cz>
In-Reply-To: <alpine.GSO.2.00.2012031617500.7044@dmz.c-home.cz>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Fri, 4 Dec 2020 00:44:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v65Kb1BrdwKjMv9w1CNQpe=ExpN1d-yUSvZ6TA=fvgE5og@mail.gmail.com>
Message-ID: <CAGb2v65Kb1BrdwKjMv9w1CNQpe=ExpN1d-yUSvZ6TA=fvgE5og@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] ARM: dts: sun8i: v3s: Add node for system control
To:     Martin Cerveny <M.Cerveny@computer.org>
Cc:     Maxime Ripard <mripard@kernel.org>, devel@driverdev.osuosl.org,
        devicetree <devicetree@vger.kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mark Brown <broonie@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 4, 2020 at 12:25 AM Martin Cerveny <martin@c-home.cz> wrote:
>
> Hello.
>
> On Thu, 3 Dec 2020, Chen-Yu Tsai wrote:
>
> > Hi,
> >
> > On Mon, Nov 16, 2020 at 8:57 PM Martin Cerveny <m.cerveny@computer.org> wrote:
> >>
> >> Allwinner V3s has system control and SRAM C1 region similar to H3.
> >>
> >> Signed-off-by: Martin Cerveny <m.cerveny@computer.org>
> >> ---
> >>  arch/arm/boot/dts/sun8i-v3s.dtsi | 14 ++++++++++++++
> >>  1 file changed, 14 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
> >> index 0c7341676921..70193512c222 100644
> >> --- a/arch/arm/boot/dts/sun8i-v3s.dtsi
> >> +++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
> >> @@ -161,6 +161,20 @@ syscon: system-control@1c00000 {
> >>                         #address-cells = <1>;
> >>                         #size-cells = <1>;
> >>                         ranges;
> >> +
> >> +                       sram_c: sram@1d00000 {
> >> +                               compatible = "mmio-sram";
> >> +                               reg = <0x01d00000 0x80000>;
> >
> > How was this address derived? Did you check that there is actually SRAM here?
>
> Yes, I did some checking (mmap). But I repeated measurement and found
> mirrored regions:
>
> - SRAM_C is mirrored from 0x0000_4000 (primary location) to 0x01d0_4000 (size 0xb000)
>    (probably exact size is 0xb0c0)
> - rest of 0x01d0_0000 are discontinuously filled with R/W register sets
>    (probably some internals registers from VE) that I thought to be SRAM too
> - register SRAM_CTRL_REG0==0x01c00_0000 (value 0x7fff_ffff) switch whole
>    region 0x01d0_0000-0x01df_ffff __AND__ 0x0000_4000-0x0000_ffff
> - VE/cedrus code use this regions indirectly
>    (VE_AVC_SRAM_PORT_OFFSET/VE_AVC_SRAM_PORT_DATA...)
>    and it is not influenced by "true" SRAM mapping or size

Could you add this to your commit log? That would make the information
available to others, and you could mention that you only added the
location that is contiguous SRAM without the interspersed registers.

So based on this, and what we've seen with the H616, I'm guessing
0x01d0_0000 - 0x01df_ffff exposes all the internal guts of the VE,
while SRAM C @ 0x4000 just maps a small portion out.

> -> so I suppose to better use only SRAM_C lower definition:

Yes that would be more appropriate, as it matches the manual, and as you
mentioned, is *real* SRAM.

> ---
> diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
> index e8f304125e2d..90d703e5b73b 100644
> --- a/arch/arm/boot/dts/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
> @@ -162,17 +162,17 @@ syscon: system-control@1c00000 {
>                         #size-cells = <1>;
>                         ranges;
>
> -                       sram_c: sram@1d00000 {
> +                       sram_c: sram@4000 {
>                                 compatible = "mmio-sram";
> -                               reg = <0x01d00000 0x80000>;
> +                               reg = <0x4000 0xb000>;
>                                 #address-cells = <1>;
>                                 #size-cells = <1>;
> -                               ranges = <0 0x01d00000 0x80000>;
> +                               ranges = <0 0 0x4000 0xb000>;
>
>                                 ve_sram: sram-section@0 {
>                                         compatible = "allwinner,sun8i-v3s-sram-c1",
>                                                      "allwinner,sun4i-a10-sram-c1";
> -                                       reg = <0x000000 0x80000>;
> +                                       reg = <0x0 0xb000>;
>                                 };
>                         };
>                 };
> ---
>
> Does someone have accessible specific documentation of VE/cedrus for V3s ?

I doubt such information exists.


Regards
ChenYu

> Regards, Martin
>
> > ChenYu
> >
> >> +                               #address-cells = <1>;
> >> +                               #size-cells = <1>;
> >> +                               ranges = <0 0x01d00000 0x80000>;
> >> +
> >> +                               ve_sram: sram-section@0 {
> >> +                                       compatible = "allwinner,sun8i-v3s-sram-c1",
> >> +                                                    "allwinner,sun4i-a10-sram-c1";
> >> +                                       reg = <0x000000 0x80000>;
> >> +                               };
> >> +                       };
> >>                 };
> >>
> >>                 tcon0: lcd-controller@1c0c000 {
> >> --
> >> 2.25.1
> >>
> >>
> >> _______________________________________________
> >> linux-arm-kernel mailing list
> >> linux-arm-kernel@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> >
