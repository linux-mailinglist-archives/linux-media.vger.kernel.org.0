Return-Path: <linux-media+bounces-13932-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E2F9125E7
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 14:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41CD2286818
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 12:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63DB715B131;
	Fri, 21 Jun 2024 12:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8IKh8rP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6E9153BDE;
	Fri, 21 Jun 2024 12:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718973868; cv=none; b=HGE4yV57TRa5A0nqbwGW1UGLHOU7BKT7D+21gCxy8Ich5fZBFemElOMthPC8RQS4CJDENChITHitYrgQwD7598gU2TqzRF8vD9EgsXv+kUiU/5z7XvUYxoRt2KvN1gM5kE41wjhpjDjh5RrySiyzc8wp9nJHP9A5jvG1ZEayS3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718973868; c=relaxed/simple;
	bh=bwqf13fJbLJEoJ55Fq8cVIZa/qvXiPcZ4TMFf7szj6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLoBqn7nQer6GBZtv/ToPhtgjp+lufnucD+ZM1M231VjoWy+Lxp5vtFuBicCJEND6rZSwjPCw0kLeTKznFk2cKb6DiXaMXxn0ooZ6wUiNR0kRBtG7WHsCSLfUO49XBRESlbaqpTzxx9GYYFAaoGU4Hf8b8BiEVQc5J/E7CLJ39c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l8IKh8rP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4569EC2BBFC;
	Fri, 21 Jun 2024 12:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718973868;
	bh=bwqf13fJbLJEoJ55Fq8cVIZa/qvXiPcZ4TMFf7szj6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l8IKh8rPJ6LhZPucaRVWP/8fVx7Xxn6rv2vU7HIlfwyi9Q96L78zxrZ3zhmjtudB0
	 J3tju9CVfyLjhlAOJWMauyHtWsdLjK3txtaalshO/dngDUizd1XzDP6LMIUbZBXavB
	 +8KE0WLENQ6jEdfgeJYwijdzrlgFvpOTR2HFnkBrAc0rdcKAXPoTkZLV4bV/cTusbH
	 OBtLDjkQPYR3wotR+Wn7W5zr040SNYXGr1ZQRN8QKzEvEtgTV8xggmtD7my/kpv1qT
	 wLn6blkh/cY091zWPbqahLn59Luh3YNHrKn/lEiz3fKB1cxWABQ/Sb62GAvK/7RrdJ
	 tIK9yeZk6HlDg==
Date: Fri, 21 Jun 2024 13:44:20 +0100
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
Message-ID: <1ca27c79-a83a-42a7-9e9b-766da0064c73@sirena.org.uk>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
 <20240226-audio-i350-v6-12-f754ec1a7634@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y31DJCgxhlUXFcNQ"
Content-Disposition: inline
In-Reply-To: <20240226-audio-i350-v6-12-f754ec1a7634@baylibre.com>
X-Cookie: Androphobia:


--Y31DJCgxhlUXFcNQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 19, 2024 at 04:46:48PM +0200, amergnat@baylibre.com wrote:

> +	/* gain default values*/
> +	regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON0, MT6357_AUDPREAMPLGAIN_MASK,
> +			   UL_GAIN_0DB << MT6357_AUDPREAMPLGAIN_SFT);
> +	regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON1, MT6357_AUDPREAMPRGAIN_MASK,
> +			   UL_GAIN_0DB << MT6357_AUDPREAMPRGAIN_SFT);
> +
> +	regmap_update_bits(priv->regmap, MT6357_ZCD_CON1,
> +			   MT6357_AUD_LOL_GAIN_MASK |
> +			   MT6357_AUD_LOR_GAIN_MASK,
> +			   DL_GAIN_0DB << MT6357_AUD_LOL_GAIN_SFT |
> +			   DL_GAIN_0DB << MT6357_AUD_LOR_GAIN_SFT);
> +
> +	regmap_update_bits(priv->regmap, MT6357_ZCD_CON2,
> +			   MT6357_AUD_HPL_GAIN_MASK |
> +			   MT6357_AUD_HPR_GAIN_MASK,
> +			   DL_GAIN_0DB << MT6357_AUD_HPL_GAIN_SFT |
> +			   DL_GAIN_0DB << MT6357_AUD_HPR_GAIN_SFT);
> +
> +	regmap_update_bits(priv->regmap, MT6357_ZCD_CON3,
> +			   MT6357_AUD_HS_GAIN_MASK, DL_GAIN_0DB);

We generally leave everything at chip defaults, why is this different?

> +static int mt6357_codec_probe(struct snd_soc_component *codec)
> +{
> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
> +
> +	mt6357_codec_init(priv);
> +	return 0;
> +}

Why not just inline mt6357_codec_init() into the one user?

> +static unsigned int mt6357_read(struct snd_soc_component *codec, unsigned int reg)
> +{
> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
> +	unsigned int val;
> +
> +	regmap_read(priv->regmap, reg, &val);
> +	return val;
> +}
> +
> +static int mt6357_write(struct snd_soc_component *codec, unsigned int reg, unsigned int value)
> +{
> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
> +
> +	return regmap_update_bits(priv->regmap, reg, 0xffff, value);
> +}

Why open code these, the core has standard adaptors for regmap?

> +static const u32 micbias_values[MT6357_MICBIAS_ARRAY_SIZE] = {
> +	1700000, 1800000, 1900000, 2000000,
> +	2100000, 2500000, 2600000, 2700000
> +};

Just use ARRAY_SIZE() for the size then the number can't be out of sync.


--Y31DJCgxhlUXFcNQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ1daMACgkQJNaLcl1U
h9DFewf+M/CBa2qN5RnVF8Zc5QWTvxC4SKpFwRma8NGXYRkdIuRXOhTpxRG85BYY
w0ndJAb81OyrS1X3S8EpFu0cTQdBB7po6aGY3/n1tnY0JIkQ820QI+XDGlduderG
aPJ1LFil592z/y4CEYhDWzOsFWLLyJKyRI490d6BuyRNdljzSLS1QmJ2HrpnPI/S
D63ThavR4gijP3ePCZ6Bajond76rmR5CDUo3/LtUBAliMvLcIpwdKqcEjjdpMm7G
BuKS/CUvpRgJ5D+hyi9xFWRSBajwhFVLHJ1R/jtOLU/DQiYH/x78dMej8JApEp6X
Gohk7DuuhbfZflRiEj17qKTMYvMWvA==
=P5mN
-----END PGP SIGNATURE-----

--Y31DJCgxhlUXFcNQ--

