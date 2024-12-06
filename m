Return-Path: <linux-media+bounces-22770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BC19E67FA
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 08:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA3B7281BDE
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 07:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5459A1DACB4;
	Fri,  6 Dec 2024 07:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uE8BedoB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFBC2F5E;
	Fri,  6 Dec 2024 07:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733470389; cv=none; b=NaUFyMHaGMnWkXs/uic683m3CsSvrlHswNbcPn1EYsE6ouud5vk5hYnD41nDvuPUhkNY+30enO1ZDcpUZZ6fbvFKJOIYhHvZ+XPBodxFS/bmEuCM3KrjUPlj+HLaS/h/aKCyFuZ4QT9lWLsbYDM0qNlLqXEeSaN7IDfTkLbVSwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733470389; c=relaxed/simple;
	bh=Br4Ym+uOjzwX17XYvI6sLeN1epKmjEpXyufYM9pwxpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4jEkJxcjyYI6jl8Q8PmewBmIheqH+scyvetuPgfeCcVb7FNZ/04/MmclSYqoLd7EXIfKQx0YHn5I3pkMBiUZ5bC5i0d1UK6hgVqFWn9KJncqS8dd7o91FxxZilb4vRk0amwg6dIn65J/UWRiwM0F87yzHhNdtDOtxqYX9nYpfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uE8BedoB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7FBBC4CED1;
	Fri,  6 Dec 2024 07:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733470389;
	bh=Br4Ym+uOjzwX17XYvI6sLeN1epKmjEpXyufYM9pwxpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uE8BedoByqhdRpsz+nvWWsw9TdjmV87U11uPD4Qop8gheN7MZTHZLzp7GEq7SN1Cc
	 q4jE4Utd01mmoHUmUsuEhjBtBQzY6LQqQd0c9UAoOWArRLtqkciMcWPlXNKsqSoXlf
	 8zlHorpx7x+cCDbzFPaKzYxc8I0Yx4b8NeEh2ydzLZu0w9x9l+97T9X0qjMrNUkyPn
	 loJUghnwxME1X8VwvaJrduAMuSXpKvUvJofn3we2z/pFu7cS31/+0rk9CKh8VpYnhR
	 hd6hpvQ+60DXYaYCziZ+37lnaPK0K/FPVBIe9wqhEeSnhSTYk40NhVNpWBk3CQaVmW
	 jUW5MkLThAWeA==
Date: Fri, 6 Dec 2024 08:33:06 +0100
From: Maxime Ripard <mripard@kernel.org>
To: John Stultz <jstultz@google.com>
Cc: Andrew Davis <afd@ti.com>, Jonathan Corbet <corbet@lwn.net>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-media@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: dma-buf: heaps: Add heap name
 definitions
Message-ID: <20241206-wealthy-hyrax-of-grandeur-ca3cba@houat>
References: <20241202115827.50388-1-mripard@kernel.org>
 <CANDhNCpTnc6=YkjQgQngRCw1_xLWgOFrcjTxrrGX+bRhvGb5DQ@mail.gmail.com>
 <20241203-cerulean-ringtail-of-speed-920c5f@houat>
 <f6412229-4606-41ad-8c05-7bbba2eb6e08@ti.com>
 <CANDhNCqtMUaO4Y_7UYGJebDEdN==vTAQRexuuek5SZt5rqd8sQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="w6x675unrzbjvp2x"
Content-Disposition: inline
In-Reply-To: <CANDhNCqtMUaO4Y_7UYGJebDEdN==vTAQRexuuek5SZt5rqd8sQ@mail.gmail.com>


--w6x675unrzbjvp2x
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] Documentation: dma-buf: heaps: Add heap name
 definitions
MIME-Version: 1.0

On Thu, Dec 05, 2024 at 03:17:57PM -0800, John Stultz wrote:
> On Tue, Dec 3, 2024 at 11:04=E2=80=AFAM Andrew Davis <afd@ti.com> wrote:
> > On 12/3/24 1:44 AM, Maxime Ripard wrote:
> > > On Mon, Dec 02, 2024 at 11:12:23AM -0800, John Stultz wrote:
> > >> Hrm. I'm not sure I see the value in enumerating things in this way,
> > >> it seems like it will be a nuisance to keep current?  Maybe something
> > >> like:
> > >>
> > >> On most systems the default cma region is named "linux, cma" or
> > >> "reserved", with a few exceptions:
> > >>      - Allwinner sun4i, sun5i and sun7i families: ``default-pool``
> > >
> > > I'm a bit worried about doing so. What if, on a "linux,cma" system, we
> > > have another "reserved" heap created with different semantics?
> > >
> >
> > Having the "default CMA" heap get its dev name based on the method that
> > created it was arguably a mistake made when first upstreaming this heap.
> > We should fix this, then maybe add the old name as a link just for
> > backwards compat as needed.
> >
> > exp_info.name =3D "default_cma";
> >
> > All other CMA and carveout heaps will have names based on their
> > method of creation as there may be multiple of them, but there
> > will only every be one "default CMA" area, and its heap should
> > be named to match.
>=20
> This seems reasonable to me. Maybe putting the link creation behind a
> compatibility config so they can be later deprecated?

That sounds reasonable to me too. However, I'm not sure how to create a
symlink in devtmpfs from the kernel. Or maybe we should create a second
device file with the same major / minor?

> That said, while I understand the impulse to want to fix the heap
> names so applications can depend on them, I also want to caution it's
> a little bit like trying to hard code eth0 as a network device name in
> your scripts.  There are too many potential configurations, and any
> fixed mapping is going to break in some cases.

I certainly don't want to spark *that* discussion again, but it's
exactly why I wasn't convinced about the names providing the guarantees
back in Plumbers. I definitely agree with you there that the situation
is kind of messy already, and it will only get worse.

It will be really hard to document, and if we can't document it,
userspace can't rely on guarantees either.

> I think there is just going to have to be some (gralloc-like)
> device-specific configuration glue to map a pipeline/use-case to the
> memory type (similar to fstab for filesystem to mount points) in order
> to handle every case.

That might work for Android, but it really doesn't for anything more
generic than that.

> So if I'm being a little squirrely on fixed names, it's mostly due to
> wanting to avoid anyone getting the mistaken impression that fixed
> mappings will generally work.

Ack :)
Maxime

--w6x675unrzbjvp2x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ1KosQAKCRAnX84Zoj2+
ds/mAYC5oull8D+NhsZeCjJbs/mJRi1Y1zq/Mnhb0orpy9wyHHtCo3KrcFCnkiaj
rUeJBjABgNA9DcsfGkKd8Qls0c/K42LeX5GkSBdFVlo30WUjrWr+u9Nt/JBW9oPk
4+etnwsr0g==
=NN+l
-----END PGP SIGNATURE-----

--w6x675unrzbjvp2x--

