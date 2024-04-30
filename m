Return-Path: <linux-media+bounces-10481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E6A8B7E1C
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 19:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7CF3DB21361
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 17:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EED617994C;
	Tue, 30 Apr 2024 17:05:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EF217B4EC
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 17:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714496710; cv=none; b=RcAcU3QQkGUkrJdt9R80H+zY42DJ+5P/seOuOZiVZAOqhhtk/9ku+2+qadybJ+y1n+qjBcyimckRraqAMk5baEvt9Muded1qnSAtwyn2Smb5rc88gzmKmRNfLb4Ggv29HVOJHrh/FWzlrfJZphd3Q7BX3j6YriLTgLcn/+1sA5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714496710; c=relaxed/simple;
	bh=rMBg6u1EA70/+yUEPyTu2eTdacWdhTx/rGQWoF0dDUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHHZFBmXE1btsCo8FYD17GJEvRQDHUHF34sMpQharI9a931khugX9ur9MEFk4GlsSrMRQFlhO4k425aA+ZEuaJuqP/383SOT5ue6o/cFiZM+qKemPc5uxHM3ckalWUS6foNRNjJVMU5CxOrPvvXxO0g5fFIoVKirRD/EL74bzdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1quV-0002QV-5s; Tue, 30 Apr 2024 19:04:55 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1quT-00FCW5-C3; Tue, 30 Apr 2024 19:04:53 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1quT-00CL1B-0w;
	Tue, 30 Apr 2024 19:04:53 +0200
Date: Tue, 30 Apr 2024 19:04:53 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: kernel@pengutronix.de, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: et8ek8: Don't strip remove function when
 driver is builtin
Message-ID: <ys6hi6jdfuxirzuajb3lng7lguqyqitn2xli6xyxbxfyqqhjl6@rfapblsho3im>
References: <20240324160045.238647-2-u.kleine-koenig@pengutronix.de>
 <diats73r4lt7pjuogurvhsk6s6dx5g3cojtdr5bz6coruni777@4nj47bv63vkd>
 <4faume33cuwisfxh7na3iqjzlblnotxcqvaj5ihpqnwdfllvqt@xs6fqd4gmaxp>
 <ZjAUbd5UunISLTEO@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zblxukj253sd5cfg"
Content-Disposition: inline
In-Reply-To: <ZjAUbd5UunISLTEO@kekkonen.localdomain>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org


--zblxukj253sd5cfg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Sakari,

On Mon, Apr 29, 2024 at 09:43:09PM +0000, Sakari Ailus wrote:
> On Mon, Apr 29, 2024 at 10:26:55PM +0200, Uwe Kleine-K=F6nig wrote:
> > On Mon, Apr 29, 2024 at 10:20:09PM +0200, Uwe Kleine-K=F6nig wrote:
> > > Hello,
> > >=20
> > > On Sun, Mar 24, 2024 at 05:00:44PM +0100, Uwe Kleine-K=F6nig wrote:
> > > > Using __exit for the remove function results in the remove callback
> > > > being discarded with CONFIG_VIDEO_ET8EK8=3Dy. When such a device ge=
ts
> > > > unbound (e.g. using sysfs or hotplug), the driver is just removed
> > > > without the cleanup being performed. This results in resource leaks=
=2E Fix
> > > > it by compiling in the remove callback unconditionally.
> > > >=20
> > > > This also fixes a W=3D1 modpost warning:
> > > >=20
> > > > 	WARNING: modpost: drivers/media/i2c/et8ek8/et8ek8: section mismatc=
h in reference: et8ek8_i2c_driver+0x10 (section: .data) -> et8ek8_remove (s=
ection: .exit.text)
> > > >=20
> > > > Fixes: c5254e72b8ed ("[media] media: Driver for Toshiba et8ek8 5MP =
sensor")
> > > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > >=20
> > > I wonder if I failed to make the commit log drastic enough as the pat=
ch
> > > wasn't picked up yet. This is a fix for a resource leak and IMHO shou=
ld
> > > qualify to go in before v6.9 (though I admit it gets late for that).
> > >=20
> > > Did I address the right people?
> >=20
> > Oh, I fatfingered my git cmdline and so missed this patch is in next
> > already. I still think getting it into v6.9 would have been nice, but I
> > won't argue if it goes into v6.10-rc1.
>=20
> You should have received an e-mail from Patchwork when it got applied to =
my
> tree (or around that time).

Oh, I did indeed. It would be great (at least for my workflow) if these
notifications had an In-Reply-To header to thread with the original
mail. Hmm, maybe that's not so easy as the notification might contain
information about >1 patch. Hmm.

> It may still take a long time for it to be in linux-next and that's of
> course quite confusing. That will change eventually as we're amidst
> changing the process but we're not there yet.

Thanks for the heads-up.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--zblxukj253sd5cfg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYxJLQACgkQj4D7WH0S
/k4bsQgAnCsx0SVfK2RKzoonqVJUmz9XsDB1jAhgICSbOcPQe5F87R2c+vs4vu17
msksdrjr+NcUUZA1v8hMs0Tk6EGyR42lYhAS2/ojLtRzs4zCsrZy867GLAAOXohi
wl05MgxttC8/iI2yxrhs92iHGlSMlPH4i9298rnioYj+2DPyZ2hcFxBmjGfNjcWv
9XS6eSep/ajsL3IbKL7BRyE/xPUGR82Vmz4q0qTYRuT6bjsKRZzH65f2BudfNCMp
reshthb7/qS93/Zods1bTkJJOy6wm/lpiexeV+6lMbeH6FMLGh4/Wwn2y8ozt30q
2fe+vVVc1VI2jBt6vbj1VaX6B7oQ7w==
=4Hlv
-----END PGP SIGNATURE-----

--zblxukj253sd5cfg--

