Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D58082689F8
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 13:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgINLZx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 07:25:53 -0400
Received: from mx2.suse.de ([195.135.220.15]:42978 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726056AbgINLZ2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 07:25:28 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 0F1D1B11D;
        Mon, 14 Sep 2020 11:25:41 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     sumit.semwal@linaro.org, christian.koenig@amd.com, daniel@ffwll.ch,
        airlied@linux.ie, sam@ravnborg.org, mark.cave-ayland@ilande.co.uk,
        kraxel@redhat.com, davem@davemloft.net,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
        christian.gmeiner@gmail.com, jani.nikula@linux.intel.com,
        joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com, pawel@osciak.com,
        m.szyprowski@samsung.com, kyungmin.park@samsung.com,
        tfiga@chromium.org, mchehab@kernel.org, chris@chris-wilson.co.uk,
        matthew.auld@intel.com, thomas.hellstrom@intel.com
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, etnaviv@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        sparclinux@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/3] dma-buf: Use struct dma_buf_map in dma_buf_vmap() interfaces
Date:   Mon, 14 Sep 2020 13:25:20 +0200
Message-Id: <20200914112521.1327-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200914112521.1327-1-tzimmermann@suse.de>
References: <20200914112521.1327-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch updates dma_buf_vmap() and dma-buf's vmap callback to use
struct dma_buf_map.

The interfaces used to return a buffer address. This address now gets
stored in an instance of the structure that is given as an additional
argument. The functions return an errno code on errors.

Users of the functions are updated accordingly. This is only an interface
change. It is currently expected that dma-buf memory can be accessed with
system memory load/store operations.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/dma-buf/dma-buf.c                     | 26 ++++++++++---------
 drivers/gpu/drm/drm_gem_cma_helper.c          | 13 +++++-----
 drivers/gpu/drm/drm_gem_shmem_helper.c        | 14 ++++++----
 drivers/gpu/drm/drm_prime.c                   |  8 +++---
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  8 +++++-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    | 11 ++++++--
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  | 12 ++++++---
 drivers/gpu/drm/tegra/gem.c                   | 18 ++++++++-----
 .../common/videobuf2/videobuf2-dma-contig.c   | 14 +++++++---
 .../media/common/videobuf2/videobuf2-dma-sg.c | 16 ++++++++----
 .../common/videobuf2/videobuf2-vmalloc.c      | 15 ++++++++---
 include/drm/drm_prime.h                       |  3 ++-
 include/linux/dma-buf-map.h                   | 13 ++++++++++
 include/linux/dma-buf.h                       |  6 ++---
 14 files changed, 122 insertions(+), 55 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 5e849ca241a0..c99e3577aa2f 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1186,46 +1186,48 @@ EXPORT_SYMBOL_GPL(dma_buf_mmap);
  * dma_buf_vmap - Create virtual mapping for the buffer object into kernel
  * address space. Same restrictions as for vmap and friends apply.
  * @dmabuf:	[in]	buffer to vmap
+ * @map:	[out]	returns the vmap pointer
  *
  * This call may fail due to lack of virtual mapping address space.
  * These calls are optional in drivers. The intended use for them
  * is for mapping objects linear in kernel space for high use objects.
  * Please attempt to use kmap/kunmap before thinking about these interfaces.
  *
- * Returns NULL on error.
+ * Returns 0 on success, or a negative errno code otherwise.
  */
-void *dma_buf_vmap(struct dma_buf *dmabuf)
+int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
 {
-	void *ptr;
+	struct dma_buf_map ptr;
+	int ret = 0;
 
 	if (WARN_ON(!dmabuf))
-		return NULL;
+		return -EINVAL;
 
 	if (!dmabuf->ops->vmap)
-		return NULL;
+		return -EINVAL;
 
 	mutex_lock(&dmabuf->lock);
 	if (dmabuf->vmapping_counter) {
 		dmabuf->vmapping_counter++;
 		BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
-		ptr = dmabuf->vmap_ptr.vaddr;
+		*map = dmabuf->vmap_ptr;
 		goto out_unlock;
 	}
 
 	BUG_ON(dma_buf_map_is_set(&dmabuf->vmap_ptr));
 
-	ptr = dmabuf->ops->vmap(dmabuf);
-	if (WARN_ON_ONCE(IS_ERR(ptr)))
-		ptr = NULL;
-	if (!ptr)
+	ret = dmabuf->ops->vmap(dmabuf, &ptr);
+	if (WARN_ON_ONCE(ret))
 		goto out_unlock;
 
-	dmabuf->vmap_ptr.vaddr = ptr;
+	dmabuf->vmap_ptr = ptr;
 	dmabuf->vmapping_counter = 1;
 
+	*map = dmabuf->vmap_ptr;
+
 out_unlock:
 	mutex_unlock(&dmabuf->lock);
-	return ptr;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(dma_buf_vmap);
 
diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 822edeadbab3..062315c25c12 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -634,22 +634,23 @@ drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *dev,
 {
 	struct drm_gem_cma_object *cma_obj;
 	struct drm_gem_object *obj;
-	void *vaddr;
+	struct dma_buf_map map;
+	int ret;
 
-	vaddr = dma_buf_vmap(attach->dmabuf);
-	if (!vaddr) {
+	ret = dma_buf_vmap(attach->dmabuf, &map);
+	if (ret) {
 		DRM_ERROR("Failed to vmap PRIME buffer\n");
-		return ERR_PTR(-ENOMEM);
+		return ERR_PTR(ret);
 	}
 
 	obj = drm_gem_cma_prime_import_sg_table(dev, attach, sgt);
 	if (IS_ERR(obj)) {
-		dma_buf_vunmap(attach->dmabuf, vaddr);
+		dma_buf_vunmap(attach->dmabuf, map.vaddr);
 		return obj;
 	}
 
 	cma_obj = to_drm_gem_cma_obj(obj);
-	cma_obj->vaddr = vaddr;
+	cma_obj->vaddr = map.vaddr;
 
 	return obj;
 }
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 0a952f27c184..ad10a57cfece 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -261,13 +261,16 @@ EXPORT_SYMBOL(drm_gem_shmem_unpin);
 static void *drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
-	int ret;
+	struct dma_buf_map map;
+	int ret = 0;
 
 	if (shmem->vmap_use_count++ > 0)
 		return shmem->vaddr;
 
 	if (obj->import_attach) {
-		shmem->vaddr = dma_buf_vmap(obj->import_attach->dmabuf);
+		ret = dma_buf_vmap(obj->import_attach->dmabuf, &map);
+		if (!ret)
+			shmem->vaddr = map.vaddr;
 	} else {
 		pgprot_t prot = PAGE_KERNEL;
 
@@ -279,11 +282,12 @@ static void *drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem)
 			prot = pgprot_writecombine(prot);
 		shmem->vaddr = vmap(shmem->pages, obj->size >> PAGE_SHIFT,
 				    VM_MAP, prot);
+		if (!shmem->vaddr)
+			ret = -ENOMEM;
 	}
 
-	if (!shmem->vaddr) {
-		DRM_DEBUG_KMS("Failed to vmap pages\n");
-		ret = -ENOMEM;
+	if (ret) {
+		DRM_DEBUG_KMS("Failed to vmap pages, error %d\n", ret);
 		goto err_put_pages;
 	}
 
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 8a6a3c99b7d8..1b7d86c7842d 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -668,16 +668,18 @@ EXPORT_SYMBOL(drm_gem_unmap_dma_buf);
  *
  * Returns the kernel virtual address or NULL on failure.
  */
-void *drm_gem_dmabuf_vmap(struct dma_buf *dma_buf)
+int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
 {
 	struct drm_gem_object *obj = dma_buf->priv;
 	void *vaddr;
 
 	vaddr = drm_gem_vmap(obj);
 	if (IS_ERR(vaddr))
-		vaddr = NULL;
+		return PTR_ERR(vaddr);
 
-	return vaddr;
+	dma_buf_map_set_vaddr(map, vaddr);
+
+	return 0;
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_vmap);
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index 4aa3426a9ba4..80a9fc143bbb 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -85,9 +85,15 @@ static void etnaviv_gem_prime_release(struct etnaviv_gem_object *etnaviv_obj)
 
 static void *etnaviv_gem_prime_vmap_impl(struct etnaviv_gem_object *etnaviv_obj)
 {
+	struct dma_buf_map map;
+	int ret;
+
 	lockdep_assert_held(&etnaviv_obj->lock);
 
-	return dma_buf_vmap(etnaviv_obj->base.import_attach->dmabuf);
+	ret = dma_buf_vmap(etnaviv_obj->base.import_attach->dmabuf, &map);
+	if (ret)
+		return NULL;
+	return map.vaddr;
 }
 
 static int etnaviv_gem_prime_mmap_obj(struct etnaviv_gem_object *etnaviv_obj,
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 27fddc22a7c6..77b363d3000b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -82,11 +82,18 @@ static void i915_gem_unmap_dma_buf(struct dma_buf_attachment *attachment,
 	i915_gem_object_unpin_pages(obj);
 }
 
-static void *i915_gem_dmabuf_vmap(struct dma_buf *dma_buf)
+static int i915_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
 {
 	struct drm_i915_gem_object *obj = dma_buf_to_obj(dma_buf);
+	void *vaddr;
 
-	return i915_gem_object_pin_map(obj, I915_MAP_WB);
+	vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
+	if (IS_ERR(vaddr))
+		return PTR_ERR(vaddr);
+
+	dma_buf_map_set_vaddr(map, vaddr);
+
+	return 0;
 }
 
 static void i915_gem_dmabuf_vunmap(struct dma_buf *dma_buf, void *vaddr)
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index 2a52b92586b9..f79ebc5329b7 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -82,6 +82,7 @@ static int igt_dmabuf_import(void *arg)
 	struct drm_i915_gem_object *obj;
 	struct dma_buf *dmabuf;
 	void *obj_map, *dma_map;
+	struct dma_buf_map map;
 	u32 pattern[] = { 0, 0xaa, 0xcc, 0x55, 0xff };
 	int err, i;
 
@@ -110,7 +111,8 @@ static int igt_dmabuf_import(void *arg)
 		goto out_obj;
 	}
 
-	dma_map = dma_buf_vmap(dmabuf);
+	err = dma_buf_vmap(dmabuf, &map);
+	dma_map = err ? NULL : map.vaddr;
 	if (!dma_map) {
 		pr_err("dma_buf_vmap failed\n");
 		err = -ENOMEM;
@@ -163,6 +165,7 @@ static int igt_dmabuf_import_ownership(void *arg)
 	struct drm_i915_private *i915 = arg;
 	struct drm_i915_gem_object *obj;
 	struct dma_buf *dmabuf;
+	struct dma_buf_map map;
 	void *ptr;
 	int err;
 
@@ -170,7 +173,8 @@ static int igt_dmabuf_import_ownership(void *arg)
 	if (IS_ERR(dmabuf))
 		return PTR_ERR(dmabuf);
 
-	ptr = dma_buf_vmap(dmabuf);
+	err = dma_buf_vmap(dmabuf, &map);
+	ptr = err ? NULL : map.vaddr;
 	if (!ptr) {
 		pr_err("dma_buf_vmap failed\n");
 		err = -ENOMEM;
@@ -212,6 +216,7 @@ static int igt_dmabuf_export_vmap(void *arg)
 	struct drm_i915_private *i915 = arg;
 	struct drm_i915_gem_object *obj;
 	struct dma_buf *dmabuf;
+	struct dma_buf_map map;
 	void *ptr;
 	int err;
 
@@ -228,7 +233,8 @@ static int igt_dmabuf_export_vmap(void *arg)
 	}
 	i915_gem_object_put(obj);
 
-	ptr = dma_buf_vmap(dmabuf);
+	err = dma_buf_vmap(dmabuf, &map);
+	ptr = err ? NULL : map.vaddr;
 	if (!ptr) {
 		pr_err("dma_buf_vmap failed\n");
 		err = -ENOMEM;
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 47e2935b8c68..81663036c701 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -132,14 +132,18 @@ static void tegra_bo_unpin(struct device *dev, struct sg_table *sgt)
 static void *tegra_bo_mmap(struct host1x_bo *bo)
 {
 	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
+	struct dma_buf_map map;
+	int ret;
 
-	if (obj->vaddr)
+	if (obj->vaddr) {
 		return obj->vaddr;
-	else if (obj->gem.import_attach)
-		return dma_buf_vmap(obj->gem.import_attach->dmabuf);
-	else
+	} else if (obj->gem.import_attach) {
+		ret = dma_buf_vmap(obj->gem.import_attach->dmabuf, &map);
+		return ret ? NULL : map.vaddr;
+	} else {
 		return vmap(obj->pages, obj->num_pages, VM_MAP,
 			    pgprot_writecombine(PAGE_KERNEL));
+	}
 }
 
 static void tegra_bo_munmap(struct host1x_bo *bo, void *addr)
@@ -641,12 +645,14 @@ static int tegra_gem_prime_mmap(struct dma_buf *buf, struct vm_area_struct *vma)
 	return __tegra_gem_mmap(gem, vma);
 }
 
-static void *tegra_gem_prime_vmap(struct dma_buf *buf)
+static int tegra_gem_prime_vmap(struct dma_buf *buf, struct dma_buf_map *map)
 {
 	struct drm_gem_object *gem = buf->priv;
 	struct tegra_bo *bo = to_tegra_bo(gem);
 
-	return bo->vaddr;
+	dma_buf_map_set_vaddr(map, bo->vaddr);
+
+	return 0;
 }
 
 static void tegra_gem_prime_vunmap(struct dma_buf *buf, void *vaddr)
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index ec3446cc45b8..11428287bdf3 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -81,9 +81,13 @@ static void *vb2_dc_cookie(void *buf_priv)
 static void *vb2_dc_vaddr(void *buf_priv)
 {
 	struct vb2_dc_buf *buf = buf_priv;
+	struct dma_buf_map map;
+	int ret;
 
-	if (!buf->vaddr && buf->db_attach)
-		buf->vaddr = dma_buf_vmap(buf->db_attach->dmabuf);
+	if (!buf->vaddr && buf->db_attach) {
+		ret = dma_buf_vmap(buf->db_attach->dmabuf, &map);
+		buf->vaddr = ret ? NULL : map.vaddr;
+	}
 
 	return buf->vaddr;
 }
@@ -365,11 +369,13 @@ vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
 	return 0;
 }
 
-static void *vb2_dc_dmabuf_ops_vmap(struct dma_buf *dbuf)
+static int vb2_dc_dmabuf_ops_vmap(struct dma_buf *dbuf, struct dma_buf_map *map)
 {
 	struct vb2_dc_buf *buf = dbuf->priv;
 
-	return buf->vaddr;
+	dma_buf_map_set_vaddr(map, buf->vaddr);
+
+	return 0;
 }
 
 static int vb2_dc_dmabuf_ops_mmap(struct dma_buf *dbuf,
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index 0a40e00f0d7e..c51170e9c1b9 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -300,14 +300,18 @@ static void vb2_dma_sg_put_userptr(void *buf_priv)
 static void *vb2_dma_sg_vaddr(void *buf_priv)
 {
 	struct vb2_dma_sg_buf *buf = buf_priv;
+	struct dma_buf_map map;
+	int ret;
 
 	BUG_ON(!buf);
 
 	if (!buf->vaddr) {
-		if (buf->db_attach)
-			buf->vaddr = dma_buf_vmap(buf->db_attach->dmabuf);
-		else
+		if (buf->db_attach) {
+			ret = dma_buf_vmap(buf->db_attach->dmabuf, &map);
+			buf->vaddr = ret ? NULL : map.vaddr;
+		} else {
 			buf->vaddr = vm_map_ram(buf->pages, buf->num_pages, -1);
+		}
 	}
 
 	/* add offset in case userptr is not page-aligned */
@@ -489,11 +493,13 @@ vb2_dma_sg_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
 	return 0;
 }
 
-static void *vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf)
+static int vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf, struct dma_buf_map *map)
 {
 	struct vb2_dma_sg_buf *buf = dbuf->priv;
 
-	return vb2_dma_sg_vaddr(buf);
+	dma_buf_map_set_vaddr(map, buf->vaddr);
+
+	return 0;
 }
 
 static int vb2_dma_sg_dmabuf_ops_mmap(struct dma_buf *dbuf,
diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
index c66fda4a65e4..7b68e2379c65 100644
--- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
+++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
@@ -318,11 +318,13 @@ static void vb2_vmalloc_dmabuf_ops_release(struct dma_buf *dbuf)
 	vb2_vmalloc_put(dbuf->priv);
 }
 
-static void *vb2_vmalloc_dmabuf_ops_vmap(struct dma_buf *dbuf)
+static int vb2_vmalloc_dmabuf_ops_vmap(struct dma_buf *dbuf, struct dma_buf_map *map)
 {
 	struct vb2_vmalloc_buf *buf = dbuf->priv;
 
-	return buf->vaddr;
+	dma_buf_map_set_vaddr(map, buf->vaddr);
+
+	return 0;
 }
 
 static int vb2_vmalloc_dmabuf_ops_mmap(struct dma_buf *dbuf,
@@ -374,10 +376,15 @@ static struct dma_buf *vb2_vmalloc_get_dmabuf(void *buf_priv, unsigned long flag
 static int vb2_vmalloc_map_dmabuf(void *mem_priv)
 {
 	struct vb2_vmalloc_buf *buf = mem_priv;
+	struct dma_buf_map map;
+	int ret;
 
-	buf->vaddr = dma_buf_vmap(buf->dbuf);
+	ret = dma_buf_vmap(buf->dbuf, &map);
+	if (ret)
+		return -EFAULT;
+	buf->vaddr = map.vaddr;
 
-	return buf->vaddr ? 0 : -EFAULT;
+	return 0;
 }
 
 static void vb2_vmalloc_unmap_dmabuf(void *mem_priv)
diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
index bf141e74a1c2..3ee22639ff77 100644
--- a/include/drm/drm_prime.h
+++ b/include/drm/drm_prime.h
@@ -54,6 +54,7 @@ struct device;
 struct dma_buf_export_info;
 struct dma_buf;
 struct dma_buf_attachment;
+struct dma_buf_map;
 
 enum dma_data_direction;
 
@@ -82,7 +83,7 @@ struct sg_table *drm_gem_map_dma_buf(struct dma_buf_attachment *attach,
 void drm_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
 			   struct sg_table *sgt,
 			   enum dma_data_direction dir);
-void *drm_gem_dmabuf_vmap(struct dma_buf *dma_buf);
+int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map);
 void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, void *vaddr);
 
 int drm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
index d4b1bb3cc4b0..6b4f6e0e8b5d 100644
--- a/include/linux/dma-buf-map.h
+++ b/include/linux/dma-buf-map.h
@@ -28,6 +28,19 @@ struct dma_buf_map {
 	bool is_iomem;
 };
 
+/**
+ * dma_buf_map_set_vaddr - Sets a dma-buf mapping structure to an address in system memory
+ * @map:	The dma-buf mapping structure
+ * @vaddr:	A system-memory address
+ *
+ * Sets the address and clears the I/O-memory flag.
+ */
+static inline void dma_buf_map_set_vaddr(struct dma_buf_map *map, void *vaddr)
+{
+	map->vaddr = vaddr;
+	map->is_iomem = false;
+}
+
 /* API transition helper */
 static inline bool dma_buf_map_is_vaddr(const struct dma_buf_map *map, const void *vaddr)
 {
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index fcc2ddfb6d18..7237997cfa38 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -266,7 +266,7 @@ struct dma_buf_ops {
 	 */
 	int (*mmap)(struct dma_buf *, struct vm_area_struct *vma);
 
-	void *(*vmap)(struct dma_buf *);
+	int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
 	void (*vunmap)(struct dma_buf *, void *vaddr);
 };
 
@@ -503,6 +503,6 @@ int dma_buf_end_cpu_access(struct dma_buf *dma_buf,
 
 int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
 		 unsigned long);
-void *dma_buf_vmap(struct dma_buf *);
-void dma_buf_vunmap(struct dma_buf *, void *vaddr);
+int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
+void dma_buf_vunmap(struct dma_buf *dmabuf, void *vaddr);
 #endif /* __DMA_BUF_H__ */
-- 
2.28.0

