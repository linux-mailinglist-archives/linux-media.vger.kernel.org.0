Return-Path: <linux-media+bounces-25642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C6FA275E0
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 16:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0ACE164F54
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 15:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0607D2144C0;
	Tue,  4 Feb 2025 15:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="JdYZoNMi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F299D207665
	for <linux-media@vger.kernel.org>; Tue,  4 Feb 2025 15:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738683075; cv=none; b=Y5sJPEeSxtA/9Ylg7BXglSA/znA5BJ6pHsowaeBZqytZYaAzVqdMylZQvTOWtWr0T5dC61eX2lsjOcnHXOmzqZI9kenSoGYd0sTl2PGI2yEj01FNkPMSWsp3fLmGrZSlqV5YES3YDjUOCT2vzqbWgkXgHn0ErDLsr8ObWX7ri40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738683075; c=relaxed/simple;
	bh=w7uyyrr4hji67+OQhdxfK+juNW+27vozeL0bcgS/b6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R+Mv1uAtN5D0Ot5BTBfLjIZdHes4Ta5sA9+iiCPSqFXak6ocTe2lz4lok0qHagXFUi1jSuduI98hoyvj8qbeXrNdQtU+543eXtQ8OlXHRq0UAbGwPXM/2tbWNulykXP0nNatPrHqY+arywECpgzBHWPVEBSqFkbJZ1ku5337CiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=JdYZoNMi; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43626213fffso42036225e9.1
        for <linux-media@vger.kernel.org>; Tue, 04 Feb 2025 07:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1738683071; x=1739287871; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YO04QLH+X8zKP3vbuSZ62NP1UERnKX1EVSjge29Xk6E=;
        b=JdYZoNMiFf8s6Ue571L77VD5phGSxyXzgIJ2V7X7PvN6Kb0XMhua73PXrYGp6RIfnU
         n8hSxeLZfZE9SipOlTk+cDX2L98XhupRgmX2yRAXsyLztQMquICYIP31i4gWMQWx93JZ
         Q9oVoMDz9OlzPM52n2j/T98C9Ii+nwjrzo/lX+st77kv3Haqxf3WtTJkzUKuhkNur5Vf
         cnSitxjuEOB6JXBEonyuyXfwA34WiOanDPyjZ4PS4IhlEzmd/Jmh7L7Rq/wK8GVjIg8f
         4bDfSlfOxP/mP7aXfxCdch27JW46mtWpf8293fvc29bzNBYjLePTVSh4/nmwuJ0O9xh7
         ICpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738683071; x=1739287871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YO04QLH+X8zKP3vbuSZ62NP1UERnKX1EVSjge29Xk6E=;
        b=oa0FSPZEV9/iRPp5FuSyoSIlwApSI/oddeN1x7sMalv+xVq7+ngli6niUHVDOjtCMg
         Tmco7TJuDRV6APxGSj915RE+5/YatjjPAPFnuDLAAhmxwiyebliNY2B8wAGwWiKNYhmn
         LjljSX6cExuif60n5+sILyelFu07L+bpK0dUueqR7pnNoEJKvVQ6v6SkztN6spnfbNht
         GYbsS0NKRIkVj6Fs6cCUFB/t0zHKvBtH13xoVUWne0n2iwu3HajoAp1nYojs2IpAgGGr
         oK1kHSZ83Ja58LTfIbKf7yBfBt7yfqKul4UeYFEjOTPBt6bflwO1KCgWmof7ktPtAWoX
         hnGw==
X-Forwarded-Encrypted: i=1; AJvYcCWRJUgtJi612Ogugdxv5liOwqEWIf1v2wPWyCZ5w7Q0iHjbpAByqQ0Z/dq4MPeQpvpJwRGe5aAZb6DAQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMSo8nFHFrJR7PgMTwPE+k3jzHbxLgrvYkXHOtHXPMQZ/s5pgX
	S8/t08LJ3oibct4VxYIH6sixJlJGV6N99j0x9sO5YbvppyEtR6blaQ/gtm1ATF4=
X-Gm-Gg: ASbGncsvw8z3c0gwUtBpylEWtqGsPdFO4KVvLxTjko/yEiQJFC5q38gIbnwbKJbMPes
	n2tuhrPK1aJ5q5/NjeLZroaC8iFx/MPcOo/PzpgN565WJPUNdrUDcVFzqWQ/3+fXqn07naV8H1v
	d5nZXKpjDFy9KgSe3fJGMzXct3wHy4OAIHvzl3ITUKC/0vmJxmnMlklsKbpqyvcUJxLdm4Z6czH
	PYOxmhSvt+1FI+WTVJ0AD9x6V1dTsQzvjAW+B7RHf5OF0p5g4J0xokTmgJNWYGy7mj2PyOfwdw7
	VPxI/Y8vovxoEnuwe74u6Ov28f/XnwQ=
X-Google-Smtp-Source: AGHT+IGyCOrMOzLOqDd5nklSWFy5dFMUUbqMYwM7tDC92GnRTMCdM70CAqKld747kDZSUFBqJ1B0DA==
X-Received: by 2002:a05:600c:3ac4:b0:436:185f:dfae with SMTP id 5b1f17b1804b1-43905f6ab6amr24808885e9.6.1738683069360;
        Tue, 04 Feb 2025 07:31:09 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23de772sm191993285e9.13.2025.02.04.07.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 07:31:08 -0800 (PST)
Message-ID: <bfc03583-03b8-4fc4-98f8-3d6c7c9f95fc@ursulin.net>
Date: Tue, 4 Feb 2025 15:31:07 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/7] drm/sched: trace dependencies for gpu jobs
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <pstanner@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250131110328.706695-1-pierre-eric.pelloux-prayer@amd.com>
 <20250131110328.706695-6-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250131110328.706695-6-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 31/01/2025 11:03, Pierre-Eric Pelloux-Prayer wrote:
> Trace the fence dependencies similarly to how we print fences:
> 
>   ... , dependencies:{fence=606:38006}
> 
> This allows tools to analyze the dependencies between the jobs (previously
> it was only possible for fences traced by drm_sched_job_wait_dep).
> 
> Since drm_sched_job and drm_run_job use the same base event class,
> the caller of trace_drm_run_job have to pass a dep_count of 0 (which
> is ignored because dependencies are only considered at submit time).
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 59 ++++++++++++++++---
>   drivers/gpu/drm/scheduler/sched_entity.c      |  8 ++-
>   drivers/gpu/drm/scheduler/sched_main.c        |  2 +-
>   3 files changed, 58 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index 3cdd8d8f8021..ca19cd9a146a 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -26,15 +26,41 @@
>   
>   #include <linux/stringify.h>
>   #include <linux/types.h>
> +#include <linux/trace_seq.h>
>   #include <linux/tracepoint.h>
>   
>   #undef TRACE_SYSTEM
>   #define TRACE_SYSTEM gpu_scheduler
>   #define TRACE_INCLUDE_FILE gpu_scheduler_trace
>   
> +#ifndef __TRACE_EVENT_GPU_SCHEDULER_PRINT_FN
> +#define __TRACE_EVENT_GPU_SCHEDULER_PRINT_FN
> +/* Similar to trace_print_array_seq but for fences. */
> +static inline const char *__print_dma_fence_array(struct trace_seq *p, const void *buf, int count)
> +{
> +	const char *ret = trace_seq_buffer_ptr(p);
> +	u64 *fences = (u64 *) buf;
> +	const char *prefix = "";
> +
> +	trace_seq_putc(p, '{');
> +	for (int i = 0; i < count; i++) {
> +		u64 context = fences[2 * i], seqno = fences[2 * i + 1];
> +
> +		trace_seq_printf(p, "%sfence=%llu:%llu",
> +				 prefix, context, seqno);
> +		prefix = ",";
> +	}
> +	trace_seq_putc(p, '}');
> +	trace_seq_putc(p, 0);
> +
> +	return ret;
> +}
> +#endif
> +
>   DECLARE_EVENT_CLASS(drm_sched_job,
> -	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
> -	    TP_ARGS(sched_job, entity),
> +	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity,
> +		     unsigned int dep_count),
> +	    TP_ARGS(sched_job, entity, dep_count),
>   	    TP_STRUCT__entry(
>   			     __field(uint64_t, id)
>   			     __string(name, sched_job->sched->name)
> @@ -43,9 +69,14 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>   			     __string(dev, dev_name(sched_job->sched->dev))
>   			     __field(uint64_t, fence_context)
>   			     __field(uint64_t, fence_seqno)
> +			     __field(int, n_deps)
> +			     __dynamic_array(u64, deps, dep_count * 2)
>   			     ),
>   
>   	    TP_fast_assign(
> +			   unsigned long idx;
> +			   struct dma_fence *fence;
> +			   u64 *dyn_arr;
>   			   __entry->id = sched_job->id;
>   			   __assign_str(name);
>   			   __entry->job_count = spsc_queue_count(&entity->job_queue);
> @@ -54,22 +85,32 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>   			   __assign_str(dev);
>   			   __entry->fence_context = sched_job->s_fence->finished.context;
>   			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
> -
> +			   __entry->n_deps = dep_count;
> +			   if (dep_count) {
> +				dyn_arr = __get_dynamic_array(deps);
> +				xa_for_each(&sched_job->dependencies, idx, fence) {
> +					dyn_arr[2 * idx] = fence->context;
> +					dyn_arr[2 * idx + 1] = fence->seqno;
> +				}
> +			   }
>   			   ),
> -	    TP_printk("dev=%s, id=%llu, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d",
> +	    TP_printk("dev=%s, id=%llu, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d, dependencies:%s",
>   		      __get_str(dev), __entry->id,
>   		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
> -		      __entry->job_count, __entry->hw_job_count)
> +		      __entry->job_count, __entry->hw_job_count,
> +		      __print_dma_fence_array(p, __get_dynamic_array(deps), __entry->n_deps))
>   );
>   
>   DEFINE_EVENT(drm_sched_job, drm_sched_job,
> -	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
> -	    TP_ARGS(sched_job, entity)
> +	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity,
> +		     unsigned int dep_count),
> +	    TP_ARGS(sched_job, entity, dep_count)
>   );
>   
>   DEFINE_EVENT(drm_sched_job, drm_run_job,
> -	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
> -	    TP_ARGS(sched_job, entity)
> +	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity,
> +	    	     unsigned int dep_count),
> +	    TP_ARGS(sched_job, entity, 0)
>   );
>   
>   TRACE_EVENT(drm_sched_process_job,
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 69bcf0e99d57..0ce3a82fe6fd 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -592,7 +592,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   	bool first;
>   	ktime_t submit_ts;
>   
> -	trace_drm_sched_job(sched_job, entity);
> +	if (trace_drm_sched_job_enabled()) {
> +		unsigned long index, n = 0;
> +		void *f;
> +
> +		xa_for_each(&sched_job->dependencies, index, f) { n++; }
> +		trace_drm_sched_job(sched_job, entity, n);
> +	}
I wonder if it would be good enough to simply trace dependencies one by 
one in drm_sched_job_add_dependency and drop all the array magic/support 
code?

In which case that was the drm_sched_job_depdency tracepoint I hinted in 
my reply to 4/7.

I know you are at v7 but as we are going towards the stable ABI route I 
am thinking it is worth discussing this option.

We could even leave the separate "wait dep" vs "add dep" and have a set 
like:

drm_sched_job_add_dependency
drm_sched_job_queue
drm_sched_job_wait_dependency
drm_sched_job_run
drm_sched_job_done

By tracing them one by one we remove the complications from the kernel 
side and let the userspace parse multiple lines. Shouldn't be a problem 
for there.

Regards,

Tvrtko

>   	atomic_inc(entity->rq->sched->score);
>   	WRITE_ONCE(entity->last_user, current->group_leader);
>   
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index ad306d3d7282..c645f07ebe26 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1214,7 +1214,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>   	atomic_add(sched_job->credits, &sched->credit_count);
>   	drm_sched_job_begin(sched_job);
>   
> -	trace_drm_run_job(sched_job, entity);
> +	trace_drm_run_job(sched_job, entity, 0);
>   	fence = sched->ops->run_job(sched_job);
>   	complete_all(&entity->entity_idle);
>   	drm_sched_fence_scheduled(s_fence, fence);

