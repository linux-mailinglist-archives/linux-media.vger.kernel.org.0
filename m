Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED92288C21
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 17:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389160AbgJIPEE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 11:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389149AbgJIPDw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 11:03:52 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1592BC0613D7;
        Fri,  9 Oct 2020 08:03:52 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id c22so13579189ejx.0;
        Fri, 09 Oct 2020 08:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6ugvF4IgTz7tWf0PCaB/4auf5Wv0lFq59SvvHpBULxI=;
        b=n2nnRwI0ufKMCqDombougDt4u0W9ym9MfBOn0RMvHZwK3NSdnCsaI373cmjMSn9J0x
         yEHKFVrXCmFtnPfIR5jnnICB5dPZNhX87Q1Q/2o9brR9I38rsKGfEqllIKvpiNnpepcZ
         3gaEB5jxd/CA3T7+mcOHnp7taJTjTcyBFtuzLZ/JwT1C1+ZGvvDQyvNyRYxlHplNFdOk
         nFOaOUOKenTgPgauhotJ2XzKWNO1iqGB53YQJRPBjva4Cd2oMkdEqwyLt+R3R2ZuPVth
         LHKlwPX4o0PTdP3wyJTd5w80ilZD4lH58/RfRuF6N/5jl0hGRvQ1iWZAJVMaCqV/cO2C
         RoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6ugvF4IgTz7tWf0PCaB/4auf5Wv0lFq59SvvHpBULxI=;
        b=XXde2tlUFHX9DHTLbQBXMxrOr8Tkjr6Uu8bk23xOnXUqp4mcODq0jD9S7SYhI07l/p
         D3MZeKpgUpplaVVcSQWeXl7LaxaK0f2XTYFYMqbjGdxLxaFfr1HRiEX8Mih0/MEXJn/W
         MSa9mccyLk4HBWBAOwNYF0Jksr5QLON/i+FX7zD/EBBjgtozB1LBqHkKTOmF4ofv1OKB
         7TbIu+XAuR2F+yiykFOsp2Y24YXMp+JiTrRc1cXQMyQdlrMvfn67X0vZnI3mwLmy5Npo
         WHgFBmQ16HApE+WqMNKXTc+TbHS1V/ZA/cQ5gfpaeVt3EOsfJ29Gv2mBz10JQoO9XxDo
         VXpg==
X-Gm-Message-State: AOAM531NbuziCye2a3NLL3LfpIXYk3CsysqpB0hhcn/VkCjsssvbzGVB
        QtylBRm9hRBKvY7GVLVmfiU=
X-Google-Smtp-Source: ABdhPJwqTN2lTowZ4dUG7uMxTX3cR2kAKfoqxbzhNBcJ7B0y+0q8e7eIiVVCBW5m7D99Ax7NgprkrQ==
X-Received: by 2002:a17:906:b353:: with SMTP id cd19mr14474953ejb.140.1602255830622;
        Fri, 09 Oct 2020 08:03:50 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:65f3:51d4:50d0:15b0])
        by smtp.gmail.com with ESMTPSA id v14sm789364edy.68.2020.10.09.08.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 08:03:50 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
        airlied@redhat.com, akpm@linux-foundation.org, daniel@ffwll.ch,
        sumit.semwal@linaro.org, willy@infradead.org, jhubbard@nvidia.com,
        jgg@ziepe.ca
Subject: [PATCH 6/6] drm/prime: document that use the page array is deprecated v2
Date:   Fri,  9 Oct 2020 17:03:42 +0200
Message-Id: <20201009150342.1979-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201009150342.1979-1-christian.koenig@amd.com>
References: <20201009150342.1979-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We have reoccurring requests on this so better document that
this approach doesn't work and dma_buf_mmap() needs to be used instead.

v2: split it into two functions

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     |  9 ++-
 drivers/gpu/drm/drm_prime.c                 | 67 +++++++++++++++------
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |  3 +-
 drivers/gpu/drm/msm/msm_gem.c               |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c        |  5 +-
 drivers/gpu/drm/radeon/radeon_ttm.c         |  9 ++-
 drivers/gpu/drm/vgem/vgem_drv.c             |  3 +-
 drivers/gpu/drm/vkms/vkms_gem.c             |  2 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c     |  4 +-
 include/drm/drm_prime.h                     |  7 ++-
 10 files changed, 69 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index ac463e706b19..6a65490de391 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1011,8 +1011,8 @@ static int amdgpu_ttm_tt_pin_userptr(struct ttm_bo_device *bdev,
 		goto release_sg;
 
 	/* convert SG to linear array of pages and dma addresses */
-	drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL, gtt->ttm.dma_address,
-					 ttm->num_pages);
+	drm_prime_sg_to_dma_addr_array(ttm->sg, gtt->ttm.dma_address,
+				       ttm->num_pages);
 
 	return 0;
 
@@ -1345,9 +1345,8 @@ static int amdgpu_ttm_tt_populate(struct ttm_bo_device *bdev,
 			ttm->sg = sgt;
 		}
 
-		drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL,
-						 gtt->ttm.dma_address,
-						 ttm->num_pages);
+		drm_prime_sg_to_dma_addr_array(ttm->sg, gtt->ttm.dma_address,
+					       ttm->num_pages);
 		ttm_tt_set_populated(ttm);
 		return 0;
 	}
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 4910c446db83..8b750c074494 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -954,27 +954,25 @@ struct drm_gem_object *drm_gem_prime_import(struct drm_device *dev,
 EXPORT_SYMBOL(drm_gem_prime_import);
 
 /**
- * drm_prime_sg_to_page_addr_arrays - convert an sg table into a page array
+ * drm_prime_sg_to_page_array - convert an sg table into a page array
  * @sgt: scatter-gather table to convert
- * @pages: optional array of page pointers to store the page array in
- * @addrs: optional array to store the dma bus address of each page
- * @max_entries: size of both the passed-in arrays
+ * @pages: array of page pointers to store the pages in
+ * @max_entries: size of the passed-in array
  *
- * Exports an sg table into an array of pages and addresses. This is currently
- * required by the TTM driver in order to do correct fault handling.
+ * Exports an sg table into an array of pages.
  *
- * Drivers can use this in their &drm_driver.gem_prime_import_sg_table
- * implementation.
+ * This function is deprecated and strongly discouraged to be used.
+ * The page array is only useful for page faults and those can corrupt fields
+ * in the struct page if they are not handled by the exporting driver.
  */
-int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page **pages,
-				     dma_addr_t *addrs, int max_entries)
+int __deprecated drm_prime_sg_to_page_array(struct sg_table *sgt,
+					    struct page **pages,
+					    int max_entries)
 {
 	unsigned count;
 	struct scatterlist *sg;
 	struct page *page;
 	u32 page_len, page_index;
-	dma_addr_t addr;
-	u32 dma_len, dma_index;
 
 	/*
 	 * Scatterlist elements contains both pages and DMA addresses, but
@@ -984,14 +982,11 @@ int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page **pages,
 	 * described by the sg_dma_address(sg).
 	 */
 	page_index = 0;
-	dma_index = 0;
 	for_each_sg(sgt->sgl, sg, sgt->nents, count) {
 		page_len = sg->length;
 		page = sg_page(sg);
-		dma_len = sg_dma_len(sg);
-		addr = sg_dma_address(sg);
 
-		while (pages && page_len > 0) {
+		while (page_len > 0) {
 			if (WARN_ON(page_index >= max_entries))
 				return -1;
 			pages[page_index] = page;
@@ -999,7 +994,43 @@ int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page **pages,
 			page_len -= PAGE_SIZE;
 			page_index++;
 		}
-		while (addrs && dma_len > 0) {
+	}
+	return 0;
+}
+EXPORT_SYMBOL(drm_prime_sg_to_page_array);
+
+/**
+ * drm_prime_sg_to_dma_addr_array - convert an sg table into a dma addr array
+ * @sgt: scatter-gather table to convert
+ * @addrs: array to store the dma bus address of each page
+ * @max_entries: size of both the passed-in arrays
+ *
+ * Exports an sg table into an array of addresses.
+ *
+ * Drivers should use this in their &drm_driver.gem_prime_import_sg_table
+ * implementation.
+ */
+int drm_prime_sg_to_dma_addr_array(struct sg_table *sgt, dma_addr_t *addrs,
+				   int max_entries)
+{
+	struct scatterlist *sg;
+	u32 dma_len, dma_index;
+	dma_addr_t addr;
+	unsigned count;
+
+	/*
+	 * Scatterlist elements contains both pages and DMA addresses, but
+	 * one shoud not assume 1:1 relation between them. The sg->length is
+	 * the size of the physical memory chunk described by the sg->page,
+	 * while sg_dma_len(sg) is the size of the DMA (IO virtual) chunk
+	 * described by the sg_dma_address(sg).
+	 */
+	dma_index = 0;
+	for_each_sg(sgt->sgl, sg, sgt->nents, count) {
+		dma_len = sg_dma_len(sg);
+		addr = sg_dma_address(sg);
+
+		while (dma_len > 0) {
 			if (WARN_ON(dma_index >= max_entries))
 				return -1;
 			addrs[dma_index] = addr;
@@ -1010,7 +1041,7 @@ int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page **pages,
 	}
 	return 0;
 }
-EXPORT_SYMBOL(drm_prime_sg_to_page_addr_arrays);
+EXPORT_SYMBOL(drm_prime_sg_to_dma_addr_array);
 
 /**
  * drm_prime_gem_destroy - helper to clean up a PRIME-imported GEM object
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index 135fbff6fecf..8c04b8e8054c 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -133,8 +133,7 @@ struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_device *dev,
 		goto fail;
 	}
 
-	ret = drm_prime_sg_to_page_addr_arrays(sgt, etnaviv_obj->pages,
-					       NULL, npages);
+	ret = drm_prime_sg_to_page_array(sgt, etnaviv_obj->pages, npages);
 	if (ret)
 		goto fail;
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index a71f42870d5e..616b87641740 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1174,7 +1174,7 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 		goto fail;
 	}
 
-	ret = drm_prime_sg_to_page_addr_arrays(sgt, msm_obj->pages, NULL, npages);
+	ret = drm_prime_sg_to_page_array(sgt, msm_obj->pages, npages);
 	if (ret) {
 		mutex_unlock(&msm_obj->lock);
 		goto fail;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index e378bb491688..835edd74ef59 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1299,9 +1299,8 @@ nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
 		return 0;
 
 	if (slave && ttm->sg) {
-		drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL,
-						 ttm_dma->dma_address,
-						 ttm->num_pages);
+		drm_prime_sg_to_dma_addr_array(ttm->sg, ttm_dma->dma_address,
+					       ttm->num_pages);
 		ttm_tt_set_populated(ttm);
 		return 0;
 	}
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 4b92cdbcd29b..7997e4564576 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -474,8 +474,8 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_bo_device *bdev, struct ttm_tt *
 	if (r)
 		goto release_sg;
 
-	drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL, gtt->ttm.dma_address,
-					 ttm->num_pages);
+	drm_prime_sg_to_dma_addr_array(ttm->sg, gtt->ttm.dma_address,
+				       ttm->num_pages);
 
 	return 0;
 
@@ -642,9 +642,8 @@ static int radeon_ttm_tt_populate(struct ttm_bo_device *bdev,
 	}
 
 	if (slave && ttm->sg) {
-		drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL,
-						 gtt->ttm.dma_address,
-						 ttm->num_pages);
+		drm_prime_sg_to_dma_addr_array(ttm->sg, gtt->ttm.dma_address,
+					       ttm->num_pages);
 		ttm_tt_set_populated(ttm);
 		return 0;
 	}
diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index ea0eecae5153..e505e5a291b3 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -356,8 +356,7 @@ static struct drm_gem_object *vgem_prime_import_sg_table(struct drm_device *dev,
 	}
 
 	obj->pages_pin_count++; /* perma-pinned */
-	drm_prime_sg_to_page_addr_arrays(obj->table, obj->pages, NULL,
-					npages);
+	drm_prime_sg_to_page_array(obj->table, obj->pages, npages);
 	return &obj->base;
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_gem.c b/drivers/gpu/drm/vkms/vkms_gem.c
index 19a0e260a4df..a2ff21f47101 100644
--- a/drivers/gpu/drm/vkms/vkms_gem.c
+++ b/drivers/gpu/drm/vkms/vkms_gem.c
@@ -256,6 +256,6 @@ vkms_prime_import_sg_table(struct drm_device *dev,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	drm_prime_sg_to_page_addr_arrays(sg, obj->pages, NULL, npages);
+	drm_prime_sg_to_page_array(sg, obj->pages, npages);
 	return &obj->gem;
 }
diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index f3830a0d1808..f4150ddfc5e2 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -220,8 +220,8 @@ xen_drm_front_gem_import_sg_table(struct drm_device *dev,
 
 	xen_obj->sgt_imported = sgt;
 
-	ret = drm_prime_sg_to_page_addr_arrays(sgt, xen_obj->pages,
-					       NULL, xen_obj->num_pages);
+	ret = drm_prime_sg_to_page_array(sgt, xen_obj->pages,
+					 xen_obj->num_pages);
 	if (ret < 0)
 		return ERR_PTR(ret);
 
diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
index 093f760cc131..4bda9ab3a3bb 100644
--- a/include/drm/drm_prime.h
+++ b/include/drm/drm_prime.h
@@ -103,8 +103,9 @@ struct drm_gem_object *drm_gem_prime_import(struct drm_device *dev,
 
 void drm_prime_gem_destroy(struct drm_gem_object *obj, struct sg_table *sg);
 
-int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page **pages,
-				     dma_addr_t *addrs, int max_pages);
-
+int drm_prime_sg_to_page_array(struct sg_table *sgt, struct page **pages,
+			       int max_pages);
+int drm_prime_sg_to_dma_addr_array(struct sg_table *sgt, dma_addr_t *addrs,
+				   int max_pages);
 
 #endif /* __DRM_PRIME_H__ */
-- 
2.17.1

