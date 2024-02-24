Return-Path: <linux-media+bounces-5850-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4F2862386
	for <lists+linux-media@lfdr.de>; Sat, 24 Feb 2024 09:53:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF0D1B226CD
	for <lists+linux-media@lfdr.de>; Sat, 24 Feb 2024 08:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCE11B59B;
	Sat, 24 Feb 2024 08:52:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D3717748
	for <linux-media@vger.kernel.org>; Sat, 24 Feb 2024 08:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708764748; cv=none; b=HXum0jZwycn4SbpGTDNUxfyeO4vFc4HJAnn7tQ10jhK+lFGeIbeD4xIe3oJfMeD6xHD1gjjFGXHjOVZqvWFWZmIJyhuDiAtWIDRmY1HD/BaopTybzJvSGthM/xzXbTsT2OwSkSKO0GRLUtfDrISI28z0QWi6937KWnq1JuL151k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708764748; c=relaxed/simple;
	bh=h0tzzw/TaYoqZpql5nk5fV6UuDqzFbcVMDzMQIcA6ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jk/MRF+EMsgM+O5AB6Pk5jKCyI+GuRUcWpS5PSt9toAP3AfD2IF8X8QH45PNjyH54P2aGonhSOM2SX5/7AC1DvF/iR7jPTLTFxBtkVJYcHwsL8jgFMMEFtMaoaHbBCpeAfrKJvjaDqkk5dTnbRFBoCnkqFWIYUO2kqSAJyYcmu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdnlZ-0004RB-8L; Sat, 24 Feb 2024 09:52:17 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdnlY-002a8H-2s; Sat, 24 Feb 2024 09:52:16 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdnlY-00AtA5-00;
	Sat, 24 Feb 2024 09:52:16 +0100
Date: Sat, 24 Feb 2024 09:52:15 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jackson Lee <jackson.lee@chipsnmedia.com>, Nas Chung <nas.chung@chipsnmedia.com>, kernel@pengutronix.de, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH 1/5] media: chips-media: wave5: Convert to platform
 remove callback returning void
Message-ID: <i5fqdbsn2xq7hq5rtgz6mfmbftn5liijdrb3f2ck7h2zeofaow@ybscvafh7zre>
References: <cover.1708692946.git.u.kleine-koenig@pengutronix.de>
 <dfcaf3d23ea35655d8b3a9254ee00f40c20c95c4.1708692946.git.u.kleine-koenig@pengutronix.de>
 <f88a238f96215aef5a05d9d532c199eaea82883e.camel@ndufresne.ca>
 <8cd8e8cc64458b93cd25b1f44a2a143e60084499.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ylqqq3fs57nt7p2r"
Content-Disposition: inline
In-Reply-To: <8cd8e8cc64458b93cd25b1f44a2a143e60084499.camel@ndufresne.ca>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org


--ylqqq3fs57nt7p2r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Nicolas,

[reordered the mail a bit to give understandable context.]

On Fri, Feb 23, 2024 at 01:20:59PM -0500, Nicolas Dufresne wrote:
> Le vendredi 23 f=E9vrier 2024 =E0 13:19 -0500, Nicolas Dufresne a =E9crit=
=A0:
> > maybe its already been discussed but ...
> >=20
> > Le vendredi 23 f=E9vrier 2024 =E0 13:59 +0100, Uwe Kleine-K=F6nig a =E9=
crit=A0:
> > > The .remove() callback for a platform driver returns an int which mak=
es
> > > many driver authors wrongly assume it's possible to do error handling=
 by
> > > returning an error code. However the value returned is ignored (apart
> > > from emitting a warning) and this typically results in resource leaks.
> > >=20
> > > To improve here there is a quest to make the remove callback return
> > > void. In the first step of this quest all drivers are converted to
> > > .remove_new(), which already returns void. Eventually after all drive=
rs
> > > are converted, .remove_new() will be renamed to .remove().
> >=20
> > What if we have another screw up ? remove_new_new ? Why not just remove=
 the int
> > across the tree instead ? Or perhaps its a two step plane ?
>=20
> Please ignore my comment, sorry for the noise.

Is that an Ack? :-)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ylqqq3fs57nt7p2r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXZrj8ACgkQj4D7WH0S
/k5uqwgAtdPlV1RBhqqYRjud2BKyiWjaOX/6empNxjZWPhKyBuXHfNeOjgTXySyw
95n+fA+WbPZAjrX7z4jemqdjZckcQn6F2I98WZsI0TDQ0zG3wWV2kRcqLexrUppP
3Am3zhKyGXw47cAxfRPFJ1CvA1/i27Clobe1to0ij8RfoMXdt6mBMu75tA8hCB2z
daZjesOVsxdFmwLKe7OuzPTcOq6JUoL0BdHQAbA5EjenDRA8oypMOq9lxAAERjXT
EZvIF+/vkjJDNwceO+Ih301LpKVnIipJ2Jzx18lZXyv02ZpYcMIty60nAOOj3rCU
S45Ayp5i+W61V0VY4/Wv62eRIsZC8g==
=tIuk
-----END PGP SIGNATURE-----

--ylqqq3fs57nt7p2r--

