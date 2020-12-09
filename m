Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3E02D444A
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 15:29:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732981AbgLIO1D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 09:27:03 -0500
Received: from mx2.suse.de ([195.135.220.15]:40606 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732976AbgLIO06 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Dec 2020 09:26:58 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 35C41AD12;
        Wed,  9 Dec 2020 14:25:34 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, christian.koenig@amd.com, airlied@linux.ie,
        sumit.semwal@linaro.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com,
        sean@poorly.run, eric@anholt.net, sam@ravnborg.org
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        virtualization@lists.linux-foundation.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 5/8] drm/cma-helper: Provide a vmap function for short-term mappings
Date:   Wed,  9 Dec 2020 15:25:24 +0100
Message-Id: <20201209142527.26415-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201209142527.26415-1-tzimmermann@suse.de>
References: <20201209142527.26415-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implementations of the vmap/vunmap GEM callbacks may perform pinning
of the BO and may acquire the associated reservation object's lock.
Callers that only require a mapping of the contained memory can thus
interfere with other tasks that require exact pinning, such as scanout.
This is less of an issue with private CMA buffers, but may happen
with imported ones.

Therefore provide the new interface drm_gem_cma_vmap_local(), which only
performs the vmap operations. Callers have to hold the reservation lock
while the mapping persists.

This patch also connects GEM CMA helpers to the GEM object function with
equivalent functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 35 ++++++++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_bo.c         | 13 +++++++++++
 drivers/gpu/drm/vc4/vc4_drv.h        |  1 +
 include/drm/drm_gem_cma_helper.h     |  1 +
 4 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 7942cf05cd93..40b3e8e3fc42 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -38,6 +38,7 @@ static const struct drm_gem_object_funcs drm_gem_cma_default_funcs = {
 	.print_info = drm_gem_cma_print_info,
 	.get_sg_table = drm_gem_cma_get_sg_table,
 	.vmap = drm_gem_cma_vmap,
+	.vmap_local = drm_gem_cma_vmap_local,
 	.mmap = drm_gem_cma_mmap,
 	.vm_ops = &drm_gem_cma_vm_ops,
 };
@@ -471,6 +472,40 @@ int drm_gem_cma_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 }
 EXPORT_SYMBOL_GPL(drm_gem_cma_vmap);
 
+/**
+ * drm_gem_cma_vmap_local - map a CMA GEM object into the kernel's virtual
+ *     address space
+ * @obj: GEM object
+ * @map: Returns the kernel virtual address of the CMA GEM object's backing
+ *       store.
+ *
+ * This function maps a buffer into the kernel's
+ * virtual address space. Since the CMA buffers are already mapped into the
+ * kernel virtual address space this simply returns the cached virtual
+ * address. Drivers using the CMA helpers should set this as their DRM
+ * driver's &drm_gem_object_funcs.vmap_local callback.
+ *
+ * Returns:
+ * 0 on success, or a negative error code otherwise.
+ */
+int drm_gem_cma_vmap_local(struct drm_gem_object *obj, struct dma_buf_map *map)
+{
+	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
+
+	/*
+	 * TODO: The code in drm_gem_cma_prime_import_sg_table_vmap()
+	 *       establishes this mapping. The correct solution would
+	 *       be to call dma_buf_vmap_local() here.
+	 *
+	 *       If we find a case where we absolutely have to call
+	 *       dma_buf_vmap_local(), the code needs to be restructured.
+	 */
+	dma_buf_map_set_vaddr(map, cma_obj->vaddr);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_gem_cma_vmap_local);
+
 /**
  * drm_gem_cma_mmap - memory-map an exported CMA GEM object
  * @obj: GEM object
diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index dc316cb79e00..ec57326c69c4 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -387,6 +387,7 @@ static const struct drm_gem_object_funcs vc4_gem_object_funcs = {
 	.export = vc4_prime_export,
 	.get_sg_table = drm_gem_cma_get_sg_table,
 	.vmap = vc4_prime_vmap,
+	.vmap_local = vc4_prime_vmap_local,
 	.vm_ops = &vc4_vm_ops,
 };
 
@@ -797,6 +798,18 @@ int vc4_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 	return drm_gem_cma_vmap(obj, map);
 }
 
+int vc4_prime_vmap_local(struct drm_gem_object *obj, struct dma_buf_map *map)
+{
+	struct vc4_bo *bo = to_vc4_bo(obj);
+
+	if (bo->validated_shader) {
+		DRM_DEBUG("mmaping of shader BOs not allowed.\n");
+		return -EINVAL;
+	}
+
+	return drm_gem_cma_vmap_local(obj, map);
+}
+
 struct drm_gem_object *
 vc4_prime_import_sg_table(struct drm_device *dev,
 			  struct dma_buf_attachment *attach,
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 43a1af110b3e..efb6c47d318f 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -812,6 +812,7 @@ struct drm_gem_object *vc4_prime_import_sg_table(struct drm_device *dev,
 						 struct dma_buf_attachment *attach,
 						 struct sg_table *sgt);
 int vc4_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
+int vc4_prime_vmap_local(struct drm_gem_object *obj, struct dma_buf_map *map);
 int vc4_bo_cache_init(struct drm_device *dev);
 int vc4_bo_inc_usecnt(struct vc4_bo *bo);
 void vc4_bo_dec_usecnt(struct vc4_bo *bo);
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index 0a9711caa3e8..05122e71bc6d 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -99,6 +99,7 @@ drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
 				  struct dma_buf_attachment *attach,
 				  struct sg_table *sgt);
 int drm_gem_cma_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
+int drm_gem_cma_vmap_local(struct drm_gem_object *obj, struct dma_buf_map *map);
 int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 
 /**
-- 
2.29.2

