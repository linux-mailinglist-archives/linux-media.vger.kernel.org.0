Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 601663CFD3E
	for <lists+linux-media@lfdr.de>; Tue, 20 Jul 2021 17:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239736AbhGTOeZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Jul 2021 10:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240273AbhGTOYt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Jul 2021 10:24:49 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD45C061794;
        Tue, 20 Jul 2021 08:03:09 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id v14so11548788plg.9;
        Tue, 20 Jul 2021 08:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YjsQqg/cyLrvH6AHlxUB+OYVHKKVa13wNGyeIOclLuU=;
        b=Bwya6iL1RBmmeGnDLmxE++cJ04phd36pitzI5Fg/6+79njD2oyBhzaQONWmikFuB3v
         sWOWXVU3XANaWQj6Mi6PD79h7wIzAVu1HT5fHWRFBtYKzK/VsiyBK8irALWIFOIiPfxe
         SumHHYYFE/6VlsrVL32MklAzmYQxlvTV8x+UX/RKxN55gzSmbxS8xlL4D7T69pZKCxbR
         3hYVNceHlNyb9ju3HO0FaWK5vUkOa2sK4hDRDzVTPA6C74H9YQRSKcZpzQ6vKkwD7Vc1
         wKRMpVzAniHaoAw89XEZFEc1YserHm/AzRtW2TvB5ztJbmXl6LqeWx5XcSyxPYcY6teZ
         VvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YjsQqg/cyLrvH6AHlxUB+OYVHKKVa13wNGyeIOclLuU=;
        b=Kkw3/vWGJwy0H/qFNM4WtuMvBvSrY19P4zmkaJL3aD4XW32nh+Sl9IgvPxgruRxBCs
         7Jxv20YBxxIqBFQI1fImR6buDrkLk5XVH2mhW3Jetu8e7MJi8vjUiyANHTky4fa4B6yz
         LQY+BC3XXxauCQxXrQwYsdwmxkx8qK5nGqUmtwVc7C7fcFEDw8X9BKkfHC1oAAJNk6XY
         Ee9ExCb/xya0U7gtfOjeeQ6jnKenBFYObgTOHsrFQEv/SolA2MrCLm2rFWplhApZeV6g
         fCHT+gC8X9I1WcqvmOSWazZmXqHZxYiIoe2cIqpa6gP2Z38v+HOHEMmP/HnM9YgdZANK
         C5qg==
X-Gm-Message-State: AOAM532GkekWl9I7KYK5+JHs4t7Nv6wEiKpQmrWGpbTfPs+xsJRg6uah
        gjG6Az5xBM3zl4m8f8saPlA=
X-Google-Smtp-Source: ABdhPJwocdDotiRQoMrd8AmM4D5t8eT0K3LGBIo2EKCjfzv73zaEHoy2PrNocwn0na8156wCs4B80g==
X-Received: by 2002:a17:903:2309:b029:12a:965b:333 with SMTP id d9-20020a1709032309b029012a965b0333mr23822909plh.31.1626793388619;
        Tue, 20 Jul 2021 08:03:08 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id k19sm20330779pji.32.2021.07.20.08.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 08:03:06 -0700 (PDT)
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
Subject: [PATCH] drm/msm: Add fence->wait() op
Date:   Tue, 20 Jul 2021 08:07:15 -0700
Message-Id: <20210720150716.1213775-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Somehow we had neither ->wait() nor dma_fence_signal() calls, and no
one noticed.  Oops.

Note that this removes the !timeout case, which has not been used in
a long time.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_fence.c | 59 +++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
index cd59a5918038..8ee96b90ded6 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -38,11 +38,10 @@ static inline bool fence_completed(struct msm_fence_context *fctx, uint32_t fenc
 	return (int32_t)(fctx->completed_fence - fence) >= 0;
 }
 
-/* legacy path for WAIT_FENCE ioctl: */
-int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
-		ktime_t *timeout, bool interruptible)
+static signed long wait_fence(struct msm_fence_context *fctx, uint32_t fence,
+		signed long remaining_jiffies, bool interruptible)
 {
-	int ret;
+	signed long ret;
 
 	if (fence > fctx->last_fence) {
 		DRM_ERROR_RATELIMITED("%s: waiting on invalid fence: %u (of %u)\n",
@@ -50,33 +49,34 @@ int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
 		return -EINVAL;
 	}
 
-	if (!timeout) {
-		/* no-wait: */
-		ret = fence_completed(fctx, fence) ? 0 : -EBUSY;
+	if (interruptible) {
+		ret = wait_event_interruptible_timeout(fctx->event,
+			fence_completed(fctx, fence),
+			remaining_jiffies);
 	} else {
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
+		ret = wait_event_timeout(fctx->event,
+			fence_completed(fctx, fence),
+			remaining_jiffies);
+	}
+
+	if (ret == 0) {
+		DBG("timeout waiting for fence: %u (completed: %u)",
+				fence, fctx->completed_fence);
+		ret = -ETIMEDOUT;
+	} else if (ret != -ERESTARTSYS) {
+		ret = 0;
 	}
 
 	return ret;
 }
 
+/* legacy path for WAIT_FENCE ioctl: */
+int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
+		ktime_t *timeout, bool interruptible)
+{
+	return wait_fence(fctx, fence, timeout_to_jiffies(timeout), interruptible);
+}
+
 /* called from workqueue */
 void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)
 {
@@ -114,10 +114,19 @@ static bool msm_fence_signaled(struct dma_fence *fence)
 	return fence_completed(f->fctx, f->base.seqno);
 }
 
+static signed long msm_fence_wait(struct dma_fence *fence, bool intr,
+		signed long timeout)
+{
+	struct msm_fence *f = to_msm_fence(fence);
+
+	return wait_fence(f->fctx, fence->seqno, timeout, intr);
+}
+
 static const struct dma_fence_ops msm_fence_ops = {
 	.get_driver_name = msm_fence_get_driver_name,
 	.get_timeline_name = msm_fence_get_timeline_name,
 	.signaled = msm_fence_signaled,
+	.wait = msm_fence_wait,
 };
 
 struct dma_fence *
-- 
2.31.1

