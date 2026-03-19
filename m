Return-Path: <linux-media+bounces-56359-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJZkGw88vGlxvgIAu9opvQ
	(envelope-from <linux-media+bounces-56359-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 19:10:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 130C22D0994
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 19:10:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3F0B324B4B8
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 17:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9317F38E5C1;
	Thu, 19 Mar 2026 17:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BxHw+uAK"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAE13EFD21;
	Thu, 19 Mar 2026 17:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773943129; cv=none; b=l5IaBiSRPefJo56fuAXX9GeU6COBL+JVu8f5zC/+vJOH059bqzhIbUTQsgxFItZDMz8ia6Z1iygFdPwI9326N1RN1aJBwgbJsvHvr2a5C/VkTPBKdQqXW7FA3WDFHgj7vTsINlsDUWd4wSObAAUxU7zcfo8XM/T98C/zSn6WOuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773943129; c=relaxed/simple;
	bh=HwTyo/5WYUr5YkScc9lyA3lElCIJ1FNPsB40BEMRe0k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SflN7JosMhf4qqAmZeVIMrnUE/g9Bre0aoUzjmo0TQEUVynvekz4MOLNLxIGyr+a7bewXByHK4zoXS+9s+dtkJDgLQQWspV46m9etALApXV3TcbLpXdsakUGGRCnknvfjRMoQKOThqRCRepR9U3uUGw53gd+z3NP9nK3y+VKFYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BxHw+uAK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773943125;
	bh=HwTyo/5WYUr5YkScc9lyA3lElCIJ1FNPsB40BEMRe0k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=BxHw+uAK7Mlff7qIcPlCXGqcieoUyWinVXZfcbb9rLr2ZtojOufM1qweP1VbTPJg9
	 U/QJ7ZFRfc0E/5dNXLWqodYZj9Qq0I55+gtgdLMl2BH0TEC+LWJAUJJeBpSisYywXb
	 H/gle1NsJGmn9iENz4Nohf34p4o8BlhRBfG8A74FUWTqTHmo1Fp40U89tQn2kT43FJ
	 k2UjYVVRNq9scpPQQQ30cjiV3JUsGCGpBJdluB+JM3sdWiiiKchlBqyAUWRe8RIqAA
	 Zz+lJ9INv3k4+DR9d0ZCGRfKY4XnQ8bECB+P+1vJIFGzbuuut2tegYMONiZyXF/x2A
	 UAT/r3ooWcNvg==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 81F3117E01B1;
	Thu, 19 Mar 2026 18:58:42 +0100 (CET)
Message-ID: <658584073c66f5f3eca72bee2e2280327e803a22.camel@collabora.com>
Subject: Re: [PATCH v7 04/10] media: mediatek: vcodec: Refactor Decoder
 profile & level Handling
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
Date: Thu, 19 Mar 2026 13:58:39 -0400
In-Reply-To: <20260127024248.18406-5-kyrie.wu@mediatek.com>
References: <20260127024248.18406-1-kyrie.wu@mediatek.com>
	 <20260127024248.18406-5-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-/GspWsZFGaUupRr8a+jt"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56359-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,gmail.com,collabora.com,xs4all.nl,chromium.org,arndb.de,vger.kernel.org,lists.infradead.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,mediatek.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:email,collabora.com:dkim,collabora.com:email,collabora.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 130C22D0994
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-/GspWsZFGaUupRr8a+jt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 10:42 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> This commit refactors the handling of decoder parameters for H264,
> H265, and VP9 codecs by introducing a new structure to standardize
> supported level and profile information. By leveraging this changes,

this changes -> this change

cheers,
Nicolas

> chipset-specific conditional logic in the codec configuration
> functions is significantly reduced.
>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 16 ++++
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_stateless.c | 93 ++++------------=
---
> =C2=A02 files changed, 34 insertions(+), 75 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.h
> index bb293ada6fb2..f38b5dc4bb74 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -76,6 +76,16 @@ struct vdec_pic_info {
> =C2=A0	unsigned int reserved;
> =C2=A0};
> =C2=A0
> +/**
> + * struct mtk_vcodec_dec_params - decoder supported parameters
> + * @level: decoder supported vcodec level
> + * @profile: decoder supported vcodec profile
> + */
> +struct mtk_vcodec_dec_params {
> +	s64 level;
> +	s64 profile;
> +};
> +
> =C2=A0/**
> =C2=A0 * struct mtk_vcodec_dec_pdata - compatible data for each IC
> =C2=A0 * @init_vdec_params: init vdec params
> @@ -96,6 +106,9 @@ struct vdec_pic_info {
> =C2=A0 * @is_subdev_supported: whether support parent-node architecture(s=
ubdev)
> =C2=A0 * @uses_stateless_api: whether the decoder uses the stateless API =
with requests
> =C2=A0 * @chip_name: platforms configuration values
> + * @h264_params: H264 decoder default supported params
> + * @h265_params: H265 decoder default supported params
> + * @vp9_params: VP9 decoder default supported params
> =C2=A0 */
> =C2=A0struct mtk_vcodec_dec_pdata {
> =C2=A0	void (*init_vdec_params)(struct mtk_vcodec_dec_ctx *ctx);
> @@ -118,6 +131,9 @@ struct mtk_vcodec_dec_pdata {
> =C2=A0	bool is_subdev_supported;
> =C2=A0	bool uses_stateless_api;
> =C2=A0	unsigned int chip_name;
> +	struct mtk_vcodec_dec_params h264_params;
> +	struct mtk_vcodec_dec_params h265_params;
> +	struct mtk_vcodec_dec_params vp9_params;
> =C2=A0};
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_stateless.c
> index aba28d276bdf..a1f419202a24 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> @@ -549,106 +549,49 @@ static const struct v4l2_ctrl_ops mtk_vcodec_dec_c=
trl_ops =3D {
> =C2=A0static void mtk_vcodec_dec_fill_h264_level(struct v4l2_ctrl_config =
*cfg,
> =C2=A0					=C2=A0=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> -	switch (ctx->dev->chip_name) {
> -	case 8192:
> -	case 8188:
> -		cfg->max =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2;
> -		break;
> -	case 8195:
> -	case 8196:
> -		cfg->max =3D V4L2_MPEG_VIDEO_H264_LEVEL_6_0;
> -		break;
> -	case 8183:
> -	case 8186:
> -		cfg->max =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_2;
> -		break;
> -	default:
> -		cfg->max =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_1;
> -		break;
> -	}
> +	struct mtk_vcodec_dec_dev *pdev =3D ctx->dev;
> +
> +	cfg->max =3D pdev->vdec_pdata->h264_params.level;
> =C2=A0}
> =C2=A0
> =C2=A0static void mtk_vcodec_dec_fill_h264_profile(struct v4l2_ctrl_confi=
g *cfg,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> -	switch (ctx->dev->chip_name) {
> -	case 8188:
> -	case 8195:
> -	case 8196:
> -		cfg->max =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10;
> -		break;
> -	default:
> -		cfg->max =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH;
> -		break;
> -	}
> +	struct mtk_vcodec_dec_dev *pdev =3D ctx->dev;
> +
> +	cfg->max =3D pdev->vdec_pdata->h264_params.profile;
> =C2=A0}
> =C2=A0
> =C2=A0static void mtk_vcodec_dec_fill_h265_level(struct v4l2_ctrl_config =
*cfg,
> =C2=A0					=C2=A0=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> -	switch (ctx->dev->chip_name) {
> -	case 8188:
> -		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1;
> -		break;
> -	case 8195:
> -	case 8196:
> -		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2;
> -		break;
> -	default:
> -		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4;
> -		break;
> -	}
> +	struct mtk_vcodec_dec_dev *pdev =3D ctx->dev;
> +
> +	cfg->max =3D pdev->vdec_pdata->h265_params.level;
> =C2=A0}
> =C2=A0
> =C2=A0static void mtk_vcodec_dec_fill_h265_profile(struct v4l2_ctrl_confi=
g *cfg,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> -	switch (ctx->dev->chip_name) {
> -	case 8188:
> -	case 8195:
> -	case 8196:
> -		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10;
> -		break;
> -	default:
> -		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE;
> -		break;
> -	}
> +	struct mtk_vcodec_dec_dev *pdev =3D ctx->dev;
> +
> +	cfg->max =3D pdev->vdec_pdata->h265_params.profile;
> =C2=A0}
> =C2=A0
> =C2=A0static void mtk_vcodec_dec_fill_vp9_level(struct v4l2_ctrl_config *=
cfg,
> =C2=A0					=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> -	switch (ctx->dev->chip_name) {
> -	case 8192:
> -	case 8188:
> -		cfg->max =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_1;
> -		break;
> -	case 8195:
> -	case 8196:
> -		cfg->max =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2;
> -		break;
> -	case 8186:
> -		cfg->max =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_1;
> -		break;
> -	default:
> -		cfg->max =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_0;
> -		break;
> -	}
> +	struct mtk_vcodec_dec_dev *pdev =3D ctx->dev;
> +
> +	cfg->max =3D pdev->vdec_pdata->vp9_params.level;
> =C2=A0}
> =C2=A0
> =C2=A0static void mtk_vcodec_dec_fill_vp9_profile(struct v4l2_ctrl_config=
 *cfg,
> =C2=A0					=C2=A0=C2=A0=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> -	switch (ctx->dev->chip_name) {
> -	case 8188:
> -	case 8195:
> -	case 8196:
> -		cfg->max =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2;
> -		break;
> -	default:
> -		cfg->max =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1;
> -		break;
> -	}
> +	struct mtk_vcodec_dec_dev *pdev =3D ctx->dev;
> +
> +	cfg->max =3D pdev->vdec_pdata->vp9_params.profile;
> =C2=A0}
> =C2=A0
> =C2=A0static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *=
cfg,

--=-/GspWsZFGaUupRr8a+jt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabw5TwAKCRDZQZRRKWBy
9FyUAP4sMXwt3Br3AkviE1yy7rNUYdsYuv79azZRuF+fODYIYQD/Q6QSRoULxKsh
TVAryWLpAii5TtJJoXx7f3Bi3SBqcgQ=
=TJFP
-----END PGP SIGNATURE-----

--=-/GspWsZFGaUupRr8a+jt--

