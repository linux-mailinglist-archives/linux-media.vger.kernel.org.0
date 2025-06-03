Return-Path: <linux-media+bounces-33982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1AFACC323
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 11:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 529063A5AD1
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 09:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2680028314B;
	Tue,  3 Jun 2025 09:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sDzoBpzU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836E91F583D;
	Tue,  3 Jun 2025 09:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748943124; cv=none; b=QZhvA/ESs5GZhiAwEZuOujxDO9/o8ZJ+1+8ZghoXVMJDoLyDvs4oKz9eSJaIiw/fGoB5kdXJqnc4oEMR1bQjxXwgweKJiBBerGRv/wrNV2wa7e5NcGudErK1HtYsBtKnLHVi6DhohgdKPapxxIlwpHsd4zBnDcWh8E3NTlGUKcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748943124; c=relaxed/simple;
	bh=zZqb+juyV2Gb8VcSm5wm2p8p57d1rLPa6J1u4dkRt3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JMQYoCT7qnMYWdq18v7N0oSSQb+bzKrZlwrmKdbO52/T+9EFQrX6fxOgJjecT8tcayDkUzSxVRxmQBkrJGouWaCtTuKmQ6xDfXSxMvrl5smcZERlbAIZXStsB6IZBc0J0FMe13Ems/TKrLYKXS+38Q4V1VI0Bz4TbYj6I1fE1ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sDzoBpzU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5EF8C4CEED;
	Tue,  3 Jun 2025 09:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748943124;
	bh=zZqb+juyV2Gb8VcSm5wm2p8p57d1rLPa6J1u4dkRt3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sDzoBpzUr0Och6Hfve0Eha+YAJ5WqhwF2eHHKBjosT4vk1+xNjwsr5HcSX9/zZN2U
	 5W87v778jw8CJz6E/gdk64LMwPFAiWJonm1KPdiPU8zwwnpdlXSMY0MrlY9ckxQV+F
	 U6s3uGFP5iJi5l8S5skpU/Xx+T3jz3qznBoJzjvdjEi3YwEG+2m/xoUzsMb5cIVw2E
	 cBmm07dABGQb3r7009ke5g2bKGgnK2YdyvUaDEaVMnT2TfS7/izQB+17OOrWGnl/Qt
	 hUcqVOWiSVZslmViQAlrduamQ5MHLEJR5VfxAZA2dOGeJ+1/iBgRlAnesJH0Ee3uXj
	 VpxleU3v7n+DQ==
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
Subject: [RFC PATCH 2/6] drm/sched/tests: Implement cancel_job()
Date: Tue,  3 Jun 2025 11:31:27 +0200
Message-ID: <20250603093130.100159-4-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603093130.100159-2-phasta@kernel.org>
References: <20250603093130.100159-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPU scheduler now provides a new callback to prevent memory leaks on
scheduler teardown. The callback is optional, but should be implemented
since it simplifies the cleanup code path.

Moreover, the unit tests serve as a resource for understanding the
canonical usage of the scheduler API and should therefore support the
callback.

Provide the backend_ops callback cancel_job() in the unit tests.

This code is WIP and still buggy. Take it more as an RFC. It seems that
it interferes negatively with timeout handling, which is broken in the
sense of the timeout handler not signaling the hardware fence.

That should be repaired and cleaned up, but it's probably better to do
that in a separate series.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 .../gpu/drm/scheduler/tests/mock_scheduler.c  | 71 +++++++------------
 drivers/gpu/drm/scheduler/tests/sched_tests.h |  4 +-
 2 files changed, 25 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
index 7f947ab9d322..33864b179704 100644
--- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
@@ -55,7 +55,7 @@ void drm_mock_sched_entity_free(struct drm_mock_sched_entity *entity)
 	drm_sched_entity_destroy(&entity->base);
 }
 
-static void drm_mock_sched_job_complete(struct drm_mock_sched_job *job)
+static void drm_mock_sched_job_complete(struct drm_mock_sched_job *job, int err)
 {
 	struct drm_mock_scheduler *sched =
 		drm_sched_to_mock_sched(job->base.sched);
@@ -63,8 +63,11 @@ static void drm_mock_sched_job_complete(struct drm_mock_sched_job *job)
 	lockdep_assert_held(&sched->lock);
 
 	job->flags |= DRM_MOCK_SCHED_JOB_DONE;
-	list_move_tail(&job->link, &sched->done_list);
-	dma_fence_signal_locked(&job->hw_fence);
+	list_del(&job->link);
+	if (!dma_fence_is_signaled(&job->hw_fence)) {
+		dma_fence_set_error(&job->hw_fence, err);
+		dma_fence_signal(&job->hw_fence);
+	}
 	complete(&job->done);
 }
 
@@ -89,7 +92,7 @@ drm_mock_sched_job_signal_timer(struct hrtimer *hrtimer)
 			break;
 
 		sched->hw_timeline.cur_seqno = job->hw_fence.seqno;
-		drm_mock_sched_job_complete(job);
+		drm_mock_sched_job_complete(job, 0);
 	}
 	spin_unlock_irqrestore(&sched->lock, flags);
 
@@ -212,26 +215,33 @@ mock_sched_timedout_job(struct drm_sched_job *sched_job)
 
 static void mock_sched_free_job(struct drm_sched_job *sched_job)
 {
-	struct drm_mock_scheduler *sched =
-			drm_sched_to_mock_sched(sched_job->sched);
 	struct drm_mock_sched_job *job = drm_sched_job_to_mock_job(sched_job);
-	unsigned long flags;
 
-	/* Remove from the scheduler done list. */
-	spin_lock_irqsave(&sched->lock, flags);
-	list_del(&job->link);
-	spin_unlock_irqrestore(&sched->lock, flags);
 	dma_fence_put(&job->hw_fence);
-
 	drm_sched_job_cleanup(sched_job);
 
 	/* Mock job itself is freed by the kunit framework. */
 }
 
+static void mock_sched_cancel_job(struct drm_sched_job *sched_job)
+{
+	struct drm_mock_scheduler *sched =
+		drm_sched_to_mock_sched(sched_job->sched);
+	struct drm_mock_sched_job *job = drm_sched_job_to_mock_job(sched_job);
+
+	hrtimer_cancel(&job->timer);
+
+	spin_lock_irq(&sched->lock);
+	if (!dma_fence_is_signaled(&job->hw_fence))
+		drm_mock_sched_job_complete(job, -ECANCELED);
+	spin_unlock_irq(&sched->lock);
+}
+
 static const struct drm_sched_backend_ops drm_mock_scheduler_ops = {
 	.run_job = mock_sched_run_job,
 	.timedout_job = mock_sched_timedout_job,
-	.free_job = mock_sched_free_job
+	.free_job = mock_sched_free_job,
+	.cancel_job = mock_sched_cancel_job,
 };
 
 /**
@@ -265,7 +275,6 @@ struct drm_mock_scheduler *drm_mock_sched_new(struct kunit *test, long timeout)
 	sched->hw_timeline.context = dma_fence_context_alloc(1);
 	atomic_set(&sched->hw_timeline.next_seqno, 0);
 	INIT_LIST_HEAD(&sched->job_list);
-	INIT_LIST_HEAD(&sched->done_list);
 	spin_lock_init(&sched->lock);
 
 	return sched;
@@ -280,38 +289,6 @@ struct drm_mock_scheduler *drm_mock_sched_new(struct kunit *test, long timeout)
  */
 void drm_mock_sched_fini(struct drm_mock_scheduler *sched)
 {
-	struct drm_mock_sched_job *job, *next;
-	unsigned long flags;
-	LIST_HEAD(list);
-
-	drm_sched_wqueue_stop(&sched->base);
-
-	/* Force complete all unfinished jobs. */
-	spin_lock_irqsave(&sched->lock, flags);
-	list_for_each_entry_safe(job, next, &sched->job_list, link)
-		list_move_tail(&job->link, &list);
-	spin_unlock_irqrestore(&sched->lock, flags);
-
-	list_for_each_entry(job, &list, link)
-		hrtimer_cancel(&job->timer);
-
-	spin_lock_irqsave(&sched->lock, flags);
-	list_for_each_entry_safe(job, next, &list, link)
-		drm_mock_sched_job_complete(job);
-	spin_unlock_irqrestore(&sched->lock, flags);
-
-	/*
-	 * Free completed jobs and jobs not yet processed by the DRM scheduler
-	 * free worker.
-	 */
-	spin_lock_irqsave(&sched->lock, flags);
-	list_for_each_entry_safe(job, next, &sched->done_list, link)
-		list_move_tail(&job->link, &list);
-	spin_unlock_irqrestore(&sched->lock, flags);
-
-	list_for_each_entry_safe(job, next, &list, link)
-		mock_sched_free_job(&job->base);
-
 	drm_sched_fini(&sched->base);
 }
 
@@ -346,7 +323,7 @@ unsigned int drm_mock_sched_advance(struct drm_mock_scheduler *sched,
 		if (sched->hw_timeline.cur_seqno < job->hw_fence.seqno)
 			break;
 
-		drm_mock_sched_job_complete(job);
+		drm_mock_sched_job_complete(job, 0);
 		found++;
 	}
 unlock:
diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h b/drivers/gpu/drm/scheduler/tests/sched_tests.h
index fbba38137f0c..a905db835ccc 100644
--- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
+++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
@@ -32,9 +32,8 @@
  *
  * @base: DRM scheduler base class
  * @test: Backpointer to owning the kunit test case
- * @lock: Lock to protect the simulated @hw_timeline, @job_list and @done_list
+ * @lock: Lock to protect the simulated @hw_timeline, @job_list
  * @job_list: List of jobs submitted to the mock GPU
- * @done_list: List of jobs completed by the mock GPU
  * @hw_timeline: Simulated hardware timeline has a @context, @next_seqno and
  *		 @cur_seqno for implementing a struct dma_fence signaling the
  *		 simulated job completion.
@@ -49,7 +48,6 @@ struct drm_mock_scheduler {
 
 	spinlock_t		lock;
 	struct list_head	job_list;
-	struct list_head	done_list;
 
 	struct {
 		u64		context;
-- 
2.49.0


