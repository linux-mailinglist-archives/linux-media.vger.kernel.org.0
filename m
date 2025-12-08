Return-Path: <linux-media+bounces-48438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 440C4CAE176
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 20:33:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E73F3017640
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 19:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127F12D47E4;
	Mon,  8 Dec 2025 19:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KrJybDW+"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C623B8D63;
	Mon,  8 Dec 2025 19:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765222374; cv=none; b=ktgwqK+/B3r4k0q/0yPTpmetXcsrVXFubIBzd0kebf25S81YfSGjipng96FcZhEikMWGFNhuIRS4/pU/4UN9ErvhHfs01XnAWvmtgSjvTN98ufpou2oDQ0AQ0qL3ho1Xmu+ysNa2GuIG7CRbPXfoKKiXZIzSwi7wnLAnODW9y38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765222374; c=relaxed/simple;
	bh=SPy6IuXRQB6JWxPHINVrf9arRxcaSR93aH+ga+XRMfw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sCDbu7ES4TojNbkMb7xpZDKztj/xfkHijsJCymuFKlsevJDTzm5UxYmu+pL0wUK3aFh57wxcrBIW6vil4VRgFhibjyOhec/nySpMMKov6pAFCVJHBMDYYeK0N+dljFbTTJRDuMKxTskl5i+UatIRcvNTvVeCOElFN7AV1E/nxK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KrJybDW+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765222370;
	bh=SPy6IuXRQB6JWxPHINVrf9arRxcaSR93aH+ga+XRMfw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=KrJybDW+JVRXbQZxk2yyWuUjCnRXHvZcFurpD1Duy15oF3YIEamYtYlyDoGtdxGLY
	 eAqrgFVXkquR6CnnrxaQjRqighq2Dv7F/SLNHehis1GvwxsZmOZiQx8MFJmdNJ66dq
	 4SKMah6pQWMuLU7KsPXxrKkaA87snplawy9z4aBbKlEm4shur2pSPX0WXyUvReKSt+
	 mc8zPgYydKZfJp0dD0BaIbWy2FHgrGKcRhdrbyyKEWp5QszPA9pmEDYjFbUzS/ASSS
	 eoSiIc5MPzIezA+yZBnQ69bpB1dJeKPMV98g5I5ToSr0sNKY36eLpYyxDuSxbMDpOt
	 K5u40N2/ijKlw==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2815C17E10DC;
	Mon,  8 Dec 2025 20:32:49 +0100 (CET)
Message-ID: <f03ed0ed3d5ffc780fb23d1945d75a6459ffbe22.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicon: AV1: Fix tx mode bit setting
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de,
 hverkuil@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Date: Mon, 08 Dec 2025 14:32:46 -0500
In-Reply-To: <20251208095227.19720-2-benjamin.gaignard@collabora.com>
References: <20251208095227.19720-1-benjamin.gaignard@collabora.com>
	 <20251208095227.19720-2-benjamin.gaignard@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-CPOZjzucNTO3O4NhfpZO"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-CPOZjzucNTO3O4NhfpZO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 08 d=C3=A9cembre 2025 =C3=A0 10:52 +0100, Benjamin Gaignard a =C3=
=A9crit=C2=A0:
> If tx_mode field is non-zero then write it value + 2 else

it -> its



> write 0.


Please don't sent a an In-reply-to: email for a patch that isn't part of a
series.


>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
> ---
> =C2=A0drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c | 2=
 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_de=
c.c
> b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index f4f7cb45b1f1..fccdece51b1b 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -2005,7 +2005,7 @@ static void
> rockchip_vpu981_av1_dec_set_parameters(struct hantro_ctx *ctx)
> =C2=A0			 !!(ctrls->frame->flags &
> V4L2_AV1_FRAME_FLAG_ALLOW_HIGH_PRECISION_MV));
> =C2=A0	hantro_reg_write(vpu, &av1_comp_pred_mode,
> =C2=A0			 (ctrls->frame->flags &
> V4L2_AV1_FRAME_FLAG_REFERENCE_SELECT) ? 2 : 0);
> -	hantro_reg_write(vpu, &av1_transform_mode, (ctrls->frame->tx_mode =3D=
=3D
> 1) ? 3 : 4);
> +	hantro_reg_write(vpu, &av1_transform_mode, ctrls->frame->tx_mode ?
> ctrls->frame->tx_mode + 2 : 0);

That all seem very hacky. Let's step back, and use that as inspiration for =
a
useful commit message. From bitstream we have:

tx_mode:
  0 =3D=3D 4x4 only
  1 =3D=3D SELECT
  2 =3D=3D LARGEST

And the HW have:
  0 =3D=3D 4x4 only
  1 =3D=3D 8x8 and less
  2 =3D=3D 16x16 and less
  3 =3D=3D 32x32 and less
  4 =3D=3D Select

Since the two enums have no relation (except for value 0), I'd suggest to
translate this in a switch (with nice enums so its readable).

  0 -> 0
  1 -> 4
  2 -> 3

Would be good to check if we can refine with some other params to reach HW =
value
1 and 2, but otherwise, that mapping is sufficient. Tha hacky +2 is really
obscure to me and I'd rather not do that upstream.

Nicolas

> =C2=A0	hantro_reg_write(vpu, &av1_max_cb_size,
> =C2=A0			 (ctrls->sequence->flags
> =C2=A0			=C2=A0 & V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK) ?
> 7 : 6);

--=-CPOZjzucNTO3O4NhfpZO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTcn3gAKCRDZQZRRKWBy
9CVcAP0RNa8TlLEqo5wFP1mOMIarqad946RwYdDHHxPIaF4VnwEAyapE3XLOFmCq
KL9Eo6Ma/SAxyHXJb/r5OsFwAQDxGgo=
=+m1j
-----END PGP SIGNATURE-----

--=-CPOZjzucNTO3O4NhfpZO--

