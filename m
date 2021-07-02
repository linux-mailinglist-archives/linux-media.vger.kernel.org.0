Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 696473BA520
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 23:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbhGBVlA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 17:41:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbhGBVlA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jul 2021 17:41:00 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3264DC061764
        for <linux-media@vger.kernel.org>; Fri,  2 Jul 2021 14:38:27 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id j34so7442285wms.5
        for <linux-media@vger.kernel.org>; Fri, 02 Jul 2021 14:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hozsEhRROj8RJ3r7JOJ/pME0E5x/W4ewCNxMdjvTG5k=;
        b=d1T0fh5gRiOULlteulsL9whi5svQrnr4oLsjQlcn+zRZoFaEKGLLRNCs7aagtOUGuM
         0BjxsR/b0FhyA60Pooq/9REZHP+HeEuR6x1dr3fB3vcHgfkFzdygNwmenEric7vg0lwi
         bcPq/tov0H5oX6qtlaRuvpZ7cHObhCxqKvIVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hozsEhRROj8RJ3r7JOJ/pME0E5x/W4ewCNxMdjvTG5k=;
        b=oUnj0tdwWrxv4RU0CkQnorAAt+nIQyFCtF3Z4DCn/mjNXnL5WCdn+lbHHNTqma0+9H
         L995/QiJbmz0UtwsVOJB3nQr7fWi8eJC7dQZG7NQrZilfo4c9c3/MvXUBgv/6Z5XavcE
         eSL7gc3fVGEdP6F+bKu3pXxKV5fyYsLIPLtbGHwwbItKVvgMNs0SvuZDoQdnvGtaVGtC
         lH6A6OPVwtrYM1iFVw/PuvNFwogIMKj42tiyiUiZiQxlbSORFNhibkgJJeB44ymEtlUd
         TuwtYg0/x18cy4YnKGjlmCxaAOPCrY1sVsyDdPA1gaREbX4pfhNqrN6mxfz5yDzpr88A
         l3wQ==
X-Gm-Message-State: AOAM5339FVJGpdZb7uSfscmBtUUAgE9XXnt/fI6xSpltA1kYoPzm7/9H
        1KVMaKbO5SC2In/6J0n7FT9AMtnaPWkTaQ==
X-Google-Smtp-Source: ABdhPJykBPD4Hvc8vEi7s/LiQKXT9WTLsAwftb1uQTM/wnoZ8PH0j+Fu0onfJVJU+oOoQWD8PMAETw==
X-Received: by 2002:a1c:208a:: with SMTP id g132mr1854540wmg.140.1625261905858;
        Fri, 02 Jul 2021 14:38:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id n19sm4007222wms.4.2021.07.02.14.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 14:38:25 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Steven Price <steven.price@arm.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2 04/11] drm/panfrost: use scheduler dependency tracking
Date:   Fri,  2 Jul 2021 23:38:08 +0200
Message-Id: <20210702213815.2249499-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210702213815.2249499-1-daniel.vetter@ffwll.ch>
References: <20210702213815.2249499-1-daniel.vetter@ffwll.ch>
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
2.32.0.rc2

