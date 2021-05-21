Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4A9438C2AC
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 11:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235567AbhEUJLc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 05:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233695AbhEUJLb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 05:11:31 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7A47C061574
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 02:10:08 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id z17so20281547wrq.7
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 02:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uR9DJ2jr8CtcwsyrpRGKPhRjzhUtmedeglZUml8ukWI=;
        b=D358aI72G7Z8RB1g0ZjFMZ550KSzBgA01qygw0+7GbzVZyVPpi+fbyIfMjSzFocn1M
         ZHY3VuqQTFFGTnqiz2rrknwFjnc9bugVRhUc4PBRVYITNWRLCy+/yT9BWhDjLmoB1TLp
         2hD2rj6mpcyXXjkmi/fOmlXrQqcqtAhn/OVVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uR9DJ2jr8CtcwsyrpRGKPhRjzhUtmedeglZUml8ukWI=;
        b=ce+kqq0L1Brw2a2/VR4fZrm9SMt6c1qSPKQSPEYExw0GSjn2bUn0W14DxayI1fVmKT
         6S6NS/uIJf4+3n9Y9jbyEegwRBYA8q3J5shIpQT2Q4ZpLNxEwBVl1xLgiaLKqvBCVHv7
         eTCskCfzEm/XnGbWHvPPdy8uOT4EIUY1qsoGorPJQW17xnFbKQZsXcr4b+uwkohFM5j2
         nL8NdSH002pVo/mcfLmgaO/J2AwwmYKk3M1ysiol+5W0UGTHY0z8MMYZAl0O+b2jHG7o
         +2oUJsQeSHreSXUKzAllYnfuhmdyvsGeJIL/WA9ElUuVSoMkleO9bAtSbnsGRlNCC+5z
         tnjw==
X-Gm-Message-State: AOAM530cA5t1vZVhDDrYJusW0gUEQFJ+MDuYrBAI6dlAhqld06rEMVzp
        qq3dgXb3nQwSs3zIRaSxFBJAgw==
X-Google-Smtp-Source: ABdhPJyV03WtTPWcuWSUSfzX27B39Gja1SJYx6ys8Uq9kTJPc/guCGF6Ua1Qi84vOdtB1jBqU6XmOw==
X-Received: by 2002:a5d:6d8f:: with SMTP id l15mr8522028wrs.313.1621588207333;
        Fri, 21 May 2021 02:10:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y2sm13589457wmq.45.2021.05.21.02.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 02:10:06 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
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
Subject: [PATCH 03/11] drm/panfrost: Use xarray and helpers for depedency tracking
Date:   Fri, 21 May 2021 11:09:51 +0200
Message-Id: <20210521090959.1663703-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
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
 drivers/gpu/drm/panfrost/panfrost_drv.c | 41 ++++++++---------
 drivers/gpu/drm/panfrost/panfrost_job.c | 61 ++++++++++---------------
 drivers/gpu/drm/panfrost/panfrost_job.h |  8 ++--
 3 files changed, 46 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index ca07098a6141..7977b4752b5c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -137,12 +137,6 @@ panfrost_lookup_bos(struct drm_device *dev,
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
@@ -173,7 +167,7 @@ panfrost_lookup_bos(struct drm_device *dev,
 }
 
 /**
- * panfrost_copy_in_sync() - Sets up job->in_fences[] with the sync objects
+ * panfrost_copy_in_sync() - Sets up job->deps with the sync objects
  * referenced by the job.
  * @dev: DRM device
  * @file_priv: DRM file for this fd
@@ -193,22 +187,14 @@ panfrost_copy_in_sync(struct drm_device *dev,
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
@@ -217,16 +203,23 @@ panfrost_copy_in_sync(struct drm_device *dev,
 
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
 
@@ -264,6 +257,8 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 
 	kref_init(&job->refcount);
 
+	xa_init_flags(&job->deps, XA_FLAGS_ALLOC);
+
 	job->pfdev = pfdev;
 	job->jc = args->jc;
 	job->requirements = args->requirements;
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index f5d39ee14ab5..707d912ff64a 100644
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
-		implicit_fences[i] = dma_resv_get_excl_rcu(bos[i]->resv);
+	for (i = 0; i < bo_count; i++) {
+		struct dma_fence *fence = dma_resv_get_excl_rcu(bos[i]->resv);
+
+		ret = drm_gem_fence_array_add(deps, fence);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static void panfrost_attach_object_fences(struct drm_gem_object **bos,
@@ -236,8 +243,10 @@ int panfrost_job_push(struct panfrost_job *job)
 
 	kref_get(&job->refcount); /* put by scheduler job completion */
 
-	panfrost_acquire_object_fences(job->bos, job->bo_count,
-				       job->implicit_fences);
+	ret = panfrost_acquire_object_fences(job->bos, job->bo_count,
+					     &job->deps);
+	if (ret)
+		goto unlock;
 
 	drm_sched_entity_push_job(&job->base, entity);
 
@@ -254,18 +263,15 @@ static void panfrost_job_cleanup(struct kref *ref)
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
 
@@ -308,26 +314,9 @@ static struct dma_fence *panfrost_job_dependency(struct drm_sched_job *sched_job
 						 struct drm_sched_entity *s_entity)
 {
 	struct panfrost_job *job = to_panfrost_job(sched_job);
-	struct dma_fence *fence;
-	unsigned int i;
 
-	/* Explicit fences */
-	for (i = 0; i < job->in_fence_count; i++) {
-		if (job->in_fences[i]) {
-			fence = job->in_fences[i];
-			job->in_fences[i] = NULL;
-			return fence;
-		}
-	}
-
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
2.31.0

