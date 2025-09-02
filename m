Return-Path: <linux-media+bounces-41583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB535B401CB
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 15:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B2943BF656
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 12:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28BB2FF158;
	Tue,  2 Sep 2025 12:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PGgDN+h1"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E969A2D9ED0;
	Tue,  2 Sep 2025 12:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817881; cv=none; b=LYsfa+CK9JlYCpIfveD9BYN/0Ng8zAuB6zvr+iRqeM/GIuSqeP64PXiLEx0BF26BRArqDF8ViYSdkVYriKrhfQ7HdXgofa+UthPt6moQTQ8y0ahIswoLHPoNsC+836koabTeZJWijW3U1Hzo0JLpcGOlQ0ODMDtBaVs+gA885Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817881; c=relaxed/simple;
	bh=PU4Bzgg+nJ15hff/4hvbjW8eUcg1SWaXB9umh0D23so=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OdIhhdpV5k9fn9dAkSFpsG/jxXs1V2yUzRIRTVXWhkPOob73c7OEVF2VpBAjt6V7qhxFfa6aE93x7BGoC3LsRO41IRbbObKdo2Mn9uNKJcC+w9UaptMMALDG7Rwb2eaiQvrJgTcVmW54acaMdzdPhrVdBXcpMJ1p/PkHw32bBAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PGgDN+h1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756817877;
	bh=PU4Bzgg+nJ15hff/4hvbjW8eUcg1SWaXB9umh0D23so=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=PGgDN+h1bZerGMRc1RYUUG48WwEewrEM9Bnz6867eTgQr1oT1hufzWJIFxM62vz1k
	 NS1yLgW3taeEsty5lRDeNwoZUkvRIu/OZ+QDR6140UfEtJt/ZAMeLc2pUMwKI/tjPt
	 HtTaftwpdmdscoCCzsUkxbt6Ul7sWC3OKUOjGSP0KZXjnFnhQtQ0h26Z/lLU+YAM6x
	 KeDvVq0QZi02QGo9BEMGysevY/yp9wTmowGi8fzw6ahby/ieIiytl74tztvQxw8H1I
	 Bp3csuNvWGzO35xfuqB/xkGBwab1jHeYq+vmZnQs/phoGb9sbk3hnIDMuAL2g+Yf5k
	 L+XrYDbfx87KA==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9FBD317E129F;
	Tue,  2 Sep 2025 14:57:55 +0200 (CEST)
Message-ID: <005438a1d81a1d02d6c8659bd951ff65d3f39d85.camel@collabora.com>
Subject: Re: [PATCH v2] media: mediatek: encoder: Fix uninitialized scalar
 variable issue
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Irui Wang =?UTF-8?Q?=28=E7=8E=8B=E7=91=9E=29?= <Irui.Wang@mediatek.com>,
  "rongqianfeng@vivo.com"	 <rongqianfeng@vivo.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>,  "mchehab@kernel.org"	 <mchehab@kernel.org>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 "hverkuil-cisco@xs4all.nl"	 <hverkuil-cisco@xs4all.nl>
Cc: "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
	 <linux-media@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	 <linux-mediatek@lists.infradead.org>, Longfei Wang
 =?UTF-8?Q?=28=E7=8E=8B=E9=BE=99=E9=A3=9E=29?=
	 <Longfei.Wang@mediatek.com>, Project_Global_Chrome_Upstream_Group
	 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Yunfei Dong
 =?UTF-8?Q?=28=E8=91=A3=E4=BA=91=E9=A3=9E=29?=
	 <Yunfei.Dong@mediatek.com>
Date: Tue, 02 Sep 2025 08:57:54 -0400
In-Reply-To: <dbfac6888a2c77c302265df2f90bf4aec8bed686.camel@mediatek.com>
References: <20250716071450.8214-1-irui.wang@mediatek.com>
		 <c751e015c0a9fb2ab6514a45952e01424cfbb0cb.camel@collabora.com>
	 <dbfac6888a2c77c302265df2f90bf4aec8bed686.camel@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-F1/z1Y8k8JEbWKEC/4LA"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-F1/z1Y8k8JEbWKEC/4LA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 01 septembre 2025 =C3=A0 02:37 +0000, Irui Wang (=E7=8E=8B=E7=91=
=9E) a =C3=A9crit=C2=A0:
> Dear Nicolas,
>=20
> Thanks for your comments.
>=20
> On Fri, 2025-08-29 at 15:10 -0400, Nicolas Dufresne wrote:
> > Le mercredi 16 juillet 2025 =C3=A0 15:14 +0800, Irui Wang a =C3=A9crit =
:
> > > UNINIT checker finds some instances of variables that are used
> > > without being initialized, for example using the uninitialized
> > > value enc_result.is_key_frm can result in unpredictable behavior,
> > > so initialize these variables after declaring.
> > >=20
> > > Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2
> > > Video
> > > Encoder Driver")
> > >=20
> > > Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> > > ---
> > > v2:
> > > =C2=A0- Add Fixes tag, update commit message
> > > =C2=A0- Remove unnecessary memset
> > > =C2=A0- Move memset to before the first usage
> > > ---
> > > =C2=A0.../media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c=C2=
=A0=C2=A0 | 4
> > > +++-
> > > =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git
> > > a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> > > b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> > > index a01dc25a7699..3065f3e66336 100644
> > > ---
> > > a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> > > +++
> > > b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> > > @@ -865,7 +865,7 @@ static void vb2ops_venc_buf_queue(struct
> > > vb2_buffer *vb)
> > > =C2=A0static int vb2ops_venc_start_streaming(struct vb2_queue *q,
> > > unsigned int
> > > count)
> > > =C2=A0{
> > > =C2=A0	struct mtk_vcodec_enc_ctx *ctx =3D vb2_get_drv_priv(q);
> > > -	struct venc_enc_param param;
> > > +	struct venc_enc_param param =3D { 0 };
> > > =C2=A0	int ret;
> > > =C2=A0	int i;
> > > =C2=A0
> > > @@ -1036,6 +1036,7 @@ static int mtk_venc_encode_header(void *priv)
> > > =C2=A0			=C2=A0 ctx->id, dst_buf->vb2_buf.index, bs_buf.va,
> > > =C2=A0			=C2=A0 (u64)bs_buf.dma_addr, bs_buf.size);
> > > =C2=A0
> > > +	memset(&enc_result, 0, sizeof(enc_result));
> >=20
> > Please, apply review comment to all occurrence, so same here.
> >=20
> > > =C2=A0	ret =3D venc_if_encode(ctx,
> > > =C2=A0			VENC_START_OPT_ENCODE_SEQUENCE_HEADER,
> > > =C2=A0			NULL, &bs_buf, &enc_result);
> > > @@ -1185,6 +1186,7 @@ static void mtk_venc_worker(struct
> > > work_struct *work)
> > > =C2=A0			=C2=A0 (u64)frm_buf.fb_addr[1].dma_addr,
> > > frm_buf.fb_addr[1].size,
> > > =C2=A0			=C2=A0 (u64)frm_buf.fb_addr[2].dma_addr,
> > > frm_buf.fb_addr[2].size);
> > > =C2=A0
> > > +	memset(&enc_result, 0, sizeof(enc_result));
> >=20
> > Same here.
> >=20
> > > =C2=A0	ret =3D venc_if_encode(ctx, VENC_START_OPT_ENCODE_FRAME,
> > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 &frm_buf, &bs_buf, &enc_result);
> > > =C2=A0
> > >=20
> >=20
> >=20
> > Would be nice to coordinate with Qianfeng Rong <rongqianfeng@vivo.com
> > > [0], he
> > ported the entire driver to this initialization method, which is
> > clearly the way
> > to go.
> >=20
> > - Patch 1 will port the driver to {} stack init
> > - Patch 2 will add missing initializes
> >=20
> > Consistency is key for this type of things since developer usually
> > follow the
> > surrounding style.
>=20
> I have learned Qianfeng's patch and comments. I understand what you
> mean is change my patch coding style to Qianfeng's, modify 'memset' to
> '{}' for initialization, and amend Qianfeng's patch as patch-2, then
> send this two patches together.

Correct, and I don't mind who do that work, I'd like to see the code kept
consistant. And I do agree memset() are error prone.

cheers,
Nicolas

>=20
> If I misunderstood your opinion, please correct me, thank you very
> much.
>=20
> Best Regards
> >=20
> > regards
> > Nicolas
> >=20
> > [0]=20
> > https://patchwork.linuxtv.org/project/linux-media/patch/20250803135514.=
118892-1-rongqianfeng@vivo.com/

--=-F1/z1Y8k8JEbWKEC/4LA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLbp0gAKCRDZQZRRKWBy
9AMIAP4l3zEJdQyeftn4RgftFIHQz0eEqpSztnAbK553WME3KgEAzYyheCs4BblM
WmNV6SRGwHH6Q1/P7PRqOpIuIa1QNwc=
=V/iG
-----END PGP SIGNATURE-----

--=-F1/z1Y8k8JEbWKEC/4LA--

