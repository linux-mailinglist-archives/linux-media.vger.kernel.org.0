Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CDB9403E97
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 19:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbhIHRtj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 13:49:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbhIHRti (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 13:49:38 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E2E7C061757
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 10:48:30 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id g8so4019674edt.7
        for <linux-media@vger.kernel.org>; Wed, 08 Sep 2021 10:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=E+YAoUpFBPenSdEyF8eVW03w6KHxvLFxLdfK1N27oPA=;
        b=M/BJVnJgVj0IkOHTljFFm/0AMU0j5VZVeHE8HO6aoWhEen6uT4Zrc1FJcA2Qtlk2f5
         x6DsShh/n9kEA0XpgoWAaUiaAf+/1uRXeOXEvBilpN3NY43QWoN0/ZqmJ3tsj/y8rDxz
         mR62xjX4v+/BOu/jo9Pjdc0wcCuJsnNBTX8bU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=E+YAoUpFBPenSdEyF8eVW03w6KHxvLFxLdfK1N27oPA=;
        b=YqeWIwbBBoLMm2phF5t+FsVG1Hrz4db7WQ8JWGnUcp7PymT7nmXOwkM8LvXb3qrPCK
         Qt0r3flfL87ZqmykjvzsLvjrwdynyOabD/IEqd4sFncqdUTe2EQkIvhQ11u3C5BztrAP
         9Z3x6H22jo6bHv0DL7UKr9+iNUp7HBtbyv8XDp2cOgE3tqi0JBadBqDHI1UwpkdcaUnj
         maCSJMvic10blGPQMz18/tNlqiFxn8bvBx6ihtGuBhgcbgkJLkneAd3HcimkGGbeCrW7
         DnCxleMLwR5AM65XLsDYDzARCCBKhDXgMch+hDIbVllNiYTAsM9foLmQQo0TzzbXa7AA
         NJTw==
X-Gm-Message-State: AOAM533kZo0puexm5DQJzlwNxxmEhXSFo/7WH0ToG8XrOBfqlDL7uEe3
        7mOA6+FPtluePcpkrWEsUKKG6g==
X-Google-Smtp-Source: ABdhPJzzeDTNTtbFSZ8UxoTecHDyD485iGujOJ8/saouuqiIsL3dbaV4CZ2kCgpPkOXrD0kq+8RXbQ==
X-Received: by 2002:aa7:cd79:: with SMTP id ca25mr5067498edb.389.1631123309063;
        Wed, 08 Sep 2021 10:48:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id js21sm1365959ejc.35.2021.09.08.10.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 10:48:28 -0700 (PDT)
Date:   Wed, 8 Sep 2021 19:48:26 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Daniel Vetter <daniel@ffwll.ch>,
        Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v3 5/9] drm/msm: Add deadline based boost support
Message-ID: <YTj3akinO0jVbCFc@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
        Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <20210903184806.1680887-1-robdclark@gmail.com>
 <20210903184806.1680887-6-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903184806.1680887-6-robdclark@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 03, 2021 at 11:47:56AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Why do you need a kthread_work here? Is this just to make sure you're
running at realtime prio? Maybe a comment to that effect would be good.
-Daniel

> ---
>  drivers/gpu/drm/msm/msm_fence.c       | 76 +++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_fence.h       | 20 +++++++
>  drivers/gpu/drm/msm/msm_gpu.h         |  1 +
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 20 +++++++
>  4 files changed, 117 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
> index f2cece542c3f..67c2a96e1c85 100644
> --- a/drivers/gpu/drm/msm/msm_fence.c
> +++ b/drivers/gpu/drm/msm/msm_fence.c
> @@ -8,6 +8,37 @@
>  
>  #include "msm_drv.h"
>  #include "msm_fence.h"
> +#include "msm_gpu.h"
> +
> +static inline bool fence_completed(struct msm_fence_context *fctx, uint32_t fence);
> +
> +static struct msm_gpu *fctx2gpu(struct msm_fence_context *fctx)
> +{
> +	struct msm_drm_private *priv = fctx->dev->dev_private;
> +	return priv->gpu;
> +}
> +
> +static enum hrtimer_restart deadline_timer(struct hrtimer *t)
> +{
> +	struct msm_fence_context *fctx = container_of(t,
> +			struct msm_fence_context, deadline_timer);
> +
> +	kthread_queue_work(fctx2gpu(fctx)->worker, &fctx->deadline_work);
> +
> +	return HRTIMER_NORESTART;
> +}
> +
> +static void deadline_work(struct kthread_work *work)
> +{
> +	struct msm_fence_context *fctx = container_of(work,
> +			struct msm_fence_context, deadline_work);
> +
> +	/* If deadline fence has already passed, nothing to do: */
> +	if (fence_completed(fctx, fctx->next_deadline_fence))
> +		return;
> +
> +	msm_devfreq_boost(fctx2gpu(fctx), 2);
> +}
>  
>  
>  struct msm_fence_context *
> @@ -26,6 +57,13 @@ msm_fence_context_alloc(struct drm_device *dev, volatile uint32_t *fenceptr,
>  	fctx->fenceptr = fenceptr;
>  	spin_lock_init(&fctx->spinlock);
>  
> +	hrtimer_init(&fctx->deadline_timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
> +	fctx->deadline_timer.function = deadline_timer;
> +
> +	kthread_init_work(&fctx->deadline_work, deadline_work);
> +
> +	fctx->next_deadline = ktime_get();
> +
>  	return fctx;
>  }
>  
> @@ -49,6 +87,8 @@ void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)
>  {
>  	spin_lock(&fctx->spinlock);
>  	fctx->completed_fence = max(fence, fctx->completed_fence);
> +	if (fence_completed(fctx, fctx->next_deadline_fence))
> +		hrtimer_cancel(&fctx->deadline_timer);
>  	spin_unlock(&fctx->spinlock);
>  }
>  
> @@ -79,10 +119,46 @@ static bool msm_fence_signaled(struct dma_fence *fence)
>  	return fence_completed(f->fctx, f->base.seqno);
>  }
>  
> +static void msm_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
> +{
> +	struct msm_fence *f = to_msm_fence(fence);
> +	struct msm_fence_context *fctx = f->fctx;
> +	unsigned long flags;
> +	ktime_t now;
> +
> +	spin_lock_irqsave(&fctx->spinlock, flags);
> +	now = ktime_get();
> +
> +	if (ktime_after(now, fctx->next_deadline) ||
> +			ktime_before(deadline, fctx->next_deadline)) {
> +		fctx->next_deadline = deadline;
> +		fctx->next_deadline_fence =
> +			max(fctx->next_deadline_fence, (uint32_t)fence->seqno);
> +
> +		/*
> +		 * Set timer to trigger boost 3ms before deadline, or
> +		 * if we are already less than 3ms before the deadline
> +		 * schedule boost work immediately.
> +		 */
> +		deadline = ktime_sub(deadline, ms_to_ktime(3));
> +
> +		if (ktime_after(now, deadline)) {
> +			kthread_queue_work(fctx2gpu(fctx)->worker,
> +					&fctx->deadline_work);
> +		} else {
> +			hrtimer_start(&fctx->deadline_timer, deadline,
> +					HRTIMER_MODE_ABS);
> +		}
> +	}
> +
> +	spin_unlock_irqrestore(&fctx->spinlock, flags);
> +}
> +
>  static const struct dma_fence_ops msm_fence_ops = {
>  	.get_driver_name = msm_fence_get_driver_name,
>  	.get_timeline_name = msm_fence_get_timeline_name,
>  	.signaled = msm_fence_signaled,
> +	.set_deadline = msm_fence_set_deadline,
>  };
>  
>  struct dma_fence *
> diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fence.h
> index 4783db528bcc..d34e853c555a 100644
> --- a/drivers/gpu/drm/msm/msm_fence.h
> +++ b/drivers/gpu/drm/msm/msm_fence.h
> @@ -50,6 +50,26 @@ struct msm_fence_context {
>  	volatile uint32_t *fenceptr;
>  
>  	spinlock_t spinlock;
> +
> +	/*
> +	 * TODO this doesn't really deal with multiple deadlines, like
> +	 * if userspace got multiple frames ahead.. OTOH atomic updates
> +	 * don't queue, so maybe that is ok
> +	 */
> +
> +	/** next_deadline: Time of next deadline */
> +	ktime_t next_deadline;
> +
> +	/**
> +	 * next_deadline_fence:
> +	 *
> +	 * Fence value for next pending deadline.  The deadline timer is
> +	 * canceled when this fence is signaled.
> +	 */
> +	uint32_t next_deadline_fence;
> +
> +	struct hrtimer deadline_timer;
> +	struct kthread_work deadline_work;
>  };
>  
>  struct msm_fence_context * msm_fence_context_alloc(struct drm_device *dev,
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 0e4b45bff2e6..e031c9b495ed 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -425,6 +425,7 @@ void msm_devfreq_init(struct msm_gpu *gpu);
>  void msm_devfreq_cleanup(struct msm_gpu *gpu);
>  void msm_devfreq_resume(struct msm_gpu *gpu);
>  void msm_devfreq_suspend(struct msm_gpu *gpu);
> +void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor);
>  void msm_devfreq_active(struct msm_gpu *gpu);
>  void msm_devfreq_idle(struct msm_gpu *gpu);
>  
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index 0a1ee20296a2..8a8d7b9028a3 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -144,6 +144,26 @@ void msm_devfreq_suspend(struct msm_gpu *gpu)
>  	devfreq_suspend_device(gpu->devfreq.devfreq);
>  }
>  
> +void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor)
> +{
> +	struct msm_gpu_devfreq *df = &gpu->devfreq;
> +	unsigned long freq;
> +
> +	/*
> +	 * Hold devfreq lock to synchronize with get_dev_status()/
> +	 * target() callbacks
> +	 */
> +	mutex_lock(&df->devfreq->lock);
> +
> +	freq = get_freq(gpu);
> +
> +	freq *= factor;
> +
> +	msm_devfreq_target(&gpu->pdev->dev, &freq, 0);
> +
> +	mutex_unlock(&df->devfreq->lock);
> +}
> +
>  void msm_devfreq_active(struct msm_gpu *gpu)
>  {
>  	struct msm_gpu_devfreq *df = &gpu->devfreq;
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
