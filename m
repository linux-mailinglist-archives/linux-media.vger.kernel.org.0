Return-Path: <linux-media+bounces-13564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F328E90D60E
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 16:51:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 265DB1C220E8
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 14:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D32515DBD1;
	Tue, 18 Jun 2024 14:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPSVDKFM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A279515CD7A;
	Tue, 18 Jun 2024 14:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718721819; cv=none; b=e2j3+Xn946sqK/zLxLULnpu8jQtmhHj3D30p6ZxGaJo3gpJ/9u+Xkrpb9+LV5aA8hAVF0Ot/unkG3QwsSILDTaEgWwHtn/ezZ/dCMmVO23gJ4+bEePV9gqksaZ878vZHyuo7JJvWpx98w3BdA8dPGJ5Svuzx09mHCJWpbD3e2H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718721819; c=relaxed/simple;
	bh=1UwzhECrbNMlnaKtuZTayxxlZhsNfsmTEwViXahAyMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gdu41SOqqOtHsXyujrGDX5cRq/O419INBeKiOtHKYmCLuRJVX+8wailhP5D/kncvluEoTbkghxouDfyj2bio9B2w+UkoFo0Gka05cOEOde2+jq1+HKAH2ZJpNR9z8jOljhUvs0YxrR8LkJQRwV+EMumgPzwIzoye+H2WL8+zymQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPSVDKFM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BE3EC4AF1C;
	Tue, 18 Jun 2024 14:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718721818;
	bh=1UwzhECrbNMlnaKtuZTayxxlZhsNfsmTEwViXahAyMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EPSVDKFMc59K2ZxfIuoVRM4RvajTUeLlZ4COcsXV6z7pVsma53UwTsSN/gJwlcwRu
	 nMSHr6cg+MDveM2Mu1PZF4Ti7e/9u4fmmnlmHOcT0FvU2tJjzbTaqUKLKZiJot622/
	 SDkfn7T+6I4M35iv/e3GABSI6TTcFDcl9a6tSzRvSCXQA2XhfHrwmDO5JvPLEDcFLH
	 nzvpZRx06V6yfLpFrV9ysM7hJ/cf6gGJCCiddSbK7OgM/LBj95sq9buorN65dhNnKp
	 AXTfO1Q3tyZb2+IstKrqXQywERkXXj3bxwXKKIBBGmp6/5YTO3duwawy3VzzB4iTPh
	 LreCkpEx/VT1g==
Date: Tue, 18 Jun 2024 15:43:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
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
Subject: Re: [PATCH RESEND v5 00/16] Add audio support for the MediaTek Genio
 350-evk board
Message-ID: <77872070-6d0d-408f-80c8-c4a996b9d260@sirena.org.uk>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
 <ZmwODkYov79VHznK@finisterre.sirena.org.uk>
 <85e9451d-2cd0-457f-a246-017433757fff@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VWS3IQXFjAKUwyY9"
Content-Disposition: inline
In-Reply-To: <85e9451d-2cd0-457f-a246-017433757fff@baylibre.com>
X-Cookie: If you can read this, you're too close.


--VWS3IQXFjAKUwyY9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 17, 2024 at 10:05:37AM +0200, Alexandre Mergnat wrote:
> On 14/06/2024 11:31, Mark Brown wrote:

> > I seem to remember you had review comments that needed addressing from
> > AngeloGioacchino, why resend without addressing those?

> I don't see any comment:
> https://lore.kernel.org/lkml/20240226-audio-i350-v5-0-e7e2569df481@baylibre.com/

Possibly it was racing with comments on the previous version?  In any
case I see it's still waiting for some review from AngeloGioacchino.

--VWS3IQXFjAKUwyY9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZxnRIACgkQJNaLcl1U
h9AftQf7B2zRtt6hSQ1Xu+5FarxKtCBDR6nBW7WYRVgndY5irQ8rB15/1pKg5ik1
j0ms8fH3Q91pk4BjDrtj8z7/s2yL3YMJYPhEgKyeoUPs3lM1C3BDxTCiMvafx96y
5tQ5ad+c9UQgS8pq7lTa/xtHXfKFxdA2ABym8/DYpfn8eJ/UyM13wo1OJmW+uLnO
K/o8AJqCzj4+U0PnMPImGUQmX87qmN2XuWrHAFuwRPFsru1+w+Ii5A3pOdMwWSa+
3z9SIUmF3NriAeP7ntviKHjg9Pe8x6fqG/R6WsPkYvp6ydg8si62JAluH8e49NkQ
APIdSQGffLVEELyK6/xmm4XXm6CTQg==
=u7CT
-----END PGP SIGNATURE-----

--VWS3IQXFjAKUwyY9--

