Return-Path: <linux-media+bounces-39468-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AF7B21733
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 23:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F32C746308F
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 21:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD562E2DFA;
	Mon, 11 Aug 2025 21:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QFyf1QcC"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03317213E90;
	Mon, 11 Aug 2025 21:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754947079; cv=none; b=JuG3gh4ZsunWY2PVKBbAiyHfcEljPPn0hsJyQeK+2EZnPnQTY4jKjh6nbryJnR4Bqms8RqlIc7EQYIWggUARIu73mAWeWJyz1TxyjAC6LRfyRWDBm0SJZKnC2epQzMUPTqqNSmBR1Vs5Uf2K8TXf2k+HEOPcCV30HbN5QiLTiQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754947079; c=relaxed/simple;
	bh=xUaflROsz9leLWydph7UroXjMybZOGbQzkhVdycrZXI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kZ5gNtE/qukKU0amhlEaZpEEK315m46Mv0H/ymbXWLUkrtfTDixsherKn+j9M4TE7kUPEAePl+g5E4TWC8oPDFh7KbtFqSzcXATkgHV49D3g+tDNPyNPkDACq0sK/yZax1BvF6lKcR+kcM+kzf+k5Jxtk++iIN6u2yTfmm1aoag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QFyf1QcC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754947076;
	bh=xUaflROsz9leLWydph7UroXjMybZOGbQzkhVdycrZXI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=QFyf1QcCoN388xxYJGsxsMIPtPFH7gTtFQXSyplveeUgph7Fq/+SQRcRHbt6WGmwR
	 3+kGVWIOGBdQN6FB8VVuerXUSQ2jPsYqunWOXcl8jPnAscnjk0eMaQmW1XWqf/sPOu
	 Vr5myMJtBJ4IMCs3R0vD2NOAhtIem1aDizpn7+hz3u6y/o045lRzTVyQTrooqlDLjg
	 /1NYUlQNSohnlpnFx5t/O9BaMqexEjad5F6zLaEin4h7QV4oLDw4TQSf8f1L7Ci5JR
	 dcf7dzj3nqK1UepA+CPgDjgIbb3i8F5eZqogk9VKfKQWKbnupVTtMyB4LTjwJgf3uM
	 R86dQfioNeunA==
Received: from [IPv6:2606:6d00:11:5a76::c41] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D284217E05F0;
	Mon, 11 Aug 2025 23:17:54 +0200 (CEST)
Message-ID: <d1c879392bde10319d9e142db385bb306724b8f4.camel@collabora.com>
Subject: Re: [PATCH v2 4/7] media: rkvdec: Add RK3288 variant
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Detlev Casanova
 <detlev.casanova@collabora.com>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Alex Bee <knaerzche@gmail.com>, Sebastian Fricke
	 <sebastian.fricke@collabora.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 11 Aug 2025 17:17:53 -0400
In-Reply-To: <20250810212454.3237486-5-jonas@kwiboo.se>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
	 <20250810212454.3237486-5-jonas@kwiboo.se>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7QnTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVz
 bmUuY2E+iGIEExECACIFAlXA3CACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sB
 qgcJngAnRDBTr8bhzuH0KQwFP1nEYtfgpKdAKCrQ/sJfuG/8zsd7J8wVl7y3e8ARbRDTmljb2xhcy
 BEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29
 tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCg
 zYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc
 25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udW
 s+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8
 An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZy
 ZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypw
 CfWKc9DorA9f5pyYlD5pQo6SgSoiC0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF
 1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr
 +E7ItOqZEHAs+xabBgknYZIFPU=
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-HHgd+y65iENbtYowP/1d"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-HHgd+y65iENbtYowP/1d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dimanche 10 ao=C3=BBt 2025 =C3=A0 21:24 +0000, Jonas Karlman a =C3=A9cri=
t=C2=A0:
> From: Alex Bee <knaerzche@gmail.com>
>=20
> Add a RK3288 variant, a version of the Rockchip VDEC IP that only
> support HEVC decoding.
>=20
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> Changes in v2:
> - No change
> ---
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.c | 8 ++++++++
> =C2=A01 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index 56807122720e..c20e046205fe 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1222,6 +1222,10 @@ static void rkvdec_watchdog_func(struct work_struc=
t *work)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +static const struct rkvdec_variant rk3288_rkvdec_variant =3D {
> +	.capabilities =3D RKVDEC_CAPABILITY_HEVC,
> +};
> +
> =C2=A0static const struct rkvdec_variant rk3399_rkvdec_variant =3D {
> =C2=A0	.capabilities =3D RKVDEC_CAPABILITY_HEVC |
> =C2=A0			RKVDEC_CAPABILITY_H264 |
> @@ -1229,6 +1233,10 @@ static const struct rkvdec_variant rk3399_rkvdec_v=
ariant =3D {
> =C2=A0};
> =C2=A0
> =C2=A0static const struct of_device_id of_rkvdec_match[] =3D {
> +	{
> +		.compatible =3D "rockchip,rk3288-vdec",
> +		.data =3D &rk3288_rkvdec_variant,
> +	},
> =C2=A0	{
> =C2=A0		.compatible =3D "rockchip,rk3399-vdec",
> =C2=A0		.data =3D &rk3399_rkvdec_variant,

--=-HHgd+y65iENbtYowP/1d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaJpeAQAKCRBxUwItrAao
HCTRAJ4r5AHu+Y2H4Y+OzFJHwnqKI0fFxQCeP1nr/fgDXz45J/yOzhLRppWx4sk=
=14fs
-----END PGP SIGNATURE-----

--=-HHgd+y65iENbtYowP/1d--

