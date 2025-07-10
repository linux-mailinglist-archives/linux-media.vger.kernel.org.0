Return-Path: <linux-media+bounces-37261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 422A9AFFB38
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 09:44:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE9B01C82CCC
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 07:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D25828AAFC;
	Thu, 10 Jul 2025 07:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBtK6QCz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A232328B400;
	Thu, 10 Jul 2025 07:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752133489; cv=none; b=ROJD5j260LNsnY8DYdTrjv6dQkwz5NjMDBLSOgrb50Ih1vLUC8sq7MJnL/78ZAEKoYMD4KGmSgFKQ3m3NGCeKT3Lr/XdOeuwiP8A6Q45EfxRnkP9yNyEhKGnMEztRsu2I3Pz5SvRR6bVZPJ6Mtctaz/q6Cy1t6hWmHFo53SetIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752133489; c=relaxed/simple;
	bh=b3Rdbdf5MNwNMAtyitEKPxtTnss96mJKH9ynZvJLS8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uk9zwyhv2tfgTf/SQdvWF5dbbUpUk5B8yTNiq+NzhFQd6wdlGuG+Ye7YXJFc5A2O1F/G0zCYUaIBloLqMqxrTt1acWWaUPDMa+XEPV+mYbQUv35TAYAKQbMvV3ZeoDvQXB3/v0MJa31H4EPUZ3X6Dj25WfRXG4Z4tuxkGufGp2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBtK6QCz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10819C4CEE3;
	Thu, 10 Jul 2025 07:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752133489;
	bh=b3Rdbdf5MNwNMAtyitEKPxtTnss96mJKH9ynZvJLS8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZBtK6QCzjWH7FsS27j9XD+N0h2S++QDXv+gOAh9fbbGuLZKCgE6cMHt+pWvUjikG4
	 JoAa5A4gHENBPMVSvo6swTHfUMuSGR3qrpu1p7W5sdEKrzL9n6WXjKc6QUTi2QI8WB
	 A8uZJtm/ta5m1vxe2ePJGAQHKCpBcRsYC/lV8vRsIP12QJN8/Kb+jWFoUmH8pNZlfL
	 aYi4ii3Bc0akOBPclJR6SARhg9e45GoJPZDGxRyTil1LCBiEPiEk2NkYDhQhIAKySB
	 Y0+WhJ/0mVe52qQHC+gf36jU7UpiAPg8XpfVFzb8mwn+rO0hRmeCgSOezPYXhcj/bu
	 dk69Jm3CIKCjQ==
Date: Thu, 10 Jul 2025 09:44:47 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Andrew Davis <afd@ti.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Jared Kangas <jkangas@redhat.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Subject: Re: [PATCH v6 2/2] dma-buf: heaps: cma: Create CMA heap for each CMA
 reserved region
Message-ID: <20250710-daft-secret-squid-fb3eee@houat>
References: <20250709-dma-buf-ecc-heap-v6-0-dac9bf80f35d@kernel.org>
 <20250709-dma-buf-ecc-heap-v6-2-dac9bf80f35d@kernel.org>
 <6045bcfb-35ef-410b-bd7c-0ca7c5c589c4@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="2ftlwphj6gvo3egm"
Content-Disposition: inline
In-Reply-To: <6045bcfb-35ef-410b-bd7c-0ca7c5c589c4@ti.com>


--2ftlwphj6gvo3egm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/2] dma-buf: heaps: cma: Create CMA heap for each CMA
 reserved region
MIME-Version: 1.0

On Wed, Jul 09, 2025 at 11:14:37AM -0500, Andrew Davis wrote:
> On 7/9/25 7:44 AM, Maxime Ripard wrote:
> > Aside from the main CMA region, it can be useful to allow userspace to
> > allocate from the other CMA reserved regions.
> >=20
> > Indeed, those regions can have specific properties that can be useful to
> > a specific us-case.
> >=20
> > For example, one of them platform I've been with has ECC enabled on the
> > entire memory but for a specific region. Using that region to allocate
> > framebuffers can be particular beneficial because enabling the ECC has a
> > performance and memory footprint cost.
> >=20
> > Thus, exposing these regions as heaps user-space can allocate from and
> > import wherever needed allows to cover that use-case.
> >=20
> > For now, only shared-dma-pools regions with the reusable property (ie,
> > backed by CMA) are supported, but eventually we'll want to support other
> > DMA pools types.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >   drivers/dma-buf/heaps/cma_heap.c | 52 +++++++++++++++++++++++++++++++=
++++++++-
> >   1 file changed, 51 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/c=
ma_heap.c
> > index 0df007111975447d555714d61ead9699287fd65a..31a18683ee25788a800f3f8=
78fd958718a930ff7 100644
> > --- a/drivers/dma-buf/heaps/cma_heap.c
> > +++ b/drivers/dma-buf/heaps/cma_heap.c
> > @@ -19,10 +19,12 @@
> >   #include <linux/err.h>
> >   #include <linux/highmem.h>
> >   #include <linux/io.h>
> >   #include <linux/mm.h>
> >   #include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_reserved_mem.h>
> >   #include <linux/scatterlist.h>
> >   #include <linux/slab.h>
> >   #include <linux/vmalloc.h>
> >   #define DEFAULT_CMA_NAME "default_cma_region"
> > @@ -421,7 +423,55 @@ static int __init add_default_cma_heap(void)
> >   				ERR_PTR(ret));
> >   	}
> >   	return 0;
> >   }
> > -module_init(add_default_cma_heap);
> > +
> > +static int __init add_cma_heaps(void)
> > +{
> > +	struct device_node *rmem_node;
> > +	struct device_node *node;
> > +	int ret;
> > +
> > +	ret =3D add_default_cma_heap();
>=20
> Will this double add the default CMA region if it was declared
> using DT (reserved-memory) when all those nodes are again scanned
> through below? Might need a check in that loop for linux,cma-default.

Yeah, but we probably should anyway. Otherwise, if linux,cma-default
ever change on a platform, we would get heaps appearing/disappearing as
we reboot, which doesn't sound great from a regression perspective.

Both would allocate from the same pool though, so we don't risk stepping
into each others toes. Or am I missing something?

> > +	if (ret)
> > +		return ret;
> > +
> > +	rmem_node =3D of_find_node_by_path("/reserved-memory");
> > +	if (!rmem_node)
> > +		goto out;
>=20
> Can just return here, "out" path doesn't need to put a NULL node.

Oh, right. Thanks!
Maxime

--2ftlwphj6gvo3egm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaG9vbgAKCRAnX84Zoj2+
dhE7AX4qkBWa5ZWiID3zn8WXSc0q1AtFAPMK56gTj7jnaDHxnE1SSQcTUZlRCu9C
slsYIiEBfjo//pmNGOx7O0UkqHsO1eIaZGLtBbckuR5ZibGSaAiwWITXBzaZc85V
4qMLp8n/JA==
=Wof7
-----END PGP SIGNATURE-----

--2ftlwphj6gvo3egm--

