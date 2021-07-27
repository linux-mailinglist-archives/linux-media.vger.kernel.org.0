Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 044303D7BC1
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 19:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231650AbhG0RIF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 13:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbhG0RID (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 13:08:03 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03D95C061757;
        Tue, 27 Jul 2021 10:08:03 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id f13so6018387plj.2;
        Tue, 27 Jul 2021 10:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ne4nCKQexMGflp6jcFsczpiaFzQqZDtfk8dnUcHe14c=;
        b=LeuccoqoRLRr9U+JhqPN+kiPneA5qhJjE/B77rfLanLAt4Kq65YsTW/Qweva8NaoEt
         EGbbOoMxvME09KnCs/ZKC1x0ShXcGpvydPMkA4xz/py3j7oi30bM1Hsjz6LCIRFgzK2w
         Z1CvgvYlzZOFvBU/KYnUNRdGAQeOIfMPK6qk1EjIeKWYa90yrP96c0LNILOVeQWAkXa8
         cb3CJ6xl602GiUz5GYr1YtSY5F7Yetz0048fYCbhRI+1TFaNhrYYjdMZAtXHgnNOFCrb
         dD3tYFyIK1HkFy7Eb5og/Cml0gFd9/pUKhWA7qEvT3q3RpfM2k71XgMd9W24Vf0iYSOk
         y75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ne4nCKQexMGflp6jcFsczpiaFzQqZDtfk8dnUcHe14c=;
        b=NDnmXaf/q0p1wsTyKkHNWThq3Pnuw19OsVV6si7v/4vW5x5azbPg5Ilovjs5Im86Sn
         J+7dSDTvtavNVjVko+gOgTjmOJO81tIX/2fB9xMDK+hjxsRwJrG2ckkMBLDVZ2fuX6UO
         AOHe5OZLiUpZ7pP21V1PL1SuroJ/ylo8rfNm/evwLKk5degSfmSPaB441IIqSjJbV4wi
         auGo8YLQzWJMFlzKzRKLC67Mn8mOuu3Q24bozmpb85lXNa6uH05N9xdbR0o0AOalgMEy
         /tDikvYK4B6WnmRJa2mqbc/yhadYaBDO0YN9NcOJ1KIRYdV7zRAKfLVozLtPkXypVEiD
         mSmQ==
X-Gm-Message-State: AOAM532EgTU7+xJuwD+laIcmdZpW0z81AllxKlU21W5l+pXWFaXAetab
        W8A6AqkqyFUref47JHQFG9E=
X-Google-Smtp-Source: ABdhPJwpbCAevp5ftwytmHNYT2YNnxJnktqJ1dznSATEEvTKAgAj+fmeaISd0UPJuN6KX5q1pRM/OA==
X-Received: by 2002:a05:6a00:2126:b029:39b:4cdf:16ff with SMTP id n6-20020a056a002126b029039b4cdf16ffmr8710840pfj.81.1627405682409;
        Tue, 27 Jul 2021 10:08:02 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id 30sm4956964pgq.31.2021.07.27.10.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 10:08:01 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK)
Subject: [PATCH v3 09/13] drm/msm: Conversion to drm scheduler
Date:   Tue, 27 Jul 2021 10:11:25 -0700
Message-Id: <20210727171143.2549475-10-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727171143.2549475-1-robdclark@gmail.com>
References: <20210727171143.2549475-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

For existing adrenos, there is one or more ringbuffer, depending on
whether preemption is supported.  When preemption is supported, each
ringbuffer has it's own priority.  A submitqueue (which maps to a
gl context or vk queue in userspace) is mapped to a specific ring-
buffer at creation time, based on the submitqueue's priority.

Each ringbuffer has it's own drm_gpu_scheduler.  Each submitqueue
maps to a drm_sched_entity.  And each submit maps to a drm_sched_job.

Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/4
Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/Kconfig           |   1 +
 drivers/gpu/drm/msm/msm_gem.c         |  35 ------
 drivers/gpu/drm/msm/msm_gem.h         |  26 ++++-
 drivers/gpu/drm/msm/msm_gem_submit.c  | 161 +++++++++++++-------------
 drivers/gpu/drm/msm/msm_gpu.c         |  13 +--
 drivers/gpu/drm/msm/msm_gpu.h         |   2 +
 drivers/gpu/drm/msm/msm_rd.c          |   6 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c  |  66 +++++++++++
 drivers/gpu/drm/msm/msm_ringbuffer.h  |  12 ++
 drivers/gpu/drm/msm/msm_submitqueue.c |  26 +++++
 10 files changed, 217 insertions(+), 131 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 52536e7adb95..dc7f3e40850b 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -14,6 +14,7 @@ config DRM_MSM
 	select REGULATOR
 	select DRM_KMS_HELPER
 	select DRM_PANEL
+	select DRM_SCHED
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM if ARCH_QCOM
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 4e99c448b83a..a527a6b1d6ba 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -806,41 +806,6 @@ void msm_gem_vunmap(struct drm_gem_object *obj)
 	msm_obj->vaddr = NULL;
 }
 
-/* must be called before _move_to_active().. */
-int msm_gem_sync_object(struct drm_gem_object *obj,
-		struct msm_fence_context *fctx, bool exclusive)
-{
-	struct dma_resv_list *fobj;
-	struct dma_fence *fence;
-	int i, ret;
-
-	fobj = dma_resv_shared_list(obj->resv);
-	if (!fobj || (fobj->shared_count == 0)) {
-		fence = dma_resv_excl_fence(obj->resv);
-		/* don't need to wait on our own fences, since ring is fifo */
-		if (fence && (fence->context != fctx->context)) {
-			ret = dma_fence_wait(fence, true);
-			if (ret)
-				return ret;
-		}
-	}
-
-	if (!exclusive || !fobj)
-		return 0;
-
-	for (i = 0; i < fobj->shared_count; i++) {
-		fence = rcu_dereference_protected(fobj->shared[i],
-						dma_resv_held(obj->resv));
-		if (fence->context != fctx->context) {
-			ret = dma_fence_wait(fence, true);
-			if (ret)
-				return ret;
-		}
-	}
-
-	return 0;
-}
-
 void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index e0579abda5b9..a48114058ff9 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -9,6 +9,7 @@
 
 #include <linux/kref.h>
 #include <linux/dma-resv.h>
+#include "drm/gpu_scheduler.h"
 #include "msm_drv.h"
 
 /* Make all GEM related WARN_ON()s ratelimited.. when things go wrong they
@@ -143,8 +144,6 @@ void *msm_gem_get_vaddr_active(struct drm_gem_object *obj);
 void msm_gem_put_vaddr_locked(struct drm_gem_object *obj);
 void msm_gem_put_vaddr(struct drm_gem_object *obj);
 int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv);
-int msm_gem_sync_object(struct drm_gem_object *obj,
-		struct msm_fence_context *fctx, bool exclusive);
 void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu);
 void msm_gem_active_put(struct drm_gem_object *obj);
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout);
@@ -311,6 +310,7 @@ void msm_gem_vunmap(struct drm_gem_object *obj);
  * make it easier to unwind when things go wrong, etc).
  */
 struct msm_gem_submit {
+	struct drm_sched_job base;
 	struct kref ref;
 	struct drm_device *dev;
 	struct msm_gpu *gpu;
@@ -319,7 +319,22 @@ struct msm_gem_submit {
 	struct list_head bo_list;
 	struct ww_acquire_ctx ticket;
 	uint32_t seqno;		/* Sequence number of the submit on the ring */
-	struct dma_fence *fence;
+
+	/* Array of struct dma_fence * to block on before submitting this job.
+	 */
+	struct xarray deps;
+	unsigned long last_dep;
+
+	/* Hw fence, which is created when the scheduler executes the job, and
+	 * is signaled when the hw finishes (via seqno write from cmdstream)
+	 */
+	struct dma_fence *hw_fence;
+
+	/* Userspace visible fence, which is signaled by the scheduler after
+	 * the hw_fence is signaled.
+	 */
+	struct dma_fence *user_fence;
+
 	int fence_id;       /* key into queue->fence_idr */
 	struct msm_gpu_submitqueue *queue;
 	struct pid *pid;    /* submitting process */
@@ -350,6 +365,11 @@ struct msm_gem_submit {
 	} bos[];
 };
 
+static inline struct msm_gem_submit *to_msm_submit(struct drm_sched_job *job)
+{
+	return container_of(job, struct msm_gem_submit, base);
+}
+
 void __msm_gem_submit_destroy(struct kref *kref);
 
 static inline void msm_gem_submit_get(struct msm_gem_submit *submit)
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index f570155bc086..2b158433a6e5 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -33,6 +33,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 {
 	struct msm_gem_submit *submit;
 	uint64_t sz;
+	int ret;
 
 	sz = struct_size(submit, bos, nr_bos) +
 			((u64)nr_cmds * sizeof(submit->cmd[0]));
@@ -44,6 +45,14 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	if (!submit)
 		return ERR_PTR(-ENOMEM);
 
+	ret = drm_sched_job_init(&submit->base, &queue->entity, queue);
+	if (ret) {
+		kfree(submit);
+		return ERR_PTR(ret);
+	}
+
+	xa_init_flags(&submit->deps, XA_FLAGS_ALLOC);
+
 	kref_init(&submit->ref);
 	submit->dev = dev;
 	submit->aspace = queue->ctx->aspace;
@@ -63,6 +72,8 @@ void __msm_gem_submit_destroy(struct kref *kref)
 {
 	struct msm_gem_submit *submit =
 			container_of(kref, struct msm_gem_submit, ref);
+	unsigned long index;
+	struct dma_fence *fence;
 	unsigned i;
 
 	if (submit->fence_id) {
@@ -71,7 +82,14 @@ void __msm_gem_submit_destroy(struct kref *kref)
 		mutex_unlock(&submit->queue->lock);
 	}
 
-	dma_fence_put(submit->fence);
+	xa_for_each (&submit->deps, index, fence) {
+		dma_fence_put(fence);
+	}
+
+	xa_destroy(&submit->deps);
+
+	dma_fence_put(submit->user_fence);
+	dma_fence_put(submit->hw_fence);
 
 	put_pid(submit->pid);
 	msm_submitqueue_put(submit->queue);
@@ -307,7 +325,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
 	int i, ret = 0;
 
 	for (i = 0; i < submit->nr_bos; i++) {
-		struct msm_gem_object *msm_obj = submit->bos[i].obj;
+		struct drm_gem_object *obj = &submit->bos[i].obj->base;
 		bool write = submit->bos[i].flags & MSM_SUBMIT_BO_WRITE;
 
 		if (!write) {
@@ -316,8 +334,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
 			 * strange place to call it.  OTOH this is a
 			 * convenient can-fail point to hook it in.
 			 */
-			ret = dma_resv_reserve_shared(msm_obj->base.resv,
-								1);
+			ret = dma_resv_reserve_shared(obj->resv, 1);
 			if (ret)
 				return ret;
 		}
@@ -325,7 +342,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
 		if (no_implicit)
 			continue;
 
-		ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
+		ret = drm_gem_fence_array_add_implicit(&submit->deps, obj,
 			write);
 		if (ret)
 			break;
@@ -376,9 +393,9 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
 		struct drm_gem_object *obj = &submit->bos[i].obj->base;
 
 		if (submit->bos[i].flags & MSM_SUBMIT_BO_WRITE)
-			dma_resv_add_excl_fence(obj->resv, submit->fence);
+			dma_resv_add_excl_fence(obj->resv, submit->user_fence);
 		else if (submit->bos[i].flags & MSM_SUBMIT_BO_READ)
-			dma_resv_add_shared_fence(obj->resv, submit->fence);
+			dma_resv_add_shared_fence(obj->resv, submit->user_fence);
 	}
 }
 
@@ -517,12 +534,12 @@ struct msm_submit_post_dep {
 	struct dma_fence_chain *chain;
 };
 
-static struct drm_syncobj **msm_wait_deps(struct drm_device *dev,
-                                          struct drm_file *file,
-                                          uint64_t in_syncobjs_addr,
-                                          uint32_t nr_in_syncobjs,
-                                          size_t syncobj_stride,
-                                          struct msm_ringbuffer *ring)
+static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
+                                           struct drm_file *file,
+                                           uint64_t in_syncobjs_addr,
+                                           uint32_t nr_in_syncobjs,
+                                           size_t syncobj_stride,
+                                           struct msm_ringbuffer *ring)
 {
 	struct drm_syncobj **syncobjs = NULL;
 	struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
@@ -546,7 +563,7 @@ static struct drm_syncobj **msm_wait_deps(struct drm_device *dev,
 		}
 
 		if (syncobj_desc.point &&
-		    !drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE)) {
+		    !drm_core_check_feature(submit->dev, DRIVER_SYNCOBJ_TIMELINE)) {
 			ret = -EOPNOTSUPP;
 			break;
 		}
@@ -561,10 +578,7 @@ static struct drm_syncobj **msm_wait_deps(struct drm_device *dev,
 		if (ret)
 			break;
 
-		if (!dma_fence_match_context(fence, ring->fctx->context))
-			ret = dma_fence_wait(fence, true);
-
-		dma_fence_put(fence);
+		ret = drm_gem_fence_array_add(&submit->deps, fence);
 		if (ret)
 			break;
 
@@ -741,47 +755,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	trace_msm_gpu_submit(pid_nr(pid), ring->id, submitid,
 		args->nr_bos, args->nr_cmds);
 
-	if (args->flags & MSM_SUBMIT_FENCE_FD_IN) {
-		struct dma_fence *in_fence;
-
-		in_fence = sync_file_get_fence(args->fence_fd);
-
-		if (!in_fence)
-			return -EINVAL;
-
-		/*
-		 * Wait if the fence is from a foreign context, or if the fence
-		 * array contains any fence from a foreign context.
-		 */
-		ret = 0;
-		if (!dma_fence_match_context(in_fence, ring->fctx->context))
-			ret = dma_fence_wait(in_fence, true);
-
-		dma_fence_put(in_fence);
-		if (ret)
-			return ret;
-	}
-
-	if (args->flags & MSM_SUBMIT_SYNCOBJ_IN) {
-		syncobjs_to_reset = msm_wait_deps(dev, file,
-		                                  args->in_syncobjs,
-		                                  args->nr_in_syncobjs,
-		                                  args->syncobj_stride, ring);
-		if (IS_ERR(syncobjs_to_reset))
-			return PTR_ERR(syncobjs_to_reset);
-	}
-
-	if (args->flags & MSM_SUBMIT_SYNCOBJ_OUT) {
-		post_deps = msm_parse_post_deps(dev, file,
-		                                args->out_syncobjs,
-		                                args->nr_out_syncobjs,
-		                                args->syncobj_stride);
-		if (IS_ERR(post_deps)) {
-			ret = PTR_ERR(post_deps);
-			goto out_post_unlock;
-		}
-	}
-
 	ret = mutex_lock_interruptible(&dev->struct_mutex);
 	if (ret)
 		goto out_post_unlock;
@@ -807,22 +780,50 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (args->flags & MSM_SUBMIT_SUDO)
 		submit->in_rb = true;
 
+	if (args->flags & MSM_SUBMIT_FENCE_FD_IN) {
+		struct dma_fence *in_fence;
+
+		in_fence = sync_file_get_fence(args->fence_fd);
+
+		if (!in_fence) {
+			ret = -EINVAL;
+			goto out_unlock;
+		}
+
+		ret = drm_gem_fence_array_add(&submit->deps, in_fence);
+		if (ret)
+			goto out_unlock;
+	}
+
+	if (args->flags & MSM_SUBMIT_SYNCOBJ_IN) {
+		syncobjs_to_reset = msm_parse_deps(submit, file,
+		                                   args->in_syncobjs,
+		                                   args->nr_in_syncobjs,
+		                                   args->syncobj_stride, ring);
+		if (IS_ERR(syncobjs_to_reset)) {
+			ret = PTR_ERR(syncobjs_to_reset);
+			goto out_unlock;
+		}
+	}
+
+	if (args->flags & MSM_SUBMIT_SYNCOBJ_OUT) {
+		post_deps = msm_parse_post_deps(dev, file,
+		                                args->out_syncobjs,
+		                                args->nr_out_syncobjs,
+		                                args->syncobj_stride);
+		if (IS_ERR(post_deps)) {
+			ret = PTR_ERR(post_deps);
+			goto out_unlock;
+		}
+	}
+
 	ret = submit_lookup_objects(submit, args, file);
 	if (ret)
-		goto out_pre_pm;
+		goto out;
 
 	ret = submit_lookup_cmds(submit, args, file);
 	if (ret)
-		goto out_pre_pm;
-
-	/*
-	 * Thanks to dev_pm_opp opp_table_lock interactions with mm->mmap_sem
-	 * in the resume path, we need to to rpm get before we lock objs.
-	 * Which unfortunately might involve powering up the GPU sooner than
-	 * is necessary.  But at least in the explicit fencing case, we will
-	 * have already done all the fence waiting.
-	 */
-	pm_runtime_get_sync(&gpu->pdev->dev);
+		goto out;
 
 	/* copy_*_user while holding a ww ticket upsets lockdep */
 	ww_acquire_init(&submit->ticket, &reservation_ww_class);
@@ -869,12 +870,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	submit->nr_cmds = i;
 
-	submit->fence = msm_fence_alloc(ring->fctx);
-	if (IS_ERR(submit->fence)) {
-		ret = PTR_ERR(submit->fence);
-		submit->fence = NULL;
-		goto out;
-	}
+	submit->user_fence = dma_fence_get(&submit->base.s_fence->finished);
 
 	/*
 	 * Allocate an id which can be used by WAIT_FENCE ioctl to map back
@@ -882,7 +878,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	 */
 	mutex_lock(&queue->lock);
 	submit->fence_id = idr_alloc_cyclic(&queue->fence_idr,
-			submit->fence, 0, INT_MAX, GFP_KERNEL);
+			submit->user_fence, 0, INT_MAX, GFP_KERNEL);
 	mutex_unlock(&queue->lock);
 	if (submit->fence_id < 0) {
 		ret = submit->fence_id = 0;
@@ -891,7 +887,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	}
 
 	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
-		struct sync_file *sync_file = sync_file_create(submit->fence);
+		struct sync_file *sync_file = sync_file_create(submit->user_fence);
 		if (!sync_file) {
 			ret = -ENOMEM;
 			goto out;
@@ -902,18 +898,19 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	submit_attach_object_fences(submit);
 
-	msm_gpu_submit(gpu, submit);
+	/* The scheduler owns a ref now: */
+	msm_gem_submit_get(submit);
+
+	drm_sched_entity_push_job(&submit->base, &queue->entity);
 
 	args->fence = submit->fence_id;
 
 	msm_reset_syncobjs(syncobjs_to_reset, args->nr_in_syncobjs);
 	msm_process_post_deps(post_deps, args->nr_out_syncobjs,
-	                      submit->fence);
+	                      submit->user_fence);
 
 
 out:
-	pm_runtime_put(&gpu->pdev->dev);
-out_pre_pm:
 	submit_cleanup(submit, !!ret);
 	if (has_ww_ticket)
 		ww_acquire_fini(&submit->ticket);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 5bfc4d24a956..8a3a592da3a4 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -176,8 +176,8 @@ static void update_fences(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 			break;
 
 		msm_update_fence(submit->ring->fctx,
-			submit->fence->seqno);
-		dma_fence_signal(submit->fence);
+			submit->hw_fence->seqno);
+		dma_fence_signal(submit->hw_fence);
 	}
 	spin_unlock_irqrestore(&ring->submit_lock, flags);
 }
@@ -380,10 +380,6 @@ static void recover_worker(struct kthread_work *work)
 			put_task_struct(task);
 		}
 
-		/* msm_rd_dump_submit() needs bo locked to dump: */
-		for (i = 0; i < submit->nr_bos; i++)
-			msm_gem_lock(&submit->bos[i].obj->base);
-
 		if (comm && cmd) {
 			DRM_DEV_ERROR(dev->dev, "%s: offending task: %s (%s)\n",
 				gpu->name, comm, cmd);
@@ -393,9 +389,6 @@ static void recover_worker(struct kthread_work *work)
 		} else {
 			msm_rd_dump_submit(priv->hangrd, submit, NULL);
 		}
-
-		for (i = 0; i < submit->nr_bos; i++)
-			msm_gem_unlock(&submit->bos[i].obj->base);
 	}
 
 	/* Record the crash state */
@@ -704,7 +697,7 @@ static void retire_submits(struct msm_gpu *gpu)
 			 * been signalled, then later submits are not signalled
 			 * either, so we are also done.
 			 */
-			if (submit && dma_fence_is_signaled(submit->fence)) {
+			if (submit && dma_fence_is_signaled(submit->hw_fence)) {
 				retire_submit(gpu, ring, submit);
 			} else {
 				break;
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 579627252540..b912cacaecc0 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -267,6 +267,7 @@ struct msm_gpu_perfcntr {
  *             seqno, protected by submitqueue lock
  * @lock:      submitqueue lock
  * @ref:       reference count
+ * @entity: the submit job-queue
  */
 struct msm_gpu_submitqueue {
 	int id;
@@ -278,6 +279,7 @@ struct msm_gpu_submitqueue {
 	struct idr fence_idr;
 	struct mutex lock;
 	struct kref ref;
+	struct drm_sched_entity entity;
 };
 
 struct msm_gpu_state_bo {
diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index 659e5cc4b40a..b55398a34fa4 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -325,15 +325,19 @@ static void snapshot_buf(struct msm_rd_state *rd,
 	if (!(submit->bos[idx].flags & MSM_SUBMIT_BO_READ))
 		return;
 
+	msm_gem_lock(&obj->base);
 	buf = msm_gem_get_vaddr_active(&obj->base);
 	if (IS_ERR(buf))
-		return;
+		goto out_unlock;
 
 	buf += offset;
 
 	rd_write_section(rd, RD_BUFFER_CONTENTS, buf, size);
 
 	msm_gem_put_vaddr_locked(&obj->base);
+
+out_unlock:
+	msm_gem_unlock(&obj->base);
 }
 
 /* called under struct_mutex */
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 437cca57d005..5643f579ac46 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -7,10 +7,64 @@
 #include "msm_ringbuffer.h"
 #include "msm_gpu.h"
 
+/**
+ * The max # of jobs to write into the hw ringbuffer.
+ */
+static uint num_hw_submissions = 8;
+MODULE_PARM_DESC(num_hw_submissions, "The max number of HW submissions (default 8)");
+module_param(num_hw_submissions, uint, 0600);
+
+static struct dma_fence *msm_job_dependency(struct drm_sched_job *job,
+		struct drm_sched_entity *s_entity)
+{
+	struct msm_gem_submit *submit = to_msm_submit(job);
+
+	if (!xa_empty(&submit->deps))
+		return xa_erase(&submit->deps, submit->last_dep++);
+
+	return NULL;
+}
+
+static struct dma_fence *msm_job_run(struct drm_sched_job *job)
+{
+	struct msm_gem_submit *submit = to_msm_submit(job);
+	struct msm_gpu *gpu = submit->gpu;
+
+	submit->hw_fence = msm_fence_alloc(submit->ring->fctx);
+
+	pm_runtime_get_sync(&gpu->pdev->dev);
+
+	/* TODO move submit path over to using a per-ring lock.. */
+	mutex_lock(&gpu->dev->struct_mutex);
+
+	msm_gpu_submit(gpu, submit);
+
+	mutex_unlock(&gpu->dev->struct_mutex);
+
+	pm_runtime_put(&gpu->pdev->dev);
+
+	return dma_fence_get(submit->hw_fence);
+}
+
+static void msm_job_free(struct drm_sched_job *job)
+{
+	struct msm_gem_submit *submit = to_msm_submit(job);
+
+	drm_sched_job_cleanup(job);
+	msm_gem_submit_put(submit);
+}
+
+const struct drm_sched_backend_ops msm_sched_ops = {
+	.dependency = msm_job_dependency,
+	.run_job = msm_job_run,
+	.free_job = msm_job_free
+};
+
 struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 		void *memptrs, uint64_t memptrs_iova)
 {
 	struct msm_ringbuffer *ring;
+	long sched_timeout;
 	char name[32];
 	int ret;
 
@@ -45,6 +99,16 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	ring->memptrs = memptrs;
 	ring->memptrs_iova = memptrs_iova;
 
+	 /* currently managing hangcheck ourselves: */
+	sched_timeout = MAX_SCHEDULE_TIMEOUT;
+
+	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
+			num_hw_submissions, 0, sched_timeout,
+			NULL, to_msm_bo(ring->bo)->name);
+	if (ret) {
+		goto fail;
+	}
+
 	INIT_LIST_HEAD(&ring->submits);
 	spin_lock_init(&ring->submit_lock);
 	spin_lock_init(&ring->preempt_lock);
@@ -65,6 +129,8 @@ void msm_ringbuffer_destroy(struct msm_ringbuffer *ring)
 	if (IS_ERR_OR_NULL(ring))
 		return;
 
+	drm_sched_fini(&ring->sched);
+
 	msm_fence_context_free(ring->fctx);
 
 	msm_gem_kernel_put(ring->bo, ring->gpu->aspace);
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
index fe55d4a1aa16..d8c63df4e9ca 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.h
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
@@ -7,6 +7,7 @@
 #ifndef __MSM_RINGBUFFER_H__
 #define __MSM_RINGBUFFER_H__
 
+#include "drm/gpu_scheduler.h"
 #include "msm_drv.h"
 
 #define rbmemptr(ring, member)  \
@@ -40,8 +41,19 @@ struct msm_ringbuffer {
 	struct drm_gem_object *bo;
 	uint32_t *start, *end, *cur, *next;
 
+	/*
+	 * The job scheduler for this ring.
+	 */
+	struct drm_gpu_scheduler sched;
+
 	/*
 	 * List of in-flight submits on this ring.  Protected by submit_lock.
+	 *
+	 * Currently just submits that are already written into the ring, not
+	 * submits that are still in drm_gpu_scheduler's queues.  At a later
+	 * step we could probably move to letting drm_gpu_scheduler manage
+	 * hangcheck detection and keep track of submit jobs that are in-
+	 * flight.
 	 */
 	struct list_head submits;
 	spinlock_t submit_lock;
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 66f8d0fb38b0..682ba2a7c0ec 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -14,6 +14,8 @@ void msm_submitqueue_destroy(struct kref *kref)
 
 	idr_destroy(&queue->fence_idr);
 
+	drm_sched_entity_destroy(&queue->entity);
+
 	msm_file_private_put(queue->ctx);
 
 	kfree(queue);
@@ -64,6 +66,9 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 {
 	struct msm_drm_private *priv = drm->dev_private;
 	struct msm_gpu_submitqueue *queue;
+	struct msm_ringbuffer *ring;
+	struct drm_gpu_scheduler *sched;
+	int ret;
 
 	if (!ctx)
 		return -ENODEV;
@@ -83,6 +88,27 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	queue->flags = flags;
 	queue->prio = prio;
 
+	ring = priv->gpu->rb[prio];
+	sched = &ring->sched;
+
+	/*
+	 * TODO we can allow more priorities than we have ringbuffers by
+	 * mapping:
+	 *
+	 *    ring = prio / 3;
+	 *    ent_prio = DRM_SCHED_PRIORITY_MIN + (prio % 3);
+	 *
+	 * Probably avoid using DRM_SCHED_PRIORITY_KERNEL as that is
+	 * treated specially in places.
+	 */
+	ret = drm_sched_entity_init(&queue->entity,
+			DRM_SCHED_PRIORITY_NORMAL,
+			&sched, 1, NULL);
+	if (ret) {
+		kfree(queue);
+		return ret;
+	}
+
 	write_lock(&ctx->queuelock);
 
 	queue->ctx = msm_file_private_get(ctx);
-- 
2.31.1

