Return-Path: <linux-media+bounces-32497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BC5AB6EAA
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 16:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DEC83AC4E6
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 14:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A4E1B424A;
	Wed, 14 May 2025 14:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="niCy8pGN"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D8019D8BC
	for <linux-media@vger.kernel.org>; Wed, 14 May 2025 14:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747234731; cv=none; b=QGaDI/1Viy/TQgU+jw7+F0/fMPVMsarFRLz8T5TGlfevl+zI9lLMJtraB8XxPp1c3sJtGBxa9W32CKOvRiubaD3w0yosV60HHuNOm678mqrgsU1YkS8rl2Nz50x1VdBzSvpZbF5lqeNuUiX6w021ct58gFYKDkfc4ojh3TsSyZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747234731; c=relaxed/simple;
	bh=Eb3VcJ4fZJvkbd6RZ3FS1GNLSzVFWt6DMHjS0a2TGcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HJvZJEHtHz920/RHm3nLsno6ZU1PGMIEEbSot3aHRJRvEEjQEo8niHJud5QAF3DPFf2VfBpFOqPSI1EbTHmPn7DClWlY4cLz7j9HrCvi6KWEuTI/qLHUbzpZgkLqikFs2Sbf1RQTIccJWMq/bMo51tKAQHltVhDQYYYXbW7K/UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=niCy8pGN; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CdtrX/G9DhmcNcNluBx2us3yynd+xmt00spTv/+a9o4=; b=niCy8pGNGoiyFD++fPmSpXQLuB
	qhRV4oMp4a51n82n3XWCSTIYHaHJnuFxjlDKGdFihnC49HHFmUjsyRAGZvc9rj0ht4QjDn/uYpMa7
	lBHbIJTJIhAYRHez43USwPSyTRq0UbwCkD1gaynIeOJ50nlXhMJa03wlPz/rQIcc0qItTvjoajh+/
	TH0xI1MGHhr6aq41qG5gIEe0l+retLA8jCmhVe0/p9W/7zevjQc4YRcrMNOHMqIdZCvPycP3ui0uH
	0FWiExeN62Tw80A+x7XqKpYFl6A6qJavr6c4InxzbEJLmrf+oOMFb+kpaIGTjC/wxen3zOMFLXGPg
	Odhu9JDw==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uFDTU-008CT8-Hm; Wed, 14 May 2025 16:58:34 +0200
Message-ID: <3cdf8bf9-1807-496e-baf4-8c069df3fdc1@igalia.com>
Date: Wed, 14 May 2025 15:58:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 10/13] dma-fence: Add safe access helpers and document
 the rules
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com, Rob Clark <robdclark@chromium.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
 <20250509153352.7187-11-tvrtko.ursulin@igalia.com>
 <CAF6AEGuOC4NnSTQexvD5tk8VLfOR_gGq-cqs3gnJcS1qNtMjQg@mail.gmail.com>
 <dddebe25-9fe2-4c3d-89ee-c90168b5a017@igalia.com>
 <CAF6AEGsP2TyjaRVtSXAYyDbNJqZ3NsL-2TCKZ+SAyZaONrJvjA@mail.gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <CAF6AEGsP2TyjaRVtSXAYyDbNJqZ3NsL-2TCKZ+SAyZaONrJvjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 14/05/2025 14:57, Rob Clark wrote:
> On Wed, May 14, 2025 at 3:01 AM Tvrtko Ursulin
> <tvrtko.ursulin@igalia.com> wrote:
>>
>>
>> On 13/05/2025 15:16, Rob Clark wrote:
>>> On Fri, May 9, 2025 at 8:34 AM Tvrtko Ursulin <tvrtko.ursulin@igalia.com> wrote:
>>>>
>>>> Dma-fence objects currently suffer from a potential use after free problem
>>>> where fences exported to userspace and other drivers can outlive the
>>>> exporting driver, or the associated data structures.
>>>>
>>>> The discussion on how to address this concluded that adding reference
>>>> counting to all the involved objects is not desirable, since it would need
>>>> to be very wide reaching and could cause unloadable drivers if another
>>>> entity would be holding onto a signaled fence reference potentially
>>>> indefinitely.
>>>>
>>>> This patch enables the safe access by introducing and documenting a
>>>> contract between fence exporters and users. It documents a set of
>>>> contraints and adds helpers which a) drivers with potential to suffer from
>>>> the use after free must use and b) users of the dma-fence API must use as
>>>> well.
>>>>
>>>> Premise of the design has multiple sides:
>>>>
>>>> 1. Drivers (fence exporters) MUST ensure a RCU grace period between
>>>> signalling a fence and freeing the driver private data associated with it.
>>>>
>>>> The grace period does not have to follow the signalling immediately but
>>>> HAS to happen before data is freed.
>>>>
>>>> 2. Users of the dma-fence API marked with such requirement MUST contain
>>>> the complete access to the data within a single code block guarded by the
>>>> new dma_fence_access_begin() and dma_fence_access_end() helpers.
>>>>
>>>> The combination of the two ensures that whoever sees the
>>>> DMA_FENCE_FLAG_SIGNALED_BIT not set is guaranteed to have access to a
>>>> valid fence->lock and valid data potentially accessed by the fence->ops
>>>> virtual functions, until the call to dma_fence_access_end().
>>>>
>>>> 3. Module unload (fence->ops) disappearing is for now explicitly not
>>>> handled. That would required a more complex protection, possibly needing
>>>> SRCU instead of RCU to handle callers such as dma_fence_wait_timeout(),
>>>> where race between dma_fence_enable_sw_signaling, signalling, and
>>>> dereference of fence->ops->wait() would need a sleeping SRCU context.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> ---
>>>>    drivers/dma-buf/dma-fence.c | 69 +++++++++++++++++++++++++++++++++++++
>>>>    include/linux/dma-fence.h   | 32 ++++++++++++-----
>>>>    2 files changed, 93 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>>> index dc2456f68685..cfe1d7b79c22 100644
>>>> --- a/drivers/dma-buf/dma-fence.c
>>>> +++ b/drivers/dma-buf/dma-fence.c
>>>> @@ -533,6 +533,7 @@ void dma_fence_release(struct kref *kref)
>>>>           struct dma_fence *fence =
>>>>                   container_of(kref, struct dma_fence, refcount);
>>>>
>>>> +       dma_fence_access_begin();
>>>>           trace_dma_fence_destroy(fence);
>>>>
>>>>           if (WARN(!list_empty(&fence->cb_list) &&
>>>> @@ -560,6 +561,8 @@ void dma_fence_release(struct kref *kref)
>>>>                   fence->ops->release(fence);
>>>>           else
>>>>                   dma_fence_free(fence);
>>>> +
>>>> +       dma_fence_access_end();
>>>>    }
>>>>    EXPORT_SYMBOL(dma_fence_release);
>>>>
>>>> @@ -982,11 +985,13 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
>>>>     */
>>>>    void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
>>>>    {
>>>> +       dma_fence_access_begin();
>>>>           seq_printf(seq, "%s %s seq %llu %ssignalled\n",
>>>>                      dma_fence_driver_name(fence),
>>>>                      dma_fence_timeline_name(fence),
>>>>                      fence->seqno,
>>>>                      dma_fence_is_signaled(fence) ? "" : "un");
>>>> +       dma_fence_access_end();
>>>>    }
>>>>    EXPORT_SYMBOL(dma_fence_describe);
>>>>
>>>> @@ -1033,3 +1038,67 @@ dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>>           __set_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags);
>>>>    }
>>>>    EXPORT_SYMBOL(dma_fence_init64);
>>>> +
>>>> +/**
>>>> + * dma_fence_driver_name - Access the driver name
>>>> + * @fence: the fence to query
>>>> + *
>>>> + * Returns a driver name backing the dma-fence implementation.
>>>> + *
>>>> + * IMPORTANT CONSIDERATION:
>>>> + * Dma-fence contract stipulates that access to driver provided data (data not
>>>> + * directly embedded into the object itself), such as the &dma_fence.lock and
>>>> + * memory potentially accessed by the &dma_fence.ops functions, is forbidden
>>>> + * after the fence has been signalled. Drivers are allowed to free that data,
>>>> + * and some do.
>>>> + *
>>>> + * To allow safe access drivers are mandated to guarantee a RCU grace period
>>>> + * between signalling the fence and freeing said data.
>>>> + *
>>>> + * As such access to the driver name is only valid inside a RCU locked section.
>>>> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE block guarded
>>>> + * by the &dma_fence_access_being and &dma_fence_access_end pair.
>>>> + */
>>>> +const char *dma_fence_driver_name(struct dma_fence *fence)
>>>> +{
>>>> +       RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>>>> +                        "rcu_read_lock() required for safe access to returned string");
>>>> +
>>>> +       if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>>> +               return fence->ops->get_driver_name(fence);
>>>> +       else
>>>> +               return "detached-driver";
>>>> +}
>>>> +EXPORT_SYMBOL(dma_fence_driver_name);
>>>> +
>>>> +/**
>>>> + * dma_fence_timeline_name - Access the timeline name
>>>> + * @fence: the fence to query
>>>> + *
>>>> + * Returns a timeline name provided by the dma-fence implementation.
>>>> + *
>>>> + * IMPORTANT CONSIDERATION:
>>>> + * Dma-fence contract stipulates that access to driver provided data (data not
>>>> + * directly embedded into the object itself), such as the &dma_fence.lock and
>>>> + * memory potentially accessed by the &dma_fence.ops functions, is forbidden
>>>> + * after the fence has been signalled. Drivers are allowed to free that data,
>>>> + * and some do.
>>>> + *
>>>> + * To allow safe access drivers are mandated to guarantee a RCU grace period
>>>> + * between signalling the fence and freeing said data.
>>>> + *
>>>> + * As such access to the driver name is only valid inside a RCU locked section.
>>>> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE block guarded
>>>> + * by the &dma_fence_access_being and &dma_fence_access_end pair.
>>>> + */
>>>> +const char *dma_fence_timeline_name(struct dma_fence *fence)
>>>> +{
>>>> +       RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>>>> +                        "rcu_read_lock() required for safe access to returned string");
>>>> +
>>>> +       if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>>> +               return fence->ops->get_driver_name(fence);
>>>> +       else
>>>> +               return "signaled-timeline";
>>>
>>> This means that trace_dma_fence_signaled() will get the wrong
>>> timeline/driver name, which probably screws up perfetto and maybe
>>> other tools.
>>
>> Do you think context and seqno are not enough for those tools and they
>> actually rely on the names? It would sound weird if they decided to
>> index anything on the names which are non-standardised between drivers,
>> but I guess anything is possible.
> 
> At some point perfetto uses the timeline name to put up a named fence
> timeline, I'm not sure if it is using the name or context # for
> subsequent fence events (namely, signalled).  I'd have to check the
> code and get back to you.

If you can it would be useful. Presumably it saves the names from the 
start edge of fence lifetime. But again, who knows.

> There is also gpuvis, which I guess does something similar, but
> haven't looked into it.  Idk if there are others.

I know GpuVis uses DRM sched tracepoints since Pierre-Eric was 
explaining me about those in the context of tracing rework he did there. 
I am not sure about dma-fence tracepoints.

+Pierre-Eric on the off chance you know from the top of your head how 
much GpuVis depends on them (dma-fence tracepoints).

>>> Maybe it would work well enough just to move the
>>> trace_dma_fence_signaled() call ahead of the test_and_set_bit()?  Idk
>>> if some things will start getting confused if they see that trace
>>> multiple times.
>>
>> Another alternative is to make this tracepoint access the names
>> directly. It is under the lock so guaranteed not to get freed with
>> drivers which will be made compliant with the documented rules.
> 
> I guess it would have been better if, other than dma_fence_init
> tracepoint, later tracepoints didn't include the driver/timeline
> name.. that would have forced the use of the context.  But I guess too
> late for that.  Perhaps the least bad thing to do is use the locking?

You mean this last alternative I mentioned? I think that will work fine. 
I'll wait a little bit longer for more potential comments before re-spi 
ning with that.

Were you able to test the series for your use case? Assuming it is not 
upstream msm since I don't immediately see a path in msm_fence which 
gets freed at runtime?

Regards,

Tvrtko


