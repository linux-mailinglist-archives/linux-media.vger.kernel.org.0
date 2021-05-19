Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC82638957F
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 20:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231590AbhESSgg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 14:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231576AbhESSge (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 14:36:34 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17255C06175F;
        Wed, 19 May 2021 11:35:15 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id n8so2327544plf.7;
        Wed, 19 May 2021 11:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n5uWZIfYNT9NU92iv+57nnURivFj6aDlrNkoAZSXV/w=;
        b=KOarvd9cHWYKgnPJf9nSyzfOesTFIXD7IGNVJ+du1Z0SHpY0Xm/EXFqN9HQCuRMAQv
         2kguO8VQtBzz6vByBahivwR4XUM3q8ulOI8YpSsXjpoEOvnn5Q8Agif1PURmqHLXabsp
         7ut0TDH/YxF+ybzk5eNjGyIgsd59xbXVTFbcLLxezlV9PYiC90gA5k4sHMSHYcE/eL71
         WDNWal+4Iwi/BnBVwN/Ro2dY2R06U35roeH5Zz9oUvtHgiLl40sNw1Oan98B2QWU9aFW
         27b1mG8mnUdeTGBpYRnPwm0j9hU/61yxlpITvDf8+bBkjQqHITe1Egm6dmEBdNCIeVEm
         1sag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n5uWZIfYNT9NU92iv+57nnURivFj6aDlrNkoAZSXV/w=;
        b=Q1VuU+BjWrGwr4FK5whZQMkjD61v+9J0jZvDqz5ElgV5FKq76OLePsKnVa1Dj/zDjv
         V1+AH/VsUswyTGI2BSURaWYv+3dlD+mr5wsnzy2iOdlC/Z52ErCj0UZ/g/ty8KV4cSNz
         V+F4kcOLfeDCJQ3OjbsAFkUxM7gkYwPnMT+YsdxS7cIjxVyEZmF07epNpLGGYaeOZtNo
         lkFd6bixJDpipb0GhweXS3kSjTBoTyIYgn4erqk2I2UQZLsx8hJrxOfD+d2T7zd7mUDv
         fEUo9drsXOZvDqAoeC30FjuivzXu60D+A4G0Vp8w7GU43mQ1dMmEhCq1hhKLDQCs7EGe
         2f3Q==
X-Gm-Message-State: AOAM533E/CSSo/VHcLy4Z2qMYvkCRLv/0IBS+jI6UL/hc2DZs8wSzCbr
        0YKXmiAOBhnh+PJPZ694mnU=
X-Google-Smtp-Source: ABdhPJx7j2+wCkNK1D1YUAjaIZNBYpRrQkfJ3sHGCatwOmy6egf6QrGebz1yZKbJJVE5Een+NF84FA==
X-Received: by 2002:a17:902:8e88:b029:ee:b947:d7df with SMTP id bg8-20020a1709028e88b02900eeb947d7dfmr1029276plb.48.1621449314588;
        Wed, 19 May 2021 11:35:14 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id a24sm68148pgv.76.2021.05.19.11.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 11:35:13 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK)
Subject: [RFC 3/3] drm/msm: Wire up gpu boost
Date:   Wed, 19 May 2021 11:38:54 -0700
Message-Id: <20210519183855.1523927-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210519183855.1523927-1-robdclark@gmail.com>
References: <20210519183855.1523927-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Note, at this point I haven't given a lot of consideration into how much
we should boost, and for how long.  And perhaps we should only boost at
less than 50% utilization?  At this point, this is only an example of
dma_fence_boost() implementation.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_fence.c | 10 ++++++++++
 drivers/gpu/drm/msm/msm_gpu.c   | 13 +++++++++++++
 drivers/gpu/drm/msm/msm_gpu.h   |  2 ++
 3 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
index cd59a5918038..e58895603726 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -8,6 +8,7 @@
 
 #include "msm_drv.h"
 #include "msm_fence.h"
+#include "msm_gpu.h"
 
 
 struct msm_fence_context *
@@ -114,10 +115,19 @@ static bool msm_fence_signaled(struct dma_fence *fence)
 	return fence_completed(f->fctx, f->base.seqno);
 }
 
+static void msm_fence_boost(struct dma_fence *fence)
+{
+	struct msm_fence *f = to_msm_fence(fence);
+	struct msm_drm_private *priv = f->fctx->dev->dev_private;
+
+	msm_gpu_boost(priv->gpu);
+}
+
 static const struct dma_fence_ops msm_fence_ops = {
 	.get_driver_name = msm_fence_get_driver_name,
 	.get_timeline_name = msm_fence_get_timeline_name,
 	.signaled = msm_fence_signaled,
+	.boost = msm_fence_boost,
 };
 
 struct dma_fence *
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 9dd1c58430ab..c90b79116500 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -62,6 +62,10 @@ static int msm_devfreq_get_dev_status(struct device *dev,
 	status->total_time = ktime_us_delta(time, gpu->devfreq.time);
 	gpu->devfreq.time = time;
 
+	if (atomic_dec_if_positive(&gpu->devfreq.boost) >= 0) {
+		status->busy_time = status->total_time;
+	}
+
 	return 0;
 }
 
@@ -84,6 +88,15 @@ static struct devfreq_dev_profile msm_devfreq_profile = {
 	.get_cur_freq = msm_devfreq_get_cur_freq,
 };
 
+void msm_gpu_boost(struct msm_gpu *gpu)
+{
+	if (!gpu->funcs->gpu_busy)
+		return;
+
+	/* Add three devfreq polling intervals worth of boost: */
+	atomic_add(3, &gpu->devfreq.boost);
+}
+
 static void msm_devfreq_init(struct msm_gpu *gpu)
 {
 	/* We need target support to do devfreq */
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 18baf935e143..7a082a12d98f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -150,6 +150,7 @@ struct msm_gpu {
 		struct devfreq *devfreq;
 		u64 busy_cycles;
 		ktime_t time;
+		atomic_t boost;
 	} devfreq;
 
 	uint32_t suspend_count;
@@ -295,6 +296,7 @@ static inline void gpu_write64(struct msm_gpu *gpu, u32 lo, u32 hi, u64 val)
 int msm_gpu_pm_suspend(struct msm_gpu *gpu);
 int msm_gpu_pm_resume(struct msm_gpu *gpu);
 void msm_gpu_resume_devfreq(struct msm_gpu *gpu);
+void msm_gpu_boost(struct msm_gpu *gpu);
 
 int msm_gpu_hw_init(struct msm_gpu *gpu);
 
-- 
2.30.2

