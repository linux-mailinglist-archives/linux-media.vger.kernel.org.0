Return-Path: <linux-media+bounces-46075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 319CCC2504A
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 13:32:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5040B423204
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 12:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A5F348895;
	Fri, 31 Oct 2025 12:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="J0JQyvaK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D76726ED57
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 12:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761913898; cv=none; b=C1T01h6q6W/NS7oBiOWVQ0GbS62mmuFUZp2b+QG9XfSdDowTBNjCJcyU/yIgpSJ+MElvJVeUba76fbgl5bMJhdFdBqs3Jbh+qqjNHxWy39ILKXg4NubJN/UufqMRFa7O5r6PbdH0F2NAdu5p4T50XDWQUUyzPKh96d0VT3tPJDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761913898; c=relaxed/simple;
	bh=WfbbP1hhX+kiPAYHs46B8G4TL3eC7al6qprIiJuS/+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dml9I7wTL+N9ygRNVwAIGwFYS5iQjrCPUmiKY5ZrSbGeMWOg6y+HmRTndUeR6DlURvmna6035xojFien4LpHNt6yHfB6ZFLyFTpONZVB36rAvea1axlkXTukAzD6ze41cXGW2+gRhPy5rXhg7GOH+VEbvpgcdIgwTdOmVM6rfTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=J0JQyvaK; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-421851bcb25so1289525f8f.2
        for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 05:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1761913895; x=1762518695; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=08fssheEH26ewL9xgSjQ1sFTztWWkCBjLlcECWJQBfM=;
        b=J0JQyvaK6R29Fu6ZZ+1Y4hkS2n4rKxqw60ynw85kcLHp1emHTJOi/k1qbYdHPKbCTf
         0fQI0Oyavzw6FwSiXFd4TJFqzW1K+rFA0NiDQB8pujMY6nlm+G/td9cszwuO2pD+wZQu
         0c9bqhArC9XeFNygeMot5LJGUcC1VwVRzCFL9cU0eLi3g91B8rhiMGk3zdRbEmOWJKfG
         fuy6gbgOhLlQIQNQjzC08mFUeNU2ZHUomjF/507AKjYHNAWCz5H52Q/j/qX79Pg1x605
         ncgM8cgrrZWoGdEVgP1+WFzs7cwBanSobJ+GG7RHF3XkIfQg3pmwzLTaq4uO0eZmM36l
         yudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761913895; x=1762518695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=08fssheEH26ewL9xgSjQ1sFTztWWkCBjLlcECWJQBfM=;
        b=iJwrRP5JxxYPXxsG3ntOxWEjhF2vN1oys2YQ4gqPV3psJaUwvuN2R9ri0yyOAaXApd
         DGTfS/vqoIAzIj25+bVEyfDD/nhT4872oI6QYz3ZYLue+Rm6s9CX6FTsMi4eOyA9kzqv
         3mdcRKIvfNo5/VaQNZN2aCbiWloxJov36pby2raKDsqGf8yZnV0PdL1c/xIYfx5sXYYs
         CO+2hE0zMcpRMjRLBp01kXjn5MfTl0Y0O17q6ZHR/p4+/k1WyyoRf0QlL1M9l96n19rV
         BmGVwj/k0MfV6shEj0mjFXX08M9HEGtcxMZ6fEJsbjeIeV/Npyjb07IC4Su7nb74/CBd
         vynA==
X-Forwarded-Encrypted: i=1; AJvYcCUtPSBdN+XX9b0YBKMAvzh6g/DY2lmpF9BB1nHppBi2ehXd/OWKylx0cufiLg5FZD6cV0S4I6iB1cZ64g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSxPxYJJxbi0bsDZupffXRFUhc+9qg4OYuRn3iZ/UQbRcnFLfm
	0lOW1gVpcjjFiXQ2rFi3fyiXEDdd/JZdBrgZLh2hNUTAED0MvfH6C2fsUR1BmsPvrfI=
X-Gm-Gg: ASbGncvpFQ1v9pMnfKS3CqWNOlswCes55WKDvWB2hxeErPWs1zpoAVBXzLBfERLtaTE
	xPX/0Rl78gIacUtnVipnB7aWOEQJrMBNT0rOc/jDxptzcyM41tTQMwsOLIibih0SUAWIET5Wffx
	DUyPrT0GH5AcJcQMXXLvvwzPdi28U3mjgD/iH4tn4q/KjnOMuhVooC0Jm1ZkkTe+X+pC37DQGyu
	LmhV1v/0/NMo1nRWneROUhIsJmW6LG5Ijc6Z1DrRZP4k9xlppCOT3nAPZ4XxhpSQK5gAVuSH2nb
	YfghwQ40oNtGFfRF0vKLpkC2jQ6LGBIwDF3yGfHfkgHNAXD9d03MqgiVn2EhKndKXIxgnHtKi5Y
	r8z7YYwif43huXYUeSbrOqPMewJA6WX7ppg8FCmiepuq0jCVlwX2lZaF+eGLoSA5tALF29XNocs
	Eg2tlfMJI44V7/tgbQR/EpR7reG80=
X-Google-Smtp-Source: AGHT+IFN1SIbYGYuHJIssflh634/zxs/aR+a86BEewospW9lCTe+InyrPCsK+oVBo1QTVBWURISFmw==
X-Received: by 2002:a05:6000:2288:b0:427:5cf:a284 with SMTP id ffacd0b85a97d-429bd6c2d51mr2705783f8f.60.1761913894379;
        Fri, 31 Oct 2025 05:31:34 -0700 (PDT)
Received: from [192.168.0.101] ([90.240.106.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c1406a45sm3333829f8f.47.2025.10.31.05.31.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 05:31:33 -0700 (PDT)
Message-ID: <08bc7f37-d2d7-4ad0-9575-f8a2c36b1c3f@ursulin.net>
Date: Fri, 31 Oct 2025 12:31:33 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sched: Fix deadlock in
 drm_sched_entity_kill_jobs_cb
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20251031090704.1111-1-pierre-eric.pelloux-prayer@amd.com>
 <411190d4-92d7-4e95-acac-b39afa438c0f@ursulin.net>
 <50f3743f-8b83-42de-87c8-1c7d52df3ab0@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <50f3743f-8b83-42de-87c8-1c7d52df3ab0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 31/10/2025 12:25, Christian König wrote:
> 
> 
> On 10/31/25 12:50, Tvrtko Ursulin wrote:
>>
>> On 31/10/2025 09:07, Pierre-Eric Pelloux-Prayer wrote:
>>> The Mesa issue referenced below pointed out a possible deadlock:
>>>
>>> [ 1231.611031]  Possible interrupt unsafe locking scenario:
>>>
>>> [ 1231.611033]        CPU0                    CPU1
>>> [ 1231.611034]        ----                    ----
>>> [ 1231.611035]   lock(&xa->xa_lock#17);
>>> [ 1231.611038]                                local_irq_disable();
>>> [ 1231.611039]                                lock(&fence->lock);
>>> [ 1231.611041]                                lock(&xa->xa_lock#17);
>>> [ 1231.611044]   <Interrupt>
>>> [ 1231.611045]     lock(&fence->lock);
>>> [ 1231.611047]
>>>                   *** DEADLOCK ***
>>>
>>> In this example, CPU0 would be any function accessing job->dependencies
>>> through the xa_* functions that doesn't disable interrupts (eg:
>>> drm_sched_job_add_dependency, drm_sched_entity_kill_jobs_cb).
>>>
>>> CPU1 is executing drm_sched_entity_kill_jobs_cb as a fence signalling
>>> callback so in an interrupt context. It will deadlock when trying to
>>> grab the xa_lock which is already held by CPU0.
>>>
>>> Replacing all xa_* usage by their xa_*_irq counterparts would fix
>>> this issue, but Christian pointed out another issue: dma_fence_signal
>>> takes fence.lock and so does dma_fence_add_callback.
>>>
>>>     dma_fence_signal() // locks f1.lock
>>>     -> drm_sched_entity_kill_jobs_cb()
>>>     -> foreach dependencies
>>>        -> dma_fence_add_callback() // locks f2.lock
>>>
>>> This will deadlock if f1 and f2 share the same spinlock.
>>
>> Is it possible to hit this case?
>>
>> Same lock means same execution timeline
> 
> Nope, exactly that is incorrect. It's completely up to the implementation what they use this lock for.

Yes, sorry, I got confused for a moment. The lock can be per hw 
scheduler while execution timeline is per entity.

Regards,

Tvrtko

> 
>> , which should mean dependency should have been squashed in drm_sched_job_add_dependency(), no?
> 
> This makes it less likely, but not impossible to trigger.
> 
> Regards,
> Christian.
> 
>>
>> Or would sharing the lock but not sharing the entity->fence_context be considered legal? It would be surprising at least.
>>
>> Also, would anyone have time to add a kunit test? ;)
>>
>> Regards,
>>
>> Tvrtko
>>
>>> To fix both issues, the code iterating on dependencies and re-arming them
>>> is moved out to drm_sched_entity_kill_jobs_work.
>>>
>>> Link: https://gitlab.freedesktop.org/mesa/mesa/-/issues/13908
>>> Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_entity.c | 34 +++++++++++++-----------
>>>    1 file changed, 19 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index c8e949f4a568..fe174a4857be 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -173,26 +173,15 @@ int drm_sched_entity_error(struct drm_sched_entity *entity)
>>>    }
>>>    EXPORT_SYMBOL(drm_sched_entity_error);
>>>    +static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>>> +                      struct dma_fence_cb *cb);
>>> +
>>>    static void drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
>>>    {
>>>        struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
>>> -
>>> -    drm_sched_fence_scheduled(job->s_fence, NULL);
>>> -    drm_sched_fence_finished(job->s_fence, -ESRCH);
>>> -    WARN_ON(job->s_fence->parent);
>>> -    job->sched->ops->free_job(job);
>>> -}
>>> -
>>> -/* Signal the scheduler finished fence when the entity in question is killed. */
>>> -static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>>> -                      struct dma_fence_cb *cb)
>>> -{
>>> -    struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
>>> -                         finish_cb);
>>> +    struct dma_fence *f;
>>>        unsigned long index;
>>>    -    dma_fence_put(f);
>>> -
>>>        /* Wait for all dependencies to avoid data corruptions */
>>>        xa_for_each(&job->dependencies, index, f) {
>>>            struct drm_sched_fence *s_fence = to_drm_sched_fence(f);
>>> @@ -220,6 +209,21 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>>>            dma_fence_put(f);
>>>        }
>>>    +    drm_sched_fence_scheduled(job->s_fence, NULL);
>>> +    drm_sched_fence_finished(job->s_fence, -ESRCH);
>>> +    WARN_ON(job->s_fence->parent);
>>> +    job->sched->ops->free_job(job);
>>> +}
>>> +
>>> +/* Signal the scheduler finished fence when the entity in question is killed. */
>>> +static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>>> +                      struct dma_fence_cb *cb)
>>> +{
>>> +    struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
>>> +                         finish_cb);
>>> +
>>> +    dma_fence_put(f);
>>> +
>>>        INIT_WORK(&job->work, drm_sched_entity_kill_jobs_work);
>>>        schedule_work(&job->work);
>>>    }
>>
> 


