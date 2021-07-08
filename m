Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F1D63C1849
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 19:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbhGHRk7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 13:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbhGHRk6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jul 2021 13:40:58 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F891C061574
        for <linux-media@vger.kernel.org>; Thu,  8 Jul 2021 10:38:16 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id k16-20020a05600c1c90b02901f4ed0fcfe7so4547357wms.5
        for <linux-media@vger.kernel.org>; Thu, 08 Jul 2021 10:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6CoSDQimINzuQMNmfQzI9m6jHRTl1DpQg1i8VsEPplE=;
        b=comVH3WXZENRluWhsm3XZUuXprJE4MTtXErDzvdFDjEBmtKavAYOFvOHcxB/8zZFez
         eJHyAnowlUdkk0kOKeEeEBC9y/TgUsglfEu+Ee3ynGoiOOYpxS/pdTUJsLKajwgYkTs4
         wSRHXYvoduDpdFvmsOhVaSIEsY10qm1Nj1ewc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6CoSDQimINzuQMNmfQzI9m6jHRTl1DpQg1i8VsEPplE=;
        b=JaQLHHMFB0ESxLdc8DKd54+4kS35jqHiqNHLiWlbsFRtvLqNsUugAepOyMy1LDn7Yh
         gwgDgrpliZ6EwBvLH8kXPOY2jJ4/eXX39OFuCUshSRZmNAELLylFwMJZfDjNRIUw9Lzr
         zn2vSx0DNWTgg2CUzMArT4UMU3Gv8gk6vzmq5i+McvmmeWcZmS3vgj335anji+ea8EX2
         GhR4YqjEj4bIJ4eQcogoQic803NlGky1eacBZI1erZDMb24QOFMAvFuohiGmXg5oA9g8
         zaFqBEjcDhCizGx0iDD2BeIe8mBqz15iFQnGpRAotozKi9q2ZIFzvzvTshNQstHYGyhi
         3DLQ==
X-Gm-Message-State: AOAM531U/wwJeOxcXqDpyM9uWk83redGJfcVRHm57Sa1oJBQCYtaDYoI
        sCh9fmvRQBN3ov9MUZKm9lXv/A==
X-Google-Smtp-Source: ABdhPJwv0jDlnfeo5tFFisp8oveqQyoI80/d9UEL/yD24KMyoOwVZoarR14a8rUkgr0TqSzlDSMITQ==
X-Received: by 2002:a7b:c099:: with SMTP id r25mr6465162wmh.127.1625765895034;
        Thu, 08 Jul 2021 10:38:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l4sm2521853wme.26.2021.07.08.10.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 10:38:14 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Steven Price <steven.price@arm.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3 07/20] drm/panfrost: use scheduler dependency tracking
Date:   Thu,  8 Jul 2021 19:37:41 +0200
Message-Id: <20210708173754.3877540-8-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
References: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just deletes some code that's now more shared.

Note that thanks to the split into drm_sched_job_init/arm we can now
easily pull the _init() part from under the submission lock way ahead
where we're adding the sync file in-fences as dependencies.

v2: Correctly clean up the partially set up job, now that job_init()
and job_arm() are apart (Emma).

Reviewed-by: Steven Price <steven.price@arm.com> (v1)
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 16 ++++++++---
 drivers/gpu/drm/panfrost/panfrost_job.c | 37 +++----------------------
 drivers/gpu/drm/panfrost/panfrost_job.h |  5 +---
 3 files changed, 17 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 1ffaef5ec5ff..9f53bea07d61 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -218,7 +218,7 @@ panfrost_copy_in_sync(struct drm_device *dev,
 		if (ret)
 			goto fail;
 
-		ret = drm_gem_fence_array_add(&job->deps, fence);
+		ret = drm_sched_job_await_fence(&job->base, fence);
 
 		if (ret)
 			goto fail;
@@ -236,7 +236,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 	struct drm_panfrost_submit *args = data;
 	struct drm_syncobj *sync_out = NULL;
 	struct panfrost_job *job;
-	int ret = 0;
+	int ret = 0, slot;
 
 	if (!args->jc)
 		return -EINVAL;
@@ -258,14 +258,20 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 
 	kref_init(&job->refcount);
 
-	xa_init_flags(&job->deps, XA_FLAGS_ALLOC);
-
 	job->pfdev = pfdev;
 	job->jc = args->jc;
 	job->requirements = args->requirements;
 	job->flush_id = panfrost_gpu_get_latest_flush_id(pfdev);
 	job->file_priv = file->driver_priv;
 
+	slot = panfrost_job_get_slot(job);
+
+	ret = drm_sched_job_init(&job->base,
+				 &job->file_priv->sched_entity[slot],
+				 NULL);
+	if (ret)
+		goto fail_job_put;
+
 	ret = panfrost_copy_in_sync(dev, file, args, job);
 	if (ret)
 		goto fail_job;
@@ -283,6 +289,8 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 		drm_syncobj_replace_fence(sync_out, job->render_done_fence);
 
 fail_job:
+	drm_sched_job_cleanup(&job->base);
+fail_job_put:
 	panfrost_job_put(job);
 fail_out_sync:
 	if (sync_out)
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 4bc962763e1f..86c843d8822e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -102,7 +102,7 @@ static struct dma_fence *panfrost_fence_create(struct panfrost_device *pfdev, in
 	return &fence->base;
 }
 
-static int panfrost_job_get_slot(struct panfrost_job *job)
+int panfrost_job_get_slot(struct panfrost_job *job)
 {
 	/* JS0: fragment jobs.
 	 * JS1: vertex/tiler jobs
@@ -242,13 +242,13 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 
 static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
 					  int bo_count,
-					  struct xarray *deps)
+					  struct drm_sched_job *job)
 {
 	int i, ret;
 
 	for (i = 0; i < bo_count; i++) {
 		/* panfrost always uses write mode in its current uapi */
-		ret = drm_gem_fence_array_add_implicit(deps, bos[i], true);
+		ret = drm_sched_job_await_implicit(job, bos[i], true);
 		if (ret)
 			return ret;
 	}
@@ -269,31 +269,21 @@ static void panfrost_attach_object_fences(struct drm_gem_object **bos,
 int panfrost_job_push(struct panfrost_job *job)
 {
 	struct panfrost_device *pfdev = job->pfdev;
-	int slot = panfrost_job_get_slot(job);
-	struct drm_sched_entity *entity = &job->file_priv->sched_entity[slot];
 	struct ww_acquire_ctx acquire_ctx;
 	int ret = 0;
 
-
 	ret = drm_gem_lock_reservations(job->bos, job->bo_count,
 					    &acquire_ctx);
 	if (ret)
 		return ret;
 
 	mutex_lock(&pfdev->sched_lock);
-
-	ret = drm_sched_job_init(&job->base, entity, NULL);
-	if (ret) {
-		mutex_unlock(&pfdev->sched_lock);
-		goto unlock;
-	}
-
 	drm_sched_job_arm(&job->base);
 
 	job->render_done_fence = dma_fence_get(&job->base.s_fence->finished);
 
 	ret = panfrost_acquire_object_fences(job->bos, job->bo_count,
-					     &job->deps);
+					     &job->base);
 	if (ret) {
 		mutex_unlock(&pfdev->sched_lock);
 		goto unlock;
@@ -318,15 +308,8 @@ static void panfrost_job_cleanup(struct kref *ref)
 {
 	struct panfrost_job *job = container_of(ref, struct panfrost_job,
 						refcount);
-	struct dma_fence *fence;
-	unsigned long index;
 	unsigned int i;
 
-	xa_for_each(&job->deps, index, fence) {
-		dma_fence_put(fence);
-	}
-	xa_destroy(&job->deps);
-
 	dma_fence_put(job->done_fence);
 	dma_fence_put(job->render_done_fence);
 
@@ -365,17 +348,6 @@ static void panfrost_job_free(struct drm_sched_job *sched_job)
 	panfrost_job_put(job);
 }
 
-static struct dma_fence *panfrost_job_dependency(struct drm_sched_job *sched_job,
-						 struct drm_sched_entity *s_entity)
-{
-	struct panfrost_job *job = to_panfrost_job(sched_job);
-
-	if (!xa_empty(&job->deps))
-		return xa_erase(&job->deps, job->last_dep++);
-
-	return NULL;
-}
-
 static struct dma_fence *panfrost_job_run(struct drm_sched_job *sched_job)
 {
 	struct panfrost_job *job = to_panfrost_job(sched_job);
@@ -765,7 +737,6 @@ static void panfrost_reset_work(struct work_struct *work)
 }
 
 static const struct drm_sched_backend_ops panfrost_sched_ops = {
-	.dependency = panfrost_job_dependency,
 	.run_job = panfrost_job_run,
 	.timedout_job = panfrost_job_timedout,
 	.free_job = panfrost_job_free
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
index 82306a03b57e..77e6d0e6f612 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.h
+++ b/drivers/gpu/drm/panfrost/panfrost_job.h
@@ -19,10 +19,6 @@ struct panfrost_job {
 	struct panfrost_device *pfdev;
 	struct panfrost_file_priv *file_priv;
 
-	/* Contains both explicit and implicit fences */
-	struct xarray deps;
-	unsigned long last_dep;
-
 	/* Fence to be signaled by IRQ handler when the job is complete. */
 	struct dma_fence *done_fence;
 
@@ -42,6 +38,7 @@ int panfrost_job_init(struct panfrost_device *pfdev);
 void panfrost_job_fini(struct panfrost_device *pfdev);
 int panfrost_job_open(struct panfrost_file_priv *panfrost_priv);
 void panfrost_job_close(struct panfrost_file_priv *panfrost_priv);
+int panfrost_job_get_slot(struct panfrost_job *job);
 int panfrost_job_push(struct panfrost_job *job);
 void panfrost_job_put(struct panfrost_job *job);
 void panfrost_job_enable_interrupts(struct panfrost_device *pfdev);
-- 
2.32.0

