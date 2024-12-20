Return-Path: <linux-media+bounces-23878-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7419F927A
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 13:46:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 980F37A3D37
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 12:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB4C215711;
	Fri, 20 Dec 2024 12:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SM14lkqI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FC62156F8;
	Fri, 20 Dec 2024 12:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734698756; cv=none; b=HmVr0+maLUi52/lZzVpV4KCJONMIxA2npPR+8xiX/2UIofeWWVU/USMQAu1jQ2Tv2DjmC25F93DCWIWJklqXaQ4L0J52MnQamxmeCVbzb20fmcf0OKDWhrls13goyBTkoQk88YSg4HhcsjVvY9RI/WseD+OJgWcGXZSubP85WzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734698756; c=relaxed/simple;
	bh=q7SkEis4X+AWryWH7Mo8gvMzBPeGVPLaalDUADo+4sE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L93E04PRgA0L2HZa7VHTIOiifzv49O3Qq62z9gDNZZb7hN1qGwmp2wnMNt2bMBj+IYJD8r9MjulMpJLygkA7KfuB6NK2NrBqg4U8N4snKNaQUAdV6kOQJ24Sbh3cxZBVsJN6XBNIFlp6h42SGhoo7RuUQlDUhVCXrYT9zrbgc0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SM14lkqI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F55C4CECD;
	Fri, 20 Dec 2024 12:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734698756;
	bh=q7SkEis4X+AWryWH7Mo8gvMzBPeGVPLaalDUADo+4sE=;
	h=From:To:Cc:Subject:Date:From;
	b=SM14lkqIzCC02/T6wOxDWm7AnkeF5T3JlzoUXWeszLE4kj0IE+GDP54u4WQ+07AxB
	 10oQiZ2cshXL5lj198mHrDLHaLGoFkqixe7WcStPj6vXmAMmk4KCmOUiFr5ItQQupC
	 seyKISuNDQWcBuCAMj6yRwC6QyrVWSiHmml1Bbb501uaiLaGLaWucMoNzDV+Kr1q6T
	 XFAh1r7ExrTp4wnE/83wcCu53sORlY2TZW7BLKI7NOiZqJCTM00IMyDDqlaLtMzKB/
	 ZVU3Rb+lHXuJArVAl7jAavZ7oLUnKk1LrQGPD2eg/OlxvCh1De3VdeTwN3ISzUaCMh
	 jgPqsdK7RTksg==
From: Philipp Stanner <phasta@kernel.org>
To: Luben Tuikov <ltuikov89@gmail.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <pstanner@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: [PATCH] drm/sched: Document run_job() refcount hazard
Date: Fri, 20 Dec 2024 13:45:15 +0100
Message-ID: <20241220124515.93169-2-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Philipp Stanner <pstanner@redhat.com>

drm_sched_backend_ops.run_job() returns a dma_fence for the scheduler.
That fence is signalled by the driver once the hardware completed the
associated job. The scheduler does not increment the reference count on
that fence, but implicitly expects to inherit this fence from run_job().

This is relatively subtle and prone to misunderstandings.

This implies that, to keep a reference for itself, a driver needs to
call dma_fence_get() in addition to dma_fence_init() in that callback.

It's further complicated by the fact that the scheduler even decrements
the refcount in drm_sched_run_job_work() since it created a new
reference in drm_sched_fence_scheduled(). It does, however, still use
its pointer to the fence after calling dma_fence_put() - which is safe
because of the aforementioned new reference, but actually still violates
the refcounting rules.

Improve the explanatory comment for that decrement.

Move the call to dma_fence_put() to the position behind the last usage
of the fence.

Document the necessity to increment the reference count in
drm_sched_backend_ops.run_job().

Cc: Christian König <christian.koenig@amd.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 10 +++++++---
 include/drm/gpu_scheduler.h            | 20 ++++++++++++++++----
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7ce25281c74c..d6f8df39d848 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1218,15 +1218,19 @@ static void drm_sched_run_job_work(struct work_struct *w)
 	drm_sched_fence_scheduled(s_fence, fence);
 
 	if (!IS_ERR_OR_NULL(fence)) {
-		/* Drop for original kref_init of the fence */
-		dma_fence_put(fence);
-
 		r = dma_fence_add_callback(fence, &sched_job->cb,
 					   drm_sched_job_done_cb);
 		if (r == -ENOENT)
 			drm_sched_job_done(sched_job, fence->error);
 		else if (r)
 			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
+
+		/*
+		 * s_fence took a new reference to fence in the call to
+		 * drm_sched_fence_scheduled() above. The reference passed by
+		 * run_job() above is now not needed any longer. Drop it.
+		 */
+		dma_fence_put(fence);
 	} else {
 		drm_sched_job_done(sched_job, IS_ERR(fence) ?
 				   PTR_ERR(fence) : 0);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 95e17504e46a..a1f5c9a14278 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -420,10 +420,22 @@ struct drm_sched_backend_ops {
 					 struct drm_sched_entity *s_entity);
 
 	/**
-         * @run_job: Called to execute the job once all of the dependencies
-         * have been resolved.  This may be called multiple times, if
-	 * timedout_job() has happened and drm_sched_job_recovery()
-	 * decides to try it again.
+	 * @run_job: Called to execute the job once all of the dependencies
+	 * have been resolved. This may be called multiple times, if
+	 * timedout_job() has happened and drm_sched_job_recovery() decides to
+	 * try it again.
+	 *
+	 * @sched_job: the job to run
+	 *
+	 * Returns: dma_fence the driver must signal once the hardware has
+	 *	completed the job ("hardware fence").
+	 *
+	 * Note that the scheduler expects to 'inherit' its own reference to
+	 * this fence from the callback. It does not invoke an extra
+	 * dma_fence_get() on it. Consequently, this callback must return a
+	 * fence whose refcount is at least 2: One for the scheduler's
+	 * reference returned here, another one for the reference kept by the
+	 * driver.
 	 */
 	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
 
-- 
2.47.1


