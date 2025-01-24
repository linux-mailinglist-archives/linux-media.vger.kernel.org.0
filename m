Return-Path: <linux-media+bounces-25262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 859B8A1B5E5
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 13:27:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7B60161EEF
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 12:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C0D21B199;
	Fri, 24 Jan 2025 12:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eBkTwDPX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CBD1CEEA4;
	Fri, 24 Jan 2025 12:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737721647; cv=none; b=mDaITazMM/VSrFwWyudsikcC10Egbsu4QUIGC8zxEhfvMM5lPx8uBl1iP8hFE8CrNXyYd7Zh5GlTs5qa7DqWoe5QM+gucMZhXtOORq6OgtwDzHfszQiB25+2wsZBewTlUZom2PJ2LI9z9DBnS739jTL6plj0TXM6Hi/Y87aBBGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737721647; c=relaxed/simple;
	bh=+WjLRzIvgDcphFpxBffYBdd+ltPK1ZHMHAmZ7xKpbuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLbUNSHlRiSo3rMh3AD8CEgBkM9kykTo5vgIxGCm0ZBNpdd8qBehf8QMF8pnAEzNZmNbJKuCtp4FWChDV8a+Xdsg4ZIyAbyChMMmvMrnMDMd8VJsWpEHwIKDaYcnFGNjk/IdS9ppsX5tiglLCKvFRaaOGErqP+b0JOoY3oI/nTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eBkTwDPX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC3DCC4CEDD;
	Fri, 24 Jan 2025 12:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737721646;
	bh=+WjLRzIvgDcphFpxBffYBdd+ltPK1ZHMHAmZ7xKpbuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eBkTwDPX0NlglTo3JToyEyHgXp0sNWWKbM4d2tmTEeL19FCjYSzfd75AQ+6s1rVPH
	 QIuwiEvD2MrRfN+uwMWWkQnyQUYgQ4rbQ9bqVXtuS7Q5vzcnKICatNYn71VPgG1Hbw
	 12DxiIYhLhKQtE6wmKjRyvVjtgbV84Vj/ISbZdTkP6j3yW5+5XxVMVsA3Fgm7DbX3n
	 5M1nIcUtkZZU1l/K/YuWtZkLdEopznnSPZ3gplV3VLcP8w/WoecB86GNKplUO1qi6l
	 PIvUUQXsL4vFPNoX9zLs1xPWSq2d3M1Q9+cjii+BiWDcRXbjpUiDq4rVebqwcBgCzZ
	 yH8h3kc5kBHxg==
Date: Fri, 24 Jan 2025 13:27:20 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 3/3] drm/sched: Update timedout_job()'s documentation
Message-ID: <Z5OHKHZRBed_bxF6@pollux>
References: <20250121151544.44949-2-phasta@kernel.org>
 <20250121151544.44949-6-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121151544.44949-6-phasta@kernel.org>

On Tue, Jan 21, 2025 at 04:15:46PM +0100, Philipp Stanner wrote:
> drm_sched_backend_ops.timedout_job()'s documentation is outdated. It
> mentions the deprecated function drm_sched_resubmit_job(). Furthermore,
> it does not point out the important distinction between hardware and
> firmware schedulers.
> 
> Since firmware schedulers tyipically only use one entity per scheduler,
> timeout handling is significantly more simple because the entity the
> faulted job came from can just be killed without affecting innocent
> processes.
> 
> Update the documentation with that distinction and other details.
> 
> Reformat the docstring to work to a unified style with the other
> handles.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>  include/drm/gpu_scheduler.h | 82 ++++++++++++++++++++++---------------
>  1 file changed, 49 insertions(+), 33 deletions(-)
> 
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index cf40fdb55541..4806740b9023 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -394,8 +394,14 @@ static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
>  }
>  
>  enum drm_gpu_sched_stat {
> -	DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
> +	/* Reserve 0 */
> +	DRM_GPU_SCHED_STAT_NONE,
> +
> +	/* Operation succeeded */
>  	DRM_GPU_SCHED_STAT_NOMINAL,
> +
> +	/* Failure because dev is no longer available, for example because
> +	 * it was unplugged. */
>  	DRM_GPU_SCHED_STAT_ENODEV,
>  };
>  
> @@ -447,43 +453,53 @@ struct drm_sched_backend_ops {
>  	 * @timedout_job: Called when a job has taken too long to execute,
>  	 * to trigger GPU recovery.
>  	 *
> -	 * This method is called in a workqueue context.

Why remove this line?

> +	 * @sched_job: The job that has timed out
>  	 *
> -	 * Drivers typically issue a reset to recover from GPU hangs, and this
> -	 * procedure usually follows the following workflow:
> +	 * Returns: A drm_gpu_sched_stat enum.

Maybe "The status of the scheduler, defined by &drm_gpu_sched_stat".

I think you forgot to add the corresponding parts in the documentation of
drm_gpu_sched_stat.

>  	 *
> -	 * 1. Stop the scheduler using drm_sched_stop(). This will park the
> -	 *    scheduler thread and cancel the timeout work, guaranteeing that
> -	 *    nothing is queued while we reset the hardware queue
> -	 * 2. Try to gracefully stop non-faulty jobs (optional)
> -	 * 3. Issue a GPU reset (driver-specific)
> -	 * 4. Re-submit jobs using drm_sched_resubmit_jobs()
> -	 * 5. Restart the scheduler using drm_sched_start(). At that point, new
> -	 *    jobs can be queued, and the scheduler thread is unblocked
> +	 * Drivers typically issue a reset to recover from GPU hangs.
> +	 * This procedure looks very different depending on whether a firmware
> +	 * or a hardware scheduler is being used.
> +	 *
> +	 * For a FIRMWARE SCHEDULER, each (pseudo-)ring has one scheduler, and

Why pseudo? It's still a real ring buffer.

> +	 * each scheduler has one entity. Hence, you typically follow those
> +	 * steps:

Maybe better "Hence, the steps taken typically look as follows:".

> +	 *
> +	 * 1. Stop the scheduler using drm_sched_stop(). This will pause the
> +	 *    scheduler workqueues and cancel the timeout work, guaranteeing
> +	 *    that nothing is queued while we remove the ring.

"while the ring is removed"

> +	 * 2. Remove the ring. In most (all?) cases the firmware will make sure

At least I don't know about other cases and I also don't think it'd make a lot
of sense if it'd be different. But of course there's no rule preventing people
to implement things weirdly.

> +	 *    that the corresponding parts of the hardware are resetted, and that
> +	 *    other rings are not impacted.
> +	 * 3. Kill the entity the faulted job stems from, and the associated

There can only be one entity in this case, so you can drop "the faulted job
stems from".

> +	 *    scheduler.
> +	 *
> +	 *
> +	 * For a HARDWARE SCHEDULER, each ring also has one scheduler, but each
> +	 * scheduler is typically associated with many entities. This implies

What about "each scheduler can be scheduling one or more entities"?

> +	 * that all entities associated with the affected scheduler cannot be

I think you want to say that not all entites can be torn down, rather than none
of them can be torn down.

> +	 * torn down, because this would effectively also kill innocent
> +	 * userspace processes which did not submit faulty jobs (for example).

This is phrased ambiguously, "kill userspace processs" typically means something
different than you mean in this context.

> +	 *
> +	 * Consequently, the procedure to recover with a hardware scheduler
> +	 * should look like this:
> +	 *
> +	 * 1. Stop all schedulers impacted by the reset using drm_sched_stop().
> +	 * 2. Figure out to which entity the faulted job belongs to.
> +	 * 3. Kill that entity.

I'd combine the two steps: "2. Kill the entity the faulty job originates from".

> +	 * 4. Issue a GPU reset on all faulty rings (driver-specific).
> +	 * 5. Re-submit jobs on all schedulers impacted by re-submitting them to
> +	 *    the entities which are still alive.
> +	 * 6. Restart all schedulers that were stopped in step #1 using
> +	 *    drm_sched_start().
>  	 *
>  	 * Note that some GPUs have distinct hardware queues but need to reset
>  	 * the GPU globally, which requires extra synchronization between the
> -	 * timeout handler of the different &drm_gpu_scheduler. One way to
> -	 * achieve this synchronization is to create an ordered workqueue
> -	 * (using alloc_ordered_workqueue()) at the driver level, and pass this
> -	 * queue to drm_sched_init(), to guarantee that timeout handlers are
> -	 * executed sequentially. The above workflow needs to be slightly
> -	 * adjusted in that case:
> -	 *
> -	 * 1. Stop all schedulers impacted by the reset using drm_sched_stop()
> -	 * 2. Try to gracefully stop non-faulty jobs on all queues impacted by
> -	 *    the reset (optional)
> -	 * 3. Issue a GPU reset on all faulty queues (driver-specific)
> -	 * 4. Re-submit jobs on all schedulers impacted by the reset using
> -	 *    drm_sched_resubmit_jobs()
> -	 * 5. Restart all schedulers that were stopped in step #1 using
> -	 *    drm_sched_start()
> -	 *
> -	 * Return DRM_GPU_SCHED_STAT_NOMINAL, when all is normal,
> -	 * and the underlying driver has started or completed recovery.
> -	 *
> -	 * Return DRM_GPU_SCHED_STAT_ENODEV, if the device is no longer
> -	 * available, i.e. has been unplugged.
> +	 * timeout handlers of different schedulers. One way to achieve this
> +	 * synchronization is to create an ordered workqueue (using
> +	 * alloc_ordered_workqueue()) at the driver level, and pass this queue
> +	 * as drm_sched_init()'s @timeout_wq parameter. This will guarantee
> +	 * that timeout handlers are executed sequentially.
>  	 */
>  	enum drm_gpu_sched_stat (*timedout_job)(struct drm_sched_job *sched_job);
>  
> -- 
> 2.47.1
> 

