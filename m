Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C97446BB3D
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 13:34:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236458AbhLGMiN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 07:38:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236437AbhLGMiM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 07:38:12 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E98AC061574
        for <linux-media@vger.kernel.org>; Tue,  7 Dec 2021 04:34:42 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id v11so29123578wrw.10
        for <linux-media@vger.kernel.org>; Tue, 07 Dec 2021 04:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BLWj/fhnjrVXXgIZh+35PyfbaELKgXrNzdGXr64Mrg8=;
        b=Mo6dQh4aMYZSi/FfurdmsFCAWDnsBUGvvePsJEJoGQecos07BeKewKnfJtpQDxa9Kk
         /MC9tWqe/5eGmlLoeQrpqI/0yKr0JWbLST57/KkMj+30DV0x7rylo6DPyqM3UZV2SwVH
         JChzwOhTOsTK/uX4A0+IMzqc7ZbgPFaBxYYmERO/sIPhOUXYrUzvj13qpCOEpcKonjhV
         Mwpba73Nvf2MAz3lfp5ylFPmxSlFFgAV1qCYD0P15AbwQnQGW2BobDFer+8jxGfCtPT+
         T3iG5oUlEfbV5vhX0T8mzzz2+fuIPmGUyalL02wW1rosHdGDAT13mMFkrc+LVF1l/tkH
         91Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BLWj/fhnjrVXXgIZh+35PyfbaELKgXrNzdGXr64Mrg8=;
        b=nkGislPoso1j1hqbhuHDUVKcyeSF0FHcdZYqRl/dqsegGdPOQL1udQir89CejpxrbL
         4kxnEDR83E5gksOMXcvOI7maCEFTwe+lBlgEC/mmodZeR5uDRaOoavpmR7H/m0EbmCyx
         xJUD+tm/vppjTCBT8radDWry+NpbD9yUXAgxyeRknCKxr/shUEeSR75DOAc5nK2nGVVG
         Pi0zzs6kbLv9ngW9I11f2BZUoHUlPjjGJ3jQfPFuH4sWk3MVSXOG3OOl3ErlGNZ9Okd/
         vPlCHmxWwJxnGjLYL8GW1F+Z2zyDkD69AxZ5dOyZAzprkYIliR9jOGd0emmCXLLOeaXZ
         Bm7A==
X-Gm-Message-State: AOAM532KI8Rlc41ds2Tsaqa1l+wv0jmlc8wd9Dk0JqXhob3g4EUbljJh
        MiyHCfHqZWnkNzcE+wVfYB4=
X-Google-Smtp-Source: ABdhPJyudjrW4fM5l1yfHxsEOQusGi5XE7kLhAX/z77mCLpEziyekvKvPnwAADKOqDk8LP7TYC2MBg==
X-Received: by 2002:a5d:4b41:: with SMTP id w1mr50952382wrs.537.1638880480700;
        Tue, 07 Dec 2021 04:34:40 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 04:34:39 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 21/24] dma-buf: add DMA_RESV_USAGE_BOOKKEEP
Date:   Tue,  7 Dec 2021 13:34:08 +0100
Message-Id: <20211207123411.167006-22-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add an usage for submissions independent of implicit sync but still
interesting for memory management.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c                     |  2 +-
 drivers/dma-buf/st-dma-resv.c                  |  2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c        |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c         |  6 +++---
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c       |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c    |  2 +-
 drivers/gpu/drm/qxl/qxl_debugfs.c              |  2 +-
 drivers/gpu/drm/radeon/radeon_gem.c            |  2 +-
 drivers/gpu/drm/radeon/radeon_mn.c             |  2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                   | 14 +++++++-------
 include/linux/dma-resv.h                       | 18 +++++++++++++++++-
 15 files changed, 40 insertions(+), 24 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index a2a0b5b6c107..a058a3e805ab 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -548,7 +548,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 
 	list = NULL;
 
-	dma_resv_iter_begin(&cursor, src, DMA_RESV_USAGE_READ);
+	dma_resv_iter_begin(&cursor, src, DMA_RESV_USAGE_BOOKKEEP);
 	dma_resv_for_each_fence_unlocked(&cursor, f) {
 
 		if (dma_resv_iter_is_restarted(&cursor)) {
diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
index 062b57d63fa6..8ace9e84c845 100644
--- a/drivers/dma-buf/st-dma-resv.c
+++ b/drivers/dma-buf/st-dma-resv.c
@@ -296,7 +296,7 @@ int dma_resv(void)
 	int r;
 
 	spin_lock_init(&fence_lock);
-	for (usage = DMA_RESV_USAGE_KERNEL; usage <= DMA_RESV_USAGE_READ;
+	for (usage = DMA_RESV_USAGE_KERNEL; usage <= DMA_RESV_USAGE_BOOKKEEP;
 	     ++usage) {
 		r = subtests(tests, (void *)(unsigned long)usage);
 		if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 4a469831afe3..bbfd7a1e42e8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -246,7 +246,7 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
 	 */
 	replacement = dma_fence_get_stub();
 	dma_resv_replace_fences(bo->tbo.base.resv, ef->base.context,
-				replacement, DMA_RESV_USAGE_READ);
+				replacement, DMA_RESV_USAGE_BOOKKEEP);
 	dma_fence_put(replacement);
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
index 490d2a7a3e2b..ddf46802b1ff 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
@@ -111,7 +111,7 @@ void amdgpu_pasid_free_delayed(struct dma_resv *resv,
 	struct dma_fence *fence;
 	int r;
 
-	r = dma_resv_get_singleton(resv, DMA_RESV_USAGE_READ, &fence);
+	r = dma_resv_get_singleton(resv, DMA_RESV_USAGE_BOOKKEEP, &fence);
 	if (r)
 		goto fallback;
 
@@ -139,7 +139,7 @@ void amdgpu_pasid_free_delayed(struct dma_resv *resv,
 	/* Not enough memory for the delayed delete, as last resort
 	 * block for all the fences to complete.
 	 */
-	dma_resv_wait_timeout(resv, DMA_RESV_USAGE_READ,
+	dma_resv_wait_timeout(resv, DMA_RESV_USAGE_BOOKKEEP,
 			      false, MAX_SCHEDULE_TIMEOUT);
 	amdgpu_pasid_free(pasid);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
index 86f5248676b0..b86c0b8252a5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
@@ -75,7 +75,7 @@ static bool amdgpu_mn_invalidate_gfx(struct mmu_interval_notifier *mni,
 
 	mmu_interval_set_seq(mni, cur_seq);
 
-	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_READ,
+	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_BOOKKEEP,
 				  false, MAX_SCHEDULE_TIMEOUT);
 	mutex_unlock(&adev->notifier_lock);
 	if (r <= 0)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index 183623806056..1447f009a957 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -260,7 +260,7 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 		return -EINVAL;
 
 	/* TODO: Use DMA_RESV_USAGE_READ here */
-	dma_resv_for_each_fence(&cursor, resv, DMA_RESV_USAGE_READ, f) {
+	dma_resv_for_each_fence(&cursor, resv, DMA_RESV_USAGE_BOOKKEEP, f) {
 		dma_fence_chain_for_each(f, f) {
 			struct dma_fence_chain *chain = to_dma_fence_chain(f);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index fd339762f534..3740d6e788ef 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1361,7 +1361,7 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 	 * be resident to run successfully
 	 */
 	dma_resv_for_each_fence(&resv_cursor, bo->base.resv,
-				DMA_RESV_USAGE_READ, f) {
+				DMA_RESV_USAGE_BOOKKEEP, f) {
 		if (amdkfd_fence_check_mm(f, current->mm))
 			return false;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 9eac1e783bbb..6a3ccd344a9f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2105,7 +2105,7 @@ static void amdgpu_vm_prt_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
-	dma_resv_for_each_fence(&cursor, resv, DMA_RESV_USAGE_READ, fence) {
+	dma_resv_for_each_fence(&cursor, resv, DMA_RESV_USAGE_BOOKKEEP, fence) {
 		/* Add a callback for each fence in the reservation object */
 		amdgpu_vm_prt_get(adev);
 		amdgpu_vm_add_prt_cb(adev, fence);
@@ -2707,7 +2707,7 @@ bool amdgpu_vm_evictable(struct amdgpu_bo *bo)
 		return true;
 
 	/* Don't evict VM page tables while they are busy */
-	if (!dma_resv_test_signaled(bo->tbo.base.resv, DMA_RESV_USAGE_READ))
+	if (!dma_resv_test_signaled(bo->tbo.base.resv, DMA_RESV_USAGE_BOOKKEEP))
 		return false;
 
 	/* Try to block ongoing updates */
@@ -2888,7 +2888,7 @@ void amdgpu_vm_adjust_size(struct amdgpu_device *adev, uint32_t min_vm_size,
 long amdgpu_vm_wait_idle(struct amdgpu_vm *vm, long timeout)
 {
 	timeout = dma_resv_wait_timeout(vm->root.bo->tbo.base.resv,
-					DMA_RESV_USAGE_READ,
+					DMA_RESV_USAGE_BOOKKEEP,
 					true, timeout);
 	if (timeout <= 0)
 		return timeout;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
index a200d3e66573..4115a222a853 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
@@ -66,7 +66,7 @@ bool __i915_gem_object_is_lmem(struct drm_i915_gem_object *obj)
 	struct intel_memory_region *mr = READ_ONCE(obj->mm.region);
 
 #ifdef CONFIG_LOCKDEP
-	GEM_WARN_ON(dma_resv_test_signaled(obj->base.resv, DMA_RESV_USAGE_READ) &&
+	GEM_WARN_ON(dma_resv_test_signaled(obj->base.resv, DMA_RESV_USAGE_BOOKKEEP) &&
 		    i915_gem_object_evictable(obj));
 #endif
 	return mr && (mr->type == INTEL_MEMORY_LOCAL ||
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 0ccb91385f84..67b1fa845f22 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -85,7 +85,7 @@ static bool i915_gem_userptr_invalidate(struct mmu_interval_notifier *mni,
 		return true;
 
 	/* we will unbind on next submission, still have userptr pins */
-	r = dma_resv_wait_timeout(obj->base.resv, DMA_RESV_USAGE_READ, false,
+	r = dma_resv_wait_timeout(obj->base.resv, DMA_RESV_USAGE_BOOKKEEP, false,
 				  MAX_SCHEDULE_TIMEOUT);
 	if (r <= 0)
 		drm_err(&i915->drm, "(%ld) failed to wait for idle\n", r);
diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
index 33e5889d6608..2d9ed3b94574 100644
--- a/drivers/gpu/drm/qxl/qxl_debugfs.c
+++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
@@ -62,7 +62,7 @@ qxl_debugfs_buffers_info(struct seq_file *m, void *data)
 		int rel = 0;
 
 		dma_resv_iter_begin(&cursor, bo->tbo.base.resv,
-				    DMA_RESV_USAGE_READ);
+				    DMA_RESV_USAGE_BOOKKEEP);
 		dma_resv_for_each_fence_unlocked(&cursor, fence) {
 			if (dma_resv_iter_is_restarted(&cursor))
 				rel = 0;
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 71bf9299e45c..9587ab88bedd 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -162,7 +162,7 @@ static int radeon_gem_set_domain(struct drm_gem_object *gobj,
 	if (domain == RADEON_GEM_DOMAIN_CPU) {
 		/* Asking for cpu access wait for object idle */
 		r = dma_resv_wait_timeout(robj->tbo.base.resv,
-					  DMA_RESV_USAGE_READ,
+					  DMA_RESV_USAGE_BOOKKEEP,
 					  true, 30 * HZ);
 		if (!r)
 			r = -EBUSY;
diff --git a/drivers/gpu/drm/radeon/radeon_mn.c b/drivers/gpu/drm/radeon/radeon_mn.c
index 68ebeb1bdfff..29fe8423bd90 100644
--- a/drivers/gpu/drm/radeon/radeon_mn.c
+++ b/drivers/gpu/drm/radeon/radeon_mn.c
@@ -66,7 +66,7 @@ static bool radeon_mn_invalidate(struct mmu_interval_notifier *mn,
 		return true;
 	}
 
-	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_READ,
+	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_BOOKKEEP,
 				  false, MAX_SCHEDULE_TIMEOUT);
 	if (r <= 0)
 		DRM_ERROR("(%ld) failed to wait for user bo\n", r);
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index ad83f42fc9ee..d3527d3f7b18 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -272,7 +272,7 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
-	dma_resv_iter_begin(&cursor, resv, DMA_RESV_USAGE_READ);
+	dma_resv_iter_begin(&cursor, resv, DMA_RESV_USAGE_BOOKKEEP);
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 		if (!fence->ops->signaled)
 			dma_fence_enable_sw_signaling(fence);
@@ -301,7 +301,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 	struct dma_resv *resv = &bo->base._resv;
 	int ret;
 
-	if (dma_resv_test_signaled(resv, DMA_RESV_USAGE_READ))
+	if (dma_resv_test_signaled(resv, DMA_RESV_USAGE_BOOKKEEP))
 		ret = 0;
 	else
 		ret = -EBUSY;
@@ -313,7 +313,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 			dma_resv_unlock(bo->base.resv);
 		spin_unlock(&bo->bdev->lru_lock);
 
-		lret = dma_resv_wait_timeout(resv, DMA_RESV_USAGE_READ,
+		lret = dma_resv_wait_timeout(resv, DMA_RESV_USAGE_BOOKKEEP,
 					     interruptible,
 					     30 * HZ);
 
@@ -418,7 +418,7 @@ static void ttm_bo_release(struct kref *kref)
 			 * fences block for the BO to become idle
 			 */
 			dma_resv_wait_timeout(bo->base.resv,
-					      DMA_RESV_USAGE_READ, false,
+					      DMA_RESV_USAGE_BOOKKEEP, false,
 					      30 * HZ);
 		}
 
@@ -429,7 +429,7 @@ static void ttm_bo_release(struct kref *kref)
 		ttm_mem_io_free(bdev, bo->resource);
 	}
 
-	if (!dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_READ) ||
+	if (!dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP) ||
 	    !dma_resv_trylock(bo->base.resv)) {
 		/* The BO is not idle, resurrect it for delayed destroy */
 		ttm_bo_flush_all_fences(bo);
@@ -1074,13 +1074,13 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
 	long timeout = 15 * HZ;
 
 	if (no_wait) {
-		if (dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_READ))
+		if (dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP))
 			return 0;
 		else
 			return -EBUSY;
 	}
 
-	timeout = dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_READ,
+	timeout = dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP,
 					interruptible, timeout);
 	if (timeout < 0)
 		return timeout;
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 29d799991496..07ae5b00c1fa 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -55,7 +55,7 @@ struct dma_resv_list;
  * This enum describes the different use cases for a dma_resv object and
  * controls which fences are returned when queried.
  *
- * An important fact is that there is the order KERNEL<WRITE<READ and
+ * An important fact is that there is the order KERNEL<WRITE<READ<BOOKKEEP and
  * when the dma_resv object is asked for fences for one use case the fences
  * for the lower use case are returned as well.
  *
@@ -93,6 +93,22 @@ enum dma_resv_usage {
 	 * an implicit read dependency.
 	 */
 	DMA_RESV_USAGE_READ,
+
+	/**
+	 * @DMA_RESV_USAGE_BOOKKEEP: No implicit sync.
+	 *
+	 * This should be used by submissions which don't want to participate in
+	 * implicit synchronization.
+	 *
+	 * The most common case are submissions with explicit synchronization,
+	 * but also things like preemption fences as well as page table updates
+	 * might use this.
+	 *
+	 * The kernel memory management *always* need to wait for those fences
+	 * before moving or freeing the resource protected by the dma_resv
+	 * object.
+	 */
+	DMA_RESV_USAGE_BOOKKEEP
 };
 
 /**
-- 
2.25.1

