Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB6393BE53C
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 11:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbhGGJLG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 05:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231363AbhGGJLB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 05:11:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EDE0C061764
        for <linux-media@vger.kernel.org>; Wed,  7 Jul 2021 02:08:21 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1m13XS-0002xH-00; Wed, 07 Jul 2021 11:08:14 +0200
Message-ID: <006dc4538e906b548eac0acfaf62211b83de4927.camel@pengutronix.de>
Subject: Re: [PATCH v2 08/11] drm/etnaviv: Use scheduler dependency handling
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@intel.com>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        etnaviv@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Date:   Wed, 07 Jul 2021 11:08:11 +0200
In-Reply-To: <20210702213815.2249499-9-daniel.vetter@ffwll.ch>
References: <20210702213815.2249499-1-daniel.vetter@ffwll.ch>
         <20210702213815.2249499-9-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Freitag, dem 02.07.2021 um 23:38 +0200 schrieb Daniel Vetter:
> We need to pull the drm_sched_job_init much earlier, but that's very
> minor surgery.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: etnaviv@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.h        |  5 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 32 +++++-----
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c      | 61 +-------------------
>  drivers/gpu/drm/etnaviv/etnaviv_sched.h      |  3 +-
>  4 files changed, 20 insertions(+), 81 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> index 98e60df882b6..63688e6e4580 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> @@ -80,9 +80,6 @@ struct etnaviv_gem_submit_bo {
>  	u64 va;
>  	struct etnaviv_gem_object *obj;
>  	struct etnaviv_vram_mapping *mapping;
> -	struct dma_fence *excl;
> -	unsigned int nr_shared;
> -	struct dma_fence **shared;
>  };
>  
>  /* Created per submit-ioctl, to track bo's and cmdstream bufs, etc,
> @@ -95,7 +92,7 @@ struct etnaviv_gem_submit {
>  	struct etnaviv_file_private *ctx;
>  	struct etnaviv_gpu *gpu;
>  	struct etnaviv_iommu_context *mmu_context, *prev_mmu_context;
> -	struct dma_fence *out_fence, *in_fence;
> +	struct dma_fence *out_fence;
>  	int out_fence_id;
>  	struct list_head node; /* GPU active submit list */
>  	struct etnaviv_cmdbuf cmdbuf;
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index 4dd7d9d541c0..92478a50a580 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -188,16 +188,10 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
>  		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
>  			continue;
>  
> -		if (bo->flags & ETNA_SUBMIT_BO_WRITE) {
> -			ret = dma_resv_get_fences(robj, &bo->excl,
> -						  &bo->nr_shared,
> -						  &bo->shared);
> -			if (ret)
> -				return ret;
> -		} else {
> -			bo->excl = dma_resv_get_excl_unlocked(robj);
> -		}
> -
> +		ret = drm_sched_job_await_implicit(&submit->sched_job, &bo->obj->base,
> +						   bo->flags & ETNA_SUBMIT_BO_WRITE);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	return ret;
> @@ -403,8 +397,6 @@ static void submit_cleanup(struct kref *kref)
>  
>  	wake_up_all(&submit->gpu->fence_event);
>  
> -	if (submit->in_fence)
> -		dma_fence_put(submit->in_fence);
>  	if (submit->out_fence) {
>  		/* first remove from IDR, so fence can not be found anymore */
>  		mutex_lock(&submit->gpu->fence_lock);
> @@ -537,6 +529,12 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>  	submit->exec_state = args->exec_state;
>  	submit->flags = args->flags;
>  
> +	ret = drm_sched_job_init(&submit->sched_job,
> +				 &ctx->sched_entity[args->pipe],
> +				 submit->ctx);
> +	if (ret)
> +		goto err_submit_objects;
> +

With the init moved here you also need to move the
drm_sched_job_cleanup call from etnaviv_sched_free_job into
submit_cleanup to avoid the potential memory leak when we bail out
before pushing the job to the scheduler.

Regards,
Lucas

>  	ret = submit_lookup_objects(submit, file, bos, args->nr_bos);
>  	if (ret)
>  		goto err_submit_objects;
> @@ -549,11 +547,15 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>  	}
>  
>  	if (args->flags & ETNA_SUBMIT_FENCE_FD_IN) {
> -		submit->in_fence = sync_file_get_fence(args->fence_fd);
> -		if (!submit->in_fence) {
> +		struct dma_fence *in_fence = sync_file_get_fence(args->fence_fd);
> +		if (!in_fence) {
>  			ret = -EINVAL;
>  			goto err_submit_objects;
>  		}
> +
> +		ret = drm_sched_job_await_fence(&submit->sched_job, in_fence);
> +		if (ret)
> +			goto err_submit_objects;
>  	}
>  
>  	ret = submit_pin_objects(submit);
> @@ -579,7 +581,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>  	if (ret)
>  		goto err_submit_objects;
>  
> -	ret = etnaviv_sched_push_job(&ctx->sched_entity[args->pipe], submit);
> +	ret = etnaviv_sched_push_job(submit);
>  	if (ret)
>  		goto err_submit_objects;
>  
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 180bb633d5c5..c98d67320be3 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -17,58 +17,6 @@ module_param_named(job_hang_limit, etnaviv_job_hang_limit, int , 0444);
>  static int etnaviv_hw_jobs_limit = 4;
>  module_param_named(hw_job_limit, etnaviv_hw_jobs_limit, int , 0444);
>  
> -static struct dma_fence *
> -etnaviv_sched_dependency(struct drm_sched_job *sched_job,
> -			 struct drm_sched_entity *entity)
> -{
> -	struct etnaviv_gem_submit *submit = to_etnaviv_submit(sched_job);
> -	struct dma_fence *fence;
> -	int i;
> -
> -	if (unlikely(submit->in_fence)) {
> -		fence = submit->in_fence;
> -		submit->in_fence = NULL;
> -
> -		if (!dma_fence_is_signaled(fence))
> -			return fence;
> -
> -		dma_fence_put(fence);
> -	}
> -
> -	for (i = 0; i < submit->nr_bos; i++) {
> -		struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
> -		int j;
> -
> -		if (bo->excl) {
> -			fence = bo->excl;
> -			bo->excl = NULL;
> -
> -			if (!dma_fence_is_signaled(fence))
> -				return fence;
> -
> -			dma_fence_put(fence);
> -		}
> -
> -		for (j = 0; j < bo->nr_shared; j++) {
> -			if (!bo->shared[j])
> -				continue;
> -
> -			fence = bo->shared[j];
> -			bo->shared[j] = NULL;
> -
> -			if (!dma_fence_is_signaled(fence))
> -				return fence;
> -
> -			dma_fence_put(fence);
> -		}
> -		kfree(bo->shared);
> -		bo->nr_shared = 0;
> -		bo->shared = NULL;
> -	}
> -
> -	return NULL;
> -}
> -
>  static struct dma_fence *etnaviv_sched_run_job(struct drm_sched_job *sched_job)
>  {
>  	struct etnaviv_gem_submit *submit = to_etnaviv_submit(sched_job);
> @@ -140,14 +88,12 @@ static void etnaviv_sched_free_job(struct drm_sched_job *sched_job)
>  }
>  
>  static const struct drm_sched_backend_ops etnaviv_sched_ops = {
> -	.dependency = etnaviv_sched_dependency,
>  	.run_job = etnaviv_sched_run_job,
>  	.timedout_job = etnaviv_sched_timedout_job,
>  	.free_job = etnaviv_sched_free_job,
>  };
>  
> -int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
> -			   struct etnaviv_gem_submit *submit)
> +int etnaviv_sched_push_job(struct etnaviv_gem_submit *submit)
>  {
>  	int ret = 0;
>  
> @@ -158,11 +104,6 @@ int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
>  	 */
>  	mutex_lock(&submit->gpu->fence_lock);
>  
> -	ret = drm_sched_job_init(&submit->sched_job, sched_entity,
> -				 submit->ctx);
> -	if (ret)
> -		goto out_unlock;
> -
>  	drm_sched_job_arm(&submit->sched_job);
>  
>  	submit->out_fence = dma_fence_get(&submit->sched_job.s_fence->finished);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.h b/drivers/gpu/drm/etnaviv/etnaviv_sched.h
> index c0a6796e22c9..baebfa069afc 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.h
> @@ -18,7 +18,6 @@ struct etnaviv_gem_submit *to_etnaviv_submit(struct drm_sched_job *sched_job)
>  
>  int etnaviv_sched_init(struct etnaviv_gpu *gpu);
>  void etnaviv_sched_fini(struct etnaviv_gpu *gpu);
> -int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
> -			   struct etnaviv_gem_submit *submit);
> +int etnaviv_sched_push_job(struct etnaviv_gem_submit *submit);
>  
>  #endif /* __ETNAVIV_SCHED_H__ */


