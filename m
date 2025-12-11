Return-Path: <linux-media+bounces-48652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 099C1CB72AD
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 21:32:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2EA3F30321FD
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 20:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0763164D2;
	Thu, 11 Dec 2025 20:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oJV1qhqu"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E737A7261C;
	Thu, 11 Dec 2025 20:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765485108; cv=none; b=PCc/W/5489RZyMpmsz6U0/D67XEkyczjWh0WrjCjToocRdp09oqrx2wnk7KwtiRUbGLXWbi9p5F4wtAdnTo1S74KPDA3cJK97gj12DpPLoFNc+d0tCoGTwMmEJZfBTTgpudN8XwbRixYTOfSChy2yNtUlOaRDOyNxRmLC9Yvm9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765485108; c=relaxed/simple;
	bh=bRCzVG6aQwOT52HS4f7uQPKKSRG6hApe9ossFdWcHzQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RHBEf/SQilzMXXh5Sk2zUavGj9HXzV3Nykpu9UMnFyom24b1/oxOHk9pucZbSKe4h39+MfQwcZ6ZYsaEAe6HYISev9e5FZA2WhGiB2Ly5VriECzmzezJ4NRaoroILkwy/ZdEpuY8O9QamWM9aK8IL1yYesEYvvKzqznFApO8P9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oJV1qhqu; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765485105;
	bh=bRCzVG6aQwOT52HS4f7uQPKKSRG6hApe9ossFdWcHzQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=oJV1qhquF98KaKTyq5wn43loh3QVJv16EtbmaMc0cZILoRcgeVXx7QKu3+xhfGo0+
	 KQBygNNKgydlU/TwPaCnP0wUozSGFw1T8HJybD5D5VLvqFFahEk1rnnYjrLBdtsL24
	 HeIzFBLz5QCzTHuuFVDIwrqfIYKCCDRr/wJkCnyuUf+kTOjeGXD6U9CG54g2DPlTsj
	 3TOKmN0gryZZAmzqIwzLokx/foi/qVtHXw6SSeDUxNvLV2ZhS85EGkIpbuS5hIK39d
	 7Ui0RwFspMI7cCAN/3Rstb7sFlXDn6g9XrNAmoqsE/42BEDgiLLdwpIRrdY7aulWDJ
	 4N7FIA9KVZqvg==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AF71F17E110C;
	Thu, 11 Dec 2025 21:31:42 +0100 (CET)
Message-ID: <898905035315552215b13402d29e2eeb1350c74c.camel@collabora.com>
Subject: Re: [PATCH v6 06/10] media: mediatek: vcodec: Add 4K prob size
 supporting for VP9 decoder
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
 <andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>, Kyrie Wu
	 <kyrie.wu@mediatek.corp-partner.google.com>
Date: Thu, 11 Dec 2025 15:31:41 -0500
In-Reply-To: <20251202074038.3173-7-kyrie.wu@mediatek.com>
References: <20251202074038.3173-1-kyrie.wu@mediatek.com>
	 <20251202074038.3173-7-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-PADTW19qrDZFcRO1Rspl"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-PADTW19qrDZFcRO1Rspl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 15:40 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> From: Kyrie Wu <kyrie.wu@mediatek.corp-partner.google.com>

I don't think you meant to commit with your Google partner email ?

>=20
> add config to support prob size both 3840 and 2560.

Prob mean probability ? Commit message is the place to you full words. Can =
you
extend why the difference, and use defines instead of magic number?

>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.corp-partner.google.com>

Or even sign it ?

Nicolas

> ---
> =C2=A0.../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h=C2=A0 | 2=
 ++
> =C2=A0.../mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0.../mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c=C2=A0=C2=A0=
=C2=A0=C2=A0 | 7 +++++++
> =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c=C2=A0=C2=A0=
=C2=A0=C2=A0 | 4 ++--
> =C2=A04 files changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> index a8baeab98477..ecf0d7ad0d54 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -80,10 +80,12 @@ struct vdec_pic_info {
> =C2=A0 * struct mtk_vcodec_dec_params - decoder supported parameters
> =C2=A0 * @level: decoder supported vcodec level
> =C2=A0 * @profile: decoder supported vcodec profile
> + * @prob_size: vp9 decoder prob size
> =C2=A0 */
> =C2=A0struct mtk_vcodec_dec_params {
> =C2=A0	s64 level;
> =C2=A0	s64 profile;
> +	size_t prob_size;
> =C2=A0};
> =C2=A0
> =C2=A0/**
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.=
c
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.=
c
> index a47906b9d717..99c252e0a2e1 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> @@ -630,5 +630,6 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata=
 =3D {
> =C2=A0	.vp9_params =3D {
> =C2=A0		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
> =C2=A0		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +		.prob_size =3D 2560,
> =C2=A0	},
> =C2=A0};
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> index dc3e9a2ccc2c..f18aafd08c76 100644
> ---
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> +++
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> @@ -841,6 +841,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata=
 =3D {
> =C2=A0	.vp9_params =3D {
> =C2=A0		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
> =C2=A0		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +		.prob_size =3D 2560,
> =C2=A0	},
> =C2=A0};
> =C2=A0
> @@ -889,6 +890,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata=
 =3D {
> =C2=A0	.vp9_params =3D {
> =C2=A0		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
> =C2=A0		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +		.prob_size =3D 2560,
> =C2=A0	},
> =C2=A0};
> =C2=A0
> @@ -919,6 +921,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata=
 =3D {
> =C2=A0	.vp9_params =3D {
> =C2=A0		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
> =C2=A0		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +		.prob_size =3D 2560,
> =C2=A0	},
> =C2=A0};
> =C2=A0
> @@ -949,6 +952,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata=
 =3D {
> =C2=A0	.vp9_params =3D {
> =C2=A0		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> =C2=A0		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +		.prob_size =3D 2560,
> =C2=A0	},
> =C2=A0};
> =C2=A0
> @@ -979,6 +983,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata=
 =3D {
> =C2=A0	.vp9_params =3D {
> =C2=A0		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> =C2=A0		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +		.prob_size =3D 3840,
> =C2=A0	},
> =C2=A0};
> =C2=A0
> @@ -1026,6 +1031,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pda=
ta =3D
> {
> =C2=A0	.vp9_params =3D {
> =C2=A0		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
> =C2=A0		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +		.prob_size =3D 2560,
> =C2=A0	},
> =C2=A0};
> =C2=A0
> @@ -1056,5 +1062,6 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pda=
ta =3D
> {
> =C2=A0	.vp9_params =3D {
> =C2=A0		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> =C2=A0		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +		.prob_size =3D 3840,
> =C2=A0	},
> =C2=A0};
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> index 9513ddde7c7c..36a87b455d11 100644
> ---
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> +++
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> @@ -22,7 +22,6 @@
> =C2=A0#define VP9_RESET_FRAME_CONTEXT_ALL 3
> =C2=A0
> =C2=A0#define VP9_TILE_BUF_SIZE 4096
> -#define VP9_PROB_BUF_SIZE 2560
> =C2=A0#define VP9_COUNTS_BUF_SIZE 16384
> =C2=A0
> =C2=A0#define HDR_FLAG(x) (!!((hdr)->flags & V4L2_VP9_FRAME_FLAG_##x))
> @@ -546,6 +545,7 @@ static int vdec_vp9_slice_alloc_working_buffer(struct
> vdec_vp9_slice_instance *i
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vdec_vp9_slice_vsi
> *vsi)
> =C2=A0{
> =C2=A0	struct mtk_vcodec_dec_ctx *ctx =3D instance->ctx;
> +	struct mtk_vcodec_dec_dev *pdev =3D ctx->dev;
> =C2=A0	enum vdec_vp9_slice_resolution_level level;
> =C2=A0	/* super blocks */
> =C2=A0	unsigned int max_sb_w;
> @@ -616,7 +616,7 @@ static int vdec_vp9_slice_alloc_working_buffer(struct
> vdec_vp9_slice_instance *i
> =C2=A0	}
> =C2=A0
> =C2=A0	if (!instance->prob.va) {
> -		instance->prob.size =3D VP9_PROB_BUF_SIZE;
> +		instance->prob.size =3D pdev->vdec_pdata->vp9_params.prob_size;
> =C2=A0		if (mtk_vcodec_mem_alloc(ctx, &instance->prob))
> =C2=A0			goto err;
> =C2=A0	}

--=-PADTW19qrDZFcRO1Rspl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTsqLQAKCRDZQZRRKWBy
9JzcAP9J4uruEh0DFd1TmWd7TxrfQ1Pe7xgNvD3gXRr6+scrXwD9Hbw9eA4iGY2D
VVcQltd9GPv19jXppgUl38b+pt7o7gY=
=BFzJ
-----END PGP SIGNATURE-----

--=-PADTW19qrDZFcRO1Rspl--

