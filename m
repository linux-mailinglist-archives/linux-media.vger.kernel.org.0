Return-Path: <linux-media+bounces-36432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 310B4AEFA6E
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 15:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 791B7446118
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 13:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6530E2777E1;
	Tue,  1 Jul 2025 13:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sPgwB8zo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D27277030;
	Tue,  1 Jul 2025 13:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376150; cv=none; b=cxmE5GTL4XlTUlvJQlHVAM7XLhqBFPstgpT0ZORVPTiG/EGhCI2+swOzSvCUA75HjqWJoj1USmouOidKvegIoSXBvxoNvncbg1KhhLUGrjSUA/O6f5g6DX0OVyuOVlOlTRT9rzF3j/Z0YkNWV2KC4TDBE97+AbkcrU2mOpx7nFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376150; c=relaxed/simple;
	bh=Sgl1fbx3s/Q+rdymOYlAFyb0iIci+VpWW4JgdhHhMxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=strxDZhHr32P803x7+x711oUQY70bpM3Z/QXHf/ShQsfinmAxcFu1NX8uFGo9kbtXm2x8m2F4Ls2EWPHF0IZmCw6jkSzwo2RAZ1Ht3hPs5Gw5LxL9XAJhBlLPh87S4sR3EI3QGdjpUsOAhYHnuQ0X5NCMdcH1CR/Vbv1f8B40Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sPgwB8zo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94B1AC4CEEB;
	Tue,  1 Jul 2025 13:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751376150;
	bh=Sgl1fbx3s/Q+rdymOYlAFyb0iIci+VpWW4JgdhHhMxs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sPgwB8zoH1cvmufw3QZQIQrINssDLYebXKpVTJH3dZNbCoO9tikWTg8YjFQgg6SNs
	 hlOUbG8QDHT5UphUblWmTiuiGwnwojU9fW3jik1b1MHnFiRllsVS3kAQ0lbcW7GMTh
	 rK3FMQRkGnHRqSa9Zx59oLIK8jOxDtLh9qSqtcSJmGcaObHCpS37Eck2O5MeBbJ205
	 llavq9GtUR+RIyxVfZA+2jcp0KQD87Xiq1W6bYsVcYA3+FnAGpsCQciGubpMvTrr73
	 p4PJ7fHKAS3+ToJBE/h78CcdpYBwNbVwXIiHveEKKluRaavatc0irwZJuua6sUwiBl
	 ez1j4FX7mz90w==
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
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/6] drm/sched/tests: Port to cancel_job()
Date: Tue,  1 Jul 2025 15:21:40 +0200
Message-ID: <20250701132142.76899-5-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701132142.76899-3-phasta@kernel.org>
References: <20250701132142.76899-3-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPU Scheduler now supports a new callback, cancel_job(), which lets
the scheduler cancel all jobs which might not yet be freed when
drm_sched_fini() runs. Using this callback allows for significantly
simplifying the mock scheduler teardown code.

Implement the cancel_job() callback and adjust the code where necessary.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 .../gpu/drm/scheduler/tests/mock_scheduler.c  | 66 +++++++------------
 1 file changed, 23 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
index 49d067fecd67..2d3169d95200 100644
--- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
@@ -63,7 +63,7 @@ static void drm_mock_sched_job_complete(struct drm_mock_sched_job *job)
 	lockdep_assert_held(&sched->lock);
 
 	job->flags |= DRM_MOCK_SCHED_JOB_DONE;
-	list_move_tail(&job->link, &sched->done_list);
+	list_del(&job->link);
 	dma_fence_signal_locked(&job->hw_fence);
 	complete(&job->done);
 }
@@ -236,26 +236,39 @@ mock_sched_timedout_job(struct drm_sched_job *sched_job)
 
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
+	struct drm_mock_scheduler *sched = drm_sched_to_mock_sched(sched_job->sched);
+	struct drm_mock_sched_job *job = drm_sched_job_to_mock_job(sched_job);
+	unsigned long flags;
+
+	hrtimer_cancel(&job->timer);
+
+	spin_lock_irqsave(&sched->lock, flags);
+	if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
+		list_del(&job->link);
+		dma_fence_set_error(&job->hw_fence, -ECANCELED);
+		dma_fence_signal_locked(&job->hw_fence);
+	}
+	spin_unlock_irqrestore(&sched->lock, flags);
+
+	/* The GPU Scheduler will call drm_sched_backend_ops.free_job(), still.
+	 * Mock job itself is freed by the kunit framework. */
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
@@ -289,7 +302,6 @@ struct drm_mock_scheduler *drm_mock_sched_new(struct kunit *test, long timeout)
 	sched->hw_timeline.context = dma_fence_context_alloc(1);
 	atomic_set(&sched->hw_timeline.next_seqno, 0);
 	INIT_LIST_HEAD(&sched->job_list);
-	INIT_LIST_HEAD(&sched->done_list);
 	spin_lock_init(&sched->lock);
 
 	return sched;
@@ -304,38 +316,6 @@ struct drm_mock_scheduler *drm_mock_sched_new(struct kunit *test, long timeout)
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
 
-- 
2.49.0


