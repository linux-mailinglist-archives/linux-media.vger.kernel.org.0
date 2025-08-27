Return-Path: <linux-media+bounces-41202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D53B388DD
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 19:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC2384640CC
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 17:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4A82741B3;
	Wed, 27 Aug 2025 17:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WCafXPJO"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D1A1D63E4;
	Wed, 27 Aug 2025 17:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756316849; cv=none; b=ah8YyToiurddwAwV88Kg6Y/6gZY1u2psTnTijtxmFZpTtddnBXHUa1hNHhCNVZW9oD2TCkAMA6plPbDgf0p3kvdTKoDRCUAzlIsT5t9JGIrbo82nSlxKmIO/HUnJCWTNLhYQaVvdvjszOctj7LjDVeMb43mKDMvAIQZGXNs3iWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756316849; c=relaxed/simple;
	bh=lEcdqu2a+OP1F9LbMBMvjjMFWRmlLVjtcmctavk5V3U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LDdw7YU+G9lPygt+BlOegFrz7b2YNoQGDp0gPFSGODBScXzrzCqKFC1HjZVziQVK0JVd3Ekbq8r3amh6RChSVTW8Ji9xG/aSsjIym+JBkQrVCM12BLZu2lTbikOP7auNZbGkB/6I+4IbcslWKSvnyP46F1grme0Kggzcf0SZXd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WCafXPJO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756316844;
	bh=lEcdqu2a+OP1F9LbMBMvjjMFWRmlLVjtcmctavk5V3U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=WCafXPJOFiplTO2V2yviBr7RAf4OM4nvQSvyNI/pA7Z6KxlhdfDTRPyk1CMx2pBrs
	 +KZiKS5ZSWTT0bCfwcAWKFcNWxxEJixi2kPMUMh2CJAJR5+t0HQfU7UO2VSColHnEN
	 pCbwf7uh5RBvJxtZjJ2jKLv3JuGm1HvV/HN7o0yZ6mAqsvNfL6/Pdt5jDZO0hjT0mS
	 XP/4Y9x4tyJp9m+uVk//AMeqL/J/7DBHJTihyAaiETsOJuB4/OcinY3Lp+5lSmmn6m
	 TkqQ+Sj5S07E/0tioqNPkwLsw3gUtU6JMGIJ4ehtwwgvBiuWvo6citKES5EInzFNxI
	 ctIl/EOQMkwyA==
Received: from [IPv6:2606:6d00:11:5a76::c41] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DA40A17E04D6;
	Wed, 27 Aug 2025 19:47:23 +0200 (CEST)
Message-ID: <008c8848cfe829d91dc56156653a5856b05d6bad.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicon: Explicitly disable all encoder
 ioctls for decoders
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Wed, 27 Aug 2025 13:47:21 -0400
In-Reply-To: <aK8uRrlbMWZsA88Q@shepard>
References: <20250826190416.1287089-1-paulk@sys-base.io>
	 <ee7416c9db2128ab1a8c1bbdc7cd231da21e5b53.camel@collabora.com>
	 <aK8uRrlbMWZsA88Q@shepard>
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
	protocol="application/pgp-signature"; boundary="=-AiVj62IW9eUVFUuKYG9Q"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-AiVj62IW9eUVFUuKYG9Q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 27 ao=C3=BBt 2025 =C3=A0 18:11 +0200, Paul Kocialkowski a =C3=
=A9crit=C2=A0:
> Hi Nicolas,
>=20
> On Wed 27 Aug 25, 10:30, Nicolas Dufresne wrote:
> > Hi Paul,
> >=20
> > Le mardi 26 ao=C3=BBt 2025 =C3=A0 21:04 +0200, Paul Kocialkowski a =C3=
=A9crit=C2=A0:
> > > Call the dedicated v4l2_disable_ioctl helper instead of manually
> > > checking whether the current context is an encoder for the selection
> > > ioctls.
> > >=20
> > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > ---
> > > =C2=A0drivers/media/platform/verisilicon/hantro_drv.c=C2=A0 | 2 ++
> > > =C2=A0drivers/media/platform/verisilicon/hantro_v4l2.c | 6 ++----
> > > =C2=A02 files changed, 4 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/verisilicon/hantro_drv.c
> > > b/drivers/media/platform/verisilicon/hantro_drv.c
> > > index 4cc9d00fd293..6fb28a6293e7 100644
> > > --- a/drivers/media/platform/verisilicon/hantro_drv.c
> > > +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> > > @@ -916,6 +916,8 @@ static int hantro_add_func(struct hantro_dev *vpu=
,
> > > unsigned int funcid)
> > > =C2=A0		vpu->decoder =3D func;
> > > =C2=A0		v4l2_disable_ioctl(vfd, VIDIOC_TRY_ENCODER_CMD);
> > > =C2=A0		v4l2_disable_ioctl(vfd, VIDIOC_ENCODER_CMD);
> > > +		v4l2_disable_ioctl(vfd, VIDIOC_G_SELECTION);
> > > +		v4l2_disable_ioctl(vfd, VIDIOC_S_SELECTION);
> >=20
> > Disabling this IOCTL for JPEG is fine, but for VP8, H.264, HEVC, VP9 an=
d
> > AV1, it
> > is pretty much mandatory. Otherwise your stream will advertise the padd=
ed
> > dimentions and there would be no way to tell it that what is the croppi=
ng
> > window
> > for bitstream generation purpose.
>=20
> Maybe the lack of context around the patch doesn't make it clear, but thi=
s is
> to disable the ioctls for decoders (not encoders), which don't need to us=
e the
> selection API. This keeps the ioctls enabled and available for all encode=
rs.

My bad, miss-read. I think you could reduce the confusion with a subject li=
ne
that is narrower:

  media: verisilicon: Explicitly disable SELECTION API ioctl for decoders

And you can add:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

cheers,
Nicolas

>=20
> > Considering you are looking forward adding H.264 encoding, do you reall=
y
> > want
> > to apply this fix ?
>=20
> I am well aware that this is required to setup the crop in the coded bits=
tream
> and I am definitely using it in my encoding work :)
>=20
> Cheers,
>=20
> Paul
>=20
> >=20
> > Nicolas
> >=20
> > > =C2=A0	}
> > > =C2=A0
> > > =C2=A0	video_set_drvdata(vfd, vpu);
> > > diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c
> > > b/drivers/media/platform/verisilicon/hantro_v4l2.c
> > > index 6bcd892e7bb4..fcf3bd9bcda2 100644
> > > --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> > > +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> > > @@ -663,8 +663,7 @@ static int vidioc_g_selection(struct file *file, =
void
> > > *priv,
> > > =C2=A0	struct hantro_ctx *ctx =3D file_to_ctx(file);
> > > =C2=A0
> > > =C2=A0	/* Crop only supported on source. */
> > > -	if (!ctx->is_encoder ||
> > > -	=C2=A0=C2=A0=C2=A0 sel->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
> > > +	if (sel->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
> > > =C2=A0		return -EINVAL;
> > > =C2=A0
> > > =C2=A0	switch (sel->target) {
> > > @@ -696,8 +695,7 @@ static int vidioc_s_selection(struct file *file, =
void
> > > *priv,
> > > =C2=A0	struct vb2_queue *vq;
> > > =C2=A0
> > > =C2=A0	/* Crop only supported on source. */
> > > -	if (!ctx->is_encoder ||
> > > -	=C2=A0=C2=A0=C2=A0 sel->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
> > > +	if (sel->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
> > > =C2=A0		return -EINVAL;
> > > =C2=A0
> > > =C2=A0	/* Change not allowed if the queue is streaming. */
>=20
>=20

--=-AiVj62IW9eUVFUuKYG9Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaK9EqQAKCRDZQZRRKWBy
9FYjAPwPd/zFoJGIGFBIfHR0pz6/cOmKMiZBS3H36aKdnxgEcwEAoXkLM1W7gRMj
f9EOhuIcaTgvl9DoPvirUdwt3UkXBg8=
=Eb1b
-----END PGP SIGNATURE-----

--=-AiVj62IW9eUVFUuKYG9Q--

