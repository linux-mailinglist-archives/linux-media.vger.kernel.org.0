Return-Path: <linux-media+bounces-48653-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BDCCB72B3
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 21:32:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA5263015965
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 20:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A216331D380;
	Thu, 11 Dec 2025 20:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hljhZx4+"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4481E288C08;
	Thu, 11 Dec 2025 20:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765485158; cv=none; b=BGbvKbR+6CF1+xOV8JBhBFpA1CX/cVldyDy412OJAAE0bLEIcvL0SyZimNdgd3kDMSxX6PQXrJE3cQX7B6nP7FGyfUKx+gEerNlyfE8rCkm9jF8KnltkyaUkRZ9FapGYh5sdcrFc+O7FjhaHFzp8uYiGF6hb07Jv6qD8SVYKjLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765485158; c=relaxed/simple;
	bh=G7q1JEkkHwrsqhqOlDvPl2Tn67bvGyBMMPrfM/9YkWc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ug8rsRdXgaReWgzetcKKhYK3F1Ug/HMvrrHJWOKsZHzA5+KFEKIH0XRqwkW2MEDzB1HAfhLBHQ9OIIUe1fo2Hl86T8dTDdvZY07QXru39N23NpSDhhOkMXceJT0vtLkJoqrlE5wf4A/Fx3cLZAVLflOz9RBHO59bPivFDiiW1NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hljhZx4+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765485154;
	bh=G7q1JEkkHwrsqhqOlDvPl2Tn67bvGyBMMPrfM/9YkWc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=hljhZx4+40EmFAPe40tkyy69L4LXOwZ8Zt+CstL7MneCO2B4OX2icxx+Afr+AFr5t
	 HJyqOcePX/DI0GuB86JVUAmQGTQzEwoJcdQZEp30O/kG6ZxV4F/6J003FCkZfS77Uj
	 AAkloLCfPGriaAVxR2It+UIlEOVH5tQTkxCdS6AuacdBpj605DAnUW5aGoUCn+tGqo
	 PvMLWyNvwy6LwD8a9Nz+4pjJ2Akr+d6fGJ5/xWVAFneOhvrbxGdTHKvZshd4UNc4ai
	 E3JVnuJhU9FvtTJna8ffAUAO54ViGtmxsBFmKWD3xS9Sml6xdbpEFr179ZSS0t0mnE
	 xGJhUOSkEdllw==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 280F917E110C;
	Thu, 11 Dec 2025 21:32:32 +0100 (CET)
Message-ID: <03d3228206dbeb7f3fdb9466f84511f598ae9d65.camel@collabora.com>
Subject: Re: [PATCH v6 07/10] media: mediatek: vcodec: Fix vp9 4096x2176
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
Date: Thu, 11 Dec 2025 15:32:30 -0500
In-Reply-To: <20251202074038.3173-8-kyrie.wu@mediatek.com>
References: <20251202074038.3173-1-kyrie.wu@mediatek.com>
	 <20251202074038.3173-8-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-6GO17q2aWDuQ7cn4Ze+O"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-6GO17q2aWDuQ7cn4Ze+O
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 15:40 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> The DRAM address of the VP9 decoder tile info buffers may require
> as much as 36bits for 4096x2176 resolution. Fold the 4 most significant
> bits into the lower (padding) four bits of address.
>=20
> Fixes: 5d418351ca8f1 ("media: mediatek: vcodec: support stateless VP9 dec=
oding")
>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 10 +++++++=
++-
> =C2=A01 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> index 36a87b455d11..eca6280098be 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> @@ -1134,9 +1134,17 @@ static int vdec_vp9_slice_setup_tile_buffer(struct=
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

--=-6GO17q2aWDuQ7cn4Ze+O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTsqXgAKCRDZQZRRKWBy
9AHCAQCIL2oKUruDOqqd+Tp2NG/Cqh8AXUPiefAumbjS9hhj7gD/d+bv4U9ehbuM
LT9GLyjqJT5Gx1XLLI5owiSgEEcaUAs=
=/hjj
-----END PGP SIGNATURE-----

--=-6GO17q2aWDuQ7cn4Ze+O--

