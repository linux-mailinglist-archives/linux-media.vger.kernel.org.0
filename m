Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FEC0408594
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 09:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237748AbhIMHrc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 03:47:32 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:53263 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237732AbhIMHr1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 03:47:27 -0400
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 24A0C100007;
        Mon, 13 Sep 2021 07:45:59 +0000 (UTC)
Date:   Mon, 13 Sep 2021 09:45:59 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Chen-Yu Tsai <wens@csie.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-sunxi@lists.linux.dev,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-phy@lists.infradead.org,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-staging@lists.linux.dev, Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH NOT FOR MERGE 13/22] ARM: dts: sun8i: a83t: Add MIPI
 CSI-2 controller node
Message-ID: <YT8Bt3Fmakn97vi9@aptenodytes>
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
 <20210910184147.336618-14-paul.kocialkowski@bootlin.com>
 <CAGb2v66OHJREEg1Djkk=VyY0yUr5JE8Fp+xsb40wCk6E56bH8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="a3BeDpyJol7qXzGn"
Content-Disposition: inline
In-Reply-To: <CAGb2v66OHJREEg1Djkk=VyY0yUr5JE8Fp+xsb40wCk6E56bH8A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--a3BeDpyJol7qXzGn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Sat 11 Sep 21, 10:53, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Sat, Sep 11, 2021 at 2:42 AM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
> >
> > MIPI CSI-2 is supported on the A83T with a dedicated controller that
> > covers both the protocol and D-PHY. It can be connected to the CSI
> > interface as a V4L2 subdev through the fwnode graph.
> >
> > This is not done by default since connecting the bridge without a
> > subdev attached to it will cause a failure on the CSI driver.
> >
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>=20
> I believe you tagged the wrong patch to not be merged? AFAICT it
> should be the next patch that hooks up OV8865, not this one.

Yes you are definitely right, this patch is good for merge and the next
one is not.

Thanks,

Paul

> > ---
> >  arch/arm/boot/dts/sun8i-a83t.dtsi | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8=
i-a83t.dtsi
> > index ac97eac91349..1fa51f7ef063 100644
> > --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> > +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> > @@ -1064,6 +1064,32 @@ csi: camera@1cb0000 {
> >                         status =3D "disabled";
> >                 };
> >
> > +               mipi_csi2: csi@1cb1000 {
> > +                       compatible =3D "allwinner,sun8i-a83t-mipi-csi2";
> > +                       reg =3D <0x01cb1000 0x1000>;
> > +                       interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks =3D <&ccu CLK_BUS_CSI>,
> > +                                <&ccu CLK_CSI_SCLK>,
> > +                                <&ccu CLK_MIPI_CSI>,
> > +                                <&ccu CLK_CSI_MISC>;
> > +                       clock-names =3D "bus", "mod", "mipi", "misc";
> > +                       resets =3D <&ccu RST_BUS_CSI>;
> > +                       status =3D "disabled";
> > +
> > +                       ports {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +
> > +                               mipi_csi2_in: port@0 {
> > +                                       reg =3D <0>;
> > +                               };
> > +
> > +                               mipi_csi2_out: port@1 {
> > +                                       reg =3D <1>;
> > +                               };
> > +                       };
> > +               };
> > +
> >                 hdmi: hdmi@1ee0000 {
> >                         compatible =3D "allwinner,sun8i-a83t-dw-hdmi";
> >                         reg =3D <0x01ee0000 0x10000>;
> > --
> > 2.32.0
> >
> >

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--a3BeDpyJol7qXzGn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmE/AbcACgkQ3cLmz3+f
v9GBrgf9HSUZdAaK36cq9m6svkBM+jphy40Yx1unln6fFfLoQoLluNFl8vwi5iKc
Gb42Npg4NojviHDFxq71JtZiURP/pz9HiqmE7eOB0c9rdxL+SDXE9zzK8BfOXOwi
1oySmXYcP2zbseeQHZ5VCCUzMZBcGWtnZTq+IJuYktq1F0448cYzUC1h7sdI0dbs
yuEb9x2Xz0HtlLd5GuY8G3azwmyZxNdEotTP3LcFJ2mHbjxBvu6butmych9IOanN
wnIPiULd3YFmoJ9khRL1KfKZ0N7WkZRLZBTlbhKrv5PIeQNjTWIIFjNN7y/gvEOZ
omUKtZSmJY9vCNYwFHoATT43SX7uyA==
=MNI6
-----END PGP SIGNATURE-----

--a3BeDpyJol7qXzGn--
