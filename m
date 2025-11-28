Return-Path: <linux-media+bounces-47882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E86BC9312F
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 21:05:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3C0FB34ADB3
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 20:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938F42D7DE3;
	Fri, 28 Nov 2025 20:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Wa92lpgZ"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CE41E0B9C;
	Fri, 28 Nov 2025 20:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764360311; cv=none; b=H5QIIGaWuXbxjf1mw/j1zf1uxGJcpIXzxso8r+jR4yrKOSS3tKLZKWI4Vnva+4XJU3QqBbrqnv51yn4YHXk3c+CYENzPR0FCZq11YD6KlYNpPpBTM+u3YwTQU5gBGArdgxPfr+sCQ0oKRCO8MEe4skrsoLjYXqgfBCPeqMRCX3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764360311; c=relaxed/simple;
	bh=VjoV6gpry4RYrUpUB+biOExP5E7Izn1G2x7SoQ5EGD4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SSwNSjD0hDkaCspP3JLm+hdd+cxQG2fJA+G6JD9L+7Gdk/H8tGuaRjqsEcEl75ArNxqXi58eB6ShfBO+JSEQbnYOkxxed0QZ+BtuvyjT5zSJQOgC45lJWVx4O11MLHSAxUT8vvqic+j/LhdsN3eJOKyndua9Mb+P0u5EE1gt1NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Wa92lpgZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764360304;
	bh=VjoV6gpry4RYrUpUB+biOExP5E7Izn1G2x7SoQ5EGD4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Wa92lpgZaz/ECSlN6NxX19dCt2V8Wp0kXssWGJ4XJ7IWr0pGLAi58NX01O9ZVlN5T
	 mL5FmRuQxJ/q+GL/NbrZlryBKByHjWanfxF4wg/7pJCFeVaFMT+lTy2Ob7L8IN4ExI
	 sHxmi2C1Lqm1CXqdjA33hmRanZdDF5Y6ahoR4LG0mjOwi5um7nNHtZO3XKTo1g5ZYv
	 kYU2xZo/quhyT8V55COtKNNh+U7IOmrm1BVeyDcnTeCN9dQrcnxA6C582ZdVRkcoh7
	 nuRDCA7JjO1Y7JQiU6PfSUX0e+3X1XVWD3KD+tLhP9O20sBppF0ON5hTiG+IyLm0M8
	 0f/X/aQSzu8IQ==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CEBFC17E013C;
	Fri, 28 Nov 2025 21:05:02 +0100 (CET)
Message-ID: <f606c4f24df8392a5aab9205eaf1627c8f30bad4.camel@collabora.com>
Subject: Re: [PATCH v2 04/14] media: mediatek: vcodec: add driver to support
 vcp encoder
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
Date: Fri, 28 Nov 2025 15:05:01 -0500
In-Reply-To: <20250815085232.30240-5-yunfei.dong@mediatek.com>
References: <20250815085232.30240-1-yunfei.dong@mediatek.com>
	 <20250815085232.30240-5-yunfei.dong@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-vmuWrJ7jZ/55kt51eeVZ"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-vmuWrJ7jZ/55kt51eeVZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 15 ao=C3=BBt 2025 =C3=A0 16:52 +0800, Yunfei Dong a =C3=A9crit=
=C2=A0:
> Encoder also need to call vcp interface to communicate with vcp,
> add driver to support encoder.
>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> =C2=A0.../vcodec/common/mtk_vcodec_fw_vcp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 40 +++++++++++++++----
> =C2=A0.../vcodec/common/mtk_vcodec_fw_vcp.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0.../mediatek/vcodec/encoder/mtk_vcodec_enc.c=C2=A0 |=C2=A0 1 -
> =C2=A0.../mediatek/vcodec/encoder/mtk_vcodec_enc.h=C2=A0 |=C2=A0 2 +
> =C2=A04 files changed, 36 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> index 227310c116c6..c9e5cde40aef 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> @@ -13,6 +13,8 @@
> =C2=A0
> =C2=A0#include "../decoder/mtk_vcodec_dec_drv.h"
> =C2=A0#include "../decoder/vdec_ipi_msg.h"
> +#include "../encoder/mtk_vcodec_enc.h"
> +#include "../encoder/mtk_vcodec_enc_drv.h"
> =C2=A0#include "mtk_vcodec_fw_priv.h"
> =C2=A0
> =C2=A0#define IPI_SEND_TIMEOUT_MS=C2=A0 100U
> @@ -189,8 +191,8 @@ static int mtk_vcodec_vcp_msg_ipi_send(struct mtk_vco=
dec_fw *fw, int id, void *b
> =C2=A0	}
> =C2=A0
> =C2=A0	mutex_lock(msg_mutex);
> -	feature_id =3D VDEC_FEATURE_ID;
> -	mailbox_id =3D IPI_OUT_VDEC_1;
> +	feature_id =3D (fw->fw_use =3D=3D ENCODER) ? VENC_FEATURE_ID : VDEC_FEA=
TURE_ID;
> +	mailbox_id =3D (fw->fw_use =3D=3D ENCODER) ? IPI_OUT_VENC_0 : IPI_OUT_V=
DEC_1;
> =C2=A0
> =C2=A0	timeout_jiffies =3D jiffies + msecs_to_jiffies(VCP_SYNC_TIMEOUT_MS=
);
> =C2=A0	while (!vcp_device->ops->vcp_is_ready(feature_id)) {
> @@ -300,10 +302,10 @@ static int mtk_vcodec_vcp_load_firmware(struct mtk_=
vcodec_fw *fw)
> =C2=A0
> =C2=A0	vcp_device =3D fw->vcp->vcp_device;
> =C2=A0
> -	feature_id =3D VDEC_FEATURE_ID;
> -	mem_id =3D VDEC_MEM_ID;
> -	mailbox_id =3D IPI_IN_VDEC_1;
> -	ipi_id =3D VCP_IPI_LAT_DECODER;
> +	feature_id =3D fw->fw_use =3D=3D ENCODER ? VENC_FEATURE_ID : VDEC_FEATU=
RE_ID;
> +	mem_id =3D fw->fw_use =3D=3D ENCODER ? VENC_MEM_ID : VDEC_MEM_ID;
> +	mailbox_id =3D fw->fw_use =3D=3D ENCODER ? IPI_IN_VENC_0 : IPI_IN_VDEC_=
1;
> +	ipi_id =3D fw->fw_use =3D=3D ENCODER ? VCP_IPI_ENCODER : VCP_IPI_LAT_DE=
CODER;

That is hard to read, please make a branch with a scope, something like:

if (fw->fw_use =3D=3D ENCODER) {
	feature_id =3D VENC_FEATURE_ID;
	mem_id =3D VENC_MEM_ID;
	mailbox_id =3D IPI_IN_VENC_0;
	ipi_id =3D VCP_IPI_ENCODER;
} else {
	feature_id =3D VDEC_FEATURE_ID;
	mem_id =3D VDEC_MEM_ID;
	mailbox_id =3D IPI_IN_VDEC_1;
	ipi_id =3D VCP_IPI_LAT_DECODER;
}

Same applies elsewhere.

> =C2=A0
> =C2=A0	ret =3D mtk_vcp_mbox_ipc_register(vcp_get_ipidev(vcp_device), mail=
box_id,
> =C2=A0					mtk_vcodec_vcp_msg_ack_isr, fw, &fw->vcp->share_data);
> @@ -322,6 +324,20 @@ static int mtk_vcodec_vcp_load_firmware(struct mtk_v=
codec_fw *fw)
> =C2=A0	mutex_init(&fw->vcp->ipi_desc[ipi_id].lock);
> =C2=A0	mutex_init(&fw->vcp->ipi_mutex);
> =C2=A0
> +	if (fw->fw_use =3D=3D ENCODER) {
> +		kthread_run(mtk_vcodec_vcp_msg_process_thread, fw, "vcp_enc_msq_thread=
");
> +
> +		fw->vcp->vsi_addr =3D vcp_device->ops->vcp_get_mem_virt(mem_id);
> +		fw->vcp->vsi_size =3D vcp_device->ops->vcp_get_mem_size(mem_id);
> +		fw->vcp->iova_addr =3D vcp_device->ops->vcp_get_mem_iova(mem_id);
> +
> +		dev_dbg(&fw->pdev->dev, "enc vcp init done =3D> va: %p size:0x%x iova:=
%pad.\n",
> +			fw->vcp->vsi_addr, fw->vcp->vsi_size, &fw->vcp->iova_addr);
> +
> +		init_waitqueue_head(&fw->vcp->msg_wq[VCP_IPI_ENCODER]);
> +		return 0;
> +	}
> +
> =C2=A0	kthread_run(mtk_vcodec_vcp_msg_process_thread, fw, "vcp_vdec_msq_t=
hread");
> =C2=A0
> =C2=A0	fw->vcp->vsi_addr =3D vcp_device->ops->vcp_get_mem_virt(mem_id);
> @@ -345,6 +361,11 @@ static unsigned int mtk_vcodec_vcp_get_vdec_capa(str=
uct mtk_vcodec_fw *fw)
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MTK_VDEC_IS_SUPPORT_10BIT | M=
TK_VDEC_IS_SUPPORT_EXT;
> =C2=A0}
> =C2=A0
> +static unsigned int mtk_vcodec_vcp_get_venc_capa(struct mtk_vcodec_fw *f=
w)
> +{
> +	return MTK_VENC_4K_CAPABILITY_ENABLE;
> +}
> +
> =C2=A0static void *mtk_vcodec_vcp_dm_addr(struct mtk_vcodec_fw *fw, u32 d=
tcm_dmem_addr)
> =C2=A0{
> =C2=A0	return NULL;
> @@ -396,6 +417,7 @@ static void mtk_vcodec_vcp_release(struct mtk_vcodec_=
fw *fw)
> =C2=A0static const struct mtk_vcodec_fw_ops mtk_vcodec_vcp_msg =3D {
> =C2=A0	.load_firmware =3D mtk_vcodec_vcp_load_firmware,
> =C2=A0	.get_vdec_capa =3D mtk_vcodec_vcp_get_vdec_capa,
> +	.get_venc_capa =3D mtk_vcodec_vcp_get_venc_capa,
> =C2=A0	.map_dm_addr =3D mtk_vcodec_vcp_dm_addr,
> =C2=A0	.ipi_register =3D mtk_vcodec_vcp_set_ipi_register,
> =C2=A0	.ipi_send =3D mtk_vcodec_vcp_ipi_send,
> @@ -409,7 +431,11 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vcp_init(void *p=
riv, enum mtk_vcodec_fw_use
> =C2=A0	struct mtk_vcodec_fw *fw;
> =C2=A0	int i;
> =C2=A0
> -	if (fw_use =3D=3D DECODER) {
> +	if (fw_use =3D=3D ENCODER) {
> +		struct mtk_vcodec_enc_dev *enc_dev =3D priv;
> +
> +		plat_dev =3D enc_dev->plat_dev;
> +	} else if (fw_use =3D=3D DECODER) {
> =C2=A0		struct mtk_vcodec_dec_dev *dec_dev =3D priv;
> =C2=A0
> =C2=A0		plat_dev =3D dec_dev->plat_dev;
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vcp.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
> index 40f5481d1889..53080ed12c69 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
> @@ -16,6 +16,7 @@ typedef void (*vcp_ipi_handler_t) (void *data, unsigned=
 int len, void *priv);
> =C2=A0
> =C2=A0/* enum mtk_vcp_ipi_index - index used to separate different hardwa=
re */
> =C2=A0enum mtk_vcp_ipi_index {
> +	VCP_IPI_ENCODER,
> =C2=A0	VCP_IPI_LAT_DECODER,
> =C2=A0	VCP_IPI_CORE_DECODER,
> =C2=A0	VCP_IPI_MAX,
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_en=
c.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> index a01dc25a7699..dcafb1303c29 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> @@ -26,7 +26,6 @@
> =C2=A0
> =C2=A0#define MTK_DEFAULT_FRAMERATE_NUM 1001
> =C2=A0#define MTK_DEFAULT_FRAMERATE_DENOM 30000
> -#define MTK_VENC_4K_CAPABILITY_ENABLE BIT(0)
> =C2=A0
> =C2=A0static void mtk_venc_worker(struct work_struct *work);
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_en=
c.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h
> index 908d8179b2d2..84156c102d8d 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h
> @@ -23,6 +23,8 @@
> =C2=A0#define MTK_VENC_IRQ_STATUS_OFFSET	0x05C
> =C2=A0#define MTK_VENC_IRQ_ACK_OFFSET	0x060
> =C2=A0
> +#define MTK_VENC_4K_CAPABILITY_ENABLE BIT(0)
> +
> =C2=A0/**
> =C2=A0 * struct mtk_video_enc_buf - Private data related to each VB2 buff=
er.
> =C2=A0 * @m2m_buf:	M2M buffer

regards,
Nicolas

--=-vmuWrJ7jZ/55kt51eeVZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSoAbQAKCRDZQZRRKWBy
9FB4AQCO6hy81JDlIpJ5zEoWPQaHY4RzUwev1C5dJKtK3pgawgD/Sb2uVUUtO/m2
he0tHxKOv9EZRmuEUus9N1LV5g6kOA0=
=3xq7
-----END PGP SIGNATURE-----

--=-vmuWrJ7jZ/55kt51eeVZ--

