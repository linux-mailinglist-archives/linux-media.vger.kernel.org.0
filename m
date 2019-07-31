Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92A2D7C02E
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2019 13:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfGaLi7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Jul 2019 07:38:59 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46526 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726301AbfGaLi7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Jul 2019 07:38:59 -0400
Received: by mail-wr1-f68.google.com with SMTP id z1so69274315wru.13
        for <linux-media@vger.kernel.org>; Wed, 31 Jul 2019 04:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vHdzYpB0uv0xuE5Pz8nXUVwJiZDrFatDJaQ/ICnTeQk=;
        b=dOHR3eq/h37lIYKLQq74Wsi2jzTPHAei8TjSPCKk15SlkxIkY94RCLILiDCyEe2Tlz
         5QOqep2eH1okU9pyeV0YW/wMHalTUu2Sp2bMplXKBMDynYTLPNSAKStF4qqR8qqqEGLJ
         GPDczXxYJNkl4am1LjyH6ordA08OaRoaDx6lRy17k06aUx1CzB/p1tNcQsGNvO4Dvpht
         AaBAVe+GvUNjZGYLXoRXhn0WVv3KH1tfpwr83QJz3CYTAAPsLtP1EBS0Jm0oFB2WHlJd
         YA9lxqWM5DXN8Xlpmvo6vkPHXntQ9FwKEWrio3It7OoFT4dE6af3H41an4u3x3gOhnK5
         CHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vHdzYpB0uv0xuE5Pz8nXUVwJiZDrFatDJaQ/ICnTeQk=;
        b=aw4jyrlvydwxgAlMKJJJIVL38/2uzdUTEliQzxCbNJw65fSke4EP3u7/TdpHsO3vYK
         JZH2uWXi4xKzbCvSIx/e5MyHB24m67qUlOrX0wLsF9MEw82N4WNkuXMClFRK0ACfwq8h
         Vs6JNtuE6a2Q01sK+xzcy+baOLcxF0TSZjFNHeP7LbaJ7Xa8T0SwSaVsor31iLnJzl+O
         +p1kbMBq/OJLHIJvhBnJyterIoULZf2K8wJ1Hm24ZoKNxfXznccvYr+/jy++et2jLL98
         ufCPa9cN2kGKMtdKaD6effb9PfUQSrrJ+RJReACjV1G2nlAVZGvyvuZMrBrgtXXlhdlf
         wo/Q==
X-Gm-Message-State: APjAAAWB7H2vSCD5YCNrhqOsOARhCTU2BasvHzntiuw1hISsacZwxCjV
        eZOaRM0yX36pYo9Jd1R9iu8=
X-Google-Smtp-Source: APXvYqz5f5HBPVD9+q45yele9w8fRLMgjQ11isBCooRTOf8R98Jcr7JlMCci2tBOsrrr6rrG5rVvRQ==
X-Received: by 2002:a5d:4fc8:: with SMTP id h8mr18846475wrw.177.1564573135263;
        Wed, 31 Jul 2019 04:38:55 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:a8c5:b5fa:d4be:a3b2])
        by smtp.gmail.com with ESMTPSA id e3sm57237050wrt.93.2019.07.31.04.38.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 04:38:54 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        chris@chris-wilson.co.uk
Subject: [PATCH] dma-buf: add more reservation object locking wrappers
Date:   Wed, 31 Jul 2019 13:38:53 +0200
Message-Id: <20190731113853.51779-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Complete the abstraction of the ww_mutex inside the reservation object.

This allows us to add more handling and debugging to the reservation
object in the future.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  6 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  6 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  3 +-
 drivers/gpu/drm/drm_gem.c                   | 14 ++---
 drivers/gpu/drm/nouveau/nouveau_prime.c     |  4 +-
 drivers/gpu/drm/radeon/radeon_object.c      |  6 +--
 drivers/gpu/drm/radeon/radeon_prime.c       |  4 +-
 drivers/gpu/drm/ttm/ttm_bo.c                | 10 ++--
 drivers/gpu/drm/ttm/ttm_execbuf_util.c      |  6 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c        |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c          |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c     |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c    |  6 +--
 include/drm/ttm/ttm_bo_driver.h             |  6 +--
 include/linux/reservation.h                 | 57 +++++++++++++++++++++
 16 files changed, 100 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 4b1e4b321999..f486c23fa24c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1725,7 +1725,7 @@ int amdgpu_cs_find_mapping(struct amdgpu_cs_parser *parser,
 	*map = mapping;
 
 	/* Double check that the BO is reserved by this CS */
-	if (READ_ONCE((*bo)->tbo.resv->lock.ctx) != &parser->ticket)
+	if (reservation_object_locking_ctx((*bo)->tbo.resv) != &parser->ticket)
 		return -EINVAL;
 
 	if (!((*bo)->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS)) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 6770eb3967a6..e1d2c410bc33 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -398,7 +398,7 @@ amdgpu_gem_prime_import_sg_table(struct drm_device *dev,
 	bp.flags = 0;
 	bp.type = ttm_bo_type_sg;
 	bp.resv = resv;
-	ww_mutex_lock(&resv->lock, NULL);
+	reservation_object_lock(resv, NULL);
 	ret = amdgpu_bo_create(adev, &bp, &bo);
 	if (ret)
 		goto error;
@@ -410,11 +410,11 @@ amdgpu_gem_prime_import_sg_table(struct drm_device *dev,
 	if (attach->dmabuf->ops != &amdgpu_dmabuf_ops)
 		bo->prime_shared_count = 1;
 
-	ww_mutex_unlock(&resv->lock);
+	reservation_object_unlock(resv);
 	return &bo->gem_base;
 
 error:
-	ww_mutex_unlock(&resv->lock);
+	reservation_object_unlock(resv);
 	return ERR_PTR(ret);
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 87020628a66e..c31e96925892 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -553,7 +553,7 @@ static int amdgpu_bo_do_create(struct amdgpu_device *adev,
 
 fail_unreserve:
 	if (!bp->resv)
-		ww_mutex_unlock(&bo->tbo.resv->lock);
+		reservation_object_unlock(bo->tbo.resv);
 	amdgpu_bo_unref(&bo);
 	return r;
 }
@@ -1096,7 +1096,7 @@ int amdgpu_bo_set_tiling_flags(struct amdgpu_bo *bo, u64 tiling_flags)
  */
 void amdgpu_bo_get_tiling_flags(struct amdgpu_bo *bo, u64 *tiling_flags)
 {
-	lockdep_assert_held(&bo->tbo.resv->lock.base);
+	reservation_object_assert_held(bo->tbo.resv);
 
 	if (tiling_flags)
 		*tiling_flags = bo->tiling_flags;
@@ -1337,7 +1337,7 @@ int amdgpu_bo_sync_wait(struct amdgpu_bo *bo, void *owner, bool intr)
 u64 amdgpu_bo_gpu_offset(struct amdgpu_bo *bo)
 {
 	WARN_ON_ONCE(bo->tbo.mem.mem_type == TTM_PL_SYSTEM);
-	WARN_ON_ONCE(!ww_mutex_is_locked(&bo->tbo.resv->lock) &&
+	WARN_ON_ONCE(!reservation_object_is_locked(bo->tbo.resv) &&
 		     !bo->pin_count && bo->tbo.type != ttm_bo_type_kernel);
 	WARN_ON_ONCE(bo->tbo.mem.start == AMDGPU_BO_INVALID_OFFSET);
 	WARN_ON_ONCE(bo->tbo.mem.mem_type == TTM_PL_VRAM &&
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index c1baf3d879b7..e9df0b10a37e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2416,7 +2416,8 @@ void amdgpu_vm_bo_trace_cs(struct amdgpu_vm *vm, struct ww_acquire_ctx *ticket)
 			struct amdgpu_bo *bo;
 
 			bo = mapping->bo_va->base.bo;
-			if (READ_ONCE(bo->tbo.resv->lock.ctx) != ticket)
+			if (reservation_object_locking_ctx(bo->tbo.resv) !=
+			    ticket)
 				continue;
 		}
 
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 50de138c89e0..04c0307ca54f 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1316,8 +1316,8 @@ drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
 	if (contended != -1) {
 		struct drm_gem_object *obj = objs[contended];
 
-		ret = ww_mutex_lock_slow_interruptible(&obj->resv->lock,
-						       acquire_ctx);
+		ret = reservation_object_lock_slow_interruptible(obj->resv,
+								 acquire_ctx);
 		if (ret) {
 			ww_acquire_done(acquire_ctx);
 			return ret;
@@ -1328,16 +1328,16 @@ drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
 		if (i == contended)
 			continue;
 
-		ret = ww_mutex_lock_interruptible(&objs[i]->resv->lock,
-						  acquire_ctx);
+		ret = reservation_object_lock_interruptible(objs[i]->resv,
+							    acquire_ctx);
 		if (ret) {
 			int j;
 
 			for (j = 0; j < i; j++)
-				ww_mutex_unlock(&objs[j]->resv->lock);
+				reservation_object_unlock(objs[j]->resv);
 
 			if (contended != -1 && contended >= i)
-				ww_mutex_unlock(&objs[contended]->resv->lock);
+				reservation_object_unlock(objs[contended]->resv);
 
 			if (ret == -EDEADLK) {
 				contended = i;
@@ -1362,7 +1362,7 @@ drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
 	int i;
 
 	for (i = 0; i < count; i++)
-		ww_mutex_unlock(&objs[i]->resv->lock);
+		reservation_object_unlock(objs[i]->resv);
 
 	ww_acquire_fini(acquire_ctx);
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index 1fefc93af1d7..38abdfa96af7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -68,10 +68,10 @@ struct drm_gem_object *nouveau_gem_prime_import_sg_table(struct drm_device *dev,
 
 	flags = TTM_PL_FLAG_TT;
 
-	ww_mutex_lock(&robj->lock, NULL);
+	reservation_object_lock(robj, NULL);
 	ret = nouveau_bo_new(&drm->client, attach->dmabuf->size, 0, flags, 0, 0,
 			     sg, robj, &nvbo);
-	ww_mutex_unlock(&robj->lock);
+	reservation_object_unlock(robj);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index 36683de0300b..3210b1e090f8 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -607,7 +607,7 @@ int radeon_bo_get_surface_reg(struct radeon_bo *bo)
 	int steal;
 	int i;
 
-	lockdep_assert_held(&bo->tbo.resv->lock.base);
+	reservation_object_assert_held(bo->tbo.resv);
 
 	if (!bo->tiling_flags)
 		return 0;
@@ -733,7 +733,7 @@ void radeon_bo_get_tiling_flags(struct radeon_bo *bo,
 				uint32_t *tiling_flags,
 				uint32_t *pitch)
 {
-	lockdep_assert_held(&bo->tbo.resv->lock.base);
+	reservation_object_assert_held(bo->tbo.resv);
 
 	if (tiling_flags)
 		*tiling_flags = bo->tiling_flags;
@@ -745,7 +745,7 @@ int radeon_bo_check_tiling(struct radeon_bo *bo, bool has_moved,
 				bool force_drop)
 {
 	if (!force_drop)
-		lockdep_assert_held(&bo->tbo.resv->lock.base);
+		reservation_object_assert_held(bo->tbo.resv);
 
 	if (!(bo->tiling_flags & RADEON_TILING_SURFACE))
 		return 0;
diff --git a/drivers/gpu/drm/radeon/radeon_prime.c b/drivers/gpu/drm/radeon/radeon_prime.c
index 7110d403322c..f48bc87d0e4b 100644
--- a/drivers/gpu/drm/radeon/radeon_prime.c
+++ b/drivers/gpu/drm/radeon/radeon_prime.c
@@ -66,10 +66,10 @@ struct drm_gem_object *radeon_gem_prime_import_sg_table(struct drm_device *dev,
 	struct radeon_bo *bo;
 	int ret;
 
-	ww_mutex_lock(&resv->lock, NULL);
+	reservation_object_lock(resv, NULL);
 	ret = radeon_bo_create(rdev, attach->dmabuf->size, PAGE_SIZE, false,
 			       RADEON_GEM_DOMAIN_GTT, 0, sg, resv, &bo);
-	ww_mutex_unlock(&resv->lock);
+	reservation_object_unlock(resv);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 58c403eda04e..40d3e547c78e 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -850,8 +850,8 @@ static int ttm_mem_evict_first(struct ttm_bo_device *bdev,
 
 			if (!ttm_bo_evict_swapout_allowable(bo, ctx, &locked,
 							    &busy)) {
-				if (busy && !busy_bo &&
-				    bo->resv->lock.ctx != ticket)
+				if (busy && !busy_bo && ticket !=
+				    reservation_object_locking_ctx(bo->resv))
 					busy_bo = bo;
 				continue;
 			}
@@ -957,8 +957,10 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
 {
 	struct ttm_bo_device *bdev = bo->bdev;
 	struct ttm_mem_type_manager *man = &bdev->man[mem->mem_type];
+	struct ww_acquire_ctx *ticket;
 	int ret;
 
+	ticket = reservation_object_locking_ctx(bo->resv);
 	do {
 		ret = (*man->func->get_node)(man, bo, place, mem);
 		if (unlikely(ret != 0))
@@ -966,7 +968,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
 		if (mem->mm_node)
 			break;
 		ret = ttm_mem_evict_first(bdev, mem->mem_type, place, ctx,
-					  bo->resv->lock.ctx);
+					  ticket);
 		if (unlikely(ret != 0))
 			return ret;
 	} while (1);
@@ -1963,7 +1965,7 @@ int ttm_bo_wait_unreserved(struct ttm_buffer_object *bo)
 	ret = mutex_lock_interruptible(&bo->wu_mutex);
 	if (unlikely(ret != 0))
 		return -ERESTARTSYS;
-	if (!ww_mutex_is_locked(&bo->resv->lock))
+	if (!reservation_object_is_locked(bo->resv))
 		goto out_unlock;
 	ret = reservation_object_lock_interruptible(bo->resv, NULL);
 	if (ret == -EINTR)
diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
index 957ec375a4ba..723fb583fdda 100644
--- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
+++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
@@ -144,10 +144,10 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
 
 		if (ret == -EDEADLK) {
 			if (intr) {
-				ret = ww_mutex_lock_slow_interruptible(&bo->resv->lock,
-								       ticket);
+				ret = reservation_object_lock_slow_interruptible(bo->resv,
+										 ticket);
 			} else {
-				ww_mutex_lock_slow(&bo->resv->lock, ticket);
+				reservation_object_lock_slow(bo->resv, ticket);
 				ret = 0;
 			}
 		}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
index fc6673cde289..703786e3d579 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
@@ -459,9 +459,9 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
 
 	/* Buffer objects need to be either pinned or reserved: */
 	if (!(dst->mem.placement & TTM_PL_FLAG_NO_EVICT))
-		lockdep_assert_held(&dst->resv->lock.base);
+		reservation_object_assert_held(dst->resv);
 	if (!(src->mem.placement & TTM_PL_FLAG_NO_EVICT))
-		lockdep_assert_held(&src->resv->lock.base);
+		reservation_object_assert_held(src->resv);
 
 	if (dst->ttm->state == tt_unpopulated) {
 		ret = dst->ttm->bdev->driver->ttm_tt_populate(dst->ttm, &ctx);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 5d5c2bce01f3..315da41a18b4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -342,7 +342,7 @@ void vmw_bo_pin_reserved(struct vmw_buffer_object *vbo, bool pin)
 	uint32_t old_mem_type = bo->mem.mem_type;
 	int ret;
 
-	lockdep_assert_held(&bo->resv->lock.base);
+	reservation_object_assert_held(bo->resv);
 
 	if (pin) {
 		if (vbo->pin_count++ > 0)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
index b4f6e1217c9d..71e901bbed68 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
@@ -169,7 +169,7 @@ static int vmw_cotable_unscrub(struct vmw_resource *res)
 	} *cmd;
 
 	WARN_ON_ONCE(bo->mem.mem_type != VMW_PL_MOB);
-	lockdep_assert_held(&bo->resv->lock.base);
+	reservation_object_assert_held(bo->resv);
 
 	cmd = VMW_FIFO_RESERVE(dev_priv, sizeof(*cmd));
 	if (!cmd)
@@ -311,7 +311,7 @@ static int vmw_cotable_unbind(struct vmw_resource *res,
 		return 0;
 
 	WARN_ON_ONCE(bo->mem.mem_type != VMW_PL_MOB);
-	lockdep_assert_held(&bo->resv->lock.base);
+	reservation_object_assert_held(bo->resv);
 
 	mutex_lock(&dev_priv->binding_mutex);
 	if (!vcotbl->scrubbed)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 1d38a8b2f2ec..303d2c7d9ab3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -402,14 +402,14 @@ void vmw_resource_unreserve(struct vmw_resource *res,
 
 	if (switch_backup && new_backup != res->backup) {
 		if (res->backup) {
-			lockdep_assert_held(&res->backup->base.resv->lock.base);
+			reservation_object_assert_held(res->backup->base.resv);
 			list_del_init(&res->mob_head);
 			vmw_bo_unreference(&res->backup);
 		}
 
 		if (new_backup) {
 			res->backup = vmw_bo_reference(new_backup);
-			lockdep_assert_held(&new_backup->base.resv->lock.base);
+			reservation_object_assert_held(new_backup->base.resv);
 			list_add_tail(&res->mob_head, &new_backup->res_list);
 		} else {
 			res->backup = NULL;
@@ -691,7 +691,7 @@ void vmw_resource_unbind_list(struct vmw_buffer_object *vbo)
 		.num_shared = 0
 	};
 
-	lockdep_assert_held(&vbo->base.resv->lock.base);
+	reservation_object_assert_held(vbo->base.resv);
 	list_for_each_entry_safe(res, next, &vbo->res_list, mob_head) {
 		if (!res->func->unbind)
 			continue;
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index c9b8ba492f24..0e6a111bed0b 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -745,10 +745,10 @@ static inline int ttm_bo_reserve_slowpath(struct ttm_buffer_object *bo,
 	WARN_ON(!kref_read(&bo->kref));
 
 	if (interruptible)
-		ret = ww_mutex_lock_slow_interruptible(&bo->resv->lock,
-						       ticket);
+		ret = reservation_object_lock_slow_interruptible(bo->resv,
+								 ticket);
 	else
-		ww_mutex_lock_slow(&bo->resv->lock, ticket);
+		reservation_object_lock_slow(bo->resv, ticket);
 
 	if (likely(ret == 0))
 		ttm_bo_del_sub_from_lru(bo);
diff --git a/include/linux/reservation.h b/include/linux/reservation.h
index f47e8196d039..d19de7a6af71 100644
--- a/include/linux/reservation.h
+++ b/include/linux/reservation.h
@@ -140,6 +140,38 @@ reservation_object_lock_interruptible(struct reservation_object *obj,
 	return ww_mutex_lock_interruptible(&obj->lock, ctx);
 }
 
+/**
+ * reservation_object_lock_slow - slowpath lock the reservation object
+ * @obj: the reservation object
+ * @ctx: the locking context
+ *
+ * Acquires the reservation object after a die case. This function
+ * will sleep until the lock becomes available. See reservation_object_lock() as
+ * well.
+ */
+static inline void
+reservation_object_lock_slow(struct reservation_object *obj,
+			     struct ww_acquire_ctx *ctx)
+{
+	ww_mutex_lock_slow(&obj->lock, ctx);
+}
+
+/**
+ * reservation_object_lock_slow_interruptible - slowpath lock the reservation
+ * object, interruptible
+ * @obj: the reservation object
+ * @ctx: the locking context
+ *
+ * Acquires the reservation object interruptible after a die case. This function
+ * will sleep until the lock becomes available. See
+ * reservation_object_lock_interruptible() as well.
+ */
+static inline int
+reservation_object_lock_slow_interruptible(struct reservation_object *obj,
+					   struct ww_acquire_ctx *ctx)
+{
+	return ww_mutex_lock_slow_interruptible(&obj->lock, ctx);
+}
 
 /**
  * reservation_object_trylock - trylock the reservation object
@@ -161,6 +193,31 @@ reservation_object_trylock(struct reservation_object *obj)
 	return ww_mutex_trylock(&obj->lock);
 }
 
+/**
+ * reservation_object_is_locked - is the reservation object locked
+ * @obj: the reservation object
+ *
+ * Returns true if the mutex is locked, false if unlocked.
+ */
+static inline bool
+reservation_object_is_locked(struct reservation_object *obj)
+{
+	return ww_mutex_is_locked(&obj->lock);
+}
+
+/**
+ * reservation_object_locking_ctx - returns the context used to lock the object
+ * @obj: the reservation object
+ *
+ * Returns the context used to lock a reservation object or NULL if no context
+ * was used or the object is not locked at all.
+ */
+static inline struct ww_acquire_ctx *
+reservation_object_locking_ctx(struct reservation_object *obj)
+{
+	return READ_ONCE(obj->lock.ctx);
+}
+
 /**
  * reservation_object_unlock - unlock the reservation object
  * @obj: the reservation object
-- 
2.17.1

