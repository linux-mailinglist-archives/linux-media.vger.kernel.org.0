Return-Path: <linux-media+bounces-27253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6BAA4A278
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 20:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21AE27AA087
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 19:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C5D01F8731;
	Fri, 28 Feb 2025 19:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GP6pfxBZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9096D27700D;
	Fri, 28 Feb 2025 19:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740769772; cv=none; b=JXGTB39ZKq1wPJJmr9UDl2YoN5gAdFZ4s/ksz6eeeJUMFR9YRgcVjOOWu4+FZTwffSyub2XRTTVEsSj/VW+m3LljuF9jrd7hYFvPUmUHpURocXO0Ke5Q0yTTPW5vIs+b4apFb3KTGwjEF9tywzLA+1hfHz85kr2NGgRQefOgCk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740769772; c=relaxed/simple;
	bh=zhJ3QBOrHMKMn080recEziExaq+khBOdjjOCVr5uLWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjtMwkr0eItBaZhQFZf0CD2PVB2pscgHwsK/vGhT17QeOs4O85HMAR987OZWHPsDGWvjAHl/i/Aajzz6rSZQb7mSe5P+OwbVQLuHZThNtN3Q8GHma4y5qnOo+VnJ4uollF5bAhiVTtGO7i6Jc/GyxibRikKZ2OOSMbKlUeKM4IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GP6pfxBZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF270C4CED6;
	Fri, 28 Feb 2025 19:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740769772;
	bh=zhJ3QBOrHMKMn080recEziExaq+khBOdjjOCVr5uLWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GP6pfxBZQPS0HuAfJ0JdudFGxBbXika0HLAvLl3//9haacIvzPgrabNyuVP1tmdFi
	 Qv2vqVIaKe4kTBGYsuVh3YGDQL5Nb4mQ2+pwkUXJrCOopBENltAXK9kh7sQeCrFKLl
	 EvMkoaAbBDZ77Kjen4V4/lCNojgUEU7JZD4olLwU3Me0ekiBH7NKJNc7JQCIOVMUMC
	 0wGmu7q71ViXrCnI9QsTxzSQbWuZc9wkU3568kBTLNcgUgNF2k9wTp3hP/FGvYaDs2
	 GbIu2XuNSvCd9QtsWh/zsanc9U3CX/Ogm4Tuy860eLr88dMVPo4JQWcjuUOQAqs2SB
	 prQb45lQwPMzQ==
Date: Fri, 28 Feb 2025 19:09:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Mathis Foerst <mathis.foerst@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	manuel.traut@mt.com
Subject: Re: [PATCH v1 0/8] MT9M114 driver bugfix and improvements
Message-ID: <20250228-valid-chastise-db8819061ec5@spud>
References: <20250226153929.274562-1-mathis.foerst@mt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wjlbXatp+vm/Zg2k"
Content-Disposition: inline
In-Reply-To: <20250226153929.274562-1-mathis.foerst@mt.com>


--wjlbXatp+vm/Zg2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 04:39:21PM +0100, Mathis Foerst wrote:
> Hi,
>=20
> this patch series contains the following bugfix and improvements
> for the MT9M114 camera driver:
>=20
> Bugfixes:
> - Fix a deadlock when using the V4L2 pad-ops get/set_frame_interval
>=20
> Compatibility:
> - Implement the missing get_mbus_config() function to be compatible
>   with the i.MX6 camera framework
>=20
> New Features:
> - Allow to bypass the internal PLL (configurable via DT)
> - Make the slew-rate of the output pads configurable via DT
> - Allow to change the cropping configuration and the horizontal/vertical
>   flipping while the sensor is in streaming state
>=20
> Thanks,
> Mathis
>=20
>=20
> Mathis Foerst (8):
>   MT9M114: Add bypass-pll DT-binding
>   MT9M114: Add pad-slew-rate DT-binding
>   MT9M114: Add get_mbus_config
>   MT9M114: Add option to bypass PLL
>   MT9M114: Factor out mt9m114_configure_pa
>   MT9M114: Allow set_selection while streaming
>   MT9M114: Fix deadlock in get_frame_interval/set_frame_interval
>   MT9M114: Set pad-slew-rate

Please take a look (via git log) what normal patch subjects look like.

Thanks,
Conor.

>=20
>  .../bindings/media/i2c/onnn,mt9m114.yaml      |  10 ++
>  drivers/media/i2c/mt9m114.c                   | 161 +++++++++++++-----
>  2 files changed, 129 insertions(+), 42 deletions(-)
>=20
>=20
> base-commit: ac9c34d1e45a4c25174ced4fc0cfc33ff3ed08c7
> --=20
> 2.34.1
>=20

--wjlbXatp+vm/Zg2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8IJ5wAKCRB4tDGHoIJi
0pAJAQCDOLZhBDvRloyCfH0G/Qs7d6KZ8DEhurRP5lf0T04+lAEA4PFC3e5Fxp7C
09GHPWpq/LQRGA0K42u0rvsJ6aoylQo=
=nwS+
-----END PGP SIGNATURE-----

--wjlbXatp+vm/Zg2k--

