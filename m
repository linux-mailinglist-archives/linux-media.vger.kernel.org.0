Return-Path: <linux-media+bounces-18465-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E3297E9E0
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 12:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D45528152C
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 10:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106301974EA;
	Mon, 23 Sep 2024 10:24:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2060DEADA;
	Mon, 23 Sep 2024 10:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727087064; cv=none; b=msuKmAwEEfE10U7KjBpmU6Up8Va9q2aSqRSppgDFENH1IwwvVnAnIHmOGVpUXXD+FOcxH6Gpa9rSVeICyGUtGKcBc3ffQqOljMvI8uvwOqK5FVw5vtlg0CwFJXy3T9C8Wt0q3MYac//9L8RVbWVXHg6GAOkMJ47RE1tY1HtnmJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727087064; c=relaxed/simple;
	bh=ISFPEWBY4YprYmJOPZ5EFDXSFrJMUSjAHtfrxv2D/B0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZxxkcMkIAb5VF3ipR1Yzd355/zUU1nzV8dmIqG5GIomHkz6/OHOXv1A0580aqhdbmGrHWam6btncCimIVnJOfL094Xu/6EEtXkk7sHQQ4dBAlebrboCuOybHkJMZ7IeaRUL0ciMd4d/RQ+k7I451JypA/7uj0Z/sCNzH6drwuNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EBCDFEC;
	Mon, 23 Sep 2024 03:24:50 -0700 (PDT)
Received: from [10.57.79.18] (unknown [10.57.79.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10BB23F71A;
	Mon, 23 Sep 2024 03:24:18 -0700 (PDT)
Message-ID: <f639bacf-eba5-48d3-8385-7d185a030130@arm.com>
Date: Mon, 23 Sep 2024 11:24:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] drm/panthor: introduce job cycle and timestamp
 accounting
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20240920234436.207563-1-adrian.larumbe@collabora.com>
 <20240920234436.207563-2-adrian.larumbe@collabora.com>
 <07c8c715-4016-4963-8544-2e9cc1a8208b@arm.com>
 <20240923121850.38181059@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240923121850.38181059@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/09/2024 11:18, Boris Brezillon wrote:
> On Mon, 23 Sep 2024 10:07:14 +0100
> Steven Price <steven.price@arm.com> wrote:
> 
>>> +static struct dma_fence *
>>> +queue_run_job(struct drm_sched_job *sched_job)
>>> +{
>>> +	struct panthor_job *job = container_of(sched_job, struct panthor_job, base);
>>> +	struct panthor_group *group = job->group;
>>> +	struct panthor_queue *queue = group->queues[job->queue_idx];
>>> +	struct panthor_device *ptdev = group->ptdev;
>>> +	struct panthor_scheduler *sched = ptdev->scheduler;
>>> +	struct panthor_job_ringbuf_instrs instrs;  
>>
>> instrs isn't initialised...
>>
>>> +	struct panthor_job_cs_params cs_params;
>>> +	struct dma_fence *done_fence;
>>> +	int ret;
>>>  
>>>  	/* Stream size is zero, nothing to do except making sure all previously
>>>  	 * submitted jobs are done before we signal the
>>> @@ -2900,17 +3062,23 @@ queue_run_job(struct drm_sched_job *sched_job)
>>>  		       queue->fence_ctx.id,
>>>  		       atomic64_inc_return(&queue->fence_ctx.seqno));
>>>  
>>> -	memcpy(queue->ringbuf->kmap + ringbuf_insert,
>>> -	       call_instrs, sizeof(call_instrs));
>>> +	job->profiling.slot = queue->profiling.seqno++;
>>> +	if (queue->profiling.seqno == queue->profiling.slot_count)
>>> +		queue->profiling.seqno = 0;
>>> +
>>> +	job->ringbuf.start = queue->iface.input->insert;
>>> +
>>> +	get_job_cs_params(job, &cs_params);
>>> +	prepare_job_instrs(&cs_params, &instrs);  
>>
>> ...but it's passed into prepare_job_instrs() which depends on
>> instrs.count (same bug as was in calc_job_credits()) - sorry I didn't
>> spot it last review.
> 
> Hm, can't we initialize instr::count to zero in prepare_job_instrs()
> instead?

Indeed that would probably be better! I hadn't noticed there were two
places in the previous review.

Steve

