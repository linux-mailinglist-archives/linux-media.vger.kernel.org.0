Return-Path: <linux-media+bounces-24890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A51D1A15E49
	for <lists+linux-media@lfdr.de>; Sat, 18 Jan 2025 18:16:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA46216675B
	for <lists+linux-media@lfdr.de>; Sat, 18 Jan 2025 17:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D629019D089;
	Sat, 18 Jan 2025 17:16:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D22A92F
	for <linux-media@vger.kernel.org>; Sat, 18 Jan 2025 17:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737220569; cv=none; b=nwOy4AEsO1TKQSOzSOqyBgpF1+cOSaI49BaCG7ZJnMzRF+WF0AC/TcnNBLe2SudP/ySQA5TTFOESADWSoqL4WOXjAFKmhldsYZ5A/GeuFEbckj5jq+MHdpltgdm1CR3egXL+pyfhl5JXj+NIGNCaDgkSIpJiKhOFcjIrolCQMmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737220569; c=relaxed/simple;
	bh=f9uwAEyrB+QPl5tLDK0pZOF5v43vmD5B4kGM/3MOaJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZNskochGpsnz/HvjGJGx+XzLdfQaTP4lgimh03/r4FeH56seSHmsq2Q0OUfva4RL2m4cMPdr6np8vftKIbOqXfITlginedfPnH5fZKUQLgwCHLZRZg5V+35dGWyLMNUmrMZj1flrIHCLChC6FZQtfZOJaItGmVO8t3SlQEp9qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 6F70C1F00057
	for <linux-media@vger.kernel.org>; Sat, 18 Jan 2025 17:16:03 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 40299AA22F6; Sat, 18 Jan 2025 17:16:02 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 92667AA22EF;
	Sat, 18 Jan 2025 17:16:00 +0000 (UTC)
Date: Sat, 18 Jan 2025 18:15:58 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Daniel Almeida <dwlsalmeida@gmail.com>, Adam Ford <aford173@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, andrzejtp2010@gmail.com,
	Frank Li <frank.li@nxp.com>, ming.qian@oss.nxp.com,
	linux-media <linux-media@vger.kernel.org>, linux-imx@nxmp.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Gustavo Padovan <gus@collabora.com>
Subject: Re: Hantro H1 Encoding Upstreaming
Message-ID: <Z4vhzrTtLElhDz_Q@collins>
References: <CAOMZO5D0QvYvr940giHPGwLpunQOpku7e5K_5hHyYYCwZQry2g@mail.gmail.com>
 <CAOMZO5BJt6qzETzMeO47N5Gu8136tppuXKnqv4ypk6HyLR99vA@mail.gmail.com>
 <F5E2D925-668C-4D4D-87C9-8F22126443FD@gmail.com>
 <CAHCN7x+hUJoKRO8U8dgafFip31AKJRqfQw1kOw7YhvZ6xXqNnA@mail.gmail.com>
 <A3476357-8D8D-4B82-8CAB-58370BECF575@gmail.com>
 <a393b3324c60c2c13994d34ca90faf4eb604ae43.camel@collabora.com>
 <Z4fOScVgLqYEU4Hw@collins>
 <a6bb546dcfe68334c5931cef01ea8af63ac64392.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KD8jVePAcAg9SHsf"
Content-Disposition: inline
In-Reply-To: <a6bb546dcfe68334c5931cef01ea8af63ac64392.camel@collabora.com>


--KD8jVePAcAg9SHsf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Wed 15 Jan 25, 15:14, Nicolas Dufresne a =C3=A9crit :
> Le mercredi 15 janvier 2025 =C3=A0 16:03 +0100, Paul Kocialkowski a =C3=
=A9crit=C2=A0:
> > Would be glad to not have to work on the GStreamer side and focus on ke=
rnel
> > work instead. Sofar we can already aim to support:
> > - Hantro H1
> > - Hantro H2/VC8000E
> > - Allwinner Video Engine
>=20
> And Rockchip VEPUs, which have Open Source software implementation in lib=
MPP.
> Most of have access to reference software for the Hantro variants, I supp=
ose you
> have revered the Allwinner ?

Ah right, I haven't looked at Rockchip's own encoder implementations for a
while. I guess that's also called RKVENC.

> p.s. there is also Imagination stateless codecs, but I only seen them on =
older
> TI board.

Oh I didn't know Imagination also made stateless encoders. I was under the
impression those used in the various Jacinto families were stateful.

> > > If you'd like to take a bite, this is a good thread to discuss forwar=
d. Until
> > > the summer, I planned to reach to Paul, who made this great presentat=
ion [1] at
> > > FOSDEM last year and start moving the RFC into using these ideas. One=
 of the
> > > biggest discussion is rate control, it is clear to me that modern HW =
integrated
> > > RC offloading, though some HW specific knobs or even firmware offload=
ing, and
> > > this is what Paul has been putting some thought into.
> >=20
> > In terms of RC offloading, what's I've seen in the Hantro H1 is a check=
point
> > mechanism that allows making per-slice QP adjustments around the global=
 picture
> > QP to bit the bill in terms of size. This can be a desirable thing if t=
he use
> > case is to stick to a given bitrate strictly.
> >=20
> > There's also the regions of interest that are supported by many (most?)=
 encoders
> > and allow region-based QP changes (typically as offset). The number of =
available
> > slots is hardware-specific.
>=20
> Checkpoints seems unique Hantro, it has a lot of limitation as it 8 a ras=
ter set
> of blocks. It won't perform well with a important object in the middle of=
 the
> scene.

Yes I'm not saying it's particularly useful but more as an example that some
hardware will provide such unique/custom features.

> > In addition the H1 provides some extra statistics such as the "average"
> > resulting QP when on of these methods is used.
>=20
> Wasn't the statistic MAD (mean average distance), which is basically the =
average
> residual values ? In my copy of VC8000E reference someone, all that has b=
een
> commented out, and the x265 implementation copied over (remember you can =
pay to
> use their code in proprietary form, before jumping onto license violation=
).

Ah yes you're right! MAD and average QP. Again not sure how useful it really
is in practice.

> > I guess my initial point about rate control was that it would be easier=
 for
> > userspace to be able to choose a rate-control strategy directly and to =
have
> > common implementations kernel-side that would apply to all codecs. It a=
lso
> > allows leveraging hardware features without userspace knowing about the=
m.
> >=20
> > However the main drawback is that there will always be a need for a more
> > specific/advanced use-case than what the kernel is doing (e.g. using a =
npu),
> > which would need userspace to have more control over the encoder.
>=20
> Which brings to the most modern form of advanced rate control. You will f=
ind
> this in DXVA and Vulkan Video. It consist of splitting the image as an ev=
en
> grid, and allowing delta or qualitative differences of QP for each of the
> element in the grid. The size of that grid is limited by HW, you can impl=
ement
> ROI on top of this too. Though, if the HW has ROI directly, we don't have=
 much
> option but to expose it as such, which is fine. A lot of stateful encoder=
 have
> that too, and the controls should be the same.

Oh that's neat! Thanks for the insight and definitely good to have in mind.

> > So a more direct interface would be required to let userspace do rate-c=
ontrol.
> > At the end of the day, I think it would make more sense to expose these=
 encoders
> > for what they are and deal with the QP and features directly through th=
e uAPI
> > and avoid any kernel-side rate-control. Hardware-specific features that=
 need to
> > be configured and may return stats would just have extra controls for t=
hose.
> >=20
> > So all in all we'd need a few new controls to configure the encode for =
codecs
> > (starting with h.264) and also some to provide encode stats (e.g. reque=
sted qp,
> > average qp). It feels like we could benefit from existing stateful enco=
der
> > controls for various bitstream parameters.
>=20
> Sounds like we should offer both. As I stated earlier, modern HW resort to
> firmware offloading for performance reason. In V4L2, this is even more tr=
ue. If
> you read statistics such as MAD, bitstream size in a frame by frame basis=
, then
> you will never queue more then 1 buffer on the capture side. So the progr=
amming
> latency (including RC latency) will directly impact the encoder throughpu=
t. With
> offloading, the statistic can be handled in firmware, or without any cont=
ext
> switch, which improve throughput.

Right that is a very valid and central point. Indeed we do need a way to ta=
ke
the decision about the encode parameters for the next frame pretty much as =
soon
as the next m2m job is started. Waiting for userspace to take the decision =
based
on returned statistics would definitely stall the encoder for a while.

On the other hand there are cases where we cannot handle it all kernel-side
and we do need userspace interaction between previous and next frame.

So here is a suggestion here which may sound a bit wild but sounds to me li=
ke
it could actually work out: how about adding BPF support in V4L2 for
implementing the encoder strategy?

Then we can have the kernel and userspace working on the same ground and
everything actually running kernel-side without starving the encoder.

I guess we'd essentially need to provide the BPF program with enough inform=
ation
(maybe some hardware-specific too) to take the decision of the next frame's
encode parameters.

Of course I have no prior knowledge on how to implement this, but again it =
feels
like it could be a good fit for the situation we have to deal with.

> This needs to be unbiased, the GStreamer implementation we did for the la=
st RFC
> runs frame by frame, using last frame size as the statistic. We still man=
aged
> the specified IP performance documented in the white paper.

That's nice but indeed suboptimal. Let's beat that white paper.

> Like everything else, we don't need all this in a first uAPI, but we need=
 to
> define the minimum "required" features.
>=20
> >=20
> > Then userspace would be responsible for configuring each encode run wit=
h a
> > target QP value, picture type and list of references. We'd need to also=
 inform
> > userspace of how many references are supported.
>=20
> The H1 only have 1 reference + 1 long term reference (which only 1 refere=
nce was
> implemented). We used the default reference model, so there was only one =
way to
> manage and pass reference. There is clearly a lot more research to be done
> around reference management.

Yes absolutely.

Cheers,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--KD8jVePAcAg9SHsf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmeL4c4ACgkQhP3B6o/u
lQyyQA//XlzQldpyksy3PqdRhmQxXMayqcwh/djY1eBPvZTAfYpx7LipiXPLhsRr
x8/9pM4McXIrd51lJpdgv6a9HyqTyy3YM5hSYC+FQUfswj26ANeNBFIDLmjnTbzX
LDydcSe7uHmnWwRYmdS0EDnmNSR7gEvrlsRksi0fnv5WhQMs1KVx618nyidbOY8e
iHrdTJyr8l5vGamtP4dpso6uBaQv2iN9YKEWIfF/amVHQzrRi5mi5zf/gmi47zHj
/7tiKhn5/QQdhXUWc4vZ9yh0QYl0H0YqjBJ/Ak01txDJkTS+OWTUhginSRPWDpMs
u5H+dTncUjCoGOhL5/Wkw7Rs53EnGjgxwHkuEEj9dKmB32gWzrHQ47Bj6ujwdhqF
F5LmUMnIBX70+okVyMJaQeagwfp2qj0XpGXag9+fqRIGkZoH7ZhXp9S9uRe1PdJx
n+CNdx+gPS9aZf+MMu81ifloL8GY7uhgWXfvIKqXWV/M7SjBeR0urReQLO2/yoAJ
OiYMLLLDdLEkambOmW1XnVDPLfN3E+2q4t2D+v2nzkTa/186S/oRx1Zj/uHG0xxe
udc+W0VQmmGHFfnERR98bCfwLSy+mw7kxVWrim6FBNfiW4ekkN8ej8FbO1J0scj1
LnMCNwFwW8Uyv0ewLrPGuO+t00+w94vex7go8kqvK07OsLefSKA=
=tLj+
-----END PGP SIGNATURE-----

--KD8jVePAcAg9SHsf--

