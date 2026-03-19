Return-Path: <linux-media+bounces-56361-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKsvLsk7vGl3uwIAu9opvQ
	(envelope-from <linux-media+bounces-56361-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 19:09:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C42D92D0931
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 19:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7018D30069A8
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 18:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F793D47BB;
	Thu, 19 Mar 2026 18:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FW2rYClw"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E048B395D99;
	Thu, 19 Mar 2026 18:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773943722; cv=none; b=k+YRzLYFGF8jdfa6D+qWAgY2EE6PQ+autYmtIV188hAQpUYOcyO5750oHiNnDPWlqLq32ElJj7hkrsXa+EoobPMeW+ZSEsPsKblk9Gl8CxAswb8nlB5S5UDIhNl2JsvhZj8LoqK72u4TkX9tnEAgOyPKlW9sEeZNxVroE8YuDpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773943722; c=relaxed/simple;
	bh=CyVBrdlwbt7DQU43THi/VI2dRqZPYg7NHLiRkbNCHA4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Db4nBP64766s+atOhdQJTxOTkeFrum6wl5QZzEHgkDAwYIJgi3F1ZL23+50SFwQCHEMQDEq/VjoSP4a5pcRaCSTtBtCr7bQ/Ed6Vs59mUHAgpd2f2rHc5ec8GhR9+RuHWaRjm4xBbriPaxrYiFDhWv8ATxsO5eM1tI0MypGpn0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FW2rYClw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773943719;
	bh=CyVBrdlwbt7DQU43THi/VI2dRqZPYg7NHLiRkbNCHA4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=FW2rYClw1MYxUezmzvZeFgF3KZ8ZtXaNh7cU21bYdITjo50zSZIx+T31h4ZDI3LTX
	 us0KsSUqRi9YdM3z3cReZINNTvC6RzkDZGcFwlT8qiKT5DMRCoGOP0pMkWGxGYPAum
	 hTABeUfJD0eBwPbp2EqHQUbtg3so81PLaB4rbSfWSCahp0sOwrwTuD2jbO71S36OBT
	 pGBFh7Ajszjzhj0uI9y4EIeyGszmRwPm1AxVeoheWwoRmYFZs+8l9Eazw1LG4781nT
	 iwYUalrPwBli9WxHxXGJ4ACC5BjhEDU8x0o+P9zat7BI49nNkfsra6odalvmgpCBm3
	 A84zB9OzqWb4g==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D811D17E127A;
	Thu, 19 Mar 2026 19:08:36 +0100 (CET)
Message-ID: <f5856dea6aa27d9be0abec8d27a2ffe79fb7cccf.camel@collabora.com>
Subject: Re: [PATCH v7 06/10] media: mediatek: vcodec: Add VP9 Probability
 Size Configuration
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
Date: Thu, 19 Mar 2026 14:08:35 -0400
In-Reply-To: <20260127024248.18406-7-kyrie.wu@mediatek.com>
References: <20260127024248.18406-1-kyrie.wu@mediatek.com>
	 <20260127024248.18406-7-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-M5Ch18Kp01gKBrDsnD66"
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56361-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,gmail.com,collabora.com,xs4all.nl,chromium.org,arndb.de,vger.kernel.org,lists.infradead.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,mediatek.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:email,collabora.com:dkim,collabora.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C42D92D0931
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-M5Ch18Kp01gKBrDsnD66
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 10:42 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> This commit introduces support for configuring the VP9 decoder
> probability buffer size. It removes hard-coded values and ensures
> chipset-specific buffer sizes are handled dynamically, improving
> maintainability and alignment.

Similar to my previous request, add the prob_size before any MT8189 changes=
, and
then make one patch that adds MT8189 pdata.

>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0.../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A0.../mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c=C2=A0 |=C2=A0=
 1 +
> =C2=A0.../mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c | 10 +++++++=
+++
> =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c |=C2=A0 4 ++=
--
> =C2=A04 files changed, 15 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.h
> index f38b5dc4bb74..08cc65054de5 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -80,10 +80,12 @@ struct vdec_pic_info {
> =C2=A0 * struct mtk_vcodec_dec_params - decoder supported parameters
> =C2=A0 * @level: decoder supported vcodec level
> =C2=A0 * @profile: decoder supported vcodec profile
> + * @prob_size: vp9 decoder probability size
> =C2=A0 */
> =C2=A0struct mtk_vcodec_dec_params {
> =C2=A0	s64 level;
> =C2=A0	s64 profile;
> +	size_t prob_size;
> =C2=A0};
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateful.c
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
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_stateless.c
> index b571c4ed3f79..ca39ae3571a3 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> @@ -10,6 +10,9 @@
> =C2=A0#include "mtk_vcodec_dec_pm.h"
> =C2=A0#include "vdec_drv_if.h"
> =C2=A0
> +#define VP9_PROB_BUF_SIZE 2560
> +#define VP9_4K_PROB_BUF_SIZE 3840
> +
> =C2=A0/**
> =C2=A0 * struct mtk_stateless_control=C2=A0 - CID control type
> =C2=A0 * @cfg: control configuration
> @@ -841,6 +844,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata=
 =3D {
> =C2=A0	.vp9_params =3D {
> =C2=A0		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
> =C2=A0		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +		.prob_size =3D VP9_PROB_BUF_SIZE,
> =C2=A0	},
> =C2=A0};
> =C2=A0
> @@ -892,6 +896,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata=
 =3D {
> =C2=A0	.vp9_params =3D {
> =C2=A0		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
> =C2=A0		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +		.prob_size =3D VP9_PROB_BUF_SIZE,
> =C2=A0	},
> =C2=A0};
> =C2=A0
> @@ -910,6 +915,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata=
 =3D {
> =C2=A0	.vp9_params =3D {
> =C2=A0		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
> =C2=A0		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +		.prob_size =3D VP9_PROB_BUF_SIZE,
> =C2=A0	},
> =C2=A0};
> =C2=A0
> @@ -928,6 +934,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata=
 =3D {
> =C2=A0	.vp9_params =3D {
> =C2=A0		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> =C2=A0		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +		.prob_size =3D VP9_PROB_BUF_SIZE,
> =C2=A0	},
> =C2=A0};
> =C2=A0
> @@ -946,6 +953,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata=
 =3D {
> =C2=A0	.vp9_params =3D {
> =C2=A0		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> =C2=A0		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +		.prob_size =3D VP9_4K_PROB_BUF_SIZE,
> =C2=A0	},
> =C2=A0};
> =C2=A0
> @@ -981,6 +989,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata=
 =3D {
> =C2=A0	.vp9_params =3D {
> =C2=A0		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
> =C2=A0		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +		.prob_size =3D VP9_PROB_BUF_SIZE,
> =C2=A0	},
> =C2=A0};
> =C2=A0
> @@ -1011,5 +1020,6 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pda=
ta =3D {
> =C2=A0	.vp9_params =3D {
> =C2=A0		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> =C2=A0		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +		.prob_size =3D VP9_4K_PROB_BUF_SIZE,
> =C2=A0	},

So hunk change will be squashed, everything else is refactoring.

Nicolas

> =C2=A0};
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> index 82e257bd059f..e8ba99d31e74 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> @@ -22,7 +22,6 @@
> =C2=A0#define VP9_RESET_FRAME_CONTEXT_ALL 3
> =C2=A0
> =C2=A0#define VP9_TILE_BUF_SIZE 4096
> -#define VP9_PROB_BUF_SIZE 2560
> =C2=A0#define VP9_COUNTS_BUF_SIZE 16384
> =C2=A0
> =C2=A0#define HDR_FLAG(x) (!!((hdr)->flags & V4L2_VP9_FRAME_FLAG_##x))
> @@ -546,6 +545,7 @@ static int vdec_vp9_slice_alloc_working_buffer(struct=
 vdec_vp9_slice_instance *i
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vdec_vp9_slice_vsi=
 *vsi)
> =C2=A0{
> =C2=A0	struct mtk_vcodec_dec_ctx *ctx =3D instance->ctx;
> +	struct mtk_vcodec_dec_dev *pdev =3D ctx->dev;
> =C2=A0	enum vdec_vp9_slice_resolution_level level;
> =C2=A0	/* super blocks */
> =C2=A0	unsigned int max_sb_w;
> @@ -616,7 +616,7 @@ static int vdec_vp9_slice_alloc_working_buffer(struct=
 vdec_vp9_slice_instance *i
> =C2=A0	}
> =C2=A0
> =C2=A0	if (!instance->prob.va) {
> -		instance->prob.size =3D VP9_PROB_BUF_SIZE;
> +		instance->prob.size =3D pdev->vdec_pdata->vp9_params.prob_size;
> =C2=A0		if (mtk_vcodec_mem_alloc(ctx, &instance->prob))
> =C2=A0			goto err;
> =C2=A0	}

--=-M5Ch18Kp01gKBrDsnD66
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabw7owAKCRDZQZRRKWBy
9EtJAP4ucvSpKzFChMvsvfUz6Zgheb9UmpvxWHw+l6XgSANY4QEAt+65lyCV5UBk
8W4qN9FOR/NhoUgVt1bCAim9nxyzCQw=
=VY97
-----END PGP SIGNATURE-----

--=-M5Ch18Kp01gKBrDsnD66--

