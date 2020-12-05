Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0502CFE02
	for <lists+linux-media@lfdr.de>; Sat,  5 Dec 2020 20:12:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgLES4w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Dec 2020 13:56:52 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44710 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgLES4u (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Dec 2020 13:56:50 -0500
Received: by mail-oi1-f195.google.com with SMTP id y74so10352050oia.11;
        Sat, 05 Dec 2020 10:56:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QQtR4knxF9KByD/iY44zLsA9by1I5dlTuq9qeppHzvY=;
        b=iVxwVIxKld1QCWGWkC2ZVDV4C7QNrkgiU38xmPnpme8pnBUHiqbmLf1hDAiwmas7Gh
         0qtZFdpTwXiQgcSk+xqc8DOUzEUWzCD6GyEX61FvgB6E+2VH3+4EbJZrxqsVq3vGsbCe
         +lRLESJAf9fQz2Oazbze97F/ADnLTay3fncdT1Mw22ddRIN/QJdeGAvOVwU7Yzh+h+XL
         1D1kBXcEENOyzDY1e3UZ85NUyPQ2pa3zPNJQ/1juDyFrr1I8JSFMrsfQm1Iq5dXgwqQQ
         dZaQm7k5M4gXStozxblyE5u/xIhtWhDxaM0sIUml4H7Ubuf89FBxbyYwlvum//d9XDCl
         4pJQ==
X-Gm-Message-State: AOAM533xReTVfBRPjBD/bs8a2k8kwCpd1GCJyjPdCZ7ayXtnYbF2UOBq
        kLHpeb0h+M0VEd5ZFUqySsbciY7LKXM45g/7WwM=
X-Google-Smtp-Source: ABdhPJzdYo86jSPqFfWWPZ+5RBOxy73Z1igjnd4bfIsRT2BWRV1LO6NsOIadR4OC07uZKTBKNm5m95Kc4MdxoBsSoUw=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr7227622oih.153.1607194569232;
 Sat, 05 Dec 2020 10:56:09 -0800 (PST)
MIME-Version: 1.0
References: <20201205183355.6488-1-michael.srba@seznam.cz> <20201205183355.6488-3-michael.srba@seznam.cz>
In-Reply-To: <20201205183355.6488-3-michael.srba@seznam.cz>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 5 Dec 2020 19:55:58 +0100
Message-ID: <CAMuHMdXO4p_uckdA=hysACxgJqdM=tL0MMz95N=F3_Wa=3XV+w@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: update device trees to specify
 clock-frequency in imx219 node
To:     michael.srba@seznam.cz
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Sat, Dec 5, 2020 at 7:36 PM <michael.srba@seznam.cz> wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
>
> This patch adds the clock-frequency property to all device trees that use
> the imx219 binding, with the value of exactly 24Mhz which was previously
> implicitly assumed.
>
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
> @@ -82,6 +82,7 @@ imx219: imx219@10 {
>                 compatible = "sony,imx219";
>                 reg = <0x10>;
>                 clocks = <&osc25250_clk>;
> +               clock-frequency = <24000000>;
>                 VANA-supply = <&imx219_vana_2v8>;
>                 VDIG-supply = <&imx219_vdig_1v8>;
>                 VDDL-supply = <&imx219_vddl_1v2>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
> index f0829e905506..db4b801b17b5 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
> @@ -59,6 +59,7 @@ &imx219 {
>         port {
>                 imx219_ep: endpoint {
>                         clock-lanes = <0>;
> +                       clock-frequency = <24000000>;

Why is this change needed? This is not the imx219 node, but its endpoint
subnode (the imx219 is imported from aistarvision-mipi-adapter-2.1.dtsi).

>                         data-lanes = <1 2>;
>                         link-frequencies = /bits/ 64 <456000000>;
>                         /* uncomment remote-endpoint property to tie imx219 to
-
Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
