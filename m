Return-Path: <linux-media+bounces-17821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA4B96FB43
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 20:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27A6228B167
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 18:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B87B13D889;
	Fri,  6 Sep 2024 18:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q4Oqns1Z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A471B85C7;
	Fri,  6 Sep 2024 18:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725647690; cv=none; b=az3kGuWjkoRvUwmtjCPM2+altK0ZxhlmNtsJ0rAk/9eRtSJm4iPTRywpmSO73XNIHqYU+adzcGLfkV517K/ZWhTkJa0bB7WUkDyqf6Wqe6QHtog9o5W2KiD0r27SKtcVuPTyEGGeov+pIiKv3w2leRMj2AF/N2RjK/GnnLi0G7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725647690; c=relaxed/simple;
	bh=DfKGjEXx5hSeUXB8vrUl2jj650dPsUbikh6TxwpLm8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Huzm9/g1nx9n7P6yesCIc2hgkw5V7CHDSYZ/tAfYeGMazeTcIYnbr7n6g4JUuruRiG+FqLq4eL4eucWT6q1OoNdPGmndSpcFVNMN0POpTf6AaMooEnr/Vg0ZlUYJght/zozUp6+CHyF4eCJc1k0jTBukaQhgaYJWjB+EDzIVICA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q4Oqns1Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1FA9C4CEC4;
	Fri,  6 Sep 2024 18:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725647689;
	bh=DfKGjEXx5hSeUXB8vrUl2jj650dPsUbikh6TxwpLm8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q4Oqns1ZT+8BaXLlOHhPFVIqEyFqit8FSM7w0q2NuoPjesvljHet03opQbah0Fwxd
	 li+VWGIxfeiBscR7cdhr1Sy4mt+y+hYdDRA+rN4uLd1xeodMLwkuDVrEuYECMXCZTK
	 CZ+7Os7xhiAZZQ+VWkLUzv4LxRv0iM9Lo8i6uGsU+ps91zOS1cpLAb+HwrfoYCDFdL
	 2CEVjrZo14qSo8Xfi4+KQC2byM9ofWla+hmuHH03vmYga0Sq+49XxD3/Yjkn0OT6Yv
	 KC5BgEJOCmV7E3+xU78KHnbNuQhBVtcMmwemLDcDNlVDaXuqiZYD34GbP0fxuK7F81
	 LKrJw9XYcGO0g==
Date: Fri, 6 Sep 2024 19:34:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alexandre Mergnat <amergnat@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Nicolas Belin <nbelin@baylibre.com>
Subject: Re: (subset) [PATCH v7 00/16] Add audio support for the MediaTek
 Genio 350-evk board
Message-ID: <ZttLRhOn9uIuk0Kl@finisterre.sirena.org.uk>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
 <172544860860.19172.7052813450885034844.b4-ty@kernel.org>
 <20240906180348.GA1239602@thelio-3990X>
 <ZttJdexQFOq2Q9iQ@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ROeGXY+oUkHH2KgO"
Content-Disposition: inline
In-Reply-To: <ZttJdexQFOq2Q9iQ@finisterre.sirena.org.uk>
X-Cookie: Your love life will be... interesting.


--ROeGXY+oUkHH2KgO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 06, 2024 at 07:27:04PM +0100, Mark Brown wrote:

> These commits passed an x86 allmodconfig with GCC 12 at each step (I did
> catch one warning there with another patch in the series that didn't get
> applied) and 0day didn't say anything at any point.

Oh, actually right as I was writing that message 0day decided to report
that (and some other things that look rather preexisting), though only
with clang 20.

--ROeGXY+oUkHH2KgO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbbS0UACgkQJNaLcl1U
h9A4PAf9EXvt7UgwANg6DLruDFhtYHs50i0gB5suWbYdBIV1oNQ+ZsrdL38D1SfO
s4IvxwibYw+GjhYu6rWRC1S3yF1kpB5/Y6bnyZC3y7T9anqLD0wC56ZraWJB4vON
Uqm04cTI/g/MNzFxJn0l9dU+5r3y9hX890cCtRBZYVagmM/u9eG8IULqbCOHhPVG
kHrJv7MTxpQ1emjKM/ZKCbZ6Z056BkaBgAk3mht5pjv9D3VvvlRIhgZ/0tVrwTdd
/OaQPpR8z/dLk0LJ2sgPCx2/0MjGrmEveCCTH7/uvJEJ/DQV2bAqgL693OJ0uUc1
hrVwYOMO6wBL9SUj5BU/2dFxPFLmxg==
=5wcC
-----END PGP SIGNATURE-----

--ROeGXY+oUkHH2KgO--

