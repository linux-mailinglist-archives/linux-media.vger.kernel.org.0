Return-Path: <linux-media+bounces-37322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5315B00590
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 16:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 368874E2D99
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 14:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5EC2741D3;
	Thu, 10 Jul 2025 14:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pt0eVK7j"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEA32741A4;
	Thu, 10 Jul 2025 14:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752158840; cv=none; b=bM1DOVLX482CvT9fIfumQPZDWg7q8MvADiqVRkQGOZ4qXKaKMAlGVTf+zLC7pbgkJdC/bNpOcCVGcdabO8kfpvqb7RXDc/eYJ9Cbnc7U3zceAzvZHmVdsxQmUf9mCPd10YcauTyR0er566DJEA6503BOi7cFlFhlumZrSEJFNqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752158840; c=relaxed/simple;
	bh=+NET5jq87laiRAOdk2v/YwNceTh/l0Yy9qlZAWfZAKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kzo6w23e/Vj9XhU+IO1aQW8+30VIDpeZu71gpQingdPcrl7IPzPRT9FPC4kzweNB8qUBlSibhHvgEcVxlRuh0dC7ejKu3blKmKowboXC2knMoGdIp6nIZMz0OZxWTkj3xMRM8zE+iBUj7Z6h0pdqoEc+c+iy4HyCphlP3eAe4KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pt0eVK7j; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56AEkxnm1801024;
	Thu, 10 Jul 2025 09:46:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752158819;
	bh=HI9GscUSSD2fE2PIITCexfukxvNp3vwU713gPPdAZCI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=pt0eVK7jLT+Yr6G90U0s0FMHe4FRhPJGTpeVOb+/scwsPmOw1UvwS9aSrNhSBMF0G
	 FuyyETEKkaRasY+YAzfdoU40kOdfWipu8im+QBeFuxd7ylusBOw4Mx+0CIJzE+wvG7
	 qlTrvYIo9nrfn2q2k7UkXwunELGPwjjHbr80Iw60=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56AEkwaI3599200
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 10 Jul 2025 09:46:58 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 10
 Jul 2025 09:46:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 10 Jul 2025 09:46:57 -0500
Received: from [10.250.35.60] ([10.250.35.60])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56AEku9q1528476;
	Thu, 10 Jul 2025 09:46:57 -0500
Message-ID: <547da8d7-1967-4c56-8bc1-da22a5283b77@ti.com>
Date: Thu, 10 Jul 2025 09:46:56 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] dma-buf: heaps: cma: Create CMA heap for each CMA
 reserved region
To: Maxime Ripard <mripard@kernel.org>
CC: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
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
        Robin Murphy <robin.murphy@arm.com>, Jared Kangas <jkangas@redhat.com>,
        Mattijs Korpershoek
	<mkorpershoek@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <iommu@lists.linux.dev>
References: <20250709-dma-buf-ecc-heap-v6-0-dac9bf80f35d@kernel.org>
 <20250709-dma-buf-ecc-heap-v6-2-dac9bf80f35d@kernel.org>
 <6045bcfb-35ef-410b-bd7c-0ca7c5c589c4@ti.com>
 <20250710-daft-secret-squid-fb3eee@houat>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250710-daft-secret-squid-fb3eee@houat>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea



On 7/10/25 2:44 AM, Maxime Ripard wrote:
> On Wed, Jul 09, 2025 at 11:14:37AM -0500, Andrew Davis wrote:
>> On 7/9/25 7:44 AM, Maxime Ripard wrote:
>>> Aside from the main CMA region, it can be useful to allow userspace to
>>> allocate from the other CMA reserved regions.
>>>
>>> Indeed, those regions can have specific properties that can be useful to
>>> a specific us-case.
>>>
>>> For example, one of them platform I've been with has ECC enabled on the
>>> entire memory but for a specific region. Using that region to allocate
>>> framebuffers can be particular beneficial because enabling the ECC has a
>>> performance and memory footprint cost.
>>>
>>> Thus, exposing these regions as heaps user-space can allocate from and
>>> import wherever needed allows to cover that use-case.
>>>
>>> For now, only shared-dma-pools regions with the reusable property (ie,
>>> backed by CMA) are supported, but eventually we'll want to support other
>>> DMA pools types.
>>>
>>> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>>> ---
>>>    drivers/dma-buf/heaps/cma_heap.c | 52 +++++++++++++++++++++++++++++++++++++++-
>>>    1 file changed, 51 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
>>> index 0df007111975447d555714d61ead9699287fd65a..31a18683ee25788a800f3f878fd958718a930ff7 100644
>>> --- a/drivers/dma-buf/heaps/cma_heap.c
>>> +++ b/drivers/dma-buf/heaps/cma_heap.c
>>> @@ -19,10 +19,12 @@
>>>    #include <linux/err.h>
>>>    #include <linux/highmem.h>
>>>    #include <linux/io.h>
>>>    #include <linux/mm.h>
>>>    #include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_reserved_mem.h>
>>>    #include <linux/scatterlist.h>
>>>    #include <linux/slab.h>
>>>    #include <linux/vmalloc.h>
>>>    #define DEFAULT_CMA_NAME "default_cma_region"
>>> @@ -421,7 +423,55 @@ static int __init add_default_cma_heap(void)
>>>    				ERR_PTR(ret));
>>>    	}
>>>    	return 0;
>>>    }
>>> -module_init(add_default_cma_heap);
>>> +
>>> +static int __init add_cma_heaps(void)
>>> +{
>>> +	struct device_node *rmem_node;
>>> +	struct device_node *node;
>>> +	int ret;
>>> +
>>> +	ret = add_default_cma_heap();
>>
>> Will this double add the default CMA region if it was declared
>> using DT (reserved-memory) when all those nodes are again scanned
>> through below? Might need a check in that loop for linux,cma-default.
> 
> Yeah, but we probably should anyway. Otherwise, if linux,cma-default
> ever change on a platform, we would get heaps appearing/disappearing as
> we reboot, which doesn't sound great from a regression perspective.
> 
> Both would allocate from the same pool though, so we don't risk stepping
> into each others toes. Or am I missing something?
> 

You are not missing anything, having both wouldn't cause anything to break,
but would cause heaps to appear/disappear based on how the CMA region was
defined (DT vs kernel cmd line) which we should avoid.

Andrew

>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	rmem_node = of_find_node_by_path("/reserved-memory");
>>> +	if (!rmem_node)
>>> +		goto out;
>>
>> Can just return here, "out" path doesn't need to put a NULL node.
> 
> Oh, right. Thanks!
> Maxime

