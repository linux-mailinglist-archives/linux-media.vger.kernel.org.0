Return-Path: <linux-media+bounces-36431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FBCAEFA6B
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 15:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2936480B68
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 13:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FCDC27605C;
	Tue,  1 Jul 2025 13:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uM4Lt5Pv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA0D276049;
	Tue,  1 Jul 2025 13:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376146; cv=none; b=VsvUYpMdLb9N87raSc9SX+kmxpS1qkoeZfBeeeX7UtIHsC7wxMsafzCoSe/HFc5mc9SqlxWZ16114ANepqnbuWFyLXl6R0ThFsW63MstXhHyqPVWXv2/U/RWs6gCTwJW/+2Ambw2IPhL+VKakv6AWQU1R/ThbIZmyY8/3cHQWEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376146; c=relaxed/simple;
	bh=hXhp4BvIw/DZIP5VkSnykQPTFuMxetN8CAwOyfsiMXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XNdBBaW1tOakOaUbANXJv745AasFz7tWq3xlcBGL9z9Yigxm0qsUmwkJKuS1BJRT/2jsiXCyKEoROGwNbjo7n7m6/HPwkh/b4VJVAO/ccffH1vovTIHEwU7ewYb2GQeeAlyJ05SdgBDzl8q87SljIqEoO5XUP8zwagHtSkMEYyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uM4Lt5Pv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F85C4CEED;
	Tue,  1 Jul 2025 13:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751376146;
	bh=hXhp4BvIw/DZIP5VkSnykQPTFuMxetN8CAwOyfsiMXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uM4Lt5PvVRlHNCFMtlu2A6FguRMpI6r/EZkTauoht3CDD5I4IHuWiEhDxACJBCm2Z
	 KhDLdGuxfqJPnUVOdwYRxT1BCysbI3Gj4ioN25nrEBr+PbfYhgyDvakViX/U+bct+J
	 UY7XVq4bTAzt0lZkU8ZCOSwJzix6suWiUhcPHLo03N3Rblmhs1QFZxnKoPCphWCmgr
	 5ytX+KB5mbIYsXPaXXjjMSd3/6oTIeVJWkJ4LmUIow3z2W+h15WI4V34rec+4A2jlI
	 6NmdwNpxVSW1h1rm93NV5tdP/c+sgz/VaioVn05dKEJ7jaLCd7ZMSz+yYfk9d3i/rh
	 T9CRUWUv25qmw==
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
Subject: [PATCH 1/6] drm/sched: Avoid memory leaks with cancel_job() callback
Date: Tue,  1 Jul 2025 15:21:39 +0200
Message-ID: <20250701132142.76899-4-phasta@kernel.org>
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

Since its inception, the GPU scheduler can leak memory if the driver
calls drm_sched_fini() while there are still jobs in flight.

The simplest way to solve this in a backwards compatible manner is by
adding a new callback, drm_sched_backend_ops.cancel_job(), which
instructs the driver to signal the hardware fence associated with the
job. Afterwards, the scheduler can savely use the established free_job()
callback for freeing the job.

Implement the new backend_ops callback cancel_job().

Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Link: https://lore.kernel.org/dri-devel/20250418113211.69956-1-tvrtko.ursulin@igalia.com/
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 34 ++++++++++++++++----------
 include/drm/gpu_scheduler.h            | 18 ++++++++++++++
 2 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index c63543132f9d..1239954f5f7c 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1353,6 +1353,18 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 }
 EXPORT_SYMBOL(drm_sched_init);
 
+static void drm_sched_cancel_remaining_jobs(struct drm_gpu_scheduler *sched)
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
@@ -1360,19 +1372,11 @@ EXPORT_SYMBOL(drm_sched_init);
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
@@ -1402,6 +1406,10 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	/* Confirm no work left behind accessing device structures */
 	cancel_delayed_work_sync(&sched->work_tdr);
 
+	/* Avoid memory leaks if supported by the driver. */
+	if (sched->ops->cancel_job)
+		drm_sched_cancel_remaining_jobs(sched);
+
 	if (sched->own_submit_wq)
 		destroy_workqueue(sched->submit_wq);
 	sched->ready = false;
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index e62a7214e052..190844370f48 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -512,6 +512,24 @@ struct drm_sched_backend_ops {
          * and it's time to clean it up.
 	 */
 	void (*free_job)(struct drm_sched_job *sched_job);
+
+	/**
+	 * @cancel_job: Used by the scheduler to guarantee remaining jobs' fences
+	 * get signaled in drm_sched_fini().
+	 *
+	 * Used by the scheduler to cancel all jobs that have not been executed
+	 * with &struct drm_sched_backend_ops.run_job by the time
+	 * drm_sched_fini() gets invoked.
+	 *
+	 * Drivers need to signal the passed job's hardware fence with an
+	 * appropriate error code (e.g., -ECANCELED) in this callback. They
+	 * must not free the job.
+	 *
+	 * The scheduler will only call this callback once it stopped calling
+	 * all other callbacks forever, with the exception of &struct
+	 * drm_sched_backend_ops.free_job.
+	 */
+	void (*cancel_job)(struct drm_sched_job *sched_job);
 };
 
 /**
-- 
2.49.0


