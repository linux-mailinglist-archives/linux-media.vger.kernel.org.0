Return-Path: <linux-media+bounces-48592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEBECB3F95
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 21:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B58C300EA39
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 20:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DCC232C935;
	Wed, 10 Dec 2025 20:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EjPicjF3"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEAF1C6FF5;
	Wed, 10 Dec 2025 20:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765398926; cv=none; b=U/DAwKwnACJg7QRdQR1qYZGqye7gGT60jqAFlodoE9n8jLRUghUkMiPm/PxUCRZiyBFPLxkWMG+d3NoRr0OXqjiyAVNJueNNjQVHrh3kKHba6/VHJ4T+b5YBxXFMZIYnKts+LRgTPqya7LCz+H8EkfG8jTpLBDLQvlYANe6o6V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765398926; c=relaxed/simple;
	bh=5+vrNwl93Id1PXIw96xyGGMRLHpDWV+CK4wM+7xVGX4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V0mJ4wuU8A5zwqE+CDT7Xt4aOm65xMINqcqT44SJ0euGtIyyMY1WGxC/uBa6StQHJexo+8QZNT/r/xLtwCE0BNzVTzDCLIz4mOoLFF+rnjny/f+jhIvIcck5dVBho/siQlTDFTq1CP48b1eyZpdc6npLBPrb8rfp8M4+rGEdHFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EjPicjF3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765398922;
	bh=5+vrNwl93Id1PXIw96xyGGMRLHpDWV+CK4wM+7xVGX4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=EjPicjF3iCUtuciZMpSN5Mxya31F0ctqetMe+YrPhdQ43DmJi+ivkJS+SnzrCRyY9
	 mnRCP/8y6mBsq5XQVgK1dGokXlDL5tu0lUehc59i4qblXZqaiw/a5U/Y4B5zs+FriQ
	 8NU78Bgbwq/Rr0pFM18ewTt8UyR+jIwAWbAW9q80gYtOV/zILSFfkZJ4bATtzxYLLT
	 QZvru2wnV/ujppTQgtcfOY1nFMbl/EvIRTwI0KAmCq3JvOW1/yFofFSW65ru+GrwAa
	 kySRFmW7Rn1OyEqDCIHIEtMCasRlomhFVPh8luUXQ70xJd+UU/5VyOfcFg0nLqm7qC
	 vs9Qo6g3/J4uw==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C53917E12FE;
	Wed, 10 Dec 2025 21:35:20 +0100 (CET)
Message-ID: <4c66b55f96577cd615d114cb1b7482f5fc6a991a.camel@collabora.com>
Subject: Re: [PATCH v4 10/15] media: rkvdec: Support per-variant interrupt
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
 kernel@collabora.com, Diederik de Haas	 <didi.debian@cknow.org>
Date: Wed, 10 Dec 2025 15:35:19 -0500
In-Reply-To: <20251022174508.284929-11-detlev.casanova@collabora.com>
References: <20251022174508.284929-1-detlev.casanova@collabora.com>
	 <20251022174508.284929-11-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-Ny7raT137ieRFwbGvR1e"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-Ny7raT137ieRFwbGvR1e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 22 octobre 2025 =C3=A0 13:45 -0400, Detlev Casanova a =C3=A9cri=
t=C2=A0:
> Preparation commit for supporting different variants with different
> interrupt management.
>=20
> Tested-by: Diederik de Haas <didi.debian@cknow.org>=C2=A0 # Rock 5B
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.c | 15 ++++++++++++--=
-
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.h |=C2=A0 1 +
> =C2=A02 files changed, 13 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index 5dd486edd64d..b0e90c9b826e 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1218,10 +1218,9 @@ static void rkvdec_iommu_restore(struct rkvdec_dev=
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
> @@ -1242,6 +1241,15 @@ static irqreturn_t rkvdec_irq_handler(int irq, voi=
d *priv)
> =C2=A0	return IRQ_HANDLED;
> =C2=A0}
> =C2=A0
> +static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
> +{
> +	struct rkvdec_dev *rkvdec =3D priv;
> +	struct rkvdec_ctx *ctx =3D v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
> +	const struct rkvdec_config *cfg =3D rkvdec->variant->config;
> +
> +	return cfg->irq_handler(ctx);
> +}
> +
> =C2=A0static void rkvdec_watchdog_func(struct work_struct *work)
> =C2=A0{
> =C2=A0	struct rkvdec_dev *rkvdec;
> @@ -1260,6 +1268,7 @@ static void rkvdec_watchdog_func(struct work_struct=
 *work)
> =C2=A0static const struct rkvdec_config config_rkvdec =3D {
> =C2=A0	.coded_fmts =3D rkvdec_coded_fmts,
> =C2=A0	.coded_fmts_num =3D ARRAY_SIZE(rkvdec_coded_fmts),
> +	.irq_handler =3D rk3399_irq_handler,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct rkvdec_variant rk3288_rkvdec_variant =3D {
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.h
> index 74f71542e031..dfafb2c2cbc1 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -121,6 +121,7 @@ struct rkvdec_config {
> =C2=A0	size_t coded_fmts_num;
> =C2=A0	const struct rcb_size_info *rcb_size_info;
> =C2=A0	size_t rcb_num;
> +	irqreturn_t (*irq_handler)(struct rkvdec_ctx *ctx);

Its a tiny little odd to mix function pointers and configuration. I don't h=
ave a
great proposal, is that going to be the only function pointer ? perhaps cg-=
>ops
? I'm not sure. Its just a small annoyance, I'll leave to you.

Nicolas

> =C2=A0};
> =C2=A0
> =C2=A0struct rkvdec_dev {

--=-Ny7raT137ieRFwbGvR1e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTnZhwAKCRDZQZRRKWBy
9E+TAP9vPu64XdAbrUUglQBq9Zdsz4UdT7SgeSBvND6Al4EaJAEA7SiFSCEoKzPk
W5MLqn8zueRe9lhG/LQ6sGolfYirQwY=
=1uI4
-----END PGP SIGNATURE-----

--=-Ny7raT137ieRFwbGvR1e--

