Return-Path: <linux-media+bounces-37530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 410D9B02333
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 19:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C91B23B1436
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 17:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332AD2F19B1;
	Fri, 11 Jul 2025 17:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="i0XHEMih"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B941219E82A
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 17:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752256605; cv=none; b=kNlloyLSmbGPuvTpAbvi2+k/jguZMlLbDS4Gmg1/4S+loipfrLZKME5V/G/wPKNyCn9BI70TIV1P2ZMmtUczovVk2JWn4o0hcsg8+s0GWJpBLglwQl9z20y/YTN7Ymtw51wQGRqvcsQ1JzNi8+dcO5AtkltJ7knjH5j78Re68F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752256605; c=relaxed/simple;
	bh=Var2MoGEoGsaPZwdqo+NeN4j0z4u+0AKDQa+R3DsI9I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uLPNs80IWYRhtQxI6vsjlifCMABfTO0wVNH1/bWpfs1gkeS7c5odk5G25YC2koqymIeKw4nKNXWxtQSzgRDk7N03+BZeDG9tFHQuhF4mDlnlwkhStp2+Yod4FN6wlYQuPxj5mDB7UmyZlevEjZXB0WY8kyEOIgpgKFGT0LReL9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=i0XHEMih; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4a77ea7ed49so40902211cf.0
        for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 10:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1752256602; x=1752861402; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6QjHPqMWTb7903th4wiGiWkJJQfH8F6Ga2gKADxKWkg=;
        b=i0XHEMih24UnmQUPVjm4SXyYU3YpyJUk15KUllKblFfDpESpQ+dUklvbGisjh0sMCa
         BVwt8VJpOZQlZpvBLupMy2EZ05qMuNEJS6u3r6fByKL6TAs/qfYRAT2h3b0B/NSvrcWi
         LqkXCa3JcpIHlAHfDv12o91wlYkOkrxEEhIu6brwhf/7WeH+HlNM/y7mLpGEyChsTNY3
         ezJ22/rVyBz5eCN5Ck7VlACPESjwad8XB5MRb+6T6i4uLfp3nw/+RbHxAguPRWCiorPV
         OGKtn5xXIFtuplWU1dmBw4plbtaFZq9KtbmPLQJ+IMf6laVBRhJuRUW/bqhyXsIg4WvR
         Pa1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752256602; x=1752861402;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QjHPqMWTb7903th4wiGiWkJJQfH8F6Ga2gKADxKWkg=;
        b=PCKSKylJTCJGu1LMS+zOVJurM5RNUhnawsgADYPiKYesvmhwj5C+nA1oxloiuHTKhr
         uZdCZabrqyW+5J2Xcr1mQjAUWP+zW0fX44wMqvOdLCKN7ALbVd3+o6EbpcJ33oaoEsjq
         nKN5M8dUqQLS1d5yi01sOPxfCknd1pvMRc1jWbR/tVI9RpK9rT+LhTURp/yWS9AhvP/X
         IOkBnxOjLOEw9hFsyTc7iSJPVUPrjdbUD7MQ48NTVmi/rE3sbpKloejf9K6+XTB0GeOH
         w+W3RIrx4NxQV5Lx5TUwcNZvNjK09me4gupYmga6KTnHe8S9McDPv/dI7J57OB9TNPHP
         PAxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH7491AWYxb72thmShOO9dfBsOkuHR6mXmGh0zFyeqgRfnP1Jr3JCe8r8t/uoUKPLQILElhZ5MsttNbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsfGbtprcIL12YQB8L2JBnpBVQATFuueXBPK+fud6eq6eLfw/J
	v1X8TN5ppKieazacP8l/N7Yvm1PyBMgmNmtAgABmSwGGVUSoPkjDm1bZwEqMmTldiUyC66MnJb1
	3IIi4oVM=
X-Gm-Gg: ASbGncsaFz53zWqxcadupZYNfDG+isrVUKDkfjFkM//5Oh/weAmrAU6LMmaHUGEXN1K
	yCid0PFgCPQKAMjO0sBi9tgVE72RLHftp2BTS+jvNGH7RkGK8k7x1o2ZZKOQJfwJz6r6HanpYl0
	U/Y76Ka1feGwT//oRl+i9EZTxN9SDfK2tgvLZotFY0O5pJW5eIT7T/3h71xYox6XuyQ906HE/js
	qVL+WVm/OP7y0w0luzEEriFoY4Oap0KhL9DFlJjlknFpacnCHmzIyIJAzeBe78RYtpMA4LqzlX7
	2TWyrQPAGyWp/nG6i2gsj9DO8kPaYbvrOKYyGmqlg9sGM8hZZmeHfR8lh/+USzTBeX6sFHC+rw+
	7vl5oAc8AmFVbJFUDz0znoQ2mA7Y=
X-Google-Smtp-Source: AGHT+IGjDVBWUZ5Xr4D7/1EcgkcFLXc2a5mvHJS/IiZgJV5+JIl8p3+xYRoMTMb3ObaBZ9j7dxYGQA==
X-Received: by 2002:a05:622a:1c0e:b0:4a9:783e:9dd1 with SMTP id d75a77b69052e-4a9e9d05ffcmr155538091cf.21.1752256602271;
        Fri, 11 Jul 2025 10:56:42 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::5ac? ([2606:6d00:17:b699::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ab40a349c5sm2420061cf.60.2025.07.11.10.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 10:56:41 -0700 (PDT)
Message-ID: <f6989f5bf28b37c9e5069ea38e29f3aa828815f0.camel@ndufresne.ca>
Subject: Re: [PATCH] media: v4l2: Add support for NV12M tiled variants to
 v4l2_format_info()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	 <hverkuil@kernel.org>, linux-fsd@tesla.com, Smitha T Murthy
	 <smithatmurthy@gmail.com>, Aakarsh Jain <aakarsh.jain@samsung.com>
Date: Fri, 11 Jul 2025 13:56:38 -0400
In-Reply-To: <c5f51055-5771-4eb0-9bc7-d86d3bb1c196@samsung.com>
References: 
	<CGME20250710075144eucas1p2eebcb5acd8d06bd6fbe75378c6d6374f@eucas1p2.samsung.com>
		<20250710075130.3940569-1-m.szyprowski@samsung.com>
		<2547684f36a71cef644e2a13ad5a05bffab89c50.camel@ndufresne.ca>
	 <c5f51055-5771-4eb0-9bc7-d86d3bb1c196@samsung.com>
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
	protocol="application/pgp-signature"; boundary="=-qayQMEszOeMO9sbboM8/"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-qayQMEszOeMO9sbboM8/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 11 juillet 2025 =C3=A0 11:11 +0200, Marek Szyprowski a =C3=A9cr=
it=C2=A0:
> On 10.07.2025 17:37, Nicolas Dufresne wrote:
> > Le jeudi 10 juillet 2025 =C3=A0 09:51 +0200, Marek Szyprowski a =C3=A9c=
rit=C2=A0:
> > > Commit 6f1466123d73 ("media: s5p-mfc: Add YV12 and I420 multiplanar
> > > format support") added support for the new formats to s5p-mfc driver,
> > > what in turn required some internal calls to the v4l2_format_info()
> > > function while setting up formats. This in turn broke support for the
> > > "old" tiled NV12MT* formats, which are not recognized by this functio=
n.
> > > Fix this by adding those variants of NV12M pixel format to
> > > v4l2_format_info() function database.
> > Since you mention something broke, should this come with a Fixes: tag ?
>=20
> I wasn't sure that such change in generic v4l2 code deserves a tag=20
> pointing to the commit in the niche driver.

I don't have enough context to know how many Samsung chips are affected, th=
at being said, whatever we do, stable AI bot will likely come to the conclu=
sion it should be backported.

>=20
> > > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > ---
> > > =C2=A0=C2=A0drivers/media/v4l2-core/v4l2-common.c | 4 ++++
> > > =C2=A0=C2=A01 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4=
l2-core/v4l2-common.c
> > > index df40756ac8f6..0829d7028ef7 100644
> > > --- a/drivers/media/v4l2-core/v4l2-common.c
> > > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > > @@ -323,6 +323,10 @@ const struct v4l2_format_info *v4l2_format_info(=
u32 format)
> > > =C2=A0=C2=A0		{ .format =3D V4L2_PIX_FMT_NV61M,=C2=A0=C2=A0 .pixel_en=
c =3D V4L2_PIXEL_ENC_YUV, .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D {=
 1, 2, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
> > > =C2=A0=C2=A0		{ .format =3D V4L2_PIX_FMT_P012M,=C2=A0=C2=A0 .pixel_en=
c =3D V4L2_PIXEL_ENC_YUV, .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D {=
 2, 4, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> > > =C2=A0=20
> > > +		/* Tiled YUV formats, non contiguous variant */
> > Since these are tiled, it should not leave the block_w/block_h to 0. NV=
12_4L4/P010_4L4
> > are the broken example, we missed, and the drivers using them actually =
uses bigger
> > alignment. And that makes me notice MT2110T/R are not in the tiled grou=
p :-(
>=20
> I assume that these formats would require separate cleanup.

Correct, this is just me being overly verbose, I will take care a little la=
ter,
there is no urgency there.

>=20
> > > +		{ .format =3D V4L2_PIX_FMT_NV12MT,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 .pixel_enc =3D V4L2_PIXEL_ENC_YUV, .mem_planes =3D 2, .comp_pl=
anes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D=
 2, .vdiv =3D 2 },
> > So this one is special, 32x32 tiles, but they come in pair row wise, so=
 the data
> > must be aligned 64x32.
> >=20
> > 		=C2=A0 .block_w =3D { 64, 32, 0, 0 }, .block_h =3D { 32, 16, 0, 0 }},
> >=20
> > > +		{ .format =3D V4L2_PIX_FMT_NV12MT_16X16,=C2=A0 .pixel_enc =3D V4L2=
_PIXEL_ENC_YUV, .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, =
0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> > 		=C2=A0 .block_w =3D { 16, 8, 0, 0 }, .block_h =3D { 16, 8, 0, 0 }},
> >=20
> > Please double check, the block is in pixels, so on interleave plane, 1 =
pixels
> > contains 2 bytes. The stride (bytesperline) should endup the same for b=
oth
> > planes.
>=20
> Right, I missed those block_w/h restrictions, thanks for pointing them.=
=20
> I assumed that most parameters will be the same as for the generic=20
> V4L2_PIX_FMT_NV12 case as those formats only differs by macroblock pixel=
=20
> layout.

Correct, these formats are relatively simple tiling and the inner format is
identical to NV12. So the delta is going to be mem_planes being 2, and a
block_w/h.

>=20
> Best regards

--=-qayQMEszOeMO9sbboM8/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaHFQVwAKCRDZQZRRKWBy
9OMDAP9nww/pBeYHN/dtBrbR1SQnd49QsMgyFjLaC81qxOhjJQEAojDpiiZZmpuC
OtfFElN+4EtnTc50oJvErQJo/91ynQE=
=ueA6
-----END PGP SIGNATURE-----

--=-qayQMEszOeMO9sbboM8/--

