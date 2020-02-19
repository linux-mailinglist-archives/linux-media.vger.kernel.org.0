Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3BB11644BF
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 13:59:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgBSM7S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 07:59:18 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34744 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727495AbgBSM7S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 07:59:18 -0500
Received: by mail-wr1-f66.google.com with SMTP id n10so460506wrm.1
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2020 04:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OElTxghyTH86kHtcfVRGcu/ONk7vrDxqBRGJ9vXA9pQ=;
        b=mSIpv/tGGZwu4kIvk8Xud//CdnpRIzhBN5gpdFFsroEZs/culxZx/m0Eq/ydviFC+x
         HaLyMjOSQCwpbkz9g1MKG0NXZlixof/TRu8eTtZAICfn6GjTbcEEwbuJemCFIU+lskkt
         wDWnoMlKHg9GY1BoCGDrHSAdBGP+Z9syNOH35gUoqu5v3LiSHBTqyjqMgquXRDCU5GvA
         hV/DTJHfy/s4SrQkTiExssteihlxE7X4yQqe+qbcT1JANZ8UsCjNoTnVQ6OVjSkqJl2S
         mCahlhqZx8i5T86zdx8/rOXVgMtgIyme5pYgmQ/LAU68MByv+pmB2mARJjcksCiTWdle
         EQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OElTxghyTH86kHtcfVRGcu/ONk7vrDxqBRGJ9vXA9pQ=;
        b=jmoG9eUfZqJN6lsJnJQR1FZ4kXsHnvguVxmTLilBlXYGa7FpL6d6PGbU1jvlfkyGzs
         ZBlvido4VlbWmeuIyND+75ntRuK6Wy06pBMAPTFEmrdDdwkmfUFzO6c4T5pMkzpOUJhq
         p8O0eDSE69YpYQ3Xn/gOLaQRWAB7URYq04SJSlf4Ezl5Mhd/dU1yn1K7fU7vgYJ/RJpU
         vWl8+qlqiJqX2rqAvxAbsbBggTIqzzlhjED5HGbuAayvIGpPie5tu2AoUxiOrsW06eFl
         QylFfYeVFxs2epetst+k8TvZ1tt9dDNMMJgjLK3JI6K0VbsNB8Pw3+YM9iL0ZAS+GffJ
         4f+g==
X-Gm-Message-State: APjAAAVTFOcaRUFwD7xfjZk/JQpBMkuKm5JZPYPZoUdvXpUqsI5/GGeF
        jPgRyZI7UjLxO2a5qZ5EzuY=
X-Google-Smtp-Source: APXvYqwL2YRZxVy0lePepHz2hRBbkW+g1EU+P7Ov52z6fLQlGLkYSyya011NM0gC/8/kM1GPY4SXNQ==
X-Received: by 2002:adf:a381:: with SMTP id l1mr35888322wrb.102.1582117155287;
        Wed, 19 Feb 2020 04:59:15 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:90ea:9d7:18a3:895e])
        by smtp.gmail.com with ESMTPSA id h2sm3079024wrt.45.2020.02.19.04.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 04:59:14 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch
Subject: [PATCH 5/7] drm/amdgpu: implement amdgpu_gem_prime_move_notify v2
Date:   Wed, 19 Feb 2020 13:59:08 +0100
Message-Id: <20200219125910.89147-5-christian.koenig@amd.com>
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

Implement the importer side of unpinned DMA-buf handling.

v2: update page tables immediately

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 66 ++++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  6 ++
 2 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 86000c75b133..1a040ccf61bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -451,7 +451,71 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
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
+	struct drm_gem_object *obj = attach->importer_priv;
+	struct ww_acquire_ctx *ticket = dma_resv_locking_ctx(obj->resv);
+	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
+	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
+	struct ttm_operation_ctx ctx = { false, false };
+	struct ttm_placement placement = {};
+	struct amdgpu_vm_bo_base *bo_base;
+	int r;
+
+	if (bo->tbo.mem.mem_type == TTM_PL_SYSTEM)
+		return;
+
+	r = ttm_bo_validate(&bo->tbo, &placement, &ctx);
+	if (r) {
+		DRM_ERROR("Failed to invalidate DMA-buf import (%d))\n", r);
+		return;
+	}
+
+	for (bo_base = bo->vm_bo; bo_base; bo_base = bo_base->next) {
+		struct amdgpu_vm *vm = bo_base->vm;
+		struct dma_resv *resv = vm->root.base.bo->tbo.base.resv;
+
+		if (ticket) {
+			/* When we get an error here it means that somebody
+			 * else is holding the VM lock and updating page tables
+			 * So we can just continue here.
+			 */
+			r = dma_resv_lock(resv, ticket);
+			if (r)
+				continue;
+
+		} else {
+			/* TODO: This is more problematic and we actually need
+			 * to allow page tables updates without holding the
+			 * lock.
+			 */
+			if (!dma_resv_trylock(resv))
+				continue;
+		}
+
+		r = amdgpu_vm_clear_freed(adev, vm, NULL);
+		if (!r)
+			r = amdgpu_vm_handle_moved(adev, vm);
+
+		if (r && r != -EBUSY)
+			DRM_ERROR("Failed to invalidate VM page tables (%d))\n",
+				  r);
+
+		dma_resv_unlock(resv);
+	}
+}
+
 static const struct dma_buf_attach_ops amdgpu_dma_buf_attach_ops = {
+	.move_notify = amdgpu_dma_buf_move_notify
 };
 
 /**
@@ -487,7 +551,7 @@ struct drm_gem_object *amdgpu_gem_prime_import(struct drm_device *dev,
 		return obj;
 
 	attach = dma_buf_dynamic_attach(dma_buf, dev->dev,
-					&amdgpu_dma_buf_attach_ops, NULL);
+					&amdgpu_dma_buf_attach_ops, obj);
 	if (IS_ERR(attach)) {
 		drm_gem_object_put(obj);
 		return ERR_CAST(attach);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 9de8374bbbab..5fa8f59c4ccf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -926,6 +926,9 @@ int amdgpu_bo_pin_restricted(struct amdgpu_bo *bo, u32 domain,
 		return 0;
 	}
 
+	if (bo->tbo.base.import_attach)
+		dma_buf_pin(bo->tbo.base.import_attach);
+
 	bo->flags |= AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS;
 	/* force to pin into visible video ram */
 	if (!(bo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS))
@@ -1009,6 +1012,9 @@ int amdgpu_bo_unpin(struct amdgpu_bo *bo)
 
 	amdgpu_bo_subtract_pin_size(bo);
 
+	if (bo->tbo.base.import_attach)
+		dma_buf_unpin(bo->tbo.base.import_attach);
+
 	for (i = 0; i < bo->placement.num_placement; i++) {
 		bo->placements[i].lpfn = 0;
 		bo->placements[i].flags &= ~TTM_PL_FLAG_NO_EVICT;
-- 
2.17.1

