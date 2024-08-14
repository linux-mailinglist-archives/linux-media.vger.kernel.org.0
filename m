Return-Path: <linux-media+bounces-16307-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DB0951CFE
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 16:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05E9EB26021
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 14:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD78D1B32D5;
	Wed, 14 Aug 2024 14:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cTPxjzkY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDBF1581E5;
	Wed, 14 Aug 2024 14:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723645408; cv=none; b=CN2mJawD5DTD3T+9NnY1NmbNBLarBJKskJJUPONOasfwDFnNAkh7riWym+3w1DBNactqzyZ7HYDslem4jPxFvW2bIvkpjhK1dWeFh0euPpK5csS9NJ6RgrGpAyougTAnKfDfdtvIu/dF7kez/7i+pgSYojuVmcUIHKBipruWgZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723645408; c=relaxed/simple;
	bh=WmZB11vMhDli+fdnbaer4GhKha6aTMQfRYG+gVMDKjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S121/nTkZwzuI60qH7EWRbKInb22J3hfBmigBDOQs6bVJOa7LTFv7jNH/lphgH31EIb3BXV5YHMnB2g3H6APHdF7M6Hi3gaLzCrxZ9rSYzTJoY6erdYhOII3gH7g3XB7eX5cdy637wvbWWsYfJLTNVBDg35u7JeqVy4g++PHdz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cTPxjzkY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD55C116B1;
	Wed, 14 Aug 2024 14:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723645407;
	bh=WmZB11vMhDli+fdnbaer4GhKha6aTMQfRYG+gVMDKjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cTPxjzkYWvs0yVd0cKeh+TgTW1yqKtc98a/URuxpzaD0smPjAHyIA/kTknCAM0AaX
	 3KM4BqEt1OMcanuaUWGvQVsIOPR4jy1BEQzE5FUCORu1IRPftFb1wJtYXoT1JMhXhj
	 dIGONJdzJyxPLEI5HibQu0DtW9+xzSNJLL7C0cdv98dSdhncWrHUHdA77j5vSxXgl3
	 vUy6R1GBzhHKGqqXzbU0k3z9XrVW3MpqN7124EDKjE0sHvFu1miujj7b38fVOmL7bu
	 54+mqlzNBUPFICA+jLQj65IEpFyGSMbVZjXWaLAY46d2SKgCQWaZE9/3Rzs0bzZvhk
	 D2fDTEhW5AuPg==
Date: Wed, 14 Aug 2024 15:23:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Keguang Zhang <keguang.zhang@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
Message-ID: <20240814-delicate-oil-d1eef61f0eda@spud>
References: <20240808-loongson1-nand-v8-0-c96dea418b41@gmail.com>
 <20240808-loongson1-nand-v8-1-c96dea418b41@gmail.com>
 <20240808-backyard-unglue-3cf429ad8da5@spud>
 <CAJhJPsVOTAj9ePzeHkwDX049FKd=9Rs_NjQE2qwQL76GKSC66Q@mail.gmail.com>
 <20240809-smuggler-patrol-067003f0ba9b@spud>
 <20240814091231.1d9525be@xps-13>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uTuK05C7cVKhlzRv"
Content-Disposition: inline
In-Reply-To: <20240814091231.1d9525be@xps-13>


--uTuK05C7cVKhlzRv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 09:12:31AM +0200, Miquel Raynal wrote:
> Hi,
>=20
> > > > When I first read "nfc" here I thought it was a copy-paste mistake,=
 as
> > > > "nfc" is a technology of it's own. I think it would make sense to r=
ename
> > > > to "loongson,ls1b-nand-controller" etc to remove that sort of confu=
sion.
> > > > These devices might not implement NFC, but what's to say that a fut=
ure
> > > > device will not?
>=20
> I believe the nfc (also, nc) abbreviation pre-dates the NFC spec. But I
> agree, it may be misleading. Even though I don't foresee any NAND
> controller with NFC coming,

Hm, I think you misunderstood - I meant loongsoon SoCs that had nfc
controllers and nand controllers - not nand controllers with nfc!


--uTuK05C7cVKhlzRv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZry92wAKCRB4tDGHoIJi
0mPyAQDY8GhTPbdBgP9nnui5f6LJNjG7g/Cuwm0J5iLGHBRxpQEAi3GM64KN4+j2
vQ4LyUmofQ4pQttyAo5LJ506oRmyyA4=
=rLLl
-----END PGP SIGNATURE-----

--uTuK05C7cVKhlzRv--

