Return-Path: <linux-media+bounces-14930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A394892E878
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 14:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6E501C21EEF
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 12:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AEF815D5C7;
	Thu, 11 Jul 2024 12:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0ROfEXM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C37C14F9DA;
	Thu, 11 Jul 2024 12:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720701874; cv=none; b=nf7H6aJifLdxV3ek0x0d3tyA7sGjqbCMeWNFf9jqJPsvAuG9SnSXu0zznAwGWoU4xIQXWwz6sRL+bWegGHR87D87etYuUp9TGTZZlsdooKvIUxHU/5P3pzKrHm+17Z6vW3hJIFXKga8NynErIiPBOwRaK7ZbkPEsmqcQ372oeRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720701874; c=relaxed/simple;
	bh=UPGoDa+Zhf51rJNrMosgFcrnTMyz/tqcajzlkFc4S9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYfx2Y8hZPOmZ6HGAuJ7RcLZ/011r2AyS0FstBi42K+HRTPT6zqQV0FOPW/Q4Y0i+awfxB64lpdM6ukgwDWBXmNlZ4KoNNwsTRNM1rxPP8r4KTyvncEc2y1uT6esxWWhNVsD4GOrIbCZrUS1hUxdFi+3tUMTSQfi30+59fLj5dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0ROfEXM; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ee77db6f97so13965311fa.2;
        Thu, 11 Jul 2024 05:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720701870; x=1721306670; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UHIQSML98l0ZiteQclaVKB3TmNkTxPKnEIkuCpbbQdk=;
        b=k0ROfEXMYcaUJme1KNyNB64H2wxYn5ZSTu3/Is7kzn/GdjPEcTIBZLL2dWC0XK3kzC
         DQtEBlWOKizQ2mrqpdr6bRUrB83SuG3+ktmxxEEDs15Qx0OvZw+X4HcyhJgFD3xE9PKY
         Db3+AxlJ46MQYgnFT4s3TjktDnBoj52IsQoJKPEFFsMSfTg+F5I+oaJhy/yL0I/o16ed
         1dKonDRcx2Ewdf7gmnDCr6L5Sia/F6nrUDRaoQSKkanWEc+Xu/uJ3TzzmmSxN+xeLGPU
         BysvPwgoO0dOXPm2N4olHGEfcUlR/CGfLhs85Effx5OoGm1Bkri/WAHceykdvTjsRoaq
         1eiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720701870; x=1721306670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHIQSML98l0ZiteQclaVKB3TmNkTxPKnEIkuCpbbQdk=;
        b=KZvjFNF+GEgtyitDZmjP+vUF+0SL0gMZtjoaePYiPnMljFyKFOqaQUC8SZif39M/c+
         Sa+D9SrakW61IejdOux9u1RztDrI2RFmzrPH/wXiQ2SvqW4PEZPR3N4/AsE6oMDaHALK
         Tlo80LKO8C9hChTcaI//gswjmRft77UJZrgyapJFQFm2eKuBmgjGqJ1B2UCAdS0uXQHB
         BK7fL4w3ga1CV7NHetNizXZnDRNXEpmeUr7GVnResYMSrs7+vbEQvm8W2pYXnjWHYy8D
         uHyPepvVSMMHMk3uf6DUKtMptB5HkiBBvtQPV+qblxGzlx20lrbAm5d3KoapmsruGR47
         4gQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6fs11UhLf0+wvAQNssiEN+fCwMXRWQp8fD6QTdz3ePwc25jmX1Cwr6VoLng3zU1HlodvlO+YNaxDtltH0Wf8rqApUen2VJo015Zt76MS2nlwF+92rGSXDOR537DuqDCzS65sgL4gl0a7twhI+EorZ6C3MfWwvhKILODtqIoWM1BbbIwxf
X-Gm-Message-State: AOJu0YyyhmHPfbfI4LlLwJalHwd0mPEVD6flIJJrqLZtxiniRVj6e38V
	pKbvXYTvPZjZbDSvckW6F5KFjthu7ZmluNIUenGehKUfe7WtIoB4
X-Google-Smtp-Source: AGHT+IHTdhWqzl6DXPtBTLulWR0yFzbtO2Y5fZehXnVZt9I/Jfq2/5EIqrqjJhw7ik9yJkJWbpwWbQ==
X-Received: by 2002:a2e:a316:0:b0:2ec:5945:62e9 with SMTP id 38308e7fff4ca-2eeb316b47bmr64990731fa.32.1720701868870;
        Thu, 11 Jul 2024 05:44:28 -0700 (PDT)
Received: from orome (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f736304sm115556375e9.34.2024.07.11.05.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 05:44:27 -0700 (PDT)
Date: Thu, 11 Jul 2024 14:44:25 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, John Stultz <jstultz@google.com>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [Linaro-mm-sig] Re: [PATCH 0/8] dma-buf: heaps: Support
 carved-out heaps and ECC related-flags
Message-ID: <dzfacxmcmru45ys7ef6gkxdwp5s5vekdrblnc5rhlllhtltsyt@zcs4xto6mfw7>
References: <ZkXmWwmdPsqAo7VU@phenom.ffwll.local>
 <CANDhNCo5hSC-sLwdkBi3e-Ja-MzdqcGGbn-4G3XNYwCzZUwscw@mail.gmail.com>
 <ZkyOOwpM57HIiO3v@phenom.ffwll.local>
 <qy7aczeu6kumv5utemoevi7omp5ryq55zmgzxh5hrz5orf2osp@wypg66awof4n>
 <20240628-resilient-resolute-rook-0fc531@houat>
 <3e37rhrcqogix5obsu2gq7jar7bcoamx4bbd376az5z3zdkwvm@jstirwdl5efm>
 <20240704-therapeutic-maroon-coucal-f61a63@houat>
 <wapv4gl2se34tq3isycb7bui5xi3x6kxjqtyz24qhjipnkbuqu@sv4w2crksuq5>
 <ZogSxHFPt8SpOa0w@phenom.ffwll.local>
 <41859b82-fe75-451a-9e13-fec254bdaad5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="td73epytrbw3q5zt"
Content-Disposition: inline
In-Reply-To: <41859b82-fe75-451a-9e13-fec254bdaad5@gmail.com>


--td73epytrbw3q5zt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 08, 2024 at 09:14:14AM GMT, Christian K=C3=B6nig wrote:
> Am 05.07.24 um 17:35 schrieb Daniel Vetter:
> > Just figured I'll jump in on one detail here.
> >=20
> > On Fri, Jul 05, 2024 at 04:31:34PM +0200, Thierry Reding wrote:
> > > On Thu, Jul 04, 2024 at 02:24:49PM GMT, Maxime Ripard wrote:
> > > > On Fri, Jun 28, 2024 at 04:42:35PM GMT, Thierry Reding wrote:
> > > > > On Fri, Jun 28, 2024 at 03:08:46PM GMT, Maxime Ripard wrote:
> > > > > > Hi,
> > > > > >=20
> > > > > > On Fri, Jun 28, 2024 at 01:29:17PM GMT, Thierry Reding wrote:
> > > > > > > On Tue, May 21, 2024 at 02:06:19PM GMT, Daniel Vetter wrote:
> > > > > > > > On Thu, May 16, 2024 at 09:51:35AM -0700, John Stultz wrote:
> > > > > > > > > On Thu, May 16, 2024 at 3:56=E2=80=AFAM Daniel Vetter <da=
niel@ffwll.ch> wrote:
> > > > > > > > > > On Wed, May 15, 2024 at 11:42:58AM -0700, John Stultz w=
rote:
> > > > > > > > > > > But it makes me a little nervous to add a new generic=
 allocation flag
> > > > > > > > > > > for a feature most hardware doesn't support (yet, at =
least). So it's
> > > > > > > > > > > hard to weigh how common the actual usage will be acr=
oss all the
> > > > > > > > > > > heaps.
> > > > > > > > > > >=20
> > > > > > > > > > > I apologize as my worry is mostly born out of seeing =
vendors really
> > > > > > > > > > > push opaque feature flags in their old ion heaps, so =
in providing a
> > > > > > > > > > > flags argument, it was mostly intended as an escape h=
atch for
> > > > > > > > > > > obviously common attributes. So having the first be s=
omething that
> > > > > > > > > > > seems reasonable, but isn't actually that common make=
s me fret some.
> > > > > > > > > > >=20
> > > > > > > > > > > So again, not an objection, just something for folks =
to stew on to
> > > > > > > > > > > make sure this is really the right approach.
> > > > > > > > > > Another good reason to go with full heap names instead =
of opaque flags on
> > > > > > > > > > existing heaps is that with the former we can use symli=
nks in sysfs to
> > > > > > > > > > specify heaps, with the latter we need a new idea. We h=
aven't yet gotten
> > > > > > > > > > around to implement this anywhere, but it's been in the=
 dma-buf/heap todo
> > > > > > > > > > since forever, and I like it as a design approach. So w=
ould be a good idea
> > > > > > > > > > to not toss it. With that display would have symlinks t=
o cma-ecc and cma,
> > > > > > > > > > and rendering maybe cma-ecc, shmem, cma heaps (in prior=
ity order) for a
> > > > > > > > > > SoC where the display needs contig memory for scanout.
> > > > > > > > > So indeed that is a good point to keep in mind, but I als=
o think it
> > > > > > > > > might re-inforce the choice of having ECC as a flag here.
> > > > > > > > >=20
> > > > > > > > > Since my understanding of the sysfs symlinks to heaps ide=
a is about
> > > > > > > > > being able to figure out a common heap from a collection =
of devices,
> > > > > > > > > it's really about the ability for the driver to access th=
e type of
> > > > > > > > > memory. If ECC is just an attribute of the type of memory=
 (as in this
> > > > > > > > > patch series), it being on or off won't necessarily affect
> > > > > > > > > compatibility of the buffer with the device.  Similarly "=
uncached"
> > > > > > > > > seems more of an attribute of memory type and not a type =
itself.
> > > > > > > > > Hardware that can access non-contiguous "system" buffers =
can access
> > > > > > > > > uncached system buffers.
> > > > > > > > Yeah, but in graphics there's a wide band where "shit perfo=
rmance" is
> > > > > > > > defacto "not useable (as intended at least)".
> > > > > > > >=20
> > > > > > > > So if we limit the symlink idea to just making sure zero-co=
py access is
> > > > > > > > possible, then we might not actually solve the real world p=
roblem we need
> > > > > > > > to solve. And so the symlinks become somewhat useless, and =
we need to
> > > > > > > > somewhere encode which flags you need to use with each syml=
ink.
> > > > > > > >=20
> > > > > > > > But I also see the argument that there's a bit a combinator=
ial explosion
> > > > > > > > possible. So I guess the question is where we want to handl=
e it ...
> > > > > > > Sorry for jumping into this discussion so late. But are we re=
ally
> > > > > > > concerned about this combinatorial explosion in practice? It =
may be
> > > > > > > theoretically possible to create any combination of these, bu=
t do we
> > > > > > > expect more than a couple of heaps to exist in any given syst=
em?
> > > > > > I don't worry too much about the number of heaps available in a=
 given
> > > > > > system, it would indeed be fairly low.
> > > > > >=20
> > > > > > My concern is about the semantics combinatorial explosion. So f=
ar, the
> > > > > > name has carried what semantics we were supposed to get from th=
e buffer
> > > > > > we allocate from that heap.
> > > > > >=20
> > > > > > The more variations and concepts we'll have, the more heap name=
s we'll
> > > > > > need, and with confusing names since we wouldn't be able to cha=
nge the
> > > > > > names of the heaps we already have.
> > > > > What I was trying to say is that none of this matters if we make =
these
> > > > > names opaque. If these names are contextual for the given system =
it
> > > > > doesn't matter what the exact capabilities are. It only matters t=
hat
> > > > > their purpose is known and that's what applications will be inter=
ested
> > > > > in.
> > > > If the names are opaque, and we don't publish what the exact
> > > > capabilities are, how can an application figure out which heap to u=
se in
> > > > the first place?
> > > This would need to be based on conventions. The idea is to standardize
> > > on a set of names for specific, well-known use-cases.
> > >=20
> > > > > > > Would it perhaps make more sense to let a platform override t=
he heap
> > > > > > > name to make it more easily identifiable? Maybe this is a nai=
ve
> > > > > > > assumption, but aren't userspace applications and drivers not=
 primarily
> > > > > > > interested in the "type" of heap rather than whatever specifi=
c flags
> > > > > > > have been set for it?
> > > > > > I guess it depends on what you call the type of a heap. Where we
> > > > > > allocate the memory from, sure, an application won't care about=
 that.
> > > > > > How the buffer behaves on the other end is definitely something
> > > > > > applications are going to be interested in though.
> > > > > Most of these heaps will be very specific, I would assume.
> > > > We don't have any specific heap upstream at the moment, only generic
> > > > ones.
> > > But we're trying to add more specific ones, right?
> > >=20
> > > > > For example a heap that is meant to be protected for protected vi=
deo
> > > > > decoding is both going to be created in such a way as to allow th=
at
> > > > > use-case (i.e. it doesn't make sense for it to be uncached, for
> > > > > example) and it's also not going to be useful for any other use-c=
ase
> > > > > (i.e. there's no reason to use that heap for GPU jobs or networki=
ng,
> > > > > or whatever).
> > > > Right. But also, libcamera has started to use dma-heaps to allocate
> > > > dma-capable buffers and do software processing on it before sending=
 it
> > > > to some hardware controller.
> > > >=20
> > > > Caches are critical here, and getting a non-cacheable buffer would =
be
> > > > a clear regression.
> > > I understand that. My point is that maybe we shouldn't try to design a
> > > complex mechanism that allows full discoverability of everything that=
 a
> > > heap supports or is capable of. Instead if the camera has specific
> > > requirements, it could look for a heap named "camera". Or if it can
> > > share a heap with other multimedia devices, maybe call the heap
> > > "multimedia".
> > >=20
> > > The idea is that heaps for these use-cases are quite specific, so you
> > > would likely not find an arbitrary number of processes try to use the
> > > same heap.
> > Yeah the idea to sort this out was to have symlinks in sysfs from the
> > device to each heap. We could then have priorities for each such link, =
so
> > that applications can pick the "best" heap that will work with all
> > devices. Or also special links for special use-cases, like for a
> > display+render drm device you might want to have separate links for the
> > display and the render-only use-case.
> >=20
> > I think trying to encode this all into the name of a heap without linki=
ng
> > it to the device is not going to work well in general.
> >=20
> > We still have that entire "make sysfs symlinks work for dma-buf heaps" =
on
> > our todos, and that idea is almost as old as dma-buf itself :-/
>=20
> I still have the draft patches for that lying around on my harddisk
> somewhere with zero time to look into it.
>=20
> If anybody wants to pick it up feel free to ping me, but be aware that you
> need to write more documentation than code.

I'm interested, so if you can dig those out that'd be a great reference.

Thanks,
Thierry

--td73epytrbw3q5zt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmaP06kACgkQ3SOs138+
s6G0FA/9Hi0eeg8epQN/swA6h+F2HtoxmMZ0hVURKqRm1OZ/LOKlQcAJeXOqKRWU
MT0vEpM8w4x7MbR7VUtAjP9/U2xyfHfcyGf0UZklTLwNzlyutaUw1Zme0b/5HI8c
xziTMXV3uHkE8cNG72VSQ4PwLr6HhwFuGdAhXHZzK2M0szmLf+cwppwyIjtOYDGM
szpgK9G119TuWgbz9o9LfPrVPp1sL0E2WhWRUazEHMpIuqme0W6ScIweNFmLq8hp
6Q5xS4j9pUCizTKCzlWxazOdh70OcZg4kNzb12cuZET01yXJjr0SA98UQTJnMdla
tZ4hfEZDSHIZDM4c4hNq4TkdiHYekXJhDAEO+DPO5ZgHelOalpgrcfXuH59W4kcg
JnKHu4G7Ucej1fb27Oc5WgTXfSvh5Uz51xotCCm0nQp8Ek+SyK6DUeTaVDI21bYN
Eu8gIsd8AkuU5meEfm/s5w8T2YIei/DF0RhwqrSvzik+3E+4ryES+qvubHPSGy9X
D3hLAJswxUbu5QNatDbNJGGPvL3+mE9uOxcu4H+aUia5m7zmLQFx0PgIDv5i89QG
B5alHoMbXkcgS/VY8JbEg3Pi1032p72Mk/KdVFEPVYI2XwWP0MPSuI1kkdTn5j0c
tSLl1QnOxaN/cvhbOJg8wnNW6mD1O4XEeTOoHigS5amzANcuFno=
=zsP8
-----END PGP SIGNATURE-----

--td73epytrbw3q5zt--

