Return-Path: <linux-media+bounces-33272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F467AC25BE
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 16:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40122176F2C
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 14:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB28295DBC;
	Fri, 23 May 2025 14:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="bXyIjrTM"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5941295DAF;
	Fri, 23 May 2025 14:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748012330; cv=none; b=ZDObF+ajKKx4ZX23Yl3RiH6gIAJORJTJUpq0d+C3LJC8+jLsqs21C/B/3cfoYCuw6e1Au9GLXdjW+9rMXh0AH1xnzBh+fl6FprKCSYlbEaf3Rt0GDV7gtPxZ6AcZp0uRplm6RSBfTk+iijs3vdTt5JArxfzo5Y9e7OntCK7ZU/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748012330; c=relaxed/simple;
	bh=o2/s3cTvaNGYvHqxKelw/AfnqZabjKQJ5GrwBLmlpLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cNJJHxefl/n32TYOPGJBoNecz53Wvlosxe06ELQEaE5pqKy1ITVAqpKE02jHo8nkvZuD9RPiyst5hot7pF2OujXXlpl7ZsgB0NofS3jaRRkZuDZ29bh1J2Y96YFodUWgS1e9DQXUNbsF0xMr1SgHvPSIzaZDz9Zm4xZ/B2C9WVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=bXyIjrTM; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zddI9FtAXHD/gRMbtklf0zY4lMOLIsr01i5HERi7ky8=; b=bXyIjrTMDXLFs0Wo/Dkqg3IdSQ
	kFhU5utmHe/SAS0IjB2imKM6H11hB7bHp2RURxEPLkJG1apNb7KnRlAwzXBEq63yKWuv4cldQQG5A
	wMQ6zkA24Cdcym/CcAsxj9Bqh8oLvOGs1TOknE5toWJWQPlDzAVmaqTvKZr0HGRLU29zjwjD9OY5A
	ArGFK83T54enLrUQsnNzgdNnDfEkau9y79GF2HTCwMSYCwEYmgK26kyTi4NEgQBpA0fCXJF6ScXwL
	d2+m//qAb4OIvOH8Gzz+uBEmSFfkbybnxykce6KEc8XgZcKcb3J90bRl7ONyEPd4dliaf6jQ5dPz5
	XtQraWeQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uITr0-00CE4g-F8; Fri, 23 May 2025 16:58:34 +0200
Message-ID: <1edd0499-ce5d-45a0-a989-ecb86f726795@igalia.com>
Date: Fri, 23 May 2025 15:58:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched/tests: Use one lock for fence context
To: phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250521100440.110019-2-phasta@kernel.org>
 <29124381-6949-4828-9b57-dc2dc0f55107@igalia.com>
 <3dd0d7d48515177138fda16e2fcd764ddca91204.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <3dd0d7d48515177138fda16e2fcd764ddca91204.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 22/05/2025 15:06, Philipp Stanner wrote:
> On Wed, 2025-05-21 at 11:24 +0100, Tvrtko Ursulin wrote:
>>
>> On 21/05/2025 11:04, Philipp Stanner wrote:
>>> When the unit tests were implemented, each scheduler job got its
>>> own,
>>> distinct lock. This is not how dma_fence context locking rules are
>>> to be
>>> implemented. All jobs belonging to the same fence context (in this
>>> case:
>>> scheduler) should share a lock for their dma_fences. This is to
>>> comply
>>> to various dma_fence rules, e.g., ensuring that only one fence gets
>>> signaled at a time.
>>>
>>> Use the fence context (scheduler) lock for the jobs.
>>
>> I think for the mock scheduler it works to share the lock, but I
>> don't
>> think see that the commit message is correct. Where do you see the
>> requirement to share the lock? AFAIK fence->lock is a fence lock,
>> nothing more semantically.
> 
> This patch is in part to probe a bit with Christian and Danilo to see
> whether we can get a bit more clarity about it.
> 
> In many places, notably Nouveau, it's definitely well established
> practice to use one lock for the fctx and all the jobs associated with
> it.
> 
> 
>>
>> And what does "ensuring that only one fence gets signalled at a time"
>> mean? You mean signal in seqno order?
> 
> Yes. But that's related. If jobs' fences can get signaled indepently
> from each other, that might race and screw up ordering. A common lock
> can prevent that.
> 
>> Even that is not guaranteed in the
>> contract due opportunistic signalling.
> 
> Jobs must be submitted to the hardware in the order they were
> submitted, and, therefore, their fences must be signaled in order. No?
> 
> What do you mean by opportunistic signaling?

Our beloved dma_fence_is_signaled(). External caller can signal a fence 
before the driver which owns it does.

If you change the commit message to correctly describe it is just a 
simplification since there is no need for separate locks I am good with 
that. It is a good simplification in that case.

Regards,

Tvrtko

> 
> 
> P.
> 
> 
> 
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>> ---
>>>    drivers/gpu/drm/scheduler/tests/mock_scheduler.c | 5 ++---
>>>    drivers/gpu/drm/scheduler/tests/sched_tests.h    | 1 -
>>>    2 files changed, 2 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>> b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>> index f999c8859cf7..17023276f4b0 100644
>>> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>> @@ -64,7 +64,7 @@ static void drm_mock_sched_job_complete(struct
>>> drm_mock_sched_job *job)
>>>    
>>>    	job->flags |= DRM_MOCK_SCHED_JOB_DONE;
>>>    	list_move_tail(&job->link, &sched->done_list);
>>> -	dma_fence_signal(&job->hw_fence);
>>> +	dma_fence_signal_locked(&job->hw_fence);
>>>    	complete(&job->done);
>>>    }
>>>    
>>> @@ -123,7 +123,6 @@ drm_mock_sched_job_new(struct kunit *test,
>>>    	job->test = test;
>>>    
>>>    	init_completion(&job->done);
>>> -	spin_lock_init(&job->lock);
>>>    	INIT_LIST_HEAD(&job->link);
>>>    	hrtimer_setup(&job->timer,
>>> drm_mock_sched_job_signal_timer,
>>>    		      CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
>>> @@ -169,7 +168,7 @@ static struct dma_fence
>>> *mock_sched_run_job(struct drm_sched_job *sched_job)
>>>    
>>>    	dma_fence_init(&job->hw_fence,
>>>    		       &drm_mock_sched_hw_fence_ops,
>>> -		       &job->lock,
>>> +		       &sched->lock,
>>>    		       sched->hw_timeline.context,
>>>    		       atomic_inc_return(&sched-
>>>> hw_timeline.next_seqno));
>>>    
>>> diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h
>>> b/drivers/gpu/drm/scheduler/tests/sched_tests.h
>>> index 27caf8285fb7..fbba38137f0c 100644
>>> --- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
>>> +++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
>>> @@ -106,7 +106,6 @@ struct drm_mock_sched_job {
>>>    	unsigned int		duration_us;
>>>    	ktime_t			finish_at;
>>>    
>>> -	spinlock_t		lock;
>>>    	struct dma_fence	hw_fence;
>>>    
>>>    	struct kunit		*test;
>>
> 


