Return-Path: <linux-media+bounces-42155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F375BB50F83
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 09:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08DE73AD205
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 07:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D0230BBBB;
	Wed, 10 Sep 2025 07:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qaweH+z8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34001E5219;
	Wed, 10 Sep 2025 07:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757489629; cv=none; b=FABDb6HuMJeDZvBOvhzjWHoIBvNmRdJBaRlu7qBSIKYTxtTVtNgO8qfYmBFWEp5AzheyGFtCzOwfnIdu0h8mFEAUjSh2XOKGlTO1tls7SVvmQq7t9cVTH6nf9TeoDhvPOv0eVOCtf4t+FipGuE5opkgmkKXDm6CN6TRhvwVqxlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757489629; c=relaxed/simple;
	bh=/XnpTWNk/kv+NQgAdTS1A1Ab76RuactuTcyAflw/L7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ao2FaGswLqsDr1A8ZnOZlTQxQtMQgde0Ba+gkapSTeEksQHoxHvAVG0GwRCb8bZJxBg5NzqwtyXHeCbu3UMG/5ET60hqQFdI8/67i/UQ5VZyNmFaeCUTT2+gDu2nTlW+jh8OhKJkIPR9jiUdaPIg/QVyod+3Pgr48zSMTWo/Akg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qaweH+z8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB517C4CEF0;
	Wed, 10 Sep 2025 07:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757489628;
	bh=/XnpTWNk/kv+NQgAdTS1A1Ab76RuactuTcyAflw/L7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qaweH+z8BxmkKE1ouYJdFNhlYQj7OSwPR6vei84660qDGY3b2ayba8Xa4NjRhRKqQ
	 epTHEwqDw7OOhz42xo6a3A9e4uehd2Gr9neNldgZ9djYFdeMgDg6V+foFy5QOBv1Uz
	 i5lSzewoRPlG06mEm7cYk9DdBcniCZXb3KefyLLOO0rU0dNm8ZAzQghWHi8bEbRCZZ
	 itXMl6OPuDhFdNfzXYphQv+ZxGx9804vA4czk6CZ+ZJKTCTXrw2LrYXR+A50evfJXv
	 0Dz0F9RPM0QrdZrLUO7hYRN5OtTtEbg/6vJXWYoBn7vmo0i1GvF7n0DyV82UuAVK0n
	 lJ87BRzJ4JaEg==
Date: Wed, 10 Sep 2025 09:33:45 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, 
	Mattijs Korpershoek <mkorpershoek@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 0/5] dma-buf: heaps: Create a CMA heap for each CMA
 reserved region
Message-ID: <20250910-vigorous-attractive-gorilla-af6fec@houat>
References: <20250721-dma-buf-ecc-heap-v7-0-031836e1a942@kernel.org>
 <20250826-vagabond-catfish-of-courtesy-cbfa76@houat>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="nkmy2zjqcls5g6m2"
Content-Disposition: inline
In-Reply-To: <20250826-vagabond-catfish-of-courtesy-cbfa76@houat>


--nkmy2zjqcls5g6m2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 0/5] dma-buf: heaps: Create a CMA heap for each CMA
 reserved region
MIME-Version: 1.0

On Tue, Aug 26, 2025 at 09:36:03AM +0200, Maxime Ripard wrote:
> Hi,
>=20
> On Mon, Jul 21, 2025 at 01:17:29PM +0200, Maxime Ripard wrote:
> > Here's another attempt at supporting user-space allocations from a
> > specific carved-out reserved memory region.
> >=20
> > The initial problem we were discussing was that I'm currently working on
> > a platform which has a memory layout with ECC enabled. However, enabling
> > the ECC has a number of drawbacks on that platform: lower performance,
> > increased memory usage, etc. So for things like framebuffers, the
> > trade-off isn't great and thus there's a memory region with ECC disabled
> > to allocate from for such use cases.
> >=20
> > After a suggestion from John, I chose to first start using heap
> > allocations flags to allow for userspace to ask for a particular ECC
> > setup. This is then backed by a new heap type that runs from reserved
> > memory chunks flagged as such, and the existing DT properties to specify
> > the ECC properties.
> >=20
> > After further discussion, it was considered that flags were not the
> > right solution, and relying on the names of the heaps would be enough to
> > let userspace know the kind of buffer it deals with.
> >=20
> > Thus, even though the uAPI part of it had been dropped in this second
> > version, we still needed a driver to create heaps out of carved-out mem=
ory
> > regions. In addition to the original usecase, a similar driver can be
> > found in BSPs from most vendors, so I believe it would be a useful
> > addition to the kernel.
> >=20
> > Some extra discussion with Rob Herring [1] came to the conclusion that
> > some specific compatible for this is not great either, and as such an
> > new driver probably isn't called for either.
> >=20
> > Some other discussions we had with John [2] also dropped some hints that
> > multiple CMA heaps might be a good idea, and some vendors seem to do
> > that too.
> >=20
> > So here's another attempt that doesn't affect the device tree at all and
> > will just create a heap for every CMA reserved memory region.
> >=20
> > It also falls nicely into the current plan we have to support cgroups in
> > DRM/KMS and v4l2, which is an additional benefit.
> >=20
> > Let me know what you think,
> > Maxime
>=20
> Any chance we can get this merged?

Guys, can we move forward on this?

Maxime

--nkmy2zjqcls5g6m2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMEp2QAKCRAnX84Zoj2+
dsg7AXsGZJPtUsHUnHvNADap4iyMsh/caF3U64tQkHWWAcnVwP1ptV6A6FmBCXx9
Lw0xiv8BgKYytEtc6THWvRv6a29zx8LVSv9EuNTYDZshPTgSqETUzAx4CVEAAA/O
//tQ1dcNeA==
=tTl0
-----END PGP SIGNATURE-----

--nkmy2zjqcls5g6m2--

