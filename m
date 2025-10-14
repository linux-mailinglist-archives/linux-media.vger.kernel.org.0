Return-Path: <linux-media+bounces-44356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E0336BD8074
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 09:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7FE754F8D1D
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 07:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743AF30E852;
	Tue, 14 Oct 2025 07:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="G+rUOrf2"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF79830EF63
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 07:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760428526; cv=none; b=HKJv9SmUjP/9Vvqn8Crv2FdRVTqRs1n6m2Luny0PwWPcE+zgrSgRnRwqP03AHFTWilAYNQPjvmjlJFDALawD7lkQ38H8D9vyihXF41g5fZVj4eDpT0TS4KllRvbp/Sp2RQE9L14i/ea6F5c4sFf6RdbDkTFQptTu48pJNzd6xSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760428526; c=relaxed/simple;
	bh=OtiJwOIqfCfYzKQReRFQP0rfKbz++ZTcre+xQrh7ELE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=mJADOsbqNEDeNycvzxkK2yTYGaWkd9i8GZl1wCJ7fTjKcC6BeloYTjRUtdYaZNNw9DmMgHVnL50zucjdEM8exRYW6cnuVAKVox5JhpnRn0pS6M4BBsVrXf4cSmbtm1aXDkAZQmf2MG/GFtGIGsMZq63JWetUMTzYVwh0SqdBR1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=G+rUOrf2; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251014075523euoutp02e260b97b3e429f13c40bd4d7bffbb2b2~uTGokhggC2401924019euoutp02i
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 07:55:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251014075523euoutp02e260b97b3e429f13c40bd4d7bffbb2b2~uTGokhggC2401924019euoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760428523;
	bh=DjNnE0OoknK6AVx8/+2pbe/xE5HGwUdWMg8IvkZJLyo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=G+rUOrf2VbGmEo75oZTr8zkHDSf9qXNFiVP/3Geln7oDTNzZhKeAJ+8xTAeQk66wY
	 YnOFNQy8N4KGw2ezBJx23mxi++aZtbo1xA3NKbRYDiojplQAcf6JadRin7gyIOf0wN
	 zmcKlLsUmXtJTEmYJ6f5tGtRVxECHry28uYmwA14=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251014075522eucas1p1ee4792f47a967cac07e306140aa77ebd~uTGoAVtc01507915079eucas1p1h;
	Tue, 14 Oct 2025 07:55:22 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251014075521eusmtip15224e89e824cfe715eb663fc5921579f~uTGnLE7qI1606716067eusmtip1W;
	Tue, 14 Oct 2025 07:55:21 +0000 (GMT)
Message-ID: <a321abc5-fba3-45a5-a99a-73a542fc35c9@samsung.com>
Date: Tue, 14 Oct 2025 09:55:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v8 4/5] dma: contiguous: Reserve default CMA heap
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
In-Reply-To: <20251013-dma-buf-ecc-heap-v8-4-04ce150ea3d9@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251014075522eucas1p1ee4792f47a967cac07e306140aa77ebd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251013083535eucas1p2d80c3c6a03cdbdf79a67f983b2724bea
X-EPHeader: CA
X-CMS-RootMailID: 20251013083535eucas1p2d80c3c6a03cdbdf79a67f983b2724bea
References: <20251013-dma-buf-ecc-heap-v8-0-04ce150ea3d9@kernel.org>
	<CGME20251013083535eucas1p2d80c3c6a03cdbdf79a67f983b2724bea@eucas1p2.samsung.com>
	<20251013-dma-buf-ecc-heap-v8-4-04ce150ea3d9@kernel.org>

On 13.10.2025 10:35, Maxime Ripard wrote:
> The CMA code, in addition to the reserved-memory regions in the device
> tree, will also register a default CMA region if the device tree doesn't
> provide any, with its size and position coming from either the kernel
> command-line or configuration.
>
> Let's register that one for use to create a heap for it.
>
> Reviewed-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   kernel/dma/contiguous.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> index d67e95094749d45f43c1809c175e491a3f55b2e1..d8fd6f779f797f711b8e0fd628f868d644b8f784 100644
> --- a/kernel/dma/contiguous.c
> +++ b/kernel/dma/contiguous.c
> @@ -240,17 +240,23 @@ void __init dma_contiguous_reserve(phys_addr_t limit)
>   		selected_size = max(size_bytes, cma_early_percent_memory());
>   #endif
>   	}
>   
>   	if (selected_size && !dma_contiguous_default_area) {
> +		int ret;
> +
>   		pr_debug("%s: reserving %ld MiB for global area\n", __func__,
>   			 (unsigned long)selected_size / SZ_1M);
>   
>   		dma_contiguous_reserve_area(selected_size, selected_base,
>   					    selected_limit,
>   					    &dma_contiguous_default_area,
>   					    fixed);
> +
> +		ret = dma_heap_cma_register_heap(dma_contiguous_default_area);
> +		if (ret)
> +			pr_warn("Couldn't register default CMA heap.");
>   	}
>   }
>   
>   void __weak
>   dma_contiguous_early_fixup(phys_addr_t base, unsigned long size)
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


