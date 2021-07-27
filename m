Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9693F3D7BB5
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 19:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhG0RIA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 13:08:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231591AbhG0RH6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 13:07:58 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E39EFC061765;
        Tue, 27 Jul 2021 10:07:57 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id t21so16366783plr.13;
        Tue, 27 Jul 2021 10:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DealqZ52rle5Sxs0OYfG57W/B0C5w2BihQ08hiiaTrI=;
        b=Jk8H99JcpHrqE+fOYPrIN011YUSn4Aazj9krneOm9/DOnjtoLBR5lXKmFXttXQnqiC
         BDj1ZWkKEzAjlXc7KAZ8zKgbVCMJdB2imXy4Xtc4bLN6SnlPFOtnmlhTN7D/Xitpa3XE
         REqEZrIazcD0woe7rZZ1kTMVoyNHbm2C7XmI7l3GZ6TmYNoPnue17suXInhoYzVjMw62
         sx+nhb32kf+5u+k0Jy0YlwcbMKtQszvbcOOVQvRybay3lg9yIFyrTgt8J4JSmfe+aWCa
         L33WZ1ek1yT6qf4KVKqVWgKk/CCepIQKGXDIoQBkndAzZ6jNWG4X972QfvYcnShbCU5P
         ENWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DealqZ52rle5Sxs0OYfG57W/B0C5w2BihQ08hiiaTrI=;
        b=XSInLeivEVRHuiUBDgnnOUhYt6V4PE6h3unFN4DUUfSk2l8liwCj1uDcAdfNZ6RStZ
         cpGFWpOegOp81pBVbjpfY+az8a962DLtrtaAYnAvwqthwemK8UrglDldEe4Vjxsbz+bi
         6CUa4NcE9j87fLss2hDYyv1jhwj1H6n+mSwnrIGn9hIUi5Y37JYor1BbPjCRbl7jivTB
         Ch4EMyPZLuATrUPdMAfiQDMiLyynCvE4nsOldeoYYS8Hgd/mPQGoi2cbNRbemPtH7lKL
         P4R1yMhptdRtY7YCkvM9i7piK9F7umqcyJXDhUxQZUG4MKsmVERUKQBZkqtJlsw4/Oqj
         MT9g==
X-Gm-Message-State: AOAM5328cHc7ZJqJPpEu6K2jRueMhVhDH1MhFtOQseQDN/WlIm61u/lm
        XRr/21bQDk3tWTCFe0Jha6M=
X-Google-Smtp-Source: ABdhPJwZtl+81DgWXuoySzIm7Ky4vsO8ckbV1Y2odpC1lSL3yu5GQJHv9M+3I7H2Ptc5c4I2mZFhiw==
X-Received: by 2002:a17:90a:6782:: with SMTP id o2mr5111043pjj.165.1627405677468;
        Tue, 27 Jul 2021 10:07:57 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id v27sm4454116pfi.166.2021.07.27.10.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 10:07:56 -0700 (PDT)
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
Subject: [PATCH v3 07/13] drm/msm: Track "seqno" fences by idr
Date:   Tue, 27 Jul 2021 10:11:23 -0700
Message-Id: <20210727171143.2549475-8-robdclark@gmail.com>
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

Previously the (non-fd) fence returned from submit ioctl was a raw
seqno, which is scoped to the ring.  But from UABI standpoint, the
ioctls related to seqno fences all specify a submitqueue.  We can
take advantage of that to replace the seqno fences with a cyclic idr
handle.

This is in preperation for moving to drm scheduler, at which point
the submit ioctl will return after queuing the submit job to the
scheduler, but before the submit is written into the ring (and
therefore before a ring seqno has been assigned).  Which means we
need to replace the dma_fence that userspace may need to wait on
with a scheduler fence.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_drv.c         | 30 +++++++++++++++++++--
 drivers/gpu/drm/msm/msm_fence.c       | 39 ---------------------------
 drivers/gpu/drm/msm/msm_fence.h       |  2 --
 drivers/gpu/drm/msm/msm_gem.h         |  1 +
 drivers/gpu/drm/msm/msm_gem_submit.c  | 23 +++++++++++++++-
 drivers/gpu/drm/msm/msm_gpu.h         |  5 ++++
 drivers/gpu/drm/msm/msm_submitqueue.c |  5 ++++
 7 files changed, 61 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9b8fa2ad0d84..1594ae39d54f 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -911,6 +911,7 @@ static int msm_ioctl_wait_fence(struct drm_device *dev, void *data,
 	ktime_t timeout = to_ktime(args->timeout);
 	struct msm_gpu_submitqueue *queue;
 	struct msm_gpu *gpu = priv->gpu;
+	struct dma_fence *fence;
 	int ret;
 
 	if (args->pad) {
@@ -925,10 +926,35 @@ static int msm_ioctl_wait_fence(struct drm_device *dev, void *data,
 	if (!queue)
 		return -ENOENT;
 
-	ret = msm_wait_fence(gpu->rb[queue->prio]->fctx, args->fence, &timeout,
-		true);
+	/*
+	 * Map submitqueue scoped "seqno" (which is actually an idr key)
+	 * back to underlying dma-fence
+	 *
+	 * The fence is removed from the fence_idr when the submit is
+	 * retired, so if the fence is not found it means there is nothing
+	 * to wait for
+	 */
+	ret = mutex_lock_interruptible(&queue->lock);
+	if (ret)
+		return ret;
+	fence = idr_find(&queue->fence_idr, args->fence);
+	if (fence)
+		fence = dma_fence_get_rcu(fence);
+	mutex_unlock(&queue->lock);
+
+	if (!fence)
+		return 0;
 
+	ret = dma_fence_wait_timeout(fence, true, timeout_to_jiffies(&timeout));
+	if (ret == 0) {
+		ret = -ETIMEDOUT;
+	} else if (ret != -ERESTARTSYS) {
+		ret = 0;
+	}
+
+	dma_fence_put(fence);
 	msm_submitqueue_put(queue);
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
index b92a9091a1e2..d8228029708e 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -45,45 +45,6 @@ static inline bool fence_completed(struct msm_fence_context *fctx, uint32_t fenc
 		(int32_t)(*fctx->fenceptr - fence) >= 0;
 }
 
-/* legacy path for WAIT_FENCE ioctl: */
-int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
-		ktime_t *timeout, bool interruptible)
-{
-	int ret;
-
-	if (fence > fctx->last_fence) {
-		DRM_ERROR_RATELIMITED("%s: waiting on invalid fence: %u (of %u)\n",
-				fctx->name, fence, fctx->last_fence);
-		return -EINVAL;
-	}
-
-	if (!timeout) {
-		/* no-wait: */
-		ret = fence_completed(fctx, fence) ? 0 : -EBUSY;
-	} else {
-		unsigned long remaining_jiffies = timeout_to_jiffies(timeout);
-
-		if (interruptible)
-			ret = wait_event_interruptible_timeout(fctx->event,
-				fence_completed(fctx, fence),
-				remaining_jiffies);
-		else
-			ret = wait_event_timeout(fctx->event,
-				fence_completed(fctx, fence),
-				remaining_jiffies);
-
-		if (ret == 0) {
-			DBG("timeout waiting for fence: %u (completed: %u)",
-					fence, fctx->completed_fence);
-			ret = -ETIMEDOUT;
-		} else if (ret != -ERESTARTSYS) {
-			ret = 0;
-		}
-	}
-
-	return ret;
-}
-
 /* called from workqueue */
 void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)
 {
diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fence.h
index 6ab97062ff1a..6de97d0f5153 100644
--- a/drivers/gpu/drm/msm/msm_fence.h
+++ b/drivers/gpu/drm/msm/msm_fence.h
@@ -57,8 +57,6 @@ struct msm_fence_context * msm_fence_context_alloc(struct drm_device *dev,
 		volatile uint32_t *fenceptr, const char *name);
 void msm_fence_context_free(struct msm_fence_context *fctx);
 
-int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
-		ktime_t *timeout, bool interruptible);
 void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence);
 
 struct dma_fence * msm_fence_alloc(struct msm_fence_context *fctx);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index da3af702a6c8..e0579abda5b9 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -320,6 +320,7 @@ struct msm_gem_submit {
 	struct ww_acquire_ctx ticket;
 	uint32_t seqno;		/* Sequence number of the submit on the ring */
 	struct dma_fence *fence;
+	int fence_id;       /* key into queue->fence_idr */
 	struct msm_gpu_submitqueue *queue;
 	struct pid *pid;    /* submitting process */
 	bool fault_dumped;  /* Limit devcoredump dumping to one per submit */
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 4f02fa3c78f9..f6f595aae2c5 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -68,7 +68,14 @@ void __msm_gem_submit_destroy(struct kref *kref)
 			container_of(kref, struct msm_gem_submit, ref);
 	unsigned i;
 
+	if (submit->fence_id) {
+		mutex_lock(&submit->queue->lock);
+		idr_remove(&submit->queue->fence_idr, submit->fence_id);
+		mutex_unlock(&submit->queue->lock);
+	}
+
 	dma_fence_put(submit->fence);
+
 	put_pid(submit->pid);
 	msm_submitqueue_put(submit->queue);
 
@@ -872,6 +879,20 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		goto out;
 	}
 
+	/*
+	 * Allocate an id which can be used by WAIT_FENCE ioctl to map back
+	 * to the underlying fence.
+	 */
+	mutex_lock(&queue->lock);
+	submit->fence_id = idr_alloc_cyclic(&queue->fence_idr,
+			submit->fence, 0, INT_MAX, GFP_KERNEL);
+	mutex_unlock(&queue->lock);
+	if (submit->fence_id < 0) {
+		ret = submit->fence_id = 0;
+		submit->fence_id = 0;
+		goto out;
+	}
+
 	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
 		struct sync_file *sync_file = sync_file_create(submit->fence);
 		if (!sync_file) {
@@ -886,7 +907,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	msm_gpu_submit(gpu, submit);
 
-	args->fence = submit->fence->seqno;
+	args->fence = submit->fence_id;
 
 	msm_reset_syncobjs(syncobjs_to_reset, args->nr_in_syncobjs);
 	msm_process_post_deps(post_deps, args->nr_out_syncobjs,
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 96efcb31e502..579627252540 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -263,6 +263,9 @@ struct msm_gpu_perfcntr {
  *             which set of pgtables do submits jobs associated with the
  *             submitqueue use)
  * @node:      node in the context's list of submitqueues
+ * @fence_idr: maps fence-id to dma_fence for userspace visible fence
+ *             seqno, protected by submitqueue lock
+ * @lock:      submitqueue lock
  * @ref:       reference count
  */
 struct msm_gpu_submitqueue {
@@ -272,6 +275,8 @@ struct msm_gpu_submitqueue {
 	int faults;
 	struct msm_file_private *ctx;
 	struct list_head node;
+	struct idr fence_idr;
+	struct mutex lock;
 	struct kref ref;
 };
 
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 9e9fec61d629..66f8d0fb38b0 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -12,6 +12,8 @@ void msm_submitqueue_destroy(struct kref *kref)
 	struct msm_gpu_submitqueue *queue = container_of(kref,
 		struct msm_gpu_submitqueue, ref);
 
+	idr_destroy(&queue->fence_idr);
+
 	msm_file_private_put(queue->ctx);
 
 	kfree(queue);
@@ -89,6 +91,9 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	if (id)
 		*id = queue->id;
 
+	idr_init(&queue->fence_idr);
+	mutex_init(&queue->lock);
+
 	list_add_tail(&queue->node, &ctx->submitqueues);
 
 	write_unlock(&ctx->queuelock);
-- 
2.31.1

