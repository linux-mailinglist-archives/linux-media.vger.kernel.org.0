Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5510C461660
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 14:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245277AbhK2NbO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 08:31:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237340AbhK2N3N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 08:29:13 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 560F8C0048F5
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:41 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id d24so36330373wra.0
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iXk/BAglFY4+iArSPyqj5oNvQDhYe5ziG2iDX3cCpzk=;
        b=HwL7JeXwfoagXZaDlHM/xWxm2tVFNdIXBGGWKgUZ+lIqlD6LRb2FoT/no/wTqp3+K7
         f0TI8gOfVx5BaLr0Lqq+95Lq4Uy1XoYU66mRGrlMLW8fwwwTtZXtfy3OKPVc8pwi9g06
         JmPYjvJd4eP6ORjmR2XV2AMrbPQzDrtr87Uq23oX0JaYovH4AoZsUakH0VNOr1AJ60Iu
         483jQzZwRyUwznLwYrTE7DKhbCfasMNiqlZ3l5wLKg1QyDfjumc78dubh6VR7dXBQuoG
         Kiwffruk9LzDgZcyDH3hgn+rxd65N7XXVxZR4SB065woHwCy/vfH1Z9IIDhnYssXYiAj
         Iecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iXk/BAglFY4+iArSPyqj5oNvQDhYe5ziG2iDX3cCpzk=;
        b=KdSUysaeEtpk6CjwO2pWUmwlIh1PKf/LCBiF+nuCzpQRjUOI2sDW1OCNkLzA+Vs6rk
         zrXTN2XkAJdo/aunql1nU7yDsBBRlK3UEjCB+AY0rbaQeepf6r9kXhdOs1jBMY/87t8e
         KmPy7jCFfou53fA2IrJJk0BaIagyqsk5/yCCC61cKC26kbsVeiG+j85pvoj/9G5tsA3d
         DqLsgSaJLkorbIIJb8D3oIJUIP+q5MwzAK5qzDcJclJPLUJK0b8M4QlxxzCRhpm6CqhD
         9UcU8JD+vjU4pprTVpnul8MTt1OMdbIkl75m0n/8FCMaAj6u4BuZxNqmES8/Yb+cuKRL
         GyJA==
X-Gm-Message-State: AOAM5324S7RS0zpqcHOCCGPysoHF5xB0f34nAZBdXJvgp57LqHXjq94Y
        5hV+YvTYUF8sziSXN19Q83s=
X-Google-Smtp-Source: ABdhPJw74jwTZqQ764rBYdIn7m6M3TW7UaeH8cSMqKWCvirfeGdXBaqAWFhEIFMg95nJU2zdeSPbrg==
X-Received: by 2002:adf:e286:: with SMTP id v6mr33223065wri.565.1638187659838;
        Mon, 29 Nov 2021 04:07:39 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 04:07:39 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 28/28] drm/ttm: remove bo->moving
Date:   Mon, 29 Nov 2021 13:06:59 +0100
Message-Id: <20211129120659.1815-29-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is now handled by the DMA-buf framework in the dma_resv obj.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 13 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  7 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c    | 11 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   | 11 ++++--
 drivers/gpu/drm/ttm/ttm_bo.c                  | 10 ++----
 drivers/gpu/drm/ttm/ttm_bo_util.c             |  7 ----
 drivers/gpu/drm/ttm/ttm_bo_vm.c               | 34 +++++++------------
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      |  6 ----
 include/drm/ttm/ttm_bo_api.h                  |  2 --
 9 files changed, 40 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index bbfd7a1e42e8..7bd39e5d36dd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -2330,6 +2330,8 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 		struct amdgpu_bo *bo = mem->bo;
 		uint32_t domain = mem->domain;
 		struct kfd_mem_attachment *attachment;
+		struct dma_resv_iter cursor;
+		struct dma_fence *fence;
 
 		total_size += amdgpu_bo_size(bo);
 
@@ -2344,10 +2346,13 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 				goto validate_map_fail;
 			}
 		}
-		ret = amdgpu_sync_fence(&sync_obj, bo->tbo.moving);
-		if (ret) {
-			pr_debug("Memory eviction: Sync BO fence failed. Try again\n");
-			goto validate_map_fail;
+		dma_resv_for_each_fence(&cursor, bo->tbo.base.resv,
+					DMA_RESV_USAGE_KERNEL, fence) {
+			ret = amdgpu_sync_fence(&sync_obj, fence);
+			if (ret) {
+				pr_debug("Memory eviction: Sync BO fence failed. Try again\n");
+				goto validate_map_fail;
+			}
 		}
 		list_for_each_entry(attachment, &mem->attachments, list) {
 			if (!attachment->is_mapped)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index a40ede9bccd0..3881a503a7bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -608,9 +608,8 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 		if (unlikely(r))
 			goto fail_unreserve;
 
-		amdgpu_bo_fence(bo, fence, false);
-		dma_fence_put(bo->tbo.moving);
-		bo->tbo.moving = dma_fence_get(fence);
+		dma_resv_add_fence(bo->tbo.base.resv, fence,
+				   DMA_RESV_USAGE_KERNEL);
 		dma_fence_put(fence);
 	}
 	if (!bp->resv)
@@ -1290,7 +1289,7 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 
 	r = amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv, &fence);
 	if (!WARN_ON(r)) {
-		amdgpu_bo_fence(abo, fence, false);
+		dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_KERNEL);
 		dma_fence_put(fence);
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
index e3fbf0f10add..31913ae86de6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
@@ -74,13 +74,12 @@ static int amdgpu_vm_cpu_update(struct amdgpu_vm_update_params *p,
 {
 	unsigned int i;
 	uint64_t value;
-	int r;
+	long r;
 
-	if (vmbo->bo.tbo.moving) {
-		r = dma_fence_wait(vmbo->bo.tbo.moving, true);
-		if (r)
-			return r;
-	}
+	r = dma_resv_wait_timeout(vmbo->bo.tbo.base.resv, DMA_RESV_USAGE_KERNEL,
+				  true, MAX_SCHEDULE_TIMEOUT);
+	if (r < 0)
+		return r;
 
 	pe += (unsigned long)amdgpu_bo_kptr(&vmbo->bo);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index dbb551762805..bdb44cee19d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -204,14 +204,19 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
 	struct amdgpu_bo *bo = &vmbo->bo;
 	enum amdgpu_ib_pool_type pool = p->immediate ? AMDGPU_IB_POOL_IMMEDIATE
 		: AMDGPU_IB_POOL_DELAYED;
+	struct dma_resv_iter cursor;
 	unsigned int i, ndw, nptes;
+	struct dma_fence *fence;
 	uint64_t *pte;
 	int r;
 
 	/* Wait for PD/PT moves to be completed */
-	r = amdgpu_sync_fence(&p->job->sync, bo->tbo.moving);
-	if (r)
-		return r;
+	dma_resv_for_each_fence(&cursor, bo->tbo.base.resv,
+				DMA_RESV_USAGE_KERNEL, fence) {
+		r = amdgpu_sync_fence(&p->job->sync, fence);
+		if (r)
+			return r;
+	}
 
 	do {
 		ndw = p->num_dw_left;
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index d3527d3f7b18..7b9e0f46f121 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -468,7 +468,6 @@ static void ttm_bo_release(struct kref *kref)
 	dma_resv_unlock(bo->base.resv);
 
 	atomic_dec(&ttm_glob.bo_count);
-	dma_fence_put(bo->moving);
 	bo->destroy(bo);
 }
 
@@ -737,9 +736,8 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 }
 
 /*
- * Add the last move fence to the BO and reserve a new shared slot. We only use
- * a shared slot to avoid unecessary sync and rely on the subsequent bo move to
- * either stall or use an exclusive fence respectively set bo->moving.
+ * Add the last move fence to the BO as kernel dependency and reserve a new
+ * fence slot.
  */
 static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 				 struct ttm_resource_manager *man,
@@ -769,9 +767,6 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 		dma_fence_put(fence);
 		return ret;
 	}
-
-	dma_fence_put(bo->moving);
-	bo->moving = fence;
 	return 0;
 }
 
@@ -978,7 +973,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
 	bo->bdev = bdev;
 	bo->type = type;
 	bo->page_alignment = page_alignment;
-	bo->moving = NULL;
 	bo->pin_count = 0;
 	bo->sg = sg;
 	if (resv) {
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index b9cfb62c4b6e..95de2691ee7c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -229,7 +229,6 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 	atomic_inc(&ttm_glob.bo_count);
 	INIT_LIST_HEAD(&fbo->base.ddestroy);
 	INIT_LIST_HEAD(&fbo->base.lru);
-	fbo->base.moving = NULL;
 	drm_vma_node_reset(&fbo->base.base.vma_node);
 
 	kref_init(&fbo->base.kref);
@@ -496,9 +495,6 @@ static int ttm_bo_move_to_ghost(struct ttm_buffer_object *bo,
 	 * operation has completed.
 	 */
 
-	dma_fence_put(bo->moving);
-	bo->moving = dma_fence_get(fence);
-
 	ret = ttm_buffer_object_transfer(bo, &ghost_obj);
 	if (ret)
 		return ret;
@@ -543,9 +539,6 @@ static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
 	spin_unlock(&from->move_lock);
 
 	ttm_resource_free(bo, &bo->resource);
-
-	dma_fence_put(bo->moving);
-	bo->moving = dma_fence_get(fence);
 }
 
 int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 08ba083a80d2..5b324f245265 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -46,17 +46,13 @@
 static vm_fault_t ttm_bo_vm_fault_idle(struct ttm_buffer_object *bo,
 				struct vm_fault *vmf)
 {
-	vm_fault_t ret = 0;
-	int err = 0;
-
-	if (likely(!bo->moving))
-		goto out_unlock;
+	long err = 0;
 
 	/*
 	 * Quick non-stalling check for idle.
 	 */
-	if (dma_fence_is_signaled(bo->moving))
-		goto out_clear;
+	if (dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_KERNEL))
+		return 0;
 
 	/*
 	 * If possible, avoid waiting for GPU with mmap_lock
@@ -64,34 +60,30 @@ static vm_fault_t ttm_bo_vm_fault_idle(struct ttm_buffer_object *bo,
 	 * is the first attempt.
 	 */
 	if (fault_flag_allow_retry_first(vmf->flags)) {
-		ret = VM_FAULT_RETRY;
 		if (vmf->flags & FAULT_FLAG_RETRY_NOWAIT)
-			goto out_unlock;
+			return VM_FAULT_RETRY;
 
 		ttm_bo_get(bo);
 		mmap_read_unlock(vmf->vma->vm_mm);
-		(void) dma_fence_wait(bo->moving, true);
+		(void)dma_resv_wait_timeout(bo->base.resv,
+					    DMA_RESV_USAGE_KERNEL, true,
+					    MAX_SCHEDULE_TIMEOUT);
 		dma_resv_unlock(bo->base.resv);
 		ttm_bo_put(bo);
-		goto out_unlock;
+		return VM_FAULT_RETRY;
 	}
 
 	/*
 	 * Ordinary wait.
 	 */
-	err = dma_fence_wait(bo->moving, true);
-	if (unlikely(err != 0)) {
-		ret = (err != -ERESTARTSYS) ? VM_FAULT_SIGBUS :
+	err = dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_KERNEL, true,
+				    MAX_SCHEDULE_TIMEOUT);
+	if (unlikely(err < 0)) {
+		return (err != -ERESTARTSYS) ? VM_FAULT_SIGBUS :
 			VM_FAULT_NOPAGE;
-		goto out_unlock;
 	}
 
-out_clear:
-	dma_fence_put(bo->moving);
-	bo->moving = NULL;
-
-out_unlock:
-	return ret;
+	return 0;
 }
 
 static unsigned long ttm_bo_io_mem_pfn(struct ttm_buffer_object *bo,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 9e3dcbb573e7..40cc2c13e963 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -1166,12 +1166,6 @@ int vmw_resources_clean(struct vmw_buffer_object *vbo, pgoff_t start,
 		*num_prefault = __KERNEL_DIV_ROUND_UP(last_cleaned - res_start,
 						      PAGE_SIZE);
 		vmw_bo_fence_single(bo, NULL);
-		if (bo->moving)
-			dma_fence_put(bo->moving);
-
-		return dma_resv_get_singleton(bo->base.resv,
-					      DMA_RESV_USAGE_KERNEL,
-					      &bo->moving);
 	}
 
 	return 0;
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index cd785cfa3123..9798eb097c13 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -98,7 +98,6 @@ struct ttm_tt;
  * @lru: List head for the lru list.
  * @ddestroy: List head for the delayed destroy list.
  * @swap: List head for swap LRU list.
- * @moving: Fence set when BO is moving
  * @offset: The current GPU offset, which can have different meanings
  * depending on the memory type. For SYSTEM type memory, it should be 0.
  * @cur_placement: Hint of current placement.
@@ -151,7 +150,6 @@ struct ttm_buffer_object {
 	 * Members protected by a bo reservation.
 	 */
 
-	struct dma_fence *moving;
 	unsigned priority;
 	unsigned pin_count;
 
-- 
2.25.1

