Return-Path: <linux-media+bounces-47152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 087A5C5F643
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 22:39:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A42604E1219
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 21:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB2935C191;
	Fri, 14 Nov 2025 21:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kgGuD/S3"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B0D2F0690;
	Fri, 14 Nov 2025 21:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763156354; cv=none; b=Pr6At9x7w3wTEonHeaHSsjwQpJCqH7zbxSvzgErtQiO7JtnQlxnXHzXJtPLl+Ni6aZ9GC6ezk+0E9EVEoOw0x1X7ZMJF28Vat8HeHsb3Yg+QwtBsfE//byxO7O21xC3Jmi6QeDnZN/m8Kkoki6PD5hB4zVJaEvx337HWceqcCQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763156354; c=relaxed/simple;
	bh=3icBXaIjkkmGJus6zc+62rhTqrwbaHXApyWJC0TMgV8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gQ3LDO3W6o/LTm2OA6CsuURA+59vcrsf9Q84dKW4bI++cOPnhWLbuIiaat3fpFbpb+BAC1jGV/okxdjUU0P5yS/lqBfW0x6p5xDVCDNF15aGQO8m4ylZj+Oayz6OTCG05EasQr/1AQNtY7xnEOuxuD5UkF4DzLH1qh3JLENCang=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kgGuD/S3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763156350;
	bh=3icBXaIjkkmGJus6zc+62rhTqrwbaHXApyWJC0TMgV8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=kgGuD/S3uMVEW6q7G8QfUh9dqhva1To6XZ1DlwzDMtbDgkXoKuqT9AoxMFr6KZUHv
	 Sg6LmFiQsx/qSZ6NiKVRGCyUqCRWBFCR0DC9NJb+S3Db6EVpFqScUj8MRMhyg4gw0z
	 smx/2cVuVB1TSf8CdMJ7ogyHrrFdQvaPJ0KZJzq2wmd7wfj4sahQgFet1xu0S0eFWA
	 EOwDf9vRT/8U2C0w0gZ7MLlgxY+3LIPTVQKAnTwyY1jHIGcl7/fuuwsSdbm+r0+o04
	 fTPVW6cExRULU08xB4NyjUoN4VvlXRreqIrcwMPYc8p00e1xLAZWGk3JifF3xGSvjW
	 mE61NMnCWOyEg==
Received: from [IPv6:2606:6d00:11:696f::c41] (unknown [IPv6:2606:6d00:11:696f::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 382DF17E013C;
	Fri, 14 Nov 2025 22:39:08 +0100 (CET)
Message-ID: <38bf1d78ab2d60ce31698223bdbc569fa8813134.camel@collabora.com>
Subject: Re: [PATCH v3 3/6] media: mediatek: encoder: Add support for VCP
 encode process
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
Date: Fri, 14 Nov 2025 16:39:07 -0500
In-Reply-To: <20250814085642.17343-4-kyrie.wu@mediatek.com>
References: <20250814085642.17343-1-kyrie.wu@mediatek.com>
	 <20250814085642.17343-4-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-RJGE2iN2mzFCSOVJdVo4"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-RJGE2iN2mzFCSOVJdVo4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 14 ao=C3=BBt 2025 =C3=A0 16:56 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> From: Irui Wang <irui.wang@mediatek.com>
>=20
> When encoding by VCP interface, encoder driver need change to VCP path:

Please use something like:

Adapt the encoder driver to support VCP firmwares interface.

> Firstly, set encoder driver fw type to 'VCP'. Then, allocate RC buffers

Drop "Firstly, ", go straight to the verb.

Set the encoder driver fw type ...

> by the VCP device. Finally, send the shared memory address into VCP and
> map the encoder vsi address by the VCP shared memory address.

This one is a little too broken for me, please rework this comment. When we=
 say
"map address", we don't expect that to be mapped by another address. "map" =
is
the action, so I suppose you wanted to specify where it is mapped to ? CPU
address space or device address space ?

Please rework this message.

>=20
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
> =C2=A0.../mediatek/vcodec/common/mtk_vcodec_fw.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 6 +++++
> =C2=A0.../mediatek/vcodec/common/mtk_vcodec_fw.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 +
> =C2=A0.../vcodec/common/mtk_vcodec_fw_priv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0.../vcodec/common/mtk_vcodec_fw_vcp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++++
> =C2=A0.../vcodec/encoder/mtk_vcodec_enc_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 3 +++
> =C2=A0.../vcodec/encoder/venc/venc_common_if.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 23 ++++++++++++++-----
> =C2=A0.../mediatek/vcodec/encoder/venc_vpu_if.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 14 ++++++++++-
> =C2=A07 files changed, 47 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.=
c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
> index 0381acceda25..7a504f093bd8 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
> @@ -105,3 +105,9 @@ int mtk_vcodec_fw_get_type(struct mtk_vcodec_fw *fw)
> =C2=A0	return fw->type;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(mtk_vcodec_fw_get_type);
> +
> +struct device *mtk_vcodec_fw_get_dev(struct mtk_vcodec_fw *fw)
> +{
> +	return fw->ops->get_fw_dev(fw);
> +}
> +EXPORT_SYMBOL_GPL(mtk_vcodec_fw_get_dev);
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.=
h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> index e7304a7dd3e0..56c26b91651e 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> @@ -43,5 +43,6 @@ int mtk_vcodec_fw_ipi_send(struct mtk_vcodec_fw *fw, in=
t id,
> =C2=A0int mtk_vcodec_fw_get_type(struct mtk_vcodec_fw *fw);
> =C2=A0int mtk_vcodec_fw_get_ipi(enum mtk_vcodec_fw_type type, int hw_id);
> =C2=A0int mtk_vcodec_fw_get_venc_ipi(enum mtk_vcodec_fw_type type);
> +struct device *mtk_vcodec_fw_get_dev(struct mtk_vcodec_fw *fw);
> =C2=A0
> =C2=A0#endif /* _MTK_VCODEC_FW_H_ */
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
priv.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h
> index 0a2a9b010244..710c83c871f4 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h
> @@ -29,6 +29,7 @@ struct mtk_vcodec_fw_ops {
> =C2=A0	int (*ipi_send)(struct mtk_vcodec_fw *fw, int id, void *buf,
> =C2=A0			unsigned int len, unsigned int wait);
> =C2=A0	void (*release)(struct mtk_vcodec_fw *fw);
> +	struct device *(*get_fw_dev)(struct mtk_vcodec_fw *fw);
> =C2=A0};
> =C2=A0
> =C2=A0#if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VCODEC_VPU)
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> index f6b93e1bcbf3..646e3944dd4f 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> @@ -432,6 +432,11 @@ static void mtk_vcodec_vcp_release(struct mtk_vcodec=
_fw *fw)
> =C2=A0{
> =C2=A0}
> =C2=A0
> +static struct device *mtk_vcodec_vcp_get_fw_dev(struct mtk_vcodec_fw *fw=
)
> +{
> +	return fw->vcp->vcp_device->dev;
> +}
> +
> =C2=A0static const struct mtk_vcodec_fw_ops mtk_vcodec_vcp_msg =3D {
> =C2=A0	.load_firmware =3D mtk_vcodec_vcp_load_firmware,
> =C2=A0	.get_vdec_capa =3D mtk_vcodec_vcp_get_vdec_capa,
> @@ -440,6 +445,7 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_vcp_=
msg =3D {
> =C2=A0	.ipi_register =3D mtk_vcodec_vcp_set_ipi_register,
> =C2=A0	.ipi_send =3D mtk_vcodec_vcp_ipi_send,
> =C2=A0	.release =3D mtk_vcodec_vcp_release,
> +	.get_fw_dev =3D mtk_vcodec_vcp_get_fw_dev,
> =C2=A0};
> =C2=A0
> =C2=A0struct mtk_vcodec_fw *mtk_vcodec_fw_vcp_init(void *priv, enum mtk_v=
codec_fw_use fw_use)
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_en=
c_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv=
.c
> index a1e4483abcdb..bb913dfe5f04 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
> @@ -252,6 +252,9 @@ static int mtk_vcodec_probe(struct platform_device *p=
dev)
> =C2=A0	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp"=
,
> =C2=A0					 &rproc_phandle)) {
> =C2=A0		fw_type =3D SCP;
> +	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vcp",
> +					 &rproc_phandle)) {
> +		fw_type =3D VCP;
> =C2=A0	} else {
> =C2=A0		dev_err(&pdev->dev, "[MTK VCODEC] Could not get venc IPI device")=
;
> =C2=A0		return -ENODEV;
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_com=
mon_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_=
if.c
> index da7cf90bd54b..b28d559285ea 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.=
c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.=
c
> @@ -478,8 +478,13 @@ static void venc_free_rc_buf(struct venc_inst *inst,
> =C2=A0{
> =C2=A0	int i;
> =C2=A0	struct device *dev;
> +	struct mtk_vcodec_fw *fw =3D inst->ctx->dev->fw_handler;
> +
> +	if (mtk_vcodec_fw_get_type(fw) =3D=3D VCP)
> +		dev =3D mtk_vcodec_fw_get_dev(fw);
> +	else
> +		dev =3D &inst->ctx->dev->plat_dev->dev;
> =C2=A0
> -	dev =3D &inst->ctx->dev->plat_dev->dev;
> =C2=A0	mtk_venc_mem_free(inst, dev, &bufs->rc_code);
> =C2=A0
> =C2=A0	for (i =3D 0; i < core_num; i++)
> @@ -528,12 +533,18 @@ static int venc_alloc_rc_buf(struct venc_inst *inst=
,
> =C2=A0	struct device *dev;
> =C2=A0	void *tmp_va;
> =C2=A0
> -	dev =3D &inst->ctx->dev->plat_dev->dev;
> -	if (mtk_venc_mem_alloc(inst, dev, &bufs->rc_code))
> -		return -ENOMEM;
> +	if (mtk_vcodec_fw_get_type(fw) =3D=3D VCP) {
> +		dev =3D mtk_vcodec_fw_get_dev(fw);
> +		if (mtk_venc_mem_alloc(inst, dev, &bufs->rc_code))
> +			return -ENOMEM;
> +	} else {
> +		dev =3D &inst->ctx->dev->plat_dev->dev;
> +		if (mtk_venc_mem_alloc(inst, dev, &bufs->rc_code))
> +			return -ENOMEM;
> =C2=A0
> -	tmp_va =3D mtk_vcodec_fw_map_dm_addr(fw, bufs->rc_code.pa);
> -	memcpy(bufs->rc_code.va, tmp_va, bufs->rc_code.size);
> +		tmp_va =3D mtk_vcodec_fw_map_dm_addr(fw, bufs->rc_code.pa);
> +		memcpy(bufs->rc_code.va, tmp_va, bufs->rc_code.size);
> +	}
> =C2=A0
> =C2=A0	for (i =3D 0; i < core_num; i++) {
> =C2=A0		if (mtk_venc_mem_alloc(inst, dev, &bufs->rc_info[i]))
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c=
 b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> index 537b9955932e..9a90c2271297 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> @@ -8,13 +8,23 @@
> =C2=A0#include "venc_ipi_msg.h"
> =C2=A0#include "venc_vpu_if.h"
> =C2=A0
> +#define VSI_OFFSET_MASK 0x0FFFFFFF
> +
> =C2=A0static void handle_enc_init_msg(struct venc_vpu_inst *vpu, const vo=
id *data)
> =C2=A0{
> =C2=A0	const struct venc_vpu_ipi_msg_init_comm *msg =3D data;
> =C2=A0	struct mtk_vcodec_fw *fw =3D vpu->ctx->dev->fw_handler;
> +	u64 pa_start, vsi_offset;
> =C2=A0
> =C2=A0	vpu->inst_addr =3D msg->init_ack.vpu_inst_addr;
> -	vpu->vsi =3D mtk_vcodec_fw_map_dm_addr(fw, vpu->inst_addr);
> +
> +	if (mtk_vcodec_fw_get_type(fw) =3D=3D VCP) {
> +		pa_start =3D (u64)fw->vcp->iova_addr;
> +		vsi_offset =3D (msg->vpu_vsi_addr & VSI_OFFSET_MASK) - (pa_start & VSI=
_OFFSET_MASK);
> +		vpu->vsi =3D mtk_vcodec_fw_map_dm_addr(fw, ENCODER_MEM) + vsi_offset;
> +	} else {
> +		vpu->vsi =3D mtk_vcodec_fw_map_dm_addr(fw, msg->vpu_vsi_addr);
> +	}
> =C2=A0
> =C2=A0	/* Firmware version field value is unspecified on MT8173. */
> =C2=A0	if (mtk_vcodec_fw_get_type(fw) =3D=3D VPU)
> @@ -155,6 +165,8 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
> =C2=A0	out.base.venc_inst =3D (unsigned long)vpu;
> =C2=A0	if (MTK_ENC_DRV_IS_COMM(vpu->ctx)) {
> =C2=A0		out.codec_type =3D vpu->ctx->q_data[MTK_Q_DATA_DST].fmt->fourcc;
> +		if (mtk_vcodec_fw_get_type(vpu->ctx->dev->fw_handler) =3D=3D VCP)
> +			out.shared_iova =3D vpu->ctx->dev->fw_handler->vcp->iova_addr;
> =C2=A0		msg_size =3D sizeof(struct venc_ap_ipi_msg_init_comm);
> =C2=A0	} else {
> =C2=A0		msg_size =3D sizeof(struct venc_ap_ipi_msg_init);

Code looks fine to me, so just resend with a comprehensible message please.

cheers,
Nicolas

--=-RJGE2iN2mzFCSOVJdVo4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaRehewAKCRDZQZRRKWBy
9FacAQDcXC1+bhx+LAFOQQhwRw7Iubab0rcFfZidc1UlxkgSmwD9FqFGKRsEIm1A
bhNQWalvBqAyg7iEUVaFpICC7gajwQo=
=YiRQ
-----END PGP SIGNATURE-----

--=-RJGE2iN2mzFCSOVJdVo4--

