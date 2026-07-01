Return-Path: <linux-media+bounces-66177-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Scq/KpbXRGqq1woAu9opvQ
	(envelope-from <linux-media+bounces-66177-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 11:02:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A04E6EB6A3
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 11:02:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="iXmK/8Is";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66177-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66177-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 59BBE306FD4E
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 08:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1FBD3EDE6C;
	Wed,  1 Jul 2026 08:59:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB4E3603E9;
	Wed,  1 Jul 2026 08:59:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896381; cv=none; b=Sqiciuyk7b0RxcooLbXBE9xSt/lQ/0COdrchgnqgc/xH68QFi0vzOXU/ULxlo6PXXCogSYWB57gRmrIggL/y9Csmr6+Z+JJaLrOZbBl08tdk+/AtgLRzMGeJWYXrUyuL7FbljPoG/2qSKTaZwqFIeAJnVgL2KG398P7fSgSEI54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896381; c=relaxed/simple;
	bh=mBvVi/8L/gOLwsb0MUCzm8UjR4UShdlM+HBCZizzqNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pqb8Y9ppbSMGAG7YxOEahrJy+pFXdEPiJphdA10DVOXh48oE4tfilrWhYRRrx7Gnk4wvs88sco3ehesRcSA1xQoHSyEv58b3dHGcJqP5GFR2ijJaKIOwqgQDtBjCAfDDgI7jBDY2g6LeCXEMkdFXiqKPqUjH85MDnEJECS+utvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXmK/8Is; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79A3D1F00A3A;
	Wed,  1 Jul 2026 08:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782896379;
	bh=H6zZJpMjMXNC/d6NQOehh7ReaCH7b9xFtZjCC9rrxf8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iXmK/8IsPu3VNPAyTOWukYCSn9euoofgEV11ziNWw/yYb/kOzbU0gbupyY/gzXITH
	 apzYmG0B8KMellb4qiPsZbxhczhz9IOzft8vjlzvKjs4IHIzZgZ7DqnkFew5r2/dZx
	 0wFKyfVUDGAjAK1azmDycN22Ir6huGJv/6Mg51UzckeVDLJYd56zF6DbCHeGHpEGey
	 fRrMnjHF3yd8RID6J+mWbbsK0jSIJW+wyex1rO5YaQoOvmlRrKQhEqoQZJcvs7LDV+
	 /j0vA+aej6RQ9sH/uf9v37C5DtgxVwWNNGYhlRylZ1bQE7mjiRWuFBaDbLlNi5FdrL
	 bSjCVJmcRM5+A==
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
	Sumit Semwal <sumit.semwal@linaro.org>,
	Marco Pagani <marco.pagani@linux.dev>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/5] drm/sched: Protect entity->last_scheduled with spinlock
Date: Wed,  1 Jul 2026 10:59:17 +0200
Message-ID: <20260701085920.3253248-3-phasta@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701085920.3253248-2-phasta@kernel.org>
References: <20260701085920.3253248-2-phasta@kernel.org>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-66177-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:matthew.brost@intel.com,m:dakr@kernel.org,m:phasta@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:marco.pagani@linux.dev,m:tvrtko.ursulin@igalia.com,m:boris.brezillon@collabora.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phasta@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,kernel.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,linaro.org,linux.dev,igalia.com,collabora.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RSPAMD_EMAILBL_FAIL(0.00)[linux-media@vger.kernel.org:query timed out];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A04E6EB6A3

The entity->last_scheduled field has always been set and read with
special RCU functions in addition to memory barriers.

This was added in

commit 70102d77ff22 ("drm/scheduler: add drm_sched_entity_error and use rcu for last_scheduled")

however, no proper justification for that mechanism was provided. There
seems to be no obvious reason, since the entity lock is available and
taken at all places that evaluate the last_scheduled field. The only
exception is drm_sched_entity_error(), which is not performance critical
in any way.

Improve robustness, readability and maintainability by replacing RCU and
barriers with the lock.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 50 ++++++++++--------------
 include/drm/gpu_scheduler.h              |  9 ++---
 2 files changed, 25 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index c51101ec70c1..91aec20611ad 100644
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
@@ -287,9 +286,10 @@ void drm_sched_entity_kill(struct drm_sched_entity *entity)
 	/* Make sure this entity is not used by the scheduler at the moment */
 	wait_for_completion(&entity->entity_idle);
 
-	/* The entity is guaranteed to not be used by the scheduler */
-	prev = rcu_dereference_check(entity->last_scheduled, true);
+	spin_lock(&entity->lock);
+	prev = entity->last_scheduled;
 	dma_fence_get(prev);
+	spin_unlock(&entity->lock);
 	while ((job = drm_sched_entity_queue_pop(entity))) {
 		struct drm_sched_fence *s_fence = job->s_fence;
 
@@ -381,8 +381,7 @@ void drm_sched_entity_fini(struct drm_sched_entity *entity)
 		entity->dependency = NULL;
 	}
 
-	dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
-	RCU_INIT_POINTER(entity->last_scheduled, NULL);
+	dma_fence_put(entity->last_scheduled);
 	drm_sched_entity_stats_put(entity->stats);
 }
 EXPORT_SYMBOL(drm_sched_entity_fini);
@@ -507,6 +506,10 @@ drm_sched_job_dependency(struct drm_sched_job *job,
 
 struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 {
+	/* Helper to avoid dropping the reference while the entity lock is held,
+	 * just to have some more robustness.
+	 */
+	struct dma_fence *prev_last_scheduled;
 	struct drm_sched_job *sched_job;
 
 	sched_job = drm_sched_entity_queue_peek(entity);
@@ -523,19 +526,14 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	if (entity->guilty && atomic_read(entity->guilty))
 		dma_fence_set_error(&sched_job->s_fence->finished, -ECANCELED);
 
-	dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
-	rcu_assign_pointer(entity->last_scheduled,
-			   dma_fence_get(&sched_job->s_fence->finished));
-
-	/*
-	 * If the queue is empty we allow drm_sched_entity_select_rq() to
-	 * locklessly access ->last_scheduled. This only works if we set the
-	 * pointer before we dequeue and if we a write barrier here.
-	 */
-	smp_wmb();
+	spin_lock(&entity->lock);
+	prev_last_scheduled = entity->last_scheduled;
+	entity->last_scheduled = dma_fence_get(&sched_job->s_fence->finished);
+	spin_unlock(&entity->lock);
 
 	spsc_queue_pop(&entity->job_queue);
 
+	dma_fence_put(prev_last_scheduled);
 	drm_sched_rq_pop_entity(entity);
 
 	/* Jobs and entities might have different lifecycles. Since we're
@@ -561,21 +559,15 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
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
-- 
2.54.0


