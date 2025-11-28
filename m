Return-Path: <linux-media+bounces-47884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 622F3C9316A
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 21:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1D423A8409
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 20:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5657E2DA777;
	Fri, 28 Nov 2025 20:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EC+jWtq8"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3F426C3BE;
	Fri, 28 Nov 2025 20:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764360778; cv=none; b=HEc5FSp+l5oawowGl7hpc4qk4qNp3g0c4UpEZJNGQ/cYOAcpQYn2VaDQRhYx1UVmL7nZ0RCIU/qtmZwPvMI3VFyKoNuxNlneSjhJ7ZJloszjQfBBWoT6diMSmmWPPT1cfPzSrJtros+NPqCN2Og2sX6KVIE1Sylw/Fx5REcaGyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764360778; c=relaxed/simple;
	bh=QHD5WqVNPvpSZDj0LjPN1szupwGd5RHeSbr8QEoxhZU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sz3cn3fxRonHfuZq88OgQDr854b/NAKw2/8r/ZnPF2qq8yRmQV67WQ5kg3oSWjH6oCBiXDm0iB31a2hC1gYxAeM7QRpxYKBnqq3bR4iPoo2VBsG0heDHHJOw4MvDH6PirMqjxbyoGYvwRvBox7wxQXEartElK4B7taYzPYfQx64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EC+jWtq8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764360773;
	bh=QHD5WqVNPvpSZDj0LjPN1szupwGd5RHeSbr8QEoxhZU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=EC+jWtq8k+WDJrfsGIsrhJ8i2hkBCIXvrOAiVLOCV+p6JXRTXhy8KqFb/Gk/MdT/e
	 4pVVlMl/vcowgLJffz0eO9rJoUFhf4MO2ESFePCr80F0wsoX9CYSNGPjK6JWNevZ/J
	 FSU3Koqe8LLK5ZycrgJx7OzSAy1KDNxo7S1lx02GX8+n/IUJJCIq1kJERbGirVQoGi
	 6/S7CNV3FSJn2O7KmzFSTqlIjnBR9EdfkEgTZOcpcewuviUjfeaQLzK30LrLZICcgu
	 YxJA7juARNznpNFN0nM09Xl6TKWuuEyKxDC9KuHglU/izMkTYS1iE4Z42qGXWkuAVO
	 vRYTA4O8pAF9Q==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AE38017E107C;
	Fri, 28 Nov 2025 21:12:51 +0100 (CET)
Message-ID: <7a6ebc8ff0bfa3d71e9bc837254d212b9efdecb4.camel@collabora.com>
Subject: Re: [PATCH v2 06/14] media: mediatek: vcodec: get share memory
 address
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
Date: Fri, 28 Nov 2025 15:12:50 -0500
In-Reply-To: <20250815085232.30240-7-yunfei.dong@mediatek.com>
References: <20250815085232.30240-1-yunfei.dong@mediatek.com>
	 <20250815085232.30240-7-yunfei.dong@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-Uns0k0DFHHjKFF48bLVR"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-Uns0k0DFHHjKFF48bLVR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 15 ao=C3=BBt 2025 =C3=A0 16:52 +0800, Yunfei Dong a =C3=A9crit=
=C2=A0:
> There is only one share memory for vcp architecture, need to
> divide it into many different functions.
>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> =C2=A0.../vcodec/common/mtk_vcodec_fw_vcp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 20 +++++++++++++++++-
> =C2=A0.../vcodec/common/mtk_vcodec_fw_vcp.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 13 ++++++++++++
> =C2=A0.../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 21 ++++++++++++++--=
---
> =C2=A0.../decoder/vdec/vdec_h264_req_multi_if.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 6 +++++-
> =C2=A0.../decoder/vdec/vdec_hevc_req_multi_if.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 7 +++++--
> =C2=A0.../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 16 ++++++++++----
> =C2=A0.../mediatek/vcodec/decoder/vdec_vpu_if.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 7 +++++--
> =C2=A07 files changed, 75 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> index c9e5cde40aef..f6b93e1bcbf3 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> @@ -366,8 +366,26 @@ static unsigned int mtk_vcodec_vcp_get_venc_capa(str=
uct mtk_vcodec_fw *fw)
> =C2=A0	return MTK_VENC_4K_CAPABILITY_ENABLE;
> =C2=A0}
> =C2=A0
> -static void *mtk_vcodec_vcp_dm_addr(struct mtk_vcodec_fw *fw, u32 dtcm_d=
mem_addr)
> +static void *mtk_vcodec_vcp_dm_addr(struct mtk_vcodec_fw *fw, u32 mem_ty=
pe)
> =C2=A0{
> +	unsigned char *vsi_core =3D fw->vcp->vsi_core_addr;
> +
> +	switch (mem_type) {
> +	case ENCODER_MEM:
> +	case VCODEC_LAT_MEM:
> +		return fw->vcp->vsi_addr;
> +	case VCODEC_CORE_MEM:
> +		return vsi_core;
> +	case VP9_FRAME_MEM:
> +		return vsi_core + VCODEC_VSI_LEN;
> +	case AV1_CDF_MEM:
> +		return vsi_core + VCODEC_VSI_LEN + VP9_FRAME_SIZE;
> +	case AV1_IQ_MEM:
> +		return vsi_core + VCODEC_VSI_LEN + VP9_FRAME_SIZE + AV1_CDF_SIZE;
> +	default:
> +		break;
> +	}
> +
> =C2=A0	return NULL;
> =C2=A0}
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vcp.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
> index 53080ed12c69..54df468f301b 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
> @@ -13,6 +13,19 @@ typedef void (*vcp_ipi_handler_t) (void *data, unsigne=
d int len, void *priv);
> =C2=A0#define VCP_SHARE_BUF_SIZE 64
> =C2=A0
> =C2=A0#define VCODEC_VSI_LEN (0x2000)
> +#define VP9_FRAME_SIZE (0x1000)
> +#define AV1_CDF_SIZE (0xFE80)
> +#define AV1_IQ_TABLE_SIZE (0x12200)
> +
> +/* enum mtk_vcp_mem_type - memory type for different hardware */
> +enum mtk_vcp_mem_type {
> +	ENCODER_MEM,
> +	VCODEC_LAT_MEM,
> +	VCODEC_CORE_MEM,
> +	VP9_FRAME_MEM,
> +	AV1_CDF_MEM,
> +	AV1_IQ_MEM,
> +};
> =C2=A0
> =C2=A0/* enum mtk_vcp_ipi_index - index used to separate different hardwa=
re */
> =C2=A0enum mtk_vcp_ipi_index {
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av=
1_req_lat_if.c
> index 618064001883..2b2173062cb0 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> @@ -774,8 +774,11 @@ static int vdec_av1_slice_init_cdf_table(struct vdec=
_av1_slice_instance *instanc
> =C2=A0
> =C2=A0	ctx =3D instance->ctx;
> =C2=A0	vsi =3D instance->vpu.vsi;
> -	remote_cdf_table =3D mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
> -						=C2=A0=C2=A0=C2=A0=C2=A0 (u32)vsi->cdf_table_addr);
> +	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) =3D=3D VCP)
> +		remote_cdf_table =3D mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, A=
V1_CDF_MEM);
> +	else
> +		remote_cdf_table =3D mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
> +							=C2=A0=C2=A0=C2=A0=C2=A0 (u32)vsi->cdf_table_addr);

Would be nicer if you didn't have to do that. Can you add a hlper that retu=
rns
the table ID based on the fw_handler type ?

Nicolas

> =C2=A0	if (IS_ERR(remote_cdf_table)) {
> =C2=A0		mtk_vdec_err(ctx, "failed to map cdf table\n");
> =C2=A0		return PTR_ERR(remote_cdf_table);
> @@ -805,8 +808,11 @@ static int vdec_av1_slice_init_iq_table(struct vdec_=
av1_slice_instance *instance
> =C2=A0
> =C2=A0	ctx =3D instance->ctx;
> =C2=A0	vsi =3D instance->vpu.vsi;
> -	remote_iq_table =3D mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
> -						=C2=A0=C2=A0=C2=A0 (u32)vsi->iq_table_addr);
> +	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) =3D=3D VCP)
> +		remote_iq_table =3D mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, AV=
1_IQ_MEM);
> +	else
> +		remote_iq_table =3D mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
> +							=C2=A0=C2=A0=C2=A0 (u32)vsi->iq_table_addr);
> =C2=A0	if (IS_ERR(remote_iq_table)) {
> =C2=A0		mtk_vdec_err(ctx, "failed to map iq table\n");
> =C2=A0		return PTR_ERR(remote_iq_table);
> @@ -1905,7 +1911,12 @@ static int vdec_av1_slice_init(struct mtk_vcodec_d=
ec_ctx *ctx)
> =C2=A0		goto error_vsi;
> =C2=A0	}
> =C2=A0	instance->init_vsi =3D vsi;
> -	instance->core_vsi =3D mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, =
(u32)vsi->core_vsi);
> +	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) =3D=3D VCP)
> +		instance->core_vsi =3D
> +			mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, VCODEC_CORE_MEM);
> +	else
> +		instance->core_vsi =3D
> +			mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, (u32)vsi->core_vsi);
> =C2=A0
> =C2=A0	if (!instance->core_vsi) {
> =C2=A0		mtk_vdec_err(ctx, "failed to get AV1 core vsi\n");
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h26=
4_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec=
_h264_req_multi_if.c
> index 50f81f1cb616..6b354d30910c 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_m=
ulti_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_m=
ulti_if.c
> @@ -1230,7 +1230,11 @@ static int vdec_h264_slice_init(struct mtk_vcodec_=
dec_ctx *ctx)
> =C2=A0		vsi_size =3D round_up(vsi_size, VCODEC_DEC_ALIGNED_64);
> =C2=A0		inst->vsi_ext =3D inst->vpu.vsi;
> =C2=A0		temp =3D (unsigned char *)inst->vsi_ext;
> -		inst->vsi_core_ext =3D (struct vdec_h264_slice_vsi_ext *)(temp + vsi_s=
ize);
> +		if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) =3D=3D VCP)
> +			inst->vsi_core_ext =3D
> +				mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, VCODEC_CORE_MEM);
> +		else
> +			inst->vsi_core_ext =3D (struct vdec_h264_slice_vsi_ext *)(temp + vsi_=
size);
> =C2=A0
> =C2=A0		if (inst->ctx->dev->vdec_pdata->hw_arch =3D=3D MTK_VDEC_PURE_SING=
LE_CORE)
> =C2=A0			inst->decode =3D vdec_h264_slice_single_decode_ext;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hev=
c_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec=
_hevc_req_multi_if.c
> index 80fbd0309b9e..ac0deea0df4c 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_m=
ulti_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_m=
ulti_if.c
> @@ -877,8 +877,11 @@ static int vdec_hevc_slice_init(struct mtk_vcodec_de=
c_ctx *ctx)
> =C2=A0
> =C2=A0	vsi_size =3D round_up(sizeof(struct vdec_hevc_slice_vsi), VCODEC_D=
EC_ALIGNED_64);
> =C2=A0	inst->vsi =3D inst->vpu.vsi;
> -	inst->vsi_core =3D
> -		(struct vdec_hevc_slice_vsi *)(((char *)inst->vpu.vsi) + vsi_size);
> +	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) =3D=3D VCP)
> +		inst->vsi_core =3D mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, VCO=
DEC_CORE_MEM);
> +	else
> +		inst->vsi_core =3D
> +			(struct vdec_hevc_slice_vsi *)(((char *)inst->vpu.vsi) + vsi_size);
> =C2=A0
> =C2=A0	inst->resolution_changed =3D true;
> =C2=A0	inst->realloc_mv_buf =3D true;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> index 0279f66efdf9..fa0f406f7726 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> @@ -513,8 +513,12 @@ static int vdec_vp9_slice_init_default_frame_ctx(str=
uct vdec_vp9_slice_instance
> =C2=A0	if (!ctx || !vsi)
> =C2=A0		return -EINVAL;
> =C2=A0
> -	remote_frame_ctx =3D mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
> -						=C2=A0=C2=A0=C2=A0=C2=A0 (u32)vsi->default_frame_ctx);
> +	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) =3D=3D VCP)
> +		remote_frame_ctx =3D
> +			mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, VP9_FRAME_MEM);
> +	else
> +		remote_frame_ctx =3D mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
> +							=C2=A0=C2=A0=C2=A0=C2=A0 (u32)vsi->default_frame_ctx);
> =C2=A0	if (!remote_frame_ctx) {
> =C2=A0		mtk_vdec_err(ctx, "failed to map default frame ctx\n");
> =C2=A0		return -EINVAL;
> @@ -1875,8 +1879,12 @@ static int vdec_vp9_slice_init(struct mtk_vcodec_d=
ec_ctx *ctx)
> =C2=A0		goto error_vsi;
> =C2=A0	}
> =C2=A0	instance->init_vsi =3D vsi;
> -	instance->core_vsi =3D mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
> -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (u32)vsi->core_vsi);
> +	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) =3D=3D VCP)
> +		instance->core_vsi =3D
> +			mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, VCODEC_CORE_MEM);
> +	else
> +		instance->core_vsi =3D mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
> +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (u32)vsi->core_vsi);
> =C2=A0	if (!instance->core_vsi) {
> =C2=A0		mtk_vdec_err(ctx, "failed to get VP9 core vsi\n");
> =C2=A0		ret =3D -EINVAL;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c=
 b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> index 145958206e38..ac10e0dfefb2 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> @@ -18,8 +18,11 @@ static void handle_init_ack_msg(const struct vdec_vpu_=
ipi_init_ack *msg)
> =C2=A0
> =C2=A0	/* mapping VPU address to kernel virtual address */
> =C2=A0	/* the content in vsi is initialized to 0 in VPU */
> -	vpu->vsi =3D mtk_vcodec_fw_map_dm_addr(vpu->ctx->dev->fw_handler,
> -					=C2=A0=C2=A0=C2=A0=C2=A0 msg->vpu_inst_addr);
> +	if (mtk_vcodec_fw_get_type(vpu->ctx->dev->fw_handler) =3D=3D VCP)
> +		vpu->vsi =3D mtk_vcodec_fw_map_dm_addr(vpu->ctx->dev->fw_handler, VCOD=
EC_LAT_MEM);
> +	else
> +		vpu->vsi =3D mtk_vcodec_fw_map_dm_addr(vpu->ctx->dev->fw_handler,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 msg->vpu_inst_addr);
> =C2=A0	vpu->inst_addr =3D msg->vpu_inst_addr;
> =C2=A0
> =C2=A0	mtk_vdec_debug(vpu->ctx, "- vpu_inst_addr =3D 0x%x", vpu->inst_add=
r);

--=-Uns0k0DFHHjKFF48bLVR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSoCQgAKCRDZQZRRKWBy
9CwaAQDzMRuq3rc30WuaR39CwytPX3P0nuFK+R0D0b3Gsl9rywD/arQvb58PD2zm
3AnxrUG3mlUEYMnNP9bEN6U/icoOBQY=
=voZp
-----END PGP SIGNATURE-----

--=-Uns0k0DFHHjKFF48bLVR--

