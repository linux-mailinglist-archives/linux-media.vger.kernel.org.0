Return-Path: <linux-media+bounces-41589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8570B40262
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 15:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1CFC5403BF
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 13:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89AD2F7459;
	Tue,  2 Sep 2025 13:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gP3VPcXb"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670BC2F998B
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 13:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756818790; cv=none; b=uKKwMIYlB/Sb8M2/LzYXj66i9iUY/ImNa0wbBp/Kxnb+nzpT/TJDV09VseDbYwvIIAg8gNkScZfG4sXHeVbBMioWwBrLrNKCNcAPISe4YB0Ja4xjZxs90NHfyMVwLxFNpfQ0DKLJ8koP3Q6qlCRP4Haq9THXkBa17HdGleLC6vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756818790; c=relaxed/simple;
	bh=L2RstHkjyk2Hf9za+Xc41LtiOl30EFScoomnw0JzxEI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kA1ja9rlhb9/VVmFsTHSuKAzbSZBn7Htqm1LHLMA0O2HWf1h+Ome2PdPEjQfM+mBZAD2boteAzNyHZh9LXcTDPfQDD44LzrXjlOUquDI0L4grmgzRvKkSy+i3afYyNKJ8ReQj5DmX6Gg1/hsCXGPupDkfKkvmducYdU522au1PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gP3VPcXb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756818786;
	bh=L2RstHkjyk2Hf9za+Xc41LtiOl30EFScoomnw0JzxEI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gP3VPcXbE5CgiEoPndtjF0MJ/uzVNzFzH1fg93hPGHvTxujMBp6f7Kd+nvvpfP7JH
	 FYuTz8MjPgOFnblDX6C9EqX8XKXBTHhTz+9AYr0y600ECSWn2ygyHw8sM0W3v0CNxv
	 QgqyfehsAA7x0IDY0DfpjyGhJ20jqcyq104vnVo546v8ldLJ6QBLUlnbLdi7ujBDRH
	 q+PeIFEUmwNXDqCb9V9lpQlLRf6fkHs5cijYHR8Wfharm/C4cTA9gy5pY0Ifd8pzhP
	 n0s3/kJhtPCZNeGrPFI6IJjFOfO0RGzOxyVk+nn9QOlwItzsmD0DO9ZYBcc4zbLPk3
	 B0r73jLZO0xxQ==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1BD4417E129F;
	Tue,  2 Sep 2025 15:13:06 +0200 (CEST)
Message-ID: <96dc1231c7d18f8106e4b5e56a336add377ee235.camel@collabora.com>
Subject: Re: Hantro G1 jpeg decoder stm32mp2 (plain text)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Cc: linux-media <linux-media@vger.kernel.org>, Hugues Fruchet
	 <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Tue, 02 Sep 2025 09:13:03 -0400
In-Reply-To: <CAOf5uw=uPkC60gE7Ea_ZnEZdYJRYRJKz=OVUN0RvO_NVe2tw5A@mail.gmail.com>
References: 
	<CAOf5uwmTTFcizew2QRAr=TZ12hTfXg6NFEsDYKASB7wPeB4odw@mail.gmail.com>
	 <7b37c5679994281ae1806f2ee84d1aede77ca836.camel@collabora.com>
	 <CAOf5uw=uPkC60gE7Ea_ZnEZdYJRYRJKz=OVUN0RvO_NVe2tw5A@mail.gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-98cLwVdz7O2BAp+OAIur"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-98cLwVdz7O2BAp+OAIur
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 02 septembre 2025 =C3=A0 15:01 +0200, Michael Nazzareno Trimarchi =
a =C3=A9crit=C2=A0:
> > If you only have one format support, you don't need to force anything i=
n
> > GStreamer. Some extra information about Hantro post-processor. When use=
d, you
> > need to provide 2 sets of buffers. The decoder will still produce NV16,=
 and a
> > secondary set of buffers is (in parallel, pipeline mode) written back i=
nto the
> > format you have configured on the PP register set.
>=20
> Those sets of buffers are provided by gstreamer or how does this
> handle in practice for
> other decoders?
>=20
> >=20
> > The post-processor can also be used in standalone mode, but this featur=
e is
> > often fused out. In that mode, in can input interleaved YUV, as often p=
roduced
> > as raw format by USB cameras (and most cameras using serial links).
>=20
> Much better. Now I need to understand better about the two set of buffers

the V4L2 API does not have the notion of primary vs secondary buffers (unli=
ke as
an example Vulkan Video, which is 20 years younger :-D). So we endup hiding=
 the
primary buffers inside the kernel driver [0]. Just notice the this allocati=
on
allocates reference buffers for the decoder, and the decoder actually alloc=
ate
the final buffers. This is quite convoluted imho. Note that some important =
fixes
have happen on this part of the postproc code (which arguably still need a =
lot
of cleanup, a proper split between G1 and G2 (and merging back VC8000 into =
G2
since this is largely compatible).

https://gitlab.freedesktop.org/linux-media/media-committers/-/blob/next/dri=
vers/media/platform/verisilicon/hantro_postproc.c?ref_type=3Dheads#L224
https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/db300a=
b0e9d38b1e1b0b561333b66a5beacb9994

=20
regards,
Nicolas

--=-98cLwVdz7O2BAp+OAIur
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLbtYAAKCRDZQZRRKWBy
9J/nAQDsT9FsqXhFKQW99LcUtHhSBGnEVwnVtslCWBxLq3pB1AD/Z8VPt5X/3K+t
Wb8wRX4SPPhasIBm9rLFjkjUQuIYyw0=
=tx2I
-----END PGP SIGNATURE-----

--=-98cLwVdz7O2BAp+OAIur--

