Return-Path: <linux-media+bounces-47890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 86505C931C2
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 21:23:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 215F334A660
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 20:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39082D8364;
	Fri, 28 Nov 2025 20:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XWFTTvxl"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425832DAFAE;
	Fri, 28 Nov 2025 20:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764361412; cv=none; b=uWq9z95tNxpbmenAw0iOM5l34rsDXL7/AW+6ZgAmHREyXBA3sKZf1+Ac8+fYQ7Ra1vJcyEgvcHMPtT0dGJQghAfdzexpRalEvjqxYObmTPWika7QGwiFCRIAK2pAV3Pz8YxDWJcSPKFxHx2dg/OmDhvVbZfKZOAeVL0NmYBTJJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764361412; c=relaxed/simple;
	bh=XJFEeAcYkbHeAupeg6YwlekAolMQyr/YFtIhbGalPTM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HvmS7Xn1UushB4QzfzbrHscgc1q+uupED9JzxYhd8Ywh8y1xXwvTDkXkZ61a+6BVWLL9hiGV+MBTee0SgJrQyJH/qvpVhKOAIgid33tgrMe+LFHSCGkiOaQu1fFCHuySF+lGtBMl9FHu+MsFP40o3SFi17xi2+q7ELu53QEw1F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XWFTTvxl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764361407;
	bh=XJFEeAcYkbHeAupeg6YwlekAolMQyr/YFtIhbGalPTM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=XWFTTvxlv2i6lZ0sLUEjPwNwpOyYPKjAuzzJdUDTbnFt8Bkr/X1LnK40QPZQjs67B
	 HuvuCVHndlNHRviOvadXLWKUoalMcZqClncZbQ7T873j5UD22ybrtC9BNl+k2oOIdf
	 6nKDh1PFfifsicj4hflks4FFbuoznKcmU4b8BaYhD66lYR5LQS7f/1SkfB9IJiWbBb
	 wZ548dUuK5mBKsF/AsZXFmUWTBK9FCSk2kGsFDzayJfRyM3Zeth1NkB2H6Zh4Yyl36
	 CAG3XetKzii2R3srVcmtcKne44dZLk4PQMdxrXXGn2zYXDrHt++PjtLvsw7LDhMC5w
	 8WydRGa0Z6DxQ==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 191F417E013C;
	Fri, 28 Nov 2025 21:23:25 +0100 (CET)
Message-ID: <6fe8418e5562eb2e219ea4b947852d22b9cdc481.camel@collabora.com>
Subject: Re: [PATCH v2 13/14] media: mediatek: decoder: fill av1 buffer size
 with picinfo
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, =?ISO-8859-1?Q?N=EDcolas?= "F .
 R . A . Prado" <nfraprado@collabora.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Hans Verkuil	 <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard	 <benjamin.gaignard@collabora.com>, Nathan Hebert
 <nhebert@chromium.org>,  Daniel Almeida <daniel.almeida@collabora.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>,  Daniel Vetter <daniel@ffwll.ch>, Steve Cho
 <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Fri, 28 Nov 2025 15:23:24 -0500
In-Reply-To: <20250815085232.30240-14-yunfei.dong@mediatek.com>
References: <20250815085232.30240-1-yunfei.dong@mediatek.com>
	 <20250815085232.30240-14-yunfei.dong@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-jq23MyO5l+dp4E8UdL5t"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-jq23MyO5l+dp4E8UdL5t
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 15 ao=C3=BBt 2025 =C3=A0 16:52 +0800, Yunfei Dong a =C3=A9crit=
=C2=A0:
> The buffer size of y and c plane has been calculated in vcp/scp,
> can fill each frame buffer size with picinfo directly.
>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../vcodec/decoder/vdec/vdec_av1_req_lat_if.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 14 ++++++++------
> =C2=A01 file changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if=
.c
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if=
.c
> index 2b2173062cb0..6070485e26c4 100644
> ---
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if=
.c
> +++
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if=
.c
> @@ -1799,18 +1799,19 @@ static int vdec_av1_slice_setup_core_buffer(struc=
t
> vdec_av1_slice_instance *inst
> =C2=A0{
> =C2=A0	struct vb2_buffer *vb;
> =C2=A0	struct vb2_queue *vq;
> -	int w, h, plane, size;
> +	int plane;
> =C2=A0	int i;
> =C2=A0
> =C2=A0	plane =3D instance->ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes;
> -	w =3D vsi->frame.uh.upscaled_width;
> -	h =3D vsi->frame.uh.frame_height;
> -	size =3D ALIGN(w, VCODEC_DEC_ALIGNED_64) * ALIGN(h,
> VCODEC_DEC_ALIGNED_64);
> =C2=A0
> =C2=A0	/* frame buffer */
> =C2=A0	vsi->fb.y.dma_addr =3D fb->base_y.dma_addr;
> +
> +	vsi->fb.y.size =3D instance->ctx->picinfo.fb_sz[0];
> +	vsi->fb.c.size =3D instance->ctx->picinfo.fb_sz[1];
> +
> =C2=A0	if (plane =3D=3D 1)
> -		vsi->fb.c.dma_addr =3D fb->base_y.dma_addr + size;
> +		vsi->fb.c.dma_addr =3D fb->base_y.dma_addr + vsi->fb.y.size;
> =C2=A0	else
> =C2=A0		vsi->fb.c.dma_addr =3D fb->base_c.dma_addr;
> =C2=A0
> @@ -1835,8 +1836,9 @@ static int vdec_av1_slice_setup_core_buffer(struct
> vdec_av1_slice_instance *inst
> =C2=A0		}
> =C2=A0
> =C2=A0		vref->y.dma_addr =3D vb2_dma_contig_plane_dma_addr(vb, 0);
> +		vref->y.size =3D vsi->fb.y.size;
> =C2=A0		if (plane =3D=3D 1)
> -			vref->c.dma_addr =3D vref->y.dma_addr + size;
> +			vref->c.dma_addr =3D vref->y.dma_addr + vsi->fb.y.size;
> =C2=A0		else
> =C2=A0			vref->c.dma_addr =3D vb2_dma_contig_plane_dma_addr(vb,
> 1);
> =C2=A0	}

--=-jq23MyO5l+dp4E8UdL5t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSoEvAAKCRDZQZRRKWBy
9GuuAQCZsZGMIGEpnWOdWkwDk/nHwttXhch4amNlzJL75tTYyQD+Jri3FTLjVfVv
2WqNGikSolhLrKIKQ1Rn4qoHLdryiwM=
=5uHg
-----END PGP SIGNATURE-----

--=-jq23MyO5l+dp4E8UdL5t--

