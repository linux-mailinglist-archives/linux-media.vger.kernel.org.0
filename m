Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA8045EB18
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 11:10:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232018AbhKZKN6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 05:13:58 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:57913 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233709AbhKZKLz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 05:11:55 -0500
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id BEDFE20000C;
        Fri, 26 Nov 2021 10:08:41 +0000 (UTC)
Date:   Fri, 26 Nov 2021 11:08:41 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5648: Fix lockdep error
Message-ID: <YaCyKYgMwDK4hlNv@aptenodytes>
References: <20211125203156.825539-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9V6xubqYDGcPx0JC"
Content-Disposition: inline
In-Reply-To: <20211125203156.825539-1-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--9V6xubqYDGcPx0JC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Thu 25 Nov 21, 21:31, Hans de Goede wrote:
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

Good catch, thanks!

Though I think it would look slightly better to have the lock in the
ov5648_state_init function itself rather than in the probe.
I guess the same applies to the ov8865 fix, if it's not too late.

Cheers,

Paul

> Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/ov5648.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
> index 947d437ed0ef..9f24bdccf50f 100644
> --- a/drivers/media/i2c/ov5648.c
> +++ b/drivers/media/i2c/ov5648.c
> @@ -2546,7 +2546,9 @@ static int ov5648_probe(struct i2c_client *client)
>  	if (ret)
>  		goto error_mutex;
> =20
> +	mutex_lock(&sensor->mutex);
>  	ret =3D ov5648_state_init(sensor);
> +	mutex_unlock(&sensor->mutex);
>  	if (ret)
>  		goto error_ctrls;
> =20
> --=20
> 2.33.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--9V6xubqYDGcPx0JC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmGgsikACgkQ3cLmz3+f
v9HOsQf8DNv9bTDnZNAvGsNXSeaXYitokRXtVK3pzyZ0P6s0e27mJO+a43RJIGzi
9RMwJ3fbNCP4o8NULuWax0w90VQ86+oN9eRpLuVZlbg+YeZIuTGNfICTiMGoyapA
jnDSRNcMeVpoTX2rlqyGAFsKU6oSdU75po2Gj8/r3HThmVnH4lNQJrM6bHMvbRHX
zQCy5DEkzS7i2w0bTMSvjt/gZAbcyiJVob3W6xUxgGoAuub5oLSDlFvn1GCDfZaf
Hc8mjuUCNQ5Os9OfZt/5iZKbVJJLYA20/YdmcKwtp1ffZASlxEubbRn9YpL2aEVn
/GmknUjefXsPG5CR4vGNSIiTnbBZ8A==
=k3nb
-----END PGP SIGNATURE-----

--9V6xubqYDGcPx0JC--
