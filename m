Return-Path: <linux-media+bounces-48439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9FDCAE1DC
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 20:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82760302176D
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 19:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A29027F005;
	Mon,  8 Dec 2025 19:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="P8+erOnT"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193242E5437;
	Mon,  8 Dec 2025 19:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765223110; cv=none; b=Pa3IH9NJLdeVsTZWM2CQxE89tGeEnwomqk+jGaIOdNdLREfznB9eEhRga04v0Imyb/UkdQSsLTlyzMlGHg70YxGnPX6OX0qsfk/pXUhkjs0gmw/aHi+YtgG3G7NqRnS76teBx+xoYsONkWI3sxzlYKXWwk9oaK/cn44McT3IyNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765223110; c=relaxed/simple;
	bh=L2dBgg6dJCDDUuZT2kYorlZ02Sm9yxKoUY6fnAroN5U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tSpsK/rpFGenfpPsqAGiyiMRfjQFu13qa5KSRSHzxMjfCdgenynfDtrJTh5TfhZDWfHvCmLoEzd0R0oRvSTvXxwlnys7y7xgI5l0cA9hiIWxt5y4LDgQEg5CMrX88OTJu2MYa5r98LtXSUqCbQ2HhrLZ7uc71H9v8UpqGgIK8tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=P8+erOnT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765223106;
	bh=L2dBgg6dJCDDUuZT2kYorlZ02Sm9yxKoUY6fnAroN5U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=P8+erOnT63XjOq/fKJgUKRW2DYiHThMh33+RMHxkAvxW4MUrM2wYH8s5JkIX4fsE8
	 UZZBCD/DIReeqaG1C7Q24e6hEfYWfMeHbu1RlZ/ly7xFXDyR2l+SQNFDYXQooh0hYu
	 EVvY7sXAPf4VpXDnLe5hOZP+GnXy68tixssORNwJ2ZBMterYNnTKx4ohWVapTl0QDx
	 mbbK754PUsRkImPLtmXFh1nJKUdeBquIoFqlrwvRaJiCuqVCcH1+7JKtR20C++bsif
	 4eoaaWFtgEKfshJDKAajZLFJcnMyFz5CDs1bUEkSU/Ib8xcRktOXluheYAG2HefmEr
	 e4MZhE1rA0wTQ==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2F54817E0E30;
	Mon,  8 Dec 2025 20:45:04 +0100 (CET)
Message-ID: <4545bc3df2592965388aee3f170cce577d8cf538.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicon: AV1: Fix enable cdef computation
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de,
 hverkuil@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com, amazingfate <liujianfeng1994@gmail.com>
Date: Mon, 08 Dec 2025 14:45:02 -0500
In-Reply-To: <20251208095227.19720-1-benjamin.gaignard@collabora.com>
References: <20251208095227.19720-1-benjamin.gaignard@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-CybO3avH1GlETVvMet9Z"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-CybO3avH1GlETVvMet9Z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 08 d=C3=A9cembre 2025 =C3=A0 10:52 +0100, Benjamin Gaignard a =C3=
=A9crit=C2=A0:
> Testing V4L2_AV1_SEQUENCE_FLAG_ENABLE_CDEF flag isn't enough
> to know if cdef bit has to be set.
> If any of the used cdef fields isn't zero then we must enable
> cdef feature on the hardware.

I think the problem goes the other way around.

   If all the fields of the CDEF parameters are zero (which is the default)=
, then
   av1_enable_cdef register needs to be unset (despite the
   V4L2_AV1_SEQUENCE_FLAG_ENABLE_CDEF possibly being set).

Its interesting to note that the other AV1 decoder also ignores this flag.
Though, I don't have enough data to add something to the doc to try and con=
vince
future driver writers to not use it.

>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")

This is missing:

Reported-by: Jianfeng Liu <liujianfeng1994@gmail.com>
Link: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4786

Please also include my Rb in v2 with correct commit message.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Nicolas

> ---
> =C2=A0.../platform/verisilicon/rockchip_vpu981_hw_av1_dec.c=C2=A0 | 10 ++=
++++++--
> =C2=A01 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_de=
c.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index e4703bb6be7c..f4f7cb45b1f1 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -1396,8 +1396,16 @@ static void rockchip_vpu981_av1_dec_set_cdef(struc=
t hantro_ctx *ctx)
> =C2=A0	u16 luma_sec_strength =3D 0;
> =C2=A0	u32 chroma_pri_strength =3D 0;
> =C2=A0	u16 chroma_sec_strength =3D 0;
> +	bool enable_cdef;
> =C2=A0	int i;
> =C2=A0
> +	enable_cdef =3D !(cdef->bits =3D=3D 0 &&
> +			cdef->damping_minus_3 =3D=3D 0 &&
> +			cdef->y_pri_strength[0] =3D=3D 0 &&
> +			cdef->y_sec_strength[0] =3D=3D 0 &&
> +			cdef->uv_pri_strength[0] =3D=3D 0 &&
> +			cdef->uv_sec_strength[0] =3D=3D 0);
> +	hantro_reg_write(vpu, &av1_enable_cdef, enable_cdef);
> =C2=A0	hantro_reg_write(vpu, &av1_cdef_bits, cdef->bits);
> =C2=A0	hantro_reg_write(vpu, &av1_cdef_damping, cdef->damping_minus_3);
> =C2=A0
> @@ -1953,8 +1961,6 @@ static void rockchip_vpu981_av1_dec_set_parameters(=
struct hantro_ctx *ctx)
> =C2=A0			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_SHOW_FRAME));
> =C2=A0	hantro_reg_write(vpu, &av1_switchable_motion_mode,
> =C2=A0			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_IS_MOTION_MODE_SWI=
TCHABLE));
> -	hantro_reg_write(vpu, &av1_enable_cdef,
> -			 !!(ctrls->sequence->flags & V4L2_AV1_SEQUENCE_FLAG_ENABLE_CDEF));
> =C2=A0	hantro_reg_write(vpu, &av1_allow_masked_compound,
> =C2=A0			 !!(ctrls->sequence->flags
> =C2=A0			=C2=A0=C2=A0=C2=A0 & V4L2_AV1_SEQUENCE_FLAG_ENABLE_MASKED_COMPOU=
ND));

--=-CybO3avH1GlETVvMet9Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTcqvgAKCRDZQZRRKWBy
9Fw5AP92k7QgfKSlxgl6L6eRxBXYU6QZgMFyDbQPvvbAgb1rDAD+J+m7WUxbqCaM
mvebRnyiQRPjZgOBMwr76Ftkov64/Ag=
=H8+3
-----END PGP SIGNATURE-----

--=-CybO3avH1GlETVvMet9Z--

