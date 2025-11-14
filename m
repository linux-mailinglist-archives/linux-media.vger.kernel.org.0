Return-Path: <linux-media+bounces-47153-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C84DC5F680
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 22:43:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5440B3B2A83
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 21:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C7035C1A0;
	Fri, 14 Nov 2025 21:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="arbSYLwS"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D216D35C185;
	Fri, 14 Nov 2025 21:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763156463; cv=none; b=bkddMFfOZ+8Uyk3X2+D0CIPajTkKWmM4/neNlG0L+vpsWrGtcoM49NIBc4wxyiTvOY2j34CIp7XsIRB+ioTvHWS4oTjOUhmZn0wLu6wg/oWR3Wo4oYobfJLFUbxlf8j/msMUe+W3J7bgAvv0U/iFP+JlSyC+Zki98Es5oiY+QnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763156463; c=relaxed/simple;
	bh=M3gF+t8IsgI6PSTZgp2iLX1qTLe8b068JiSeWW4M8FE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JsFIr3ZNlnnvv6UipyHDLSXcyXU3SqOqupt6dtTZwobDCIyezo9JRHOCaiSOBDhXCdyiwdneHtbri9QJ2R9qtJ5mhRgr/KpkrsJl8T2YENMMIouLdJq2XZZEXaGeHnN73KCjeC7OGNK4gb/Dw2e1uwk2cCdZKU4jVBpN+j1HxXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=arbSYLwS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763156459;
	bh=M3gF+t8IsgI6PSTZgp2iLX1qTLe8b068JiSeWW4M8FE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=arbSYLwShp22qZCf6edowX9KnBzYQDEeDNdbA32u0Jav+GL2yInfowzdJwGrakGgd
	 1/vkoS8uRwAT0Gs4LQWgWy1oh0HTIkhiXN2swHZnCtnvXDm9qfndofaAk5FWvVuu6w
	 09Nv8Te8YOC4D53r1DWdfve+v9+IPFyovsCcWALBMBsXOfZ4lJxGfF9PPMeLKYTEj4
	 Y3QTxX09jMMntCWMoOMvlX6si9rqrUcs8IwzisIpeoX1LS2C5ecg4JLsC7PHqtmWnX
	 fPvKjJk4hBk1wsANtn+F0gmg8DDRznCJInVmVve+CfxS0eCNJEeJqc28AGKcn8Qmww
	 g3YUiD2L7EjOA==
Received: from [IPv6:2606:6d00:11:696f::c41] (unknown [IPv6:2606:6d00:11:696f::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 78C8217E013C;
	Fri, 14 Nov 2025 22:40:56 +0100 (CET)
Message-ID: <e5e4d2af07ae43f6681020db340f6d9f0fb56ba9.camel@collabora.com>
Subject: Re: [PATCH v3 4/6] media: mediatek: encoder: Add a new platform
 data member
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
Date: Fri, 14 Nov 2025 16:40:54 -0500
In-Reply-To: <20250814085642.17343-5-kyrie.wu@mediatek.com>
References: <20250814085642.17343-1-kyrie.wu@mediatek.com>
	 <20250814085642.17343-5-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-EvRa1YfHI+xPZWk5CuRJ"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-EvRa1YfHI+xPZWk5CuRJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 14 ao=C3=BBt 2025 =C3=A0 16:56 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> From: Irui Wang <irui.wang@mediatek.com>
>=20
> Add a new platform data member to indicate each encoder IC, so that the
> get chip name function by 'of_device_is_compatible' can be removed.
>=20
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>

I'm very happy of that cleanup,

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

thanks,
Nicolas

> ---
> =C2=A0.../mediatek/vcodec/encoder/mtk_vcodec_enc.c=C2=A0 | 23 ++---------=
--------
> =C2=A0.../vcodec/encoder/mtk_vcodec_enc_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 6 +++++
> =C2=A0.../vcodec/encoder/mtk_vcodec_enc_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 ++
> =C2=A03 files changed, 10 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_en=
c.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> index 03512bf7a072..1a7be3e57eef 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> @@ -198,34 +198,15 @@ static int vidioc_enum_fmt_vid_out(struct file *fil=
e, void *priv,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pdata->num_output_formats);
> =C2=A0}
> =C2=A0
> -static int mtk_vcodec_enc_get_chip_name(void *priv)
> -{
> -	struct mtk_vcodec_enc_ctx *ctx =3D fh_to_enc_ctx(priv);
> -	struct device *dev =3D &ctx->dev->plat_dev->dev;
> -
> -	if (of_device_is_compatible(dev->of_node, "mediatek,mt8173-vcodec-enc")=
)
> -		return 8173;
> -	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8183-vcodec-=
enc"))
> -		return 8183;
> -	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8192-vcodec-=
enc"))
> -		return 8192;
> -	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8195-vcodec-=
enc"))
> -		return 8195;
> -	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8188-vcodec-=
enc"))
> -		return 8188;
> -	else
> -		return 8173;
> -}
> -
> =C2=A0static int vidioc_venc_querycap(struct file *file, void *priv,
> =C2=A0				struct v4l2_capability *cap)
> =C2=A0{
> =C2=A0	struct mtk_vcodec_enc_ctx *ctx =3D fh_to_enc_ctx(priv);
> +	const struct mtk_vcodec_enc_pdata *pdata =3D ctx->dev->venc_pdata;
> =C2=A0	struct device *dev =3D &ctx->dev->plat_dev->dev;
> -	int platform_name =3D mtk_vcodec_enc_get_chip_name(priv);
> =C2=A0
> =C2=A0	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
> -	snprintf(cap->card, sizeof(cap->card), "MT%d video encoder", platform_n=
ame);
> +	snprintf(cap->card, sizeof(cap->card), "MT%d video encoder", pdata->ven=
c_model_num);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_en=
c_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv=
.c
> index bb913dfe5f04..50936949d527 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
> @@ -380,6 +380,7 @@ static int mtk_vcodec_probe(struct platform_device *p=
dev)
> =C2=A0}
> =C2=A0
> =C2=A0static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata =3D {
> +	.venc_model_num =3D 8173,
> =C2=A0	.capture_formats =3D mtk_video_formats_capture_h264,
> =C2=A0	.num_capture_formats =3D ARRAY_SIZE(mtk_video_formats_capture_h264=
),
> =C2=A0	.output_formats =3D mtk_video_formats_output,
> @@ -390,6 +391,7 @@ static const struct mtk_vcodec_enc_pdata mt8173_avc_p=
data =3D {
> =C2=A0};
> =C2=A0
> =C2=A0static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata =3D {
> +	.venc_model_num =3D 8173,
> =C2=A0	.capture_formats =3D mtk_video_formats_capture_vp8,
> =C2=A0	.num_capture_formats =3D ARRAY_SIZE(mtk_video_formats_capture_vp8)=
,
> =C2=A0	.output_formats =3D mtk_video_formats_output,
> @@ -400,6 +402,7 @@ static const struct mtk_vcodec_enc_pdata mt8173_vp8_p=
data =3D {
> =C2=A0};
> =C2=A0
> =C2=A0static const struct mtk_vcodec_enc_pdata mt8183_pdata =3D {
> +	.venc_model_num =3D 8183,
> =C2=A0	.uses_ext =3D true,
> =C2=A0	.capture_formats =3D mtk_video_formats_capture_h264,
> =C2=A0	.num_capture_formats =3D ARRAY_SIZE(mtk_video_formats_capture_h264=
),
> @@ -411,6 +414,7 @@ static const struct mtk_vcodec_enc_pdata mt8183_pdata=
 =3D {
> =C2=A0};
> =C2=A0
> =C2=A0static const struct mtk_vcodec_enc_pdata mt8188_pdata =3D {
> +	.venc_model_num =3D 8188,
> =C2=A0	.uses_ext =3D true,
> =C2=A0	.capture_formats =3D mtk_video_formats_capture_h264,
> =C2=A0	.num_capture_formats =3D ARRAY_SIZE(mtk_video_formats_capture_h264=
),
> @@ -423,6 +427,7 @@ static const struct mtk_vcodec_enc_pdata mt8188_pdata=
 =3D {
> =C2=A0};
> =C2=A0
> =C2=A0static const struct mtk_vcodec_enc_pdata mt8192_pdata =3D {
> +	.venc_model_num =3D 8192,
> =C2=A0	.uses_ext =3D true,
> =C2=A0	.capture_formats =3D mtk_video_formats_capture_h264,
> =C2=A0	.num_capture_formats =3D ARRAY_SIZE(mtk_video_formats_capture_h264=
),
> @@ -434,6 +439,7 @@ static const struct mtk_vcodec_enc_pdata mt8192_pdata=
 =3D {
> =C2=A0};
> =C2=A0
> =C2=A0static const struct mtk_vcodec_enc_pdata mt8195_pdata =3D {
> +	.venc_model_num =3D 8195,
> =C2=A0	.uses_ext =3D true,
> =C2=A0	.capture_formats =3D mtk_video_formats_capture_h264,
> =C2=A0	.num_capture_formats =3D ARRAY_SIZE(mtk_video_formats_capture_h264=
),
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_en=
c_drv.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv=
.h
> index 426b1398f815..b3206a7b592d 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
> @@ -21,6 +21,7 @@
> =C2=A0/**
> =C2=A0 * struct mtk_vcodec_enc_pdata - compatible data for each IC
> =C2=A0 *
> + * @venc_model_num: encoder model number
> =C2=A0 * @uses_ext: whether the encoder uses the extended firmware messag=
ing format
> =C2=A0 * @min_bitrate: minimum supported encoding bitrate
> =C2=A0 * @max_bitrate: maximum supported encoding bitrate
> @@ -33,6 +34,7 @@
> =C2=A0 * @uses_common_fw_iface: whether the encoder uses common driver in=
terface
> =C2=A0 */
> =C2=A0struct mtk_vcodec_enc_pdata {
> +	u16 venc_model_num;
> =C2=A0	bool uses_ext;
> =C2=A0	u64 min_bitrate;
> =C2=A0	u64 max_bitrate;

--=-EvRa1YfHI+xPZWk5CuRJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaReh5wAKCRDZQZRRKWBy
9CXKAQDNDAfNOKCIBvVuUN6h/HCoZwSUJAeu8n4D46L0sOZWOgEA+mZTe25xAc77
vtt/G0mwiqaKECK7tEIBJz4BfqLanAU=
=A0Sk
-----END PGP SIGNATURE-----

--=-EvRa1YfHI+xPZWk5CuRJ--

