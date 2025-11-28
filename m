Return-Path: <linux-media+bounces-47883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C67FC9314F
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 21:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 870EE34AF56
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 20:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7423A2D8364;
	Fri, 28 Nov 2025 20:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MiKqXoyf"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C305323771E;
	Fri, 28 Nov 2025 20:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764360467; cv=none; b=iWZ3lsPS8MRlXpce2Km0VBY52XJLS6Ks4Ym3YJpuvg3p/Xel7jN5jQTlKLx8vhI9heV53991RAMg/9lKmKJ4T6ThBAKlgRWRoraZ+hN6SYC8g3tV3Dvd0drqMIllbEUZvpA8VvqueJw7iMMwIHcVJFVInHDX6t5FQg1BICrN28s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764360467; c=relaxed/simple;
	bh=aIZDBdwp54CNnoDAgDO/k2Xw/XKEWEi/5x7WLygL880=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pDmrwo3tZsaonSah2zC8nah8Iv5WTwUkXpW2I493QZWiSFSOYXaKPIsPO7py6qFJ+sIIHmSXlNvJmCw/w/1FV4tM9yKLy2O1+Z0JYAc99XoSXFnbxGYWI0V92x1aQiVjg1aoXJyRw6W4yriTNnk7F9Yh90185h2SKZnxwlKT70w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MiKqXoyf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764360464;
	bh=aIZDBdwp54CNnoDAgDO/k2Xw/XKEWEi/5x7WLygL880=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=MiKqXoyfwV0UjnMO8c7ZfVo3xWsUA8E3d5FMxGzHPs+BLGfeUUXHFzguhu+PL/ByA
	 PuZ+C9Y6E1sBKhQuAhwohCP8MdgqEmcMlPvnGUfo9Q2Dcn9kEsP6g7NkoHHcMadEt0
	 c3ddND+YXVT2PYFnOFtsQ//LoaktWP3u8vkEBefEPdm2bcRyjoUOrXD3PXS0Fjdj8c
	 SlM/cZWqWfkg9JgpwMHW5mWhxqnBnfGHvrRq6xU2CMpHLyMAlAGwdl/+efsHVrVSop
	 D/BiQWFAC2MEnB/77tkvHFmks5WMLjbIhdQRmIjXrLkBCusfPf4knyiu63QLAVQW8v
	 OO8N57rEpGFlA==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0860117E107C;
	Fri, 28 Nov 2025 21:07:41 +0100 (CET)
Message-ID: <a89a7288c8e68a93485ad5e2eb42ec02860eea30.camel@collabora.com>
Subject: Re: [PATCH v2 05/14] media: mediatek: vcodec: get different
 firmware ipi id
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
Date: Fri, 28 Nov 2025 15:07:41 -0500
In-Reply-To: <20250815085232.30240-6-yunfei.dong@mediatek.com>
References: <20250815085232.30240-1-yunfei.dong@mediatek.com>
	 <20250815085232.30240-6-yunfei.dong@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-agtb3hdFQL7Q1Coas2yl"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-agtb3hdFQL7Q1Coas2yl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 15 ao=C3=BBt 2025 =C3=A0 16:52 +0800, Yunfei Dong a =C3=A9crit=
=C2=A0:
> Getting ipi(inter-processor interrupt) id according to firmware
> type and hardware index for different architecture.
>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> =C2=A0.../platform/mediatek/vcodec/common/mtk_vcodec_fw.c | 13 ++++++++++=
+++
> =C2=A0.../platform/mediatek/vcodec/common/mtk_vcodec_fw.h |=C2=A0 1 +
> =C2=A0.../vcodec/decoder/vdec/vdec_av1_req_lat_if.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A0.../vcodec/decoder/vdec/vdec_h264_req_multi_if.c=C2=A0=C2=A0=C2=A0 =
|=C2=A0 4 ++--
> =C2=A0.../vcodec/decoder/vdec/vdec_hevc_req_multi_if.c=C2=A0=C2=A0=C2=A0 =
|=C2=A0 4 ++--
> =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c=C2=A0 |=C2=A0 4 =
++--
> =C2=A0.../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A07 files changed, 24 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.=
c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
> index fc547afa4ebf..4ed7639dfa30 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
> @@ -5,6 +5,19 @@
> =C2=A0#include "mtk_vcodec_fw_priv.h"
> =C2=A0#include "mtk_vcodec_fw_vcp.h"
> =C2=A0
> +int mtk_vcodec_fw_get_ipi(enum mtk_vcodec_fw_type type, int hw_id)
> +{
> +	switch (type) {
> +	case SCP:
> +		return hw_id =3D=3D MTK_VDEC_LAT0 ? SCP_IPI_VDEC_LAT : SCP_IPI_VDEC_CO=
RE;
> +	case VCP:
> +		return hw_id =3D=3D MTK_VDEC_LAT0 ? VCP_IPI_LAT_DECODER : VCP_IPI_CORE=
_DECODER;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(mtk_vcodec_fw_get_ipi);
> +
> =C2=A0struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, enum mtk_vco=
dec_fw_type type,
> =C2=A0					=C2=A0=C2=A0 enum mtk_vcodec_fw_use fw_use)
> =C2=A0{
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.=
h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> index c1642fb09b42..142e2e87905c 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> @@ -41,5 +41,6 @@ int mtk_vcodec_fw_ipi_register(struct mtk_vcodec_fw *fw=
, int id,
> =C2=A0int mtk_vcodec_fw_ipi_send(struct mtk_vcodec_fw *fw, int id,
> =C2=A0			=C2=A0=C2=A0 void *buf, unsigned int len, unsigned int wait);
> =C2=A0int mtk_vcodec_fw_get_type(struct mtk_vcodec_fw *fw);
> +int mtk_vcodec_fw_get_ipi(enum mtk_vcodec_fw_type type, int hw_id);
> =C2=A0
> =C2=A0#endif /* _MTK_VCODEC_FW_H_ */
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av=
1_req_lat_if.c
> index bf21f2467a0f..618064001883 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> @@ -1886,8 +1886,8 @@ static int vdec_av1_slice_init(struct mtk_vcodec_de=
c_ctx *ctx)
> =C2=A0		return -ENOMEM;
> =C2=A0
> =C2=A0	instance->ctx =3D ctx;
> -	instance->vpu.id =3D SCP_IPI_VDEC_LAT;
> -	instance->vpu.core_id =3D SCP_IPI_VDEC_CORE;
> +	instance->vpu.id =3D mtk_vcodec_fw_get_ipi(ctx->dev->fw_handler->type, =
MTK_VDEC_LAT0);
> +	instance->vpu.core_id =3D mtk_vcodec_fw_get_ipi(ctx->dev->fw_handler->t=
ype, MTK_VDEC_CORE);

Now was a good time to use a local variable.

> =C2=A0	instance->vpu.ctx =3D ctx;
> =C2=A0	instance->vpu.codec_type =3D ctx->current_codec;
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h26=
4_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec=
_h264_req_multi_if.c
> index 5b25e1679b51..50f81f1cb616 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_m=
ulti_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_m=
ulti_if.c
> @@ -1212,8 +1212,8 @@ static int vdec_h264_slice_init(struct mtk_vcodec_d=
ec_ctx *ctx)
> =C2=A0
> =C2=A0	inst->ctx =3D ctx;
> =C2=A0
> -	inst->vpu.id =3D SCP_IPI_VDEC_LAT;
> -	inst->vpu.core_id =3D SCP_IPI_VDEC_CORE;
> +	inst->vpu.id =3D mtk_vcodec_fw_get_ipi(ctx->dev->fw_handler->type, MTK_=
VDEC_LAT0);
> +	inst->vpu.core_id =3D mtk_vcodec_fw_get_ipi(ctx->dev->fw_handler->type,=
 MTK_VDEC_CORE);

Same and below.

> =C2=A0	inst->vpu.ctx =3D ctx;
> =C2=A0	inst->vpu.codec_type =3D ctx->current_codec;
> =C2=A0	inst->vpu.capture_type =3D ctx->capture_fourcc;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hev=
c_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec=
_hevc_req_multi_if.c
> index 2725db882e5b..80fbd0309b9e 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_m=
ulti_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_m=
ulti_if.c
> @@ -863,8 +863,8 @@ static int vdec_hevc_slice_init(struct mtk_vcodec_dec=
_ctx *ctx)
> =C2=A0
> =C2=A0	inst->ctx =3D ctx;
> =C2=A0
> -	inst->vpu.id =3D SCP_IPI_VDEC_LAT;
> -	inst->vpu.core_id =3D SCP_IPI_VDEC_CORE;
> +	inst->vpu.id =3D mtk_vcodec_fw_get_ipi(ctx->dev->fw_handler->type, MTK_=
VDEC_LAT0);
> +	inst->vpu.core_id =3D mtk_vcodec_fw_get_ipi(ctx->dev->fw_handler->type,=
 MTK_VDEC_CORE);
> =C2=A0	inst->vpu.ctx =3D ctx;
> =C2=A0	inst->vpu.codec_type =3D ctx->current_codec;
> =C2=A0	inst->vpu.capture_type =3D ctx->capture_fourcc;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8=
_req_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_re=
q_if.c
> index 232ef3bd246a..764f4d4054c0 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if=
.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if=
.c
> @@ -281,8 +281,8 @@ static int vdec_vp8_slice_init(struct mtk_vcodec_dec_=
ctx *ctx)
> =C2=A0
> =C2=A0	inst->ctx =3D ctx;
> =C2=A0
> -	inst->vpu.id =3D SCP_IPI_VDEC_LAT;
> -	inst->vpu.core_id =3D SCP_IPI_VDEC_CORE;
> +	inst->vpu.id =3D mtk_vcodec_fw_get_ipi(ctx->dev->fw_handler->type, MTK_=
VDEC_LAT0);
> +	inst->vpu.core_id =3D mtk_vcodec_fw_get_ipi(ctx->dev->fw_handler->type,=
 MTK_VDEC_CORE);
> =C2=A0	inst->vpu.ctx =3D ctx;
> =C2=A0	inst->vpu.codec_type =3D ctx->current_codec;
> =C2=A0	inst->vpu.capture_type =3D ctx->capture_fourcc;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> index 47c302745c1d..0279f66efdf9 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> @@ -1855,8 +1855,8 @@ static int vdec_vp9_slice_init(struct mtk_vcodec_de=
c_ctx *ctx)
> =C2=A0		return -ENOMEM;
> =C2=A0
> =C2=A0	instance->ctx =3D ctx;
> -	instance->vpu.id =3D SCP_IPI_VDEC_LAT;
> -	instance->vpu.core_id =3D SCP_IPI_VDEC_CORE;
> +	instance->vpu.id =3D mtk_vcodec_fw_get_ipi(ctx->dev->fw_handler->type, =
MTK_VDEC_LAT0);
> +	instance->vpu.core_id =3D mtk_vcodec_fw_get_ipi(ctx->dev->fw_handler->t=
ype, MTK_VDEC_CORE);
> =C2=A0	instance->vpu.ctx =3D ctx;
> =C2=A0	instance->vpu.codec_type =3D ctx->current_codec;

regards,
Nicolas

--=-agtb3hdFQL7Q1Coas2yl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSoBDQAKCRDZQZRRKWBy
9DVkAQDnD0cIVBuy8fqqTjaFanvxBSDk2WhAWgPraJrW4TXi+gEA+yb4nxiNvPA3
rfTEo8s0CloszhQsKSrUVgAuRKlRGA0=
=RRvX
-----END PGP SIGNATURE-----

--=-agtb3hdFQL7Q1Coas2yl--

