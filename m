Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A72447D8EE
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 22:50:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236054AbhLVVuW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Dec 2021 16:50:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232335AbhLVVuV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Dec 2021 16:50:21 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16272C061574
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:50:21 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id o20so13689567eds.10
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=dP8lWPhTsUMHrjYLyeq3Od0jI5/BhMfE8UPPrcTNsMo=;
        b=EBr+hH0LnVPfnN6nRFiuEcuHw6dwYvr6fHef+PW73joUcldMZw0mhFjE2TDQ8u45sJ
         Egj3VW3npZvWKpM0cV45XaAxJtJ+1hvSBnSKQLNZ/saQQ2Vcao8NGqqk1lrHC+erCB1s
         JokmaWkC7P+UkBwG8Vyixc+L//M+vfIo7QFHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=dP8lWPhTsUMHrjYLyeq3Od0jI5/BhMfE8UPPrcTNsMo=;
        b=5aa+iixRecaGYogdICQ+O7knXYyTH+vTOVn2X8DDt5PvckgW3hXSCAlYw0+7tHpj1R
         j0rvA/e63dfl1M0N99PO1BSLrWmD0wpjRFk/x9m/hwmlTRpnhTXGjrsgH51VMEwbWjes
         aJcgU6Dz+VxJENstsndMLYHIqCiN2AEkEc4VK+Bp4uVLNt2zzbWYIcBLjxTZxgnoYN2x
         PcvBgQ9r5txp/ozinK1n/lolbWXPB21R0/aHFR5QI/Nlj4wPa+apKyp/Grk2ZZAzpMNY
         TwJbreJhSAzeYA1JnMFsgWzYYkKoLUMN1zZJ+Eoij11Amw1b9oZI+Pfwyc+7iRSiVfHl
         EO4w==
X-Gm-Message-State: AOAM532l4bcSuUi3StlvLUKL4tJ6X1/Jea2VWmBfa0rTypw4x6NXuxZT
        vcDKK8ge83i817lS14thz3gx2w==
X-Google-Smtp-Source: ABdhPJxcjLsSfuMBDvpguB6AhIHaXmtIvZVLPEE/d+Rx/D2SerPKf6TOVTcMOcMORugwDzlPKF4Qvw==
X-Received: by 2002:aa7:c6c8:: with SMTP id b8mr4610671eds.164.1640209819374;
        Wed, 22 Dec 2021 13:50:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 13sm1084805ejj.222.2021.12.22.13.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 13:50:18 -0800 (PST)
Date:   Wed, 22 Dec 2021 22:50:17 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 14/24] dma-buf/drivers: make reserving a shared slot
 mandatory v2
Message-ID: <YcOdmXN/FWVF2VLk@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-15-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-15-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 07, 2021 at 01:34:01PM +0100, Christian K�nig wrote:
> Audit all the users of dma_resv_add_excl_fence() and make sure they
> reserve a shared slot also when only trying to add an exclusive fence.
> 
> This is the next step towards handling the exclusive fence like a
> shared one.
> 
> v2: fix missed case in amdgpu
> 
> Signed-off-by: Christian K�nig <christian.koenig@amd.com>

Needs all the driver cc and also at least some acks/testing.

> ---
>  drivers/dma-buf/st-dma-resv.c                 | 64 +++++++++----------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  8 +++
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |  8 +--
>  drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |  3 +-
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  8 +--
>  .../drm/i915/gem/selftests/i915_gem_migrate.c |  5 +-
>  drivers/gpu/drm/i915/i915_vma.c               |  6 ++
>  .../drm/i915/selftests/intel_memory_region.c  |  7 ++
>  drivers/gpu/drm/lima/lima_gem.c               | 10 ++-
>  drivers/gpu/drm/msm/msm_gem_submit.c          | 18 +++---
>  drivers/gpu/drm/nouveau/nouveau_fence.c       |  9 +--
>  drivers/gpu/drm/panfrost/panfrost_job.c       |  4 ++
>  drivers/gpu/drm/ttm/ttm_bo_util.c             | 12 +++-
>  drivers/gpu/drm/ttm/ttm_execbuf_util.c        | 11 ++--

vc4 seems missing?

Also I think I found one bug below in the conversions.
-Daniel


>  drivers/gpu/drm/v3d/v3d_gem.c                 | 15 +++--
>  drivers/gpu/drm/vgem/vgem_fence.c             | 12 ++--
>  drivers/gpu/drm/virtio/virtgpu_gem.c          |  9 +++
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            | 16 +++--
>  18 files changed, 133 insertions(+), 92 deletions(-)
> 
> diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
> index cbe999c6e7a6..f33bafc78693 100644
> --- a/drivers/dma-buf/st-dma-resv.c
> +++ b/drivers/dma-buf/st-dma-resv.c
> @@ -75,17 +75,16 @@ static int test_signaling(void *arg, bool shared)
>  		goto err_free;
>  	}
>  
> -	if (shared) {
> -		r = dma_resv_reserve_shared(&resv, 1);
> -		if (r) {
> -			pr_err("Resv shared slot allocation failed\n");
> -			goto err_unlock;
> -		}
> +	r = dma_resv_reserve_shared(&resv, 1);
> +	if (r) {
> +		pr_err("Resv shared slot allocation failed\n");
> +		goto err_unlock;
> +	}
>  
> +	if (shared)
>  		dma_resv_add_shared_fence(&resv, f);
> -	} else {
> +	else
>  		dma_resv_add_excl_fence(&resv, f);
> -	}
>  
>  	if (dma_resv_test_signaled(&resv, shared)) {
>  		pr_err("Resv unexpectedly signaled\n");
> @@ -134,17 +133,16 @@ static int test_for_each(void *arg, bool shared)
>  		goto err_free;
>  	}
>  
> -	if (shared) {
> -		r = dma_resv_reserve_shared(&resv, 1);
> -		if (r) {
> -			pr_err("Resv shared slot allocation failed\n");
> -			goto err_unlock;
> -		}
> +	r = dma_resv_reserve_shared(&resv, 1);
> +	if (r) {
> +		pr_err("Resv shared slot allocation failed\n");
> +		goto err_unlock;
> +	}
>  
> +	if (shared)
>  		dma_resv_add_shared_fence(&resv, f);
> -	} else {
> +	else
>  		dma_resv_add_excl_fence(&resv, f);
> -	}
>  
>  	r = -ENOENT;
>  	dma_resv_for_each_fence(&cursor, &resv, shared, fence) {
> @@ -206,18 +204,17 @@ static int test_for_each_unlocked(void *arg, bool shared)
>  		goto err_free;
>  	}
>  
> -	if (shared) {
> -		r = dma_resv_reserve_shared(&resv, 1);
> -		if (r) {
> -			pr_err("Resv shared slot allocation failed\n");
> -			dma_resv_unlock(&resv);
> -			goto err_free;
> -		}
> +	r = dma_resv_reserve_shared(&resv, 1);
> +	if (r) {
> +		pr_err("Resv shared slot allocation failed\n");
> +		dma_resv_unlock(&resv);
> +		goto err_free;
> +	}
>  
> +	if (shared)
>  		dma_resv_add_shared_fence(&resv, f);
> -	} else {
> +	else
>  		dma_resv_add_excl_fence(&resv, f);
> -	}
>  	dma_resv_unlock(&resv);
>  
>  	r = -ENOENT;
> @@ -290,18 +287,17 @@ static int test_get_fences(void *arg, bool shared)
>  		goto err_resv;
>  	}
>  
> -	if (shared) {
> -		r = dma_resv_reserve_shared(&resv, 1);
> -		if (r) {
> -			pr_err("Resv shared slot allocation failed\n");
> -			dma_resv_unlock(&resv);
> -			goto err_resv;
> -		}
> +	r = dma_resv_reserve_shared(&resv, 1);
> +	if (r) {
> +		pr_err("Resv shared slot allocation failed\n");
> +		dma_resv_unlock(&resv);
> +		goto err_resv;
> +	}
>  
> +	if (shared)
>  		dma_resv_add_shared_fence(&resv, f);
> -	} else {
> +	else
>  		dma_resv_add_excl_fence(&resv, f);
> -	}
>  	dma_resv_unlock(&resv);
>  
>  	r = dma_resv_get_fences(&resv, shared, &i, &fences);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 4fcfc2313b8c..24a6b88afcca 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1367,6 +1367,14 @@ void amdgpu_bo_fence(struct amdgpu_bo *bo, struct dma_fence *fence,
>  		     bool shared)
>  {
>  	struct dma_resv *resv = bo->tbo.base.resv;
> +	int r;
> +
> +	r = dma_resv_reserve_shared(resv, 1);
> +	if (r) {
> +		/* As last resort on OOM we block for the fence */
> +		dma_fence_wait(fence, false);
> +		return;
> +	}
>  
>  	if (shared)
>  		dma_resv_add_shared_fence(resv, fence);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index 4286dc93fdaa..d4a7073190ec 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -179,11 +179,9 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
>  		struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
>  		struct dma_resv *robj = bo->obj->base.resv;
>  
> -		if (!(bo->flags & ETNA_SUBMIT_BO_WRITE)) {
> -			ret = dma_resv_reserve_shared(robj, 1);
> -			if (ret)
> -				return ret;
> -		}
> +		ret = dma_resv_reserve_shared(robj, 1);
> +		if (ret)
> +			return ret;
>  
>  		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
>  			continue;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> index f0435c6feb68..fc57ab914b60 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> @@ -100,7 +100,8 @@ bool i915_gem_clflush_object(struct drm_i915_gem_object *obj,
>  	trace_i915_gem_object_clflush(obj);
>  
>  	clflush = NULL;
> -	if (!(flags & I915_CLFLUSH_SYNC))
> +	if (!(flags & I915_CLFLUSH_SYNC) &&
> +	    dma_resv_reserve_shared(obj->base.resv, 1) == 0)
>  		clflush = clflush_work_create(obj);
>  	if (clflush) {
>  		i915_sw_fence_await_reservation(&clflush->base.chain,
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 4d7da07442f2..fc0e1625847c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -989,11 +989,9 @@ static int eb_validate_vmas(struct i915_execbuffer *eb)
>  			}
>  		}
>  
> -		if (!(ev->flags & EXEC_OBJECT_WRITE)) {
> -			err = dma_resv_reserve_shared(vma->resv, 1);
> -			if (err)
> -				return err;
> -		}
> +		err = dma_resv_reserve_shared(vma->resv, 1);
> +		if (err)
> +			return err;
>  
>  		GEM_BUG_ON(drm_mm_node_allocated(&vma->node) &&
>  			   eb_vma_misplaced(&eb->exec[i], vma, ev->flags));
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
> index 28a700f08b49..2bf491fd5cdf 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
> @@ -179,7 +179,10 @@ static int igt_lmem_pages_migrate(void *arg)
>  					  i915_gem_object_is_lmem(obj),
>  					  0xdeadbeaf, &rq);
>  		if (rq) {
> -			dma_resv_add_excl_fence(obj->base.resv, &rq->fence);
> +			err = dma_resv_reserve_shared(obj->base.resv, 1);
> +			if (!err)
> +				dma_resv_add_excl_fence(obj->base.resv,
> +							&rq->fence);
>  			i915_request_put(rq);
>  		}
>  		if (err)
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index bef795e265a6..5ec87de63963 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -1255,6 +1255,12 @@ int _i915_vma_move_to_active(struct i915_vma *vma,
>  			intel_frontbuffer_put(front);
>  		}
>  
> +		if (!(flags & __EXEC_OBJECT_NO_RESERVE)) {
> +			err = dma_resv_reserve_shared(vma->resv, 1);
> +			if (unlikely(err))
> +				return err;
> +		}
> +
>  		if (fence) {
>  			dma_resv_add_excl_fence(vma->resv, fence);
>  			obj->write_domain = I915_GEM_DOMAIN_RENDER;
> diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
> index 418caae84759..b85af1672a7e 100644
> --- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
> +++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
> @@ -894,6 +894,13 @@ static int igt_lmem_write_cpu(void *arg)
>  	}
>  
>  	i915_gem_object_lock(obj, NULL);
> +
> +	err = dma_resv_reserve_shared(obj->base.resv, 1);
> +	if (err) {
> +		i915_gem_object_unlock(obj);
> +		goto out_put;
> +	}
> +
>  	/* Put the pages into a known state -- from the gpu for added fun */
>  	intel_engine_pm_get(engine);
>  	err = intel_context_migrate_clear(engine->gt->migrate.context, NULL,
> diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
> index f9a9198ef198..b4846007463f 100644
> --- a/drivers/gpu/drm/lima/lima_gem.c
> +++ b/drivers/gpu/drm/lima/lima_gem.c
> @@ -255,13 +255,11 @@ int lima_gem_get_info(struct drm_file *file, u32 handle, u32 *va, u64 *offset)
>  static int lima_gem_sync_bo(struct lima_sched_task *task, struct lima_bo *bo,
>  			    bool write, bool explicit)
>  {
> -	int err = 0;
> +	int err;
>  
> -	if (!write) {
> -		err = dma_resv_reserve_shared(lima_bo_resv(bo), 1);
> -		if (err)
> -			return err;
> -	}
> +	err = dma_resv_reserve_shared(lima_bo_resv(bo), 1);
> +	if (err)
> +		return err;
>  
>  	/* explicit sync use user passed dep fence */
>  	if (explicit)
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 3cb029f10925..e874d09b74ef 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -320,16 +320,14 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
>  		struct drm_gem_object *obj = &submit->bos[i].obj->base;
>  		bool write = submit->bos[i].flags & MSM_SUBMIT_BO_WRITE;
>  
> -		if (!write) {
> -			/* NOTE: _reserve_shared() must happen before
> -			 * _add_shared_fence(), which makes this a slightly
> -			 * strange place to call it.  OTOH this is a
> -			 * convenient can-fail point to hook it in.
> -			 */
> -			ret = dma_resv_reserve_shared(obj->resv, 1);
> -			if (ret)
> -				return ret;
> -		}
> +		/* NOTE: _reserve_shared() must happen before
> +		 * _add_shared_fence(), which makes this a slightly
> +		 * strange place to call it.  OTOH this is a
> +		 * convenient can-fail point to hook it in.
> +		 */
> +		ret = dma_resv_reserve_shared(obj->resv, 1);
> +		if (ret)
> +			return ret;
>  
>  		/* exclusive fences must be ordered */
>  		if (no_implicit && !write)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index 26f9299df881..cd6715bd6d6b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -349,12 +349,9 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan,
>  	struct nouveau_fence *f;
>  	int ret;
>  
> -	if (!exclusive) {
> -		ret = dma_resv_reserve_shared(resv, 1);
> -
> -		if (ret)
> -			return ret;
> -	}
> +	ret = dma_resv_reserve_shared(resv, 1);
> +	if (ret)
> +		return ret;
>  
>  	dma_resv_for_each_fence(&cursor, resv, exclusive, fence) {
>  		struct nouveau_channel *prev = NULL;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 908d79520853..89c3fe389476 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -247,6 +247,10 @@ static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
>  	int i, ret;
>  
>  	for (i = 0; i < bo_count; i++) {
> +		ret = dma_resv_reserve_shared(bos[i]->resv, 1);
> +		if (ret)
> +			return ret;
> +
>  		/* panfrost always uses write mode in its current uapi */
>  		ret = drm_sched_job_add_implicit_dependencies(job, bos[i],
>  							      true);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 72a94301bc95..ea9eabcc0a0c 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -221,9 +221,6 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
>  
>  	fbo->base = *bo;
>  
> -	ttm_bo_get(bo);
> -	fbo->bo = bo;
> -
>  	/**
>  	 * Fix up members that we shouldn't copy directly:
>  	 * TODO: Explicit member copy would probably be better here.
> @@ -246,6 +243,15 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
>  	ret = dma_resv_trylock(&fbo->base.base._resv);
>  	WARN_ON(!ret);
>  
> +	ret = dma_resv_reserve_shared(&fbo->base.base._resv, 1);
> +	if (ret) {
> +		kfree(fbo);
> +		return ret;
> +	}
> +
> +	ttm_bo_get(bo);
> +	fbo->bo = bo;
> +
>  	ttm_bo_move_to_lru_tail_unlocked(&fbo->base);
>  
>  	*new_obj = &fbo->base;
> diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> index 071c48d672c6..5da922639d54 100644
> --- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> @@ -90,6 +90,7 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
>  
>  	list_for_each_entry(entry, list, head) {
>  		struct ttm_buffer_object *bo = entry->bo;
> +		unsigned int num_fences;
>  
>  		ret = ttm_bo_reserve(bo, intr, (ticket == NULL), ticket);
>  		if (ret == -EALREADY && dups) {
> @@ -100,12 +101,10 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
>  			continue;
>  		}
>  
> +		num_fences = min(entry->num_shared, 1u);
>  		if (!ret) {
> -			if (!entry->num_shared)
> -				continue;
> -
>  			ret = dma_resv_reserve_shared(bo->base.resv,
> -								entry->num_shared);
> +						      num_fences);

Needs to be at least one, otherwise you call this with 0 when we want to
install a write fence ang go boom?

>  			if (!ret)
>  				continue;
>  		}
> @@ -120,9 +119,9 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
>  			ret = ttm_bo_reserve_slowpath(bo, intr, ticket);
>  		}
>  
> -		if (!ret && entry->num_shared)
> +		if (!ret)
>  			ret = dma_resv_reserve_shared(bo->base.resv,
> -								entry->num_shared);
> +						      num_fences);
>  
>  		if (unlikely(ret != 0)) {
>  			if (ticket) {
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index c7ed2e1cbab6..1bea90e40ce1 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -259,16 +259,21 @@ v3d_lock_bo_reservations(struct v3d_job *job,
>  		return ret;
>  
>  	for (i = 0; i < job->bo_count; i++) {
> +		ret = dma_resv_reserve_shared(job->bo[i]->resv, 1);
> +		if (ret)
> +			goto fail;
> +
>  		ret = drm_sched_job_add_implicit_dependencies(&job->base,
>  							      job->bo[i], true);
> -		if (ret) {
> -			drm_gem_unlock_reservations(job->bo, job->bo_count,
> -						    acquire_ctx);
> -			return ret;
> -		}
> +		if (ret)
> +			goto fail;
>  	}
>  
>  	return 0;
> +
> +fail:
> +	drm_gem_unlock_reservations(job->bo, job->bo_count, acquire_ctx);
> +	return ret;
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
> index bd6f75285fd9..a4cb296d4fcd 100644
> --- a/drivers/gpu/drm/vgem/vgem_fence.c
> +++ b/drivers/gpu/drm/vgem/vgem_fence.c
> @@ -157,12 +157,14 @@ int vgem_fence_attach_ioctl(struct drm_device *dev,
>  	}
>  
>  	/* Expose the fence via the dma-buf */
> -	ret = 0;
>  	dma_resv_lock(resv, NULL);
> -	if (arg->flags & VGEM_FENCE_WRITE)
> -		dma_resv_add_excl_fence(resv, fence);
> -	else if ((ret = dma_resv_reserve_shared(resv, 1)) == 0)
> -		dma_resv_add_shared_fence(resv, fence);
> +	ret = dma_resv_reserve_shared(resv, 1);
> +	if (!ret) {
> +		if (arg->flags & VGEM_FENCE_WRITE)
> +			dma_resv_add_excl_fence(resv, fence);
> +		else
> +			dma_resv_add_shared_fence(resv, fence);
> +	}
>  	dma_resv_unlock(resv);
>  
>  	/* Record the fence in our idr for later signaling */
> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
> index 2de61b63ef91..aec105cdd64c 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> @@ -214,6 +214,7 @@ void virtio_gpu_array_add_obj(struct virtio_gpu_object_array *objs,
>  
>  int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs)
>  {
> +	unsigned int i;
>  	int ret;
>  
>  	if (objs->nents == 1) {
> @@ -222,6 +223,14 @@ int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs)
>  		ret = drm_gem_lock_reservations(objs->objs, objs->nents,
>  						&objs->ticket);
>  	}
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < objs->nents; ++i) {
> +		ret = dma_resv_reserve_shared(objs->objs[i]->resv, 1);
> +		if (ret)
> +			return ret;
> +	}
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> index c97a3d5e90ce..6d0abc2b0beb 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -1053,16 +1053,22 @@ void vmw_bo_fence_single(struct ttm_buffer_object *bo,
>  			 struct vmw_fence_obj *fence)
>  {
>  	struct ttm_device *bdev = bo->bdev;
> -
>  	struct vmw_private *dev_priv =
>  		container_of(bdev, struct vmw_private, bdev);
> +	int ret;
>  
> -	if (fence == NULL) {
> +	if (fence == NULL)
>  		vmw_execbuf_fence_commands(NULL, dev_priv, &fence, NULL);
> +	else
> +		dma_fence_get(&fence->base);
> +
> +	ret = dma_resv_reserve_shared(bo->base.resv, 1);
> +	if (!ret)
>  		dma_resv_add_excl_fence(bo->base.resv, &fence->base);
> -		dma_fence_put(&fence->base);
> -	} else
> -		dma_resv_add_excl_fence(bo->base.resv, &fence->base);
> +	else
> +		/* Last resort fallback when we are OOM */
> +		dma_fence_wait(&fence->base, false);
> +	dma_fence_put(&fence->base);
>  }
>  
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
