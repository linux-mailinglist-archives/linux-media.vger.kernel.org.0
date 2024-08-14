Return-Path: <linux-media+bounces-16302-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BB8951C86
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 16:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6DF51F22473
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 14:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D401B32C7;
	Wed, 14 Aug 2024 14:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oixb9P7I"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8AE1B29D2;
	Wed, 14 Aug 2024 14:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723644315; cv=none; b=syn3tNWZcTXh0gVxuGYvHKfBuu4iT7DPTrH0kpBs6Ju1iSSGCg8PaJ4SwCcpmJyiK+k99xY1eU+6kEekZcS024Kk8DYxzsJCuMqIlbHWOmx3sg67aaJdffCRYaS52uDldI3aQI5C1E1Z/eUPrPM2RBniaCe8rZfFfJ/fMhsv3mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723644315; c=relaxed/simple;
	bh=rsrPj3HibZ4DCsL9Ic4OQt4Rsa7JTdGV+7CZoZd1B/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jtw8W+5w997ibV//VfDMqGBTASno0/HZAOcl76LKnlrIXTjGWCA3HSUWyF31jQ0NodajoXZc9et06dtmi/Wm09E3ASPbiV90StefQoRz2rdKcz2Crtf7BinUURnB4mKtKKwS3jP8wZKHqPVXYl+p8kntZQ0/jT/xDZtAVrRDxkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oixb9P7I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941C6C32786;
	Wed, 14 Aug 2024 14:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723644314;
	bh=rsrPj3HibZ4DCsL9Ic4OQt4Rsa7JTdGV+7CZoZd1B/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oixb9P7IKMS3/QO3M+v6BsLenBwFo04WV3M2FM4b+PnTBnM+H8LGThWzI2ZaiPrE7
	 KnT4LaSTN8Kbn7uJ49JPGpPqAKL0lh631pNmnutXfEGcuXmdOA4rpjWCkuWPEMokQi
	 RdVWgigeciXAaPBIGcO8bVETqszsvXDHmm8iXRlMMpdMixIuPRF2C9V/sIagWgkXJg
	 fXvbuxQwilJ+8zcimVOxsdl2OCfVzZGJqL0Op6IpfoN2iSy/Tn2aWkun7cfUo3g4bF
	 iLdGMW7At7uBIBcF1QgTtSnnoddaLSLLq40P7swf55ctf26w506ePlPRSDM1XCw9Wb
	 4isDAlOl8VI0w==
Date: Wed, 14 Aug 2024 15:05:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, khilman@baylibre.com,
	linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Will Deacon <will@kernel.org>, linux-media@vger.kernel.org,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Nicolas Belin <nbelin@baylibre.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v7 00/16] Add audio support for the MediaTek Genio
 350-evk board
Message-ID: <ae9a5147-95a9-4da3-a56a-ecc22f4e8f04@sirena.org.uk>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
 <24215f3d-30bf-4379-bb10-c4b183c16b8a@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8B/Fc53TUe95dwQa"
Content-Disposition: inline
In-Reply-To: <24215f3d-30bf-4379-bb10-c4b183c16b8a@baylibre.com>
X-Cookie: The second best policy is dishonesty.


--8B/Fc53TUe95dwQa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 10:23:12AM +0200, Alexandre Mergnat wrote:

> Simple gentle ping, the serie seems ready to be applied.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--8B/Fc53TUe95dwQa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma8uZIACgkQJNaLcl1U
h9C15Qf/aWN3somXkLeCmkhFfrV7QHTBExyjsMeiPhzPWZtkgtCnWe3qurwNFxJW
hZepPzW5OTzlmzxUY13O4q1omXjfbfIM5wpYSui2CeaJo15WV+/BxfMEjLwhB942
fDai25vauENBytYGG0rmb5lW0+92gWHVXdFYjB/Zew6sMd3uNCQNZGsfEVXJD3pU
U9rb2939laF2Lqbjvr502BhhHEPgiBCx0vsPCVtasNrArpTFfinGw2wYA4ZNRGM3
IB78TudnvuQHQtt9ytOfos5mN+fv5LxoYO16MMmuhTP753QbXipEJ4wYBKWSSPs1
JLIAGwiAAXiCyPEMjizKQ3fph09SVg==
=LwLG
-----END PGP SIGNATURE-----

--8B/Fc53TUe95dwQa--

