Return-Path: <linux-media+bounces-48650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEA2CB7247
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 21:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 35E9B3016F9D
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 20:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642AA3164A5;
	Thu, 11 Dec 2025 20:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cf2rWLzB"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791281C6B4;
	Thu, 11 Dec 2025 20:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765484352; cv=none; b=nPoz/BVF3T/G/Dl+FUWwicQ6AYJYrfIA3ZvPdriigfg9th0Un9Gif6r7RbJdtwxlpwE3/naTrNxObU92sJkrs86Xw0JO9/zLiQbgh3c5S5G7I8MZVkCv6CBYIoZs/i3BBgynjShOgOLo/WxrWiVir4aFPB75b9AX1sEwvEAu3Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765484352; c=relaxed/simple;
	bh=XQ7NjUCQ+NG0vu6PPkPvlyCWjhQd7NVea8EeMR4GNjw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ebpdy/+y3kMDF2jdEfYFmMgCdw/gTUwC0eUBzjPZofzYPlg/jcewFU2H5bKoXhMAOTs7V+MmDGsJWu3VXjidXnDKGd3VB37pHsm7rOSZcTEZxhllkpTgOgbreY20SoKT5Qcammm35Jdy359PcRUUOLRWjXQV6gAQf1UHzrM888U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cf2rWLzB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765484348;
	bh=XQ7NjUCQ+NG0vu6PPkPvlyCWjhQd7NVea8EeMR4GNjw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=cf2rWLzBUcvs10L0K79b3rrCOBZEia5Ft5mkQ0QZq50zpRg1cLPytDUm18fZX5UHO
	 i18xK6iBJbAWoAhVPVbHYV+cAculuYk9utaWYJkxOBy2lULIAnQqwPF4iM3w1ilLHQ
	 ffbv0r0TiSzrMs3q63NSc5zeMVOeHMk8wjjxKvFC/asNbBTjHChhh7BjtENjXqu68k
	 TjlK6hzUaE8fn3c2AOU1lFOHdGwKyA6OjDZYnTV8NPeqm1F4SJmt8qzir1I/hxq626
	 B1v5iVhnT1uEkApWK8+C1WH+QnDid5e+3oN1bu5MwpPLGz+1vysGZ8pV5jAlJvzTSe
	 X40jRkqZA5qiQ==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0DBA117E00A8;
	Thu, 11 Dec 2025 21:19:05 +0100 (CET)
Message-ID: <370389b51412209ae6aa6d8c388f29af7ed456a5.camel@collabora.com>
Subject: Re: [PATCH v6 04/10] media: mediatek: vcodec: add profile and level
 supporting for MT8189
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
Date: Thu, 11 Dec 2025 15:19:04 -0500
In-Reply-To: <20251202074038.3173-5-kyrie.wu@mediatek.com>
References: <20251202074038.3173-1-kyrie.wu@mediatek.com>
	 <20251202074038.3173-5-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-+eslNUY9ruhNLkvyalK4"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-+eslNUY9ruhNLkvyalK4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

in the subject, supporting -> suppport.

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 15:40 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> add profile and level supporting for H264 and vp9 of MT8189

You already said that, perhaps say:


   The MT8189 SoC support H.264 up to high-10 at level 5.2, HEVC up to prof=
ile
   main-still at level 4 and VP9 profile 2 up to level 5.2.=20

>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com>
> ---
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 16 ++
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_stateful.c=C2=A0 |=C2=A0 12 ++
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_stateless.c | 177 ++++++++++-----=
---
> =C2=A03 files changed, 130 insertions(+), 75 deletions(-)
>=20
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> index 2dbde8d00e6f..a8baeab98477 100644
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
with
> requests
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
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.=
c
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.=
c
> index 8ddb61670dc6..a47906b9d717 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> @@ -619,4 +619,16 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdat=
a =3D {
> =C2=A0	.is_subdev_supported =3D false,
> =C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8173,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_1,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +	},
> =C2=A0};
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> index 9e43c54f8c4d..dc3e9a2ccc2c 100644
> ---
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> +++
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> @@ -549,106 +549,49 @@ static const struct v4l2_ctrl_ops
> mtk_vcodec_dec_ctrl_ops =3D {
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

Only remaining issue is that this is two changes. Please refactor first, an=
d add
the configuration after. This is a nice cleanup.

regards,
Nicolas

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
> @@ -887,6 +830,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdat=
a =3D {
> =C2=A0	.is_subdev_supported =3D false,
> =C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8183,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0/* This platform data is used for one lat and one core architecture=
. */
> @@ -923,6 +878,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdat=
a =3D {
> =C2=A0	.is_subdev_supported =3D true,
> =C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8188,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata =3D {
> @@ -941,6 +908,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdat=
a =3D {
> =C2=A0	.is_subdev_supported =3D true,
> =C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8192,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata =3D {
> @@ -959,6 +938,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdat=
a =3D {
> =C2=A0	.is_subdev_supported =3D true,
> =C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8195,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata =3D {
> @@ -977,6 +968,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdat=
a =3D {
> =C2=A0	.is_subdev_supported =3D true,
> =C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8196,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata =3D {
> @@ -1012,6 +1015,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pd=
ata =3D
> {
> =C2=A0	.is_subdev_supported =3D true,
> =C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8186,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pdata =3D {
> @@ -1030,4 +1045,16 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pd=
ata =3D
> {
> =C2=A0	.is_subdev_supported =3D true,
> =C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8189,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +	},
> =C2=A0};

--=-+eslNUY9ruhNLkvyalK4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTsnOAAKCRDZQZRRKWBy
9F6xAP0cn4qiXi09cNHJcNVeyZ9YfLVJFP7GZiLYXfeaWpKSjAD/Q0VIncVxeShn
r8dpg/dPdsTl49aAFvzwg/7Y44LcQQ4=
=GJ5l
-----END PGP SIGNATURE-----

--=-+eslNUY9ruhNLkvyalK4--

