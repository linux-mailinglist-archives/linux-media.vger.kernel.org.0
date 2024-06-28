Return-Path: <linux-media+bounces-14350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AA791C153
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 16:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B90121F24D4D
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 14:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6141C0DEA;
	Fri, 28 Jun 2024 14:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWP9O0ae"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C9B155321;
	Fri, 28 Jun 2024 14:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719585761; cv=none; b=JeSQyaQMR66tIBzndswPrM+e06Tu/fX6o3wQDyb5Kwq7G+3s1WpMbukq7JAHRNU82VDdL/8JteQI6BPQ0QiXXPhO2PJ1WOezjbKv/PiflZMzakf8re+CQY1ZiC/nfauHx9dpP6Dkc0pLNbcheO2nooyixmodkEiJt0XHT8T48m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719585761; c=relaxed/simple;
	bh=G6bPcgVfhtKHMTVF0/KfSCD2n0uLEOuyz54+xUWr58k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DwFgmwqU4OA9gsXGzNNdyKtDIEkp/v10HFYUPBZOPWOcF5UK92NNdH6W5bEG52L0Zv7JBtVWb0aGecWtRE67DsPPY4aT+07hxk2PVQwT7uYEE7W5YfjOESMoeMf1hgVVdwQzcB0peRU4AZW+wcs/km3DMmmwnTCt0hK9QUh3GiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWP9O0ae; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-354b722fe81so571829f8f.3;
        Fri, 28 Jun 2024 07:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719585758; x=1720190558; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KBFsmcHiCQdWp2arl9na9xvwhRaKDOvXIf/Px5kpSzA=;
        b=gWP9O0aeImZUXkCVqjW9hHTMC6GmNVhTxNdvRa3LGRzLv8DytAjWAUXm2X5oJk/T1x
         A+cuZpsMEriTjt6QTdJAwUNfEXePjDLDHzjFAkDB3wbGmXfKPpi7h7TgKpZqIh7JHRre
         oooPzq0FjMxobGU2e/Hjfeu9Q9k5vtt6p41Po2ADn5lKKxIMjvcTpikmN2gfvcR7hbsu
         c2F9NqIScmeOYsIpmjvnQT0gTJN3OlZfsC62rJ2932cuVM1TLH9pcM/i4nohfP53wRJJ
         Mz3eMT0oyPm1j5icmPr6gjx/GZBJQHFWU8YUkE8N/HiS1ycvqlypEwRbrWfRjGdGyq68
         SGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719585758; x=1720190558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBFsmcHiCQdWp2arl9na9xvwhRaKDOvXIf/Px5kpSzA=;
        b=b7NUBSnNKCandMq7LPRpDtGtAL0itwfFDYRHDuBjNeOpZlas6OMrXyFT6/hxPB0hLz
         rjzRZEqnC0st653KkFl0ml0as0RuJTgH9arT3S0oFBTFnZKgbb1HBNaycjKxC4qgjO37
         KExHdao1s32wqnMNC4jRXEyc8SyMHcFvXI0RfG70xlobHVcrrK6VpbZPTN2YzdYBhnMv
         OEt1gE6vFmQw8DpXMx0iEzBqXClm7PHAncVaaeBS5Y0nukwpKeCxFCgvpxgXZr+EclHA
         Qu4E4w/D0ORyF0EEVt3NWkFL6Kah6oQ3uZoyqZlysfUl28u0x+HfhPZedfKSElDYOYdZ
         h3+w==
X-Forwarded-Encrypted: i=1; AJvYcCXmSLwaDSXrec8Va+f4KPxCEIG/caG9Cl/L3uRZiScwI9PGInSpyW6LOgs277M6oS/o2M0vkqtIlCsJMK7PfIso5sgB3Csie4FMnH9wA+3sW1dotjJBUa8/DFUXCUq+CzXmbMtfQtBbAtpxg7wx2BEavyglUc8JoFmW4WYzl71LEZqyoXyv
X-Gm-Message-State: AOJu0YytKJOT+k0b0KyoSYHUIMQiFPiv2yU+ClKE77G1Gp4fY8XADW9+
	ZPu9W8IyM+QpK+Gx5bqUZsddPL9cCr7xqCpCzvUfCJUmvE4cvyxn
X-Google-Smtp-Source: AGHT+IHBlrmEBaunoFWrg+WEnqhg99HHDUXCnPXUbdV+Vvm2fSUOs/olkZcs/GcFE/mIMgC0rfREJA==
X-Received: by 2002:a05:6000:1744:b0:362:b106:c5a2 with SMTP id ffacd0b85a97d-36752661f20mr2643122f8f.70.1719585757336;
        Fri, 28 Jun 2024 07:42:37 -0700 (PDT)
Received: from orome (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0e174bsm2524956f8f.63.2024.06.28.07.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 07:42:36 -0700 (PDT)
Date: Fri, 28 Jun 2024 16:42:35 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: John Stultz <jstultz@google.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Mattijs Korpershoek <mkorpershoek@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 0/8] dma-buf: heaps: Support carved-out heaps and ECC
 related-flags
Message-ID: <3e37rhrcqogix5obsu2gq7jar7bcoamx4bbd376az5z3zdkwvm@jstirwdl5efm>
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
 <CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyciVXMXQ@mail.gmail.com>
 <ZkXmWwmdPsqAo7VU@phenom.ffwll.local>
 <CANDhNCo5hSC-sLwdkBi3e-Ja-MzdqcGGbn-4G3XNYwCzZUwscw@mail.gmail.com>
 <ZkyOOwpM57HIiO3v@phenom.ffwll.local>
 <qy7aczeu6kumv5utemoevi7omp5ryq55zmgzxh5hrz5orf2osp@wypg66awof4n>
 <20240628-resilient-resolute-rook-0fc531@houat>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7qapu67rznvjb2hm"
Content-Disposition: inline
In-Reply-To: <20240628-resilient-resolute-rook-0fc531@houat>


--7qapu67rznvjb2hm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 03:08:46PM GMT, Maxime Ripard wrote:
> Hi,
>=20
> On Fri, Jun 28, 2024 at 01:29:17PM GMT, Thierry Reding wrote:
> > On Tue, May 21, 2024 at 02:06:19PM GMT, Daniel Vetter wrote:
> > > On Thu, May 16, 2024 at 09:51:35AM -0700, John Stultz wrote:
> > > > On Thu, May 16, 2024 at 3:56=E2=80=AFAM Daniel Vetter <daniel@ffwll=
=2Ech> wrote:
> > > > > On Wed, May 15, 2024 at 11:42:58AM -0700, John Stultz wrote:
> > > > > > But it makes me a little nervous to add a new generic allocatio=
n flag
> > > > > > for a feature most hardware doesn't support (yet, at least). So=
 it's
> > > > > > hard to weigh how common the actual usage will be across all the
> > > > > > heaps.
> > > > > >
> > > > > > I apologize as my worry is mostly born out of seeing vendors re=
ally
> > > > > > push opaque feature flags in their old ion heaps, so in providi=
ng a
> > > > > > flags argument, it was mostly intended as an escape hatch for
> > > > > > obviously common attributes. So having the first be something t=
hat
> > > > > > seems reasonable, but isn't actually that common makes me fret =
some.
> > > > > >
> > > > > > So again, not an objection, just something for folks to stew on=
 to
> > > > > > make sure this is really the right approach.
> > > > >
> > > > > Another good reason to go with full heap names instead of opaque =
flags on
> > > > > existing heaps is that with the former we can use symlinks in sys=
fs to
> > > > > specify heaps, with the latter we need a new idea. We haven't yet=
 gotten
> > > > > around to implement this anywhere, but it's been in the dma-buf/h=
eap todo
> > > > > since forever, and I like it as a design approach. So would be a =
good idea
> > > > > to not toss it. With that display would have symlinks to cma-ecc =
and cma,
> > > > > and rendering maybe cma-ecc, shmem, cma heaps (in priority order)=
 for a
> > > > > SoC where the display needs contig memory for scanout.
> > > >=20
> > > > So indeed that is a good point to keep in mind, but I also think it
> > > > might re-inforce the choice of having ECC as a flag here.
> > > >=20
> > > > Since my understanding of the sysfs symlinks to heaps idea is about
> > > > being able to figure out a common heap from a collection of devices,
> > > > it's really about the ability for the driver to access the type of
> > > > memory. If ECC is just an attribute of the type of memory (as in th=
is
> > > > patch series), it being on or off won't necessarily affect
> > > > compatibility of the buffer with the device.  Similarly "uncached"
> > > > seems more of an attribute of memory type and not a type itself.
> > > > Hardware that can access non-contiguous "system" buffers can access
> > > > uncached system buffers.
> > >=20
> > > Yeah, but in graphics there's a wide band where "shit performance" is
> > > defacto "not useable (as intended at least)".
> > >=20
> > > So if we limit the symlink idea to just making sure zero-copy access =
is
> > > possible, then we might not actually solve the real world problem we =
need
> > > to solve. And so the symlinks become somewhat useless, and we need to
> > > somewhere encode which flags you need to use with each symlink.
> > >=20
> > > But I also see the argument that there's a bit a combinatorial explos=
ion
> > > possible. So I guess the question is where we want to handle it ...
> >=20
> > Sorry for jumping into this discussion so late. But are we really
> > concerned about this combinatorial explosion in practice? It may be
> > theoretically possible to create any combination of these, but do we
> > expect more than a couple of heaps to exist in any given system?
>=20
> I don't worry too much about the number of heaps available in a given
> system, it would indeed be fairly low.
>=20
> My concern is about the semantics combinatorial explosion. So far, the
> name has carried what semantics we were supposed to get from the buffer
> we allocate from that heap.
>=20
> The more variations and concepts we'll have, the more heap names we'll
> need, and with confusing names since we wouldn't be able to change the
> names of the heaps we already have.

What I was trying to say is that none of this matters if we make these
names opaque. If these names are contextual for the given system it
doesn't matter what the exact capabilities are. It only matters that
their purpose is known and that's what applications will be interested
in.

> > Would it perhaps make more sense to let a platform override the heap
> > name to make it more easily identifiable? Maybe this is a naive
> > assumption, but aren't userspace applications and drivers not primarily
> > interested in the "type" of heap rather than whatever specific flags
> > have been set for it?
>=20
> I guess it depends on what you call the type of a heap. Where we
> allocate the memory from, sure, an application won't care about that.
> How the buffer behaves on the other end is definitely something
> applications are going to be interested in though.

Most of these heaps will be very specific, I would assume. For example a
heap that is meant to be protected for protected video decoding is both
going to be created in such a way as to allow that use-case (i.e. it
doesn't make sense for it to be uncached, for example) and it's also not
going to be useful for any other use-case (i.e. there's no reason to use
that heap for GPU jobs or networking, or whatever).

> And if we allow any platform to change a given heap name, then a generic
> application won't be able to support that without some kind of
> platform-specific configuration.

We could still standardize on common use-cases so that applications
would know what heaps to allocate from. But there's also no need to
arbitrarily restrict this. For example there could be cases that are
very specific to a particular platform and which just doesn't exist
anywhere else. Platform designers could then still use this mechanism to
define that very particular heap and have a very specialized userspace
application use that heap for their purpose.

> > For example, if an applications wants to use a protected buffer, the
> > application doesn't (and shouldn't need to) care about whether the heap
> > for that buffer supports ECC or is backed by CMA. All it really needs to
> > know is that it's the system's "protected" heap.
>=20
> I mean... "protected" very much means backed by CMA already, it's pretty
> much the only thing we document, and we call it as such in Kconfig.

Well, CMA is really just an implementation detail, right? It doesn't
make sense to advertise that to anything outside the kernel. Maybe it's
an interesting fact that buffers allocated from these heaps will be
physically contiguous? In the majority of cases that's probably not even
something that matters because we get a DMA-BUF anyway and we can map
that any way we want.

Irrespective of that, physically contigous buffers could be allocated in
any number of ways, CMA is just a convenient implementation of one such
allocator.

> But yeah, I agree that being backed by CMA is probably not what an
> application cares about (and we even have might some discussions about
> that), but if the ECC protection comes at a performance cost then it
> will very much care about it. Or if it comes with caches enabled or not.

True, no doubt about that. However, I'm saying there may be advantages
in hiding all of this from applications. Let's say we're trying to
implement video decoding. We can create a special "protected-video" heap
that is specifically designed to allocate encrypted/protected scanout
buffers from.

When you design that system, you would most certainly not enable ECC
protection on that heap because it leads to bad performance. You would
also want to make sure that all of the buffers in that heap are cached
and whatever other optimizations your chip may provide.

Your application doesn't have to care about this, though, because it can
simply look for a heap named "protected-video" and allocate buffers from
it.

> > This rather than try to represent every possible combination we
> > basically make this a "configuration" issue. System designers need to
> > settle on whatever combination of flags work for all the desired use-
> > cases and then we expose that combination as a named heap.
>=20
> This just pushes the problem down to applications, and carry the flags
> mentioned earlier in the heap name. So the same information, but harder
> to process or discover for an application.

Yes, this pushes the problem down to the application. But given the
above I don't think it becomes at all hard to process. We may sacrifice
some flexibility, but I'm arguing that it's flexibility that we don't
need anyway.

> > One problem that this doesn't solve is that we still don't have a way of
> > retrieving these flags in drivers which may need them.
>=20
> I'm not sure drivers should actually need to allocate from heaps, but we
> could do it just like I suggested we'd do it for applications: we add a
> new function that allows to discover what a given heap capabilities are.
> And then we just have to iterate and choose the best suited for our
> needs.

Yeah, that's an interesting option as well. I think contrary to
userspace it makes more sense to work off of a set of flags at the
kernel level.

The obvious downside to this is that userspace now also needs driver-
specific implementations for the allocation. Similar to the above it
gives us a lot of flexibility at the cost of simplicity.

Thierry

--7qapu67rznvjb2hm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZ+y9gACgkQ3SOs138+
s6GCGw/+P7wCgBX8O+ejKciexhjU0MMJ/iq+fSjPjkyRxYfxOpiFtPIGD7svaXLI
qlhjMB0FGJ4tU8EYfoWMJzWBcOv3qg33kql9RDenfEWfk7T/teX7LpqH6G1v1CdS
ozZehvkdw1FyCmTvHT/xzMK3lmEFL58ID/fvs3n8jGOVbMlnxVNZ1tJ2EXSUNc10
VQzzwOnW4Ur9J16f/WEnVhgDOAYYFPjkFpV5JLarPlcRDfpOf5qrwWo7kbOEwvCz
+YC/S2bPZsp3qpWYcbfnVN1DTjKIoKCyzJIWgzwA2Sjw71DvlO5UyZb2hYS/5I76
lj02WxFbTgPGCwEC5g1BaXvviPjsjgXmu32Ap+KghWirxVkDG+8cCmkRrK7qZ3aw
Mc0T//I4IKRig+EibTRZvCSTVlv9lJgl4swG9n5aytABxH5JV93qwhSdOUlWDkMq
Xwe0fXwN5TGv+EbrAzf2EodXcCWN8AbasU7jffqFD7iFL7tEeuvF3qmLuOqaEl6w
AsvsPKbQVxJkVzvJnSDfFZujJ/MVl+cB9S8YP2xpxk/dKcERRLS0uz22adi6C1Mo
SCLVbhJOt7g3Js+mcbIptS+OK9krDGEVuWoUIQz12GtHR20ePDbAq/3ctFvnGvbI
gUQR7wFr2r58TnJzkRD4TtJ4Ucg1aDDUSEgFt7nvSpBvCfP4HxM=
=3/gW
-----END PGP SIGNATURE-----

--7qapu67rznvjb2hm--

