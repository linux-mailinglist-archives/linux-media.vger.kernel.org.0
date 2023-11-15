Return-Path: <linux-media+bounces-401-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2D47ED1E1
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 21:16:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74E8D1F27483
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 20:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7F3433B4;
	Wed, 15 Nov 2023 20:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOaqeBZd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C777E3C49F;
	Wed, 15 Nov 2023 20:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16848C433C7;
	Wed, 15 Nov 2023 20:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700079407;
	bh=ZVjSqLjKaAHIOMXlYsfwrIVccwu0qJMyjQZ2lpKAeK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gOaqeBZd4d5l74Suo2vktBpX3X5I2qB1CKVCC2HIY3pzJDRmYpmbZwiYkDNZFCX6/
	 HaL8djZYNeNCi0PjXUmnL0PIo6xm7n6XqXEIOropvDb9g2QzC9xEm7zMWsOsvqqlFH
	 Hb0R54p4dKv3cGzHRNyLoDRyMhcBk0k8jAcK2Jp1nK5BMYHfYHsG4ybtI7dLFxpDkI
	 0+wuQYEGHkyAT3O12HEczG+K9g1Xg3H1conCmqTPytYbmqMmfaVHFOiMfTmjirshiw
	 M3p4sQehGCqiwB0ROeve7HaEgAgYRKcGJiFqoG0b4PSFnvZKlxYTg5drdaEUTkjla/
	 trHWosst3E6xw==
Date: Wed, 15 Nov 2023 20:16:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>, mchehab@kernel.org,
	heiko@sntech.de, hverkuil-cisco@xs4all.nl,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	conor+dt@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, alexandre.belloni@bootlin.com,
	maxime.chevallier@bootlin.com, michael.riesch@wolfvision.net
Subject: Re: [PATCH v10 1/3] media: dt-bindings: media: add bindings for
 Rockchip CIF
Message-ID: <20231115-angles-entrust-f72112053ee0@squawk>
References: <cover.1699460637.git.mehdi.djait@bootlin.com>
 <037bcabf97294d37b271537e4b11fb88cf9bb6f6.1699460637.git.mehdi.djait@bootlin.com>
 <20231109-closable-superglue-5e7f39739cf1@spud>
 <ZU0avuRRaITV4jws@aptenodytes>
 <e5b1f0dd-0aab-4ce5-82ba-879a4d736e7e@linaro.org>
 <ZU0f33clFwlsTw16@aptenodytes>
 <20231110-appetizer-fame-2152806c7442@roley>
 <ZVJUsDb1mPVtcjdX@aptenodytes>
 <20231114-abnormal-uncross-dcebea2e82ae@squawk>
 <ZVTemwY6gvFdQMib@aptenodytes>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p7xwxdlI3yVO6ndn"
Content-Disposition: inline
In-Reply-To: <ZVTemwY6gvFdQMib@aptenodytes>


--p7xwxdlI3yVO6ndn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 04:07:07PM +0100, Paul Kocialkowski wrote:
> Hi,
>=20
> On Tue 14 Nov 23, 17:51, Conor Dooley wrote:
> > On Mon, Nov 13, 2023 at 05:54:08PM +0100, Paul Kocialkowski wrote:
> > =20
> > > > Ultimately, I don't care what the file ends up being called when th=
ere
> > > > are multiple devices documented in it. I'd ack a patch renaming to =
the
> > > > =C5=93riginal incarnation of the IP when the documentation for that=
 IP is
> > > > added without a second thought.
> > >=20
> > > That would be agreeable to me if my proposal still ends up feeling un=
reasonable
> > > to you. But I might very well take you at your word since I ended up =
purchasing
> > > a RK3066 board in a moment of weakness last week.
> >=20
> > The ideal outcome I suppose would be documenting both variants. If
> > you've gone ahead and bought one, give that a go.
>=20
> Yeah I'll try to do that eventually, but we really want to have this seri=
es
> merged as soon as possible. So it wouldn't be reasonable for us to wait f=
or
> RK3066 support.
>=20
> What's your final decision for now: is it okay to keep the file named
> rockchip,rk3066-cif.yaml (without this compatible in the file) or do you =
still
> want it called rockchip,px30-vip.yaml?

I'd still rather it was called after the only compatible in the file and
subsequently renamed, sorry.

--p7xwxdlI3yVO6ndn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVUnJwAKCRB4tDGHoIJi
0oTZAP4yHDcteNplKbcsPunVdLyM9hU/+gXNLfFa0T0GvElWsAD9HZ8JqDT4+bnB
ubg3obCIgBxf86lXeQLb/cvYAnwuswg=
=akr5
-----END PGP SIGNATURE-----

--p7xwxdlI3yVO6ndn--

