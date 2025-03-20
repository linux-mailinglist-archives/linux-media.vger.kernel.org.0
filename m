Return-Path: <linux-media+bounces-28528-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DEAA6A408
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 11:47:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2EEC3B729F
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 10:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A845A224255;
	Thu, 20 Mar 2025 10:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="bEmaajYy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5DC222580
	for <linux-media@vger.kernel.org>; Thu, 20 Mar 2025 10:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742467653; cv=none; b=iAaADsDNuUW0PMmvy4LVaBG0bz4RrR3gijbAy2BaOcvTUVWZYLa44SapgT6O/1vjsVS2t754xXVYhBPfkJCGfsH98HUF9ELrfF4slHqYT+wMp4QDUGVEW7KVkUeFHPIPpdQS69Uqgfrp2N95DXpWx1006/uIAaOhiuZAQX0QNXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742467653; c=relaxed/simple;
	bh=9dLj34jXO3aWy8eeyY3CZQzkprJGU2y+2pU7Y2wkRA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hy+XBi5DJ1pt6EBR9wXdHyqQb/8Ib+GCmRc+5Oiu77xrY9h9pS4mk9ECglYnabUks1gHpsVuUktHswnd4HEVvUx1JBly3hDqAl3IxgE+gRskD8nhEuJwoQu1r/0C67qW1xOw9esNv2zeNnRoKSslkLEWHsBIZ69C7BfgC5s2RMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=bEmaajYy; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4394a823036so5966625e9.0
        for <linux-media@vger.kernel.org>; Thu, 20 Mar 2025 03:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1742467650; x=1743072450; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=foGgFo33VLzIkzjoUbfwPOydEMR+xeWsTRE1WEHeQbI=;
        b=bEmaajYyuEAwqsj1lT8XHD82b/XDX7wdgDnk4gAkmWIerawX7CIrbX7sW2qTvqKgy+
         wikI9i6hruJYVLlE7pOiXLnAwGWqb2/6J5D7gtkTe9wVo+cAxhU35STNea7eFyLxEARI
         LHY0+aRc/bJFjbBfpxXUXLCKaztk76T3rDmiIrvLoO2FwZtXHPvuJeZrHq5QX9R7ZHzm
         fipw234hvMWjGW0JLC8h6XZJP+8nB/gBykadkQF6rj4Nmvo2a+dYEGe/Wf3nzC/XnacX
         san9StQbuOWEBP2J7YXIZUDTMTWUIPnesdVg8ukv2sQGshkyvkKJ61wWC91x2MBtJtth
         gYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742467650; x=1743072450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=foGgFo33VLzIkzjoUbfwPOydEMR+xeWsTRE1WEHeQbI=;
        b=lZVAoNT+Ep2Sb0vno2XohO3Uf0ZZSD/PJuU1PXtqMiLZADvlKRXHmyKFUqjWTq+Py4
         JtxFO6ZAcrZUj1XnoR44Iwyy668drApuFsKvz0l82KeJm/cVvfJnhdwILsRwsNQAJw2f
         0+5HgAuWp66R+K0k+G4bYq6WEEU3D6xQiD9JKOR7QkcuNf/pWo8OzA0rFmLfu3s2LyWn
         qCTaquVZHCcFYplxvCUg4OBTnNGhLk9n907DK/GqTIukxDoxO8bHVWReYHgPKud+r4q2
         a70o5eOyS0gYURiz8bcIu0pnwuyPSCFvIX8POeE5bd+ilIqK3BxiMFCv7Mh5NanB+3Cs
         kaTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnrjp6U0Bpor2sIn1Yp0zJE4fAvPy+cNrmigNhNoKoo3U5yZs1n23gUkG3txy4xh6cwrRi7ULXvARNhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbK0FyV6q3J7RLV5JBLkO4ke/tbgM2rQO/lHKvdOaHI/jy0P9x
	DMTbcmwKMgd5/J1NQ89bGFQNgErHT8CHN52XaIWEgYaR6T2OOKUkT1sfrSRe5w4=
X-Gm-Gg: ASbGncvdysmhrEOhXGNfdR6fXI3eyt0HGE2WNM8C2108EtVvPRxWl7NDNCifburkSG7
	R2JE+rU5Uq6LiF+5pmNFC20Sf1AJsU3Fb4IOnl8M7bj48z5oFvGfSFdsO1KiR4nm7k+RbqT7VFG
	Lt7sbJANWb2W7o1fIozm6TCTjIFwjMtnHS0IJt1KHNDYJpZmBo0dM0SJkyWh3oAMA0mVoCb3Qm9
	bH/9FTYa8zS2uFL8O+ctc2nAHyTJbUSW/mJ58DVjazU+D804e6iyn1OFP7TBpcWRJ1lkt15/DJ8
	KVtKjlG7gu+/gMSZZdiRn2itUhGYKtbN18+s3HvDI+heW8bssXj3/BV+z5Ef
X-Google-Smtp-Source: AGHT+IEvHPoPXyg7rfkgM3Y97xOpECmfVdCIe7gAm9tgP99dIaDKMLf19aoDb9oOuJzL8kX1SocWRw==
X-Received: by 2002:a05:600c:5008:b0:43c:f87c:24d3 with SMTP id 5b1f17b1804b1-43d4381b4b9mr64371575e9.20.1742467649457;
        Thu, 20 Mar 2025 03:47:29 -0700 (PDT)
Received: from [192.168.0.101] ([90.241.98.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df35f7sm23678038f8f.13.2025.03.20.03.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 03:47:29 -0700 (PDT)
Message-ID: <d4ef3a3b-eed1-4c15-827b-4a34a8a47dc1@ursulin.net>
Date: Thu, 20 Mar 2025 10:47:28 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/10] drm/sched: trace dependencies for gpu jobs
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
 <20250320095818.40622-6-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250320095818.40622-6-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 20/03/2025 09:58, Pierre-Eric Pelloux-Prayer wrote:
> We can't trace dependencies from drm_sched_job_add_dependency
> because when it's called the job's fence is not available yet.
> 
> So instead each dependency is traced individually when
> drm_sched_entity_push_job is used.
> 
> Tracing the dependencies allows tools to analyze the dependencies
> between the jobs (previously it was only possible for fences
> traced by drm_sched_job_wait_dep).
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 24 ++++++++++++++++++-
>   drivers/gpu/drm/scheduler/sched_entity.c      |  8 +++++++
>   2 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index 21a85ee59066..5d9992ad47d3 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -54,7 +54,6 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>   			   __assign_str(dev);
>   			   __entry->fence_context = sched_job->s_fence->finished.context;
>   			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
> -
>   			   ),
>   	    TP_printk("dev=%s, id=%llu, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d",
>   		      __get_str(dev), __entry->id,
> @@ -88,6 +87,29 @@ TRACE_EVENT(drm_sched_process_job,
>   		      __entry->fence_context, __entry->fence_seqno)
>   );
>   
> +TRACE_EVENT(drm_sched_job_add_dep,
> +	TP_PROTO(struct drm_sched_job *sched_job, struct dma_fence *fence),
> +	TP_ARGS(sched_job, fence),
> +	TP_STRUCT__entry(
> +		    __field(u64, fence_context)
> +		    __field(u64, fence_seqno)
> +		    __field(u64, id)
> +		    __field(u64, ctx)
> +		    __field(u64, seqno)
> +		    ),
> +
> +	TP_fast_assign(
> +		    __entry->fence_context = sched_job->s_fence->finished.context;
> +		    __entry->fence_seqno = sched_job->s_fence->finished.seqno;
> +		    __entry->id = sched_job->id;
> +		    __entry->ctx = fence->context;
> +		    __entry->seqno = fence->seqno;
> +		    ),
> +	TP_printk("fence=%llu:%llu, id=%llu depends on fence=%llu:%llu",
> +		  __entry->fence_context, __entry->fence_seqno, __entry->id,
> +		  __entry->ctx, __entry->seqno)
> +);
> +
>   TRACE_EVENT(drm_sched_job_wait_dep,
>   	    TP_PROTO(struct drm_sched_job *sched_job, struct dma_fence *fence),
>   	    TP_ARGS(sched_job, fence),
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index a6d2a4722d82..047e42cfb129 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -580,6 +580,14 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   	ktime_t submit_ts;
>   
>   	trace_drm_sched_job(sched_job, entity);
> +
> +	if (trace_drm_sched_job_add_dep_enabled()) {
> +		struct dma_fence *entry;
> +		unsigned long index;
> +
> +		xa_for_each(&sched_job->dependencies, index, entry)
> +			trace_drm_sched_job_add_dep(sched_job, entry);
> +	}
>   	atomic_inc(entity->rq->sched->score);
>   	WRITE_ONCE(entity->last_user, current->group_leader);
>   

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko


