Return-Path: <linux-media+bounces-18225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 985C0976D93
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 17:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D1751F21D16
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 15:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A2B1BDA8D;
	Thu, 12 Sep 2024 15:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAxiGqLY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8841BD501;
	Thu, 12 Sep 2024 15:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726154249; cv=none; b=I5i0HqOJCnrEcXI9cwfOFSWLiYeGCZJFMPLKLQcH5mIIL5TZkp656lf3ONSC7WMTz52WVgYwJoMBTu0MkwH5CNu2Oajshb+/ELvJebDIeNx1/FlmF1NEJmAQ1O4Uz6gaG4BtSPdilcfkNayo5HlIdRPAyybX0PPl9vjsakLAaSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726154249; c=relaxed/simple;
	bh=2UwdqZFC9xO/m0eQjrelfthM5Arpc7S3EOd9x/RSR+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VvDNu7vzyD/Rkw+UI1J15AD2vhlAyGR2VcYMIL8A1E6InIfkVkJvcO27v3iEsERP4ZGXNTGJ2WY7bcpy/y4a1CY3eCRWtPiFFAhk/FxbvNP6t2svyanG4Q6HkWM31yg4U1YnOVKi5BOj/e9VIM8gMA9yPG3Mev69OrgaqO+Qe8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAxiGqLY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E35AC4CEC3;
	Thu, 12 Sep 2024 15:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726154249;
	bh=2UwdqZFC9xO/m0eQjrelfthM5Arpc7S3EOd9x/RSR+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LAxiGqLYn+sNKb+kgEcfh7PhpwNdMHrkCSj8xVs3HJf+6+0Ki/yi1Jy511Apeomr7
	 xRqu/opQo83N4OEJAgarhmBFQOYqPcZYNrRguTXxanX8cdMtdp9r8e+ZHUrm2WaYS0
	 ZkjQjZbYOhxSy+P9/CkPQPC9ppzlbX86wdmiQypiLdgca+oUvNLsOedxPmuTXY6XG+
	 9m/tXPEpXrrP6kj2hmhItobsBHtXng/Gk0SgS71eIn10yxrPHLYEZDe+s88Pmu9Ojc
	 vzxJIv0lJOunfh5pCUgNLlW5hKCOUUY/5LuFqLUpO/ZTDhMyEzrT76YPZgLCFlRE7G
	 Qj2f2QPFuvzjA==
Date: Thu, 12 Sep 2024 16:17:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Nicolas Belin <nbelin@baylibre.com>
Subject: Re: (subset) [PATCH v7 00/16] Add audio support for the MediaTek
 Genio 350-evk board
Message-ID: <10c1217b-d8a3-489c-93fc-6de45dcbe47c@sirena.org.uk>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
 <172544860860.19172.7052813450885034844.b4-ty@kernel.org>
 <20240912145100.GE24460@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y3oLGwx0CbwVg8fa"
Content-Disposition: inline
In-Reply-To: <20240912145100.GE24460@google.com>
X-Cookie: Happiness is the greatest good.


--Y3oLGwx0CbwVg8fa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 12, 2024 at 03:51:00PM +0100, Lee Jones wrote:
> On Wed, 04 Sep 2024, Mark Brown wrote:

> > [03/16] dt-bindings: mfd: mediatek: Add codec property for MT6357 PMIC
> >         commit: 761cab667898d86c04867948f1b7aec1090be796

> Did you mean to hoover this up?

It seemed to go along with the series and had a DT review so it looked
like you'd just left it to the DT people to review, there wasn't any
other MFD content in the series.

--Y3oLGwx0CbwVg8fa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbjBgAACgkQJNaLcl1U
h9B5NQf/ZWJ40S0xb5uKIaaPLShhD3p7geYHZwZ9a66tMrFPvLQPcedOcWej18uU
fY+5w+dmP0Ga6zV3m5paFAgei5w8LIJvnnPSmTUshEfxuFuhJ/83qu69Abj+Ewm9
V8j06cS1jSPE+onhQv5NOUTHkDWyL3HGf2uyps5Y0c7Mqd9ABe3AiJK1MSAiWiXN
4PDBhsNjMNMuEVfKRmNzGc2Z4deVPu+xzeXk+KWcccz4vUjUuCLlFnHklaT29sTa
2WON5KGah1lT7hyVYvf4wA+x6MTorlvAczP4W7fm+yd2s3anZO05OB/xFSqniPr7
x6OaFpBbyGm4Wivn5Ikvo3Wbze2Usw==
=cfaI
-----END PGP SIGNATURE-----

--Y3oLGwx0CbwVg8fa--

