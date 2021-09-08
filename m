Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 275ED403E78
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 19:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349252AbhIHRqe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 13:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233375AbhIHRqd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 13:46:33 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1864C061575
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 10:45:25 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id i6so4050225edu.1
        for <linux-media@vger.kernel.org>; Wed, 08 Sep 2021 10:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=+xEb27PMFQUN6a8DcLn87Q6DnS83FJhxmti0I/5v+c8=;
        b=NApzBmW3UHVNrriG9leoqpe0UPqlSwGG+HHEvMS6VrsAJ8Zk61JcNe2wN49FhKPnoj
         xp7yb2mjOQAw38ZaLHutQYGOZjV0CSU9Qo0X5R7hEJ23bnK8V9iPe1bEWcndMu/3PFf1
         W9pHkI/23al4QTNYhOthpUxC7jqfJ3l2jmHWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=+xEb27PMFQUN6a8DcLn87Q6DnS83FJhxmti0I/5v+c8=;
        b=sI13ghHx+pZVwlYT+4YO7Ghj3/WX+ABnmbfuEx9Fi7e4vcQxMnlEn1V99vaK/duFhj
         2IHx19NFZKazWtk+09U3AJtqx9lg00WPm9KSZczmWvaTd/rrQ9DXHkqMvR8tahW7/g6O
         N4fc3BV1AbM8GULvrsNwh/ctZ6uC4mYQ5buv3tvvl3RndrsWp1uP5mZLdOxw+DPhbdhy
         z5eD9XxOWu6nfVg8QDbhpmblIrApLGiWN1ZAks6A1/TTWhHQnmc5E1MnmkfNAytHWDgW
         aQEZ/3g7JYLwjFcvVaO+YyApITcuJLHHc4Dki05ZUoua/zwKlcVuNVdgU+qVVZBoRyx5
         qF2w==
X-Gm-Message-State: AOAM531KNPE/Pxq3X+3YQAnV44FgWvE296ypFLebMkP9HQfHEtQKe1k5
        9KzPueM/ixIi8I6tPACByBKAfw9oHE9SfA==
X-Google-Smtp-Source: ABdhPJxNTQqMjSZn5VxSobt+K12XzbD5osKL3cKE0pBWdtZGzMzii+9hy1LRcgB0zMHvtfaOFvXhoQ==
X-Received: by 2002:a50:d0d1:: with SMTP id g17mr2357446edf.96.1631123124210;
        Wed, 08 Sep 2021 10:45:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id r6sm1352603ejb.119.2021.09.08.10.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 10:45:23 -0700 (PDT)
Date:   Wed, 8 Sep 2021 19:45:21 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Daniel Vetter <daniel@ffwll.ch>,
        Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Steven Price <steven.price@arm.com>,
        Melissa Wen <mwen@igalia.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Jack Zhang <Jack.Zhang1@amd.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v3 4/9] drm/scheduler: Add fence deadline support
Message-ID: <YTj2scNdCHAdF+cl@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
        Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Steven Price <steven.price@arm.com>, Melissa Wen <mwen@igalia.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Jack Zhang <Jack.Zhang1@amd.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <20210903184806.1680887-1-robdclark@gmail.com>
 <20210903184806.1680887-5-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903184806.1680887-5-robdclark@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 03, 2021 at 11:47:55AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> As the finished fence is the one that is exposed to userspace, and
> therefore the one that other operations, like atomic update, would
> block on, we need to propagate the deadline from from the finished
> fence to the actual hw fence.
> 
> v2: Split into drm_sched_fence_set_parent() (ckoenig)
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/scheduler/sched_fence.c | 34 +++++++++++++++++++++++++
>  drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
>  include/drm/gpu_scheduler.h             |  8 ++++++
>  3 files changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index bcea035cf4c6..4fc41a71d1c7 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -128,6 +128,30 @@ static void drm_sched_fence_release_finished(struct dma_fence *f)
>  	dma_fence_put(&fence->scheduled);
>  }
>  
> +static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
> +						  ktime_t deadline)
> +{
> +	struct drm_sched_fence *fence = to_drm_sched_fence(f);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&fence->lock, flags);
> +
> +	/* If we already have an earlier deadline, keep it: */
> +	if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
> +	    ktime_before(fence->deadline, deadline)) {
> +		spin_unlock_irqrestore(&fence->lock, flags);
> +		return;
> +	}
> +
> +	fence->deadline = deadline;
> +	set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
> +
> +	spin_unlock_irqrestore(&fence->lock, flags);
> +
> +	if (fence->parent)
> +		dma_fence_set_deadline(fence->parent, deadline);
> +}
> +
>  static const struct dma_fence_ops drm_sched_fence_ops_scheduled = {
>  	.get_driver_name = drm_sched_fence_get_driver_name,
>  	.get_timeline_name = drm_sched_fence_get_timeline_name,
> @@ -138,6 +162,7 @@ static const struct dma_fence_ops drm_sched_fence_ops_finished = {
>  	.get_driver_name = drm_sched_fence_get_driver_name,
>  	.get_timeline_name = drm_sched_fence_get_timeline_name,
>  	.release = drm_sched_fence_release_finished,
> +	.set_deadline = drm_sched_fence_set_deadline_finished,
>  };
>  
>  struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
> @@ -152,6 +177,15 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
>  }
>  EXPORT_SYMBOL(to_drm_sched_fence);
>  
> +void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
> +				struct dma_fence *fence)
> +{
> +	s_fence->parent = dma_fence_get(fence);
> +	if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
> +		     &s_fence->finished.flags))

Don't you need the spinlock here too to avoid races? test_bit is very
unordered, so guarantees nothing. Spinlock would need to be both around
->parent = and the test_bit.

Entirely aside, but there's discussions going on to preallocate the hw
fence somehow. If we do that we could make the deadline forwarding
lockless here. Having a spinlock just to set the parent is a bit annoying
...

Alternative is that you do this locklessly with barriers and a _lot_ of
comments. Would be good to benchmark whether the overhead matters though
first.
-Daniel

> +		dma_fence_set_deadline(fence, s_fence->deadline);
> +}
> +
>  struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>  					      void *owner)
>  {
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 595e47ff7d06..27bf0ac0625f 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -978,7 +978,7 @@ static int drm_sched_main(void *param)
>  		drm_sched_fence_scheduled(s_fence);
>  
>  		if (!IS_ERR_OR_NULL(fence)) {
> -			s_fence->parent = dma_fence_get(fence);
> +			drm_sched_fence_set_parent(s_fence, fence);
>  			r = dma_fence_add_callback(fence, &sched_job->cb,
>  						   drm_sched_job_done_cb);
>  			if (r == -ENOENT)
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 7f77a455722c..158ddd662469 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -238,6 +238,12 @@ struct drm_sched_fence {
>           */
>  	struct dma_fence		finished;
>  
> +	/**
> +	 * @deadline: deadline set on &drm_sched_fence.finished which
> +	 * potentially needs to be propagated to &drm_sched_fence.parent
> +	 */
> +	ktime_t				deadline;
> +
>          /**
>           * @parent: the fence returned by &drm_sched_backend_ops.run_job
>           * when scheduling the job on hardware. We signal the
> @@ -505,6 +511,8 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>  				   enum drm_sched_priority priority);
>  bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
>  
> +void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
> +				struct dma_fence *fence);
>  struct drm_sched_fence *drm_sched_fence_alloc(
>  	struct drm_sched_entity *s_entity, void *owner);
>  void drm_sched_fence_init(struct drm_sched_fence *fence,
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
