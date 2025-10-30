Return-Path: <linux-media+bounces-46028-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9761BC21EC6
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 20:24:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F18664EC158
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 19:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1292E8B9C;
	Thu, 30 Oct 2025 19:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kCjGVX7P"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F193212559;
	Thu, 30 Oct 2025 19:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761852233; cv=none; b=lXI2GLXHTZdXg6drmM8ylQLCBrT2G+U2RRbCDqbLmYrwoFGx099DKUfRkhDLajQIzAxGJc4s9p0ifVnSac6HWSrj4viOvvunPBN0emgVbWT1OuO915RSNsUUlaC5Q09P8byV7hqCLlUh+0uhSeEUtMv1u2QKq6nSSH9v2VcajIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761852233; c=relaxed/simple;
	bh=l29PuVlYB/DSDvAWFqCiJUgqQxEZ/UZkLaFHmISdTS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDOd0Ui8c+5TkUf7v+ht+t2U3X/+zIEGhmnvmb/U/l+xvUE2UBain+K0R5XxkF0U7Irx+slsvQJcPdOTyrQSpYX+ausko5UxlX3Nbgd2xE47DaxtkNOGrCBpTWclgNvlAJoLTDbGPiM8bg+fUKdL790nSwF77xKTBhIZtcyjoeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kCjGVX7P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE3A7C4CEF8;
	Thu, 30 Oct 2025 19:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761852233;
	bh=l29PuVlYB/DSDvAWFqCiJUgqQxEZ/UZkLaFHmISdTS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kCjGVX7PgeXHms54JYg6MBTn0B/6ZQ9qrtHyj/juHePkmR4v5IrRKHm99qgv2m1SE
	 9lGao6aQ5QfnB3DWrf9iE5yLFgvs9pjyGaOO+gRdHn6Mnvc2XVNjmjVqRcboSO/sln
	 fWF61JTzn2ziCdBhEcjxYpBcljMC3NA2xJCwacod7fUi19ItiqcHHjLmaDyne3amwk
	 ApnAok0v2SFAnHj47rNaD63rpaPswsX9tDy7pCv34BJMARqh2IxT50cew9vfAka7TA
	 zyVD7lE2q/97py207wnF4WOXv/UUzvvD0bLwvbjHaczHi783jU0R1tQXCMwdipvCxf
	 lc2tpGOMGi5XA==
Date: Thu, 30 Oct 2025 19:23:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: document Sony IMX111
 CMOS sensor
Message-ID: <20251030-wind-pellet-ecd2c96d26c6@spud>
References: <20251030115757.33695-1-clamor95@gmail.com>
 <20251030115757.33695-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g0VdOFDvWShnp82A"
Content-Disposition: inline
In-Reply-To: <20251030115757.33695-2-clamor95@gmail.com>


--g0VdOFDvWShnp82A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 01:57:56PM +0200, Svyatoslav Ryhel wrote:
> Add bindings for Sony IMX111 CMOS Digital Image Sensor found in LG
> Optimus 4X (P880) and Optimus Vu (P895) smartphones.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--g0VdOFDvWShnp82A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQO7QwAKCRB4tDGHoIJi
0uD/AQDayaedzzm3AUzC5dQtC4kpq/sJHeFJLcP+p/tURHU4BQD6ArnbAUmitdUd
VtR5iuCRfsthxZvsssHiCqfkYIUPJgw=
=++f3
-----END PGP SIGNATURE-----

--g0VdOFDvWShnp82A--

