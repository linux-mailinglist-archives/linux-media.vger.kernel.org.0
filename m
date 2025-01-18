Return-Path: <linux-media+bounces-24888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D11A9A15E26
	for <lists+linux-media@lfdr.de>; Sat, 18 Jan 2025 17:50:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60FEC1886DEF
	for <lists+linux-media@lfdr.de>; Sat, 18 Jan 2025 16:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D3A195962;
	Sat, 18 Jan 2025 16:49:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429FA7FD
	for <linux-media@vger.kernel.org>; Sat, 18 Jan 2025 16:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737218998; cv=none; b=W/Yl0NP7gZpUcmkt4BHGpBbgkVhQB+1i+XRoBuCyN7l3j9BEj9DDPjReSKH2gbk1+2ZNuH9m+/NvRJKsLHLWF3tN7QLQJkT0IRKpUkyQlzmiLp8ikZxhCzT3BAcD4tM5NnLxcIyX4pwXJQE3hABUxlqAYEz+q/SFGYH9pOFHczM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737218998; c=relaxed/simple;
	bh=dPv7sB7Lg3+lL50xoUkS3CBnu0ucCTv+0cx5csfkafw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hYWykH4pb4AazVSc7WbRrGJjgGYK3Nzi2yfRLd1YDIV7gOmuGhpF1U8VLCE7zcRmL9Mtm1IH7mPoeqchoR83sijqQCQLrVRAFejww1/9n/XChEhRN2iAPg3XYZvtDIXi7MLDlDQr2O2E4y5JOyoW+IjK26Mf82AD1HqJHZaAII0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id E27161F00051
	for <linux-media@vger.kernel.org>; Sat, 18 Jan 2025 16:49:41 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 5157EAA22F4; Sat, 18 Jan 2025 16:49:40 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 3BFB1AA22EC;
	Sat, 18 Jan 2025 16:49:39 +0000 (UTC)
Date: Sat, 18 Jan 2025 17:49:37 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Daniel Almeida <dwlsalmeida@gmail.com>, Adam Ford <aford173@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, andrzejtp2010@gmail.com,
	Frank Li <frank.li@nxp.com>, ming.qian@oss.nxp.com,
	linux-media <linux-media@vger.kernel.org>, linux-imx@nxmp.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Gustavo Padovan <gus@collabora.com>
Subject: Re: Hantro H1 Encoding Upstreaming
Message-ID: <Z4vbofrdobqlFC_I@collins>
References: <CAOMZO5D0QvYvr940giHPGwLpunQOpku7e5K_5hHyYYCwZQry2g@mail.gmail.com>
 <CAOMZO5BJt6qzETzMeO47N5Gu8136tppuXKnqv4ypk6HyLR99vA@mail.gmail.com>
 <F5E2D925-668C-4D4D-87C9-8F22126443FD@gmail.com>
 <CAHCN7x+hUJoKRO8U8dgafFip31AKJRqfQw1kOw7YhvZ6xXqNnA@mail.gmail.com>
 <A3476357-8D8D-4B82-8CAB-58370BECF575@gmail.com>
 <a393b3324c60c2c13994d34ca90faf4eb604ae43.camel@collabora.com>
 <Z4fOScVgLqYEU4Hw@collins>
 <9def2b5d38b338c31be09503805b85206223b36c.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RddH+a3Xp2RTzIwS"
Content-Disposition: inline
In-Reply-To: <9def2b5d38b338c31be09503805b85206223b36c.camel@collabora.com>


--RddH+a3Xp2RTzIwS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Wed 15 Jan 25, 14:43, Nicolas Dufresne a =C3=A9crit :
> Le mercredi 15 janvier 2025 =C3=A0 16:03 +0100, Paul Kocialkowski a =C3=
=A9crit=C2=A0:
> > Last words about private driver buffers (such as motion vectors and
> > reconstruction buffers), I think they should remain private and unseen =
=66rom
> > userspace. We could add something extra to the uAPI later if there is r=
eally a
> > need to access those.
>=20
> I don't know if you noticed, but Jacopo started a proposal around multi-c=
ontext
> media controller. For this type of extension, my long term idea was that =
we
> could adopt this, and introduced new nodes to expose specialized memory. =
These
> nodes would be unlike by default, meaning the default behaviour with a si=
ngle
> m2m video node would remain.
>=20
> An existing use case for that would be in the decoder space, VC8000D and =
up have
> 4 post processed output, which mean up to 5 outputs if you count the refe=
rence
> frames. So we could set it up:

Sounds very interesting to handle multi-core codecs and devices with some
separate post-processing output (IIRC the allwinner video decoder can have =
some
extra thumbnail output which can be very handy for JPEG stuff).

> Simpler said then done, but I think this can work. I suspect it is quite
> feasible to keep the stream state separated, allowing to reconfigure the =
chosen
> output resolution without having to reset the decoder state (which is onl=
y bound
> to reference frames). It also solve few issues we have in regard to over-=
memory
> allocation when we hide the reference frames.
>=20
> For encoders, reconstruction frames would also be capture nodes. I'm not
> completely versed into what they can be used for, also their pixel format=
 would
> have to be known to be useful of course.

Makes a lot of sense. Honestly this is starting to look like the ISP situat=
ion
where we have multiple video nodes dedicated to specific things and various
specific buffer formats for them. This brings a lot of flexibiliy and many
possibilities for decoders/encoders.

In contrast the ISP API uses a separate video device for metadata/configura=
tion
submission, which we do through the request API and controls for the
decoder/encoder cases. But we could imagine adding extra source video nodes=
 to
provide e.g. random bitstream units to stuff for encoding. And just make su=
re
they are submitted with the same request. I guess that should work since the
request is a media-wide object and not video node specific.

Anyways, like you say, simpler said than done but it seems like a reasonable
design extension that would solve a lot of current API limitations.

Cheers,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--RddH+a3Xp2RTzIwS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmeL26AACgkQhP3B6o/u
lQy1Tw//bs/yCKsC20aM3Cm8GkBFqNiSH4l7Ue+xv9rFGBU6Qb5HMCfRFiK4I6zS
2z0mmqnMZIRR5DAWZiaftHIWwsjb7bujXsHHXkMRevWyzEZeecgCys8CJQj0lPkM
EAT8GjHFj1G7uH4JmcxoiUX94VKslmjW8BHfUSPJU6jeRuij6/LWeJHXlaGh23+b
5zXax8T+qqPW+hojd+UtO/DG8myBI+Itdvmw1wHGUmtPeUiHy+Y5y+zBS9lQjMZx
Zm0nCZkwdBNxgP0tHDRmRST9ox2OiS2G7vx7spDy6I11KB9HYMr19G9DFuAUJfnY
YhQnDbb0S9u2TpqB5qnc+v8boWL4hI0jmb+WbEvu0xS+rjYrHwiAn9mNXAy86GYJ
tXcsIzdYwVdaR7+vkPQQUBkxIxge+grcZs4wP1tFhexuFVOmQyg/bIa1AVrbg3ef
k15S1s4s1uCSKF+dTjNiECjZLxxw77a8aQXvMF/uuV7a+G+EFAN39nrC5WVFpYEg
ciEx7xa0OICJtqR5sYQU17ktcWC48iEIVXKpbPpRUtlDxiE5I95m7kmA8jiTTQaB
slOHWVE89nHx0of8X6SsVXbFotDdwclURJAZk99iwFr236rOE4aTqhDuR+HMAgoi
0SOuP8pdbUETh+K44DYMypLKS9A4OLGg7UxD5nFti523dIirvOI=
=fc6Y
-----END PGP SIGNATURE-----

--RddH+a3Xp2RTzIwS--

