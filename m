Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 166143E36BE
	for <lists+linux-media@lfdr.de>; Sat,  7 Aug 2021 20:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbhHGSe2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Aug 2021 14:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbhHGSeX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Aug 2021 14:34:23 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E57C0613D3;
        Sat,  7 Aug 2021 11:34:05 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id j18-20020a17090aeb12b029017737e6c349so15351374pjz.0;
        Sat, 07 Aug 2021 11:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2NTzpCEmB11w7qS1x4MIrtVSF1reU6VbijSDEPvmpk4=;
        b=h960OzqhuK0zQMf7LABN1/tdHcSRTExKJYRAhwSp2ta4D5lE/sI6VNkmcYCN692RYV
         XZINe5Dx90d1Mziuc/CHg4zthm5+CJYoOG3U9seL+QPnA20LCa7Gnd7pafzEzNyoZO5j
         Y74BTIHJWxhzwCtm56NXA+C+3qvCQXG10FOf6hs1CT8HjoTKWGfy9ql3dTTdPiIbHR9r
         yg90BCz09HRER/zMOR8fCiQ5Tvxyp4LHgTy9CmSUVaVBJ//my3jo3AD2F0IU3rae2Nf9
         sNarYeOM/xRNhajgytdG1MtXq0W9Qii74gJqtnrDvf/PWlwUqJF8oVCzF9HNduPDrh7i
         Uy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2NTzpCEmB11w7qS1x4MIrtVSF1reU6VbijSDEPvmpk4=;
        b=Qz2EkEaj4IQHEQ/VY+aVsSAZSfx5Rk7qBPnEBbBuu0k61cZav47DMXl9jYbB9XVirG
         ie+8lXhxo9nC/VPkGAFwvcZRW+6ylm0mrKcjx5pYeO8uVKflS+j2kqXUlzU44YMt11Tv
         2zRq+Lu2zQ8mOjB2oony5HmYar0m3qDrf13sT7ZGVogG8FcW9HDjBHak7YFikTEHwK+n
         dMUuNjAe4+hnITkBCqgC/Hhu7CUEzID9DiuL3r+Nkd+ec5KFZ6f4IcOzdk1WgtoYsIGZ
         t0nL7zLQukIvJoB/wc8yviTNmIM0v+kfkAZASE3wESPIy8AXr4SZPNLtBRfU32mL7iQD
         tbIg==
X-Gm-Message-State: AOAM533It2GXeqYq3fqNC8QUQay4IgfYXTFz2A8lK+RdCS38f4JadbT2
        XEVf9tpLICgCO4m2sW2fn4A=
X-Google-Smtp-Source: ABdhPJx0WCrAA8EF14LEz1SjVVcI5rAReQnjs+gJx3CGV17tAEQ4ODGd5buKJU5LzlzZNSPUQL1wkA==
X-Received: by 2002:aa7:96fc:0:b029:3ab:8eff:ca39 with SMTP id i28-20020aa796fc0000b02903ab8effca39mr16634031pfq.62.1628361245263;
        Sat, 07 Aug 2021 11:34:05 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id f10sm15109768pfa.17.2021.08.07.11.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 11:34:04 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Steven Price <steven.price@arm.com>, Roy Sun <Roy.Sun@amd.com>,
        Lee Jones <lee.jones@linaro.org>,
        Jack Zhang <Jack.Zhang1@amd.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK)
Subject: [PATCH v2 4/5] drm/scheduler: Add fence deadline support
Date:   Sat,  7 Aug 2021 11:37:58 -0700
Message-Id: <20210807183804.459850-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210807183804.459850-1-robdclark@gmail.com>
References: <20210807183804.459850-1-robdclark@gmail.com>
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

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/scheduler/sched_fence.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/scheduler/sched_main.c  |  3 +++
 include/drm/gpu_scheduler.h             |  6 ++++++
 3 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 69de2c76731f..f389dca44185 100644
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
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index a2a953693b45..3ab0900d3596 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -818,6 +818,9 @@ static int drm_sched_main(void *param)
 
 		if (!IS_ERR_OR_NULL(fence)) {
 			s_fence->parent = dma_fence_get(fence);
+			if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
+				     &s_fence->finished.flags))
+				dma_fence_set_deadline(fence, s_fence->deadline);
 			r = dma_fence_add_callback(fence, &sched_job->cb,
 						   drm_sched_job_done_cb);
 			if (r == -ENOENT)
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index d18af49fd009..0f08ade614ae 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -144,6 +144,12 @@ struct drm_sched_fence {
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
-- 
2.31.1

