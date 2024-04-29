Return-Path: <linux-media+bounces-10381-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FBA8B6364
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 22:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22F3DB2173A
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 20:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D68651411EE;
	Mon, 29 Apr 2024 20:20:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E6413AD18
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 20:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714422020; cv=none; b=KwYSmgwm3JBq9sfDHqInTcneLuWmuAZfRzAX2fkBLYXf4S6ZZrSW2tJoh/woNLnTbpMrDehTzsH5NajgVlNl9vEstO3bR4rTivcaFqgvn4G7a02XUS+ul3cXDU5AViTkcjYUexq6V1x1PZHlxD0rQKz7jzPVrIeIl+tx9JavxPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714422020; c=relaxed/simple;
	bh=NND6BctsYq3yfK8h5tMFWfXrN1rwfgwPDbE3eohQnkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjkDyUopOnZcLiObMrXs2LZMuODTHZVU0f1t5acqUFlv2J/47+67zBH2sCwb6vAbIkiVsnRIAon8IGCNlqNfyhb1Us1mncevLg/BzjlzGozL9Vh1W4vHISCTcXz6lc+n1TuJOmKXCs3HX6ibp8S9iKDGVlqCzmak+DRrsPeGI0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1XTu-0007pz-RI; Mon, 29 Apr 2024 22:20:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1XTt-00F2gt-Hi; Mon, 29 Apr 2024 22:20:09 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1XTt-00Bixf-1U;
	Mon, 29 Apr 2024 22:20:09 +0200
Date: Mon, 29 Apr 2024 22:20:09 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Pavel Machek <pavel@ucw.cz>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: et8ek8: Don't strip remove function when
 driver is builtin
Message-ID: <diats73r4lt7pjuogurvhsk6s6dx5g3cojtdr5bz6coruni777@4nj47bv63vkd>
References: <20240324160045.238647-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="smguzi4radq4w4wt"
Content-Disposition: inline
In-Reply-To: <20240324160045.238647-2-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org


--smguzi4radq4w4wt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sun, Mar 24, 2024 at 05:00:44PM +0100, Uwe Kleine-K=F6nig wrote:
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

I wonder if I failed to make the commit log drastic enough as the patch
wasn't picked up yet. This is a fix for a resource leak and IMHO should
qualify to go in before v6.9 (though I admit it gets late for that).

Did I address the right people?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--smguzi4radq4w4wt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYwAPgACgkQj4D7WH0S
/k63qwf/UqKWhNinvSW+/dqfIRLP/19sF5CHGEr6Ps6bBW7qo+MXtIULR/zR5nfz
MmIVanFRvx07fd+MKR7CVVrAmyRw6cWBNLJPCm3nj2VDKkbQpGfTT6JrqdPxODcM
JUakRdnjSegYDcSeVG82LW5sthv2XGvuNJimL97CQA3PRkJVTEAbHhxSYK8YF8OQ
FIQ/eOO7CvS/VOAcNLq8SJgAgy0CyCyVDimescpE2Ay1ny9SdF9FcpG+3WZ9aX4C
frMYkv8zba25QxCwYE3kAQSn6GCnYKOQOfrZZv0M7+nAfxgbhw1mI6XMesM0F8KX
Y9fsqoCh/6c6cs+GYsE/PvQ7Se+Drw==
=Z8Nc
-----END PGP SIGNATURE-----

--smguzi4radq4w4wt--

