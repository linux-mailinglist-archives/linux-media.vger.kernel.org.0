Return-Path: <linux-media+bounces-25641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1659BA275BC
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 16:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6689B3A6707
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 15:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4018B214233;
	Tue,  4 Feb 2025 15:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="m1Az6B7D"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A91213E97
	for <linux-media@vger.kernel.org>; Tue,  4 Feb 2025 15:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738682583; cv=none; b=k216RUJrOzU0Ymjk26FpOovAVyNnKCME3OUrVE6ddcwZIrRWn+G39hSEjZvGHgw50ZIhZ2JChVx7AZ9e2a/Vk9bsIjpUrZtgZbw8Q9mpz1ztE7oAscC2EyTMxLLtRiMd8eORQV8K3ri289WZBtUXvXmvighTq4kUhGmt1OsARMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738682583; c=relaxed/simple;
	bh=+QHEmhin9eq4MJnLF2NbF5F6nGIZ7V/TMIa16O5ywCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TfDMpDaKv9R14NzZnnuDGptyXXCv5nLC6FxqZf4GXCmEW6BnGKD7YOE9l35HK2j/OBrT785ANOE8DPf+rOGiDM6Z4hxbtM83VXsRROx/stFVM05hUYdlN7XAKnDoWp8gT3svKnIQU1K85YjqBAW6mSeYVkXkTfDZHxmwlhAr9pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=m1Az6B7D; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436341f575fso67534775e9.1
        for <linux-media@vger.kernel.org>; Tue, 04 Feb 2025 07:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1738682580; x=1739287380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uHPzkNUrpAio+U5bG1xs4+WPUC/pQ8D7HaWPlsKB46g=;
        b=m1Az6B7DrrYVvEF8GW2gZiuC9HzKj0MtZZt4c0aci/0vPqbP0luljzwy6MhaTHKxei
         aV+Osl3+CFweUzlpsfrODTqQgs5fIgPtKq0k0/yevXfm+I320wPsU+UjFMIBWRNPLn7e
         g2G1Y02Y4zKIy+0q0iZqKrCj/Q7ioumK0T0RwkT1MxO00r78xh2DJlPPFP2MYNkJJ/Sq
         dV9H+RWqq3vCtBgOFOALvysQ1XCeHsIY/C+3UHcK8oKnaexaP8YXNK1HTi3SaWxYDW6F
         YSA04R4Ho2ovGbvCcsrxgThW7Lykcu95Uwsde7uNbLpvz45+0Of/C3i+v7AB6AxeGu5F
         3Igg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738682580; x=1739287380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uHPzkNUrpAio+U5bG1xs4+WPUC/pQ8D7HaWPlsKB46g=;
        b=gAmQKKalWv/Sd47bMpY275Ce/1dFaScTUaXfV6YgEgkE7WzxItiFUbf8+Sajy+nNC+
         i1gIlMF/DTsCRmGYXAgGtK3Lqczs3d/D03AQk8Ypo+T08d67GdjZsSJYxL6nu5pmnEUW
         HpDopopP57Deu55UBOg676+wmula1d/DAIbTDE7MpA4zobCPm0mkaR/rvHmzytjoDUJw
         5eLs0lG2xGIfcfnarqdK7WI/CKbfxaaPqMgPD0MGKeOPQrQ4ImawboxQc4wxUmP4nskf
         +RiH+2I3BRZMc6Y/zO2XtFcKaLCogQW4RvU+Gl9Hj56AE6p3trkfLo1UCx1O+QBNT5fC
         qAbw==
X-Forwarded-Encrypted: i=1; AJvYcCW2co6iDKqGChlMjuL3nHeUX0lwJiK/XyLoztu/40UKMyibcZ5qcmn//V6DQ0R0d9Dal9roFyiBiOB5pA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwX8EhGGbKMSF7CkNA4q5qZWDBG3Slk8K3mfngbGR7WrtSL3/4K
	gCsSqD/9IuXIfzjJ200lMHkEBAVn2vc6ibjVRBaYKRkmLgs35K4pTM1bIxIupGQ=
X-Gm-Gg: ASbGnctb+uGunXvtrgiSJc9J2cfCODFYahljsDvoItZGk68DeXnTRNR41MZ5LEtUE6Q
	4IMs9ABXiRVXRYN0VpYbZE/JRMLWBWMRk8HNPGaMoCo4XHVOPVZjuYCcvTiAouVxjk/eSBnTgCZ
	va2ceTtBbVT4IJK9BTr3pQhcNQ2uE8sz7TJDtniC9ApE3JDnMmRMCCaQHLVmPFTNagc1uf1v5J7
	QXJhOq7j5dLlDT0x6KJ3hXz4+gSnCwuhLw+SO8nRrnZPDLFcm7ROVn4DZb83lkA7BvsWx5s26lI
	RM+RNAek1jlnuVLwU197S9jNOk0lFAI=
X-Google-Smtp-Source: AGHT+IEntKLHr8j1sa+aY2Ls+kNA4qbxjue7cUKL+PfzPTcK+ezljDd4qdj5+6d5zwUZ+43zkQB0bw==
X-Received: by 2002:a05:600c:3c82:b0:430:57e8:3c7e with SMTP id 5b1f17b1804b1-438dc4251f2mr231551085e9.28.1738682578837;
        Tue, 04 Feb 2025 07:22:58 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b5492sm16239592f8f.73.2025.02.04.07.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 07:22:58 -0800 (PST)
Message-ID: <cc3444d8-a354-4332-93e7-0b1a70d3c4ac@ursulin.net>
Date: Tue, 4 Feb 2025 15:22:57 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] drm/sched: cleanup gpu_scheduler trace events
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
 <20250131110328.706695-5-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250131110328.706695-5-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 31/01/2025 11:03, Pierre-Eric Pelloux-Prayer wrote:
> A fence uniquely identify a job, so this commits updates the places
> where a kernel pointer was used as an identifier by:
> 
>     "fence=%llu:%llu"
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 41 +++++++++++--------
>   1 file changed, 23 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index c4ec28540656..3cdd8d8f8021 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -36,28 +36,29 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>   	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
>   	    TP_ARGS(sched_job, entity),
>   	    TP_STRUCT__entry(
> -			     __field(struct drm_sched_entity *, entity)
> -			     __field(struct dma_fence *, fence)
> -			     __string(name, sched_job->sched->name)
>   			     __field(uint64_t, id)
> +			     __string(name, sched_job->sched->name)
>   			     __field(u32, job_count)
>   			     __field(int, hw_job_count)
>   			     __string(dev, dev_name(sched_job->sched->dev))
> +			     __field(uint64_t, fence_context)
> +			     __field(uint64_t, fence_seqno)
>   			     ),
>   
>   	    TP_fast_assign(
> -			   __entry->entity = entity;
>   			   __entry->id = sched_job->id;
> -			   __entry->fence = &sched_job->s_fence->finished;
>   			   __assign_str(name);
>   			   __entry->job_count = spsc_queue_count(&entity->job_queue);
>   			   __entry->hw_job_count = atomic_read(
>   				   &sched_job->sched->credit_count);
>   			   __assign_str(dev);
> +			   __entry->fence_context = sched_job->s_fence->finished.context;
> +			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
> +
>   			   ),
> -	    TP_printk("dev=%s, entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
> -		      __get_str(dev), __entry->entity, __entry->id,
> -		      __entry->fence, __get_str(name),
> +	    TP_printk("dev=%s, id=%llu, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d",
> +		      __get_str(dev), __entry->id,
> +		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
>   		      __entry->job_count, __entry->hw_job_count)
>   );
>   
> @@ -75,37 +76,41 @@ TRACE_EVENT(drm_sched_process_job,
>   	    TP_PROTO(struct drm_sched_fence *fence),
>   	    TP_ARGS(fence),
>   	    TP_STRUCT__entry(
> -		    __field(struct dma_fence *, fence)
> +		    __field(uint64_t, fence_context)
> +		    __field(uint64_t, fence_seqno)
>   		    ),
>   
>   	    TP_fast_assign(
> -		    __entry->fence = &fence->finished;
> +		    __entry->fence_context = fence->finished.context;
> +		    __entry->fence_seqno = fence->finished.seqno;
>   		    ),
> -	    TP_printk("fence=%p signaled", __entry->fence)
> +	    TP_printk("fence=%llu:%llu signaled",
> +		      __entry->fence_context, __entry->fence_seqno)

Any chance to rename this tracepoint while changing things around? For 
me "process" is not intuitive to what stage it refers so maybe a set of 
tracepoints like:

drm_sched_job_(wait_)dependenc(y|ies) - more on this in the next patch
drm_sched_job_queue
drm_sched_job_run
drm_sched_job_done

So the naming is standardised.

>   );
>   
>   TRACE_EVENT(drm_sched_job_wait_dep,
>   	    TP_PROTO(struct drm_sched_job *sched_job, struct dma_fence *fence),
>   	    TP_ARGS(sched_job, fence),
>   	    TP_STRUCT__entry(
> -			     __string(name, sched_job->sched->name)
> +			     __field(uint64_t, fence_context)
> +			     __field(uint64_t, fence_seqno)
>   			     __field(uint64_t, id)
>   			     __field(struct dma_fence *, fence)
>   			     __field(uint64_t, ctx)
> -			     __field(unsigned, seqno)
> +			     __field(uint64_t, seqno)
>   			     ),
>   
>   	    TP_fast_assign(
> -			   __assign_str(name);
> +			   __entry->fence_context = sched_job->s_fence->finished.context;
> +			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
>   			   __entry->id = sched_job->id;
>   			   __entry->fence = fence;
>   			   __entry->ctx = fence->context;
>   			   __entry->seqno = fence->seqno;
>   			   ),
> -	    TP_printk("job ring=%s, id=%llu, depends fence=%p, context=%llu, seq=%u",
> -		      __get_str(name), __entry->id,
> -		      __entry->fence, __entry->ctx,
> -		      __entry->seqno)
> +	    TP_printk("fence=%llu:%llu, id=%llu, dependencies:{fence=%llu:%llu}",

Will dependencies ever become a list here? Just wondering if plural and 
curlies bring anything of value, or if it would be more readable as 
"fence=%llu:%llu, id=%llu, dependency=%llu:%llu".

Regards,

Tvrtko

> +		      __entry->fence_context, __entry->fence_seqno, __entry->id,
> +		      __entry->ctx, __entry->seqno)
>   );
>   
>   #endif

