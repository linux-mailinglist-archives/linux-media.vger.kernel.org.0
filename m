Return-Path: <linux-media+bounces-43870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 293BEBC2877
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 21:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A8B8E34F5D7
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 19:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E878E2E1EEE;
	Tue,  7 Oct 2025 19:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PMRyewKC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44236221F1F;
	Tue,  7 Oct 2025 19:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759865971; cv=none; b=KZISIZn6gdWiMQ7LcVRGK63geCRUHRWEwZGxs2uWdAZ29Ae6cLE+mE1dXiS3Xm8OY6uyf9gbmNI8qHKcLfOaWSHVvPzBOArZwD5KRIBD/pdJgbsTcT2r8b9A65Mggx+thKWd7cWwMvTlhXf3aco8gy6k6SfJdBprd6IXRg8TWeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759865971; c=relaxed/simple;
	bh=9qQZTxiJTp9KxisCW4d+bUhuiwq3YHZzWlOsXv7u0Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rhB5Cfpn6f3iX4zSB0nT7F1TjejwphLN6aqW3BGNnnSjZa0BnAoL/mEjmULEIXozYxVMF8Kkk68q+DU92whmy4Evj+16CnJgs3scGfPpN1CKQfGFjPtVr1H8CxADEXYYhdzlpYMz3MA0D5WvUYwREJsvi1hkdsNAmOnIQat4L+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PMRyewKC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB240C4CEF1;
	Tue,  7 Oct 2025 19:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759865970;
	bh=9qQZTxiJTp9KxisCW4d+bUhuiwq3YHZzWlOsXv7u0Bk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PMRyewKCUK6A8xVg1GbAgLy8hmrxBsVaiixgfZKL0d9dm2YdECEwiDgvPne5Q/9cP
	 rWlVuMUFuqJbyI99t5y/vv3UiMXciAPc6YEIr45gVTDhkcXMzvsVziVQhWontnmWLB
	 umYYUbK4iw1OVtYkf3lm07KIMmaiKR9CNdzeSB86wmR4iXPCk4p6Xc2cDSplMXz+vI
	 aVxvXs7BtheGe4nkdhVDFo74gvwU4lz5BTX2ZEqimKaYyX0ckCBXR2eEOcn8s9bNnd
	 mAKveWb6aEsXLtVPkDBuKYuVplJNfy19obqbcTJs3XGDc1nJKw+mJZCOGEy6UV+RrY
	 U7BgCR4o40jig==
Date: Tue, 7 Oct 2025 20:39:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
Cc: jacopo.mondi@ideasonboard.com, hverkuil@xs4all.nl, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: Pinefeat cef168 lens control board
Message-ID: <20251007-geologic-epidemic-2f667f232cf6@spud>
References: <20251005133228.62704-1-asmirnou@pinefeat.co.uk>
 <20251005133228.62704-2-asmirnou@pinefeat.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gJGglnMSE2FrIzO0"
Content-Disposition: inline
In-Reply-To: <20251005133228.62704-2-asmirnou@pinefeat.co.uk>


--gJGglnMSE2FrIzO0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 05, 2025 at 02:32:27PM +0100, Aliaksandr Smirnou wrote:
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--gJGglnMSE2FrIzO0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOVsbgAKCRB4tDGHoIJi
0rwnAP9TulVjtal42EnsBmoo7AjkCIdZNgn6rt5edW5E7aWihAD/TZ/hjcqvk93R
exHMgGWlg/OckbssQqAwPTmfPS0dtAo=
=iTFt
-----END PGP SIGNATURE-----

--gJGglnMSE2FrIzO0--

