Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F197C3F59B5
	for <lists+linux-media@lfdr.de>; Tue, 24 Aug 2021 10:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234997AbhHXINO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Aug 2021 04:13:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234936AbhHXINN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Aug 2021 04:13:13 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47825C061757
        for <linux-media@vger.kernel.org>; Tue, 24 Aug 2021 01:12:29 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id g135so2903662wme.5
        for <linux-media@vger.kernel.org>; Tue, 24 Aug 2021 01:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=5TlPvtMSTybxbMv0JTA/P3ma0mYuHcljD7aP7GqZqlQ=;
        b=kMBB3z91YbVbX/JHfl5F8oF+HtBWNwP7jK6c9TumOix8RC/mZ8Koy+1pWgNdbIylFB
         lJDr1eioqe1gyahKorAQmbYRVoQwBWd6+I6v+31fs/RX7tkN9OMpOxbDUaBldx7SyeV4
         LN2zuG0nuao8dLWiMNsWBhurjr6GiibSQl9ws0b+G7c6x2vE6z4EgkeW/jNcJNa6Jti6
         SAIbJz9UurpNss0AR/WHYpHFvCSfU6MYsB7wApN5riPrYuPo5rVVcNwbKY0uMQNaMhCk
         YryAn7pVArQKu4fEaHINS87be1thNvxlSf8CSOewARCeXtc5bUjgmRGgDfE/JNvVq3pc
         f5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=5TlPvtMSTybxbMv0JTA/P3ma0mYuHcljD7aP7GqZqlQ=;
        b=t6MrvS+J7BHn31i8imDlvrBBA7bUZQ5Nc1F22kbxZT9WwbGXggGFBY0984cfH7hwbN
         vK/rSa4HgIwLZ3aZJRul1dCexi49G2KnLS2Edd9o5jyuQOATiq/ONvTOjOytiqBYe1yv
         v/zGfyEnzgPpsxjdAIwF8ySImWTVqZLEqqahPXYofqBjYjT6gxaiH3ZxiA1DY8hz5ujg
         c2iD+9wARo9Sfnl6fcr9SZpeM+sky+4YxPfadsK5BKmDGSMuySnvInFScPpPv/iX1wND
         Vppfsz7vCWB9/kDSfqziAm999X2zdAP5dNOy+FORQ8ak3PphOF8t38SCvbhFBr2snTo+
         KwyQ==
X-Gm-Message-State: AOAM532U1hm5FMmgeWvMoBJcWnJ5juEKPlWNtqw4k0oJi4muKAdWkUv8
        0SJK0GmWKFjhX6KTbYusX38=
X-Google-Smtp-Source: ABdhPJweHyRCwYvrWskmr+1eNvP1lrnMQtSpENx/wI/OVJV2iQVCtSSO6DB/ds9/MTLQwRkerDYeTw==
X-Received: by 2002:a7b:c148:: with SMTP id z8mr2862262wmi.147.1629792747617;
        Tue, 24 Aug 2021 01:12:27 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id k12sm18117771wrd.75.2021.08.24.01.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 01:12:26 -0700 (PDT)
Subject: Re: [PATCH 1/2] dma-buf: nuke DMA_FENCE_TRACE macros v2
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To:     hridya@google.com, john.stultz@linaro.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        gustavo@padovan.org, linux-media@vger.kernel.org,
        adelva@google.com, sspatil@google.com, daniel@ffwll.ch
References: <20210818105443.1578-1-christian.koenig@amd.com>
Message-ID: <015fd5ed-9255-9c28-44f3-3c8dde90ebad@gmail.com>
Date:   Tue, 24 Aug 2021 10:12:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818105443.1578-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just a gentle ping. Daniel any more comments on this?

I'm not sure if the second patch will cause trouble with any unit test, 
but I'm willing to try it. We can always trivial revert it.

Thanks,
Christian.

Am 18.08.21 um 12:54 schrieb Christian König:
> Only the DRM GPU scheduler, radeon and amdgpu where using them and they depend
> on a non existing config option to actually emit some code.
>
> v2: keep the signal path as is for now
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 10 +---------
>   drivers/gpu/drm/radeon/radeon_fence.c     | 24 ++++-------------------
>   drivers/gpu/drm/scheduler/sched_fence.c   | 18 ++---------------
>   include/linux/dma-fence.h                 | 22 ---------------------
>   4 files changed, 7 insertions(+), 67 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 0b1c48590c43..c65994e382bd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -246,7 +246,6 @@ bool amdgpu_fence_process(struct amdgpu_ring *ring)
>   	struct amdgpu_fence_driver *drv = &ring->fence_drv;
>   	struct amdgpu_device *adev = ring->adev;
>   	uint32_t seq, last_seq;
> -	int r;
>   
>   	do {
>   		last_seq = atomic_read(&ring->fence_drv.last_seq);
> @@ -278,12 +277,7 @@ bool amdgpu_fence_process(struct amdgpu_ring *ring)
>   		if (!fence)
>   			continue;
>   
> -		r = dma_fence_signal(fence);
> -		if (!r)
> -			DMA_FENCE_TRACE(fence, "signaled from irq context\n");
> -		else
> -			BUG();
> -
> +		dma_fence_signal(fence);
>   		dma_fence_put(fence);
>   		pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>   		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> @@ -639,8 +633,6 @@ static bool amdgpu_fence_enable_signaling(struct dma_fence *f)
>   	if (!timer_pending(&ring->fence_drv.fallback_timer))
>   		amdgpu_fence_schedule_fallback(ring);
>   
> -	DMA_FENCE_TRACE(&fence->base, "armed on ring %i!\n", ring->idx);
> -
>   	return true;
>   }
>   
> diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
> index 18f2c2e0dfb3..3f351d222cbb 100644
> --- a/drivers/gpu/drm/radeon/radeon_fence.c
> +++ b/drivers/gpu/drm/radeon/radeon_fence.c
> @@ -176,18 +176,11 @@ static int radeon_fence_check_signaled(wait_queue_entry_t *wait, unsigned mode,
>   	 */
>   	seq = atomic64_read(&fence->rdev->fence_drv[fence->ring].last_seq);
>   	if (seq >= fence->seq) {
> -		int ret = dma_fence_signal_locked(&fence->base);
> -
> -		if (!ret)
> -			DMA_FENCE_TRACE(&fence->base, "signaled from irq context\n");
> -		else
> -			DMA_FENCE_TRACE(&fence->base, "was already signaled\n");
> -
> +		dma_fence_signal_locked(&fence->base);
>   		radeon_irq_kms_sw_irq_put(fence->rdev, fence->ring);
>   		__remove_wait_queue(&fence->rdev->fence_queue, &fence->fence_wake);
>   		dma_fence_put(&fence->base);
> -	} else
> -		DMA_FENCE_TRACE(&fence->base, "pending\n");
> +	}
>   	return 0;
>   }
>   
> @@ -422,8 +415,6 @@ static bool radeon_fence_enable_signaling(struct dma_fence *f)
>   	fence->fence_wake.func = radeon_fence_check_signaled;
>   	__add_wait_queue(&rdev->fence_queue, &fence->fence_wake);
>   	dma_fence_get(f);
> -
> -	DMA_FENCE_TRACE(&fence->base, "armed on ring %i!\n", fence->ring);
>   	return true;
>   }
>   
> @@ -441,11 +432,7 @@ bool radeon_fence_signaled(struct radeon_fence *fence)
>   		return true;
>   
>   	if (radeon_fence_seq_signaled(fence->rdev, fence->seq, fence->ring)) {
> -		int ret;
> -
> -		ret = dma_fence_signal(&fence->base);
> -		if (!ret)
> -			DMA_FENCE_TRACE(&fence->base, "signaled from radeon_fence_signaled\n");
> +		dma_fence_signal(&fence->base);
>   		return true;
>   	}
>   	return false;
> @@ -550,7 +537,6 @@ long radeon_fence_wait_timeout(struct radeon_fence *fence, bool intr, long timeo
>   {
>   	uint64_t seq[RADEON_NUM_RINGS] = {};
>   	long r;
> -	int r_sig;
>   
>   	/*
>   	 * This function should not be called on !radeon fences.
> @@ -567,9 +553,7 @@ long radeon_fence_wait_timeout(struct radeon_fence *fence, bool intr, long timeo
>   		return r;
>   	}
>   
> -	r_sig = dma_fence_signal(&fence->base);
> -	if (!r_sig)
> -		DMA_FENCE_TRACE(&fence->base, "signaled from fence_wait\n");
> +	dma_fence_signal(&fence->base);
>   	return r;
>   }
>   
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index 69de2c76731f..3736746c47bd 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -50,26 +50,12 @@ static void __exit drm_sched_fence_slab_fini(void)
>   
>   void drm_sched_fence_scheduled(struct drm_sched_fence *fence)
>   {
> -	int ret = dma_fence_signal(&fence->scheduled);
> -
> -	if (!ret)
> -		DMA_FENCE_TRACE(&fence->scheduled,
> -				"signaled from irq context\n");
> -	else
> -		DMA_FENCE_TRACE(&fence->scheduled,
> -				"was already signaled\n");
> +	dma_fence_signal(&fence->scheduled);
>   }
>   
>   void drm_sched_fence_finished(struct drm_sched_fence *fence)
>   {
> -	int ret = dma_fence_signal(&fence->finished);
> -
> -	if (!ret)
> -		DMA_FENCE_TRACE(&fence->finished,
> -				"signaled from irq context\n");
> -	else
> -		DMA_FENCE_TRACE(&fence->finished,
> -				"was already signaled\n");
> +	dma_fence_signal(&fence->finished);
>   }
>   
>   static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 6ffb4b2c6371..4cc119ab272f 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -590,26 +590,4 @@ struct dma_fence *dma_fence_get_stub(void);
>   struct dma_fence *dma_fence_allocate_private_stub(void);
>   u64 dma_fence_context_alloc(unsigned num);
>   
> -#define DMA_FENCE_TRACE(f, fmt, args...) \
> -	do {								\
> -		struct dma_fence *__ff = (f);				\
> -		if (IS_ENABLED(CONFIG_DMA_FENCE_TRACE))			\
> -			pr_info("f %llu#%llu: " fmt,			\
> -				__ff->context, __ff->seqno, ##args);	\
> -	} while (0)
> -
> -#define DMA_FENCE_WARN(f, fmt, args...) \
> -	do {								\
> -		struct dma_fence *__ff = (f);				\
> -		pr_warn("f %llu#%llu: " fmt, __ff->context, __ff->seqno,\
> -			 ##args);					\
> -	} while (0)
> -
> -#define DMA_FENCE_ERR(f, fmt, args...) \
> -	do {								\
> -		struct dma_fence *__ff = (f);				\
> -		pr_err("f %llu#%llu: " fmt, __ff->context, __ff->seqno,	\
> -			##args);					\
> -	} while (0)
> -
>   #endif /* __LINUX_DMA_FENCE_H */

