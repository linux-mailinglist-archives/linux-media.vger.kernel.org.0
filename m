Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC7733B0AC4
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 18:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231560AbhFVQ5m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 12:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbhFVQ5l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 12:57:41 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8555CC061574
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 09:55:24 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id j11-20020a05600c1c0bb02901e23d4c0977so1599473wms.0
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 09:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rzlrXCcEGb+HbsY6rQlzlR2DNoLWI/Ix70rWUJ+pXLw=;
        b=HrZXzj0ChHZ2FPuKHgGp1y+ikPP7o4UiPL+zjBi+qMWLFE3ZjOsU2N2zZOfS2TcM/I
         SfLq409V0moyZjsOBSAD8F/9rvYHW+rfaGNM/YPcxEIEN6r+MfRyVGBDkRXl4DiaWAVk
         YG/ChRwhLQW5CcPGzMAqAVYniXok+NjX4/lPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rzlrXCcEGb+HbsY6rQlzlR2DNoLWI/Ix70rWUJ+pXLw=;
        b=AMESqw4poHT2wn18Q8chAkbp1xwus4K3vKwlBOiIv/Dru7oriSejTCHJWV6/KGwu0V
         1NLetk7Offqp99XiwEL53jG/bR5RS35BI9TLeK5YazKhEM01YwnD0zbDK6Io9MhqwCKt
         ZNwXswGFeGskxJlaGGefgdJ5bITUMfaTin3ArQBFISaraYBvd7ExV5y+ci7mXiQ65jao
         CF5EBO45iHdwfXeS2xXc3s32sd9nHhRCHHBObiR0G5EOSS2vfAYqx0CSq+5SNpzyPgtd
         +NsJANiun1R2ZIxD7pyCRVhba7g7V9qdts05kbJxwPQR0zEQXfjV+m0/+x6DDSqhGD8k
         fU+A==
X-Gm-Message-State: AOAM530AZ+/UgBySEKnKDhaPJwyy47f4a5d2OdyizywsfGypKZFGRsWF
        MIGiQh6Cp+E8DVxmBm5zMzU/8w==
X-Google-Smtp-Source: ABdhPJx1H4aHmftTCUui4jOyg6vFzbQSgGEI/SHgeAbQvMHIjZUERgp3Te66IUZSbZgmObuyzLjmTA==
X-Received: by 2002:a1c:f206:: with SMTP id s6mr5378809wmc.102.1624380923065;
        Tue, 22 Jun 2021 09:55:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l23sm3632342wmc.5.2021.06.22.09.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 09:55:22 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Lee Jones <lee.jones@linaro.org>,
        Steven Price <steven.price@arm.com>,
        Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH 05/15] drm/panfrost: Use xarray and helpers for depedency tracking
Date:   Tue, 22 Jun 2021 18:55:01 +0200
Message-Id: <20210622165511.3169559-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

More consistency and prep work for the next patch.

Aside: I wonder whether we shouldn't just move this entire xarray
business into the scheduler so that not everyone has to reinvent the
same wheels. Cc'ing some scheduler people for this too.

v2: Correctly handle sched_lock since Lucas pointed out it's needed.

v3: Rebase, dma_resv_get_excl_unlocked got renamed

v4: Don't leak job references on failure (Steven).

Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Steven Price <steven.price@arm.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 41 +++++++---------
 drivers/gpu/drm/panfrost/panfrost_job.c | 65 +++++++++++--------------
 drivers/gpu/drm/panfrost/panfrost_job.h |  8 ++-
 3 files changed, 49 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 075ec0ef746c..3ee828f1e7a5 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -138,12 +138,6 @@ panfrost_lookup_bos(struct drm_device *dev,
 	if (!job->bo_count)
 		return 0;
 
-	job->implicit_fences = kvmalloc_array(job->bo_count,
-				  sizeof(struct dma_fence *),
-				  GFP_KERNEL | __GFP_ZERO);
-	if (!job->implicit_fences)
-		return -ENOMEM;
-
 	ret = drm_gem_objects_lookup(file_priv,
 				     (void __user *)(uintptr_t)args->bo_handles,
 				     job->bo_count, &job->bos);
@@ -174,7 +168,7 @@ panfrost_lookup_bos(struct drm_device *dev,
 }
 
 /**
- * panfrost_copy_in_sync() - Sets up job->in_fences[] with the sync objects
+ * panfrost_copy_in_sync() - Sets up job->deps with the sync objects
  * referenced by the job.
  * @dev: DRM device
  * @file_priv: DRM file for this fd
@@ -194,22 +188,14 @@ panfrost_copy_in_sync(struct drm_device *dev,
 {
 	u32 *handles;
 	int ret = 0;
-	int i;
+	int i, in_fence_count;
 
-	job->in_fence_count = args->in_sync_count;
+	in_fence_count = args->in_sync_count;
 
-	if (!job->in_fence_count)
+	if (!in_fence_count)
 		return 0;
 
-	job->in_fences = kvmalloc_array(job->in_fence_count,
-					sizeof(struct dma_fence *),
-					GFP_KERNEL | __GFP_ZERO);
-	if (!job->in_fences) {
-		DRM_DEBUG("Failed to allocate job in fences\n");
-		return -ENOMEM;
-	}
-
-	handles = kvmalloc_array(job->in_fence_count, sizeof(u32), GFP_KERNEL);
+	handles = kvmalloc_array(in_fence_count, sizeof(u32), GFP_KERNEL);
 	if (!handles) {
 		ret = -ENOMEM;
 		DRM_DEBUG("Failed to allocate incoming syncobj handles\n");
@@ -218,16 +204,23 @@ panfrost_copy_in_sync(struct drm_device *dev,
 
 	if (copy_from_user(handles,
 			   (void __user *)(uintptr_t)args->in_syncs,
-			   job->in_fence_count * sizeof(u32))) {
+			   in_fence_count * sizeof(u32))) {
 		ret = -EFAULT;
 		DRM_DEBUG("Failed to copy in syncobj handles\n");
 		goto fail;
 	}
 
-	for (i = 0; i < job->in_fence_count; i++) {
+	for (i = 0; i < in_fence_count; i++) {
+		struct dma_fence *fence;
+
 		ret = drm_syncobj_find_fence(file_priv, handles[i], 0, 0,
-					     &job->in_fences[i]);
-		if (ret == -EINVAL)
+					     &fence);
+		if (ret)
+			goto fail;
+
+		ret = drm_gem_fence_array_add(&job->deps, fence);
+
+		if (ret)
 			goto fail;
 	}
 
@@ -265,6 +258,8 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 
 	kref_init(&job->refcount);
 
+	xa_init_flags(&job->deps, XA_FLAGS_ALLOC);
+
 	job->pfdev = pfdev;
 	job->jc = args->jc;
 	job->requirements = args->requirements;
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 38f8580c19f1..71cd43fa1b36 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -196,14 +196,21 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 	job_write(pfdev, JS_COMMAND_NEXT(js), JS_COMMAND_START);
 }
 
-static void panfrost_acquire_object_fences(struct drm_gem_object **bos,
-					   int bo_count,
-					   struct dma_fence **implicit_fences)
+static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
+					  int bo_count,
+					  struct xarray *deps)
 {
-	int i;
+	int i, ret;
 
-	for (i = 0; i < bo_count; i++)
-		implicit_fences[i] = dma_resv_get_excl_unlocked(bos[i]->resv);
+	for (i = 0; i < bo_count; i++) {
+		struct dma_fence *fence = dma_resv_get_excl_unlocked(bos[i]->resv);
+
+		ret = drm_gem_fence_array_add(deps, fence);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static void panfrost_attach_object_fences(struct drm_gem_object **bos,
@@ -240,10 +247,14 @@ int panfrost_job_push(struct panfrost_job *job)
 
 	job->render_done_fence = dma_fence_get(&job->base.s_fence->finished);
 
-	kref_get(&job->refcount); /* put by scheduler job completion */
+	ret = panfrost_acquire_object_fences(job->bos, job->bo_count,
+					     &job->deps);
+	if (ret) {
+		mutex_unlock(&pfdev->sched_lock);
+		goto unlock;
+	}
 
-	panfrost_acquire_object_fences(job->bos, job->bo_count,
-				       job->implicit_fences);
+	kref_get(&job->refcount); /* put by scheduler job completion */
 
 	drm_sched_entity_push_job(&job->base, entity);
 
@@ -262,18 +273,15 @@ static void panfrost_job_cleanup(struct kref *ref)
 {
 	struct panfrost_job *job = container_of(ref, struct panfrost_job,
 						refcount);
+	struct dma_fence *fence;
+	unsigned long index;
 	unsigned int i;
 
-	if (job->in_fences) {
-		for (i = 0; i < job->in_fence_count; i++)
-			dma_fence_put(job->in_fences[i]);
-		kvfree(job->in_fences);
-	}
-	if (job->implicit_fences) {
-		for (i = 0; i < job->bo_count; i++)
-			dma_fence_put(job->implicit_fences[i]);
-		kvfree(job->implicit_fences);
+	xa_for_each(&job->deps, index, fence) {
+		dma_fence_put(fence);
 	}
+	xa_destroy(&job->deps);
+
 	dma_fence_put(job->done_fence);
 	dma_fence_put(job->render_done_fence);
 
@@ -316,26 +324,9 @@ static struct dma_fence *panfrost_job_dependency(struct drm_sched_job *sched_job
 						 struct drm_sched_entity *s_entity)
 {
 	struct panfrost_job *job = to_panfrost_job(sched_job);
-	struct dma_fence *fence;
-	unsigned int i;
-
-	/* Explicit fences */
-	for (i = 0; i < job->in_fence_count; i++) {
-		if (job->in_fences[i]) {
-			fence = job->in_fences[i];
-			job->in_fences[i] = NULL;
-			return fence;
-		}
-	}
 
-	/* Implicit fences, max. one per BO */
-	for (i = 0; i < job->bo_count; i++) {
-		if (job->implicit_fences[i]) {
-			fence = job->implicit_fences[i];
-			job->implicit_fences[i] = NULL;
-			return fence;
-		}
-	}
+	if (!xa_empty(&job->deps))
+		return xa_erase(&job->deps, job->last_dep++);
 
 	return NULL;
 }
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
index bbd3ba97ff67..82306a03b57e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.h
+++ b/drivers/gpu/drm/panfrost/panfrost_job.h
@@ -19,9 +19,9 @@ struct panfrost_job {
 	struct panfrost_device *pfdev;
 	struct panfrost_file_priv *file_priv;
 
-	/* Optional fences userspace can pass in for the job to depend on. */
-	struct dma_fence **in_fences;
-	u32 in_fence_count;
+	/* Contains both explicit and implicit fences */
+	struct xarray deps;
+	unsigned long last_dep;
 
 	/* Fence to be signaled by IRQ handler when the job is complete. */
 	struct dma_fence *done_fence;
@@ -30,8 +30,6 @@ struct panfrost_job {
 	__u32 requirements;
 	__u32 flush_id;
 
-	/* Exclusive fences we have taken from the BOs to wait for */
-	struct dma_fence **implicit_fences;
 	struct panfrost_gem_mapping **mappings;
 	struct drm_gem_object **bos;
 	u32 bo_count;
-- 
2.32.0.rc2

