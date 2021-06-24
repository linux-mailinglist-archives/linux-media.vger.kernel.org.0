Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3D693B3163
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 16:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbhFXOeh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 10:34:37 -0400
Received: from foss.arm.com ([217.140.110.172]:59184 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230377AbhFXOeg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 10:34:36 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CF0E106F;
        Thu, 24 Jun 2021 07:32:17 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE3E83F718;
        Thu, 24 Jun 2021 07:32:15 -0700 (PDT)
Subject: Re: [PATCH 02/11] drm/sched: Add dependency tracking
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Jack Zhang <Jack.Zhang1@amd.com>, David Airlie <airlied@linux.ie>,
        linaro-mm-sig@lists.linaro.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-media@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Nirmoy Das <nirmoy.aiemd@gmail.com>
References: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
 <20210624140025.438303-3-daniel.vetter@ffwll.ch>
From:   Steven Price <steven.price@arm.com>
Message-ID: <82273006-ed96-bf41-a775-8c4abc087860@arm.com>
Date:   Thu, 24 Jun 2021 15:32:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624140025.438303-3-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/06/2021 15:00, Daniel Vetter wrote:
> Instead of just a callback we can just glue in the gem helpers that
> panfrost, v3d and lima currently use. There's really not that many
> ways to skin this cat.
> 
> On the naming bikeshed: The idea for using _await_ to denote adding
> dependencies to a job comes from i915, where that's used quite
> extensively all over the place, in lots of datastructures.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Nirmoy Das <nirmoy.aiemd@gmail.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Jack Zhang <Jack.Zhang1@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org

LGTM:

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/scheduler/sched_entity.c |  18 +++-
>  drivers/gpu/drm/scheduler/sched_main.c   | 103 +++++++++++++++++++++++
>  include/drm/gpu_scheduler.h              |  31 ++++++-
>  3 files changed, 146 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index f7347c284886..b6f72fafd504 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -211,6 +211,19 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>  	job->sched->ops->free_job(job);
>  }
>  
> +static struct dma_fence *
> +drm_sched_job_dependency(struct drm_sched_job *job,
> +			 struct drm_sched_entity *entity)
> +{
> +	if (!xa_empty(&job->dependencies))
> +		return xa_erase(&job->dependencies, job->last_dependency++);
> +
> +	if (job->sched->ops->dependency)
> +		return job->sched->ops->dependency(job, entity);
> +
> +	return NULL;
> +}
> +
>  /**
>   * drm_sched_entity_kill_jobs - Make sure all remaining jobs are killed
>   *
> @@ -229,7 +242,7 @@ static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
>  		struct drm_sched_fence *s_fence = job->s_fence;
>  
>  		/* Wait for all dependencies to avoid data corruptions */
> -		while ((f = job->sched->ops->dependency(job, entity)))
> +		while ((f = drm_sched_job_dependency(job, entity)))
>  			dma_fence_wait(f, false);
>  
>  		drm_sched_fence_scheduled(s_fence);
> @@ -419,7 +432,6 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>   */
>  struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>  {
> -	struct drm_gpu_scheduler *sched = entity->rq->sched;
>  	struct drm_sched_job *sched_job;
>  
>  	sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> @@ -427,7 +439,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>  		return NULL;
>  
>  	while ((entity->dependency =
> -			sched->ops->dependency(sched_job, entity))) {
> +			drm_sched_job_dependency(sched_job, entity))) {
>  		trace_drm_sched_job_wait_dep(sched_job, entity->dependency);
>  
>  		if (drm_sched_entity_add_dependency_cb(entity))
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 70eefed17e06..370c336d383f 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -603,6 +603,8 @@ int drm_sched_job_init(struct drm_sched_job *job,
>  
>  	INIT_LIST_HEAD(&job->list);
>  
> +	xa_init_flags(&job->dependencies, XA_FLAGS_ALLOC);
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_sched_job_init);
> @@ -626,6 +628,98 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>  }
>  EXPORT_SYMBOL(drm_sched_job_arm);
>  
> +/**
> + * drm_sched_job_await_fence - adds the fence as a job dependency
> + * @job: scheduler job to add the dependencies to
> + * @fence: the dma_fence to add to the list of dependencies.
> + *
> + * Note that @fence is consumed in both the success and error cases.
> + *
> + * Returns:
> + * 0 on success, or an error on failing to expand the array.
> + */
> +int drm_sched_job_await_fence(struct drm_sched_job *job,
> +			      struct dma_fence *fence)
> +{
> +	struct dma_fence *entry;
> +	unsigned long index;
> +	u32 id = 0;
> +	int ret;
> +
> +	if (!fence)
> +		return 0;
> +
> +	/* Deduplicate if we already depend on a fence from the same context.
> +	 * This lets the size of the array of deps scale with the number of
> +	 * engines involved, rather than the number of BOs.
> +	 */
> +	xa_for_each(&job->dependencies, index, entry) {
> +		if (entry->context != fence->context)
> +			continue;
> +
> +		if (dma_fence_is_later(fence, entry)) {
> +			dma_fence_put(entry);
> +			xa_store(&job->dependencies, index, fence, GFP_KERNEL);
> +		} else {
> +			dma_fence_put(fence);
> +		}
> +		return 0;
> +	}
> +
> +	ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, GFP_KERNEL);
> +	if (ret != 0)
> +		dma_fence_put(fence);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_sched_job_await_fence);
> +
> +/**
> + * drm_sched_job_await_implicit - adds implicit dependencies as job dependencies
> + * @job: scheduler job to add the dependencies to
> + * @obj: the gem object to add new dependencies from.
> + * @write: whether the job might write the object (so we need to depend on
> + * shared fences in the reservation object).
> + *
> + * This should be called after drm_gem_lock_reservations() on your array of
> + * GEM objects used in the job but before updating the reservations with your
> + * own fences.
> + *
> + * Returns:
> + * 0 on success, or an error on failing to expand the array.
> + */
> +int drm_sched_job_await_implicit(struct drm_sched_job *job,
> +				 struct drm_gem_object *obj,
> +				 bool write)
> +{
> +	int ret;
> +	struct dma_fence **fences;
> +	unsigned int i, fence_count;
> +
> +	if (!write) {
> +		struct dma_fence *fence = dma_resv_get_excl_unlocked(obj->resv);
> +
> +		return drm_sched_job_await_fence(job, fence);
> +	}
> +
> +	ret = dma_resv_get_fences(obj->resv, NULL, &fence_count, &fences);
> +	if (ret || !fence_count)
> +		return ret;
> +
> +	for (i = 0; i < fence_count; i++) {
> +		ret = drm_sched_job_await_fence(job, fences[i]);
> +		if (ret)
> +			break;
> +	}
> +
> +	for (; i < fence_count; i++)
> +		dma_fence_put(fences[i]);
> +	kfree(fences);
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_sched_job_await_implicit);
> +
> +
>  /**
>   * drm_sched_job_cleanup - clean up scheduler job resources
>   *
> @@ -633,8 +727,17 @@ EXPORT_SYMBOL(drm_sched_job_arm);
>   */
>  void drm_sched_job_cleanup(struct drm_sched_job *job)
>  {
> +	struct dma_fence *fence;
> +	unsigned long index;
> +
>  	dma_fence_put(&job->s_fence->finished);
>  	job->s_fence = NULL;
> +
> +	xa_for_each(&job->dependencies, index, fence) {
> +		dma_fence_put(fence);
> +	}
> +	xa_destroy(&job->dependencies);
> +
>  }
>  EXPORT_SYMBOL(drm_sched_job_cleanup);
>  
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 80438d126c9d..e4d7e1496296 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -27,9 +27,12 @@
>  #include <drm/spsc_queue.h>
>  #include <linux/dma-fence.h>
>  #include <linux/completion.h>
> +#include <linux/xarray.h>
>  
>  #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
>  
> +struct drm_gem_object;
> +
>  struct drm_gpu_scheduler;
>  struct drm_sched_rq;
>  
> @@ -198,6 +201,16 @@ struct drm_sched_job {
>  	enum drm_sched_priority		s_priority;
>  	struct drm_sched_entity         *entity;
>  	struct dma_fence_cb		cb;
> +	/**
> +	 * @dependencies:
> +	 *
> +	 * Contains the dependencies as struct dma_fence for this job, see
> +	 * drm_sched_job_await_fence() and drm_sched_job_await_implicit().
> +	 */
> +	struct xarray			dependencies;
> +
> +	/** @last_dependency: tracks @dependencies as they signal */
> +	unsigned long			last_dependency;
>  };
>  
>  static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
> @@ -220,9 +233,14 @@ enum drm_gpu_sched_stat {
>   */
>  struct drm_sched_backend_ops {
>  	/**
> -         * @dependency: Called when the scheduler is considering scheduling
> -         * this job next, to get another struct dma_fence for this job to
> -	 * block on.  Once it returns NULL, run_job() may be called.
> +	 * @dependency:
> +	 *
> +	 * Called when the scheduler is considering scheduling this job next, to
> +	 * get another struct dma_fence for this job to block on.  Once it
> +	 * returns NULL, run_job() may be called.
> +	 *
> +	 * If a driver exclusively uses drm_sched_job_await_fence() and
> +	 * drm_sched_job_await_implicit() this can be ommitted and left as NULL.
>  	 */
>  	struct dma_fence *(*dependency)(struct drm_sched_job *sched_job,
>  					struct drm_sched_entity *s_entity);
> @@ -314,6 +332,13 @@ int drm_sched_job_init(struct drm_sched_job *job,
>  		       struct drm_sched_entity *entity,
>  		       void *owner);
>  void drm_sched_job_arm(struct drm_sched_job *job);
> +int drm_sched_job_await_fence(struct drm_sched_job *job,
> +			      struct dma_fence *fence);
> +int drm_sched_job_await_implicit(struct drm_sched_job *job,
> +				 struct drm_gem_object *obj,
> +				 bool write);
> +
> +
>  void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>  				    struct drm_gpu_scheduler **sched_list,
>                                     unsigned int num_sched_list);
> 

