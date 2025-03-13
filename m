Return-Path: <linux-media+bounces-28154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C922AA5FF0C
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 19:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 304573ADED8
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 18:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F8E1EF0B0;
	Thu, 13 Mar 2025 18:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckrwnbay"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379B5185E7F;
	Thu, 13 Mar 2025 18:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741889822; cv=none; b=LVNg8QsoxZaao6ueKC5kW7AvnLb9Mmdwpw2ju6pvMBglButCT+0fZCxu4FCFi+HFrc07hWKx3Jz9z3hWmjcG+wzEYxVmNxPI/emCU480oun+abd/6cQJacIHxaLrO8K31a0edeP/tNUIGfFuut9mriswCiLZGb0ps01djivYZEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741889822; c=relaxed/simple;
	bh=DXglPiNNV84Je9bZlfd3wkaek0EXUcsHteRC16eVmM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bCp1tnzwnRd0Npxh8VBKsooMiOJ0PJ3JilG4eP/KT/L/6eueX2wp9jHpIvlsTJEtCmn/hu3flcc/bzo53YoDBwz9ZjFMl3Idc0JkgLYeSRlskhTBaPBqx+LfG+3vjwk1ZhWKrqY21rnX5hveW+FJhXZ39YN9JGbs4Qiy30Z2dIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckrwnbay; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22BEAC4CEDD;
	Thu, 13 Mar 2025 18:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741889821;
	bh=DXglPiNNV84Je9bZlfd3wkaek0EXUcsHteRC16eVmM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ckrwnbayb5nxjjekbrpH+Bfn1tGnTSe5VjfyI3zlwSEo4IVMokY85CipHU+Xenac/
	 eOS2KApmgXHCoF8qJuZ7DPP3XdCjCOOTdllG7Y004ZUtI0Gm5LoF3dRYjujXvuq/tA
	 NJyestEaQryHvfOXiLJlY7vwfgOveJVdA0A6a8X67ekYjhsL72rXfLzm79jy0uq26D
	 0sr7oBrzKzBKVQ6/cRjYD6QIvQtdAll4UZSYLVMtrIhT3gcXmIgx4ODBgs8qQ9wozq
	 Cla7oizVWP8n3nihzMelgNDqxW/BDc1bINOQvhRzDjIIyZju4FuHWoiJmH3wRcxU1q
	 LVJIahEP6jzsg==
Date: Thu, 13 Mar 2025 19:16:58 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Tomasz Figa <tfiga@chromium.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH RFC 06/12] dma: direct: Provide accessor to dmem region
Message-ID: <20250313-wooden-violet-quokka-001ef5@houat>
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
 <20250310-dmem-cgroups-v1-6-2984c1bc9312@kernel.org>
 <2af9ea85-b31d-49c9-b574-38c33cc89cef@arm.com>
 <20250310-expert-piculet-of-fascination-3813cd@houat>
 <0b057c55-fe02-4c83-af69-37770dc83eb8@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ffb7rrvpjvoby4z6"
Content-Disposition: inline
In-Reply-To: <0b057c55-fe02-4c83-af69-37770dc83eb8@arm.com>


--ffb7rrvpjvoby4z6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC 06/12] dma: direct: Provide accessor to dmem region
MIME-Version: 1.0

On Mon, Mar 10, 2025 at 06:44:51PM +0000, Robin Murphy wrote:
> On 2025-03-10 4:28 pm, Maxime Ripard wrote:
> > On Mon, Mar 10, 2025 at 02:56:37PM +0000, Robin Murphy wrote:
> > > On 2025-03-10 12:06 pm, Maxime Ripard wrote:
> > > > Consumers of the direct DMA API will have to know which region their
> > > > device allocate from in order for them to charge the memory allocat=
ion
> > > > in the right one.
> > >=20
> > > This doesn't seem to make much sense - dma-direct is not an allocator
> > > itself, it just provides the high-level dma_alloc_attrs/dma_alloc_pag=
es/etc.
> > > interfaces wherein the underlying allocations _could_ come from CMA, =
but
> > > also a per-device coherent/restricted pool, or a global coherent/atom=
ic
> > > pool, or the regular page allocator, or in one weird corner case the =
SWIOTLB
> > > buffer, or...
> >=20
> > I guess it wasn't super clear, but what I meant is that it's an
> > allocator to the consumer: it gets called, and returns a buffer. How it
> > does so is transparent to the device, and on the other side of the
> > abstraction.
> >=20
> > I do agree that the logic is complicated to follow, and that's what I
> > was getting at in the cover letter.
>=20
> Right, but ultimately my point is that when we later end up with:
>=20
> struct dmem_cgroup_region *
> dma_get_dmem_cgroup_region(struct device *dev)
> {
> 	if (dma_alloc_direct(dev, get_dma_ops(dev)))
> 		return dma_direct_get_dmem_cgroup_region(dev);
>=20
> 		=3D dma_contiguous_get_dmem_cgroup_region(dev);
>=20
> it's objectively wrong given what dma_alloc_direct() means in context:
>=20
> void *dma_alloc_attrs(...)
> {
> 	if (dma_alloc_direct(dev, ops))
> 		cpu_addr =3D dma_direct_alloc(...);
>=20
> where dma_direct_alloc() may then use at least 5 different allocation
> methods, only one of which is CMA. Accounting things which are not CMA to
> CMA seems to thoroughly defeat the purpose of having such fine-grained
> accounting at all.
>=20
> This is why the very notion of "consumers of dma-direct" should
> fundamentally not be a thing IMO. Drivers consume the DMA API interfaces,
> and the DMA API ultimately consumes various memory allocators, but what
> happens in between is nobody else's business; dma-direct happens to
> represent *some* paths between the two, but there are plenty more paths to
> the same (and different) allocators through other DMA API implementations=
 as
> well. Which route a particular call takes to end up at a particular
> allocator is not meaningful unless you are the DMA ops dispatch code.
>=20
> Or to put it another way, to even go for the "dumbest possible correct
> solution", the plumbing of dma_get_dmem_cgroup_region() would need to be
> about as complex and widespread as the plumbing of dma_alloc_attrs() itse=
lf
> ;)

I largely agree with the sentiment, and I think the very idea of
dma_get_dmem_cgroup_region() is a bad one for that reason. But since I
wasn't too sure what a good one might look like, I figured it would be a
good way to start the discussion still :)

> I think I see why a simple DMA attribute couldn't be made to work, as
> dmem_cgroup_uncharge() can't simply look up the pool the same way
> dmem_cgroup_try_charge() found it, since we still need a cg for that and
> get_current_dmemcs() can't be assumed to be stable over time, right?
> At the point I'm probably starting to lean towards a whole new DMA op wit=
h a
> properly encapsulated return type (and maybe a long-term goal of
> consolidating the 3 or 4 different allocation type we already have)

It felt like a good solution to me too, and what I alluded to with
struct page or folio. My feeling was that the best way to do it would be
to encapsulate it into the structure returned by the dma_alloc_* API.
That's a pretty large rework though, so I wanted to make sure I was on
the right path before doing so.

> or just have a single dmem region for "DMA API memory" and don't care
> where it came from (although I do see the issues with that too - you
> probably wouldn't want to ration a device-private pool the same way as
> global system memory, for example)

Yeah, the CMA pool is probably something you want to limit differently
as well.

Maxime

--ffb7rrvpjvoby4z6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ9MhGQAKCRDj7w1vZxhR
xd9pAQCHcGvhv8bNn26UvuNcyqdmxp8TBRjnsTOXt3Y6nu+UiwD/c+NEwXwAONYX
R/jM767xucC1ylTWThh2/9kyYuWCpwM=
=byXD
-----END PGP SIGNATURE-----

--ffb7rrvpjvoby4z6--

