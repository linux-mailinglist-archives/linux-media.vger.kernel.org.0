Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC614F7AD8
	for <lists+linux-media@lfdr.de>; Thu,  7 Apr 2022 11:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243528AbiDGJCG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Apr 2022 05:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243517AbiDGJCF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Apr 2022 05:02:05 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A65BA1945C3
        for <linux-media@vger.kernel.org>; Thu,  7 Apr 2022 02:00:04 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id bh17so9395442ejb.8
        for <linux-media@vger.kernel.org>; Thu, 07 Apr 2022 02:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8IUNqlEB/tRirjBlmf3DCVptBJ3+kBQH40nEBk4GLOk=;
        b=D74fARHvQQmBDGIqLmbGDoml+vJLtTCH+HHPvaeGLrKvV+H40UKXhFaAgVG598u4gz
         3Mru7QgQQd26RO53aYnBbBEJmFUakdormpuEm+6AkeqlxvczVm1dQ9f39pvsTW8EPyEd
         8DhinHJ/jejcg3blVPJ4KZV/NXiJh6VjOiALPd10y2Wzzfwl9KsR8rCA505MXw4Ubf4w
         RzPocjqkdMN70I+27HZm/E4upS4PjmbMvZY81PksaG1n1h5cuU/wCP27/81ZZHBmO8dp
         tL/v2JXXUAZVTUA1qG1wachwgFpMy1O3bImgE6WEw33x110gdLptkac7B8vp4B37pPZc
         f6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8IUNqlEB/tRirjBlmf3DCVptBJ3+kBQH40nEBk4GLOk=;
        b=yxdXxvL5dVpPib5HrrA44s8JhCi4Y9ne7vfhVgZtpgKaHtPh4z3QI9BeoP2tIbIqxo
         /XYu4lqrbuuAH7OBR9MNcmz+tgPwU5yo1ReW2BHsgr+lO1nyltne3zwLFiwLoIvraLW4
         0ZWE5cbPW+4NxAxjiXOd5cdeEDWPtNHXS88FAbOzbRT/83gwcIZ7lybXjUkX/65+0Pev
         8x72G+kHuAXYT/9KvuIyWc+QarQv4U3vkGpaijyPixoDUw27PZN1BQxUXpNTlaRyO/xM
         AMPgXfGIh+M09f59hbJgRB9yG0ppglTlmpAQvBTehPcKtkJTaB3XUbm4hkc7/3W6qizm
         E/rw==
X-Gm-Message-State: AOAM5305KjGNuNHyuWT9AlTmPwJY+cqiqlCNllzdAY3AJ8SL54Mg00is
        Uh9KK/8ryXuRf1BwooiXx/dKXggN0D0=
X-Google-Smtp-Source: ABdhPJyP43WQJEs23VOhw8fTehV5tDqkS1Fjwhf7mIJLtd8e3zLmKCXrJD0t77NzkLD7IRYKMH82yQ==
X-Received: by 2002:a17:907:9482:b0:6da:a24e:e767 with SMTP id dm2-20020a170907948200b006daa24ee767mr12446960ejc.479.1649322003176;
        Thu, 07 Apr 2022 02:00:03 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906111a00b006e778bd4fc8sm5186563eja.38.2022.04.07.02.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 02:00:02 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        intel-gfx@lists.freedesktop.org
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 12/15] drm/i915: drop bo->moving dependency
Date:   Thu,  7 Apr 2022 10:59:43 +0200
Message-Id: <20220407085946.744568-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407085946.744568-1-christian.koenig@amd.com>
References: <20220407085946.744568-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

That should now be handled by the common dma_resv framework.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 41 ++++---------------
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  8 +---
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 15 +------
 .../drm/i915/gem/selftests/i915_gem_migrate.c |  3 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  3 +-
 drivers/gpu/drm/i915/i915_vma.c               |  9 +++-
 6 files changed, 21 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 372bc220faeb..ffde7bc0a95d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -741,30 +741,19 @@ static const struct drm_gem_object_funcs i915_gem_object_funcs = {
 /**
  * i915_gem_object_get_moving_fence - Get the object's moving fence if any
  * @obj: The object whose moving fence to get.
+ * @fence: The resulting fence
  *
  * A non-signaled moving fence means that there is an async operation
  * pending on the object that needs to be waited on before setting up
  * any GPU- or CPU PTEs to the object's pages.
  *
- * Return: A refcounted pointer to the object's moving fence if any,
- * NULL otherwise.
+ * Return: Negative error code or 0 for success.
  */
-struct dma_fence *
-i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj)
+int i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj,
+				     struct dma_fence **fence)
 {
-	return dma_fence_get(i915_gem_to_ttm(obj)->moving);
-}
-
-void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,
-				      struct dma_fence *fence)
-{
-	struct dma_fence **moving = &i915_gem_to_ttm(obj)->moving;
-
-	if (*moving == fence)
-		return;
-
-	dma_fence_put(*moving);
-	*moving = dma_fence_get(fence);
+	return dma_resv_get_singleton(obj->base.resv, DMA_RESV_USAGE_KERNEL,
+				      fence);
 }
 
 /**
@@ -782,23 +771,9 @@ void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,
 int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
 				      bool intr)
 {
-	struct dma_fence *fence = i915_gem_to_ttm(obj)->moving;
-	int ret;
-
 	assert_object_held(obj);
-	if (!fence)
-		return 0;
-
-	ret = dma_fence_wait(fence, intr);
-	if (ret)
-		return ret;
-
-	if (fence->error)
-		return fence->error;
-
-	i915_gem_to_ttm(obj)->moving = NULL;
-	dma_fence_put(fence);
-	return 0;
+	return dma_resv_wait_timeout(obj->base. resv, DMA_RESV_USAGE_KERNEL,
+				     intr, MAX_SCHEDULE_TIMEOUT);
 }
 
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 02c37fe4a535..e11d82a9f7c3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -520,12 +520,8 @@ i915_gem_object_finish_access(struct drm_i915_gem_object *obj)
 	i915_gem_object_unpin_pages(obj);
 }
 
-struct dma_fence *
-i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj);
-
-void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,
-				      struct dma_fence *fence);
-
+int i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj,
+				     struct dma_fence **fence);
 int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
 				      bool intr);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 438b8a95b3d1..a10716f4e717 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -467,19 +467,6 @@ __i915_ttm_move(struct ttm_buffer_object *bo,
 	return fence;
 }
 
-static int
-prev_deps(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
-	  struct i915_deps *deps)
-{
-	int ret;
-
-	ret = i915_deps_add_dependency(deps, bo->moving, ctx);
-	if (!ret)
-		ret = i915_deps_add_resv(deps, bo->base.resv, ctx);
-
-	return ret;
-}
-
 /**
  * i915_ttm_move - The TTM move callback used by i915.
  * @bo: The buffer object.
@@ -534,7 +521,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 		struct i915_deps deps;
 
 		i915_deps_init(&deps, GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN);
-		ret = prev_deps(bo, ctx, &deps);
+		ret = i915_deps_add_resv(&deps, bo->base.resv, ctx);
 		if (ret) {
 			i915_refct_sgt_put(dst_rsgt);
 			return ret;
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
index 4997ed18b6e4..0ad443a90c8b 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
@@ -219,8 +219,7 @@ static int __igt_lmem_pages_migrate(struct intel_gt *gt,
 			err = dma_resv_reserve_fences(obj->base.resv, 1);
 			if (!err)
 				dma_resv_add_fence(obj->base.resv, &rq->fence,
-						   DMA_RESV_USAGE_WRITE);
-			i915_gem_object_set_moving_fence(obj, &rq->fence);
+						   DMA_RESV_USAGE_KERNEL);
 			i915_request_put(rq);
 		}
 		if (err)
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 3a6e3f6d239f..dfc34cc2ef8c 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -1221,8 +1221,7 @@ static int __igt_mmap_migrate(struct intel_memory_region **placements,
 	i915_gem_object_unpin_pages(obj);
 	if (rq) {
 		dma_resv_add_fence(obj->base.resv, &rq->fence,
-				   DMA_RESV_USAGE_WRITE);
-		i915_gem_object_set_moving_fence(obj, &rq->fence);
+				   DMA_RESV_USAGE_KERNEL);
 		i915_request_put(rq);
 	}
 	i915_gem_object_unlock(obj);
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 524477d8939e..d077f7b9eaad 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1357,10 +1357,17 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	if (err)
 		return err;
 
+	if (vma->obj) {
+		err = i915_gem_object_get_moving_fence(vma->obj, &moving);
+		if (err)
+			return err;
+	} else {
+		moving = NULL;
+	}
+
 	if (flags & PIN_GLOBAL)
 		wakeref = intel_runtime_pm_get(&vma->vm->i915->runtime_pm);
 
-	moving = vma->obj ? i915_gem_object_get_moving_fence(vma->obj) : NULL;
 	if (flags & vma->vm->bind_async_flags || moving) {
 		/* lock VM */
 		err = i915_vm_lock_objects(vma->vm, ww);
-- 
2.25.1

