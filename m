Return-Path: <linux-media+bounces-47877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 826C7C9307D
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 20:34:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 68B814E40E5
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 19:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932A4332EAC;
	Fri, 28 Nov 2025 19:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gbAtKdot"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7AB244671;
	Fri, 28 Nov 2025 19:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764358464; cv=none; b=t4t2AL4GfY+uleLAiJLm9UONxrxn6s1yJYm2SUbZY72heJ55jmsiveGjLTjTxBi/ws6JxSMcIEHwAjcBWG0X55L/OpdzYSvcPRABlBk4TMp3e4Mp+52kex8QEHacaSg0rO9bv3CwG/gHTZks95H7U8sILhMMNVfqTp7gyK1hdvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764358464; c=relaxed/simple;
	bh=Yhe1DDond4S8P8IlENCBXoPbGHM6ErCN8GAHfZ5J2yY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BSW4GGsdN35SZF4KPbZcr7aVcKJI4Ay68ONDQypDOF2T6VPtOjZs+EGWSca/k152rJRQcCXsoGPtq36fWpltwQYlOOs80yvaFhHt+JzFkqMmAPnLPmLs6FtZy9Yv1walJJfmN2NHLjr97XFsdmnXe4bzWpuhtg6SOQJYCfVz1vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gbAtKdot; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764358459;
	bh=Yhe1DDond4S8P8IlENCBXoPbGHM6ErCN8GAHfZ5J2yY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gbAtKdot4AoliteXaFQ9DjrBD/TvuNnXF4j0MmlhOhj64136GH8+cqzPpGl/taWqM
	 BSk11bIMYBEIYNf8zwsCoUqBdeId8gqdVEGcH7AolIAq+hchQ57bqNWuXRxQjJGWyp
	 awbgh0aODJ6GJHK5+GPgSQ9roG/h7s1x6/A1RedozfLqT46L9+8Mxn/57VvugoQfv7
	 w/o6QlBiQRmRRYLRO/GnZ3ypDgOxfoXdfkiMXCyS4pi4tvCxiHXywgeTxP3dd1d7GY
	 1wu1I5+M7ed4s4F36YcxJlDFqgT7+B+kPwKIMexvZVtMET45pdbHQaB6n/47l0vNm1
	 S0UVkXrJWnlAA==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BA02417E10F6;
	Fri, 28 Nov 2025 20:34:16 +0100 (CET)
Message-ID: <8f9cd96ccd5de050e43a4c64b6a7937ed86413ea.camel@collabora.com>
Subject: Re: [PATCH v2 02/14] media: mediatek: vcodec: add decoder
 compatible to support mt8196
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
Date: Fri, 28 Nov 2025 14:34:15 -0500
In-Reply-To: <20250815085232.30240-3-yunfei.dong@mediatek.com>
References: <20250815085232.30240-1-yunfei.dong@mediatek.com>
	 <20250815085232.30240-3-yunfei.dong@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-69FgDND25HA5QoZ6f/KT"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-69FgDND25HA5QoZ6f/KT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 15 ao=C3=BBt 2025 =C3=A0 16:52 +0800, Yunfei Dong a =C3=A9crit=
=C2=A0:
> MT8196 is lat single core architecture. Support its compatible and
> use `mtk_lat_sig_core_pdata` to initialize platform data.
>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> =C2=A0.../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c=C2=A0=C2=
=A0 | 6 ++++++
> =C2=A0.../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h=C2=A0=C2=
=A0 | 1 +
> =C2=A02 files changed, 7 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.c
> index 9247d92d431d..fa609343c168 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -346,6 +346,8 @@ static void mtk_vcodec_dec_get_chip_name(struct mtk_v=
codec_dec_dev *vdec_dev)
> =C2=A0		vdec_dev->chip_name =3D MTK_VDEC_MT8186;
> =C2=A0	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8188-vc=
odec-dec"))
> =C2=A0		vdec_dev->chip_name =3D MTK_VDEC_MT8188;
> +	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8196-vcodec-=
dec"))
> +		vdec_dev->chip_name =3D MTK_VDEC_MT8196;

I'm pretty sure some other series is moving this into the match data. I don=
't
care who do that first, but I'd like to see that fixed.

Nicolas

> =C2=A0	else
> =C2=A0		vdec_dev->chip_name =3D MTK_VDEC_INVAL;
> =C2=A0}
> @@ -559,6 +561,10 @@ static const struct of_device_id mtk_vcodec_match[] =
=3D {
> =C2=A0		.compatible =3D "mediatek,mt8188-vcodec-dec",
> =C2=A0		.data =3D &mtk_lat_sig_core_pdata,
> =C2=A0	},
> +	{
> +		.compatible =3D "mediatek,mt8196-vcodec-dec",
> +		.data =3D &mtk_lat_sig_core_pdata,
> +	},
> =C2=A0	{},
> =C2=A0};
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.h
> index aececca7ecf8..6bdde600a167 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -27,6 +27,7 @@ enum mtk_vcodec_dec_chip_name {
> =C2=A0	MTK_VDEC_MT8188 =3D 8188,
> =C2=A0	MTK_VDEC_MT8192 =3D 8192,
> =C2=A0	MTK_VDEC_MT8195 =3D 8195,
> +	MTK_VDEC_MT8196 =3D 8196,
> =C2=A0};
> =C2=A0
> =C2=A0/*

--=-69FgDND25HA5QoZ6f/KT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSn5NwAKCRDZQZRRKWBy
9LF3AP9+KNgp4W2BFMNJfo+xfzd957a4H3g9z0q/QcSfIOx6zQD8DKdO+YDnTLrL
CYMTZ6/o8lg7ThOhMYxvsTSFV49T/A0=
=hetT
-----END PGP SIGNATURE-----

--=-69FgDND25HA5QoZ6f/KT--

