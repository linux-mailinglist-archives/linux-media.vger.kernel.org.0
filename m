Return-Path: <linux-media+bounces-66071-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bw3XNvSeQ2o4dgoAu9opvQ
	(envelope-from <linux-media+bounces-66071-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:48:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B85A6E31EF
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:48:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=hwcrkug8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66071-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66071-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F4773056531
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 10:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4900A3FB06D;
	Tue, 30 Jun 2026 10:46:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED0A3F6C2A;
	Tue, 30 Jun 2026 10:46:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782816406; cv=none; b=R0zu1h24BiEv+j1/5aNBX1t3XjGJkWls71nXyrUTamDblEvy23o3tijHPxW16uoxHawYmy75LkAyofdhefc07qYr/Mnl9/ZfVXHR3xs7CTZxmdRbcEKdW35KgdCQZxldrRxDleDvYMSb8m2fWRIjnSCTCBr1gBXQQxAqRRKNHZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782816406; c=relaxed/simple;
	bh=RgDpisDvetYQr7Y+jSW1QlBbHijGuGrRCt4et0+4rwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I4uIjapJbm7Dp0EUuVpJjuRf4DIgbMLqZWzkp2voiDiHtYWRNf1TuzFl+EKctNWKShFfiQSzF395zhVwgqaeLZw1pjqUZ2tMupi8mgYqS/gJZfJtKjY/z8ZxX+oniP44jjj/AMJ3a4ScDTo/BVOE9iuJbtLsdjts3OUxXpYAIcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=hwcrkug8; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WlXJBQz5A57M4/4cjKu8vy0BBzeoLO2eU2Om2U0YMyM=; b=hwcrkug8oh0EUiDVVqjcDu7x7D
	5JhQwINAKPlqverfRZKXSNF8CULxDyho/O/RumOvyrZmjp2H/+BgfCQiw83Rxc4Wx8N+7llqe1Tbp
	oL8o9/bbgKVdoYCiVn6ERb/PYm9Rg82AXl8olNLG0qcEurYKMxK5skpZ7vTK4M+fym6ojcifw51b4
	LwnuFGNzAaQtwQoMws6FrPtcqX4vfWqaW41KKBGTbDIWiTjX6y2vSDloToNV2vFVAAs0LhtLSm6Bf
	bZsGXoRWtoROnNH8AfdYwO+KUbB72a2w/0yUeh9cMxN6PsBX0KHXtMlYc/AdNbfDdL/ebdfHJGVGi
	IS/ECYPg==;
Received: from [90.240.106.137] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1weVyv-0073Dd-5P; Tue, 30 Jun 2026 12:46:21 +0200
Message-ID: <d317b769-0f7c-47a2-a049-ea51c87fcfb7@igalia.com>
Date: Tue, 30 Jun 2026 11:46:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sched: Protect entity->last_scheduled with
 spinlock
To: phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260626081942.2122144-2-phasta@kernel.org>
 <1941b3c5-2ef1-4da9-aa20-a11d771274f1@igalia.com>
 <9f7fa57610d3d94324e09dc936f5f7f3c3d390d3.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <9f7fa57610d3d94324e09dc936f5f7f3c3d390d3.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66071-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,gmail.com,linux.intel.com,suse.de,ffwll.ch,linaro.org];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:matthew.brost@intel.com,m:dakr@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amd.com:email,igalia.com:mid,igalia.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B85A6E31EF


On 30/06/2026 11:06, Philipp Stanner wrote:
> On Tue, 2026-06-30 at 10:23 +0100, Tvrtko Ursulin wrote:
>>
>> On 26/06/2026 09:19, Philipp Stanner wrote:
>>> The entity->last_scheduled field has always been set and read with
>>> special RCU functions in addition to memory barriers. There is no
>>> obvious reason for that, since the entity lock is available and taken at
>>> all places that evaluate the last_scheduled field. The only exception is
>>> drm_sched_entity_error(), which is not performance critical in any way.
>>
>> I agree this looks odd since all call sites apart from
>> drm_sched_entity_error() use
>> "rcu_dereference_check(entity->last_scheduled, true);" ie. "ignore" the RCU.
>>
>> Btw this was added in:
>>
>> commit 70102d77ff22dd88a0111b1c3bac5099ac5d0425
>> Author: Christian König <christian.koenig@amd.com>
>> Date:   Mon Apr 17 17:32:11 2023 +0200
>>
>>       drm/scheduler: add drm_sched_entity_error and use rcu for
>> last_scheduled
>>
>> You may want to add this as a reference in the commit message.
> 
> I did git-blame for that commit. It looks like this:
> 
>      drm/scheduler: add drm_sched_entity_error and use rcu for last_scheduled
>      
>      Switch to using RCU handling for the last scheduled job and add a
>      function to return the error code of it.
> 
> It's a good example of why I think it's so vital to write verbose
> commit messages. The only way to find out why this was added is to ask
> the author, if he's still around [which is the case in this case].
> 
> I can't see the value of adding a link? That commit says "add foo" and
> my commit says "remove foo because it achieves nothing".

It achieves something, there is a little bit more detail to it. You 
could write:

Commit xxx added RCU without documenting that it needed it for lockless 
access to blah blah, while all other call sites needed to explicitly and 
forcefully silence the RCU checker, etc...

Anyway, I don't intend to write the commit text but my point is value 
can be added while being accurate. If you add a patch which says "there 
is no obvious reason", well, lets leave historical breadcrumbs to make 
it less non-obvious, now that we know what it was.

>> I guess it relied on dma-fence RCU destruction to enable lockless
>> lookups from the AMD submit path. Given how many other locks we have in
>> those paths it is probably noise to have one more so maybe it is a win
>> to remove some barriers and those rcu_dereference_check-true lines. I
>> think Christian will need to comment.
> 
> My argument is more that locks are the right tool to use unless there
> is proof to the contrary.
> 
>>
>>> Improve robustness, readability and maintainability by replacing RCU and
>>> barriers with the lock.
>>>
>>> As a preparational step, while at it, also guard spsc_queue_pop() with
>>> the lock, since spsc_queue is deprecated and supposed to be replaced
>>> with a locked list.
>>
>> You would have said to split the logical changes into separate patches.
> 
> Me? :D
> 
> In this case, a lock that did not exist is added from nowhere. But I
> tend to think that you are right. We could leave spsc_queue lockless
> for now. That's cleaner.
> 
>>
>>>
> 
> […]
> 
>>>
>>>    struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>>    {
>>> +	/* Helper to avoid dropping the reference while the entity lock is held,
>>> +	 * just to have some more robustness.
>>> +	 */
>>> +	struct dma_fence *prev_last_scheduled;
>>>    	struct drm_sched_job *sched_job;
>>>    
>>>    	sched_job = drm_sched_entity_queue_peek(entity);
>>> @@ -523,19 +532,20 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>>    	if (entity->guilty && atomic_read(entity->guilty))
>>>    		dma_fence_set_error(&sched_job->s_fence->finished, -ECANCELED);
>>>    
>>> -	dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
>>> -	rcu_assign_pointer(entity->last_scheduled,
>>> -			   dma_fence_get(&sched_job->s_fence->finished));
>>> +	spin_lock(&entity->lock);
>>> +	prev_last_scheduled = entity->last_scheduled;
>>> +	entity->last_scheduled = dma_fence_get(&sched_job->s_fence->finished);
>>>    
>>> -	/*
>>> -	 * If the queue is empty we allow drm_sched_entity_select_rq() to
>>> -	 * locklessly access ->last_scheduled. This only works if we set the
>>> -	 * pointer before we dequeue and if we a write barrier here.
>>> +	/* A recent rework required taking the spinlock above. Since spsc_queue
>>> +	 * is scheduled for removal as per the DRM-TODO-list, we access it here
>>> +	 * locked already to prepare for that cleanup.
>>> +	 *
>>> +	 * TODO: Fully replace spsc_queue with a locked (h)list.
>>>    	 */
>>> -	smp_wmb();
>>> -
>>>    	spsc_queue_pop(&entity->job_queue);
>>> +	spin_unlock(&entity->lock);
>>>    
>>> +	dma_fence_put(prev_last_scheduled);
>>>    	drm_sched_rq_pop_entity(entity);
>>
>> Notice the entity->lock ends up cycled twice for no good reason (second
> 
> Getting rid of hard to understand barriers + RCU *is* a _very_ good
> reason.

I will re-phrase - there is no reason to cycle the lock twice while 
proposing the removal of barriers and RCU. They are completely orthogonal.

>> is in drm_sched_rq_pop_entity()). So I would suggest you somehow reduce
>> that to once. Probably just pull out entity->lock out of the
>> drm_sched_rq_pop_entity() to drm_sched_entity_pop_job()?
> 
> Can you see danger in sense of a significant performance regression
> because of that?

It's just unsightly. Last year or so I removed the very same lazy 
pattern from the scheduler so lets not re-add it.

d42a254633c7 ("drm/sched: Optimise drm_sched_entity_push_job")
36caa026b28a ("drm/sched: Avoid double re-lock on the job free path")

>> I guess if you do that then the "while at it" part of the commit message
>> can be "upgraded" to "spsc_queue_pop() being under the lock as a
>> consequence of the rework" and then no need to split it.
> 
> I agree with you that it should be *downgraded* instead.

Dropping that part of change? Works for me.

>>>    
>>>    	/* Jobs and entities might have different lifecycles. Since we're
>>> @@ -561,21 +571,15 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>>    	if (spsc_queue_count(&entity->job_queue))
>>>    		return;
>>>    
>>> -	/*
>>> -	 * Only when the queue is empty are we guaranteed that
>>> -	 * drm_sched_run_job_work() cannot change entity->last_scheduled. To
>>> -	 * enforce ordering we need a read barrier here. See
>>> -	 * drm_sched_entity_pop_job() for the other side.
>>> -	 */
>>> -	smp_rmb();
>>> -
>>> -	fence = rcu_dereference_check(entity->last_scheduled, true);
>>> +	spin_lock(&entity->lock);
>>> +	fence = entity->last_scheduled;
>>>    
>>>    	/* stay on the same engine if the previous job hasn't finished */
>>> -	if (fence && !dma_fence_is_signaled(fence))
>>> +	if (fence && !dma_fence_is_signaled(fence)) {
>>> +		spin_unlock(&entity->lock);
>>
>> Have you tried with lockdep to see if there are any hidden lock
>> inversions with this?
> 
> As far as I could grep really no one touches the entity lock (which is
> not surprising, since the entire drm_sched design resolves around the
> central philosophy: "NEVER use a spinlock unless you absolutely have
> to". When you look at the old code and documentation, you see that
> locks were really only ever used to protect lists.
> 
> Anyways. This is the scheduler's fence. It can never implement any
> callback to someone who might interfere with the entity lock, can it?

Right, just my trauma from past encounters with opportunistic signalling.

Regards,

Tvrtko

>> I also wonder if we could demote this to a flag check only and remove
>> any doubt. I don't think opportunistic signalling matter in this code path.
> 
> With the new fence API, where we can bypass the ops, that would
> probably be the more canonical code. But that's then indeed something
> for a separate patch.
> 
> 
> P.


