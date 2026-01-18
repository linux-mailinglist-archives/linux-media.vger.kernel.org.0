Return-Path: <linux-media+bounces-50993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 958A2D39A20
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 23:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 413253009484
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 22:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430992F25E4;
	Sun, 18 Jan 2026 22:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YMfThh1v"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BA423EA93;
	Sun, 18 Jan 2026 22:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768773747; cv=none; b=ga+Btw7cisM50SiuTKjiiaygv4yb9riQL4b27awzrw6P5CJAyafPYXalaGmAmqPjPav/MKWrRueRfk4dyFhU9ovk9sGItWtNcow6LGmoeu4qPQ6rYY/RMtjIwZZ+ZKFxdQ/w4k//bo9jI0Pq+uX0LY2I8/7S+eM1p2btiLIVvQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768773747; c=relaxed/simple;
	bh=0dtGY6Yhs5B5dKLaU9vAVR77d7xoXb5sm/ulCI4orSo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rFaj5uGGe9BXLYb/R5qLm+Bn4+7wkkCkbdlvAj+eg1IjQmctNOSjC0QJCOrgJa2FIYiLUnN6z76e+epXpiXg492cHIsfeaa7m47DRRmBmk6TNbwfn+PNwrI8wp+Y1ggbEK2ryIe2ENSdz+i1beW4uFTJiowlwAnwTpejWXoOzA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YMfThh1v; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768773744;
	bh=0dtGY6Yhs5B5dKLaU9vAVR77d7xoXb5sm/ulCI4orSo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YMfThh1vdndZdTQbHVK70vmBmYX5n4Ypai/+40mZLSN715qe9OcNlxuK5kjYtBNZg
	 ZgbWEN7sI3C6bhp4qZpzme6n2LY8hIrkr3UluS0qKyg/RbJg2K4E7yEzYuyaZ26C2w
	 FK54EI+GCkhVXcFwgpDsS//r5gfghuxE5u6gVfCRMJaLjFEXmjHs5frL7dfVB8s56s
	 twFL+7hff81nkBcFD4FMYgh0owZGdEFvgFnkMtSdmcUaCU6gmDbTYNMIVJWE4f5NIq
	 psWjtX4TjQJQwvcJv7o6js9M7EM4ys9vNng8oo4ZlIC8oXar74g4aYUpMW3jvZvamN
	 9tyawMVhp82wg==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6320517E1274;
	Sun, 18 Jan 2026 23:02:22 +0100 (CET)
Message-ID: <457055556a7d7df2c5e1dc7d924982da73f9c1c1.camel@collabora.com>
Subject: Re: [PATCH v8 09/17] media: rkvdec: Add variant specific coded
 formats list
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
 kernel@collabora.com, Jonas Karlman	 <jonas@kwiboo.se>, Diederik de Haas
 <didi.debian@cknow.org>
Date: Sun, 18 Jan 2026 17:02:20 -0500
In-Reply-To: <20260109161538.1294449-10-detlev.casanova@collabora.com>
References: <20260109161538.1294449-1-detlev.casanova@collabora.com>
	 <20260109161538.1294449-10-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-FALApNwo4B5f7hHCaJGW"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-FALApNwo4B5f7hHCaJGW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 09 janvier 2026 =C3=A0 11:15 -0500, Detlev Casanova a =C3=A9cri=
t=C2=A0:
> Prepare for adding new variants of the decoder and support specific
> formats and format ops per variant.
>=20
> This removes the need of capability flags for variants, so remove them.
>=20
> Tested-by: Diederik de Haas <didi.debian@cknow.org>=C2=A0 # Rock 5B
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0 | 68 ++++++=
++++---------
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.h=C2=A0=C2=A0 |=C2=A0 8 +=
--
> =C2=A02 files changed, 39 insertions(+), 37 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index 776149f871b0..92b1c7b62bd2 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -328,7 +328,6 @@ static const struct rkvdec_coded_fmt_desc rkvdec_code=
d_fmts[] =3D {
> =C2=A0		.ops =3D &rkvdec_hevc_fmt_ops,
> =C2=A0		.num_decoded_fmts =3D ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
> =C2=A0		.decoded_fmts =3D rkvdec_hevc_decoded_fmts,
> -		.capability =3D RKVDEC_CAPABILITY_HEVC,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.fourcc =3D V4L2_PIX_FMT_H264_SLICE,
> @@ -345,7 +344,6 @@ static const struct rkvdec_coded_fmt_desc rkvdec_code=
d_fmts[] =3D {
> =C2=A0		.num_decoded_fmts =3D ARRAY_SIZE(rkvdec_h264_decoded_fmts),
> =C2=A0		.decoded_fmts =3D rkvdec_h264_decoded_fmts,
> =C2=A0		.subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> -		.capability =3D RKVDEC_CAPABILITY_H264,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.fourcc =3D V4L2_PIX_FMT_VP9_FRAME,
> @@ -361,27 +359,38 @@ static const struct rkvdec_coded_fmt_desc rkvdec_co=
ded_fmts[] =3D {
> =C2=A0		.ops =3D &rkvdec_vp9_fmt_ops,
> =C2=A0		.num_decoded_fmts =3D ARRAY_SIZE(rkvdec_vp9_decoded_fmts),
> =C2=A0		.decoded_fmts =3D rkvdec_vp9_decoded_fmts,
> -		.capability =3D RKVDEC_CAPABILITY_VP9,
> =C2=A0	}
> =C2=A0};
> =C2=A0
> -static bool rkvdec_is_capable(struct rkvdec_ctx *ctx, unsigned int capab=
ility)
> -{
> -	return (ctx->dev->variant->capabilities & capability) =3D=3D capability=
;
> -}
> +static const struct rkvdec_coded_fmt_desc rk3288_coded_fmts[] =3D {
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_HEVC_SLICE,
> +		.frmsize =3D {
> +			.min_width =3D 64,
> +			.max_width =3D 4096,
> +			.step_width =3D 64,
> +			.min_height =3D 64,
> +			.max_height =3D 2304,
> +			.step_height =3D 16,
> +		},
> +		.ctrls =3D &rkvdec_hevc_ctrls,
> +		.ops =3D &rkvdec_hevc_fmt_ops,
> +		.num_decoded_fmts =3D ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
> +		.decoded_fmts =3D rkvdec_hevc_decoded_fmts,
> +	}
> +};
> =C2=A0
> =C2=A0static const struct rkvdec_coded_fmt_desc *
> =C2=A0rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
> =C2=A0{
> +	const struct rkvdec_variant *variant =3D ctx->dev->variant;
> =C2=A0	int fmt_idx =3D -1;
> =C2=A0	unsigned int i;
> =C2=A0
> -	for (i =3D 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> -		if (!rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
> -			continue;
> +	for (i =3D 0; i < variant->num_coded_fmts; i++) {
> =C2=A0		fmt_idx++;
> =C2=A0		if (index =3D=3D fmt_idx)
> -			return &rkvdec_coded_fmts[i];
> +			return &variant->coded_fmts[i];
> =C2=A0	}
> =C2=A0
> =C2=A0	return NULL;
> @@ -390,12 +399,12 @@ rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, =
int index)
> =C2=A0static const struct rkvdec_coded_fmt_desc *
> =C2=A0rkvdec_find_coded_fmt_desc(struct rkvdec_ctx *ctx, u32 fourcc)
> =C2=A0{
> +	const struct rkvdec_variant *variant =3D ctx->dev->variant;
> =C2=A0	unsigned int i;
> =C2=A0
> -	for (i =3D 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> -		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability) &&
> -		=C2=A0=C2=A0=C2=A0 rkvdec_coded_fmts[i].fourcc =3D=3D fourcc)
> -			return &rkvdec_coded_fmts[i];
> +	for (i =3D 0; i < variant->num_coded_fmts; i++) {
> +		if (variant->coded_fmts[i].fourcc =3D=3D fourcc)
> +			return &variant->coded_fmts[i];
> =C2=A0	}
> =C2=A0
> =C2=A0	return NULL;
> @@ -1014,21 +1023,19 @@ static int rkvdec_add_ctrls(struct rkvdec_ctx *ct=
x,
> =C2=A0
> =C2=A0static int rkvdec_init_ctrls(struct rkvdec_ctx *ctx)
> =C2=A0{
> +	const struct rkvdec_variant *variant =3D ctx->dev->variant;
> =C2=A0	unsigned int i, nctrls =3D 0;
> =C2=A0	int ret;
> =C2=A0
> -	for (i =3D 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++)
> -		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
> -			nctrls +=3D rkvdec_coded_fmts[i].ctrls->num_ctrls;
> +	for (i =3D 0; i < variant->num_coded_fmts; i++)
> +		nctrls +=3D variant->coded_fmts[i].ctrls->num_ctrls;
> =C2=A0
> =C2=A0	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
> =C2=A0
> -	for (i =3D 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> -		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability)) {
> -			ret =3D rkvdec_add_ctrls(ctx, rkvdec_coded_fmts[i].ctrls);
> -			if (ret)
> -				goto err_free_handler;
> -		}
> +	for (i =3D 0; i < variant->num_coded_fmts; i++) {
> +		ret =3D rkvdec_add_ctrls(ctx, variant->coded_fmts[i].ctrls);
> +		if (ret)
> +			goto err_free_handler;
> =C2=A0	}
> =C2=A0
> =C2=A0	ret =3D v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
> @@ -1242,22 +1249,21 @@ static void rkvdec_watchdog_func(struct work_stru=
ct *work)
> =C2=A0
> =C2=A0static const struct rkvdec_variant rk3288_rkvdec_variant =3D {
> =C2=A0	.num_regs =3D 68,
> -	.capabilities =3D RKVDEC_CAPABILITY_HEVC,
> +	.coded_fmts =3D rk3288_coded_fmts,
> +	.num_coded_fmts =3D ARRAY_SIZE(rk3288_coded_fmts),
> =C2=A0};
> =C2=A0
> =C2=A0static const struct rkvdec_variant rk3328_rkvdec_variant =3D {
> =C2=A0	.num_regs =3D 109,
> -	.capabilities =3D RKVDEC_CAPABILITY_HEVC |
> -			RKVDEC_CAPABILITY_H264 |
> -			RKVDEC_CAPABILITY_VP9,
> +	.coded_fmts =3D rkvdec_coded_fmts,
> +	.num_coded_fmts =3D ARRAY_SIZE(rkvdec_coded_fmts),
> =C2=A0	.quirks =3D RKVDEC_QUIRK_DISABLE_QOS,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct rkvdec_variant rk3399_rkvdec_variant =3D {
> =C2=A0	.num_regs =3D 78,
> -	.capabilities =3D RKVDEC_CAPABILITY_HEVC |
> -			RKVDEC_CAPABILITY_H264 |
> -			RKVDEC_CAPABILITY_VP9,
> +	.coded_fmts =3D rkvdec_coded_fmts,
> +	.num_coded_fmts =3D ARRAY_SIZE(rkvdec_coded_fmts),
> =C2=A0};
> =C2=A0
> =C2=A0static const struct of_device_id of_rkvdec_match[] =3D {
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.h
> index f35f6e80ea2e..8c4f96ba5cde 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -22,10 +22,6 @@
> =C2=A0#include <media/videobuf2-core.h>
> =C2=A0#include <media/videobuf2-dma-contig.h>
> =C2=A0
> -#define RKVDEC_CAPABILITY_HEVC		BIT(0)
> -#define RKVDEC_CAPABILITY_H264		BIT(1)
> -#define RKVDEC_CAPABILITY_VP9		BIT(2)
> -
> =C2=A0#define RKVDEC_QUIRK_DISABLE_QOS	BIT(0)
> =C2=A0
> =C2=A0struct rkvdec_ctx;
> @@ -71,7 +67,8 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
> =C2=A0
> =C2=A0struct rkvdec_variant {
> =C2=A0	unsigned int num_regs;
> -	unsigned int capabilities;
> +	const struct rkvdec_coded_fmt_desc *coded_fmts;
> +	size_t num_coded_fmts;
> =C2=A0	unsigned int quirks;
> =C2=A0};
> =C2=A0
> @@ -110,7 +107,6 @@ struct rkvdec_coded_fmt_desc {
> =C2=A0	unsigned int num_decoded_fmts;
> =C2=A0	const struct rkvdec_decoded_fmt_desc *decoded_fmts;
> =C2=A0	u32 subsystem_flags;
> -	unsigned int capability;
> =C2=A0};
> =C2=A0
> =C2=A0struct rkvdec_dev {

--=-FALApNwo4B5f7hHCaJGW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaW1YbQAKCRDZQZRRKWBy
9PKoAP9blyG76IURGuJQDsnXvY68FS4CTzaBsBCt96rxC8GNuQD+MqOKUtxjU4H8
FSDKxY6G/H2oTHFnUE0bm0qJid+BzgE=
=FJDj
-----END PGP SIGNATURE-----

--=-FALApNwo4B5f7hHCaJGW--

