Return-Path: <linux-media+bounces-16229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ABF950912
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 17:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8659A281781
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 15:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC76C1A01D9;
	Tue, 13 Aug 2024 15:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pv/T02g7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1830719E831;
	Tue, 13 Aug 2024 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723562817; cv=none; b=V7hivzJEzvka8uo55BsaPGnEEK9Bhd6i6ZallwRmvMeA53KnECfbwTqy8p6dVAbJCFU7p1FtiANBFl7gftt3Be78bS1yhSVkp/U7xwprofSVPxtYcQ3TWYhVDWR2NezvQlgbD/rmVvkbNYILOltZrI4HyQfcJc4NfS4GMwxNUBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723562817; c=relaxed/simple;
	bh=mSemb60sTJdLNNxaY49JMnLRjZsVWJb6QojfV8SA4lQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rfLalshcN7l7TwuktwDmDS5mlyYE6HrFkY9rcOCRjlsHByflZpWrKHiZKMTvcEK0A0GlN4j8w2p9HqYAkEK7o7eCAH4wPoVdBSOprSWTMP54pEKBj+NijDhZzIVqNBf3EM9yY0Mxvba5ThhWdDNz2evvgRn54aD3XzAeANW1Jgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pv/T02g7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E55A4C4AF0B;
	Tue, 13 Aug 2024 15:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723562816;
	bh=mSemb60sTJdLNNxaY49JMnLRjZsVWJb6QojfV8SA4lQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pv/T02g7RLl4qCEmnY/WRxn88WO19c0ktVzJOqWh2LDJD4n+FFXmTRwQYecVx/xrK
	 oCgvXRgM5MNzYuTnKz2NDU0l1jXjbelJ6CdoML9C5+vKdkoOK3WO1JHrvSlc+wam7A
	 f/Cfi2xC+3uEkZkn2eklUzBqCI3xs2OzrL2sL0NFedAjY1hdgRs6vJxZGxZQctJgqA
	 1HiYo/5wp0O5Oy20LAN1yzis798kB4bk4zKld/K5pAzRjRwO1/hZVcwiw2cMK5px+5
	 qGWsn2NMBWljjjPFG1BoUexuQ1qGCmD1UhE0Nvh3P5HYTzIs/WiyqNLITMrcHjBXJr
	 pRhDbYCbo9miA==
Date: Tue, 13 Aug 2024 16:26:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/6] media: dt-bindings: Add description of OmniVision
 OG01A1B image sensor
Message-ID: <20240813-darkening-esquire-cefa9cf21745@spud>
References: <20240813102035.1763559-1-vladimir.zapolskiy@linaro.org>
 <20240813102035.1763559-2-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cOuHclAJi601Q1QK"
Content-Disposition: inline
In-Reply-To: <20240813102035.1763559-2-vladimir.zapolskiy@linaro.org>


--cOuHclAJi601Q1QK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 01:20:30PM +0300, Vladimir Zapolskiy wrote:
> Add device tree bindings documentation for OmniVision OG01A1B image
> sensor.
>=20
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--cOuHclAJi601Q1QK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrt7PAAKCRB4tDGHoIJi
0jR8AQDS93X9FEFhF/N2OTEskOW0/8dm7/R4/RoKHLxdgCH5UQEAs8w0IJ1wWl1F
gwhdpQLmQwyq0CroPh7+fool9GCDAAU=
=XOin
-----END PGP SIGNATURE-----

--cOuHclAJi601Q1QK--

