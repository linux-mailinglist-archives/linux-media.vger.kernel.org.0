Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD1F92CC041
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 16:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730361AbgLBPC6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 10:02:58 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:33349 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727753AbgLBPC6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 10:02:58 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id CEC1E6000C;
        Wed,  2 Dec 2020 15:02:09 +0000 (UTC)
Date:   Wed, 2 Dec 2020 16:02:09 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-sunxi@googlegroups.com, Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        kevin.lhopital@hotmail.com
Subject: Re: [PATCH v2 09/19] ARM: dts: sunxi: h3/h5: Add CSI controller port
 for parallel input
Message-ID: <X8escb4SZXEpiR0n@aptenodytes>
References: <20201128142839.517949-1-paul.kocialkowski@bootlin.com>
 <20201128142839.517949-10-paul.kocialkowski@bootlin.com>
 <20201201121405.at4pwxon56ecwrx6@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rGPkz4GDdv/zCi05"
Content-Disposition: inline
In-Reply-To: <20201201121405.at4pwxon56ecwrx6@gilmour>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--rGPkz4GDdv/zCi05
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue 01 Dec 20, 13:14, Maxime Ripard wrote:
> On Sat, Nov 28, 2020 at 03:28:29PM +0100, Paul Kocialkowski wrote:
> > Since the CSI controller binding is getting a bit more complex due
> > to the addition of MIPI CSI-2 bridge support, make the ports node
> > explicit with the parallel port.
> >=20
> > This way, it's clear that the controller only supports parallel
> > interface input and there's no confusion about the port number.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sun=
xi-h3-h5.dtsi
> > index 9be13378d4df..02b698cace6a 100644
> > --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > @@ -803,6 +803,15 @@ csi: camera@1cb0000 {
> >  			pinctrl-names =3D "default";
> >  			pinctrl-0 =3D <&csi_pins>;
> >  			status =3D "disabled";
> > +
> > +			ports {
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +
> > +				csi_in_parallel: port@0 {
> > +					reg =3D <0>;
> > +				};
> > +			};
> >  		};
>=20
> This will create a DTC warning, since port@0 is the only node, and is
> equivalent to port

I'm not seeing the warning when running dtbs_check.
More generally, why is it a problem that there's only one node defined?

One issue that I did see is that the port node doesn't have an endpoint
here, so I will remove the requirement to have an endpoint in the bindings
documentation to allow this kind of definition.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--rGPkz4GDdv/zCi05
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl/HrHEACgkQ3cLmz3+f
v9ErpAgAl7uJWiiZLPZchWKL6k5dL9UqFnjiKHTANDFz4zNTRp/o32qFhs/5b/dS
YmQq0RsO+cyvnDxYlcRd1a49EhTeI08dsZtMrAzeLGqrOmxwBNEoJiNASEDRodFP
MogKS9JER+A8zl3msQDPCDlBRTVwQrQaDbpHBKoF6qQTbWWuG+2/AY/LCr6DFY2X
GoR7hXqjiJkIzc+49SC2C3mnycLETpJAf7mY3mQkTHdbuKqJCyjglrCPtvLvzxLU
U5bzjNMc/Lm7X1NP1aOMCHhSJ0yE6/vewMKkceTfm4AUvS48fz2/s78AU2n4rD/U
ETFlPrmf9vkxA732GCZiTvH9OQWHTA==
=PFfC
-----END PGP SIGNATURE-----

--rGPkz4GDdv/zCi05--
