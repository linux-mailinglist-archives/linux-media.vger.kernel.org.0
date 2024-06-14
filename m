Return-Path: <linux-media+bounces-13257-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3077A90877D
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 11:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC63E1F24C22
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 09:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FD41922FC;
	Fri, 14 Jun 2024 09:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dowkx4Wl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6599A13BAC8;
	Fri, 14 Jun 2024 09:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718357522; cv=none; b=WwEL3o9QnuIo1qYFrZOpzPCmmQTMy7JDuyhQ1SmotVUjAq/o6ymf5boInQtyRd9fEKV3Fxd/AtsltGf2MawRcsZYkJHGg7ptq8MZpQsSaRy2mbEgxXKFXWYCvkwanW0EehKQ2q1BQG3m+K3fLWkTvdZaKtPnENi6b05hVxgnm20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718357522; c=relaxed/simple;
	bh=vq/hKXj8k3TXQ6CBXyolStxtljiu0fDBYD/cq4bFmRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXhwJlQVPgFdyEx6IqYI98b4OlJaO0IZXRiAG6BdP/5PoPA2blE5AXqsx4SeqwXB5ts0qr/+JGoMx9IttbKfnfjbaFh1nL7iAXDg/nx5lBwF6e2FlgagLMgBwpr8rSnRJwsrk0C/LqMxJwlb6paWk7uTtroHHzs0bP0pWH61PMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dowkx4Wl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75168C2BD10;
	Fri, 14 Jun 2024 09:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718357522;
	bh=vq/hKXj8k3TXQ6CBXyolStxtljiu0fDBYD/cq4bFmRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dowkx4Wli/K0fxQuXPa9Ov4p8jq4KCLXebXQhTLM5C+aiOubAYAqt6VKGvEfTd+is
	 u1H5cT2n6PNIyOSwsRfQdqH8u3Ft3fyV9zHmquoyyb8BUFk+PERVN+tIV4ajqw8vsW
	 7RY/uftugQcGLKrN6adOWRZRq7HYsGiNvsG/NHATdB9mbrBWreXhWtLEtiVV/8DM6O
	 /vkRXKIZ9h/aVv+Tf83y0fRDuc/X49dFn9IxjzSMYU720OV2uuxRpCpBG/1DNhh+th
	 z0C+Kh+7fItagFuiZgbzOIl7R01Bac1D8IAu15pqxJKVOASbc5i9MjozYRBusaqX82
	 AGLEieEUdavxA==
Date: Fri, 14 Jun 2024 10:31:58 +0100
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
Message-ID: <ZmwODkYov79VHznK@finisterre.sirena.org.uk>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SeMD/ZPP93d62FnM"
Content-Disposition: inline
In-Reply-To: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
X-Cookie: Your love life will be... interesting.


--SeMD/ZPP93d62FnM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 14, 2024 at 09:27:43AM +0200, Alexandre Mergnat wrote:
> This serie aim to add the following audio support for the Genio 350-evk:
> - Playback
>   - 2ch Headset Jack (Earphone)
>   - 1ch Line-out Jack (Speaker)
>   - 8ch HDMI Tx

I seem to remember you had review comments that needed addressing from
AngeloGioacchino, why resend without addressing those?

--SeMD/ZPP93d62FnM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZsDg4ACgkQJNaLcl1U
h9AoDwf9Gw5El3fz0zRFzNFxxe/7UfRa8HACWErrPscsXGk4tslBOE3UwCx3bw4Q
6VnbJ45siXspBD7/Zjhjhi9lvAZlz6ucKm2glWijqZHLg9xmSBrRyEDb2G98FWlI
SMczNAxg5QXwBUnID0bua6y5ZOldZEAGl53t5KuXWRe0/Znwns2+gUpSt3MAoDp8
rPfYqUv2whvlBzGYmg6XlbTskN/c/+qpODFdThrx57aGRjxRoVc82kAmN814Gbc/
nqKrNhIYzQDYBwKB1cuDXatDavgYFA5FugzeuZ80Va5/ZiuMX7JLgMHeVGQJZrQq
Jbv+xbpMJ+ow5S6rLO0D2CcOA91DsA==
=TqJQ
-----END PGP SIGNATURE-----

--SeMD/ZPP93d62FnM--

