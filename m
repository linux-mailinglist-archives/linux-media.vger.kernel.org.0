Return-Path: <linux-media+bounces-58641-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDDYIIqk3GkEUgkAu9opvQ
	(envelope-from <linux-media+bounces-58641-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:08:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E91B33E8D6B
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 325483017F9E
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 08:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083DD3A5E73;
	Mon, 13 Apr 2026 08:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="VwjOXlYT"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BFD3A451E
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 08:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067625; cv=none; b=Eqwb8DXDCsCYqV4i/NOeFOd141p2EBW6EFiRrJKMV+ggh908ArxXUowoFgTVNqPOu+4xFand22LHz4La2AooLsLgdgYEYuLiv0vNwlHzpU8Hs3F0djfx96pDvVNeGxyHr4mQVAB7YOuGUe0ISSZ6cycMZP140f5X3U1Aa0+Xo5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067625; c=relaxed/simple;
	bh=crS9OeY4ZhcwveEBPFt0L0a3qtbOJfkNUNhmIYymP1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GBFO4wJvbepzl/Y4WPZYbmdcVbdPH4EqGFuPCRNyvD3UPuXXicii+4LDLZ5BReK8XhwbXqpXHW21/E7Nx/+2zx76xChOuoEUKcQnnhfPKsq9MTxdWMyLQCYql88RQK97BdYO4lhbe3dSP3l8xsdPc/dxYqac4mX+VZFB+OwEIi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=VwjOXlYT; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lISybMQp+OaO/Lf3/XZqCWYYTxwbrtzYdJKyH0Xg9hQ=; b=VwjOXlYTFc6VCSbjzlF7+0xvAk
	tYTG6IZPhNQyxh9KJK5VwIPOdmtVTb+xwNW8JIIp/7Q64xhxubf9dPm3EGOdRA0eqKe9jvzb4rhZF
	L/97kXQkOaVBsNdWlm2NIinBKpOYwtCivc4wQFtY+/5rnXQ6aAivTUdmN1qSO7shHcsvIvy4NUqu+
	WN0G/mKIzYC1wHuEKlVvTuJiW8vIJ3EmVgTtMrMXxhXf6ZClGxLi+Y4G4lsvnD4Cm1k+JKhUZ+Ytw
	QfM9lfK85d9jqO7a5/1ZhDtZsMrB6/NMwywgvEXLpCUaACgRc5vmVqycI1kY5mRWINoAAiHDaREpH
	ZVbfhYAw==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wCCJg-00FIUa-Jv; Mon, 13 Apr 2026 10:06:44 +0200
Message-ID: <6c83b204-0d6b-46d1-8b7e-375826c445b9@igalia.com>
Date: Mon, 13 Apr 2026 09:06:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-fence: Move signalling tracepoint to before ops
 detach
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Philipp Stanner <phasta@kernel.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260330133623.17704-1-tvrtko.ursulin@igalia.com>
 <20260331094944.772833c0@fedora>
 <918805b0-2cb9-454a-9048-84cc5bfc8798@igalia.com>
 <2fae926b-a25b-42bc-ab63-caf36505b33d@amd.com>
 <601a78ea-74e7-4b20-afeb-d822a362484a@igalia.com>
 <c09d9dc1-43d1-4d7a-93ef-9707f282ad07@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <c09d9dc1-43d1-4d7a-93ef-9707f282ad07@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58641-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,igalia.com:email,igalia.com:mid,collabora.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: E91B33E8D6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 13/04/2026 07:52, Christian König wrote:
> On 4/10/26 17:37, Tvrtko Ursulin wrote:
>>
>> On 10/04/2026 09:58, Christian König wrote:
>>> On 4/9/26 15:58, Tvrtko Ursulin wrote:
>>>>
>>>> On 31/03/2026 08:49, Boris Brezillon wrote:
>>>>> On Mon, 30 Mar 2026 14:36:23 +0100
>>>>> Tvrtko Ursulin <tvrtko.ursulin@igalia.com> wrote:
>>>>>
>>>>>> Move the signalling tracepoint to before fence->ops are reset otherwise
>>>>>> tracepoint will dereference a null pointer.
>>>>>
>>>>> I suspect other trace points are impacted too
>>>>> (trace_dma_fence_destroy() is, at the very least).
>>>>
>>>> Indeed. I wonder why that did not trigger for me, while the one I fix here was an insta-crash...
>>>
>>> You need to actually enable the trace points and at least for the destroy one nobody is usually interested in that.
>>
>> Right, but I was pretty sure I was enabling perf record -e 'dma_fence:*' when I hit this. Anyway, it doesn't matter, I could be misremembering.
>>
>>>>
>>>> To fix trace_dma_fence_destroy I think we need a new tracepoint definition ie. move it away from the existing event class - make it just log the context and seqno.
>>>>
>>>> Anyone has a better idea?
>>>
>>> The idea of tracing without accessing fence->ops sounds valid to me.
>>>
>>> Alternatively we could call dma_fence_timeline_name() and dma_fence_driver_name() from the tracepoint as well, but that means the tracepoints now require a RCU read side lock.
>>
>> We could possibly use the helpers. I am not sure if RCU annotation would have to be casted away to keep sparse happy, but more importantly, I think it would not be safe.
>>
>>    thread A                    thread B
>>
>>    dma_fence_signal_timestamp_locked        dma_fence_timeline_name
>>      ..                        ops = rcu_dereference(fence->ops);
>>                          if (!dma_fence_test_signaled_flag(fence))
>>      test_and_set_bit
>>      ..
>>      RCU_INIT_POINTER(fence->ops, NULL);
>>                              return (const char __rcu *)ops->get_driver_name(fence); // OOPS!
>>
>> Apologies for long line length, it did not fit otherwise.
>>
>> Looks like we missed this. Or it is me who is missing something?
> 
> See function dma_fence_driver_name() and dma_fence_timeline_name():
> 
> ops = rcu_dereference(fence->ops);
> if (!dma_fence_test_signaled_flag(fence))
> 	return (const char __rcu *)ops->get_driver_name(fence);
> 
> We first grab the ops pointer and then check if the fence is signaled or not. Since we first set the signaled flag and then NULL the ops pointer in the other thread we should be save here.
> 
> Could only be that test_bit() is not a memory barrier, but set_bit() is so that would be a bit surprising.

You are right, I got confused jumping back and forth between patches 
last week.

So changing to helpers on top of the change from this patch should be 
enough.

I only need to check if the __rcu needs to be casted away in the 
tracepoints assignments in case it can upset sparse. I will send a v2 
when I do that.

Regards,

Tvrtko
> 
> Alternatively I would be fine to switching testing ops for NULL instead of calling dma_fence_test_signaled_flag().
> 
> Regards,
> Christian.
> 
>> Regards,
>>
>> Tvrtko
>>
>>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>>> Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>> Cc: Philipp Stanner <phasta@kernel.org>
>>>>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>>>>> Cc: linux-media@vger.kernel.org
>>>>>> Cc: linaro-mm-sig@lists.linaro.org
>>>>>> ---
>>>>>>     drivers/dma-buf/dma-fence.c | 3 ++-
>>>>>>     1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>>>>> index 1826ba73094c..1c1eaecaf1b0 100644
>>>>>> --- a/drivers/dma-buf/dma-fence.c
>>>>>> +++ b/drivers/dma-buf/dma-fence.c
>>>>>> @@ -363,6 +363,8 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>>>>>                           &fence->flags)))
>>>>>>             return;
>>>>>>     +    trace_dma_fence_signaled(fence);
>>>>>> +
>>>>>>         /*
>>>>>>          * When neither a release nor a wait operation is specified set the ops
>>>>>>          * pointer to NULL to allow the fence structure to become independent
>>>>>> @@ -377,7 +379,6 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>>>>>           fence->timestamp = timestamp;
>>>>>>         set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
>>>>>> -    trace_dma_fence_signaled(fence);
>>>>>>           list_for_each_entry_safe(cur, tmp, &cb_list, node) {
>>>>>>             INIT_LIST_HEAD(&cur->node);
>>>>>
>>>>
>>>
>>
> 


