Return-Path: <linux-media+bounces-37033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCAEAFB745
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 17:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69B2E421C0E
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 15:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A82F2E337A;
	Mon,  7 Jul 2025 15:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="dsR4xg0i"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A5A2E2EF6;
	Mon,  7 Jul 2025 15:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751901934; cv=none; b=LREt0iiPuvNymirAAbsaT0fM99f+sq8kHnwIIy+MA5vlDn9JiE0MzXO4Se/miv1i18VEn3/JUcyxYgLUey7mspz8fPE6lB21f0o5ulFPQOrSOP9OVpn7869uFgCD9kcfQpHM/mot2Z/TMeD1cpAzTG0mMSI6DjRljlBkSFU+g3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751901934; c=relaxed/simple;
	bh=mdaLIDVjJ7ih3f59DLnrGDEVt54p29Slav4mQ87b5Ss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CrZeuDoC3olWROTNKbHnvRPK6ZLt08Qr7K7hXw7QXqKIXEiZsINFsNx4PaZQ8bcapuQiR9SzcQhP75Euyuo8oeWhEOGL4vxoZ09hC1N0XQrZd4WfPs4KW/C7DcFBv8OLB48HX0D9oQsZCLGkdweNDIwvAKP1PE6kLauV8Klzj8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=dsR4xg0i; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=St8BIQfR0g/bkj5Q2vbzyU5XeiMPVTu5DtKzmShcTZA=; b=dsR4xg0ipSXR9KEalJjr778CD8
	rPdAyDcbkUwvqsSZaYzhNRukXe5zYO2FUe8Y49ijLn++ZiuUs4JyWY6a/c9+q4TdUPqBNhID+8BdG
	K3mEXx1J1tyWFlidkjkpaUb1bREve84+ueR7B3wZvO10vmveutZQSeUE0PTEY43UoXecugEhHRySO
	n5r3LX+1gvoKtmf/X+dUCjyI+rAPggCZIW8xNutF2aWq96F3ilVINa/PaA5pGjBRxWleslWcjAh+G
	ou1BlgNSU6rkQnIbIX64CgjRQH5RxFdqGYsGMjQDpA+C7Xl+2tEuD23hJ1xalrZsCt4D7yjw8fzct
	nulK/Giw==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uYniZ-00DbXM-Ad; Mon, 07 Jul 2025 17:25:19 +0200
Message-ID: <790c4053-cc63-4020-96ac-2650c8f009d3@igalia.com>
Date: Mon, 7 Jul 2025 16:25:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] drm/sched/tests: Implement cancel_job() callback
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
References: <20250707134221.34291-2-phasta@kernel.org>
 <20250707134221.34291-4-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250707134221.34291-4-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 07/07/2025 14:42, Philipp Stanner wrote:
> The GPU Scheduler now supports a new callback, cancel_job(), which lets
> the scheduler cancel all jobs which might not yet be freed when
> drm_sched_fini() runs. Using this callback allows for significantly
> simplifying the mock scheduler teardown code.
> 
> Implement the cancel_job() callback and adjust the code where necessary.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   .../gpu/drm/scheduler/tests/mock_scheduler.c  | 66 +++++++------------
>   1 file changed, 23 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> index 49d067fecd67..2d3169d95200 100644
> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> @@ -63,7 +63,7 @@ static void drm_mock_sched_job_complete(struct drm_mock_sched_job *job)
>   	lockdep_assert_held(&sched->lock);
>   
>   	job->flags |= DRM_MOCK_SCHED_JOB_DONE;
> -	list_move_tail(&job->link, &sched->done_list);
> +	list_del(&job->link);
>   	dma_fence_signal_locked(&job->hw_fence);
>   	complete(&job->done);
>   }
> @@ -236,26 +236,39 @@ mock_sched_timedout_job(struct drm_sched_job *sched_job)
>   
>   static void mock_sched_free_job(struct drm_sched_job *sched_job)
>   {
> -	struct drm_mock_scheduler *sched =
> -			drm_sched_to_mock_sched(sched_job->sched);
>   	struct drm_mock_sched_job *job = drm_sched_job_to_mock_job(sched_job);
> -	unsigned long flags;
>   
> -	/* Remove from the scheduler done list. */
> -	spin_lock_irqsave(&sched->lock, flags);
> -	list_del(&job->link);
> -	spin_unlock_irqrestore(&sched->lock, flags);
>   	dma_fence_put(&job->hw_fence);
> -
>   	drm_sched_job_cleanup(sched_job);
>   
>   	/* Mock job itself is freed by the kunit framework. */
>   }
>   
> +static void mock_sched_cancel_job(struct drm_sched_job *sched_job)
> +{
> +	struct drm_mock_scheduler *sched = drm_sched_to_mock_sched(sched_job->sched);
> +	struct drm_mock_sched_job *job = drm_sched_job_to_mock_job(sched_job);
> +	unsigned long flags;
> +
> +	hrtimer_cancel(&job->timer);
> +
> +	spin_lock_irqsave(&sched->lock, flags);
> +	if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
> +		list_del(&job->link);
> +		dma_fence_set_error(&job->hw_fence, -ECANCELED);
> +		dma_fence_signal_locked(&job->hw_fence);
> +	}
> +	spin_unlock_irqrestore(&sched->lock, flags);
> +
> +	/* The GPU Scheduler will call drm_sched_backend_ops.free_job(), still.
> +	 * Mock job itself is freed by the kunit framework. */

I suggest sticking with the multi-line comment format as used in this 
file. Ie.

/*
  * Multi-line comment.
  */

> +}
> +
>   static const struct drm_sched_backend_ops drm_mock_scheduler_ops = {
>   	.run_job = mock_sched_run_job,
>   	.timedout_job = mock_sched_timedout_job,
> -	.free_job = mock_sched_free_job
> +	.free_job = mock_sched_free_job,
> +	.cancel_job = mock_sched_cancel_job,
>   };
>   
>   /**
> @@ -289,7 +302,6 @@ struct drm_mock_scheduler *drm_mock_sched_new(struct kunit *test, long timeout)
>   	sched->hw_timeline.context = dma_fence_context_alloc(1);
>   	atomic_set(&sched->hw_timeline.next_seqno, 0);
>   	INIT_LIST_HEAD(&sched->job_list);
> -	INIT_LIST_HEAD(&sched->done_list);

You forgot to remove done_list from the struct definition.

Regards,

Tvrtko

>   	spin_lock_init(&sched->lock);
>   
>   	return sched;
> @@ -304,38 +316,6 @@ struct drm_mock_scheduler *drm_mock_sched_new(struct kunit *test, long timeout)
>    */
>   void drm_mock_sched_fini(struct drm_mock_scheduler *sched)
>   {
> -	struct drm_mock_sched_job *job, *next;
> -	unsigned long flags;
> -	LIST_HEAD(list);
> -
> -	drm_sched_wqueue_stop(&sched->base);
> -
> -	/* Force complete all unfinished jobs. */
> -	spin_lock_irqsave(&sched->lock, flags);
> -	list_for_each_entry_safe(job, next, &sched->job_list, link)
> -		list_move_tail(&job->link, &list);
> -	spin_unlock_irqrestore(&sched->lock, flags);
> -
> -	list_for_each_entry(job, &list, link)
> -		hrtimer_cancel(&job->timer);
> -
> -	spin_lock_irqsave(&sched->lock, flags);
> -	list_for_each_entry_safe(job, next, &list, link)
> -		drm_mock_sched_job_complete(job);
> -	spin_unlock_irqrestore(&sched->lock, flags);
> -
> -	/*
> -	 * Free completed jobs and jobs not yet processed by the DRM scheduler
> -	 * free worker.
> -	 */
> -	spin_lock_irqsave(&sched->lock, flags);
> -	list_for_each_entry_safe(job, next, &sched->done_list, link)
> -		list_move_tail(&job->link, &list);
> -	spin_unlock_irqrestore(&sched->lock, flags);
> -
> -	list_for_each_entry_safe(job, next, &list, link)
> -		mock_sched_free_job(&job->base);
> -
>   	drm_sched_fini(&sched->base);
>   }
>   


