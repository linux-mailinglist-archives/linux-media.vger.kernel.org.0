Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B56502A4046
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 10:30:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgKCJaa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 04:30:30 -0500
Received: from mx2.suse.de ([195.135.220.15]:37526 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727068AbgKCJa0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Nov 2020 04:30:26 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 3F9D8B199;
        Tue,  3 Nov 2020 09:30:22 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
        alexander.deucher@amd.com, christian.koenig@amd.com,
        kraxel@redhat.com, l.stach@pengutronix.de,
        linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        kgene@kernel.org, krzk@kernel.org, yuq825@gmail.com,
        bskeggs@redhat.com, robh@kernel.org, tomeu.vizoso@collabora.com,
        steven.price@arm.com, alyssa.rosenzweig@collabora.com,
        hjc@rock-chips.com, heiko@sntech.de, hdegoede@redhat.com,
        sean@poorly.run, eric@anholt.net, oleksandr_andrushchenko@epam.com,
        ray.huang@amd.com, sumit.semwal@linaro.org,
        emil.velikov@collabora.com, luben.tuikov@amd.com, apaneers@amd.com,
        linus.walleij@linaro.org, melissa.srw@gmail.com,
        chris@chris-wilson.co.uk, miaoqinglang@huawei.com
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        etnaviv@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v7 06/10] drm/gem: Use struct dma_buf_map in GEM vmap ops and convert GEM backends
Date:   Tue,  3 Nov 2020 10:30:11 +0100
Message-Id: <20201103093015.1063-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201103093015.1063-1-tzimmermann@suse.de>
References: <20201103093015.1063-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch replaces the vmap/vunmap's use of raw pointers in GEM object
functions with instances of struct dma_buf_map. GEM backends are
converted as well. For most of them, this simply changes the returned type.

TTM-based drivers now return information about the location of the memory,
either system or I/O memory. GEM VRAM helpers and qxl now use ttm_bo_vmap()
et al. Amdgpu, nouveau and radeon use drm_gem_ttm_vmap() et al instead of
implementing their own vmap callbacks.

v7:
	* init QXL cursor to mapped BO buffer (kernel test robot)
v5:
	* update vkms after switch to shmem
v4:
	* use ttm_bo_vmap(), drm_gem_ttm_vmap(), et al. (Daniel, Christian)
	* fix a trailing { in drm_gem_vmap()
	* remove several empty functions instead of converting them (Daniel)
	* comment uses of raw pointers with a TODO (Daniel)
	* TODO list: convert more helpers to use struct dma_buf_map

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Christian König <christian.koenig@amd.com>
Tested-by: Sam Ravnborg <sam@ravnborg.org>
---
 Documentation/gpu/todo.rst                  |  18 ++++
 drivers/gpu/drm/Kconfig                     |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  36 -------
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |   1 -
 drivers/gpu/drm/ast/ast_cursor.c            |  27 +++--
 drivers/gpu/drm/ast/ast_drv.h               |   7 +-
 drivers/gpu/drm/drm_gem.c                   |  23 +++--
 drivers/gpu/drm/drm_gem_cma_helper.c        |  10 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c      |  48 +++++----
 drivers/gpu/drm/drm_gem_vram_helper.c       | 107 ++++++++++----------
 drivers/gpu/drm/etnaviv/etnaviv_drv.h       |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |   9 +-
 drivers/gpu/drm/lima/lima_gem.c             |   6 +-
 drivers/gpu/drm/lima/lima_sched.c           |  11 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c      |  10 +-
 drivers/gpu/drm/nouveau/Kconfig             |   1 +
 drivers/gpu/drm/nouveau/nouveau_bo.h        |   2 -
 drivers/gpu/drm/nouveau/nouveau_gem.c       |   6 +-
 drivers/gpu/drm/nouveau/nouveau_gem.h       |   2 -
 drivers/gpu/drm/nouveau/nouveau_prime.c     |  20 ----
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c |  14 +--
 drivers/gpu/drm/qxl/qxl_display.c           |  15 ++-
 drivers/gpu/drm/qxl/qxl_draw.c              |  14 ++-
 drivers/gpu/drm/qxl/qxl_drv.h               |  11 +-
 drivers/gpu/drm/qxl/qxl_object.c            |  31 +++---
 drivers/gpu/drm/qxl/qxl_object.h            |   2 +-
 drivers/gpu/drm/qxl/qxl_prime.c             |  12 +--
 drivers/gpu/drm/radeon/radeon.h             |   1 -
 drivers/gpu/drm/radeon/radeon_gem.c         |   7 +-
 drivers/gpu/drm/radeon/radeon_prime.c       |  20 ----
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c |  22 ++--
 drivers/gpu/drm/rockchip/rockchip_drm_gem.h |   4 +-
 drivers/gpu/drm/tiny/cirrus.c               |  10 +-
 drivers/gpu/drm/tiny/gm12u320.c             |  10 +-
 drivers/gpu/drm/udl/udl_modeset.c           |   8 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c       |  11 +-
 drivers/gpu/drm/vc4/vc4_bo.c                |   6 +-
 drivers/gpu/drm/vc4/vc4_drv.h               |   2 +-
 drivers/gpu/drm/vgem/vgem_drv.c             |  16 ++-
 drivers/gpu/drm/vkms/vkms_plane.c           |  15 ++-
 drivers/gpu/drm/vkms/vkms_writeback.c       |  22 ++--
 drivers/gpu/drm/xen/xen_drm_front_gem.c     |  18 ++--
 drivers/gpu/drm/xen/xen_drm_front_gem.h     |   6 +-
 include/drm/drm_gem.h                       |   5 +-
 include/drm/drm_gem_cma_helper.h            |   2 +-
 include/drm/drm_gem_shmem_helper.h          |   4 +-
 include/drm/drm_gem_vram_helper.h           |  14 +--
 49 files changed, 349 insertions(+), 308 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 6b224ef14455..59f63f1d7680 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -450,6 +450,24 @@ Contact: Ville Syrjälä, Daniel Vetter
 
 Level: Intermediate
 
+Use struct dma_buf_map throughout codebase
+------------------------------------------
+
+Pointers to shared device memory are stored in struct dma_buf_map. Each
+instance knows whether it refers to system or I/O memory. Most of the DRM-wide
+interface have been converted to use struct dma_buf_map, but implementations
+often still use raw pointers.
+
+The task is to use struct dma_buf_map where it makes sense.
+
+* Memory managers should use struct dma_buf_map for dma-buf-imported buffers.
+* TTM might benefit from using struct dma_buf_map internally.
+* Framebuffer copying and blitting helpers should operate on struct dma_buf_map.
+
+Contact: Thomas Zimmermann <tzimmermann@suse.de>, Christian König, Daniel Vetter
+
+Level: Intermediate
+
 
 Core refactorings
 =================
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 64376dd298ed..f5c7aa7894d5 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -232,6 +232,7 @@ config DRM_RADEON
 	select FW_LOADER
         select DRM_KMS_HELPER
         select DRM_TTM
+	select DRM_TTM_HELPER
 	select POWER_SUPPLY
 	select HWMON
 	select BACKLIGHT_CLASS_DEVICE
@@ -252,6 +253,7 @@ config DRM_AMDGPU
 	select DRM_KMS_HELPER
 	select DRM_SCHED
 	select DRM_TTM
+	select DRM_TTM_HELPER
 	select POWER_SUPPLY
 	select HWMON
 	select BACKLIGHT_CLASS_DEVICE
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 5b465ab774d1..e5919efca870 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -41,42 +41,6 @@
 #include <linux/dma-fence-array.h>
 #include <linux/pci-p2pdma.h>
 
-/**
- * amdgpu_gem_prime_vmap - &dma_buf_ops.vmap implementation
- * @obj: GEM BO
- *
- * Sets up an in-kernel virtual mapping of the BO's memory.
- *
- * Returns:
- * The virtual address of the mapping or an error pointer.
- */
-void *amdgpu_gem_prime_vmap(struct drm_gem_object *obj)
-{
-	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
-	int ret;
-
-	ret = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.num_pages,
-			  &bo->dma_buf_vmap);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return bo->dma_buf_vmap.virtual;
-}
-
-/**
- * amdgpu_gem_prime_vunmap - &dma_buf_ops.vunmap implementation
- * @obj: GEM BO
- * @vaddr: Virtual address (unused)
- *
- * Tears down the in-kernel virtual mapping of the BO's memory.
- */
-void amdgpu_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
-{
-	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
-
-	ttm_bo_kunmap(&bo->dma_buf_vmap);
-}
-
 /**
  * amdgpu_gem_prime_mmap - &drm_driver.gem_prime_mmap implementation
  * @obj: GEM BO
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h
index 2c5c84a06bb9..39b5b9616fd8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h
@@ -31,8 +31,6 @@ struct drm_gem_object *amdgpu_gem_prime_import(struct drm_device *dev,
 					    struct dma_buf *dma_buf);
 bool amdgpu_dmabuf_is_xgmi_accessible(struct amdgpu_device *adev,
 				      struct amdgpu_bo *bo);
-void *amdgpu_gem_prime_vmap(struct drm_gem_object *obj);
-void amdgpu_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
 int amdgpu_gem_prime_mmap(struct drm_gem_object *obj,
 			  struct vm_area_struct *vma);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 8ea6fc745769..a6142ede78fb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -33,6 +33,7 @@
 
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_debugfs.h>
+#include <drm/drm_gem_ttm_helper.h>
 
 #include "amdgpu.h"
 #include "amdgpu_display.h"
@@ -220,8 +221,8 @@ static const struct drm_gem_object_funcs amdgpu_gem_object_funcs = {
 	.open = amdgpu_gem_object_open,
 	.close = amdgpu_gem_object_close,
 	.export = amdgpu_gem_prime_export,
-	.vmap = amdgpu_gem_prime_vmap,
-	.vunmap = amdgpu_gem_prime_vunmap,
+	.vmap = drm_gem_ttm_vmap,
+	.vunmap = drm_gem_ttm_vunmap,
 };
 
 /*
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index 132e5f955180..01296ef0d673 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -100,7 +100,6 @@ struct amdgpu_bo {
 	struct amdgpu_bo		*parent;
 	struct amdgpu_bo		*shadow;
 
-	struct ttm_bo_kmap_obj		dma_buf_vmap;
 	struct amdgpu_mn		*mn;
 
 
diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index e0f4613918ad..742d43a7edf4 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -39,7 +39,7 @@ static void ast_cursor_fini(struct ast_private *ast)
 
 	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
 		gbo = ast->cursor.gbo[i];
-		drm_gem_vram_vunmap(gbo, ast->cursor.vaddr[i]);
+		drm_gem_vram_vunmap(gbo, &ast->cursor.map[i]);
 		drm_gem_vram_unpin(gbo);
 		drm_gem_vram_put(gbo);
 	}
@@ -60,7 +60,7 @@ int ast_cursor_init(struct ast_private *ast)
 	struct drm_device *dev = &ast->base;
 	size_t size, i;
 	struct drm_gem_vram_object *gbo;
-	void __iomem *vaddr;
+	struct dma_buf_map map;
 	int ret;
 
 	size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
@@ -77,16 +77,15 @@ int ast_cursor_init(struct ast_private *ast)
 			drm_gem_vram_put(gbo);
 			goto err_drm_gem_vram_put;
 		}
-		vaddr = drm_gem_vram_vmap(gbo);
-		if (IS_ERR(vaddr)) {
-			ret = PTR_ERR(vaddr);
+		ret = drm_gem_vram_vmap(gbo, &map);
+		if (ret) {
 			drm_gem_vram_unpin(gbo);
 			drm_gem_vram_put(gbo);
 			goto err_drm_gem_vram_put;
 		}
 
 		ast->cursor.gbo[i] = gbo;
-		ast->cursor.vaddr[i] = vaddr;
+		ast->cursor.map[i] = map;
 	}
 
 	return drmm_add_action_or_reset(dev, ast_cursor_release, NULL);
@@ -95,7 +94,7 @@ int ast_cursor_init(struct ast_private *ast)
 	while (i) {
 		--i;
 		gbo = ast->cursor.gbo[i];
-		drm_gem_vram_vunmap(gbo, ast->cursor.vaddr[i]);
+		drm_gem_vram_vunmap(gbo, &ast->cursor.map[i]);
 		drm_gem_vram_unpin(gbo);
 		drm_gem_vram_put(gbo);
 	}
@@ -170,6 +169,7 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 {
 	struct drm_device *dev = &ast->base;
 	struct drm_gem_vram_object *gbo;
+	struct dma_buf_map map;
 	int ret;
 	void *src;
 	void __iomem *dst;
@@ -183,18 +183,17 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 	ret = drm_gem_vram_pin(gbo, 0);
 	if (ret)
 		return ret;
-	src = drm_gem_vram_vmap(gbo);
-	if (IS_ERR(src)) {
-		ret = PTR_ERR(src);
+	ret = drm_gem_vram_vmap(gbo, &map);
+	if (ret)
 		goto err_drm_gem_vram_unpin;
-	}
+	src = map.vaddr; /* TODO: Use mapping abstraction properly */
 
-	dst = ast->cursor.vaddr[ast->cursor.next_index];
+	dst = ast->cursor.map[ast->cursor.next_index].vaddr_iomem;
 
 	/* do data transfer to cursor BO */
 	update_cursor_image(dst, src, fb->width, fb->height);
 
-	drm_gem_vram_vunmap(gbo, src);
+	drm_gem_vram_vunmap(gbo, &map);
 	drm_gem_vram_unpin(gbo);
 
 	return 0;
@@ -257,7 +256,7 @@ void ast_cursor_show(struct ast_private *ast, int x, int y,
 	u8 __iomem *sig;
 	u8 jreg;
 
-	dst = ast->cursor.vaddr[ast->cursor.next_index];
+	dst = ast->cursor.map[ast->cursor.next_index].vaddr;
 
 	sig = dst + AST_HWC_SIZE;
 	writel(x, sig + AST_HWC_SIGNATURE_X);
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 467049ca8430..f963141dd851 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -28,10 +28,11 @@
 #ifndef __AST_DRV_H__
 #define __AST_DRV_H__
 
-#include <linux/types.h>
-#include <linux/io.h>
+#include <linux/dma-buf-map.h>
 #include <linux/i2c.h>
 #include <linux/i2c-algo-bit.h>
+#include <linux/io.h>
+#include <linux/types.h>
 
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
@@ -131,7 +132,7 @@ struct ast_private {
 
 	struct {
 		struct drm_gem_vram_object *gbo[AST_DEFAULT_HWC_NUM];
-		void __iomem *vaddr[AST_DEFAULT_HWC_NUM];
+		struct dma_buf_map map[AST_DEFAULT_HWC_NUM];
 		unsigned int next_index;
 	} cursor;
 
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index d586068f5509..4231fda26e70 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -36,6 +36,7 @@
 #include <linux/pagemap.h>
 #include <linux/shmem_fs.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-buf-map.h>
 #include <linux/mem_encrypt.h>
 #include <linux/pagevec.h>
 
@@ -1207,26 +1208,30 @@ void drm_gem_unpin(struct drm_gem_object *obj)
 
 void *drm_gem_vmap(struct drm_gem_object *obj)
 {
-	void *vaddr;
+	struct dma_buf_map map;
+	int ret;
 
-	if (obj->funcs->vmap)
-		vaddr = obj->funcs->vmap(obj);
-	else
-		vaddr = ERR_PTR(-EOPNOTSUPP);
+	if (!obj->funcs->vmap)
+		return ERR_PTR(-EOPNOTSUPP);
 
-	if (!vaddr)
-		vaddr = ERR_PTR(-ENOMEM);
+	ret = obj->funcs->vmap(obj, &map);
+	if (ret)
+		return ERR_PTR(ret);
+	else if (dma_buf_map_is_null(&map))
+		return ERR_PTR(-ENOMEM);
 
-	return vaddr;
+	return map.vaddr;
 }
 
 void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr)
 {
+	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(vaddr);
+
 	if (!vaddr)
 		return;
 
 	if (obj->funcs->vunmap)
-		obj->funcs->vunmap(obj, vaddr);
+		obj->funcs->vunmap(obj, &map);
 }
 
 /**
diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index d527485ea0b7..b57e3e9222f0 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -519,6 +519,8 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_prime_mmap);
  * drm_gem_cma_prime_vmap - map a CMA GEM object into the kernel's virtual
  *     address space
  * @obj: GEM object
+ * @map: Returns the kernel virtual address of the CMA GEM object's backing
+ *       store.
  *
  * This function maps a buffer exported via DRM PRIME into the kernel's
  * virtual address space. Since the CMA buffers are already mapped into the
@@ -527,13 +529,15 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_prime_mmap);
  * driver's &drm_gem_object_funcs.vmap callback.
  *
  * Returns:
- * The kernel virtual address of the CMA GEM object's backing store.
+ * 0 on success, or a negative error code otherwise.
  */
-void *drm_gem_cma_prime_vmap(struct drm_gem_object *obj)
+int drm_gem_cma_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 {
 	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
 
-	return cma_obj->vaddr;
+	dma_buf_map_set_vaddr(map, cma_obj->vaddr);
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(drm_gem_cma_prime_vmap);
 
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 8233bda4692f..499189c48f0b 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -258,19 +258,25 @@ void drm_gem_shmem_unpin(struct drm_gem_object *obj)
 }
 EXPORT_SYMBOL(drm_gem_shmem_unpin);
 
-static void *drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem)
+static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem, struct dma_buf_map *map)
 {
 	struct drm_gem_object *obj = &shmem->base;
-	struct dma_buf_map map;
 	int ret = 0;
 
-	if (shmem->vmap_use_count++ > 0)
-		return shmem->vaddr;
+	if (shmem->vmap_use_count++ > 0) {
+		dma_buf_map_set_vaddr(map, shmem->vaddr);
+		return 0;
+	}
 
 	if (obj->import_attach) {
-		ret = dma_buf_vmap(obj->import_attach->dmabuf, &map);
-		if (!ret)
-			shmem->vaddr = map.vaddr;
+		ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
+		if (!ret) {
+			if (WARN_ON(map->is_iomem)) {
+				ret = -EIO;
+				goto err_put_pages;
+			}
+			shmem->vaddr = map->vaddr;
+		}
 	} else {
 		pgprot_t prot = PAGE_KERNEL;
 
@@ -284,6 +290,8 @@ static void *drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem)
 				    VM_MAP, prot);
 		if (!shmem->vaddr)
 			ret = -ENOMEM;
+		else
+			dma_buf_map_set_vaddr(map, shmem->vaddr);
 	}
 
 	if (ret) {
@@ -291,7 +299,7 @@ static void *drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem)
 		goto err_put_pages;
 	}
 
-	return shmem->vaddr;
+	return 0;
 
 err_put_pages:
 	if (!obj->import_attach)
@@ -299,12 +307,14 @@ static void *drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem)
 err_zero_use:
 	shmem->vmap_use_count = 0;
 
-	return ERR_PTR(ret);
+	return ret;
 }
 
 /*
  * drm_gem_shmem_vmap - Create a virtual mapping for a shmem GEM object
  * @shmem: shmem GEM object
+ * @map: Returns the kernel virtual address of the SHMEM GEM object's backing
+ *       store.
  *
  * This function makes sure that a contiguous kernel virtual address mapping
  * exists for the buffer backing the shmem GEM object.
@@ -318,26 +328,25 @@ static void *drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem)
  * Returns:
  * 0 on success or a negative error code on failure.
  */
-void *drm_gem_shmem_vmap(struct drm_gem_object *obj)
+int drm_gem_shmem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 {
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
-	void *vaddr;
 	int ret;
 
 	ret = mutex_lock_interruptible(&shmem->vmap_lock);
 	if (ret)
-		return ERR_PTR(ret);
-	vaddr = drm_gem_shmem_vmap_locked(shmem);
+		return ret;
+	ret = drm_gem_shmem_vmap_locked(shmem, map);
 	mutex_unlock(&shmem->vmap_lock);
 
-	return vaddr;
+	return ret;
 }
 EXPORT_SYMBOL(drm_gem_shmem_vmap);
 
-static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem)
+static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
+					struct dma_buf_map *map)
 {
 	struct drm_gem_object *obj = &shmem->base;
-	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(shmem->vaddr);
 
 	if (WARN_ON_ONCE(!shmem->vmap_use_count))
 		return;
@@ -346,7 +355,7 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem)
 		return;
 
 	if (obj->import_attach)
-		dma_buf_vunmap(obj->import_attach->dmabuf, &map);
+		dma_buf_vunmap(obj->import_attach->dmabuf, map);
 	else
 		vunmap(shmem->vaddr);
 
@@ -357,6 +366,7 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem)
 /*
  * drm_gem_shmem_vunmap - Unmap a virtual mapping fo a shmem GEM object
  * @shmem: shmem GEM object
+ * @map: Kernel virtual address where the SHMEM GEM object was mapped
  *
  * This function cleans up a kernel virtual address mapping acquired by
  * drm_gem_shmem_vmap(). The mapping is only removed when the use count drops to
@@ -366,12 +376,12 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem)
  * also be called by drivers directly, in which case it will hide the
  * differences between dma-buf imported and natively allocated objects.
  */
-void drm_gem_shmem_vunmap(struct drm_gem_object *obj, void *vaddr)
+void drm_gem_shmem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 {
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 
 	mutex_lock(&shmem->vmap_lock);
-	drm_gem_shmem_vunmap_locked(shmem);
+	drm_gem_shmem_vunmap_locked(shmem, map);
 	mutex_unlock(&shmem->vmap_lock);
 }
 EXPORT_SYMBOL(drm_gem_shmem_vunmap);
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index e305fadb8bc8..5e1b09ba5f2b 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
+#include <linux/dma-buf-map.h>
 #include <linux/module.h>
 
 #include <drm/drm_debugfs.h>
@@ -112,8 +113,8 @@ static void drm_gem_vram_cleanup(struct drm_gem_vram_object *gbo)
 	 * up; only release the GEM object.
 	 */
 
-	WARN_ON(gbo->kmap_use_count);
-	WARN_ON(gbo->kmap.virtual);
+	WARN_ON(gbo->vmap_use_count);
+	WARN_ON(dma_buf_map_is_set(&gbo->map));
 
 	drm_gem_object_release(&gbo->bo.base);
 }
@@ -378,29 +379,37 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
 }
 EXPORT_SYMBOL(drm_gem_vram_unpin);
 
-static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo)
+static int drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
+				    struct dma_buf_map *map)
 {
 	int ret;
-	struct ttm_bo_kmap_obj *kmap = &gbo->kmap;
-	bool is_iomem;
 
-	if (gbo->kmap_use_count > 0)
+	if (gbo->vmap_use_count > 0)
 		goto out;
 
-	ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, kmap);
+	ret = ttm_bo_vmap(&gbo->bo, &gbo->map);
 	if (ret)
-		return ERR_PTR(ret);
+		return ret;
 
 out:
-	++gbo->kmap_use_count;
-	return ttm_kmap_obj_virtual(kmap, &is_iomem);
+	++gbo->vmap_use_count;
+	*map = gbo->map;
+
+	return 0;
 }
 
-static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo)
+static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo,
+				       struct dma_buf_map *map)
 {
-	if (WARN_ON_ONCE(!gbo->kmap_use_count))
+	struct drm_device *dev = gbo->bo.base.dev;
+
+	if (drm_WARN_ON_ONCE(dev, !gbo->vmap_use_count))
 		return;
-	if (--gbo->kmap_use_count > 0)
+
+	if (drm_WARN_ON_ONCE(dev, !dma_buf_map_is_equal(&gbo->map, map)))
+		return; /* BUG: map not mapped from this BO */
+
+	if (--gbo->vmap_use_count > 0)
 		return;
 
 	/*
@@ -414,7 +423,9 @@ static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo)
 /**
  * drm_gem_vram_vmap() - Pins and maps a GEM VRAM object into kernel address
  *                       space
- * @gbo:	The GEM VRAM object to map
+ * @gbo: The GEM VRAM object to map
+ * @map: Returns the kernel virtual address of the VRAM GEM object's backing
+ *       store.
  *
  * The vmap function pins a GEM VRAM object to its current location, either
  * system or video memory, and maps its buffer into kernel address space.
@@ -423,48 +434,44 @@ static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo)
  * unmap and unpin the GEM VRAM object.
  *
  * Returns:
- * The buffer's virtual address on success, or
- * an ERR_PTR()-encoded error code otherwise.
+ * 0 on success, or a negative error code otherwise.
  */
-void *drm_gem_vram_vmap(struct drm_gem_vram_object *gbo)
+int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
 {
 	int ret;
-	void *base;
 
 	ret = ttm_bo_reserve(&gbo->bo, true, false, NULL);
 	if (ret)
-		return ERR_PTR(ret);
+		return ret;
 
 	ret = drm_gem_vram_pin_locked(gbo, 0);
 	if (ret)
 		goto err_ttm_bo_unreserve;
-	base = drm_gem_vram_kmap_locked(gbo);
-	if (IS_ERR(base)) {
-		ret = PTR_ERR(base);
+	ret = drm_gem_vram_kmap_locked(gbo, map);
+	if (ret)
 		goto err_drm_gem_vram_unpin_locked;
-	}
 
 	ttm_bo_unreserve(&gbo->bo);
 
-	return base;
+	return 0;
 
 err_drm_gem_vram_unpin_locked:
 	drm_gem_vram_unpin_locked(gbo);
 err_ttm_bo_unreserve:
 	ttm_bo_unreserve(&gbo->bo);
-	return ERR_PTR(ret);
+	return ret;
 }
 EXPORT_SYMBOL(drm_gem_vram_vmap);
 
 /**
  * drm_gem_vram_vunmap() - Unmaps and unpins a GEM VRAM object
- * @gbo:	The GEM VRAM object to unmap
- * @vaddr:	The mapping's base address as returned by drm_gem_vram_vmap()
+ * @gbo: The GEM VRAM object to unmap
+ * @map: Kernel virtual address where the VRAM GEM object was mapped
  *
  * A call to drm_gem_vram_vunmap() unmaps and unpins a GEM VRAM buffer. See
  * the documentation for drm_gem_vram_vmap() for more information.
  */
-void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, void *vaddr)
+void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
 {
 	int ret;
 
@@ -472,7 +479,7 @@ void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, void *vaddr)
 	if (WARN_ONCE(ret, "ttm_bo_reserve_failed(): ret=%d\n", ret))
 		return;
 
-	drm_gem_vram_kunmap_locked(gbo);
+	drm_gem_vram_kunmap_locked(gbo, map);
 	drm_gem_vram_unpin_locked(gbo);
 
 	ttm_bo_unreserve(&gbo->bo);
@@ -563,15 +570,13 @@ static void drm_gem_vram_bo_driver_move_notify(struct drm_gem_vram_object *gbo,
 					       bool evict,
 					       struct ttm_resource *new_mem)
 {
-	struct ttm_bo_kmap_obj *kmap = &gbo->kmap;
+	struct ttm_buffer_object *bo = &gbo->bo;
+	struct drm_device *dev = bo->base.dev;
 
-	if (WARN_ON_ONCE(gbo->kmap_use_count))
+	if (drm_WARN_ON_ONCE(dev, gbo->vmap_use_count))
 		return;
 
-	if (!kmap->virtual)
-		return;
-	ttm_bo_kunmap(kmap);
-	kmap->virtual = NULL;
+	ttm_bo_vunmap(bo, &gbo->map);
 }
 
 static int drm_gem_vram_bo_driver_move(struct drm_gem_vram_object *gbo,
@@ -837,37 +842,33 @@ static void drm_gem_vram_object_unpin(struct drm_gem_object *gem)
 }
 
 /**
- * drm_gem_vram_object_vmap() - \
-	Implements &struct drm_gem_object_funcs.vmap
- * @gem:	The GEM object to map
+ * drm_gem_vram_object_vmap() -
+ *	Implements &struct drm_gem_object_funcs.vmap
+ * @gem: The GEM object to map
+ * @map: Returns the kernel virtual address of the VRAM GEM object's backing
+ *       store.
  *
  * Returns:
- * The buffers virtual address on success, or
- * NULL otherwise.
+ * 0 on success, or a negative error code otherwise.
  */
-static void *drm_gem_vram_object_vmap(struct drm_gem_object *gem)
+static int drm_gem_vram_object_vmap(struct drm_gem_object *gem, struct dma_buf_map *map)
 {
 	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
-	void *base;
 
-	base = drm_gem_vram_vmap(gbo);
-	if (IS_ERR(base))
-		return NULL;
-	return base;
+	return drm_gem_vram_vmap(gbo, map);
 }
 
 /**
- * drm_gem_vram_object_vunmap() - \
-	Implements &struct drm_gem_object_funcs.vunmap
- * @gem:	The GEM object to unmap
- * @vaddr:	The mapping's base address
+ * drm_gem_vram_object_vunmap() -
+ *	Implements &struct drm_gem_object_funcs.vunmap
+ * @gem: The GEM object to unmap
+ * @map: Kernel virtual address where the VRAM GEM object was mapped
  */
-static void drm_gem_vram_object_vunmap(struct drm_gem_object *gem,
-				       void *vaddr)
+static void drm_gem_vram_object_vunmap(struct drm_gem_object *gem, struct dma_buf_map *map)
 {
 	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
 
-	drm_gem_vram_vunmap(gbo, vaddr);
+	drm_gem_vram_vunmap(gbo, map);
 }
 
 /*
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index 9682c26d89bb..f5be627e1de0 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -51,7 +51,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 int etnaviv_gem_mmap(struct file *filp, struct vm_area_struct *vma);
 int etnaviv_gem_mmap_offset(struct drm_gem_object *obj, u64 *offset);
 struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj);
-void *etnaviv_gem_prime_vmap(struct drm_gem_object *obj);
+int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
 int etnaviv_gem_prime_mmap(struct drm_gem_object *obj,
 			   struct vm_area_struct *vma);
 struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_device *dev,
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index a6d9932a32ae..bc2543dd987d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -22,9 +22,14 @@ struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj)
 	return drm_prime_pages_to_sg(obj->dev, etnaviv_obj->pages, npages);
 }
 
-void *etnaviv_gem_prime_vmap(struct drm_gem_object *obj)
+int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 {
-	return etnaviv_gem_vmap(obj);
+	void *vaddr = etnaviv_gem_vmap(obj);
+	if (!vaddr)
+		return -ENOMEM;
+	dma_buf_map_set_vaddr(map, vaddr);
+
+	return 0;
 }
 
 int etnaviv_gem_prime_mmap(struct drm_gem_object *obj,
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 11223fe348df..832e5280a6ed 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -182,14 +182,14 @@ static int lima_gem_pin(struct drm_gem_object *obj)
 	return drm_gem_shmem_pin(obj);
 }
 
-static void *lima_gem_vmap(struct drm_gem_object *obj)
+static int lima_gem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 {
 	struct lima_bo *bo = to_lima_bo(obj);
 
 	if (bo->heap_size)
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 
-	return drm_gem_shmem_vmap(obj);
+	return drm_gem_shmem_vmap(obj, map);
 }
 
 static int lima_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index dc6df9e9a40d..a070a85f8f36 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /* Copyright 2017-2019 Qiang Yu <yuq825@gmail.com> */
 
+#include <linux/dma-buf-map.h>
 #include <linux/kthread.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
@@ -303,6 +304,8 @@ static void lima_sched_build_error_task_list(struct lima_sched_task *task)
 	struct lima_dump_chunk_buffer *buffer_chunk;
 	u32 size, task_size, mem_size;
 	int i;
+	struct dma_buf_map map;
+	int ret;
 
 	mutex_lock(&dev->error_task_list_lock);
 
@@ -388,15 +391,15 @@ static void lima_sched_build_error_task_list(struct lima_sched_task *task)
 		} else {
 			buffer_chunk->size = lima_bo_size(bo);
 
-			data = drm_gem_shmem_vmap(&bo->base.base);
-			if (IS_ERR_OR_NULL(data)) {
+			ret = drm_gem_shmem_vmap(&bo->base.base, &map);
+			if (ret) {
 				kvfree(et);
 				goto out;
 			}
 
-			memcpy(buffer_chunk + 1, data, buffer_chunk->size);
+			memcpy(buffer_chunk + 1, map.vaddr, buffer_chunk->size);
 
-			drm_gem_shmem_vunmap(&bo->base.base, data);
+			drm_gem_shmem_vunmap(&bo->base.base, &map);
 		}
 
 		buffer_chunk = (void *)(buffer_chunk + 1) + buffer_chunk->size;
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 38672f9e5c4f..8ef76769b97f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/delay.h>
+#include <linux/dma-buf-map.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_state_helper.h>
@@ -1556,15 +1557,18 @@ mgag200_handle_damage(struct mga_device *mdev, struct drm_framebuffer *fb,
 		      struct drm_rect *clip)
 {
 	struct drm_device *dev = &mdev->base;
+	struct dma_buf_map map;
 	void *vmap;
+	int ret;
 
-	vmap = drm_gem_shmem_vmap(fb->obj[0]);
-	if (drm_WARN_ON(dev, !vmap))
+	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
+	if (drm_WARN_ON(dev, ret))
 		return; /* BUG: SHMEM BO should always be vmapped */
+	vmap = map.vaddr; /* TODO: Use mapping abstraction properly */
 
 	drm_fb_memcpy_dstclip(mdev->vram, vmap, fb, clip);
 
-	drm_gem_shmem_vunmap(fb->obj[0], vmap);
+	drm_gem_shmem_vunmap(fb->obj[0], &map);
 
 	/* Always scanout image at VRAM offset 0 */
 	mgag200_set_startadd(mdev, (u32)0);
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index 5dec1e5694b7..9436310d0854 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -6,6 +6,7 @@ config DRM_NOUVEAU
 	select FW_LOADER
 	select DRM_KMS_HELPER
 	select DRM_TTM
+	select DRM_TTM_HELPER
 	select BACKLIGHT_CLASS_DEVICE if DRM_NOUVEAU_BACKLIGHT
 	select ACPI_VIDEO if ACPI && X86 && BACKLIGHT_CLASS_DEVICE && INPUT
 	select X86_PLATFORM_DEVICES if ACPI && X86
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index 641ef6298a0e..6045b85a762a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -39,8 +39,6 @@ struct nouveau_bo {
 	unsigned mode;
 
 	struct nouveau_drm_tile *tile;
-
-	struct ttm_bo_kmap_obj dma_buf_vmap;
 };
 
 static inline struct nouveau_bo *
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index dd51cd0ae20c..787d05eefd9c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -24,6 +24,8 @@
  *
  */
 
+#include <drm/drm_gem_ttm_helper.h>
+
 #include "nouveau_drv.h"
 #include "nouveau_dma.h"
 #include "nouveau_fence.h"
@@ -176,8 +178,8 @@ const struct drm_gem_object_funcs nouveau_gem_object_funcs = {
 	.pin = nouveau_gem_prime_pin,
 	.unpin = nouveau_gem_prime_unpin,
 	.get_sg_table = nouveau_gem_prime_get_sg_table,
-	.vmap = nouveau_gem_prime_vmap,
-	.vunmap = nouveau_gem_prime_vunmap,
+	.vmap = drm_gem_ttm_vmap,
+	.vunmap = drm_gem_ttm_vunmap,
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.h b/drivers/gpu/drm/nouveau/nouveau_gem.h
index b35c180322e2..3b919c7c931c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.h
@@ -37,7 +37,5 @@ extern void nouveau_gem_prime_unpin(struct drm_gem_object *);
 extern struct sg_table *nouveau_gem_prime_get_sg_table(struct drm_gem_object *);
 extern struct drm_gem_object *nouveau_gem_prime_import_sg_table(
 	struct drm_device *, struct dma_buf_attachment *, struct sg_table *);
-extern void *nouveau_gem_prime_vmap(struct drm_gem_object *);
-extern void nouveau_gem_prime_vunmap(struct drm_gem_object *, void *);
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index a8264aebf3d4..2f16b5249283 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -35,26 +35,6 @@ struct sg_table *nouveau_gem_prime_get_sg_table(struct drm_gem_object *obj)
 	return drm_prime_pages_to_sg(obj->dev, nvbo->bo.ttm->pages, npages);
 }
 
-void *nouveau_gem_prime_vmap(struct drm_gem_object *obj)
-{
-	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
-	int ret;
-
-	ret = ttm_bo_kmap(&nvbo->bo, 0, nvbo->bo.num_pages,
-			  &nvbo->dma_buf_vmap);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return nvbo->dma_buf_vmap.virtual;
-}
-
-void nouveau_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
-{
-	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
-
-	ttm_bo_kunmap(&nvbo->dma_buf_vmap);
-}
-
 struct drm_gem_object *nouveau_gem_prime_import_sg_table(struct drm_device *dev,
 							 struct dma_buf_attachment *attach,
 							 struct sg_table *sg)
diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
index fdbc8d949135..5ab03d605f57 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -5,6 +5,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/panfrost_drm.h>
 #include <linux/completion.h>
+#include <linux/dma-buf-map.h>
 #include <linux/iopoll.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
@@ -72,6 +73,7 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 {
 	struct panfrost_file_priv *user = file_priv->driver_priv;
 	struct panfrost_perfcnt *perfcnt = pfdev->perfcnt;
+	struct dma_buf_map map;
 	struct drm_gem_shmem_object *bo;
 	u32 cfg, as;
 	int ret;
@@ -103,11 +105,10 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 		goto err_close_bo;
 	}
 
-	perfcnt->buf = drm_gem_shmem_vmap(&bo->base);
-	if (IS_ERR(perfcnt->buf)) {
-		ret = PTR_ERR(perfcnt->buf);
+	ret = drm_gem_shmem_vmap(&bo->base, &map);
+	if (ret)
 		goto err_put_mapping;
-	}
+	perfcnt->buf = map.vaddr;
 
 	/*
 	 * Invalidate the cache and clear the counters to start from a fresh
@@ -163,7 +164,7 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 	return 0;
 
 err_vunmap:
-	drm_gem_shmem_vunmap(&bo->base, perfcnt->buf);
+	drm_gem_shmem_vunmap(&bo->base, &map);
 err_put_mapping:
 	panfrost_gem_mapping_put(perfcnt->mapping);
 err_close_bo:
@@ -180,6 +181,7 @@ static int panfrost_perfcnt_disable_locked(struct panfrost_device *pfdev,
 {
 	struct panfrost_file_priv *user = file_priv->driver_priv;
 	struct panfrost_perfcnt *perfcnt = pfdev->perfcnt;
+	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(perfcnt->buf);
 
 	if (user != perfcnt->user)
 		return -EINVAL;
@@ -192,7 +194,7 @@ static int panfrost_perfcnt_disable_locked(struct panfrost_device *pfdev,
 		  GPU_PERFCNT_CFG_MODE(GPU_PERFCNT_CFG_MODE_OFF));
 
 	perfcnt->user = NULL;
-	drm_gem_shmem_vunmap(&perfcnt->mapping->obj->base.base, perfcnt->buf);
+	drm_gem_shmem_vunmap(&perfcnt->mapping->obj->base.base, &map);
 	perfcnt->buf = NULL;
 	panfrost_gem_close(&perfcnt->mapping->obj->base.base, file_priv);
 	panfrost_mmu_as_put(pfdev, perfcnt->mapping->mmu);
diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 45fd76e04bdc..b783c3abdfc9 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -25,6 +25,7 @@
 
 #include <linux/crc32.h>
 #include <linux/delay.h>
+#include <linux/dma-buf-map.h>
 
 #include <drm/drm_drv.h>
 #include <drm/drm_atomic.h>
@@ -581,6 +582,8 @@ static void qxl_cursor_atomic_update(struct drm_plane *plane,
 	struct drm_gem_object *obj;
 	struct qxl_bo *cursor_bo = NULL, *user_bo = NULL, *old_cursor_bo = NULL;
 	int ret;
+	struct dma_buf_map user_map;
+	struct dma_buf_map cursor_map;
 	void *user_ptr;
 	int size = 64*64*4;
 
@@ -595,9 +598,10 @@ static void qxl_cursor_atomic_update(struct drm_plane *plane,
 		user_bo = gem_to_qxl_bo(obj);
 
 		/* pinning is done in the prepare/cleanup framevbuffer */
-		ret = qxl_bo_kmap(user_bo, &user_ptr);
+		ret = qxl_bo_kmap(user_bo, &user_map);
 		if (ret)
 			goto out_free_release;
+		user_ptr = user_map.vaddr; /* TODO: Use mapping abstraction properly */
 
 		ret = qxl_alloc_bo_reserved(qdev, release,
 					    sizeof(struct qxl_cursor) + size,
@@ -613,9 +617,13 @@ static void qxl_cursor_atomic_update(struct drm_plane *plane,
 		if (ret)
 			goto out_unpin;
 
-		ret = qxl_bo_kmap(cursor_bo, (void **)&cursor);
+		ret = qxl_bo_kmap(cursor_bo, &cursor_map);
 		if (ret)
 			goto out_backoff;
+		if (cursor_map.is_iomem) /* TODO: Use mapping abstraction properly */
+			cursor = (struct qxl_cursor __force *)cursor_map.vaddr_iomem;
+		else
+			cursor = (struct qxl_cursor *)cursor_map.vaddr;
 
 		cursor->header.unique = 0;
 		cursor->header.type = SPICE_CURSOR_TYPE_ALPHA;
@@ -1133,6 +1141,7 @@ int qxl_create_monitors_object(struct qxl_device *qdev)
 {
 	int ret;
 	struct drm_gem_object *gobj;
+	struct dma_buf_map map;
 	int monitors_config_size = sizeof(struct qxl_monitors_config) +
 		qxl_num_crtc * sizeof(struct qxl_head);
 
@@ -1149,7 +1158,7 @@ int qxl_create_monitors_object(struct qxl_device *qdev)
 	if (ret)
 		return ret;
 
-	qxl_bo_kmap(qdev->monitors_config_bo, NULL);
+	qxl_bo_kmap(qdev->monitors_config_bo, &map);
 
 	qdev->monitors_config = qdev->monitors_config_bo->kptr;
 	qdev->ram_header->monitors_config =
diff --git a/drivers/gpu/drm/qxl/qxl_draw.c b/drivers/gpu/drm/qxl/qxl_draw.c
index 3599db096973..7b7acb910780 100644
--- a/drivers/gpu/drm/qxl/qxl_draw.c
+++ b/drivers/gpu/drm/qxl/qxl_draw.c
@@ -20,6 +20,8 @@
  * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/dma-buf-map.h>
+
 #include <drm/drm_fourcc.h>
 
 #include "qxl_drv.h"
@@ -42,13 +44,15 @@ static struct qxl_rect *drawable_set_clipping(struct qxl_device *qdev,
 					      unsigned int num_clips,
 					      struct qxl_bo *clips_bo)
 {
+	struct dma_buf_map map;
 	struct qxl_clip_rects *dev_clips;
 	int ret;
 
-	ret = qxl_bo_kmap(clips_bo, (void **)&dev_clips);
-	if (ret) {
+	ret = qxl_bo_kmap(clips_bo, &map);
+	if (ret)
 		return NULL;
-	}
+	dev_clips = map.vaddr; /* TODO: Use mapping abstraction properly */
+
 	dev_clips->num_rects = num_clips;
 	dev_clips->chunk.next_chunk = 0;
 	dev_clips->chunk.prev_chunk = 0;
@@ -142,6 +146,7 @@ void qxl_draw_dirty_fb(struct qxl_device *qdev,
 	int stride = fb->pitches[0];
 	/* depth is not actually interesting, we don't mask with it */
 	int depth = fb->format->cpp[0] * 8;
+	struct dma_buf_map surface_map;
 	uint8_t *surface_base;
 	struct qxl_release *release;
 	struct qxl_bo *clips_bo;
@@ -197,9 +202,10 @@ void qxl_draw_dirty_fb(struct qxl_device *qdev,
 	if (ret)
 		goto out_release_backoff;
 
-	ret = qxl_bo_kmap(bo, (void **)&surface_base);
+	ret = qxl_bo_kmap(bo, &surface_map);
 	if (ret)
 		goto out_release_backoff;
+	surface_base = surface_map.vaddr; /* TODO: Use mapping abstraction properly */
 
 	ret = qxl_image_init(qdev, release, dimage, surface_base,
 			     left - dumb_shadow_offset,
diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index 3602e8b34189..eb437fea5d9e 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -30,6 +30,7 @@
  * Definitions taken from spice-protocol, plus kernel driver specific bits.
  */
 
+#include <linux/dma-buf-map.h>
 #include <linux/dma-fence.h>
 #include <linux/firmware.h>
 #include <linux/platform_device.h>
@@ -50,6 +51,8 @@
 
 #include "qxl_dev.h"
 
+struct dma_buf_map;
+
 #define DRIVER_AUTHOR		"Dave Airlie"
 
 #define DRIVER_NAME		"qxl"
@@ -79,7 +82,7 @@ struct qxl_bo {
 	/* Protected by tbo.reserved */
 	struct ttm_place		placements[3];
 	struct ttm_placement		placement;
-	struct ttm_bo_kmap_obj		kmap;
+	struct dma_buf_map		map;
 	void				*kptr;
 	unsigned int                    map_count;
 	int                             type;
@@ -335,7 +338,6 @@ int qxl_gem_object_open(struct drm_gem_object *obj, struct drm_file *file_priv);
 void qxl_gem_object_close(struct drm_gem_object *obj,
 			  struct drm_file *file_priv);
 void qxl_bo_force_delete(struct qxl_device *qdev);
-int qxl_bo_kmap(struct qxl_bo *bo, void **ptr);
 
 /* qxl_dumb.c */
 int qxl_mode_dumb_create(struct drm_file *file_priv,
@@ -445,8 +447,9 @@ struct sg_table *qxl_gem_prime_get_sg_table(struct drm_gem_object *obj);
 struct drm_gem_object *qxl_gem_prime_import_sg_table(
 	struct drm_device *dev, struct dma_buf_attachment *attach,
 	struct sg_table *sgt);
-void *qxl_gem_prime_vmap(struct drm_gem_object *obj);
-void qxl_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
+int qxl_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
+void qxl_gem_prime_vunmap(struct drm_gem_object *obj,
+			  struct dma_buf_map *map);
 int qxl_gem_prime_mmap(struct drm_gem_object *obj,
 				struct vm_area_struct *vma);
 
diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index 547d46c14d56..ceebc5881f68 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -23,10 +23,12 @@
  *          Alon Levy
  */
 
+#include <linux/dma-buf-map.h>
+#include <linux/io-mapping.h>
+
 #include "qxl_drv.h"
 #include "qxl_object.h"
 
-#include <linux/io-mapping.h>
 static void qxl_ttm_bo_destroy(struct ttm_buffer_object *tbo)
 {
 	struct qxl_bo *bo;
@@ -152,24 +154,27 @@ int qxl_bo_create(struct qxl_device *qdev,
 	return 0;
 }
 
-int qxl_bo_kmap(struct qxl_bo *bo, void **ptr)
+int qxl_bo_kmap(struct qxl_bo *bo, struct dma_buf_map *map)
 {
-	bool is_iomem;
 	int r;
 
 	if (bo->kptr) {
-		if (ptr)
-			*ptr = bo->kptr;
 		bo->map_count++;
-		return 0;
+		goto out;
 	}
-	r = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.num_pages, &bo->kmap);
+	r = ttm_bo_vmap(&bo->tbo, &bo->map);
 	if (r)
 		return r;
-	bo->kptr = ttm_kmap_obj_virtual(&bo->kmap, &is_iomem);
-	if (ptr)
-		*ptr = bo->kptr;
 	bo->map_count = 1;
+
+	/* TODO: Remove kptr in favor of map everywhere. */
+	if (bo->map.is_iomem)
+		bo->kptr = (void *)bo->map.vaddr_iomem;
+	else
+		bo->kptr = bo->map.vaddr;
+
+out:
+	*map = bo->map;
 	return 0;
 }
 
@@ -180,6 +185,7 @@ void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev,
 	void *rptr;
 	int ret;
 	struct io_mapping *map;
+	struct dma_buf_map bo_map;
 
 	if (bo->tbo.mem.mem_type == TTM_PL_VRAM)
 		map = qdev->vram_mapping;
@@ -196,9 +202,10 @@ void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev,
 		return rptr;
 	}
 
-	ret = qxl_bo_kmap(bo, &rptr);
+	ret = qxl_bo_kmap(bo, &bo_map);
 	if (ret)
 		return NULL;
+	rptr = bo_map.vaddr; /* TODO: Use mapping abstraction properly */
 
 	rptr += page_offset * PAGE_SIZE;
 	return rptr;
@@ -212,7 +219,7 @@ void qxl_bo_kunmap(struct qxl_bo *bo)
 	if (bo->map_count > 0)
 		return;
 	bo->kptr = NULL;
-	ttm_bo_kunmap(&bo->kmap);
+	ttm_bo_vunmap(&bo->tbo, &bo->map);
 }
 
 void qxl_bo_kunmap_atomic_page(struct qxl_device *qdev,
diff --git a/drivers/gpu/drm/qxl/qxl_object.h b/drivers/gpu/drm/qxl/qxl_object.h
index 09a5c818324d..ebf24c9d2bf2 100644
--- a/drivers/gpu/drm/qxl/qxl_object.h
+++ b/drivers/gpu/drm/qxl/qxl_object.h
@@ -63,7 +63,7 @@ extern int qxl_bo_create(struct qxl_device *qdev,
 			 bool kernel, bool pinned, u32 domain,
 			 struct qxl_surface *surf,
 			 struct qxl_bo **bo_ptr);
-extern int qxl_bo_kmap(struct qxl_bo *bo, void **ptr);
+extern int qxl_bo_kmap(struct qxl_bo *bo, struct dma_buf_map *map);
 extern void qxl_bo_kunmap(struct qxl_bo *bo);
 void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev, struct qxl_bo *bo, int page_offset);
 void qxl_bo_kunmap_atomic_page(struct qxl_device *qdev, struct qxl_bo *bo, void *map);
diff --git a/drivers/gpu/drm/qxl/qxl_prime.c b/drivers/gpu/drm/qxl/qxl_prime.c
index 7d3816fca5a8..4aa949799446 100644
--- a/drivers/gpu/drm/qxl/qxl_prime.c
+++ b/drivers/gpu/drm/qxl/qxl_prime.c
@@ -54,20 +54,20 @@ struct drm_gem_object *qxl_gem_prime_import_sg_table(
 	return ERR_PTR(-ENOSYS);
 }
 
-void *qxl_gem_prime_vmap(struct drm_gem_object *obj)
+int qxl_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 {
 	struct qxl_bo *bo = gem_to_qxl_bo(obj);
-	void *ptr;
 	int ret;
 
-	ret = qxl_bo_kmap(bo, &ptr);
+	ret = qxl_bo_kmap(bo, map);
 	if (ret < 0)
-		return ERR_PTR(ret);
+		return ret;
 
-	return ptr;
+	return 0;
 }
 
-void qxl_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
+void qxl_gem_prime_vunmap(struct drm_gem_object *obj,
+			  struct dma_buf_map *map)
 {
 	struct qxl_bo *bo = gem_to_qxl_bo(obj);
 
diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 5d54bccebd4d..44cb5ee6fc20 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -509,7 +509,6 @@ struct radeon_bo {
 	/* Constant after initialization */
 	struct radeon_device		*rdev;
 
-	struct ttm_bo_kmap_obj		dma_buf_vmap;
 	pid_t				pid;
 
 #ifdef CONFIG_MMU_NOTIFIER
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 0ccd7213e41f..d2876ce3bc9e 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -31,6 +31,7 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
+#include <drm/drm_gem_ttm_helper.h>
 #include <drm/radeon_drm.h>
 
 #include "radeon.h"
@@ -40,8 +41,6 @@ struct dma_buf *radeon_gem_prime_export(struct drm_gem_object *gobj,
 struct sg_table *radeon_gem_prime_get_sg_table(struct drm_gem_object *obj);
 int radeon_gem_prime_pin(struct drm_gem_object *obj);
 void radeon_gem_prime_unpin(struct drm_gem_object *obj);
-void *radeon_gem_prime_vmap(struct drm_gem_object *obj);
-void radeon_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
 
 static const struct drm_gem_object_funcs radeon_gem_object_funcs;
 
@@ -235,8 +234,8 @@ static const struct drm_gem_object_funcs radeon_gem_object_funcs = {
 	.pin = radeon_gem_prime_pin,
 	.unpin = radeon_gem_prime_unpin,
 	.get_sg_table = radeon_gem_prime_get_sg_table,
-	.vmap = radeon_gem_prime_vmap,
-	.vunmap = radeon_gem_prime_vunmap,
+	.vmap = drm_gem_ttm_vmap,
+	.vunmap = drm_gem_ttm_vunmap,
 };
 
 /*
diff --git a/drivers/gpu/drm/radeon/radeon_prime.c b/drivers/gpu/drm/radeon/radeon_prime.c
index b9de0e51c0be..088d39a51c0d 100644
--- a/drivers/gpu/drm/radeon/radeon_prime.c
+++ b/drivers/gpu/drm/radeon/radeon_prime.c
@@ -39,26 +39,6 @@ struct sg_table *radeon_gem_prime_get_sg_table(struct drm_gem_object *obj)
 	return drm_prime_pages_to_sg(obj->dev, bo->tbo.ttm->pages, npages);
 }
 
-void *radeon_gem_prime_vmap(struct drm_gem_object *obj)
-{
-	struct radeon_bo *bo = gem_to_radeon_bo(obj);
-	int ret;
-
-	ret = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.num_pages,
-			  &bo->dma_buf_vmap);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return bo->dma_buf_vmap.virtual;
-}
-
-void radeon_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
-{
-	struct radeon_bo *bo = gem_to_radeon_bo(obj);
-
-	ttm_bo_kunmap(&bo->dma_buf_vmap);
-}
-
 struct drm_gem_object *radeon_gem_prime_import_sg_table(struct drm_device *dev,
 							struct dma_buf_attachment *attach,
 							struct sg_table *sg)
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index 7d5ebb10323b..7971f57436dd 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -532,26 +532,32 @@ rockchip_gem_prime_import_sg_table(struct drm_device *drm,
 	return ERR_PTR(ret);
 }
 
-void *rockchip_gem_prime_vmap(struct drm_gem_object *obj)
+int rockchip_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 {
 	struct rockchip_gem_object *rk_obj = to_rockchip_obj(obj);
 
-	if (rk_obj->pages)
-		return vmap(rk_obj->pages, rk_obj->num_pages, VM_MAP,
-			    pgprot_writecombine(PAGE_KERNEL));
+	if (rk_obj->pages) {
+		void *vaddr = vmap(rk_obj->pages, rk_obj->num_pages, VM_MAP,
+				  pgprot_writecombine(PAGE_KERNEL));
+		if (!vaddr)
+			return -ENOMEM;
+		dma_buf_map_set_vaddr(map, vaddr);
+		return 0;
+	}
 
 	if (rk_obj->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING)
-		return NULL;
+		return -ENOMEM;
+	dma_buf_map_set_vaddr(map, rk_obj->kvaddr);
 
-	return rk_obj->kvaddr;
+	return 0;
 }
 
-void rockchip_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
+void rockchip_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 {
 	struct rockchip_gem_object *rk_obj = to_rockchip_obj(obj);
 
 	if (rk_obj->pages) {
-		vunmap(vaddr);
+		vunmap(map->vaddr);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.h b/drivers/gpu/drm/rockchip/rockchip_drm_gem.h
index 7ffc541bea07..5a70a56cd406 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.h
@@ -31,8 +31,8 @@ struct drm_gem_object *
 rockchip_gem_prime_import_sg_table(struct drm_device *dev,
 				   struct dma_buf_attachment *attach,
 				   struct sg_table *sg);
-void *rockchip_gem_prime_vmap(struct drm_gem_object *obj);
-void rockchip_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
+int rockchip_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
+void rockchip_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
 
 /* drm driver mmap file operations */
 int rockchip_gem_mmap(struct file *filp, struct vm_area_struct *vma);
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 744a8e337e41..c02e35ed6e76 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -17,6 +17,7 @@
  */
 
 #include <linux/console.h>
+#include <linux/dma-buf-map.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 
@@ -314,6 +315,7 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 			       struct drm_rect *rect)
 {
 	struct cirrus_device *cirrus = to_cirrus(fb->dev);
+	struct dma_buf_map map;
 	void *vmap;
 	int idx, ret;
 
@@ -321,10 +323,10 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 	if (!drm_dev_enter(&cirrus->dev, &idx))
 		goto out;
 
-	ret = -ENOMEM;
-	vmap = drm_gem_shmem_vmap(fb->obj[0]);
-	if (!vmap)
+	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
+	if (ret)
 		goto out_dev_exit;
+	vmap = map.vaddr; /* TODO: Use mapping abstraction properly */
 
 	if (cirrus->cpp == fb->format->cpp[0])
 		drm_fb_memcpy_dstclip(cirrus->vram,
@@ -343,7 +345,7 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 	else
 		WARN_ON_ONCE("cpp mismatch");
 
-	drm_gem_shmem_vunmap(fb->obj[0], vmap);
+	drm_gem_shmem_vunmap(fb->obj[0], &map);
 	ret = 0;
 
 out_dev_exit:
diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index cc397671f689..12a890cea6e9 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -248,6 +248,7 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
 {
 	int block, dst_offset, len, remain, ret, x1, x2, y1, y2;
 	struct drm_framebuffer *fb;
+	struct dma_buf_map map;
 	void *vaddr;
 	u8 *src;
 
@@ -262,11 +263,12 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
 	y1 = gm12u320->fb_update.rect.y1;
 	y2 = gm12u320->fb_update.rect.y2;
 
-	vaddr = drm_gem_shmem_vmap(fb->obj[0]);
-	if (IS_ERR(vaddr)) {
-		GM12U320_ERR("failed to vmap fb: %ld\n", PTR_ERR(vaddr));
+	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
+	if (ret) {
+		GM12U320_ERR("failed to vmap fb: %d\n", ret);
 		goto put_fb;
 	}
+	vaddr = map.vaddr; /* TODO: Use mapping abstraction properly */
 
 	if (fb->obj[0]->import_attach) {
 		ret = dma_buf_begin_cpu_access(
@@ -318,7 +320,7 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
 			GM12U320_ERR("dma_buf_end_cpu_access err: %d\n", ret);
 	}
 vunmap:
-	drm_gem_shmem_vunmap(fb->obj[0], vaddr);
+	drm_gem_shmem_vunmap(fb->obj[0], &map);
 put_fb:
 	drm_framebuffer_put(fb);
 	gm12u320->fb_update.fb = NULL;
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index fef43f4e3bac..42eeba1dfdbf 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -276,6 +276,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
 	struct urb *urb;
 	struct drm_rect clip;
 	int log_bpp;
+	struct dma_buf_map map;
 	void *vaddr;
 
 	ret = udl_log_cpp(fb->format->cpp[0]);
@@ -296,11 +297,12 @@ static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
 			return ret;
 	}
 
-	vaddr = drm_gem_shmem_vmap(fb->obj[0]);
-	if (IS_ERR(vaddr)) {
+	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
+	if (ret) {
 		DRM_ERROR("failed to vmap fb\n");
 		goto out_dma_buf_end_cpu_access;
 	}
+	vaddr = map.vaddr; /* TODO: Use mapping abstraction properly */
 
 	urb = udl_get_urb(dev);
 	if (!urb)
@@ -333,7 +335,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
 	ret = 0;
 
 out_drm_gem_shmem_vunmap:
-	drm_gem_shmem_vunmap(fb->obj[0], vaddr);
+	drm_gem_shmem_vunmap(fb->obj[0], &map);
 out_dma_buf_end_cpu_access:
 	if (import_attach) {
 		tmp_ret = dma_buf_end_cpu_access(import_attach->dmabuf,
diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index 931c55126148..f268fb258c83 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -9,6 +9,8 @@
  *          Michael Thayer <michael.thayer@oracle.com,
  *          Hans de Goede <hdegoede@redhat.com>
  */
+
+#include <linux/dma-buf-map.h>
 #include <linux/export.h>
 
 #include <drm/drm_atomic.h>
@@ -384,6 +386,8 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 	u32 height = plane->state->crtc_h;
 	size_t data_size, mask_size;
 	u32 flags;
+	struct dma_buf_map map;
+	int ret;
 	u8 *src;
 
 	/*
@@ -397,8 +401,8 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 
 	vbox_crtc->cursor_enabled = true;
 
-	src = drm_gem_vram_vmap(gbo);
-	if (IS_ERR(src)) {
+	ret = drm_gem_vram_vmap(gbo, &map);
+	if (ret) {
 		/*
 		 * BUG: we should have pinned the BO in prepare_fb().
 		 */
@@ -406,6 +410,7 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 		DRM_WARN("Could not map cursor bo, skipping update\n");
 		return;
 	}
+	src = map.vaddr; /* TODO: Use mapping abstraction properly */
 
 	/*
 	 * The mask must be calculated based on the alpha
@@ -416,7 +421,7 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 	data_size = width * height * 4 + mask_size;
 
 	copy_cursor_image(src, vbox->cursor_data, width, height, mask_size);
-	drm_gem_vram_vunmap(gbo, src);
+	drm_gem_vram_vunmap(gbo, &map);
 
 	flags = VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
 		VBOX_MOUSE_POINTER_ALPHA;
diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 557f0d1e6437..f290a9a942dc 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -785,16 +785,16 @@ int vc4_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 	return drm_gem_cma_prime_mmap(obj, vma);
 }
 
-void *vc4_prime_vmap(struct drm_gem_object *obj)
+int vc4_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 {
 	struct vc4_bo *bo = to_vc4_bo(obj);
 
 	if (bo->validated_shader) {
 		DRM_DEBUG("mmaping of shader BOs not allowed.\n");
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	}
 
-	return drm_gem_cma_prime_vmap(obj);
+	return drm_gem_cma_prime_vmap(obj, map);
 }
 
 struct drm_gem_object *
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 7003e7f14a48..b4409ead8f55 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -806,7 +806,7 @@ int vc4_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 struct drm_gem_object *vc4_prime_import_sg_table(struct drm_device *dev,
 						 struct dma_buf_attachment *attach,
 						 struct sg_table *sgt);
-void *vc4_prime_vmap(struct drm_gem_object *obj);
+int vc4_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
 int vc4_bo_cache_init(struct drm_device *dev);
 void vc4_bo_cache_destroy(struct drm_device *dev);
 int vc4_bo_inc_usecnt(struct vc4_bo *bo);
diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index fa54a6d1403d..b2aa26e1e4a2 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -361,24 +361,30 @@ static struct drm_gem_object *vgem_prime_import_sg_table(struct drm_device *dev,
 	return &obj->base;
 }
 
-static void *vgem_prime_vmap(struct drm_gem_object *obj)
+static int vgem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 {
 	struct drm_vgem_gem_object *bo = to_vgem_bo(obj);
 	long n_pages = obj->size >> PAGE_SHIFT;
 	struct page **pages;
+	void *vaddr;
 
 	pages = vgem_pin_pages(bo);
 	if (IS_ERR(pages))
-		return NULL;
+		return PTR_ERR(pages);
+
+	vaddr = vmap(pages, n_pages, 0, pgprot_writecombine(PAGE_KERNEL));
+	if (!vaddr)
+		return -ENOMEM;
+	dma_buf_map_set_vaddr(map, vaddr);
 
-	return vmap(pages, n_pages, 0, pgprot_writecombine(PAGE_KERNEL));
+	return 0;
 }
 
-static void vgem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
+static void vgem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 {
 	struct drm_vgem_gem_object *bo = to_vgem_bo(obj);
 
-	vunmap(vaddr);
+	vunmap(map->vaddr);
 	vgem_unpin_pages(bo);
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 9890137bcb8d..0824327cc860 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#include <linux/dma-buf-map.h>
+
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
@@ -146,15 +148,16 @@ static int vkms_prepare_fb(struct drm_plane *plane,
 			   struct drm_plane_state *state)
 {
 	struct drm_gem_object *gem_obj;
-	void *vaddr;
+	struct dma_buf_map map;
+	int ret;
 
 	if (!state->fb)
 		return 0;
 
 	gem_obj = drm_gem_fb_get_obj(state->fb, 0);
-	vaddr = drm_gem_shmem_vmap(gem_obj);
-	if (IS_ERR(vaddr))
-		DRM_ERROR("vmap failed: %li\n", PTR_ERR(vaddr));
+	ret = drm_gem_shmem_vmap(gem_obj, &map);
+	if (ret)
+		DRM_ERROR("vmap failed: %d\n", ret);
 
 	return drm_gem_fb_prepare_fb(plane, state);
 }
@@ -164,13 +167,15 @@ static void vkms_cleanup_fb(struct drm_plane *plane,
 {
 	struct drm_gem_object *gem_obj;
 	struct drm_gem_shmem_object *shmem_obj;
+	struct dma_buf_map map;
 
 	if (!old_state->fb)
 		return;
 
 	gem_obj = drm_gem_fb_get_obj(old_state->fb, 0);
 	shmem_obj = to_drm_gem_shmem_obj(drm_gem_fb_get_obj(old_state->fb, 0));
-	drm_gem_shmem_vunmap(gem_obj, shmem_obj->vaddr);
+	dma_buf_map_set_vaddr(&map, shmem_obj->vaddr);
+	drm_gem_shmem_vunmap(gem_obj, &map);
 }
 
 static const struct drm_plane_helper_funcs vkms_primary_helper_funcs = {
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 26b903926872..67f80ab1e85f 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
-#include "vkms_drv.h"
+#include <linux/dma-buf-map.h>
+
 #include <drm/drm_fourcc.h>
 #include <drm/drm_writeback.h>
 #include <drm/drm_probe_helper.h>
@@ -8,6 +9,8 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 
+#include "vkms_drv.h"
+
 static const u32 vkms_wb_formats[] = {
 	DRM_FORMAT_XRGB8888,
 };
@@ -65,19 +68,20 @@ static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_connector,
 			       struct drm_writeback_job *job)
 {
 	struct drm_gem_object *gem_obj;
-	void *vaddr;
+	struct dma_buf_map map;
+	int ret;
 
 	if (!job->fb)
 		return 0;
 
 	gem_obj = drm_gem_fb_get_obj(job->fb, 0);
-	vaddr = drm_gem_shmem_vmap(gem_obj);
-	if (IS_ERR(vaddr)) {
-		DRM_ERROR("vmap failed: %li\n", PTR_ERR(vaddr));
-		return PTR_ERR(vaddr);
+	ret = drm_gem_shmem_vmap(gem_obj, &map);
+	if (ret) {
+		DRM_ERROR("vmap failed: %d\n", ret);
+		return ret;
 	}
 
-	job->priv = vaddr;
+	job->priv = map.vaddr;
 
 	return 0;
 }
@@ -87,12 +91,14 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 {
 	struct drm_gem_object *gem_obj;
 	struct vkms_device *vkmsdev;
+	struct dma_buf_map map;
 
 	if (!job->fb)
 		return;
 
 	gem_obj = drm_gem_fb_get_obj(job->fb, 0);
-	drm_gem_shmem_vunmap(gem_obj, job->priv);
+	dma_buf_map_set_vaddr(&map, job->priv);
+	drm_gem_shmem_vunmap(gem_obj, &map);
 
 	vkmsdev = drm_device_to_vkms_device(gem_obj->dev);
 	vkms_set_composer(&vkmsdev->output, false);
diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index 4f34ef34ba60..74db5a840bed 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -290,22 +290,28 @@ int xen_drm_front_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 	return gem_mmap_obj(xen_obj, vma);
 }
 
-void *xen_drm_front_gem_prime_vmap(struct drm_gem_object *gem_obj)
+int xen_drm_front_gem_prime_vmap(struct drm_gem_object *gem_obj, struct dma_buf_map *map)
 {
 	struct xen_gem_object *xen_obj = to_xen_gem_obj(gem_obj);
+	void *vaddr;
 
 	if (!xen_obj->pages)
-		return NULL;
+		return -ENOMEM;
 
 	/* Please see comment in gem_mmap_obj on mapping and attributes. */
-	return vmap(xen_obj->pages, xen_obj->num_pages,
-		    VM_MAP, PAGE_KERNEL);
+	vaddr = vmap(xen_obj->pages, xen_obj->num_pages,
+		     VM_MAP, PAGE_KERNEL);
+	if (!vaddr)
+		return -ENOMEM;
+	dma_buf_map_set_vaddr(map, vaddr);
+
+	return 0;
 }
 
 void xen_drm_front_gem_prime_vunmap(struct drm_gem_object *gem_obj,
-				    void *vaddr)
+				    struct dma_buf_map *map)
 {
-	vunmap(vaddr);
+	vunmap(map->vaddr);
 }
 
 int xen_drm_front_gem_prime_mmap(struct drm_gem_object *gem_obj,
diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.h b/drivers/gpu/drm/xen/xen_drm_front_gem.h
index a39675fa31b2..a4e67d0a149c 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.h
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.h
@@ -12,6 +12,7 @@
 #define __XEN_DRM_FRONT_GEM_H
 
 struct dma_buf_attachment;
+struct dma_buf_map;
 struct drm_device;
 struct drm_gem_object;
 struct file;
@@ -34,10 +35,11 @@ void xen_drm_front_gem_free_object_unlocked(struct drm_gem_object *gem_obj);
 
 int xen_drm_front_gem_mmap(struct file *filp, struct vm_area_struct *vma);
 
-void *xen_drm_front_gem_prime_vmap(struct drm_gem_object *gem_obj);
+int xen_drm_front_gem_prime_vmap(struct drm_gem_object *gem_obj,
+				 struct dma_buf_map *map);
 
 void xen_drm_front_gem_prime_vunmap(struct drm_gem_object *gem_obj,
-				    void *vaddr);
+				    struct dma_buf_map *map);
 
 int xen_drm_front_gem_prime_mmap(struct drm_gem_object *gem_obj,
 				 struct vm_area_struct *vma);
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index c38dd35da00b..5e6daa1c982f 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -39,6 +39,7 @@
 
 #include <drm/drm_vma_manager.h>
 
+struct dma_buf_map;
 struct drm_gem_object;
 
 /**
@@ -138,7 +139,7 @@ struct drm_gem_object_funcs {
 	 *
 	 * This callback is optional.
 	 */
-	void *(*vmap)(struct drm_gem_object *obj);
+	int (*vmap)(struct drm_gem_object *obj, struct dma_buf_map *map);
 
 	/**
 	 * @vunmap:
@@ -148,7 +149,7 @@ struct drm_gem_object_funcs {
 	 *
 	 * This callback is optional.
 	 */
-	void (*vunmap)(struct drm_gem_object *obj, void *vaddr);
+	void (*vunmap)(struct drm_gem_object *obj, struct dma_buf_map *map);
 
 	/**
 	 * @mmap:
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index a064b0d1c480..caf98b9cf4b4 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -103,7 +103,7 @@ drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
 				  struct sg_table *sgt);
 int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
 			   struct vm_area_struct *vma);
-void *drm_gem_cma_prime_vmap(struct drm_gem_object *obj);
+int drm_gem_cma_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
 
 struct drm_gem_object *
 drm_gem_cma_create_object_default_funcs(struct drm_device *dev, size_t size);
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 5381f0c8cf6f..3449a0353fe0 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -113,8 +113,8 @@ int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);
 int drm_gem_shmem_pin(struct drm_gem_object *obj);
 void drm_gem_shmem_unpin(struct drm_gem_object *obj);
-void *drm_gem_shmem_vmap(struct drm_gem_object *obj);
-void drm_gem_shmem_vunmap(struct drm_gem_object *obj, void *vaddr);
+int drm_gem_shmem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
+void drm_gem_shmem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
 
 int drm_gem_shmem_madvise(struct drm_gem_object *obj, int madv);
 
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 128f88174d32..c0d28ba0f5c9 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -10,6 +10,7 @@
 #include <drm/ttm/ttm_bo_api.h>
 #include <drm/ttm/ttm_bo_driver.h>
 
+#include <linux/dma-buf-map.h>
 #include <linux/kernel.h> /* for container_of() */
 
 struct drm_mode_create_dumb;
@@ -29,9 +30,8 @@ struct vm_area_struct;
 
 /**
  * struct drm_gem_vram_object - GEM object backed by VRAM
- * @gem:	GEM object
  * @bo:		TTM buffer object
- * @kmap:	Mapping information for @bo
+ * @map:	Mapping information for @bo
  * @placement:	TTM placement information. Supported placements are \
 	%TTM_PL_VRAM and %TTM_PL_SYSTEM
  * @placements:	TTM placement information.
@@ -50,15 +50,15 @@ struct vm_area_struct;
  */
 struct drm_gem_vram_object {
 	struct ttm_buffer_object bo;
-	struct ttm_bo_kmap_obj kmap;
+	struct dma_buf_map map;
 
 	/**
-	 * @kmap_use_count:
+	 * @vmap_use_count:
 	 *
 	 * Reference count on the virtual address.
 	 * The address are un-mapped when the count reaches zero.
 	 */
-	unsigned int kmap_use_count;
+	unsigned int vmap_use_count;
 
 	/* Supported placements are %TTM_PL_VRAM and %TTM_PL_SYSTEM */
 	struct ttm_placement placement;
@@ -97,8 +97,8 @@ u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo);
 s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo);
 int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag);
 int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo);
-void *drm_gem_vram_vmap(struct drm_gem_vram_object *gbo);
-void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, void *vaddr);
+int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
+void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
 
 int drm_gem_vram_fill_create_dumb(struct drm_file *file,
 				  struct drm_device *dev,
-- 
2.29.0

