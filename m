Return-Path: <linux-media+bounces-41197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFE3B3878D
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 18:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5A187B8C28
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 16:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BD333CEB3;
	Wed, 27 Aug 2025 16:12:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E5F20C00E;
	Wed, 27 Aug 2025 16:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756311125; cv=none; b=Z4JNsqeo48/K9iI1Z/PhGXfSOBrZaM18BWqvzl/+GVMWVG7EAlbVH/m9TzMWCoGDtnidspOZGtIt8Rvx1BiIkL2kwbf26MOy8ekERkQyLm1atvmIPqhgC27zZAZj5+0wmz6tVd3AUfXgxmiEdrGYGO93c/arFAu8YiB8THx3DRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756311125; c=relaxed/simple;
	bh=i9u4ueMDOCYd4PdWvQmBlID8NKYd3eHGKqj1Gu30cYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=asDBLpUevaW6xEtzpyaJr3VkkMKY9fhNsXPn8gLvoLNEwvdLu9Pa9zs2UuNquNy3UTtmdItIdTeh6dPhBL0hFriAm8/HsvBoLXCLCCJPqtGlj9thpLW2dVO2CWCwpaAkwZHJxPwhBA3r7JKRljH52AuYBq5DQVqMkZep0I1ETZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 110751F00062;
	Wed, 27 Aug 2025 16:11:55 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id DB3ADB020DD; Wed, 27 Aug 2025 16:11:53 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id AB57FB020D6;
	Wed, 27 Aug 2025 16:11:52 +0000 (UTC)
Date: Wed, 27 Aug 2025 18:11:50 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] media: verisilicon: Explicitly disable all encoder
 ioctls for decoders
Message-ID: <aK8uRrlbMWZsA88Q@shepard>
References: <20250826190416.1287089-1-paulk@sys-base.io>
 <ee7416c9db2128ab1a8c1bbdc7cd231da21e5b53.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C71n5l9ay7s/mv82"
Content-Disposition: inline
In-Reply-To: <ee7416c9db2128ab1a8c1bbdc7cd231da21e5b53.camel@collabora.com>


--C71n5l9ay7s/mv82
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

On Wed 27 Aug 25, 10:30, Nicolas Dufresne wrote:
> Hi Paul,
>=20
> Le mardi 26 ao=C3=BBt 2025 =C3=A0 21:04 +0200, Paul Kocialkowski a =C3=A9=
crit=C2=A0:
> > Call the dedicated v4l2_disable_ioctl helper instead of manually
> > checking whether the current context is an encoder for the selection
> > ioctls.
> >=20
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > ---
> > =C2=A0drivers/media/platform/verisilicon/hantro_drv.c=C2=A0 | 2 ++
> > =C2=A0drivers/media/platform/verisilicon/hantro_v4l2.c | 6 ++----
> > =C2=A02 files changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/verisilicon/hantro_drv.c
> > b/drivers/media/platform/verisilicon/hantro_drv.c
> > index 4cc9d00fd293..6fb28a6293e7 100644
> > --- a/drivers/media/platform/verisilicon/hantro_drv.c
> > +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> > @@ -916,6 +916,8 @@ static int hantro_add_func(struct hantro_dev *vpu,
> > unsigned int funcid)
> > =C2=A0		vpu->decoder =3D func;
> > =C2=A0		v4l2_disable_ioctl(vfd, VIDIOC_TRY_ENCODER_CMD);
> > =C2=A0		v4l2_disable_ioctl(vfd, VIDIOC_ENCODER_CMD);
> > +		v4l2_disable_ioctl(vfd, VIDIOC_G_SELECTION);
> > +		v4l2_disable_ioctl(vfd, VIDIOC_S_SELECTION);
>=20
> Disabling this IOCTL for JPEG is fine, but for VP8, H.264, HEVC, VP9 and =
AV1, it
> is pretty much mandatory. Otherwise your stream will advertise the padded
> dimentions and there would be no way to tell it that what is the cropping=
 window
> for bitstream generation purpose.

Maybe the lack of context around the patch doesn't make it clear, but this =
is
to disable the ioctls for decoders (not encoders), which don't need to use =
the
selection API. This keeps the ioctls enabled and available for all encoders.

> Considering you are looking forward adding H.264 encoding, do you really =
want
> to apply this fix ?

I am well aware that this is required to setup the crop in the coded bitstr=
eam
and I am definitely using it in my encoding work :)

Cheers,

Paul

>=20
> Nicolas
>=20
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	video_set_drvdata(vfd, vpu);
> > diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c
> > b/drivers/media/platform/verisilicon/hantro_v4l2.c
> > index 6bcd892e7bb4..fcf3bd9bcda2 100644
> > --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> > +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> > @@ -663,8 +663,7 @@ static int vidioc_g_selection(struct file *file, vo=
id
> > *priv,
> > =C2=A0	struct hantro_ctx *ctx =3D file_to_ctx(file);
> > =C2=A0
> > =C2=A0	/* Crop only supported on source. */
> > -	if (!ctx->is_encoder ||
> > -	=C2=A0=C2=A0=C2=A0 sel->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
> > +	if (sel->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
> > =C2=A0		return -EINVAL;
> > =C2=A0
> > =C2=A0	switch (sel->target) {
> > @@ -696,8 +695,7 @@ static int vidioc_s_selection(struct file *file, vo=
id
> > *priv,
> > =C2=A0	struct vb2_queue *vq;
> > =C2=A0
> > =C2=A0	/* Crop only supported on source. */
> > -	if (!ctx->is_encoder ||
> > -	=C2=A0=C2=A0=C2=A0 sel->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
> > +	if (sel->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
> > =C2=A0		return -EINVAL;
> > =C2=A0
> > =C2=A0	/* Change not allowed if the queue is streaming. */



--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--C71n5l9ay7s/mv82
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmivLkYACgkQhP3B6o/u
lQxk1A/9ELY5RTuo/mlmxWE7Lq+eC0ax4KNowasbC3RE5o9RQ18n2yDBD1TCeXlv
4ZAQVTjE/oBy4/tQ43FH7vt3xgMLjvZ09+XUefXvT00ITtMekW4POd+oqeEaNyWi
jfr128LANaLTRODiDIeuufVOK9KTlcIpR7aZjA/FXgq8iOtibWzQxWBQV1JiWwTS
fwiTRfkSYAxyIIHRBYbLh/lhorl34uDp44i4vZdmg7Dy77RVzn7zwz4al5Gsut7w
WGWgsUPX1UDMvJ6jXEHw99JRAhR168M1VSo8zAD3iC2I8hxH7HSHaY5zZXraolEL
8pBysbXDWNV8AjxcyIDdykgnlLqrY6fhctQA7x6cOF0ls1Z/tO7yc8YckjK/Scnw
/cBPAxbalXEGeB+8AEIFiJAe6WE/ciyq28cm75xadkkIc9iBLw7KJD1aDVF7g9kC
yVV0LHoeNlVBR82MsxFAzIRyPvSnjqF92gBLmFqU5tgygxMtLTse44Hvq3drlc3M
/vcZqfdRMZFkrkcw5D1HPxirPPuF+nv2XPlF/PBOTSxexg73PpZLfzJYD5MQGNHD
YIlhOOpmBEJLhD5kQswvACua6Av3wbeO2/nGFk9ZZuF2BHYGsRKL2gxOmqe07beG
1WRv8r+M0hHzKYC/MnjZWgPMWnCp0J/H8WnrLktVIrlv2L/zNyM=
=87s1
-----END PGP SIGNATURE-----

--C71n5l9ay7s/mv82--

