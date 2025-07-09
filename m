Return-Path: <linux-media+bounces-37217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7376AFF009
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 19:40:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 562711C83AED
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 17:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9552367C5;
	Wed,  9 Jul 2025 17:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bHT7+DtS"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823B622FDF2;
	Wed,  9 Jul 2025 17:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752082782; cv=none; b=IEPDAEW7RQHKCp1ml+zoenA+0V4wSTBHIoszWxZa9JsrkTJpE1C4wUa38ZNlPy6y8iv5UOq+3IbugJT4Mv6gg9WKAVWJohKLyY3cKfqO/uwj/M5IRjoozV4AItb4iYoE9aajxInLgS6FdWSaEY1xnK/Oqa4bwbmRPEI96VucL9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752082782; c=relaxed/simple;
	bh=XElOcsdvO27Z69GW49Yu92xRPveSmIgmkRFK1bGgTqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QhAQk/E48UUWdIW3WTZ8hyRPImJZnoXNS+ag8t0ZoVtYIL6woDI9/y29Y0kwEHL2bwSomkwF2zUkbNWrRj74x5HVmPkAD165VC5KlUUH2RMialOZRIxDKKI/LEkzEQqIyJ+gD/vWTYNJWd3ewBsrSmddM0Zct19LjYmeYLhbrus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bHT7+DtS; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 569HdHCY1547101;
	Wed, 9 Jul 2025 12:39:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752082757;
	bh=2Op+P3nGHZ2e7hDVxEF/lLCrCNuypSQlBiA2kHno7Ek=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=bHT7+DtSBBCnWXf83ggmmnnXviAgya1EjwHye3xsdKHSaPmfPme5HEyP6gYkRNGXm
	 6XbZkYL17MVsz3XKsHf1KxhXslqwfxM7AVZvQHvMZNU01BUC7yqNBboiMXA9OcATzh
	 9fAzhz1bK4N/eD0Kg1ceSNBHTMOoZGsBMfkZDvRg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 569HdHZL2219365
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 9 Jul 2025 12:39:17 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 9
 Jul 2025 12:39:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 9 Jul 2025 12:39:16 -0500
Received: from [10.250.35.60] ([10.250.35.60])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 569HdFaJ161592;
	Wed, 9 Jul 2025 12:39:15 -0500
Message-ID: <9182c5cd-b3de-470b-bf84-3ebef309def6@ti.com>
Date: Wed, 9 Jul 2025 12:39:15 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Documentation: dma-buf: heaps: Add naming guidelines
To: Maxime Ripard <mripard@kernel.org>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        Benjamin Gaignard
	<benjamin.gaignard@collabora.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <jstultz@google.com>,
        "T.J. Mercier" <tjmercier@google.com>,
        Jonathan Corbet <corbet@lwn.net>
CC: <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jared Kangas <jkangas@redhat.com>,
        Mattijs
 Korpershoek <mkorpershoek@kernel.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>
References: <20250616-dma-buf-heap-names-doc-v2-1-8ae43174cdbf@kernel.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250616-dma-buf-heap-names-doc-v2-1-8ae43174cdbf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 6/16/25 10:21 AM, Maxime Ripard wrote:
> We've discussed a number of times of how some heap names are bad, but
> not really what makes a good heap name.
> 
> Let's document what we expect the heap names to look like.
> 
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Changes in v2:
> - Added justifications for each requirement / suggestions
> - Added a mention and example of buffer attributes
> - Link to v1: https://lore.kernel.org/r/20250520-dma-buf-heap-names-doc-v1-1-ab31f74809ee@kernel.org
> ---
>   Documentation/userspace-api/dma-buf-heaps.rst | 38 +++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
> index 535f49047ce6450796bf4380c989e109355efc05..835ad1c3a65bc07b6f41d387d85c57162909e859 100644
> --- a/Documentation/userspace-api/dma-buf-heaps.rst
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -21,5 +21,43 @@ following heaps:
>      usually created either through the kernel commandline through the
>      `cma` parameter, a memory region Device-Tree node with the
>      `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
>      `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
>      might be called ``reserved``, ``linux,cma``, or ``default-pool``.
> +
> +Naming Convention
> +=================
> +
> +``dma-buf`` heaps name should meet a number of constraints:
> +
> +- That name must be stable, and must not change from one version to the
> +  other. Userspace identifies heaps by their name, so if the names ever
> +  changes, we would be likely to introduce regressions.
> +
> +- That name must describe the memory region the heap will allocate from,
> +  and must uniquely identify it in a given platform. Since userspace
> +  applications use the heap name as the discriminant, it must be able to
> +  tell which heap it wants to use reliably if there's multiple heaps.
> +
> +- That name must not mention implementation details, such as the
> +  allocator. The heap driver will change over time, and implementation
> +  details when it was introduced might not be relevant in the future.
> +
> +- The name should describe properties of the buffers that would be
> +  allocated. Doing so will make heap identification easier for
> +  userspace. Such properties are:
> +
> +  - ``cacheable`` / ``uncacheable`` for buffers with CPU caches enabled
> +    or disabled;
> +

We should avoid exposing cacheability to userspace. What users care about
is if writes are readable by the other side (and vice versa) without SYNC
operations in-between. This property is "coherency". Being non-cached
is just one way to achieve coherency on some systems. For many systems
even cached buffers are still coherent and manually specifying "non-cached"
causes unneeded performance issues.

DMA-BUFs are default assumed to be non-coherent and sync operations should
be always be performed (if the buffer is actually coherent these operations
are turned into NOPs and no harm done). If sync operations cannot be done
(for instance small multi-writer ring-buffers), then the property can
be simply:

- ``coherent`` for buffers which do not require sync operations

Andrew

> +  - ``contiguous`` for physically contiguous buffers;
> +
> +  - ``protected`` for encrypted buffers not accessible the OS;
> +
> +- The name may describe intended usage. Doing so will make heap
> +  identification easier for userspace applications and users.
> +
> +For example, assuming a platform with a reserved memory region located
> +at the RAM address 0x42000000, intended to allocate video framebuffers,
> +physically contiguous, and backed by the CMA kernel allocator. Good
> +names would be ``memory@42000000-cacheable-contiguous`` or
> +``video@42000000``, but ``cma-video`` wouldn't.
> 
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250520-dma-buf-heap-names-doc-31261aa0cfe6
> 
> Best regards,

