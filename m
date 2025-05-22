Return-Path: <linux-media+bounces-33167-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E47AEAC0FE5
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 17:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2587A3A5983
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 15:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA33298986;
	Thu, 22 May 2025 15:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uKMRvHxR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CF4291144;
	Thu, 22 May 2025 15:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747927538; cv=none; b=TG74gOqtbhnYiliZ9KE/yRI7B03xKAXNKQ1ps40s9KQnBbVtYOR5wtVka+qJ2usY+H0kPIIH75UXIlz1mlfrw9FsNLAEs+5pVfqhFO9WDct3OH/7Rpym9+2VBQPdz/u05FJwUf9iK5r8gjdyfa7Jpgx2xaAyVczhzPErrADk6DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747927538; c=relaxed/simple;
	bh=PcuhumX6z7OaQzA6jK/bl3lCDvqH5Kb6Vjig2je/8Io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LjVM0D197UttfWJYTBHW7jMnXB37PhjBxI/d0OV3Q0rIqHEH36qvDkRNvnI3bBgB0g3mH0DXPz7DSJd6o3p19UVPYDT9AYBpj+IjBvFcVpPe5k6wPjx88kXk66+BFjAMx/WNY8tnlsfuIkd9n4/3QsxB/Q2xgp3D2DmTUN8DIZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uKMRvHxR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ABE9C4CEE4;
	Thu, 22 May 2025 15:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747927537;
	bh=PcuhumX6z7OaQzA6jK/bl3lCDvqH5Kb6Vjig2je/8Io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uKMRvHxRtmKr/lsNQjPKEPbn5xtQ8GLH/P5w6I/obPN9BZDaP6jX4qyqkkFnkgZpP
	 RKl0fiXqKKWmtxABF6dauelGdWPCF0s4W+p1y0oThdHlQ2bywos076ZckVCYGyWTTD
	 hW/BhUvoVnjimEOu7CdiYeJ+MpixAo6UEUlUwwDpG2r4UvAz9AsIBweCmR+4GgtAtn
	 QQDW90Fhm/g0JMYn5EwIYcbHJqVt77ZL46PJzTPjB3ZR7WjRQdM4W6dMFbNQ+T+wGY
	 jlHjMRseTDEEBQnmuCr1BFv1Be+m4MQmacQZCUFY9fUjhcax087qbXcuv2j5wjSMFv
	 xSFysuTPSkRBg==
Date: Thu, 22 May 2025 16:25:32 +0100
From: Conor Dooley <conor@kernel.org>
To: git@apitzsch.eu
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 4/5] media: dt-bindings: sony,imx214: Deprecate
 property clock-frequency
Message-ID: <20250522-coexist-quarry-46351c8ae247@spud>
References: <20250521-imx214_ccs_pll-v3-0-bfb4a2b53d14@apitzsch.eu>
 <20250521-imx214_ccs_pll-v3-4-bfb4a2b53d14@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fZTA2xJO3DxnrYMl"
Content-Disposition: inline
In-Reply-To: <20250521-imx214_ccs_pll-v3-4-bfb4a2b53d14@apitzsch.eu>


--fZTA2xJO3DxnrYMl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 09:34:27PM +0200, Andr=E9 Apitzsch via B4 Relay wro=
te:
> From: Andr=E9 Apitzsch <git@apitzsch.eu>
>=20
> Deprecate the clock-frequency property in favor of assigned-clock-rates.
>=20
> While at it, re-order properties according to coding style and fix the
> link-frequency in the example.  See commit acc294519f17 ("media: i2c:
> imx214: Fix link frequency validation").
>=20
> Signed-off-by: Andr=E9 Apitzsch <git@apitzsch.eu>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--fZTA2xJO3DxnrYMl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaC9B7AAKCRB4tDGHoIJi
0oFdAQCfMg4K/R8gS988QZ2UFRXB7uW8XASfY+zm2n8l+MnquwEAh+VKDGZfQ5eo
YqZMQl0W5DZWDVKngAmXodEUexISTA8=
=iPFE
-----END PGP SIGNATURE-----

--fZTA2xJO3DxnrYMl--

