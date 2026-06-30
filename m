Return-Path: <linux-media+bounces-66056-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nt8zDf2LQ2pMbAoAu9opvQ
	(envelope-from <linux-media+bounces-66056-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 11:27:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EA76E2294
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 11:27:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=TUzh68XO;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66056-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66056-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 251C1305C115
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F05638839E;
	Tue, 30 Jun 2026 09:23:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F321385D80;
	Tue, 30 Jun 2026 09:23:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811434; cv=none; b=PLDLRg7cVSVXIAz3ho8uqc9o2dJC7eZ8ZeLZ0r9ve1HXPgkZaKLbQBZ0E99Ojdkhzzvjs/WQjX7ASMgbqF6X+cu79wUL1l2n7InYS08I63ek0JMke6rQ13dVccAaeU/hm7DfGD8wxQpq/aBYG3V9jHDCgYV3a5R23QGimM/NYbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811434; c=relaxed/simple;
	bh=GD8uUv1Sbu/HQUA/5J7LkGvk9c9U43WQlIues+zO+qY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RDY99QaBykubiB9naceX1UxrRzh9hHRvdB/gqmTZt11Mnqv+7lYBVX1mB9WJa8CJZMNcY0lY5DSSTuw9raOhmur0uZhxUqc2Ro50BjGUMV2LBZ32u3WIY0d0HNoq2Q642YWvFfM1qh/NGaxzFjuTpKpd5sllzQbMnvksW6eGMjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=TUzh68XO; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5sd5P0AgIaXL9cs7YYNoFr4XV/WIbMgV1+mcnz0bD+k=; b=TUzh68XOuz5in6pfG8PF1xuxW8
	y51qMVfPk2b2kGUtr7kY8Mn/QEsswHGWbJ+R/MBNR34Y/pSAIKF0jSb/pQaSRFd9cRUbPR8t3GJri
	UcKmm6O2NZmCn394IZjYTKzKll0MC7DXwbbr45vGNiuCZt6Y+RMUJDMuczqpWdFJv21uwtkLW6M7h
	+6eSq3s+1tO8nMA0V+NZe0nG7QvdbMBpSbnXS45JsG3lmqWheOrEWT5CkP05i52ONcv+YIbzVZiIE
	NovVlArqY1i8AQmsbzXcIToj2nDV81iojE7SEX9tazkLP5LwrpSYmEfIrXTEWi/OKGqTasiSHQArD
	zlMfyA6g==;
Received: from [90.240.106.137] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1weUgf-0071Kn-Fb; Tue, 30 Jun 2026 11:23:25 +0200
Message-ID: <1941b3c5-2ef1-4da9-aa20-a11d771274f1@igalia.com>
Date: Tue, 30 Jun 2026 10:23:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sched: Protect entity->last_scheduled with
 spinlock
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260626081942.2122144-2-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260626081942.2122144-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66056-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:matthew.brost@intel.com,m:dakr@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,gmail.com,linux.intel.com,suse.de,ffwll.ch,linaro.org];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amd.com:email,igalia.com:mid,igalia.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99EA76E2294


On 26/06/2026 09:19, Philipp Stanner wrote:
> The entity->last_scheduled field has always been set and read with
> special RCU functions in addition to memory barriers. There is no
> obvious reason for that, since the entity lock is available and taken at
> all places that evaluate the last_scheduled field. The only exception is
> drm_sched_entity_error(), which is not performance critical in any way.

I agree this looks odd since all call sites apart from 
drm_sched_entity_error() use 
"rcu_dereference_check(entity->last_scheduled, true);" ie. "ignore" the RCU.

Btw this was added in:

commit 70102d77ff22dd88a0111b1c3bac5099ac5d0425
Author: Christian König <christian.koenig@amd.com>
Date:   Mon Apr 17 17:32:11 2023 +0200

     drm/scheduler: add drm_sched_entity_error and use rcu for 
last_scheduled

You may want to add this as a reference in the commit message.

I guess it relied on dma-fence RCU destruction to enable lockless 
lookups from the AMD submit path. Given how many other locks we have in 
those paths it is probably noise to have one more so maybe it is a win 
to remove some barriers and those rcu_dereference_check-true lines. I 
think Christian will need to comment.

> Improve robustness, readability and maintainability by replacing RCU and
> barriers with the lock.
> 
> As a preparational step, while at it, also guard spsc_queue_pop() with
> the lock, since spsc_queue is deprecated and supposed to be replaced
> with a locked list.

You would have said to split the logical changes into separate patches.

> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> Changes since v1:
>    - Add a helper variable to drop the last_scheduled reference without
>      the entity lock being held; just to be more robust.
>    - Write additional comment to detail the WRITE_ONCE().
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 58 +++++++++++++-----------
>   include/drm/gpu_scheduler.h              |  9 ++--
>   2 files changed, 35 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index c51101ec70c1..12fd695c6d46 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -135,7 +135,6 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>   	entity->num_sched_list = num_sched_list;
>   	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
>   	entity->rq = &sched_list[0]->rq;
> -	RCU_INIT_POINTER(entity->last_scheduled, NULL);
>   	RB_CLEAR_NODE(&entity->rb_tree_node);
>   	init_completion(&entity->entity_idle);
>   
> @@ -201,10 +200,10 @@ int drm_sched_entity_error(struct drm_sched_entity *entity)
>   	struct dma_fence *fence;
>   	int r;
>   
> -	rcu_read_lock();
> -	fence = rcu_dereference(entity->last_scheduled);
> +	spin_lock(&entity->lock);
> +	fence = entity->last_scheduled;
>   	r = fence ? fence->error : 0;
> -	rcu_read_unlock();
> +	spin_unlock(&entity->lock);
>   
>   	return r;
>   }
> @@ -288,8 +287,10 @@ void drm_sched_entity_kill(struct drm_sched_entity *entity)
>   	wait_for_completion(&entity->entity_idle);
>   
>   	/* The entity is guaranteed to not be used by the scheduler */
> -	prev = rcu_dereference_check(entity->last_scheduled, true);
> +	spin_lock(&entity->lock);
> +	prev = entity->last_scheduled;
>   	dma_fence_get(prev);
> +	spin_unlock(&entity->lock);
>   	while ((job = drm_sched_entity_queue_pop(entity))) {
>   		struct drm_sched_fence *s_fence = job->s_fence;
>   
> @@ -381,8 +382,12 @@ void drm_sched_entity_fini(struct drm_sched_entity *entity)
>   		entity->dependency = NULL;
>   	}
>   
> -	dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
> -	RCU_INIT_POINTER(entity->last_scheduled, NULL);
> +	dma_fence_put(entity->last_scheduled);
> +	/*
> +	 * Normally all users should be gone now, but since drm_sched has
> +	 * experienced many layering violations in the past, better be safe.
> +	 */
> +	WRITE_ONCE(entity->last_scheduled, NULL);
>   	drm_sched_entity_stats_put(entity->stats);
>   }
>   EXPORT_SYMBOL(drm_sched_entity_fini);
> @@ -507,6 +512,10 @@ drm_sched_job_dependency(struct drm_sched_job *job,
>   
>   struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>   {
> +	/* Helper to avoid dropping the reference while the entity lock is held,
> +	 * just to have some more robustness.
> +	 */
> +	struct dma_fence *prev_last_scheduled;
>   	struct drm_sched_job *sched_job;
>   
>   	sched_job = drm_sched_entity_queue_peek(entity);
> @@ -523,19 +532,20 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>   	if (entity->guilty && atomic_read(entity->guilty))
>   		dma_fence_set_error(&sched_job->s_fence->finished, -ECANCELED);
>   
> -	dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
> -	rcu_assign_pointer(entity->last_scheduled,
> -			   dma_fence_get(&sched_job->s_fence->finished));
> +	spin_lock(&entity->lock);
> +	prev_last_scheduled = entity->last_scheduled;
> +	entity->last_scheduled = dma_fence_get(&sched_job->s_fence->finished);
>   
> -	/*
> -	 * If the queue is empty we allow drm_sched_entity_select_rq() to
> -	 * locklessly access ->last_scheduled. This only works if we set the
> -	 * pointer before we dequeue and if we a write barrier here.
> +	/* A recent rework required taking the spinlock above. Since spsc_queue
> +	 * is scheduled for removal as per the DRM-TODO-list, we access it here
> +	 * locked already to prepare for that cleanup.
> +	 *
> +	 * TODO: Fully replace spsc_queue with a locked (h)list.
>   	 */
> -	smp_wmb();
> -
>   	spsc_queue_pop(&entity->job_queue);
> +	spin_unlock(&entity->lock);
>   
> +	dma_fence_put(prev_last_scheduled);
>   	drm_sched_rq_pop_entity(entity);

Notice the entity->lock ends up cycled twice for no good reason (second 
is in drm_sched_rq_pop_entity()). So I would suggest you somehow reduce 
that to once. Probably just pull out entity->lock out of the 
drm_sched_rq_pop_entity() to drm_sched_entity_pop_job()?

I guess if you do that then the "while at it" part of the commit message 
can be "upgraded" to "spsc_queue_pop() being under the lock as a 
consequence of the rework" and then no need to split it.

>   
>   	/* Jobs and entities might have different lifecycles. Since we're
> @@ -561,21 +571,15 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>   	if (spsc_queue_count(&entity->job_queue))
>   		return;
>   
> -	/*
> -	 * Only when the queue is empty are we guaranteed that
> -	 * drm_sched_run_job_work() cannot change entity->last_scheduled. To
> -	 * enforce ordering we need a read barrier here. See
> -	 * drm_sched_entity_pop_job() for the other side.
> -	 */
> -	smp_rmb();
> -
> -	fence = rcu_dereference_check(entity->last_scheduled, true);
> +	spin_lock(&entity->lock);
> +	fence = entity->last_scheduled;
>   
>   	/* stay on the same engine if the previous job hasn't finished */
> -	if (fence && !dma_fence_is_signaled(fence))
> +	if (fence && !dma_fence_is_signaled(fence)) {
> +		spin_unlock(&entity->lock);

Have you tried with lockdep to see if there are any hidden lock 
inversions with this?

I also wonder if we could demote this to a flag check only and remove 
any doubt. I don't think opportunistic signalling matter in this code path.

Regards,

Tvrtko

>   		return;
> +	}
>   
> -	spin_lock(&entity->lock);
>   	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
>   	rq = sched ? &sched->rq : NULL;
>   	if (rq != entity->rq) {
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index d61c19e78182..176ff1f936cd 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -100,7 +100,8 @@ struct drm_sched_entity {
>   	 * @lock:
>   	 *
>   	 * Lock protecting the run-queue (@rq) to which this entity belongs,
> -	 * @priority and the list of schedulers (@sched_list, @num_sched_list).
> +	 * @priority, @last_scheduled and the list of schedulers (@sched_list,
> +	 * @num_sched_list).
>   	 */
>   	spinlock_t			lock;
>   
> @@ -202,11 +203,9 @@ struct drm_sched_entity {
>   	/**
>   	 * @last_scheduled:
>   	 *
> -	 * Points to the finished fence of the last scheduled job. Only written
> -	 * by drm_sched_entity_pop_job(). Can be accessed locklessly from
> -	 * drm_sched_job_arm() if the queue is empty.
> +	 * Points to the finished fence of the last scheduled job.
>   	 */
> -	struct dma_fence __rcu		*last_scheduled;
> +	struct dma_fence		*last_scheduled;
>   
>   	/**
>   	 * @last_user: last group leader pushing a job into the entity.


