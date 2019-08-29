Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71D9AA1CB8
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 16:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbfH2O30 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 10:29:26 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:32933 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727144AbfH2O3Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 10:29:25 -0400
Received: by mail-wr1-f67.google.com with SMTP id u16so3702663wrr.0
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2019 07:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=b7lqW2KXe7MexjlKQhOqyn1tvWQxXpnqHpPlq455D1U=;
        b=oZBQFhPjHozUChdZ4YclODabpFhf3mFaA803QeW3Pv71tnM0gEMGpBJw8NxMIXDXhr
         VAMgzSmZw9FsR0PXQ2lLLy648fYjDwFJHDQJgTazOqziQlgyQXJ3EzFHUdnrUE8r9CDG
         CcIVwbRcfQnGQYInzN+TOCWaasNcegYLpO9Co3iDl4k6+hERI10iiFp/g4wHVRn5Ygne
         vSmsoQDjqEBPpCDeMDneN8vDuEB3xAhiBoKFW0IDG1BudaKeOAuyNTCOaPOmF6Ne/e9D
         MznYMh6wjce0gfjx1d1QV6RlKKrRR7lbp16otunUVT8zKHGDg1tRQSHYs5wS8M47mD1a
         cnbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b7lqW2KXe7MexjlKQhOqyn1tvWQxXpnqHpPlq455D1U=;
        b=eZ8I+SciTcnASLqMhpnGyYHr1/0BPytSSS5N6b516EBWTxN4miXNOdi9Pe+Y7OWchb
         /tPYuAel8K6eylhVQ7ViWI9J0uAjz9LeAeRV2rQ7xzXuurk5TZyBBtbZuYReALAvjwtq
         A3iHEpXP6AJYNhRjHdUWS5i6rSKygSpBERHEzDVx02e0h6y4yWyYg6HRYoYwCoda2IC6
         ZCdI2HkTCMYkLfUHW0AFlYujF9T8kwfAfCsQkbJqwD0hZbE39sttAcL/cr3eRV4hRSBT
         YE2CIKKjj8YasEkFKuHu9M0Do+SFyraEexuNfP632l82Dq1Zkz/K3e3fToDNEkn3RSj/
         +ITQ==
X-Gm-Message-State: APjAAAVgPG+LY0fvgdF/eTJUJrcIoHRJORBeXe6bPE50h6GFWBeqh1Qd
        fC25/UJAMyeS2J/FGjwtrJQitYea
X-Google-Smtp-Source: APXvYqzw2XWiO1KWr3LDp+BUIylqOeKSHh7jTQ+gka+eQbFFjtFxVsfgftZvm+0NJtQPRMDuuVKKJg==
X-Received: by 2002:a5d:424a:: with SMTP id s10mr11957575wrr.55.1567088962595;
        Thu, 29 Aug 2019 07:29:22 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d57:5a0b:4833:fc9f])
        by smtp.gmail.com with ESMTPSA id w13sm6188214wre.44.2019.08.29.07.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 07:29:22 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/4] drm/amdgpu: add independent DMA-buf export v7
Date:   Thu, 29 Aug 2019 16:29:16 +0200
Message-Id: <20190829142917.13058-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829142917.13058-1-christian.koenig@amd.com>
References: <20190829142917.13058-1-christian.koenig@amd.com>
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
index bf0f00508987..d3d32b75f346 100644
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
index 6b96a5738e57..6b7ad9345b61 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1397,7 +1397,6 @@ static struct drm_driver kms_driver = {
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_export = amdgpu_gem_prime_export,
 	.gem_prime_import = amdgpu_gem_prime_import,
-	.gem_prime_get_sg_table = amdgpu_gem_prime_get_sg_table,
 	.gem_prime_import_sg_table = amdgpu_gem_prime_import_sg_table,
 	.gem_prime_vmap = amdgpu_gem_prime_vmap,
 	.gem_prime_vunmap = amdgpu_gem_prime_vunmap,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 2f11ebd95528..156f0098d161 100644
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

