Return-Path: <linux-media+bounces-58664-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLi2NHDh3GmKXwkAu9opvQ
	(envelope-from <linux-media+bounces-58664-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 14:28:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BC43EBFAF
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 14:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 23E8C300B53F
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 12:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C94A03C4551;
	Mon, 13 Apr 2026 12:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="PJbnMBF/"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D4A3C278A
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 12:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776083181; cv=none; b=HjSUiF7IeUi3n5u7ec4AHpPQzk+yjD/m6vSLHj87RDFAK2UJOoNHAZ5oPqKPxznLq6B9JjsH9Ap4UqQfGtFgg7iBb4iVafNgyBNkiGrxPN4NSAO2Mr2zpmwlZcL9aN8VoKIEQYZjy8AOviYNVujx3Q98mcOZe6VGUewdu0nNZKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776083181; c=relaxed/simple;
	bh=5Yz71H9l+W8zSMJdY8aGsM75byOLj/n8k3s4DAy01bI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BDe3VXx56o+kvFPTGDU/S6E1rdqQgTcB/Ag/PACrjH4Qo1lhluvnjTfqybHrtEqTUql4QZ2VOeINItZQhSRS+WRD/A1kd1q+CYM7kVuIiJ9gU+8boSug0gtqbh7qCjbsT8uOnqUeIM/G7Dnunu2io780TaruLu6IveIfCTaBXaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=PJbnMBF/; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ag/JUOaFdk9sxg+FZ/AmkquyB95znwr7N44nZeGTJSk=; b=PJbnMBF/sXGtPXVyWelfbjUF4u
	X/J2OnzphWXfM8zuP2BR/k4o0/tKQLU8eMROPE5ikA7yL7Qby9FKmB/aXpb2jgjx2EgkxrgMe6E9o
	GQJ8ClwGMQmXgnL4GUYtNQJNimx0CxE7Oi2eUEPZyb9Z4q8rZT+hn3moVJvYy4Cex2uf4Vo4T103j
	wg1HP88D1MSNHCXxU6CWoZmPjkPuDKJrgv0VIhTvOe1H4GUEiJTmrYBZqe2WyIXHe+u8/rxgyNkRK
	7Hw4cbz4Pb71huHwX3LxxsTXNBMizyfd5kXxuHCiolooRFqxEi/5Xv/TkoT/L1qCXIhbJPd8y0OBN
	63S/bhZQ==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wCGMh-00FOjp-7M; Mon, 13 Apr 2026 14:26:07 +0200
Message-ID: <7efae858-c074-4027-93df-d6efaeba236e@igalia.com>
Date: Mon, 13 Apr 2026 13:26:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dma-fence: Fix potential tracepoint null pointer
 dereferences
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Philipp Stanner <phasta@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260413100526.15729-1-tvrtko.ursulin@igalia.com>
 <20260413100526.15729-2-tvrtko.ursulin@igalia.com>
 <db5342f2-c098-4b27-9522-8b1f78fdc43a@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <db5342f2-c098-4b27-9522-8b1f78fdc43a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58664-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.924];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,igalia.com:email,igalia.com:mid,amd.com:email,linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C6BC43EBFAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 13/04/2026 12:32, Christian König wrote:
> On 4/13/26 12:05, Tvrtko Ursulin wrote:
>> Trace_dma_fence_signaled, trace_dma_fence_wait_end and
>> trace_dma_fence_destroy can all dereference a null fence->ops pointer
>> after it has been reset on fence signalling.
>>
>> Lets use the safe string getters for most tracepoints to a void this.
>>
>> But for the signalling tracepoint, we move it to before the fence->ops
>> is reset and special case its definition in order to avoid losing the
>> driver and timeline information.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>> Cc: linux-media@vger.kernel.org
>> Cc: linaro-mm-sig@lists.linaro.org
>> ---
>>   drivers/dma-buf/dma-fence.c      |  3 ++-
>>   include/trace/events/dma_fence.h | 29 +++++++++++++++++++++++++++--
>>   2 files changed, 29 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index a2aa82f4eedd..b3bfa6943a8e 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -363,6 +363,8 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>   				      &fence->flags)))
>>   		return;
>>   
>> +	trace_dma_fence_signaled(fence);
>> +
>>   	/*
>>   	 * When neither a release nor a wait operation is specified set the ops
>>   	 * pointer to NULL to allow the fence structure to become independent
>> @@ -377,7 +379,6 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>   
>>   	fence->timestamp = timestamp;
>>   	set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
>> -	trace_dma_fence_signaled(fence);
>>   
>>   	list_for_each_entry_safe(cur, tmp, &cb_list, node) {
>>   		INIT_LIST_HEAD(&cur->node);
>> diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
>> index 3abba45c0601..220bf71446e8 100644
>> --- a/include/trace/events/dma_fence.h
>> +++ b/include/trace/events/dma_fence.h
>> @@ -9,12 +9,37 @@
>>   
>>   struct dma_fence;
>>   
>> +DECLARE_EVENT_CLASS(dma_fence,
>> +
>> +	TP_PROTO(struct dma_fence *fence),
>> +
>> +	TP_ARGS(fence),
>> +
>> +	TP_STRUCT__entry(
>> +		__string(driver, dma_fence_driver_name(fence))
>> +		__string(timeline, dma_fence_timeline_name(fence))
> 
> 
> That requires that we hold the RCU read side lock while doing the trace.

True, and actually 3/3 needs to be squashed in 2/3 and then it is all 
fine. Then all tracepoints which use dma_fence_*_name() helpers are 
inside rcu_read_lock, and ones which do not use the dma_fence_ops class 
where they are guaranteed to be be safe.

> Not sure if that can be done inside the DECLARE_EVENT_CLASS() macro.

No idea.

>> +		__field(unsigned int, context)
>> +		__field(unsigned int, seqno)
>> +	),
>> +
>> +	TP_fast_assign(
>> +		__assign_str(driver);
>> +		__assign_str(timeline);
>> +		__entry->context = fence->context;
>> +		__entry->seqno = fence->seqno;
>> +	),
>> +
>> +	TP_printk("driver=%s timeline=%s context=%u seqno=%u",
>> +		  __get_str(driver), __get_str(timeline), __entry->context,
>> +		  __entry->seqno)
>> +);
>> +
>>   /*
>>    * Safe only for call sites which are guaranteed to not race with fence
>>    * signaling,holding the fence->lock and having checked for not signaled, or the
>>    * signaling path itself.
>>    */
>> -DECLARE_EVENT_CLASS(dma_fence,
>> +DECLARE_EVENT_CLASS(dma_fence_ops,
>>   
>>   	TP_PROTO(struct dma_fence *fence),
>>   
>> @@ -67,7 +92,7 @@ DEFINE_EVENT(dma_fence, dma_fence_enable_signal,
>>   	TP_ARGS(fence)
>>   );
>>   
>> -DEFINE_EVENT(dma_fence, dma_fence_signaled,
>> +DEFINE_EVENT(dma_fence_ops, dma_fence_signaled,
> 
> The signal trace event is actually unproblematic. The question is more what to do with the release event.

Yes, unproblematic after fixed in this patch, or you mean something else?

trace_dma_fence_destroy is fine after this patch AFAICS and I did test it.

Regards,

Tvrtko

>>   	TP_PROTO(struct dma_fence *fence),
>>   
> 


