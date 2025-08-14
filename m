Return-Path: <linux-media+bounces-39860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9BBB25B91
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 08:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D55F59E0C1F
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 06:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253D1235044;
	Thu, 14 Aug 2025 06:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQ2Yk7E/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB69225779;
	Thu, 14 Aug 2025 06:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755151515; cv=none; b=dDieEAxreaTE2ZcJZCn9hnB7QI8fb3WdVIyE9EsZtVwfwfWhj1yZWT5YEcr2xJApxExmL0+jY7uiK5es0D/omfwleCXvhM7bVdbPcEyKl9J84ucbksj0vHiAJ9K1ohR70Dg2DRdB5BCf5gmRc6HqgxcvBFW9wNnUSHvy2Mpq42A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755151515; c=relaxed/simple;
	bh=vD3VLaxYNjY+l2nLsEA/WS0s6KxfUJr/idUH6mg8DhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lS6TLj/QfrYik2D85qzhQFSlXV2drzD2D1gOHJtku4a/gGQ8kzQfyaH6bzn2zqOFXtWsLh7Mhhopmd01TAMAKGbUTGg2k7uj1+iqH/wfssk8WZ9cyiAZzm4PfAiEkbdVuh+lgvK9gpT8OOJtvR28s9ktA5Mq9VHBs3DOFFUcV14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQ2Yk7E/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF95C4CEEF;
	Thu, 14 Aug 2025 06:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755151515;
	bh=vD3VLaxYNjY+l2nLsEA/WS0s6KxfUJr/idUH6mg8DhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QQ2Yk7E/RfiZPsfjKcrV/EhPrEkh5UjA83Y3XgSItZeYU/D0VhSJ3+hvi+UgbzFL7
	 a03GWtdOAVlUjEDdKLAk3CuykXYg44brZojaHjcUlajKj/wRtP+/VFkMZfaOdWN6zr
	 CSB2j/W60glZsUL0VJGMuwNfe07KXD6j0vy4vY/zW+8dJJfXDG5oE2Qq5ieE3ZPlSz
	 CGqTIsYAu4WBveoDeCw+ADZLt/sX/kjBtsNG5TcfheXyfK3L2LRX/MtHkQlyFrExEI
	 /WwAf5ciRd6NKqXNOUiguS8LEGjXrTf9tTCE1ABh+uNsR4henMNwlJuG6yiCbX5rrX
	 4FgGuVwUHXEQQ==
Date: Thu, 14 Aug 2025 11:34:55 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	robin.murphy@arm.com
Subject: Re: [PATCH v11 6/9] tee: add tee_shm_alloc_dma_mem()
Message-ID: <aJ18h7yoFUINADVW@sumit-X1>
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
 <20250813060339.2977604-7-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813060339.2977604-7-jens.wiklander@linaro.org>

On Wed, Aug 13, 2025 at 08:02:55AM +0200, Jens Wiklander wrote:
> Add tee_shm_alloc_dma_mem() to allocate DMA memory. The memory is
> represented by a tee_shm object using the new flag TEE_SHM_DMA_MEM to
> identify it as DMA memory. The allocated memory will later be lent to
> the TEE to be used as protected memory.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/tee_shm.c    | 85 +++++++++++++++++++++++++++++++++++++++-
>  include/linux/tee_core.h |  5 +++
>  2 files changed, 88 insertions(+), 2 deletions(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index 76195a398c89..e195c892431d 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -5,6 +5,8 @@
>  #include <linux/anon_inodes.h>
>  #include <linux/device.h>
>  #include <linux/dma-buf.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/highmem.h>
>  #include <linux/idr.h>
>  #include <linux/io.h>
>  #include <linux/mm.h>
> @@ -13,9 +15,14 @@
>  #include <linux/tee_core.h>
>  #include <linux/uaccess.h>
>  #include <linux/uio.h>
> -#include <linux/highmem.h>
>  #include "tee_private.h"
>  
> +struct tee_shm_dma_mem {
> +	struct tee_shm shm;
> +	dma_addr_t dma_addr;
> +	struct page *page;
> +};
> +
>  static void shm_put_kernel_pages(struct page **pages, size_t page_count)
>  {
>  	size_t n;
> @@ -48,7 +55,16 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
>  {
>  	void *p = shm;
>  
> -	if (shm->flags & TEE_SHM_DMA_BUF) {
> +	if (shm->flags & TEE_SHM_DMA_MEM) {
> +#if IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS)
> +		struct tee_shm_dma_mem *dma_mem;
> +
> +		dma_mem = container_of(shm, struct tee_shm_dma_mem, shm);
> +		p = dma_mem;
> +		dma_free_pages(&teedev->dev, shm->size, dma_mem->page,
> +			       dma_mem->dma_addr, DMA_BIDIRECTIONAL);
> +#endif
> +	} else if (shm->flags & TEE_SHM_DMA_BUF) {
>  		struct tee_shm_dmabuf_ref *ref;
>  
>  		ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
> @@ -268,6 +284,71 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size)
>  }
>  EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
>  
> +#if IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS)
> +/**
> + * tee_shm_alloc_dma_mem() - Allocate DMA memory as shared memory object
> + * @ctx:	Context that allocates the shared memory
> + * @page_count:	Number of pages
> + *
> + * The allocated memory is expected to be lent (made inaccessible to the
> + * kernel) to the TEE while it's used and returned (accessible to the
> + * kernel again) before it's freed.
> + *
> + * This function should normally only be used internally in the TEE
> + * drivers.
> + *
> + * @returns a pointer to 'struct tee_shm'
> + */
> +struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
> +				      size_t page_count)
> +{
> +	struct tee_device *teedev = ctx->teedev;
> +	struct tee_shm_dma_mem *dma_mem;
> +	dma_addr_t dma_addr;
> +	struct page *page;
> +
> +	if (!tee_device_get(teedev))
> +		return ERR_PTR(-EINVAL);
> +
> +	page = dma_alloc_pages(&teedev->dev, page_count * PAGE_SIZE,
> +			       &dma_addr, DMA_BIDIRECTIONAL, GFP_KERNEL);
> +	if (!page)
> +		goto err_put_teedev;
> +
> +	dma_mem = kzalloc(sizeof(*dma_mem), GFP_KERNEL);
> +	if (!dma_mem)
> +		goto err_free_pages;
> +
> +	refcount_set(&dma_mem->shm.refcount, 1);
> +	dma_mem->shm.ctx = ctx;
> +	dma_mem->shm.paddr = page_to_phys(page);
> +	dma_mem->dma_addr = dma_addr;
> +	dma_mem->page = page;
> +	dma_mem->shm.size = page_count * PAGE_SIZE;
> +	dma_mem->shm.flags = TEE_SHM_DMA_MEM;
> +
> +	teedev_ctx_get(ctx);
> +
> +	return &dma_mem->shm;
> +
> +err_free_pages:
> +	dma_free_pages(&teedev->dev, page_count * PAGE_SIZE, page, dma_addr,
> +		       DMA_BIDIRECTIONAL);
> +err_put_teedev:
> +	tee_device_put(teedev);
> +
> +	return ERR_PTR(-ENOMEM);
> +}
> +EXPORT_SYMBOL_GPL(tee_shm_alloc_dma_mem);
> +#else
> +struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
> +				      size_t page_count)
> +{
> +	return ERR_PTR(-EINVAL);
> +}
> +EXPORT_SYMBOL_GPL(tee_shm_alloc_dma_mem);
> +#endif
> +
>  int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
>  			     int (*shm_register)(struct tee_context *ctx,
>  						 struct tee_shm *shm,
> diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> index b6c54b34a8b5..7b0c1da2ca6c 100644
> --- a/include/linux/tee_core.h
> +++ b/include/linux/tee_core.h
> @@ -29,6 +29,8 @@
>  #define TEE_SHM_POOL		BIT(2)  /* Memory allocated from pool */
>  #define TEE_SHM_PRIV		BIT(3)  /* Memory private to TEE driver */
>  #define TEE_SHM_DMA_BUF		BIT(4)	/* Memory with dma-buf handle */
> +#define TEE_SHM_DMA_MEM		BIT(5)	/* Memory allocated with */
> +					/* dma_alloc_pages() */
>  
>  #define TEE_DEVICE_FLAG_REGISTERED	0x1
>  #define TEE_MAX_DEV_NAME_LEN		32
> @@ -298,6 +300,9 @@ void *tee_get_drvdata(struct tee_device *teedev);
>   */
>  struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size);
>  
> +struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
> +				      size_t page_count);
> +
>  int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
>  			     int (*shm_register)(struct tee_context *ctx,
>  						 struct tee_shm *shm,
> -- 
> 2.43.0
> 

