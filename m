Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD8523205
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2019 13:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732440AbfETLK4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 May 2019 07:10:56 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:36853 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730634AbfETLK4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 May 2019 07:10:56 -0400
X-Originating-IP: 90.88.22.185
Received: from localhost (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr [90.88.22.185])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 75B681C0007;
        Mon, 20 May 2019 11:10:49 +0000 (UTC)
Date:   Mon, 20 May 2019 13:10:49 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Chen-Yu Tsai <wens@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH 4/6] ARM: dts: sun8i: a83t: Add device node for CSI
 (Camera Sensor Interface)
Message-ID: <20190520111048.cnh435fnmz7esyks@flea>
References: <20190408165744.11672-1-wens@kernel.org>
 <20190408165744.11672-5-wens@kernel.org>
 <20190409075804.4zrwjil7ie2gjigu@flea>
 <CAGb2v64CYV68Q0a7x5p-XabS74vaQWP3paPopodmqQPTOrq2gQ@mail.gmail.com>
 <20190409082818.z33mq2qrxethldzf@flea>
 <CAGb2v67pX+7ccihmGEWPKrXg8mMhht-vh37p2auWYgt=qGDA6A@mail.gmail.com>
 <20190409145225.2ltluiyqa5xha4zd@flea>
 <20190519135422.l2bnumyjr3dxehhx@core.my.home>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qkatogddc44c6dds"
Content-Disposition: inline
In-Reply-To: <20190519135422.l2bnumyjr3dxehhx@core.my.home>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--qkatogddc44c6dds
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ond=C5=99ej,

On Sun, May 19, 2019 at 03:54:22PM +0200, Ond=C5=99ej Jirman wrote:
> On Tue, Apr 09, 2019 at 04:52:25PM +0200, Maxime Ripard wrote:
> > On Tue, Apr 09, 2019 at 04:40:40PM +0800, Chen-Yu Tsai wrote:
> > > On Tue, Apr 9, 2019 at 4:28 PM Maxime Ripard <maxime.ripard@bootlin.c=
om> wrote:
> > > >
> > > > On Tue, Apr 09, 2019 at 04:07:34PM +0800, Chen-Yu Tsai wrote:
> > > > > On Tue, Apr 9, 2019 at 3:58 PM Maxime Ripard <maxime.ripard@bootl=
in.com> wrote:
> > > > > > On Tue, Apr 09, 2019 at 12:57:42AM +0800, Chen-Yu Tsai wrote:
> > > > > > > From: Chen-Yu Tsai <wens@csie.org>
> > > > > > >
> > > > > > > The A83T SoC has a camera sensor interface (known as CSI in A=
llwinner
> > > > > > > lingo), which is similar to the one found on the A64 and H3. =
The only
> > > > > > > difference seems to be that support of MIPI CSI through a con=
nected
> > > > > > > MIPI CSI-2 bridge.
> > > > > > >
> > > > > > > Add a device node for it, and pinctrl nodes for the commonly =
used MCLK
> > > > > > > and 8-bit parallel interface. The property /omit-if-no-ref/ i=
s added to
> > > > > > > the pinctrl nodes to keep the device tree blob size down if t=
hey are
> > > > > > > unused.
> > > > > > >
> > > > > > > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > > > > > > ---
> > > > > > >  arch/arm/boot/dts/sun8i-a83t.dtsi | 31 +++++++++++++++++++++=
++++++++++
> > > > > > >  1 file changed, 31 insertions(+)
> > > > > > >
> > > > > > > diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boo=
t/dts/sun8i-a83t.dtsi
> > > > > > > index f739b88efb53..0c52f945fd5f 100644
> > > > > > > --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> > > > > > > +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> > > > > > > @@ -682,6 +682,20 @@
> > > > > > >                       #interrupt-cells =3D <3>;
> > > > > > >                       #gpio-cells =3D <3>;
> > > > > > >
> > > > > > > +                     /omit-if-no-ref/
> > > > > > > +                     csi_8bit_parallel_pins: csi-8bit-parall=
el-pins {
> > > > > > > +                             pins =3D "PE0", "PE2", "PE3", "=
PE6", "PE7",
> > > > > > > +                                    "PE8", "PE9", "PE10", "P=
E11",
> > > > > > > +                                    "PE12", "PE13";
> > > > > > > +                             function =3D "csi";
> > > > > > > +                     };
> > > > > > > +
> > > > > > > +                     /omit-if-no-ref/
> > > > > > > +                     csi_mclk_pin: csi-mclk-pin {
> > > > > > > +                             pins =3D "PE1";
> > > > > > > +                             function =3D "csi";
> > > > > > > +                     };
> > > > > > > +
> > > > > > >                       emac_rgmii_pins: emac-rgmii-pins {
> > > > > > >                               pins =3D "PD2", "PD3", "PD4", "=
PD5", "PD6", "PD7",
> > > > > > >                                      "PD11", "PD12", "PD13", =
"PD14", "PD18",
> > > > > > > @@ -994,6 +1008,23 @@
> > > > > > >                       interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK=
_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
> > > > > > >               };
> > > > > > >
> > > > > > > +             csi: camera@1cb0000 {
> > > > > > > +                     compatible =3D "allwinner,sun8i-a83t-cs=
i";
> > > > > > > +                     reg =3D <0x01cb0000 0x1000>;
> > > > > > > +                     interrupts =3D <GIC_SPI 84 IRQ_TYPE_LEV=
EL_HIGH>;
> > > > > > > +                     clocks =3D <&ccu CLK_BUS_CSI>,
> > > > > > > +                              <&ccu CLK_CSI_SCLK>,
> > > > > > > +                              <&ccu CLK_DRAM_CSI>;
> > > > > > > +                     clock-names =3D "bus", "mod", "ram";
> > > > > > > +                     resets =3D <&ccu RST_BUS_CSI>;
> > > > > > > +                     status =3D "disabled";
> > > > > > > +
> > > > > > > +                     csi_in: port {
> > > > > > > +                             #address-cells =3D <1>;
> > > > > > > +                             #size-cells =3D <0>;
> > > > > >
> > > > > > If we expect a single enpoint, then we don't need the address-c=
ells
> > > > > > and size-cells properties.
> > > > >
> > > > > I wouldn't bet on anything. The way the Q8 tablets did front/back=
 cameras
> > > > > is kind of genius if not very hacky. They have two "identical" se=
nsors
> > > > > on the same I2C bus and CSI bus, with shared reset line but separ=
ate
> > > > > shutdown lines. Since they are identical, they also have the same=
 I2C
> > > > > address. I haven't figured out how to model this in the device tr=
ee.
> > > > >
> > > > > The point is, it's perfectly possible to have two or more sensors=
 use
> > > > > the same controller, provided only one be active at a time.
> > > >
> > > > Right, but I guess the common case would be to have a single sensor,
> > > > where that wouldn't be needed.
> > > >
> > > > In odd cases, we can always specify it in the DTS, and if it becomes
> > > > common enough, we can move it to the DTSI.
> > >
> > > Makes sense. Do you want me to re-spin?
> >
> > If there's no other comment, we'll fix it when applying.
>
> This patch series seems to have been forgotten. It doesn't seem there are=
 any
> blockers.

Sorry about that :/

> Can you please apply it now? I have some further series (camera module
> support for TBS-A711) that depend on this.

Some parts of it will have to be merged through v4l2, and I can't
apply those patches.

Can you resend that series, and ping on a regular basis (like once a
week) if you don't get any feedback?

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--qkatogddc44c6dds
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOKLOAAKCRDj7w1vZxhR
xcUUAQD7Jfd29f0QBa+jm16CGAaZx4LxWkZ47YM74jycMwsRPQD+JbLPWMLy39fT
gI37QUUND5p2czBiA+hpbcz3sQLb8w8=
=a/4m
-----END PGP SIGNATURE-----

--qkatogddc44c6dds--
