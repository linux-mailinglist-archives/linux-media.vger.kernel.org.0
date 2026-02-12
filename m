Return-Path: <linux-media+bounces-52677-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOs/F6MqjmlsAQEAu9opvQ
	(envelope-from <linux-media+bounces-52677-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 20:31:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D4128130B87
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 20:31:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 664D2306EC83
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 19:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33CF2DEA9B;
	Thu, 12 Feb 2026 19:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="d8nUvkAe"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A00A28C2A1;
	Thu, 12 Feb 2026 19:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770924689; cv=none; b=esi3ATdr8xUM8BNg8jnXVxPiiVx3X/+V3Nlvs87a7YHogf8ca6lcKcJa5HvUuGKWTs7OX8+FFjqNRtTzhp2cnT1Ooe7vbkK09BoItZEZRwHbcafi65mCU3oWetNdHVO8tMk4V4GLseGB/msTryC7+bRZf7nB86yahlB2I+ucU+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770924689; c=relaxed/simple;
	bh=+qNUr0UoriHOp1Z7R0j7T53LVOa64ZsApE4fd9vU1/I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XzYtVEwCNBJlxa7O5HK8rNpy700bFSkdE1SClfj6wc2b65J16HWUfNxR4t+ZMvpPLobt4Q22OCmQ5x3aNS8ZTxPbGNBmxcJSuBrV/qtZxoFmjo0lpJ2fQHIvjFzeBxKQqmw2pSgjGnL5nIQdnS80kb1w3H/fPiAcEYmRbk3X77M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=d8nUvkAe; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770924686;
	bh=+qNUr0UoriHOp1Z7R0j7T53LVOa64ZsApE4fd9vU1/I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=d8nUvkAehy9yHTSm6VurTOk3PcmpaHehiHFDkoonwDV33kpogDUNL1ptxqo9LRK6A
	 qX1Y4Q1vs7t0xSxy2eeG8EP1SMUpaeHXJhmAlX+oQ6dxqsBta0V7+MAqbN1CBqZB3y
	 bhfFYEEO1X3YtJ3KoJP5L9aRWFnEiLlyRMoML0f0c3bGMFJGV3WIq+v4QmdwVue+SO
	 R/t2p0GEq6Vd2w6YU2UvNIl1iddu+puh4N77Krk0tSKgEuqP0qn7q+ojPmENkIfji5
	 8DKsE9YLxQK6tinu1KNyswU3YLRogAmtUsrI1ZMWdisHu8m1UD3F3AW+6zBjiL8khO
	 KcDuY0tc3sT7g==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3DB0A17E1274;
	Thu, 12 Feb 2026 20:31:24 +0100 (CET)
Message-ID: <ce23bec1765032aad25e036b46cf45eb97764ea0.camel@collabora.com>
Subject: Re: [PATCH v3 02/14] media: mediatek: vcodec: add decoder
 compatible to support mt8196
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 =?ISO-8859-1?Q?N=EDcolas?= "F . R . A . Prado"	 <nfraprado@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,  Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard	
 <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>,  Daniel Vetter <daniel@ffwll.ch>, Steve Cho
 <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Thu, 12 Feb 2026 14:31:21 -0500
In-Reply-To: <6176231.DvuYhMxLoT@workhorse>
References: <20260211054149.27249-1-yunfei.dong@mediatek.com>
	 <20260211054149.27249-3-yunfei.dong@mediatek.com>
	 <6176231.DvuYhMxLoT@workhorse>
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
	protocol="application/pgp-signature"; boundary="=-ExWRxj2PEKAcesDrVVPq"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52677-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,xs4all.nl,chromium.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D4128130B87
X-Rspamd-Action: no action


--=-ExWRxj2PEKAcesDrVVPq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 12 f=C3=A9vrier 2026 =C3=A0 17:48 +0100, Nicolas Frattaroli a =C3=
=A9crit=C2=A0:
> On Wednesday, 11 February 2026 06:41:29 Central European Standard Time Yu=
nfei
> Dong wrote:
> > MT8196 is lat single core architecture. Support its compatible and
> > use `mtk_lat_sig_core_pdata` to initialize platform data.
> >=20
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> > =C2=A0.../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c=C2=A0=
=C2=A0 | 6 ++++++
> > =C2=A0.../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h=C2=A0=
=C2=A0 | 1 +
> > =C2=A02 files changed, 7 insertions(+)
> >=20
> > diff --git
> > a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> > b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> > index 3b81fae9f913..d9f722698198 100644
> > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.c
> > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.c
> > @@ -347,6 +347,8 @@ static void mtk_vcodec_dec_get_chip_name(struct
> > mtk_vcodec_dec_dev *vdec_dev)
> > =C2=A0		vdec_dev->chip_name =3D MTK_VDEC_MT8186;
> > =C2=A0	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8188-
> > vcodec-dec"))
> > =C2=A0		vdec_dev->chip_name =3D MTK_VDEC_MT8188;
> > +	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8196-
> > vcodec-dec"))
> > +		vdec_dev->chip_name =3D MTK_VDEC_MT8196;
>=20
> Why is this entire function written like this, and why does it exist
> at all? You can store the chip name in the platform data for a compatible=
,
> thereby avoiding a massive of_device_is_compatible if block because that'=
s
> what platform data is for.
>=20
> The only place where this function is even used is in probe.
>=20
> Just store it in your mtk_vcodec_match's .data struct and pull it from
> dev->vdec_pdata. No need for the function.

I have already asked this to the dev working on some other MTK codec patchs=
et,
and I think he already posted some proper refactoring (but had more changes=
 to
finish it up). Mind, Yunfei, coordinating the effort on removing all the if=
/else
please ? We are doing the same code review again and again with every singl=
e
individual working on this driver.

regards,
Nicolas

>=20
> > =C2=A0	else
> > =C2=A0		vdec_dev->chip_name =3D MTK_VDEC_INVAL;
> > =C2=A0}
> > @@ -560,6 +562,10 @@ static const struct of_device_id mtk_vcodec_match[=
] =3D {
> > =C2=A0		.compatible =3D "mediatek,mt8188-vcodec-dec",
> > =C2=A0		.data =3D &mtk_lat_sig_core_pdata,
> > =C2=A0	},
> > +	{
> > +		.compatible =3D "mediatek,mt8196-vcodec-dec",
> > +		.data =3D &mtk_lat_sig_core_pdata,
> > +	},
> > =C2=A0	{},
> > =C2=A0};
> > =C2=A0
> > diff --git
> > a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> > b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> > index c9d27534c63e..f06dfc1a3455 100644
> > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.h
> > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.h
> > @@ -29,6 +29,7 @@ enum mtk_vcodec_dec_chip_name {
> > =C2=A0	MTK_VDEC_MT8188 =3D 8188,
> > =C2=A0	MTK_VDEC_MT8192 =3D 8192,
> > =C2=A0	MTK_VDEC_MT8195 =3D 8195,
> > +	MTK_VDEC_MT8196 =3D 8196,
> > =C2=A0};
> > =C2=A0
> > =C2=A0/*
> >=20
>=20
>=20
>=20

--=-ExWRxj2PEKAcesDrVVPq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaY4qiQAKCRDZQZRRKWBy
9HeYAQCWhI9bf5Bxz3iHnJha5FN0WSgszG3muAHP/g8J/IEASQD+P/e/9t05GUPv
+FUC4Inp4Ry1nEoRPqRIjZMwr70F9g8=
=JVru
-----END PGP SIGNATURE-----

--=-ExWRxj2PEKAcesDrVVPq--

