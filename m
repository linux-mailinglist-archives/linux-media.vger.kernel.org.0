Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1B41E85E3
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 11:41:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728242AbfJ2Kk7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Oct 2019 06:40:59 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36377 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbfJ2Kk6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Oct 2019 06:40:58 -0400
Received: by mail-wm1-f65.google.com with SMTP id c22so1837030wmd.1
        for <linux-media@vger.kernel.org>; Tue, 29 Oct 2019 03:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=afa9t+VsqFHDuya8zvtChwbhfZZ4SJZY0fGLtCU45oo=;
        b=fIA1+My0RIXojVmVd/x+zsHMj4MphMCNNeaxqu8WdwaQpUxfIDEgYmsNrBvCwaVpGv
         TZfhpUUpzWWexWRkxVYud8Do+qkms/0E4LTgByHaStZdnk9dn2FCQINOiEE6S7+Whmql
         1p5Mwlq/7Yo/JhZJHgdUS1D0F8kJKOjjQri96iceY+cq8q2u9Nsr9SeAIxgQJTvvFyH/
         2u+WSniSdzdQm9ozc+v5Rf3TWvdXW0r5ISsMgKQgoLU/mt4nGjAd6/C7f11Wg81R0t15
         0zZ332FuZLf/5fLMWl2p+1NzqVlDmQrZkf97i4Y68gQyxfy197FDrGgo/oDM6qKx+CSz
         ncTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=afa9t+VsqFHDuya8zvtChwbhfZZ4SJZY0fGLtCU45oo=;
        b=mIEZfMLukwUHR+nMQn1aKqpYfXR3QmOZxJL4zhFQ8IuXDneyhm8Cp0j0azLZV+YIdj
         CWV6dHKJ3RdpFUVn/SIgvK9rchKMGdmoqbnLmvmXr3YB/G8j3i+ODdPH1q3xaWyogw8s
         602o+MuKUDZxetxFaqbUZteQHvUXFDuQ1MqFDJ4xdsXkE92H+oMtaWUylFQSKLCz2Aod
         TDD7/AudslyT+10T1zmGpmcqkQRm9nikK3FbKZvX7yWS1KDbWKGMKAYT0EdhbwURzwUR
         VLMtqbPrZ2gnlP5gRSbDPfU2xV2ZPSAb23DYo2jsnoOBqOtT9XqEgSr0dAkwyCAn0Q9o
         qL9w==
X-Gm-Message-State: APjAAAVGhZzGbsk+HPMgG82y+8TDFtPS2Oe5hKstOXVTgB39IfsxDXi/
        ukpcMW0bSwEWad4xo76fHHM=
X-Google-Smtp-Source: APXvYqxfQYoOJ87HtigJtrvgBEC3c0qj7kFOVbYr4kAAazHcLZwlVHbEYqOuR9qoVhuBoaj/orONRQ==
X-Received: by 2002:a1c:c912:: with SMTP id f18mr3649733wmb.168.1572345655483;
        Tue, 29 Oct 2019 03:40:55 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c5d9:7998:9ca6:452])
        by smtp.gmail.com with ESMTPSA id v10sm2910210wmg.48.2019.10.29.03.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 03:40:55 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/5] drm/amdgpu: add amdgpu_dma_buf_pin/unpin
Date:   Tue, 29 Oct 2019 11:40:48 +0100
Message-Id: <20191029104049.9011-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029104049.9011-1-christian.koenig@amd.com>
References: <20191029104049.9011-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This implements the exporter side of unpinned DMA-buf handling.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 55 ++++++++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  5 ++
 2 files changed, 53 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 8e5a68107556..3629cfe53aad 100644
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
@@ -244,9 +275,21 @@ static struct sg_table *amdgpu_dma_buf_map(struct dma_buf_attachment *attach,
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
+			return ERR_PTR(-EBUSY);
+	}
+
+
 
 	sgt = drm_prime_pages_to_sg(bo->tbo.ttm->pages, bo->tbo.num_pages);
 	if (IS_ERR(sgt))
@@ -277,13 +320,9 @@ static void amdgpu_dma_buf_unmap(struct dma_buf_attachment *attach,
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
@@ -330,6 +369,8 @@ const struct dma_buf_ops amdgpu_dmabuf_ops = {
 	.dynamic_mapping = true,
 	.attach = amdgpu_dma_buf_attach,
 	.detach = amdgpu_dma_buf_detach,
+	.pin = amdgpu_dma_buf_pin,
+	.unpin = amdgpu_dma_buf_unpin,
 	.map_dma_buf = amdgpu_dma_buf_map,
 	.unmap_dma_buf = amdgpu_dma_buf_unmap,
 	.release = drm_gem_dmabuf_release,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 6f0b789a0b49..ac776d2620eb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -31,6 +31,7 @@
  */
 #include <linux/list.h>
 #include <linux/slab.h>
+#include <linux/dma-buf.h>
 
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_cache.h>
@@ -1209,6 +1210,10 @@ void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
 
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

