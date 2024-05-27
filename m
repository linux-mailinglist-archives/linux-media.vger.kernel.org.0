Return-Path: <linux-media+bounces-12009-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC7A8D09C7
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 20:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BB7E1C22156
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 18:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1190515F40F;
	Mon, 27 May 2024 18:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t3PQeIQ4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D3E1DDC9;
	Mon, 27 May 2024 18:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716833572; cv=none; b=TZtpCH2imEjpvYGIsL2DFt2QAfZXg2fo1fm7N0KTIQ1UvI+El5/4NLdYNEWfgZOC4tj8IcsN+FtahSlh7hZKYmo4tbE8h8jIl2mYbmB+T9/cVNL0w4ZgtbeE2iJnnlFb1qjCk9/KQWF2Yx9RIlHkt2oEd7TBR9BFpzSYY4ELmA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716833572; c=relaxed/simple;
	bh=8lXj9WHGNwp+220VhqIky24ukf1ZpnFuJNZFQxtuLPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MXOoDXgiezGYPpVj4udJLkt+pejveMMg6CD9+1kVypH6SzXyqCgDC8QKtr+x/WWEMr767LSI8BOIQmuz7hDxEkeduplpOTuugaSpqnQjmAWIKMHw5JDXxxdnrC0X7oh16pTPpyMcYEYav+zMDBdyrs3cS2874beluUSyEPym2eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t3PQeIQ4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187F7C2BBFC;
	Mon, 27 May 2024 18:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716833572;
	bh=8lXj9WHGNwp+220VhqIky24ukf1ZpnFuJNZFQxtuLPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t3PQeIQ4SpZW98CNmYQIrpYvoFGdUvptIdkyKStr6d2sYmX8o7yRFep//Jix2tSdY
	 1NEzNE+a3Nz4rjJRdaUvN6UlIh0jFeM1k0DnRJ2rXN4n4VcX8l6xA8RNt9qclPW48i
	 NJhpmmGpoan7SWG6klzw2aDYK2fFkTLZT/UWBWPTAmGo2Y3NionVYyf59zsyCK1BVA
	 jMYzeKXhS4ZG9ZGPkfuuCPtf5v6QRpwUpWsLIXc5ApSaOJ1FgWO4PG2blOqy0dPrER
	 fKMmwg88j0ZQh3G5WiOMpUQZ120HPtZ0kDrQyMK76ZFTN8l9wmCQGCIM4I7pfwtG49
	 DYDvuSxu2yEjA==
Date: Mon, 27 May 2024 19:12:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: renesas,vin: Add binding for V4M
Message-ID: <20240527-renewal-anytime-458e92f8d3e8@spud>
References: <20240527131849.1678877-1-niklas.soderlund+renesas@ragnatech.se>
 <20240527-replica-mace-2306a85ad5d7@spud>
 <20240527180312.GA226593@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UB740MemTKBCxc1J"
Content-Disposition: inline
In-Reply-To: <20240527180312.GA226593@ragnatech.se>


--UB740MemTKBCxc1J
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 08:03:12PM +0200, Niklas S=F6derlund wrote:
> On 2024-05-27 17:37:21 +0100, Conor Dooley wrote:

> > Should be with the driver:
> > https://lore.kernel.org/all/20240527132429.1683547-1-niklas.soderlund+r=
enesas@ragnatech.se/
>=20
> As I mentioned in the other thread about the ISPCS bindings, I=20
> intentionally posted the bindings separately to allow parallel=20
> upstreaming of driver and DT users.
>=20
> Is it really a bad idea to do it this way? For other work I have done=20
> that involves more complex DT changes then adding a compatible, such as=
=20
> adding a new device or adding more properties to cover more features=20
> only available in a later version of a device. I always post the DT=20
> parts first as this can spur discussions about the design and only after=
=20
> they are agreed upon do I post the driver parts that make use of them.
>=20
> Seems like this would consume less review resources as the bindings can=
=20
> be agreed upon first, before anyone have to spend time reviewing a=20
> driver that might need to be redesigned as the bindings could be=20
> improved.

I would always rather have the driver implemented rather than just
discuss some idealised bindings. The first place I go when I have
concerns or confusion about how a binding is intended to be used is the
driver - so it doesn't make my time reviewing something easier, that's
for sure.

Additionally, having a software implementation can make it obvious where
mistakes may be in a complex binding or notice things that were omitted.
Getting a binding merged early in that case can easily become a
hinderance..


--UB740MemTKBCxc1J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlTNHwAKCRB4tDGHoIJi
0pBuAQCQXWUv3RQqiW4xlSVctdmWW9xyuswFQkuel20O6HR8NAD+OZToh7xO+QrQ
zhxlX7Kvg/KQQ3GQEjxhWZNLQ37SHQU=
=0YJs
-----END PGP SIGNATURE-----

--UB740MemTKBCxc1J--

