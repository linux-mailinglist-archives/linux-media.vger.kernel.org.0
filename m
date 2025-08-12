Return-Path: <linux-media+bounces-39631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E4943B23A5C
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08A9A7AED50
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827E0253B42;
	Tue, 12 Aug 2025 21:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gCDUe51M"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3CF20C469
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755032900; cv=none; b=QqkZXta7LbkzAJ93lSyQn6mFoW/rFwrbFa6d+x1Y46Cl3xeTF6PIvG8mH3vFgH1T0/mhLgCEh1PFvzU474Fc8oDJKdPnkPGYz6+1J34tFdCF8ZVhvOejhRnueI9NoTYNMvqLbDcmzDjDy4juwbZ/XVoFv3TP6WefGbKNxUqI4s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755032900; c=relaxed/simple;
	bh=N17IGLs3rddoOp7pi0iktM19DtxTbLMk5VcaZSd3U1c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V9w8NF2Ea2ZWHPXLGVas7oe0fCdyI7677RToTsIIsHY0iUFjtgzSsX58Gvj08sn2k9Z72TjOcDzrk3nLxr0hmhmZw/guZWBsXIhmP8oy71s+0E3aHKSKbqpZrNTnJSNnCrbM9M3rQjFM1O8bUzUH+baEgr4q//ytsI+Nx5DxLCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gCDUe51M; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755032895;
	bh=N17IGLs3rddoOp7pi0iktM19DtxTbLMk5VcaZSd3U1c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gCDUe51MZ/9cFBD3RUUEfBb9wA4POFTcn2CvG+SNeHIm21VrZjayBKbEr4Qp/8Va4
	 vAJW/gre0YY8SjMMKfWfHP2t9mQIRb5B92DywKgTv/spCRtmVA9qVnLMKOquo6blpp
	 RLmakdGWvK8QVNk3tbwn/kz1qmoTFftJuNxjPT61uY63DgPOl4FDbcfx1gO8Qp/Yse
	 oEF//urKW6AZVH48a7KfsG0d83OWMzTMqHhipo1jPcJvwwNBuj7D0eVKDpogerwN/V
	 EkB9px0xiLAkjnED00BcrRkARNRqFgCUcnRtkYg/OKosnD8Q6mzsmA3WejQIvUEPEc
	 NFayuqlDc9BTw==
Received: from [IPv6:2606:6d00:11:5a76::c41] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6131F17E011A;
	Tue, 12 Aug 2025 23:08:15 +0200 (CEST)
Message-ID: <abb9e9c2ebaedb657d50afcba5e1dfba8a39d34d.camel@collabora.com>
Subject: Re: [GIT PULL FOR 6.17]  Media Codec Fixes 2025-08-12
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Tue, 12 Aug 2025 17:08:13 -0400
In-Reply-To: <d5a7552c0c19902259931fa5002eda09b5e88dbb.camel@collabora.com>
References: <d5a7552c0c19902259931fa5002eda09b5e88dbb.camel@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoiZBBMWCgBBAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheAFiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmgssvgFCQll93U
 ACgkQ2UGUUSlgcvRSeQEAjcvEl/A6R2y2nMufL4A8MiKQfPZqJPXlhhno2PZqqUcBAIR87Pv5+cZV
 ZTN26stch5wMyalcKgRNQ9IxtGvVelUCtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1ZnJlc
 25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQ
 TvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZsmBU
 pkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHCAAS0
 LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBFiEE7
 w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAwECHg
 cCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8bRLv
 9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-+7QnZIR8rdL06QTkgXau"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-+7QnZIR8rdL06QTkgXau
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Le mardi 12 ao=C3=BBt 2025 =C3=A0 16:31 -0400, Nicolas Dufresne a =C3=A9cri=
t=C2=A0:
> Hey Mauro,
>=20
> This includes two fixes for issues reported against in 6.17-rc1 in rkvdec=
 driver
> along with a removal of pm_runtime_mark_last_busy() requested by Sakari. =
This is
> my first pull request against "fixes", let me know if this is appropriate=
.

Just confirming this is correct, despite me having sent the email with the =
old
RSA 1024 key while tagging with the new key.

cheers,
Nicolas

>=20
> cheers,
> Nicolas
>=20
> ---
>=20
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d5=
85:
>=20
> =C2=A0 Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
>=20
> are available in the Git repository at:
>=20
> =C2=A0 https://gitlab.freedesktop.org/linux-media/users/ndufresne.git=C2=
=A0tags/fixes-for-6.17-media-codecs-2025-08-12
>=20
> for you to fetch changes up to 85cb7dc3d2415685a4372f637cf26e5f077e6842:
>=20
> =C2=A0 media: rkvdec: Remove redundant pm_runtime_mark_last_busy() calls =
(2025-08-11 16:32:26 -0400)
>=20
> ----------------------------------------------------------------
> rkvdec 6.17-rc1 introduced bugs and PM runtime cleanup
>=20
> ----------------------------------------------------------------
> Christophe JAILLET (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rkvdec: Fix an error handling path =
in rkvdec_probe()
>=20
> Dan Carpenter (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rkvdec: Fix a NULL vs IS_ERR() bug =
in probe()
>=20
> Sakari Ailus (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rkvdec: Remove redundant pm_runtime=
_mark_last_busy() calls
>=20
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.c | 17 +++++++++-----=
---
> =C2=A01 file changed, 9 insertions(+), 8 deletions(-)

--=-+7QnZIR8rdL06QTkgXau
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaJutPQAKCRDZQZRRKWBy
9HUYAP9myGkcGAGyCnfxoPj+pbDNhUlu9yy1fuE5Uu5MTwtXlgD9Hyl7dKI7gxvf
/7xSIVadMHEoWOibqzqH2cxtaaoJMAA=
=ds/f
-----END PGP SIGNATURE-----

--=-+7QnZIR8rdL06QTkgXau--

