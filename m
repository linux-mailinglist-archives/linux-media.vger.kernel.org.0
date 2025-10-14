Return-Path: <linux-media+bounces-44355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0725DBD8056
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 09:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B2293B5201
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 07:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFE030F53D;
	Tue, 14 Oct 2025 07:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rFDo5Ulp"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B8A30F530
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 07:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760428490; cv=none; b=aB0tqzMA6a3WD9iMBmwWMbbE8n1dp7IdOMQxLu8phDWSlpvDF+iUaaw9tVyVCUdaVKJ2nlCgcmmkRIKD0Uw6Tlt1vfX2KLXYC89TUKAPjoQtx12rdSoigFjKOhvhx7ERJfeXxa2jNAsy9rph5DYxqPH+C3MIarYu1yoqdvFNfWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760428490; c=relaxed/simple;
	bh=A6hB3HLdAqtDatdxQYgb+hRffrI9rEk55/WhZQ7vUSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=A6KMQgx8zUqQ83PRCJNXSUqLhx+C+fqU6SFkufg7mjl3JQNGVq73pEvNR05/PE0HIdclW7UBiQA0TI52vHi1dcjRFzriPYOLSi03pfz8yRJESDXiRmfAeOVpJe3YQtWRfz9hsCCrhHat4uViUlMYYRnoY7tLgowKKrNrv9wcUUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rFDo5Ulp; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251014075440euoutp027eee13e67665dd4e81ac28e0844aa983~uTGAwsEW42404624046euoutp02i
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 07:54:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251014075440euoutp027eee13e67665dd4e81ac28e0844aa983~uTGAwsEW42404624046euoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760428480;
	bh=JOoWy2TOH/HfwMyNVGGIpIsyLOQO7Ec5UY2tpwzKToc=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=rFDo5Ulpk/N2rsM7tt353fcS/+GCTpW3dmbQIXB7/Qe+QTMFvkBPDPu3LBqQdNzEE
	 yQ9SOgut5u2/NEoLzVlCbP6bah80bMipVkR8lzdR2pwPQjAYMjbOB7Je2JgkMmAs48
	 Po3UyQyQuH9iAcw7cfFxOZKqAEuKpoybz4GdB68w=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251014075439eucas1p1a0347c3c70491684dd09a88171c5bdfe~uTGASgFS_1159211592eucas1p1b;
	Tue, 14 Oct 2025 07:54:39 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251014075438eusmtip1da3f2669673b5a70103143b6d02ac1a8~uTF-T-zpl1304013040eusmtip1V;
	Tue, 14 Oct 2025 07:54:38 +0000 (GMT)
Message-ID: <e549a9a3-6038-4a9a-aa2a-404fa8fad5c9@samsung.com>
Date: Tue, 14 Oct 2025 09:54:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v8 3/5] dma: contiguous: Register reusable CMA regions
 at boot
To: Maxime Ripard <mripard@kernel.org>, Sumit Semwal
	<sumit.semwal@linaro.org>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
	Jonathan Corbet <corbet@lwn.net>, =?UTF-8?Q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>, Robin Murphy <robin.murphy@arm.com>
Cc: Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, Mattijs
	Korpershoek <mkorpershoek@kernel.org>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20251013-dma-buf-ecc-heap-v8-3-04ce150ea3d9@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251014075439eucas1p1a0347c3c70491684dd09a88171c5bdfe
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251013083534eucas1p10ed51d5c1d836cb573d959a8c83a750a
X-EPHeader: CA
X-CMS-RootMailID: 20251013083534eucas1p10ed51d5c1d836cb573d959a8c83a750a
References: <20251013-dma-buf-ecc-heap-v8-0-04ce150ea3d9@kernel.org>
	<CGME20251013083534eucas1p10ed51d5c1d836cb573d959a8c83a750a@eucas1p1.samsung.com>
	<20251013-dma-buf-ecc-heap-v8-3-04ce150ea3d9@kernel.org>

On 13.10.2025 10:35, Maxime Ripard wrote:
> In order to create a CMA dma-buf heap instance for each CMA heap region
> in the system, we need to collect all of them during boot.
>
> They are created from two main sources: the reserved-memory regions in
> the device tree, and the default CMA region created from the
> configuration or command line parameters, if no default region is
> provided in the device tree.
>
> Let's collect all the device-tree defined CMA regions flagged as
> reusable.
>
> Reviewed-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   kernel/dma/contiguous.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> index d9b9dcba6ff7cf5904ac93b72c061fd59072c41b..d67e95094749d45f43c1809c175e491a3f55b2e1 100644
> --- a/kernel/dma/contiguous.c
> +++ b/kernel/dma/contiguous.c
> @@ -40,10 +40,11 @@
>   #include <asm/page.h>
>   
>   #include <linux/memblock.h>
>   #include <linux/err.h>
>   #include <linux/sizes.h>
> +#include <linux/dma-buf/heaps/cma.h>
>   #include <linux/dma-map-ops.h>
>   #include <linux/cma.h>
>   #include <linux/nospec.h>
>   
>   #ifdef CONFIG_CMA_SIZE_MBYTES
> @@ -491,9 +492,13 @@ static int __init rmem_cma_setup(struct reserved_mem *rmem)
>   	rmem->priv = cma;
>   
>   	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
>   		&rmem->base, (unsigned long)rmem->size / SZ_1M);
>   
> +	err = dma_heap_cma_register_heap(cma);
> +	if (err)
> +		pr_warn("Couldn't register CMA heap.");
> +
>   	return 0;
>   }
>   RESERVEDMEM_OF_DECLARE(cma, "shared-dma-pool", rmem_cma_setup);
>   #endif
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


