Return-Path: <linux-media+bounces-33981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D82ACC31C
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 11:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A735C188FFA2
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 09:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C10E2820DA;
	Tue,  3 Jun 2025 09:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AStVO9L5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D081F583D;
	Tue,  3 Jun 2025 09:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748943120; cv=none; b=SbgxlsoH6EeKsLFHHHeEDMcT3WkdMyhbOBVRlN583m6KR1Mk/OFaHFqIA60y2PJSWjVyq0i0C3P1TNLsnMKRnLBVjfBNwwAj+SEt4hUxPaeOkuLWDsgP6/KpThawz7k0o5MV7p8dX9RHfwbMEAW3dHTZsASdjql/nx0wX4rqQkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748943120; c=relaxed/simple;
	bh=vu+k3OVXrurN0RDNX/7oaLaHr4+RCz+6uUmJJ1xRlw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZkyTHgpE13pzJW+Ttyi9NRlCtyxmueZjRXXJhD7hvo13jBmrCXqMmwD2fLNCpoQ2oD2OPji9ZXybTkZOc7II9rFSc1LpMuWzWmw0vE99v82lI9mYMWPGcFbW1QJrYP9m5FQIs//6YzGASg9TjUMhC45uE0l1RHJ9Z4Pomv2okA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AStVO9L5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B145C4CEEF;
	Tue,  3 Jun 2025 09:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748943120;
	bh=vu+k3OVXrurN0RDNX/7oaLaHr4+RCz+6uUmJJ1xRlw8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AStVO9L5QlzmiP0MOdqk9vID9qjB2nKFZAiYkkRJNlgh2IPqsaAqOUmMkURZHmfKn
	 W6vtH6yGFxN4IcLZNLjTfSi8/Bmg/AdRAkohcidBeOXfMtoXzo4lUoC2HEClnQU9KU
	 VHh6wWn3JlpncWWJSWKgQuPJrPgn1+nfVG4W+qFMV/TfEptRICmBgrt3ukB1f4/hhn
	 Qri4Yhjk0lI622PpglqmaRZDx1V7PhX9IbGKAojfPJxrj0O/7qRbUEu4jLRY1FwUSS
	 jO1elk1dlm1pfE8XQoEUPStE6cQneFNkXq9gnin2vNwqxBsLG4nCs5Pc6B9CuPatPS
	 Ny629OCECm08g==
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
Subject: [RFC PATCH 1/6] drm/sched: Avoid memory leaks with cancel_job() callback
Date: Tue,  3 Jun 2025 11:31:26 +0200
Message-ID: <20250603093130.100159-3-phasta@kernel.org>
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

Since its inception, the GPU scheduler can leak memory if the driver
calls drm_sched_fini() while there are still jobs in flight.

The simplest way to solve this in a backwards compatible manner is by
adding a new callback, drm_sched_backend_ops.cancel_job(), which
instructs the driver to signal the hardware fence associated with the
job. Afterwards, the scheduler can savely use the established free_job()
callback for freeing the job.

Implement the new backend_ops callback cancel_job().

Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 34 ++++++++++++++++----------
 include/drm/gpu_scheduler.h            |  9 +++++++
 2 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index d20726d7adf0..3f14f1e151fa 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1352,6 +1352,18 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 }
 EXPORT_SYMBOL(drm_sched_init);
 
+static void drm_sched_kill_remaining_jobs(struct drm_gpu_scheduler *sched)
+{
+	struct drm_sched_job *job, *tmp;
+
+	/* All other accessors are stopped. No locking necessary. */
+	list_for_each_entry_safe_reverse(job, tmp, &sched->pending_list, list) {
+		sched->ops->cancel_job(job);
+		list_del(&job->list);
+		sched->ops->free_job(job);
+	}
+}
+
 /**
  * drm_sched_fini - Destroy a gpu scheduler
  *
@@ -1359,19 +1371,11 @@ EXPORT_SYMBOL(drm_sched_init);
  *
  * Tears down and cleans up the scheduler.
  *
- * This stops submission of new jobs to the hardware through
- * drm_sched_backend_ops.run_job(). Consequently, drm_sched_backend_ops.free_job()
- * will not be called for all jobs still in drm_gpu_scheduler.pending_list.
- * There is no solution for this currently. Thus, it is up to the driver to make
- * sure that:
- *
- *  a) drm_sched_fini() is only called after for all submitted jobs
- *     drm_sched_backend_ops.free_job() has been called or that
- *  b) the jobs for which drm_sched_backend_ops.free_job() has not been called
- *     after drm_sched_fini() ran are freed manually.
- *
- * FIXME: Take care of the above problem and prevent this function from leaking
- * the jobs in drm_gpu_scheduler.pending_list under any circumstances.
+ * This stops submission of new jobs to the hardware through &struct
+ * drm_sched_backend_ops.run_job. If &struct drm_sched_backend_ops.cancel_job
+ * is implemented, all jobs will be canceled through it and afterwards cleaned
+ * up through &struct drm_sched_backend_ops.free_job. If cancel_job is not
+ * implemented, memory could leak.
  */
 void drm_sched_fini(struct drm_gpu_scheduler *sched)
 {
@@ -1401,6 +1405,10 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	/* Confirm no work left behind accessing device structures */
 	cancel_delayed_work_sync(&sched->work_tdr);
 
+	/* Avoid memory leaks if supported by the driver. */
+	if (sched->ops->cancel_job)
+		drm_sched_kill_remaining_jobs(sched);
+
 	if (sched->own_submit_wq)
 		destroy_workqueue(sched->submit_wq);
 	sched->ready = false;
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index e62a7214e052..81dcbfc8c223 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -512,6 +512,15 @@ struct drm_sched_backend_ops {
          * and it's time to clean it up.
 	 */
 	void (*free_job)(struct drm_sched_job *sched_job);
+
+	/**
+	 * @cancel_job: Used by the scheduler to guarantee remaining jobs' fences
+	 * get signaled in drm_sched_fini().
+	 *
+	 * Drivers need to signal the passed job's hardware fence with
+	 * -ECANCELED in this callback. They must not free the job.
+	 */
+	void (*cancel_job)(struct drm_sched_job *sched_job);
 };
 
 /**
-- 
2.49.0


