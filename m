Return-Path: <linux-media+bounces-28656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36972A6EAC7
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 08:45:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0284C3AC662
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 07:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF9C253B52;
	Tue, 25 Mar 2025 07:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmV8JNGH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8208A194A60;
	Tue, 25 Mar 2025 07:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742888746; cv=none; b=igLIN8tuh0KiWRWKKrrmAFTmMxMIxbI2T7eGcEkkRVqYDAdajRukug94M4lRJvpEGsaDWwvTzOiJE7c8L7fdC2uYkRbH6FBDd06+NZnDbliDf2DALWj9GS6enS5SfzOK2dwN8bO6qXNAqzhYhC1y+K6d8WfWSHymYSM+PHBMi04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742888746; c=relaxed/simple;
	bh=COv3ALd0K+Klf9VX67K/rQCTmju5YgCqlTdzWPNwzUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cbmiyc8AUPffK+1wsJSwl0czLXFVvfdd8vpHrFVHoK2WaDaljda5IzJ6QakWGH3IQ/DI19LQeYlZyN8hF6Ac5VGeymi37q0KJZJVumO/a8rGk5V5W5Oawe4W2RUEcICy0LPUfWnyRjEqcRbriNNoaYbOlU4hsvElvCryr6h9Zv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CmV8JNGH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C60B7C4CEE8;
	Tue, 25 Mar 2025 07:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742888746;
	bh=COv3ALd0K+Klf9VX67K/rQCTmju5YgCqlTdzWPNwzUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CmV8JNGH7Vcd7sDcWXD3QdzPpQ44/Z4BDNs9o6G3stDLHsydKUsfaTkn5pVxB4LPA
	 8bRlP+4KjK7bp+4NSt/vU8sD7VicmTvEh1mRkaPB4cHTWKjQ0erj5Whm43Hn4IR/lG
	 n4FQx6G25IIjt6rmj2JZELJ4TH8vJ+Gc/no9tWf/ut0j83e6BRUaXIj+SrtahRx5Jc
	 Xc14v+l0DLaqJDsqJrx3zrrK6WoAVXunGAC88ehMCShTerowJG2KDCV82MqmyX4lSJ
	 eXJdt5BhH/qM4beSZDGs9q+xElFI6D7w7eRvIn1A57pPIG/DiyhT0zEF0hhLfU1bSv
	 th6orop3f5Pjg==
Date: Tue, 25 Mar 2025 13:15:35 +0530
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
Subject: Re: [PATCH v6 10/10] optee: smc abi: dynamic restricted memory
 allocation
Message-ID: <Z-JfH7VAm0DTTbVg@sumit-X1>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-11-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305130634.1850178-11-jens.wiklander@linaro.org>

On Wed, Mar 05, 2025 at 02:04:16PM +0100, Jens Wiklander wrote:
> Add support in the OP-TEE backend driver for dynamic restricted memory
> allocation using the SMC ABI.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/optee/smc_abi.c | 96 +++++++++++++++++++++++++++++++------
>  1 file changed, 81 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> index a14ff0b7d3b3..aa574ee6e277 100644
> --- a/drivers/tee/optee/smc_abi.c
> +++ b/drivers/tee/optee/smc_abi.c
> @@ -1001,6 +1001,69 @@ static int optee_smc_do_call_with_arg(struct tee_context *ctx,
>  	return rc;
>  }
>  
> +static int optee_smc_lend_rstmem(struct optee *optee, struct tee_shm *rstmem,
> +				 u16 *end_points, unsigned int ep_count,
> +				 u32 use_case)
> +{
> +	struct optee_shm_arg_entry *entry;
> +	struct optee_msg_arg *msg_arg;
> +	struct tee_shm *shm;
> +	u_int offs;
> +	int rc;
> +
> +	msg_arg = optee_get_msg_arg(optee->ctx, 2, &entry, &shm, &offs);
> +	if (IS_ERR(msg_arg))
> +		return PTR_ERR(msg_arg);
> +
> +	msg_arg->cmd = OPTEE_MSG_CMD_LEND_RSTMEM;
> +	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
> +	msg_arg->params[0].u.value.a = use_case;
> +	msg_arg->params[1].attr = OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
> +	msg_arg->params[1].u.tmem.buf_ptr = rstmem->paddr;
> +	msg_arg->params[1].u.tmem.size = rstmem->size;
> +	msg_arg->params[1].u.tmem.shm_ref = (u_long)rstmem;
> +
> +	rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
> +	if (rc)
> +		goto out;
> +	if (msg_arg->ret != TEEC_SUCCESS) {
> +		rc = -EINVAL;
> +		goto out;
> +	}
> +	rstmem->sec_world_id = (u_long)rstmem;
> +
> +out:
> +	optee_free_msg_arg(optee->ctx, entry, offs);
> +	return rc;
> +}
> +
> +static int optee_smc_reclaim_rstmem(struct optee *optee, struct tee_shm *rstmem)
> +{
> +	struct optee_shm_arg_entry *entry;
> +	struct optee_msg_arg *msg_arg;
> +	struct tee_shm *shm;
> +	u_int offs;
> +	int rc;
> +
> +	msg_arg = optee_get_msg_arg(optee->ctx, 1, &entry, &shm, &offs);
> +	if (IS_ERR(msg_arg))
> +		return PTR_ERR(msg_arg);
> +
> +	msg_arg->cmd = OPTEE_MSG_CMD_RECLAIM_RSTMEM;
> +	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
> +	msg_arg->params[0].u.rmem.shm_ref = (u_long)rstmem;
> +
> +	rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
> +	if (rc)
> +		goto out;
> +	if (msg_arg->ret != TEEC_SUCCESS)
> +		rc = -EINVAL;
> +
> +out:
> +	optee_free_msg_arg(optee->ctx, entry, offs);
> +	return rc;
> +}
> +
>  /*
>   * 5. Asynchronous notification
>   */
> @@ -1252,6 +1315,8 @@ static const struct optee_ops optee_ops = {
>  	.do_call_with_arg = optee_smc_do_call_with_arg,
>  	.to_msg_param = optee_to_msg_param,
>  	.from_msg_param = optee_from_msg_param,
> +	.lend_rstmem = optee_smc_lend_rstmem,
> +	.reclaim_rstmem = optee_smc_reclaim_rstmem,
>  };
>  
>  static int enable_async_notif(optee_invoke_fn *invoke_fn)
> @@ -1622,11 +1687,13 @@ static inline int optee_load_fw(struct platform_device *pdev,
>  
>  static int optee_sdp_pool_init(struct optee *optee)
>  {
> +	bool sdp = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP;
> +	bool dyn_sdp = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_DYNAMIC_RSTMEM;
>  	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
> -	struct tee_rstmem_pool *pool;
> -	int rc;
> +	struct tee_rstmem_pool *pool = ERR_PTR(-EINVAL);
> +	int rc = -EINVAL;
>  
> -	if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP) {
> +	if (sdp) {
>  		union {
>  			struct arm_smccc_res smccc;
>  			struct optee_smc_get_sdp_config_result result;
> @@ -1634,25 +1701,24 @@ static int optee_sdp_pool_init(struct optee *optee)
>  
>  		optee->smc.invoke_fn(OPTEE_SMC_GET_SDP_CONFIG, 0, 0, 0, 0, 0, 0,
>  				     0, &res.smccc);
> -		if (res.result.status != OPTEE_SMC_RETURN_OK) {
> -			pr_err("Secure Data Path service not available\n");
> -			return 0;
> -		}
> +		if (res.result.status == OPTEE_SMC_RETURN_OK)
> +			pool = tee_rstmem_static_pool_alloc(res.result.start,
> +							    res.result.size);
> +	}
>  
> -		pool = tee_rstmem_static_pool_alloc(res.result.start,
> -						    res.result.size);
> -		if (IS_ERR(pool))
> -			return PTR_ERR(pool);
> +	if (dyn_sdp && IS_ERR(pool))
> +		pool = optee_rstmem_alloc_cma_pool(optee, heap_id);
>  
> +	if (!IS_ERR(pool)) {
>  		rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
>  		if (rc)
> -			goto err;
> +			pool->ops->destroy_pool(pool);
>  	}
>  
> +	if (rc && (sdp || dyn_sdp))
> +		pr_err("Secure Data Path service not available\n");

Rather than an error message we should just use pr_info().

-Sumit

> +
>  	return 0;
> -err:
> -	pool->ops->destroy_pool(pool);
> -	return rc;
>  }
>  
>  static int optee_probe(struct platform_device *pdev)
> -- 
> 2.43.0
> 

