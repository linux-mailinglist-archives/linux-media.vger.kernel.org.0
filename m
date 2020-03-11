Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAEAB181A4B
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 14:52:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729782AbgCKNwK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 09:52:10 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54032 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729737AbgCKNwI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 09:52:08 -0400
Received: by mail-wm1-f66.google.com with SMTP id 25so2175510wmk.3
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 06:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2jcARVtU7yHOinId9qpR+Hw2dvEtPObOk+bGG1YCV/I=;
        b=Rev8PwV8NSO3oQAw2LPqgoEXhvX6BYGUxYbiA+lZkiM45h0DZY9dnfvap0AVX0PmrV
         GWOxV97wObC6ucxP2TzwGJYI70uLFztyWABHxbPC3RuwZQ7dOpqV7krX0OgYeM/ejPQC
         FM2XCzZOtBnmBOyL4rwEsS4803uB5w2op9/QGYmJ8VusjgwUkRXth0NHVC/8Y9PLZpzq
         +G5G8DmRDUPaI9gnYPq0ytyfwnWiUbzO5pPM4o1qGV465MDR3q35sYVQQMqzzm9k2gH7
         YBjzps9jxuGiVQXmQS6ddaWTDNgrwY2hCqIbKRh4+wCQflbUAgQ7+fdaEE6qbYNR0WFQ
         jKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2jcARVtU7yHOinId9qpR+Hw2dvEtPObOk+bGG1YCV/I=;
        b=qqtHeHKIt/i9H1VeXK5Uv39RKPMWnMKyd2KfC/1CovaG0tkefLKq7QP6z5Jw7h8yVk
         RFebsSTbJx0uBJ1vtvizy5I1ONeyd30o0X4yfwed94KynwZw3ct4JKAG3CsQ/5uqqR6B
         fK7isKldufeRCH0Q2gnMPL1lkQaYEo0iyMyzHyleMl+22Io3rMJ9Bq5cd6LBBgOJ4UYR
         HkIBW+lwXc/YAALld0fpko9OxSNLd0qOrb9MMo7zLjd4qYsRKKRC9D5t1g+4j8vwr1T1
         +tI6r+TZ1skvRoBcoEO6+30rNSiNNED6tPI6CZ/6MDXRYkFTRqtTE//VWkHhMyxghyea
         KxJw==
X-Gm-Message-State: ANhLgQ2/sQ1StqaXRt/9RJinl8zScqbo0lgPuSYlfv3B7Ya2mli2JIbv
        h0yN/uX5sZJXE83LHeA1wI8=
X-Google-Smtp-Source: ADFU+vvUSYX5/OM5hcn0nhu2x1Tew/qLu46Zbs/YfGjEMxA7BATk4X93nC/7GYaJ7x30Kuv7UgiyNQ==
X-Received: by 2002:a05:600c:258:: with SMTP id 24mr3917220wmj.59.1583934726458;
        Wed, 11 Mar 2020 06:52:06 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8dc:e796:e7da:a319])
        by smtp.gmail.com with ESMTPSA id 138sm3183811wmb.21.2020.03.11.06.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 06:52:06 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     David1.Zhou@amd.com, hch@infradead.org, jgg@ziepe.ca,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/6] drm/amdgpu: add support for exporting VRAM using DMA-buf v2
Date:   Wed, 11 Mar 2020 14:51:57 +0100
Message-Id: <20200311135158.3310-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311135158.3310-1-christian.koenig@amd.com>
References: <20200311135158.3310-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We should be able to do this now after checking all the prerequisites.

v2: fix entrie count in the sgt

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c  | 56 ++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      | 12 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 97 ++++++++++++++++++++
 3 files changed, 151 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index bbf67800c8a6..43d8ed7dbd00 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -276,14 +276,21 @@ static struct sg_table *amdgpu_dma_buf_map(struct dma_buf_attachment *attach,
 	struct dma_buf *dma_buf = attach->dmabuf;
 	struct drm_gem_object *obj = dma_buf->priv;
 	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
+	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	struct sg_table *sgt;
 	long r;
 
 	if (!bo->pin_count) {
-		/* move buffer into GTT */
+		/* move buffer into GTT or VRAM */
 		struct ttm_operation_ctx ctx = { false, false };
+		unsigned domains = AMDGPU_GEM_DOMAIN_GTT;
 
-		amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_GTT);
+		if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM &&
+		    attach->peer2peer) {
+			bo->flags |= AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
+			domains |= AMDGPU_GEM_DOMAIN_VRAM;
+		}
+		amdgpu_bo_placement_from_domain(bo, domains);
 		r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
 		if (r)
 			return ERR_PTR(r);
@@ -293,20 +300,34 @@ static struct sg_table *amdgpu_dma_buf_map(struct dma_buf_attachment *attach,
 		return ERR_PTR(-EBUSY);
 	}
 
-	sgt = drm_prime_pages_to_sg(bo->tbo.ttm->pages, bo->tbo.num_pages);
-	if (IS_ERR(sgt))
-		return sgt;
-
-	if (!dma_map_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
-			      DMA_ATTR_SKIP_CPU_SYNC))
-		goto error_free;
+	switch (bo->tbo.mem.mem_type) {
+	case TTM_PL_TT:
+		sgt = drm_prime_pages_to_sg(bo->tbo.ttm->pages,
+					    bo->tbo.num_pages);
+		if (IS_ERR(sgt))
+			return sgt;
+
+		if (!dma_map_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
+				      DMA_ATTR_SKIP_CPU_SYNC))
+			goto error_free;
+		break;
+
+	case TTM_PL_VRAM:
+		r = amdgpu_vram_mgr_alloc_sgt(adev, &bo->tbo.mem, attach->dev,
+					      dir, &sgt);
+		if (r)
+			return ERR_PTR(r);
+		break;
+	default:
+		return ERR_PTR(-EINVAL);
+	}
 
 	return sgt;
 
 error_free:
 	sg_free_table(sgt);
 	kfree(sgt);
-	return ERR_PTR(-ENOMEM);
+	return ERR_PTR(-EBUSY);
 }
 
 /**
@@ -322,9 +343,18 @@ static void amdgpu_dma_buf_unmap(struct dma_buf_attachment *attach,
 				 struct sg_table *sgt,
 				 enum dma_data_direction dir)
 {
-	dma_unmap_sg(attach->dev, sgt->sgl, sgt->nents, dir);
-	sg_free_table(sgt);
-	kfree(sgt);
+	struct dma_buf *dma_buf = attach->dmabuf;
+	struct drm_gem_object *obj = dma_buf->priv;
+	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
+	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
+
+	if (sgt->sgl->page_link) {
+		dma_unmap_sg(attach->dev, sgt->sgl, sgt->nents, dir);
+		sg_free_table(sgt);
+		kfree(sgt);
+	} else {
+		amdgpu_vram_mgr_free_sgt(adev, attach->dev, dir, sgt);
+	}
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 7551f3729445..a99d813b23a5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -24,8 +24,9 @@
 #ifndef __AMDGPU_TTM_H__
 #define __AMDGPU_TTM_H__
 
-#include "amdgpu.h"
+#include <linux/dma-direction.h>
 #include <drm/gpu_scheduler.h>
+#include "amdgpu.h"
 
 #define AMDGPU_PL_GDS		(TTM_PL_PRIV + 0)
 #define AMDGPU_PL_GWS		(TTM_PL_PRIV + 1)
@@ -74,6 +75,15 @@ uint64_t amdgpu_gtt_mgr_usage(struct ttm_mem_type_manager *man);
 int amdgpu_gtt_mgr_recover(struct ttm_mem_type_manager *man);
 
 u64 amdgpu_vram_mgr_bo_visible_size(struct amdgpu_bo *bo);
+int amdgpu_vram_mgr_alloc_sgt(struct amdgpu_device *adev,
+			      struct ttm_mem_reg *mem,
+			      struct device *dev,
+			      enum dma_data_direction dir,
+			      struct sg_table **sgt);
+void amdgpu_vram_mgr_free_sgt(struct amdgpu_device *adev,
+			      struct device *dev,
+			      enum dma_data_direction dir,
+			      struct sg_table *sgt);
 uint64_t amdgpu_vram_mgr_usage(struct ttm_mem_type_manager *man);
 uint64_t amdgpu_vram_mgr_vis_usage(struct ttm_mem_type_manager *man);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 82a3299e53c0..c6e7f00c5b21 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -22,6 +22,7 @@
  * Authors: Christian König
  */
 
+#include <linux/dma-mapping.h>
 #include "amdgpu.h"
 #include "amdgpu_vm.h"
 #include "amdgpu_atomfirmware.h"
@@ -458,6 +459,102 @@ static void amdgpu_vram_mgr_del(struct ttm_mem_type_manager *man,
 	mem->mm_node = NULL;
 }
 
+/**
+ * amdgpu_vram_mgr_alloc_sgt - allocate and fill a sg table
+ *
+ * @adev: amdgpu device pointer
+ * @mem: TTM memory object
+ * @dev: the other device
+ * @dir: dma direction
+ * @sgt: resulting sg table
+ *
+ * Allocate and fill a sg table from a VRAM allocation.
+ */
+int amdgpu_vram_mgr_alloc_sgt(struct amdgpu_device *adev,
+			      struct ttm_mem_reg *mem,
+			      struct device *dev,
+			      enum dma_data_direction dir,
+			      struct sg_table **sgt)
+{
+	struct drm_mm_node *node;
+	struct scatterlist *sg;
+	int num_entries = 0;
+	unsigned int pages;
+	int i, r;
+
+	*sgt = kmalloc(sizeof(*sg), GFP_KERNEL);
+	if (!*sgt)
+		return -ENOMEM;
+
+	for (pages = mem->num_pages, node = mem->mm_node;
+	     pages; pages -= node->size, ++node)
+		++num_entries;
+
+	r = sg_alloc_table(*sgt, num_entries, GFP_KERNEL);
+	if (r)
+		goto error_free;
+
+	for_each_sg((*sgt)->sgl, sg, num_entries, i)
+		sg->length = 0;
+
+	node = mem->mm_node;
+	for_each_sg((*sgt)->sgl, sg, num_entries, i) {
+		phys_addr_t phys = (node->start << PAGE_SHIFT) +
+			adev->gmc.aper_base;
+		size_t size = node->size << PAGE_SHIFT;
+		dma_addr_t addr;
+
+		++node;
+		addr = dma_map_resource(dev, phys, size, dir,
+					DMA_ATTR_SKIP_CPU_SYNC);
+		r = dma_mapping_error(dev, addr);
+		if (r)
+			goto error_unmap;
+
+		sg_set_dma_addr(sg, addr, size, 0);
+	}
+	return 0;
+
+error_unmap:
+	for_each_sg((*sgt)->sgl, sg, num_entries, i) {
+		if (!sg->length)
+			continue;
+
+		dma_unmap_resource(dev, sg->dma_address,
+				   sg->length, dir,
+				   DMA_ATTR_SKIP_CPU_SYNC);
+	}
+	sg_free_table(*sgt);
+
+error_free:
+	kfree(*sgt);
+	return r;
+}
+
+/**
+ * amdgpu_vram_mgr_alloc_sgt - allocate and fill a sg table
+ *
+ * @adev: amdgpu device pointer
+ * @sgt: sg table to free
+ *
+ * Free a previously allocate sg table.
+ */
+void amdgpu_vram_mgr_free_sgt(struct amdgpu_device *adev,
+			      struct device *dev,
+			      enum dma_data_direction dir,
+			      struct sg_table *sgt)
+{
+	struct scatterlist *sg;
+	int i;
+
+	for_each_sg(sgt->sgl, sg, sgt->nents, i)
+		dma_unmap_resource(dev, sg->dma_address,
+				   sg->length, dir,
+				   DMA_ATTR_SKIP_CPU_SYNC);
+	sg_free_table(sgt);
+	kfree(sgt);
+}
+
 /**
  * amdgpu_vram_mgr_usage - how many bytes are used in this domain
  *
-- 
2.17.1

