Return-Path: <linux-media+bounces-33460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25010AC4F32
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 15:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2F901887ECD
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 13:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC40F2701AE;
	Tue, 27 May 2025 13:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Si/NPXgd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446021F4CBB;
	Tue, 27 May 2025 13:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748351111; cv=none; b=tAA/eiw+PMTEAx8WE0+Lmqdj6jr2J0trZlPuzMlRD5+qVhdZFdH1fBYJl1LCEQUOaSBrhzKTo+IUf6hDKVXnTae3mdQxrDqUP7ofZKutlYOISX8ib32WZ42beq3AOvW6B1STnaF/W2Dui6sgmFwQinSyMCkQMRcZ4Kdb2xe5NTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748351111; c=relaxed/simple;
	bh=Ompy122E7fHKg2aBu7QUio5qAZ+AuN85g7YTBOJaKyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjq+HZSUxcayKa5Ek9rAaX1aaJr4dsNZV6Ao5JEI0QhZuZ1juveiV9RW5QLmRBLftBKqy45YAKkFnKvVW548cKYfqgCNWS2yOHzHbg3N6KEp9h29Y+t2lxcCXIm61PQGiok4mJW8hgyouTo+MR9cTLh2XV+aiFqJuAjfHGMNJlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Si/NPXgd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB640C4CEE9;
	Tue, 27 May 2025 13:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748351111;
	bh=Ompy122E7fHKg2aBu7QUio5qAZ+AuN85g7YTBOJaKyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Si/NPXgd83sNoeKHHt6o4b0SsEwFNoMY1gMTUuBC5hYiTLDcCbgFB8ndUekZgLMIN
	 GufD2uZnoWccEpfAvoIQ5W7US/1fV+tzdu39X8Wy4ZyXl5n3K/zUqztPlb1k1ZMk9a
	 YR+BnKcygGqQ8+0LSqyk34Cr1bPmyXzjTQFZ5qFNne1GsEd7EKcKe3oWwRekAgNluw
	 4HX17jP4ZSqJmT7uKOg5iWe1/WrKbCcx1w5RrxB5HjCsTqGzV/oPfhHfS1G8PtSACA
	 qLd4GhMHxK1j/3VN8peAyDplQSYF6ywMyPTmfQ6Z442X0+zNDBC/JkvSPeI2fWqLkk
	 b0jK0FaKigWvw==
Date: Tue, 27 May 2025 15:05:08 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jared Kangas <jkangas@redhat.com>
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
	Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
	christian.koenig@amd.com, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] dma-buf: heaps: Give default CMA heap a fixed name
Message-ID: <20250527-gainful-jaguar-of-honor-a72e15@houat>
References: <20250522191418.442390-1-jkangas@redhat.com>
 <20250522191418.442390-4-jkangas@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="r3bmleoevfwb3cbp"
Content-Disposition: inline
In-Reply-To: <20250522191418.442390-4-jkangas@redhat.com>


--r3bmleoevfwb3cbp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 3/3] dma-buf: heaps: Give default CMA heap a fixed name
MIME-Version: 1.0

Hi,

On Thu, May 22, 2025 at 12:14:18PM -0700, Jared Kangas wrote:
> The CMA heap's name in devtmpfs can vary depending on how the heap is
> defined. Its name defaults to "reserved", but if a CMA area is defined
> in the devicetree, the heap takes on the devicetree node's name, such as
> "default-pool" or "linux,cma". To simplify naming, unconditionally name
> it "default_cma_region", but keep a legacy node in place backed by the
> same underlying allocator for backwards compatibility.
>=20
> Signed-off-by: Jared Kangas <jkangas@redhat.com>
> ---
>  Documentation/userspace-api/dma-buf-heaps.rst |  7 +++++--
>  drivers/dma-buf/heaps/Kconfig                 | 10 ++++++++++
>  drivers/dma-buf/heaps/cma_heap.c              | 20 ++++++++++++++++++-
>  3 files changed, 34 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentatio=
n/userspace-api/dma-buf-heaps.rst
> index 23bd0bd7b0654..1dfe5e7acd5a3 100644
> --- a/Documentation/userspace-api/dma-buf-heaps.rst
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -21,5 +21,8 @@ following heaps:
>     usually created either through the kernel commandline through the
>     ``cma`` parameter, a memory region Device-Tree node with the
>     ``linux,cma-default`` property set, or through the ``CMA_SIZE_MBYTES`=
` or
> -   ``CMA_SIZE_PERCENTAGE`` Kconfig options. Depending on the platform, it
> -   might be called ``reserved``, ``linux,cma``, or ``default-pool``.
> +   ``CMA_SIZE_PERCENTAGE`` Kconfig options. The heap's name in devtmpfs =
is
> +   ``default_cma_region``. For backwards compatibility, when the
> +   ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option is set, a duplicate node is
> +   created following legacy naming conventions; the legacy name might be
> +   ``reserved``, ``linux,cma``, or ``default-pool``.
> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
> index a5eef06c42264..bb369b38b001a 100644
> --- a/drivers/dma-buf/heaps/Kconfig
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -12,3 +12,13 @@ config DMABUF_HEAPS_CMA
>  	  Choose this option to enable dma-buf CMA heap. This heap is backed
>  	  by the Contiguous Memory Allocator (CMA). If your system has these
>  	  regions, you should say Y here.
> +
> +config DMABUF_HEAPS_CMA_LEGACY
> +	bool "Legacy DMA-BUF CMA Heap"
> +	default y
> +	depends on DMABUF_HEAPS_CMA
> +	help
> +	  Add a duplicate CMA-backed dma-buf heap with legacy naming derived
> +	  from the CMA area's devicetree node, or "reserved" if the area is not
> +	  defined in the devicetree. This uses the same underlying allocator as
> +	  CONFIG_DMABUF_HEAPS_CMA.
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index e998d8ccd1dc6..dfeccafc6ae3c 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -9,6 +9,9 @@
>   * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
>   *	Andrew F. Davis <afd@ti.com>
>   */
> +
> +#define pr_fmt(fmt) "cma_heap: " fmt
> +
>  #include <linux/cma.h>
>  #include <linux/dma-buf.h>
>  #include <linux/dma-heap.h>
> @@ -22,6 +25,7 @@
>  #include <linux/slab.h>
>  #include <linux/vmalloc.h>
> =20
> +#define DEFAULT_CMA_NAME "default_cma_region"
> =20
>  struct cma_heap {
>  	struct dma_heap *heap;
> @@ -394,15 +398,29 @@ static int __init __add_cma_heap(struct cma *cma, c=
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
> +	if (IS_ENABLED(CONFIG_DMABUF_HEAPS_CMA_LEGACY)) {
> +		legacy_cma_name =3D cma_get_name(default_cma);
> +		if (!strcmp(legacy_cma_name, DEFAULT_CMA_NAME)) {
> +			pr_warn("legacy name and default name are the same, skipping legacy h=
eap\n");
> +			return 0;
> +		}
> +
> +		ret =3D __add_cma_heap(default_cma, legacy_cma_name);
> +		if (ret)
> +			pr_warn("failed to add legacy heap: %pe\n",
> +				ERR_PTR(-ret));

Are you sure about the -ret? ret should already be a negative number if it =
failed?

With that fixed,

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--r3bmleoevfwb3cbp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaDW4hAAKCRAnX84Zoj2+
drI1AYCje0uQohcShZdmczyCGhShy69dOYUIKlNGxe50CzVnAnj5Dj376Hc/uoWi
/BLvaSoBfA+MFBNwCyZaxzRtUi9UC6/G0Wqz4e2xpBB8vDFuKRyiSYThzz3yJMSA
erPg189vdQ==
=m8g+
-----END PGP SIGNATURE-----

--r3bmleoevfwb3cbp--

