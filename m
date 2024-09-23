Return-Path: <linux-media+bounces-18458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3443397E7F6
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 10:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65D7EB215C2
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 08:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B87F194143;
	Mon, 23 Sep 2024 08:55:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6226A535B7;
	Mon, 23 Sep 2024 08:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727081731; cv=none; b=ENLRMzfflDtqa63uEDaqkQ5nxXJjRXs+VDhPpRFM8CKscasF+tiyGD37UCCb7Ifl7oyUKVtLYIMeh8+x7H1Qj/Zu6GdLLcOZ8gSBzZYkPr0mYiOc7bRDiWdzJpOegJ9bT3fO8GImDFszEzYKZJFm8bCXgiC3zz9m1vJHgufr/Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727081731; c=relaxed/simple;
	bh=AZ23uaDj1OBzFLRN/t7ot18NlzCvXynoMlLNdY1UX/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gnMFTLDPKuWdT7fnW5ZuYPxPz7woYqN0f0dvSJKQrVIFRdXdOBduwmIEkLOg9K/Lj1hn5u08jGP9Mzg7I8cmMluvv9nIW1/ILWp++a93M58myYASbvWX88dRuInwiU6dFGgfE5Utq8x3ZKJwsVtPyDDB5JFdxIMMaG49vxnx2xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18CE1FEC;
	Mon, 23 Sep 2024 01:55:51 -0700 (PDT)
Received: from [10.57.79.18] (unknown [10.57.79.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEA753F64C;
	Mon, 23 Sep 2024 01:55:18 -0700 (PDT)
Message-ID: <ef799587-f7c2-472a-8550-9c40a395eccb@arm.com>
Date: Mon, 23 Sep 2024 09:55:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] drm/panthor: introduce job cycle and timestamp
 accounting
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <5c4d1008-261f-4c47-ab73-c527675484a4@arm.com>
 <bq6lctwgpsxvrdaajmjo3xdjt32srmsxvjhtzyebdj6izjzoaw@6duby4axg3pf>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <bq6lctwgpsxvrdaajmjo3xdjt32srmsxvjhtzyebdj6izjzoaw@6duby4axg3pf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/09/2024 23:36, Adrián Larumbe wrote:
> Hi Steve, thanks for the review.

Hi Adrián,

> I've applied all of your suggestions for the next patch series revision, so I'll
> only be answering to your question about the calc_profiling_ringbuf_num_slots
> function further down below.
> 

[...]

>>> @@ -3003,6 +3190,34 @@ static const struct drm_sched_backend_ops panthor_queue_sched_ops = {
>>>  	.free_job = queue_free_job,
>>>  };
>>>  
>>> +static u32 calc_profiling_ringbuf_num_slots(struct panthor_device *ptdev,
>>> +				       u32 cs_ringbuf_size)
>>> +{
>>> +	u32 min_profiled_job_instrs = U32_MAX;
>>> +	u32 last_flag = fls(PANTHOR_DEVICE_PROFILING_ALL);
>>> +
>>> +	/*
>>> +	 * We want to calculate the minimum size of a profiled job's CS,
>>> +	 * because since they need additional instructions for the sampling
>>> +	 * of performance metrics, they might take up further slots in
>>> +	 * the queue's ringbuffer. This means we might not need as many job
>>> +	 * slots for keeping track of their profiling information. What we
>>> +	 * need is the maximum number of slots we should allocate to this end,
>>> +	 * which matches the maximum number of profiled jobs we can place
>>> +	 * simultaneously in the queue's ring buffer.
>>> +	 * That has to be calculated separately for every single job profiling
>>> +	 * flag, but not in the case job profiling is disabled, since unprofiled
>>> +	 * jobs don't need to keep track of this at all.
>>> +	 */
>>> +	for (u32 i = 0; i < last_flag; i++) {
>>> +		if (BIT(i) & PANTHOR_DEVICE_PROFILING_ALL)
>>> +			min_profiled_job_instrs =
>>> +				min(min_profiled_job_instrs, calc_job_credits(BIT(i)));
>>> +	}
>>> +
>>> +	return DIV_ROUND_UP(cs_ringbuf_size, min_profiled_job_instrs * sizeof(u64));
>>> +}
>>
>> I may be missing something, but is there a situation where this is
>> different to calc_job_credits(0)? AFAICT the infrastructure you've added
>> can only add extra instructions to the no-flags case - whereas this
>> implies you're thinking that instructions may also be removed (or replaced).
>>
>> Steve
> 
> Since we create a separate kernel BO to hold the profiling information slot, we
> need one that would be able to accomodate as many slots as the maximum number of
> profiled jobs we can insert simultaneously into the queue's ring buffer. Because
> profiled jobs always take more instructions than unprofiled ones, then we would
> usually need fewer slots than the number of unprofiled jobs we could insert at
> once in the ring buffer.
> 
> Because we represent profiling metrics with a bit mask, then we need to test the
> size of the CS for every single metric enabled in isolation, since enabling more
> than one will always mean a bigger CS, and therefore fewer jobs tracked at once
> in the queue's ring buffer.
> 
> In our case, calling calc_job_credits(0) would simply tell us the number of
> instructions we need for a normal job with no profiled features enabled, which
> would always requiere less instructions than profiled ones, and therefore more
> slots in the profiling info kernel BO. But we don't need to keep track of
> profiling numbers for unprofiled jobs, so there's no point in calculating this
> number.
> 
> At first I was simply allocating a profiling info kernel BO as big as the number
> of simultaneous unprofiled job slots in the ring queue, but Boris pointed out
> that since queue ringbuffers can be as big as 2GiB, a lot of this memory would
> be wasted, since profiled jobs always require more slots because they hold more
> instructions, so fewer profiling slots in said kernel BO.
> 
> The value of this approach will eventually manifest if we decided to keep track of
> more profiling metrics, since this code won't have to change at all, other than
> adding new profiling flags in the panthor_device_profiling_flags enum.

Thanks for the detailed explanation. I think what I was missing is that
the loop is checking each bit flag independently and *not* checking
calc_job_credits(0).

The check for (BIT(i) & PANTHOR_DEVICE_PROFILING_ALL) is probably what
confused me - that should be completely redundant. Or at least we need
something more intelligent if we have profiling bits which are not
mutually compatible.

I'm also not entirely sure that the amount of RAM saved is significant,
but you've already written the code so we might as well have the saving ;)

Thanks,
Steve

> Regards,
> Adrian
> 
>>> +
>>>  static struct panthor_queue *
>>>  group_create_queue(struct panthor_group *group,
>>>  		   const struct drm_panthor_queue_create *args)
>>> @@ -3056,9 +3271,35 @@ group_create_queue(struct panthor_group *group,
>>>  		goto err_free_queue;
>>>  	}
>>>  
>>> +	queue->profiling.slot_count =
>>> +		calc_profiling_ringbuf_num_slots(group->ptdev, args->ringbuf_size);
>>> +
>>> +	queue->profiling.slots =
>>> +		panthor_kernel_bo_create(group->ptdev, group->vm,
>>> +					 queue->profiling.slot_count *
>>> +					 sizeof(struct panthor_job_profiling_data),
>>> +					 DRM_PANTHOR_BO_NO_MMAP,
>>> +					 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
>>> +					 DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
>>> +					 PANTHOR_VM_KERNEL_AUTO_VA);
>>> +
>>> +	if (IS_ERR(queue->profiling.slots)) {
>>> +		ret = PTR_ERR(queue->profiling.slots);
>>> +		goto err_free_queue;
>>> +	}
>>> +
>>> +	ret = panthor_kernel_bo_vmap(queue->profiling.slots);
>>> +	if (ret)
>>> +		goto err_free_queue;
>>> +
>>> +	/*
>>> +	 * Credit limit argument tells us the total number of instructions
>>> +	 * across all CS slots in the ringbuffer, with some jobs requiring
>>> +	 * twice as many as others, depending on their profiling status.
>>> +	 */
>>>  	ret = drm_sched_init(&queue->scheduler, &panthor_queue_sched_ops,
>>>  			     group->ptdev->scheduler->wq, 1,
>>> -			     args->ringbuf_size / (NUM_INSTRS_PER_SLOT * sizeof(u64)),
>>> +			     args->ringbuf_size / sizeof(u64),
>>>  			     0, msecs_to_jiffies(JOB_TIMEOUT_MS),
>>>  			     group->ptdev->reset.wq,
>>>  			     NULL, "panthor-queue", group->ptdev->base.dev);
>>> @@ -3354,6 +3595,7 @@ panthor_job_create(struct panthor_file *pfile,
>>>  {
>>>  	struct panthor_group_pool *gpool = pfile->groups;
>>>  	struct panthor_job *job;
>>> +	u32 credits;
>>>  	int ret;
>>>  
>>>  	if (qsubmit->pad)
>>> @@ -3407,9 +3649,16 @@ panthor_job_create(struct panthor_file *pfile,
>>>  		}
>>>  	}
>>>  
>>> +	job->profiling.mask = pfile->ptdev->profile_mask;
>>> +	credits = calc_job_credits(job->profiling.mask);
>>> +	if (credits == 0) {
>>> +		ret = -EINVAL;
>>> +		goto err_put_job;
>>> +	}
>>> +
>>>  	ret = drm_sched_job_init(&job->base,
>>>  				 &job->group->queues[job->queue_idx]->entity,
>>> -				 1, job->group);
>>> +				 credits, job->group);
>>>  	if (ret)
>>>  		goto err_put_job;
>>>  
> 


