Return-Path: <linux-media+bounces-30981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE47A9BF09
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 08:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F6771BA313B
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 06:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78BD022D7A0;
	Fri, 25 Apr 2025 06:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQ0zXSRz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D479B22CBC9;
	Fri, 25 Apr 2025 06:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564318; cv=none; b=oqCkO9/WqK5EFs4qju77WsnGHWySi3kf/CmiixWL8pHGtqaWdac4NQyahe7RlGl1564+8TVpkBVlKnewOatwgUZitQcmUdUBfUQBMqm7TuILaBxdIbtguytfl0LfRAr/XWMy/MbjYGS+J0fONjeAKxE7yBLN2XF2s78HRDfSXsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564318; c=relaxed/simple;
	bh=ZOCpgYtOjGRmmw6XMk4R1FQCrrG9Hy9EDJQTQ/uzv1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rvj2UV67TQzunU0qY4dJj50FyJ1mw7MGoVOIlVKVJmqwTfBdS9l+sbkMwwel1u7SyYmTpE+QqmZ/meZbnxXvHtNbU9FsMNcZAIf1T/kPhRGZSRECbHXt0RoBwawbfRECbbhLQBte4SfLHKIg/nJWhYEoTLtbG2zPvki2o6BX2NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQ0zXSRz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01378C4CEE4;
	Fri, 25 Apr 2025 06:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745564318;
	bh=ZOCpgYtOjGRmmw6XMk4R1FQCrrG9Hy9EDJQTQ/uzv1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BQ0zXSRzKxud5QbdoyrqDtmmA+RNeeCnTbdhp3plOJH1bqYru6wepkYH7g3u4FrBu
	 QWbjNm2+GGGCVnFapW4QqXrvd8Z0JPPGrBpdFVzgiP8B9YWP3VDsShnLifupD/MwCq
	 SU4fTv6M3dYOm5Xpm9GY5dqWTfxuYSmqCxuMxjSstmRW/c+bxBUh31ukcfHQo6pjN4
	 ilbmH9kgnsEnaD8HHw3lt03NWi5bFo8stud8771nTlNsgos6gDZWkwDobO1U7PSwZ8
	 YW1Ofia52UoRfh03McK2MyGe+xUcu63z4h4QxRYEUmcZAhZJG5GgJ6Tb194ytEZChi
	 zL9+0cSFPG7PA==
Date: Fri, 25 Apr 2025 08:58:35 +0200
From: Maxime Ripard <mripard@kernel.org>
To: John Stultz <jstultz@google.com>
Cc: Jared Kangas <jkangas@redhat.com>, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, tjmercier@google.com, 
	christian.koenig@amd.com, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
Message-ID: <20250425-savvy-chubby-alpaca-0196e3@houat>
References: <20250422191939.555963-1-jkangas@redhat.com>
 <20250422191939.555963-3-jkangas@redhat.com>
 <20250424-sassy-cunning-pillbug-ffde51@houat>
 <CANDhNCqfsUbN3aavAH5hi4wdcKuUkjLX4jqhKzy-q+jCEqpoow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="kzhh3umpacms7elx"
Content-Disposition: inline
In-Reply-To: <CANDhNCqfsUbN3aavAH5hi4wdcKuUkjLX4jqhKzy-q+jCEqpoow@mail.gmail.com>


--kzhh3umpacms7elx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
MIME-Version: 1.0

On Thu, Apr 24, 2025 at 05:13:47PM -0700, John Stultz wrote:
> On Thu, Apr 24, 2025 at 1:34=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> > On Tue, Apr 22, 2025 at 12:19:39PM -0700, Jared Kangas wrote:
> > > @@ -22,6 +22,7 @@
> > >  #include <linux/slab.h>
> > >  #include <linux/vmalloc.h>
> > >
> > > +#define DEFAULT_CMA_NAME "default_cma"
> >
> > I appreciate this is kind of bikeshed-color territory, but I think "cma"
> > would be a better option here. There's nothing "default" about it.
>=20
> I disagree.  It very much is "default" as it's returning the
> dma_contiguous_default_area.

My main concern here is that it's "default" as opposed to what, exactly?
We have a single CMA allocator. We could have multiple buffer
attributes, but then "cached_cma" would make more sense to me if we
expect to have uncached CMA allocations at some point.

> There can be multiple CMA areas, and out of tree, vendors do reserve
> separate areas for specific purposes, exposing multiple CMA dmabuf
> heaps.

By "CMA areas", I guess you mean carved-out memory regions? If so, how
is it relevant to userspace if we use CMA or any other implementation to
expose a carved-out region, and thus that we carry that implemenattion
detail in the name?

> There have been patches to expose multiple CMA heaps, but with no
> upstream drivers using those purpose specific regions, we haven't
> taken them yet.
> I do hope as the drivers that utilize these purpose focused heaps go
> upstream, we can add that logic, so I think being specific that this
> is default CMA is a good idea.

If heaps names are supposed to carry the region it exposes, then it
should be default_cma_region/area. If heap names are supposed to expose
the allocator (but I don't think it's a good idea), it should be cma. If
they are meant to carry all that plus some policy,
cached_default_cma_region should be used.

Either way, default_cma seems to me either too specific or not specific
enough. And we should really document what the policy for those heaps
are supposed to be.

Maxime

--kzhh3umpacms7elx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaAsylwAKCRAnX84Zoj2+
dgz1AYDE1OlrQrJ1tqUlxdkEo+pMUFfnZtUXx7wFnBgkSsShPzQ9Spy4piXMG+a0
iIcqHaUBf26WQQpK5w5lp83mz5dNKQ/Xis/4/MLYZk3MUlxMaD37yGN5yf/Nu9aZ
Y9wYQW2MAg==
=vwbA
-----END PGP SIGNATURE-----

--kzhh3umpacms7elx--

