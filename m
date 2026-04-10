Return-Path: <linux-media+bounces-58560-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGzSH5Ya2Wk1mQgAu9opvQ
	(envelope-from <linux-media+bounces-58560-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 17:43:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E243D9940
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 17:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 58651308D9A9
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 15:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573C03DA7F4;
	Fri, 10 Apr 2026 15:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="hWMWG3or"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9103DA5D2
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 15:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775835475; cv=none; b=XB24pEGdb8Fi8VOzty91LyIOuOzFmZ/Ykd5/w8LwYP0adUt2cisK3XGypkffhTlhaEiJ+K5LtxkM1KN+mMPB1ZCHEXT1BLloupIMQ69nG3S5EkVOYv1vYEv3jPz6AdOo8lZmY58amJT9rLBwwjZ5/z1P80gySWxc92Ul8oEVdG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775835475; c=relaxed/simple;
	bh=Y3vYkn3uLUkeuTRyZiWRbVIPHnrHfZX2F46X8IxxSnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f80z8Mj0f/XtJNS+68ibBSKzY3tlsRunYAKdAEnPmH9AzkSMPFvpMx/UfGyVdPzLfKz1olbitnGCFPMc+veYbbiQKzwHWTYxW2YYWi1NE5uhbyQGGhTM1hHrEgqK4bpNFPkdK3d/0rTqZrhrua7VqJn5vnrq0ZI+txJ1+4RAczA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=hWMWG3or; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mYNwM0J3f8E8VOY/oeiqgSWmb0DW6P+uM/hk330XqIM=; b=hWMWG3ors1UZ5eKQ2/SIpSFxVk
	h0uUCBaSDzzQzlQjYOKq6EW7yt8MVoU3or7rM9rHpTx63mte8larmy16ePf5MfGfiKfGbSUdAvqvf
	oBT6gT1O+Dw6CcrVCoWMNUykgiFdWop1gDUx9A4Z7mUN0bKBzixAequt6ebQhi97fnDtLgphQ2Ncq
	f0D4ymdRegDFnsAuJwFRUnIAh9IkrouxQGk+HX9HYZwW/avGC8bRIV31SQwBbtDD0tpU6MbpHDNIb
	ULJyH43alSLhZkRThMbOgPPuTt7eAxyXZ4tU2ewbpA0+P2EhtUChx1uXS8bY3ZPVk4GKRBynOVj9d
	R4o5XFDg==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wBDvN-00ESAa-QW; Fri, 10 Apr 2026 17:37:37 +0200
Message-ID: <601a78ea-74e7-4b20-afeb-d822a362484a@igalia.com>
Date: Fri, 10 Apr 2026 16:37:36 +0100
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
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <2fae926b-a25b-42bc-ab63-caf36505b33d@amd.com>
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
	TAGGED_FROM(0.00)[bounces-58560-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amd.com:email,collabora.com:email,igalia.com:email,igalia.com:mid]
X-Rspamd-Queue-Id: E6E243D9940
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 10/04/2026 09:58, Christian König wrote:
> On 4/9/26 15:58, Tvrtko Ursulin wrote:
>>
>> On 31/03/2026 08:49, Boris Brezillon wrote:
>>> On Mon, 30 Mar 2026 14:36:23 +0100
>>> Tvrtko Ursulin <tvrtko.ursulin@igalia.com> wrote:
>>>
>>>> Move the signalling tracepoint to before fence->ops are reset otherwise
>>>> tracepoint will dereference a null pointer.
>>>
>>> I suspect other trace points are impacted too
>>> (trace_dma_fence_destroy() is, at the very least).
>>
>> Indeed. I wonder why that did not trigger for me, while the one I fix here was an insta-crash...
> 
> You need to actually enable the trace points and at least for the destroy one nobody is usually interested in that.

Right, but I was pretty sure I was enabling perf record -e 'dma_fence:*' 
when I hit this. Anyway, it doesn't matter, I could be misremembering.

>>
>> To fix trace_dma_fence_destroy I think we need a new tracepoint definition ie. move it away from the existing event class - make it just log the context and seqno.
>>
>> Anyone has a better idea?
> 
> The idea of tracing without accessing fence->ops sounds valid to me.
> 
> Alternatively we could call dma_fence_timeline_name() and dma_fence_driver_name() from the tracepoint as well, but that means the tracepoints now require a RCU read side lock.

We could possibly use the helpers. I am not sure if RCU annotation would 
have to be casted away to keep sparse happy, but more importantly, I 
think it would not be safe.

   thread A					thread B

   dma_fence_signal_timestamp_locked		dma_fence_timeline_name
     ..						ops = rcu_dereference(fence->ops);
						if (!dma_fence_test_signaled_flag(fence))
     test_and_set_bit
     ..
     RCU_INIT_POINTER(fence->ops, NULL);
     						return (const char __rcu *)ops->get_driver_name(fence); // OOPS!

Apologies for long line length, it did not fit otherwise.

Looks like we missed this. Or it is me who is missing something?
Regards,

Tvrtko

>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Philipp Stanner <phasta@kernel.org>
>>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>>> Cc: linux-media@vger.kernel.org
>>>> Cc: linaro-mm-sig@lists.linaro.org
>>>> ---
>>>>    drivers/dma-buf/dma-fence.c | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>>> index 1826ba73094c..1c1eaecaf1b0 100644
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
>>>>          list_for_each_entry_safe(cur, tmp, &cb_list, node) {
>>>>            INIT_LIST_HEAD(&cur->node);
>>>
>>
> 


