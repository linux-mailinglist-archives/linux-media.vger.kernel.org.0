Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFACB45EEF2
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 14:16:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238823AbhKZNTb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 08:19:31 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:37405 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231215AbhKZNRa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 08:17:30 -0500
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id D553220000D;
        Fri, 26 Nov 2021 13:14:16 +0000 (UTC)
Date:   Fri, 26 Nov 2021 14:14:16 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: ov5648: Fix lockdep error
Message-ID: <YaDdqGf/Zm/7+5Z4@aptenodytes>
References: <20211126114802.85706-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zsRmWztiiPh816t3"
Content-Disposition: inline
In-Reply-To: <20211126114802.85706-1-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--zsRmWztiiPh816t3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 26 Nov 21, 12:48, Hans de Goede wrote:
> ov5648_state_init() calls ov5648_state_mipi_configure() which uses
> __v4l2_ctrl_s_ctrl[_int64](). This means that sensor->mutex (which
> is also sensor->ctrls.handler.lock) must be locked before calling
> ov5648_state_init().
>=20
> ov5648_state_mipi_configure() is also used in other places where
> the lock is already held so it cannot be changed itself.
>=20
> Note this is based on an identical (tested) fix for the ov8865 driver,
> this has only been compile-tested.

Thanks!

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Paul

> Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Move the taking of the mutex to inside ov5648_state_init()
> ---
>  drivers/media/i2c/ov5648.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
> index 947d437ed0ef..01e22c535267 100644
> --- a/drivers/media/i2c/ov5648.c
> +++ b/drivers/media/i2c/ov5648.c
> @@ -1778,8 +1778,14 @@ static int ov5648_state_configure(struct ov5648_se=
nsor *sensor,
> =20
>  static int ov5648_state_init(struct ov5648_sensor *sensor)
>  {
> -	return ov5648_state_configure(sensor, &ov5648_modes[0],
> -				      ov5648_mbus_codes[0]);
> +	int ret;
> +
> +	mutex_lock(&sensor->mutex);
> +	ret =3D ov5648_state_configure(sensor, &ov5648_modes[0],
> +				     ov5648_mbus_codes[0]);
> +	mutex_unlock(&sensor->mutex);
> +
> +	return ret;
>  }
> =20
>  /* Sensor Base */
> --=20
> 2.33.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--zsRmWztiiPh816t3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmGg3agACgkQ3cLmz3+f
v9Eh8Af+PDoxmFMzJTo5jes261htzvvZ6If7MsbujnUDoWVaFv/eTmZI5j9CW1vw
GeVEaGUwLsKD9pBb2fyK6tWhK0cn/S+EmvQZuxRS8sGzKs+hZTfXBrC7ftZkKQ5D
xo0FYDoWdJYbrR6HKFi+orqZGxw6Vi+z/pYEZyoRwk7RbRb+iMJrNbu9TV1GAwQ7
fUblcRCPGb5gtmF6wym1umkHZOU4L5HlYpfvs7t1vLlban529JLQzdZtwAssVGrL
Vrw1U8x6w0r6ARzE874hyF4J7FOdJFY1o0ch2lvmQ0uPCH0uX5NT1Cv0kjRsewcT
wu7N0DTJTYy3A7+HJDfIDThBX4xZKw==
=sUbI
-----END PGP SIGNATURE-----

--zsRmWztiiPh816t3--
