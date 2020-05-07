Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD0231C9C47
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 22:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbgEGU0D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 16:26:03 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:39911 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbgEGU0D (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 May 2020 16:26:03 -0400
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 26FC6100002;
        Thu,  7 May 2020 20:25:59 +0000 (UTC)
Date:   Thu, 7 May 2020 22:25:58 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     devicetree@vger.kernel.org, ezequiel@collabora.com,
        hansverk@cisco.com, heiko@sntech.de,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v3 2/4] arm64: dts: rockchip: Add RGA support to the PX30
Message-ID: <20200507202558.GK2422122@aptenodytes>
References: <20200430164245.1630174-3-paul.kocialkowski@bootlin.com>
 <c3954924-c220-73ef-06dd-85b6876be819@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="aqWxf8ydqYKP8htK"
Content-Disposition: inline
In-Reply-To: <c3954924-c220-73ef-06dd-85b6876be819@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--aqWxf8ydqYKP8htK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 01 May 20, 00:05, Johan Jonker wrote:
> Hi Paul,
>=20
> > The PX30 features a RGA block: add the necessary node to support it.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/px30.dtsi | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/d=
ts/rockchip/px30.dtsi
> > index f809dd6d5dc3..3de70aa4f1ce 100644
> > --- a/arch/arm64/boot/dts/rockchip/px30.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
> > @@ -1102,6 +1102,17 @@ vopl_mmu: iommu@ff470f00 {
> >  		status =3D "disabled";
> >  	};
> > =20
> > +	rga: rga@ff480000 {
> > +		compatible =3D "rockchip,px30-rga", "rockchip,rk3288-rga";
> > +		reg =3D <0x0 0xff480000 0x0 0x10000>;
> > +		interrupts =3D <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH 0>;
> > +		clocks =3D <&cru ACLK_RGA>, <&cru HCLK_RGA>, <&cru SCLK_RGA_CORE>;
> > +		clock-names =3D "aclk", "hclk", "sclk";
>=20
> > +		resets =3D <&cru SRST_RGA>, <&cru SRST_RGA_A>, <&cru SRST_RGA_H>;
> > +		reset-names =3D "core", "axi", "ahb";
> > +		power-domains =3D <&power PX30_PD_VO>;
>=20
> sort
>=20
> 		power-domains =3D <&power PX30_PD_VO>;
> 		resets =3D <&cru SRST_RGA>, <&cru SRST_RGA_A>, <&cru SRST_RGA_H>;
> 		reset-names =3D "core", "axi", "ahb";

What's the rationale behind this (besides alphabetic sorting, which I don't
believe is a rule for dt properties)? Some nodes above in the file have it =
in
the same order that I do, and I like to see clocks followed by resets.

Cheers,

Paul

>=20
>=20
> > +	};
> > +
> >  	qos_gmac: qos@ff518000 {
> >  		compatible =3D "syscon";
> >  		reg =3D <0x0 0xff518000 0x0 0x20>;
> > --=20
> > 2.26.0
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--aqWxf8ydqYKP8htK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl60btYACgkQ3cLmz3+f
v9Ha1Qf/Xr5JD/LpgWWDus3bRN+aBAhQYAdGgLJOCLzfZ73l5ovYy4znYccQvOP7
9jefTg3IgTEVV/Dxsh+EFuaWAJzHmEREpDRMSCywxGQgrkWyU8rgB2z7GHjT0xUM
DV0SU5Hi8mL2SDyXXMjAu+VQRu2ewNCXTSrNGMNey2R9ii5XZB51VZ61lYh4Zct8
wZ/M1S+jG6x/JbZT4UalUqvUyQIvNHS27RlkBROLBHcEBngSWCB/iQCOuLl5kjwa
3FFE9oLKQC/8C0q8Ys8o0Oz7lnfH5EEQ+3y4wLuHBTLGjMBrED3AREihwZOaLoHS
OmTf3luRVKugDzmY3MKRI6vUPxK0lA==
=fLpQ
-----END PGP SIGNATURE-----

--aqWxf8ydqYKP8htK--
