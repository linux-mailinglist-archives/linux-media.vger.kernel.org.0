Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD253C6480
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 22:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236580AbhGLUEw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 16:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236465AbhGLUEv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 16:04:51 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D5BC0613DD
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 13:02:02 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id n4so1759383wms.1
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 13:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PDd1IdHq5wsEVEv8Lw/24Bu2x473L2i3Hy9jG1LjhDs=;
        b=KUJc7YFwpo2yJJEg+HTXadnCljdJjwwNT70xTdlRkXtJjqUP/C8BPpqzwCFO25b4K2
         /LIpZjU9j2xKNVwt3nXtxuo8IbzmjiYB0Wl7Fu92/HPArmUhbDhMfK0EKrVCh3fn2/Oq
         G966d57GGsM17H+sPyK9rZmqk/N8p0pyRqCFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PDd1IdHq5wsEVEv8Lw/24Bu2x473L2i3Hy9jG1LjhDs=;
        b=L9rZm8KXc98UP89kQ07fFRXd24B8U3ip5P5kW6xdVz8EZxyAQMWwDBv51+UIEdsH0W
         WW2ONxeF/ja1fZIR0oLzE8p6RKf9PPq4jmyH7Tic9yo0k1dNreZJm0N/slhM+mBB3sGN
         TRcf+Y7o0t9kC2+sM5RdgT03547k0LxaVHB4EqMQ9a+czKyAzotbHQBcz2yMpElIy7A1
         J9NthOtaoafhxSiCvkjQCtI2Kp08GlqDFxEtrqaYThb+gUrLSbnYOZBH3ij+kEbOe6W8
         R2QbVgBd64/FA4IJT2ZiOCFocoM4UrJAUlvwunD9UA9g5sujQhTvvBwqOZqRrHKQtNKk
         Sbqg==
X-Gm-Message-State: AOAM533xYpP9dJt9X8VXPlollfG5iLdjPdpReDOJD30qXkk8lQzSWOZY
        qnVraeuUE0MXLIytMt8q6ur/Gw==
X-Google-Smtp-Source: ABdhPJx/MVM9QaXXaLDPQiVuzTRLcC2fLyK34B03JLDVn35vbg3S0Aq0o4hGeKnoAPtDgyj8KzxkIw==
X-Received: by 2002:a05:600c:cc:: with SMTP id u12mr16349530wmm.19.1626120121348;
        Mon, 12 Jul 2021 13:02:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l14sm9858221wrs.22.2021.07.12.13.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 13:02:00 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Steven Price <steven.price@arm.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Lee Jones <lee.jones@linaro.org>,
        Nirmoy Das <nirmoy.aiemd@gmail.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Jack Zhang <Jack.Zhang1@amd.com>, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4 03/18] drm/sched: Add dependency tracking
Date:   Mon, 12 Jul 2021 19:53:37 +0200
Message-Id: <20210712175352.802687-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of just a callback we can just glue in the gem helpers that
panfrost, v3d and lima currently use. There's really not that many
ways to skin this cat.

On the naming bikeshed: The idea for using _await_ to denote adding
dependencies to a job comes from i915, where that's used quite
extensively all over the place, in lots of datastructures.

v2/3: Rebased.

Reviewed-by: Steven Price <steven.price@arm.com> (v1)
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Nirmoy Das <nirmoy.aiemd@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jack Zhang <Jack.Zhang1@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/gpu/drm/scheduler/sched_entity.c |  18 +++-
 drivers/gpu/drm/scheduler/sched_main.c   | 103 +++++++++++++++++++++++
 include/drm/gpu_scheduler.h              |  31 ++++++-
 3 files changed, 146 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 89e3f6eaf519..381fbf462ea7 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -211,6 +211,19 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 	job->sched->ops->free_job(job);
 }
 
+static struct dma_fence *
+drm_sched_job_dependency(struct drm_sched_job *job,
+			 struct drm_sched_entity *entity)
+{
+	if (!xa_empty(&job->dependencies))
+		return xa_erase(&job->dependencies, job->last_dependency++);
+
+	if (job->sched->ops->dependency)
+		return job->sched->ops->dependency(job, entity);
+
+	return NULL;
+}
+
 /**
  * drm_sched_entity_kill_jobs - Make sure all remaining jobs are killed
  *
@@ -229,7 +242,7 @@ static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
 		struct drm_sched_fence *s_fence = job->s_fence;
 
 		/* Wait for all dependencies to avoid data corruptions */
-		while ((f = job->sched->ops->dependency(job, entity)))
+		while ((f = drm_sched_job_dependency(job, entity)))
 			dma_fence_wait(f, false);
 
 		drm_sched_fence_scheduled(s_fence);
@@ -419,7 +432,6 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
  */
 struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 {
-	struct drm_gpu_scheduler *sched = entity->rq->sched;
 	struct drm_sched_job *sched_job;
 
 	sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
@@ -427,7 +439,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 		return NULL;
 
 	while ((entity->dependency =
-			sched->ops->dependency(sched_job, entity))) {
+			drm_sched_job_dependency(sched_job, entity))) {
 		trace_drm_sched_job_wait_dep(sched_job, entity->dependency);
 
 		if (drm_sched_entity_add_dependency_cb(entity))
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 454cb6164bdc..84c30badb78e 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -603,6 +603,8 @@ int drm_sched_job_init(struct drm_sched_job *job,
 
 	INIT_LIST_HEAD(&job->list);
 
+	xa_init_flags(&job->dependencies, XA_FLAGS_ALLOC);
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_sched_job_init);
@@ -637,6 +639,98 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 }
 EXPORT_SYMBOL(drm_sched_job_arm);
 
+/**
+ * drm_sched_job_await_fence - adds the fence as a job dependency
+ * @job: scheduler job to add the dependencies to
+ * @fence: the dma_fence to add to the list of dependencies.
+ *
+ * Note that @fence is consumed in both the success and error cases.
+ *
+ * Returns:
+ * 0 on success, or an error on failing to expand the array.
+ */
+int drm_sched_job_await_fence(struct drm_sched_job *job,
+			      struct dma_fence *fence)
+{
+	struct dma_fence *entry;
+	unsigned long index;
+	u32 id = 0;
+	int ret;
+
+	if (!fence)
+		return 0;
+
+	/* Deduplicate if we already depend on a fence from the same context.
+	 * This lets the size of the array of deps scale with the number of
+	 * engines involved, rather than the number of BOs.
+	 */
+	xa_for_each(&job->dependencies, index, entry) {
+		if (entry->context != fence->context)
+			continue;
+
+		if (dma_fence_is_later(fence, entry)) {
+			dma_fence_put(entry);
+			xa_store(&job->dependencies, index, fence, GFP_KERNEL);
+		} else {
+			dma_fence_put(fence);
+		}
+		return 0;
+	}
+
+	ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, GFP_KERNEL);
+	if (ret != 0)
+		dma_fence_put(fence);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_sched_job_await_fence);
+
+/**
+ * drm_sched_job_await_implicit - adds implicit dependencies as job dependencies
+ * @job: scheduler job to add the dependencies to
+ * @obj: the gem object to add new dependencies from.
+ * @write: whether the job might write the object (so we need to depend on
+ * shared fences in the reservation object).
+ *
+ * This should be called after drm_gem_lock_reservations() on your array of
+ * GEM objects used in the job but before updating the reservations with your
+ * own fences.
+ *
+ * Returns:
+ * 0 on success, or an error on failing to expand the array.
+ */
+int drm_sched_job_await_implicit(struct drm_sched_job *job,
+				 struct drm_gem_object *obj,
+				 bool write)
+{
+	int ret;
+	struct dma_fence **fences;
+	unsigned int i, fence_count;
+
+	if (!write) {
+		struct dma_fence *fence = dma_resv_get_excl_unlocked(obj->resv);
+
+		return drm_sched_job_await_fence(job, fence);
+	}
+
+	ret = dma_resv_get_fences(obj->resv, NULL, &fence_count, &fences);
+	if (ret || !fence_count)
+		return ret;
+
+	for (i = 0; i < fence_count; i++) {
+		ret = drm_sched_job_await_fence(job, fences[i]);
+		if (ret)
+			break;
+	}
+
+	for (; i < fence_count; i++)
+		dma_fence_put(fences[i]);
+	kfree(fences);
+	return ret;
+}
+EXPORT_SYMBOL(drm_sched_job_await_implicit);
+
+
 /**
  * drm_sched_job_cleanup - clean up scheduler job resources
  * @job: scheduler job to clean up
@@ -652,6 +746,9 @@ EXPORT_SYMBOL(drm_sched_job_arm);
  */
 void drm_sched_job_cleanup(struct drm_sched_job *job)
 {
+	struct dma_fence *fence;
+	unsigned long index;
+
 	if (kref_read(&job->s_fence->finished.refcount)) {
 		/* drm_sched_job_arm() has been called */
 		dma_fence_put(&job->s_fence->finished);
@@ -661,6 +758,12 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
 	}
 
 	job->s_fence = NULL;
+
+	xa_for_each(&job->dependencies, index, fence) {
+		dma_fence_put(fence);
+	}
+	xa_destroy(&job->dependencies);
+
 }
 EXPORT_SYMBOL(drm_sched_job_cleanup);
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 83afc3aa8e2f..74fb321dbc44 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -27,9 +27,12 @@
 #include <drm/spsc_queue.h>
 #include <linux/dma-fence.h>
 #include <linux/completion.h>
+#include <linux/xarray.h>
 
 #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
 
+struct drm_gem_object;
+
 struct drm_gpu_scheduler;
 struct drm_sched_rq;
 
@@ -198,6 +201,16 @@ struct drm_sched_job {
 	enum drm_sched_priority		s_priority;
 	struct drm_sched_entity         *entity;
 	struct dma_fence_cb		cb;
+	/**
+	 * @dependencies:
+	 *
+	 * Contains the dependencies as struct dma_fence for this job, see
+	 * drm_sched_job_await_fence() and drm_sched_job_await_implicit().
+	 */
+	struct xarray			dependencies;
+
+	/** @last_dependency: tracks @dependencies as they signal */
+	unsigned long			last_dependency;
 };
 
 static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
@@ -220,9 +233,14 @@ enum drm_gpu_sched_stat {
  */
 struct drm_sched_backend_ops {
 	/**
-         * @dependency: Called when the scheduler is considering scheduling
-         * this job next, to get another struct dma_fence for this job to
-	 * block on.  Once it returns NULL, run_job() may be called.
+	 * @dependency:
+	 *
+	 * Called when the scheduler is considering scheduling this job next, to
+	 * get another struct dma_fence for this job to block on.  Once it
+	 * returns NULL, run_job() may be called.
+	 *
+	 * If a driver exclusively uses drm_sched_job_await_fence() and
+	 * drm_sched_job_await_implicit() this can be ommitted and left as NULL.
 	 */
 	struct dma_fence *(*dependency)(struct drm_sched_job *sched_job,
 					struct drm_sched_entity *s_entity);
@@ -349,6 +367,13 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
 		       void *owner);
 void drm_sched_job_arm(struct drm_sched_job *job);
+int drm_sched_job_await_fence(struct drm_sched_job *job,
+			      struct dma_fence *fence);
+int drm_sched_job_await_implicit(struct drm_sched_job *job,
+				 struct drm_gem_object *obj,
+				 bool write);
+
+
 void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				    struct drm_gpu_scheduler **sched_list,
                                    unsigned int num_sched_list);
-- 
2.32.0

