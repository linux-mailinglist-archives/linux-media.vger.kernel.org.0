Return-Path: <linux-media+bounces-47151-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC5AC5F601
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 22:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 761424E2EED
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 21:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E5735BDD6;
	Fri, 14 Nov 2025 21:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gh68+/oi"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340A535BDB6;
	Fri, 14 Nov 2025 21:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763155873; cv=none; b=GoPN+i3xbPq0XvndCZCgrHRGmH8TeDX6ezj0Gapcz8/JO47eGAs/hY4btWHjlR7A5k38GsP4rlSa3FrtkztuzyWF0oAdU/rQ/owS5uy28lARq7XOi/By1SXwcvMWoqffg+kfoUt+DfHqUX94AUQD97BgmDcm0SL6k0y23lhCKow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763155873; c=relaxed/simple;
	bh=vBIjwMrAujz98IXGy/+MpqpAUTWEIud1pTdYyulmXEo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ji2h0dja2kHMFKOkI141E2ah0fKA9ilRVVKBfcf24eQjNr2ezEPvNdKhl1M7LUlb9hV/N0RGORd0xtmranUUW8gWdqdxC/aIfvjUd7mv6fznE20652HWA6ioy7CqjGTAxKV3XhPV/RcjaBwfZnDMuN2dJIBWiqjPRbYxSlz28d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gh68+/oi; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763155869;
	bh=vBIjwMrAujz98IXGy/+MpqpAUTWEIud1pTdYyulmXEo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gh68+/oiWYGUzIVndg6zqhVS5NtQy7aoNh8M5gkDZ19ARAR1X2mnXPT/c4GNldyfa
	 hL4budVdezcI/rTpSQRPbQEf9uN9X+q7mykayuvkUw4B+wxU+BfahLe0sqFi/n5ytM
	 m2NIfyzrwGqbnPFfSMLAk/sQ9pLvzSrEH4enUWMCHlBMhRzmb49EcTHpSnZhE5sQ94
	 1L3GLoO2CHJ7ZnDt0JCpDZHUYr4JmO10tozn2hspuy7oC1iGg1CjLeHZACkLDQxix3
	 00e5KwpqNfyGG0ej48VW1VF6MzoBHAHrLqQvC7ZvrSn53m2ER2qxXg4cF4r7HJeaFD
	 1dlNEgab2wwJQ==
Received: from [IPv6:2606:6d00:11:696f::c41] (unknown [IPv6:2606:6d00:11:696f::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F043B17E12D5;
	Fri, 14 Nov 2025 22:31:06 +0100 (CET)
Message-ID: <34c7c47e753ef6c53cf4aa7554c8ad05707df166.camel@collabora.com>
Subject: Re: [PATCH v3 2/6] media: mediatek: encoder: Add support for common
 firmware interface
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
Date: Fri, 14 Nov 2025 16:31:05 -0500
In-Reply-To: <20250814085642.17343-3-kyrie.wu@mediatek.com>
References: <20250814085642.17343-1-kyrie.wu@mediatek.com>
	 <20250814085642.17343-3-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-BFBTaEQOkW5nYap+49cW"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-BFBTaEQOkW5nYap+49cW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 14 ao=C3=BBt 2025 =C3=A0 16:56 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> From: Irui Wang <irui.wang@mediatek.com>
>=20
> The existing encoder firmware interface implied just one type of codec:
> H.264. Future encoders may support additional codecs; however adding
> entire sets of interfaces for them is not scalable.
>=20
> Instead, a new "common" firmware interface is defined for non codec
> specific messages. The new messages encapsulate the old ones for
> backward compatibility.
>=20
> This patch adds support for these new messages.
>=20
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../vcodec/encoder/mtk_vcodec_enc_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 3 ++
> =C2=A0.../mediatek/vcodec/encoder/venc_drv_if.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 3 +-
> =C2=A0.../mediatek/vcodec/encoder/venc_ipi_msg.h=C2=A0=C2=A0=C2=A0 | 26 +=
++++++++++++
> =C2=A0.../mediatek/vcodec/encoder/venc_vpu_if.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 37 ++++++++++++-------
> =C2=A04 files changed, 54 insertions(+), 15 deletions(-)
>=20
> diff --git
> a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
> b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
> index b1277bcfcf53..426b1398f815 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
> @@ -16,6 +16,7 @@
> =C2=A0
> =C2=A0#define MTK_ENC_CTX_IS_EXT(ctx) ((ctx)->dev->venc_pdata->uses_ext)
> =C2=A0#define MTK_ENC_IOVA_IS_34BIT(ctx) ((ctx)->dev->venc_pdata->uses_34=
bit)
> +#define MTK_ENC_DRV_IS_COMM(ctx) (((ctx)->dev->venc_pdata-
> >uses_common_fw_iface))
> =C2=A0
> =C2=A0/**
> =C2=A0 * struct mtk_vcodec_enc_pdata - compatible data for each IC
> @@ -29,6 +30,7 @@
> =C2=A0 * @num_output_formats: number of entries in output_formats
> =C2=A0 * @core_id: stand for h264 or vp8 encode index
> =C2=A0 * @uses_34bit: whether the encoder uses 34-bit iova
> + * @uses_common_fw_iface: whether the encoder uses common driver interfa=
ce
> =C2=A0 */
> =C2=A0struct mtk_vcodec_enc_pdata {
> =C2=A0	bool uses_ext;
> @@ -40,6 +42,7 @@ struct mtk_vcodec_enc_pdata {
> =C2=A0	size_t num_output_formats;
> =C2=A0	u8 core_id;
> =C2=A0	bool uses_34bit;
> +	bool uses_common_fw_iface;
> =C2=A0};
> =C2=A0
> =C2=A0/*
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c
> b/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c
> index e83747b8d69a..f8c9349c18c0 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c
> @@ -19,13 +19,14 @@
> =C2=A0int venc_if_init(struct mtk_vcodec_enc_ctx *ctx, unsigned int fourc=
c)
> =C2=A0{
> =C2=A0	int ret =3D 0;
> +	const bool uses_common_fw_iface =3D MTK_ENC_DRV_IS_COMM(ctx);
> =C2=A0
> =C2=A0	switch (fourcc) {
> =C2=A0	case V4L2_PIX_FMT_VP8:
> =C2=A0		ctx->enc_if =3D &venc_vp8_if;
> =C2=A0		break;
> =C2=A0	case V4L2_PIX_FMT_H264:
> -		ctx->enc_if =3D &venc_h264_if;
> +		ctx->enc_if =3D uses_common_fw_iface ? &venc_if :
> &venc_h264_if;
> =C2=A0		break;
> =C2=A0	default:
> =C2=A0		return -EINVAL;
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_ipi_msg.=
h
> b/drivers/media/platform/mediatek/vcodec/encoder/venc_ipi_msg.h
> index bb16d96a7f57..ce3c2c8059fb 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc_ipi_msg.h
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_ipi_msg.h
> @@ -45,6 +45,20 @@ struct venc_ap_ipi_msg_init {
> =C2=A0	uint64_t venc_inst;
> =C2=A0};
> =C2=A0
> +/**
> + * struct venc_ap_ipi_msg_init_comm - AP to VPU init cmd structure
> + * @base: AP to VPU init cmd structure
> + * @codec_type: encoder type
> + * @reserved: reserved field
> + * @shared_iova: shared iova
> + */
> +struct venc_ap_ipi_msg_init_comm {
> +	struct venc_ap_ipi_msg_init base;
> +	u32 codec_type;
> +	u32 reserved;
> +	u64 shared_iova;
> +};
> +
> =C2=A0/**
> =C2=A0 * struct venc_ap_ipi_msg_set_param - AP to VPU set_param cmd struc=
ture
> =C2=A0 * @msg_id:	message id (AP_IPIMSG_XXX_ENC_SET_PARAM)
> @@ -175,6 +189,18 @@ struct venc_vpu_ipi_msg_init {
> =C2=A0	uint32_t venc_abi_version;
> =C2=A0};
> =C2=A0
> +/**
> + * struct venc_vpu_ipi_msg_init_comm - VPU ack AP init cmd structure
> + * @init_ack: AP init cmd structure
> + * @vpu_vsi_addr: VSI address from VPU
> + * @reserved: reserved field
> + */
> +struct venc_vpu_ipi_msg_init_comm {
> +	struct venc_vpu_ipi_msg_init init_ack;
> +	u32 vpu_vsi_addr;
> +	u32 reserved;
> +};
> +
> =C2=A0/**
> =C2=A0 * struct venc_vpu_ipi_msg_set_param - VPU ack AP set_param cmd str=
ucture
> =C2=A0 * @msg_id:	message id (VPU_IPIMSG_XXX_ENC_SET_PARAM_DONE)
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> index 51bb7ee141b9..537b9955932e 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> @@ -10,24 +10,25 @@
> =C2=A0
> =C2=A0static void handle_enc_init_msg(struct venc_vpu_inst *vpu, const vo=
id *data)
> =C2=A0{
> -	const struct venc_vpu_ipi_msg_init *msg =3D data;
> +	const struct venc_vpu_ipi_msg_init_comm *msg =3D data;
> +	struct mtk_vcodec_fw *fw =3D vpu->ctx->dev->fw_handler;
> =C2=A0
> -	vpu->inst_addr =3D msg->vpu_inst_addr;
> -	vpu->vsi =3D mtk_vcodec_fw_map_dm_addr(vpu->ctx->dev->fw_handler,
> -					=C2=A0=C2=A0=C2=A0=C2=A0 msg->vpu_inst_addr);
> +	vpu->inst_addr =3D msg->init_ack.vpu_inst_addr;
> +	vpu->vsi =3D mtk_vcodec_fw_map_dm_addr(fw, vpu->inst_addr);
> =C2=A0
> =C2=A0	/* Firmware version field value is unspecified on MT8173. */
> -	if (mtk_vcodec_fw_get_type(vpu->ctx->dev->fw_handler) =3D=3D VPU)
> +	if (mtk_vcodec_fw_get_type(fw) =3D=3D VPU)
> =C2=A0		return;
> =C2=A0
> =C2=A0	/* Check firmware version. */
> -	mtk_venc_debug(vpu->ctx, "firmware version: 0x%x\n", msg-
> >venc_abi_version);
> -	switch (msg->venc_abi_version) {
> +	mtk_venc_debug(vpu->ctx, "firmware version: 0x%x\n",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg->init_ack.venc_abi_version);
> +	switch (msg->init_ack.venc_abi_version) {
> =C2=A0	case 1:
> =C2=A0		break;
> =C2=A0	default:
> =C2=A0		mtk_venc_err(vpu->ctx, "unhandled firmware version 0x%x\n",
> -			=C2=A0=C2=A0=C2=A0=C2=A0 msg->venc_abi_version);
> +			=C2=A0=C2=A0=C2=A0=C2=A0 msg->init_ack.venc_abi_version);
> =C2=A0		vpu->failure =3D 1;
> =C2=A0		break;
> =C2=A0	}
> @@ -132,7 +133,8 @@ static int vpu_enc_send_msg(struct venc_vpu_inst *vpu=
,
> void *msg,
> =C2=A0int vpu_enc_init(struct venc_vpu_inst *vpu)
> =C2=A0{
> =C2=A0	int status;
> -	struct venc_ap_ipi_msg_init out;
> +	size_t msg_size;
> +	struct venc_ap_ipi_msg_init_comm out;
> =C2=A0
> =C2=A0	init_waitqueue_head(&vpu->wq_hd);
> =C2=A0	vpu->signaled =3D 0;
> @@ -149,9 +151,16 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
> =C2=A0	}
> =C2=A0
> =C2=A0	memset(&out, 0, sizeof(out));
> -	out.msg_id =3D AP_IPIMSG_ENC_INIT;
> -	out.venc_inst =3D (unsigned long)vpu;
> -	if (vpu_enc_send_msg(vpu, &out, sizeof(out))) {
> +	out.base.msg_id =3D AP_IPIMSG_ENC_INIT;
> +	out.base.venc_inst =3D (unsigned long)vpu;
> +	if (MTK_ENC_DRV_IS_COMM(vpu->ctx)) {
> +		out.codec_type =3D vpu->ctx->q_data[MTK_Q_DATA_DST].fmt-
> >fourcc;
> +		msg_size =3D sizeof(struct venc_ap_ipi_msg_init_comm);
> +	} else {
> +		msg_size =3D sizeof(struct venc_ap_ipi_msg_init);
> +	}
> +
> +	if (vpu_enc_send_msg(vpu, &out, msg_size)) {
> =C2=A0		mtk_venc_err(vpu->ctx, "AP_IPIMSG_ENC_INIT fail");
> =C2=A0		return -EINVAL;
> =C2=A0	}
> @@ -260,7 +269,7 @@ static int vpu_enc_encode_32bits(struct venc_vpu_inst
> *vpu,
> =C2=A0		sizeof(struct venc_ap_ipi_msg_enc);
> =C2=A0	struct venc_ap_ipi_msg_enc_ext out;
> =C2=A0
> -	mtk_venc_debug(vpu->ctx, "bs_mode %d ->", bs_mode);
> +	mtk_venc_debug(vpu->ctx, "%s, bs_mode %d ->", __func__, bs_mode);
> =C2=A0
> =C2=A0	memset(&out, 0, sizeof(out));
> =C2=A0	out.base.msg_id =3D AP_IPIMSG_ENC_ENCODE;
> @@ -305,7 +314,7 @@ static int vpu_enc_encode_34bits(struct venc_vpu_inst
> *vpu,
> =C2=A0	struct venc_ap_ipi_msg_enc_ext_34 out;
> =C2=A0	size_t msg_size =3D sizeof(struct venc_ap_ipi_msg_enc_ext_34);
> =C2=A0
> -	mtk_venc_debug(vpu->ctx, "bs_mode %d ->", bs_mode);
> +	mtk_venc_debug(vpu->ctx, "%s, bs_mode %d ->", __func__, bs_mode);
> =C2=A0
> =C2=A0	memset(&out, 0, sizeof(out));
> =C2=A0	out.msg_id =3D AP_IPIMSG_ENC_ENCODE;

--=-BFBTaEQOkW5nYap+49cW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaRefmQAKCRDZQZRRKWBy
9A2wAQD+XGLRKFcXVtiuPuP5MOg9fF2WdigjfKEEny/WcQE9EQEAv2hUndof7kVp
7mkp5jZHADk+IpTHWPuZl5/ePYI3MQc=
=xEJD
-----END PGP SIGNATURE-----

--=-BFBTaEQOkW5nYap+49cW--

