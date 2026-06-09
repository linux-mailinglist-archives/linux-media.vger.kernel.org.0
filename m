Return-Path: <linux-media+bounces-64303-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TzlqIBUYKGpr9wIAu9opvQ
	(envelope-from <linux-media+bounces-64303-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 15:41:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF8F660AD3
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 15:41:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b="g/ofXEZ0";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64303-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64303-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E272302D08A
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 13:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C788A41931B;
	Tue,  9 Jun 2026 13:36:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CB2416CEC;
	Tue,  9 Jun 2026 13:36:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781012211; cv=none; b=HdeBFoWNU+IAHIdieeuRqh/R3SOoGL81sQ0en2EDal3iBsYsATppCQ3wtiYNS8Q51oXpCztcysPJVNfFH3bIu+Mo/0k7H56jOfuLWEUoEBwgeclIVjGPVeu0vQTqLec+ad11TC/x3dvKeBROlbFtU7+/7trT0hB5xQ4CnvHeTHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781012211; c=relaxed/simple;
	bh=ITKjaeeinhZ75LX1kmdCzPz8uTpFAVMOpgQnVaD6AkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sPqQ8kOLIytcnz1FMJwBOR2S8j5cMpEfjY+BVte0BJCntf9FBHG+QqGg1K5iJkUTRxDihPOaNEC6RWMfuA7kAaxRtdOt8gkxgtv+ImAnJNM5R5OfUA8APcum89pCDUix+FqfO+8HeBcb0guvhpPyU5oXzL7ciEpbx7lkjUDY9oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=g/ofXEZ0; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QKvLq8kRz6hhe+0u7myfT7ziiQ0McNf7H3zbSoHITu0=; b=g/ofXEZ0li5JnqABqz55idaJiD
	kulKheE8I+9lZrTzHjVUjn9KKROxijsv4dPQKhcfmAi+coOg4tqbqDyU9584nP4Ph7J86gOkwVVTo
	YscA3es81FlQPbZbHoACJR1xyg8YqVfHrEpofN10Cou8hydcUsCKOCeBU43XpVEXARc/q0iybdfG8
	B8b5ZCtKgdW+TYoMFAt2+UhxM6wEMMISgdfijG+lpcZJd3NFq5YURJ4SW7bPqMkIFpZ6NdzShL0aL
	LKZHQEtnIUgopiLv1Gd9n6nOnjZLjqdw7C7IGbSvo3dIf9eermYQMemj4QfT9pvHTYlxNY0t966IT
	jTXCcXfg==;
Received: from [90.240.106.137] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wWwd9-00Eybf-Jd; Tue, 09 Jun 2026 15:36:35 +0200
Message-ID: <dbda178c-bf02-448b-a88d-5a094adea5c0@igalia.com>
Date: Tue, 9 Jun 2026 14:36:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
To: phasta@kernel.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 airlied@gmail.com
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <dwlsalmeida@gmail.com>,
 Gary Guo <gary@garyguo.net>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260608142436.265820-2-phasta@kernel.org>
 <95f4ae6b-9dec-4122-84e0-fbb0cdee9cb5@amd.com>
 <fa9a335196525adbc03ec21b2e05bb526e4fc174.camel@mailbox.org>
 <9d49c901-fcdf-487a-a733-0320d0bdf94c@amd.com>
 <DJ3V3OCLIK2K.3CYKWYNHYU6JQ@kernel.org>
 <ea4e0541-3702-4014-b8f6-0746a148df86@amd.com>
 <DJ3VYD71HDQ2.3C8GG983Z2YCM@kernel.org>
 <c8564ea0-8ff4-4049-996d-bd978c478372@amd.com>
 <aebe759117cd65004510946e39bd02e4c903e1e3.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aebe759117cd65004510946e39bd02e4c903e1e3.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.36 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:christian.koenig@amd.com,m:dakr@kernel.org,m:airlied@gmail.com,m:sumit.semwal@linaro.org,m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-64303-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,amd.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,collabora.com,google.com,gmail.com,garyguo.net,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EBF8F660AD3


On 09/06/2026 14:19, Philipp Stanner wrote:
> +Cc Dave
> 
> On Mon, 2026-06-08 at 20:47 +0200, Christian König wrote:
>> On 6/8/26 20:39, Danilo Krummrich wrote:
>>> How did you get to this conclusion considering that you run into what I
>>> mentioned above as well and the fact that we seem to agree that the performance
>>> concern is rather questionable?
>>
>> Quite simple, it's the cleaner approach.
>>
>> Calling callbacks with locks held is rather questionable even putting the performance issue aside.
> 
> 
> I'm right now going through all fence users to see whether we can
> implement my solution.
> 
> And look what I found:
> 
> static inline bool
> nouveau_cli_work_ready(struct dma_fence *fence)
> {
> 	unsigned long flags;
> 	bool ret = true;
> 
> 	dma_fence_lock_irqsave(fence, flags);
> 	if (!dma_fence_is_signaled_locked(fence))
> 		ret = false;
> 	dma_fence_unlock_irqrestore(fence, flags);
> 
> 	if (ret == true)
> 		dma_fence_put(fence);
> 	return ret;
> }
> 
> 
> That looks weird, doesn't it?
> 
> 
> We do some git-blame:
> 
> c8a5d5ea3ba6a18958f8d76430e4cd68eea33943
> 
> and we find that it's Dave who wrote that code, because
> 
> "
>      My analysis: two threads are running, one in the irq signalling the
>      fence, in dma_fence_signal_timestamp_locked, it has done the
>      DMA_FENCE_FLAG_SIGNALLED_BIT setting, but hasn't yet reached the
>      callbacks.
>      
>      The second thread in nouveau_cli_work_ready, where it sees the fence is
>      signalled, so then puts the fence, cleanups the object and frees the
>      work item, which contains the callback.
>      
>      Thread one goes again and tries to call the callback and causes the
>      use-after-free.
> "
> 
> 
> So this is a race, caused by lockless speed optimization.
> 
> And it would further seem that there is one invention in computer
> science that can prevent such races:
> 
> Locks.
> 
> There is no cleaner, safer synchronization strategy in computer science
> than locking.
> 
> This race became possible because the lock does not guard the entirety
> of dma_fence_is_signaled().

One could also argue the problem was caused by sharing the fence 
reference without holding it, anyway, I wanted to ask something else. 
What happened to the idea to remove opportunistic signalling from 
dma_fence_is_signaled?

Regards,

Tvrtko

> 
> Wouldn't you agree that this is a strong indicator for the great
> advantages that consequent and consistent lock-protection grants? IOW,
> by using locks more strictly in dma_fence, we can increase its
> robustness and reliability.
> 
> 
> P.


