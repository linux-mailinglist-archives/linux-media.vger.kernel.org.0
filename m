Return-Path: <linux-media+bounces-17828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7655B96FD03
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 23:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA99728AB23
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 21:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CBA1D79A4;
	Fri,  6 Sep 2024 21:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vmb8um88"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0684481DD;
	Fri,  6 Sep 2024 21:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725656691; cv=none; b=slLtb2fpvWbE3AhpX80t3QnLNvfI3D8l3xelgzfQcOnlvmjS+a2C6ylqC+tokVTL86Ncqwt5mPyWVXly57Xm/+1iVnSNiqmiGVRk7/LDMnSWT4TuoJ7tKZjyKxhB+86c/l7vaCMOVwbAaBrIYPtKHI+vtjo54MPs5ElsMn9rZRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725656691; c=relaxed/simple;
	bh=Qi7l3LEit7RU0ApqPXLuPy7zvE5YFnc5ZdG9M93j8ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MH6ivobTOwOCA8LbgQHFAncVbyJ+YNXQ5B+V8bNiydBeENzZt4XstA0EURq18vUdCWmbX1TwF6CqnuoTqGC4m6+0Ko+0qSBhrLyMs707wdgCvqwRP+vLa2EufqFDXHVSg8zt3jNPrPXRUlNrk/AZ1SKyReLWx57myQ4qk7WsFmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vmb8um88; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C40CC4CEC4;
	Fri,  6 Sep 2024 21:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725656691;
	bh=Qi7l3LEit7RU0ApqPXLuPy7zvE5YFnc5ZdG9M93j8ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vmb8um88N+sRkcpvVWHxnTOb8jGW9yFBSYtGRagysQ7mAgSmuSeox8PgqMTglme18
	 +F840LNShRhr7zMt8FRUXxYglgaH9GIc5+VaGdBG23kUf8obXYjcLJQpli7jugzmp4
	 rlxP32YE2f7J5Ne4XKrLsuOG46nI+Pz2iEP1lPAK4cxtkk2+pdJjlir2C3H6jspetw
	 kyo5qKCDSu+5EdqKASCPiA6qgIzRAoJcvGsA9/8F7Ji173UqxRkzosN5vapkHrlAvw
	 izCCxVZm+mn/F1BH2QanTGH/dHLf1VWbrfDw1UcWbcJRAgZ3lh6rtmWNe51vWM6pfw
	 URZoLmwXGjnHg==
Date: Fri, 6 Sep 2024 22:04:48 +0100
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
Message-ID: <ZttucCV86ryyqIiT@finisterre.sirena.org.uk>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
 <172544860860.19172.7052813450885034844.b4-ty@kernel.org>
 <20240906180348.GA1239602@thelio-3990X>
 <ZttJdexQFOq2Q9iQ@finisterre.sirena.org.uk>
 <20240906192323.GA3160860@thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tSNyT2qHs0Efy6wS"
Content-Disposition: inline
In-Reply-To: <20240906192323.GA3160860@thelio-3990X>
X-Cookie: Your love life will be... interesting.


--tSNyT2qHs0Efy6wS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 06, 2024 at 12:23:23PM -0700, Nathan Chancellor wrote:
> On Fri, Sep 06, 2024 at 07:27:01PM +0100, Mark Brown wrote:
> > Are these just warnings introduced by recent versions of the toolchains?
> > These commits passed an x86 allmodconfig with GCC 12 at each step (I did
> > catch one warning there with another patch in the series that didn't get
> > applied) and 0day didn't say anything at any point.

> Not sure, I did not look too hard. At cursory glance, I am not sure x86
> allmodconfig would catch these, as this code depends on ARCH_MEDIATEK
> (not COMPILE_TEST), which only exists for arm and arm64.

Ah, I hadn't seen that (the other bits were building on x86).

> > > Clang 19:

> > That's relatively modern, though some of the warnings don't look
> > particularly new and exciting.

> Fair although I still see some of them on old versions too:

Yeah, like I say some of the warnings didn't look like they were new.

> https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/1=
0738441894
>=20
> > >   sound/soc/mediatek/mt8365/mt8365-dai-adda.c:93:8: error: implicit c=
onversion from 'unsigned long' to 'unsigned int' changes value from 1844674=
4073709551614 to 4294967294 [-Werror,-Wconstant-conversion]
> > >      91 |                 regmap_update_bits(afe->regmap, AFE_ADDA_UL=
_DL_CON0,
> > >         |                 ~~~~~~~~~~~~~~~~~~
> > >      92 |                                    AFE_ADDA_UL_DL_ADDA_AFE_=
ON,
> > >      93 |                                    ~AFE_ADDA_UL_DL_ADDA_AFE=
_ON);
> > >         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~=
~~~
> > >   1 error generated.
> >=20
> > That's a bit surprising, regmap_update_bits() takes an unsigned long?  I
> > suspect the constants need to be defined as unsigned.

> Does it? I see it taking 'unsigned int' for all of its parameters.

Sorry, I misread the warning there (or was perhaps looking at another
one) and for some reason though it was about dropping signs but it's
rather due to BIT() being defined for longs which is a rather bad
landmine given how common a pattern negation is.  I do see that
synclink.h has some convenient BITn macros for some reason which would
do the trick but really I think it's just a case of open coding the
BIT() usage, or defining a BITI() or something but that seems ugly.
Probably just open code the definitions.

--tSNyT2qHs0Efy6wS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbbbmoACgkQJNaLcl1U
h9A4/AgAhDUwT8rRI4M3S+NXdNzBJSPacU05GQT9cqLHhdUtUgyqvhxeH6OhPjiN
wUxAA7ugGFCDswITd22nOKiR76kgijacKAluiYXCh0nPvokDPQyzUklJltqFUYzm
GJfOTqniw75BP3VxTgB7KmehOyYd1EP72Oj1qc6HmNmZX7G3c2wcX3cbED2eP4hU
BfWhc9whOYYXqUYMicCcpItyPVVfKyvNgwbePdDxlHNcapm5t8z8b0jIutnhDr+c
4AUADF6NwNc6L7+ttA5yHTogggWSrzJBIYea3trWLj14a32ho28hZb6+1jE3Q6R6
bnK/Qw7CnUl4m787UaxMFjX9z84mxA==
=qv06
-----END PGP SIGNATURE-----

--tSNyT2qHs0Efy6wS--

