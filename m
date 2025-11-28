Return-Path: <linux-media+bounces-47885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 93341C93176
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 21:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E0DBF4E1BC8
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 20:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1519B2D9EF4;
	Fri, 28 Nov 2025 20:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lHjcmm7j"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03F32C21E8;
	Fri, 28 Nov 2025 20:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764360852; cv=none; b=EIda/e5ixX7Yx7IxdIK3yv+1uUj+INTnMX2fXji46YscP1VjfRAVaCQ3nyefi2XXEpin4PVGaa6dX7GbNuS5A0uNzF8kfxVjdeAxZygC8SMY6ovJwnauTA/b2WX70MmkelfnOU0ZpSsNQJ9nDjgp2B9Ki4ZsKdX+Ck16WQ1xT70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764360852; c=relaxed/simple;
	bh=dbI/cc8kxuLZJOzza7Lo7TJwKLlCdsiu/J6Vk0sw6I4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UGYDwvhhzmhLZog2FwTHbVuzYr+hLDWGGWtG4VAX+kjfYpmEjzhCScOpWtDN2mjdzLrlilD9f84CYLE/TLfwevAG5nGhjgUuBjYkHsi/jxg5OUjsRP4BWClbj6VF/C4mqkV1QJMaPJMBHEm883T1LrcEm1Tsn1V9QjFbtewYUX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lHjcmm7j; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764360848;
	bh=dbI/cc8kxuLZJOzza7Lo7TJwKLlCdsiu/J6Vk0sw6I4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=lHjcmm7jA0F7CqnaEe7xMNMdiMHM9ZUdiQV1v98nJntqgdtPJa1QoK/5aTck2W8PK
	 8rvSEaKT7cJtMRX2pUTuHv2R7rxMy3U1TZiEqzQiNzuyIUhKRmUpUG6OUYmf3mErCr
	 UKv+Q6NH8z2syVMFt0UZ40gsUKIywNyybaCALWecPMMVa1O3USySpuRfAzXfLnGNx5
	 63cqQWB2nfxPgqM2f51ZzNOvs6EAbnS2UTUyC+gap5kIRVMr63yILZQzCUkmlywN+k
	 RLSjit+T5+rc3QwR/GU74eCApSvPUCNyB+4Xe9QUSAE5mZ+RDMZG2ec5kFVxKoIhJH
	 y38i9oxh0bxeA==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EEBBD17E0A28;
	Fri, 28 Nov 2025 21:14:06 +0100 (CET)
Message-ID: <b9c2dadb61a6334857730d990b704d12381bd350.camel@collabora.com>
Subject: Re: [PATCH v2 08/14] media: mediatek: vcodec: support vcp
 architecture
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
Date: Fri, 28 Nov 2025 15:14:06 -0500
In-Reply-To: <20250815085232.30240-9-yunfei.dong@mediatek.com>
References: <20250815085232.30240-1-yunfei.dong@mediatek.com>
	 <20250815085232.30240-9-yunfei.dong@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-581tRhgHnq+RNdyOpJ4Z"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-581tRhgHnq+RNdyOpJ4Z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 15 ao=C3=BBt 2025 =C3=A0 16:52 +0800, Yunfei Dong a =C3=A9crit=
=C2=A0:
> Some platforms expose the video codec through the VCP coprocessor.
> Use the VCP architecture when the VCP coprocessor is found.
>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> index fa609343c168..5e312f86e652 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -380,6 +380,9 @@ static int mtk_vcodec_probe(struct platform_device *p=
dev)
> =C2=A0	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp"=
,
> =C2=A0					 &rproc_phandle)) {
> =C2=A0		fw_type =3D SCP;
> +	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vcp",
> +					 &rproc_phandle)) {
> +		fw_type =3D VCP;
> =C2=A0	} else {
> =C2=A0		dev_dbg(&pdev->dev, "Could not get vdec IPI device");
> =C2=A0		return -ENODEV;

--=-581tRhgHnq+RNdyOpJ4Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSoCjgAKCRDZQZRRKWBy
9Mo0AP9vec8clCCPOZf/g0uAWooenVDUlvXrDSd+xkllGWTK3AEAwVliom/Oqmxg
UteFPY+frNbTKHHpAZ6lPpd8ARTkcAA=
=Rt9m
-----END PGP SIGNATURE-----

--=-581tRhgHnq+RNdyOpJ4Z--

