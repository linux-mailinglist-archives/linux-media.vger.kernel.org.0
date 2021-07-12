Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF98D3C648A
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 22:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236684AbhGLUFB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 16:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236672AbhGLUE7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 16:04:59 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730E4C0613DD
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 13:02:10 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id g16so17360401wrw.5
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 13:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PsoZ6J2M5QyGu071hd73Pkusw3eitnPHMAU0WekmIkg=;
        b=McBGnIpiareUmauIcg6OssgF+sZoif+0H1vQknWReZVHSUvyWdp6P/x0+aJCa9U2DI
         gOBmyr4ICSZFPMWoki/iOkYt/OCP2DuvNBdbFfrTxi+89pmSsWRZdVCaLeYvOEigTbnC
         shAUpfcfdkcnRfiwUhlXLp5XLXFd0gzOT8EYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PsoZ6J2M5QyGu071hd73Pkusw3eitnPHMAU0WekmIkg=;
        b=K1TKJfF4zMFq/fvlrIMmLXLsvenx/0K02gRyTUr7LAr+BcGAIHE5Ctl4cvRGe1h1C/
         sXV7oiNnV5bL0L0X02UGniwrJFnlSV1B/YBFZuZbrRw+LjuZd5mDJ06dTnACRtluaP9y
         k86wytYbmctjW+uAzgXXYz7FkaJ12HgCU8iQ7ntmxyuQeFQHffcY7LxwpSOC54dVDpte
         P0PdtxoInHhcuAa/IdJpmTtm81wJlHbbW188X6r1LbLKBYy5Q7wpbI/UsQrO2ZhOA+gJ
         8w7dlyTpihAKNKI8yFtrXriu/j64Mvk5qZdRb4AXASGoKHWdDjHra7Fd8e6hEbV1ffc3
         mUdA==
X-Gm-Message-State: AOAM531/CWVcPtP7M99MniYARRERvSt4BeKnZ+6o5F3o6djLFMxEHMix
        01gPSHrvZTckR3NWeM5M+lC8Ig==
X-Google-Smtp-Source: ABdhPJxLYv1YhEHSZ0HnsOvF6U6FhKtgxNQvFJ2CNeBsDQNb5UvcyTF3n6qFUFhuToT1pk1Pk2hnAw==
X-Received: by 2002:a5d:6da2:: with SMTP id u2mr860120wrs.134.1626120129066;
        Mon, 12 Jul 2021 13:02:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l14sm9858221wrs.22.2021.07.12.13.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 13:02:08 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4 11/18] drm/gem: Delete gem array fencing helpers
Date:   Mon, 12 Jul 2021 19:53:45 +0200
Message-Id: <20210712175352.802687-12-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Integrated into the scheduler now and all users converted over.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/gpu/drm/drm_gem.c | 96 ---------------------------------------
 include/drm/drm_gem.h     |  5 --
 2 files changed, 101 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 68deb1de8235..24d49a2636e0 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1294,99 +1294,3 @@ drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
 	ww_acquire_fini(acquire_ctx);
 }
 EXPORT_SYMBOL(drm_gem_unlock_reservations);
-
-/**
- * drm_gem_fence_array_add - Adds the fence to an array of fences to be
- * waited on, deduplicating fences from the same context.
- *
- * @fence_array: array of dma_fence * for the job to block on.
- * @fence: the dma_fence to add to the list of dependencies.
- *
- * This functions consumes the reference for @fence both on success and error
- * cases.
- *
- * Returns:
- * 0 on success, or an error on failing to expand the array.
- */
-int drm_gem_fence_array_add(struct xarray *fence_array,
-			    struct dma_fence *fence)
-{
-	struct dma_fence *entry;
-	unsigned long index;
-	u32 id = 0;
-	int ret;
-
-	if (!fence)
-		return 0;
-
-	/* Deduplicate if we already depend on a fence from the same context.
-	 * This lets the size of the array of deps scale with the number of
-	 * engines involved, rather than the number of BOs.
-	 */
-	xa_for_each(fence_array, index, entry) {
-		if (entry->context != fence->context)
-			continue;
-
-		if (dma_fence_is_later(fence, entry)) {
-			dma_fence_put(entry);
-			xa_store(fence_array, index, fence, GFP_KERNEL);
-		} else {
-			dma_fence_put(fence);
-		}
-		return 0;
-	}
-
-	ret = xa_alloc(fence_array, &id, fence, xa_limit_32b, GFP_KERNEL);
-	if (ret != 0)
-		dma_fence_put(fence);
-
-	return ret;
-}
-EXPORT_SYMBOL(drm_gem_fence_array_add);
-
-/**
- * drm_gem_fence_array_add_implicit - Adds the implicit dependencies tracked
- * in the GEM object's reservation object to an array of dma_fences for use in
- * scheduling a rendering job.
- *
- * This should be called after drm_gem_lock_reservations() on your array of
- * GEM objects used in the job but before updating the reservations with your
- * own fences.
- *
- * @fence_array: array of dma_fence * for the job to block on.
- * @obj: the gem object to add new dependencies from.
- * @write: whether the job might write the object (so we need to depend on
- * shared fences in the reservation object).
- */
-int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
-				     struct drm_gem_object *obj,
-				     bool write)
-{
-	int ret;
-	struct dma_fence **fences;
-	unsigned int i, fence_count;
-
-	if (!write) {
-		struct dma_fence *fence =
-			dma_resv_get_excl_unlocked(obj->resv);
-
-		return drm_gem_fence_array_add(fence_array, fence);
-	}
-
-	ret = dma_resv_get_fences(obj->resv, NULL,
-						&fence_count, &fences);
-	if (ret || !fence_count)
-		return ret;
-
-	for (i = 0; i < fence_count; i++) {
-		ret = drm_gem_fence_array_add(fence_array, fences[i]);
-		if (ret)
-			break;
-	}
-
-	for (; i < fence_count; i++)
-		dma_fence_put(fences[i]);
-	kfree(fences);
-	return ret;
-}
-EXPORT_SYMBOL(drm_gem_fence_array_add_implicit);
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 240049566592..6d5e33b89074 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -409,11 +409,6 @@ int drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
 			      struct ww_acquire_ctx *acquire_ctx);
 void drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
 				 struct ww_acquire_ctx *acquire_ctx);
-int drm_gem_fence_array_add(struct xarray *fence_array,
-			    struct dma_fence *fence);
-int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
-				     struct drm_gem_object *obj,
-				     bool write);
 int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 			    u32 handle, u64 *offset);
 
-- 
2.32.0

