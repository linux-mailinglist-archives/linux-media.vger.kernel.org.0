Return-Path: <linux-media+bounces-36341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7878BAEE755
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 21:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B48A3B8D50
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 19:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7313A28C2C7;
	Mon, 30 Jun 2025 19:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="csFlK6KM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11AB1A3178
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 19:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751311005; cv=none; b=AhMwYmWa5Ol2r/gZF/ZjtO4KuvJXVZIFYS0Je5wyzv0rs4xqf3n/1S3o08OCyuobv71YBC1Elp3T0YrkIOcmoEBjHs7Kxy9pqd9cpPZLJCCl08xj/c8fSTtxY2zOVEWzMueNFNFnQ4ltB7bm5sGlx3ufC2MoEu8He8ZeqqmvTpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751311005; c=relaxed/simple;
	bh=BkVPf9VvjyU/6g05e8LRsSJlmFpCQMsrY6Q+ll0m+4A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E8dmauIK5XHqMOFzXLT4zSf8L2sJgu8fOCytee1aDBx/dQCqPxoqEhQF8xV5nnpz55t6g6KlqxrUsnY6fqTB5aIlx+4++R9RUT1FD7ChtvFu+lalSQS8QPNlLZU/QjnC1XYSJxw/4Htv83/QTwjCB8HxSAWXGEOpbOOLiNW3Ac8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=csFlK6KM; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a6f3f88613so27468811cf.1
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 12:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1751311003; x=1751915803; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zR6ngs40KDKrfuQ8uGrYMi9KPu0z0Fij7dHU34pFebA=;
        b=csFlK6KMugkCgLD5u877Qh/Ryzupv9A4ixxm3eViRuOaIv7pQd1UIs/meiACWd6Lv/
         nw8W+bNZTCESlbMMmoowu0VP6/8qITcL4zq2ZwPQKLiDBuoI4hTCWJ9u9+OzNLvHA9MQ
         5ZKCr6EAHetAcBCt6LIpPK366sBaZ3RwIJzFt3FzJu/u24Bs35aMlFP8ZDGezEDTVKKX
         sMMWq6N7TJ/gXezfpjE8DK7x5TLpN3qPHrVcwMiZCtcuguQGqFygO2qvx5zsu1p/vowM
         2L3dMe8qgRC4kyHDR4z1pk+y4zRdLCZZfnttqCTQzSw5MeD3P7BN5GbQaCRR8rKTpIbd
         IPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751311003; x=1751915803;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zR6ngs40KDKrfuQ8uGrYMi9KPu0z0Fij7dHU34pFebA=;
        b=c8LNWObfYQNcttORpfqzC5FkFdAqXbUYyqt3jKw1hNieyETvKXqforAcsagGj+8x5o
         mjcPwy+qQtFTaEOcXCyhIr3N+vZZD8lYKWTtl49JdHs9S1IEFCCA+61Uj/lmhZ0yFTjj
         HmUoTy7A6+0HN4gsRoxxHwmMY2pxhTaQAKuCaskiQA+Dm9sTP2RZoLpMG5LuijBcb3f8
         0Ko6yPm3WtipoIw3+HTEuQgGABSu2NXeHfVwUALZklSsiqn0oYRGm1j/Ro2GHV2X7JYB
         L1ApW3yvN4fZfEXm7zXdh2yPDZ3LQ6sNBNymRsZF+k0CJ3b8qGB/XHmUa0U+Qwmb8z9V
         1Zjg==
X-Forwarded-Encrypted: i=1; AJvYcCWYQ+Nil/TcF8al2NuNsgK1Mw3CQ4xhD56Ym7IpZ2ro6tz3DR6EMeSv89Eby2diPPRbDklpawm60mLXUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJwCqq+JXSzOdO5sVwA/pHYLXOXNY3FRigGiCJD7UuK4X/5V9q
	4fn+rjXeT1ZHbRWp/7beD7+N0eAOpVgyEhm8kzmmQ/MsQH2YmCkuD8w90f2RfzS5tHk=
X-Gm-Gg: ASbGncvjzTLO3LrmdTcw5poVX6J9X+10Gjyqu7G/4j2nB4dkUjky2lEs2rX96WocZQC
	PdH53RG5fEeMZUUj9E0VSScYW/JE8+uF+aYJcfbQKUwwA7ZgqpB6CHbVO3/5WgdsnwzGPHp0SCT
	XWFRqUvR19niUPvMNsRQhyneVIW4iD7d3N8c+NcZPSBjBn7ERjbTfiS5C7sJSqR0/UfGPDVP5pZ
	izZxK+WDIRPoTLh/maa9zWs7SBHnTMPkYNRh+KnyGsxq65CteLEL9RcqVgDhK+d+Zz4pssHrPu1
	efOaK/ykPvKdjH8id+xQGbyVZUz+I2XpuaaEcBQcadtTvn+toXSFmC7KPWPhb0S3ILg=
X-Google-Smtp-Source: AGHT+IESAXpZrbCN9sq0IGqWEgBIgw7TERMevL4glDJMzoeekiYHSxfwJOAsDJinhURnk5aOEcbJIw==
X-Received: by 2002:a05:622a:2611:b0:4a7:14c3:7405 with SMTP id d75a77b69052e-4a7fcbb0be4mr267384891cf.27.1751311002729;
        Mon, 30 Jun 2025 12:16:42 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::c41? ([2606:6d00:17:b699::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc57d81asm63480201cf.65.2025.06.30.12.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 12:16:41 -0700 (PDT)
Message-ID: <82be6ca4c33d394fc52fbe2a90362fa6955d0a47.camel@ndufresne.ca>
Subject: Re: [PATCH] media: cedrus: Add support for additional output formats
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Paul Kocialkowski <paulk@sys-base.io>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Hans Verkuil <hans@jjverkuil.nl>,  Jernej Skrabec
 <jernej.skrabec@siol.net>
Date: Mon, 30 Jun 2025 15:16:40 -0400
In-Reply-To: <20250523154359.2454180-1-paulk@sys-base.io>
References: <20250523154359.2454180-1-paulk@sys-base.io>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0MU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT6ImQQTFg
 oAQQIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBO8NUoEVxMPCGgRvEtlBlFEpYHL0BQJ
 oLLLGBQkJZfd1AAoJENlBlFEpYHL0BEkA/3qkWYt99myYFSmTJUF8UB/7OroEm3vr1HRqXeQe9Qp2
 AP0bsoAe6KjEPa/pJfuJ2khrOPPHxvyt/PBNbI5BYcIABLQnTmljb2xhcyBEdWZyZXNuZSA8bmljb
 2xhc0BuZHVmcmVzbmUuY2E+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQ
 TvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyy+AUJCWX3dQAKCRDZQZRRKWBy9FJ5AQCNy8SX8DpHbLa
 cy58vgDwyIpB89mok9eWGGejY9mqpRwEAhHzs+/n5xlVlM3bqy1yHnAzJqVwqBE1D0jG0a9V6VQI=
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-PkVzrifhkU38IZasPoP3"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-PkVzrifhkU38IZasPoP3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Hi Paul, Jernej,

Le vendredi 23 mai 2025 =C3=A0 17:43 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> From: Jernej Skrabec <jernej.skrabec@siol.net>
>=20
> If VPU supports untiled output, it actually supports several different
> YUV 4:2:0 layouts, namely NV12, NV21, YUV420 and YVU420.
>=20
> Add support for all of them.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>=20
> Looks like this patch never made it, sorry about that.
> I've rebased it atop media/next and added my Reviewed-by tag.
> ---
> =C2=A0drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 18 +++++++++++++++=
++-
> =C2=A0.../staging/media/sunxi/cedrus/cedrus_video.c=C2=A0 | 18 ++++++++++=
++++++++
> =C2=A02 files changed, 35 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> index 32af0e96e762..168d89c5a16d 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> @@ -86,9 +86,25 @@ void cedrus_dst_format_set(struct cedrus_dev *dev,
> =C2=A0
> =C2=A0	switch (fmt->pixelformat) {
> =C2=A0	case V4L2_PIX_FMT_NV12:
> +	case V4L2_PIX_FMT_NV21:
> +	case V4L2_PIX_FMT_YUV420:
> +	case V4L2_PIX_FMT_YVU420:
> =C2=A0		chroma_size =3D ALIGN(width, 16) * ALIGN(height, 16) / 2;
> =C2=A0
> -		reg =3D VE_PRIMARY_OUT_FMT_NV12;
> +		switch (fmt->pixelformat) {
> +		case V4L2_PIX_FMT_NV12:
> +			reg =3D VE_PRIMARY_OUT_FMT_NV12;
> +			break;
> +		case V4L2_PIX_FMT_NV21:
> +			reg =3D VE_PRIMARY_OUT_FMT_NV21;
> +			break;
> +		case V4L2_PIX_FMT_YUV420:
> +			reg =3D VE_PRIMARY_OUT_FMT_YU12;
> +			break;
> +		case V4L2_PIX_FMT_YVU420:

Just so its recorded, Hans added a default: case here while applying.

regards,
Nicolas

> +			reg =3D VE_PRIMARY_OUT_FMT_YV12;
> +			break;
> +		}
> =C2=A0		cedrus_write(dev, VE_PRIMARY_OUT_FMT, reg);
> =C2=A0
> =C2=A0		reg =3D chroma_size / 2;
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> index 77f78266f406..9fae2c7493d0 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -64,6 +64,21 @@ static struct cedrus_format cedrus_formats[] =3D {
> =C2=A0		.pixelformat	=3D V4L2_PIX_FMT_NV12_32L32,
> =C2=A0		.directions	=3D CEDRUS_DECODE_DST,
> =C2=A0	},
> +	{
> +		.pixelformat	=3D V4L2_PIX_FMT_NV21,
> +		.directions	=3D CEDRUS_DECODE_DST,
> +		.capabilities	=3D CEDRUS_CAPABILITY_UNTILED,
> +	},
> +	{
> +		.pixelformat	=3D V4L2_PIX_FMT_YUV420,
> +		.directions	=3D CEDRUS_DECODE_DST,
> +		.capabilities	=3D CEDRUS_CAPABILITY_UNTILED,
> +	},
> +	{
> +		.pixelformat	=3D V4L2_PIX_FMT_YVU420,
> +		.directions	=3D CEDRUS_DECODE_DST,
> +		.capabilities	=3D CEDRUS_CAPABILITY_UNTILED,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0#define CEDRUS_FORMATS_COUNT	ARRAY_SIZE(cedrus_formats)
> @@ -140,6 +155,9 @@ void cedrus_prepare_format(struct v4l2_pix_format
> *pix_fmt)
> =C2=A0		break;
> =C2=A0
> =C2=A0	case V4L2_PIX_FMT_NV12:
> +	case V4L2_PIX_FMT_NV21:
> +	case V4L2_PIX_FMT_YUV420:
> +	case V4L2_PIX_FMT_YVU420:
> =C2=A0		/* 16-aligned stride. */
> =C2=A0		bytesperline =3D ALIGN(width, 16);
> =C2=A0

--=-PkVzrifhkU38IZasPoP3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaGLimAAKCRDZQZRRKWBy
9PJgAP9YO0WJH/NNq+CaJXSgK9tAYcGlb9/A+rt2u9ac3/xO2QD/SGzZr5aodnIh
3ut2Ast1YM6fTcN+X5020Z2kjtkjGgc=
=mibq
-----END PGP SIGNATURE-----

--=-PkVzrifhkU38IZasPoP3--

