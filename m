Return-Path: <linux-media+bounces-11557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0805A8C76A7
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 14:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 669EF1F21F5B
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 12:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F4D146005;
	Thu, 16 May 2024 12:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HW+z3how"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ED77E763;
	Thu, 16 May 2024 12:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715863274; cv=none; b=sCMpH1WtJnH67XrPEFbJ5wfkGQglRckZ0oq4IxzUTljbe5FOwFNxr60VZw727ZxWLPKfgKntoEKS8Hb6tcMPi4eahTohTGVxgQlH5PopXlG6GkAtZtnFRzCxNucS/V15Ols1eiQ2d3IwrS5YK67zl4KBeUHuiv9DA9/vR1FwwKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715863274; c=relaxed/simple;
	bh=eQHIiIL1ALm5PPVQ3Io9cb7gr9OV/haIlOC1+pSXKVU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nKs+aAP64TWRr6huehkCNnMS8/c/WSjJFAuYHOXlZKPZoWE2ucDOaNHk2vABxxnj2A0RuuJcVcGHz+OfsTVVhJoZTDDmJHENAFgTyLAuh0KI1Hq250X26TQl+xKZiZjXtBE9TBjwB5N+ACoVKud2qIXH4qVt17GfLyGuJAhEA+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HW+z3how; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51309C32786;
	Thu, 16 May 2024 12:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715863273;
	bh=eQHIiIL1ALm5PPVQ3Io9cb7gr9OV/haIlOC1+pSXKVU=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=HW+z3howijTGOOcAphkl82HP7uOZEOoSZva4jxoHROFt0mSevv4rTFk8gICxCfvk/
	 7oNOzLU8oefihbItRwr2yBUhfYOVn7knvCS1vQMIROkobA1ZRdWkObtk3+lsksUT4Y
	 M3/B++hwmb42oQvcuubJhZOt2q/FyH5cQAF8yG5h3uTmALEG/DbnWjc+FobKIRfsI1
	 Cs1B0SiV4LAp4wu31y71LUjghKuTDhOfJJ6+Hw92G4aF7MxB93h1dc5w/eAY/7C6mj
	 KUmU1fiFlJq/E7Qv/CWqyNgqqdUPZyQIy0FSYoUsmMByvMNnLzZbNmoG6R6lruvx5t
	 ucCkeNHAJmgjw==
Date: Thu, 16 May 2024 14:41:10 +0200
From: Maxime Ripard <mripard@kernel.org>
To: John Stultz <jstultz@google.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Mattijs Korpershoek <mkorpershoek@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 0/8] dma-buf: heaps: Support carved-out heaps and ECC
 related-flags
Message-ID: <20240516-melodic-quick-dalmatian-fa7b41@penduick>
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
 <CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyciVXMXQ@mail.gmail.com>
 <ZkXmWwmdPsqAo7VU@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="suucgit7csl7uhjz"
Content-Disposition: inline
In-Reply-To: <ZkXmWwmdPsqAo7VU@phenom.ffwll.local>


--suucgit7csl7uhjz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2024 at 12:56:27PM +0200, Daniel Vetter wrote:
> On Wed, May 15, 2024 at 11:42:58AM -0700, John Stultz wrote:
> > On Wed, May 15, 2024 at 6:57=E2=80=AFAM Maxime Ripard <mripard@kernel.o=
rg> wrote:
> > > This series is the follow-up of the discussion that John and I had a =
few
> > > months ago here:
> > >
> > > https://lore.kernel.org/all/CANDhNCquJn6bH3KxKf65BWiTYLVqSd9892-xtFDH=
HqqyrroCMQ@mail.gmail.com/
> > >
> > > The initial problem we were discussing was that I'm currently working=
 on
> > > a platform which has a memory layout with ECC enabled. However, enabl=
ing
> > > the ECC has a number of drawbacks on that platform: lower performance,
> > > increased memory usage, etc. So for things like framebuffers, the
> > > trade-off isn't great and thus there's a memory region with ECC disab=
led
> > > to allocate from for such use cases.
> > >
> > > After a suggestion from John, I chose to start using heap allocations
> > > flags to allow for userspace to ask for a particular ECC setup. This =
is
> > > then backed by a new heap type that runs from reserved memory chunks
> > > flagged as such, and the existing DT properties to specify the ECC
> > > properties.
> > >
> > > We could also easily extend this mechanism to support more flags, or
> > > through a new ioctl to discover which flags a given heap supports.
> >=20
> > Hey! Thanks for sending this along! I'm eager to see more heap related
> > work being done upstream.
> >=20
> > The only thing that makes me a bit hesitant, is the introduction of
> > allocation flags (as opposed to a uniquely specified/named "ecc"
> > heap).
> >=20
> > We did talk about this earlier, and my earlier press that only if the
> > ECC flag was general enough to apply to the majority of heaps then it
> > makes sense as a flag, and your patch here does apply it to all the
> > heaps. So I don't have an objection.
> >=20
> > But it makes me a little nervous to add a new generic allocation flag
> > for a feature most hardware doesn't support (yet, at least). So it's
> > hard to weigh how common the actual usage will be across all the
> > heaps.
> >=20
> > I apologize as my worry is mostly born out of seeing vendors really
> > push opaque feature flags in their old ion heaps, so in providing a
> > flags argument, it was mostly intended as an escape hatch for
> > obviously common attributes. So having the first be something that
> > seems reasonable, but isn't actually that common makes me fret some.
> >=20
> > So again, not an objection, just something for folks to stew on to
> > make sure this is really the right approach.
>=20
> Another good reason to go with full heap names instead of opaque flags on
> existing heaps is that with the former we can use symlinks in sysfs to
> specify heaps, with the latter we need a new idea. We haven't yet gotten
> around to implement this anywhere, but it's been in the dma-buf/heap todo
> since forever, and I like it as a design approach. So would be a good idea
> to not toss it. With that display would have symlinks to cma-ecc and cma,
> and rendering maybe cma-ecc, shmem, cma heaps (in priority order) for a
> SoC where the display needs contig memory for scanout.

I guess it depends what we want to use the heaps for exactly. If we
create a heap by type, then the number of heaps is going to explode and
their name is going to be super weird and inconsistent.

Using the ECC setup here as an example, it means that we would need to
create system (with the default ECC setup for the system), system-ecc,
system-no-ecc, cma, cma-ecc, cma-no-ecc.

Let's say we introduce caching next. do we want to triple the number of
heaps again?

So I guess it all boils down to whether we want to consider heaps as
allocators, and then we need the flags to fine-tune the attributes/exact
semantics, or the combination of an allocator and the semantics which
will make the number of heaps explode (and reduce their general
usefulness, I guess).

Maxime

--suucgit7csl7uhjz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZkX+5gAKCRAnX84Zoj2+
dlm2AX4zDrlbmQnJLk98W+IofB6hK8ZzSAe2eROyf8ACySG5WHvFn9Thj2UsUYxC
Y3jkMxEBgOqPayZCO59a/ow4sVm+Bk7F7/fvmM03D3EhW8fjpGGViti3Ap52OpI/
YONnWKwxQA==
=GS0k
-----END PGP SIGNATURE-----

--suucgit7csl7uhjz--

