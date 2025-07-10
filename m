Return-Path: <linux-media+bounces-37332-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D298B0076B
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BFB116D3AD
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 15:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26882727F2;
	Thu, 10 Jul 2025 15:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="HK93sud0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D93F23ABA6
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 15:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752161839; cv=none; b=JkbCizjRJFW0Xs3MmDQzF+EVnpvwNCDHCfLnK09NXqgEI9I+DBRWO6iKtHvtJEzjD46YzNEUD5yu4rdoa/3dAlT2ILYs5WKAt1wWaXjzT79hm+h2gJh9UxUn/v5d2dXBdcCwQUivgBTwCvVwNLtu17u6T0XSDiq+fGbE49PkuaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752161839; c=relaxed/simple;
	bh=euKKaDtjbLOjzjO2sx05eK7dpU24Z6yNS/2JY/rlwE8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tufK3C1kdPoP973YR48s2ZCu4aBcmDPgQDyvEhBnVN0YWIna1/UC9N13vmWHcdDNXXPzmQMyLQbP4EG0rj6k1oDRhjBv3wWwAd1q0udn4rIUqY3o1G6GsGljAiz3UIZKxjNxRFXQ5ZAlVBQl80sYKsZgDIZHVBGciLlHFzMUgtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=HK93sud0; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d0a2220fb0so138217385a.3
        for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 08:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1752161836; x=1752766636; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oI9o9HDqHku6blLWYaJ2+hsF6bFi8b5iXJq9d3e9EDk=;
        b=HK93sud0oa1C4z4uIlYWq/tDdBI5kAWGs1mBAVSlLGLUHOz2GMTgp5d1V0TOrYl/j9
         UV272ulS46krd/h5fIxZqpSiQh6N8+AOF4dnzxmk7aWFl71lNJkAtqrAtshjFbxkwWPR
         dxuejQWSqMuqmgyrIq1Ly812ylBMPCanUlO30ELZWoX3iQyCF8s3HeEJW6bs4FZBw8It
         dosIT3QZv5HjhOIIPrlH1htifqI2kcJWAGCdcnrmJtQTqJE4wzeyz1DxEhr9NqgV7Ydn
         4prbhKLplXMGLxFRuqOsxd5WuauoXHx7NWZ9JwU4G2dJiQo9KKdtqdV5fAX5SGyR8apj
         PxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752161836; x=1752766636;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oI9o9HDqHku6blLWYaJ2+hsF6bFi8b5iXJq9d3e9EDk=;
        b=AvWct824IrEw1d/SQTksRXDtNfwj4+hyYfThtJmKKv2v+L37i4R7sc6ACKewv8sVbt
         aVeTmRQRyTYo3mJx8svRTdGotKuVLdRWvhHlQ8ds0UUAu/uB/3+Q2l2C05Xe1aZU0aW5
         sQWWgokNKkYLWjAYBjoGa7IQU+xtbTaIIRkKmdV/rJNDTF31MUwzldBKjdcN+XJ8ezMZ
         eQiShBHP68bmYvAwj0whGa0M9XsOt0tgTD0CwhyX/Gt2de7lEl2K3h+AMNsyb9K21HTP
         enQtQ9eV1MOvBHGKcpTC0snhpFPoNCXWxV/snbAVauMhH1dDNOQjMqmoVadIrpz9MXch
         ZqHg==
X-Forwarded-Encrypted: i=1; AJvYcCU3eihI8cmvhV7AVnblC1LxEOGwrlYXRgp8M/er0wDWefDYJOI9UfYtSCPVDoh0dczLkQ4SHySxpiO2YQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ6nL+ADrRHU6TfLFJq8IZ7cc+YR9iSn2blv3q1/9hntvao9BZ
	hQYIdIw1F3Ecgjt1lKgMKOr3kl0Is5XZJoJHQ8CGU/L7tBbZ2K7J4dEybO58TVqsfQw=
X-Gm-Gg: ASbGncu20RQETr+9fgdD2m+Hibjki8AYIAXP07oEzvE/kO0xd9yZIKb2z4p+Hn9EDNq
	gSUqVbK7V4Yc8N7KDPeYWAlSpn9vKgGxFRCqVMDcgfiMVyhHdKsGp5Mj4s11wua6hUd5M7I/K6R
	oA+7LWxhCNNhSSF68jjPHYkAKc9aN3ePADh031HYXmgIGL7+GinL86usqlmR48GJGC88yl26vNF
	A5OLn7S86i7kTF5y3KZz+PNi72Ml32jV5cF/jiFcmamQbOcprVEIwSBLsVGQDfXUwpR6pjmozxr
	KHvWGZAtJgjPieATuNT7EcO/ajpFeEP/ywMLnHYn1M1foR3I8jUBtYfH+DeJrGSualvh15t9xie
	4jQ==
X-Google-Smtp-Source: AGHT+IEYzFajRG68310lRWefVrLlJBZYcNCWdfnnadtj+wDy0O6R6ClzIUbR0/TKtIdeIveVdcw/Lw==
X-Received: by 2002:a05:620a:1710:b0:7d4:e3e:6606 with SMTP id af79cd13be357-7dcca6f4057mr517611985a.18.1752161836169;
        Thu, 10 Jul 2025 08:37:16 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::5ac? ([2606:6d00:17:b699::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde422092sm108013985a.74.2025.07.10.08.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:37:15 -0700 (PDT)
Message-ID: <2547684f36a71cef644e2a13ad5a05bffab89c50.camel@ndufresne.ca>
Subject: Re: [PATCH] media: v4l2: Add support for NV12M tiled variants to
 v4l2_format_info()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	 <hverkuil@kernel.org>, linux-fsd@tesla.com, Smitha T Murthy
	 <smithatmurthy@gmail.com>, Aakarsh Jain <aakarsh.jain@samsung.com>
Date: Thu, 10 Jul 2025 11:37:13 -0400
In-Reply-To: <20250710075130.3940569-1-m.szyprowski@samsung.com>
References: 
	<CGME20250710075144eucas1p2eebcb5acd8d06bd6fbe75378c6d6374f@eucas1p2.samsung.com>
	 <20250710075130.3940569-1-m.szyprowski@samsung.com>
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
	protocol="application/pgp-signature"; boundary="=-73LhMUorbt7ehj+7WZ4E"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-73LhMUorbt7ehj+7WZ4E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

Le jeudi 10 juillet 2025 =C3=A0 09:51 +0200, Marek Szyprowski a =C3=A9crit=
=C2=A0:
> Commit 6f1466123d73 ("media: s5p-mfc: Add YV12 and I420 multiplanar
> format support") added support for the new formats to s5p-mfc driver,
> what in turn required some internal calls to the v4l2_format_info()
> function while setting up formats. This in turn broke support for the
> "old" tiled NV12MT* formats, which are not recognized by this function.
> Fix this by adding those variants of NV12M pixel format to
> v4l2_format_info() function database.


Since you mention something broke, should this come with a Fixes: tag ?

>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> =C2=A0drivers/media/v4l2-core/v4l2-common.c | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index df40756ac8f6..0829d7028ef7 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -323,6 +323,10 @@ const struct v4l2_format_info *v4l2_format_info(u32 =
format)
> =C2=A0		{ .format =3D V4L2_PIX_FMT_NV61M,=C2=A0=C2=A0 .pixel_enc =3D V4L2=
_PIXEL_ENC_YUV, .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, =
0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_P012M,=C2=A0=C2=A0 .pixel_enc =3D V4L2=
_PIXEL_ENC_YUV, .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, =
0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> =C2=A0
> +		/* Tiled YUV formats, non contiguous variant */

Since these are tiled, it should not leave the block_w/block_h to 0. NV12_4=
L4/P010_4L4
are the broken example, we missed, and the drivers using them actually uses=
 bigger
alignment. And that makes me notice MT2110T/R are not in the tiled group :-=
(


> +		{ .format =3D V4L2_PIX_FMT_NV12MT,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 .pixel_enc =3D V4L2_PIXEL_ENC_YUV, .mem_planes =3D 2, .comp_planes =
=3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .=
vdiv =3D 2 },

So this one is special, 32x32 tiles, but they come in pair row wise, so the=
 data
must be aligned 64x32.

		  .block_w =3D { 64, 32, 0, 0 }, .block_h =3D { 32, 16, 0, 0 }},

> +		{ .format =3D V4L2_PIX_FMT_NV12MT_16X16,=C2=A0 .pixel_enc =3D V4L2_PIX=
EL_ENC_YUV, .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 },=
 .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },

		  .block_w =3D { 16, 8, 0, 0 }, .block_h =3D { 16, 8, 0, 0 }},

Please double check, the block is in pixels, so on interleave plane, 1 pixe=
ls
contains 2 bytes. The stride (bytesperline) should endup the same for both
planes.

regards,
Nicolas

> +
> =C2=A0		/* Bayer RGB formats */
> =C2=A0		{ .format =3D V4L2_PIX_FMT_SBGGR8,	.pixel_enc =3D V4L2_PIXEL_ENC_=
BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 1, 0, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_SGBRG8,	.pixel_enc =3D V4L2_PIXEL_ENC_=
BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 1, 0, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },

--=-73LhMUorbt7ehj+7WZ4E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaG/eKQAKCRDZQZRRKWBy
9KqtAQCFf87EQP/NaAcwd8xQ0m+DSr0KCuj/U0XTcBOCS/akswEA0XnKKNFKUlrP
cbX7hEt5Pvo5VltFgACjKehtALShGg8=
=UJeA
-----END PGP SIGNATURE-----

--=-73LhMUorbt7ehj+7WZ4E--

