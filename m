Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 870BC4EE2D7
	for <lists+linux-media@lfdr.de>; Thu, 31 Mar 2022 22:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241514AbiCaUsr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Mar 2022 16:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233946AbiCaUsq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Mar 2022 16:48:46 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B77221EC61E
        for <linux-media@vger.kernel.org>; Thu, 31 Mar 2022 13:46:57 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id h23so1386155wrb.8
        for <linux-media@vger.kernel.org>; Thu, 31 Mar 2022 13:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ixXrgYXyusCqS9U7IffPsFFQ/azMDwZfu0gvUTK9Bx0=;
        b=QnJnNv95ZO7oppiV7mf7cWBNhQPhLj6ppQvu9mwgtoPXURTWikvR4y3I1gC0H/Py0F
         lpx5A7OCCeaG653XU0ysnIJwsP77NYUTYKSnItkZd8SrATJh2eSmIx8AqWjf5ziLMEpM
         eTfPtuig1Z4Imxj4wH4LEls2YzSiY8KwjeV10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ixXrgYXyusCqS9U7IffPsFFQ/azMDwZfu0gvUTK9Bx0=;
        b=VVz3C8SxlL6bo5CWGCd7xsZYaK2rYABvpjGEbC+RkaUek8GfPHqW4aNFrC9u1fQVUR
         KKXuuIq15ByWh/uT+pRzVOBOaRXUUjZpbnYPXKKDlxsERr9DgOXuO7qtVdcVHaP73/lw
         VZDwDkfa9T6EwjJnrQ9OCHvS05z8s1Nx3rnmBOXWm0BOEPjuG1VmK6VSVWzSre4E/KWK
         UxccYX5QAwlTLDmW0bDaGM1KWoSIGd6X6ojotp42M65HfrzpGtGVzmI84p+FytnpiIq7
         4DFMGP12Fdcx1QdD0VWu8pTamvzkOfnSKcsZltCv/nSDjKgYBn3tUH4KkLOXTd2Ok114
         OIaA==
X-Gm-Message-State: AOAM530fc3ToPYjx8YgkgnZWYuCu6lQLHGWpRRPpN8cfcKSS8VWHOqPs
        TKCh4n1vpYaNQcwmax9u48ukLQ==
X-Google-Smtp-Source: ABdhPJzZpl1E22G/H9ru/QE6PMGHcGQcJUz17wpVlgljQDc4aYfieokSI5ERicjqGCZvhshDqMHavA==
X-Received: by 2002:a5d:59a2:0:b0:204:20d9:a5b9 with SMTP id p2-20020a5d59a2000000b0020420d9a5b9mr5117078wrr.560.1648759616332;
        Thu, 31 Mar 2022 13:46:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b15-20020a05600018af00b002057c72d45fsm480319wri.77.2022.03.31.13.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 13:46:55 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        etnaviv@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/4] drm/etnaviv: Use scheduler dependency handling
Date:   Thu, 31 Mar 2022 22:46:48 +0200
Message-Id: <20220331204651.2699107-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220331204651.2699107-1-daniel.vetter@ffwll.ch>
References: <20220331204651.2699107-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We need to pull the drm_sched_job_init much earlier, but that's very
minor surgery.

v2: Actually fix up cleanup paths by calling drm_sched_job_init, which
I wanted to to in the previous round (and did, for all other drivers).
Spotted by Lucas.

v3: Rebase over renamed functions to add dependencies.

v4: Rebase over patches from Christian.

v5: More rebasing over work from Christian.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: etnaviv@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.h        |  4 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 51 +++++++++++--------
 drivers/gpu/drm/etnaviv/etnaviv_sched.c      | 53 +-------------------
 drivers/gpu/drm/etnaviv/etnaviv_sched.h      |  3 +-
 4 files changed, 35 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
index 8983a0ef383e..63688e6e4580 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
@@ -80,8 +80,6 @@ struct etnaviv_gem_submit_bo {
 	u64 va;
 	struct etnaviv_gem_object *obj;
 	struct etnaviv_vram_mapping *mapping;
-	unsigned int nr_fences;
-	struct dma_fence **fences;
 };
 
 /* Created per submit-ioctl, to track bo's and cmdstream bufs, etc,
@@ -94,7 +92,7 @@ struct etnaviv_gem_submit {
 	struct etnaviv_file_private *ctx;
 	struct etnaviv_gpu *gpu;
 	struct etnaviv_iommu_context *mmu_context, *prev_mmu_context;
-	struct dma_fence *out_fence, *in_fence;
+	struct dma_fence *out_fence;
 	int out_fence_id;
 	struct list_head node; /* GPU active submit list */
 	struct etnaviv_cmdbuf cmdbuf;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 592cbb38609a..5f502c49aec2 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -188,9 +188,9 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
 		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
 			continue;
 
-		ret = dma_resv_get_fences(robj,
-					  bo->flags & ETNA_SUBMIT_BO_WRITE,
-					  &bo->nr_fences, &bo->fences);
+		ret = drm_sched_job_add_implicit_dependencies(&submit->sched_job,
+							      &bo->obj->base,
+							      bo->flags & ETNA_SUBMIT_BO_WRITE);
 		if (ret)
 			return ret;
 	}
@@ -398,8 +398,6 @@ static void submit_cleanup(struct kref *kref)
 
 	wake_up_all(&submit->gpu->fence_event);
 
-	if (submit->in_fence)
-		dma_fence_put(submit->in_fence);
 	if (submit->out_fence) {
 		/* first remove from IDR, so fence can not be found anymore */
 		mutex_lock(&submit->gpu->fence_lock);
@@ -530,58 +528,69 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 	ret = etnaviv_cmdbuf_init(priv->cmdbuf_suballoc, &submit->cmdbuf,
 				  ALIGN(args->stream_size, 8) + 8);
 	if (ret)
-		goto err_submit_objects;
+		goto err_submit_put;
 
 	submit->ctx = file->driver_priv;
 	submit->mmu_context = etnaviv_iommu_context_get(submit->ctx->mmu);
 	submit->exec_state = args->exec_state;
 	submit->flags = args->flags;
 
+	ret = drm_sched_job_init(&submit->sched_job,
+				 &ctx->sched_entity[args->pipe],
+				 submit->ctx);
+	if (ret)
+		goto err_submit_put;
+
 	ret = submit_lookup_objects(submit, file, bos, args->nr_bos);
 	if (ret)
-		goto err_submit_objects;
+		goto err_submit_job;
 
 	if ((priv->mmu_global->version != ETNAVIV_IOMMU_V2) &&
 	    !etnaviv_cmd_validate_one(gpu, stream, args->stream_size / 4,
 				      relocs, args->nr_relocs)) {
 		ret = -EINVAL;
-		goto err_submit_objects;
+		goto err_submit_job;
 	}
 
 	if (args->flags & ETNA_SUBMIT_FENCE_FD_IN) {
-		submit->in_fence = sync_file_get_fence(args->fence_fd);
-		if (!submit->in_fence) {
+		struct dma_fence *in_fence = sync_file_get_fence(args->fence_fd);
+		if (!in_fence) {
 			ret = -EINVAL;
-			goto err_submit_objects;
+			goto err_submit_job;
 		}
+
+		ret = drm_sched_job_add_dependency(&submit->sched_job,
+						   in_fence);
+		if (ret)
+			goto err_submit_job;
 	}
 
 	ret = submit_pin_objects(submit);
 	if (ret)
-		goto err_submit_objects;
+		goto err_submit_job;
 
 	ret = submit_reloc(submit, stream, args->stream_size / 4,
 			   relocs, args->nr_relocs);
 	if (ret)
-		goto err_submit_objects;
+		goto err_submit_job;
 
 	ret = submit_perfmon_validate(submit, args->exec_state, pmrs);
 	if (ret)
-		goto err_submit_objects;
+		goto err_submit_job;
 
 	memcpy(submit->cmdbuf.vaddr, stream, args->stream_size);
 
 	ret = submit_lock_objects(submit, &ticket);
 	if (ret)
-		goto err_submit_objects;
+		goto err_submit_job;
 
 	ret = submit_fence_sync(submit);
 	if (ret)
-		goto err_submit_objects;
+		goto err_submit_job;
 
-	ret = etnaviv_sched_push_job(&ctx->sched_entity[args->pipe], submit);
+	ret = etnaviv_sched_push_job(submit);
 	if (ret)
-		goto err_submit_objects;
+		goto err_submit_job;
 
 	submit_attach_object_fences(submit);
 
@@ -595,7 +604,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 		sync_file = sync_file_create(submit->out_fence);
 		if (!sync_file) {
 			ret = -ENOMEM;
-			goto err_submit_objects;
+			goto err_submit_job;
 		}
 		fd_install(out_fence_fd, sync_file->file);
 	}
@@ -603,7 +612,9 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 	args->fence_fd = out_fence_fd;
 	args->fence = submit->out_fence_id;
 
-err_submit_objects:
+err_submit_job:
+	drm_sched_job_cleanup(&submit->sched_job);
+err_submit_put:
 	etnaviv_submit_put(submit);
 
 err_submit_ww_acquire:
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index a8452ce10e3a..72e2553fbc98 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -17,48 +17,6 @@ module_param_named(job_hang_limit, etnaviv_job_hang_limit, int , 0444);
 static int etnaviv_hw_jobs_limit = 4;
 module_param_named(hw_job_limit, etnaviv_hw_jobs_limit, int , 0444);
 
-static struct dma_fence *
-etnaviv_sched_dependency(struct drm_sched_job *sched_job,
-			 struct drm_sched_entity *entity)
-{
-	struct etnaviv_gem_submit *submit = to_etnaviv_submit(sched_job);
-	struct dma_fence *fence;
-	int i;
-
-	if (unlikely(submit->in_fence)) {
-		fence = submit->in_fence;
-		submit->in_fence = NULL;
-
-		if (!dma_fence_is_signaled(fence))
-			return fence;
-
-		dma_fence_put(fence);
-	}
-
-	for (i = 0; i < submit->nr_bos; i++) {
-		struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
-		int j;
-
-		for (j = 0; j < bo->nr_fences; j++) {
-			if (!bo->fences[j])
-				continue;
-
-			fence = bo->fences[j];
-			bo->fences[j] = NULL;
-
-			if (!dma_fence_is_signaled(fence))
-				return fence;
-
-			dma_fence_put(fence);
-		}
-		kfree(bo->fences);
-		bo->nr_fences = 0;
-		bo->fences = NULL;
-	}
-
-	return NULL;
-}
-
 static struct dma_fence *etnaviv_sched_run_job(struct drm_sched_job *sched_job)
 {
 	struct etnaviv_gem_submit *submit = to_etnaviv_submit(sched_job);
@@ -132,29 +90,22 @@ static void etnaviv_sched_free_job(struct drm_sched_job *sched_job)
 }
 
 static const struct drm_sched_backend_ops etnaviv_sched_ops = {
-	.dependency = etnaviv_sched_dependency,
 	.run_job = etnaviv_sched_run_job,
 	.timedout_job = etnaviv_sched_timedout_job,
 	.free_job = etnaviv_sched_free_job,
 };
 
-int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
-			   struct etnaviv_gem_submit *submit)
+int etnaviv_sched_push_job(struct etnaviv_gem_submit *submit)
 {
 	int ret = 0;
 
 	/*
 	 * Hold the fence lock across the whole operation to avoid jobs being
 	 * pushed out of order with regard to their sched fence seqnos as
-	 * allocated in drm_sched_job_init.
+	 * allocated in drm_sched_job_arm.
 	 */
 	mutex_lock(&submit->gpu->fence_lock);
 
-	ret = drm_sched_job_init(&submit->sched_job, sched_entity,
-				 submit->ctx);
-	if (ret)
-		goto out_unlock;
-
 	drm_sched_job_arm(&submit->sched_job);
 
 	submit->out_fence = dma_fence_get(&submit->sched_job.s_fence->finished);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.h b/drivers/gpu/drm/etnaviv/etnaviv_sched.h
index c0a6796e22c9..baebfa069afc 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.h
@@ -18,7 +18,6 @@ struct etnaviv_gem_submit *to_etnaviv_submit(struct drm_sched_job *sched_job)
 
 int etnaviv_sched_init(struct etnaviv_gpu *gpu);
 void etnaviv_sched_fini(struct etnaviv_gpu *gpu);
-int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
-			   struct etnaviv_gem_submit *submit);
+int etnaviv_sched_push_job(struct etnaviv_gem_submit *submit);
 
 #endif /* __ETNAVIV_SCHED_H__ */
-- 
2.34.1

