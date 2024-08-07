Return-Path: <linux-media+bounces-15936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D82A94AA0F
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 16:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8916C1C22608
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 14:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 924B361FC4;
	Wed,  7 Aug 2024 14:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gcTD88XB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B5C6F2F0
	for <linux-media@vger.kernel.org>; Wed,  7 Aug 2024 14:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723040793; cv=none; b=fkpBP6Dmxdi6XM0/fCLlMT2GfBFzm/e6/ft4vuJ1YGR5iz0ZXtQdbA/pSC4PswS/zkLy3jkPbZh8wD+hL1I/KWAiiKdBS5CMuHXcBUJt8gzmJ6TabrRLVNLwn9WfVFGSEfdU9Ity8Fo8YNV9KYXgeq9d7+b5g4lQ3/LbECEL1NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723040793; c=relaxed/simple;
	bh=qah1L5efhapyTgGcAnmnSAxrZWbOGmDkEecbOLcjR8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5SofULoL4sgG5PX3AVwlcxevUfcBYDfXoV5RaXPqo449DcrRyL1k9xDKSnpQU9iO80BKMvJa9sNFKAEsunvG+u3Drh5oNznzmpt10OmBoqHjmUCjEv78lrjNmXWmXNp0zgeal8CKUbS2bRDhS2qXsGQT+f2fnnM2/KBLUlxVN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gcTD88XB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=G/aq
	T8Uza3zIyWgA3Hk9AJ7ehT6awi0QmB3lVTwVYh0=; b=gcTD88XBRW59qeT7zXBC
	EFYpPASoygTvysL6pEaH4d3q8rJjVsOhiiz9EImfFoq28KXFEd9C3r2heDkyEXyg
	lon8r0PMq3Pd1cL03Oy1J2z5JhZPd2uskzaTrHqQ+KaJvb9YBWvDLOrU5/BhP/+W
	+JhjmcK1WFswZN9yVPkgGrylbF2+lWFxUQ9mHCegUPDh/8bh/uSoBWPQEWb+6sJP
	WKtHC79NGWFeItzlhmWR0Cbgqos1hXRQv1v+lnuORS1ujScjI7EPpolvRelAnHvM
	cxhCG+lqfBw5YnvCmen5onPblC/fuB/R1kXhspo0TDR+N8VjcWjSzZg/dDUQsQwk
	ew==
Received: (qmail 38314 invoked from network); 7 Aug 2024 16:26:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Aug 2024 16:26:26 +0200
X-UD-Smtp-Session: l3s3148p1@Hcz7sRgfgW5tKPMt
Date: Wed, 7 Aug 2024 16:26:25 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Benoit Parrot <bparrot@ti.com>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Dmitry Osipenko <digetx@gmail.com>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 0/8] media: use 'time_left' instead of 'timeout' with
 wait_*() functions
Message-ID: <ZrOEESjIbqfydsSL@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Benoit Parrot <bparrot@ti.com>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Dmitry Osipenko <digetx@gmail.com>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>
References: <20240805215123.3528-1-wsa+renesas@sang-engineering.com>
 <2f3f3b80-65a6-40b6-9450-41e1313167f0@xs4all.nl>
 <05f900b2-1a94-41ed-b365-65b83b58d329@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p0NiU/qlPeepXxbb"
Content-Disposition: inline
In-Reply-To: <05f900b2-1a94-41ed-b365-65b83b58d329@xs4all.nl>


--p0NiU/qlPeepXxbb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans,

thanks for the fast reply!

> > Can you resend this series? This patch series wasn't picked up by our patchwork,
> > probably due to a full filesystem.

You use the kernel.org one, or? There was an update including a small
downtime but no mail got lost. patchwork only needs to catch up.

> I'll let you know when it is OK again.

Seems to be good now?

https://patchwork.kernel.org/project/linux-media/list/?series=876862

> > Apologies for the inconvenience.

No worries, things happen!

All the best,

   Wolfram


--p0NiU/qlPeepXxbb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmazhA0ACgkQFA3kzBSg
KbaWQg/+N/4IzrQgV3qQIHMzRGehXG3kOowJ7YzquYbgh9gBkFrKdsDuzmLPJMQc
6/pNOOyWF1OZ0Fa7dmK99+Aqv3hkg9CjISzE1GYwOOFp07Sa3Upw/6Zpfm7fBGtR
PWq7xyfVSEM4xbm4Ns/Tp9QgCWUSAJMM1h9aq6ELoJqi8kK6HBjYXc+gQca2rLfc
ezcTs0Rrw57GE0IQ80DKrNZCRZ9/Mb+9rSYyzre4mB0EXttqd6xM2YT06iN8ecXB
RnJ++7SEiAOBVap5DYJJ9JpmTPyrllHr8bVbtpuaLBKLxfBqClZ10EyoVDukfBa5
JVczp744DG59qQgBbDhESBbqaAtHBj4f7+GpK+KYCTgPvWq2uURAO4kqFFAsDd+S
F2wrJJi2ekhn2IE3A8jDR1foAIW2OXsD/XdMnGS1hDAYTX5y8KQMRlyBsB5ZmS7d
SNOx2qljEwJMXTZ+H64SQe6Qb9u8mLp4lt0yNohnxsNzw1iK+mGak0jwOd9nG8Ly
CumpEDj9XvvQfqsaZFCH/5oBM0vKKbSU6NSyCcW6cp56BMefxHrrS9iBKInEsYN5
YJasha1JpRuLiH2mzn3EhvGjuZnqOhvbYajDxNCs6FdO/8C7AIRJjT6RUOt0jkW4
vsZ55WzDwUbsranBZSvFGaMiyCq1dCeJ7ChOnZzMEAWwehKThXI=
=HFgN
-----END PGP SIGNATURE-----

--p0NiU/qlPeepXxbb--

