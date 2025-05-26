Return-Path: <linux-media+bounces-33348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85215AC3AB0
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 09:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53113188B72E
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 07:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD641C5F09;
	Mon, 26 May 2025 07:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tlH4K3Nl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77487258A;
	Mon, 26 May 2025 07:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748244816; cv=none; b=Cs5m+UE29pTGrWD+BCPaQ/wv73B2Mce7bQYYtqsxl8DCpSZ+xv72F5Hmin3Bp91ndcNwIqX4ogLJz7y46EpdVecRSSboNwV023IekEI7bkG+XLSIYxcvPZ0OvYJBZ+R4yTYigSXnykzSD+SmHtSUFVpz5wDFnR3pUOeImy/o9sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748244816; c=relaxed/simple;
	bh=n06pjiR3hX6mJ2V6ci9WvZueX0ybWrSTpdyrRyQUxww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pca/TQJi1D9JOvJ3Gk8h50y/6uE4Avgk5qaZlAA4FO9HI1Qu4mnV4VMlMYU77bFSO0MFoehkPMebgnDncwKodGzTiBhmnc98mT8YYPDRqHh1W+kxyKtM4kcOQKwUA3jsrv/PS5MZck6/hzAbzlTofQaHr+u8V8uWLOrnrDqPLuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tlH4K3Nl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532ADC4CEE7;
	Mon, 26 May 2025 07:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748244815;
	bh=n06pjiR3hX6mJ2V6ci9WvZueX0ybWrSTpdyrRyQUxww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tlH4K3NlopK8NwFlAUzj3LDpVkIdJAYwYJ2MYUMGCqcetxLG7vnPmXJYBZWWyR51U
	 j08tn++djKFXkX+3JQlQXy4tC5mtIX5OBiBeapxjNNajb3Gu6gfItSiOmZx4TPc1VH
	 HDvZWb+lr8YvcXPJbFeCbeldXJUysGZN1dwpNxnpMuDqANvh1tPN6AptLgYEY2tjcg
	 19yOKh4mk6DgmFxXBW82XrZ/YEbHTCPAeKK81H9Wccz7gphhe+tMfYXTaZUym9CjFq
	 HIfXhWz3NgQj7Nwb/2LoODSYMcmO7n1KqE85/+JsVs7xJOEOjxkK0f6Yi8B2EIDAAl
	 1swcErzoeYZLQ==
Date: Mon, 26 May 2025 13:03:11 +0530
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
	Rouven Czerwinski <rouven.czerwinski@linaro.org>
Subject: Re: [PATCH v9 7/9] optee: support protected memory allocation
Message-ID: <aDQZN-frPnr1_N5I@sumit-X1>
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-8-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520152436.474778-8-jens.wiklander@linaro.org>

On Tue, May 20, 2025 at 05:16:50PM +0200, Jens Wiklander wrote:
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
>  drivers/tee/optee/core.c          | 10 +++++++
>  drivers/tee/optee/optee_private.h |  2 ++
>  drivers/tee/optee/smc_abi.c       | 45 +++++++++++++++++++++++++++++--
>  3 files changed, 55 insertions(+), 2 deletions(-)
> 
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
> index f0c3ac1103bb..f3cae8243785 100644
> --- a/drivers/tee/optee/smc_abi.c
> +++ b/drivers/tee/optee/smc_abi.c
> @@ -1584,6 +1584,42 @@ static inline int optee_load_fw(struct platform_device *pdev,
>  }
>  #endif
>  
> +static int optee_protmem_pool_init(struct optee *optee)
> +{
> +	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
> +	struct tee_protmem_pool *pool;
> +	int rc;
> +
> +	if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM) {
> +		union {
> +			struct arm_smccc_res smccc;
> +			struct optee_smc_get_protmem_config_result result;
> +		} res;
> +
> +		optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, 0, 0,
> +				     0, 0, 0, &res.smccc);
> +		if (res.result.status != OPTEE_SMC_RETURN_OK) {
> +			pr_err("Secure Data Path service not available\n");
> +			return 0;
> +		}
> +		rc = optee_set_dma_mask(optee, res.result.pa_width);
> +		if (!rc)
> +			pool = tee_protmem_static_pool_alloc(res.result.start,
> +							     res.result.size);
> +		if (IS_ERR(pool))
> +			return PTR_ERR(pool);
> +
> +		rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
> +		if (rc)
> +			goto err;
> +	}
> +
> +	return 0;
> +err:
> +	pool->ops->destroy_pool(pool);
> +	return rc;
> +}
> +
>  static int optee_probe(struct platform_device *pdev)
>  {
>  	optee_invoke_fn *invoke_fn;
> @@ -1679,7 +1715,7 @@ static int optee_probe(struct platform_device *pdev)
>  	optee = kzalloc(sizeof(*optee), GFP_KERNEL);
>  	if (!optee) {
>  		rc = -ENOMEM;
> -		goto err_free_pool;
> +		goto err_free_shm_pool;
>  	}
>  
>  	optee->ops = &optee_ops;
> @@ -1752,6 +1788,10 @@ static int optee_probe(struct platform_device *pdev)
>  		pr_info("Asynchronous notifications enabled\n");
>  	}
>  
> +	rc = optee_protmem_pool_init(optee);

Here we should do a Kconfig check for CONFIG_DMABUF_HEAPS so that we
don't proceed any further with initialization.

Rest looks good to me.

-Sumit

> +	if (rc)
> +		goto err_notif_uninit;
> +
>  	/*
>  	 * Ensure that there are no pre-existing shm objects before enabling
>  	 * the shm cache so that there's no chance of receiving an invalid
> @@ -1787,6 +1827,7 @@ static int optee_probe(struct platform_device *pdev)
>  		optee_disable_shm_cache(optee);
>  	optee_smc_notif_uninit_irq(optee);
>  	optee_unregister_devices();
> +	tee_device_unregister_all_dma_heaps(optee->teedev);
>  err_notif_uninit:
>  	optee_notif_uninit(optee);
>  err_close_ctx:
> @@ -1803,7 +1844,7 @@ static int optee_probe(struct platform_device *pdev)
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

