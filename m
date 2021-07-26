Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA663D5BDD
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 16:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234605AbhGZN7Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 09:59:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234435AbhGZN7X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 09:59:23 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 127BAC061757;
        Mon, 26 Jul 2021 07:39:52 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id g23-20020a17090a5797b02901765d605e14so273498pji.5;
        Mon, 26 Jul 2021 07:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ekwflhj473tLPM4o66HmQDg1eO85NFT85HSvncxpjEk=;
        b=neKWOI+Dh/7A+2hLuVLh7sTV/IeaMcSKIgZ45a7rDfkn0gRuRqisg9dEL8OVRT2m9l
         9Q20V3okQFhysBuuEPmE4/jXtwhjE8XBZSfSJV6p9hRC9/qlBTNIaRQAbJ6H1Y2hV0xV
         Kdtc3keCi9jcL2bZKz86cFl7pR8urIkZTbloKKZc+hghK1TOXGGWrBBtR2j+NE8YO4RP
         ZJSAFavCoFYMy5Zoq+Rs7zVUfUHJOgyB2uopZcG7jUMtHeXl/XJfx2Z6Co2jpVm9IxRM
         1shePO8vsQ0hVOuenANTj9rTeGP1/rsVJ4gU5pfXSXoVFeYB5fT7aSByIsCby/l4LqH0
         W9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ekwflhj473tLPM4o66HmQDg1eO85NFT85HSvncxpjEk=;
        b=SJi0Vw4CPELH084mIBZEJu6ZN+K78B/8Yd/HjggVrpOvdCTaavhi5kKVFRggCfvJKK
         GpkJJFwXnb7thXznfHWr+vIkpSjtY+fH+E8QdZzjVsJXJT5pftjP0E0omlqaxktmy6Qa
         S6+CzO4OgKvZ9CLVtBqUuL4AF5eJqbVV/BrbVa5bnz94R8In5EkuTGUNSgjB19mbcWLT
         Q6Leeq5NLrX2IgEvdXeTwOOGvnckuvRLBCbpPYFGx12muKK9h896cc4J2SjElpMMKYE/
         yDl58LKeg1Xrd16oV202HNQ+Fs3F0PpcrjtH286N94Wz5GzlSG3noKzSrY8DHehbXazz
         9oLg==
X-Gm-Message-State: AOAM531ItneeWTTkdkZckvzQelNzbo4oehgCALWhq5hoOO1R0URZuR9J
        LVHvZiAMKIKC97x8UQyZjd8=
X-Google-Smtp-Source: ABdhPJwVNoI9TSjltGtPcuwa7z7ZMWNEHSmfqGQrY8pwIfaxziRPGaSoaLtZTEDhY5xgBcvvc0B7sQ==
X-Received: by 2002:aa7:8154:0:b029:310:70d:a516 with SMTP id d20-20020aa781540000b0290310070da516mr18664766pfn.63.1627310391600;
        Mon, 26 Jul 2021 07:39:51 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id 85sm221234pfz.76.2021.07.26.07.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 07:39:50 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK)
Subject: [PATCH 1/2] drm/msm: Let fences read directly from memptrs
Date:   Mon, 26 Jul 2021 07:43:57 -0700
Message-Id: <20210726144359.2179302-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726144359.2179302-1-robdclark@gmail.com>
References: <20210726144359.2179302-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Let dma_fence::signaled, etc, read directly from the address that the hw
is writing with updated completed fence seqno, so we can potentially
notice that the fence is signaled sooner.

Plus add some docs.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_fence.c      | 11 ++++++--
 drivers/gpu/drm/msm/msm_fence.h      | 41 +++++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_ringbuffer.c |  2 +-
 3 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
index cd59a5918038..b92a9091a1e2 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -11,7 +11,8 @@
 
 
 struct msm_fence_context *
-msm_fence_context_alloc(struct drm_device *dev, const char *name)
+msm_fence_context_alloc(struct drm_device *dev, volatile uint32_t *fenceptr,
+		const char *name)
 {
 	struct msm_fence_context *fctx;
 
@@ -22,6 +23,7 @@ msm_fence_context_alloc(struct drm_device *dev, const char *name)
 	fctx->dev = dev;
 	strncpy(fctx->name, name, sizeof(fctx->name));
 	fctx->context = dma_fence_context_alloc(1);
+	fctx->fenceptr = fenceptr;
 	init_waitqueue_head(&fctx->event);
 	spin_lock_init(&fctx->spinlock);
 
@@ -35,7 +37,12 @@ void msm_fence_context_free(struct msm_fence_context *fctx)
 
 static inline bool fence_completed(struct msm_fence_context *fctx, uint32_t fence)
 {
-	return (int32_t)(fctx->completed_fence - fence) >= 0;
+	/*
+	 * Note: Check completed_fence first, as fenceptr is in a write-combine
+	 * mapping, so it will be more expensive to read.
+	 */
+	return (int32_t)(fctx->completed_fence - fence) >= 0 ||
+		(int32_t)(*fctx->fenceptr - fence) >= 0;
 }
 
 /* legacy path for WAIT_FENCE ioctl: */
diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fence.h
index 2d9af66dcca5..6ab97062ff1a 100644
--- a/drivers/gpu/drm/msm/msm_fence.h
+++ b/drivers/gpu/drm/msm/msm_fence.h
@@ -9,19 +9,52 @@
 
 #include "msm_drv.h"
 
+/**
+ * struct msm_fence_context - fence context for gpu
+ *
+ * Each ringbuffer has a single fence context, with the GPU writing an
+ * incrementing fence seqno at the end of each submit
+ */
 struct msm_fence_context {
 	struct drm_device *dev;
+	/** name: human readable name for fence timeline */
 	char name[32];
+	/** context: see dma_fence_context_alloc() */
 	unsigned context;
-	/* last_fence == completed_fence --> no pending work */
-	uint32_t last_fence;          /* last assigned fence */
-	uint32_t completed_fence;     /* last completed fence */
+
+	/**
+	 * last_fence:
+	 *
+	 * Last assigned fence, incremented each time a fence is created
+	 * on this fence context.  If last_fence == completed_fence,
+	 * there is no remaining pending work
+	 */
+	uint32_t last_fence;
+
+	/**
+	 * completed_fence:
+	 *
+	 * The last completed fence, updated from the CPU after interrupt
+	 * from GPU
+	 */
+	uint32_t completed_fence;
+
+	/**
+	 * fenceptr:
+	 *
+	 * The address that the GPU directly writes with completed fence
+	 * seqno.  This can be ahead of completed_fence.  We can peek at
+	 * this to see if a fence has already signaled but the CPU hasn't
+	 * gotten around to handling the irq and updating completed_fence
+	 */
+	volatile uint32_t *fenceptr;
+
 	wait_queue_head_t event;
 	spinlock_t spinlock;
 };
 
 struct msm_fence_context * msm_fence_context_alloc(struct drm_device *dev,
-		const char *name);
+		volatile uint32_t *fenceptr, const char *name);
 void msm_fence_context_free(struct msm_fence_context *fctx);
 
 int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 4d2a2a4abef8..7e92d9532454 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -51,7 +51,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 
 	snprintf(name, sizeof(name), "gpu-ring-%d", ring->id);
 
-	ring->fctx = msm_fence_context_alloc(gpu->dev, name);
+	ring->fctx = msm_fence_context_alloc(gpu->dev, &ring->memptrs->fence, name);
 
 	return ring;
 
-- 
2.31.1

