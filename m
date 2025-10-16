Return-Path: <linux-media+bounces-44751-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8398BE42D9
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 17:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2740919A045B
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 15:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69CDF3469F8;
	Thu, 16 Oct 2025 15:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eyMzW4rQ"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9F44C9D;
	Thu, 16 Oct 2025 15:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760627966; cv=none; b=h52LeK5v58PGthjz9SEvYI7YiTkhGdvoFqKgr+ZwCqQIenip0WqdCFNJ0GMxoNikkReE1bN+EUMc4Idmf4HgyLHq2FV8AkC3Tra6lvTf1p63Qr0UHr7l+7BRbdloBAu7YQ4uXGmvOvi34orQ5+gSD2UnAqUt3ojTKHdDEbQeqB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760627966; c=relaxed/simple;
	bh=ati0KgDtCv8PEJWIbHhO/9CBCvu0ooHMQ92xaU79xmk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f9+xFlAfKZSP7ZMMm+EFlePaf5vNYoUqYvcvzOA/IoUsP1S/D9aO/ttNoS9wWy9OACzdE8PnJtMTypBRM2jDPoW+PXaIvqEwrL+BRNFPDnDjuFoDTbzo9TIk+gYtZS3jQnFmXmuSKUdRK+YUg9vLG75MrO5DyR9Qjqg7WnGSnAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eyMzW4rQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760627962;
	bh=ati0KgDtCv8PEJWIbHhO/9CBCvu0ooHMQ92xaU79xmk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=eyMzW4rQLHVjAGqM0OkLEpY4VZFJWE3w9WApY6ZgKLoh+Q4yWD3UmKac5seip3q1G
	 ZznepgwbmLiplpUFmhtGssykMO6LT53ekQB58MjzKaDZ0+IoIeU776UGgs+9iQ29lu
	 rUDv5twJb29FF6pHWrGk+3H7VjxQ0PvD3OSbixH+vFLJniw72c5zLA24KKmVxGHtJv
	 enz5u8ruG5zNpukj3DiwESj7b8UyWo/ot72UKR+f2svZEyWVU4/Nk9JzKsW5syUEnA
	 rndPCpt6jorI5VXDLNZNIiyfv51L6idtB7ZudXXxUwtYiRImf5HIQvrnfWA/SZtrMY
	 30i/81QAhXWzg==
Received: from [IPv6:2606:6d00:17:ebd3::5ac] (unknown [IPv6:2606:6d00:17:ebd3::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E50C517E10C8;
	Thu, 16 Oct 2025 17:19:19 +0200 (CEST)
Message-ID: <f5956178a0e5d91dabc12e89f666eac2140f141e.camel@collabora.com>
Subject: Re: [PATCH v4 4/8] media: mediatek: vcodec: Add core-only VP9
 decoding support for MT8189
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@xs4all.nl>,  Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sebastian Fricke <sebastian.fricke@collabora.com>, Nathan Hebert	
 <nhebert@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Irui Wang	
 <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	 <andrzejtp2010@gmail.com>
Date: Thu, 16 Oct 2025 11:19:18 -0400
In-Reply-To: <20251016060747.20648-5-kyrie.wu@mediatek.com>
References: <20251016060747.20648-1-kyrie.wu@mediatek.com>
	 <20251016060747.20648-5-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-Rz6sMYc0nh24Zfb5X2O5"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-Rz6sMYc0nh24Zfb5X2O5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 16 octobre 2025 =C3=A0 14:07 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> Implemented core-only VP9 decoding functions for MT8189.

What does "core-only" means ? Did you mean single core ?

>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0.../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 27 +++++++++++-----=
---
> =C2=A01 file changed, 16 insertions(+), 11 deletions(-)
>=20
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> index fa0f406f7726..04197164fb82 100644
> ---
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> +++
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> @@ -23,6 +23,7 @@
> =C2=A0
> =C2=A0#define VP9_TILE_BUF_SIZE 4096
> =C2=A0#define VP9_PROB_BUF_SIZE 2560
> +#define VP9_PROB_BUF_4K_SIZE 3840
> =C2=A0#define VP9_COUNTS_BUF_SIZE 16384
> =C2=A0
> =C2=A0#define HDR_FLAG(x) (!!((hdr)->flags & V4L2_VP9_FRAME_FLAG_##x))
> @@ -616,7 +617,10 @@ static int vdec_vp9_slice_alloc_working_buffer(struc=
t
> vdec_vp9_slice_instance *i
> =C2=A0	}
> =C2=A0
> =C2=A0	if (!instance->prob.va) {
> -		instance->prob.size =3D VP9_PROB_BUF_SIZE;
> +		instance->prob.size =3D ((ctx->dev->chip_name =3D=3D
> MTK_VDEC_MT8196) ||
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (ctx->dev->chip_name =3D=3D
> MTK_VDEC_MT8189)) ?
> +					VP9_PROB_BUF_4K_SIZE :
> VP9_PROB_BUF_SIZE;

I feel like this will keep growing, then you'll move to 8K and it will cont=
inue.
You already match every SoC in the driver, you should come up with SoC
configuration data structure so you don't have to add doc check conditions =
all
over the place. This change is also not reflected in the commit message.

> +
> =C2=A0		if (mtk_vcodec_mem_alloc(ctx, &instance->prob))
> =C2=A0			goto err;
> =C2=A0	}
> @@ -696,21 +700,22 @@ static int vdec_vp9_slice_tile_offset(int idx, int
> mi_num, int tile_log2)
> =C2=A0	return min(offset, mi_num);
> =C2=A0}
> =C2=A0
> -static
> -int vdec_vp9_slice_setup_single_from_src_to_dst(struct
> vdec_vp9_slice_instance *instance)
> +static int vdec_vp9_slice_setup_single_from_src_to_dst(struct
> vdec_vp9_slice_instance *instance,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mtk_vcodec_mem
> *bs,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vdec_fb *fb)
> =C2=A0{
> -	struct vb2_v4l2_buffer *src;
> -	struct vb2_v4l2_buffer *dst;
> +	struct mtk_video_dec_buf *src_buf_info;
> +	struct mtk_video_dec_buf *dst_buf_info;
> =C2=A0
> -	src =3D v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
> -	if (!src)
> +	src_buf_info =3D container_of(bs, struct mtk_video_dec_buf, bs_buffer);
> +	if (!src_buf_info)
> =C2=A0		return -EINVAL;
> =C2=A0
> -	dst =3D v4l2_m2m_next_dst_buf(instance->ctx->m2m_ctx);
> -	if (!dst)
> +	dst_buf_info =3D container_of(fb, struct mtk_video_dec_buf,
> frame_buffer);
> +	if (!dst_buf_info)
> =C2=A0		return -EINVAL;
> =C2=A0
> -	v4l2_m2m_buf_copy_metadata(src, dst, true);
> +	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &dst_buf_info-
> >m2m_buf.vb, true);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -1800,7 +1805,7 @@ static int vdec_vp9_slice_setup_single(struct
> vdec_vp9_slice_instance *instance,
> =C2=A0	struct vdec_vp9_slice_vsi *vsi =3D &pfc->vsi;
> =C2=A0	int ret;
> =C2=A0
> -	ret =3D vdec_vp9_slice_setup_single_from_src_to_dst(instance);
> +	ret =3D vdec_vp9_slice_setup_single_from_src_to_dst(instance, bs, fb);

This entire change is not explained in the commit message at all. Explain w=
hy
this is needed, what difference it makes. There is no clear indication we a=
re in
an MT8189 code path, so this change could have a incidence on all single co=
re
SoC (if any).

Nicolas

> =C2=A0	if (ret)
> =C2=A0		goto err;
> =C2=A0

--=-Rz6sMYc0nh24Zfb5X2O5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaPEM9gAKCRDZQZRRKWBy
9AB+AQCgeocVLaEndCMfX388SHPaflaLqJbYBY0d0ZHr7NpAOAEA7g9JD1WWMOrd
Z+Pd5ov2tTNoe3q+1HvqeNDXlNyUOQs=
=+EQ2
-----END PGP SIGNATURE-----

--=-Rz6sMYc0nh24Zfb5X2O5--

