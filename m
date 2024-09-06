Return-Path: <linux-media+bounces-17820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 515DB96FB35
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 20:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFA571F2245E
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 18:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF961B85DD;
	Fri,  6 Sep 2024 18:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/I7XYPm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907ED1B85C4;
	Fri,  6 Sep 2024 18:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725647224; cv=none; b=YEvfEsqSh77zJA+5fcth/86MCNgwO+5noCZMVZLJLG/MMqtLVGPbyNje9+PAbdNCNqpDdTmZUtW3v4jUUNIk31/sByNNXIVqvd8FczDo55PlplQG1fGLzvvN8IbTuHXZNn3840imomQgzvQUrUK0tqLVRXnbOY/Nr6rnBNXGSto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725647224; c=relaxed/simple;
	bh=Z24H6l7+L7v9bNFDB/ZvwU/G0rjimLtpHDYOhlthb1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A5hZrhpFLJhV+su5ejlTMn/rWeTEDBHxfqh8rztzTQjKEixRbSw3NugFFkT5miBWjSrvyOTA5jYsIebNmsxcvZBjV9kqYaFAvARAraiDakdfluazHh123HdY0GklBmD3ttG9CAXnE1woeRGuV5TQnCboS6uvl3/GYh2hJUYSk/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/I7XYPm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED90C4CEC7;
	Fri,  6 Sep 2024 18:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725647224;
	bh=Z24H6l7+L7v9bNFDB/ZvwU/G0rjimLtpHDYOhlthb1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P/I7XYPmrMkTy8lg9iD6wdrIeZ/OVa1oVD/ogiXpxtfpe2vAq6qGn7V7XBGyXt78b
	 pnWUBjsiLDdACBES1Sa/HY4uP/GcqHNeY0mR41nWiK+DPc+KOy+CzfuXznZzb+LWlG
	 uj4YwTKA+pR9LWu9BQKgN+Ri0KjTi4FeyXDC5Ry7ru6lXcUAPv2f6NkY5U1PIy5kUt
	 rq4I12TIpRm9vMf4g8Bj07TFUKT6eru1vdiAx/E87hcAkIw7KwzVXsJuR8tePAMWbK
	 Vaxt9SWfPovUsGeYkSj5o1x+5N6c5Y7kWOwHv6BZaY+5ZCNQ2roeDdY6DhcA0arm7s
	 7L5zrdcLcoVUQ==
Date: Fri, 6 Sep 2024 19:27:01 +0100
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
Message-ID: <ZttJdexQFOq2Q9iQ@finisterre.sirena.org.uk>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
 <172544860860.19172.7052813450885034844.b4-ty@kernel.org>
 <20240906180348.GA1239602@thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RwEXQMD7TlaLYYaq"
Content-Disposition: inline
In-Reply-To: <20240906180348.GA1239602@thelio-3990X>
X-Cookie: Your love life will be... interesting.


--RwEXQMD7TlaLYYaq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 06, 2024 at 11:03:48AM -0700, Nathan Chancellor wrote:

> I am seeing several warnings/errors from both GCC and Clang with
> ARCH=arm64 allmodconfig after this series appeared in next-20240906.
> As far as I can tell, they appear to agree. I wondered how this was not
> caught during the series development but perhaps it was written against
> a development tree that did not have Arnd's extrawarn series from 6.10
> in it yet? I was going to work on a series but I was not sure about the
> best way to address the overflow errors, hence just the report.

Are these just warnings introduced by recent versions of the toolchains?
These commits passed an x86 allmodconfig with GCC 12 at each step (I did
catch one warning there with another patch in the series that didn't get
applied) and 0day didn't say anything at any point.

> Clang 19:

That's relatively modern, though some of the warnings don't look
particularly new and exciting.

>   sound/soc/mediatek/mt8365/mt8365-dai-adda.c:93:8: error: implicit conversion from 'unsigned long' to 'unsigned int' changes value from 18446744073709551614 to 4294967294 [-Werror,-Wconstant-conversion]
>      91 |                 regmap_update_bits(afe->regmap, AFE_ADDA_UL_DL_CON0,
>         |                 ~~~~~~~~~~~~~~~~~~
>      92 |                                    AFE_ADDA_UL_DL_ADDA_AFE_ON,
>      93 |                                    ~AFE_ADDA_UL_DL_ADDA_AFE_ON);
>         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>   1 error generated.

That's a bit surprising, regmap_update_bits() takes an unsigned long?  I
suspect the constants need to be defined as unsigned.

--RwEXQMD7TlaLYYaq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbbSXIACgkQJNaLcl1U
h9DBuQf/SMng3m+4sXP7DvdmWbfXVaamODI/3rczhvAqTkDFclaL1jBsj5p3sj2y
xX6uR8ezbk3frph4AS2355DNa/q+5C/U/zGtas+sjouiNi/UjcHjd1c7RJUK/y+g
shmJSYMNaNvM0/ZNX5yNMvR+G0UWZApUx687YkRyqA4luRVf1KpwDac3Bkw26n9C
L7D5WqLGow4FYbfOirWq3PHcEJliZXxmSoV3A7JBtpUL5QlzwO5YvoI8Pyr1WSJj
rg7L1xqXCMj+Y8zAl2J7Sj6yw7E8cgo5kDfH9JYhabdRiwy5p/ydxTCQLp/BlQNu
Ly/Er+XOlK8Cx0Y7ma8DNbKdGgr9Vg==
=SBAj
-----END PGP SIGNATURE-----

--RwEXQMD7TlaLYYaq--

