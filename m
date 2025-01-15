Return-Path: <linux-media+bounces-24794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FFBA126F9
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 16:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33EE8188691F
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 15:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8B814900B;
	Wed, 15 Jan 2025 15:11:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C716F155325
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 15:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736953871; cv=none; b=Hy8bqKid2vl2wEXKv+x8wVENwtxdOuYAjd6ZQlA5iZAilsoPMC1tQ/QoAKBwFGRicbEZYg7mHMZ3m1aQyN+7AyxmzNFKSKYtxHmCXza7aBhjoiOEDDjfJ4Wj6F4PVw9LJAHKwLI6Pt7pTrc3L6heFBqROJcw7KPECPs02gCU15w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736953871; c=relaxed/simple;
	bh=w3iXKpEml9lXLDs+5vLs0CfNg7YDdkXN7EgMTuM4CRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRR6SmHfC8a32W21UwQgAmSjaZIoUHtqKlgIxWR0eJ8pciBD0ucA3iWJ4hJV7dQRPA3FzqJO48s9uAej/NXfmGV9d8r5nPMDbZaXd2oeXPTre+GbZlQUp87pmWBsPm+pwD21HT5oxsTkRaobipKlirN6mW5Dj3+CBYUjaA9TfVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 9338B1F0004F
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 15:03:43 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id DC0FAAA1FC9; Wed, 15 Jan 2025 15:03:41 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id EBC49AA1FBF;
	Wed, 15 Jan 2025 15:03:39 +0000 (UTC)
Date: Wed, 15 Jan 2025 16:03:37 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Daniel Almeida <dwlsalmeida@gmail.com>, Adam Ford <aford173@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, andrzejtp2010@gmail.com,
	Frank Li <frank.li@nxp.com>, ming.qian@oss.nxp.com,
	linux-media <linux-media@vger.kernel.org>, linux-imx@nxmp.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Gustavo Padovan <gus@collabora.com>
Subject: Re: Hantro H1 Encoding Upstreaming
Message-ID: <Z4fOScVgLqYEU4Hw@collins>
References: <CAOMZO5D0QvYvr940giHPGwLpunQOpku7e5K_5hHyYYCwZQry2g@mail.gmail.com>
 <CAOMZO5BJt6qzETzMeO47N5Gu8136tppuXKnqv4ypk6HyLR99vA@mail.gmail.com>
 <F5E2D925-668C-4D4D-87C9-8F22126443FD@gmail.com>
 <CAHCN7x+hUJoKRO8U8dgafFip31AKJRqfQw1kOw7YhvZ6xXqNnA@mail.gmail.com>
 <A3476357-8D8D-4B82-8CAB-58370BECF575@gmail.com>
 <a393b3324c60c2c13994d34ca90faf4eb604ae43.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="F48ighn3Nxv23xv1"
Content-Disposition: inline
In-Reply-To: <a393b3324c60c2c13994d34ca90faf4eb604ae43.camel@collabora.com>


--F48ighn3Nxv23xv1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi folks,

Le Tue 14 Jan 25, 11:16, Nicolas Dufresne a =C3=A9crit :
> despite Andrzej having left the community, we are not giving up on the en=
coder
> work. In 2025, we aim at working more seriously on the V4L2 spec, as just
> writing driver won't cut it. Each class of codecs needs a general workflo=
w spec
> similar to what we have already for stateful encoder/decoder and stateless
> decoder.
>=20
> - https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-deco=
der.html
> - https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-enco=
der.html
> - https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-stat=
eless-decoder.html
>=20
> It is on top of this, that for each codec we have to add controls (mostly
> compound) specifics and details that suites stateless accelerators.
>=20
> From a community stand point, the most important focus is to write and ag=
ree on
> spec and controls. Once we have that, vendors will be able to slowly move=
 away
> from their custom solution, and compete on actual hardware rather then
> integration.

Thanks for the continued interest in this topic, I am also still interested=
 in
pushing it forward and defining a mainline API for stateless encore that fi=
ts
the bill.

> It is also time to start looking toward the future, since Hantro H1 is ve=
ry
> limited and ancient encoder. On same brand, if someone could work on VC80=
00E
> shipped on IMX8M Plus, or Rockchip codecs, that will certainly help progr=
ess. We
> can also get inspiration from many other stateless encoding APIs now, not=
ably
> VA, DXVA and Vulkan Video.

The VC8000E on the i.MX8MP is definitely my next hardware of interest here.
I will have time available to work on it in the near future.

> Of course, folks likes to know when this will happen, stateless decoders =
took 5
> years from start to the first codec being merged, hopefully we don't beat=
 that
> record. I personally aim for producing work during the summer, and mostly=
 focus
> on the spec.

To be fair we are not starting from scratch and seem to have a good momentum
here so I am hopeful it will not take as long!

> Its obvious for me that testing on H1 with a GStreamer
> implementation is the most productive, though I have strong interest in h=
aving
> an ecosystem of drivers. A second userspace implementation, perhaps ffmpe=
g ?,
> could also be useful.

Would be glad to not have to work on the GStreamer side and focus on kernel
work instead. Sofar we can already aim to support:
- Hantro H1
- Hantro H2/VC8000E
- Allwinner Video Engine

> If you'd like to take a bite, this is a good thread to discuss forward. U=
ntil
> the summer, I planned to reach to Paul, who made this great presentation =
[1] at
> FOSDEM last year and start moving the RFC into using these ideas. One of =
the
> biggest discussion is rate control, it is clear to me that modern HW inte=
grated
> RC offloading, though some HW specific knobs or even firmware offloading,=
 and
> this is what Paul has been putting some thought into.

In terms of RC offloading, what's I've seen in the Hantro H1 is a checkpoint
mechanism that allows making per-slice QP adjustments around the global pic=
ture
QP to bit the bill in terms of size. This can be a desirable thing if the u=
se
case is to stick to a given bitrate strictly.

There's also the regions of interest that are supported by many (most?) enc=
oders
and allow region-based QP changes (typically as offset). The number of avai=
lable
slots is hardware-specific.

In addition the H1 provides some extra statistics such as the "average"
resulting QP when on of these methods is used.

I guess my initial point about rate control was that it would be easier for
userspace to be able to choose a rate-control strategy directly and to have
common implementations kernel-side that would apply to all codecs. It also
allows leveraging hardware features without userspace knowing about them.

However the main drawback is that there will always be a need for a more
specific/advanced use-case than what the kernel is doing (e.g. using a npu),
which would need userspace to have more control over the encoder.

So a more direct interface would be required to let userspace do rate-contr=
ol.
At the end of the day, I think it would make more sense to expose these enc=
oders
for what they are and deal with the QP and features directly through the uA=
PI
and avoid any kernel-side rate-control. Hardware-specific features that nee=
d to
be configured and may return stats would just have extra controls for those.

So all in all we'd need a few new controls to configure the encode for code=
cs
(starting with h.264) and also some to provide encode stats (e.g. requested=
 qp,
average qp). It feels like we could benefit from existing stateful encoder
controls for various bitstream parameters.

Then userspace would be responsible for configuring each encode run with a
target QP value, picture type and list of references. We'd need to also inf=
orm
userspace of how many references are supported.

Another topic of interest is bitstream generation. I believe it would be ea=
sier
for the kernel side to generate those (some hardware has specific registers=
 to
write them) based on the configuration provided by userspace through contro=
ls.
It is also useful to be able to regenerate them on demand. I am not sure if
there would be interest in more precise tracking of bitstream headers (e.g.
H.264 PPS and SPS that have ids) and be able to bind them to specific encode
runs.

We could have some common per-codec bitstream generation v4l2 code with eit=
her
a cpu buffer access backend or a driver-specific implementation for writing=
 the
bits. I already have a base for this in my cedrus h264 encoder work:
https://github.com/bootlin/linux/blob/cedrus/h264-encoding/drivers/staging/=
media/sunxi/cedrus/cedrus_enc_h264.c#L722

Last words about private driver buffers (such as motion vectors and
reconstruction buffers), I think they should remain private and unseen from
userspace. We could add something extra to the uAPI later if there is reall=
y a
need to access those.

Cheers,

Paul

> If decoders have progressed so much in quality in the last few years, it =
is
> mostly before we have better ways to test them. It is also needed to start
> thinking how do we want to test our encoders. The stateful scene is not a=
ll
> green, with a very organic groth and difficult to unify set of encoders. =
And we
> have no metric of how good or bad they are either.
>
> regards,
> Nicolas
>=20
> Le lundi 13 janvier 2025 =C3=A0 18:08 -0300, Daniel Almeida a =C3=A9crit=
=C2=A0:
> > +cc Nicolas
> >=20
> >=20
> > Hey Adam,
> >=20
> >=20
> > >=20
> > > Daniel,
> > >=20
> > > Do you know if anyone will be picking up the H1 encoder?
> > >=20
> > > adam
> > > >=20
> > > > =E2=80=94 Daniel
> > > >=20
> > >=20
> >=20
> > I think my colleague Nicolas is the best person to answer this.
> >=20
> > =E2=80=94 Daniel
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--F48ighn3Nxv23xv1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmeHzkkACgkQhP3B6o/u
lQwVNQ/1FIzK6k1Dqa9nxG4Vt3GRLANsH2j4xUJVttt/viyZbPhGxXyU5OdBmb67
yzBsolW5LfYwDl1IVZ9FHgwiHHtowPL0Sy4e4MH3X3jFHxX0+/wXAA271HEmLhZ0
ZOZy7aajtY3dC76ap1uIgQc3aDnyV03SZGpoa6YzuxI+v5v/EuJTKwecl8rUMyAd
6pzrvzMvL0tiWxnHae088BdQP32qc6APh6e8Y904fF5LJAjj3MQdaMbKdkXSHc2N
KK9cBadaZPrny8gKdY4lR/IeYrWFX1o+bzp2ltfdf/cGo1zk9KoqoHki+eU5kcCD
Oz7l0xyRoXWpazgmORObOrtq7RsCPeVtLWQ90X6UW99MzAgd5enwSwNi8LFa27FI
sBnQLo6ecF18Pfr9G3gg+YfLh5WuTPI2WCE+bAaYfNFTJ7X9t+H9lZiqbbrz3yNb
mwjwsD+Hf7NAd0SWFRVWrzE1knncrdeAtJJFPyemNim9X1+etqfRgvPBn1YJRow3
BRyhVoLgI5OfJ+Zj4OxGMSLHzwjfCxZOb4AofyD2NofmH6wWhi1nAFjK9vf4Qm9k
Zmob5WjPLnDVt9P3yM56cY1IcjthDlD9qzpZnUsEGohVsaTmzFk59uwQm3JlHQai
tI0o7WUPpKqxz+McZdRnnBGhbegUfX6Fb8Kmhsx3H85qZ2TGuQ==
=qJ9C
-----END PGP SIGNATURE-----

--F48ighn3Nxv23xv1--

