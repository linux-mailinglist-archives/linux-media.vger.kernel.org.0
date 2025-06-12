Return-Path: <linux-media+bounces-34630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68284AD7397
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 16:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EE302C04D7
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 14:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE10324E4A8;
	Thu, 12 Jun 2025 14:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="WiT3Orib"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE885695;
	Thu, 12 Jun 2025 14:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749737891; cv=none; b=j+SFMm6iblrnpVx08qyNhpn7YLpMEBA/mEzFXObBTisf4kq+uXb28aDm3YNb4Wl2fQ7fWhBocpDiQHQluj1tbxoPPVQmv/rAVwjJIp0DSJpY9Rq5eSaScg1fDJuDHBlUUc0hRB/Snzm73HAs/FlbRU2yPOoH1g7ZyYnZEmhkJhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749737891; c=relaxed/simple;
	bh=cyF3nTSTNSg076kd5N+AAyZbxrZKBPjxVEfxedTQRkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XNnEZHNovvnUmKkk/mT2VKpkqekI8YI98KWbOLaqih7bbb/zbyXEjB2L3n5kCfS9/uUguCt7xrcW9PzcC1flIkL2sdAKYsmCbg5pGB1Aq5soHP8HbOf2pBgksy64SfGOqa/5W1oDVTbdkEu+ppn6mPAloV8M4lbsF5nCMeIDbVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=WiT3Orib; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2N+lCsQLw5Lje5VsOQ8ETgYUevmvpiEu9dHqkRktYfY=; b=WiT3OriboTe5j0MRQN9ewNPR5b
	9TZVcKKfirxxNnNEXUhTNDOe7++d8nfpXdYmRURGZGKH2FxF+5matttLG1afHkA9YS56B8oLsxvS4
	Pb0OjhyuDIhqxOe2L2HVtLytZpNG8Bq1Vx7M94Y/xl7gqyMCKcApWKixmAt9nT/h3Y99xO/QLcc24
	lQUNPqWeMQM7lAjC54bGT+aObY+T1wsu98sJ1UpObHC9ppKT4TkLhe6TVVE8SBj7igniIXzSI0gzm
	R+6Q1qHqEKUf7KOsgcH5SvDIueU9rCoyg6qoH/v2eZNvo0lDH5a4SEbhxz4nEs8TrqmrtOW3csdpA
	Z10/cc+A==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uPikY-002fLM-ED; Thu, 12 Jun 2025 16:17:50 +0200
Message-ID: <62ff8ddb-b2f1-4e52-a026-290561ab5337@igalia.com>
Date: Thu, 12 Jun 2025 15:17:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] drm/sched: Avoid memory leaks with cancel_job()
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
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250603093130.100159-2-phasta@kernel.org>
 <20250603093130.100159-3-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250603093130.100159-3-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 03/06/2025 10:31, Philipp Stanner wrote:
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

Please just add the link to the patch here (it is only in the cover letter):

Link: 
https://lore.kernel.org/dri-devel/20250418113211.69956-1-tvrtko.ursulin@igalia.com/

And you probably want to take the unit test modifications from the same 
patch too. You could put them in the same patch or separate.

Regards,

Tvrtko

> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 34 ++++++++++++++++----------
>   include/drm/gpu_scheduler.h            |  9 +++++++
>   2 files changed, 30 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index d20726d7adf0..3f14f1e151fa 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1352,6 +1352,18 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
>   }
>   EXPORT_SYMBOL(drm_sched_init);
>   
> +static void drm_sched_kill_remaining_jobs(struct drm_gpu_scheduler *sched)
> +{
> +	struct drm_sched_job *job, *tmp;
> +
> +	/* All other accessors are stopped. No locking necessary. */
> +	list_for_each_entry_safe_reverse(job, tmp, &sched->pending_list, list) {
> +		sched->ops->cancel_job(job);
> +		list_del(&job->list);
> +		sched->ops->free_job(job);
> +	}
> +}
> +
>   /**
>    * drm_sched_fini - Destroy a gpu scheduler
>    *
> @@ -1359,19 +1371,11 @@ EXPORT_SYMBOL(drm_sched_init);
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
> @@ -1401,6 +1405,10 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>   	/* Confirm no work left behind accessing device structures */
>   	cancel_delayed_work_sync(&sched->work_tdr);
>   
> +	/* Avoid memory leaks if supported by the driver. */
> +	if (sched->ops->cancel_job)
> +		drm_sched_kill_remaining_jobs(sched);
> +
>   	if (sched->own_submit_wq)
>   		destroy_workqueue(sched->submit_wq);
>   	sched->ready = false;
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index e62a7214e052..81dcbfc8c223 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -512,6 +512,15 @@ struct drm_sched_backend_ops {
>            * and it's time to clean it up.
>   	 */
>   	void (*free_job)(struct drm_sched_job *sched_job);
> +
> +	/**
> +	 * @cancel_job: Used by the scheduler to guarantee remaining jobs' fences
> +	 * get signaled in drm_sched_fini().
> +	 *
> +	 * Drivers need to signal the passed job's hardware fence with
> +	 * -ECANCELED in this callback. They must not free the job.
> +	 */
> +	void (*cancel_job)(struct drm_sched_job *sched_job);
>   };
>   
>   /**


