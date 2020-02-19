Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3740C1644BE
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 13:59:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727553AbgBSM7R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 07:59:17 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42515 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727421AbgBSM7Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 07:59:16 -0500
Received: by mail-wr1-f65.google.com with SMTP id k11so390769wrd.9
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2020 04:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=L4Q/3oQgwK0gy+FT05AGDGX84O8UR+MiHQosGOKcELg=;
        b=RBB/zrjIr1dwXb8I+5UI0vwoe41f81rcHhsQx7bOx/gD4XgGp6pZNWcHn14XEZG5IB
         iSSuJRFuUnqFXMd3Khe+iRWKCHcM4n2xpFQnqlykulflhqksJ4Uyrp4aOo2VFgfb62Zc
         +z8oAuI8ZnsKB+IvXhSs1uZYngzckBAYIDsfvEuR7YK0s4jFl5C6pk48kFmmbz2fQVeY
         mcmVMlBRG9YJqclUmU9JU6QclQMn/BFQ34W57y0YIh83eSu+7VrWbyR2PtVVqMUcOcSq
         WNTtIrqCkuCJGucZ45jBM+v7Q7LTN4ygKikbTpmRj5tvEVgqbbKaScJV+VaowaoSLHAl
         Z79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L4Q/3oQgwK0gy+FT05AGDGX84O8UR+MiHQosGOKcELg=;
        b=ed7oqRvH0WFvAkjg7Wj5q5nqjgtKzhTQCKjLpXkSv+Mbea/lf2mcj3t/c57xuUwCTX
         sBA8v6rWREQNi7CBXz1U6fEtbW5QIJdAFraqiNicz4HiFYu/PIeCtkmxjP9aJ4M9qZne
         SstdNGbiPKlPfyaIKEU8PbDQmEUx3nNjndVwcq/4n1Ftoi37dQZCIbApXerAP0UCAXRB
         Iv775aXRcXe+rVFMWSa2PobOiz88BGQEaBQMsLJbBGeYlUBle6l8LKKNPFGft5ItMyXw
         2ZC6PVFvCl3iq6rLECM3L55kkhXkOidZhJsUcPOQagmUfkC9TkckGTHBLojXAbqMJG+4
         ur5Q==
X-Gm-Message-State: APjAAAU0ujed48cCwh2g1KdYDEody7XlHHycHYtKKXLKQIQTU4YYPv5T
        B9xMTaAiwF8mKQbtT0VoxxY=
X-Google-Smtp-Source: APXvYqzpPRKe4aTBgdEvsOC7KBRfOYRIWa91GiCQmxAKibydi60pfA01AKZSEWCmw2Bi+N2RdKUYMg==
X-Received: by 2002:a5d:638f:: with SMTP id p15mr35502478wru.402.1582117154365;
        Wed, 19 Feb 2020 04:59:14 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:90ea:9d7:18a3:895e])
        by smtp.gmail.com with ESMTPSA id h2sm3079024wrt.45.2020.02.19.04.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 04:59:13 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch
Subject: [PATCH 4/7] drm/amdgpu: add amdgpu_dma_buf_pin/unpin v2
Date:   Wed, 19 Feb 2020 13:59:07 +0100
Message-Id: <20200219125910.89147-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200219125910.89147-1-christian.koenig@amd.com>
References: <20200219125910.89147-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This implements the exporter side of unpinned DMA-buf handling.

v2: fix minor coding style issues

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 53 ++++++++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  5 ++
 2 files changed, 51 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 7cafc65fd76a..86000c75b133 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -222,6 +222,37 @@ static void amdgpu_dma_buf_detach(struct dma_buf *dmabuf,
 		bo->prime_shared_count--;
 }
 
+/**
+ * amdgpu_dma_buf_pin - &dma_buf_ops.pin implementation
+ *
+ * @attach: attachment to pin down
+ *
+ * Pin the BO which is backing the DMA-buf so that it can't move any more.
+ */
+static int amdgpu_dma_buf_pin(struct dma_buf_attachment *attach)
+{
+	struct drm_gem_object *obj = attach->dmabuf->priv;
+	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
+
+	/* pin buffer into GTT */
+	return amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT);
+}
+
+/**
+ * amdgpu_dma_buf_unpin - &dma_buf_ops.unpin implementation
+ *
+ * @attach: attachment to unpin
+ *
+ * Unpin a previously pinned BO to make it movable again.
+ */
+static void amdgpu_dma_buf_unpin(struct dma_buf_attachment *attach)
+{
+	struct drm_gem_object *obj = attach->dmabuf->priv;
+	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
+
+	amdgpu_bo_unpin(bo);
+}
+
 /**
  * amdgpu_dma_buf_map - &dma_buf_ops.map_dma_buf implementation
  * @attach: DMA-buf attachment
@@ -244,9 +275,19 @@ static struct sg_table *amdgpu_dma_buf_map(struct dma_buf_attachment *attach,
 	struct sg_table *sgt;
 	long r;
 
-	r = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT);
-	if (r)
-		return ERR_PTR(r);
+	if (!bo->pin_count) {
+		/* move buffer into GTT */
+		struct ttm_operation_ctx ctx = { false, false };
+
+		amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_GTT);
+		r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
+		if (r)
+			return ERR_PTR(r);
+
+	} else if (!(amdgpu_mem_type_to_domain(bo->tbo.mem.mem_type) &
+		     AMDGPU_GEM_DOMAIN_GTT)) {
+		return ERR_PTR(-EBUSY);
+	}
 
 	sgt = drm_prime_pages_to_sg(bo->tbo.ttm->pages, bo->tbo.num_pages);
 	if (IS_ERR(sgt))
@@ -277,13 +318,9 @@ static void amdgpu_dma_buf_unmap(struct dma_buf_attachment *attach,
 				 struct sg_table *sgt,
 				 enum dma_data_direction dir)
 {
-	struct drm_gem_object *obj = attach->dmabuf->priv;
-	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
-
 	dma_unmap_sg(attach->dev, sgt->sgl, sgt->nents, dir);
 	sg_free_table(sgt);
 	kfree(sgt);
-	amdgpu_bo_unpin(bo);
 }
 
 /**
@@ -330,6 +367,8 @@ const struct dma_buf_ops amdgpu_dmabuf_ops = {
 	.dynamic_mapping = true,
 	.attach = amdgpu_dma_buf_attach,
 	.detach = amdgpu_dma_buf_detach,
+	.pin = amdgpu_dma_buf_pin,
+	.unpin = amdgpu_dma_buf_unpin,
 	.map_dma_buf = amdgpu_dma_buf_map,
 	.unmap_dma_buf = amdgpu_dma_buf_unmap,
 	.release = drm_gem_dmabuf_release,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index e3f16b49e970..9de8374bbbab 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -31,6 +31,7 @@
  */
 #include <linux/list.h>
 #include <linux/slab.h>
+#include <linux/dma-buf.h>
 
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_cache.h>
@@ -1274,6 +1275,10 @@ void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
 
 	amdgpu_bo_kunmap(abo);
 
+	if (abo->tbo.base.dma_buf && !abo->tbo.base.import_attach &&
+	    bo->mem.mem_type != TTM_PL_SYSTEM)
+		dma_buf_move_notify(abo->tbo.base.dma_buf);
+
 	/* remember the eviction */
 	if (evict)
 		atomic64_inc(&adev->num_evictions);
-- 
2.17.1

