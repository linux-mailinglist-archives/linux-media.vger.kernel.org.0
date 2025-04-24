Return-Path: <linux-media+bounces-30907-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDE2A9A5F0
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 10:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B40F71B84BEF
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 08:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B535720E70A;
	Thu, 24 Apr 2025 08:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HtNciVMT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B5E20C000;
	Thu, 24 Apr 2025 08:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745483642; cv=none; b=HV2vohj2k8hIesEOngMO3X3hkEN5J87/dKVkch9i+yMT+ZUZnO0v9BcVtYgjrIP8D0l0FsWH6b10oc/Thjcf2lMIr9BG8AAgP/tzpAEvf/ldYxQQQ6WLAb3Nx1gucnGbROEKcHI8KaYVMxvHVlaNn3HJu7ZPBuZoohg2VfvJJKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745483642; c=relaxed/simple;
	bh=uWQHk37Gm0FmiSDmpihjGp+GK47gFOCM7m+SvUGFxYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJsGMu1ievcEFDJyQRi8iLphejZ4MK2NS7VB4IYvEby7622+mGFyJl4cbsfUyLbxA5LbY+ZLoWgA+pb2YrF5PbVFOCJ0YtJKQtZCHICR8jkdUZtzExPLjS6JxUHtCvqoZZoF/5K6VFaJBaix5iiwbHkWas7KZzk9xZWYC6lii+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HtNciVMT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C24C4CEE3;
	Thu, 24 Apr 2025 08:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745483641;
	bh=uWQHk37Gm0FmiSDmpihjGp+GK47gFOCM7m+SvUGFxYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HtNciVMTmjgT4B8/PtMCIrFeOeAv8ZZrPDZ6qdIaMi0x5sMj7WXGuBxAk82UHPyYj
	 0gjQ5IAAlFpE2mKpYt6LxFLJwnOrbokYyEepPL+eiccK2JgkSTQb++CLQeYQsxV9sr
	 hKITY/wLVZRhsbUUAPab+yevKkUqGZjbwT5U59oqgSf3o6CBALhUn3ay0Fa3NM/B4c
	 Gd1gCCiVKXFVUslVuKhc4bOH2L+7jNgr+S0JSs5ZnAYJILTJuxRj462kYtfc9IgCXK
	 qtrQGILa6X+u7cqwsgEyHTapHtNayLIB5fnoc5+q6w4NRXMqzLMu+NfHz+3cDog4lz
	 r6gszxbCJ+Jig==
Date: Thu, 24 Apr 2025 10:33:58 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jared Kangas <jkangas@redhat.com>
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
	Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
	christian.koenig@amd.com, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
Message-ID: <20250424-sassy-cunning-pillbug-ffde51@houat>
References: <20250422191939.555963-1-jkangas@redhat.com>
 <20250422191939.555963-3-jkangas@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3zbhpucpbyq3iuve"
Content-Disposition: inline
In-Reply-To: <20250422191939.555963-3-jkangas@redhat.com>


--3zbhpucpbyq3iuve
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
MIME-Version: 1.0

Hi Jared,

Thanks for working on this

On Tue, Apr 22, 2025 at 12:19:39PM -0700, Jared Kangas wrote:
> The CMA heap's name in devtmpfs can vary depending on how the heap is
> defined. Its name defaults to "reserved", but if a CMA area is defined
> in the devicetree, the heap takes on the devicetree node's name, such as
> "default-pool" or "linux,cma". To simplify naming, just name it
> "default_cma", and keep a legacy node in place backed by the same
> underlying structure for backwards compatibility.
>=20
> Signed-off-by: Jared Kangas <jkangas@redhat.com>
> ---
>  Documentation/userspace-api/dma-buf-heaps.rst | 11 +++++++----
>  drivers/dma-buf/heaps/Kconfig                 | 10 ++++++++++
>  drivers/dma-buf/heaps/cma_heap.c              | 14 +++++++++++++-
>  3 files changed, 30 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentatio=
n/userspace-api/dma-buf-heaps.rst
> index 535f49047ce64..577de813ba461 100644
> --- a/Documentation/userspace-api/dma-buf-heaps.rst
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -19,7 +19,10 @@ following heaps:
>   - The ``cma`` heap allocates physically contiguous, cacheable,
>     buffers. Only present if a CMA region is present. Such a region is
>     usually created either through the kernel commandline through the
> -   `cma` parameter, a memory region Device-Tree node with the
> -   `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
> -   `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
> -   might be called ``reserved``, ``linux,cma``, or ``default-pool``.
> +   ``cma`` parameter, a memory region Device-Tree node with the
> +   ``linux,cma-default`` property set, or through the ``CMA_SIZE_MBYTES`=
` or
> +   ``CMA_SIZE_PERCENTAGE`` Kconfig options. The heap's name in devtmpfs =
is
> +   ``default_cma``. For backwards compatibility, when the
> +   ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option is set, a duplicate node is
> +   created following legacy naming conventions; the legacy name might be
> +   ``reserved``, ``linux,cma``, or ``default-pool``.

It looks like, in addition to documenting the new naming, you also
changed all the backticks to double backticks. Why did you do so? It
seems mostly unrelated to that patch, so it would be better in a
separate patch.

> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
> index a5eef06c42264..83f3770fa820a 100644
> --- a/drivers/dma-buf/heaps/Kconfig
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -12,3 +12,13 @@ config DMABUF_HEAPS_CMA
>  	  Choose this option to enable dma-buf CMA heap. This heap is backed
>  	  by the Contiguous Memory Allocator (CMA). If your system has these
>  	  regions, you should say Y here.
> +
> +config DMABUF_HEAPS_CMA_LEGACY
> +	bool "DMA-BUF CMA Heap"
> +	default y
> +	depends on DMABUF_HEAPS_CMA
> +	help
> +	  Add a duplicate CMA-backed dma-buf heap with legacy naming derived
> +	  from the CMA area's devicetree node, or "reserved" if the area is not
> +	  defined in the devicetree. This uses the same underlying allocator as
> +	  CONFIG_DMABUF_HEAPS_CMA.
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index e998d8ccd1dc6..cd742c961190d 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -22,6 +22,7 @@
>  #include <linux/slab.h>
>  #include <linux/vmalloc.h>
> =20
> +#define DEFAULT_CMA_NAME "default_cma"

I appreciate this is kind of bikeshed-color territory, but I think "cma"
would be a better option here. There's nothing "default" about it.

>  struct cma_heap {
>  	struct dma_heap *heap;
> @@ -394,15 +395,26 @@ static int __init __add_cma_heap(struct cma *cma, c=
onst char *name)
>  static int __init add_default_cma_heap(void)
>  {
>  	struct cma *default_cma =3D dev_get_cma_area(NULL);
> +	const char *legacy_cma_name;
>  	int ret;
> =20
>  	if (!default_cma)
>  		return 0;
> =20
> -	ret =3D __add_cma_heap(default_cma, cma_get_name(default_cma));
> +	ret =3D __add_cma_heap(default_cma, DEFAULT_CMA_NAME);
>  	if (ret)
>  		return ret;
> =20
> +	legacy_cma_name =3D cma_get_name(default_cma);
> +
> +	if (IS_ENABLED(CONFIG_DMABUF_HEAPS_CMA_LEGACY) &&
> +	    strcmp(legacy_cma_name, DEFAULT_CMA_NAME)) {
> +		ret =3D __add_cma_heap(default_cma, legacy_cma_name);
> +		if (ret)
> +			pr_warn("cma_heap: failed to add legacy heap: %pe\n",
> +				ERR_PTR(-ret));
> +	}
> +

It would also simplify this part, since you would always create the legacy =
heap.

Maxime

--3zbhpucpbyq3iuve
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCaAn3dgAKCRDj7w1vZxhR
xSkFAQCWlqlBVC/iWXqYmsCJiH2d6ZyfL7bDqLNVAy3qLDpGaQD/XbhUUVuw0tmo
M25rRzYXESlsYYFGR3AX9ynWoYBiaw0=
=7Vsm
-----END PGP SIGNATURE-----

--3zbhpucpbyq3iuve--

