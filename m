Return-Path: <linux-media+bounces-57733-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEmrGth8y2lPIQYAu9opvQ
	(envelope-from <linux-media+bounces-57733-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:50:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC553657E3
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E885D304CEF9
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 07:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CDA53CEBA9;
	Tue, 31 Mar 2026 07:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rs5Vpcy5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674E33CAE83;
	Tue, 31 Mar 2026 07:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774942846; cv=none; b=JeAjdZdKfCPm0AUw+VfKcGIL34vCplG7MetzMO2jfGciX57h/JZT0NSYO+lZN1K58sNBE/8N+7rFYby/9uzkCpPFtss+xSpU54nFEuRgDb5FDPnXsjwQW3Jac8PMZTyKxz0flAte5Cx1C3G6LX4wkeFhJ1YGvKTF9vG8dZGhubo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774942846; c=relaxed/simple;
	bh=WfNIlN+YWXq+c3+ums6HBPz4V6uK2YIWBCQNTjTM5hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCYUcIyACeWaJXFNP9Il4mp+2+UpHaZq5N3WSj0eQP0XvV0TfZbVdtRJnRglaK2RdvrLDCl1t0elkGjLc3iCDX9KWgN2sXdOnjIxx2EOnYYi4VYgLpHq22GuawZbVEOTcbo1rqTs5SGcG5oShOPZIS8dJr+rYrnISkCJ7iv1sjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rs5Vpcy5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56BF8C19423;
	Tue, 31 Mar 2026 07:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774942845;
	bh=WfNIlN+YWXq+c3+ums6HBPz4V6uK2YIWBCQNTjTM5hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rs5Vpcy5pcfHOE9A+KXyG8zgxaFKfO14AkzL8qri2il77QqmbXPjVdJe2E6Lq/wLm
	 XyRXBds7lZRpM5IpkJl/IPXzKeFs1hIKgkOeGekcVK8YHodie2TzYRBTYf13LgzYLt
	 AWGf4LYfanZtqa9aM7SDkUFe3T7OxsjTGQMosB2hiQDl6hYHjxIusBsWuW0scn2f5n
	 PilzkO6wkuONcP8Pgbw3CxYU2ZuVkOZLSVxxK9voyYvblGSSEhE3jh0sczag1iBhPW
	 UuhjNNhptW8oOjWbV2gWTXxVm+TYpLnXg948mLw972EHSB9sCA7MbPFrYGIuHz8myY
	 sluOS9Ua9+u6g==
Date: Tue, 31 Mar 2026 09:40:42 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Robin Murphy <robin.murphy@arm.com>, 
	Albert Esteve <aesteve@redhat.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, 
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] dma/contiguous: Fix broken build
Message-ID: <20260331-kind-therapeutic-buzzard-8fc55e@houat>
References: <CGME20260330154021eucas1p1ddf347acd21646c96fda4b266ddfc03b@eucas1p1.samsung.com>
 <20260330-dma-build-fix-v2-1-26d844575815@kernel.org>
 <a097600b-0860-495f-b918-adef327bdaec@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="vfivc7udtfzcg6f5"
Content-Disposition: inline
In-Reply-To: <a097600b-0860-495f-b918-adef327bdaec@samsung.com>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57733-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6AC553657E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--vfivc7udtfzcg6f5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] dma/contiguous: Fix broken build
MIME-Version: 1.0

Hi Marek,

On Mon, Mar 30, 2026 at 07:49:26PM +0200, Marek Szyprowski wrote:
> On 30.03.2026 17:40, Maxime Ripard wrote:
> > Commit 3a236f6a5cf2 ("dma: contiguous: Turn heap registration logic
> > around") didn't remove one last call to dma_heap_cma_register_heap()
> > that it removed, thus breaking the build.
> >
> > That last call is in dma_contiguous_reserve(), to handle the
> > registration of the default CMA region heap instance.
> >
> > The default CMA region instance is already somewhat handled by
> > retrieving it through the dev_get_cma_area() call in the CMA heap
> > driver. However, since commit 854acbe75ff4 ("dma-buf: heaps: Give
> > default CMA heap a fixed name"), we will create two heap instances for
> > the CMA default region.
> >
> > The first one is always called "default_cma_region", and is the one
> > handled by the call to dev_get_cma_area() mentioned earlier. The second
> > one is the name it used to have prior to that last commit for backward
> > compatibility.
> >
> > In the case where the default CMA region is defined in the DT, then that
> > region is registered through rmem_cma_setup() and that region is added
> > to the list of CMA regions to create a CMA heap instance for.
> >
> > In the case where the default CMA region is not defined in the DT
> > though used to be the case covered by the now removed
> > dma_heap_cma_register_heap() in dma_contiguous_reserve(). If we only
> > remove the call to dma_heap_cma_register_heap(), then the legacy name of
> > the CMA heap will not be registered anymore. We thus need to replace
> > that call with a call to rmem_cma_insert_area() to make sure we queue
> > this instance, if created, to create a heap instance.
> >
> > Once that call to dma_heap_cma_register_heap() replaced, we can also
> > remove the now unused function definition, its now empty header, and all
> > includes of this header.
> >
> > Fixes: 3a236f6a5cf2 ("dma: contiguous: Turn heap registration logic aro=
und")
> > Reported-by: Mark Brown <broonie@kernel.org>
> > Closes: https://lore.kernel.org/linux-next/acbjaDJ1a-YQC64d@sirena.co.u=
k/
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> > Changes in v2:
> > - Fix creation of the CMA heap instance with the legacy name when not
> >   declared in the DT.=20
> > - Link to v1: https://lore.kernel.org/r/20260330-dma-build-fix-v1-1-748=
b64f0d8af@kernel.org
> > ---
> >  drivers/dma-buf/heaps/cma_heap.c  |  1 -
> >  include/linux/dma-buf/heaps/cma.h | 16 ----------------
> >  kernel/dma/contiguous.c           | 14 +++++++++++---
> >  3 files changed, 11 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/c=
ma_heap.c
> > index 7216a14262b04bb6130ddf26b7d009f7d15b03fd..9a8b36bc929f6daa483a013=
9a2919d95127e0d23 100644
> > --- a/drivers/dma-buf/heaps/cma_heap.c
> > +++ b/drivers/dma-buf/heaps/cma_heap.c
> > @@ -12,11 +12,10 @@
> > =20
> >  #define pr_fmt(fmt) "cma_heap: " fmt
> > =20
> >  #include <linux/cma.h>
> >  #include <linux/dma-buf.h>
> > -#include <linux/dma-buf/heaps/cma.h>
> >  #include <linux/dma-heap.h>
> >  #include <linux/dma-map-ops.h>
> >  #include <linux/err.h>
> >  #include <linux/highmem.h>
> >  #include <linux/io.h>
> > diff --git a/include/linux/dma-buf/heaps/cma.h b/include/linux/dma-buf/=
heaps/cma.h
> > deleted file mode 100644
> > index e751479e21e703e24a5f799b4a7fc8bd0df3c1c4..00000000000000000000000=
00000000000000000
> > --- a/include/linux/dma-buf/heaps/cma.h
> > +++ /dev/null
> > @@ -1,16 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0 */
> > -#ifndef DMA_BUF_HEAP_CMA_H_
> > -#define DMA_BUF_HEAP_CMA_H_
> > -
> > -struct cma;
> > -
> > -#ifdef CONFIG_DMABUF_HEAPS_CMA
> > -int dma_heap_cma_register_heap(struct cma *cma);
> > -#else
> > -static inline int dma_heap_cma_register_heap(struct cma *cma)
> > -{
> > -	return 0;
> > -}
> > -#endif // CONFIG_DMABUF_HEAPS_CMA
> > -
> > -#endif // DMA_BUF_HEAP_CMA_H_
> > diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> > index ad50512d71d3088a73e4b1ac02d6e6122374888e..d5d15983060c5c54744d6a6=
3f2b591e1a3455b86 100644
> > --- a/kernel/dma/contiguous.c
> > +++ b/kernel/dma/contiguous.c
> > @@ -40,11 +40,10 @@
> >  #include <asm/page.h>
> > =20
> >  #include <linux/memblock.h>
> >  #include <linux/err.h>
> >  #include <linux/sizes.h>
> > -#include <linux/dma-buf/heaps/cma.h>
> >  #include <linux/dma-map-ops.h>
> >  #include <linux/cma.h>
> >  #include <linux/nospec.h>
> > =20
> >  #ifdef CONFIG_CMA_SIZE_MBYTES
> > @@ -217,10 +216,19 @@ static void __init dma_numa_cma_reserve(void)
> >  static inline void __init dma_numa_cma_reserve(void)
> >  {
> >  }
> >  #endif
> > =20
> > +#ifdef CONFIG_OF_RESERVED_MEM
> > +static int rmem_cma_insert_area(struct cma *cma);
> > +#else
> > +static inline int rmem_cma_insert_area(struct cma *cma)
> > +{
> > +	return 0;
> > +}
> > +#endif
> > +
> >  /**
> >   * dma_contiguous_reserve() - reserve area(s) for contiguous memory ha=
ndling
> >   * @limit: End address of the reserved memory (optional, 0 for any).
> >   *
> >   * This function reserves memory from early allocator. It should be
> > @@ -271,13 +279,13 @@ void __init dma_contiguous_reserve(phys_addr_t li=
mit)
> >  						  &dma_contiguous_default_area,
> >  						  fixed);
> >  		if (ret)
> >  			return;
> > =20
> > -		ret =3D dma_heap_cma_register_heap(dma_contiguous_default_area);
> > +		ret =3D rmem_cma_insert_area(dma_contiguous_default_area);
> >  		if (ret)
> > -			pr_warn("Couldn't register default CMA heap.");
> > +			pr_warn("Couldn't queue default CMA region for heap creation.");
> >  	}
> >  }
> > =20
> >  void __weak
> >  dma_contiguous_early_fixup(phys_addr_t base, unsigned long size)
> >
> > ---
>=20
> Huh, this is still not the correct fix to restore the old behavior.
> When !CONFIG_OF_RESERVED_MEM the default cma area should be still
> registered as the default cma dma-buf heap.

You're right, but it feels that it's a fundamental flaw in the original
patch rather than a quick fix for the build now. Can you drop the
patches you applied entirely? If so, I'll send a new version of that
series.

Maxime

--vfivc7udtfzcg6f5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCact6dgAKCRAnX84Zoj2+
dkK2AX0T71T9W5H9rKycxqlZXiCIF0NEd806PwYEHIE/zOkXO6hIGltmDtf4qdac
ytoY5BwBgMAFkT+z6VfjqmnqMRHx4EOhYUO6b5q3ilMX/TG+byYvn1YL7bp0KDwM
S+/ujnBT0g==
=U/Fp
-----END PGP SIGNATURE-----

--vfivc7udtfzcg6f5--

