Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 921E1161685
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 16:45:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729426AbgBQPpU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 10:45:20 -0500
Received: from mail-wr1-f45.google.com ([209.85.221.45]:33193 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729347AbgBQPpT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 10:45:19 -0500
Received: by mail-wr1-f45.google.com with SMTP id u6so20363279wrt.0
        for <linux-media@vger.kernel.org>; Mon, 17 Feb 2020 07:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hlgB5Y1sz7wUV4gQ0dL77L8hf8c+eZoNbZE43csgmz0=;
        b=YUQflYsHLoYhqXsbKXG5J7sQHckE7GsEnfHjRMij/rODMEIkXN2J2irmifKls60q4C
         GfYeh5/Fb/OElFgnYn8N/WBmjvAuGjF6+dPzAClaq1ZXsIIE3BIVVkAEXMe2WCKWnwoe
         xjsSyJs478q8ocKR8aje7kMRDuwAMCnkhR22/EB4OvByzufIeBdX4q1BllMCO5JaUXPO
         B9vhcWTRqy5s1luagOPpz1u9MB3jyKFx6YR/Z2lAQbLtOt2ScB/5JBOX/pQFoNsvZBIB
         e3AJPZba3wyKdf68I/Z+26RUYTgvHEn0Z81/kUnGTCZFJtQwBq9pWU3puzVEUrwB6pXB
         8g3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hlgB5Y1sz7wUV4gQ0dL77L8hf8c+eZoNbZE43csgmz0=;
        b=uTDeLOkitw1PZtf51xk+4j/jTfh/XIyjjHvNZsRjbt5VJTUeqBOuH0utFzkJkcjcxV
         cQ2Q4ZM2Je9LPz9D+CzvFwdTjGuEQQLhs89p/8PXKAJAG06R6ZSC9JKomMJOdjVkQpeR
         IBiUH4kS33oEavOKaH6b72FRCHuRk1BPqE0I1WJkG25M97RTTWyvAa5ebW2PvITJLHNz
         HOC8p29RYw/VteKl8Esyq59AxEvkdHa3c7EVjc4EoL2dPwZIPQVXQzJMg5wzoVvN3QpZ
         5avokkDmjx+QuM6AEBl9jtBmGUtEJPYW4rYL0aV3MAfkNYM8zCUNe6Ct4H1wrsQpI1v/
         O+Qg==
X-Gm-Message-State: APjAAAUDosGXlYt7qve72D9KCXEEj5g9BukOcjJ/AvSpI4sjHaubm9w/
        f2xcZH8r5ZPhH5TLKuK7e6s=
X-Google-Smtp-Source: APXvYqwFiRcVFKuVgqcs304KA6K8ArQ5mPs070Ei1YCTDpIpCzFYCT/g6ibVr0D41bLqEYT3+L4s+A==
X-Received: by 2002:adf:f1d0:: with SMTP id z16mr22276621wro.209.1581954317869;
        Mon, 17 Feb 2020 07:45:17 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:180d:d2d6:6ff9:a6cb])
        by smtp.gmail.com with ESMTPSA id r6sm1372658wrq.92.2020.02.17.07.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 07:45:17 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch
Subject: [PATCH 5/5] drm/amdgpu: implement amdgpu_gem_prime_move_notify v2
Date:   Mon, 17 Feb 2020 16:45:09 +0100
Message-Id: <20200217154509.2265-6-christian.koenig@amd.com>
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

Implement the importer side of unpinned DMA-buf handling.

v2: update page tables immediately

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 66 ++++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  6 ++
 2 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 770baba621b3..48de7624d49c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -453,7 +453,71 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
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
@@ -489,7 +553,7 @@ struct drm_gem_object *amdgpu_gem_prime_import(struct drm_device *dev,
 		return obj;
 
 	attach = dma_buf_dynamic_attach(dma_buf, dev->dev,
-					&amdgpu_dma_buf_attach_ops, NULL);
+					&amdgpu_dma_buf_attach_ops, obj);
 	if (IS_ERR(attach)) {
 		drm_gem_object_put(obj);
 		return ERR_CAST(attach);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 8ae260822908..8c480c898b0d 100644
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

