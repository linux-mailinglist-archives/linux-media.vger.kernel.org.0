Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55A8012076E
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 14:44:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbfLPNmp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 08:42:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:48336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727834AbfLPNmp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 08:42:45 -0500
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 17008206A5;
        Mon, 16 Dec 2019 13:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576503764;
        bh=0v1JfGDc126fBItXKyc4ZIJSHxrFHERbL9A2i0S0nOw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ruVVJXDbduFLcwmSg679iQNeoDdg2lFWVI2v2BkPye/QTPMzJtCbNQkVk3HdtCzPL
         vIiVV5+GGHi5bfDHgRz48mDmGjUs3RWbjuphkSYfuT5JxVD5AGMfaCaPQ6crSKK8AE
         62YZgGLK9jZFrziJ90Rr9otNwUAt5e96ZzUklCbo=
Received: by mail-wr1-f48.google.com with SMTP id c14so7319027wrn.7;
        Mon, 16 Dec 2019 05:42:44 -0800 (PST)
X-Gm-Message-State: APjAAAWsLxbqC14UVWQuMgu0FjBjhzC6g4pZQ71b46AkAqZWXv72Ct2J
        XaTgpMVryadG39CbgowZSDxA7DoenaqKrFrk14k=
X-Google-Smtp-Source: APXvYqxPODUBwPoRDFD7zdAeQAap8dbisfaU0qDmq581xzIb9kxHBDLrHbRDpofwtqywSNRWgqebLus37HOu3FGBw5s=
X-Received: by 2002:a5d:6b88:: with SMTP id n8mr31556564wrx.288.1576503762492;
 Mon, 16 Dec 2019 05:42:42 -0800 (PST)
MIME-Version: 1.0
References: <20191215165924.28314-1-wens@kernel.org> <20191215165924.28314-12-wens@kernel.org>
 <20191216133931.wliwn5woy3hstdg3@gilmour.lan>
In-Reply-To: <20191216133931.wliwn5woy3hstdg3@gilmour.lan>
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Mon, 16 Dec 2019 21:42:30 +0800
X-Gmail-Original-Message-ID: <CAGb2v64=p7RX_visHWawAFfPr8=ZDH4JqsoK__xnHKo6s3QOwg@mail.gmail.com>
Message-ID: <CAGb2v64=p7RX_visHWawAFfPr8=ZDH4JqsoK__xnHKo6s3QOwg@mail.gmail.com>
Subject: Re: [PATCH 11/14] ARM: dts: sun8i: r40: Add device node for CSI0
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Chen-Yu Tsai <wens@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 16, 2019 at 9:39 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> On Mon, Dec 16, 2019 at 12:59:21AM +0800, Chen-Yu Tsai wrote:
> > From: Chen-Yu Tsai <wens@csie.org>
> >
> > The CSI0 and CSI1 blocks are the same as found on the A20. However only
> > CSI0 is supported upstream right now.
> >
> > Add a device node for CSI0 using the A20 compatible as a fallback, and
> > the standard pinctrl options. Also add the MBUS interconnect.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > ---
> >  arch/arm/boot/dts/sun8i-r40.dtsi | 36 ++++++++++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
> > index 82ea0b5b0710..2d1e97cc4155 100644
> > --- a/arch/arm/boot/dts/sun8i-r40.dtsi
> > +++ b/arch/arm/boot/dts/sun8i-r40.dtsi
> > @@ -180,6 +180,20 @@ nmi_intc: interrupt-controller@1c00030 {
> >                       interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> >               };
> >
> > +             csi0: csi@1c09000 {
> > +                     compatible = "allwinner,sun8i-r40-csi0",
> > +                                  "allwinner,sun7i-a20-csi0";
> > +                     reg = <0x01c09000 0x1000>;
> > +                     interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks = <&ccu CLK_BUS_CSI0>, <&ccu CLK_CSI_SCLK>,
> > +                              <&ccu CLK_DRAM_CSI0>;
> > +                     clock-names = "bus", "isp", "ram";
> > +                     resets = <&ccu RST_BUS_CSI0>;
> > +                     interconnects = <&mbus 5>;
> > +                     interconnect-names = "dma-mem";
> > +                     status = "disabled";
> > +             };
> > +
> >               mmc0: mmc@1c0f000 {
> >                       compatible = "allwinner,sun8i-r40-mmc",
> >                                    "allwinner,sun50i-a64-mmc";
> > @@ -355,6 +369,20 @@ clk_out_a_pin: clk-out-a-pin {
> >                               function = "clk_out_a";
> >                       };
> >
> > +                     /omit-if-no-ref/
> > +                     csi0_8bits_pins: csi0-8bits-pins {
> > +                             pins = "PE0", "PE2", "PE3", "PE4", "PE5",
> > +                                    "PE6", "PE7", "PE8", "PE9", "PE10",
> > +                                    "PE11";
> > +                             function = "csi0";
> > +                     };
> > +
> > +                     /omit-if-no-ref/
> > +                     csi0_mclk_pin: csi0-mclk-pin {
> > +                             pins = "PE1";
> > +                             function = "csi0";
> > +                     };
> > +
> >                       gmac_rgmii_pins: gmac-rgmii-pins {
> >                               pins = "PA0", "PA1", "PA2", "PA3",
> >                                      "PA4", "PA5", "PA6", "PA7",
> > @@ -624,6 +652,14 @@ gmac_mdio: mdio {
> >                       };
> >               };
> >
> > +             mbus: dram-controller@1c62000 {
> > +                     compatible = "allwinner,sun8i-r40-mbus";
> > +                     reg = <0x01c62000 0x1000>;
> > +                     clocks = <&ccu 155>;
>
> We should export the clock too?

I meant to do it separately. Haven't gotten to it though.

ChenYu
