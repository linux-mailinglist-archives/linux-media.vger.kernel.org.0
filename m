Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 516BD1207A9
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 14:54:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727980AbfLPNyA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 08:54:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:53970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727579AbfLPNyA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 08:54:00 -0500
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 544D720684;
        Mon, 16 Dec 2019 13:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576504439;
        bh=uv5C5xxV6s+wZJHQxZ3Zwsb51rrorx2imu/hoatZa7g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TWJUsz6P7UTty3QBpU1o+8sXlVItwvUOw2r0bhbfehOQBGry64gQW6/XO51detNky
         u0h+8sa3BKWGQWJ3+W7QWQvr1ThHlDmDm0wGfKLza5J2gHbHHNGf2BMBQWdVLy3xmu
         cBIoZxpWJqY0/wUwkxPiAxujNiYus0ijDlCQAxt0=
Date:   Mon, 16 Dec 2019 14:53:57 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 11/14] ARM: dts: sun8i: r40: Add device node for CSI0
Message-ID: <20191216135357.uv3llx5zsbkpy4tf@gilmour.lan>
References: <20191215165924.28314-1-wens@kernel.org>
 <20191215165924.28314-12-wens@kernel.org>
 <20191216133931.wliwn5woy3hstdg3@gilmour.lan>
 <CAGb2v64=p7RX_visHWawAFfPr8=ZDH4JqsoK__xnHKo6s3QOwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="w5mvu6ayhzlcpdtg"
Content-Disposition: inline
In-Reply-To: <CAGb2v64=p7RX_visHWawAFfPr8=ZDH4JqsoK__xnHKo6s3QOwg@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--w5mvu6ayhzlcpdtg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 16, 2019 at 09:42:30PM +0800, Chen-Yu Tsai wrote:
> On Mon, Dec 16, 2019 at 9:39 PM Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Mon, Dec 16, 2019 at 12:59:21AM +0800, Chen-Yu Tsai wrote:
> > > From: Chen-Yu Tsai <wens@csie.org>
> > >
> > > The CSI0 and CSI1 blocks are the same as found on the A20. However only
> > > CSI0 is supported upstream right now.
> > >
> > > Add a device node for CSI0 using the A20 compatible as a fallback, and
> > > the standard pinctrl options. Also add the MBUS interconnect.
> > >
> > > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > > ---
> > >  arch/arm/boot/dts/sun8i-r40.dtsi | 36 ++++++++++++++++++++++++++++++++
> > >  1 file changed, 36 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
> > > index 82ea0b5b0710..2d1e97cc4155 100644
> > > --- a/arch/arm/boot/dts/sun8i-r40.dtsi
> > > +++ b/arch/arm/boot/dts/sun8i-r40.dtsi
> > > @@ -180,6 +180,20 @@ nmi_intc: interrupt-controller@1c00030 {
> > >                       interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> > >               };
> > >
> > > +             csi0: csi@1c09000 {
> > > +                     compatible = "allwinner,sun8i-r40-csi0",
> > > +                                  "allwinner,sun7i-a20-csi0";
> > > +                     reg = <0x01c09000 0x1000>;
> > > +                     interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> > > +                     clocks = <&ccu CLK_BUS_CSI0>, <&ccu CLK_CSI_SCLK>,
> > > +                              <&ccu CLK_DRAM_CSI0>;
> > > +                     clock-names = "bus", "isp", "ram";
> > > +                     resets = <&ccu RST_BUS_CSI0>;
> > > +                     interconnects = <&mbus 5>;
> > > +                     interconnect-names = "dma-mem";
> > > +                     status = "disabled";
> > > +             };
> > > +
> > >               mmc0: mmc@1c0f000 {
> > >                       compatible = "allwinner,sun8i-r40-mmc",
> > >                                    "allwinner,sun50i-a64-mmc";
> > > @@ -355,6 +369,20 @@ clk_out_a_pin: clk-out-a-pin {
> > >                               function = "clk_out_a";
> > >                       };
> > >
> > > +                     /omit-if-no-ref/
> > > +                     csi0_8bits_pins: csi0-8bits-pins {
> > > +                             pins = "PE0", "PE2", "PE3", "PE4", "PE5",
> > > +                                    "PE6", "PE7", "PE8", "PE9", "PE10",
> > > +                                    "PE11";
> > > +                             function = "csi0";
> > > +                     };
> > > +
> > > +                     /omit-if-no-ref/
> > > +                     csi0_mclk_pin: csi0-mclk-pin {
> > > +                             pins = "PE1";
> > > +                             function = "csi0";
> > > +                     };
> > > +
> > >                       gmac_rgmii_pins: gmac-rgmii-pins {
> > >                               pins = "PA0", "PA1", "PA2", "PA3",
> > >                                      "PA4", "PA5", "PA6", "PA7",
> > > @@ -624,6 +652,14 @@ gmac_mdio: mdio {
> > >                       };
> > >               };
> > >
> > > +             mbus: dram-controller@1c62000 {
> > > +                     compatible = "allwinner,sun8i-r40-mbus";
> > > +                     reg = <0x01c62000 0x1000>;
> > > +                     clocks = <&ccu 155>;
> >
> > We should export the clock too?
>
> I meant to do it separately. Haven't gotten to it though.

Ok, great!

Maxime

--w5mvu6ayhzlcpdtg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfeMdQAKCRDj7w1vZxhR
xY9wAP42ElVTWC+tiYPElia20K4yhWE8et0gb6iarvDFsFbX7gD/epicLpcSxCDn
Hp64z0AstP8DV0cDs93avJtOQ9Q+UwE=
=4Dp6
-----END PGP SIGNATURE-----

--w5mvu6ayhzlcpdtg--
