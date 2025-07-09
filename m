Return-Path: <linux-media+bounces-37199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE87AFE864
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 13:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F4CD17E234
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 11:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFFA2E0B7C;
	Wed,  9 Jul 2025 11:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EvGQiVMN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37C52E11B6;
	Wed,  9 Jul 2025 11:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752062033; cv=none; b=DoEdhNlsc6vS6WeZ+JaIz/J7T9GnFrDD1eSUdSx5ovgbz0Vl024g+fQEzyA9keyar2DAH/9HnMAlojCvJ1kKYTrK3VG6Dvs/8GS4GAR4lUQhm8Tp/Z3a2FSNvOMLUZV+Vx9pRzwOyiO7yReWxTiBVw/BuYbNBCJqnHmfplDTVfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752062033; c=relaxed/simple;
	bh=jwQeQF43fuuFdeU+odOP0p6i6/kacIOeRK9joESZCeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ChIVQa0PlMm8FX2MEW7eZZk3G+V0seUsmmyT+tk8x3LDyKVR6YOTA0OQY7aXjIgX0GtTenovfQGvgIOR7CDuEjzflpzO+tmOMdUz/VCGWCkBYnTzSukYSShG1c4KcX0lYs5AL+tVB2mLgQPJ601GIZkI8CFDJYhQI/43lAAus0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EvGQiVMN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72262C4CEF4;
	Wed,  9 Jul 2025 11:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752062033;
	bh=jwQeQF43fuuFdeU+odOP0p6i6/kacIOeRK9joESZCeg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EvGQiVMN8p5LGtSsPCloupb/qx9E6+SH7L0wcNxwuawdlWf3Hm46+of8DVTDB66UB
	 kbjNzc9+wocjSiKGGT0ayFoZZEAZaiTZjXbXHGsG/G9neFX/2UsU/bh34wnBb14xX/
	 CvZ15mUx4sOy2UbzEfvTT6BeNH5UYSZpOpm42eQaE1mSKm0uUKeCt51fkQ3y33EKoG
	 ES37guYQBzUOXe6JFpBrnl8i02P5/92fNcXewMTmg5Ikjs8o6VxCXweMlYxyZ1Qf4Q
	 jD/gv6HzLABKr8POaH0Ig8/izqDUMrjufRpqndGH7f5ICiyO7y6Izt9Tx43/rh4a2M
	 KjZEofwBWQSig==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 7/7] drm/nouveau: Remove waitque for sched teardown
Date: Wed,  9 Jul 2025 13:52:57 +0200
Message-ID: <20250709115257.106370-9-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709115257.106370-2-phasta@kernel.org>
References: <20250709115257.106370-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct nouveau_sched contains a waitque needed to prevent
drm_sched_fini() from being called while there are still jobs pending.
Doing so so far would have caused memory leaks.

With the new memleak-free mode of operation switched on in
drm_sched_fini() by providing the callback nouveau_sched_cancel_job()
the waitque is not necessary anymore.

Remove the waitque.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_sched.c | 20 +++++++-------------
 drivers/gpu/drm/nouveau/nouveau_sched.h |  9 +++------
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  8 ++++----
 3 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 2ec62059c351..7d9c3418e76b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -122,11 +122,9 @@ nouveau_job_done(struct nouveau_job *job)
 {
 	struct nouveau_sched *sched = job->sched;
 
-	spin_lock(&sched->job.list.lock);
+	spin_lock(&sched->job_list.lock);
 	list_del(&job->entry);
-	spin_unlock(&sched->job.list.lock);
-
-	wake_up(&sched->job.wq);
+	spin_unlock(&sched->job_list.lock);
 }
 
 void
@@ -307,9 +305,9 @@ nouveau_job_submit(struct nouveau_job *job)
 	}
 
 	/* Submit was successful; add the job to the schedulers job list. */
-	spin_lock(&sched->job.list.lock);
-	list_add(&job->entry, &sched->job.list.head);
-	spin_unlock(&sched->job.list.lock);
+	spin_lock(&sched->job_list.lock);
+	list_add(&job->entry, &sched->job_list.head);
+	spin_unlock(&sched->job_list.lock);
 
 	drm_sched_job_arm(&job->base);
 	job->done_fence = dma_fence_get(&job->base.s_fence->finished);
@@ -460,9 +458,8 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 		goto fail_sched;
 
 	mutex_init(&sched->mutex);
-	spin_lock_init(&sched->job.list.lock);
-	INIT_LIST_HEAD(&sched->job.list.head);
-	init_waitqueue_head(&sched->job.wq);
+	spin_lock_init(&sched->job_list.lock);
+	INIT_LIST_HEAD(&sched->job_list.head);
 
 	return 0;
 
@@ -502,9 +499,6 @@ nouveau_sched_fini(struct nouveau_sched *sched)
 	struct drm_gpu_scheduler *drm_sched = &sched->base;
 	struct drm_sched_entity *entity = &sched->entity;
 
-	rmb(); /* for list_empty to work without lock */
-	wait_event(sched->job.wq, list_empty(&sched->job.list.head));
-
 	drm_sched_entity_fini(entity);
 	drm_sched_fini(drm_sched);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
index 20cd1da8db73..b98c3f0bef30 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.h
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
@@ -103,12 +103,9 @@ struct nouveau_sched {
 	struct mutex mutex;
 
 	struct {
-		struct {
-			struct list_head head;
-			spinlock_t lock;
-		} list;
-		struct wait_queue_head wq;
-	} job;
+		struct list_head head;
+		spinlock_t lock;
+	} job_list;
 };
 
 int nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 48f105239f42..ddfc46bc1b3e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1019,8 +1019,8 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
 	u64 end = addr + range;
 
 again:
-	spin_lock(&sched->job.list.lock);
-	list_for_each_entry(__job, &sched->job.list.head, entry) {
+	spin_lock(&sched->job_list.lock);
+	list_for_each_entry(__job, &sched->job_list.head, entry) {
 		struct nouveau_uvmm_bind_job *bind_job = to_uvmm_bind_job(__job);
 
 		list_for_each_op(op, &bind_job->ops) {
@@ -1030,7 +1030,7 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
 
 				if (!(end <= op_addr || addr >= op_end)) {
 					nouveau_uvmm_bind_job_get(bind_job);
-					spin_unlock(&sched->job.list.lock);
+					spin_unlock(&sched->job_list.lock);
 					wait_for_completion(&bind_job->complete);
 					nouveau_uvmm_bind_job_put(bind_job);
 					goto again;
@@ -1038,7 +1038,7 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
 			}
 		}
 	}
-	spin_unlock(&sched->job.list.lock);
+	spin_unlock(&sched->job_list.lock);
 }
 
 static int
-- 
2.49.0


