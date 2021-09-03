Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B02640051F
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 20:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349684AbhICSpN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 14:45:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350386AbhICSpM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 14:45:12 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F102C0613C1;
        Fri,  3 Sep 2021 11:44:12 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id fs6so158051pjb.4;
        Fri, 03 Sep 2021 11:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kNd3pUa8VSDFpXZWbZznThqTaFkdBW02YtveOJexbvE=;
        b=el/Zyhzpq6C+lzW0KZNT3TFdyeQ8+s8DzNLce41glYYoXilPWJigLGAcl7Q7Qrvw0+
         UfNiy4xhac1Sy6WJfGwwpQwCh5/yED257sTorJ25yPS9uaoLuhbnAmyru+Jsj7EVtaLi
         s0lVN5ibn0UB6p0AaQvZBZAKsqXyuGcvYbTC0FVnQ1cNmOXytt8lxLINdFGk+hnBSUm3
         4qwVsmij7cAryCVADzufMgZanMMfWSLpAYleYs36ko4yROAW1BdK/XCbTc5ZEP15fBpv
         18HpjqyCQ5fuWY5oNpe8PAnz9tTgLP/0tN8iU85H1JiMPaQor8/5uPgvDsW2w7GrtVXn
         nvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kNd3pUa8VSDFpXZWbZznThqTaFkdBW02YtveOJexbvE=;
        b=fvVgu4ZRzaHoyXJMFIYbcdYskoESTLtzmu+URbjSvr+x1PSImN0URcpUGcjwuj5Lxw
         Z0lHAet6dvrnhfs1QUPZjwIPn0GOF7qplorcMbXFOqGIVxI9p3LDPiJVU+jzMvysFlj6
         SiaWqxei5PPbU5NOV3oKgND4O1VzOWceL8CkdPJu4lbjDGPcp4yO3332UFlkSAQVuZEp
         Qy6n01iAadT28mb4uYS78Btd+nfYxnAMwKlJeV76FIPCvi/D0VIn92cjX+dW2KkEjzDv
         0rtqpMx0/j+5Zmo82wDtJFV6UcKK40aXK8dPFb8qFiuOC1XMI7aEBwWc8N2x5YuGu7Dn
         R+pQ==
X-Gm-Message-State: AOAM530lXonyamvnDKOjnysUiD4OObBxgyyThpjNu4Ft+Gc0PdIkjay1
        rXT9/PHuITCBi7R2inZr0y8=
X-Google-Smtp-Source: ABdhPJx9HNwvwUsGKFTzFNKJfhQcPK7maQv1m8szkB9X9brPKTc5jjLVn0vz9WuNpr/OXk2o+TaAzg==
X-Received: by 2002:a17:90a:b389:: with SMTP id e9mr361971pjr.94.1630694651583;
        Fri, 03 Sep 2021 11:44:11 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id u8sm105925pgc.69.2021.09.03.11.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 11:44:10 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Steven Price <steven.price@arm.com>,
        Melissa Wen <mwen@igalia.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Jack Zhang <Jack.Zhang1@amd.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK)
Subject: [PATCH v3 4/9] drm/scheduler: Add fence deadline support
Date:   Fri,  3 Sep 2021 11:47:55 -0700
Message-Id: <20210903184806.1680887-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903184806.1680887-1-robdclark@gmail.com>
References: <20210903184806.1680887-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

As the finished fence is the one that is exposed to userspace, and
therefore the one that other operations, like atomic update, would
block on, we need to propagate the deadline from from the finished
fence to the actual hw fence.

v2: Split into drm_sched_fence_set_parent() (ckoenig)

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/scheduler/sched_fence.c | 34 +++++++++++++++++++++++++
 drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
 include/drm/gpu_scheduler.h             |  8 ++++++
 3 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index bcea035cf4c6..4fc41a71d1c7 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -128,6 +128,30 @@ static void drm_sched_fence_release_finished(struct dma_fence *f)
 	dma_fence_put(&fence->scheduled);
 }
 
+static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
+						  ktime_t deadline)
+{
+	struct drm_sched_fence *fence = to_drm_sched_fence(f);
+	unsigned long flags;
+
+	spin_lock_irqsave(&fence->lock, flags);
+
+	/* If we already have an earlier deadline, keep it: */
+	if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
+	    ktime_before(fence->deadline, deadline)) {
+		spin_unlock_irqrestore(&fence->lock, flags);
+		return;
+	}
+
+	fence->deadline = deadline;
+	set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
+
+	spin_unlock_irqrestore(&fence->lock, flags);
+
+	if (fence->parent)
+		dma_fence_set_deadline(fence->parent, deadline);
+}
+
 static const struct dma_fence_ops drm_sched_fence_ops_scheduled = {
 	.get_driver_name = drm_sched_fence_get_driver_name,
 	.get_timeline_name = drm_sched_fence_get_timeline_name,
@@ -138,6 +162,7 @@ static const struct dma_fence_ops drm_sched_fence_ops_finished = {
 	.get_driver_name = drm_sched_fence_get_driver_name,
 	.get_timeline_name = drm_sched_fence_get_timeline_name,
 	.release = drm_sched_fence_release_finished,
+	.set_deadline = drm_sched_fence_set_deadline_finished,
 };
 
 struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
@@ -152,6 +177,15 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
 }
 EXPORT_SYMBOL(to_drm_sched_fence);
 
+void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
+				struct dma_fence *fence)
+{
+	s_fence->parent = dma_fence_get(fence);
+	if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
+		     &s_fence->finished.flags))
+		dma_fence_set_deadline(fence, s_fence->deadline);
+}
+
 struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
 					      void *owner)
 {
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 595e47ff7d06..27bf0ac0625f 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -978,7 +978,7 @@ static int drm_sched_main(void *param)
 		drm_sched_fence_scheduled(s_fence);
 
 		if (!IS_ERR_OR_NULL(fence)) {
-			s_fence->parent = dma_fence_get(fence);
+			drm_sched_fence_set_parent(s_fence, fence);
 			r = dma_fence_add_callback(fence, &sched_job->cb,
 						   drm_sched_job_done_cb);
 			if (r == -ENOENT)
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 7f77a455722c..158ddd662469 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -238,6 +238,12 @@ struct drm_sched_fence {
          */
 	struct dma_fence		finished;
 
+	/**
+	 * @deadline: deadline set on &drm_sched_fence.finished which
+	 * potentially needs to be propagated to &drm_sched_fence.parent
+	 */
+	ktime_t				deadline;
+
         /**
          * @parent: the fence returned by &drm_sched_backend_ops.run_job
          * when scheduling the job on hardware. We signal the
@@ -505,6 +511,8 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 				   enum drm_sched_priority priority);
 bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
 
+void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
+				struct dma_fence *fence);
 struct drm_sched_fence *drm_sched_fence_alloc(
 	struct drm_sched_entity *s_entity, void *owner);
 void drm_sched_fence_init(struct drm_sched_fence *fence,
-- 
2.31.1

