Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C65BDEA97
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 13:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728325AbfJULPd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Oct 2019 07:15:33 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40110 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728119AbfJULPd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 07:15:33 -0400
Received: by mail-wr1-f66.google.com with SMTP id o28so13474520wro.7
        for <linux-media@vger.kernel.org>; Mon, 21 Oct 2019 04:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=R2338DozlAdMup+TC57MqJoEZ6+BquoNGXxiKwrH+70=;
        b=jy8nh4qHLdIk+aq6S2YEGbPhUk6/hzJxMRd0FjroxEaxmAfXES/CtLkLlP40TsGGfP
         zJ4DDSLWVXNW/q2FmyvMXGMaOHLaKu/ismUXK7a2bR14ofaGdxBj3fEojjjN+0Kycqbz
         bZk88eVTH/tTGyoj1g5icRe69BQdDHMZnNtRgceAn1Mi3n217nWWTTmS2AmJdMlSULMj
         VRUlZnxwdqkFee2MhKiGIzcIhZclYgNodmlH+P6KO9eJg8yzYsj4b/Nfk9yYbD545lus
         fZI2cEKXBr/HtbR/hwdX/gQtNE4OCF6k/ogOcG6Cr8Ync7+kwd945Xx2O2EnaxHk1U5J
         UoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R2338DozlAdMup+TC57MqJoEZ6+BquoNGXxiKwrH+70=;
        b=Qeuw6PvqSxdlWzctw9eUR9ITugroULVm6n06gyfJUk1HcTgQQwsUQTA6dFbkypH82U
         N9LwGhtebOn2wY9bq4nAq9Sz4a8Mi6W0Q2P9W8u3rL7CGXBO8xYSekCtY5E814webdoa
         9hPbMXsZOSzr3UGKHZy7Rk9guQoZdvEIBCoI3VuInSSWVWfDQO3Y2gD0GbW5AKDAFdOg
         aNlF1Zx7RpdnzDya1/byiIh+m1uAm6gJjmp+DsV+y94o3UOJmq4WLe3KPFlU4TDBO9cL
         rTfvHL9Kh7ff5OjN0jn6VizPGGi/zn2YDQ2K0lSOKCcnoBBRhQIQQKlAyN2p/7/IkiKD
         pZfQ==
X-Gm-Message-State: APjAAAXg/DOy7RjBnrzORZWHtCF0XLE3b0hKrNuWwzj0+LNvpWxXD162
        7Swtx14c6A2XWnCYvPe/oRU=
X-Google-Smtp-Source: APXvYqyT5LxGSXsW1R7Ze9hnyXVce3VExqcFQh5YLbQX63dKYRj1QbqdsndSU+aQf11JHDMCEj7tig==
X-Received: by 2002:adf:fa92:: with SMTP id h18mr19345547wrr.220.1571656530401;
        Mon, 21 Oct 2019 04:15:30 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c194:dd41:4bef:70cc])
        by smtp.gmail.com with ESMTPSA id l9sm13152415wme.45.2019.10.21.04.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 04:15:29 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, daniel@ffwll.ch
Subject: [PATCH 4/4] drm/amdgpu: add independent DMA-buf import v8
Date:   Mon, 21 Oct 2019 13:15:24 +0200
Message-Id: <20191021111524.14793-4-christian.koenig@amd.com>
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
index f14b52cc7205..c22d11df013e 100644
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
index bf5bf15b12e3..7acca058510c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1409,7 +1409,6 @@ static struct drm_driver kms_driver = {
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_export = amdgpu_gem_prime_export,
 	.gem_prime_import = amdgpu_gem_prime_import,
-	.gem_prime_import_sg_table = amdgpu_gem_prime_import_sg_table,
 	.gem_prime_vmap = amdgpu_gem_prime_vmap,
 	.gem_prime_vunmap = amdgpu_gem_prime_vunmap,
 	.gem_prime_mmap = amdgpu_gem_prime_mmap,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 8e867b8b432f..c19100ced040 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -39,6 +39,7 @@
 #include <linux/slab.h>
 #include <linux/swap.h>
 #include <linux/swiotlb.h>
+#include <linux/dma-buf.h>
 
 #include <drm/ttm/ttm_bo_api.h>
 #include <drm/ttm/ttm_bo_driver.h>
@@ -763,6 +764,7 @@ static unsigned long amdgpu_ttm_io_mem_pfn(struct ttm_buffer_object *bo,
  */
 struct amdgpu_ttm_tt {
 	struct ttm_dma_tt	ttm;
+	struct drm_gem_object	*gobj;
 	u64			offset;
 	uint64_t		userptr;
 	struct task_struct	*usertask;
@@ -1227,6 +1229,7 @@ static struct ttm_tt *amdgpu_ttm_tt_create(struct ttm_buffer_object *bo,
 		return NULL;
 	}
 	gtt->ttm.ttm.func = &amdgpu_backend_func;
+	gtt->gobj = &bo->base;
 
 	/* allocate space for the uninitialized page entries */
 	if (ttm_sg_tt_init(&gtt->ttm, bo, page_flags)) {
@@ -1247,7 +1250,6 @@ static int amdgpu_ttm_tt_populate(struct ttm_tt *ttm,
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(ttm->bdev);
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
-	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
 	/* user pages are bound by amdgpu_ttm_tt_pin_userptr() */
 	if (gtt && gtt->userptr) {
@@ -1260,7 +1262,19 @@ static int amdgpu_ttm_tt_populate(struct ttm_tt *ttm,
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
@@ -1287,9 +1301,8 @@ static int amdgpu_ttm_tt_populate(struct ttm_tt *ttm,
  */
 static void amdgpu_ttm_tt_unpopulate(struct ttm_tt *ttm)
 {
-	struct amdgpu_device *adev;
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
-	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
+	struct amdgpu_device *adev;
 
 	if (gtt && gtt->userptr) {
 		amdgpu_ttm_tt_set_user_pages(ttm, NULL);
@@ -1298,7 +1311,16 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_tt *ttm)
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

