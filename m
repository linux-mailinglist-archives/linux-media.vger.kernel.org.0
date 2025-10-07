Return-Path: <linux-media+bounces-43879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6BEBC2B0D
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 22:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF4143C8247
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 20:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4926D23D289;
	Tue,  7 Oct 2025 20:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5ZgX2/d"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D13C5227;
	Tue,  7 Oct 2025 20:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759870053; cv=none; b=s6Jr7U7Od7yEIYEV/KCEfShXeZEjzmS8eZtFqomeHvEqnVfohHFoeNPDrE3X3LQ2hCTIRzTLyRJDLPNDFPwtQ9vnGdnkLee1P+vJ034YBjvOvfudG9j49DiynwXq1bpXi0p6iwhkHI9ASoO4sbOFbgqVMILsOeSofZ96X5OOSeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759870053; c=relaxed/simple;
	bh=23u1ryQA4pkVgghEK/FjlCql33thr7bf7nrPRRN5i6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FEyo7R555rppxh/tjJmmjJxslWLYEStt+ligfkcdTYucitejIkHfYP++GV89AyPxAcDCEOU7oqHkP2B/HHp7+O/tSPjOTNPsAqH662XZH213UjR9QpbPM+RoRO0Wh+bBoBdzDuDKJWTYb9CuMdTt25LfD+a7pk2ZMPB95n8OwyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5ZgX2/d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF94C4CEF1;
	Tue,  7 Oct 2025 20:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759870053;
	bh=23u1ryQA4pkVgghEK/FjlCql33thr7bf7nrPRRN5i6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X5ZgX2/dvBtfhlELBUQDRuuHSWQhZPXCt6SRVfbp2P4M5bQR+lMd43FoZVFzJb0ED
	 qL7SDYslX//Bm6ftvZ61qgcYGpFa1Kfj4n1a+kPIobVo0kkp7/JWzVbY/oHDlWShPK
	 pqAnUp1ZEFNIiovXrwDyOWG6VAHCvGnRMW4YFO5JKiDh73VWAPfVgUfpcJ6Enmo8bE
	 DYjRE8YXyDNOTp/B/V28xIS/gEAfxMJpluVfumzHvxl22d+IjyLWz+hh28T4ssJr9k
	 CSF+nphmiEdbZhD1Jmu5DTh0jeklgy4Tui9gHb5jOsDNJJ+GIHDr3usndmFpfrnRq9
	 ZCqa94/JT2O1g==
Date: Tue, 7 Oct 2025 21:47:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
Cc: jacopo.mondi@ideasonboard.com, hverkuil@xs4all.nl, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: Pinefeat cef168 lens control board
Message-ID: <20251007-obscure-thrower-1afcdb23c4b8@spud>
References: <20251007195732.16436-1-asmirnou@pinefeat.co.uk>
 <20251007195732.16436-2-asmirnou@pinefeat.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mr8WqQAh4oYIhLeV"
Content-Disposition: inline
In-Reply-To: <20251007195732.16436-2-asmirnou@pinefeat.co.uk>


--mr8WqQAh4oYIhLeV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 07, 2025 at 08:57:31PM +0100, Aliaksandr Smirnou wrote:
> Add the Device Tree schema and examples for the Pinefeat cef168 lens
> control board. This board interfaces Canon EF & EF-S lenses with
> non-Canon camera bodies, enabling electronic control of focus and
> aperture via V4L2.
>=20
> Power supply is derived from fixed supplies via connector or GPIO
> header. Therefore, the driver does not manage any regulator, so
> representing any supply in the binding is redundant.
>=20
> Signed-off-by: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>

I acked v5, any reason for not applying it?
https://lore.kernel.org/all/20251007-geologic-epidemic-2f667f232cf6@spud/#t

--mr8WqQAh4oYIhLeV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOV8YQAKCRB4tDGHoIJi
0hqiAP90PFWFzZJiPBzdjssP55kYAixNabTHplEl1fb+BgNQvAEAlJbTXs4JOoAY
uYvdtLm2YM6oKb/Z/9nYZNmvTD/uIgc=
=cPvn
-----END PGP SIGNATURE-----

--mr8WqQAh4oYIhLeV--

