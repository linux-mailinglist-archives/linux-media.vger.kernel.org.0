Return-Path: <linux-media+bounces-66715-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qllMMChwS2q2RQEAu9opvQ
	(envelope-from <linux-media+bounces-66715-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 11:06:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCD670E6E2
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 11:06:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=M+Gs7SKK;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66715-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66715-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 817593338E46
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 08:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44943FA5CE;
	Mon,  6 Jul 2026 08:46:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDF22BE057;
	Mon,  6 Jul 2026 08:46:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327594; cv=none; b=FMOool29kGGtke7RBdemQkB2ggmSXPnT7qiqFLb0QtLJeP3TWUojMYYtgvrMy+rJjPrj85fU1JMJGvlYNyFqI9BGXARmZI5OhAdT7xQ2b3hrDBXqi/kFTHXs5bluBX9ReWeAifqcZQHwM9p/hS2C89w6hUAW3XMSkF/6iP/Wi4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327594; c=relaxed/simple;
	bh=0J5NWzgozKhj7iWw1lTDLJc1MZi1kjdy9yMrZRufbA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uw07pybYJYoPfShY61vCmI9c8k6NoyfiWv2R6vfwg03erN2V1RTWIIumX5ES74egw1ed1WFW/35A0GuEX/q1yWfjHR4Ezq7SoWRfsFfnM+5o73NG3O4lDRGSTOwCi3qq7WwmhT4WjMLA0C54gdeYt7KHhkdbX3uDxlGW5wxO5ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=M+Gs7SKK; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jknh75JH1P0CBTsivHhJoCFnbVm0gTLli2CnNEauNK8=; b=M+Gs7SKKHMqEtDOlgnQEd1iVQU
	HQvocK2D4tkQtvgMbMxs0c54ABt4LqrYEXu1b3DKAY98TgBFzwQVrVIzeR19iwhOVYDKSRDDMERzL
	ONlPhxXwIPOUhA10uBYE7fv2aAF/tXFCAgnene87JfjTVa3EupzKqZnywxNHjyf75mjvQAvma6hkb
	H+t0FRPFebqyf+9Xi+enJLXYf3WtcnxW8OYUIzlaVuUvUWc0d1WQjVKUXoM8I92u5ZjDtnXmtlj/K
	LK9O2QkHq3Mv9kAbGiuu3AxK9ai9KrcN8BphTHm4yjaDWAYqCEz1t4EzsE8sKvA06vjJZo/vpB5Gs
	IyeMqucQ==;
Received: from [90.240.106.137] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wgexk-009e5C-3f; Mon, 06 Jul 2026 10:46:00 +0200
Message-ID: <ce33edbb-11dd-4722-bb87-d16155f35a75@igalia.com>
Date: Mon, 6 Jul 2026 09:45:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/sched: Protect entity->last_scheduled with
 spinlock
To: phasta@kernel.org, Tvrtko Ursulin <tursulin@ursulin.net>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Marco Pagani
 <marco.pagani@linux.dev>, Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260701085920.3253248-2-phasta@kernel.org>
 <20260701085920.3253248-3-phasta@kernel.org>
 <a4091099-1931-4ca2-a81a-9c3321b123a8@ursulin.net>
 <51fbde808bd059510d667d130afae179626303be.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <51fbde808bd059510d667d130afae179626303be.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66715-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:tursulin@ursulin.net,m:matthew.brost@intel.com,m:dakr@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:marco.pagani@linux.dev,m:boris.brezillon@collabora.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,ursulin.net,intel.com,gmail.com,linux.intel.com,suse.de,ffwll.ch,linaro.org,linux.dev,collabora.com];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1BCD670E6E2


On 03/07/2026 15:47, Philipp Stanner wrote:
> On Fri, 2026-07-03 at 12:27 +0100, Tvrtko Ursulin wrote:
>>
>> On 01/07/2026 09:59, Philipp Stanner wrote:
>>> The entity->last_scheduled field has always been set and read with
>>> special RCU functions in addition to memory barriers.
>>>
>>> This was added in
>>>
>>> commit 70102d77ff22 ("drm/scheduler: add drm_sched_entity_error and use rcu for last_scheduled")
>>>
>>> however, no proper justification for that mechanism was provided. There
>>> seems to be no obvious reason, since the entity lock is available and
>>> taken at all places that evaluate the last_scheduled field. The only
>>> exception is drm_sched_entity_error(), which is not performance critical
>>> in any way.
>>>
>>> Improve robustness, readability and maintainability by replacing RCU and
>>> barriers with the lock.
>>
>> First thing, and regardless of other strands of discussion, I think it
>> should be squashed with 3/5 instead of that one undoing the introduction
>> of lock-unlock-lock-unlock.
> 
> I agree that there should not be a do-undo pattern, but I don't want to
> squash that, it's quite a distinctive action. One patch adds locks, the
> other moves them.

Hm, maybe it is a semantic discussion whether there is any real adding 
of the locks, when the effective end result is just widening of it's 
scope by pulling it out of the helper to caller. But okay, prep patch to 
move the lock out sounds like it could look acceptable.

> But what I can do is move that patch before №1 here so that it becomes
> understandable as a preparational commit.
> 
>>
>> For what the main topic is concerned, I really like the removal of all
>> the rcu_dereference_check(, true) lines and the memory barriers.
>>
>> But I also think the commit message should explain better what code
>> paths are now taking an extra lock - under which circumstances is the
>> lock now taken for all scheduler users, and which amdgpu paths use
>> drm_sched_entity_error() a lot so could be affected. I doubt it creates
>> a measurable performance impact but it needs to be explained.
> 
> I think it can detail which functions will now be locked; but
> mentioning the users would be overkill and is uncommon for API reworks.

Here I disagree quite strongly. Given the patch is making strong claims 
that the lockless access was added for no obvious reason, and that we 
have now established the lockless helper is in fact used on the 
submission paths, it is really required that those strong claims are 
backed by a concrete analysis instead of just saying "not performance 
critical in any way".

>> I am also happy to give it a spin on the Steam Deck to see if I can
>> observe anything.
> 
> Could be interesting.

Okay I'll try to do it in reasonable time. You can either respin or wait 
for it, I don't mind either way.

>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_entity.c | 50 ++++++++++--------------
>>>    include/drm/gpu_scheduler.h              |  9 ++---
>>>    2 files changed, 25 insertions(+), 34 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index c51101ec70c1..91aec20611ad 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -135,7 +135,6 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>    	entity->num_sched_list = num_sched_list;
>>>    	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
>>>    	entity->rq = &sched_list[0]->rq;
>>> -	RCU_INIT_POINTER(entity->last_scheduled, NULL);
>>>    	RB_CLEAR_NODE(&entity->rb_tree_node);
>>>    	init_completion(&entity->entity_idle);
>>>    
>>> @@ -201,10 +200,10 @@ int drm_sched_entity_error(struct drm_sched_entity *entity)
>>>    	struct dma_fence *fence;
>>>    	int r;
>>>    
>>> -	rcu_read_lock();
>>> -	fence = rcu_dereference(entity->last_scheduled);
>>> +	spin_lock(&entity->lock);
>>> +	fence = entity->last_scheduled;
>>>    	r = fence ? fence->error : 0;
>>> -	rcu_read_unlock();
>>> +	spin_unlock(&entity->lock);
>>>    
>>>    	return r;
>>>    }
>>> @@ -287,9 +286,10 @@ void drm_sched_entity_kill(struct drm_sched_entity *entity)
>>>    	/* Make sure this entity is not used by the scheduler at the moment */
>>>    	wait_for_completion(&entity->entity_idle);
>>>    
>>> -	/* The entity is guaranteed to not be used by the scheduler */
>>> -	prev = rcu_dereference_check(entity->last_scheduled, true);
>>> +	spin_lock(&entity->lock);
>>> +	prev = entity->last_scheduled;
>>>    	dma_fence_get(prev);
>>> +	spin_unlock(&entity->lock);
>>>    	while ((job = drm_sched_entity_queue_pop(entity))) {
>>>    		struct drm_sched_fence *s_fence = job->s_fence;
>>>    
>>> @@ -381,8 +381,7 @@ void drm_sched_entity_fini(struct drm_sched_entity *entity)
>>>    		entity->dependency = NULL;
>>>    	}
>>>    
>>> -	dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
>>> -	RCU_INIT_POINTER(entity->last_scheduled, NULL);
>>> +	dma_fence_put(entity->last_scheduled);
>>>    	drm_sched_entity_stats_put(entity->stats);
>>>    }
>>>    EXPORT_SYMBOL(drm_sched_entity_fini);
>>> @@ -507,6 +506,10 @@ drm_sched_job_dependency(struct drm_sched_job *job,
>>>    
>>>    struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>>    {
>>> +	/* Helper to avoid dropping the reference while the entity lock is held,
>>> +	 * just to have some more robustness.
>>> +	 */
>>
>> I don't get this comment. Neither the placement or the content.
> 
> It explains the purpose of the variable 'prev_last_scheduled', which
> exists so that a reference does not drop under lock protection.

Ah a helper _variable_, right, I was thrown off by the comment just 
below the function and did not even spot you added a new local.

Regards,

Tvrtko

> 
> 
> P.


