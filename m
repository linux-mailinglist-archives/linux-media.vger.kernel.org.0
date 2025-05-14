Return-Path: <linux-media+bounces-32457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C0DAB6859
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 12:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B79C63BC070
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 10:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ADC826FA46;
	Wed, 14 May 2025 10:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Am3ybjKg"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2178B129A78
	for <linux-media@vger.kernel.org>; Wed, 14 May 2025 10:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747216932; cv=none; b=tD51oZfIR2CRJRGT+97wXDTKpFYmxEF0m8PmkvVG+qdIKpE2JqPWmqDZotwRLVyZCa4JspU73kB805HlveZBPPafh/WSmT8E5/XZb6rOv8NkzCjpkfbLDh3jAbGtr02P9eKd8QEPjoh2bQTbvB5AoBgDUbyCrOc4xvhL/k89+Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747216932; c=relaxed/simple;
	bh=Bv0sywWh6o5ux3lIIHeC8kfEwbyoB1nIz9SEHZ7CcBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PPO8V0jFRoO69ONyWgdgjI5ZdyLwmL3upJIc3aMI3VbMnaPYy2gA24VDjs4dKkN2dwPJTJ8LaslO5epqFPeT/6a9YkkQQ2vHLof7JSSab3GZGwox/dLJ/2V4ZVKlRerXUgt9pnAybaW85fdbToNkJHW2kJNTjT8R5qhbYmGD04M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Am3ybjKg; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=e9DzE2b+0+EPHIGM4XP87LuxDvJ8yQfz8YtW+QxjxY8=; b=Am3ybjKgdpTXQq8oTBxlNJpuNd
	KuA4pYUPdX3VLAvjbxwLWXBzNCbmnD2bjO6Cywlb55oQpZRDAm6MvPolrT5c7J91skpX3o6JlUUTL
	lzL1TF8g5NqjG9+NTB0bFMGHOAPKlU0r41+vN/TDMbJwo9q0cfIJiqIgPQaNmmBQ5+NpIFvM9IAqq
	oM5cMwetKMcv/P4Tx3kCgqz2AA/0kBTr5XuNho08+mCWviiAGDKg/5+0f3eeeBfqSHgDIlKYNCDYB
	xYwypK6uQdB08anq6KfupQYoBgHBtYIqst6TiwdZILPvuExAAIxe8b9HEwlcytOwnFNvjhIm/3Odb
	g/e8BIpA==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uF8qL-0085Qn-O6; Wed, 14 May 2025 12:01:49 +0200
Message-ID: <dddebe25-9fe2-4c3d-89ee-c90168b5a017@igalia.com>
Date: Wed, 14 May 2025 11:01:48 +0100
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
 kernel-dev@igalia.com, Rob Clark <robdclark@chromium.org>
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
 <20250509153352.7187-11-tvrtko.ursulin@igalia.com>
 <CAF6AEGuOC4NnSTQexvD5tk8VLfOR_gGq-cqs3gnJcS1qNtMjQg@mail.gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <CAF6AEGuOC4NnSTQexvD5tk8VLfOR_gGq-cqs3gnJcS1qNtMjQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 13/05/2025 15:16, Rob Clark wrote:
> On Fri, May 9, 2025 at 8:34 AM Tvrtko Ursulin <tvrtko.ursulin@igalia.com> wrote:
>>
>> Dma-fence objects currently suffer from a potential use after free problem
>> where fences exported to userspace and other drivers can outlive the
>> exporting driver, or the associated data structures.
>>
>> The discussion on how to address this concluded that adding reference
>> counting to all the involved objects is not desirable, since it would need
>> to be very wide reaching and could cause unloadable drivers if another
>> entity would be holding onto a signaled fence reference potentially
>> indefinitely.
>>
>> This patch enables the safe access by introducing and documenting a
>> contract between fence exporters and users. It documents a set of
>> contraints and adds helpers which a) drivers with potential to suffer from
>> the use after free must use and b) users of the dma-fence API must use as
>> well.
>>
>> Premise of the design has multiple sides:
>>
>> 1. Drivers (fence exporters) MUST ensure a RCU grace period between
>> signalling a fence and freeing the driver private data associated with it.
>>
>> The grace period does not have to follow the signalling immediately but
>> HAS to happen before data is freed.
>>
>> 2. Users of the dma-fence API marked with such requirement MUST contain
>> the complete access to the data within a single code block guarded by the
>> new dma_fence_access_begin() and dma_fence_access_end() helpers.
>>
>> The combination of the two ensures that whoever sees the
>> DMA_FENCE_FLAG_SIGNALED_BIT not set is guaranteed to have access to a
>> valid fence->lock and valid data potentially accessed by the fence->ops
>> virtual functions, until the call to dma_fence_access_end().
>>
>> 3. Module unload (fence->ops) disappearing is for now explicitly not
>> handled. That would required a more complex protection, possibly needing
>> SRCU instead of RCU to handle callers such as dma_fence_wait_timeout(),
>> where race between dma_fence_enable_sw_signaling, signalling, and
>> dereference of fence->ops->wait() would need a sleeping SRCU context.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>>   drivers/dma-buf/dma-fence.c | 69 +++++++++++++++++++++++++++++++++++++
>>   include/linux/dma-fence.h   | 32 ++++++++++++-----
>>   2 files changed, 93 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index dc2456f68685..cfe1d7b79c22 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -533,6 +533,7 @@ void dma_fence_release(struct kref *kref)
>>          struct dma_fence *fence =
>>                  container_of(kref, struct dma_fence, refcount);
>>
>> +       dma_fence_access_begin();
>>          trace_dma_fence_destroy(fence);
>>
>>          if (WARN(!list_empty(&fence->cb_list) &&
>> @@ -560,6 +561,8 @@ void dma_fence_release(struct kref *kref)
>>                  fence->ops->release(fence);
>>          else
>>                  dma_fence_free(fence);
>> +
>> +       dma_fence_access_end();
>>   }
>>   EXPORT_SYMBOL(dma_fence_release);
>>
>> @@ -982,11 +985,13 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
>>    */
>>   void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
>>   {
>> +       dma_fence_access_begin();
>>          seq_printf(seq, "%s %s seq %llu %ssignalled\n",
>>                     dma_fence_driver_name(fence),
>>                     dma_fence_timeline_name(fence),
>>                     fence->seqno,
>>                     dma_fence_is_signaled(fence) ? "" : "un");
>> +       dma_fence_access_end();
>>   }
>>   EXPORT_SYMBOL(dma_fence_describe);
>>
>> @@ -1033,3 +1038,67 @@ dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>          __set_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags);
>>   }
>>   EXPORT_SYMBOL(dma_fence_init64);
>> +
>> +/**
>> + * dma_fence_driver_name - Access the driver name
>> + * @fence: the fence to query
>> + *
>> + * Returns a driver name backing the dma-fence implementation.
>> + *
>> + * IMPORTANT CONSIDERATION:
>> + * Dma-fence contract stipulates that access to driver provided data (data not
>> + * directly embedded into the object itself), such as the &dma_fence.lock and
>> + * memory potentially accessed by the &dma_fence.ops functions, is forbidden
>> + * after the fence has been signalled. Drivers are allowed to free that data,
>> + * and some do.
>> + *
>> + * To allow safe access drivers are mandated to guarantee a RCU grace period
>> + * between signalling the fence and freeing said data.
>> + *
>> + * As such access to the driver name is only valid inside a RCU locked section.
>> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE block guarded
>> + * by the &dma_fence_access_being and &dma_fence_access_end pair.
>> + */
>> +const char *dma_fence_driver_name(struct dma_fence *fence)
>> +{
>> +       RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>> +                        "rcu_read_lock() required for safe access to returned string");
>> +
>> +       if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>> +               return fence->ops->get_driver_name(fence);
>> +       else
>> +               return "detached-driver";
>> +}
>> +EXPORT_SYMBOL(dma_fence_driver_name);
>> +
>> +/**
>> + * dma_fence_timeline_name - Access the timeline name
>> + * @fence: the fence to query
>> + *
>> + * Returns a timeline name provided by the dma-fence implementation.
>> + *
>> + * IMPORTANT CONSIDERATION:
>> + * Dma-fence contract stipulates that access to driver provided data (data not
>> + * directly embedded into the object itself), such as the &dma_fence.lock and
>> + * memory potentially accessed by the &dma_fence.ops functions, is forbidden
>> + * after the fence has been signalled. Drivers are allowed to free that data,
>> + * and some do.
>> + *
>> + * To allow safe access drivers are mandated to guarantee a RCU grace period
>> + * between signalling the fence and freeing said data.
>> + *
>> + * As such access to the driver name is only valid inside a RCU locked section.
>> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE block guarded
>> + * by the &dma_fence_access_being and &dma_fence_access_end pair.
>> + */
>> +const char *dma_fence_timeline_name(struct dma_fence *fence)
>> +{
>> +       RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>> +                        "rcu_read_lock() required for safe access to returned string");
>> +
>> +       if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>> +               return fence->ops->get_driver_name(fence);
>> +       else
>> +               return "signaled-timeline";
> 
> This means that trace_dma_fence_signaled() will get the wrong
> timeline/driver name, which probably screws up perfetto and maybe
> other tools.

Do you think context and seqno are not enough for those tools and they 
actually rely on the names? It would sound weird if they decided to 
index anything on the names which are non-standardised between drivers, 
but I guess anything is possible.

> Maybe it would work well enough just to move the
> trace_dma_fence_signaled() call ahead of the test_and_set_bit()?  Idk
> if some things will start getting confused if they see that trace
> multiple times.

Another alternative is to make this tracepoint access the names 
directly. It is under the lock so guaranteed not to get freed with 
drivers which will be made compliant with the documented rules.

Regards,

Tvrtko

> 
> Maybe a better solution would be to add a new bit for this purpose,
> which is set after the tracepoint in
> dma_fence_signal_timestamp_locked().
> 
> (trace_dma_fence_destroy() will I guess be messed up regardless.. it
> doesn't look like perfetto cares about this tracepoint, so maybe that
> is ok.  It doesn't seem so useful.)
> 
> BR,
> -R
> 
> 
>> +}
>> +EXPORT_SYMBOL(dma_fence_timeline_name);
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index c814a86087f8..c8a9915eb360 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -387,15 +387,31 @@ bool dma_fence_remove_callback(struct dma_fence *fence,
>>                                 struct dma_fence_cb *cb);
>>   void dma_fence_enable_sw_signaling(struct dma_fence *fence);
>>
>> -static inline const char *dma_fence_driver_name(struct dma_fence *fence)
>> -{
>> -       return fence->ops->get_driver_name(fence);
>> -}
>> +/**
>> + * DOC: Safe external access to driver provided object members
>> + *
>> + * All data not stored directly in the dma-fence object, such as the
>> + * &dma_fence.lock and memory potentially accessed by functions in the
>> + * &dma_fence.ops table, MUST NOT be accessed after the fence has been signalled
>> + * because after that point drivers are allowed to free it.
>> + *
>> + * All code accessing that data via the dma-fence API (or directly, which is
>> + * discouraged), MUST make sure to contain the complete access within a
>> + * &dma_fence_access_begin and &dma_fence_access_end pair.
>> + *
>> + * Some dma-fence API handles this automatically, while other, as for example
>> + * &dma_fence_driver_name and &dma_fence_timeline_name, leave that
>> + * responsibility to the caller.
>> + *
>> + * To enable this scheme to work drivers MUST ensure a RCU grace period elapses
>> + * between signalling the fence and freeing the said data.
>> + *
>> + */
>> +#define dma_fence_access_begin rcu_read_lock
>> +#define dma_fence_access_end   rcu_read_unlock
>>
>> -static inline const char *dma_fence_timeline_name(struct dma_fence *fence)
>> -{
>> -       return fence->ops->get_timeline_name(fence);
>> -}
>> +const char *dma_fence_driver_name(struct dma_fence *fence);
>> +const char *dma_fence_timeline_name(struct dma_fence *fence);
>>
>>   /**
>>    * dma_fence_is_signaled_locked - Return an indication if the fence
>> --
>> 2.48.0
>>


