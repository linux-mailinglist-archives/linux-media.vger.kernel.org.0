Return-Path: <linux-media+bounces-25056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7819A180E7
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 16:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A72791889037
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 15:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77E21F4E4B;
	Tue, 21 Jan 2025 15:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="euOtlJEE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AA11F4299;
	Tue, 21 Jan 2025 15:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737472567; cv=none; b=KKRvSo4f2tjLSGVakKpMAxwzHg4k+GU8HYx5bAC2uX4JK034B1zcx9sLYcuvzR7XlDVhhystK8cXUAa2EJrgG1mwa/awpqorNEvL/CCSVFrvDS3PDeZxelJqwab+8Wkjk1Zz58YTK5H3BNtuuxCSq8MGnORzRvf9RwOPG2Qm0t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737472567; c=relaxed/simple;
	bh=5ziMMlCwm2y5y3wsVofZNp7cHjP4Bh/rr6cusB6ZzIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NGML81+GD3Fr8gxqjgxFNSPyTnGOoOv0FoMnzv8yBGe2I3dsNnoz4MGDOtwzyi+tgipEXmmuRKQeKD/5Q/H3CbzJADtHxnTI3OLCKxfSc9WpbM8PkQZRe0L993eVQUgKXXSxE8N2IGgrEVqdMt3r2fQGmgxNG4cNSZGm4WoTHM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=euOtlJEE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8023FC4CEE3;
	Tue, 21 Jan 2025 15:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737472566;
	bh=5ziMMlCwm2y5y3wsVofZNp7cHjP4Bh/rr6cusB6ZzIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=euOtlJEEuI0/BzXk7MZnJVgcHqKdHlsM59Qn3Omh8hmGRZaVy5u5IUah8R2etN2xe
	 4uJbCZ2aB0aX7iGIRozTPvGGxjIOl3J+QX+HQFl8g4oN13eUH2u9i5zLsF0yEaSCS6
	 cH0CQRZqQY9xB8nltFRhJUrvR2L2XBILxMqFVQSoKXOurojm5CNVKn9ue/z80yQokc
	 ExYeu7IoHN1l05XDLIzowuUwM4tJDuJtZ2MPBbu0fKbnk9WAhxmmo0eo++/gtKzMfC
	 tO4hchdPUoVWW81UvkvOynvbmpWeETldOgQTfeTZrwwG5F0q+jMbcjE9RYwdU0E6kX
	 D6eZ0Ty6KqW4Q==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
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
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2 1/3] drm/sched: Document run_job() refcount hazard
Date: Tue, 21 Jan 2025 16:15:43 +0100
Message-ID: <20250121151544.44949-3-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121151544.44949-2-phasta@kernel.org>
References: <20250121151544.44949-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
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

Move the call to dma_fence_put() to the position behind the last usage
of the fence.

Document the necessity to increment the reference count in
drm_sched_backend_ops.run_job().

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c |  5 ++---
 include/drm/gpu_scheduler.h            | 19 +++++++++++++++----
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 57da84908752..7e69ebc09513 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1218,15 +1218,14 @@ static void drm_sched_run_job_work(struct work_struct *w)
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
+		dma_fence_put(fence);
 	} else {
 		drm_sched_job_done(sched_job, IS_ERR(fence) ?
 				   PTR_ERR(fence) : 0);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 95e17504e46a..d5cd2a78f27c 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -420,10 +420,21 @@ struct drm_sched_backend_ops {
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
+	 * dma_fence_get() on it. Consequently, this callback must take a
+	 * reference for the scheduler, and additional ones for the driver's
+	 * respective needs.
 	 */
 	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
 
-- 
2.47.1


