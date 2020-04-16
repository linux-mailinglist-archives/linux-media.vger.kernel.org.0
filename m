Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E63A41AC247
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 15:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895221AbgDPNZW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 09:25:22 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:41735 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2895219AbgDPNYt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 09:24:49 -0400
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id AF69AE0003;
        Thu, 16 Apr 2020 13:24:42 +0000 (UTC)
Date:   Thu, 16 Apr 2020 15:24:42 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hansverk@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/4] arm64: dts: rockchip: Add RGA support to the PX30
Message-ID: <20200416132442.GI125838@aptenodytes>
References: <20200416115047.233720-1-paul.kocialkowski@bootlin.com>
 <20200416115047.233720-3-paul.kocialkowski@bootlin.com>
 <478f0a8b-f819-62f4-83b8-27918c4c2431@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+PbGPm1eXpwOoWkI"
Content-Disposition: inline
In-Reply-To: <478f0a8b-f819-62f4-83b8-27918c4c2431@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--+PbGPm1eXpwOoWkI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 16 Apr 20, 15:02, Johan Jonker wrote:
> Hi Paul,
>=20
> The conversion of rockchip-rga.txt to rockchip-rga.yaml by myself just
> has been approved by robh.

Huh, I looked around for ongoing related work but missed it.
I'll definitely rebase on top of your series and use the yaml description
instead. Thanks!

> Maybe place dts patches at the end of a patch serie.
> Could you include a &rga patch if your device is supported in mainline,
> so we can test with:
> make ARCH=3Darm64 dtbs_check
> DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/media/rockchip-rga.ya=
ml

I tested with the PX30 EVB so I can surely add a node there if that turns
out necessary (see below).

> Johan
>=20
> On 4/16/20 1:50 PM, Paul Kocialkowski wrote:
> > The PX30 features a RGA block: add the necessary node to support it.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/px30.dtsi | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/d=
ts/rockchip/px30.dtsi
> > index 75908c587511..4bfbee9d4123 100644
> > --- a/arch/arm64/boot/dts/rockchip/px30.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
> > @@ -1104,6 +1104,17 @@ vopl_mmu: iommu@ff470f00 {
> >  		status =3D "disabled";
> >  	};
> > =20
> > +	rga: rga@ff480000 {
> > +		compatible =3D "rockchip,px30-rga";
> > +		reg =3D <0x0 0xff480000 0x0 0x10000>;
> > +		interrupts =3D <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH 0>;
> > +		clocks =3D <&cru ACLK_RGA>, <&cru HCLK_RGA>, <&cru SCLK_RGA_CORE>;
> > +		clock-names =3D "aclk", "hclk", "sclk";
> > +		resets =3D <&cru SRST_RGA>, <&cru SRST_RGA_A>, <&cru SRST_RGA_H>;
> > +		reset-names =3D "core", "axi", "ahb";
> > +		power-domains =3D <&power PX30_PD_VO>;
>=20
> 		status =3D "disabled";

As of 5.6, the rk3399 has the node enabled by default. Did that change?

Since it's a standalone block that has no I/O dependency, I don't really see
the point of disabling it by default.

What do you think?

Cheers,

Paul

> > +	};
> > +
> >  	qos_gmac: qos@ff518000 {
> >  		compatible =3D "syscon";
> >  		reg =3D <0x0 0xff518000 0x0 0x20>;
> >=20
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--+PbGPm1eXpwOoWkI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl6YXJoACgkQ3cLmz3+f
v9Ho3wf/d9zxV64Bwt9TC0ABSimMOz4E7MQphqkXg/XbCpShScAkCWfzSQ71WxB4
T0+gL2hGnJEua+rGBrWyXst54nDhfUvqmiKw2VDC+ukjpVgGwNNP1UFFWGf5rTqM
TNY4QMIqmVhU1hvIGLYIT3iFZl66I1jlzBlywy1tM5SqC6B2N7Xy7P1FgtfVt7Wr
iz3jUXj1tqFrSB4sFdr2HFkOV48LLhtzjfSEPJI5ZtIsgM+jh/fGYu/v38kPlDW5
2bjcC2ZLiwHQyUpV8/+vEHFo8Ged/qocFyPrKtI1mCZd+Yd/VYRP85f551sbc0uz
uuYKH6JbkP37Fdz/ONOdyMbAqj+dNg==
=RgMQ
-----END PGP SIGNATURE-----

--+PbGPm1eXpwOoWkI--
