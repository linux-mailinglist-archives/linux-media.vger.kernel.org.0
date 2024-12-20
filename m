Return-Path: <linux-media+bounces-23882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 314329F92EE
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:16:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 131F81897E47
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 13:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7008A215706;
	Fri, 20 Dec 2024 13:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vMqd6Xb8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69B32153E9;
	Fri, 20 Dec 2024 13:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734700578; cv=none; b=G7sbhCyEsISqbHigQUtUhc/wJDq49nPDtm1gpL/Xg3RxaXU3b/BNIgfPdvGzhpmY8jkqxvqB77knGD5jPxnBLX801fWIC4QMG+r1joWTMxhspAYF8QcfYVGbmp0IhagLSdhvf5EGrB1XRp3/fmlzxGiCFsEKbAtZquUtfMtPkK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734700578; c=relaxed/simple;
	bh=HW2NB3RLlz1sHjz2v0FJgpUnVY1H17qnQRWZ0o4EcvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mb910g6JoTu/F1Uj15sfix12v1DhqPKrPDo4GQGdQ6ABiiSUWYMzjuquXr0kmRHAv3VjHkTPuvSh9nCwQ1xNkG86kvDaagV9l0HQS87BzQP2S/nb1u6pdIdhFp81Mnc+c1Qe+0yh4t3/xsl4SOj+1A+37+IDfvLv3ED6QGh8Ga0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vMqd6Xb8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02207C4CECD;
	Fri, 20 Dec 2024 13:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734700578;
	bh=HW2NB3RLlz1sHjz2v0FJgpUnVY1H17qnQRWZ0o4EcvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vMqd6Xb8v1isHfv02UzldAlAiuv3jymk/+RhpSSmNvJBVkVdg8Gii7/mkTBqQGvpw
	 /NBdqokAhSef0r7sT2XLKrI3htXwehWud3CBKX22GxZ/ONm1hDrJa7bAeJBAwhjk5y
	 j4aPJeP29LvMcIOzPF+nNoIDzr3fO+gB87Xb3x3LlzwiLq+3hfwglgY134PyY192E0
	 vbv3QUfKehAD0vgpNC/Nl1lU+JVcISiMl/v0spO1EcKQl/R9qiPAaFXF5Szpy3UW9Z
	 eGzfEwijgyBgA3MjfnyB497WuwSNRfob7QVHCsBLU3yauNgYM2Msvn8zeyeiPIN/na
	 RrcVGWrpiWxjg==
Date: Fri, 20 Dec 2024 14:16:12 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Luben Tuikov <ltuikov89@gmail.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH] drm/sched: Document run_job() refcount hazard
Message-ID: <Z2VuHBHbFEwIyEwm@pollux>
References: <20241220124515.93169-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241220124515.93169-2-phasta@kernel.org>

On Fri, Dec 20, 2024 at 01:45:15PM +0100, Philipp Stanner wrote:
> From: Philipp Stanner <pstanner@redhat.com>
> 
> drm_sched_backend_ops.run_job() returns a dma_fence for the scheduler.
> That fence is signalled by the driver once the hardware completed the
> associated job. The scheduler does not increment the reference count on
> that fence, but implicitly expects to inherit this fence from run_job().
> 
> This is relatively subtle and prone to misunderstandings.
> 
> This implies that, to keep a reference for itself, a driver needs to
> call dma_fence_get() in addition to dma_fence_init() in that callback.

I think that's a bit too specific. It's just that the returned dma_fence pointer
of run_job() must be backed by a reference, otherwise it can't be valid.

Everything else is an implementation detail of the driver.

> 
> It's further complicated by the fact that the scheduler even decrements
> the refcount in drm_sched_run_job_work() since it created a new
> reference in drm_sched_fence_scheduled(). It does, however, still use

Those two are unrelated. The decrement comes from the reference count that has
to be taken to return the fence in run_job().

The reference count in drm_sched_fence_set_parent() is for s_fence->parent.

> its pointer to the fence after calling dma_fence_put() - which is safe
> because of the aforementioned new reference, but actually still violates
> the refcounting rules.
> 
> Improve the explanatory comment for that decrement.
> 
> Move the call to dma_fence_put() to the position behind the last usage
> of the fence.
> 
> Document the necessity to increment the reference count in
> drm_sched_backend_ops.run_job().
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

You may want to add

Suggested-by: Danilo Krummrich <dakr@kernel.org>

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 10 +++++++---
>  include/drm/gpu_scheduler.h            | 20 ++++++++++++++++----
>  2 files changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 7ce25281c74c..d6f8df39d848 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1218,15 +1218,19 @@ static void drm_sched_run_job_work(struct work_struct *w)
>  	drm_sched_fence_scheduled(s_fence, fence);
>  
>  	if (!IS_ERR_OR_NULL(fence)) {
> -		/* Drop for original kref_init of the fence */
> -		dma_fence_put(fence);
> -
>  		r = dma_fence_add_callback(fence, &sched_job->cb,
>  					   drm_sched_job_done_cb);
>  		if (r == -ENOENT)
>  			drm_sched_job_done(sched_job, fence->error);
>  		else if (r)
>  			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
> +
> +		/*
> +		 * s_fence took a new reference to fence in the call to
> +		 * drm_sched_fence_scheduled() above. The reference passed by
> +		 * run_job() above is now not needed any longer. Drop it.
> +		 */

Taking a new reference in drm_sched_fence_set_parent() is not an argument for
dropping the reference taken by run_job() here. drm_sched_fence_set_parent()
takes this reference for s_fence->parent.

> +		dma_fence_put(fence);
>  	} else {
>  		drm_sched_job_done(sched_job, IS_ERR(fence) ?
>  				   PTR_ERR(fence) : 0);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 95e17504e46a..a1f5c9a14278 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -420,10 +420,22 @@ struct drm_sched_backend_ops {
>  					 struct drm_sched_entity *s_entity);
>  
>  	/**
> -         * @run_job: Called to execute the job once all of the dependencies
> -         * have been resolved.  This may be called multiple times, if
> -	 * timedout_job() has happened and drm_sched_job_recovery()
> -	 * decides to try it again.
> +	 * @run_job: Called to execute the job once all of the dependencies
> +	 * have been resolved. This may be called multiple times, if
> +	 * timedout_job() has happened and drm_sched_job_recovery() decides to
> +	 * try it again.
> +	 *
> +	 * @sched_job: the job to run
> +	 *
> +	 * Returns: dma_fence the driver must signal once the hardware has
> +	 *	completed the job ("hardware fence").
> +	 *
> +	 * Note that the scheduler expects to 'inherit' its own reference to
> +	 * this fence from the callback. It does not invoke an extra

That's not wrong, but I wouldn't say the scheduler expects to inherit the
reference. When a function returns a fence pointer it *has* to make sure to take
it's own reference. Otherwise the pointer may be invalid once used by the
caller.

> +	 * dma_fence_get() on it. Consequently, this callback must return a
> +	 * fence whose refcount is at least 2: One for the scheduler's
> +	 * reference returned here, another one for the reference kept by the
> +	 * driver.
>  	 */
>  	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
>  
> -- 
> 2.47.1
> 

