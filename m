Return-Path: <linux-media+bounces-27955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F69A593FF
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 13:16:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 084C81655E1
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 12:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7566322579E;
	Mon, 10 Mar 2025 12:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N0IMrrYI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C893A1C5D5B;
	Mon, 10 Mar 2025 12:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741608957; cv=none; b=FVkpSN8B5mkOfxiRqH0D6K9LPkMtUAooyfa/zApEDtTHG4R+WH1n1NKo3j11Trmn78PjzmSd2UpkdKuce0sgrbmoowTF1CKsiDuRKlb10LNJjlcI4A88ndFYurP3k1jBFRGdzWythtovMy45S0ktjKs2eessyBqyx+U7vbi8JbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741608957; c=relaxed/simple;
	bh=KUnX5nhORWvOtCZHvFP20W21X3MBVPy20HvX7ysw3k8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPNgYALcsIdHbR8HDi5K0pqbcTFqlZYhpqKC7UMR1DYRedCsiZxIGayVtMaexlIV2TQFuKytCMzzXf+yB70gYff9oMZjYcGggMb8dGCsIvtT208pnnAkSiC78EwIVHZbabl+lUrMurzwZUPNtLaLGQZU9Wwm5fZcNIKjqcQH7ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N0IMrrYI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7FEC4CEE5;
	Mon, 10 Mar 2025 12:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741608957;
	bh=KUnX5nhORWvOtCZHvFP20W21X3MBVPy20HvX7ysw3k8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N0IMrrYIBu39uSjEkhRFYAdxzoyG002lgHph+TW+mMDW+6bhWEFRi/J0WyRYZTSgz
	 Bx56A/0mLXPy9N9br/OvR+ZZs6YhXlCTfAdKprucWWiYTSbdR21iPhbsbfyvDx10p1
	 J3Bwy2MhegMZke26K2MTuzJQxIEDMYvcu9oFhwkBocv7tuHzppQIfB0W8TyifDz1QB
	 BrYP2Ckz59F1p/bWPXXPbSGY4X38nrUPNXZ+knrmHLsWwxlgrc2YZl3QWEt2LoHvGW
	 yqC8c1KeMIz645bN1JtPwRVqyvH3op9kz0hUdLGcHpT25lWukDs6hjzF8n3CvYbbwA
	 0pmpStiii7PUg==
Date: Mon, 10 Mar 2025 13:15:54 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Tomasz Figa <tfiga@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH RFC 00/12] dma: Enable dmem cgroup tracking
Message-ID: <20250310-aromatic-gaur-of-growth-bd4071@houat>
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ppavg5bsjgk4kjoi"
Content-Disposition: inline
In-Reply-To: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>


--ppavg5bsjgk4kjoi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC 00/12] dma: Enable dmem cgroup tracking
MIME-Version: 1.0

On Mon, Mar 10, 2025 at 01:06:06PM +0100, Maxime Ripard wrote:
> Here's preliminary work to enable dmem tracking for heavy users of DMA
> allocations on behalf of userspace: v4l2, DRM, and dma-buf heaps.
>=20
> It's not really meant for inclusion at the moment, because I really
> don't like it that much, and would like to discuss solutions on how to
> make it nicer.
>=20
> In particular, the dma dmem region accessors don't feel that great to
> me. It duplicates the logic to select the proper accessor in
> dma_alloc_attrs(), and it looks fragile and potentially buggy to me.
>=20
> One solution I tried is to do the accounting in dma_alloc_attrs()
> directly, depending on a flag being set, similar to what __GFP_ACCOUNT
> is doing.
>=20
> It didn't work because dmem initialises a state pointer when charging an
> allocation to a region, and expects that state pointer to be passed back
> when uncharging. Since dma_alloc_attrs() returns a void pointer to the
> allocated buffer, we need to put that state into a higher-level
> structure, such as drm_gem_object, or dma_buf.
>=20
> Since we can't share the region selection logic, we need to get the
> region through some other mean. Another thing I consider was to return
> the region as part of the allocated buffer (through struct page or
> folio), but those are lost across the calls and dma_alloc_attrs() will
> only get a void pointer. So that's not doable without some heavy
> rework, if it's a good idea at all.

One thing I forgot to mention is that it makes it harder than it could
for subsystems that can allocate from multiple allocators (like... all
the ones included in this series at least).

I only added proper tracking in the backends using dma_alloc_attrs(),
but they also support vmalloc. In what region vmalloc allocations should
be tracked (if any) is an open-question to me. Similarly, some use
dma_alloc_noncontiguous().

Also, I've set the size of the "default" DMA allocation region to
U64_MAX, but that's obviously wrong and will break any relative metric.
I'm not sure what would be the correct size though.

Maxime

--ppavg5bsjgk4kjoi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ87X+QAKCRDj7w1vZxhR
xV0SAP9D+a9I6bgS5IRYuQrHA6k0Ra5d7uq+uPWbr3aJfwKx2QD/fe7P1A9AYvBB
2tIKFUcziC1uvL3qqtVJMp4dvAZf0w8=
=6LbE
-----END PGP SIGNATURE-----

--ppavg5bsjgk4kjoi--

