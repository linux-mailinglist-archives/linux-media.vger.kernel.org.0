Return-Path: <linux-media+bounces-41191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2D9B384FA
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 16:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A36B13BD019
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 14:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D6F15C158;
	Wed, 27 Aug 2025 14:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cZ1SMbSd"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361261E502;
	Wed, 27 Aug 2025 14:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756305047; cv=none; b=QO4misQ6i+3o8tBCH8D8GKfJgs9ymCwJEs6nTulMh977MlaZMJ/DS/+NxQG5mBjgB4RvsQecWrOZZFcjhlobtDUkRn3q3vwIKTHZvWMNZQK6YYQPCTMm9VWh9g5aVSZk4YyhsZDWKz8ehj/Em2ts6nMiC/LHNsgt86NIRaemdOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756305047; c=relaxed/simple;
	bh=CWGN5QyW8aVzuD8JBXllBiTdxeWOyRl6ea0U+Z16DpI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qkS8Db9DpCO4QC8G/chkd8scPA6UUbYgNtVwSh5vZ0+KgFKts/vYD67HfyE6qTrqLtRCCasxSULXZivW7RimbgbF8Vp19J4/bw4SGKjar9fB324V3PzKhL6mYLprA2u4e/IyZZ9wjwMAWyutjQj7mnCWsWXtl8uBP9FLF+JZrdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cZ1SMbSd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756305043;
	bh=CWGN5QyW8aVzuD8JBXllBiTdxeWOyRl6ea0U+Z16DpI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=cZ1SMbSd636b2ZoAm3iGxxvRLaIst6oNUWncvK1P88krSvUJSbxUPfBXJU7ThxPSj
	 /d2wXNiEEyvcCO7NQ/6gHIy9BiO5++fOn0IrnUiw0SqmX+9CZplfYrUqZdJl4oP77t
	 zWmV7TI7pjUgEtzmEyG9qeD4LWryovI5ZYTAFSzvWCLmeiNpbp65P65PI/UuVidSQM
	 uPhRUVvbAaPEyfPZaAowE+xP6NQgdMh4n/bsnnNWuWQH5RJKXFG1JYl+mhZj2nFkGN
	 zoEogniqlZ8J3BIpI7Wy+35bHhtjrnER/YFQnnBOUIPKrsS3ZNE6ioCghOKlgKA0Wf
	 Rggff6S2EHA8g==
Received: from [IPv6:2606:6d00:11:5a76::c41] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 78E0617E0B85;
	Wed, 27 Aug 2025 16:30:42 +0200 (CEST)
Message-ID: <ee7416c9db2128ab1a8c1bbdc7cd231da21e5b53.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicon: Explicitly disable all encoder
 ioctls for decoders
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel
	 <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Wed, 27 Aug 2025 10:30:40 -0400
In-Reply-To: <20250826190416.1287089-1-paulk@sys-base.io>
References: <20250826190416.1287089-1-paulk@sys-base.io>
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
	protocol="application/pgp-signature"; boundary="=-lds37cTVM1G5QNteAxvi"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-lds37cTVM1G5QNteAxvi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Le mardi 26 ao=C3=BBt 2025 =C3=A0 21:04 +0200, Paul Kocialkowski a =C3=A9cr=
it=C2=A0:
> Call the dedicated v4l2_disable_ioctl helper instead of manually
> checking whether the current context is an encoder for the selection
> ioctls.
>=20
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
> =C2=A0drivers/media/platform/verisilicon/hantro_drv.c=C2=A0 | 2 ++
> =C2=A0drivers/media/platform/verisilicon/hantro_v4l2.c | 6 ++----
> =C2=A02 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c
> b/drivers/media/platform/verisilicon/hantro_drv.c
> index 4cc9d00fd293..6fb28a6293e7 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -916,6 +916,8 @@ static int hantro_add_func(struct hantro_dev *vpu,
> unsigned int funcid)
> =C2=A0		vpu->decoder =3D func;
> =C2=A0		v4l2_disable_ioctl(vfd, VIDIOC_TRY_ENCODER_CMD);
> =C2=A0		v4l2_disable_ioctl(vfd, VIDIOC_ENCODER_CMD);
> +		v4l2_disable_ioctl(vfd, VIDIOC_G_SELECTION);
> +		v4l2_disable_ioctl(vfd, VIDIOC_S_SELECTION);

Disabling this IOCTL for JPEG is fine, but for VP8, H.264, HEVC, VP9 and AV=
1, it
is pretty much mandatory. Otherwise your stream will advertise the padded
dimentions and there would be no way to tell it that what is the cropping w=
indow
for bitstream generation purpose. Considering you are looking forward addin=
g
H.264 encoding, do you really want to apply this fix ?

Nicolas

> =C2=A0	}
> =C2=A0
> =C2=A0	video_set_drvdata(vfd, vpu);
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c
> b/drivers/media/platform/verisilicon/hantro_v4l2.c
> index 6bcd892e7bb4..fcf3bd9bcda2 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -663,8 +663,7 @@ static int vidioc_g_selection(struct file *file, void
> *priv,
> =C2=A0	struct hantro_ctx *ctx =3D file_to_ctx(file);
> =C2=A0
> =C2=A0	/* Crop only supported on source. */
> -	if (!ctx->is_encoder ||
> -	=C2=A0=C2=A0=C2=A0 sel->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
> +	if (sel->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
> =C2=A0		return -EINVAL;
> =C2=A0
> =C2=A0	switch (sel->target) {
> @@ -696,8 +695,7 @@ static int vidioc_s_selection(struct file *file, void
> *priv,
> =C2=A0	struct vb2_queue *vq;
> =C2=A0
> =C2=A0	/* Crop only supported on source. */
> -	if (!ctx->is_encoder ||
> -	=C2=A0=C2=A0=C2=A0 sel->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
> +	if (sel->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
> =C2=A0		return -EINVAL;
> =C2=A0
> =C2=A0	/* Change not allowed if the queue is streaming. */

--=-lds37cTVM1G5QNteAxvi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaK8WkAAKCRDZQZRRKWBy
9Dy5AP9BlYKxmYz3Vh7ZeTTdQOGB/NmwSTfOJ6Fru/KbSjvVuAEAqEBrdJ8AYj/C
xBY4IL6675kS8V2F/EWZbXTkg/jwtwg=
=5Uaf
-----END PGP SIGNATURE-----

--=-lds37cTVM1G5QNteAxvi--

