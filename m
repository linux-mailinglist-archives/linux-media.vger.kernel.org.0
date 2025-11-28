Return-Path: <linux-media+bounces-47888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2622C931A1
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 21:20:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88A723A8996
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 20:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256C22DAFB8;
	Fri, 28 Nov 2025 20:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RGhYv+wY"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2FE11713;
	Fri, 28 Nov 2025 20:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764361237; cv=none; b=sQgqq15K2jglfkGOMkU0A5gw02PYu6Zw3a9z1RSLe9XtHaBOMj1tE860CkC3JE0+/4wfUDuVJjKcqBpShUyvquFc5g6/Db5Dw2L4l6/AnzqgAxOzmJkeQbV3Em4wIzkZ7nEAmqbjS3zqmdcxsms/ztnZ5NOwQ/UsN4lGx7HEwZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764361237; c=relaxed/simple;
	bh=EGRRPK5ChhZ6UOVAU/NNKnsQdzi6sHOvH1O8qX4aSzw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AryWyymPJUbQhasvLugAekbEEieEJBK93ZigoDSTymFtoDR7kdWCW55wambcIHAqIvILJuF3C0v70dOEWIqcIqfZblJFTh60vUWAYLj+5CTh1lCPccd9+hmM0N3sWnzAkf6Wx86g4LFXPdzjiz+qce6cHNFOU7QozMUy/yNBAaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RGhYv+wY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764361233;
	bh=EGRRPK5ChhZ6UOVAU/NNKnsQdzi6sHOvH1O8qX4aSzw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=RGhYv+wYBDp8sARUUdx80orGwEEo4dLwuwoaDItwmq7oW25X8u/wntQ2ZiFxoDaZn
	 LJWw2zi9SoHTIYs/lrtm6PUtuUsvJGVYIx0QDOI7tqcqzVNKoc61avmvJZhpo3s87W
	 60GWKMsuGodhW13Qkls2oxrdLTnflmhJ75/uHFwyZp9SvlVjUcxqXeNbbHPiHLYMWh
	 3g7GUYbZt0JCz4/Bs+5sWmF/ZFkREhw0Gu7iuhbYRtAzVvZ5+Hxv65nLXFlidUua7X
	 CgWWxDJ7fhaTX12148W5ogz5IjfK6Nbv4Kii/2ox1DNkt2Hz3nZewGsWXxF4raGlZ9
	 pg2ZDUZjcjYdg==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DD81C17E10F2;
	Fri, 28 Nov 2025 21:20:31 +0100 (CET)
Message-ID: <a08a1f352ded0453f1cf94756e497bf5c8efb9ed.camel@collabora.com>
Subject: Re: [PATCH v2 11/14] media: mediatek: vcodec: add debug information
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
Date: Fri, 28 Nov 2025 15:20:31 -0500
In-Reply-To: <20250815085232.30240-12-yunfei.dong@mediatek.com>
References: <20250815085232.30240-1-yunfei.dong@mediatek.com>
	 <20250815085232.30240-12-yunfei.dong@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-qMRUpiDxjzjPbEExtovR"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-qMRUpiDxjzjPbEExtovR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 15 ao=C3=BBt 2025 =C3=A0 16:52 +0800, Yunfei Dong a =C3=A9crit=
=C2=A0:
> Print hevc/av1 output format and 10bit capture format
> information to debug.
>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../mediatek/vcodec/common/mtk_vcodec_dbgfs.c | 21 ++++++++++++++++=
+--
> =C2=A01 file changed, 19 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbg=
fs.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> index 5ad3797836db..79ccbe13735a 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> @@ -29,6 +29,14 @@ static void mtk_vdec_dbgfs_get_format_type(struct mtk_=
vcodec_dec_ctx *ctx, char
> =C2=A0		curr_len =3D snprintf(buf + *used, total - *used,
> =C2=A0				=C2=A0=C2=A0=C2=A0 "\toutput format: vp9 slice\n");
> =C2=A0		break;
> +	case V4L2_PIX_FMT_HEVC_SLICE:
> +		curr_len =3D snprintf(buf + *used, total - *used,
> +				=C2=A0=C2=A0=C2=A0 "\toutput format: hevc slice\n");
> +		break;
> +	case V4L2_PIX_FMT_AV1_FRAME:
> +		curr_len =3D snprintf(buf + *used, total - *used,
> +				=C2=A0=C2=A0=C2=A0 "\toutput format: av1 slice\n");
> +		break;
> =C2=A0	default:
> =C2=A0		curr_len =3D snprintf(buf + *used, total - *used,
> =C2=A0				=C2=A0=C2=A0=C2=A0 "\tunsupported output format: 0x%x\n",
> @@ -45,6 +53,14 @@ static void mtk_vdec_dbgfs_get_format_type(struct mtk_=
vcodec_dec_ctx *ctx, char
> =C2=A0		curr_len =3D snprintf(buf + *used, total - *used,
> =C2=A0				=C2=A0=C2=A0=C2=A0 "\tcapture format: MT21C\n");
> =C2=A0		break;
> +	case V4L2_PIX_FMT_MT2110T:
> +		curr_len =3D snprintf(buf + *used, total - *used,
> +				=C2=A0=C2=A0=C2=A0 "\tcapture format: MT2110T (10bit tile mode)\n");
> +		break;
> +	case V4L2_PIX_FMT_MT2110R:
> +		curr_len =3D snprintf(buf + *used, total - *used,
> +				=C2=A0=C2=A0=C2=A0 "\tcapture format: MT2110T (10bit raster mode)\n"=
);
> +		break;
> =C2=A0	default:
> =C2=A0		curr_len =3D snprintf(buf + *used, total - *used,
> =C2=A0				=C2=A0=C2=A0=C2=A0 "\tunsupported capture format: 0x%x\n",
> @@ -122,9 +138,10 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *filp=
, char __user *ubuf,
> =C2=A0
> =C2=A0		if (dbgfs_index[MTK_VDEC_DBGFS_PICINFO]) {
> =C2=A0			curr_len =3D snprintf(buf + used_len, total_len - used_len,
> -					=C2=A0=C2=A0=C2=A0 "\treal(%dx%d)=3D>align(%dx%d)\n",
> +					=C2=A0=C2=A0=C2=A0 "\treal(%dx%d)=3D>align(%dx%d) 10bit(%d)\n",
> =C2=A0					=C2=A0=C2=A0=C2=A0 ctx->picinfo.pic_w, ctx->picinfo.pic_h,
> -					=C2=A0=C2=A0=C2=A0 ctx->picinfo.buf_w, ctx->picinfo.buf_h);
> +					=C2=A0=C2=A0=C2=A0 ctx->picinfo.buf_w, ctx->picinfo.buf_h,
> +					=C2=A0=C2=A0=C2=A0 ctx->is_10bit_bitstream);
> =C2=A0			used_len +=3D curr_len;
> =C2=A0		}
> =C2=A0

--=-qMRUpiDxjzjPbEExtovR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSoEDwAKCRDZQZRRKWBy
9BXYAQDbnDHra1tyk/aTmYyV5oQuRDa36Wz32b2Il7KwTz2xhAD/c5rOFl8xF3gl
Dek+4kE/1lezd3tQ4jk5dJ+dAnv0rAE=
=V52H
-----END PGP SIGNATURE-----

--=-qMRUpiDxjzjPbEExtovR--

