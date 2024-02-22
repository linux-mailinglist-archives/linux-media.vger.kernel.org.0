Return-Path: <linux-media+bounces-5646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D52ED85F963
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 14:16:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EEFE1F26E36
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 13:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554031468E9;
	Thu, 22 Feb 2024 13:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=damsy.net header.i=@damsy.net header.b="hcedB2s1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.damsy.net (mail.damsy.net [85.90.245.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AADE13A245;
	Thu, 22 Feb 2024 13:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.90.245.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708607710; cv=none; b=lQoaAE1zbxVofpDYXyVlayaA7SW1IjwGfKKoPu+Po+QP1lRvh2BocfRZUNe2uLqD5JQp/W7YveLA+QghQUEVAzG9zAGfe+ePbLoF0Q0UcqXkOIDS741oqDPyhDNxrhQMkz4l2AsAfEmPI/ROKElxw8Uo5JiKO/Pc7++kPifKFj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708607710; c=relaxed/simple;
	bh=veO8KXSoveS60aha/VPrYTpEY2ldAL2U9sjvxFFrAMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JmjiUsFewzyUwKVAzShFR7TmY0v4TH5zFM7L5FPd9YjxLNj44CShgIcBFAxW8f1FTjbsMlO0em6xJqGOqEyEHcQg15aVVHu7v6x5vS+TxO0QiBmzl1qdX86JI3so0XX5RKSTPX6ydM/tg8mW8xDiJyjltAHMt1OK/7EYoTDyFnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=damsy.net; spf=pass smtp.mailfrom=damsy.net; dkim=pass (2048-bit key) header.d=damsy.net header.i=@damsy.net header.b=hcedB2s1; arc=none smtp.client-ip=85.90.245.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=damsy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=damsy.net
Message-ID: <55e420d4-0c9c-4255-9b2d-8d68f1afc5ab@damsy.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=damsy.net; s=201803;
	t=1708607110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wYUSbGOEmfAVx7b/dFhgsrpPqsuJWC/57g3jbSD5G6I=;
	b=hcedB2s17daKEmtlqmq2H2RmhTIAM94EWOtLQZNlBpVY4fgjzNKYJ6f92e4Hpmz8RUFbzv
	r8FFVzu9x6M1yDPxNfALmSj2OXT2Bt9c3RpZzb902nmM6Vzhy+cU05RKezkQR7oJh8THgh
	4GUX+EOFQRqjGZ9Dxh9Gub9vIKIEmHGMb8ZP4IhNkDoLcj1kwTfpp15VJTnV0LuzZs3q69
	uUPt7bs0oGCceAhxzKntPAyLJO+kICDQpjSil2KeTb1r1cWl90n+UQKKhptowFf6zq89r/
	dJC5xDF9SjXLGRyjSTEmkSTAYYV04BXqcNAnjmKYT4XPtviUDkV251p0Ca/rjg==
Date: Thu, 22 Feb 2024 14:05:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 6/8] drm: add drm_mode_atomic_commit event
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Alex Deucher
 <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
References: <20240216151006.475077-1-pierre-eric.pelloux-prayer@amd.com>
 <20240216151006.475077-7-pierre-eric.pelloux-prayer@amd.com>
 <Zc-MLQZ1bby_vKal@intel.com>
Content-Language: fr
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <Zc-MLQZ1bby_vKal@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 16/02/2024 à 17:24, Ville Syrjälä a écrit :
> On Fri, Feb 16, 2024 at 04:09:55PM +0100, Pierre-Eric Pelloux-Prayer wrote:
>> With this and the dma_fence_used_as_dependency event, a tool can draw the
>> relationship between the compositing draw, the atomic commit, and vblank.
>>
>> An example on a 2 monitors system look like this:
>>
>> gnome-shell-1638    [018] .....  2571.905124: drm_mode_atomic_commit: file=00000000245c3f0c, pid=    1165, flags=00000201, crtcs={0x1}
>> gnome-shell-1638    [018] .....  2571.905147: dma_fence_used_as_dependency: driver=drm_sched timeline=gfx_0.0.0 context=270 seqno=73240 reason=dma_fence_chain_init
>> gnome-shell-1638    [018] .....  2571.913226: drm_mode_atomic_commit: file=00000000245c3f0c, pid=    1165, flags=00000201, crtcs={0x0}
>> gnome-shell-1638    [018] .....  2571.913250: dma_fence_used_as_dependency: driver=drm_sched timeline=gfx_0.0.0 context=270 seqno=73241 reason=dma_fence_chain_init
>>      <idle>-0       [018] d.h3.  2571.915687: drm_vblank_event: crtc=1, seq=155747, time=2571916093743, high-prec=true
>>      <idle>-0       [018] d.h3.  2571.915968: drm_vblank_event: crtc=0, seq=153862, time=2571916377180, high-prec=true
>>
>> v2: fix unchecked memory allocation
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/drm_atomic_uapi.c | 21 +++++++++++++++++++++
>>   drivers/gpu/drm/drm_trace.h       | 23 +++++++++++++++++++++++
>>   2 files changed, 44 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>> index 29d4940188d4..f31b5c6f870b 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -41,6 +41,7 @@
>>   #include <linux/file.h>
>>   
>>   #include "drm_crtc_internal.h"
>> +#include "drm_trace.h"
>>   
>>   /**
>>    * DOC: overview
>> @@ -1503,6 +1504,26 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>>   		drm_mode_object_put(obj);
>>   	}
>>   
>> +	if (trace_drm_mode_atomic_commit_enabled()) {
>> +		struct drm_crtc_state *crtc_state;
>> +		struct drm_crtc *crtc;
>> +		int *crtcs;
>> +		int i, num_crtcs;
>> +
>> +		crtcs = kcalloc(dev->mode_config.num_crtc, sizeof(int),
>> +				GFP_KERNEL);
>> +
>> +		if (crtcs) {
>> +			num_crtcs = 0;
>> +			for_each_new_crtc_in_state(state, crtc, crtc_state, i)
>> +				crtcs[num_crtcs++] = drm_crtc_index(crtc);
>> +
>> +			trace_drm_mode_atomic_commit(file_priv, crtcs, num_crtcs, arg->flags);
>> +
>> +			kfree(crtcs);
>> +		}
>> +	}
> 
> I think the current drm trace events are sort of semi-useless.
> The problems are:
> - no device id in the events so good luck with multi gpu systems
> - vblank trace events are only emitted from some vblank
>    codepaths but not others
> 
> I'm also not sure putting an event straight into the atomic ioctl is
> particularly useful.
> 
> First of all it means that any commit not initiated by the atomic
> ioctl will not be traced.
> 
> It would also seem more useful to me if the driver can emit the
> trace just before it commits the frame to the hardware, so that
> we can also observe the latency between userspace submitting
> the frame vs. when the hardware will actually see it.
> 
> Also if we want tools to use these I think we're going to have to
> make some kind of abi promises about the events, so we should make
> sure they are as future proof as we can make them (eg. regarding
> mutli-gpu systems/etc.).

Thanks for your feedback.

This series was also discussed on IRC with Sima [1], and the conclusion was
that it would be good to rework the series with the following goals in
mind:
* make sure the events are useful for any drivers using the core drm code,
not just amdgpu
* add new events or extend existing ones so that all the required information is
there (= no guessing needed)
* document the updated tracepoints (as UAPI?): how they should be interpreted
by tools (eg: how to reconstruct fence dependencies? how to measure latency? etc)


Pierre-Eric


[1]: https://dri.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&date=2024-02-16




> 
>> +
>>   	ret = prepare_signaling(dev, state, arg, file_priv, &fence_state,
>>   				&num_fences);
>>   	if (ret)
>> diff --git a/drivers/gpu/drm/drm_trace.h b/drivers/gpu/drm/drm_trace.h
>> index 11c6dd577e8e..63489923c289 100644
>> --- a/drivers/gpu/drm/drm_trace.h
>> +++ b/drivers/gpu/drm/drm_trace.h
>> @@ -66,6 +66,29 @@ TRACE_EVENT(drm_vblank_event_delivered,
>>   		      __entry->seq)
>>   );
>>   
>> +TRACE_EVENT(drm_mode_atomic_commit,
>> +	    TP_PROTO(struct drm_file *file, int *crtcs, int ncrtcs, uint32_t flags),
>> +	    TP_ARGS(file, crtcs, ncrtcs, flags),
>> +	    TP_STRUCT__entry(
>> +		    __field(struct drm_file *, file)
>> +		    __dynamic_array(u32, crtcs, ncrtcs)
>> +		    __field(uint32_t, ncrtcs)
>> +		    __field(uint32_t, flags)
>> +		    ),
>> +	    TP_fast_assign(
>> +		    unsigned int i;
>> +
>> +		    __entry->file = file;
>> +		    for (i = 0; i < ncrtcs; i++)
>> +			((u32 *)__get_dynamic_array(crtcs))[i] = crtcs[i];
>> +		    __entry->ncrtcs = ncrtcs;
>> +		    __entry->flags = flags;
>> +		    ),
>> +	    TP_printk("file=%p, pid=%8d, flags=%08x, crtcs=%s", __entry->file,
>> +		      pid_nr(__entry->file->pid), __entry->flags,
>> +		      __print_array(__get_dynamic_array(crtcs), __entry->ncrtcs, 4))
>> +);
>> +
>>   #endif /* _DRM_TRACE_H_ */
>>   
>>   /* This part must be outside protection */
>> -- 
>> 2.40.1
> 

