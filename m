Return-Path: <linux-media+bounces-66455-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QJcTCMmfR2rpcQAAu9opvQ
	(envelope-from <linux-media+bounces-66455-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 13:40:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 066FB701F0A
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 13:40:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ursulin.net header.s=google header.b=TXEFBvB1;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66455-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66455-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1DB6830490C8
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 11:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC143C5857;
	Fri,  3 Jul 2026 11:28:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EBB3C4B6F
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 11:27:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783078072; cv=none; b=t41B8yOq3v9QMVust6DpXAAQi/bq2+o6iNLgbZ03CvWZlqz0Pe2wvTqhDEd+Czf5Plv55QlRRpXYqFrKofre5RQMwZsGru/O7oyQdmcGKnXfbRGkDszoDXoGTVayw8QPMnmF/09fsTWzuK5UO439qYgeB+cfQXwCCOEmtf1kJYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783078072; c=relaxed/simple;
	bh=nmRkIf33QPQVliM9xw9SL9irKg74+Em0QVm2hZmH+C0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U8fe6jx19/n7tgQVWfL2icQfp8s40J2V6PXSngr9cA5kpGAy5yuujvRWQVn4JeA4B6dy6IwyRMdbxVgObbwQIcvKhdAhxq4qM8MNcU/D5HIIxGmmYJXAawxDyJ1xqAWKJKZszvQVtn+17EqB/z/kNedcLWm6Pm0JqJsXd5Wofws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=TXEFBvB1; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so3435255e9.1
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 04:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1783078061; x=1783682861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OuAm8vdkodpohgIaaoCfMJWpUHZMR+Yb1vVl/12/bjU=;
        b=TXEFBvB1Tq/YzImCYuE6P7I2tr/X4puJ1Onp3IKdPJ6TmJiUFntDOozdK14EQ/mIof
         nADOvWLMfn0lzeeK7kFdV/a6WqyeSGBIcHKUbpmVS0wqrXLASj3F2gzkVIo92Nn9VXID
         2Kralp8wiuiGnsOQstqeXH7iP5qD7l/DsOSu2dl2rh/3TeExLdj2BsBIh4ilmTnaKa5P
         +zR/ZOc4B6tY2Se+o25oHRzv4g1AT1UR8574xCAn9IyVLTXsGHmWVllfxdmo4qXY3ewE
         JeOIUj7GA+Ow3SJ9Vx7RvTjEaM2kCB9Jqw0K6my/kX3p0u+Z+VjLQwYImYiS/FNs3Ma9
         KzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783078061; x=1783682861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OuAm8vdkodpohgIaaoCfMJWpUHZMR+Yb1vVl/12/bjU=;
        b=JoWI1sAcy4ExxD34x42QNWNf8wu9b61qF/zDR+OT6pm6KdbeFtI3B6U8F87FpuS2yN
         uOuddGP3tc0n7RL2O/Vrw+M0B0k0DpH0w8GFCYLbXYyxcxAmBlx1uJW/QGv5bFoZdiVe
         y/duhOtgmpvRcuJ9ztYPR/aQNtfLm/UhVp2daX0BRMdUJkUiF0v+6PzIN486T1ejOMUj
         Jkx49KXCj55L2S0PwDW5pJypN+RaemDTLDHZg+GheFFLmxD5vbPS+3ZNei4E59jp5RSL
         NX1BYWLZeqksEzYHIgi03gGhzjGEMSldywg7O2u1fekiZpklCbyV0l5OfGIKH9UDAHA8
         H/Fg==
X-Forwarded-Encrypted: i=1; AFNElJ/P2pMk/VePLjACqQ06d/gNpco6qA5sGgEbCNJZl0nmYyVhRUyNiHPJB5Cqjnzv/TR9LnO9qcVmWVg+qg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7wduwk9P3LSzwPgc7qpjH7MVTj11KPyLz/H+bpceN3zrR4jAi
	wogMJdDhj+5ICLFFuOrf82UYgbIMaJtzIPM9g60U3yb/TXFl9XQbY9SzWPDjvmkmP0E=
X-Gm-Gg: AfdE7cnXcGO1CrVfGNE/+RtlMgzsJva8QDF+Q7n/hpXCxCJkazmBA3ES9veTfp7LjSr
	mQ4U7Ca1lo8ovXzFfXSRnN+c2X/LYFquyLpMzKpsHcFbWrz+naxqLRZQb8cM6Sij8r8hyZ1TZyy
	HEaBct1nXGPPw/z3cKsNk6ecVudc6jD5Ebt7st/DfJHuHODmb1Wa/2h4r1LsBRfyyxK+D1LVfcO
	p9646Yn9jTvIcI6U3YXMbmAXgQXbFAZZmc9GDbbLWJQrbpHb+7y76sHcYhPS7cTNYFynFupDZGc
	+JolYsPRvYbCkpLluoNwYJfMnFq8Ocv7+PQb4gOH6F00f7qsYqa4oZgH46aptQ8PqNbBcRVnqKa
	PbmJ4TQGsXhu35Gg3zdiElUJMjAJ0mrIEJk/EAxIlaPkUDIUj5aftOFbAJxD9xEBqFEXfBj0V8I
	3yHZnXuJCXJw0gHyu/4dtX/qEX4JO2oNPlJA==
X-Received: by 2002:a05:600c:4b23:b0:493:bc4a:e7d4 with SMTP id 5b1f17b1804b1-493c9d416d4mr31257795e9.19.1783078060493;
        Fri, 03 Jul 2026 04:27:40 -0700 (PDT)
Received: from [192.168.0.116] ([90.240.106.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dde1a4fdsm18439490f8f.26.2026.07.03.04.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 04:27:40 -0700 (PDT)
Message-ID: <a4091099-1931-4ca2-a81a-9c3321b123a8@ursulin.net>
Date: Fri, 3 Jul 2026 12:27:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/sched: Protect entity->last_scheduled with
 spinlock
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Marco Pagani
 <marco.pagani@linux.dev>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260701085920.3253248-2-phasta@kernel.org>
 <20260701085920.3253248-3-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260701085920.3253248-3-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:matthew.brost@intel.com,m:dakr@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:marco.pagani@linux.dev,m:tvrtko.ursulin@igalia.com,m:boris.brezillon@collabora.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,gmail.com,linux.intel.com,suse.de,ffwll.ch,linaro.org,linux.dev,igalia.com,collabora.com];
	DMARC_NA(0.00)[ursulin.net];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-66455-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ursulin.net:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ursulin.net:from_mime,ursulin.net:dkim,ursulin.net:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 066FB701F0A


On 01/07/2026 09:59, Philipp Stanner wrote:
> The entity->last_scheduled field has always been set and read with
> special RCU functions in addition to memory barriers.
> 
> This was added in
> 
> commit 70102d77ff22 ("drm/scheduler: add drm_sched_entity_error and use rcu for last_scheduled")
> 
> however, no proper justification for that mechanism was provided. There
> seems to be no obvious reason, since the entity lock is available and
> taken at all places that evaluate the last_scheduled field. The only
> exception is drm_sched_entity_error(), which is not performance critical
> in any way.
> 
> Improve robustness, readability and maintainability by replacing RCU and
> barriers with the lock.

First thing, and regardless of other strands of discussion, I think it 
should be squashed with 3/5 instead of that one undoing the introduction 
of lock-unlock-lock-unlock.

For what the main topic is concerned, I really like the removal of all 
the rcu_dereference_check(, true) lines and the memory barriers.

But I also think the commit message should explain better what code 
paths are now taking an extra lock - under which circumstances is the 
lock now taken for all scheduler users, and which amdgpu paths use 
drm_sched_entity_error() a lot so could be affected. I doubt it creates 
a measurable performance impact but it needs to be explained.

I am also happy to give it a spin on the Steam Deck to see if I can 
observe anything.

> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 50 ++++++++++--------------
>   include/drm/gpu_scheduler.h              |  9 ++---
>   2 files changed, 25 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index c51101ec70c1..91aec20611ad 100644
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
> @@ -287,9 +286,10 @@ void drm_sched_entity_kill(struct drm_sched_entity *entity)
>   	/* Make sure this entity is not used by the scheduler at the moment */
>   	wait_for_completion(&entity->entity_idle);
>   
> -	/* The entity is guaranteed to not be used by the scheduler */
> -	prev = rcu_dereference_check(entity->last_scheduled, true);
> +	spin_lock(&entity->lock);
> +	prev = entity->last_scheduled;
>   	dma_fence_get(prev);
> +	spin_unlock(&entity->lock);
>   	while ((job = drm_sched_entity_queue_pop(entity))) {
>   		struct drm_sched_fence *s_fence = job->s_fence;
>   
> @@ -381,8 +381,7 @@ void drm_sched_entity_fini(struct drm_sched_entity *entity)
>   		entity->dependency = NULL;
>   	}
>   
> -	dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
> -	RCU_INIT_POINTER(entity->last_scheduled, NULL);
> +	dma_fence_put(entity->last_scheduled);
>   	drm_sched_entity_stats_put(entity->stats);
>   }
>   EXPORT_SYMBOL(drm_sched_entity_fini);
> @@ -507,6 +506,10 @@ drm_sched_job_dependency(struct drm_sched_job *job,
>   
>   struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>   {
> +	/* Helper to avoid dropping the reference while the entity lock is held,
> +	 * just to have some more robustness.
> +	 */

I don't get this comment. Neither the placement or the content.

Regards,

Tvrtko

> +	struct dma_fence *prev_last_scheduled;
>   	struct drm_sched_job *sched_job;
>   
>   	sched_job = drm_sched_entity_queue_peek(entity);
> @@ -523,19 +526,14 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>   	if (entity->guilty && atomic_read(entity->guilty))
>   		dma_fence_set_error(&sched_job->s_fence->finished, -ECANCELED);
>   
> -	dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
> -	rcu_assign_pointer(entity->last_scheduled,
> -			   dma_fence_get(&sched_job->s_fence->finished));
> -
> -	/*
> -	 * If the queue is empty we allow drm_sched_entity_select_rq() to
> -	 * locklessly access ->last_scheduled. This only works if we set the
> -	 * pointer before we dequeue and if we a write barrier here.
> -	 */
> -	smp_wmb();
> +	spin_lock(&entity->lock);
> +	prev_last_scheduled = entity->last_scheduled;
> +	entity->last_scheduled = dma_fence_get(&sched_job->s_fence->finished);
> +	spin_unlock(&entity->lock);
>   
>   	spsc_queue_pop(&entity->job_queue);
>   
> +	dma_fence_put(prev_last_scheduled);
>   	drm_sched_rq_pop_entity(entity);
>   
>   	/* Jobs and entities might have different lifecycles. Since we're
> @@ -561,21 +559,15 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
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


