Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 937DD3EAAF2
	for <lists+linux-media@lfdr.de>; Thu, 12 Aug 2021 21:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhHLT2l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Aug 2021 15:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbhHLT2k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Aug 2021 15:28:40 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7579C061756
        for <linux-media@vger.kernel.org>; Thu, 12 Aug 2021 12:28:14 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id r7so9899193wrs.0
        for <linux-media@vger.kernel.org>; Thu, 12 Aug 2021 12:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zQc5Xq0ndIRpgKH8ghD8CcpcMwMivDHL9fVBcQMh8YI=;
        b=Txj5PMLCQzEaiL5VP9XFbfZEfGFW8a92aEJuMiuEBU16ocYEhp1opugyO9eDpFciIE
         ZlL/jggYQqHWMqdaHm2q06oI1LJmx56SytQogrQlnD1sdIh+OEwstRRmRWV4O4gjPQLA
         Hk65sdIdfJPtAqTBVj7k2YpFIoJ0TCkwkquqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zQc5Xq0ndIRpgKH8ghD8CcpcMwMivDHL9fVBcQMh8YI=;
        b=hVprLb2GYGf1tpbzLxWUfE/i9M6MV0bsEPpFsXID9plBl+YntkgGT/mOmmphYXYb0q
         vv19zprTddDDrRQDk0MbG7pnZL9fqoHc0GEcxXtXBHfaRYYDX+nATsKp4mfADQusdeWZ
         P8PGjkeXwddjoiK9+gu9+6KMc0Zlqf9M+K4vN9qem7Iw9dgV5hI6MnszW8sXRZe+Yv3D
         T7Swu3/o4rd1vghaI9MiTnQMpfCUWWiwDQowGZ8GkO+w0v3RbVv5bfrQumD6SQXKamON
         aMLGH91YDGrWK6nVos+TNQVmPfbX+M9avUFXYr6KtWybt5CZp9tsJlWTOu7IlDF5ACq5
         QvwQ==
X-Gm-Message-State: AOAM5326uT/rIVVttncOY2X0XM3Nba2zbgXVREbUUEzq2s7Bz7HYZU+P
        I8965EPhOCWhbnKyv4eET11BYw==
X-Google-Smtp-Source: ABdhPJxbk6lUfPYBtitJTGKWp+uNV4BEkm19ABgyYmwl3SPKqhTtE8vs0geO51IqJ6EU7krY5z5aXQ==
X-Received: by 2002:adf:ef85:: with SMTP id d5mr5725537wro.372.1628796493353;
        Thu, 12 Aug 2021 12:28:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y3sm3822669wma.32.2021.08.12.12.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 12:28:12 -0700 (PDT)
Date:   Thu, 12 Aug 2021 21:28:11 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Qiang Yu <yuq825@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        lima@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 08/20] drm/lima: use scheduler dependency tracking
Message-ID: <YRV2ShnIbOyaHG8X@phenom.ffwll.local>
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-9-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210805104705.862416-9-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 05, 2021 at 12:46:53PM +0200, Daniel Vetter wrote:
> Nothing special going on here.
> 
> Aside reviewing the code, it seems like drm_sched_job_arm() should be
> moved into lima_sched_context_queue_task and put under some mutex
> together with drm_sched_push_job(). See the kerneldoc for
> drm_sched_push_job().
> 
> v2: Rebase over renamed functions to add dependencies.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Qiang Yu <yuq825@gmail.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: lima@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org

Ping for an ack here please. Testing would be even better ofc.
-Daniel

> ---
>  drivers/gpu/drm/lima/lima_gem.c   |  6 ++++--
>  drivers/gpu/drm/lima/lima_sched.c | 21 ---------------------
>  drivers/gpu/drm/lima/lima_sched.h |  3 ---
>  3 files changed, 4 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
> index c528f40981bb..640acc060467 100644
> --- a/drivers/gpu/drm/lima/lima_gem.c
> +++ b/drivers/gpu/drm/lima/lima_gem.c
> @@ -267,7 +267,9 @@ static int lima_gem_sync_bo(struct lima_sched_task *task, struct lima_bo *bo,
>  	if (explicit)
>  		return 0;
>  
> -	return drm_gem_fence_array_add_implicit(&task->deps, &bo->base.base, write);
> +	return drm_sched_job_add_implicit_dependencies(&task->base,
> +						       &bo->base.base,
> +						       write);
>  }
>  
>  static int lima_gem_add_deps(struct drm_file *file, struct lima_submit *submit)
> @@ -285,7 +287,7 @@ static int lima_gem_add_deps(struct drm_file *file, struct lima_submit *submit)
>  		if (err)
>  			return err;
>  
> -		err = drm_gem_fence_array_add(&submit->task->deps, fence);
> +		err = drm_sched_job_add_dependency(&submit->task->base, fence);
>  		if (err) {
>  			dma_fence_put(fence);
>  			return err;
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index e968b5a8f0b0..99d5f6f1a882 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -134,24 +134,15 @@ int lima_sched_task_init(struct lima_sched_task *task,
>  	task->num_bos = num_bos;
>  	task->vm = lima_vm_get(vm);
>  
> -	xa_init_flags(&task->deps, XA_FLAGS_ALLOC);
> -
>  	return 0;
>  }
>  
>  void lima_sched_task_fini(struct lima_sched_task *task)
>  {
> -	struct dma_fence *fence;
> -	unsigned long index;
>  	int i;
>  
>  	drm_sched_job_cleanup(&task->base);
>  
> -	xa_for_each(&task->deps, index, fence) {
> -		dma_fence_put(fence);
> -	}
> -	xa_destroy(&task->deps);
> -
>  	if (task->bos) {
>  		for (i = 0; i < task->num_bos; i++)
>  			drm_gem_object_put(&task->bos[i]->base.base);
> @@ -186,17 +177,6 @@ struct dma_fence *lima_sched_context_queue_task(struct lima_sched_task *task)
>  	return fence;
>  }
>  
> -static struct dma_fence *lima_sched_dependency(struct drm_sched_job *job,
> -					       struct drm_sched_entity *entity)
> -{
> -	struct lima_sched_task *task = to_lima_task(job);
> -
> -	if (!xa_empty(&task->deps))
> -		return xa_erase(&task->deps, task->last_dep++);
> -
> -	return NULL;
> -}
> -
>  static int lima_pm_busy(struct lima_device *ldev)
>  {
>  	int ret;
> @@ -472,7 +452,6 @@ static void lima_sched_free_job(struct drm_sched_job *job)
>  }
>  
>  static const struct drm_sched_backend_ops lima_sched_ops = {
> -	.dependency = lima_sched_dependency,
>  	.run_job = lima_sched_run_job,
>  	.timedout_job = lima_sched_timedout_job,
>  	.free_job = lima_sched_free_job,
> diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lima_sched.h
> index ac70006b0e26..6a11764d87b3 100644
> --- a/drivers/gpu/drm/lima/lima_sched.h
> +++ b/drivers/gpu/drm/lima/lima_sched.h
> @@ -23,9 +23,6 @@ struct lima_sched_task {
>  	struct lima_vm *vm;
>  	void *frame;
>  
> -	struct xarray deps;
> -	unsigned long last_dep;
> -
>  	struct lima_bo **bos;
>  	int num_bos;
>  
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
