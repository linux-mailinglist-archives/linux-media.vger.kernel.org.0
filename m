Return-Path: <linux-media+bounces-41336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86902B3BD49
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 16:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A0BB565ED8
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 14:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183BF31A05B;
	Fri, 29 Aug 2025 14:15:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA8018D656;
	Fri, 29 Aug 2025 14:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756476937; cv=none; b=ajhOWWhMO9KEyejzcwJp6ePz+6SLvubfJMCrcfdtG8m+BDDBT7DOMZgBaHtMSDenZgpAkG1hZlH7CuaZuzC/75Rq8YyB4HTZcg/OY3ILJLS5+BtvgoLOlvjyDrgM6u0WKUt+Y756G+stS44flx0D9zuYAiqBy7TMB9zOLSQwi78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756476937; c=relaxed/simple;
	bh=ubOdpTzdLChd/oCTxc0FMbQiz2ebO2gOYRbSm7Wrs3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sBxs7osorpJaKYcOXJ0c5V1EURVReAKye9JcYV2JRaIBnkfQzir/SdZcVOf8BoNJQi7ooH058kuoziBMjBzQXeOe24n77d0KbjbnJ81TCQoIvYLDivyJnoCY9b0VU9wiHW0cruCZPDp4f5gWNhLaZIyshMZHVT2T9QA0SgnqEq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id C128F1F0004D;
	Fri, 29 Aug 2025 14:15:24 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 3BCB8B0236E; Fri, 29 Aug 2025 14:15:23 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id F2616B0236D;
	Fri, 29 Aug 2025 14:15:21 +0000 (UTC)
Date: Fri, 29 Aug 2025 16:15:19 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 4/4] Documentation: media: Document
 V4L2_H264_DECODE_PARAM_FLAG_PFRAME/BFRAME
Message-ID: <aLG19wzWBBECU6Cs@shepard>
References: <20250824180735.765587-1-paulk@sys-base.io>
 <20250824180735.765587-5-paulk@sys-base.io>
 <5065e67544ae9255b2136a6cd73cbb9ffd08e3fb.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WI4FcukOe3v7B7jt"
Content-Disposition: inline
In-Reply-To: <5065e67544ae9255b2136a6cd73cbb9ffd08e3fb.camel@collabora.com>


--WI4FcukOe3v7B7jt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

+ Adding Dmitry in the loop (whom I forgot, sorry).

Dmitry, we're discussing the precise meaning of the Tegra VDE H.264 decode
flags that indicate PFRAME/BFRAME.

On Thu 28 Aug 25, 16:42, Nicolas Dufresne wrote:
> Le dimanche 24 ao=C3=BBt 2025 =C3=A0 20:07 +0200, Paul Kocialkowski a =C3=
=A9crit=C2=A0:
> > These flags are meant for a very specific use-case, add a mention of it.
> >=20
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > ---
> > =C2=A0.../userspace-api/media/v4l/ext-ctrls-codec-stateless.rst | 8 +++=
+++--
> > =C2=A01 file changed, 6 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stat=
eless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless=
=2Erst
> > index 0da635691fdc..de1e3873385c 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.r=
st
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.r=
st
> > @@ -618,10 +618,14 @@ Stateless Codec Control ID
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -
> > =C2=A0=C2=A0=C2=A0=C2=A0 * - ``V4L2_H264_DECODE_PARAM_FLAG_PFRAME``
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 0x00000008
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - All submitted slices for the frame ar=
e P slices. This is a compability
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flag required for decoders =
that only support decoding such frames, but
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 should not be required for =
slice-based decoders.
>=20
> Seems to match the comment in Tegra driver, and related to a hardware
> limitation. Shall we also recommend not to use this unless similar limita=
tion
> exists ?

I think the flag should only be allowed for frame-based decode mode and ind=
eed
it would be good to say that drivers should only check this flag if they ha=
ve
such limitations.

Userspace on the other hand cannot really know if it will be used or not so=
 it
should set the flags when applicable.

> Note that mix of P and I, or, B and I, should still work on Tegra, its mi=
xing P
> and B that will fail since one of the reference list will be missing. At =
least,
> this is my understanding.

Well the comment in the driver mandates that "frame consists of the same ty=
pe
slices" and "decoding of a non-uniform frames isn't supported by hardware".

But looking at the code these statements seem exaggerated and I concur to y=
our
understanding that at least mixing I and P should work, since it only sets =
up
the L0 reference list. There's an explicit hardware flag for "B frames" that
could have a more restrictive meaning. Maybe it also allows I frames and/or
P frames, maybe not.

So perhaps we could relax the definitions to an indication that the L0/L1
reference lists will be used by the frame slices, which implicitly allows m=
ixing
different types of slices.

After all it is likely that decoders in that situation just really care abo=
ut
having the required ref lists prepared and don't particularly need each
slice_type to be the same. After all they're still parsing the slice header=
s so
they do have all the slice-specific info.

Paul

> Nicolas
>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 * - ``V4L2_H264_DECODE_PARAM_FLAG_BFRAME``
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 0x00000010
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - All submitted slices for the frame ar=
e B slices. This is a compability
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flag required for decoders =
that only support decoding such frames, but
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 should not be required for =
slice-based decoders.
> > =C2=A0
> > =C2=A0.. raw:: latex
> > =C2=A0



--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--WI4FcukOe3v7B7jt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmixtfcACgkQhP3B6o/u
lQy/eg/+KXDBjXoFLRlMAlVItH+iqobBS+Pd19Qf6QsSKFu/hkfB+8Vj6S0KfEIZ
RK1tVIBxrWH7fQ1cYH2Dvpe3ebQOmyLpGDbpfJFx6vtrwa6p/vk7v9xORsA6XKTT
nC2rqnX3Kme0JrtcKgnQoSqHsh2nOXKOz3Fi8uUmkEULqF7E+YBaDtlRE2pwGUyJ
OatXCmRvDshJXN4K0smDFDowkCxnLNMvSQv74R73fiLH1tuhNc8LbZxqaLP4dWu9
w9RB00BKTc6RP1HXQ0HMENnicZ+Cwom6HeCYgexOn51D35TTBEPvA3gNkDoIzjXw
DWF7aO5u8dI1ySEnuwxVyLtFS2Ct8wEgDuCP78G4KPaYGTRD46OKgdDrIW5lWnwg
Y4TcZcOvVH/b2me/x8pRN48QCsxsDZPE4ndVFraEVFrKM7PiolP99GjtNpYd+3+j
eJI3hrdWVV3ae4ID7DGd0P2hKjmLQ1OVsQWGiZ2SAlxYV4OtTFiimO1TGyePNmh0
Upkrn0tJjY3uvdu0AAwccUzW3P5SOEQucZVlQTnZTBWlulPq4BWfPccIBRLl0PWg
C1HLlcnm9YUKTyT5KKyfUIyRozFwpiqb1ji2KA/+DI8lG06+Fk0i+wjFKAVGUiZx
OUix46k7yQcYkuWTaOEmQdrBztMicU6pCoayaDJG9XXJpzyXvPk=
=kBOn
-----END PGP SIGNATURE-----

--WI4FcukOe3v7B7jt--

