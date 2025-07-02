Return-Path: <linux-media+bounces-36526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D7DAF121F
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 12:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B6114A76CF
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 10:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2093C2571AC;
	Wed,  2 Jul 2025 10:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Rcf7g8RV"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85B424DCEF;
	Wed,  2 Jul 2025 10:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751452748; cv=none; b=ot5uxlYg5oHgaZyJBHUbI0+2UqPNfoNrwAQl59JnZ3ob66smtue1BbzIc42l3BC1arH0qyAGEtjQZb/1I3na3Sbmdc9Hu8ZgNChHG3IX/6dw4I+eb4tsUSfx+DsPE5UO1oK21hlTrOCbam1UlxwJ5Ql4Q51gv6MCWb7HpcE6PaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751452748; c=relaxed/simple;
	bh=yHMAhzuhapGfBSWOsT8w1SUO7EwV8BAxCiSVneEapuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EcnzgLZ7ysLEzOrt947ew9koGl0SEtJSddzgcjhj7+n8Akz9GIVvJKVcOqL5IQDehWPO68yNOZi7c0eR1fHO+Hb6VE9yYBT28T9tDv/M3HOzyrTlOPizr4T9bPRbNMubUD7sUaleM2bWGsehbEubNTpZUnmRIMe+V77pBCacH8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Rcf7g8RV; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MzngX37uvz6d6lF8YACHw9qO2X6AeXWw1SWs2AOP1WE=; b=Rcf7g8RVQfKIrVxyn7c63p17YJ
	IvqJHB0AmaNPPr6i7R9XE6SNPXBtFQ9jASR3sUp2vv3sBUYlLfgrqwJtQsl1XxtuS4BPKInKaazxT
	ZSY98oWk0IM9KkVBAqQLLymVJDGjuBuhpg5mw3BbLM88ODkM1YXObjbHCrYwqIFh2hTJwiy0aHC8Q
	kxWFmG0PM7XLEMkl7MparOA3/bgwB8Ra3mehn6Am+tngJvPgUUrRyjd3LEnZi6nMgvDaGDiJkbj9u
	tFNMHcgLo8e7eDnH3ASvt6AdKmPcORmAMqgVeNQsbAYEPUhyVeXawm/BlCce53jWRiOpN98dJ7hAA
	TOOvBE4Q==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uWuYs-00BPA0-Es; Wed, 02 Jul 2025 12:19:30 +0200
Message-ID: <ed5f6666-5c73-494c-835c-7e407dfd737b@igalia.com>
Date: Wed, 2 Jul 2025 11:19:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/sched: Avoid memory leaks with cancel_job()
 callback
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20250701132142.76899-3-phasta@kernel.org>
 <20250701132142.76899-4-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250701132142.76899-4-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 01/07/2025 14:21, Philipp Stanner wrote:
> Since its inception, the GPU scheduler can leak memory if the driver
> calls drm_sched_fini() while there are still jobs in flight.
> 
> The simplest way to solve this in a backwards compatible manner is by
> adding a new callback, drm_sched_backend_ops.cancel_job(), which
> instructs the driver to signal the hardware fence associated with the
> job. Afterwards, the scheduler can savely use the established free_job()
> callback for freeing the job.
> 
> Implement the new backend_ops callback cancel_job().
> 
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Link: https://lore.kernel.org/dri-devel/20250418113211.69956-1-tvrtko.ursulin@igalia.com/
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 34 ++++++++++++++++----------
>   include/drm/gpu_scheduler.h            | 18 ++++++++++++++
>   2 files changed, 39 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index c63543132f9d..1239954f5f7c 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1353,6 +1353,18 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
>   }
>   EXPORT_SYMBOL(drm_sched_init);
>   
> +static void drm_sched_cancel_remaining_jobs(struct drm_gpu_scheduler *sched)
> +{
> +	struct drm_sched_job *job, *tmp;
> +
> +	/* All other accessors are stopped. No locking necessary. */
> +	list_for_each_entry_safe_reverse(job, tmp, &sched->pending_list, list) {
> +		sched->ops->cancel_job(job);
> +		list_del(&job->list);

List_del is just for the warning in 3/6 I guess? You could in theory zap 
the whole list in one go and avoid the safe iterator. Not that it 
matters really so:

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

> +		sched->ops->free_job(job);
> +	}
> +}
> +
>   /**
>    * drm_sched_fini - Destroy a gpu scheduler
>    *
> @@ -1360,19 +1372,11 @@ EXPORT_SYMBOL(drm_sched_init);
>    *
>    * Tears down and cleans up the scheduler.
>    *
> - * This stops submission of new jobs to the hardware through
> - * drm_sched_backend_ops.run_job(). Consequently, drm_sched_backend_ops.free_job()
> - * will not be called for all jobs still in drm_gpu_scheduler.pending_list.
> - * There is no solution for this currently. Thus, it is up to the driver to make
> - * sure that:
> - *
> - *  a) drm_sched_fini() is only called after for all submitted jobs
> - *     drm_sched_backend_ops.free_job() has been called or that
> - *  b) the jobs for which drm_sched_backend_ops.free_job() has not been called
> - *     after drm_sched_fini() ran are freed manually.
> - *
> - * FIXME: Take care of the above problem and prevent this function from leaking
> - * the jobs in drm_gpu_scheduler.pending_list under any circumstances.
> + * This stops submission of new jobs to the hardware through &struct
> + * drm_sched_backend_ops.run_job. If &struct drm_sched_backend_ops.cancel_job
> + * is implemented, all jobs will be canceled through it and afterwards cleaned
> + * up through &struct drm_sched_backend_ops.free_job. If cancel_job is not
> + * implemented, memory could leak.
>    */
>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>   {
> @@ -1402,6 +1406,10 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>   	/* Confirm no work left behind accessing device structures */
>   	cancel_delayed_work_sync(&sched->work_tdr);
>   
> +	/* Avoid memory leaks if supported by the driver. */
> +	if (sched->ops->cancel_job)
> +		drm_sched_cancel_remaining_jobs(sched);
> +
>   	if (sched->own_submit_wq)
>   		destroy_workqueue(sched->submit_wq);
>   	sched->ready = false;
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index e62a7214e052..190844370f48 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -512,6 +512,24 @@ struct drm_sched_backend_ops {
>            * and it's time to clean it up.
>   	 */
>   	void (*free_job)(struct drm_sched_job *sched_job);
> +
> +	/**
> +	 * @cancel_job: Used by the scheduler to guarantee remaining jobs' fences
> +	 * get signaled in drm_sched_fini().
> +	 *
> +	 * Used by the scheduler to cancel all jobs that have not been executed
> +	 * with &struct drm_sched_backend_ops.run_job by the time
> +	 * drm_sched_fini() gets invoked.
> +	 *
> +	 * Drivers need to signal the passed job's hardware fence with an
> +	 * appropriate error code (e.g., -ECANCELED) in this callback. They
> +	 * must not free the job.
> +	 *
> +	 * The scheduler will only call this callback once it stopped calling
> +	 * all other callbacks forever, with the exception of &struct
> +	 * drm_sched_backend_ops.free_job.
> +	 */
> +	void (*cancel_job)(struct drm_sched_job *sched_job);
>   };
>   
>   /**


