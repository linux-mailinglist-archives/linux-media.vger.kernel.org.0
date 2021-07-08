Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B325D3C184A
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 19:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbhGHRlA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 13:41:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbhGHRk7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jul 2021 13:40:59 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5C6EC061574
        for <linux-media@vger.kernel.org>; Thu,  8 Jul 2021 10:38:17 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso7348999wmh.4
        for <linux-media@vger.kernel.org>; Thu, 08 Jul 2021 10:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mls2ejKErj4+c/cv4r8BLVM3Y5XNHv+hyokEAjrvlQQ=;
        b=IIF9iyvY6exRnC2Tldk5pPDZhe3//qmZGbSZqZVy4/VVvTCp6g6CRT/VmThqsvLEUc
         orLhRYsA2UKPlNNwkZwpYweBJMqmvrqVyMT4i72pFQwnFVgEVDKjXxceQ18N7NNjHRko
         TxrnLU5FP7l84aSxsVgvPpnwu0IGIwtcmVWuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mls2ejKErj4+c/cv4r8BLVM3Y5XNHv+hyokEAjrvlQQ=;
        b=aLL7eS6yJs6z0D42UVC2BnWMSRqyvB+mc1BVZQceZc3gi8dwhJpGGVvr3mPSdJmNVY
         i/botjyRG7/XJdHRQx3+1SdZFQdPtLrG5oarmn7kHaZY5O8/4A39LuMtPXO1Pei3fKqt
         V0MbjpztWy2o1O9FFPJpab7cpmynVwgXQp37LagExDrg5NqqGtb13Is4PlltyBpG3Y7M
         Gin3r/iPPP4IzuYp27o3xnbwWROkAfMvcftI1MuGQcAMO8Pw1PqQexYNfJvisWVM7agK
         tSpG+BnVX7D4Eh0X8hWqQgv49DD6D24j8pW6pGYVpq12eem0vbgx3aJrlymRxEX1nIPz
         wYyQ==
X-Gm-Message-State: AOAM531snyHScA0K/EETv4be62FpTw0HdOUP4M1h0sLUPxBY/a8ZgB0p
        0nNa1BFXWdNMu21hJ8fPz96i8A==
X-Google-Smtp-Source: ABdhPJxYS1PxW6pEpvMukPEy2FkcrmGfCw1y8tVGm6EpHZsEKDmHQd/ZnKUJ5sKhK1zprMgVk0lvEA==
X-Received: by 2002:a7b:c955:: with SMTP id i21mr6605382wml.147.1625765896273;
        Thu, 08 Jul 2021 10:38:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l4sm2521853wme.26.2021.07.08.10.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 10:38:15 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Qiang Yu <yuq825@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        lima@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3 08/20] drm/lima: use scheduler dependency tracking
Date:   Thu,  8 Jul 2021 19:37:42 +0200
Message-Id: <20210708173754.3877540-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
References: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Nothing special going on here.

Aside reviewing the code, it seems like drm_sched_job_arm() should be
moved into lima_sched_context_queue_task and put under some mutex
together with drm_sched_push_job(). See the kerneldoc for
drm_sched_push_job().

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Qiang Yu <yuq825@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: lima@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/gpu/drm/lima/lima_gem.c   |  4 ++--
 drivers/gpu/drm/lima/lima_sched.c | 21 ---------------------
 drivers/gpu/drm/lima/lima_sched.h |  3 ---
 3 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index c528f40981bb..e54a88d5037a 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -267,7 +267,7 @@ static int lima_gem_sync_bo(struct lima_sched_task *task, struct lima_bo *bo,
 	if (explicit)
 		return 0;
 
-	return drm_gem_fence_array_add_implicit(&task->deps, &bo->base.base, write);
+	return drm_sched_job_await_implicit(&task->base, &bo->base.base, write);
 }
 
 static int lima_gem_add_deps(struct drm_file *file, struct lima_submit *submit)
@@ -285,7 +285,7 @@ static int lima_gem_add_deps(struct drm_file *file, struct lima_submit *submit)
 		if (err)
 			return err;
 
-		err = drm_gem_fence_array_add(&submit->task->deps, fence);
+		err = drm_sched_job_await_fence(&submit->task->base, fence);
 		if (err) {
 			dma_fence_put(fence);
 			return err;
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index e968b5a8f0b0..99d5f6f1a882 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -134,24 +134,15 @@ int lima_sched_task_init(struct lima_sched_task *task,
 	task->num_bos = num_bos;
 	task->vm = lima_vm_get(vm);
 
-	xa_init_flags(&task->deps, XA_FLAGS_ALLOC);
-
 	return 0;
 }
 
 void lima_sched_task_fini(struct lima_sched_task *task)
 {
-	struct dma_fence *fence;
-	unsigned long index;
 	int i;
 
 	drm_sched_job_cleanup(&task->base);
 
-	xa_for_each(&task->deps, index, fence) {
-		dma_fence_put(fence);
-	}
-	xa_destroy(&task->deps);
-
 	if (task->bos) {
 		for (i = 0; i < task->num_bos; i++)
 			drm_gem_object_put(&task->bos[i]->base.base);
@@ -186,17 +177,6 @@ struct dma_fence *lima_sched_context_queue_task(struct lima_sched_task *task)
 	return fence;
 }
 
-static struct dma_fence *lima_sched_dependency(struct drm_sched_job *job,
-					       struct drm_sched_entity *entity)
-{
-	struct lima_sched_task *task = to_lima_task(job);
-
-	if (!xa_empty(&task->deps))
-		return xa_erase(&task->deps, task->last_dep++);
-
-	return NULL;
-}
-
 static int lima_pm_busy(struct lima_device *ldev)
 {
 	int ret;
@@ -472,7 +452,6 @@ static void lima_sched_free_job(struct drm_sched_job *job)
 }
 
 static const struct drm_sched_backend_ops lima_sched_ops = {
-	.dependency = lima_sched_dependency,
 	.run_job = lima_sched_run_job,
 	.timedout_job = lima_sched_timedout_job,
 	.free_job = lima_sched_free_job,
diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lima_sched.h
index ac70006b0e26..6a11764d87b3 100644
--- a/drivers/gpu/drm/lima/lima_sched.h
+++ b/drivers/gpu/drm/lima/lima_sched.h
@@ -23,9 +23,6 @@ struct lima_sched_task {
 	struct lima_vm *vm;
 	void *frame;
 
-	struct xarray deps;
-	unsigned long last_dep;
-
 	struct lima_bo **bos;
 	int num_bos;
 
-- 
2.32.0

