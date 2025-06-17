Return-Path: <linux-media+bounces-35069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2812AADC999
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 13:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D2133B5DF5
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 11:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44402E4258;
	Tue, 17 Jun 2025 11:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IsKgShY2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D0F2DBF7D;
	Tue, 17 Jun 2025 11:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750160327; cv=none; b=qfwh3ca0SpUOz1rZjlwaWuyoeXPTYguSNZryVuO642fGd0/dWiWkwsD2TTBIifgfTqDskN25dkPGA4mbiDZvbqkBKJESJrfsFHpbMhJ0nKcCMTacRxPhZS9PrQyoDZN5ikmM6wbIERWT7FefHa8O+3e5hVCI+lrbWASpILlvtu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750160327; c=relaxed/simple;
	bh=8caphRgx/Rs0Kb+XhmCJDHdciuqN6WMkJ9hS4WogXqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qmHRnbXXXS1Sl3ZPXjeBAQyQeIkqncIrK8zFedNzzvJ81V+2rKh6kN5e93n6mznmPsanaLa8+JvSsBfu39p234ntcrXWCDe1G8GEi9rtwURTL9q1cowsZDHpdpdnSs2eBGs3wrXHn6EHRggsq7Zsdlq1HpKvv7Y1X0Nar0obrGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IsKgShY2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F29AC4CEE3;
	Tue, 17 Jun 2025 11:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750160326;
	bh=8caphRgx/Rs0Kb+XhmCJDHdciuqN6WMkJ9hS4WogXqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IsKgShY2HGqcseW/I48vr8m3HGQxCBoBbmUO8KVWAF6i4R1GO+H7i0/DfsuyYw7bg
	 xb9DFEtIW5Q1YwyNmi1YyyQrHJtWSrFEm3bLoOl4QE2nLxvU5DqXcXAXgyuprpWU6C
	 4TjJFVxLjXSJ5QLW3EqsV8m471NxhS3H6lD9fKyG/2MORJuybO/2y02vk46iHCvjp8
	 SsCEKzDhMu8f8byZc525vTh33DaMLRGK8SnFRQYM+Hi/VBmDpd2w5Z2ucXc12Cblhy
	 wc2KZHWZY5JQCsICR9Q96908oU0ZTHQQ0wAgodsM2Eklv+wb1YuRKGd5V6f1Woq5NF
	 385G3ffjQh3GA==
Date: Tue, 17 Jun 2025 17:08:37 +0530
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
Subject: Re: [PATCH v10 9/9] optee: smc abi: dynamic protected memory
 allocation
Message-ID: <aFFTvU-xXogA-ctF@sumit-X1>
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
 <20250610131600.2972232-10-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610131600.2972232-10-jens.wiklander@linaro.org>

On Tue, Jun 10, 2025 at 03:13:53PM +0200, Jens Wiklander wrote:
> Add support in the OP-TEE backend driver for dynamic protected memory
> allocation using the SMC ABI.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/optee/smc_abi.c | 78 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 75 insertions(+), 3 deletions(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> index cf106d15e64e..fd1d873de941 100644
> --- a/drivers/tee/optee/smc_abi.c
> +++ b/drivers/tee/optee/smc_abi.c
> @@ -965,6 +965,70 @@ static int optee_smc_do_call_with_arg(struct tee_context *ctx,
>  	return rc;
>  }
>  
> +static int optee_smc_lend_protmem(struct optee *optee, struct tee_shm *protmem,
> +				  u16 *end_points, unsigned int ep_count,
> +				  u32 use_case)
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
> +	msg_arg->cmd = OPTEE_MSG_CMD_LEND_PROTMEM;
> +	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
> +	msg_arg->params[0].u.value.a = use_case;
> +	msg_arg->params[1].attr = OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
> +	msg_arg->params[1].u.tmem.buf_ptr = protmem->paddr;
> +	msg_arg->params[1].u.tmem.size = protmem->size;
> +	msg_arg->params[1].u.tmem.shm_ref = (u_long)protmem;
> +
> +	rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
> +	if (rc)
> +		goto out;
> +	if (msg_arg->ret != TEEC_SUCCESS) {
> +		rc = -EINVAL;
> +		goto out;
> +	}
> +	protmem->sec_world_id = (u_long)protmem;
> +
> +out:
> +	optee_free_msg_arg(optee->ctx, entry, offs);
> +	return rc;
> +}
> +
> +static int optee_smc_reclaim_protmem(struct optee *optee,
> +				     struct tee_shm *protmem)
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
> +	msg_arg->cmd = OPTEE_MSG_CMD_RECLAIM_PROTMEM;
> +	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
> +	msg_arg->params[0].u.rmem.shm_ref = (u_long)protmem;
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
> @@ -1216,6 +1280,8 @@ static const struct optee_ops optee_ops = {
>  	.do_call_with_arg = optee_smc_do_call_with_arg,
>  	.to_msg_param = optee_to_msg_param,
>  	.from_msg_param = optee_from_msg_param,
> +	.lend_protmem = optee_smc_lend_protmem,
> +	.reclaim_protmem = optee_smc_reclaim_protmem,
>  };
>  
>  static int enable_async_notif(optee_invoke_fn *invoke_fn)
> @@ -1628,14 +1694,20 @@ static struct tee_protmem_pool *static_protmem_pool_init(struct optee *optee)
>  
>  static int optee_protmem_pool_init(struct optee *optee)
>  {
> +	bool protm = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM;
> +	bool dyn_protm = optee->smc.sec_caps &
> +			 OPTEE_SMC_SEC_CAP_DYNAMIC_PROTMEM;
>  	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
>  	struct tee_protmem_pool *pool = ERR_PTR(-EINVAL);
> -	int rc;
> +	int rc = -EINVAL;
>  
> -	if (!(optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM))
> +	if (!protm && !dyn_protm)
>  		return 0;
>  
> -	pool = static_protmem_pool_init(optee);
> +	if (protm)
> +		pool = static_protmem_pool_init(optee);
> +	if (dyn_protm && IS_ERR(pool))
> +		pool = optee_protmem_alloc_dyn_pool(optee, heap_id);
>  	if (IS_ERR(pool))
>  		return PTR_ERR(pool);
>  
> -- 
> 2.43.0
> 

