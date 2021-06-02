Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72C493992DF
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 20:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhFBSxy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 14:53:54 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:45619 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhFBSxv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Jun 2021 14:53:51 -0400
Received: by mail-wm1-f47.google.com with SMTP id s5-20020a7bc0c50000b0290147d0c21c51so2249241wmh.4
        for <linux-media@vger.kernel.org>; Wed, 02 Jun 2021 11:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=aTlA1R4McHWKaA+ff0ncbeW9bn9mxbO4EyyqYhknXdc=;
        b=J9pDtLrpbzhifCP+ijtKYLfxTlB1qrM1dlU5m5LAPN274FFPSXuGCQ0qO07PzrHpPS
         xDOkE+PpCGPurHcVtipo2jlogw/4XOAL+zRnHRPsxBOXPq4Xinjr+n0GXrbp/JWNGaEr
         2wy5pKvw/f6wHkGQmyTPV4UWh85VHIXUAJfWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=aTlA1R4McHWKaA+ff0ncbeW9bn9mxbO4EyyqYhknXdc=;
        b=Pd7VvY+TBziPUBBjRbz896DC/N8ga/ir7hWu1VGF3t9YuXjDARFscgBb8de3yon0ch
         8WW3709V3n0KkM1SbMNL/ad9nxYp7xh2zquwRFPitQ4t6BMeVTIn11eCf85Qw4nat4ql
         MwwLx9hnFxi0HIOZJBvC88vq+IW0cYL6X4WDMDlSXxYQ3LfwclZKp+6x7/Q3JzkIwyT/
         khVqZsEgvYA1ru/xyYMEtZ1K0jVUstSjsqXs4Kd3d2SOKkRcadXKIWNyQbFpQ7en55kW
         eiE0QxF6KTFyJpSCNqTa4yM4/sDM08mjIT4ROyjBHwTivZcCI79FWSqjopdxhdQzE/ex
         ic+g==
X-Gm-Message-State: AOAM531Qn/KAx6m6Aw/ftlEhsCFRCBfh2fhTOKwlMVx0JXM1+Y80ZbUg
        FClRzAaY7pnAuvKRE/A8VImMTg==
X-Google-Smtp-Source: ABdhPJzsfoWSOAnfvcLWKpvuKrdKNBHw+ulaYJsxytVsJTei0p1Em0n57D3/Mu8wyidwBu4iyE+ilw==
X-Received: by 2002:a1c:4e03:: with SMTP id g3mr6385648wmh.127.1622659867494;
        Wed, 02 Jun 2021 11:51:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id k5sm827328wrv.85.2021.06.02.11.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 11:51:07 -0700 (PDT)
Date:   Wed, 2 Jun 2021 20:51:05 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Steven Price <steven.price@arm.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH 03/11] drm/panfrost: Use xarray and helpers for depedency
 tracking
Message-ID: <YLfTGbb52KtbPk7q@phenom.ffwll.local>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-3-daniel.vetter@ffwll.ch>
 <2054fee7-dcd2-a4fa-5d50-7fe6f1b474be@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2054fee7-dcd2-a4fa-5d50-7fe6f1b474be@arm.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 02, 2021 at 03:06:50PM +0100, Steven Price wrote:
> On 21/05/2021 10:09, Daniel Vetter wrote:
> > More consistency and prep work for the next patch.
> > 
> > Aside: I wonder whether we shouldn't just move this entire xarray
> > business into the scheduler so that not everyone has to reinvent the
> > same wheels. Cc'ing some scheduler people for this too.
> > 
> > Cc: "Christian K�nig" <christian.koenig@amd.com>
> > Cc: Luben Tuikov <luben.tuikov@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: Steven Price <steven.price@arm.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> 
> Two comments below, but otherwise looks like a nice cleanup.

Thanks for taking a look.

> > ---
> >  drivers/gpu/drm/panfrost/panfrost_drv.c | 41 ++++++++---------
> >  drivers/gpu/drm/panfrost/panfrost_job.c | 61 ++++++++++---------------
> >  drivers/gpu/drm/panfrost/panfrost_job.h |  8 ++--
> >  3 files changed, 46 insertions(+), 64 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > index ca07098a6141..7977b4752b5c 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > @@ -137,12 +137,6 @@ panfrost_lookup_bos(struct drm_device *dev,
> >  	if (!job->bo_count)
> >  		return 0;
> >  
> > -	job->implicit_fences = kvmalloc_array(job->bo_count,
> > -				  sizeof(struct dma_fence *),
> > -				  GFP_KERNEL | __GFP_ZERO);
> > -	if (!job->implicit_fences)
> > -		return -ENOMEM;
> > -
> >  	ret = drm_gem_objects_lookup(file_priv,
> >  				     (void __user *)(uintptr_t)args->bo_handles,
> >  				     job->bo_count, &job->bos);
> > @@ -173,7 +167,7 @@ panfrost_lookup_bos(struct drm_device *dev,
> >  }
> >  
> >  /**
> > - * panfrost_copy_in_sync() - Sets up job->in_fences[] with the sync objects
> > + * panfrost_copy_in_sync() - Sets up job->deps with the sync objects
> >   * referenced by the job.
> >   * @dev: DRM device
> >   * @file_priv: DRM file for this fd
> > @@ -193,22 +187,14 @@ panfrost_copy_in_sync(struct drm_device *dev,
> >  {
> >  	u32 *handles;
> >  	int ret = 0;
> > -	int i;
> > +	int i, in_fence_count;
> >  
> > -	job->in_fence_count = args->in_sync_count;
> > +	in_fence_count = args->in_sync_count;
> >  
> > -	if (!job->in_fence_count)
> > +	if (!in_fence_count)
> >  		return 0;
> >  
> > -	job->in_fences = kvmalloc_array(job->in_fence_count,
> > -					sizeof(struct dma_fence *),
> > -					GFP_KERNEL | __GFP_ZERO);
> > -	if (!job->in_fences) {
> > -		DRM_DEBUG("Failed to allocate job in fences\n");
> > -		return -ENOMEM;
> > -	}
> > -
> > -	handles = kvmalloc_array(job->in_fence_count, sizeof(u32), GFP_KERNEL);
> > +	handles = kvmalloc_array(in_fence_count, sizeof(u32), GFP_KERNEL);
> >  	if (!handles) {
> >  		ret = -ENOMEM;
> >  		DRM_DEBUG("Failed to allocate incoming syncobj handles\n");
> > @@ -217,16 +203,23 @@ panfrost_copy_in_sync(struct drm_device *dev,
> >  
> >  	if (copy_from_user(handles,
> >  			   (void __user *)(uintptr_t)args->in_syncs,
> > -			   job->in_fence_count * sizeof(u32))) {
> > +			   in_fence_count * sizeof(u32))) {
> >  		ret = -EFAULT;
> >  		DRM_DEBUG("Failed to copy in syncobj handles\n");
> >  		goto fail;
> >  	}
> >  
> > -	for (i = 0; i < job->in_fence_count; i++) {
> > +	for (i = 0; i < in_fence_count; i++) {
> > +		struct dma_fence *fence;
> > +
> >  		ret = drm_syncobj_find_fence(file_priv, handles[i], 0, 0,
> > -					     &job->in_fences[i]);
> > -		if (ret == -EINVAL)
> > +					     &fence);
> > +		if (ret)
> > +			goto fail;
> > +
> > +		ret = drm_gem_fence_array_add(&job->deps, fence);
> > +
> > +		if (ret)
> >  			goto fail;
> >  	}
> >  
> > @@ -264,6 +257,8 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
> >  
> >  	kref_init(&job->refcount);
> >  
> > +	xa_init_flags(&job->deps, XA_FLAGS_ALLOC);
> > +
> >  	job->pfdev = pfdev;
> >  	job->jc = args->jc;
> >  	job->requirements = args->requirements;
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index f5d39ee14ab5..707d912ff64a 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -196,14 +196,21 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
> >  	job_write(pfdev, JS_COMMAND_NEXT(js), JS_COMMAND_START);
> >  }
> >  
> > -static void panfrost_acquire_object_fences(struct drm_gem_object **bos,
> > -					   int bo_count,
> > -					   struct dma_fence **implicit_fences)
> > +static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
> > +					  int bo_count,
> > +					  struct xarray *deps)
> >  {
> > -	int i;
> > +	int i, ret;
> >  
> > -	for (i = 0; i < bo_count; i++)
> > -		implicit_fences[i] = dma_resv_get_excl_rcu(bos[i]->resv);
> > +	for (i = 0; i < bo_count; i++) {
> > +		struct dma_fence *fence = dma_resv_get_excl_rcu(bos[i]->resv);
> > +
> > +		ret = drm_gem_fence_array_add(deps, fence);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return 0;
> >  }
> >  
> >  static void panfrost_attach_object_fences(struct drm_gem_object **bos,
> > @@ -236,8 +243,10 @@ int panfrost_job_push(struct panfrost_job *job)
> >  
> >  	kref_get(&job->refcount); /* put by scheduler job completion */
> >  
> > -	panfrost_acquire_object_fences(job->bos, job->bo_count,
> > -				       job->implicit_fences);
> > +	ret = panfrost_acquire_object_fences(job->bos, job->bo_count,
> > +					     &job->deps);
> > +	if (ret)
> > +		goto unlock;
> 
> I think this needs to move above the kref_get() otherwise we'll leak the
> job on failure.

Indeed, will fix for the next version.

> 
> >  
> >  	drm_sched_entity_push_job(&job->base, entity);
> >  
> > @@ -254,18 +263,15 @@ static void panfrost_job_cleanup(struct kref *ref)
> >  {
> >  	struct panfrost_job *job = container_of(ref, struct panfrost_job,
> >  						refcount);
> > +	struct dma_fence *fence;
> > +	unsigned long index;
> >  	unsigned int i;
> >  
> > -	if (job->in_fences) {
> > -		for (i = 0; i < job->in_fence_count; i++)
> > -			dma_fence_put(job->in_fences[i]);
> > -		kvfree(job->in_fences);
> > -	}
> > -	if (job->implicit_fences) {
> > -		for (i = 0; i < job->bo_count; i++)
> > -			dma_fence_put(job->implicit_fences[i]);
> > -		kvfree(job->implicit_fences);
> > +	xa_for_each(&job->deps, index, fence) {
> > +		dma_fence_put(fence);
> >  	}
> > +	xa_destroy(&job->deps);
> > +
> >  	dma_fence_put(job->done_fence);
> >  	dma_fence_put(job->render_done_fence);
> >  
> > @@ -308,26 +314,9 @@ static struct dma_fence *panfrost_job_dependency(struct drm_sched_job *sched_job
> >  						 struct drm_sched_entity *s_entity)
> >  {
> >  	struct panfrost_job *job = to_panfrost_job(sched_job);
> > -	struct dma_fence *fence;
> > -	unsigned int i;
> >  
> > -	/* Explicit fences */
> > -	for (i = 0; i < job->in_fence_count; i++) {
> > -		if (job->in_fences[i]) {
> > -			fence = job->in_fences[i];
> > -			job->in_fences[i] = NULL;
> > -			return fence;
> > -		}
> > -	}
> > -
> > -	/* Implicit fences, max. one per BO */
> > -	for (i = 0; i < job->bo_count; i++) {
> > -		if (job->implicit_fences[i]) {
> > -			fence = job->implicit_fences[i];
> > -			job->implicit_fences[i] = NULL;
> > -			return fence;
> > -		}
> > -	}
> > +	if (!xa_empty(&job->deps))
> > +		return xa_erase(&job->deps, job->last_dep++);
> 
> Rather than tracking last_dep separately this could be written using
> xa_find():
> 
>     if (xa_find(&job->deps, &i, ULONG_MAX, XA_PRESENT))
> 	return xa_erase(&job->deps, &i);

I copypasted this from other drivers, imo consistency is better than
looking pretty. I think eventually we should stuff this as optional
helpers into drm/scheduler.

Also yours walks the xa twice.
-Daniel

> 
> Steve
> 
> >  
> >  	return NULL;
> >  }
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
> > index bbd3ba97ff67..82306a03b57e 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.h
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.h
> > @@ -19,9 +19,9 @@ struct panfrost_job {
> >  	struct panfrost_device *pfdev;
> >  	struct panfrost_file_priv *file_priv;
> >  
> > -	/* Optional fences userspace can pass in for the job to depend on. */
> > -	struct dma_fence **in_fences;
> > -	u32 in_fence_count;
> > +	/* Contains both explicit and implicit fences */
> > +	struct xarray deps;
> > +	unsigned long last_dep;
> >  
> >  	/* Fence to be signaled by IRQ handler when the job is complete. */
> >  	struct dma_fence *done_fence;
> > @@ -30,8 +30,6 @@ struct panfrost_job {
> >  	__u32 requirements;
> >  	__u32 flush_id;
> >  
> > -	/* Exclusive fences we have taken from the BOs to wait for */
> > -	struct dma_fence **implicit_fences;
> >  	struct panfrost_gem_mapping **mappings;
> >  	struct drm_gem_object **bos;
> >  	u32 bo_count;
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
