Return-Path: <linux-media+bounces-31618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3196CAA75BA
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 17:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79A193B2BFD
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 15:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463902571DF;
	Fri,  2 May 2025 15:11:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36BEE156C63;
	Fri,  2 May 2025 15:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746198703; cv=none; b=FU7S/wydNNyOOFNDoWqIsL2m+Os8TdnCAp0pqVE0DKN0zXGkSLVg1Yq0JiCfjvcBxKCIh2ghPs77DWWVGbxR3gTS26jkyrpgqpka4m4XobqED5OLO33yNEfkEAqxG/dS6pz7lwAKnrld+vMJ5XaLEA2E+wdd56Z6E4PTXVT7gtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746198703; c=relaxed/simple;
	bh=U+YSNzUnply29Hjd9uH9yUM2wuQsFaLy2qkKb05i3KE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qemMMqO3IfmCaWgzwt2araf4Fnj3saw7b11q9IUlLh/NQOvgL8T0uV6A8kCEKnVvGp2R9dukhOCIU/HNp4HaH8nZhCyK+VJ1Y9ywn0wGaMULr6TNQ8v0KmKY316yw+xSnwYbfohw+bfRKjIv6dFpX0uMh9/WfiDnduUxfYyYG6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52B951688;
	Fri,  2 May 2025 08:11:26 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86C713F66E;
	Fri,  2 May 2025 08:11:28 -0700 (PDT)
Message-ID: <4b2f7c31-c61b-45d8-b32e-16bb91c4289b@arm.com>
Date: Fri, 2 May 2025 16:11:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/14] tee: add tee_shm_alloc_cma_phys_mem()
To: Jens Wiklander <jens.wiklander@linaro.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org,
 linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
 <20250502100049.1746335-12-jens.wiklander@linaro.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250502100049.1746335-12-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/05/2025 10:59 am, Jens Wiklander wrote:
> Add tee_shm_alloc_cma_phys_mem() to allocate a physical memory using
> from the default CMA pool. The memory is represented by a tee_shm object
> using the new flag TEE_SHM_CMA_BUF to identify it as physical memory
> from CMA.

If and when it's possible to dynamically delegate any old kernel memory 
to the TEE, it's far from clear why that should involve poking around in 
CMA internals...

> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>   drivers/tee/tee_shm.c    | 55 ++++++++++++++++++++++++++++++++++++++--
>   include/linux/tee_core.h |  4 +++
>   2 files changed, 57 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index e1ed52ee0a16..faaa0a87bb18 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -3,8 +3,11 @@
>    * Copyright (c) 2015-2017, 2019-2021 Linaro Limited
>    */
>   #include <linux/anon_inodes.h>
> +#include <linux/cma.h>
>   #include <linux/device.h>
>   #include <linux/dma-buf.h>
> +#include <linux/dma-map-ops.h>
> +#include <linux/highmem.h>
>   #include <linux/idr.h>
>   #include <linux/io.h>
>   #include <linux/mm.h>
> @@ -13,7 +16,6 @@
>   #include <linux/tee_core.h>
>   #include <linux/uaccess.h>
>   #include <linux/uio.h>
> -#include <linux/highmem.h>
>   #include "tee_private.h"
>   
>   static void shm_put_kernel_pages(struct page **pages, size_t page_count)
> @@ -49,7 +51,14 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
>   	struct tee_shm *parent_shm = NULL;
>   	void *p = shm;
>   
> -	if (shm->flags & TEE_SHM_DMA_BUF) {
> +	if (shm->flags & TEE_SHM_CMA_BUF) {
> +#if IS_ENABLED(CONFIG_CMA)
> +		struct page *page = phys_to_page(shm->paddr);
> +		struct cma *cma = dev_get_cma_area(&shm->ctx->teedev->dev);

If you want dma_contiguous_default_area as the commit message implies, 
use dma_contiguous_default_area. Appearing to support per-device CMA 
pools but relying on the device not having one is pretty yucky.

But again, why? If you want page-backed DMA-able memory, with all the 
other assumptions being made here, you may as well just rely on 
dma_alloc_pages(DMA_ATTR_SKIP_CPU_SYNC) doing what you want, while also 
being potentially more flexible for !CMA and non-invasive. Or at the 
very least, could the TEE delegation not be composed on top of the 
existing CMA heap allocator?

Thanks,
Robin.

> +
> +		cma_release(cma, page, shm->size / PAGE_SIZE);
> +#endif
> +	} else if (shm->flags & TEE_SHM_DMA_BUF) {
>   		struct tee_shm_dmabuf_ref *ref;
>   
>   		ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
> @@ -306,6 +315,48 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size)
>   }
>   EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
>   
> +struct tee_shm *tee_shm_alloc_cma_phys_mem(struct tee_context *ctx,
> +					   size_t page_count, size_t align)
> +{
> +#if IS_ENABLED(CONFIG_CMA)
> +	struct tee_device *teedev = ctx->teedev;
> +	struct cma *cma = dev_get_cma_area(&teedev->dev);
> +	struct tee_shm *shm;
> +	struct page *page;
> +
> +	if (!tee_device_get(teedev))
> +		return ERR_PTR(-EINVAL);
> +
> +	page = cma_alloc(cma, page_count, align, true/*no_warn*/);
> +	if (!page)
> +		goto err_put_teedev;
> +
> +	shm = kzalloc(sizeof(*shm), GFP_KERNEL);
> +	if (!shm)
> +		goto err_cma_crelease;
> +
> +	refcount_set(&shm->refcount, 1);
> +	shm->ctx = ctx;
> +	shm->paddr = page_to_phys(page);
> +	shm->size = page_count * PAGE_SIZE;
> +	shm->flags = TEE_SHM_CMA_BUF;
> +
> +	teedev_ctx_get(ctx);
> +
> +	return shm;
> +
> +err_cma_crelease:
> +	cma_release(cma, page, page_count);
> +err_put_teedev:
> +	tee_device_put(teedev);
> +
> +	return ERR_PTR(-ENOMEM);
> +#else
> +	return ERR_PTR(-EINVAL);
> +#endif
> +}
> +EXPORT_SYMBOL_GPL(tee_shm_alloc_cma_phys_mem);
> +
>   int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
>   			     int (*shm_register)(struct tee_context *ctx,
>   						 struct tee_shm *shm,
> diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> index 02c07f661349..3a4e1b00fcc7 100644
> --- a/include/linux/tee_core.h
> +++ b/include/linux/tee_core.h
> @@ -29,6 +29,7 @@
>   #define TEE_SHM_POOL		BIT(2)  /* Memory allocated from pool */
>   #define TEE_SHM_PRIV		BIT(3)  /* Memory private to TEE driver */
>   #define TEE_SHM_DMA_BUF		BIT(4)	/* Memory with dma-buf handle */
> +#define TEE_SHM_CMA_BUF		BIT(5)	/* CMA allocated memory */
>   
>   #define TEE_DEVICE_FLAG_REGISTERED	0x1
>   #define TEE_MAX_DEV_NAME_LEN		32
> @@ -310,6 +311,9 @@ void *tee_get_drvdata(struct tee_device *teedev);
>    */
>   struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size);
>   
> +struct tee_shm *tee_shm_alloc_cma_phys_mem(struct tee_context *ctx,
> +					   size_t page_count, size_t align);
> +
>   int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
>   			     int (*shm_register)(struct tee_context *ctx,
>   						 struct tee_shm *shm,

