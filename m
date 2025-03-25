Return-Path: <linux-media+bounces-28653-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 802E2A6E9D4
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 07:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C81C3B049C
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 06:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0B4620C019;
	Tue, 25 Mar 2025 06:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TSf3uNv5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F6986324;
	Tue, 25 Mar 2025 06:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742885635; cv=none; b=u+DK3fmmAo6Dxp4o7MOzMa8ejR8rRtzCA3DVOV+iytaxzgZfPHdOjI9q6789UUluDNdeS50LEvPXDraMMe0tU/Flqik+MgO7mia8k2Le6E8ukj37SCl+v38w+r2WTemsa2IzAXbYkAe/CMXmWchdZPpmPpDx4+3CyXyXYlkwRmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742885635; c=relaxed/simple;
	bh=kjvYmCQ8Y/WN+yHilTtN81fEcJrveiY+q5nnPqA3msc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6ieR7vxFkDOs8p2e4HNcHh7pR7woYOU5HGXkQJUSEXMqRboEO86faYQNee4dXvSZv0E9yaP/dW7DOYJBa8rhyVcv7edUHqIms2OyDYYxp09SR8P26WeAm4Vwp2trUAmLeekzpaSv5XX8lm1OiGj8ENyK5wFS+1qWAtk8/1CkmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TSf3uNv5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D66C4CEE8;
	Tue, 25 Mar 2025 06:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742885634;
	bh=kjvYmCQ8Y/WN+yHilTtN81fEcJrveiY+q5nnPqA3msc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TSf3uNv5Rw+J8RXCaL/dj8yWijjd1ot7Zs1EcpoC0IFPkR0SszCUJUn/LyPwsG/NY
	 Q7N0ASaAzMMo61I4JF94CkeEkO7tKjp+pIIaXrbSAg8fdozuKrnv0FXlsAIaJCUagF
	 vuR2DSvIk3a2B4+fu9j51sU+JLb092Sh5rJOmNFMO2679kZQuaYVHt/BdCbbJRcrp/
	 mY30UVqS/EvUNmK4VB5FLb1a7mzRopHztnsbyYItn8vrGPPtc4cpbflHFXaJH1Crb5
	 9Jbgs2og3TemIMLi4V77jyNixRxRd4xOQhHCWhPfO0kEsynuJVS87gWnHChOBi7U/F
	 bsa/GP8WvQd3A==
Date: Tue, 25 Mar 2025 12:23:45 +0530
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
	Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v6 07/10] tee: add tee_shm_alloc_cma_phys_mem()
Message-ID: <Z-JS-Tq_lxGAZfiP@sumit-X1>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-8-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305130634.1850178-8-jens.wiklander@linaro.org>

Hi Jens,

On Wed, Mar 05, 2025 at 02:04:13PM +0100, Jens Wiklander wrote:
> Add tee_shm_alloc_cma_phys_mem() to allocate a physical memory using
> from the default CMA pool. The memory is represented by a tee_shm object
> using the new flag TEE_SHM_CMA_BUF to identify it as physical memory
> from CMA.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/tee_shm.c    | 55 ++++++++++++++++++++++++++++++++++++++--
>  include/linux/tee_core.h |  4 +++
>  2 files changed, 57 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index 8b79918468b5..8d8341f8ebd7 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -3,8 +3,11 @@
>   * Copyright (c) 2015-2017, 2019-2021 Linaro Limited
>   */
>  #include <linux/anon_inodes.h>
> +#include <linux/cma.h>
>  #include <linux/device.h>
>  #include <linux/dma-buf.h>
> +#include <linux/dma-map-ops.h>
> +#include <linux/highmem.h>
>  #include <linux/idr.h>
>  #include <linux/io.h>
>  #include <linux/mm.h>
> @@ -13,7 +16,6 @@
>  #include <linux/tee_core.h>
>  #include <linux/uaccess.h>
>  #include <linux/uio.h>
> -#include <linux/highmem.h>
>  #include "tee_private.h"
>  
>  /* extra references appended to shm object for registered shared memory */
> @@ -59,7 +61,14 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
>  	struct tee_shm *parent_shm = NULL;
>  	void *p = shm;
>  
> -	if (shm->flags & TEE_SHM_DMA_BUF) {
> +	if (shm->flags & TEE_SHM_CMA_BUF) {
> +#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_CMA)

Can we rather manage this dependency via Kconfig?

> +		struct page *page = phys_to_page(shm->paddr);
> +		struct cma *cma = dev_get_cma_area(&shm->ctx->teedev->dev);
> +
> +		cma_release(cma, page, shm->size / PAGE_SIZE);
> +#endif
> +	} else if (shm->flags & TEE_SHM_DMA_BUF) {
>  		struct tee_shm_dmabuf_ref *ref;
>  
>  		ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
> @@ -341,6 +350,48 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size)
>  }
>  EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
>  
> +struct tee_shm *tee_shm_alloc_cma_phys_mem(struct tee_context *ctx,
> +					   size_t page_count, size_t align)
> +{
> +#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_CMA)

Ditto here.

-Sumit

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
>  int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
>  			     int (*shm_register)(struct tee_context *ctx,
>  						 struct tee_shm *shm,
> diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> index 6bd833b6d0e1..b6727d9a3556 100644
> --- a/include/linux/tee_core.h
> +++ b/include/linux/tee_core.h
> @@ -29,6 +29,7 @@
>  #define TEE_SHM_POOL		BIT(2)  /* Memory allocated from pool */
>  #define TEE_SHM_PRIV		BIT(3)  /* Memory private to TEE driver */
>  #define TEE_SHM_DMA_BUF		BIT(4)	/* Memory with dma-buf handle */
> +#define TEE_SHM_CMA_BUF		BIT(5)	/* CMA allocated memory */
>  
>  #define TEE_DEVICE_FLAG_REGISTERED	0x1
>  #define TEE_MAX_DEV_NAME_LEN		32
> @@ -307,6 +308,9 @@ void *tee_get_drvdata(struct tee_device *teedev);
>   */
>  struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size);
>  
> +struct tee_shm *tee_shm_alloc_cma_phys_mem(struct tee_context *ctx,
> +					   size_t page_count, size_t align);
> +
>  int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
>  			     int (*shm_register)(struct tee_context *ctx,
>  						 struct tee_shm *shm,
> -- 
> 2.43.0
> 

