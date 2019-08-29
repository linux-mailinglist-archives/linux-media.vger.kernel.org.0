Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19D2BA1CB9
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 16:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727594AbfH2O30 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 10:29:26 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33215 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbfH2O30 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 10:29:26 -0400
Received: by mail-wm1-f65.google.com with SMTP id r17so4296978wme.0
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2019 07:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=L1BbMMLnWOCZ817TJxVogOxo5Oz0b+5fpXCzpVspkIo=;
        b=A/Vl94dG5Taiq4b5suNXSCgHE+e+Cl1mV5VuMQUcrujrK1n72YKfMcpiNb3HSIRb72
         iBJUbZ2+oBmg+1oX5BZHFYeCe2kVV1VcMQDqQGcMdjsedRiwfPwO6EKad2pa7+bfo3az
         mBVNJVK3CncuUvuQwvv010UA0XyR/VDB0DNFGAH5Ucy3SRS9Lox+PD0N9NSogkjG1NYu
         WHDgzXuVgX01QiEYBt0VhWcSXXzYccHYKLrl0c90SfhgyhLhEobxM4uhTXuDzpXaHJYK
         wbAzT8Z2X3m2HcA6mzi9hwNJQ8ct5XYGjAPBaMBQgTj0gk+x4KPvYFEKAmD0aIbjH566
         Q9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L1BbMMLnWOCZ817TJxVogOxo5Oz0b+5fpXCzpVspkIo=;
        b=cepidW6ggPhm3Wd0vnlQtK8JmGK4j68DdmJaMRvS5tQbAEd+eJai1K/sOiA0GmgOIk
         OkBVFBmZuFznGD7Erka6zDoH1A5YSnuRgCV28KrmkJAaSe9a+cSdIBEo/yCiP5LyNZAK
         IA1XigoTEcAkGPJ5xmdCKaasXtUN8r5GGJXr5QnCCZZ2uEB9eHiOYlIicTkTAQHSlmx+
         dn4lX0GoztwzRfXn1Z1egsdpBUXJ5tyCApAs4iwn6ITqamhwULOivBLLffatfIUVl4HL
         u4HRmmFIyAp8Y+85cb5+PVDTIOL+M4vY5zQ3xDwdmAbBrHLO+JVdGKseqoNtEF3IhI04
         iDaw==
X-Gm-Message-State: APjAAAUmv71eQWixYKT+B3KX8kfTYN36PC8A6ChT2gNRwF+Nb5y45/+M
        2SYu77ssGRsmyLJsMOfV1iox9yoF
X-Google-Smtp-Source: APXvYqztjqp5+PMsxinnpRiojQpBFREehoND4bm//sBdhqvmybjbE2WdDb/A92ytDmMHxHTC25u7Wg==
X-Received: by 2002:a1c:f516:: with SMTP id t22mr10152954wmh.110.1567088963480;
        Thu, 29 Aug 2019 07:29:23 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d57:5a0b:4833:fc9f])
        by smtp.gmail.com with ESMTPSA id w13sm6188214wre.44.2019.08.29.07.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 07:29:22 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/amdgpu: add independent DMA-buf import v8
Date:   Thu, 29 Aug 2019 16:29:17 +0200
Message-Id: <20190829142917.13058-5-christian.koenig@amd.com>
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

Instead of relying on the DRM functions just implement our own import
functions. This prepares support for taking care of unpinned DMA-buf.

v2: enable for all exporters, not just amdgpu, fix invalidation
    handling, lock reservation object while setting callback
v3: change to new dma_buf attach interface
v4: split out from unpinned DMA-buf work
v5: rebased and cleanup on new DMA-buf interface
v6: squash with invalidation callback change,
    stop using _(map|unmap)_locked
v7: drop invalidations when the BO is already in system domain
v8: rebase on new DMA-buf patch and drop move notification

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 38 +++++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h |  4 ---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 32 ++++++++++++++---
 4 files changed, 50 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index d3d32b75f346..693cd01e9373 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -370,31 +370,28 @@ struct dma_buf *amdgpu_gem_prime_export(struct drm_gem_object *gobj,
 }
 
 /**
- * amdgpu_gem_prime_import_sg_table - &drm_driver.gem_prime_import_sg_table
- * implementation
+ * amdgpu_dma_buf_create_obj - create BO for DMA-buf import
+ *
  * @dev: DRM device
- * @attach: DMA-buf attachment
- * @sg: Scatter/gather table
+ * @dma_buf: DMA-buf
  *
- * Imports shared DMA buffer memory exported by another device.
+ * Creates an empty SG BO for DMA-buf import.
  *
  * Returns:
  * A new GEM BO of the given DRM device, representing the memory
  * described by the given DMA-buf attachment and scatter/gather table.
  */
-struct drm_gem_object *
-amdgpu_gem_prime_import_sg_table(struct drm_device *dev,
-				 struct dma_buf_attachment *attach,
-				 struct sg_table *sg)
+static struct drm_gem_object *
+amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
 {
-	struct dma_resv *resv = attach->dmabuf->resv;
+	struct dma_resv *resv = dma_buf->resv;
 	struct amdgpu_device *adev = dev->dev_private;
 	struct amdgpu_bo *bo;
 	struct amdgpu_bo_param bp;
 	int ret;
 
 	memset(&bp, 0, sizeof(bp));
-	bp.size = attach->dmabuf->size;
+	bp.size = dma_buf->size;
 	bp.byte_align = PAGE_SIZE;
 	bp.domain = AMDGPU_GEM_DOMAIN_CPU;
 	bp.flags = 0;
@@ -405,11 +402,9 @@ amdgpu_gem_prime_import_sg_table(struct drm_device *dev,
 	if (ret)
 		goto error;
 
-	bo->tbo.sg = sg;
-	bo->tbo.ttm->sg = sg;
 	bo->allowed_domains = AMDGPU_GEM_DOMAIN_GTT;
 	bo->preferred_domains = AMDGPU_GEM_DOMAIN_GTT;
-	if (attach->dmabuf->ops != &amdgpu_dmabuf_ops)
+	if (dma_buf->ops != &amdgpu_dmabuf_ops)
 		bo->prime_shared_count = 1;
 
 	dma_resv_unlock(resv);
@@ -434,6 +429,7 @@ amdgpu_gem_prime_import_sg_table(struct drm_device *dev,
 struct drm_gem_object *amdgpu_gem_prime_import(struct drm_device *dev,
 					    struct dma_buf *dma_buf)
 {
+	struct dma_buf_attachment *attach;
 	struct drm_gem_object *obj;
 
 	if (dma_buf->ops == &amdgpu_dmabuf_ops) {
@@ -448,5 +444,17 @@ struct drm_gem_object *amdgpu_gem_prime_import(struct drm_device *dev,
 		}
 	}
 
-	return drm_gem_prime_import(dev, dma_buf);
+	obj = amdgpu_dma_buf_create_obj(dev, dma_buf);
+	if (IS_ERR(obj))
+		return obj;
+
+	attach = dma_buf_dynamic_attach(dma_buf, dev->dev, true);
+	if (IS_ERR(attach)) {
+		drm_gem_object_put(obj);
+		return ERR_CAST(attach);
+	}
+
+	get_dma_buf(dma_buf);
+	obj->import_attach = attach;
+	return obj;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h
index ce1b3f017451..ec447a7b6b28 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h
@@ -25,10 +25,6 @@
 
 #include <drm/drm_gem.h>
 
-struct drm_gem_object *
-amdgpu_gem_prime_import_sg_table(struct drm_device *dev,
-				 struct dma_buf_attachment *attach,
-				 struct sg_table *sg);
 struct dma_buf *amdgpu_gem_prime_export(struct drm_gem_object *gobj,
 					int flags);
 struct drm_gem_object *amdgpu_gem_prime_import(struct drm_device *dev,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 6b7ad9345b61..4c0d5162ca33 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1397,7 +1397,6 @@ static struct drm_driver kms_driver = {
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_export = amdgpu_gem_prime_export,
 	.gem_prime_import = amdgpu_gem_prime_import,
-	.gem_prime_import_sg_table = amdgpu_gem_prime_import_sg_table,
 	.gem_prime_vmap = amdgpu_gem_prime_vmap,
 	.gem_prime_vunmap = amdgpu_gem_prime_vunmap,
 	.gem_prime_mmap = amdgpu_gem_prime_mmap,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index fb09314bcfd4..8c923282daf1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -39,6 +39,7 @@
 #include <linux/slab.h>
 #include <linux/swap.h>
 #include <linux/swiotlb.h>
+#include <linux/dma-buf.h>
 
 #include <drm/ttm/ttm_bo_api.h>
 #include <drm/ttm/ttm_bo_driver.h>
@@ -747,6 +748,7 @@ static unsigned long amdgpu_ttm_io_mem_pfn(struct ttm_buffer_object *bo,
  */
 struct amdgpu_ttm_tt {
 	struct ttm_dma_tt	ttm;
+	struct drm_gem_object	*gobj;
 	u64			offset;
 	uint64_t		userptr;
 	struct task_struct	*usertask;
@@ -1226,6 +1228,7 @@ static struct ttm_tt *amdgpu_ttm_tt_create(struct ttm_buffer_object *bo,
 		return NULL;
 	}
 	gtt->ttm.ttm.func = &amdgpu_backend_func;
+	gtt->gobj = &bo->base;
 
 	/* allocate space for the uninitialized page entries */
 	if (ttm_sg_tt_init(&gtt->ttm, bo, page_flags)) {
@@ -1246,7 +1249,6 @@ static int amdgpu_ttm_tt_populate(struct ttm_tt *ttm,
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(ttm->bdev);
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
-	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
 	/* user pages are bound by amdgpu_ttm_tt_pin_userptr() */
 	if (gtt && gtt->userptr) {
@@ -1259,7 +1261,19 @@ static int amdgpu_ttm_tt_populate(struct ttm_tt *ttm,
 		return 0;
 	}
 
-	if (slave && ttm->sg) {
+	if (ttm->page_flags & TTM_PAGE_FLAG_SG) {
+		if (!ttm->sg) {
+			struct dma_buf_attachment *attach;
+			struct sg_table *sgt;
+
+			attach = gtt->gobj->import_attach;
+			sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
+			if (IS_ERR(sgt))
+				return PTR_ERR(sgt);
+
+			ttm->sg = sgt;
+		}
+
 		drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
 						 gtt->ttm.dma_address,
 						 ttm->num_pages);
@@ -1286,9 +1300,8 @@ static int amdgpu_ttm_tt_populate(struct ttm_tt *ttm,
  */
 static void amdgpu_ttm_tt_unpopulate(struct ttm_tt *ttm)
 {
-	struct amdgpu_device *adev;
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
-	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
+	struct amdgpu_device *adev;
 
 	if (gtt && gtt->userptr) {
 		amdgpu_ttm_tt_set_user_pages(ttm, NULL);
@@ -1297,7 +1310,16 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_tt *ttm)
 		return;
 	}
 
-	if (slave)
+	if (ttm->sg && gtt->gobj->import_attach) {
+		struct dma_buf_attachment *attach;
+
+		attach = gtt->gobj->import_attach;
+		dma_buf_unmap_attachment(attach, ttm->sg, DMA_BIDIRECTIONAL);
+		ttm->sg = NULL;
+		return;
+	}
+
+	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
 		return;
 
 	adev = amdgpu_ttm_adev(ttm->bdev);
-- 
2.17.1

