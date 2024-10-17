Return-Path: <linux-media+bounces-19795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 975039A2069
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 13:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FC34282BED
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 11:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACEB1D9660;
	Thu, 17 Oct 2024 11:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wdr0AZNn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BBF259C
	for <linux-media@vger.kernel.org>; Thu, 17 Oct 2024 11:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729162845; cv=none; b=kc0HcVRbLpHaKWgUNUlKPN6LIK/W1hFSibWHfJvcdtfJfR2d8Ho9AKScNDLmOyP+RpIjizpdTRaNoK2aWl1BYsfA9xCND9/4Suf3haHV1587iS/rO/ixC27Er5uAh1WCdgtAz9Ir6dBgUmbbUTY43f52MvNK5QY14XiayBKiz5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729162845; c=relaxed/simple;
	bh=Tw2O507qDyj5T4Ew0nr4flfNKi/+FS+aYSJc+22Me/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f8yDoGezOv/I//dLOe0tdCjOgoZIKcfBSWOwePPsHu5pIXfDf8oFFIP9c2AbHHfGm1ilGux0cy0lww+Cr+5PnztAfESNN+nW2c+JqbVgik4U9DyiAcKjFWDYxMgcLinZWtDH6o5VE/8n3KC0DeBQsK5u0sAjlGVlySkwPSrsW5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wdr0AZNn; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4a47240d31aso223512137.3
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2024 04:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729162841; x=1729767641; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dzueIzrbpWQAQzIPzKgcuzvlN5AJYKxxLdrxhltbeaY=;
        b=Wdr0AZNn8lsG54z6WsSwM6XvtEMDjAsp383ttAbAihTP8uhb8uhoYft5Evo51sFXmW
         AQsa0VbKE6Wh7ufb581JlQ3gCl/9IGg0EMo7FYmWJfr3c5nzWEdyaBMWaCDDMklr9Mzw
         wGncBR7uCX/MVbFgjeEtdkYMkiXFg2JlC2hIPWa1Rd713e1tcAJDGtM+BgKeGdbamGMP
         +EEL8tCVSeosc+rdIZAS5UEBc/Ltu4PQKbmbZI3rDL0f8dqVS4cMADLcEkLvvX4z11IF
         KcE/fs0j5ZcN74jh065Lwpkx7LlOcGYJu/FlkPtohM1l3LcyFOk+ezz6HFp4MlgDoy/M
         hbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729162841; x=1729767641;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dzueIzrbpWQAQzIPzKgcuzvlN5AJYKxxLdrxhltbeaY=;
        b=gFxwMhAe1bzAgSYvXoffHV5CV0jmLorTbLWVLfANHpOZ7KDzkVIZlZTiSnxvYe0KG6
         8bUqZUI0B4jILSh5CXIpZfGNIc/p+N1nh4OEMJW7sGATO7Dk+coS3uvr+Z4ljOi8LRnk
         OWfdAWwDE79wCF0+hV6nO3Z64D9AQAhTOn6XPe49TCDepqNP8JKviVQCCG5r+2c1rtwt
         XNT2XP+23Vu/Mv33r7V/XyqBECbnf5yb5gNJd9EBSU9gY+j+z5ocRv0j60Gf3H0HUWPW
         D21r2NMRkHhT1cYB5JvRZc/aKZVS8JZRTCCvFW0L0DRb2udFCQJhnmHdSgvDsHa87q0S
         3BOw==
X-Forwarded-Encrypted: i=1; AJvYcCWRI60+pqX1vBe6rfMW63IPlJFc4unzTRtBCTxBvPQPl9MvCW4/joIjYcUavR7mp4XcuYakO5zz+wI++g==@vger.kernel.org
X-Gm-Message-State: AOJu0YysiAyVbgBNBzu3uckrUSC8Q85RLkyWigqhsR8aUrEUtJw5MVFw
	49+eYWLngPr5n9shajsaaZ8xigChS50Uq4nNQVlcKBFHsVmlTThs2MuHA8CRkSeJS6n0vPjdNl0
	bQD8VbdweC7lCdk5dpr9PbYW0eD/11W4B6o5/mw==
X-Google-Smtp-Source: AGHT+IFIkSv1zq1QUikiociz6eI2jMdfdZm0OR2khmhrLpWMG/LnXM7lEBRD+jifjqruQfchix8Rv601CB8w9YyRG6g=
X-Received: by 2002:a05:6102:41a1:b0:4a3:ed09:4746 with SMTP id
 ada2fe7eead31-4a5b57946e1mr6309322137.0.1729162840664; Thu, 17 Oct 2024
 04:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015101716.740829-1-jens.wiklander@linaro.org> <20241015101716.740829-3-jens.wiklander@linaro.org>
In-Reply-To: <20241015101716.740829-3-jens.wiklander@linaro.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 17 Oct 2024 16:30:29 +0530
Message-ID: <CAFA6WYMFys_woiF3dzwaXjMy7Y-gTLgHE0PBZtEf6jH-mkc40g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/2] optee: support restricted memory allocation
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

Hi Jens,

On Tue, 15 Oct 2024 at 15:47, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>
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
>  drivers/tee/optee/core.c          | 21 +++++++++++++++
>  drivers/tee/optee/optee_private.h |  6 +++++
>  drivers/tee/optee/optee_smc.h     | 35 ++++++++++++++++++++++++
>  drivers/tee/optee/smc_abi.c       | 45 ++++++++++++++++++++++++++++---
>  4 files changed, 104 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> index 39e688d4e974..b6d5cbc6728d 100644
> --- a/drivers/tee/optee/core.c
> +++ b/drivers/tee/optee/core.c
> @@ -95,6 +95,25 @@ void optee_release_supp(struct tee_context *ctx)
>         optee_supp_release(&optee->supp);
>  }
>
> +int optee_rstmem_alloc(struct tee_context *ctx, struct tee_shm *shm,
> +                      u32 flags, size_t size)
> +{
> +       struct optee *optee = tee_get_drvdata(ctx->teedev);
> +
> +       if (!optee->sdp_pool)
> +               return -EINVAL;
> +       if (flags != TEE_IOC_FLAG_SECURE_VIDEO)
> +               return -EINVAL;
> +       return optee->sdp_pool->ops->alloc(optee->sdp_pool, shm, size, 0);
> +}
> +
> +void optee_rstmem_free(struct tee_context *ctx, struct tee_shm *shm)
> +{
> +       struct optee *optee = tee_get_drvdata(ctx->teedev);
> +
> +       optee->sdp_pool->ops->free(optee->sdp_pool, shm);
> +}
> +
>  void optee_remove_common(struct optee *optee)
>  {
>         /* Unregister OP-TEE specific client devices on TEE bus */
> @@ -111,6 +130,8 @@ void optee_remove_common(struct optee *optee)
>         tee_device_unregister(optee->teedev);
>
>         tee_shm_pool_free(optee->pool);
> +       if (optee->sdp_pool)
> +               optee->sdp_pool->ops->destroy_pool(optee->sdp_pool);
>         optee_supp_uninit(&optee->supp);
>         mutex_destroy(&optee->call_queue.mutex);
>  }
> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
> index 424898cdc4e9..1f6b2cc992a9 100644
> --- a/drivers/tee/optee/optee_private.h
> +++ b/drivers/tee/optee/optee_private.h
> @@ -200,6 +200,7 @@ struct optee_ops {
>   * @notif:             notification synchronization struct
>   * @supp:              supplicant synchronization struct for RPC to supplicant
>   * @pool:              shared memory pool
> + * @sdp_pool:          restricted memory pool for secure data path
>   * @rpc_param_count:   If > 0 number of RPC parameters to make room for
>   * @scan_bus_done      flag if device registation was already done.
>   * @scan_bus_work      workq to scan optee bus and register optee drivers
> @@ -218,6 +219,7 @@ struct optee {
>         struct optee_notif notif;
>         struct optee_supp supp;
>         struct tee_shm_pool *pool;
> +       struct tee_shm_pool *sdp_pool;
>         unsigned int rpc_param_count;
>         bool   scan_bus_done;
>         struct work_struct scan_bus_work;
> @@ -340,6 +342,10 @@ void optee_rpc_cmd(struct tee_context *ctx, struct optee *optee,
>  int optee_do_bottom_half(struct tee_context *ctx);
>  int optee_stop_async_notif(struct tee_context *ctx);
>
> +int optee_rstmem_alloc(struct tee_context *ctx, struct tee_shm *shm,
> +                      u32 flags, size_t size);
> +void optee_rstmem_free(struct tee_context *ctx, struct tee_shm *shm);
> +
>  /*
>   * Small helpers
>   */
> diff --git a/drivers/tee/optee/optee_smc.h b/drivers/tee/optee/optee_smc.h
> index 7d9fa426505b..c3b8a1c204af 100644
> --- a/drivers/tee/optee/optee_smc.h
> +++ b/drivers/tee/optee/optee_smc.h
> @@ -234,6 +234,39 @@ struct optee_smc_get_shm_config_result {
>         unsigned long settings;
>  };
>
> +/*
> + * Get Secure Data Path memory config
> + *
> + * Returns the Secure Data Path memory config.
> + *
> + * Call register usage:
> + * a0   SMC Function ID, OPTEE_SMC_GET_SDP_CONFIG
> + * a2-6 Not used, must be zero
> + * a7   Hypervisor Client ID register
> + *
> + * Have config return register usage:
> + * a0   OPTEE_SMC_RETURN_OK
> + * a1   Physical address of start of SDP memory
> + * a2   Size of SDP memory
> + * a3   Not used
> + * a4-7 Preserved
> + *
> + * Not available register usage:
> + * a0   OPTEE_SMC_RETURN_ENOTAVAIL
> + * a1-3 Not used
> + * a4-7 Preserved
> + */
> +#define OPTEE_SMC_FUNCID_GET_SDP_CONFIG        20
> +#define OPTEE_SMC_GET_SDP_CONFIG \
> +       OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_GET_SDP_CONFIG)
> +
> +struct optee_smc_get_sdp_config_result {
> +       unsigned long status;
> +       unsigned long start;
> +       unsigned long size;
> +       unsigned long flags;
> +};
> +
>  /*
>   * Exchanges capabilities between normal world and secure world
>   *
> @@ -278,6 +311,8 @@ struct optee_smc_get_shm_config_result {
>  #define OPTEE_SMC_SEC_CAP_ASYNC_NOTIF          BIT(5)
>  /* Secure world supports pre-allocating RPC arg struct */
>  #define OPTEE_SMC_SEC_CAP_RPC_ARG              BIT(6)
> +/* Secure world supports Secure Data Path */
> +#define OPTEE_SMC_SEC_CAP_SDP                  BIT(7)
>
>  #define OPTEE_SMC_FUNCID_EXCHANGE_CAPABILITIES 9
>  #define OPTEE_SMC_EXCHANGE_CAPABILITIES \
> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> index 844285d4f03c..05068c70c791 100644
> --- a/drivers/tee/optee/smc_abi.c
> +++ b/drivers/tee/optee/smc_abi.c
> @@ -1164,6 +1164,8 @@ static void optee_get_version(struct tee_device *teedev,
>                 v.gen_caps |= TEE_GEN_CAP_REG_MEM;
>         if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_MEMREF_NULL)
>                 v.gen_caps |= TEE_GEN_CAP_MEMREF_NULL;
> +       if (optee->sdp_pool)
> +               v.gen_caps |= TEE_GEN_CAP_RSTMEM;
>         *vers = v;
>  }
>
> @@ -1186,6 +1188,8 @@ static const struct tee_driver_ops optee_clnt_ops = {
>         .cancel_req = optee_cancel_req,
>         .shm_register = optee_shm_register,
>         .shm_unregister = optee_shm_unregister,
> +       .rstmem_alloc = optee_rstmem_alloc,
> +       .rstmem_free = optee_rstmem_free,
>  };
>
>  static const struct tee_desc optee_clnt_desc = {
> @@ -1202,6 +1206,8 @@ static const struct tee_driver_ops optee_supp_ops = {
>         .supp_send = optee_supp_send,
>         .shm_register = optee_shm_register_supp,
>         .shm_unregister = optee_shm_unregister_supp,
> +       .rstmem_alloc = optee_rstmem_alloc,
> +       .rstmem_free = optee_rstmem_free,
>  };
>
>  static const struct tee_desc optee_supp_desc = {
> @@ -1582,6 +1588,32 @@ static inline int optee_load_fw(struct platform_device *pdev,
>  }
>  #endif
>
> +static int optee_sdp_pool_init(struct optee *optee)
> +{
> +       struct tee_shm_pool *pool;
> +       union {
> +               struct arm_smccc_res smccc;
> +               struct optee_smc_get_sdp_config_result result;
> +       } res;
> +
> +       if (!(optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP))
> +               return 0;
> +
> +       optee->smc.invoke_fn(OPTEE_SMC_GET_SDP_CONFIG, 0, 0, 0, 0, 0, 0, 0,
> +                            &res.smccc);

IMHO, to put more weight on this proposal we should also include
allocation from the kernel CMA pool alongside the reserved restricted
memory pool. The implementation would be quite similar to how we
support dynamic SHM based on platform specific capability:
OPTEE_SMC_SEC_CAP_DYNAMIC_SHM. We can have a similar capability for
dynamic restricted memory as: OPTEE_SMC_SEC_CAP_DYNAMIC_RSTMEM.

The major reason to support it is to allow mediatek use-case [1] of
restricting memory dynamically which gets allocated from the CMA pool.
Although, it won't be something that we can test on Qemu from a
hardware enforcement perspective, at least we can test it on Qemu
conceptually. Thoughts?

[1] https://lore.kernel.org/linux-arm-kernel/20240515112308.10171-9-yong.wu@mediatek.com/

-Sumit

> +       if (res.result.status != OPTEE_SMC_RETURN_OK) {
> +               pr_err("Secure Data Path service not available\n");
> +               return 0;
> +       }
> +
> +       pool = tee_rstmem_gen_pool_alloc(res.result.start, res.result.size);
> +       if (IS_ERR(pool))
> +               return PTR_ERR(pool);
> +       optee->sdp_pool = pool;
> +
> +       return 0;
> +}
> +
>  static int optee_probe(struct platform_device *pdev)
>  {
>         optee_invoke_fn *invoke_fn;
> @@ -1677,7 +1709,7 @@ static int optee_probe(struct platform_device *pdev)
>         optee = kzalloc(sizeof(*optee), GFP_KERNEL);
>         if (!optee) {
>                 rc = -ENOMEM;
> -               goto err_free_pool;
> +               goto err_free_shm_pool;
>         }
>
>         optee->ops = &optee_ops;
> @@ -1685,10 +1717,14 @@ static int optee_probe(struct platform_device *pdev)
>         optee->smc.sec_caps = sec_caps;
>         optee->rpc_param_count = rpc_param_count;
>
> +       rc = optee_sdp_pool_init(optee);
> +       if (rc)
> +               goto err_free_optee;
> +
>         teedev = tee_device_alloc(&optee_clnt_desc, NULL, pool, optee);
>         if (IS_ERR(teedev)) {
>                 rc = PTR_ERR(teedev);
> -               goto err_free_optee;
> +               goto err_sdp_pool_uninit;
>         }
>         optee->teedev = teedev;
>
> @@ -1786,9 +1822,12 @@ static int optee_probe(struct platform_device *pdev)
>         tee_device_unregister(optee->supp_teedev);
>  err_unreg_teedev:
>         tee_device_unregister(optee->teedev);
> +err_sdp_pool_uninit:
> +       if (optee->sdp_pool)
> +               optee->sdp_pool->ops->destroy_pool(optee->sdp_pool);
>  err_free_optee:
>         kfree(optee);
> -err_free_pool:
> +err_free_shm_pool:
>         tee_shm_pool_free(pool);
>         if (memremaped_shm)
>                 memunmap(memremaped_shm);
> --
> 2.43.0
>

