Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA5EC3E36C1
	for <lists+linux-media@lfdr.de>; Sat,  7 Aug 2021 20:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhHGSea (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Aug 2021 14:34:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbhHGSe1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Aug 2021 14:34:27 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92430C06179F;
        Sat,  7 Aug 2021 11:34:08 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id z3so11698344plg.8;
        Sat, 07 Aug 2021 11:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TpkeEXQhr2S4UyzNS56PH0wCmoq9BqqIoAycaUiRzLM=;
        b=nFd2fMokbd9p8iargG783kX4Fdc3opawLge05yqsJpyytoPGioS0VfKBIFUNIFUeIo
         WStvgIrCiYyjVS9upn2DrL6/K/QNRk6uEt8NB01Zm9wfAPOo9PBOsl9sWzQLF25oAnO1
         oi7GnTO50PD9RuVShI0ki9jrmq8EITBAzoS2zdNMAdVUuVnF28gsXy7H9fr1gT+1apsh
         Ttd/q/LV/WvOwcGVpuhM3L9+tVAulDlvs2swV6Iiv/IF+a9psWaJqOtEN2p8mJz3CaVX
         2f8HnU8s6LpkWGElM4R+3LWsKbofjPxrN+aymAWTCdpcIcSWney0k1oZRlMXna/efwuG
         5mUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TpkeEXQhr2S4UyzNS56PH0wCmoq9BqqIoAycaUiRzLM=;
        b=gQZ31N5AkXNcw9wg7nQvKpnxyv5ODhMh+QCDlG03JlhkWG70BIUN1WRG4R0GyJ1tKM
         2Zgp55jwqXYLEkHAr94XQ6bWcFT5odwQA+bPlRwtBTxunqTLpJz3kFkmn5iKymoEDOeZ
         gOKvB0xVc4GE09xlMjtYYcRnGv9Zw8GS0N3EU28F0CMrzFNNH3QRhaYTsLvh+v34nrKM
         jj+I5rMQAujs1a+Dem62xhQBbejbgmm9AlnYLdNXdv8Xgo06NMQzPKWjGJqd2rg0G5So
         v3d7aceSFiPO51dCcTXCOs7tos+iRq7d/aZQFbo2UMu8FX42+js5gyw3u7gDijW5dfhO
         s9Fg==
X-Gm-Message-State: AOAM531/E7eGu8MlCzpz+cLOqjwLuccvzOYOK+eUNTY2rvxn6Kx8926M
        qHy/KV3a9iO3b21ZZskqTGE=
X-Google-Smtp-Source: ABdhPJzjHivm8ber6DP/cVUoRocOtcfm9KvbegEB9TbzOSCadQ7LKvQ0AnbAod1Q5gfjWKITUqSVfQ==
X-Received: by 2002:a63:d456:: with SMTP id i22mr454262pgj.421.1628361248105;
        Sat, 07 Aug 2021 11:34:08 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id q18sm15307838pfj.178.2021.08.07.11.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 11:34:07 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK)
Subject: [PATCH v2 5/5] drm/msm: Add deadline based boost support
Date:   Sat,  7 Aug 2021 11:37:59 -0700
Message-Id: <20210807183804.459850-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210807183804.459850-1-robdclark@gmail.com>
References: <20210807183804.459850-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_fence.c       | 76 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_fence.h       | 20 +++++++
 drivers/gpu/drm/msm/msm_gpu.h         |  1 +
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 20 +++++++
 4 files changed, 117 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
index f2cece542c3f..67c2a96e1c85 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -8,6 +8,37 @@
 
 #include "msm_drv.h"
 #include "msm_fence.h"
+#include "msm_gpu.h"
+
+static inline bool fence_completed(struct msm_fence_context *fctx, uint32_t fence);
+
+static struct msm_gpu *fctx2gpu(struct msm_fence_context *fctx)
+{
+	struct msm_drm_private *priv = fctx->dev->dev_private;
+	return priv->gpu;
+}
+
+static enum hrtimer_restart deadline_timer(struct hrtimer *t)
+{
+	struct msm_fence_context *fctx = container_of(t,
+			struct msm_fence_context, deadline_timer);
+
+	kthread_queue_work(fctx2gpu(fctx)->worker, &fctx->deadline_work);
+
+	return HRTIMER_NORESTART;
+}
+
+static void deadline_work(struct kthread_work *work)
+{
+	struct msm_fence_context *fctx = container_of(work,
+			struct msm_fence_context, deadline_work);
+
+	/* If deadline fence has already passed, nothing to do: */
+	if (fence_completed(fctx, fctx->next_deadline_fence))
+		return;
+
+	msm_devfreq_boost(fctx2gpu(fctx), 2);
+}
 
 
 struct msm_fence_context *
@@ -26,6 +57,13 @@ msm_fence_context_alloc(struct drm_device *dev, volatile uint32_t *fenceptr,
 	fctx->fenceptr = fenceptr;
 	spin_lock_init(&fctx->spinlock);
 
+	hrtimer_init(&fctx->deadline_timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
+	fctx->deadline_timer.function = deadline_timer;
+
+	kthread_init_work(&fctx->deadline_work, deadline_work);
+
+	fctx->next_deadline = ktime_get();
+
 	return fctx;
 }
 
@@ -49,6 +87,8 @@ void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)
 {
 	spin_lock(&fctx->spinlock);
 	fctx->completed_fence = max(fence, fctx->completed_fence);
+	if (fence_completed(fctx, fctx->next_deadline_fence))
+		hrtimer_cancel(&fctx->deadline_timer);
 	spin_unlock(&fctx->spinlock);
 }
 
@@ -79,10 +119,46 @@ static bool msm_fence_signaled(struct dma_fence *fence)
 	return fence_completed(f->fctx, f->base.seqno);
 }
 
+static void msm_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
+{
+	struct msm_fence *f = to_msm_fence(fence);
+	struct msm_fence_context *fctx = f->fctx;
+	unsigned long flags;
+	ktime_t now;
+
+	spin_lock_irqsave(&fctx->spinlock, flags);
+	now = ktime_get();
+
+	if (ktime_after(now, fctx->next_deadline) ||
+			ktime_before(deadline, fctx->next_deadline)) {
+		fctx->next_deadline = deadline;
+		fctx->next_deadline_fence =
+			max(fctx->next_deadline_fence, (uint32_t)fence->seqno);
+
+		/*
+		 * Set timer to trigger boost 3ms before deadline, or
+		 * if we are already less than 3ms before the deadline
+		 * schedule boost work immediately.
+		 */
+		deadline = ktime_sub(deadline, ms_to_ktime(3));
+
+		if (ktime_after(now, deadline)) {
+			kthread_queue_work(fctx2gpu(fctx)->worker,
+					&fctx->deadline_work);
+		} else {
+			hrtimer_start(&fctx->deadline_timer, deadline,
+					HRTIMER_MODE_ABS);
+		}
+	}
+
+	spin_unlock_irqrestore(&fctx->spinlock, flags);
+}
+
 static const struct dma_fence_ops msm_fence_ops = {
 	.get_driver_name = msm_fence_get_driver_name,
 	.get_timeline_name = msm_fence_get_timeline_name,
 	.signaled = msm_fence_signaled,
+	.set_deadline = msm_fence_set_deadline,
 };
 
 struct dma_fence *
diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fence.h
index 4783db528bcc..d34e853c555a 100644
--- a/drivers/gpu/drm/msm/msm_fence.h
+++ b/drivers/gpu/drm/msm/msm_fence.h
@@ -50,6 +50,26 @@ struct msm_fence_context {
 	volatile uint32_t *fenceptr;
 
 	spinlock_t spinlock;
+
+	/*
+	 * TODO this doesn't really deal with multiple deadlines, like
+	 * if userspace got multiple frames ahead.. OTOH atomic updates
+	 * don't queue, so maybe that is ok
+	 */
+
+	/** next_deadline: Time of next deadline */
+	ktime_t next_deadline;
+
+	/**
+	 * next_deadline_fence:
+	 *
+	 * Fence value for next pending deadline.  The deadline timer is
+	 * canceled when this fence is signaled.
+	 */
+	uint32_t next_deadline_fence;
+
+	struct hrtimer deadline_timer;
+	struct kthread_work deadline_work;
 };
 
 struct msm_fence_context * msm_fence_context_alloc(struct drm_device *dev,
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 0e4b45bff2e6..e031c9b495ed 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -425,6 +425,7 @@ void msm_devfreq_init(struct msm_gpu *gpu);
 void msm_devfreq_cleanup(struct msm_gpu *gpu);
 void msm_devfreq_resume(struct msm_gpu *gpu);
 void msm_devfreq_suspend(struct msm_gpu *gpu);
+void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor);
 void msm_devfreq_active(struct msm_gpu *gpu);
 void msm_devfreq_idle(struct msm_gpu *gpu);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 0a1ee20296a2..8a8d7b9028a3 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -144,6 +144,26 @@ void msm_devfreq_suspend(struct msm_gpu *gpu)
 	devfreq_suspend_device(gpu->devfreq.devfreq);
 }
 
+void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor)
+{
+	struct msm_gpu_devfreq *df = &gpu->devfreq;
+	unsigned long freq;
+
+	/*
+	 * Hold devfreq lock to synchronize with get_dev_status()/
+	 * target() callbacks
+	 */
+	mutex_lock(&df->devfreq->lock);
+
+	freq = get_freq(gpu);
+
+	freq *= factor;
+
+	msm_devfreq_target(&gpu->pdev->dev, &freq, 0);
+
+	mutex_unlock(&df->devfreq->lock);
+}
+
 void msm_devfreq_active(struct msm_gpu *gpu)
 {
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
-- 
2.31.1

