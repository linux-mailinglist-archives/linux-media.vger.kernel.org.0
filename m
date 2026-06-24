Return-Path: <linux-media+bounces-65558-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I9zPAhnSO2rtdggAu9opvQ
	(envelope-from <linux-media+bounces-65558-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:48:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B9A6BE431
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:48:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZX54rOT8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65558-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65558-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FEE230238D2
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302BC3AFAE7;
	Wed, 24 Jun 2026 12:48:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC9C272801;
	Wed, 24 Jun 2026 12:48:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782305292; cv=none; b=Rz15lswwPVrzqA9T81ZxqYRO4e/hqVmYKubopdOVlxy6txWORyWyKIbHmqmW5O9qnnf9RqTpQez6p/8i7zD4cJpxfm8Fd8Kj47rK/bTd1CZk0gXTVXbY6b3qCtvtkvOh9rqIvQrJyD9x4YWRbPXyQVLpJI3lSu/kl5swIn5z+1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782305292; c=relaxed/simple;
	bh=6k5yhkMmuAmAGFMZ+OWJkrw1oL/X/IDtgfeeBmxcEU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NpzJ5XuzBY6Qyi2HtFFQprMn8nu2z/Gc37to/YMTZ7DQpePUlRiWNtbLF3ZlbMbKbfYvXqvyVEbXVl6hTx9V0Jo2H7RfrgsSL0S0vUUs5LL0h69bOV4MlsXBIZB6chtA4/O6p+H6TiNM03Mqsw+AcRJnKNA2KSO2Sns8nMHDY7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZX54rOT8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4781F000E9;
	Wed, 24 Jun 2026 12:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782305291;
	bh=Ng1Fu3iV0uz9YEcwWiFwkJYNZd8hGnnPbM07z97sbwo=;
	h=From:To:Cc:Subject:Date;
	b=ZX54rOT8atVKo9c5J5Q15q+IKKKVwuwOAOGRokO4ofI/WuoKd72gRCTsPOvf5zci2
	 //oqV9U2MF3u/G3XPHNINLdLiVixEx439C76qRXAYLvHmueaLiMxF4lxxzn6JAKf3+
	 LvpathzUcS34ylGPqUKEfk9Y4syniWEVl+mxOH4aQle7szgvX1mxc84bXFX+wKu1BA
	 ltRdCHseUDfQXFwKhEdsJFm80fufqplh1zG53YJuxXLMFKhxICPR0gSzcfcvCw3sAV
	 WIjhxLATJNoPMqtchCNfn74S/Fy1qR9p9N1phCS2Iw5E3KLnkBfMC6aLNQnWsD9kyH
	 8HE6pfIPLg2Rg==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH] drm/sched: Protect entity->last_scheduled with spinlock
Date: Wed, 24 Jun 2026 14:46:52 +0200
Message-ID: <20260624124651.1414814-2-phasta@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[intel.com,kernel.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,linaro.org];
	FORGED_SENDER(0.00)[phasta@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:matthew.brost@intel.com,m:dakr@kernel.org,m:phasta@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65558-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53B9A6BE431

The entity->last_scheduled field has always been set and read with
special RCU functions in addition to memory barriers. There is no
obvious reason for that, since the entity lock is available and taken at all
places that evaluate the last_scheduled field. The only exception is
drm_sched_entity_error(), which is not performance critical in any way.

Improve robustness, readability and maintainability by replacing RCU and
barriers with the lock.

As a preparational step, while at it, also guard spsc_queue_pop() with
the lock, since spsc_queue is deprecated and supposed to be replaced
with a locked list.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Tested with drm_sched unit tests, which all ran fine.
---
 drivers/gpu/drm/scheduler/sched_entity.c | 49 +++++++++++-------------
 include/drm/gpu_scheduler.h              |  9 ++---
 2 files changed, 26 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index c51101ec70c1..95b2c48a604a 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -135,7 +135,6 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	entity->num_sched_list = num_sched_list;
 	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
 	entity->rq = &sched_list[0]->rq;
-	RCU_INIT_POINTER(entity->last_scheduled, NULL);
 	RB_CLEAR_NODE(&entity->rb_tree_node);
 	init_completion(&entity->entity_idle);
 
@@ -201,10 +200,10 @@ int drm_sched_entity_error(struct drm_sched_entity *entity)
 	struct dma_fence *fence;
 	int r;
 
-	rcu_read_lock();
-	fence = rcu_dereference(entity->last_scheduled);
+	spin_lock(&entity->lock);
+	fence = entity->last_scheduled;
 	r = fence ? fence->error : 0;
-	rcu_read_unlock();
+	spin_unlock(&entity->lock);
 
 	return r;
 }
@@ -288,8 +287,10 @@ void drm_sched_entity_kill(struct drm_sched_entity *entity)
 	wait_for_completion(&entity->entity_idle);
 
 	/* The entity is guaranteed to not be used by the scheduler */
-	prev = rcu_dereference_check(entity->last_scheduled, true);
+	spin_lock(&entity->lock);
+	prev = entity->last_scheduled;
 	dma_fence_get(prev);
+	spin_unlock(&entity->lock);
 	while ((job = drm_sched_entity_queue_pop(entity))) {
 		struct drm_sched_fence *s_fence = job->s_fence;
 
@@ -381,8 +382,8 @@ void drm_sched_entity_fini(struct drm_sched_entity *entity)
 		entity->dependency = NULL;
 	}
 
-	dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
-	RCU_INIT_POINTER(entity->last_scheduled, NULL);
+	dma_fence_put(entity->last_scheduled);
+	WRITE_ONCE(entity->last_scheduled, NULL);
 	drm_sched_entity_stats_put(entity->stats);
 }
 EXPORT_SYMBOL(drm_sched_entity_fini);
@@ -523,18 +524,18 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	if (entity->guilty && atomic_read(entity->guilty))
 		dma_fence_set_error(&sched_job->s_fence->finished, -ECANCELED);
 
-	dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
-	rcu_assign_pointer(entity->last_scheduled,
-			   dma_fence_get(&sched_job->s_fence->finished));
+	spin_lock(&entity->lock);
+	dma_fence_put(entity->last_scheduled);
+	entity->last_scheduled = dma_fence_get(&sched_job->s_fence->finished);
 
-	/*
-	 * If the queue is empty we allow drm_sched_entity_select_rq() to
-	 * locklessly access ->last_scheduled. This only works if we set the
-	 * pointer before we dequeue and if we a write barrier here.
+	/* A recent rework required taking the spinlock above. Since spsc_queue
+	 * is scheduled for removal as per the DRM-TODO-list, we access it here
+	 * locked already to prepare for that cleanup.
+	 *
+	 * TODO: Fully replace spsc_queue with a locked (h)list.
 	 */
-	smp_wmb();
-
 	spsc_queue_pop(&entity->job_queue);
+	spin_unlock(&entity->lock);
 
 	drm_sched_rq_pop_entity(entity);
 
@@ -561,21 +562,15 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 	if (spsc_queue_count(&entity->job_queue))
 		return;
 
-	/*
-	 * Only when the queue is empty are we guaranteed that
-	 * drm_sched_run_job_work() cannot change entity->last_scheduled. To
-	 * enforce ordering we need a read barrier here. See
-	 * drm_sched_entity_pop_job() for the other side.
-	 */
-	smp_rmb();
-
-	fence = rcu_dereference_check(entity->last_scheduled, true);
+	spin_lock(&entity->lock);
+	fence = entity->last_scheduled;
 
 	/* stay on the same engine if the previous job hasn't finished */
-	if (fence && !dma_fence_is_signaled(fence))
+	if (fence && !dma_fence_is_signaled(fence)) {
+		spin_unlock(&entity->lock);
 		return;
+	}
 
-	spin_lock(&entity->lock);
 	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
 	rq = sched ? &sched->rq : NULL;
 	if (rq != entity->rq) {
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index d61c19e78182..176ff1f936cd 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -100,7 +100,8 @@ struct drm_sched_entity {
 	 * @lock:
 	 *
 	 * Lock protecting the run-queue (@rq) to which this entity belongs,
-	 * @priority and the list of schedulers (@sched_list, @num_sched_list).
+	 * @priority, @last_scheduled and the list of schedulers (@sched_list,
+	 * @num_sched_list).
 	 */
 	spinlock_t			lock;
 
@@ -202,11 +203,9 @@ struct drm_sched_entity {
 	/**
 	 * @last_scheduled:
 	 *
-	 * Points to the finished fence of the last scheduled job. Only written
-	 * by drm_sched_entity_pop_job(). Can be accessed locklessly from
-	 * drm_sched_job_arm() if the queue is empty.
+	 * Points to the finished fence of the last scheduled job.
 	 */
-	struct dma_fence __rcu		*last_scheduled;
+	struct dma_fence		*last_scheduled;
 
 	/**
 	 * @last_user: last group leader pushing a job into the entity.

base-commit: 60b5fa6edfef867322fce7c8306e5c4b46211be7
-- 
2.54.0


