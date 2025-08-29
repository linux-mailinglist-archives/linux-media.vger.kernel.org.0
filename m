Return-Path: <linux-media+bounces-41357-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1378B3C2DC
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 21:10:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07AA37B5534
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 19:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1E423956E;
	Fri, 29 Aug 2025 19:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YasgUokD"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0598238149;
	Fri, 29 Aug 2025 19:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756494610; cv=none; b=rm0Tm5GKqtSdg3R3AAIRTS4hnQcloXMzSYvantv9betxGrznjd3l0QScr2QqSVpXfVc6b7jqYIir1s66EWxH7MOP/DyOPqX+nOZZDjbCdd1ZeKrkA4e0zT+YjxvRHOpI12cKXaRiGt23s5efFaHW87AxfoP/1o7oeMZdu8VHf4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756494610; c=relaxed/simple;
	bh=Q+AcFxvc+cKD4SL5CebZ1eyR69BMUGAX0QDN5BxNH+k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cvNwcYlx3C55SOU9oPDUX4T8tL1Kb3EnUwQoowRdw8tZ85EpnRd4mlav4RPbAfo5M8cM7U72XqkdXVDQi8XOjxbgqb5PQqqUKa2ta2BZlLzM8FKl6ktZAIQfZJaHgXluOxl2wiM8DC6okwUYLocNBjr6rgSho572zVAEPLHgYdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YasgUokD; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756494605;
	bh=Q+AcFxvc+cKD4SL5CebZ1eyR69BMUGAX0QDN5BxNH+k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YasgUokDabnyjQu4DNTKjBZij4zlgTghHy/3q+Bf0N3eJkchTkndmMwQO40kcmVpW
	 gv+JPqKj2FOK3j4HBNCrAdDMvLlbekdoG277JuglYXN6bkllgTIwVVHJQs4d8A/3Y5
	 1ZsycwxntR+vARdIQSjcgUaR1pYDxrslQTOkXn1sE0hwdsqXPVaADIGHYPSDa1v28g
	 xoUFMt6NDPJbEaw2XzcSpsnfQZcDIKV+0UDj6x/4qulY48EhMVcLAmDFsPOhHMFAJV
	 X9lkb3NZc4Cc2yabkDBvrfLYliB/U03/g3x8z+QB33OBpYWfyMhQU/HuTG/G2NDc2v
	 IjS9gMx7PRlkQ==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B1EA17E03B0;
	Fri, 29 Aug 2025 21:10:04 +0200 (CEST)
Message-ID: <c751e015c0a9fb2ab6514a45952e01424cfbb0cb.camel@collabora.com>
Subject: Re: [PATCH v2] media: mediatek: encoder: Fix uninitialized scalar
 variable issue
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Irui Wang <irui.wang@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
	angelogioacchino.delregno@collabora.com, Qianfeng Rong
 <rongqianfeng@vivo.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Longfei Wang
 <longfei.wang@mediatek.com>
Date: Fri, 29 Aug 2025 15:10:02 -0400
In-Reply-To: <20250716071450.8214-1-irui.wang@mediatek.com>
References: <20250716071450.8214-1-irui.wang@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-cv7tl1/bONC+kDTO+fSZ"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-cv7tl1/bONC+kDTO+fSZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 juillet 2025 =C3=A0 15:14 +0800, Irui Wang a =C3=A9crit=C2=
=A0:
> UNINIT checker finds some instances of variables that are used
> without being initialized, for example using the uninitialized
> value enc_result.is_key_frm can result in unpredictable behavior,
> so initialize these variables after declaring.
>=20
> Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video
> Encoder Driver")
>=20
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
> v2:
> =C2=A0- Add Fixes tag, update commit message
> =C2=A0- Remove unnecessary memset
> =C2=A0- Move memset to before the first usage
> ---
> =C2=A0.../media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c=C2=A0=
=C2=A0 | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_en=
c.c
> b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> index a01dc25a7699..3065f3e66336 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> @@ -865,7 +865,7 @@ static void vb2ops_venc_buf_queue(struct vb2_buffer *=
vb)
> =C2=A0static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigne=
d int
> count)
> =C2=A0{
> =C2=A0	struct mtk_vcodec_enc_ctx *ctx =3D vb2_get_drv_priv(q);
> -	struct venc_enc_param param;
> +	struct venc_enc_param param =3D { 0 };
> =C2=A0	int ret;
> =C2=A0	int i;
> =C2=A0
> @@ -1036,6 +1036,7 @@ static int mtk_venc_encode_header(void *priv)
> =C2=A0			=C2=A0 ctx->id, dst_buf->vb2_buf.index, bs_buf.va,
> =C2=A0			=C2=A0 (u64)bs_buf.dma_addr, bs_buf.size);
> =C2=A0
> +	memset(&enc_result, 0, sizeof(enc_result));

Please, apply review comment to all occurrence, so same here.

> =C2=A0	ret =3D venc_if_encode(ctx,
> =C2=A0			VENC_START_OPT_ENCODE_SEQUENCE_HEADER,
> =C2=A0			NULL, &bs_buf, &enc_result);
> @@ -1185,6 +1186,7 @@ static void mtk_venc_worker(struct work_struct *wor=
k)
> =C2=A0			=C2=A0 (u64)frm_buf.fb_addr[1].dma_addr,
> frm_buf.fb_addr[1].size,
> =C2=A0			=C2=A0 (u64)frm_buf.fb_addr[2].dma_addr,
> frm_buf.fb_addr[2].size);
> =C2=A0
> +	memset(&enc_result, 0, sizeof(enc_result));

Same here.

> =C2=A0	ret =3D venc_if_encode(ctx, VENC_START_OPT_ENCODE_FRAME,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 &frm_buf, &bs_buf, &enc_result);
> =C2=A0
>=20


Would be nice to coordinate with Qianfeng Rong <rongqianfeng@vivo.com> [0],=
 he
ported the entire driver to this initialization method, which is clearly th=
e way
to go.

- Patch 1 will port the driver to {} stack init
- Patch 2 will add missing initializes

Consistency is key for this type of things since developer usually follow t=
he
surrounding style.

regards
Nicolas

[0] https://patchwork.linuxtv.org/project/linux-media/patch/20250803135514.=
118892-1-rongqianfeng@vivo.com/

--=-cv7tl1/bONC+kDTO+fSZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLH7CgAKCRDZQZRRKWBy
9Ni6AQD6gGYxu9XOmQQ3UK+h2mLjSoTZYmEQMfxFoQ77Ey3ZdgD/d5hKXUH6bW7F
2AW+T/lVh51L5ZbMDsulmlK9xS3RuA0=
=x0bX
-----END PGP SIGNATURE-----

--=-cv7tl1/bONC+kDTO+fSZ--

