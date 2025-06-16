Return-Path: <linux-media+bounces-34950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79002ADB496
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 16:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 864F5163C76
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 14:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06192153ED;
	Mon, 16 Jun 2025 14:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RhdBe2A8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144E620DD42;
	Mon, 16 Jun 2025 14:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085895; cv=none; b=jxaJ87R8AybopdRCzEZytu+95SdYAYGuubRw07ek8IDK2Pm6kP6IwAagJSMhdrwXRPTPFFOnHwwdyM82LGOf7XHRuLFZyXujf2bMHKJrQS8rEee8FEMh4muIkz0EyG6h1aRIs6jBE5Z+0rfFXydvGoU1QmoEJJF63Q7UQ+mAlJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085895; c=relaxed/simple;
	bh=FXVcftLBzL0VE22s0E173pGv668LrsMf8ycBcz8A5/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eIK6ZOIWmgrhxfIVXWro2bgGHGKnaQJ6In819I19YiXgWAtNTN5Rsqno1zpER9+211j/cotaMVvejEvWtA/TeJRB5kpdkYwaJhaqwstKAZSwhzX6KPC44W1b4YXjd+LkL0cGPMkjzcONBDdHEc46Kx/JMPN/DOlbjZHcnv/tHH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RhdBe2A8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F580C4CEEA;
	Mon, 16 Jun 2025 14:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750085894;
	bh=FXVcftLBzL0VE22s0E173pGv668LrsMf8ycBcz8A5/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RhdBe2A8FCIO3U1UH6P1Jg8RbOENgnvRjwXnJKBA6EurzujsdvPYBTcPijXefLHEg
	 MFUmQfBraBxGxJdXZ6QZ9GitvQvCMtHGNtM28xQQyVdDkrQy9GPbFfPimWacpVe97k
	 LQopjACsD+oIVG73E5lXFXxk66Ee213j2dIj+TAl4Hw2rexbie9XYsof0IBdwEVl6d
	 QEDOs4nYWcYXcF8Elqxq9HHm8MZTRQEuWqR914mpKLyVOq857hIDDvgxZN2EA4NjJE
	 aWbWKgsBtqkaiIb1egZ/B4X+XrBsDpXttdpWU/PV9qA9lDd9TPFo9o7EPt+EmyJtOr
	 /Boz3CBB9wYWA==
Date: Mon, 16 Jun 2025 15:58:09 +0100
From: Conor Dooley <conor@kernel.org>
To: yassine.ouaissa@allegrodvt.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: media: allegro: Add al300 decoder IPs
Message-ID: <20250616-unopposed-overgrown-00a1a7a423b1@spud>
References: <20250616-allegro_dvt_al300_dec_driver-v3-0-7d746cb9e5f9@allegrodvt.com>
 <20250616-allegro_dvt_al300_dec_driver-v3-2-7d746cb9e5f9@allegrodvt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a6CGOvP6rpx/UjSC"
Content-Disposition: inline
In-Reply-To: <20250616-allegro_dvt_al300_dec_driver-v3-2-7d746cb9e5f9@allegrodvt.com>


--a6CGOvP6rpx/UjSC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 01:12:13PM +0000, Yassine Ouaissa via B4 Relay wrot=
e:
> From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>=20
> Add a schema for the allegro gen3 video decoder.
>=20
> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--a6CGOvP6rpx/UjSC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFAxAQAKCRB4tDGHoIJi
0tK2AP9ymTqmYzuxA/6f0/Fe15cY09M/yEBJYFxP8DZ8hyX30QD/b9wjHeVFQuTs
ZGS35plIvS3a1A1W+mvRVpW6R94FKQQ=
=MWub
-----END PGP SIGNATURE-----

--a6CGOvP6rpx/UjSC--

