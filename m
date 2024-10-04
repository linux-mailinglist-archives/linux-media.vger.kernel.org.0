Return-Path: <linux-media+bounces-19109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E94990CC6
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 20:57:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB24F1C20A40
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 18:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0812207E2;
	Fri,  4 Oct 2024 18:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ER3t1wSw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8821FE4BD;
	Fri,  4 Oct 2024 18:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728066259; cv=none; b=VcNtpn70KcDVNqPjeTDiqNFaf/nhIZ0jhLEsrg5tNuNQQds/XfsmUYXpzBjLJtaUw/KJ9mHqMr+3CKr2kFNXWz+o33aqtkZnMKbd80E+dRRBIvcmF0JTn6k48KVeRRmJUed6gsBT5KoiLPtV80Xx7OmRCuxWHmqhhbvSRVXwFRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728066259; c=relaxed/simple;
	bh=CQGDjPS0DX2w2r5yziM1VpkUviJ1AUCnCKkRMTlmOrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mRYYCWv6UXBuRVYQnRq/73AgjFdGcnarIAyYZkEiqbROMayEaSdLc+N+5JmsDRV++ooFwvP49eeIK4uzdNt/CvwfsUnDFnzFWVO/Q1WI86KsCfri/u/qOp9VvSkDl+LW1GmwyqCJCAI+VFXxZDZObmJ31nuWWje2FNK1Q/qfwUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ER3t1wSw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556EEC4CEC6;
	Fri,  4 Oct 2024 18:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728066258;
	bh=CQGDjPS0DX2w2r5yziM1VpkUviJ1AUCnCKkRMTlmOrc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ER3t1wSwTD6lL9hAHgt9o9v2gAXL6m5S0rrvqi+4eeHGRKN6F1znQmSMrhspDTemN
	 56bi80HnKHrEUV1NndudUOd7SHqVR5yGt/NTf4S27miyBB7Gbk6wQv5bGHS3o3Yol6
	 hby+pQQV2HakHtwWqc0xyr5LZYRNugfQKIEuAJmMnLbLhj4raGZvUkP8f/Ki7rkPqX
	 /PT0GcGp5rxRu8zeY7eANB5/fNGazcvHZ8lq1hUnauHKt291smvDr2qO+yk6vWRS97
	 VHwDWyuQGOXJ8BjVu4cbT1HaxLNz2tiAQoRDwroPg3tVkRiGq58fEzU6W/jH/AIKDc
	 qME2s7oZra+5Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Sasha Levin <sashal@kernel.org>,
	Xinhui.Pan@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	sumit.semwal@linaro.org,
	mario.limonciello@amd.com,
	Hawking.Zhang@amd.com,
	hamza.mahfooz@amd.com,
	andrealmeid@igalia.com,
	kevinyang.wang@amd.com,
	victorchengchi.lu@amd.com,
	sunil.khatri@amd.com,
	chenxb_99091@126.com,
	Jun.Ma2@amd.com,
	Yunxiang.Li@amd.com,
	Felix.Kuehling@amd.com,
	Arunpravin.PaneerSelvam@amd.com,
	tvrtko.ursulin@igalia.com,
	pierre-eric.pelloux-prayer@amd.com,
	Wang.Beyond@amd.com,
	shashank.sharma@amd.com,
	zhenguo.yin@amd.com,
	jesse.zhang@amd.com,
	Philip.Yang@amd.com,
	rajneesh.bhardwaj@amd.com,
	Tim.Huang@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH AUTOSEL 6.10 66/70] drm/amdgpu: nuke the VM PD/PT shadow handling
Date: Fri,  4 Oct 2024 14:21:04 -0400
Message-ID: <20241004182200.3670903-66-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004182200.3670903-1-sashal@kernel.org>
References: <20241004182200.3670903-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.13
Content-Transfer-Encoding: 8bit

From: Christian König <christian.koenig@amd.com>

[ Upstream commit 7181faaa4703705939580abffaf9cb5d6b50dbb7 ]

This was only used as workaround for recovering the page tables after
VRAM was lost and is no longer necessary after the function
amdgpu_vm_bo_reset_state_machine() started to do the same.

Compute never used shadows either, so the only proplematic case left is
SVM and that is most likely not recoverable in any way when VRAM is
lost.

Signed-off-by: Christian König <christian.koenig@amd.com>
Acked-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h         |  4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  | 87 +--------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 67 +---------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  | 21 -----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 17 ----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c   | 56 +------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 19 +----
 7 files changed, 6 insertions(+), 265 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index f87d53e183c3d..b48e8066c01cc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1078,10 +1078,6 @@ struct amdgpu_device {
 
 	struct amdgpu_virt	virt;
 
-	/* link all shadow bo */
-	struct list_head                shadow_list;
-	struct mutex                    shadow_list_lock;
-
 	/* record hw reset is performed */
 	bool has_hw_reset;
 	u8				reset_magic[AMDGPU_RESET_MAGIC_NUM];
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index e66546df0bc19..1df57a02a7598 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4072,9 +4072,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	spin_lock_init(&adev->mm_stats.lock);
 	spin_lock_init(&adev->wb.lock);
 
-	INIT_LIST_HEAD(&adev->shadow_list);
-	mutex_init(&adev->shadow_list_lock);
-
 	INIT_LIST_HEAD(&adev->reset_list);
 
 	INIT_LIST_HEAD(&adev->ras_list);
@@ -4979,80 +4976,6 @@ static int amdgpu_device_ip_post_soft_reset(struct amdgpu_device *adev)
 	return 0;
 }
 
-/**
- * amdgpu_device_recover_vram - Recover some VRAM contents
- *
- * @adev: amdgpu_device pointer
- *
- * Restores the contents of VRAM buffers from the shadows in GTT.  Used to
- * restore things like GPUVM page tables after a GPU reset where
- * the contents of VRAM might be lost.
- *
- * Returns:
- * 0 on success, negative error code on failure.
- */
-static int amdgpu_device_recover_vram(struct amdgpu_device *adev)
-{
-	struct dma_fence *fence = NULL, *next = NULL;
-	struct amdgpu_bo *shadow;
-	struct amdgpu_bo_vm *vmbo;
-	long r = 1, tmo;
-
-	if (amdgpu_sriov_runtime(adev))
-		tmo = msecs_to_jiffies(8000);
-	else
-		tmo = msecs_to_jiffies(100);
-
-	dev_info(adev->dev, "recover vram bo from shadow start\n");
-	mutex_lock(&adev->shadow_list_lock);
-	list_for_each_entry(vmbo, &adev->shadow_list, shadow_list) {
-		/* If vm is compute context or adev is APU, shadow will be NULL */
-		if (!vmbo->shadow)
-			continue;
-		shadow = vmbo->shadow;
-
-		/* No need to recover an evicted BO */
-		if (!shadow->tbo.resource ||
-		    shadow->tbo.resource->mem_type != TTM_PL_TT ||
-		    shadow->tbo.resource->start == AMDGPU_BO_INVALID_OFFSET ||
-		    shadow->parent->tbo.resource->mem_type != TTM_PL_VRAM)
-			continue;
-
-		r = amdgpu_bo_restore_shadow(shadow, &next);
-		if (r)
-			break;
-
-		if (fence) {
-			tmo = dma_fence_wait_timeout(fence, false, tmo);
-			dma_fence_put(fence);
-			fence = next;
-			if (tmo == 0) {
-				r = -ETIMEDOUT;
-				break;
-			} else if (tmo < 0) {
-				r = tmo;
-				break;
-			}
-		} else {
-			fence = next;
-		}
-	}
-	mutex_unlock(&adev->shadow_list_lock);
-
-	if (fence)
-		tmo = dma_fence_wait_timeout(fence, false, tmo);
-	dma_fence_put(fence);
-
-	if (r < 0 || tmo <= 0) {
-		dev_err(adev->dev, "recover vram bo from shadow failed, r is %ld, tmo is %ld\n", r, tmo);
-		return -EIO;
-	}
-
-	dev_info(adev->dev, "recover vram bo from shadow done\n");
-	return 0;
-}
-
-
 /**
  * amdgpu_device_reset_sriov - reset ASIC for SR-IOV vf
  *
@@ -5112,12 +5035,8 @@ static int amdgpu_device_reset_sriov(struct amdgpu_device *adev,
 	if (r)
 		return r;
 
-	if (adev->virt.gim_feature & AMDGIM_FEATURE_GIM_FLR_VRAMLOST) {
+	if (adev->virt.gim_feature & AMDGIM_FEATURE_GIM_FLR_VRAMLOST)
 		amdgpu_inc_vram_lost(adev);
-		r = amdgpu_device_recover_vram(adev);
-	}
-	if (r)
-		return r;
 
 	/* need to be called during full access so we can't do it later like
 	 * bare-metal does.
@@ -5529,9 +5448,7 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
 			}
 		}
 
-		if (!r)
-			r = amdgpu_device_recover_vram(tmp_adev);
-		else
+		if (r)
 			tmp_adev->asic_reset_res = r;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index c556c8b653fa4..5f3b2c157824e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -77,24 +77,6 @@ static void amdgpu_bo_user_destroy(struct ttm_buffer_object *tbo)
 	amdgpu_bo_destroy(tbo);
 }
 
-static void amdgpu_bo_vm_destroy(struct ttm_buffer_object *tbo)
-{
-	struct amdgpu_device *adev = amdgpu_ttm_adev(tbo->bdev);
-	struct amdgpu_bo *shadow_bo = ttm_to_amdgpu_bo(tbo), *bo;
-	struct amdgpu_bo_vm *vmbo;
-
-	bo = shadow_bo->parent;
-	vmbo = to_amdgpu_bo_vm(bo);
-	/* in case amdgpu_device_recover_vram got NULL of bo->parent */
-	if (!list_empty(&vmbo->shadow_list)) {
-		mutex_lock(&adev->shadow_list_lock);
-		list_del_init(&vmbo->shadow_list);
-		mutex_unlock(&adev->shadow_list_lock);
-	}
-
-	amdgpu_bo_destroy(tbo);
-}
-
 /**
  * amdgpu_bo_is_amdgpu_bo - check if the buffer object is an &amdgpu_bo
  * @bo: buffer object to be checked
@@ -108,8 +90,7 @@ static void amdgpu_bo_vm_destroy(struct ttm_buffer_object *tbo)
 bool amdgpu_bo_is_amdgpu_bo(struct ttm_buffer_object *bo)
 {
 	if (bo->destroy == &amdgpu_bo_destroy ||
-	    bo->destroy == &amdgpu_bo_user_destroy ||
-	    bo->destroy == &amdgpu_bo_vm_destroy)
+	    bo->destroy == &amdgpu_bo_user_destroy)
 		return true;
 
 	return false;
@@ -722,52 +703,6 @@ int amdgpu_bo_create_vm(struct amdgpu_device *adev,
 	return r;
 }
 
-/**
- * amdgpu_bo_add_to_shadow_list - add a BO to the shadow list
- *
- * @vmbo: BO that will be inserted into the shadow list
- *
- * Insert a BO to the shadow list.
- */
-void amdgpu_bo_add_to_shadow_list(struct amdgpu_bo_vm *vmbo)
-{
-	struct amdgpu_device *adev = amdgpu_ttm_adev(vmbo->bo.tbo.bdev);
-
-	mutex_lock(&adev->shadow_list_lock);
-	list_add_tail(&vmbo->shadow_list, &adev->shadow_list);
-	vmbo->shadow->parent = amdgpu_bo_ref(&vmbo->bo);
-	vmbo->shadow->tbo.destroy = &amdgpu_bo_vm_destroy;
-	mutex_unlock(&adev->shadow_list_lock);
-}
-
-/**
- * amdgpu_bo_restore_shadow - restore an &amdgpu_bo shadow
- *
- * @shadow: &amdgpu_bo shadow to be restored
- * @fence: dma_fence associated with the operation
- *
- * Copies a buffer object's shadow content back to the object.
- * This is used for recovering a buffer from its shadow in case of a gpu
- * reset where vram context may be lost.
- *
- * Returns:
- * 0 for success or a negative error code on failure.
- */
-int amdgpu_bo_restore_shadow(struct amdgpu_bo *shadow, struct dma_fence **fence)
-
-{
-	struct amdgpu_device *adev = amdgpu_ttm_adev(shadow->tbo.bdev);
-	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
-	uint64_t shadow_addr, parent_addr;
-
-	shadow_addr = amdgpu_bo_gpu_offset(shadow);
-	parent_addr = amdgpu_bo_gpu_offset(shadow->parent);
-
-	return amdgpu_copy_buffer(ring, shadow_addr, parent_addr,
-				  amdgpu_bo_size(shadow), NULL, fence,
-				  true, false, 0);
-}
-
 /**
  * amdgpu_bo_kmap - map an &amdgpu_bo buffer object
  * @bo: &amdgpu_bo buffer object to be mapped
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index bc42ccbde659a..a4fa1f296daec 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -130,8 +130,6 @@ struct amdgpu_bo_user {
 
 struct amdgpu_bo_vm {
 	struct amdgpu_bo		bo;
-	struct amdgpu_bo		*shadow;
-	struct list_head		shadow_list;
 	struct amdgpu_vm_bo_base        entries[];
 };
 
@@ -269,22 +267,6 @@ static inline bool amdgpu_bo_encrypted(struct amdgpu_bo *bo)
 	return bo->flags & AMDGPU_GEM_CREATE_ENCRYPTED;
 }
 
-/**
- * amdgpu_bo_shadowed - check if the BO is shadowed
- *
- * @bo: BO to be tested.
- *
- * Returns:
- * NULL if not shadowed or else return a BO pointer.
- */
-static inline struct amdgpu_bo *amdgpu_bo_shadowed(struct amdgpu_bo *bo)
-{
-	if (bo->tbo.type == ttm_bo_type_kernel)
-		return to_amdgpu_bo_vm(bo)->shadow;
-
-	return NULL;
-}
-
 bool amdgpu_bo_is_amdgpu_bo(struct ttm_buffer_object *bo);
 void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain);
 
@@ -343,9 +325,6 @@ u64 amdgpu_bo_gpu_offset(struct amdgpu_bo *bo);
 u64 amdgpu_bo_gpu_offset_no_check(struct amdgpu_bo *bo);
 void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
 			  struct amdgpu_mem_stats *stats);
-void amdgpu_bo_add_to_shadow_list(struct amdgpu_bo_vm *vmbo);
-int amdgpu_bo_restore_shadow(struct amdgpu_bo *shadow,
-			     struct dma_fence **fence);
 uint32_t amdgpu_bo_get_preferred_domain(struct amdgpu_device *adev,
 					    uint32_t domain);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 0f7106066480e..4820277e3c550 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -465,7 +465,6 @@ int amdgpu_vm_validate(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 {
 	uint64_t new_vm_generation = amdgpu_vm_generation(adev, vm);
 	struct amdgpu_vm_bo_base *bo_base;
-	struct amdgpu_bo *shadow;
 	struct amdgpu_bo *bo;
 	int r;
 
@@ -486,16 +485,10 @@ int amdgpu_vm_validate(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		spin_unlock(&vm->status_lock);
 
 		bo = bo_base->bo;
-		shadow = amdgpu_bo_shadowed(bo);
 
 		r = validate(param, bo);
 		if (r)
 			return r;
-		if (shadow) {
-			r = validate(param, shadow);
-			if (r)
-				return r;
-		}
 
 		if (bo->tbo.type != ttm_bo_type_kernel) {
 			amdgpu_vm_bo_moved(bo_base);
@@ -2125,10 +2118,6 @@ void amdgpu_vm_bo_invalidate(struct amdgpu_device *adev,
 {
 	struct amdgpu_vm_bo_base *bo_base;
 
-	/* shadow bo doesn't have bo base, its validation needs its parent */
-	if (bo->parent && (amdgpu_bo_shadowed(bo->parent) == bo))
-		bo = bo->parent;
-
 	for (bo_base = bo->vm_bo; bo_base; bo_base = bo_base->next) {
 		struct amdgpu_vm *vm = bo_base->vm;
 
@@ -2456,7 +2445,6 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	root_bo = amdgpu_bo_ref(&root->bo);
 	r = amdgpu_bo_reserve(root_bo, true);
 	if (r) {
-		amdgpu_bo_unref(&root->shadow);
 		amdgpu_bo_unref(&root_bo);
 		goto error_free_delayed;
 	}
@@ -2548,11 +2536,6 @@ int amdgpu_vm_make_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 	vm->last_update = dma_fence_get_stub();
 	vm->is_compute_context = true;
 
-	/* Free the shadow bo for compute VM */
-	amdgpu_bo_unref(&to_amdgpu_bo_vm(vm->root.bo)->shadow);
-
-	goto unreserve_bo;
-
 unreserve_bo:
 	amdgpu_bo_unreserve(vm->root.bo);
 	return r;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
index f07647a9a9d97..ad3a9e594a406 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
@@ -383,14 +383,6 @@ int amdgpu_vm_pt_clear(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	if (r)
 		return r;
 
-	if (vmbo->shadow) {
-		struct amdgpu_bo *shadow = vmbo->shadow;
-
-		r = ttm_bo_validate(&shadow->tbo, &shadow->placement, &ctx);
-		if (r)
-			return r;
-	}
-
 	if (!drm_dev_enter(adev_to_drm(adev), &idx))
 		return -ENODEV;
 
@@ -448,10 +440,7 @@ int amdgpu_vm_pt_create(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 			int32_t xcp_id)
 {
 	struct amdgpu_bo_param bp;
-	struct amdgpu_bo *bo;
-	struct dma_resv *resv;
 	unsigned int num_entries;
-	int r;
 
 	memset(&bp, 0, sizeof(bp));
 
@@ -484,42 +473,7 @@ int amdgpu_vm_pt_create(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	if (vm->root.bo)
 		bp.resv = vm->root.bo->tbo.base.resv;
 
-	r = amdgpu_bo_create_vm(adev, &bp, vmbo);
-	if (r)
-		return r;
-
-	bo = &(*vmbo)->bo;
-	if (vm->is_compute_context || (adev->flags & AMD_IS_APU)) {
-		(*vmbo)->shadow = NULL;
-		return 0;
-	}
-
-	if (!bp.resv)
-		WARN_ON(dma_resv_lock(bo->tbo.base.resv,
-				      NULL));
-	resv = bp.resv;
-	memset(&bp, 0, sizeof(bp));
-	bp.size = amdgpu_vm_pt_size(adev, level);
-	bp.domain = AMDGPU_GEM_DOMAIN_GTT;
-	bp.flags = AMDGPU_GEM_CREATE_CPU_GTT_USWC;
-	bp.type = ttm_bo_type_kernel;
-	bp.resv = bo->tbo.base.resv;
-	bp.bo_ptr_size = sizeof(struct amdgpu_bo);
-	bp.xcp_id_plus1 = xcp_id + 1;
-
-	r = amdgpu_bo_create(adev, &bp, &(*vmbo)->shadow);
-
-	if (!resv)
-		dma_resv_unlock(bo->tbo.base.resv);
-
-	if (r) {
-		amdgpu_bo_unref(&bo);
-		return r;
-	}
-
-	amdgpu_bo_add_to_shadow_list(*vmbo);
-
-	return 0;
+	return amdgpu_bo_create_vm(adev, &bp, vmbo);
 }
 
 /**
@@ -569,7 +523,6 @@ static int amdgpu_vm_pt_alloc(struct amdgpu_device *adev,
 	return 0;
 
 error_free_pt:
-	amdgpu_bo_unref(&pt->shadow);
 	amdgpu_bo_unref(&pt_bo);
 	return r;
 }
@@ -581,17 +534,10 @@ static int amdgpu_vm_pt_alloc(struct amdgpu_device *adev,
  */
 static void amdgpu_vm_pt_free(struct amdgpu_vm_bo_base *entry)
 {
-	struct amdgpu_bo *shadow;
-
 	if (!entry->bo)
 		return;
 
 	entry->bo->vm_bo = NULL;
-	shadow = amdgpu_bo_shadowed(entry->bo);
-	if (shadow) {
-		ttm_bo_set_bulk_move(&shadow->tbo, NULL);
-		amdgpu_bo_unref(&shadow);
-	}
 	ttm_bo_set_bulk_move(&entry->bo->tbo, NULL);
 
 	spin_lock(&entry->vm->status_lock);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index 9b748d7058b5c..390432a22ddd5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -35,16 +35,7 @@
  */
 static int amdgpu_vm_sdma_map_table(struct amdgpu_bo_vm *table)
 {
-	int r;
-
-	r = amdgpu_ttm_alloc_gart(&table->bo.tbo);
-	if (r)
-		return r;
-
-	if (table->shadow)
-		r = amdgpu_ttm_alloc_gart(&table->shadow->tbo);
-
-	return r;
+	return amdgpu_ttm_alloc_gart(&table->bo.tbo);
 }
 
 /* Allocate a new job for @count PTE updates */
@@ -273,17 +264,13 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
 
 		if (!p->pages_addr) {
 			/* set page commands needed */
-			if (vmbo->shadow)
-				amdgpu_vm_sdma_set_ptes(p, vmbo->shadow, pe, addr,
-							count, incr, flags);
 			amdgpu_vm_sdma_set_ptes(p, bo, pe, addr, count,
 						incr, flags);
 			return 0;
 		}
 
 		/* copy commands needed */
-		ndw -= p->adev->vm_manager.vm_pte_funcs->copy_pte_num_dw *
-			(vmbo->shadow ? 2 : 1);
+		ndw -= p->adev->vm_manager.vm_pte_funcs->copy_pte_num_dw;
 
 		/* for padding */
 		ndw -= 7;
@@ -298,8 +285,6 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
 			pte[i] |= flags;
 		}
 
-		if (vmbo->shadow)
-			amdgpu_vm_sdma_copy_ptes(p, vmbo->shadow, pe, nptes);
 		amdgpu_vm_sdma_copy_ptes(p, bo, pe, nptes);
 
 		pe += nptes * 8;
-- 
2.43.0


