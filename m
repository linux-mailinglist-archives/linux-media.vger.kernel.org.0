Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 146E19796B
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 14:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbfHUMb4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 08:31:56 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41072 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728267AbfHUMb4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 08:31:56 -0400
Received: by mail-wr1-f65.google.com with SMTP id j16so1858133wrr.8
        for <linux-media@vger.kernel.org>; Wed, 21 Aug 2019 05:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ni/csKYEDyOv/GI6Uu6YVFIStPM3qd3+Rn6zbLv7UUM=;
        b=rYoioTgGNdJPTEsCmhjUF1HZX9gcEpjaHfX4q0zA+y0r2/iQMVtuDahOaLCGbLxbzm
         ytAht059xFcw3KyV5Lc9xrn35bWcY5Fgs3twscL4TSdDdnv3WmiaCPZsau0ApeQVzW8z
         F1RkXtpUTWQwRJ/KSO+u/bRX7SzKCgKbchepGlwDfuDXANndCWB5kDZMoDw0qqM/u4Lf
         EXvri2vke4YiZROmzcnVU/BuYq1S8Nd5UD2C1ygsx2t2TpfhPoUVsbzwAJWd0muTmoaf
         Irt2Iz5lqF7y53cHC+J8xX8IVNart9/UdcYQA+jGuOpkgUsNMr4XWR02cbJHkVcwPyEz
         K2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ni/csKYEDyOv/GI6Uu6YVFIStPM3qd3+Rn6zbLv7UUM=;
        b=FPO39aHpxXgt0avYZd+UNmy22/tzp+9+TBtsHrbPqAp/avwbjlPIXM1gw7NfpuWyHW
         07hCCY/TiT31t4P9Uz9J7mM5qCFOPAHBuccdwbk+l4AWmh3wqs1CWQzn+IlxZwf9lfYq
         3Go45EQ4EsdEvAC1GLWFxgJvqOdXsXrKXepoiQ1cLomx92+dlTnfivs9HXza2A7H6OTo
         hEjvNOiwrXT5y4naRmCz/KfgzxnQIukLW1Er2nzuBUR6CPX8R7CntMlEZpMrk27y8wL+
         vKFgDkk7ad5mU+uZz1f2y7emn/QxAJc+zr9q1m/i3BxNKfHz7HenGOO0KNrH3Un840mp
         rgPA==
X-Gm-Message-State: APjAAAX4fZLNsR9CLMGLkKQsAvt3w0xrkU7+cxrnweFX+xcu6CLto9D5
        Hgh47RhqFtp2AbBJAEE3/RM=
X-Google-Smtp-Source: APXvYqynWHiNIzC4shkDTUZTBtVbuOpu7CcIRalVRJfof4Zw588JseDXLH/DpOXIFmxsKWDuM5O1oQ==
X-Received: by 2002:adf:fc03:: with SMTP id i3mr37946824wrr.48.1566390713679;
        Wed, 21 Aug 2019 05:31:53 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8189:dd33:a934:c4fa])
        by smtp.gmail.com with ESMTPSA id v3sm23084571wrq.34.2019.08.21.05.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 05:31:53 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
        daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 05/10] dma-buf/resv: add dma_resv_prune_fences
Date:   Wed, 21 Aug 2019 14:31:42 +0200
Message-Id: <20190821123147.110736-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821123147.110736-1-christian.koenig@amd.com>
References: <20190821123147.110736-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a new dma_resv_prune_fences() function to improve memory management.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c                 | 37 ++++++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_wait.c   |  3 +-
 drivers/gpu/drm/i915/i915_gem_batch_pool.c |  2 +-
 drivers/gpu/drm/i915/i915_vma.c            |  3 +-
 drivers/gpu/drm/ttm/ttm_bo.c               |  2 +-
 include/linux/dma-resv.h                   |  1 +
 6 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 42a8f3f11681..24adc32d36d4 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -301,6 +301,43 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_resv_add_excl_fence);
 
+/**
+ * dma_resv_prune_fences - prune signaled fences from the resv object
+ * @obj: the reservation object to prune
+ *
+ * Prune all signaled fences from the reservation object.
+ */
+void dma_resv_prune_fences(struct dma_resv *obj)
+{
+	struct dma_resv_list *list;
+	struct dma_fence *fence;
+	unsigned int i;
+
+	dma_resv_assert_held(obj);
+
+	fence = dma_resv_get_excl(obj);
+	if (dma_fence_is_signaled(fence)) {
+		RCU_INIT_POINTER(obj->fence_excl, NULL);
+		dma_fence_put(fence);
+	}
+
+	list = dma_resv_get_list(obj);
+	if (!list)
+		return;
+
+	for (i = 0; i < list->shared_count; ++i) {
+		fence = rcu_dereference_protected(list->shared[i],
+						  dma_resv_held(obj));
+
+		if (!dma_fence_is_signaled(fence))
+			continue;
+
+		RCU_INIT_POINTER(list->shared[i], dma_fence_get_stub());
+		dma_fence_put(fence);
+	}
+}
+EXPORT_SYMBOL(dma_resv_prune_fences);
+
 /**
 * dma_resv_copy_fences - Copy all fences from src to dst.
 * @dst: the destination reservation object
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index 8af55cd3e690..a76d36f8fb77 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -85,8 +85,7 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
 	 * signaled.
 	 */
 	if (prune_fences && dma_resv_trylock(resv)) {
-		if (dma_resv_test_signaled_rcu(resv, true))
-			dma_resv_add_excl_fence(resv, NULL);
+		dma_resv_prune_fences(resv);
 		dma_resv_unlock(resv);
 	}
 
diff --git a/drivers/gpu/drm/i915/i915_gem_batch_pool.c b/drivers/gpu/drm/i915/i915_gem_batch_pool.c
index 5f82a763e64c..274cf5b19fc9 100644
--- a/drivers/gpu/drm/i915/i915_gem_batch_pool.c
+++ b/drivers/gpu/drm/i915/i915_gem_batch_pool.c
@@ -114,7 +114,7 @@ i915_gem_batch_pool_get(struct i915_gem_batch_pool *pool,
 			 */
 			if (rcu_access_pointer(resv->fence)) {
 				dma_resv_lock(resv, NULL);
-				dma_resv_add_excl_fence(resv, NULL);
+				dma_resv_prune_fences(resv);
 				dma_resv_unlock(resv);
 			}
 		}
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index ebfd03d117cd..fcbe433a968c 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -100,8 +100,7 @@ static void __i915_vma_retire(struct i915_active *ref)
 
 	/* Prune the shared fence arrays iff completely idle (inc. external) */
 	if (dma_resv_trylock(obj->base.resv)) {
-		if (dma_resv_test_signaled_rcu(obj->base.resv, true))
-			dma_resv_add_excl_fence(obj->base.resv, NULL);
+		dma_resv_prune_fences(obj->base.resv);
 		dma_resv_unlock(obj->base.resv);
 	}
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 58d1f2b28132..f78f52cc2e6d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1818,7 +1818,7 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
 	if (timeout == 0)
 		return -EBUSY;
 
-	dma_resv_add_excl_fence(bo->base.resv, NULL);
+	dma_resv_prune_fences(bo->base.resv);
 	return 0;
 }
 EXPORT_SYMBOL(ttm_bo_wait);
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index ee50d10f052b..03b0f95682b0 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -279,6 +279,7 @@ int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
 void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
 
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
+void dma_resv_prune_fences(struct dma_resv *obj);
 
 int dma_resv_get_fences_rcu(struct dma_resv *obj,
 			    struct dma_fence **pfence_excl,
-- 
2.17.1

