Return-Path: <linux-media+bounces-48651-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB94CB7292
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 21:29:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BFE930341FA
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 20:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F127131D387;
	Thu, 11 Dec 2025 20:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="orSc8y5D"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4804D214A64;
	Thu, 11 Dec 2025 20:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765484972; cv=none; b=u7PZCWfhbPjWZb7fn5l7SPvRu3lKlziF3unx4si+q9UBENkB9JVQ44GIpewqxmj4CV8ryvyJ4SOPuXGpOSQDbtktAOT2tqcqabVjG5lEcJaOmAdGTKJyEIJsIK4C9yCNJRUexKXeZHlp3ZQAtMpx0xZr3Tm/VD3fe2Tt9hLvfFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765484972; c=relaxed/simple;
	bh=aorE+XGhS7LAYqgTc6esMCwmzPq1BKGq+EW0ds9kfxA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qUTmcgVpI5sxF0zjkY6A4tVVrDylpwu5G9uunuvoQME6zzzcLv1Q/0Z4KT+AVGMeueBfyIjpG7SnoGRPUQqgT67JnqGicQLuTcyFZrfu4KD/6HM0zRH0H2eIoSI+amXqs/wuDObtkq9HfdBXYJ46NGI4QC5snQgQaAIpC9AmD7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=orSc8y5D; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765484968;
	bh=aorE+XGhS7LAYqgTc6esMCwmzPq1BKGq+EW0ds9kfxA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=orSc8y5DvHwd5U64GaRcrlBH1D0Wi9fmU5WpWzqhi8dvI/wh1C9A20P6yzMt3PtVe
	 c7QhAZ2DC+yqdk92ctW8wo5PkNs4JMdkTRVcaTJy4cog/4OkJ5Fao4zNnzga8rJ74J
	 oGL0ApOTZYCYWsIggFFajo+1bUsbz+/S6NQ9a+1wHmSgqhZso1jHRarc8wQ5giTQ9F
	 Hpe2TEvzbQxW93O1METPRZqc9sp+c10hnwFOI/jQnym5pV/6mGcbOlbJT2OPSduXaR
	 AzYZjjOxastiJTVhd54txlYa/bgvL31ZpMDIJTvaZFG932AA3sWDdeRoxr/AXMwjsx
	 AvazI9KoopE7A==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0141617E110C;
	Thu, 11 Dec 2025 21:29:25 +0100 (CET)
Message-ID: <d9a58ddf9b90d8320562ec54f2bd74fa77f0bc67.camel@collabora.com>
Subject: Re: [PATCH v6 05/10] media: mediatek: vcodec: refactor setup dst
 buffer metadata interface for VP9 decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@xs4all.nl>,  Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann
 <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>,  George Sun
 <george.sun@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	 <andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Date: Thu, 11 Dec 2025 15:29:24 -0500
In-Reply-To: <20251202074038.3173-6-kyrie.wu@mediatek.com>
References: <20251202074038.3173-1-kyrie.wu@mediatek.com>
	 <20251202074038.3173-6-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-cnFYe8mYcyleE2PY2F67"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-cnFYe8mYcyleE2PY2F67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 15:40 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> Previously, calling vdec_vp9_slice_setup_single_from_src_to_dst
> with v4l2_m2m_next_src_buf to obtain both buffers resulted in -EINVAL,
> interrupting the decoding process. To resolve this,
> the interface should be updated to set both src and dst buffers
> for metadata configuration.

I'm haven't figure-out why this happens, perhaps you can add more details ?

>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0.../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 21 ++++++++++------=
---
> =C2=A01 file changed, 11 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> index fa0f406f7726..9513ddde7c7c 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> @@ -696,21 +696,22 @@ static int vdec_vp9_slice_tile_offset(int idx, int =
mi_num, int tile_log2)
> =C2=A0	return min(offset, mi_num);
> =C2=A0}
> =C2=A0
> -static
> -int vdec_vp9_slice_setup_single_from_src_to_dst(struct vdec_vp9_slice_in=
stance *instance)
> +static int vdec_vp9_slice_setup_single_from_src_to_dst(struct vdec_vp9_s=
lice_instance *instance,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mtk_vcodec_mem *bs,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vdec_fb *fb)
> =C2=A0{
> -	struct vb2_v4l2_buffer *src;
> -	struct vb2_v4l2_buffer *dst;
> +	struct mtk_video_dec_buf *src_buf_info;
> +	struct mtk_video_dec_buf *dst_buf_info;
> =C2=A0
> -	src =3D v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);

My concern is that vdec_vp9_slice_setup_lat_from_src_buf() also depends on =
the
tip of the OUTPUT queue, why it this problem with limited to single core ?

Can you apply the manual completion fixes, and check if the problem still
appear? Is that something you reproduce every time ? Perhaps it should be k=
ept
out of this serie ?


> -	if (!src)
> +	src_buf_info =3D container_of(bs, struct mtk_video_dec_buf, bs_buffer);
> +	if (!src_buf_info)
> =C2=A0		return -EINVAL;

Its a bit of a concern in term of memory lifetime / possible use after free=
.
Who's holding on the buffer if its not in the queue ?

Nicolas

> =C2=A0
> -	dst =3D v4l2_m2m_next_dst_buf(instance->ctx->m2m_ctx);
> -	if (!dst)
> +	dst_buf_info =3D container_of(fb, struct mtk_video_dec_buf, frame_buffe=
r);
> +	if (!dst_buf_info)
> =C2=A0		return -EINVAL;
> =C2=A0
> -	v4l2_m2m_buf_copy_metadata(src, dst, true);
> +	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &dst_buf_info->m2=
m_buf.vb, true);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -1800,7 +1801,7 @@ static int vdec_vp9_slice_setup_single(struct vdec_=
vp9_slice_instance *instance,
> =C2=A0	struct vdec_vp9_slice_vsi *vsi =3D &pfc->vsi;
> =C2=A0	int ret;
> =C2=A0
> -	ret =3D vdec_vp9_slice_setup_single_from_src_to_dst(instance);
> +	ret =3D vdec_vp9_slice_setup_single_from_src_to_dst(instance, bs, fb);
> =C2=A0	if (ret)
> =C2=A0		goto err;
> =C2=A0

--=-cnFYe8mYcyleE2PY2F67
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTsppAAKCRDZQZRRKWBy
9CXrAP9alOmG1EIcOp/r0v4e3t44wyRrJES2KQ9RbQQML4UAAgEA28h4QzuqkSxR
pWAsLr/SYdJQup7lL5McJSFqipmIAg8=
=YXEp
-----END PGP SIGNATURE-----

--=-cnFYe8mYcyleE2PY2F67--

