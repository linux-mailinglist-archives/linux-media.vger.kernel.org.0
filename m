Return-Path: <linux-media+bounces-35875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7EBAE8591
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 16:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F3551BC61FB
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 14:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC2A265CC5;
	Wed, 25 Jun 2025 14:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E1hiwVpo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4307517BA5;
	Wed, 25 Jun 2025 14:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750860262; cv=none; b=tM7s3HlpYfDm4DO+tO8lsea7lsFwizm327qKV94RzYgh3OjGb3Sflju7HX8pOFlAxGpnlA13bqnrnPqa4EIRvqtT6fzz10H56kqPz7S9S8DKM0tw0E6TpDRiz0ywIsH89WltRKI+n/sLrLFGt1z9iZKF6YZ+XbgrBrWdNPYvi3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750860262; c=relaxed/simple;
	bh=Oclaq5KSTIMdOvivlfwASFPr+uNxgLxtjUsBMBK4gYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZM8+YS6I7QQqhqeYUqg6hMujCZzgnlap4/TwyNVIdRkcKMQiDFMsjXlZ8VsLhPjU2OSqJFX3S5F03WoETGxiIAbqVZsHXlrGQuYJiDJdCBU/DQRpVZOd5w3X6o0WAdqHrt8J8xcdsKlLLVyLPDeNcHkXMk3qmukqeitwwwKBcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E1hiwVpo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68C6C4CEEA;
	Wed, 25 Jun 2025 14:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750860261;
	bh=Oclaq5KSTIMdOvivlfwASFPr+uNxgLxtjUsBMBK4gYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E1hiwVpoAEwHem/PxGb9ThwTASwSC48Br/IttA5+Q4MbMorLB+BoNO4MU46dl0mOM
	 4xGVBx49eFetvt0rSzE45PJAs0XPWUMPUxnlOtRxZt1Bq5P9rk8o0sF1UkTMp36W/R
	 lslTkdb8SZvDbz8zcddmtrtVU1unAM6n5oSqCCdz2tD3zrxykyArAbNhopkIDqHlJU
	 MJR6t+KPohEBN6Oja+tRn0lhnUpJPAv1Wqx4NGzzR3HPQRSaQ1V2JnsF1/Zt9GELhF
	 rnGco7KZCjLF5n6U/2iWdDf0rvjlB+Lybi2xkPs68G1zZUsvLuM45SRUTHZhvhLStq
	 R5Il8OMou8K9A==
Date: Wed, 25 Jun 2025 15:04:16 +0100
From: Mark Brown <broonie@kernel.org>
To: linux@treblig.org
Cc: arnd@arndb.de, lee@kernel.org, mchehab@kernel.org, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: wl1273: Remove
Message-ID: <97bfa9fc-c973-444c-9b37-fce557391886@sirena.org.uk>
References: <20250625133258.78133-1-linux@treblig.org>
 <20250625133258.78133-3-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aUhqz5H9dpAnc3uh"
Content-Disposition: inline
In-Reply-To: <20250625133258.78133-3-linux@treblig.org>
X-Cookie: He who hates vices hates mankind.


--aUhqz5H9dpAnc3uh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 02:32:56PM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>=20
> The wl1273 FM radio is on Arnd's unused driver list:
>   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.f=
astmail.com/
> Remove the codec component.

Acked-by: Mark Brown <broonie@kernel.org>

--aUhqz5H9dpAnc3uh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhcAeAACgkQJNaLcl1U
h9DEvQf+IW+1Z568IJeN2jBNMUoN3s10Gwps6y3Y0mEZsZ6mx9agZaC0u0KG3jAy
G++QX5afTH9iTKTIjThrPGWBuPbr7q6VD+lgLerxT8nAafTnCT1KTh0QfCvBuwvd
Vqrwpgu3E9/TlQb2zt2MPP2QhPKCCC7zMHvvKdZwYtHyMs/sacY2oxvc/xN2nY/f
XNhk+QzjA2TLJDbzOUfVVN6/R5/LUrvzP6tz8+WBRc3TlQRwgEPWXODLMBcp6hbC
z/kc+c4CDd8NuHQ5L5rmY3I+6vS63fBTY6yyGP9myTfA+J/q5oNX1hEy69joBAMF
zs5wDfaUUcfOMWRdIM07KfJ5VU+yVg==
=jmKt
-----END PGP SIGNATURE-----

--aUhqz5H9dpAnc3uh--

