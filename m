Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3022F46163A
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 14:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377657AbhK2N2a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 08:28:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377671AbhK2N02 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 08:26:28 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8BCCC094248
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:04 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id p18so14369516wmq.5
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=geVPPhgHjz1swIil7f1f6R6mX3W1srW0yGMjQgdInFA=;
        b=V4/7YprZvPKdpTMMlvWiQCsm7Rsuv1lmsiqUAu/sI9d0vWKYVdAZrJzK6/IsX29crU
         rtTqDeNZ1SKzYK0GOv5Ps6/D1EG4SXK/OmnX0s+4YI9GNYEnovv+AQv3DVBEspGhzxAi
         vEuVKuQjgbkepSwV5zqkVLIi2ljjQr7dtB4Pu6jVdF9TxOE9jrtJMzvHeYXZQWsVrsLG
         fqJWL0TXoq6CwDAJk/ULJBaObnUOODYNJ5PVFuHKacSD4G3/UxYOmaAnCw9hu3Jhri5v
         ar9mCsN0cOLhQjhm5D6ZiofNp4ywsVQCC+MbBvWnZSwG1d6RAXJdb16/X4DMeAmNZjmn
         igxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=geVPPhgHjz1swIil7f1f6R6mX3W1srW0yGMjQgdInFA=;
        b=KlmWTqtwNekX7gkTOzUUQvUmOXy6IgHd2PC9FRKcjr4g4E4ZuVQXiChm6ner81e9w3
         qtLi0fi3mjfHY37vNCHL4SQL7EW0GUYa0EIrwsMKeOJ9hd/wlsA3oIPVDhc/xYR2rLZb
         UxtEYIza5jKKLy/7bhDt1c7gJO+gSUApgTgS3LS+92HMxvJdvEXt0DUMxfYun4cmGQEd
         C4DjtT34EG2cXl0c8zWiZlsXWaT6wBhet/lwH0Z4650yrP4OBHEDRYphmhy5w2NzvJKI
         uQ3bJcODIE4AbXrGKtDqhYhFdK0qSwieC8URAXjifWRz16qJjpZhidMSSBTe8RKeEpHz
         9WNA==
X-Gm-Message-State: AOAM533LzggvKuCrdq54QHy8AgC32GwnAWMjVQZHR63PE0sWLiDKCmgL
        BtKFFipvq38cTPr4cOWeW6Y=
X-Google-Smtp-Source: ABdhPJwF2F9DwX3DXfnuONALNiR60hKlsexxxFdKpXGs2X9nnbOVlqOmLesP14ncSVKZyrPv1v12Xw==
X-Received: by 2002:a05:600c:17c3:: with SMTP id y3mr35244547wmo.136.1638187623531;
        Mon, 29 Nov 2021 04:07:03 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 04:07:03 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 01/28] drm/i915: Remove dma_resv_prune
Date:   Mon, 29 Nov 2021 13:06:32 +0100
Message-Id: <20211129120659.1815-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

The signaled bit is already used for quick testing if a fence is signaled.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/Makefile                |  1 -
 drivers/gpu/drm/i915/dma_resv_utils.c        | 17 -----------------
 drivers/gpu/drm/i915/dma_resv_utils.h        | 13 -------------
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c |  3 ---
 drivers/gpu/drm/i915/gem/i915_gem_wait.c     |  8 --------
 5 files changed, 42 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/dma_resv_utils.c
 delete mode 100644 drivers/gpu/drm/i915/dma_resv_utils.h

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
index 5ab136ffdeb2..af3eb7fd951d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -15,7 +15,6 @@
 
 #include "gt/intel_gt_requests.h"
 
-#include "dma_resv_utils.h"
 #include "i915_trace.h"
 
 static bool swap_available(void)
@@ -229,8 +228,6 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
 					i915_gem_object_unlock(obj);
 			}
 
-			dma_resv_prune(obj->base.resv);
-
 			scanned += obj->base.size >> PAGE_SHIFT;
 skip:
 			i915_gem_object_put(obj);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index f11325484110..cd149aa99364 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -10,7 +10,6 @@
 
 #include "gt/intel_engine.h"
 
-#include "dma_resv_utils.h"
 #include "i915_gem_ioctls.h"
 #include "i915_gem_object.h"
 
@@ -52,13 +51,6 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
 	}
 	dma_resv_iter_end(&cursor);
 
-	/*
-	 * Opportunistically prune the fences iff we know they have *all* been
-	 * signaled.
-	 */
-	if (timeout > 0)
-		dma_resv_prune(resv);
-
 	return ret;
 }
 
-- 
2.25.1

