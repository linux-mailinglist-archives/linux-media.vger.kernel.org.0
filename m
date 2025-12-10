Return-Path: <linux-media+bounces-48590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A472ACB3F38
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 21:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4D223010E78
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 20:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3101E32BF44;
	Wed, 10 Dec 2025 20:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZxNkW/6Q"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A093C2472A8;
	Wed, 10 Dec 2025 20:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765398306; cv=none; b=aimPKy5A0VlqvKdpEs7jICYm3DCJba+jgkzKvypEyRzwtfFHqzJEWBSxqiamQ+X1clA0uk0ps/JoJE5ucrlGtHBJmiigOZ6ZZZMPgaMSaCw388gtGol4j21yYENHSJupRDLJGYNSoMuz6iAZKR5ortRKAdT4xOfinQQdqGssVoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765398306; c=relaxed/simple;
	bh=R95Xvco65EKPytjxWCzBxf40m1SmGjBMSkCJw5E1DaM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PlM4eeRwkaeA+A2TQPAJ7SfGUpjnUECsSgd7AcQBAhcG3q1CPkgHnSBEnz9XzMMv8ioT4RXvogfUvsyYSFvkBsdoOFDdfFPMKH2zcb/gS8sCaF/Njaw+dudcXnJ1k5fTwnxHBdO6DSIxR4j46fjSm6UxsgO7EZyyOVtMoQ8gtAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZxNkW/6Q; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765398302;
	bh=R95Xvco65EKPytjxWCzBxf40m1SmGjBMSkCJw5E1DaM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ZxNkW/6QZI4GlNUS+qN1zfhIF6fFiS4+reopasHLeBAqqrAbVJJ5d5enVfonBmP+T
	 AhhmyXzOjbtdiMTymT+ZBVlmcVv6n+v8j144Vc38zO4XG8HGWwdsJQaS1Tdcbwnrcb
	 tyFhkXlIJLw1ldg1GC3VWFXUIUlR+Qg3nvfH3u9qSj0xrJMJWnxPaOcKOkcP6wmZWQ
	 N0AQzqozETQyR7cmywI0hJn0OTdctVf1YDUul3HpQFvHBSlGg4oWFggvpLSfnD0/pt
	 G9MYYkbfE0PaBCRSVJvbvZIgKwP+1gDQFC7txrer2iI9dC2dCd8CCMPSvdHaPgZ3kC
	 g44Y+UGUeCePA==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CD8B217E12FB;
	Wed, 10 Dec 2025 21:25:00 +0100 (CET)
Message-ID: <a6e8003768f9daa9303e1ee82bedd8c48d59afd2.camel@collabora.com>
Subject: Re: [PATCH v4 08/15] media: rkvdec: Add generic configuration for
 variants
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Heiko Stuebner <heiko@sntech.de>, Ricardo
 Ribalda <ribalda@chromium.org>, Hans Verkuil <hverkuil@kernel.org>, Hans de
 Goede <hansg@kernel.org>,  Yunke Cao <yunkec@google.com>, Jonathan Corbet
 <corbet@lwn.net>, Laurent Pinchart	 <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,  James Cowgill
 <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Diederik de Haas	 <didi.debian@cknow.org>
Date: Wed, 10 Dec 2025 15:24:59 -0500
In-Reply-To: <20251022174508.284929-9-detlev.casanova@collabora.com>
References: <20251022174508.284929-1-detlev.casanova@collabora.com>
	 <20251022174508.284929-9-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-eO2lpkzOxBjYInpmHwNq"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-eO2lpkzOxBjYInpmHwNq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 22 octobre 2025 =C3=A0 13:45 -0400, Detlev Casanova a =C3=A9cri=
t=C2=A0:
> This is to prepare for adding new versions of the decoder and
> support specific formats and ops per version.
>=20
> Different rkvdec_variant instances will be able to share generic
> decoder configs.
>=20
> Tested-by: Diederik de Haas <didi.debian@cknow.org>=C2=A0 # Rock 5B
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0 | 37 ++++++=
++++++-------
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.h=C2=A0=C2=A0 |=C2=A0 6 +=
++
> =C2=A02 files changed, 30 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index 776149f871b0..a7af1e3fdebd 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -373,15 +373,16 @@ static bool rkvdec_is_capable(struct rkvdec_ctx *ct=
x, unsigned int capability)
> =C2=A0static const struct rkvdec_coded_fmt_desc *
> =C2=A0rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
> =C2=A0{
> +	const struct rkvdec_config *cfg =3D ctx->dev->variant->config;
> =C2=A0	int fmt_idx =3D -1;
> =C2=A0	unsigned int i;
> =C2=A0
> -	for (i =3D 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> -		if (!rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
> +	for (i =3D 0; i < cfg->coded_fmts_num; i++) {
> +		if (!rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability))
> =C2=A0			continue;
> =C2=A0		fmt_idx++;
> =C2=A0		if (index =3D=3D fmt_idx)
> -			return &rkvdec_coded_fmts[i];
> +			return &cfg->coded_fmts[i];
> =C2=A0	}
> =C2=A0
> =C2=A0	return NULL;
> @@ -390,12 +391,13 @@ rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, =
int index)
> =C2=A0static const struct rkvdec_coded_fmt_desc *
> =C2=A0rkvdec_find_coded_fmt_desc(struct rkvdec_ctx *ctx, u32 fourcc)
> =C2=A0{
> +	const struct rkvdec_config *cfg =3D ctx->dev->variant->config;
> =C2=A0	unsigned int i;
> =C2=A0
> -	for (i =3D 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> -		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability) &&
> -		=C2=A0=C2=A0=C2=A0 rkvdec_coded_fmts[i].fourcc =3D=3D fourcc)
> -			return &rkvdec_coded_fmts[i];
> +	for (i =3D 0; i < cfg->coded_fmts_num; i++) {
> +		if (rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability) &&
> +		=C2=A0=C2=A0=C2=A0 cfg->coded_fmts[i].fourcc =3D=3D fourcc)
> +			return &cfg->coded_fmts[i];
> =C2=A0	}
> =C2=A0
> =C2=A0	return NULL;
> @@ -1014,18 +1016,19 @@ static int rkvdec_add_ctrls(struct rkvdec_ctx *ct=
x,
> =C2=A0
> =C2=A0static int rkvdec_init_ctrls(struct rkvdec_ctx *ctx)
> =C2=A0{
> +	const struct rkvdec_config *cfg =3D ctx->dev->variant->config;
> =C2=A0	unsigned int i, nctrls =3D 0;
> =C2=A0	int ret;
> =C2=A0
> -	for (i =3D 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++)
> -		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
> -			nctrls +=3D rkvdec_coded_fmts[i].ctrls->num_ctrls;
> +	for (i =3D 0; i < cfg->coded_fmts_num; i++)
> +		if (rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability))
> +			nctrls +=3D cfg->coded_fmts[i].ctrls->num_ctrls;
> =C2=A0
> =C2=A0	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
> =C2=A0
> -	for (i =3D 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> -		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability)) {
> -			ret =3D rkvdec_add_ctrls(ctx, rkvdec_coded_fmts[i].ctrls);
> +	for (i =3D 0; i < cfg->coded_fmts_num; i++) {
> +		if (rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability)) {
> +			ret =3D rkvdec_add_ctrls(ctx, cfg->coded_fmts[i].ctrls);
> =C2=A0			if (ret)
> =C2=A0				goto err_free_handler;
> =C2=A0		}
> @@ -1240,13 +1243,20 @@ static void rkvdec_watchdog_func(struct work_stru=
ct *work)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +static const struct rkvdec_config config_rkvdec =3D {
> +	.coded_fmts =3D rkvdec_coded_fmts,
> +	.coded_fmts_num =3D ARRAY_SIZE(rkvdec_coded_fmts),

No true preference, I would intuitively used a sentinel. In any case:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> +};
> +
> =C2=A0static const struct rkvdec_variant rk3288_rkvdec_variant =3D {
> =C2=A0	.num_regs =3D 68,
> +	.config =3D &config_rkvdec,
> =C2=A0	.capabilities =3D RKVDEC_CAPABILITY_HEVC,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct rkvdec_variant rk3328_rkvdec_variant =3D {
> =C2=A0	.num_regs =3D 109,
> +	.config =3D &config_rkvdec,
> =C2=A0	.capabilities =3D RKVDEC_CAPABILITY_HEVC |
> =C2=A0			RKVDEC_CAPABILITY_H264 |
> =C2=A0			RKVDEC_CAPABILITY_VP9,
> @@ -1255,6 +1265,7 @@ static const struct rkvdec_variant rk3328_rkvdec_va=
riant =3D {
> =C2=A0
> =C2=A0static const struct rkvdec_variant rk3399_rkvdec_variant =3D {
> =C2=A0	.num_regs =3D 78,
> +	.config =3D &config_rkvdec,
> =C2=A0	.capabilities =3D RKVDEC_CAPABILITY_HEVC |
> =C2=A0			RKVDEC_CAPABILITY_H264 |
> =C2=A0			RKVDEC_CAPABILITY_VP9,
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.h
> index f35f6e80ea2e..3b1cc511412e 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -71,6 +71,7 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
> =C2=A0
> =C2=A0struct rkvdec_variant {
> =C2=A0	unsigned int num_regs;
> +	const struct rkvdec_config *config;
> =C2=A0	unsigned int capabilities;
> =C2=A0	unsigned int quirks;
> =C2=A0};
> @@ -113,6 +114,11 @@ struct rkvdec_coded_fmt_desc {
> =C2=A0	unsigned int capability;
> =C2=A0};
> =C2=A0
> +struct rkvdec_config {
> +	const struct rkvdec_coded_fmt_desc *coded_fmts;
> +	size_t coded_fmts_num;
> +};
> +
> =C2=A0struct rkvdec_dev {
> =C2=A0	struct v4l2_device v4l2_dev;
> =C2=A0	struct media_device mdev;

--=-eO2lpkzOxBjYInpmHwNq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTnXHAAKCRDZQZRRKWBy
9I55AP97ihjqKsQ4Um0+osxeBqzXH9J+ghH3LP+924VyP2YxCgD/Y1A6SBeKX+R2
Dwdk9Cy7W/KuC0xtMf3xC7+Gz0rDhgs=
=hUsY
-----END PGP SIGNATURE-----

--=-eO2lpkzOxBjYInpmHwNq--

