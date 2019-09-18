Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27BB7B6A11
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 19:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727436AbfIRRzb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Sep 2019 13:55:31 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49]:34853 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727056AbfIRRzb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Sep 2019 13:55:31 -0400
Received: by mail-wm1-f49.google.com with SMTP id y21so1060097wmi.0
        for <linux-media@vger.kernel.org>; Wed, 18 Sep 2019 10:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ho1LQMIIQ97XIEoVYAf5CIZaPAfuRW7Cy16MxRs6ujQ=;
        b=Ksm+3Di0ABS6Qg9FjzyrKFN8JI6d2swkzFHRdfYn4PN8JAf8uMgJ+P4LVQJlwDobb/
         Iun2TMSjMsxOC+Cb/aaWN5lrksjUX5YhO7Ce0iwDIg9IWTb27601EPhlh6KCCgvfFuUK
         evaJOZpMeP5X6RI8T2B08t9sUw7nWcDoDj1OuczTKYdH3YzD2l0UmPQmeeIjtj7kmvsD
         WFkmysSFYzNIDa1iLYsjjG9UNlFoqEJgAepLFH4MS6h/31HwUOOYb1jLMn6GcRK2Kgyf
         olUsQvDE/fsB49+Io4sRHqv8SyZfHZs6yujaNP9ATuK4FRkGypVQ9NU8Jozt+ATxrxJq
         Xfqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ho1LQMIIQ97XIEoVYAf5CIZaPAfuRW7Cy16MxRs6ujQ=;
        b=ExPxesSMyH0LTX/R5qLzSsIGIRto1HzSgNkoEpwqyiN3EXqQrHUYKdCkm/kZBEDq/9
         kQBDFEj563kGyTKRxGHs4/FFkqHJZFIZb+XQ29z3Gku1Mt6ipmmczlP5p0LKxT+SGUYo
         /xzJ7ExfIU99BObpqOOqSh1vVI5tY5/MLhrADv/2ZcuW4mccmJ2xZQlZC9lhNPXqt7ZD
         W74I2weXjC3Qn4I2dBqagFTTOQE0SuYzQYYzDaMi71890QU2t4Nt7eVy9oeGK+0/hkSW
         eh3rsEkbwR+HTlNBaDsqQXm2AHdr0stRKUZN2xG8wx31smiDxBEH7yros/iDSo30HsPu
         D9YA==
X-Gm-Message-State: APjAAAWGMU5RpM+wnuRFtEFvWFTjmMxIFw4GvLi8+a0wHulkwovRhKXu
        zTBfCfyMr901IRC/MQd+kKU90+YZ
X-Google-Smtp-Source: APXvYqzQg3ToFRk1PeghwFyRpg+5dQFEdUeTj50aVbA24YhfSNWvUZtM98Oh3Q/XHRBCswFoyI19Dg==
X-Received: by 2002:a1c:1bcf:: with SMTP id b198mr4139859wmb.0.1568829327086;
        Wed, 18 Sep 2019 10:55:27 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:f002:ffad:c852:eff6])
        by smtp.gmail.com with ESMTPSA id q3sm4074027wru.33.2019.09.18.10.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2019 10:55:26 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        chris@chris-wilson.co.uk, daniel@ffwll.ch, sumit.semwal@linaro.org
Subject: [PATCH 2/3] drm/ttm: switch ttm_execbuf_util to new drm_resv_ctx
Date:   Wed, 18 Sep 2019 19:55:24 +0200
Message-Id: <20190918175525.49441-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918175525.49441-1-christian.koenig@amd.com>
References: <20190918175525.49441-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change ttm_execbuf_util to use the new reservation context
object for deadlock handling.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |   4 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   2 +-
 drivers/gpu/drm/qxl/qxl_drv.h                 |   2 +-
 drivers/gpu/drm/qxl/qxl_release.c             |   2 +-
 drivers/gpu/drm/radeon/radeon.h               |   2 +-
 drivers/gpu/drm/radeon/radeon_gem.c           |   2 +-
 drivers/gpu/drm/radeon/radeon_object.c        |   2 +-
 drivers/gpu/drm/radeon/radeon_object.h        |   2 +-
 drivers/gpu/drm/ttm/ttm_execbuf_util.c        | 117 ++++++++----------
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      |   8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.h    |   2 +-
 include/drm/ttm/ttm_execbuf_util.h            |  13 +-
 16 files changed, 78 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 8199d201b43a..0644829d990e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -465,7 +465,7 @@ struct amdgpu_cs_parser {
 	struct drm_sched_entity	*entity;
 
 	/* buffer objects */
-	struct ww_acquire_ctx		ticket;
+	struct dma_resv_ctx		ticket;
 	struct amdgpu_bo_list		*bo_list;
 	struct amdgpu_mn		*mn;
 	struct amdgpu_bo_list_entry	vm_pd;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 76e3516484e7..b9bb35d1699e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -540,7 +540,7 @@ struct bo_vm_reservation_context {
 	struct amdgpu_bo_list_entry kfd_bo; /* BO list entry for the KFD BO */
 	unsigned int n_vms;		    /* Number of VMs reserved	    */
 	struct amdgpu_bo_list_entry *vm_pd; /* Array of VM BO list entries  */
-	struct ww_acquire_ctx ticket;	    /* Reservation ticket	    */
+	struct dma_resv_ctx ticket;  /* Reservation ticket	    */
 	struct list_head list, duplicates;  /* BO lists			    */
 	struct amdgpu_sync *sync;	    /* Pointer to sync object	    */
 	bool reserved;			    /* Whether BOs are reserved	    */
@@ -1760,7 +1760,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 {
 	struct amdgpu_bo_list_entry *pd_bo_list_entries;
 	struct list_head resv_list, duplicates;
-	struct ww_acquire_ctx ticket;
+	struct dma_resv_ctx ticket;
 	struct amdgpu_sync sync;
 
 	struct amdgpu_vm *peer_vm;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 22236d367e26..95ec965fcc2d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1325,7 +1325,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	amdgpu_job_free_resources(job);
 
 	trace_amdgpu_cs_ioctl(job);
-	amdgpu_vm_bo_trace_cs(&fpriv->vm, &p->ticket);
+	amdgpu_vm_bo_trace_cs(&fpriv->vm, &p->ticket.base);
 	priority = job->base.s_priority;
 	drm_sched_entity_push_job(&job->base, entity);
 
@@ -1729,7 +1729,7 @@ int amdgpu_cs_find_mapping(struct amdgpu_cs_parser *parser,
 	*map = mapping;
 
 	/* Double check that the BO is reserved by this CS */
-	if (dma_resv_locking_ctx((*bo)->tbo.base.resv) != &parser->ticket)
+	if (dma_resv_locking_ctx((*bo)->tbo.base.resv) != &parser->ticket.base)
 		return -EINVAL;
 
 	if (!((*bo)->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS)) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
index 35a8d3c96fc9..605f83046039 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
@@ -66,7 +66,7 @@ int amdgpu_map_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 			  struct amdgpu_bo *bo, struct amdgpu_bo_va **bo_va,
 			  uint64_t csa_addr, uint32_t size)
 {
-	struct ww_acquire_ctx ticket;
+	struct dma_resv_ctx ticket;
 	struct list_head list;
 	struct amdgpu_bo_list_entry pd;
 	struct ttm_validate_buffer csa_tv;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 40f673cfbbfe..b25a59c4bec6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -162,7 +162,7 @@ void amdgpu_gem_object_close(struct drm_gem_object *obj,
 	struct amdgpu_bo_list_entry vm_pd;
 	struct list_head list, duplicates;
 	struct ttm_validate_buffer tv;
-	struct ww_acquire_ctx ticket;
+	struct dma_resv_ctx ticket;
 	struct amdgpu_bo_va *bo_va;
 	int r;
 
@@ -549,7 +549,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 	struct amdgpu_bo_va *bo_va;
 	struct amdgpu_bo_list_entry vm_pd;
 	struct ttm_validate_buffer tv;
-	struct ww_acquire_ctx ticket;
+	struct dma_resv_ctx ticket;
 	struct list_head list, duplicates;
 	uint64_t va_flags;
 	int r = 0;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 760af668f678..5df2ee1e10d8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4416,7 +4416,7 @@ static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
 	struct dm_plane_state *dm_plane_state_new, *dm_plane_state_old;
 	struct list_head list;
 	struct ttm_validate_buffer tv;
-	struct ww_acquire_ctx ticket;
+	struct dma_resv_ctx ticket;
 	uint64_t tiling_flags;
 	uint32_t domain;
 	int r;
diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index d4051409ce64..378b2c81920a 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -154,7 +154,7 @@ struct qxl_release {
 	struct qxl_bo *release_bo;
 	uint32_t release_offset;
 	uint32_t surface_release_id;
-	struct ww_acquire_ctx ticket;
+	struct dma_resv_ctx ticket;
 	struct list_head bos;
 };
 
diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 312216caeea2..aa7a28795645 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -463,6 +463,6 @@ void qxl_release_fence_buffer_objects(struct qxl_release *release)
 		dma_resv_unlock(bo->base.resv);
 	}
 	spin_unlock(&glob->lru_lock);
-	ww_acquire_fini(&release->ticket);
+	dma_resv_ctx_fini(&release->ticket);
 }
 
diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index de1d090df034..5aadb55731c3 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -1083,7 +1083,7 @@ struct radeon_cs_parser {
 	u32			cs_flags;
 	u32			ring;
 	s32			priority;
-	struct ww_acquire_ctx	ticket;
+	struct dma_resv_ctx	ticket;
 };
 
 static inline u32 radeon_get_ib_value(struct radeon_cs_parser *p, int idx)
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 4cf58dbbe439..c48c2fb35456 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -549,7 +549,7 @@ static void radeon_gem_va_update_vm(struct radeon_device *rdev,
 {
 	struct ttm_validate_buffer tv, *entry;
 	struct radeon_bo_list *vm_bos;
-	struct ww_acquire_ctx ticket;
+	struct dma_resv_ctx ticket;
 	struct list_head list;
 	unsigned domain;
 	int r;
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index 2abe1eab471f..653fd7937b39 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -531,7 +531,7 @@ static u64 radeon_bo_get_threshold_for_moves(struct radeon_device *rdev)
 }
 
 int radeon_bo_list_validate(struct radeon_device *rdev,
-			    struct ww_acquire_ctx *ticket,
+			    struct dma_resv_ctx *ticket,
 			    struct list_head *head, int ring)
 {
 	struct ttm_operation_ctx ctx = { true, false };
diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/radeon/radeon_object.h
index d23f2ed4126e..e5638c919c98 100644
--- a/drivers/gpu/drm/radeon/radeon_object.h
+++ b/drivers/gpu/drm/radeon/radeon_object.h
@@ -141,7 +141,7 @@ extern void radeon_bo_force_delete(struct radeon_device *rdev);
 extern int radeon_bo_init(struct radeon_device *rdev);
 extern void radeon_bo_fini(struct radeon_device *rdev);
 extern int radeon_bo_list_validate(struct radeon_device *rdev,
-				   struct ww_acquire_ctx *ticket,
+				   struct dma_resv_ctx *ticket,
 				   struct list_head *head, int ring);
 extern int radeon_bo_set_tiling_flags(struct radeon_bo *bo,
 				u32 tiling_flags, u32 pitch);
diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
index 131dae8f4170..71148c83cc4f 100644
--- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
+++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
@@ -33,16 +33,6 @@
 #include <linux/sched.h>
 #include <linux/module.h>
 
-static void ttm_eu_backoff_reservation_reverse(struct list_head *list,
-					      struct ttm_validate_buffer *entry)
-{
-	list_for_each_entry_continue_reverse(entry, list, head) {
-		struct ttm_buffer_object *bo = entry->bo;
-
-		dma_resv_unlock(bo->base.resv);
-	}
-}
-
 static void ttm_eu_del_from_lru_locked(struct list_head *list)
 {
 	struct ttm_validate_buffer *entry;
@@ -53,7 +43,7 @@ static void ttm_eu_del_from_lru_locked(struct list_head *list)
 	}
 }
 
-void ttm_eu_backoff_reservation(struct ww_acquire_ctx *ticket,
+void ttm_eu_backoff_reservation(struct dma_resv_ctx *ticket,
 				struct list_head *list)
 {
 	struct ttm_validate_buffer *entry;
@@ -71,12 +61,15 @@ void ttm_eu_backoff_reservation(struct ww_acquire_ctx *ticket,
 
 		if (list_empty(&bo->lru))
 			ttm_bo_add_to_lru(bo);
-		dma_resv_unlock(bo->base.resv);
+		if (!ticket)
+			dma_resv_unlock(bo->base.resv);
 	}
 	spin_unlock(&glob->lru_lock);
 
-	if (ticket)
-		ww_acquire_fini(ticket);
+	if (ticket) {
+		dma_resv_ctx_unlock_all(ticket);
+		dma_resv_ctx_fini(ticket);
+	}
 }
 EXPORT_SYMBOL(ttm_eu_backoff_reservation);
 
@@ -92,12 +85,12 @@ EXPORT_SYMBOL(ttm_eu_backoff_reservation);
  * buffers in different orders.
  */
 
-int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
+int ttm_eu_reserve_buffers(struct dma_resv_ctx *ticket,
 			   struct list_head *list, bool intr,
 			   struct list_head *dups, bool del_lru)
 {
-	struct ttm_bo_global *glob;
 	struct ttm_validate_buffer *entry;
+	struct ttm_bo_global *glob;
 	int ret;
 
 	if (list_empty(list))
@@ -107,70 +100,46 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
 	glob = entry->bo->bdev->glob;
 
 	if (ticket)
-		ww_acquire_init(ticket, &reservation_ww_class);
+		dma_resv_ctx_init(ticket);
 
+retry:
 	list_for_each_entry(entry, list, head) {
 		struct ttm_buffer_object *bo = entry->bo;
 
-		ret = __ttm_bo_reserve(bo, intr, (ticket == NULL), ticket);
-		if (!ret && unlikely(atomic_read(&bo->cpu_writers) > 0)) {
-			dma_resv_unlock(bo->base.resv);
+		if (likely(ticket)) {
+			ret = dma_resv_ctx_lock(ticket, bo->base.resv, intr);
+			if (ret == -EDEADLK)
+				goto retry;
+		} else {
+			ret = dma_resv_trylock(bo->base.resv) ? 0 : -EBUSY;
+		}
 
+		if (!ret && unlikely(atomic_read(&bo->cpu_writers) > 0)) {
+			if (!ticket)
+				dma_resv_unlock(bo->base.resv);
 			ret = -EBUSY;
 
 		} else if (ret == -EALREADY && dups) {
 			struct ttm_validate_buffer *safe = entry;
+
 			entry = list_prev_entry(entry, head);
 			list_del(&safe->head);
 			list_add(&safe->head, dups);
 			continue;
 		}
 
-		if (!ret) {
-			if (!entry->num_shared)
-				continue;
+		if (unlikely(ret))
+			goto error;
 
-			ret = dma_resv_reserve_shared(bo->base.resv,
-								entry->num_shared);
-			if (!ret)
-				continue;
-		}
-
-		/* uh oh, we lost out, drop every reservation and try
-		 * to only reserve this buffer, then start over if
-		 * this succeeds.
-		 */
-		ttm_eu_backoff_reservation_reverse(list, entry);
-
-		if (ret == -EDEADLK) {
-			if (intr) {
-				ret = dma_resv_lock_slow_interruptible(bo->base.resv,
-										 ticket);
-			} else {
-				dma_resv_lock_slow(bo->base.resv, ticket);
-				ret = 0;
-			}
-		}
+		if (!entry->num_shared)
+			continue;
 
-		if (!ret && entry->num_shared)
-			ret = dma_resv_reserve_shared(bo->base.resv,
-								entry->num_shared);
-
-		if (unlikely(ret != 0)) {
-			if (ret == -EINTR)
-				ret = -ERESTARTSYS;
-			if (ticket) {
-				ww_acquire_done(ticket);
-				ww_acquire_fini(ticket);
-			}
-			return ret;
+		ret = dma_resv_reserve_shared(bo->base.resv, entry->num_shared);
+		if (unlikely(ret)) {
+			if (!ticket)
+				dma_resv_unlock(bo->base.resv);
+			goto error;
 		}
-
-		/* move this item to the front of the list,
-		 * forces correct iteration of the loop without keeping track
-		 */
-		list_del(&entry->head);
-		list_add(&entry->head, list);
 	}
 
 	if (del_lru) {
@@ -179,10 +148,23 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
 		spin_unlock(&glob->lru_lock);
 	}
 	return 0;
+
+error:
+	if (ret == -EINTR)
+		ret = -ERESTARTSYS;
+	if (ticket) {
+		dma_resv_ctx_unlock_all(ticket);
+		dma_resv_ctx_done(ticket);
+		dma_resv_ctx_fini(ticket);
+	} else {
+		list_for_each_entry_continue_reverse(entry, list, head)
+			dma_resv_unlock(entry->bo->base.resv);
+	}
+	return ret;
 }
 EXPORT_SYMBOL(ttm_eu_reserve_buffers);
 
-void ttm_eu_fence_buffer_objects(struct ww_acquire_ctx *ticket,
+void ttm_eu_fence_buffer_objects(struct dma_resv_ctx *ticket,
 				 struct list_head *list,
 				 struct dma_fence *fence)
 {
@@ -208,10 +190,13 @@ void ttm_eu_fence_buffer_objects(struct ww_acquire_ctx *ticket,
 			ttm_bo_add_to_lru(bo);
 		else
 			ttm_bo_move_to_lru_tail(bo, NULL);
-		dma_resv_unlock(bo->base.resv);
+		if (!ticket)
+			dma_resv_unlock(bo->base.resv);
 	}
 	spin_unlock(&glob->lru_lock);
-	if (ticket)
-		ww_acquire_fini(ticket);
+	if (ticket) {
+		dma_resv_ctx_unlock_all(ticket);
+		dma_resv_ctx_fini(ticket);
+	}
 }
 EXPORT_SYMBOL(ttm_eu_fence_buffer_objects);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 0b5472450633..2d7c5ad25359 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -443,7 +443,7 @@ void vmw_resource_unreserve(struct vmw_resource *res,
  *                  reserved and validated backup buffer.
  */
 static int
-vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
+vmw_resource_check_buffer(struct dma_resv_ctx *ticket,
 			  struct vmw_resource *res,
 			  bool interruptible,
 			  struct ttm_validate_buffer *val_buf)
@@ -535,7 +535,7 @@ int vmw_resource_reserve(struct vmw_resource *res, bool interruptible,
  * @val_buf:        Backup buffer information.
  */
 static void
-vmw_resource_backoff_reservation(struct ww_acquire_ctx *ticket,
+vmw_resource_backoff_reservation(struct dma_resv_ctx *ticket,
 				 struct ttm_validate_buffer *val_buf)
 {
 	struct list_head val_list;
@@ -558,7 +558,7 @@ vmw_resource_backoff_reservation(struct ww_acquire_ctx *ticket,
  * @res:            The resource to evict.
  * @interruptible:  Whether to wait interruptible.
  */
-static int vmw_resource_do_evict(struct ww_acquire_ctx *ticket,
+static int vmw_resource_do_evict(struct dma_resv_ctx *ticket,
 				 struct vmw_resource *res, bool interruptible)
 {
 	struct ttm_validate_buffer val_buf;
@@ -822,7 +822,7 @@ static void vmw_resource_evict_type(struct vmw_private *dev_priv,
 	struct vmw_resource *evict_res;
 	unsigned err_count = 0;
 	int ret;
-	struct ww_acquire_ctx ticket;
+	struct dma_resv_ctx ticket;
 
 	do {
 		spin_lock(&dev_priv->resource_lock);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
index 1d2322ad6fd5..43f48df3844f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
@@ -77,7 +77,7 @@ struct vmw_validation_context {
 	struct list_head resource_ctx_list;
 	struct list_head bo_list;
 	struct list_head page_list;
-	struct ww_acquire_ctx ticket;
+	struct dma_resv_ctx ticket;
 	struct mutex *res_mutex;
 	unsigned int merge_dups;
 	unsigned int mem_size_left;
diff --git a/include/drm/ttm/ttm_execbuf_util.h b/include/drm/ttm/ttm_execbuf_util.h
index 7e46cc678e7e..4e86b6fd6c57 100644
--- a/include/drm/ttm/ttm_execbuf_util.h
+++ b/include/drm/ttm/ttm_execbuf_util.h
@@ -32,6 +32,7 @@
 #define _TTM_EXECBUF_UTIL_H_
 
 #include <linux/list.h>
+#include <linux/dma-resv-ctx.h>
 
 #include "ttm_bo_api.h"
 
@@ -52,20 +53,20 @@ struct ttm_validate_buffer {
 /**
  * function ttm_eu_backoff_reservation
  *
- * @ticket:   ww_acquire_ctx from reserve call
+ * @ticket:   reservation_context from reserve call
  * @list:     thread private list of ttm_validate_buffer structs.
  *
  * Undoes all buffer validation reservations for bos pointed to by
  * the list entries.
  */
 
-extern void ttm_eu_backoff_reservation(struct ww_acquire_ctx *ticket,
+extern void ttm_eu_backoff_reservation(struct dma_resv_ctx *ticket,
 				       struct list_head *list);
 
 /**
  * function ttm_eu_reserve_buffers
  *
- * @ticket:  [out] ww_acquire_ctx filled in by call, or NULL if only
+ * @ticket:  [out] reservation_context filled in by caller, or NULL if only
  *           non-blocking reserves should be tried.
  * @list:    thread private list of ttm_validate_buffer structs.
  * @intr:    should the wait be interruptible
@@ -97,14 +98,14 @@ extern void ttm_eu_backoff_reservation(struct ww_acquire_ctx *ticket,
  * has failed.
  */
 
-extern int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
+extern int ttm_eu_reserve_buffers(struct dma_resv_ctx *ticket,
 				  struct list_head *list, bool intr,
 				  struct list_head *dups, bool del_lru);
 
 /**
  * function ttm_eu_fence_buffer_objects.
  *
- * @ticket:      ww_acquire_ctx from reserve call
+ * @ticket:      reservation_context from reserve call
  * @list:        thread private list of ttm_validate_buffer structs.
  * @fence:       The new exclusive fence for the buffers.
  *
@@ -114,7 +115,7 @@ extern int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
  *
  */
 
-extern void ttm_eu_fence_buffer_objects(struct ww_acquire_ctx *ticket,
+extern void ttm_eu_fence_buffer_objects(struct dma_resv_ctx *ticket,
 					struct list_head *list,
 					struct dma_fence *fence);
 
-- 
2.17.1

