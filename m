Return-Path: <linux-media+bounces-59981-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEZUF1kc8mm/oAEAu9opvQ
	(envelope-from <linux-media+bounces-59981-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 16:57:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DC149661B
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 16:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CF06302DE1A
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 14:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1234343D83;
	Wed, 29 Apr 2026 14:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gG0Kz0fi"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DEA30DEB2;
	Wed, 29 Apr 2026 14:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777474600; cv=none; b=CKlhL+QK0Fie+uZekkjmH1uOydLmwrJ+FQFKyclmk2gepjgO/zwZ/Q4BekmCgpVF+wc9VJLTZLJ5LsJsbpQ3XlPg/LX4eqEsIynOGf0mtll5EtitB2KVe2A7Sa+Pf0HHoig4mPjAqtZ+c89f/ytYOgpFkoRu/XVWy/QtxxrmitQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777474600; c=relaxed/simple;
	bh=Lo2Ji87sJE8b3XVFP/wrrwsReU6/JgBBw/9VujpN3CI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y7krPmoNuEtkcXpzGizVh3O05YwfUbQ9Qv12y45X1LZ9FvKQmz/MEsaN1KyGl0XgNCvhwbjzAeOUesdqIsulsO1lFNZEL6Gk9/5EBuPDP59bnO80s/GXwowdvZeixK26hD1VyE10scCIvOVS1rlYCDwKeemdVVc1mcsNYvIong8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gG0Kz0fi; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777474596;
	bh=Lo2Ji87sJE8b3XVFP/wrrwsReU6/JgBBw/9VujpN3CI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gG0Kz0fiz34GmHFDFcgkxuzNV1aWSoxGlsexUhk3zBH3LfTKNZL9ad/Gy6SnfUnaM
	 XvO4oosnGvjiIGplGiyfDF2KBXMvI12uMt4dPGrvuMsNxsjRrryQJhL8Cu7isDOWCL
	 26Gf4GQ1V+5PFbbrYKb6Ubz/GUUWSVfTl62M327YVOmmO9ApzPmINjnFYFwUuQvSN7
	 O/eNYr+VszQALyXTDBJkFHpk/z98GfMHHpuh9QI/CVuzAgojAr4XC8K4kQjFwH1qfe
	 9z4yyeZVgLd3lZQs6O4g/QiEyBwXCQRdccptUiKhKBYuhNJSigvhzsLvBohZoywKgZ
	 Q1BKBe1MVaqLg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 02B5317E1201;
	Wed, 29 Apr 2026 16:56:33 +0200 (CEST)
Message-ID: <62415d732ccaed02bf12a8e68e10ac8d58b87fa9.camel@collabora.com>
Subject: Re: [PATCH v6 4/6] media: mediatek: encoder: Add support for VCP
 encode process
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Irui Wang <irui.wang@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	angelogioacchino.delregno@collabora.com, Tiffany Lin
 <tiffany.lin@mediatek.com>,  kyrie wu <kyrie.wu@mediatek.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Maoguang Meng	
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Date: Wed, 29 Apr 2026 10:56:33 -0400
In-Reply-To: <20260423073345.27402-5-irui.wang@mediatek.com>
References: <20260423073345.27402-1-irui.wang@mediatek.com>
	 <20260423073345.27402-5-irui.wang@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-nzftFuhX5IZOP4b2FG4X"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 07DC149661B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59981-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[mediatek.com,xs4all.nl,kernel.org,gmail.com,collabora.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:mid,mediatek.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]


--=-nzftFuhX5IZOP4b2FG4X
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 23 avril 2026 =C3=A0 15:33 +0800, Irui Wang a =C3=A9crit=C2=A0:
> Adapt the encoder driver to support VCP firmware interface.
>=20
> Set the encoder driver firmware type to 'VCP'.
> Allocate RC buffers using the VCP device.
> Send the shared memory address to VCP and map the encoder VSI address
> to the CPU address space using the VCP shared memory address.
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
> index 6b69ce44d4bb..2859fe78f67d 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> @@ -500,6 +500,11 @@ static void mtk_vcodec_vcp_release(struct mtk_vcodec=
_fw *fw)
> =C2=A0
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
> @@ -508,6 +513,7 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_vcp_=
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
> index 4e4541b2fc8e..2f6ee0cd15e3 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
> @@ -262,6 +262,9 @@ static int mtk_vcodec_probe(struct platform_device *p=
dev)
> =C2=A0	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp"=
,
> =C2=A0					 &rproc_phandle)) {
> =C2=A0		fw_type =3D SCP;
> +	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vcp",
> +					 &rproc_phandle)) {
> +		fw_type =3D VCP;

Similar comment on the patchset you depend on, its third firmware type, and=
 time
to cleanup. The of_device_get_match_data() should be sufficient for this si=
mple
case, there is not reason for custom DT parsing here. PLace the fw_type in =
the
pdata, and move of_device_get_match_data() call earlier.

Please apply the same logic for the entire patchset. Every bit of informati=
on
that is purely static to your device is better placed in the pdata then thr=
ough
addition of if/else conditions all over the place. The pdata can also have =
ops
in it, letting easily firmware specific code without having to do if/else
everywhere.

Nicolas

> =C2=A0	} else {
> =C2=A0		dev_err(&pdev->dev, "[MTK VCODEC] Could not get venc IPI device")=
;
> =C2=A0		return -ENODEV;
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_com=
mon_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_=
if.c
> index 050b827f0fd0..d981155aeb8c 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.=
c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.=
c
> @@ -480,8 +480,13 @@ static void venc_free_rc_buf(struct venc_inst *inst,
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
> @@ -530,12 +535,18 @@ static int venc_alloc_rc_buf(struct venc_inst *inst=
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
> index 7772b8442ebc..0f4693e04a9f 100644
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

--=-nzftFuhX5IZOP4b2FG4X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafIcIQAKCRDZQZRRKWBy
9BU9AQDeUjq51d94hOsP4bLCICEILqQMmlqhauW9PeGwGanPCgD/b+iImcIisuLc
nG/smgBpepbKYTKHWuNXD4xfU5G+9gQ=
=obp3
-----END PGP SIGNATURE-----

--=-nzftFuhX5IZOP4b2FG4X--

