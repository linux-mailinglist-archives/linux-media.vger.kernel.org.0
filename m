Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93BA445A534
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 15:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237798AbhKWOYa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 09:24:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237651AbhKWOY3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 09:24:29 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A96CC061574
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:21 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id v11so772417wrw.10
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9+dwW97gH67Jafy2gJlQwXu5zD+OiAgM7afxncIm1T0=;
        b=FJ1RwpJZoV8EG/5xM3FbjTmmHDDzianD0xTR9fCNS7fUSKcHYkgb41OgM2537o4+Ob
         zsovgZ4+AkeqShQ+QLpTY9wvTbvwfiaKhMbrZE/6b4FIODy9Y1oRoNZiLubieHW72XSY
         5lk3I6rz7/AUyKYn67sfIfQCDSz4PeoEARzUB4crJLGkaOsNib/9cjqAUTVJfJWbm2AK
         aqLc11n6due2SfM8LeSuBd70fsikxaUzZxo7639MXBrZhgpoVyD5d2iCwHhCu3/d526C
         RnDQ35yKnUz4ARNaV/WkKdkVKR056LDCVgJNyXGO2HAp/3gHjcebLHeMRfvGVrQDLTxv
         MKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9+dwW97gH67Jafy2gJlQwXu5zD+OiAgM7afxncIm1T0=;
        b=XWvFmx6rimRHFF4JGkrXPkzslvs7ftQoGezOrR8HWJ0+H6sxkAJztAzWvyPengFVzR
         MZEqPhgpUR0kAojQdputu5dT26P0pIxxGvtlSDFaW7oCD3A1eng4xWkFQjvMS4q/JX5q
         +HL0qKHHCFPZZtkZhPgrIaqzFrMfqjBoQeZc6jeg9baNu+B6tUsJC6RUI2vRitndkxc7
         bJIY1E7LbZwN2fbhppFoqJIdQMcOHK5TdW0wloXpoSPkmLwl1J0UYd69B8/maZy9CQU/
         thTUxKvyn7pkCBWoaOyHr6eW5kMCMEgvjbj3EXcb68l0BIAGqxRClZ9xpcEiYxuXz9K2
         53uQ==
X-Gm-Message-State: AOAM530ATgLg0FXZTdUifk8HKqxWmndcwnhmzj+1WcB/OiMD95kKnYpf
        FKgsqIF0a7T/35FqY5u7lLw=
X-Google-Smtp-Source: ABdhPJwfpwTOHlslYH7Qv6yArotMaJO3eWYKauPJjMWXnAgyleXdEUKXLBxqjlOQapkCMiMM72cm9g==
X-Received: by 2002:a5d:6c6a:: with SMTP id r10mr8105195wrz.211.1637677280044;
        Tue, 23 Nov 2021 06:21:20 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 06:21:19 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 02/26] dma-buf: cleanup pruning of dma_resv objects
Date:   Tue, 23 Nov 2021 15:20:47 +0100
Message-Id: <20211123142111.3885-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The i915 driver implements a prune function which is called when it is very
likely that the fences inside the dma_resv object can be removed because they
are all signaled. TTM does something similar after waiting for the
dma_resv to be idle.

Move those functions into the dma-resv.c code since the behavior of pruning
fences is something internal to the object.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c                   | 32 ++++++++++++++++++++
 drivers/gpu/drm/i915/Makefile                |  1 -
 drivers/gpu/drm/i915/dma_resv_utils.c        | 17 -----------
 drivers/gpu/drm/i915/dma_resv_utils.h        | 13 --------
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c     |  3 +-
 drivers/gpu/drm/ttm/ttm_bo.c                 |  2 +-
 include/linux/dma-resv.h                     |  2 ++
 8 files changed, 37 insertions(+), 36 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/dma_resv_utils.c
 delete mode 100644 drivers/gpu/drm/i915/dma_resv_utils.h

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index ff3c0558b3b8..f6499e87963c 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -324,6 +324,38 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_resv_add_excl_fence);
 
+/**
+ * dma_resv_prune - remove signaled fences
+ * @obj: The dma_resv object to prune
+ *
+ * Remove all the signaled fences from the dma_resv object.
+ */
+void dma_resv_prune(struct dma_resv *obj)
+{
+	dma_resv_assert_held(obj);
+
+	if (dma_resv_test_signaled(obj, true))
+		dma_resv_add_excl_fence(obj, NULL);
+}
+EXPORT_SYMBOL(dma_resv_prune_unlocked);
+
+/**
+ * dma_resv_prune_unlocked - try to remove signaled fences
+ * @obj: The dma_resv object to prune
+ *
+ * Try to lock the object, test if it is signaled and if yes then remove all the
+ * signaled fences.
+ */
+void dma_resv_prune_unlocked(struct dma_resv *obj)
+{
+	if (!dma_resv_trylock(obj))
+		return;
+
+	dma_resv_prune(obj);
+	dma_resv_unlock(obj);
+}
+EXPORT_SYMBOL(dma_resv_prune);
+
 /**
  * dma_resv_iter_restart_unlocked - restart the unlocked iterator
  * @cursor: The dma_resv_iter object to restart
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 660bb03de6fc..5c1af130cb6d 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -60,7 +60,6 @@ i915-y += i915_drv.o \
 
 # core library code
 i915-y += \
-	dma_resv_utils.o \
 	i915_memcpy.o \
 	i915_mm.o \
 	i915_sw_fence.o \
diff --git a/drivers/gpu/drm/i915/dma_resv_utils.c b/drivers/gpu/drm/i915/dma_resv_utils.c
deleted file mode 100644
index 7df91b7e4ca8..000000000000
--- a/drivers/gpu/drm/i915/dma_resv_utils.c
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2020 Intel Corporation
- */
-
-#include <linux/dma-resv.h>
-
-#include "dma_resv_utils.h"
-
-void dma_resv_prune(struct dma_resv *resv)
-{
-	if (dma_resv_trylock(resv)) {
-		if (dma_resv_test_signaled(resv, true))
-			dma_resv_add_excl_fence(resv, NULL);
-		dma_resv_unlock(resv);
-	}
-}
diff --git a/drivers/gpu/drm/i915/dma_resv_utils.h b/drivers/gpu/drm/i915/dma_resv_utils.h
deleted file mode 100644
index b9d8fb5f8367..000000000000
--- a/drivers/gpu/drm/i915/dma_resv_utils.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2020 Intel Corporation
- */
-
-#ifndef DMA_RESV_UTILS_H
-#define DMA_RESV_UTILS_H
-
-struct dma_resv;
-
-void dma_resv_prune(struct dma_resv *resv);
-
-#endif /* DMA_RESV_UTILS_H */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index 5ab136ffdeb2..48029bbda682 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -15,7 +15,6 @@
 
 #include "gt/intel_gt_requests.h"
 
-#include "dma_resv_utils.h"
 #include "i915_trace.h"
 
 static bool swap_available(void)
@@ -229,7 +228,7 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
 					i915_gem_object_unlock(obj);
 			}
 
-			dma_resv_prune(obj->base.resv);
+			dma_resv_prune_unlocked(obj->base.resv);
 
 			scanned += obj->base.size >> PAGE_SHIFT;
 skip:
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index f11325484110..75b58aa8d4a7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -10,7 +10,6 @@
 
 #include "gt/intel_engine.h"
 
-#include "dma_resv_utils.h"
 #include "i915_gem_ioctls.h"
 #include "i915_gem_object.h"
 
@@ -57,7 +56,7 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
 	 * signaled.
 	 */
 	if (timeout > 0)
-		dma_resv_prune(resv);
+		dma_resv_prune_unlocked(resv);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index e4a20a3a5d16..e43f551594a8 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1086,7 +1086,7 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
 	if (timeout == 0)
 		return -EBUSY;
 
-	dma_resv_add_excl_fence(bo->base.resv, NULL);
+	dma_resv_prune(bo->base.resv);
 	return 0;
 }
 EXPORT_SYMBOL(ttm_bo_wait);
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index eebf04325b34..2594fef75f51 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -458,6 +458,8 @@ void dma_resv_fini(struct dma_resv *obj);
 int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
 void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
+void dma_resv_prune(struct dma_resv *obj);
+void dma_resv_prune_unlocked(struct dma_resv *obj);
 int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
 			unsigned *pshared_count, struct dma_fence ***pshared);
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
-- 
2.25.1

