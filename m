Return-Path: <linux-media+bounces-56362-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDEPBvs7vGl3uwIAu9opvQ
	(envelope-from <linux-media+bounces-56362-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 19:10:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B12C52D0975
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 19:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0C7053001466
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 18:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5F83EE1F8;
	Thu, 19 Mar 2026 18:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="d3oUUjJv"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DED37E300;
	Thu, 19 Mar 2026 18:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773943796; cv=none; b=g/cVdMwVKT/DFOlWT+pob9d214/CMUwlxCjHiVPK2BF+sVaqZQXEvg+JMYbAtOdlwjaLYgn1pbYSaQ2kST/+zD+ANaacwrlZgzd0E6cV7ihla65IEIvXfJWQsGiFWmUGp+lZ+M/b6cEKOYklWbCSRSAs5x4Qxt6ZCTRpcnqcTR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773943796; c=relaxed/simple;
	bh=z5zRDaR6OD+bx5R7/xJ0rgTHLEtAD6aXNfVKyJLR68k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YUASZ/SkH7/My9foNq2TJ4qzOXdUfzUL4O93dS5z3dpwCn/Hv8ypmfqvt2bFNRNtz+hFijYZKr40kgoGnvfqFlvCpexL7H1lbstV1qoomMPz2Mw6zv6YGTCqjvfsngv5RlXq2rx/yRkLe+cOjp18TneLIkQbZauPz5A5k5ImdEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=d3oUUjJv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773943793;
	bh=z5zRDaR6OD+bx5R7/xJ0rgTHLEtAD6aXNfVKyJLR68k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=d3oUUjJvhPhsLwLWEcqYkelPO4yukFe87B0DEVCoXiB8slmfAaBUmt5sivRk4Ieer
	 ePyGHoFbjyZDRdXf2SRvFcPS/tu2DWKYCWrO31Sx22F2niK7RBuugNSwOrNRe4g+Vo
	 0Kfe4YNsp7tzfl4yqiFPUICusPJx+NnnDjlmwQHWePzuhVkf0ZDKbSDysNNAYQN1BT
	 t/f9o+KtlbbFANP47aWmpBGo0yrXv/CkDfKJIBHPTy77MnR1pCo0bLXrHxzKDGMKb8
	 Y/5ViCHOaX7mz6oGWJ14K+DU3ZY4X3CWXyd34bEsKu/4bafNpZKJV99ThuGKY4rfFh
	 7vRIsQ9WQjQFw==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 14B0E17E127A;
	Thu, 19 Mar 2026 19:09:49 +0100 (CET)
Message-ID: <cac5f4486bcf78f3bb2d343a600020a6600ad65c.camel@collabora.com>
Subject: Re: [PATCH v7 07/10] media: mediatek: vcodec: Fix vp9 4096x2176
 fail for profile2
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@xs4all.nl>,  Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann
 <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>,  George Sun
 <george.sun@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	 <andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Date: Thu, 19 Mar 2026 14:09:48 -0400
In-Reply-To: <20260127024248.18406-8-kyrie.wu@mediatek.com>
References: <20260127024248.18406-1-kyrie.wu@mediatek.com>
	 <20260127024248.18406-8-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-y+2StToldewld1u0KbSj"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56362-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,gmail.com,collabora.com,xs4all.nl,chromium.org,arndb.de,vger.kernel.org,lists.infradead.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,mediatek.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,mediatek.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B12C52D0975
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-y+2StToldewld1u0KbSj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 10:42 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> The DRAM address of the VP9 decoder tile info buffers may require
> as much as 36bits for 4096x2176 resolution. Fold the 4 most significant
> bits into the lower (padding) four bits of address.
>=20
> Fixes: 5d418351ca8f1 ("media: mediatek: vcodec: support stateless VP9 dec=
oding")
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

In v8, relocate this patch before the addition of the MT8189 pdata, since t=
his
SoC depends on it.

Nicolas

> ---
> =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 10 +++++++=
++-
> =C2=A01 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> index e8ba99d31e74..a958e16eb380 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> @@ -1133,9 +1133,17 @@ static int vdec_vp9_slice_setup_tile_buffer(struct=
 vdec_vp9_slice_instance *inst
> =C2=A0					return -EINVAL;
> =C2=A0			}
> =C2=A0			tiles->size[i][j] =3D size;
> +			/*
> +			 * If the system supports 64-bit DMA addresses, the upper 4 bits
> +			 * of the address are also encoded into the buffer entry.
> +			 * The buffer pointer (tb) is incremented after each entry is written=
.
> +			 */
> =C2=A0			if (tiles->mi_rows[i]) {
> =C2=A0				*tb++ =3D (size << 3) + ((offset << 3) & 0x7f);
> -				*tb++ =3D pa & ~0xf;
> +				*tb =3D pa & GENMASK(31, 4);
> +				if (IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT))
> +					*tb |=3D (pa >> 32) & GENMASK(3, 0);
> +				tb++;
> =C2=A0				*tb++ =3D (pa << 3) & 0x7f;
> =C2=A0				mi_row =3D (tiles->mi_rows[i] - 1) & 0x1ff;
> =C2=A0				mi_col =3D (tiles->mi_cols[j] - 1) & 0x3f;

--=-y+2StToldewld1u0KbSj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabw77AAKCRDZQZRRKWBy
9DLsAP9M3OZ7+WThlwK1dyrszgZRI3rKBT2DQiSHeRHhvZebKQD/Za9H5Yz6hWBl
4k8Tbq2u7QRmbIqd2k4QbLt4dWtdeAc=
=VY6l
-----END PGP SIGNATURE-----

--=-y+2StToldewld1u0KbSj--

