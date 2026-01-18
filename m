Return-Path: <linux-media+bounces-51001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEE7D39AB8
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 23:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F0A13012CE8
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 22:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ADBF30FC0F;
	Sun, 18 Jan 2026 22:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ov3T7bN5"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0A52836A6;
	Sun, 18 Jan 2026 22:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768775670; cv=none; b=rccxWeeZs//Kg+KbG86ebnuw7F5PgnYeqvE71z0h4F3fjPgs1nxDQcj7VygQcisT5llH9ggMV3Y0MSAUpvE+BgU+E1ltMDJ9E7mu73qroTGqRAcH4kXKqZPEa3mXddSKe036RDr/amegy5oMDjSVjlNluD1GUQ9+5zSZlVqaxI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768775670; c=relaxed/simple;
	bh=+fpZRcVkISnDsiOYZILcnwYIBQK89nnMOZCHLherCTU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aPrycziIBtigLLSCqeKdVZUpRoxn4kvuUNwRfJRBu57N4cZLdwnQMs8so9qKqoc631bXx4RmnH72Jrzc/OC6ot1pfw9RX5hez28hZzJGxK5yW8bhGGOynpk2RmnqM1oBUlrYAIm96hJiIBczwXokk4V3x6FxdF2I51BAcyAFq6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ov3T7bN5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768775667;
	bh=+fpZRcVkISnDsiOYZILcnwYIBQK89nnMOZCHLherCTU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ov3T7bN5higH0YOJ80PhZDF7mKZQH6dYsmkUv1GseIpzIF/PfldTg6wfTainrTEv4
	 IruEyHZD1doDp68UGhBefy6HtORDyCyUzsmmTl55yXM5HRAu2KjtL+9ZPql47JoJ59
	 RfXr5rPdRah7xbfDKWZr8BysO6k87NLnOPnNeVfhmqj3uFXth4xUlNCfH05oje/QXK
	 qjoKBEpqLhqAdLVlYGysLh8qogH9+HeA7hDt9+6nsyLeI0Ncem/7u0I5PqSVHNzmhR
	 rrR1XU8HQ07HuMaJr7lbCzct02Kih8fGry98TUkOdrygkWi44FAZFWXmi5GOk8omID
	 3sGHnseSuuqdw==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1662917E1274;
	Sun, 18 Jan 2026 23:34:25 +0100 (CET)
Message-ID: <e63bea4f457dad4e4661185188f2b030d82b7879.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicon: AV1: Fix tile info buffer size
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de,
 hverkuil@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Date: Sun, 18 Jan 2026 17:34:24 -0500
In-Reply-To: <20260114090710.71473-1-benjamin.gaignard@collabora.com>
References: <20260114090710.71473-1-benjamin.gaignard@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-jI/5S99Z0pZFxvjm1Yct"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-jI/5S99Z0pZFxvjm1Yct
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 14 janvier 2026 =C3=A0 10:07 +0100, Benjamin Gaignard a =C3=A9c=
rit=C2=A0:
> Each tile info is composed of: row_sb, col_sb, start_pos
> and end_pos (4 bytes each). So the total required memory
> is AV1_MAX_TILES * 16 bytes.
> Use the correct #define to allocate the buffer and avoid
> writing tile info in non-allocated memory.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
> ---
> =C2=A0.../media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c=C2=A0=
=C2=A0 | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_de=
c.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index e4703bb6be7c..af854b149f35 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -373,12 +373,12 @@ int rockchip_vpu981_av1_dec_init(struct hantro_ctx =
*ctx)
> =C2=A0		return -ENOMEM;
> =C2=A0	av1_dec->global_model.size =3D GLOBAL_MODEL_SIZE;
> =C2=A0
> -	av1_dec->tile_info.cpu =3D dma_alloc_coherent(vpu->dev, AV1_MAX_TILES,
> +	av1_dec->tile_info.cpu =3D dma_alloc_coherent(vpu->dev, AV1_TILE_INFO_S=
IZE,
> =C2=A0						=C2=A0=C2=A0=C2=A0 &av1_dec->tile_info.dma,
> =C2=A0						=C2=A0=C2=A0=C2=A0 GFP_KERNEL);
> =C2=A0	if (!av1_dec->tile_info.cpu)
> =C2=A0		return -ENOMEM;
> -	av1_dec->tile_info.size =3D AV1_MAX_TILES;
> +	av1_dec->tile_info.size =3D AV1_TILE_INFO_SIZE;

After checking the sizes, I can only conclude the we rarely have more then =
8
tiles in our tests.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> =C2=A0
> =C2=A0	av1_dec->film_grain.cpu =3D dma_alloc_coherent(vpu->dev,
> =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0 ALIGN(sizeof(struct rockchip_av1_fil=
m_grain), 2048),

--=-jI/5S99Z0pZFxvjm1Yct
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaW1f8QAKCRDZQZRRKWBy
9MMVAP9W46+A8zHAErcgPaB+4lWE35ITcz/n6XeOwtZ74V1TdQD/ScSGmvqGGrh0
gcsWab4t4CLQtCetxyPHwd0GpkD+FQ0=
=oGdY
-----END PGP SIGNATURE-----

--=-jI/5S99Z0pZFxvjm1Yct--

