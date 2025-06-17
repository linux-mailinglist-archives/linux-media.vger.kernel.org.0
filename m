Return-Path: <linux-media+bounces-35067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 776D4ADC984
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 13:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B8FD16D485
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 11:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E506F2DBF68;
	Tue, 17 Jun 2025 11:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q05OpGtQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEC31FAC50;
	Tue, 17 Jun 2025 11:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750160109; cv=none; b=qm9gGm8BT4rAQDEfCP95xf6J453JN1xFJkj2yGdCXUAUM3S/YfTCRVV0RZ3cZSWDYYpFjkoi01/ykFwCFd69XlQcN5cBLIYHArogQOv8Pe2WL8z0Y90dS6chVuQqapsQ9aM5tkVHEhwq7Oxws7GKX0Egepj8VATdRhfr8xvfB5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750160109; c=relaxed/simple;
	bh=VBD9zifaN/iud4mKyV1zNbV/YCSuiu+Ra58MtmkrC5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nOFdxN3vKekU8DR85qscFi72UugFxh1Gl++I7roUNfWDiohCWEpTzcfvcJlkDnAGqMjFSlksQSoPQ5LYN1kkDn9dieU+8C7fvrqbfiMPlftvxXbUM3htTEkr18Og/hOgDf8qlJ0QKGmAIAxXZ9Sn2D6tVt0Xe97Ay6590vHmCFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q05OpGtQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA96C4CEE3;
	Tue, 17 Jun 2025 11:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750160108;
	bh=VBD9zifaN/iud4mKyV1zNbV/YCSuiu+Ra58MtmkrC5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q05OpGtQszQfBCKRbIqRMGwNjPJ/a1U7OLbOqW8ypHEI0TmryIF7pTTbS8WubTciY
	 oZ5L7bFkyYuuJ5f5YsIf8eCk5E8jlUnPtCo8iVyHlNU+uurRDrgbVtGQ7wfRp62Do+
	 NAZOf+e4rlvWZJSSbbGSaMu9qi9vSYORNndV3eIVEmbh4XFuERYqJAjFY98K2eTHEr
	 89WomPFZlPz46K9hxoQkreiF34470U4koUTNvnmHsqdu6oVWRHa5I0eTCuBe4ruBD3
	 rgsjLIEup7MEaj5wangbYKfXxCndqGcjthvDFtem+DNq79uULf5LnGn6D4sqa2ZOsZ
	 Jy1IgpXUPOe3A==
Date: Tue, 17 Jun 2025 17:04:59 +0530
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
Subject: Re: [PATCH v10 7/9] optee: support protected memory allocation
Message-ID: <aFFS43j3o4YdWPe3@sumit-X1>
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
 <20250610131600.2972232-8-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610131600.2972232-8-jens.wiklander@linaro.org>

On Tue, Jun 10, 2025 at 03:13:51PM +0200, Jens Wiklander wrote:
> Add support in the OP-TEE backend driver for protected memory
> allocation. The support is limited to only the SMC ABI and for secure
> video buffers.
> 
> OP-TEE is probed for the range of protected physical memory and a
> memory pool allocator is initialized if OP-TEE have support for such
> memory.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/optee/Kconfig         |  5 +++
>  drivers/tee/optee/core.c          | 10 +++++
>  drivers/tee/optee/optee_private.h |  2 +
>  drivers/tee/optee/smc_abi.c       | 70 ++++++++++++++++++++++++++++++-
>  4 files changed, 85 insertions(+), 2 deletions(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/tee/optee/Kconfig b/drivers/tee/optee/Kconfig
> index 7bb7990d0b07..50d2051f7f20 100644
> --- a/drivers/tee/optee/Kconfig
> +++ b/drivers/tee/optee/Kconfig
> @@ -25,3 +25,8 @@ config OPTEE_INSECURE_LOAD_IMAGE
>  
>  	  Additional documentation on kernel security risks are at
>  	  Documentation/tee/op-tee.rst.
> +
> +config OPTEE_STATIC_PROTMEM_POOL
> +	bool
> +	depends on HAS_IOMEM && TEE_DMABUF_HEAPS
> +	default y
> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> index c75fddc83576..4b14a7ac56f9 100644
> --- a/drivers/tee/optee/core.c
> +++ b/drivers/tee/optee/core.c
> @@ -56,6 +56,15 @@ int optee_rpmb_intf_rdev(struct notifier_block *intf, unsigned long action,
>  	return 0;
>  }
>  
> +int optee_set_dma_mask(struct optee *optee, u_int pa_width)
> +{
> +	u64 mask = DMA_BIT_MASK(min(64, pa_width));
> +
> +	optee->teedev->dev.dma_mask = &optee->teedev->dev.coherent_dma_mask;
> +
> +	return dma_set_mask_and_coherent(&optee->teedev->dev, mask);
> +}
> +
>  static void optee_bus_scan(struct work_struct *work)
>  {
>  	WARN_ON(optee_enumerate_devices(PTA_CMD_GET_DEVICES_SUPP));
> @@ -181,6 +190,7 @@ void optee_remove_common(struct optee *optee)
>  	tee_device_unregister(optee->supp_teedev);
>  	tee_device_unregister(optee->teedev);
>  
> +	tee_device_unregister_all_dma_heaps(optee->teedev);
>  	tee_shm_pool_free(optee->pool);
>  	optee_supp_uninit(&optee->supp);
>  	mutex_destroy(&optee->call_queue.mutex);
> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
> index dc0f355ef72a..5e3c34802121 100644
> --- a/drivers/tee/optee/optee_private.h
> +++ b/drivers/tee/optee/optee_private.h
> @@ -272,6 +272,8 @@ struct optee_call_ctx {
>  
>  extern struct blocking_notifier_head optee_rpmb_intf_added;
>  
> +int optee_set_dma_mask(struct optee *optee, u_int pa_width);
> +
>  int optee_notif_init(struct optee *optee, u_int max_key);
>  void optee_notif_uninit(struct optee *optee);
>  int optee_notif_wait(struct optee *optee, u_int key, u32 timeout);
> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> index f0c3ac1103bb..cf106d15e64e 100644
> --- a/drivers/tee/optee/smc_abi.c
> +++ b/drivers/tee/optee/smc_abi.c
> @@ -1584,6 +1584,68 @@ static inline int optee_load_fw(struct platform_device *pdev,
>  }
>  #endif
>  
> +static struct tee_protmem_pool *static_protmem_pool_init(struct optee *optee)
> +{
> +#if IS_ENABLED(CONFIG_OPTEE_STATIC_PROTMEM_POOL)
> +	union {
> +		struct arm_smccc_res smccc;
> +		struct optee_smc_get_protmem_config_result result;
> +	} res;
> +	struct tee_protmem_pool *pool;
> +	void *p;
> +	int rc;
> +
> +	optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, 0, 0,
> +			     0, 0, 0, &res.smccc);
> +	if (res.result.status != OPTEE_SMC_RETURN_OK)
> +		return ERR_PTR(-EINVAL);
> +
> +	rc = optee_set_dma_mask(optee, res.result.pa_width);
> +	if (rc)
> +		return ERR_PTR(rc);
> +
> +	/*
> +	 * Map the memory as uncached to make sure the kernel can work with
> +	 * __pfn_to_page() and friends since that's needed when passing the
> +	 * protected DMA-buf to a device. The memory should otherwise not
> +	 * be touched by the kernel since it's likely to cause an external
> +	 * abort due to the protection status.
> +	 */
> +	p = devm_memremap(&optee->teedev->dev, res.result.start,
> +			  res.result.size, MEMREMAP_WC);
> +	if (IS_ERR(p))
> +		return p;
> +
> +	pool = tee_protmem_static_pool_alloc(res.result.start, res.result.size);
> +	if (IS_ERR(pool))
> +		devm_memunmap(&optee->teedev->dev, p);
> +
> +	return pool;
> +#else
> +	return ERR_PTR(-EINVAL);
> +#endif
> +}
> +
> +static int optee_protmem_pool_init(struct optee *optee)
> +{
> +	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
> +	struct tee_protmem_pool *pool = ERR_PTR(-EINVAL);
> +	int rc;
> +
> +	if (!(optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM))
> +		return 0;
> +
> +	pool = static_protmem_pool_init(optee);
> +	if (IS_ERR(pool))
> +		return PTR_ERR(pool);
> +
> +	rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
> +	if (rc)
> +		pool->ops->destroy_pool(pool);
> +
> +	return rc;
> +}
> +
>  static int optee_probe(struct platform_device *pdev)
>  {
>  	optee_invoke_fn *invoke_fn;
> @@ -1679,7 +1741,7 @@ static int optee_probe(struct platform_device *pdev)
>  	optee = kzalloc(sizeof(*optee), GFP_KERNEL);
>  	if (!optee) {
>  		rc = -ENOMEM;
> -		goto err_free_pool;
> +		goto err_free_shm_pool;
>  	}
>  
>  	optee->ops = &optee_ops;
> @@ -1752,6 +1814,9 @@ static int optee_probe(struct platform_device *pdev)
>  		pr_info("Asynchronous notifications enabled\n");
>  	}
>  
> +	if (optee_protmem_pool_init(optee))
> +		pr_info("Protected memory service not available\n");
> +
>  	/*
>  	 * Ensure that there are no pre-existing shm objects before enabling
>  	 * the shm cache so that there's no chance of receiving an invalid
> @@ -1787,6 +1852,7 @@ static int optee_probe(struct platform_device *pdev)
>  		optee_disable_shm_cache(optee);
>  	optee_smc_notif_uninit_irq(optee);
>  	optee_unregister_devices();
> +	tee_device_unregister_all_dma_heaps(optee->teedev);
>  err_notif_uninit:
>  	optee_notif_uninit(optee);
>  err_close_ctx:
> @@ -1803,7 +1869,7 @@ static int optee_probe(struct platform_device *pdev)
>  	tee_device_unregister(optee->teedev);
>  err_free_optee:
>  	kfree(optee);
> -err_free_pool:
> +err_free_shm_pool:
>  	tee_shm_pool_free(pool);
>  	if (memremaped_shm)
>  		memunmap(memremaped_shm);
> -- 
> 2.43.0
> 

