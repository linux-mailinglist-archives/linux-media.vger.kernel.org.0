Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9502D43E6
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 15:08:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732622AbgLIOGP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 09:06:15 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:55527 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727090AbgLIOGP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Dec 2020 09:06:15 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B2C974000A;
        Wed,  9 Dec 2020 14:05:29 +0000 (UTC)
Date:   Wed, 9 Dec 2020 15:05:28 +0100
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
Message-ID: <X9DZqMdTfJLKNI5L@aptenodytes>
References: <20201128143350.531460-1-paul.kocialkowski@bootlin.com>
 <20201128143350.531460-3-paul.kocialkowski@bootlin.com>
 <20201208233436.GF25763@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="x/BLB4o4zfTOQ4w3"
Content-Disposition: inline
In-Reply-To: <20201208233436.GF25763@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--x/BLB4o4zfTOQ4w3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Wed 09 Dec 20, 01:34, Sakari Ailus wrote:
> Hi Paul,
>=20
> On Sat, Nov 28, 2020 at 03:33:50PM +0100, Paul Kocialkowski wrote:
> ...
> > +	if (ret)
> > +		goto error_ctrls;
> > +
> > +	/* V4L2 subdev register */
> > +
> > +	ret =3D v4l2_async_register_subdev_sensor_common(subdev);
>=20
> The driver's device node may be already available to the user here...
>=20
> > +	if (ret)
> > +		goto error_ctrls;
> > +
> > +	/* Runtime PM */
> > +
> > +	pm_runtime_enable(sensor->dev);
> > +	pm_runtime_set_suspended(sensor->dev);
>=20
> but runtime PM is enabled here.
>=20
> This needs to be done in a different order. Otherwise chances are that the
> device node is accessed before the device is powered on.

Oh that makes sense yes. Good catch :)

> > +
> > +	return 0;
> > +
> > +error_ctrls:
> > +	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> > +
> > +error_mutex:
> > +	mutex_destroy(&sensor->mutex);
> > +
> > +error_entity:
> > +	media_entity_cleanup(&sensor->subdev.entity);
> > +
> > +error_endpoint:
> > +	v4l2_fwnode_endpoint_free(&sensor->endpoint);
> > +
> > +	return ret;
> > +}
> > +
> > +static int ov5648_remove(struct i2c_client *client)
> > +{
> > +	struct v4l2_subdev *subdev =3D i2c_get_clientdata(client);
> > +	struct ov5648_sensor *sensor =3D ov5648_subdev_sensor(subdev);
> > +
> > +	clk_rate_exclusive_put(sensor->xvclk);
> > +
> > +	v4l2_async_unregister_subdev(subdev);
> > +	mutex_destroy(&sensor->mutex);
> > +	media_entity_cleanup(&subdev->entity);
> > +	v4l2_device_unregister_subdev(subdev);
> > +	pm_runtime_disable(sensor->dev);
> > +
> > +	ov5648_sensor_power(sensor, false);
>=20
> This needs to go, too, as there's no corresponding operation that powered
> on the device.
>=20
> Also don't forget to release the control handler.
>=20
> I believe these apply to both of the two drivers.

Fair enough and I think runtime PM will have called that already anyways.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--x/BLB4o4zfTOQ4w3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl/Q2agACgkQ3cLmz3+f
v9EddAf/V6dLv0Ik+tbj8DRMf4Je1cUsBspVDmOWLY2JcKkYf3TIZLl6oN82BL7C
JufH3T6zQ9OXK7AaFCks7Q6dO3Do5V1/JbrKBa+rYXc7otmY/j5sg5J4nRSjNRqg
e+dCVge2qH9wPv0TIDaxVi34QhT7qPm4BsazJHOGVQXK6JFvw0qU3IBsfxL9QXkl
N1Knq7sP7/2SnwATahb1lcD2C1zPgndO0YGiBlE4Z3K298Pwk9JWRBZETucnKjod
payiCyV5QV9miDjobSTtQEMgtnLZlfhrQkGmK7Q4/c9vWhwJ10kGB1b4W9sV5geu
+p5lnS302RllgZTjjB1AGRXsht6OrQ==
=Ecq2
-----END PGP SIGNATURE-----

--x/BLB4o4zfTOQ4w3--
