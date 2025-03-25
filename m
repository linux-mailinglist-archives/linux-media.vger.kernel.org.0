Return-Path: <linux-media+bounces-28654-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D07FA6EA31
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 08:08:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 221493A4831
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 07:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE332343C2;
	Tue, 25 Mar 2025 07:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uGuI/gEN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD87179F5;
	Tue, 25 Mar 2025 07:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742886445; cv=none; b=hV1kyDT2DAgJwmkUXqE4OZtrLp8NTQPooKjb2CHFYGVua6OF15y8iCoZeLPVUYjXGKAoUN7EyW9sKfMupg8qYSLCC9I9LOaoUmpRLS8YZy+yrMFz4bqyYoIWjYfgU/SMLVm2oqqoS/WlzrxvpdVAvB+vqrDyavOSaPhLOQYWjpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742886445; c=relaxed/simple;
	bh=tg+CzT94V2KHL7cvcsv3BOAj9cqZ8YzAUgJ5W4z5H4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlVmdBS1WukjH2nxifhRIWr7lFJyfvvhTjyu4G8qNXkaItzXD3z13eiKk6rPfglSOVtHIpsfEjUonP5dQRokPKtUPicWihAgH7u5wA/9yEStF/8aCVc9I2yA4f0kadSLP1ZVvak6rMQXQb23k19psR8Z+elG5oxWcaZQOZySa68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uGuI/gEN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D46C4CEE8;
	Tue, 25 Mar 2025 07:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742886445;
	bh=tg+CzT94V2KHL7cvcsv3BOAj9cqZ8YzAUgJ5W4z5H4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uGuI/gENsIOfo9g5ssUpgXDjOcPi/XDvQ0rYWtHHZe1uUQrrQ8ebTZWvoWVg+18B+
	 CFGPkLQOw+VRAO30/5q9eIme3Vkr4yH8NLyfqw1F6AFisurhS0oNLivQo9O3w5Uotr
	 6GSqx3JjQ9kNBfeeJpGcV9Lw+w/WKlkf5+zKDRf5zOKgy2ST8honmAVIHVsoECIyrC
	 SyjaBIh8m9eQQHuu1KsbRnzeG8y7nv4gh8X4RsMufU1N0p9Gd34AFsR8ZJpckY4+nb
	 RRsOPpkVUIbVu1UswcBf11rCBapP0682sP1oFXtCXmeZFKj4CnGAlPxZblMVTRTLp6
	 kwoVO1kXmRLyg==
Date: Tue, 25 Mar 2025 12:37:15 +0530
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
Subject: Re: [PATCH v6 08/10] optee: support restricted memory allocation
Message-ID: <Z-JWIyd8cKyXQR0H@sumit-X1>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-9-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305130634.1850178-9-jens.wiklander@linaro.org>

On Wed, Mar 05, 2025 at 02:04:14PM +0100, Jens Wiklander wrote:
> Add support in the OP-TEE backend driver for restricted memory
> allocation. The support is limited to only the SMC ABI and for secure
> video buffers.
> 
> OP-TEE is probed for the range of restricted physical memory and a
> memory pool allocator is initialized if OP-TEE have support for such
> memory.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/optee/core.c    |  1 +
>  drivers/tee/optee/smc_abi.c | 44 +++++++++++++++++++++++++++++++++++--
>  2 files changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> index c75fddc83576..c7fd8040480e 100644
> --- a/drivers/tee/optee/core.c
> +++ b/drivers/tee/optee/core.c
> @@ -181,6 +181,7 @@ void optee_remove_common(struct optee *optee)
>  	tee_device_unregister(optee->supp_teedev);
>  	tee_device_unregister(optee->teedev);
>  
> +	tee_device_unregister_all_dma_heaps(optee->teedev);
>  	tee_shm_pool_free(optee->pool);
>  	optee_supp_uninit(&optee->supp);
>  	mutex_destroy(&optee->call_queue.mutex);
> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> index cfdae266548b..a14ff0b7d3b3 100644
> --- a/drivers/tee/optee/smc_abi.c
> +++ b/drivers/tee/optee/smc_abi.c
> @@ -1620,6 +1620,41 @@ static inline int optee_load_fw(struct platform_device *pdev,
>  }
>  #endif
>  
> +static int optee_sdp_pool_init(struct optee *optee)
> +{
> +	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
> +	struct tee_rstmem_pool *pool;
> +	int rc;
> +
> +	if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP) {

Is this SDP capability an ABI yet since we haven't supported it in
upstream kernel? If no then can we rename it as
OPTEE_SMC_SEC_CAP_RSTMEM?

> +		union {
> +			struct arm_smccc_res smccc;
> +			struct optee_smc_get_sdp_config_result result;
> +		} res;
> +
> +		optee->smc.invoke_fn(OPTEE_SMC_GET_SDP_CONFIG, 0, 0, 0, 0, 0, 0,
> +				     0, &res.smccc);
> +		if (res.result.status != OPTEE_SMC_RETURN_OK) {
> +			pr_err("Secure Data Path service not available\n");
> +			return 0;
> +		}
> +
> +		pool = tee_rstmem_static_pool_alloc(res.result.start,
> +						    res.result.size);
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
> @@ -1715,7 +1750,7 @@ static int optee_probe(struct platform_device *pdev)
>  	optee = kzalloc(sizeof(*optee), GFP_KERNEL);
>  	if (!optee) {
>  		rc = -ENOMEM;
> -		goto err_free_pool;
> +		goto err_free_shm_pool;
>  	}
>  
>  	optee->ops = &optee_ops;
> @@ -1788,6 +1823,10 @@ static int optee_probe(struct platform_device *pdev)
>  		pr_info("Asynchronous notifications enabled\n");
>  	}
>  
> +	rc = optee_sdp_pool_init(optee);

s/optee_sdp_pool_init/optee_rstmem_pool_init/

-Sumit

> +	if (rc)
> +		goto err_notif_uninit;
> +
>  	/*
>  	 * Ensure that there are no pre-existing shm objects before enabling
>  	 * the shm cache so that there's no chance of receiving an invalid
> @@ -1823,6 +1862,7 @@ static int optee_probe(struct platform_device *pdev)
>  		optee_disable_shm_cache(optee);
>  	optee_smc_notif_uninit_irq(optee);
>  	optee_unregister_devices();
> +	tee_device_unregister_all_dma_heaps(optee->teedev);
>  err_notif_uninit:
>  	optee_notif_uninit(optee);
>  err_close_ctx:
> @@ -1839,7 +1879,7 @@ static int optee_probe(struct platform_device *pdev)
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

