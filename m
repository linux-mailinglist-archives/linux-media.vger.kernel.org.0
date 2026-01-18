Return-Path: <linux-media+bounces-50996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A38EBD39A67
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 23:12:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81E33300C5D5
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 22:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263E430C601;
	Sun, 18 Jan 2026 22:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="at35WDEG"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3969E29D29F;
	Sun, 18 Jan 2026 22:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768774365; cv=none; b=KchDKYrNyW3yQMx5rWuUq/j1MIuWW//TuLYnV1jP3htDlZ5IlgADZJV+cTlvpHRozBzQeh4KTN8YXu2L2sbjjz7PwdUbLjaONVUBxJpIj4BC/cS+PXwhmv4M7Fn4eawhJrwFR1MeSe4KdoSYs43lZADNU5i9xv2Qfm/JXKk64Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768774365; c=relaxed/simple;
	bh=yiv/l79VtpVG1KuLhly6us+bTKcuRvQGzcXTOVwGiYs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IGxp3knEEkrqcCvRw5fTn4R4nPUkb8YTVYe9y7w2jj42K0zctoqeGGqs7NLQ2/lbMPm8FWfuiFnhwEVi0MmI1Noftd8LPnMsfXW0FGV9Fmxt/4xyLY9cUrJgMna0tXMD8POW7Z9CoUfANKAA4UFCVnFdWP7gny9v2gZGwU7C3TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=at35WDEG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768774362;
	bh=yiv/l79VtpVG1KuLhly6us+bTKcuRvQGzcXTOVwGiYs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=at35WDEGRf57JCsN6kjQsOTWP1a7GCRPbt3ACQ/qAgF5HzeC2CNDB0uZU7fIukXSm
	 ictqXPJuhP8oBsRO+EtrvugEZ1tWlyP1g06j53aNzmIEZ+xrJWTmpT8GKLzGf9RJsf
	 R84zDjjbNBXUpu3JE1yX4hRrRKZV6i4zRxJY/R34WRatRUspFcs+0ftbgfm7wExWW6
	 km6mg8RkiSxRnX7lMqsP92TRXa8jiMRN3TQFzaHm+LpkeEhcHAd+zTBlsjyY45RTlX
	 zdWHy7KhJxrCzS4R9rfxVLDCDLzZD1Q/YpQxvEo7fVcO/JJMajxVEzciCqS3I+y44H
	 ZsuU0DQXywIqQ==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6004017E0222;
	Sun, 18 Jan 2026 23:12:40 +0100 (CET)
Message-ID: <abb909f0c3e435f2c97748c7edd8d555d61a8240.camel@collabora.com>
Subject: Re: [PATCH v8 11/17] media: rkvdec: Support per-variant interrupt
 handler
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
Date: Sun, 18 Jan 2026 17:12:38 -0500
In-Reply-To: <20260109161538.1294449-12-detlev.casanova@collabora.com>
References: <20260109161538.1294449-1-detlev.casanova@collabora.com>
	 <20260109161538.1294449-12-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-3F7AL5T1m7dsOWBeuMMz"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-3F7AL5T1m7dsOWBeuMMz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 09 janvier 2026 =C3=A0 11:15 -0500, Detlev Casanova a =C3=A9cri=
t=C2=A0:
> Prepare for supporting different variants with different interrupt
> managers.
>=20
> To support other variants specific function type later, introduce the
> rkvdec_variant_ops struct.
>=20
> Tested-by: Diederik de Haas <didi.debian@cknow.org>=C2=A0 # Rock 5B
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0 | 21 ++++++=
++++++++++---
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.h=C2=A0=C2=A0 |=C2=A0 5 +=
++++
> =C2=A02 files changed, 23 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index ff6a09e45462..174536ebdcc7 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1222,10 +1222,9 @@ static void rkvdec_iommu_restore(struct rkvdec_dev=
 *rkvdec)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> -static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
> +static irqreturn_t rk3399_irq_handler(struct rkvdec_ctx *ctx)
> =C2=A0{
> -	struct rkvdec_dev *rkvdec =3D priv;
> -	struct rkvdec_ctx *ctx =3D v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
> +	struct rkvdec_dev *rkvdec =3D ctx->dev;
> =C2=A0	enum vb2_buffer_state state;
> =C2=A0	u32 status;
> =C2=A0
> @@ -1246,6 +1245,15 @@ static irqreturn_t rkvdec_irq_handler(int irq, voi=
d *priv)
> =C2=A0	return IRQ_HANDLED;
> =C2=A0}
> =C2=A0
> +static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
> +{
> +	struct rkvdec_dev *rkvdec =3D priv;
> +	struct rkvdec_ctx *ctx =3D v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
> +	const struct rkvdec_variant *variant =3D rkvdec->variant;
> +
> +	return variant->ops->irq_handler(ctx);
> +}
> +
> =C2=A0static void rkvdec_watchdog_func(struct work_struct *work)
> =C2=A0{
> =C2=A0	struct rkvdec_dev *rkvdec;
> @@ -1261,16 +1269,22 @@ static void rkvdec_watchdog_func(struct work_stru=
ct *work)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +static const struct rkvdec_variant_ops rk3399_variant_ops =3D {
> +	.irq_handler =3D rk3399_irq_handler,
> +};
> +
> =C2=A0static const struct rkvdec_variant rk3288_rkvdec_variant =3D {
> =C2=A0	.num_regs =3D 68,
> =C2=A0	.coded_fmts =3D rk3288_coded_fmts,
> =C2=A0	.num_coded_fmts =3D ARRAY_SIZE(rk3288_coded_fmts),
> +	.ops =3D &rk3399_variant_ops,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct rkvdec_variant rk3328_rkvdec_variant =3D {
> =C2=A0	.num_regs =3D 109,
> =C2=A0	.coded_fmts =3D rkvdec_coded_fmts,
> =C2=A0	.num_coded_fmts =3D ARRAY_SIZE(rkvdec_coded_fmts),
> +	.ops =3D &rk3399_variant_ops,
> =C2=A0	.quirks =3D RKVDEC_QUIRK_DISABLE_QOS,
> =C2=A0};
> =C2=A0
> @@ -1278,6 +1292,7 @@ static const struct rkvdec_variant rk3399_rkvdec_va=
riant =3D {
> =C2=A0	.num_regs =3D 78,
> =C2=A0	.coded_fmts =3D rkvdec_coded_fmts,
> =C2=A0	.num_coded_fmts =3D ARRAY_SIZE(rkvdec_coded_fmts),
> +	.ops =3D &rk3399_variant_ops,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct of_device_id of_rkvdec_match[] =3D {
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.h
> index 751f39afe7e2..faabedd2b9d8 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -67,12 +67,17 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
> =C2=A0			=C2=A0=C2=A0=C2=A0 base.vb.vb2_buf);
> =C2=A0}
> =C2=A0
> +struct rkvdec_variant_ops {
> +	irqreturn_t (*irq_handler)(struct rkvdec_ctx *ctx);
> +};
> +
> =C2=A0struct rkvdec_variant {
> =C2=A0	unsigned int num_regs;
> =C2=A0	const struct rkvdec_coded_fmt_desc *coded_fmts;
> =C2=A0	size_t num_coded_fmts;
> =C2=A0	const struct rcb_size_info *rcb_sizes;
> =C2=A0	size_t num_rcb_sizes;
> +	const struct rkvdec_variant_ops *ops;
> =C2=A0	unsigned int quirks;
> =C2=A0};
> =C2=A0

--=-3F7AL5T1m7dsOWBeuMMz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaW1a1wAKCRDZQZRRKWBy
9OsBAP96ASIfjY1JZu/MyVbRKn9Xo1lCrjCpE1aBQc0ully+qAEApr36RA7o31Kp
yQPN1Gsx+hY+nRFLDxc8URd6vUjtzQc=
=Nehe
-----END PGP SIGNATURE-----

--=-3F7AL5T1m7dsOWBeuMMz--

