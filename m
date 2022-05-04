Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBF385198F5
	for <lists+linux-media@lfdr.de>; Wed,  4 May 2022 09:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234304AbiEDH5I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 03:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232107AbiEDH5G (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 03:57:06 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D94BF1573D
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 00:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651650810; x=1683186810;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ksqqybrEXl+WyMR45MFUQyWR3/Roj6hKjeYCpo3a45w=;
  b=OjWD8RxNL3rv0Fw6pPad6EfzcEuAMofgdJ4+Za9CS4gb/8Ds6xCmcKFo
   OUoj/SF80sZVh4Xw3uCusqUFrqQPWEJuq3q3aQaocbbztIKlwHvQ6WTkx
   W3OI0hStjWh/ft6tCL9g9uQXencZlzrof1R8JVaV14kJq/xLP16GcVVb1
   kHBHUqZHuhLx//uowRBd1Mhc5gxO0M8YI/VPK4Mux7td8PekU3N2Zry56
   KhIBh1quKQNDhSw6RpwGq9r5w/+GTArCwrGg8I69PXWndUeE8rIH11lMF
   g0b77Ua2am1MFWDNkYYucQsiqbZwK3bHlmaD6y2n3MfmvastTi8QFhAGY
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="266537892"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; 
   d="scan'208";a="266537892"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 00:53:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; 
   d="scan'208";a="664368392"
Received: from gidaly-mobl1.ger.corp.intel.com (HELO [10.213.236.183]) ([10.213.236.183])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 00:53:27 -0700
Message-ID: <c3e168cb-fbd5-07b7-f927-ac9e5e73b1e8@linux.intel.com>
Date:   Wed, 4 May 2022 08:53:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 02/15] dma-buf: introduce user fence support
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        daniel@ffwll.ch, jason@jlekstrand.net, daniels@collabora.com,
        skhawaja@google.com, maad.aldabagh@amd.com, sergemetral@google.com,
        sumit.semwal@linaro.org, gustavo@padovan.org,
        Felix.Kuehling@amd.com, alexander.deucher@amd.com,
        tzimmermann@suse.de, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220502163722.3957-1-christian.koenig@amd.com>
 <20220502163722.3957-3-christian.koenig@amd.com>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220502163722.3957-3-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 02/05/2022 17:37, Christian König wrote:
> Start introducing a new part of the framework for handling user fences.
> 
> In strict opposition to normal fences user fences don't reliable finish in

reliably

> a fixed amount of time and therefore can't be used as dependency in memory
> management.
> 
> Because of this user fences are marked with DMA_FENCE_FLAG_USER. Lockdep
> is checked that we can at least fault user pages when we check them for
> signaling.
> 
> This patch also adds a flag to dma_fence_get_stub() so that we can
> retrieve a signaled user fence. This can be used together with lockdep to
> test the handling in code path supporting user fences.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence-unwrap.c            |  4 +--
>   drivers/dma-buf/dma-fence.c                   | 31 ++++++++++++-------
>   drivers/dma-buf/st-dma-fence.c                |  2 +-
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c      |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  4 +--
>   drivers/gpu/drm/drm_syncobj.c                 | 10 +++---
>   include/linux/dma-fence.h                     | 17 +++++++++-
>   9 files changed, 49 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
> index c9becc74896d..87ee2efced10 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -76,7 +76,7 @@ struct dma_fence *__dma_fence_merge(unsigned int num_fences,
>   	}
>   
>   	if (count == 0)
> -		return dma_fence_get_stub();
> +		return dma_fence_get_stub(false);
>   
>   	if (count > INT_MAX)
>   		return NULL;
> @@ -129,7 +129,7 @@ struct dma_fence *__dma_fence_merge(unsigned int num_fences,
>   	} while (tmp);
>   
>   	if (count == 0) {
> -		tmp = dma_fence_get_stub();
> +		tmp = dma_fence_get_stub(false);
>   		goto return_tmp;
>   	}
>   
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 066400ed8841..52873f5eaeba 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -26,6 +26,7 @@ EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
>   
>   static DEFINE_SPINLOCK(dma_fence_stub_lock);
>   static struct dma_fence dma_fence_stub;
> +static struct dma_fence dma_fence_user_stub;
>   
>   /*
>    * fence context counter: each execution context should have its own
> @@ -123,24 +124,28 @@ static const struct dma_fence_ops dma_fence_stub_ops = {
>   
>   /**
>    * dma_fence_get_stub - return a signaled fence
> + * @user: if true the returned fence is an user fence
>    *
> - * Return a stub fence which is already signaled. The fence's
> - * timestamp corresponds to the first time after boot this
> - * function is called.
> + * Return a stub fence which is already signaled. The fence's timestamp
> + * corresponds to the first time after boot this function is called. If @user is
> + * true an user fence is returned which can be used with lockdep to test user
> + * fence saveness in a code path.
>    */
> -struct dma_fence *dma_fence_get_stub(void)
> +struct dma_fence *dma_fence_get_stub(bool user)
>   {
> +	struct dma_fence *fence = user ? &dma_fence_stub : &dma_fence_user_stub;
> +
>   	spin_lock(&dma_fence_stub_lock);
> -	if (!dma_fence_stub.ops) {
> -		dma_fence_init(&dma_fence_stub,
> -			       &dma_fence_stub_ops,
> -			       &dma_fence_stub_lock,
> +	if (!fence->ops) {
> +		dma_fence_init(fence, &dma_fence_stub_ops, &dma_fence_stub_lock,
>   			       0, 0);
> -		dma_fence_signal_locked(&dma_fence_stub);
> +		if (user)
> +			set_bit(DMA_FENCE_FLAG_USER, &fence->flags);
> +		dma_fence_signal_locked(fence);
>   	}
>   	spin_unlock(&dma_fence_stub_lock);
>   
> -	return dma_fence_get(&dma_fence_stub);
> +	return dma_fence_get(fence);
>   }
>   EXPORT_SYMBOL(dma_fence_get_stub);
>   
> @@ -497,8 +502,9 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
>   		return -EINVAL;
>   
>   	might_sleep();
> -
>   	__dma_fence_might_wait();
> +	if (test_bit(DMA_FENCE_FLAG_USER, &fence->flags))
> +		might_fault();
>   
>   	trace_dma_fence_wait_start(fence);
>   	if (fence->ops->wait)
> @@ -870,6 +876,9 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
>   	for (i = 0; i < count; ++i) {
>   		struct dma_fence *fence = fences[i];
>   
> +		if (test_bit(DMA_FENCE_FLAG_USER, &fence->flags))
> +			might_fault();
> +
>   		cb[i].task = current;
>   		if (dma_fence_add_callback(fence, &cb[i].base,
>   					   dma_fence_default_wait_cb)) {
> diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
> index c8a12d7ad71a..50f757f75645 100644
> --- a/drivers/dma-buf/st-dma-fence.c
> +++ b/drivers/dma-buf/st-dma-fence.c
> @@ -412,7 +412,7 @@ static int test_stub(void *arg)
>   	int i;
>   
>   	for (i = 0; i < ARRAY_SIZE(f); i++) {
> -		f[i] = dma_fence_get_stub();
> +		f[i] = dma_fence_get_stub((i % 2) == 1);
>   		if (!dma_fence_is_signaled(f[i])) {
>   			pr_err("Obtained unsignaled stub fence!\n");
>   			goto err;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 64ac4f8f49be..541c59635c34 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -263,7 +263,7 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
>   	/* TODO: Instead of block before we should use the fence of the page
>   	 * table update and TLB flush here directly.
>   	 */
> -	replacement = dma_fence_get_stub();
> +	replacement = dma_fence_get_stub(false);
>   	dma_resv_replace_fences(bo->tbo.base.resv, ef->base.context,
>   				replacement, DMA_RESV_USAGE_READ);
>   	dma_fence_put(replacement);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index a28b7947a034..95eeab527ca9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1399,7 +1399,7 @@ int amdgpu_cs_fence_to_handle_ioctl(struct drm_device *dev, void *data,
>   		return PTR_ERR(fence);
>   
>   	if (!fence)
> -		fence = dma_fence_get_stub();
> +		fence = dma_fence_get_stub(false);
>   
>   	switch (info->in.what) {
>   	case AMDGPU_FENCE_TO_HANDLE_GET_SYNCOBJ:
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> index 7f33ae87cb41..73165f387f3b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> @@ -193,7 +193,7 @@ int amdgpu_ring_init(struct amdgpu_device *adev, struct amdgpu_ring *ring,
>   		adev->rings[ring->idx] = ring;
>   		ring->num_hw_submission = sched_hw_submission;
>   		ring->sched_score = sched_score;
> -		ring->vmid_wait = dma_fence_get_stub();
> +		ring->vmid_wait = dma_fence_get_stub(false);
>   		r = amdgpu_fence_driver_init_ring(ring);
>   		if (r)
>   			return r;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 7e5cc8323329..e5c8e72a9485 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -1689,7 +1689,7 @@ int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
>   	}
>   
>   	if (!unlocked && !dma_fence_is_signaled(vm->last_unlocked)) {
> -		struct dma_fence *tmp = dma_fence_get_stub();
> +		struct dma_fence *tmp = dma_fence_get_stub(false);
>   
>   		amdgpu_bo_fence(vm->root.bo, vm->last_unlocked, true);
>   		swap(vm->last_unlocked, tmp);
> @@ -2905,7 +2905,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm)
>   	else
>   		vm->update_funcs = &amdgpu_vm_sdma_funcs;
>   	vm->last_update = NULL;
> -	vm->last_unlocked = dma_fence_get_stub();
> +	vm->last_unlocked = dma_fence_get_stub(false);
>   
>   	mutex_init(&vm->eviction_lock);
>   	vm->evicting = false;
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 7e48dcd1bee4..5a961ea90a35 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -255,7 +255,7 @@ static void drm_syncobj_fence_add_wait(struct drm_syncobj *syncobj,
>   		dma_fence_put(fence);
>   		list_add_tail(&wait->node, &syncobj->cb_list);
>   	} else if (!fence) {
> -		wait->fence = dma_fence_get_stub();
> +		wait->fence = dma_fence_get_stub(false);
>   	} else {
>   		wait->fence = fence;
>   	}
> @@ -411,7 +411,7 @@ int drm_syncobj_find_fence(struct drm_file *file_private,
>   			 * signalled, use a new fence instead.
>   			 */
>   			if (!*fence)
> -				*fence = dma_fence_get_stub();
> +				*fence = dma_fence_get_stub(false);
>   
>   			goto out;
>   		}
> @@ -1000,7 +1000,7 @@ static void syncobj_wait_syncobj_func(struct drm_syncobj *syncobj,
>   		dma_fence_put(fence);
>   		return;
>   	} else if (!fence) {
> -		wait->fence = dma_fence_get_stub();
> +		wait->fence = dma_fence_get_stub(false);
>   	} else {
>   		wait->fence = fence;
>   	}
> @@ -1067,7 +1067,7 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>   		if (fence)
>   			entries[i].fence = fence;
>   		else
> -			entries[i].fence = dma_fence_get_stub();
> +			entries[i].fence = dma_fence_get_stub(false);
>   
>   		if ((flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE) ||
>   		    dma_fence_is_signaled(entries[i].fence)) {
> @@ -1472,7 +1472,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>   	}
>   
>   	for (i = 0; i < args->count_handles; i++) {
> -		struct dma_fence *fence = dma_fence_get_stub();
> +		struct dma_fence *fence = dma_fence_get_stub(false);
>   
>   		drm_syncobj_add_point(syncobjs[i], chains[i],
>   				      fence, points[i]);
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index afea82ec5946..be96687d31d8 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -99,6 +99,16 @@ enum dma_fence_flag_bits {
>   	DMA_FENCE_FLAG_SIGNALED_BIT,
>   	DMA_FENCE_FLAG_TIMESTAMP_BIT,
>   	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> +
> +	/**
> +	 * @DMA_FENCE_FLAG_USER:
> +	 *
> +	 * Indicates an user fence. User fences are not guaranteed to signal in
> +	 * a finite amount of time. Because of this it is not allowed to wait for user
> +	 * fences with any lock held nor depend the signaling of none user
> +	 * fences on them.
> +	 */
> +	DMA_FENCE_FLAG_USER,
>   	DMA_FENCE_FLAG_DRIVER, /* must always be last member */
>   };
>   
> @@ -398,6 +408,8 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence);
>   static inline bool
>   dma_fence_is_signaled_locked(struct dma_fence *fence)
>   {
> +	WARN_ON(test_bit(DMA_FENCE_FLAG_USER, &fence->flags));
> +
>   	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>   		return true;
>   
> @@ -428,6 +440,9 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>   static inline bool
>   dma_fence_is_signaled(struct dma_fence *fence)
>   {
> +	if (test_bit(DMA_FENCE_FLAG_USER, &fence->flags))
> +		might_fault();

Why this one can fault and the dma_fence_signal_locked cannot? I mean 
obviosuly it must not in the locked section, but how do signalling 
callbacks know the context of the caller?

This maybe ties back to the issue I don't think I ever found an 
explanation to - why "is signal" helpers actually need (or want?) to do 
the signalling itself, and are therefore hit also with the signalling 
annotations?

Regards,

Tvrtko

> +
>   	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>   		return true;
>   
> @@ -583,7 +598,7 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
>   	return ret < 0 ? ret : 0;
>   }
>   
> -struct dma_fence *dma_fence_get_stub(void);
> +struct dma_fence *dma_fence_get_stub(bool user);
>   struct dma_fence *dma_fence_allocate_private_stub(void);
>   u64 dma_fence_context_alloc(unsigned num);
>   
