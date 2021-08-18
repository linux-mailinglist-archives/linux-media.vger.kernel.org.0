Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3E0A3F0208
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 12:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234477AbhHRKzZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 06:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233170AbhHRKzV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 06:55:21 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44AD4C061764
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 03:54:47 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id k5-20020a05600c1c85b02902e699a4d20cso1493480wms.2
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 03:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pHFamtKgylcj73W8jHv3qksrTuCKhhIMmt3KIXV0ys4=;
        b=YNb7GvS3waY+ZWtK7uUZD3xYg30HRi+zJxPP34tGTIoaMGWz40BkouEVKNKZL339zb
         pL5CuIQcx4hxktmaJ4cUDje+HSobtn5DzVYZWy1zyWA6OZEwY9IGITh3w/sgFnrPSwVR
         sPepjzCp3yjYGvsJ2ATjydsRpt72R7+LFZHjhBlXGKKEtFkTGiEYoB3wZPQxEj81VALx
         f3q1NIguviVcDpMQIrzhPMC4hftmj3yNutxQRE2xZ7Jc50clBI/JO+pTQqFK2jEmJE05
         lbH/dn5fazJjYH3kP4FbLX+Nikgzx7es++nItaJB+amKrZCxMLzstbp78vQr+xDz0Cg+
         td3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pHFamtKgylcj73W8jHv3qksrTuCKhhIMmt3KIXV0ys4=;
        b=mzoEvOH+cOj+DSR22HIvZuZ1F0x6OA8JQ3CADWNAXz9uhY5LZb45bbUGFVvLxefYRf
         tap9qYanzH2tPEYWpb4hPNezXC8UeKbh8lUeUfCjqAAShb8kxo8d7w2tfEHLoCDz6VNf
         cPF77ubLoElBjJMOxAM8K8aEbUxfb+R9Lci+xoYwbRGXoO588dlht1XNOeqfkBZRcVo8
         RPTiIB5i32OtcTfgJCMZIUPHkRGcMknxb6wNhGE8PvPVnFIf/p2TIq6cnvS3zKzECJzb
         g7aIOpa9crwH8F8moR/qcE1CQD5BhzF4Q0dDXjatAMhXL4KW/2OmVPbSgvgxbj8ldtOr
         TMRA==
X-Gm-Message-State: AOAM533jJJH6YJwdDDf66P+UzrzpF693lcMy2mHiNMCxYM7W0Jy/AKCi
        eba3IYBIvGjcY1e2EmFVTdw=
X-Google-Smtp-Source: ABdhPJyiPYFVWfW4gUkMCxblWsPF0UruC4teV5FQ2TU4ys+xSOw/sB0K7/cJWwBn4R27xmAp1DhTAQ==
X-Received: by 2002:a05:600c:1d01:: with SMTP id l1mr7814922wms.178.1629284085819;
        Wed, 18 Aug 2021 03:54:45 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id y4sm4646352wmi.22.2021.08.18.03.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 03:54:45 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     hridya@google.com, john.stultz@linaro.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        gustavo@padovan.org, linux-media@vger.kernel.org,
        adelva@google.com, sspatil@google.com, daniel@ffwll.ch
Subject: [PATCH 1/2] dma-buf: nuke DMA_FENCE_TRACE macros v2
Date:   Wed, 18 Aug 2021 12:54:42 +0200
Message-Id: <20210818105443.1578-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Only the DRM GPU scheduler, radeon and amdgpu where using them and they depend
on a non existing config option to actually emit some code.

v2: keep the signal path as is for now

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 10 +---------
 drivers/gpu/drm/radeon/radeon_fence.c     | 24 ++++-------------------
 drivers/gpu/drm/scheduler/sched_fence.c   | 18 ++---------------
 include/linux/dma-fence.h                 | 22 ---------------------
 4 files changed, 7 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 0b1c48590c43..c65994e382bd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -246,7 +246,6 @@ bool amdgpu_fence_process(struct amdgpu_ring *ring)
 	struct amdgpu_fence_driver *drv = &ring->fence_drv;
 	struct amdgpu_device *adev = ring->adev;
 	uint32_t seq, last_seq;
-	int r;
 
 	do {
 		last_seq = atomic_read(&ring->fence_drv.last_seq);
@@ -278,12 +277,7 @@ bool amdgpu_fence_process(struct amdgpu_ring *ring)
 		if (!fence)
 			continue;
 
-		r = dma_fence_signal(fence);
-		if (!r)
-			DMA_FENCE_TRACE(fence, "signaled from irq context\n");
-		else
-			BUG();
-
+		dma_fence_signal(fence);
 		dma_fence_put(fence);
 		pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
@@ -639,8 +633,6 @@ static bool amdgpu_fence_enable_signaling(struct dma_fence *f)
 	if (!timer_pending(&ring->fence_drv.fallback_timer))
 		amdgpu_fence_schedule_fallback(ring);
 
-	DMA_FENCE_TRACE(&fence->base, "armed on ring %i!\n", ring->idx);
-
 	return true;
 }
 
diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
index 18f2c2e0dfb3..3f351d222cbb 100644
--- a/drivers/gpu/drm/radeon/radeon_fence.c
+++ b/drivers/gpu/drm/radeon/radeon_fence.c
@@ -176,18 +176,11 @@ static int radeon_fence_check_signaled(wait_queue_entry_t *wait, unsigned mode,
 	 */
 	seq = atomic64_read(&fence->rdev->fence_drv[fence->ring].last_seq);
 	if (seq >= fence->seq) {
-		int ret = dma_fence_signal_locked(&fence->base);
-
-		if (!ret)
-			DMA_FENCE_TRACE(&fence->base, "signaled from irq context\n");
-		else
-			DMA_FENCE_TRACE(&fence->base, "was already signaled\n");
-
+		dma_fence_signal_locked(&fence->base);
 		radeon_irq_kms_sw_irq_put(fence->rdev, fence->ring);
 		__remove_wait_queue(&fence->rdev->fence_queue, &fence->fence_wake);
 		dma_fence_put(&fence->base);
-	} else
-		DMA_FENCE_TRACE(&fence->base, "pending\n");
+	}
 	return 0;
 }
 
@@ -422,8 +415,6 @@ static bool radeon_fence_enable_signaling(struct dma_fence *f)
 	fence->fence_wake.func = radeon_fence_check_signaled;
 	__add_wait_queue(&rdev->fence_queue, &fence->fence_wake);
 	dma_fence_get(f);
-
-	DMA_FENCE_TRACE(&fence->base, "armed on ring %i!\n", fence->ring);
 	return true;
 }
 
@@ -441,11 +432,7 @@ bool radeon_fence_signaled(struct radeon_fence *fence)
 		return true;
 
 	if (radeon_fence_seq_signaled(fence->rdev, fence->seq, fence->ring)) {
-		int ret;
-
-		ret = dma_fence_signal(&fence->base);
-		if (!ret)
-			DMA_FENCE_TRACE(&fence->base, "signaled from radeon_fence_signaled\n");
+		dma_fence_signal(&fence->base);
 		return true;
 	}
 	return false;
@@ -550,7 +537,6 @@ long radeon_fence_wait_timeout(struct radeon_fence *fence, bool intr, long timeo
 {
 	uint64_t seq[RADEON_NUM_RINGS] = {};
 	long r;
-	int r_sig;
 
 	/*
 	 * This function should not be called on !radeon fences.
@@ -567,9 +553,7 @@ long radeon_fence_wait_timeout(struct radeon_fence *fence, bool intr, long timeo
 		return r;
 	}
 
-	r_sig = dma_fence_signal(&fence->base);
-	if (!r_sig)
-		DMA_FENCE_TRACE(&fence->base, "signaled from fence_wait\n");
+	dma_fence_signal(&fence->base);
 	return r;
 }
 
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 69de2c76731f..3736746c47bd 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -50,26 +50,12 @@ static void __exit drm_sched_fence_slab_fini(void)
 
 void drm_sched_fence_scheduled(struct drm_sched_fence *fence)
 {
-	int ret = dma_fence_signal(&fence->scheduled);
-
-	if (!ret)
-		DMA_FENCE_TRACE(&fence->scheduled,
-				"signaled from irq context\n");
-	else
-		DMA_FENCE_TRACE(&fence->scheduled,
-				"was already signaled\n");
+	dma_fence_signal(&fence->scheduled);
 }
 
 void drm_sched_fence_finished(struct drm_sched_fence *fence)
 {
-	int ret = dma_fence_signal(&fence->finished);
-
-	if (!ret)
-		DMA_FENCE_TRACE(&fence->finished,
-				"signaled from irq context\n");
-	else
-		DMA_FENCE_TRACE(&fence->finished,
-				"was already signaled\n");
+	dma_fence_signal(&fence->finished);
 }
 
 static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 6ffb4b2c6371..4cc119ab272f 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -590,26 +590,4 @@ struct dma_fence *dma_fence_get_stub(void);
 struct dma_fence *dma_fence_allocate_private_stub(void);
 u64 dma_fence_context_alloc(unsigned num);
 
-#define DMA_FENCE_TRACE(f, fmt, args...) \
-	do {								\
-		struct dma_fence *__ff = (f);				\
-		if (IS_ENABLED(CONFIG_DMA_FENCE_TRACE))			\
-			pr_info("f %llu#%llu: " fmt,			\
-				__ff->context, __ff->seqno, ##args);	\
-	} while (0)
-
-#define DMA_FENCE_WARN(f, fmt, args...) \
-	do {								\
-		struct dma_fence *__ff = (f);				\
-		pr_warn("f %llu#%llu: " fmt, __ff->context, __ff->seqno,\
-			 ##args);					\
-	} while (0)
-
-#define DMA_FENCE_ERR(f, fmt, args...) \
-	do {								\
-		struct dma_fence *__ff = (f);				\
-		pr_err("f %llu#%llu: " fmt, __ff->context, __ff->seqno,	\
-			##args);					\
-	} while (0)
-
 #endif /* __LINUX_DMA_FENCE_H */
-- 
2.25.1

