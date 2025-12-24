Return-Path: <linux-media+bounces-49483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4340CCDC98F
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 15:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0282B30285DF
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 14:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8520B357A4B;
	Wed, 24 Dec 2025 14:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="jNNPR/DR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF26D34E255
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 14:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766587665; cv=none; b=r5RSqFn4vpDR7AKCAPHXh5asBfT8wWoZO3Z91bzGJuJ0f22nTZJmpCtAcDr3I+kKpWuygJ4Cw32KuTrAFOQu7JBEJnk4cx2nFVlMl+fbnh4d7D7Eh0ai2GoP8eL0HwDXWyhspQqjCWLqoyLxu1ZV77U7XVVnFslEhDtkw5lVyLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766587665; c=relaxed/simple;
	bh=7qzSvj3aeiWcpjqtT7Dv1wqlepzRA5DFTHfh3aLKkyY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lZRj4liGRrEM7n7fubOvlyXVWguG0+A48orNAAeCQ3OPJSoBu1s/ZmxeMGwi98ZiUJy/MjsmZKnH2+8zeCI8B1tD6traVqNkrtwRdiGNwjcWSKFLeUhMvjP4AEnoU0o7X2+61eLW+pvSxUneZF4G7yGjO6bozsVKQhgH4EsILCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=jNNPR/DR; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b25dd7ab33so430642185a.1
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 06:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766587663; x=1767192463; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LBEsDivGSChJbJTvUd/3eII9rLd6uaabObDsuMpVJ6k=;
        b=jNNPR/DRwaFiUtlBy3AaZ46m2/4kQWyliUuYYdQdobm9XZBkg+/6BQCzKQwYhIDBNL
         wDYEWXGUkY1mGKufIXcC47wm4ED4vaA6+ybICW/mX8lxnyZ3W80ilHsTpk6S3LnUFJWg
         v660GMhsonrJXZKsg6lJZIa1G8dBvOOMtS4GGqLjhtze0N8M0zM7+M8mBFrsKjpheCDi
         ja2+jK5+NQtsYPRsP+CEZcdUQjSnPbg0kMkIrANrXlJgXcruEjgksKGSO/6k1HFKsEbi
         b/k+0Jn2l88xYc4GBFOvg7O/EYfDBKq2kh6YJzzb4DykNtmi0BubQk2Wuy3jHWgEKt/D
         PRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766587663; x=1767192463;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBEsDivGSChJbJTvUd/3eII9rLd6uaabObDsuMpVJ6k=;
        b=RfnjfY/VR1UwcBiOrdQNIlAUTb8/O8dli1r89GmjMkznGkk8evK49Lmr2QuZcDay46
         SzVpA60qriKgjinDYMKYOgoXd3YRHfDZ256qBJkR4QPylVZSD0xntNCz9ebAx02zCXXY
         Cx/20eh68rMv8oYG+GR1FJkT0ZcYD39ChLFyPY+/tWBnUhB+1FmxSswaXGgS0oSn0bxA
         M3aF0xigM5k/MiYZRgOTJezWgvCeKuinhR26NooPcxVh4V4UOFgJbuyTYlJuNtFWQHhm
         nx/NCoj3DJ3h8MKOnwh/ylng7zFr3EKNAsc7mdueTyEpI9JoCJDvYnuOxHQyG2d8SkF+
         BFoQ==
X-Gm-Message-State: AOJu0YwM+Dj6dyIeyzs3N6HcnESgvYec0STP8L1CZibWJS+ad6Zk8oxp
	KktPwXFW1/Ods9e2LPbNt/FemnEnrdiiKSuBF5RRiZeWkv6pEskMIfZDX5U3njog1cs=
X-Gm-Gg: AY/fxX7BTt6rIdR9VJ8KRqVwA96tsGk9lsaVfD8Zwd9/L/x9UVAoeDjdV3Wp8AgyvNK
	rhUp8K3F42Nnyqt3ianZVpKPJWpS2eYJLc2mnZsLjN2JBUSCK3iX49DFM4EnLe/zakCPHgdSI3k
	YvTLI8gLiRpGqZ0EUqQQl27HRUIgrQE8BiyOKOCvTUmXSwVKyYyVXiNIDQwAE2PwHseJomuXVoB
	LaNNyRjCxTnWuFoE7CbhSAQzScDZlggNchT+kirGoKlzo4+vf1fBNW/a9ugFqwFMvEDFWc0bDso
	kyrPbBUAoHtTbHsDmFlDpnCxyFXDYFJ7/Wd5HCbQN/VFzJCspugTSu5s6pOeVCg8NmQ2iB7P/So
	yVXG44ucybALYHOAOaM4vzaDo2/VlWNQ0lglHxqFjSpXgdRDPTzMf+cby7e2WtvhKJGyR0fc7Mx
	jMLGSIC325FxxQ53AyZN2WMQBG5M4=
X-Google-Smtp-Source: AGHT+IHkL5S7c322hOUPMSd0JRYhx3f5vqqmst0RYftiEEMVjDrbHdesJAI78R34ucxzMcZvnLJBFg==
X-Received: by 2002:a05:620a:17a7:b0:8b2:de6a:e3 with SMTP id af79cd13be357-8c09002815fmr2696981385a.81.1766587662056;
        Wed, 24 Dec 2025 06:47:42 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973f28e3sm1403379885a.45.2025.12.24.06.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 06:47:41 -0800 (PST)
Message-ID: <43c953bd75ad65f249cf71115bb87179b6ba3f47.camel@ndufresne.ca>
Subject: Re: [PATCH v2 03/22] media: v4l2-common: add
 v4l2_fill_pixfmt_mp_aligned helper
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Date: Wed, 24 Dec 2025 09:47:39 -0500
In-Reply-To: <20251203-spu-rga3-v2-3-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-3-989a67947f71@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-mZ8PQwwqOQIytKI71eZq"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-mZ8PQwwqOQIytKI71eZq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> Add a v4l2_fill_pixfmt_mp_aligned helper which allows the user to
> specify a custom stride alignment in bytes. This is necessary for
> hardware like the Rockchip RGA3, which requires the stride value to be
> aligned to a 16 byte boundary.

                  byte -> bytes

You way aligned to bytes here ...


>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/v4l2-core/v4l2-common.c | 34 ++++++++++++++++++++++++=
----------
> =C2=A0include/media/v4l2-common.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++++
> =C2=A02 files changed, 28 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 2c7ac70c0f486..f86e7d7d29b8e 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -404,11 +404,12 @@ static inline unsigned int v4l2_format_block_height=
(const struct v4l2_format_inf
> =C2=A0}
> =C2=A0
> =C2=A0static inline unsigned int v4l2_format_plane_stride(const struct v4=
l2_format_info *info, int plane,
> -						=C2=A0=C2=A0=C2=A0 unsigned int width)
> +						=C2=A0=C2=A0=C2=A0 unsigned int width, u8 alignment)
> =C2=A0{
> =C2=A0	unsigned int hdiv =3D plane ? info->hdiv : 1;
> =C2=A0	unsigned int aligned_width =3D
> =C2=A0		ALIGN(width, v4l2_format_block_width(info, plane));
> +	aligned_width =3D ALIGN(aligned_width, alignment);

But you actually align the width, which can already be achieved using frmsi=
ze-
>step_width and v4l2_apply_frmsize_constraints(). It would make little sens=
e for
the step to not be a multiple of the block for tiled format, but it shows y=
ou
forgot to take into considering the fact that block_width has precedence he=
re,
since you can't split tiles.

If you go back to your original idea, stride alignment, remember that you c=
annot
break the block alignment. For non-mplane format, you also need to special =
case
subsampled planer format (3 planes) so that userspace can guess the subsequ=
ence
plane strides (which is done by dividing the luma plane stride by 2, and if=
 you
need 16 bytes alignment across all strides, then you need the luma plane to=
 be
32 bytes alignment). The mplane format don't have this requirement, since y=
ou
pass explicitly the stride of each planes, though, you may want to double i=
t
anyway for compatibility reason (small cost, big gain).

Nicolas

> =C2=A0
> =C2=A0	return DIV_ROUND_UP(aligned_width, hdiv) *
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->bpp[plane] / info->bpp_=
div[plane];
> @@ -425,9 +426,10 @@ static inline unsigned int v4l2_format_plane_height(=
const struct v4l2_format_inf
> =C2=A0}
> =C2=A0
> =C2=A0static inline unsigned int v4l2_format_plane_size(const struct v4l2=
_format_info *info, int plane,
> -						=C2=A0 unsigned int width, unsigned int height)
> +						=C2=A0 unsigned int width, unsigned int height,
> +						=C2=A0 u8 stride_alignment)
> =C2=A0{
> -	return v4l2_format_plane_stride(info, plane, width) *
> +	return v4l2_format_plane_stride(info, plane, width, stride_alignment) *
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_format_plane_height(info=
, plane, height);
> =C2=A0}
> =C2=A0
> @@ -448,8 +450,9 @@ void v4l2_apply_frmsize_constraints(u32 *width, u32 *=
height,
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(v4l2_apply_frmsize_constraints);
> =C2=A0
> -int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> -			u32 pixelformat, u32 width, u32 height)
> +int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
> +				u32 pixelformat, u32 width, u32 height,
> +				u8 stride_alignment)
> =C2=A0{
> =C2=A0	const struct v4l2_format_info *info;
> =C2=A0	struct v4l2_plane_pix_format *plane;
> @@ -466,23 +469,34 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mpla=
ne *pixfmt,
> =C2=A0
> =C2=A0	if (info->mem_planes =3D=3D 1) {
> =C2=A0		plane =3D &pixfmt->plane_fmt[0];
> -		plane->bytesperline =3D v4l2_format_plane_stride(info, 0, width);
> +		plane->bytesperline =3D v4l2_format_plane_stride(info, 0, width,
> +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stride_alignment);
> =C2=A0		plane->sizeimage =3D 0;
> =C2=A0
> =C2=A0		for (i =3D 0; i < info->comp_planes; i++)
> =C2=A0			plane->sizeimage +=3D
> -				v4l2_format_plane_size(info, i, width, height);
> +				v4l2_format_plane_size(info, i, width, height,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stride_alignment);
> =C2=A0	} else {
> =C2=A0		for (i =3D 0; i < info->comp_planes; i++) {
> =C2=A0			plane =3D &pixfmt->plane_fmt[i];
> =C2=A0			plane->bytesperline =3D
> -				v4l2_format_plane_stride(info, i, width);
> +				v4l2_format_plane_stride(info, i, width,
> +							 stride_alignment);
> =C2=A0			plane->sizeimage =3D plane->bytesperline *
> =C2=A0				v4l2_format_plane_height(info, i, height);
> =C2=A0		}
> =C2=A0	}
> =C2=A0	return 0;
> =C2=A0}
> +EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp_aligned);
> +
> +int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> +			u32 pixelformat, u32 width, u32 height)
> +{
> +	return v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat,
> +					=C2=A0=C2=A0 width, height, 1);
> +}
> =C2=A0EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp);
> =C2=A0
> =C2=A0int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelforma=
t,
> @@ -502,12 +516,12 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt=
, u32 pixelformat,
> =C2=A0	pixfmt->width =3D width;
> =C2=A0	pixfmt->height =3D height;
> =C2=A0	pixfmt->pixelformat =3D pixelformat;
> -	pixfmt->bytesperline =3D v4l2_format_plane_stride(info, 0, width);
> +	pixfmt->bytesperline =3D v4l2_format_plane_stride(info, 0, width, 1);
> =C2=A0	pixfmt->sizeimage =3D 0;
> =C2=A0
> =C2=A0	for (i =3D 0; i < info->comp_planes; i++)
> =C2=A0		pixfmt->sizeimage +=3D
> -			v4l2_format_plane_size(info, i, width, height);
> +			v4l2_format_plane_size(info, i, width, height, 1);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 401d8506c24b5..edd416178c333 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -558,6 +558,10 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt,=
 u32 pixelformat,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 u32 width, u32 height);
> =C2=A0int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 =
pixelformat,
> =C2=A0			u32 width, u32 height);
> +/* @stride_alignment is a power of 2 value in bytes */
> +int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
> +				u32 pixelformat, u32 width, u32 height,
> +				u8 stride_alignment);
> =C2=A0
> =C2=A0/**
> =C2=A0 * v4l2_get_link_freq - Get link rate from transmitter

--=-mZ8PQwwqOQIytKI71eZq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUv9CwAKCRDZQZRRKWBy
9GnoAP9k199P3pJOTxl16yVHL1ryd4uoElf1GW6VBr1Og/rjyAEAlxzgLGtwgB8C
GSr0/lkk8PfDbueJp3vtdCkiH0HR2wI=
=+slk
-----END PGP SIGNATURE-----

--=-mZ8PQwwqOQIytKI71eZq--

