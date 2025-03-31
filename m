Return-Path: <linux-media+bounces-29040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9008CA76273
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 10:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAC9F1887C85
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 08:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0C91D95A3;
	Mon, 31 Mar 2025 08:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RvaMtatN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A7E13C816
	for <linux-media@vger.kernel.org>; Mon, 31 Mar 2025 08:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743410078; cv=none; b=dO73rBf3+/phjNcwK38eQNr0fxVxvR0jLi/sVxZS02OE4NWmXu5QBuNqyy+KG0sO9qs+SrWoQaPgeUD4iT97lzy9ZDQds3XwCDok2kYijQGf3lRLltXKBTZ8NPz9mQ/+AHxG0uR39oxBhRzMFmKEwd1KXcRkQyOIY4NvBm+Vyyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743410078; c=relaxed/simple;
	bh=nkc8yXiQaPb+iayptLaJUMi+sPOcZnTLBQBWtGMTQNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivvdKJ0NBxp+F3bd5f+w3K5+LhqP1DhYdimHeAOGs0O3Ur9qHXncc6HgNmU/qZw9i2S4rfgSDF4rmYJP7qt5j6ozd7jTPvH4B2JBS/xPYaUVKIo4p9QZwc3ZRvERNPuNJx6lMntUoY0yOuvC1DwZMR+3ZTb7F8fDjB9W5uR58yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RvaMtatN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=nkc8
	yXiQaPb+iayptLaJUMi+sPOcZnTLBQBWtGMTQNA=; b=RvaMtatNZh9bCclUcW56
	QpUsmmhMtJMHbypRBoumHRdZe3RAi2AuXh+N9K1yr/s7TY/T7L+mNEkPjuI5m8Cb
	wVV+z3q9VU83GHu5lbnSvDmuc5Da19+SJ4OCecjmHa6waxGeQDvpHdV+pPa40RRy
	C4+U1EL67dynYhlt52JBY0E7U05RuJFQDM1niY/HP+rIPH3tDt7QgRilIV7ylzPw
	6o1j7qrfJvHE8SamPf0WeMLVCH6AHAK41FPnUFYG5E6rxIV80hAf58TbB2+UdavA
	PoYmx5gDeLexWK2U1wgUi1dk15VS26mCLa1f2b/7nEkGgDQ3aBFwt8w27NF8xqqa
	zQ==
Received: (qmail 1159115 invoked from network); 31 Mar 2025 10:34:33 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Mar 2025 10:34:33 +0200
X-UD-Smtp-Session: l3s3148p1@tMYdSp8xDtpQ8qei
Date: Mon, 31 Mar 2025 10:34:33 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Heiner Kallweit <hkallweit1@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: si2168: increase cmd execution timeout value
Message-ID: <Z-pTmaRpf_FUAlkk@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Heiner Kallweit <hkallweit1@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20250331075838.3444332-1-christianshewitt@gmail.com>
 <Z-pNBAVhUwrcwDQe@shikoro>
 <0073F061-994E-4DE6-AC0E-E7E03DD30275@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XzZliXgLQrimYMfS"
Content-Disposition: inline
In-Reply-To: <0073F061-994E-4DE6-AC0E-E7E03DD30275@gmail.com>


--XzZliXgLQrimYMfS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 12:31:48PM +0400, Christian Hewitt wrote:
> > On 31 Mar 2025, at 12:06=E2=80=AFpm, Wolfram Sang <wsa+renesas@sang-eng=
ineering.com> wrote:
> >=20
> >=20
> >> if (cmd->rlen) {
> >> /* wait cmd execution terminate */
> >> - #define TIMEOUT 70
> >> + #define TIMEOUT 200
> >=20
> > While we are here, can we rename it to CMD_TIMEOUT and put it next to
> > the #includes?
>=20
> I=E2=80=99m at the novice end of kernel contributors, so like this?

Exactly! Thank you. If you send v2 of this patch, you can already add:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--XzZliXgLQrimYMfS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfqU5gACgkQFA3kzBSg
KbY+gA/8CS6Jf81Um9K5Oc2V4wkAnxxChfhbaJTrMqp/W5SqfcllGDs8Pr9UGMnU
Px99+cMeNNjft9bFx3NFUw1DLCNbARlQDK36pMXD94STo9Vqjc2AmXHn5/Mc0/wO
6Q03apTlrC4ZNVdaKkc6BYk/i2PdAUa9DcGH0qugk38EmmphiwDodBEeRtwa774W
vsoZHIVtVII5zXLW49+/Xh2+x5OwQNoPxp8J4q3VhGVnhu2RYjdNrb+5aMPArNoC
48EANm72zhAFiHkM+LBjxlIlOs3kvXl/jhLOsz6kmoecJ1OTeitDYqpKOVgfs+3O
VvRMkoL0it8K25aJaL4qsNgm5e+dFJJVwmiyJc3BqycCMBhIOCmM3h8hCE5BOoPW
SxTJ9iJDNiIXb635U/oNQZzrUOdxBrXsM0WkV8MWwAA2DxsBOgYG+PAfUZoTAg3j
FDIYcW5NXw1AngVho/xhK1UIQtbijJZM0PnlDOIFGkPIOJtEQOj5o5TNKxXwk+y8
xGkdrJ14773R4OPx7lAwKR4kK11hFbzdpL3TQWe8wZ4Io0/eJkz6KBkpa0niHoPf
MUp/07i52MhrodkWPHIVyw6IhBn3fkQeSGDKc009ac68Eim1UUgCSLtjKTczWUgR
vhuYPDnWykUANgic+Bxj6RSam/4dfM2CQl0/bEfuQqVK8RKS2Sg=
=5t2X
-----END PGP SIGNATURE-----

--XzZliXgLQrimYMfS--

