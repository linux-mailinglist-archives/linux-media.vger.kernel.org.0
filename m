Return-Path: <linux-media+bounces-10383-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3FC8B63BB
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 22:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58028283B71
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 20:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0616B177998;
	Mon, 29 Apr 2024 20:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="hEv4TzUF"
X-Original-To: linux-media@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5701B94D
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 20:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714422969; cv=none; b=P0cr8T363qEjj60Xwr6ig40WjSwDBSAof440QEUrwSwIrsrAFzsXG76Zpgmwo9gVM1PZaJTBIcjhIyHMpoH9MrGpUHQs8iFfDpIsRSoJu567mPWaryeFtxvu1rFkYHxITjYXS8GnjzYigKU7KavKmzugorUrsuR6Mn/6+qR3iR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714422969; c=relaxed/simple;
	bh=oVWDLb9uDw950sCva/o3nQcEDqsSEx9UabG89IuD2fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9vbjnJsjY0I7NSBvH0UYEolYXpxDZRqtz+V0iZeN9LS5CHki2g2hKb2mCCMtq9643bhr/jYwUfVDPaOqKqyTmwUyQTK68CpY20AnLPZ8Il8ykwSL2Bm9jPTil96BJhy93Pdm1e+fZ17+11IX/viWOMtGaW/hObWq/B6lrAaNc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=hEv4TzUF; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id ACB771C007F; Mon, 29 Apr 2024 22:35:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1714422957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dQC1+XZW449okadJA7aM5WBcGnb781qBfLtcJOjVtLM=;
	b=hEv4TzUFwAYcjE+JKBAdeph7GCu7LdAhgBnebL1OodBrvsHIcLP0Ceuyj/voiwD6XCGmvC
	7i/uK5eLiJmeZB+SSj6j6HTLbvLmyKyfaXrwwO5IdclKnqN4A2zvnOw4XtKpk+FeCBZo+e
	KIWBGi2hteHj5yCoTUh5rXTLfdSw2yQ=
Date: Mon, 29 Apr 2024 22:35:57 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] media: i2c: et8ek8: Don't strip remove function when
 driver is builtin
Message-ID: <ZjAEra8oZ9se0V9G@duo.ucw.cz>
References: <20240324160045.238647-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dqg8izxWskmCafJc"
Content-Disposition: inline
In-Reply-To: <20240324160045.238647-2-u.kleine-koenig@pengutronix.de>


--dqg8izxWskmCafJc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2024-03-24 17:00:44, Uwe Kleine-K=F6nig wrote:
> Using __exit for the remove function results in the remove callback
> being discarded with CONFIG_VIDEO_ET8EK8=3Dy. When such a device gets
> unbound (e.g. using sysfs or hotplug), the driver is just removed
> without the cleanup being performed. This results in resource leaks. Fix
> it by compiling in the remove callback unconditionally.
>=20
> This also fixes a W=3D1 modpost warning:
>=20
> 	WARNING: modpost: drivers/media/i2c/et8ek8/et8ek8: section mismatch in r=
eference: et8ek8_i2c_driver+0x10 (section: .data) -> et8ek8_remove (section=
: .exit.text)
>=20
> Fixes: c5254e72b8ed ("[media] media: Driver for Toshiba et8ek8 5MP sensor=
")
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Pavel Machek <pavel@ucw.cz>

You might want to cc akpm if this does not get picked up.

Best regards,
									Pavel
								=09
> ---
>  drivers/media/i2c/et8ek8/et8ek8_driver.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c=
/et8ek8/et8ek8_driver.c
> index f548b1bb75fb..e932d25ca7b3 100644
> --- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
> +++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
> @@ -1475,7 +1475,7 @@ static int et8ek8_probe(struct i2c_client *client)
>  	return ret;
>  }
> =20
> -static void __exit et8ek8_remove(struct i2c_client *client)
> +static void et8ek8_remove(struct i2c_client *client)
>  {
>  	struct v4l2_subdev *subdev =3D i2c_get_clientdata(client);
>  	struct et8ek8_sensor *sensor =3D to_et8ek8_sensor(subdev);
> @@ -1517,7 +1517,7 @@ static struct i2c_driver et8ek8_i2c_driver =3D {
>  		.of_match_table	=3D et8ek8_of_table,
>  	},
>  	.probe		=3D et8ek8_probe,
> -	.remove		=3D __exit_p(et8ek8_remove),
> +	.remove		=3D et8ek8_remove,
>  	.id_table	=3D et8ek8_id_table,
>  };
> =20
>=20
> base-commit: 70293240c5ce675a67bfc48f419b093023b862b3

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--dqg8izxWskmCafJc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZjAErQAKCRAw5/Bqldv6
8qqHAKCQDCdXqoAQDAqt+5opOz/4B8FR/gCggYU7y/jdPp6Ajf+cFFVgkUkCgS8=
=q44G
-----END PGP SIGNATURE-----

--dqg8izxWskmCafJc--

