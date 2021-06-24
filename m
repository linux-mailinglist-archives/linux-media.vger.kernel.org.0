Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED6E13B3286
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 17:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232003AbhFXP2n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 11:28:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbhFXP2m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 11:28:42 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A4ECC061574
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 08:26:21 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id p10-20020a05600c430ab02901df57d735f7so6515690wme.3
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 08:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2gVPDUuBmj+Cv4UE8a46LdFXBh0NMLKNv4K7O17AXyU=;
        b=gtMLrNJ9AMAZoEd2OZ06QpIkSYUYUv11R9tudu/zE9hEAnBPDL8kMpKCGDnYO5qxue
         C5XJQX9tJSr5m0UhNVNgclsgxLipkYijefA8NE/wl14Fzt0DmmNam+N9ytvxleQUF8N8
         lFlXQUg39ayq2xfG3thIMBeP1P1y4rGpVfUM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2gVPDUuBmj+Cv4UE8a46LdFXBh0NMLKNv4K7O17AXyU=;
        b=YTCLGRKniRm8oFacyCHXwCqo+NImg1ZCAu/4U5ZIdht0NLVLbab343+ZMSQKQO/ALc
         Gw8EY6mFLBUIAFuPygvZ7TOKCdWF9jE20Y9apzGycaDctVAj5TsD+0W9ro2OM/GgnPro
         Rk2X9hogofGMXts+ydjcGsxGiseLl3aMFO31nuqFXULXuIBnMVQFJPWuKSMQ7bGAw01+
         sPHMYa/uu8II9/h61vn2nOkPJtZsPxQmYzCpB6KtFK+tmgABXltEUjzs/FfVHt3aepTA
         n4UFhrotRK/6//0sAVu8DpRO4pLxniF5bJhAQ5NrDmR+017uZwSfnlA4zJi0hNuJS7Dm
         fUUA==
X-Gm-Message-State: AOAM532zhp9Subwcree+g4TGLR0fAbbnfE1CQvG5AlPy31N+87EqTMDN
        eQduRgcGtx/5wKbeiVMHYi7Prg==
X-Google-Smtp-Source: ABdhPJxBTLBeLiUdi0S0Sgndhy+7h8KrV0J3aub/o7bMGNA0XGhR1Ib8jB5LXqqES8pFT/XFJfVIUg==
X-Received: by 2002:a05:600c:2293:: with SMTP id 19mr4967730wmf.175.1624548380129;
        Thu, 24 Jun 2021 08:26:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q19sm8943700wmc.44.2021.06.24.08.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 08:26:19 -0700 (PDT)
Date:   Thu, 24 Jun 2021 17:26:17 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Jack Zhang <Jack.Zhang1@amd.com>,
        David Airlie <airlied@linux.ie>,
        linaro-mm-sig@lists.linaro.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-media@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Nirmoy Das <nirmoy.aiemd@gmail.com>
Subject: Re: [PATCH 02/11] drm/sched: Add dependency tracking
Message-ID: <YNSkGbtzNMMXJmDY@phenom.ffwll.local>
References: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
 <20210624140025.438303-3-daniel.vetter@ffwll.ch>
 <9465ffc67bce199ad52f272d0c4f7103d61ae734.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9465ffc67bce199ad52f272d0c4f7103d61ae734.camel@pengutronix.de>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 24, 2021 at 04:39:09PM +0200, Lucas Stach wrote:
> Am Donnerstag, dem 24.06.2021 um 16:00 +0200 schrieb Daniel Vetter:
> > Instead of just a callback we can just glue in the gem helpers that
> > panfrost, v3d and lima currently use. There's really not that many
> > ways to skin this cat.
> > 
> > On the naming bikeshed: The idea for using _await_ to denote adding
> > dependencies to a job comes from i915, where that's used quite
> > extensively all over the place, in lots of datastructures.
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: Nirmoy Das <nirmoy.aiemd@gmail.com>
> > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > Cc: Luben Tuikov <luben.tuikov@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Jack Zhang <Jack.Zhang1@amd.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > ---
> >  drivers/gpu/drm/scheduler/sched_entity.c |  18 +++-
> >  drivers/gpu/drm/scheduler/sched_main.c   | 103 +++++++++++++++++++++++
> >  include/drm/gpu_scheduler.h              |  31 ++++++-
> >  3 files changed, 146 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> > index f7347c284886..b6f72fafd504 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -211,6 +211,19 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
> >  	job->sched->ops->free_job(job);
> >  }
> >  
> > +static struct dma_fence *
> > +drm_sched_job_dependency(struct drm_sched_job *job,
> > +			 struct drm_sched_entity *entity)
> > +{
> > +	if (!xa_empty(&job->dependencies))
> > +		return xa_erase(&job->dependencies, job->last_dependency++);
> 
> Not sure how much it buys us now that you dedup fences before adding
> them to the xa, but we could avoid potentially avoid some ping-pong
> looping in the scheduler by checking if the fence we are about to
> return here is already signaled and skipping to the next one if so.

I think there's quit a bit of tricks you can play if the scheduler has
more direct visibility into all (or at least most) of the fences. I'm
really just trying to establish the drm_sched_job_await api so there's a
notch more structure to the dependency handling.

Iow bikesheds on the interface and testing on the patches is what I'm
looking for :-)
-Daniel

> 
> Regards,
> Lucas
> 
> > +
> > +	if (job->sched->ops->dependency)
> > +		return job->sched->ops->dependency(job, entity);
> > +
> > +	return NULL;
> > +}
> > +
> >  /**
> >   * drm_sched_entity_kill_jobs - Make sure all remaining jobs are killed
> >   *
> > @@ -229,7 +242,7 @@ static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
> >  		struct drm_sched_fence *s_fence = job->s_fence;
> >  
> >  		/* Wait for all dependencies to avoid data corruptions */
> > -		while ((f = job->sched->ops->dependency(job, entity)))
> > +		while ((f = drm_sched_job_dependency(job, entity)))
> >  			dma_fence_wait(f, false);
> >  
> >  		drm_sched_fence_scheduled(s_fence);
> > @@ -419,7 +432,6 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
> >   */
> >  struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> >  {
> > -	struct drm_gpu_scheduler *sched = entity->rq->sched;
> >  	struct drm_sched_job *sched_job;
> >  
> >  	sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> > @@ -427,7 +439,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> >  		return NULL;
> >  
> >  	while ((entity->dependency =
> > -			sched->ops->dependency(sched_job, entity))) {
> > +			drm_sched_job_dependency(sched_job, entity))) {
> >  		trace_drm_sched_job_wait_dep(sched_job, entity->dependency);
> >  
> >  		if (drm_sched_entity_add_dependency_cb(entity))
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 70eefed17e06..370c336d383f 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -603,6 +603,8 @@ int drm_sched_job_init(struct drm_sched_job *job,
> >  
> >  	INIT_LIST_HEAD(&job->list);
> >  
> > +	xa_init_flags(&job->dependencies, XA_FLAGS_ALLOC);
> > +
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL(drm_sched_job_init);
> > @@ -626,6 +628,98 @@ void drm_sched_job_arm(struct drm_sched_job *job)
> >  }
> >  EXPORT_SYMBOL(drm_sched_job_arm);
> >  
> > +/**
> > + * drm_sched_job_await_fence - adds the fence as a job dependency
> > + * @job: scheduler job to add the dependencies to
> > + * @fence: the dma_fence to add to the list of dependencies.
> > + *
> > + * Note that @fence is consumed in both the success and error cases.
> > + *
> > + * Returns:
> > + * 0 on success, or an error on failing to expand the array.
> > + */
> > +int drm_sched_job_await_fence(struct drm_sched_job *job,
> > +			      struct dma_fence *fence)
> > +{
> > +	struct dma_fence *entry;
> > +	unsigned long index;
> > +	u32 id = 0;
> > +	int ret;
> > +
> > +	if (!fence)
> > +		return 0;
> > +
> > +	/* Deduplicate if we already depend on a fence from the same context.
> > +	 * This lets the size of the array of deps scale with the number of
> > +	 * engines involved, rather than the number of BOs.
> > +	 */
> > +	xa_for_each(&job->dependencies, index, entry) {
> > +		if (entry->context != fence->context)
> > +			continue;
> > +
> > +		if (dma_fence_is_later(fence, entry)) {
> > +			dma_fence_put(entry);
> > +			xa_store(&job->dependencies, index, fence, GFP_KERNEL);
> > +		} else {
> > +			dma_fence_put(fence);
> > +		}
> > +		return 0;
> > +	}
> > +
> > +	ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, GFP_KERNEL);
> > +	if (ret != 0)
> > +		dma_fence_put(fence);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL(drm_sched_job_await_fence);
> > +
> > +/**
> > + * drm_sched_job_await_implicit - adds implicit dependencies as job dependencies
> > + * @job: scheduler job to add the dependencies to
> > + * @obj: the gem object to add new dependencies from.
> > + * @write: whether the job might write the object (so we need to depend on
> > + * shared fences in the reservation object).
> > + *
> > + * This should be called after drm_gem_lock_reservations() on your array of
> > + * GEM objects used in the job but before updating the reservations with your
> > + * own fences.
> > + *
> > + * Returns:
> > + * 0 on success, or an error on failing to expand the array.
> > + */
> > +int drm_sched_job_await_implicit(struct drm_sched_job *job,
> > +				 struct drm_gem_object *obj,
> > +				 bool write)
> > +{
> > +	int ret;
> > +	struct dma_fence **fences;
> > +	unsigned int i, fence_count;
> > +
> > +	if (!write) {
> > +		struct dma_fence *fence = dma_resv_get_excl_unlocked(obj->resv);
> > +
> > +		return drm_sched_job_await_fence(job, fence);
> > +	}
> > +
> > +	ret = dma_resv_get_fences(obj->resv, NULL, &fence_count, &fences);
> > +	if (ret || !fence_count)
> > +		return ret;
> > +
> > +	for (i = 0; i < fence_count; i++) {
> > +		ret = drm_sched_job_await_fence(job, fences[i]);
> > +		if (ret)
> > +			break;
> > +	}
> > +
> > +	for (; i < fence_count; i++)
> > +		dma_fence_put(fences[i]);
> > +	kfree(fences);
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL(drm_sched_job_await_implicit);
> > +
> > +
> >  /**
> >   * drm_sched_job_cleanup - clean up scheduler job resources
> >   *
> > @@ -633,8 +727,17 @@ EXPORT_SYMBOL(drm_sched_job_arm);
> >   */
> >  void drm_sched_job_cleanup(struct drm_sched_job *job)
> >  {
> > +	struct dma_fence *fence;
> > +	unsigned long index;
> > +
> >  	dma_fence_put(&job->s_fence->finished);
> >  	job->s_fence = NULL;
> > +
> > +	xa_for_each(&job->dependencies, index, fence) {
> > +		dma_fence_put(fence);
> > +	}
> > +	xa_destroy(&job->dependencies);
> > +
> >  }
> >  EXPORT_SYMBOL(drm_sched_job_cleanup);
> >  
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 80438d126c9d..e4d7e1496296 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -27,9 +27,12 @@
> >  #include <drm/spsc_queue.h>
> >  #include <linux/dma-fence.h>
> >  #include <linux/completion.h>
> > +#include <linux/xarray.h>
> >  
> >  #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
> >  
> > +struct drm_gem_object;
> > +
> >  struct drm_gpu_scheduler;
> >  struct drm_sched_rq;
> >  
> > @@ -198,6 +201,16 @@ struct drm_sched_job {
> >  	enum drm_sched_priority		s_priority;
> >  	struct drm_sched_entity         *entity;
> >  	struct dma_fence_cb		cb;
> > +	/**
> > +	 * @dependencies:
> > +	 *
> > +	 * Contains the dependencies as struct dma_fence for this job, see
> > +	 * drm_sched_job_await_fence() and drm_sched_job_await_implicit().
> > +	 */
> > +	struct xarray			dependencies;
> > +
> > +	/** @last_dependency: tracks @dependencies as they signal */
> > +	unsigned long			last_dependency;
> >  };
> >  
> >  static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
> > @@ -220,9 +233,14 @@ enum drm_gpu_sched_stat {
> >   */
> >  struct drm_sched_backend_ops {
> >  	/**
> > -         * @dependency: Called when the scheduler is considering scheduling
> > -         * this job next, to get another struct dma_fence for this job to
> > -	 * block on.  Once it returns NULL, run_job() may be called.
> > +	 * @dependency:
> > +	 *
> > +	 * Called when the scheduler is considering scheduling this job next, to
> > +	 * get another struct dma_fence for this job to block on.  Once it
> > +	 * returns NULL, run_job() may be called.
> > +	 *
> > +	 * If a driver exclusively uses drm_sched_job_await_fence() and
> > +	 * drm_sched_job_await_implicit() this can be ommitted and left as NULL.
> >  	 */
> >  	struct dma_fence *(*dependency)(struct drm_sched_job *sched_job,
> >  					struct drm_sched_entity *s_entity);
> > @@ -314,6 +332,13 @@ int drm_sched_job_init(struct drm_sched_job *job,
> >  		       struct drm_sched_entity *entity,
> >  		       void *owner);
> >  void drm_sched_job_arm(struct drm_sched_job *job);
> > +int drm_sched_job_await_fence(struct drm_sched_job *job,
> > +			      struct dma_fence *fence);
> > +int drm_sched_job_await_implicit(struct drm_sched_job *job,
> > +				 struct drm_gem_object *obj,
> > +				 bool write);
> > +
> > +
> >  void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> >  				    struct drm_gpu_scheduler **sched_list,
> >                                     unsigned int num_sched_list);
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
