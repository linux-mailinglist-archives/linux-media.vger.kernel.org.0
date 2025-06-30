Return-Path: <linux-media+bounces-36345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E36AEE852
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 22:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58B2E189FB2D
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 20:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE4E235079;
	Mon, 30 Jun 2025 20:33:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C329221710;
	Mon, 30 Jun 2025 20:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751315609; cv=none; b=Fq8y60CEBL5oETjd+41Dmaw30gJLcDYwyfLvBuUHBhqFrQ58bKyirRmjsKXVQW/cGrKFq8um3OnWQ+aUCQO6a1v5B4gT39MYimg1dLQmscAPcQXRA3y5BWZRI1ymSllHhVqvx2go1JcL2H1UlMU+rohBsO4Wo2tVxwjMO7O4j+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751315609; c=relaxed/simple;
	bh=2OB/+AlHmcEMy7GsDaHtTK9UQ7XQLPRS7E6ZJ0ln+P0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PtCLiz7ZrkMDCL0FbVeHzq+ZqNpB89XUDs6p+jdfk0lc7zcsyV8Da6JzbG5eZ2HMOYN//TifOIFb2gfD/ii/X2PL0N0RtuYeO2z+AlopB9eijLnPolmgHSLJTmlgnnkqV5UB7L7TzAnAQVvDe6ebp4pt5gut7Bk/kA5RU4SUvT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 272E01F00055;
	Mon, 30 Jun 2025 20:33:12 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 0D4C7AC912B; Mon, 30 Jun 2025 20:33:10 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 205E8AC9119;
	Mon, 30 Jun 2025 20:33:08 +0000 (UTC)
Date: Mon, 30 Jun 2025 22:33:05 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH] media: cedrus: Add support for additional output formats
Message-ID: <aGL0gVwHb8eJvCEu@collins>
References: <20250523154359.2454180-1-paulk@sys-base.io>
 <82be6ca4c33d394fc52fbe2a90362fa6955d0a47.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j/92dNluNZQpr6ZF"
Content-Disposition: inline
In-Reply-To: <82be6ca4c33d394fc52fbe2a90362fa6955d0a47.camel@ndufresne.ca>


--j/92dNluNZQpr6ZF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

Le Mon 30 Jun 25, 15:16, Nicolas Dufresne a =C3=A9crit :
>=20
> Hi Paul, Jernej,
>=20
> Le vendredi 23 mai 2025 =C3=A0 17:43 +0200, Paul Kocialkowski a =C3=A9cri=
t=C2=A0:
> > From: Jernej Skrabec <jernej.skrabec@siol.net>
> >=20
> > If VPU supports untiled output, it actually supports several different
> > YUV 4:2:0 layouts, namely NV12, NV21, YUV420 and YVU420.
> >=20
> > Add support for all of them.
> >=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
> > ---
> >=20
> > Looks like this patch never made it, sorry about that.
> > I've rebased it atop media/next and added my Reviewed-by tag.
> > ---
> > =C2=A0drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 18 +++++++++++++=
++++-
> > =C2=A0.../staging/media/sunxi/cedrus/cedrus_video.c=C2=A0 | 18 ++++++++=
++++++++++
> > =C2=A02 files changed, 35 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> > b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> > index 32af0e96e762..168d89c5a16d 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> > @@ -86,9 +86,25 @@ void cedrus_dst_format_set(struct cedrus_dev *dev,
> > =C2=A0
> > =C2=A0	switch (fmt->pixelformat) {
> > =C2=A0	case V4L2_PIX_FMT_NV12:
> > +	case V4L2_PIX_FMT_NV21:
> > +	case V4L2_PIX_FMT_YUV420:
> > +	case V4L2_PIX_FMT_YVU420:
> > =C2=A0		chroma_size =3D ALIGN(width, 16) * ALIGN(height, 16) / 2;
> > =C2=A0
> > -		reg =3D VE_PRIMARY_OUT_FMT_NV12;
> > +		switch (fmt->pixelformat) {
> > +		case V4L2_PIX_FMT_NV12:
> > +			reg =3D VE_PRIMARY_OUT_FMT_NV12;
> > +			break;
> > +		case V4L2_PIX_FMT_NV21:
> > +			reg =3D VE_PRIMARY_OUT_FMT_NV21;
> > +			break;
> > +		case V4L2_PIX_FMT_YUV420:
> > +			reg =3D VE_PRIMARY_OUT_FMT_YU12;
> > +			break;
> > +		case V4L2_PIX_FMT_YVU420:
>=20
> Just so its recorded, Hans added a default: case here while applying.

Thanks for the notification! I would maybe have selected NV12 instead but
I guess it doesn't really matter all that much since there should be layers
of checking before this is reached.

All the best,

Paul

> regards,
> Nicolas
>=20
> > +			reg =3D VE_PRIMARY_OUT_FMT_YV12;
> > +			break;
> > +		}
> > =C2=A0		cedrus_write(dev, VE_PRIMARY_OUT_FMT, reg);
> > =C2=A0
> > =C2=A0		reg =3D chroma_size / 2;
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > index 77f78266f406..9fae2c7493d0 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > @@ -64,6 +64,21 @@ static struct cedrus_format cedrus_formats[] =3D {
> > =C2=A0		.pixelformat	=3D V4L2_PIX_FMT_NV12_32L32,
> > =C2=A0		.directions	=3D CEDRUS_DECODE_DST,
> > =C2=A0	},
> > +	{
> > +		.pixelformat	=3D V4L2_PIX_FMT_NV21,
> > +		.directions	=3D CEDRUS_DECODE_DST,
> > +		.capabilities	=3D CEDRUS_CAPABILITY_UNTILED,
> > +	},
> > +	{
> > +		.pixelformat	=3D V4L2_PIX_FMT_YUV420,
> > +		.directions	=3D CEDRUS_DECODE_DST,
> > +		.capabilities	=3D CEDRUS_CAPABILITY_UNTILED,
> > +	},
> > +	{
> > +		.pixelformat	=3D V4L2_PIX_FMT_YVU420,
> > +		.directions	=3D CEDRUS_DECODE_DST,
> > +		.capabilities	=3D CEDRUS_CAPABILITY_UNTILED,
> > +	},
> > =C2=A0};
> > =C2=A0
> > =C2=A0#define CEDRUS_FORMATS_COUNT	ARRAY_SIZE(cedrus_formats)
> > @@ -140,6 +155,9 @@ void cedrus_prepare_format(struct v4l2_pix_format
> > *pix_fmt)
> > =C2=A0		break;
> > =C2=A0
> > =C2=A0	case V4L2_PIX_FMT_NV12:
> > +	case V4L2_PIX_FMT_NV21:
> > +	case V4L2_PIX_FMT_YUV420:
> > +	case V4L2_PIX_FMT_YVU420:
> > =C2=A0		/* 16-aligned stride. */
> > =C2=A0		bytesperline =3D ALIGN(width, 16);
> > =C2=A0



--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--j/92dNluNZQpr6ZF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhi9IEACgkQhP3B6o/u
lQz62BAAhX2v+UCfk6uEGKgA4rfzG+Z71Iiofi7yyldfe8bKOfC7JFCyK7OC8nS3
WNKKff7l/PPtLwGmnNkIMhCk73FmEeLV+x4M5cKT3mJw1ji2EtqjdFnDjtBs6sxX
LhWMPucBigl5ViG/PDO0SSjTohWEdcCuZ0de5uzmuLhngWVTPOziR4foZBsgIPtD
U/SJsl78MyCCNVHKDaOUK+yvByW7tr2DhLqs044gLpqlP3ivgOCROmPCB6t9kysi
x0HSFCptZpuqLsBi40GCYCHW8euFkgP3PsozSRLjFV5hmYJDT5XTyIRpyXrEC+hV
d0ZpoMmKa8cYNXslLHY8puul1bL65rKrndg7FC40rzzdG6QZOGfTTX0B9iP3cASt
cgp3hdtBrpRIl80oGMF2A1Iqe4J7QDymZUKAP29WZcevsT+kwACqLEMXfND6pR1t
tz7LbxpSsapHCEg5J+dUkQOAAwiXXebTyXd4Xw3t2voMess1NrMYzMweY3Aqfor2
ADo+uqaUb9r6wFz7tfzw9kjl+1R6GMp181JLwkrDWfEaCcgm6Os3QysnrdIIVw3Y
Us8mPDLYoF6Na0cdP3Q3dNvNS3LE30dUlireBIImUHCoUaCfq8mhsPmV1tv6QPkD
xn4DkovOrV5H3HvSfC2TpPnDNo2U/yvkcORdWIOAPGqYdoiyOEo=
=5fAK
-----END PGP SIGNATURE-----

--j/92dNluNZQpr6ZF--

