Return-Path: <linux-media+bounces-58796-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPoONUNO32mFRQAAu9opvQ
	(envelope-from <linux-media+bounces-58796-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 10:37:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 546654020F5
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 10:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86F29301AF6F
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 08:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B156D3CCFB3;
	Wed, 15 Apr 2026 08:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="VnsTWh19"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4635C330B22
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 08:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776242016; cv=none; b=WCMvmSskvM3zBPqviffQy7/5NBI2FK87CugAt3qoO6FNvm1kFQ6Nit4rmDZLIyGxE0HV0WkyqBfhjf03PlDncd4RtFlvzlY8+NqAh+cdbv7YqUtXbiM9744jkZotBjBYgAG1sJGwq1OmhosVZyFBCwXZZ/QMCDNYeHLnS0NPtdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776242016; c=relaxed/simple;
	bh=PbFdyRc6W1tFQtlnh/nO+EtitzegfkCLUZ5nqvug890=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QIzLyzadx9nkaqXNWfg+ChZf97pkn52IVAVkqPkw87IF+mQFn+ZZv0xGGE6/qMblQ7vYCIn2oDolTtKXmbQnYfFHBktfTEtNW1onT6UvCkIJQyHTFo5GVX3c1LPNvlnO+FKWKYczgYsjpKjsrAOsdSujAAZmZETXbqoF/Gp/uNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=VnsTWh19; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NLmPC7PJ19+VFYXO6EqIDbW0xFBizdYedzYdR9XL1xs=; b=VnsTWh19bFxEBkY20wuXhRreo2
	fUVtRkm6NotLiFnEehl+xPZsR5TaKgCivSQAMuSUTqFKlRB16VjzfM4S/eqYWKSZ9vnVjxgC+hvv+
	YL0zzMTMSt90O1xhCrE3/WvpdxQiIzax7kwI1XblH3PUl9RUgalEC9jeXOzOz8pPJwwiESEtZz7Zw
	e3oXOSrQakwQW0gCc+1/zb/VvRkXT1aYwe/jJwyWfFKp9Mq2ydPMe04D3mWGGbtoFpdmWHYkT8X4u
	4d/QEnO0w3nk/CcQ2NN7KlWXdUXZ2OkaLWvVTnhAOAjZ3d1XjyE2MOSlQgyr2o8pOWp59RCx3epPo
	LHTA92dQ==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wCvgb-00GHcm-1v; Wed, 15 Apr 2026 10:33:25 +0200
Message-ID: <dcd9e1e9-8297-4429-94be-af88c7b41399@igalia.com>
Date: Wed, 15 Apr 2026 09:33:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dma-fence: Fix potential tracepoint null pointer
 dereferences
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Philipp Stanner <phasta@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260414154928.32934-1-tvrtko.ursulin@igalia.com>
 <20260414154928.32934-2-tvrtko.ursulin@igalia.com>
 <650e835e-b60d-44fd-b212-47f8a9d18c15@amd.com>
 <5fea79b5-ab5a-4a98-95c8-6452b20e83c4@igalia.com>
 <b3b75077-878b-4d4e-b18e-4976765c63db@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <b3b75077-878b-4d4e-b18e-4976765c63db@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.36 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	TAGGED_FROM(0.00)[bounces-58796-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.949];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 546654020F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 15/04/2026 09:13, Christian König wrote:
> On 4/15/26 09:58, Tvrtko Ursulin wrote:
>>
>> On 14/04/2026 19:30, Christian König wrote:
>>> On 4/14/26 17:49, Tvrtko Ursulin wrote:
>>>> Trace_dma_fence_signaled, trace_dma_fence_wait_end and
>>>> trace_dma_fence_destroy can all currently dereference a null fence->ops
>>>> pointer after it has been reset on fence signalling.
>>>>
>>>> Lets use the safe string getters for most tracepoints to avoid this class
>>>> of a problem, while for the signal tracepoint we move it to before ops are
>>>> cleared to avoid losing the driver and timeline name information. Apart
>>>> from moving it we also need to add a new tracepoint class to bypass the
>>>> safe name getters since the signaled bit is already set.
>>>>
>>>> For dma_fence_init we also need to use the new tracepoint class since the
>>>> rcu read lock is not held there, and we can do the same for the enable
>>>> signaling since there we are certain the fence cannot be signaled while
>>>> we are holding the lock and have even validated the fence->ops.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Philipp Stanner <phasta@kernel.org>
>>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>>> Cc: linux-media@vger.kernel.org
>>>> Cc: linaro-mm-sig@lists.linaro.org
>>>> ---
>>>>    drivers/dma-buf/dma-fence.c      |  3 ++-
>>>>    include/trace/events/dma_fence.h | 33 ++++++++++++++++++++++++++++----
>>>>    2 files changed, 31 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>>> index a2aa82f4eedd..b3bfa6943a8e 100644
>>>> --- a/drivers/dma-buf/dma-fence.c
>>>> +++ b/drivers/dma-buf/dma-fence.c
>>>> @@ -363,6 +363,8 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>>>                          &fence->flags)))
>>>>            return;
>>>>    +    trace_dma_fence_signaled(fence);
>>>> +
>>>>        /*
>>>>         * When neither a release nor a wait operation is specified set the ops
>>>>         * pointer to NULL to allow the fence structure to become independent
>>>> @@ -377,7 +379,6 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>>>          fence->timestamp = timestamp;
>>>>        set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
>>>> -    trace_dma_fence_signaled(fence);
>>>
>>> I think this part here should be a separate patch.
>>
>> I had that in https://lore.kernel.org/dri-devel/20260330133623.17704-1-tvrtko.ursulin@igalia.com/ but the discussion fizzled out before an rb.
>>
>>>
>>>>          list_for_each_entry_safe(cur, tmp, &cb_list, node) {
>>>>            INIT_LIST_HEAD(&cur->node);
>>>> diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
>>>> index 3abba45c0601..9e0cb9ce2388 100644
>>>> --- a/include/trace/events/dma_fence.h
>>>> +++ b/include/trace/events/dma_fence.h
>>>> @@ -9,12 +9,37 @@
>>>>      struct dma_fence;
>>>>    +DECLARE_EVENT_CLASS(dma_fence,
>>>> +
>>>> +    TP_PROTO(struct dma_fence *fence),
>>>> +
>>>> +    TP_ARGS(fence),
>>>> +
>>>> +    TP_STRUCT__entry(
>>>> +        __string(driver, dma_fence_driver_name(fence))
>>>> +        __string(timeline, dma_fence_timeline_name(fence))
>>>> +        __field(unsigned int, context)
>>>> +        __field(unsigned int, seqno)
>>>> +    ),
>>>> +
>>>> +    TP_fast_assign(
>>>> +        __assign_str(driver);
>>>> +        __assign_str(timeline);
>>>> +        __entry->context = fence->context;
>>>> +        __entry->seqno = fence->seqno;
>>>> +    ),
>>>> +
>>>> +    TP_printk("driver=%s timeline=%s context=%u seqno=%u",
>>>> +          __get_str(driver), __get_str(timeline), __entry->context,
>>>> +          __entry->seqno)
>>>> +);
>>>> +
>>>
>>> Mhm, I'm strongly in favor to just use this approach for all trace points.
>>>
>>> The minimal extra overhead shouldn't really matter at all.
>>
>> Yeah, I am a bit on the fence. It would required a bit of an ugly rcu_read_lock around trace_dma_fence_signal_init
> 
> I think as long as we only grab the RCU read side lock when the tracepoint is actually enabled then that shouldn't matter.
> 
> I do remember patches flying by which optimized this use case for the whole trace subsystem but didn't took a closer look how to do that now.
> 
>> and trace_dma_fence_signaled would lose the driver/timeline info _unless_ name helpers would also be changed to look at fence->ops instead of "is signaled". Those have no memory barriers so not sure I want to think about racyness and how to solve it.
> 
> Mhm, that is a bit more problematic.
> 
> ops is only set to NULL when neither free nor wait is specified, so checking is signaled is still the right thing to do for drivers which uses those callbacks but still want to have the RCU protection of the returned strings.

Hm yes, that too.


> Ok, feel free to go ahead with this approach for now but please add a /* TODO: clean that up when most drivers switched to independent fences */.

Thank you, I've sent an updated version with a comment to this effect 
placed to the event class definition. I put your r-b so please double 
check if you are happy with that version.

Regards,

Tvrtko
>>>>    /*
>>>>     * Safe only for call sites which are guaranteed to not race with fence
>>>>     * signaling,holding the fence->lock and having checked for not signaled, or the
>>>>     * signaling path itself.
>>>>     */
>>>> -DECLARE_EVENT_CLASS(dma_fence,
>>>> +DECLARE_EVENT_CLASS(dma_fence_ops,
>>>>          TP_PROTO(struct dma_fence *fence),
>>>>    @@ -46,7 +71,7 @@ DEFINE_EVENT(dma_fence, dma_fence_emit,
>>>>        TP_ARGS(fence)
>>>>    );
>>>>    -DEFINE_EVENT(dma_fence, dma_fence_init,
>>>> +DEFINE_EVENT(dma_fence_ops, dma_fence_init,
>>>>          TP_PROTO(struct dma_fence *fence),
>>>>    @@ -60,14 +85,14 @@ DEFINE_EVENT(dma_fence, dma_fence_destroy,
>>>>        TP_ARGS(fence)
>>>>    );
>>>>    -DEFINE_EVENT(dma_fence, dma_fence_enable_signal,
>>>> +DEFINE_EVENT(dma_fence_ops, dma_fence_enable_signal,
>>>>          TP_PROTO(struct dma_fence *fence),
>>>>          TP_ARGS(fence)
>>>>    );
>>>>    -DEFINE_EVENT(dma_fence, dma_fence_signaled,
>>>> +DEFINE_EVENT(dma_fence_ops, dma_fence_signaled,
>>>>          TP_PROTO(struct dma_fence *fence),
>>>>    
>>>
>>
> 


