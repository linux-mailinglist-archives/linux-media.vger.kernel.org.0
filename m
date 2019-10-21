Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BABFDEA98
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 13:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbfJULPf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Oct 2019 07:15:35 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37671 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728187AbfJULPe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 07:15:34 -0400
Received: by mail-wm1-f65.google.com with SMTP id f22so12349679wmc.2
        for <linux-media@vger.kernel.org>; Mon, 21 Oct 2019 04:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ieftc5OZzoBpkKERgd4ypTIz03QnzZwqaxbRIvJjQOA=;
        b=Ae5csJtRLnGC7zwpq6aSDSObm8rh7TuAvDu9qb1IAYy9vtmg1Apu8P4Qk9iN0EYgAV
         dcugcJqSOm1lt6s62FFze5yp+eQJDh/rp53bV/qQU6hd/3N06k4hu/HrxbPUjxif1Ppc
         pQ+WBttoBnU+orm/Mat2Btrwh1FNmfZHIS23DyAjnjhCmaZbh/wrleBViEvuNOL7rgFF
         kPPgmoX95jknfyziotOSK7wmfVuhjO87wjhFWjHX34WR44iovYpDgF1hAz3VeNInmxWR
         3W8lmKtsdK4n7CXximDf8FLIKbXlygygS5Fz6c+ftWlDml8g/u6zkiQAqJ2oj5kVwiuf
         b++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ieftc5OZzoBpkKERgd4ypTIz03QnzZwqaxbRIvJjQOA=;
        b=eod/7Jye76WBfhC3wbd0XM5ScYzkvsEpa245Da63+8m8mx6BJp3VmhFFHuvTU/cvrT
         gJAX4NjoLOIEshhuWAjleA0+r+UG/rtn0vYCrhzQYT1M68qwcXUNcf9Gg73VomvpwXMh
         J2pnWcp9/LJNgIICNnETp45ckb417nxJo9IC18TFMfngCl5JAHnuQ31GitoN0mlhYuCx
         2eGNDQ73TWM+L0LhgUEzM43kzPcHXu6WF0t45PZbskOJe4Ah48FVGf8oB2nAoW0gCSZd
         /db0CdSnG9qr83NDIuMxFEP8BqoSgjcNxQHlxXwcESGdb9vnf1V1KJZVyDk4VQnt8+xD
         iJaw==
X-Gm-Message-State: APjAAAWQ417LfY9gFnlrNf2S4OSfAl+VL1pjJLUhC8i8kV6OYm9fu/UT
        jz9LhCLg2w9SSMNgQhsPhCA=
X-Google-Smtp-Source: APXvYqwSWSdNGiq0uG1tH9MYN8Xd9D4kczQWQOq6ynTQEEslg2xeNf2B/6PXeTI1H7YpyAsvyyT+NA==
X-Received: by 2002:a1c:5409:: with SMTP id i9mr19173338wmb.120.1571656529411;
        Mon, 21 Oct 2019 04:15:29 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c194:dd41:4bef:70cc])
        by smtp.gmail.com with ESMTPSA id l9sm13152415wme.45.2019.10.21.04.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 04:15:28 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, daniel@ffwll.ch
Subject: [PATCH 3/4] drm/amdgpu: add independent DMA-buf export v7
Date:   Mon, 21 Oct 2019 13:15:23 +0200
Message-Id: <20191021111524.14793-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191021111524.14793-1-christian.koenig@amd.com>
References: <20191021111524.14793-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add an DMA-buf export implementation independent of the DRM helpers.

This not only avoids the caching of DMA-buf mappings, but also
allows us to use the new dynamic locking approach.

This is also a prerequisite of unpinned DMA-buf handling.

v2: fix unintended recursion, remove debugging leftovers
v3: split out from unpinned DMA-buf work
v4: rebase on top of new no_sgt_cache flag
v5: fix some warnings by including amdgpu_dma_buf.h
v6: fix locking for non amdgpu exports
v7: rebased on new DMA-buf locking patch

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 172 +++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |   1 +
 4 files changed, 97 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 61f108ec2b5c..f14b52cc7205 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -34,26 +34,11 @@
 #include "amdgpu.h"
 #include "amdgpu_display.h"
 #include "amdgpu_gem.h"
+#include "amdgpu_dma_buf.h"
 #include <drm/amdgpu_drm.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-fence-array.h>
 
-/**
- * amdgpu_gem_prime_get_sg_table - &drm_driver.gem_prime_get_sg_table
- * implementation
- * @obj: GEM buffer object (BO)
- *
- * Returns:
- * A scatter/gather table for the pinned pages of the BO's memory.
- */
-struct sg_table *amdgpu_gem_prime_get_sg_table(struct drm_gem_object *obj)
-{
-	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
-	int npages = bo->tbo.num_pages;
-
-	return drm_prime_pages_to_sg(bo->tbo.ttm->pages, npages);
-}
-
 /**
  * amdgpu_gem_prime_vmap - &dma_buf_ops.vmap implementation
  * @obj: GEM BO
@@ -179,92 +164,126 @@ __dma_resv_make_exclusive(struct dma_resv *obj)
 }
 
 /**
- * amdgpu_dma_buf_map_attach - &dma_buf_ops.attach implementation
- * @dma_buf: Shared DMA buffer
+ * amdgpu_dma_buf_attach - &dma_buf_ops.attach implementation
+ *
+ * @dmabuf: DMA-buf where we attach to
+ * @attach: attachment to add
+ *
+ * Add the attachment as user to the exported DMA-buf.
+ */
+static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
+				 struct dma_buf_attachment *attach)
+{
+	struct drm_gem_object *obj = dmabuf->priv;
+	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
+	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
+	int r;
+
+	if (attach->dev->driver == adev->dev->driver)
+		return 0;
+
+	r = amdgpu_bo_reserve(bo, false);
+	if (unlikely(r != 0))
+		return r;
+
+	/*
+	 * We only create shared fences for internal use, but importers
+	 * of the dmabuf rely on exclusive fences for implicitly
+	 * tracking write hazards. As any of the current fences may
+	 * correspond to a write, we need to convert all existing
+	 * fences on the reservation object into a single exclusive
+	 * fence.
+	 */
+	r = __dma_resv_make_exclusive(bo->tbo.base.resv);
+	if (r)
+		return r;
+
+	bo->prime_shared_count++;
+	amdgpu_bo_unreserve(bo);
+	return 0;
+}
+
+/**
+ * amdgpu_dma_buf_detach - &dma_buf_ops.detach implementation
+ *
+ * @dmabuf: DMA-buf where we remove the attachment from
+ * @attach: the attachment to remove
+ *
+ * Called when an attachment is removed from the DMA-buf.
+ */
+static void amdgpu_dma_buf_detach(struct dma_buf *dmabuf,
+				  struct dma_buf_attachment *attach)
+{
+	struct drm_gem_object *obj = dmabuf->priv;
+	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
+	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
+
+	if (attach->dev->driver != adev->dev->driver && bo->prime_shared_count)
+		bo->prime_shared_count--;
+}
+
+/**
+ * amdgpu_dma_buf_map - &dma_buf_ops.map_dma_buf implementation
  * @attach: DMA-buf attachment
+ * @dir: DMA direction
  *
  * Makes sure that the shared DMA buffer can be accessed by the target device.
  * For now, simply pins it to the GTT domain, where it should be accessible by
  * all DMA devices.
  *
  * Returns:
- * 0 on success or a negative error code on failure.
+ * sg_table filled with the DMA addresses to use or ERR_PRT with negative error
+ * code.
  */
-static int amdgpu_dma_buf_map_attach(struct dma_buf *dma_buf,
-				     struct dma_buf_attachment *attach)
+static struct sg_table *amdgpu_dma_buf_map(struct dma_buf_attachment *attach,
+					   enum dma_data_direction dir)
 {
+	struct dma_buf *dma_buf = attach->dmabuf;
 	struct drm_gem_object *obj = dma_buf->priv;
 	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
-	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
+	struct sg_table *sgt;
 	long r;
 
-	r = drm_gem_map_attach(dma_buf, attach);
-	if (r)
-		return r;
-
-	r = amdgpu_bo_reserve(bo, false);
-	if (unlikely(r != 0))
-		goto error_detach;
-
-
-	if (attach->dev->driver != adev->dev->driver) {
-		/*
-		 * We only create shared fences for internal use, but importers
-		 * of the dmabuf rely on exclusive fences for implicitly
-		 * tracking write hazards. As any of the current fences may
-		 * correspond to a write, we need to convert all existing
-		 * fences on the reservation object into a single exclusive
-		 * fence.
-		 */
-		r = __dma_resv_make_exclusive(bo->tbo.base.resv);
-		if (r)
-			goto error_unreserve;
-	}
-
-	/* pin buffer into GTT */
 	r = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT);
 	if (r)
-		goto error_unreserve;
+		return ERR_PTR(r);
 
-	if (attach->dev->driver != adev->dev->driver)
-		bo->prime_shared_count++;
+	sgt = drm_prime_pages_to_sg(bo->tbo.ttm->pages, bo->tbo.num_pages);
+	if (IS_ERR(sgt))
+		return sgt;
 
-error_unreserve:
-	amdgpu_bo_unreserve(bo);
+	if (!dma_map_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
+			      DMA_ATTR_SKIP_CPU_SYNC))
+		goto error_free;
 
-error_detach:
-	if (r)
-		drm_gem_map_detach(dma_buf, attach);
-	return r;
+	return sgt;
+
+error_free:
+	sg_free_table(sgt);
+	kfree(sgt);
+	return ERR_PTR(-ENOMEM);
 }
 
 /**
- * amdgpu_dma_buf_map_detach - &dma_buf_ops.detach implementation
- * @dma_buf: Shared DMA buffer
+ * amdgpu_dma_buf_unmap - &dma_buf_ops.unmap_dma_buf implementation
  * @attach: DMA-buf attachment
+ * @sgt: sg_table to unmap
+ * @dir: DMA direction
  *
  * This is called when a shared DMA buffer no longer needs to be accessible by
  * another device. For now, simply unpins the buffer from GTT.
  */
-static void amdgpu_dma_buf_map_detach(struct dma_buf *dma_buf,
-				      struct dma_buf_attachment *attach)
+static void amdgpu_dma_buf_unmap(struct dma_buf_attachment *attach,
+				 struct sg_table *sgt,
+				 enum dma_data_direction dir)
 {
-	struct drm_gem_object *obj = dma_buf->priv;
+	struct drm_gem_object *obj = attach->dmabuf->priv;
 	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
-	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
-	int ret = 0;
-
-	ret = amdgpu_bo_reserve(bo, true);
-	if (unlikely(ret != 0))
-		goto error;
 
+	dma_unmap_sg(attach->dev, sgt->sgl, sgt->nents, dir);
+	sg_free_table(sgt);
+	kfree(sgt);
 	amdgpu_bo_unpin(bo);
-	if (attach->dev->driver != adev->dev->driver && bo->prime_shared_count)
-		bo->prime_shared_count--;
-	amdgpu_bo_unreserve(bo);
-
-error:
-	drm_gem_map_detach(dma_buf, attach);
 }
 
 /**
@@ -308,10 +327,11 @@ static int amdgpu_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
 }
 
 const struct dma_buf_ops amdgpu_dmabuf_ops = {
-	.attach = amdgpu_dma_buf_map_attach,
-	.detach = amdgpu_dma_buf_map_detach,
-	.map_dma_buf = drm_gem_map_dma_buf,
-	.unmap_dma_buf = drm_gem_unmap_dma_buf,
+	.dynamic_mapping = true,
+	.attach = amdgpu_dma_buf_attach,
+	.detach = amdgpu_dma_buf_detach,
+	.map_dma_buf = amdgpu_dma_buf_map,
+	.unmap_dma_buf = amdgpu_dma_buf_unmap,
 	.release = drm_gem_dmabuf_release,
 	.begin_cpu_access = amdgpu_dma_buf_begin_cpu_access,
 	.mmap = drm_gem_dmabuf_mmap,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h
index 5012e6ab58f1..ce1b3f017451 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h
@@ -25,7 +25,6 @@
 
 #include <drm/drm_gem.h>
 
-struct sg_table *amdgpu_gem_prime_get_sg_table(struct drm_gem_object *obj);
 struct drm_gem_object *
 amdgpu_gem_prime_import_sg_table(struct drm_device *dev,
 				 struct dma_buf_attachment *attach,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 3fae1007143e..bf5bf15b12e3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1409,7 +1409,6 @@ static struct drm_driver kms_driver = {
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_export = amdgpu_gem_prime_export,
 	.gem_prime_import = amdgpu_gem_prime_import,
-	.gem_prime_get_sg_table = amdgpu_gem_prime_get_sg_table,
 	.gem_prime_import_sg_table = amdgpu_gem_prime_import_sg_table,
 	.gem_prime_vmap = amdgpu_gem_prime_vmap,
 	.gem_prime_vunmap = amdgpu_gem_prime_vunmap,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 6f0b789a0b49..b319254537b8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -31,6 +31,7 @@
  */
 #include <linux/list.h>
 #include <linux/slab.h>
+#include <linux/dma-buf.h>
 
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_cache.h>
-- 
2.17.1

