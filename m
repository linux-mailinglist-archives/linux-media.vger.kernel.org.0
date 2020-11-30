Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0AB2C85D7
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 14:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726001AbgK3Nss (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 08:48:48 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:45845 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgK3Nss (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 08:48:48 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A133A20006;
        Mon, 30 Nov 2020 13:48:05 +0000 (UTC)
Date:   Mon, 30 Nov 2020 14:48:04 +0100
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
Message-ID: <X8T4FH/QjRdLu0hS@aptenodytes>
References: <20201128143350.531460-1-paul.kocialkowski@bootlin.com>
 <20201128143350.531460-3-paul.kocialkowski@bootlin.com>
 <20201130092802.GU3940@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="CRkzk4adFE2kMeBa"
Content-Disposition: inline
In-Reply-To: <20201130092802.GU3940@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--CRkzk4adFE2kMeBa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Mon 30 Nov 20, 11:28, Sakari Ailus wrote:
> Hi Paul,
>=20
> Thanks for the update. I have a few comments on the driver, too.

Thanks for the review!

[...]

> > +	ret =3D ov5648_write(sensor, OV5648_GAIN_BLUE_MAN_L_REG,
> > +			   OV5648_GAIN_BLUE_MAN_L(blue_balance));
>=20
> return ...
>=20
> Same below (and above).

Well I don't think that makes any functional difference, right?
My personal preference is to have explicit checks even at the end of functi=
ons
for symetry and alignment with other blocks.

If it's okay, it'd like to keep it as-is. But if that's against kernel codi=
ng
style guidelines, I won't argue more.

[...]

> > +	/* Gain */
> > +
> > +	ctrls->gain_auto =3D
> > +		v4l2_ctrl_new_std(handler, ops, V4L2_CID_AUTOGAIN, 0, 1, 1, 1);
> > +
> > +	ctrls->gain =3D v4l2_ctrl_new_std(handler, ops, V4L2_CID_GAIN, 16, 10=
23,
> > +					16, 16);
> > +	ctrls->gain->flags |=3D V4L2_CTRL_FLAG_VOLATILE;
>=20
> Note that ctrls->gain may be NULL here. Please move after the handler's
> error check. Same for link_freq and pixel_rate.

You're right, this is not very safe, I'll fix it.

[...]

> > +static int ov5648_remove(struct i2c_client *client)
> > +{
> > +	struct v4l2_subdev *subdev =3D i2c_get_clientdata(client);
> > +	struct ov5648_sensor *sensor =3D ov5648_subdev_sensor(subdev);
> > +
> > +	clk_rate_exclusive_put(sensor->xvclk);
>=20
> This seems to be extra now.

Good catch, that's indeed a mistake!

Cheers and thanks,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--CRkzk4adFE2kMeBa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl/E+BQACgkQ3cLmz3+f
v9GHhAf8CLLaWEXbSysD7y5nk1maTTqdd5IRG0Y1IEIzEZI9RSDhumcq+i8ug3sc
zxQuUnXASqk2Cd+gP9+gOdMEKXPG6MIi5rwPvdbQcgvYN8ueDvQcuzF+bWim3aQ9
LIbdS9QJgNmSwuC1r6yzQb1nDizd3pcJ5kLHcrX7BCq8MgAu1bTO7ifB8jKU00RY
cHV5G4FfNz9iDPeDpxQ2RFsEHSPqYN0dd1vXG0a6YYsWfhVw4fuZeXN/DxcBQhV7
NKo0ORcHSrjVTcRSVloT6CB6pKWJ3xgGt8Ls/lcXxF/7dlNg3pvVAMMHLpSTowpj
t+atTLuKufo/bs9A7/FM+ING5S+ndA==
=ATUE
-----END PGP SIGNATURE-----

--CRkzk4adFE2kMeBa--
