Return-Path: <linux-media+bounces-13945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B54EF9128AB
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 16:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7BDD1C2510E
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 14:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4AF3F9EC;
	Fri, 21 Jun 2024 14:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLNZ5w7O"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20A74F20E;
	Fri, 21 Jun 2024 14:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718981916; cv=none; b=tMBzGlfMFh9E1ZhyBhdgAxHQaGm/3ppANToVIpjsIIj7rGlgO2UsPvBAEF0HhGD1zHJPj5EfLb531pR3rYxdLVMW/zcQthZeLKRX9ZHDV+tvRWHlNe6uw5l9azXz/cMe2Ftaj9l3HJlu7GyuRIsQVKo6y26f4H6f+tHDhoFwcwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718981916; c=relaxed/simple;
	bh=iTy+ar2v/aPDrGFgYNM/EKjztldR0LbzdgwRrLgUwaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wv8IWBjg3DfhYD53V5+QKsczOlFV85oC0N+EcriULzuwqu7NwhzCCSoJowSc8Pms9ces6ZOBvx50SfYtF9grbm9d4yQML9i+4NH+LcIr6sG1KV8cQmorgSMc8arxPFKjft5z6SGSzRpegEhQiPOTMOswYsPYxchXKNDlEyBik5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLNZ5w7O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE66C2BBFC;
	Fri, 21 Jun 2024 14:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718981915;
	bh=iTy+ar2v/aPDrGFgYNM/EKjztldR0LbzdgwRrLgUwaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dLNZ5w7OhfaSkX+v1brG7veriBApUjUqkk7BE8esWrTGvoYtGimxMKK3Gl0PPc54O
	 xknBq1zsamjVsrO3GuexV7RVQMc7uVA3vArhI2tkHqL5ya35XV3N272wNYvUFhb8RF
	 bf9IcY23muCRsn/KvT95JTyEk9IpAxIuPZDGb1IDxGQZ22QnIKpWxNgXETaoatEjMb
	 qGA8hBa+roOxP8p89YBJZAiZpoPt26NWrfOLECjww3vw0ggAsly7e4aGb92+iDk8ko
	 B4qe57iWIrTC7lFt1FsMQ3nOueuVOatM7CNelfL4Aohry88xYCRBpxefZ5A/YK1bWK
	 odNViv395bCYg==
Date: Fri, 21 Jun 2024 15:58:27 +0100
From: Mark Brown <broonie@kernel.org>
To: amergnat@baylibre.com
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
	Nicolas Belin <nbelin@baylibre.com>
Subject: Re: [PATCH v6 12/16] ASoC: codecs: add MT6357 support
Message-ID: <e6f1e8b6-f542-4cc7-828d-69810209e9b3@sirena.org.uk>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
 <20240226-audio-i350-v6-12-f754ec1a7634@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jw2Y2pYWLtcvlWMC"
Content-Disposition: inline
In-Reply-To: <20240226-audio-i350-v6-12-f754ec1a7634@baylibre.com>
X-Cookie: Your supervisor is thinking about you.


--jw2Y2pYWLtcvlWMC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 04:46:48PM +0200, amergnat@baylibre.com wrote:
> From: Nicolas Belin <nbelin@baylibre.com>
>=20
> Add the support of MT6357 PMIC audio codec.

This breaks an x86 allmodconfig build:

/build/stage/linux/sound/soc/codecs/mt6357.c: In function =E2=80=98mt_delay=
_250_event=E2=80=99:
/build/stage/linux/sound/soc/codecs/mt6357.c:993:29: error: unused variable=
 =E2=80=98pri
v=E2=80=99 [-Werror=3Dunused-variable]
  993 |         struct mt6357_priv *priv =3D snd_soc_component_get_drvdata(=
cmpnt);
      |                             ^~~~
/build/stage/linux/sound/soc/codecs/mt6357.c: In function =E2=80=98mt6357_p=
latform_drive
r_probe=E2=80=99:
/build/stage/linux/sound/soc/codecs/mt6357.c:1867:55: error: too many argum=
ents=20
for format [-Werror=3Dformat-extra-args]
 1867 |                 return dev_err_probe(&pdev->dev, ret, "Failed to pa=
rse d
ts\n", __func__);
      |                                                       ^~~~~~~~~~~~~=
~~~~~
~~~~~
cc1: all warnings being treated as errors


--jw2Y2pYWLtcvlWMC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ1lRIACgkQJNaLcl1U
h9A1bwf/V2Qer6d82i9EFIihaq/lGhQ/qfe9gIru+7gJsGI4DqFQH74lqhneOg79
dbDE9ZxWZMSkRPam0eioJpIWXqp6PInaXpjQ/9S2xHdNwc1c/uUCoChWA98NXlo5
RADmcGSWVwtbKq/nplum3hiKS2+GF5VUC6Rce/pnb22YK8EGSfgsMzdtSRVrcqaW
3Rjoh1zf6wzyWBjQmJ1x+8C0lvVH2IbGzQStK9Khpo+Ojz5prAo6tXZA983ktHF5
m4VZoVblQEiohNk7UTYvsUD511IEo2WS1f9NIHZcQLSzjTbst70usLoGwnA9sjmb
+0XWKkjxGKPzqT7CHhn2IW2qzOam0Q==
=OTn4
-----END PGP SIGNATURE-----

--jw2Y2pYWLtcvlWMC--

