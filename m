Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2318D1B779D
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 15:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728139AbgDXN4C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 09:56:02 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:56251 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726301AbgDXN4C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 09:56:02 -0400
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 50BE640004;
        Fri, 24 Apr 2020 13:55:53 +0000 (UTC)
Date:   Fri, 24 Apr 2020 15:55:52 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hansverk@cisco.com>,
        justin.swartz@risingedge.co.za, Johan Jonker <jbx6244@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 3/4] media: rockchip: rga: Add support for the PX30
 compatible
Message-ID: <20200424135552.GI610776@aptenodytes>
References: <20200423200937.1039257-1-paul.kocialkowski@bootlin.com>
 <20200423200937.1039257-4-paul.kocialkowski@bootlin.com>
 <cf31ae67792aedf60ee4cf8002861edadc305314.camel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3U8TY7m7wOx7RL1F"
Content-Disposition: inline
In-Reply-To: <cf31ae67792aedf60ee4cf8002861edadc305314.camel@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--3U8TY7m7wOx7RL1F
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ezequiel,

On Fri 24 Apr 20, 09:54, Ezequiel Garcia wrote:
> Hey Paul,
>=20
> Thanks for the patch!
>=20
> On Thu, 2020-04-23 at 22:09 +0200, Paul Kocialkowski wrote:
> > The PX30 SoC has a RGA block, so add the associated compatible to
> > support it.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  drivers/media/platform/rockchip/rga/rga.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/=
platform/rockchip/rga/rga.c
> > index 9d122429706e..4fb4615662b7 100644
> > --- a/drivers/media/platform/rockchip/rga/rga.c
> > +++ b/drivers/media/platform/rockchip/rga/rga.c
> > @@ -955,6 +955,9 @@ static const struct dev_pm_ops rga_pm =3D {
> >  };
> > =20
> >  static const struct of_device_id rockchip_rga_match[] =3D {
> > +	{
> > +		.compatible =3D "rockchip,px30-rga",
> > +	},
>=20
> Please note that if you don't have anything px30-specific,
> then you don't need the compatible in the driver.
>=20
> You can have something like:
>=20
> compatible =3D "rockchip,px30-rga", "rockchip,rk3288-rga"
>=20
> so you need to add it to the bindings. See Justin Swartz
> recent patches for rk3228.

Thanks for the instruction!

I've been a bit confused about that because RK3399 has its own compatible
(without a 2nd rk3288 compatible) although there's nothing different with it
either. All of these rockchip platforms come with what they call "RGA2", th=
at
seems to have no variation across platforms (downstream rockchip even has a
single compatible for it).

Should we add the rk3288 compatible to the rk3399 dtsi? I guess we
can't remove it from the driver at this point, for backward compatibility
with previous dts (what a strange idea...).

> Down the road, if you find something specific for px30,
> you can make the driver aware.=20

Makes sense, yes.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--3U8TY7m7wOx7RL1F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl6i7+gACgkQ3cLmz3+f
v9FiYAf/S2rf7jhG7m6KOPzamwQ3o9tzlswdBgoIl9QCOJ45gxp6WdL/pYTzIG5n
699GzPx7eFLs9nig+3To7cjsatt1he0hyI4Y5VXrBYTJUINu7mPXrXOOOytT85mL
9HNLhZJrvnDMRBdailFpY/nwYUq4TORps7ll3yMwOBWCIziyxU6ShuaS7UUcNfd6
KQWa19k19huhhJ/WFG04lc1mjMQYzAM+DoLSn72KGTho3YYZjm8P9rvYgMTW5rF8
kTX8Zd1CM6esAQhYji6CJQV4sKi0ZRCLz81dAf0chibWLcDbA9DyXgGX3A4GDIfR
2rXiW1ggIZhknk09nPri7clhpqxSVQ==
=GDWl
-----END PGP SIGNATURE-----

--3U8TY7m7wOx7RL1F--
