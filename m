Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83B682CBEB2
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 14:51:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbgLBNu6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 08:50:58 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:44727 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbgLBNu6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 08:50:58 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 34B0C40008;
        Wed,  2 Dec 2020 13:50:13 +0000 (UTC)
Date:   Wed, 2 Dec 2020 14:50:13 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 2/2] media: i2c: Add support for the OV5648 image
 sensor
Message-ID: <X8eblRy3iqjcInyg@aptenodytes>
References: <20201128143350.531460-1-paul.kocialkowski@bootlin.com>
 <20201128143350.531460-3-paul.kocialkowski@bootlin.com>
 <20201130092802.GU3940@paasikivi.fi.intel.com>
 <X8T4FH/QjRdLu0hS@aptenodytes>
 <20201130135331.GW3940@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fmR9vRP8nP8AbyZi"
Content-Disposition: inline
In-Reply-To: <20201130135331.GW3940@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--fmR9vRP8nP8AbyZi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Mon 30 Nov 20, 15:53, Sakari Ailus wrote:
> Hi Paul,
>=20
> On Mon, Nov 30, 2020 at 02:48:04PM +0100, Paul Kocialkowski wrote:
> > Hi Sakari,
> >=20
> > On Mon 30 Nov 20, 11:28, Sakari Ailus wrote:
> > > Hi Paul,
> > >=20
> > > Thanks for the update. I have a few comments on the driver, too.
> >=20
> > Thanks for the review!
> >=20
> > [...]
> >=20
> > > > +	ret =3D ov5648_write(sensor, OV5648_GAIN_BLUE_MAN_L_REG,
> > > > +			   OV5648_GAIN_BLUE_MAN_L(blue_balance));
> > >=20
> > > return ...
> > >=20
> > > Same below (and above).
> >=20
> > Well I don't think that makes any functional difference, right?
> > My personal preference is to have explicit checks even at the end of fu=
nctions
> > for symetry and alignment with other blocks.
> >=20
> > If it's okay, it'd like to keep it as-is. But if that's against kernel =
coding
> > style guidelines, I won't argue more.
>=20
> Please do change them.
>=20
> It's useless code, repeated at the end of a number of functions in this
> driver. I wouldn't mind otherwise, but people do take examples from
> existing drivers so such patterns tend to repeat in other places.

I don't agree that it's useless but I will do as you ask.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--fmR9vRP8nP8AbyZi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl/Hm5UACgkQ3cLmz3+f
v9E2EAf+PzCeUWZ/MOgG6YssuCqygeIecYxuz2zJlBZn0Q40RW/DEIRr0oU43sDh
UspNn5HnQFqHYq1Q4n4ENt6LC81OSwayA1rkgcBnf7bXHp82cHhUZXJo6hI8VxMG
DT8npmAPy/UTxbZqkoK+tzuH01QJ/GISjBMuXUiK86yz93yeC5UOu81RCsEpmt5r
p4n1ZJgj2c7klrKxGugiHzBqEyXiY9Tp/Jj3aY3gl4oEa2ANqqeyBfN7Uq4bbY/B
/Gkwbod7LwNWECN09aTxxKlpFzlYGJzH7DxGb7+4EP8IvBcR1w0gTfuqVrWFpH4J
moVHdzcRiGP6rOyvIwOw8yYdq24SGA==
=wQ41
-----END PGP SIGNATURE-----

--fmR9vRP8nP8AbyZi--
