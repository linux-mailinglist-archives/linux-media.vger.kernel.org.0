Return-Path: <linux-media+bounces-10382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C78578B637B
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 22:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 828B4283B08
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 20:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A627A1419B5;
	Mon, 29 Apr 2024 20:27:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074E21411F0
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 20:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714422423; cv=none; b=XMINY2vXS97958srZ+RxlASrHkm9FwOVVyAQAYihbgykMv4NTAsg9+0YfNHV2SwrsMGTY1jL3FtqCjln6z+fcA4gzubYvYCKz8zt2rcJcpj0uGeEa69tfeb/bS6Lcc6+Hq8i8zf1bhWnPrlFOtxEUvvZ1/d7t69X51Qxtyx5RMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714422423; c=relaxed/simple;
	bh=T+dTQpO6qcWs+FIYcOcxar1OwjTjraEzbMAu9Rsw0To=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l1pfLKY/UlBjgJdZG2ScYEjSGvfHAAHym+N9xGF7f5U7QJrpPYzm/WBw6Hzxr371U1quDPFtbP4WBG7hNBVw0XYnPdaWWOZ0L8Y0xVJF4riBXcsOoMkZ3oPdBzWkaMfDl6M1IQojWp6EVKv3ofvfG7Jxl+OaMoQORgXCWieJUF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1XaS-0000na-HR; Mon, 29 Apr 2024 22:26:56 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1XaR-00F2hU-Pr; Mon, 29 Apr 2024 22:26:55 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1XaR-00Bj8R-2J;
	Mon, 29 Apr 2024 22:26:55 +0200
Date: Mon, 29 Apr 2024 22:26:55 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Pavel Machek <pavel@ucw.cz>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: et8ek8: Don't strip remove function when
 driver is builtin
Message-ID: <4faume33cuwisfxh7na3iqjzlblnotxcqvaj5ihpqnwdfllvqt@xs6fqd4gmaxp>
References: <20240324160045.238647-2-u.kleine-koenig@pengutronix.de>
 <diats73r4lt7pjuogurvhsk6s6dx5g3cojtdr5bz6coruni777@4nj47bv63vkd>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="edfundwmq7agwfc6"
Content-Disposition: inline
In-Reply-To: <diats73r4lt7pjuogurvhsk6s6dx5g3cojtdr5bz6coruni777@4nj47bv63vkd>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org


--edfundwmq7agwfc6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2024 at 10:20:09PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> On Sun, Mar 24, 2024 at 05:00:44PM +0100, Uwe Kleine-K=F6nig wrote:
> > Using __exit for the remove function results in the remove callback
> > being discarded with CONFIG_VIDEO_ET8EK8=3Dy. When such a device gets
> > unbound (e.g. using sysfs or hotplug), the driver is just removed
> > without the cleanup being performed. This results in resource leaks. Fix
> > it by compiling in the remove callback unconditionally.
> >=20
> > This also fixes a W=3D1 modpost warning:
> >=20
> > 	WARNING: modpost: drivers/media/i2c/et8ek8/et8ek8: section mismatch in=
 reference: et8ek8_i2c_driver+0x10 (section: .data) -> et8ek8_remove (secti=
on: .exit.text)
> >=20
> > Fixes: c5254e72b8ed ("[media] media: Driver for Toshiba et8ek8 5MP sens=
or")
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> I wonder if I failed to make the commit log drastic enough as the patch
> wasn't picked up yet. This is a fix for a resource leak and IMHO should
> qualify to go in before v6.9 (though I admit it gets late for that).
>=20
> Did I address the right people?

Oh, I fatfingered my git cmdline and so missed this patch is in next
already. I still think getting it into v6.9 would have been nice, but I
won't argue if it goes into v6.10-rc1.

Sorry for the noise
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--edfundwmq7agwfc6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYwAo4ACgkQj4D7WH0S
/k5WWQf/Zk+BQvZM1owV2S+VagCZixfg71QkNVHj91+2cDaNig6Uoq/gUdyLsQKj
2cj/ExsIWgRp0ojPwiIiJKhnY9E57LQi2CGSKwPfrrBdlqkIJ72mRxolv9uXQC9k
Pr3J6m9KXUYJhiVX88MtDw4DE8O6xKnVYJJCvf+nLBjdcXe1NzCzPMCwOGOdRPQ2
lPnTW0r4u1zqGM8csSxifQKdbl8xcLtu6/2KVEf6p25C1iIuL43xNk07sZFs7Vgq
6eP9zoxkhQZEdJkD96rRCaIds0smT+YGR9oADXxeR5zNXNWyph0KklBLEEXC2+2/
wi0ieS0mXvq2djNNwkV/Itz8KtpxEg==
=jSfD
-----END PGP SIGNATURE-----

--edfundwmq7agwfc6--

