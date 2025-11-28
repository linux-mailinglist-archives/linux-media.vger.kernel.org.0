Return-Path: <linux-media+bounces-47889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B76C931B6
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 21:22:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9D0264E2161
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 20:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338C62DA77F;
	Fri, 28 Nov 2025 20:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="W4JLfOeq"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11E3265CA4;
	Fri, 28 Nov 2025 20:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764361356; cv=none; b=sk05nBm7MKOODkN8luQbiho41u4HnyVpubjiECGNkWgpK9JS4ehnGG/QjAQvfUNJPZQTGe078lrB81SuaP1acULhIrd9VggsaWmdknJiYQLBVCPZ+a3pZ0wIMCzCMyYZadJ6k0QtjJvwgHexbwdnoj1FlUVjwbzpSdbJwWqplik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764361356; c=relaxed/simple;
	bh=JE/fDW/FgbrOOBujgOHnYes4UZ3CG77MqmFcmFIdb0s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nkf8QqrOpL0bNhOl1abQj645K3ZW7BFK3cnA3ylXVshLeVzKQw2n5J5fqSfAjl/0KRz6FKiB/49yTtvgPF75BAMUucJj6dEtZZ14mytNaFIIeCkQeaAerUTSCaWizU5H3Iek5cgJWoCe6EGWOGgEpBUZmsp5KMfnAYkta9/joGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=W4JLfOeq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764361352;
	bh=JE/fDW/FgbrOOBujgOHnYes4UZ3CG77MqmFcmFIdb0s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=W4JLfOeqX45lD3WxIibj6jSvrMWsGkDr1a4wjo4l/iXa3sQpDzzKV0FWs0TR8sRbX
	 ZCbom40hpxBFiAcWYijudMpLnR9IKKsF1yyMMEaI5NJ3y+mZRg7fFwF9I2o0kgAQjo
	 3MRFLqND7JOnDY5UwGr0lYEyNvBZEBveRjBSqFnrnnulGV2luUVVuo521awxhaddxB
	 /wuE76JFeGt9ae3Nmwtn5f5895GAX5PE8wSxCmUGDnIhosrig5GGAaSELB00AvG5FP
	 HXHRTD1UQnbwWBaDwkfGrXcHPF4RQatMEJMeA/lyyoAZCDjp1YtkCj0+bJB2HDyb7D
	 pWju0sFDl+FDg==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E37CF17E10F2;
	Fri, 28 Nov 2025 21:22:30 +0100 (CET)
Message-ID: <41a5a013fa9089a9b86480ab1d4ac19a764f879e.camel@collabora.com>
Subject: Re: [PATCH v2 12/14] media: mediatek: vcodec: send share memory
 address to vcp
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
Date: Fri, 28 Nov 2025 15:22:29 -0500
In-Reply-To: <20250815085232.30240-13-yunfei.dong@mediatek.com>
References: <20250815085232.30240-1-yunfei.dong@mediatek.com>
	 <20250815085232.30240-13-yunfei.dong@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-pE1IlPVZDKZyusyg3j5o"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-pE1IlPVZDKZyusyg3j5o
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 15 ao=C3=BBt 2025 =C3=A0 16:52 +0800, Yunfei Dong a =C3=A9crit=
=C2=A0:
> Send share memory address to vcp for it is reserved in kernel
> side.

share -> shadred ? The sentence breaks around "to vcp for it", also, try to=
 not
just repeat the subject. Perhaps explain what this is about ?

Nicolas

>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> =C2=A0drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h | 2 +=
+
> =C2=A0drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c=C2=A0 =
| 2 ++
> =C2=A02 files changed, 4 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.=
h
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
> index 47070be2a991..097561a1efdc 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
> @@ -67,11 +67,13 @@ struct vdec_vpu_ipi_ack {
> =C2=A0 * @msg_id	: AP_IPIMSG_DEC_INIT
> =C2=A0 * @codec_type	: codec fourcc
> =C2=A0 * @ap_inst_addr	: AP video decoder instance address
> + * @shared_iova	: reserved share memory address
> =C2=A0 */
> =C2=A0struct vdec_ap_ipi_init {
> =C2=A0	uint32_t msg_id;
> =C2=A0	u32 codec_type;
> =C2=A0	uint64_t ap_inst_addr;
> +	u64 shared_iova;
> =C2=A0};
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> index ac10e0dfefb2..428ed9e5f2c3 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> @@ -232,6 +232,8 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
> =C2=A0	msg.msg_id =3D AP_IPIMSG_DEC_INIT;
> =C2=A0	msg.ap_inst_addr =3D (unsigned long)vpu;
> =C2=A0	msg.codec_type =3D vpu->codec_type;
> +	if (mtk_vcodec_fw_get_type(vpu->ctx->dev->fw_handler) =3D=3D VCP)
> +		msg.shared_iova =3D vpu->ctx->dev->fw_handler->vcp->iova_addr;
> =C2=A0
> =C2=A0	mtk_vdec_debug(vpu->ctx, "vdec_inst=3D%p", vpu);
> =C2=A0

--=-pE1IlPVZDKZyusyg3j5o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSoEhQAKCRDZQZRRKWBy
9OAgAQCqSCHN7qt4BuWEV/RKauhysBO1fOUz9qN8G1GnF9WwxQD9E8ZLuJMp8sT0
ABoJXrzG68rgBgFKQAiBPTo1w3qFEA0=
=Aykx
-----END PGP SIGNATURE-----

--=-pE1IlPVZDKZyusyg3j5o--

