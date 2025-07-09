Return-Path: <linux-media+bounces-37216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A3DAFEEC5
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 18:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78D3D5A4381
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 16:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0053204C0C;
	Wed,  9 Jul 2025 16:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="M0zqQns2"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B5723BF9E;
	Wed,  9 Jul 2025 16:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077707; cv=none; b=t+PAouwSNPppvPArHaCdiD8TdTufY8jUmVevtiohZHhJWdWxdMXZYUJowsi77iDZKFz7Z+HLkXshcV69AbWzjzrCgDQG27fj/2h7YZwBwKDbn0sorwYe6ixAPGQU2MNeabXR0TN1NPfDZ9pQVsPRNQdfr84Wq1kQgTOZmILWTNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077707; c=relaxed/simple;
	bh=q5MJlvVs0BYsHH8IXQqVqnQryijutImO2s+0pCrIfBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oYZRTKS+VQ/v5Hbcz+XMxc6Ft0+CY5zzjL45cWMtEbx31niebidW/ErJVbVLJ42CrAYTPYtoNNjEGJRp9LH6BuC3MIFK/9hyStQsDcWS8rtca8h8cayzjObxHPlXSSDZV6/TNlUCWovY1eaUsYmsA1eCLf6UU4zNi1vasQNCpf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=M0zqQns2; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 569GEc6i866973;
	Wed, 9 Jul 2025 11:14:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752077678;
	bh=qkPRxiZdgjK9MgB5IvFZmTDsVI/VU2ccmWoC4LVxJFE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=M0zqQns2DKphNA2swG9UqaIo7IoYKntrIGmkvc2iUARrXbP6sSF4SVaPLcI6bmHpq
	 KQsoW6yYS/2xRJ0gCdSyZGMiLyN9HyBChbctipR+tWT94oOGuy+5NBm2z/fqSS+TKY
	 lMC9jwXI/mEzWLNQRq8SzR9Ftci4vfIMKVhatzV0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 569GEcTr296137
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 9 Jul 2025 11:14:38 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 9
 Jul 2025 11:14:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 9 Jul 2025 11:14:37 -0500
Received: from [10.250.35.60] ([10.250.35.60])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 569GEbe1052300;
	Wed, 9 Jul 2025 11:14:37 -0500
Message-ID: <6045bcfb-35ef-410b-bd7c-0ca7c5c589c4@ti.com>
Date: Wed, 9 Jul 2025 11:14:37 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] dma-buf: heaps: cma: Create CMA heap for each CMA
 reserved region
To: Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        Benjamin Gaignard
	<benjamin.gaignard@collabora.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <jstultz@google.com>,
        "T.J. Mercier" <tjmercier@google.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marek
 Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>
CC: Jared Kangas <jkangas@redhat.com>,
        Mattijs Korpershoek
	<mkorpershoek@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <iommu@lists.linux.dev>
References: <20250709-dma-buf-ecc-heap-v6-0-dac9bf80f35d@kernel.org>
 <20250709-dma-buf-ecc-heap-v6-2-dac9bf80f35d@kernel.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250709-dma-buf-ecc-heap-v6-2-dac9bf80f35d@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 7/9/25 7:44 AM, Maxime Ripard wrote:
> Aside from the main CMA region, it can be useful to allow userspace to
> allocate from the other CMA reserved regions.
> 
> Indeed, those regions can have specific properties that can be useful to
> a specific us-case.
> 
> For example, one of them platform I've been with has ECC enabled on the
> entire memory but for a specific region. Using that region to allocate
> framebuffers can be particular beneficial because enabling the ECC has a
> performance and memory footprint cost.
> 
> Thus, exposing these regions as heaps user-space can allocate from and
> import wherever needed allows to cover that use-case.
> 
> For now, only shared-dma-pools regions with the reusable property (ie,
> backed by CMA) are supported, but eventually we'll want to support other
> DMA pools types.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>   drivers/dma-buf/heaps/cma_heap.c | 52 +++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> index 0df007111975447d555714d61ead9699287fd65a..31a18683ee25788a800f3f878fd958718a930ff7 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -19,10 +19,12 @@
>   #include <linux/err.h>
>   #include <linux/highmem.h>
>   #include <linux/io.h>
>   #include <linux/mm.h>
>   #include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_reserved_mem.h>
>   #include <linux/scatterlist.h>
>   #include <linux/slab.h>
>   #include <linux/vmalloc.h>
>   
>   #define DEFAULT_CMA_NAME "default_cma_region"
> @@ -421,7 +423,55 @@ static int __init add_default_cma_heap(void)
>   				ERR_PTR(ret));
>   	}
>   
>   	return 0;
>   }
> -module_init(add_default_cma_heap);
> +
> +static int __init add_cma_heaps(void)
> +{
> +	struct device_node *rmem_node;
> +	struct device_node *node;
> +	int ret;
> +
> +	ret = add_default_cma_heap();

Will this double add the default CMA region if it was declared
using DT (reserved-memory) when all those nodes are again scanned
through below? Might need a check in that loop for linux,cma-default.

> +	if (ret)
> +		return ret;
> +
> +	rmem_node = of_find_node_by_path("/reserved-memory");
> +	if (!rmem_node)
> +		goto out;

Can just return here, "out" path doesn't need to put a NULL node.

Andrew

> +
> +	for_each_child_of_node(rmem_node, node) {
> +		struct reserved_mem *rmem;
> +		struct cma *cma;
> +
> +		rmem = of_reserved_mem_lookup(node);
> +		if (!rmem) {
> +			ret = -EINVAL;
> +			goto err_put_node;
> +		}
> +
> +		if (!of_reserved_mem_is_contiguous(rmem))
> +			continue;
> +
> +		cma = rmem->priv;
> +		if (!cma) {
> +			ret = -EINVAL;
> +			goto err_put_node;
> +		}
> +
> +		ret = __add_cma_heap(cma, of_node_full_name(node));
> +		if (ret)
> +			goto err_put_node;
> +	}
> +
> +out:
> +	of_node_put(rmem_node);
> +	return 0;
> +
> +err_put_node:
> +	of_node_put(rmem_node);
> +	return ret;
> +}
> +
> +module_init(add_cma_heaps);
>   MODULE_DESCRIPTION("DMA-BUF CMA Heap");
> 

