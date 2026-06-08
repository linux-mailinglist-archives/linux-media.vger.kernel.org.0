Return-Path: <linux-media+bounces-64210-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LMv3MKvzJmppogIAu9opvQ
	(envelope-from <linux-media+bounces-64210-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 18:54:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21393658F54
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 18:54:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=OIet9hEz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64210-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64210-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7D6733A417F
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 15:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79833D301A;
	Mon,  8 Jun 2026 15:08:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD333D1A82;
	Mon,  8 Jun 2026 15:08:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931292; cv=none; b=Khxci/jEuXZRv1zs2W0ZWZkt2zwdxzMD07apydneuh6uKhBv5q2E4kQZ6qBCsSs2ZCfBInvkToU0Anl7wrqbYIm2Q3zn/AVGGYc9x3HruLZMopoD5jKpIrHyp85RKRruDWd+EDeZNHEg38K0UrgtDwY9LIb84K38FiW1fsYIbaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931292; c=relaxed/simple;
	bh=EjWNyqijRUm1Grv7vMrE8dSACWMmnPtVdgGhFlwnicA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CtXnbjZv648gV6UPW2IUe11JFWnmWCG51y7nIndITqeB6cNitB1F7aNDXFqDfhPxwXZS+ze0CSYRkrpe560tgSuKCO2P/4oO53zgxVE4gDhLDxWY08dZGeBXSi/Q6ZX03stxxlE0zImFaXUFaIWV6FJMYKEgR37jgMBAPVCywbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=OIet9hEz; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wEyDNt4clqv72U15Tb1FHIQoyXiS2jCZCCn0zuuUGIA=; b=OIet9hEzSIgHcXTyfTd5m7imO1
	rceksU21aTlUuIN01B7ojUvJI2IwRAaK4lvpV0VnYH35rgSzrPk8anJxSBjpaznvma0JCzbuEVHQb
	loLIMEA7d4Pg4j6NKzUmeCYeKRUbe2LeifutrnOSRxUZSa3bV4n8BpB0pgkdtrkcqSI8sWZXIDYVz
	RdZgsgTK6Ilv49/e39XzSG8iRF5vCAhDDwosILoiN1mY+q8AZwrm1b7/F3yxARPgqFvx8WtDFIBd7
	kso9IC4l8u+bLqxBbDu0Ge2vJNbPXpH0teGOgvvgoNe5Z/7QGq5MqR7D7IJ+kW4YlO4KP7OYItyNP
	48GxHtMw==;
Received: from [90.240.106.137] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wWba0-00ER94-LY; Mon, 08 Jun 2026 17:07:56 +0200
Message-ID: <e5f81f4f-ac0c-49c0-a9d1-85f372d65971@igalia.com>
Date: Mon, 8 Jun 2026 16:07:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
To: Philipp Stanner <phasta@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <dwlsalmeida@gmail.com>,
 Gary Guo <gary@garyguo.net>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
References: <20260608142436.265820-2-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260608142436.265820-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-64210-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dakr@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,amd.com,collabora.com,google.com,gmail.com,garyguo.net];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,igalia.com:mid,igalia.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21393658F54


On 08/06/2026 15:24, Philipp Stanner wrote:
> The dma_fence backend_ops can access a fence. Hereby, a driver callback
> will be running which likely will access driver specific data through
> container_of(). If now, simultaneously, a driver signals the fence and
> afterwards expects to run a driver specific destructor (using the same
> data accessed through container_of()), there can be a race.
> 
> A driver very likely trusts that once it has signaled a fence, no one
> will be accessing it anymore. Moreover, it might already want to free up
> resources, making UAF bugs possible.

Can you explain this race a bit differently? I am struggling to 
understand the scenario.

Are you talking about driver freeing the data immediately after 
signalling? That is not allowed as per the "DOC: Safe external access to 
driver provided object members", ie. divers must ensure a RCU grace 
period between signalling and freeing any data which can be reached by 
any external caller.

Regards,

Tvrtko

> The race occurs because there are only pragmatic checks for the signaled
> flag of a fence, without taking the fence lock. RCU guards exist, but
> their purpose is to guard accesses through the backend_ops callbacks
> against the driver (which implements the TEXT segment these callbacks
> live in) from unloading.
> 
> Proper synchronization can be ensured by taking the fence lock. RCU is
> still simultaneously required to guard against the unload.
> 
> Fix the races by taking the lock for all non-deprecated backend_ops
> callbacks.
> 
> Conveniently, this also fixes a race where backend_ops->set_deadline()
> might try to set a deadline for an already signaled fence.
> 
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> We discovered this problem through our Rust abstractions, but it can
> also occur in C.
> 
> The by far cleanest solution seems to be to use the fence lock. This RFC
> serves to discuss whether there is anything preventing that.
> 
> (Patch so far just compile tested, to have some groundlayer for the
> rough idea, to discuss it first)
> ---
>   drivers/dma-buf/dma-fence.c | 39 ++++++++++++++++++++++++++++---------
>   include/linux/dma-fence.h   | 17 ++++++++++++----
>   2 files changed, 43 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index c7ea1e75d38a..b74f02f3cca8 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -629,7 +629,8 @@ EXPORT_SYMBOL(dma_fence_free);
>   static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>   {
>   	const struct dma_fence_ops *ops;
> -	bool was_set;
> +	bool was_set, success;
> +	unsigned long flags;
>   
>   	dma_fence_assert_held(fence);
>   
> @@ -644,7 +645,10 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>   	if (!was_set && ops && ops->enable_signaling) {
>   		trace_dma_fence_enable_signal(fence);
>   
> -		if (!ops->enable_signaling(fence)) {
> +		dma_fence_lock_irqsave(fence, flags);
> +		success = ops->enable_signaling(fence);
> +		dma_fence_unlock_irqrestore(fence, flags);
> +		if (!success) {
>   			rcu_read_unlock();
>   			dma_fence_signal_locked(fence);
>   			return false;
> @@ -1020,11 +1024,20 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
>   void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>   {
>   	const struct dma_fence_ops *ops;
> +	unsigned long flags;
>   
>   	rcu_read_lock();
>   	ops = rcu_dereference(fence->ops);
> -	if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
> +	if (!ops || !ops->set_deadline) {
> +		rcu_read_unlock();
> +		return;
> +	}
> +
> +	dma_fence_lock_irqsave(fence, flags);
> +	if (!dma_fence_is_signaled_locked(fence))
>   		ops->set_deadline(fence, deadline);
> +
> +	dma_fence_unlock_irqrestore(fence, flags);
>   	rcu_read_unlock();
>   }
>   EXPORT_SYMBOL(dma_fence_set_deadline);
> @@ -1166,14 +1179,18 @@ EXPORT_SYMBOL(dma_fence_init64);
>    */
>   const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
>   {
> +	const char __rcu *name = "detached-driver";
>   	const struct dma_fence_ops *ops;
> +	unsigned long flags;
>   
>   	/* RCU protection is required for safe access to returned string */
>   	ops = rcu_dereference(fence->ops);
> +	dma_fence_lock_irqsave(fence, flags);
>   	if (!dma_fence_test_signaled_flag(fence))
> -		return (const char __rcu *)ops->get_driver_name(fence);
> -	else
> -		return (const char __rcu *)"detached-driver";
> +		name = ops->get_driver_name(fence);
> +	dma_fence_unlock_irqrestore(fence, flags);
> +
> +	return name;
>   }
>   EXPORT_SYMBOL(dma_fence_driver_name);
>   
> @@ -1199,13 +1216,17 @@ EXPORT_SYMBOL(dma_fence_driver_name);
>    */
>   const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
>   {
> +	const char __rcu *name = "signaled-timeline";
>   	const struct dma_fence_ops *ops;
> +	unsigned long flags;
>   
>   	/* RCU protection is required for safe access to returned string */
>   	ops = rcu_dereference(fence->ops);
> +	dma_fence_lock_irqsave(fence, flags);
>   	if (!dma_fence_test_signaled_flag(fence))
> -		return (const char __rcu *)ops->get_driver_name(fence);
> -	else
> -		return (const char __rcu *)"signaled-timeline";
> +		name = ops->get_driver_name(fence);
> +	dma_fence_unlock_irqrestore(fence, flags);
> +
> +	return name;
>   }
>   EXPORT_SYMBOL(dma_fence_timeline_name);
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index b52ab692b22e..b93c3f7f69fb 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -547,20 +547,29 @@ static inline bool
>   dma_fence_is_signaled(struct dma_fence *fence)
>   {
>   	const struct dma_fence_ops *ops;
> +	unsigned long flags;
> +	bool signaled;
>   
>   	if (dma_fence_test_signaled_flag(fence))
>   		return true;
>   
>   	rcu_read_lock();
>   	ops = rcu_dereference(fence->ops);
> -	if (ops && ops->signaled && ops->signaled(fence)) {
> +	if (!ops || !ops->signaled) {
>   		rcu_read_unlock();
> -		dma_fence_signal(fence);
> -		return true;
> +		return false;
>   	}
> +
> +	dma_fence_lock_irqsave(fence, flags);
> +	signaled = ops->signaled(fence);
> +
> +	if (signaled)
> +		dma_fence_signal_locked(fence);
> +
> +	dma_fence_unlock_irqrestore(fence, flags);
>   	rcu_read_unlock();
>   
> -	return false;
> +	return signaled;
>   }
>   
>   /**


