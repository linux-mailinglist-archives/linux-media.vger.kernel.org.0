Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6F12F1C40
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 18:24:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389328AbhAKRX7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 12:23:59 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:50355 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbhAKRX7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 12:23:59 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 926CBC0005;
        Mon, 11 Jan 2021 17:23:14 +0000 (UTC)
Date:   Mon, 11 Jan 2021 18:23:13 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jacob Chen <jacob-chen@iotwrt.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 5/5] media: hantro: Add support for the Rockchip PX30
Message-ID: <X/yJgRXToYvYlapj@aptenodytes>
References: <20210107134101.195426-1-paul.kocialkowski@bootlin.com>
 <20210107134101.195426-6-paul.kocialkowski@bootlin.com>
 <f7291b83fe39d71c3192ea58ebf71e3909bd38af.camel@collabora.com>
 <X/ggTOOTBhGoFDpW@aptenodytes>
 <f9a163675ae05cc77b2d527ea5d68064fbbeead9.camel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1emMtAQaK8QkpPQv"
Content-Disposition: inline
In-Reply-To: <f9a163675ae05cc77b2d527ea5d68064fbbeead9.camel@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--1emMtAQaK8QkpPQv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 08 Jan 21, 10:13, Ezequiel Garcia wrote:
> On Fri, 2021-01-08 at 10:05 +0100, Paul Kocialkowski wrote:
> > Hi Ezequiel,
> >=20
> > On Thu 07 Jan 21, 16:08, Ezequiel Garcia wrote:
> > > Happy to see this patch. It was on my TODO list,
> > > but I hadn't had time to bringup my rk3326 device.
> >=20
> > Same here, I just had an occasion to use it again these days so I jumped
> > on it!
> >=20
> > > A few comments.
> > >=20
> > > On Thu, 2021-01-07 at 14:41 +0100, Paul Kocialkowski wrote:
> > > > The PX30 SoC includes both the VDPU2 and VEPU2 blocks which are sim=
ilar
> > > > to the RK3399 (Hantro G1/H1 with shuffled registers).
> > > >=20
> > > > Besides taking an extra clock, it also shares an interrupt with the=
 IOMMU
> > > > so it's necessary to request the interrupt shared.
> > > >=20
> > >=20
> [..]
> > > > diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/sta=
ging/media/hantro/hantro_hw.h
> > > > index 34c9e4649a25..07f516fd7a2e 100644
> > > > --- a/drivers/staging/media/hantro/hantro_hw.h
> > > > +++ b/drivers/staging/media/hantro/hantro_hw.h
> > > > @@ -148,6 +148,7 @@ enum hantro_enc_fmt {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0RK3288_VPU_ENC_FMT_=
UYVY422 =3D 3,
> > > > =C2=A0};
> > > > =C2=A0
> > > > +extern const struct hantro_variant px30_vpu_variant;
> > > > =C2=A0extern const struct hantro_variant rk3399_vpu_variant;
> > > > =C2=A0extern const struct hantro_variant rk3328_vpu_variant;
> > > > =C2=A0extern const struct hantro_variant rk3288_vpu_variant;
> > > > diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw.c b/drivers=
/staging/media/hantro/rk3399_vpu_hw.c
> > > > index 7a7962cf771e..4112f98baa60 100644
> > > > --- a/drivers/staging/media/hantro/rk3399_vpu_hw.c
> > > > +++ b/drivers/staging/media/hantro/rk3399_vpu_hw.c
> > >=20
> > > Perhaps it's time to rename this to rockchip_vpu_hw.c,
> > > and merge rk3288 and rk3399? It's a nitpick, though.
> >=20
> > Haha, I was thinking the exact same thing but wasn't sure it would be w=
elcome!
> >=20
> > I was thinking of rockchip_vpu2_hw.c or rockchip_vdpu2_hw.c since that's
> > apparently how it's called in Rockchip terminology: VDPU2 and VEPU2 for=
 the
> > Hantro G1 and H1 with the shuffled register layout. The rk3288 stuff is
> > probably VDPU1/VEPU1 and we might want to rename it accordingly as well.
> >=20
>=20
> I'd rather keep it simple as rockchip_vpu_hw.c and just throw in there
> all the rockchip stuff.

Do you also mean merging all the rk*_vpu_hw.c files into one or just coveri=
ng
the general helpers (and not the platform-specific structures)?

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--1emMtAQaK8QkpPQv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl/8iYEACgkQ3cLmz3+f
v9Go3wf8CY2beRCaepip+ySAr3f0rsAttGwT8TjAqe+dBrzZTyFhjEDEi2azyUgp
bA49M4gc6+nCMtbfoGmOUrgffYiFy2SJqyTeICeTQviFY9I6xDjUprn5SSO40ohA
Hh762PMKF47CXeC6mYAQ9Np2merbDP4kqNcUmCNctOKy4mSGec94BgdHIx8ABlBW
exWvVw8AS0TzMoeIJALRzGV5BMTqKpwb5yHnTdwfN2UtiKJDl2J8GIP2koHTpSDw
OE6ZVsY7ksYjvu7Kzs8RGjWksHNTViiCHygSrdSIYMYV22H6l5Gj2pgKMWpMs7hR
I/F/7cVY0gP+RMFIVzTALLgvQWhFIA==
=fdgl
-----END PGP SIGNATURE-----

--1emMtAQaK8QkpPQv--
