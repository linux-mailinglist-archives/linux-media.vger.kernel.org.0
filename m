Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E27CE85E5
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 11:41:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728250AbfJ2Kk7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Oct 2019 06:40:59 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53261 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727828AbfJ2Kk6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Oct 2019 06:40:58 -0400
Received: by mail-wm1-f66.google.com with SMTP id n7so1981654wmc.3
        for <linux-media@vger.kernel.org>; Tue, 29 Oct 2019 03:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EZZU5bRYdYPxvxkSBZwgeMdYqb5VQhKicOFsE9+pkSY=;
        b=Dj4uC/vktCWtrANQoSxJclNWtNkY5zJn3/9hTtftnAotFWTFgBzPzJZKYLNCEaiCrf
         W48UYacMEJZ9EZutXNqaIxDmKTVKib8I6Y8JsWOZDwIZ05TIdGInHhVtzds4E6PouqBs
         6s1Ci1kJ4y/Tts5wHkQS+VkAKIfaoSEwLKR5Ej0Wu0kurlVCxUeSsOz5k9rbc+zABhZT
         /ok9pzC/BBsLJdxHNwsnrm+cMfpvQG49uRJbKHuPQqRGa/vfhQx5xWClcjdn8nQJFE/h
         0eKGh17x1VEMsRSeNIZ1b+Rr0AUeS7PZovqyCURgRqmE6NUIisJK+Pie9F9ArCMGsytF
         XGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EZZU5bRYdYPxvxkSBZwgeMdYqb5VQhKicOFsE9+pkSY=;
        b=j3tQtpN4SdHX6jl0aimHaNq9Tj5U5aXSy4X21U3FfQfpaq9nPjxCbr9DEIPaafQg/d
         KwYYqLmHgCiTMnIP4Hz/gADh+eZ3pSx0nrC/yGkEnn/dX+9ROupS2fHhF/ij2DQL+qyf
         06WpnItQCPhntJ43TCMPT+gAlLfY+CIsJjKOwOFBKOsnbLh/5/ds3/sAUxJI9UAMfTvF
         OuXIWDaoXbSSQ2/GMG/vUsWAaYpItkhERSLmPoWLrZYvQ9MuXXQDE/wa5Fgc8kM0FlDI
         esUUqWlWii3RvAeJBJywQcI4hWrcclUJCN55JuJIWZhJE1LpQX5JSE8Ib3usmB4CbqgV
         TL8Q==
X-Gm-Message-State: APjAAAXzz+9F3R1OfvM/jD/hZ4IfRdyFfQckA/ofw7jIsxGc7QxSOPAI
        jN/CwWF4UjjGn2SxxCKu5WNy7iPv
X-Google-Smtp-Source: APXvYqxOu+hFqNuLcI9KSzwSAHPMqQVYZfk3AOs6kdG9rEF6QoxKiO5ihOtgGXhcYFTY4wmJpNflTA==
X-Received: by 2002:a1c:8055:: with SMTP id b82mr3524726wmd.176.1572345656392;
        Tue, 29 Oct 2019 03:40:56 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c5d9:7998:9ca6:452])
        by smtp.gmail.com with ESMTPSA id v10sm2910210wmg.48.2019.10.29.03.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 03:40:55 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/5] drm/amdgpu: implement amdgpu_gem_prime_move_notify
Date:   Tue, 29 Oct 2019 11:40:49 +0100
Message-Id: <20191029104049.9011-6-christian.koenig@amd.com>
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

Implement the importer side of unpinned DMA-buf handling.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 28 ++++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  6 +++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 3629cfe53aad..af39553c51ad 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -456,7 +456,33 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
 	return ERR_PTR(ret);
 }
 
+/**
+ * amdgpu_dma_buf_move_notify - &attach.move_notify implementation
+ *
+ * @attach: the DMA-buf attachment
+ *
+ * Invalidate the DMA-buf attachment, making sure that the we re-create the
+ * mapping before the next use.
+ */
+static void
+amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
+{
+	struct ttm_operation_ctx ctx = { false, false };
+	struct drm_gem_object *obj = attach->importer_priv;
+	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
+	struct ttm_placement placement = {};
+	int r;
+
+	if (bo->tbo.mem.mem_type == TTM_PL_SYSTEM)
+		return;
+
+	r = ttm_bo_validate(&bo->tbo, &placement, &ctx);
+	if (r)
+		DRM_ERROR("Failed to invalidate DMA-buf import (%d))\n", r);
+}
+
 static const struct dma_buf_attach_ops amdgpu_dma_buf_attach_ops = {
+	.move_notify = amdgpu_dma_buf_move_notify
 };
 
 /**
@@ -492,7 +518,7 @@ struct drm_gem_object *amdgpu_gem_prime_import(struct drm_device *dev,
 		return obj;
 
 	attach = dma_buf_dynamic_attach(dma_buf, dev->dev,
-					&amdgpu_dma_buf_attach_ops, NULL);
+					&amdgpu_dma_buf_attach_ops, obj);
 	if (IS_ERR(attach)) {
 		drm_gem_object_put(obj);
 		return ERR_CAST(attach);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index ac776d2620eb..cfa46341c9a7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -861,6 +861,9 @@ int amdgpu_bo_pin_restricted(struct amdgpu_bo *bo, u32 domain,
 		return 0;
 	}
 
+	if (bo->tbo.base.import_attach)
+		dma_buf_pin(bo->tbo.base.import_attach);
+
 	bo->flags |= AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS;
 	/* force to pin into visible video ram */
 	if (!(bo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS))
@@ -944,6 +947,9 @@ int amdgpu_bo_unpin(struct amdgpu_bo *bo)
 
 	amdgpu_bo_subtract_pin_size(bo);
 
+	if (bo->tbo.base.import_attach)
+		dma_buf_unpin(bo->tbo.base.import_attach);
+
 	for (i = 0; i < bo->placement.num_placement; i++) {
 		bo->placements[i].lpfn = 0;
 		bo->placements[i].flags &= ~TTM_PL_FLAG_NO_EVICT;
-- 
2.17.1

