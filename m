Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 508DC3F83FC
	for <lists+linux-media@lfdr.de>; Thu, 26 Aug 2021 10:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240500AbhHZI4h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Aug 2021 04:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbhHZI4g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Aug 2021 04:56:36 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AFA7C061757
        for <linux-media@vger.kernel.org>; Thu, 26 Aug 2021 01:55:49 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id v10so3839160wrd.4
        for <linux-media@vger.kernel.org>; Thu, 26 Aug 2021 01:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uvYP2dCmI1ZUBL+P6N9qqPEMMyNG7Xmed98Q3LoPhRc=;
        b=jv4Bz0Zaxnsu8hjawyPrPAoUn4/jYp4IFJUqRDi9BdtuLq5Df/VFFwla0qeWUTWgen
         AISCTl0BLkfMkjZpzCyfK6k2i22j38ulsJH7Ho90nLj7EP8tF6q7Cwmr5Dmc/vSmMPqV
         WecCQ5NY8yfZ7sG/GerTWaZivj8Dz28n99H7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uvYP2dCmI1ZUBL+P6N9qqPEMMyNG7Xmed98Q3LoPhRc=;
        b=G+VbU65q2NreMgUd+7S5JrJGwOW612W0IHNOuz3oVfOvhBUEVt43Ht/hAxQdPICHo4
         NIxwU1qaiVEQlBZcMKKXtMXKA1HYaPkSw8Nv7/0sOf1a7CBZxh9PTGkqRYklRmv6GD7T
         j2LT5cyJ5MF5INDpoHzAIDkDKfIRIvZbiWRb6t7PhrDZLQMC1SUZJ55ZzSEoW7ZuMHDB
         012eSqhR3tG6m1tw9gCR6xp3rD2WO1A7sr75jDik7ZN5bFwGbVZbHjhX15HkaLPsURka
         66gFuzleCbVilMg2UriSNDrpdtdi2sBZtXLt8er6wWR0iCauYWeZbIvbDF1nsuddD4Y6
         Q7qQ==
X-Gm-Message-State: AOAM53078LvSFJEi1UmatWHIdCF882xAzvgXYIo/zcjPUYKIlTkNfj4+
        fMXTf/S6dmPuz0dXVBzueo8GKUXwrcWnWA==
X-Google-Smtp-Source: ABdhPJzocerqJcZsWtTMJhS3BxNMKI6t/XE2uaviKPeY5HpRKnKDaqdKUEnvXnYbV1H3JH0+Q+V4zQ==
X-Received: by 2002:a5d:5983:: with SMTP id n3mr2548866wri.227.1629968147888;
        Thu, 26 Aug 2021 01:55:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id v21sm2608329wra.92.2021.08.26.01.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 01:55:47 -0700 (PDT)
Date:   Thu, 26 Aug 2021 10:55:45 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     hridya@google.com, john.stultz@linaro.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        gustavo@padovan.org, linux-media@vger.kernel.org,
        adelva@google.com, sspatil@google.com, daniel@ffwll.ch
Subject: Re: [PATCH 1/2] dma-buf: nuke DMA_FENCE_TRACE macros v2
Message-ID: <YSdXEaBDpijEBx/6@phenom.ffwll.local>
References: <20210818105443.1578-1-christian.koenig@amd.com>
 <015fd5ed-9255-9c28-44f3-3c8dde90ebad@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <015fd5ed-9255-9c28-44f3-3c8dde90ebad@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 24, 2021 at 10:12:24AM +0200, Christian K�nig wrote:
> Just a gentle ping. Daniel any more comments on this?

Still haven't seen a patch set to nuke the sw_sync igt tests. Otherwise
this is just going to cause fails and reboots in our ci (we reboot on
taints).

> I'm not sure if the second patch will cause trouble with any unit test, but
> I'm willing to try it. We can always trivial revert it.

See above, remove the igts and we should be fine I think. I don't think
there's any selftests or kselftests, but checking that should be a quick
grep at most.
-Daniel

> 
> Thanks,
> Christian.
> 
> Am 18.08.21 um 12:54 schrieb Christian K�nig:
> > Only the DRM GPU scheduler, radeon and amdgpu where using them and they depend
> > on a non existing config option to actually emit some code.
> > 
> > v2: keep the signal path as is for now
> > 
> > Signed-off-by: Christian K�nig <christian.koenig@amd.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 10 +---------
> >   drivers/gpu/drm/radeon/radeon_fence.c     | 24 ++++-------------------
> >   drivers/gpu/drm/scheduler/sched_fence.c   | 18 ++---------------
> >   include/linux/dma-fence.h                 | 22 ---------------------
> >   4 files changed, 7 insertions(+), 67 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > index 0b1c48590c43..c65994e382bd 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > @@ -246,7 +246,6 @@ bool amdgpu_fence_process(struct amdgpu_ring *ring)
> >   	struct amdgpu_fence_driver *drv = &ring->fence_drv;
> >   	struct amdgpu_device *adev = ring->adev;
> >   	uint32_t seq, last_seq;
> > -	int r;
> >   	do {
> >   		last_seq = atomic_read(&ring->fence_drv.last_seq);
> > @@ -278,12 +277,7 @@ bool amdgpu_fence_process(struct amdgpu_ring *ring)
> >   		if (!fence)
> >   			continue;
> > -		r = dma_fence_signal(fence);
> > -		if (!r)
> > -			DMA_FENCE_TRACE(fence, "signaled from irq context\n");
> > -		else
> > -			BUG();
> > -
> > +		dma_fence_signal(fence);
> >   		dma_fence_put(fence);
> >   		pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
> >   		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> > @@ -639,8 +633,6 @@ static bool amdgpu_fence_enable_signaling(struct dma_fence *f)
> >   	if (!timer_pending(&ring->fence_drv.fallback_timer))
> >   		amdgpu_fence_schedule_fallback(ring);
> > -	DMA_FENCE_TRACE(&fence->base, "armed on ring %i!\n", ring->idx);
> > -
> >   	return true;
> >   }
> > diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
> > index 18f2c2e0dfb3..3f351d222cbb 100644
> > --- a/drivers/gpu/drm/radeon/radeon_fence.c
> > +++ b/drivers/gpu/drm/radeon/radeon_fence.c
> > @@ -176,18 +176,11 @@ static int radeon_fence_check_signaled(wait_queue_entry_t *wait, unsigned mode,
> >   	 */
> >   	seq = atomic64_read(&fence->rdev->fence_drv[fence->ring].last_seq);
> >   	if (seq >= fence->seq) {
> > -		int ret = dma_fence_signal_locked(&fence->base);
> > -
> > -		if (!ret)
> > -			DMA_FENCE_TRACE(&fence->base, "signaled from irq context\n");
> > -		else
> > -			DMA_FENCE_TRACE(&fence->base, "was already signaled\n");
> > -
> > +		dma_fence_signal_locked(&fence->base);
> >   		radeon_irq_kms_sw_irq_put(fence->rdev, fence->ring);
> >   		__remove_wait_queue(&fence->rdev->fence_queue, &fence->fence_wake);
> >   		dma_fence_put(&fence->base);
> > -	} else
> > -		DMA_FENCE_TRACE(&fence->base, "pending\n");
> > +	}
> >   	return 0;
> >   }
> > @@ -422,8 +415,6 @@ static bool radeon_fence_enable_signaling(struct dma_fence *f)
> >   	fence->fence_wake.func = radeon_fence_check_signaled;
> >   	__add_wait_queue(&rdev->fence_queue, &fence->fence_wake);
> >   	dma_fence_get(f);
> > -
> > -	DMA_FENCE_TRACE(&fence->base, "armed on ring %i!\n", fence->ring);
> >   	return true;
> >   }
> > @@ -441,11 +432,7 @@ bool radeon_fence_signaled(struct radeon_fence *fence)
> >   		return true;
> >   	if (radeon_fence_seq_signaled(fence->rdev, fence->seq, fence->ring)) {
> > -		int ret;
> > -
> > -		ret = dma_fence_signal(&fence->base);
> > -		if (!ret)
> > -			DMA_FENCE_TRACE(&fence->base, "signaled from radeon_fence_signaled\n");
> > +		dma_fence_signal(&fence->base);
> >   		return true;
> >   	}
> >   	return false;
> > @@ -550,7 +537,6 @@ long radeon_fence_wait_timeout(struct radeon_fence *fence, bool intr, long timeo
> >   {
> >   	uint64_t seq[RADEON_NUM_RINGS] = {};
> >   	long r;
> > -	int r_sig;
> >   	/*
> >   	 * This function should not be called on !radeon fences.
> > @@ -567,9 +553,7 @@ long radeon_fence_wait_timeout(struct radeon_fence *fence, bool intr, long timeo
> >   		return r;
> >   	}
> > -	r_sig = dma_fence_signal(&fence->base);
> > -	if (!r_sig)
> > -		DMA_FENCE_TRACE(&fence->base, "signaled from fence_wait\n");
> > +	dma_fence_signal(&fence->base);
> >   	return r;
> >   }
> > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> > index 69de2c76731f..3736746c47bd 100644
> > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > @@ -50,26 +50,12 @@ static void __exit drm_sched_fence_slab_fini(void)
> >   void drm_sched_fence_scheduled(struct drm_sched_fence *fence)
> >   {
> > -	int ret = dma_fence_signal(&fence->scheduled);
> > -
> > -	if (!ret)
> > -		DMA_FENCE_TRACE(&fence->scheduled,
> > -				"signaled from irq context\n");
> > -	else
> > -		DMA_FENCE_TRACE(&fence->scheduled,
> > -				"was already signaled\n");
> > +	dma_fence_signal(&fence->scheduled);
> >   }
> >   void drm_sched_fence_finished(struct drm_sched_fence *fence)
> >   {
> > -	int ret = dma_fence_signal(&fence->finished);
> > -
> > -	if (!ret)
> > -		DMA_FENCE_TRACE(&fence->finished,
> > -				"signaled from irq context\n");
> > -	else
> > -		DMA_FENCE_TRACE(&fence->finished,
> > -				"was already signaled\n");
> > +	dma_fence_signal(&fence->finished);
> >   }
> >   static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
> > diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> > index 6ffb4b2c6371..4cc119ab272f 100644
> > --- a/include/linux/dma-fence.h
> > +++ b/include/linux/dma-fence.h
> > @@ -590,26 +590,4 @@ struct dma_fence *dma_fence_get_stub(void);
> >   struct dma_fence *dma_fence_allocate_private_stub(void);
> >   u64 dma_fence_context_alloc(unsigned num);
> > -#define DMA_FENCE_TRACE(f, fmt, args...) \
> > -	do {								\
> > -		struct dma_fence *__ff = (f);				\
> > -		if (IS_ENABLED(CONFIG_DMA_FENCE_TRACE))			\
> > -			pr_info("f %llu#%llu: " fmt,			\
> > -				__ff->context, __ff->seqno, ##args);	\
> > -	} while (0)
> > -
> > -#define DMA_FENCE_WARN(f, fmt, args...) \
> > -	do {								\
> > -		struct dma_fence *__ff = (f);				\
> > -		pr_warn("f %llu#%llu: " fmt, __ff->context, __ff->seqno,\
> > -			 ##args);					\
> > -	} while (0)
> > -
> > -#define DMA_FENCE_ERR(f, fmt, args...) \
> > -	do {								\
> > -		struct dma_fence *__ff = (f);				\
> > -		pr_err("f %llu#%llu: " fmt, __ff->context, __ff->seqno,	\
> > -			##args);					\
> > -	} while (0)
> > -
> >   #endif /* __LINUX_DMA_FENCE_H */
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
