Return-Path: <linux-media+bounces-37201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFFEAFE8E5
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 14:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 988FD3AA9E5
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 12:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31A02E1C7C;
	Wed,  9 Jul 2025 12:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="DfrWIe9n"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DAC2D97BF;
	Wed,  9 Jul 2025 12:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752063908; cv=none; b=aujiS74+uh0C1ol8/H0k2i+BvL4D2oVgGE4kRdFPOAsal2Tw/7WBMkEq+WWXs3XzRIpCMln9qcx1K52VfybeFN3LFSLIFV/ASmigr9maRLSGFKeI8h2ONQe4hrKlFk4Wr1UMEakAWSr80JVC8JQb5Xi8yfF3xIlYE4tvPqLcRoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752063908; c=relaxed/simple;
	bh=swyUD6YjRtc3akmcS4kem9q9q3Rjs7f7GrF5ASpJRxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GUSy3Ba9Ay7y+qx2R66nReLirroGyBbOPJZBK1vg9vVtdUjE4db80FIxjeGmRBJwm9nvNpGB10BLw1WZkbhpC4Pqs6kv4L+LdHSMhlDfk0HlpfvgH2v0axVkRo2fn9zURmSMoLLX1g1QOeAFRLl4DSVYV2ljhh4jFW2wAdX6uOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=DfrWIe9n; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aziAfoRoxY3luROYRtoGhYdxXHuve5qIWRnJXHedYlw=; b=DfrWIe9ngiQpIQ4+3qmIRXszPb
	vHJPWlqXJgtB/pyUHY+rOgqdzG9g0jEjiH2j7taFTuBFH1XAVeEIZYIVgkCEuSTBLy7XXm82xivla
	sxpLHduNAg/ogOM+BoFQcwTqSz/XP7gyFqU2mdgpyFEeCO3i6JWHmIoz11Ez1I4IOaAmk+cr20SPV
	/8Kjxezdf17/yLU+SE1s9YbBgXqLuddw4cF6XJ6ahJBQ7M59OMyspJtiKUwNi3FmbmIrkOVxaOoLX
	427kaie9tmMCxjOJVhr0e3xH3oBXSvK/BacMpWOGccec0pWVxXsSKBumcqFQmiKCxpuSxbBz9JzPM
	8pLep/DA==;
Received: from [84.65.48.237] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uZTqr-00ESX8-Fr; Wed, 09 Jul 2025 14:24:41 +0200
Message-ID: <fbab4905-9a85-48f3-93c0-9828fbf3bc9d@igalia.com>
Date: Wed, 9 Jul 2025 13:24:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] drm/sched/tests: Implement cancel_job() callback
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
References: <20250709115257.106370-2-phasta@kernel.org>
 <20250709115257.106370-4-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250709115257.106370-4-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 09/07/2025 12:52, Philipp Stanner wrote:
> The GPU Scheduler now supports a new callback, cancel_job(), which lets
> the scheduler cancel all jobs which might not yet be freed when
> drm_sched_fini() runs. Using this callback allows for significantly
> simplifying the mock scheduler teardown code.
> 
> Implement the cancel_job() callback and adjust the code where necessary.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   .../gpu/drm/scheduler/tests/mock_scheduler.c  | 68 +++++++------------
>   drivers/gpu/drm/scheduler/tests/sched_tests.h |  1 -
>   2 files changed, 25 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> index 49d067fecd67..0d1d57213e05 100644
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
> @@ -236,26 +236,41 @@ mock_sched_timedout_job(struct drm_sched_job *sched_job)
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
> +	/*
> +	 * The GPU Scheduler will call drm_sched_backend_ops.free_job(), still.
> +	 * Mock job itself is freed by the kunit framework.
> +	 */
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
> @@ -289,7 +304,6 @@ struct drm_mock_scheduler *drm_mock_sched_new(struct kunit *test, long timeout)
>   	sched->hw_timeline.context = dma_fence_context_alloc(1);
>   	atomic_set(&sched->hw_timeline.next_seqno, 0);
>   	INIT_LIST_HEAD(&sched->job_list);
> -	INIT_LIST_HEAD(&sched->done_list);
>   	spin_lock_init(&sched->lock);
>   
>   	return sched;
> @@ -304,38 +318,6 @@ struct drm_mock_scheduler *drm_mock_sched_new(struct kunit *test, long timeout)
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
> diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> index fbba38137f0c..0eddfb8d89e6 100644
> --- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> +++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> @@ -49,7 +49,6 @@ struct drm_mock_scheduler {
>   
>   	spinlock_t		lock;
>   	struct list_head	job_list;
> -	struct list_head	done_list;
>   
>   	struct {
>   		u64		context;

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko


