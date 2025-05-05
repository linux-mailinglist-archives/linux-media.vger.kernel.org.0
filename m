Return-Path: <linux-media+bounces-31755-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B342CAAA4FE
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 01:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31C01466C99
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 23:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA55A309F3C;
	Mon,  5 May 2025 22:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OkXHJ1sQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BB7309F2E;
	Mon,  5 May 2025 22:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484111; cv=none; b=ROoTYdVs+EHVpraVHufZz2v9qRiP6aqhWdI9YArjsf42ZEFKCR67AceVIXU3UOscscQUo00mvCW1hCdHeUS/K7EQAvuGsTXgYlkJI5tFEgb7w+erIkMkjJeSDSbnmOIdmRtYLLGfGZmjqvVrUMF7KQq069RVIjhFVk7FqS/nIIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484111; c=relaxed/simple;
	bh=mWiBvJO1a2rtUhX4aaf/TSATYZu3N502Qk/zgr5NQOg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VImY9A29doYQRCvluHt8XeIuBFvynyGMjcVNBw4DegUY2tv8qHIP9bnIf+GhUrxpdcO/G6Oe5L8Sdroqt/Aw4knMoc95wTh+tKQ2+9p4lqpccl1E+iGW+9iMrb329gmy8dWBfcBHwQPBTQ9UOVXrhIkdnJ/aBHCSG8e65bBZtlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OkXHJ1sQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B598C4CEEE;
	Mon,  5 May 2025 22:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484110;
	bh=mWiBvJO1a2rtUhX4aaf/TSATYZu3N502Qk/zgr5NQOg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OkXHJ1sQ84H50CrGGaLbHdJGYiNYpSpqjEiGD1xhpZisrESJtuCxfjI2DXaLrIrCb
	 IBmdChfKHPCf+iG5xVThQ2bSHCXY+vS0lY6vVXXz3/oSw6g1mBnnSlvfSPPy7rp1Bp
	 bNOYUZw+lSIaFvebI1RWFrWJBI/zOdTZnoleihiI1eTOEH4gxZxRudiZk53pQw9b/O
	 BbDdY2Kc9ikaAAdRzTMa8QyiPfVIo2Wfk7mStxu7dhnkh0hamgrjKx68JQYbmIX60U
	 3hX4sWIsk/DQQ0OyjlzyXEjhxJymudbKizjegTd0A2zpjeW9DvLz3Cahs7HnfQKg99
	 Hjgt34Aq4FDkA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	James Zhu <James.Zhu@amd.com>,
	Felix Kuehling <felix.kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Sasha Levin <sashal@kernel.org>,
	Felix.Kuehling@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	sumit.semwal@linaro.org,
	tvrtko.ursulin@igalia.com,
	Yunxiang.Li@amd.com,
	lijo.lazar@amd.com,
	sunil.khatri@amd.com,
	pratap.nirujogi@amd.com,
	pierre-eric.pelloux-prayer@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH AUTOSEL 6.14 355/642] drm/amdgpu: remove all KFD fences from the BO on release
Date: Mon,  5 May 2025 18:09:31 -0400
Message-Id: <20250505221419.2672473-355-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Christian König <christian.koenig@amd.com>

[ Upstream commit cb0de06d1b0afb2d0c600ad748069f5ce27730ec ]

Remove all KFD BOs from the private dma_resv object.

This prevents the KFD from being evict unecessarily when an exported BO
is released.

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: James Zhu <James.Zhu@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Reviewed-and-tested-by: James Zhu <James.Zhu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  5 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 52 ++++++++-----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 38 ++++++++------
 3 files changed, 47 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 8af67f18500a7..2f48dc5747aa2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -192,7 +192,7 @@ int kfd_debugfs_kfd_mem_limits(struct seq_file *m, void *data);
 #if IS_ENABLED(CONFIG_HSA_AMD)
 bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm);
 struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f);
-int amdgpu_amdkfd_remove_fence_on_pt_pd_bos(struct amdgpu_bo *bo);
+void amdgpu_amdkfd_remove_all_eviction_fences(struct amdgpu_bo *bo);
 int amdgpu_amdkfd_evict_userptr(struct mmu_interval_notifier *mni,
 				unsigned long cur_seq, struct kgd_mem *mem);
 int amdgpu_amdkfd_bo_validate_and_fence(struct amdgpu_bo *bo,
@@ -212,9 +212,8 @@ struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f)
 }
 
 static inline
-int amdgpu_amdkfd_remove_fence_on_pt_pd_bos(struct amdgpu_bo *bo)
+void amdgpu_amdkfd_remove_all_eviction_fences(struct amdgpu_bo *bo)
 {
-	return 0;
 }
 
 static inline
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 70224b9f54f2f..c0aaa72b6c210 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -370,40 +370,32 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
 	return 0;
 }
 
-int amdgpu_amdkfd_remove_fence_on_pt_pd_bos(struct amdgpu_bo *bo)
+/**
+ * amdgpu_amdkfd_remove_all_eviction_fences - Remove all eviction fences
+ * @bo: the BO where to remove the evictions fences from.
+ *
+ * This functions should only be used on release when all references to the BO
+ * are already dropped. We remove the eviction fence from the private copy of
+ * the dma_resv object here since that is what is used during release to
+ * determine of the BO is idle or not.
+ */
+void amdgpu_amdkfd_remove_all_eviction_fences(struct amdgpu_bo *bo)
 {
-	struct amdgpu_bo *root = bo;
-	struct amdgpu_vm_bo_base *vm_bo;
-	struct amdgpu_vm *vm;
-	struct amdkfd_process_info *info;
-	struct amdgpu_amdkfd_fence *ef;
-	int ret;
-
-	/* we can always get vm_bo from root PD bo.*/
-	while (root->parent)
-		root = root->parent;
+	struct dma_resv *resv = &bo->tbo.base._resv;
+	struct dma_fence *fence, *stub;
+	struct dma_resv_iter cursor;
 
-	vm_bo = root->vm_bo;
-	if (!vm_bo)
-		return 0;
+	dma_resv_assert_held(resv);
 
-	vm = vm_bo->vm;
-	if (!vm)
-		return 0;
-
-	info = vm->process_info;
-	if (!info || !info->eviction_fence)
-		return 0;
-
-	ef = container_of(dma_fence_get(&info->eviction_fence->base),
-			struct amdgpu_amdkfd_fence, base);
-
-	BUG_ON(!dma_resv_trylock(bo->tbo.base.resv));
-	ret = amdgpu_amdkfd_remove_eviction_fence(bo, ef);
-	dma_resv_unlock(bo->tbo.base.resv);
+	stub = dma_fence_get_stub();
+	dma_resv_for_each_fence(&cursor, resv, DMA_RESV_USAGE_BOOKKEEP, fence) {
+		if (!to_amdgpu_amdkfd_fence(fence))
+			continue;
 
-	dma_fence_put(&ef->base);
-	return ret;
+		dma_resv_replace_fences(resv, fence->context, stub,
+					DMA_RESV_USAGE_BOOKKEEP);
+	}
+	dma_fence_put(stub);
 }
 
 static int amdgpu_amdkfd_bo_validate(struct amdgpu_bo *bo, uint32_t domain,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 00752e3f9d8ab..0b9987781f762 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1295,28 +1295,36 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	if (abo->kfd_bo)
 		amdgpu_amdkfd_release_notify(abo);
 
-	/* We only remove the fence if the resv has individualized. */
-	WARN_ON_ONCE(bo->type == ttm_bo_type_kernel
-			&& bo->base.resv != &bo->base._resv);
-	if (bo->base.resv == &bo->base._resv)
-		amdgpu_amdkfd_remove_fence_on_pt_pd_bos(abo);
+	/*
+	 * We lock the private dma_resv object here and since the BO is about to
+	 * be released nobody else should have a pointer to it.
+	 * So when this locking here fails something is wrong with the reference
+	 * counting.
+	 */
+	if (WARN_ON_ONCE(!dma_resv_trylock(&bo->base._resv)))
+		return;
+
+	amdgpu_amdkfd_remove_all_eviction_fences(abo);
 
 	if (!bo->resource || bo->resource->mem_type != TTM_PL_VRAM ||
 	    !(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE) ||
 	    adev->in_suspend || drm_dev_is_unplugged(adev_to_drm(adev)))
-		return;
+		goto out;
 
-	if (WARN_ON_ONCE(!dma_resv_trylock(bo->base.resv)))
-		return;
+	r = dma_resv_reserve_fences(&bo->base._resv, 1);
+	if (r)
+		goto out;
 
-	r = amdgpu_fill_buffer(abo, 0, bo->base.resv, &fence, true);
-	if (!WARN_ON(r)) {
-		amdgpu_vram_mgr_set_cleared(bo->resource);
-		amdgpu_bo_fence(abo, fence, false);
-		dma_fence_put(fence);
-	}
+	r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true);
+	if (WARN_ON(r))
+		goto out;
+
+	amdgpu_vram_mgr_set_cleared(bo->resource);
+	dma_resv_add_fence(&bo->base._resv, fence, DMA_RESV_USAGE_KERNEL);
+	dma_fence_put(fence);
 
-	dma_resv_unlock(bo->base.resv);
+out:
+	dma_resv_unlock(&bo->base._resv);
 }
 
 /**
-- 
2.39.5


