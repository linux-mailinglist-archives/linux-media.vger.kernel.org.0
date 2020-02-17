Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27DA5161684
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 16:45:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729425AbgBQPpT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 10:45:19 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38475 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729423AbgBQPpT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 10:45:19 -0500
Received: by mail-wm1-f65.google.com with SMTP id a9so18969050wmj.3
        for <linux-media@vger.kernel.org>; Mon, 17 Feb 2020 07:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DTuvyG78WcjqeJ7e/qaUw+xYLvgTBFlwM1sb8UnDIGQ=;
        b=DDlrlbnPTxe13tevABHbYLugl/rab7umxYqAyr6zOP4bqIqo5Tl92lJiwAT963QCyP
         ajHvEtiZjG5UyQy2/W94pHDKwnr0WgLZyzRSP3TNK6IjQ61cRnTBLMTdJ0njbalcLqqb
         jeNKlLVjF9qi7dXSG+Pz1E/Jl8fQ7kyfGldk5sBB5+VAm29eGu16hblKta7SaVPwzEgp
         05Fm/cbKug4JYufUSlASCmLDn7u4lnfqLFHgk3bn+w66B6YOeAr9aTaY1bwT/qTGaDE+
         +pWTXI+1BcVdc0pAa2NePp9/HtKK7/Od1AeABjs7UF7b93a8JPHtPiQCwRYm1iS2Exa3
         ZE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DTuvyG78WcjqeJ7e/qaUw+xYLvgTBFlwM1sb8UnDIGQ=;
        b=pqaffhzRMGibqsXDRm0GBXNmxBoT2u39SBmt9NLGMr6jTKfbLYS18q/6bcdvaidebX
         ifZO7hEvEERV3pnz7e2EVhGXT5aIX4BcXEIxlrjq+jZNvU4aVvoBxrBE4HrInH4CZ3I1
         to2IGTAtef+cp5vPf1gIkkBGKNnoQyScAJexugBzMy+npPRmubT6AKrV15GOgItrZwyG
         Nf+0SAG+LLOXk0y/qyb8ehU485eNP4EUDYsiHNA9SiTZMm3WSOzFF5HMnwNJIovuhUJu
         wBuZhYkZ85UuKqaBbbpdKqGm/qLYw2gzrHidanZjNW3rbzE2XWwvofYked7GwSJIOiIk
         Ma1A==
X-Gm-Message-State: APjAAAVLwBRxEsArEFzXFdLMQgJkBsuB8Yw6saeSWWVTajbgAFkFsvrS
        KdUSdyulNiK4Pbu3J3olWV8=
X-Google-Smtp-Source: APXvYqx/R1np84PQIPV+XzXYKq4vo8+VeAkA/u0pJU6BbdkOFa0/JwfM48wB2N3r5oD/DG7aiiuodA==
X-Received: by 2002:a1c:c5:: with SMTP id 188mr22235179wma.187.1581954316755;
        Mon, 17 Feb 2020 07:45:16 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:180d:d2d6:6ff9:a6cb])
        by smtp.gmail.com with ESMTPSA id r6sm1372658wrq.92.2020.02.17.07.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 07:45:16 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch
Subject: [PATCH 4/5] drm/amdgpu: add amdgpu_dma_buf_pin/unpin v2
Date:   Mon, 17 Feb 2020 16:45:08 +0100
Message-Id: <20200217154509.2265-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200217154509.2265-1-christian.koenig@amd.com>
References: <20200217154509.2265-1-christian.koenig@amd.com>
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
index b2ca78b6abce..770baba621b3 100644
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
index 6f60a581e3ba..8ae260822908 100644
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

