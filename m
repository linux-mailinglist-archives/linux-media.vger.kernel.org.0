Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD2893E132C
	for <lists+linux-media@lfdr.de>; Thu,  5 Aug 2021 12:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240596AbhHEKsN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Aug 2021 06:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240563AbhHEKrz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Aug 2021 06:47:55 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B36C6C06179E
        for <linux-media@vger.kernel.org>; Thu,  5 Aug 2021 03:47:24 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id o5so8830255ejy.2
        for <linux-media@vger.kernel.org>; Thu, 05 Aug 2021 03:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jSzJFH8CtxTJYEXcCZZIbr2vCkG9eURdQPO2UTEKnBM=;
        b=ayI8hGndL92HshvSFXNFZ0Lc8C4Aysey6TTy9xUBOIGjEiQywtqJB6PF96tdkgDZ2l
         wibdOONFuc1ptidH5N9sZf+EOc+VO64/5FoMngFp+wDvf6rNgBZOE87s+ZA2LgYHKrot
         11rc7PxMuWEcdU0tdJjtMlYmDpYdWg750L3K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jSzJFH8CtxTJYEXcCZZIbr2vCkG9eURdQPO2UTEKnBM=;
        b=tdjfzOaIO3HVzILpCrTuK0CO+6TNARYVPWTaBwY+Xm/RavOjwyX0noyG9XTNEBnwk/
         /iC+jGwkTBo8MUy0hHe4hGfAmbDXYW+Ya6K6E0gThe0ZLz4RJA/KTkXFPpTdk2+n5Vft
         3IZe5wc33x8vr3AiY/2eOS17/EWad4GMwOsc6aG7xGtJsqjkTYMOnInPS0/xmCPL1v8U
         244T0qzBSjyvwrxAV3ldVlBlC5/FgAd5S9NQRCYXGTTm5B8mNWBBpahvCbg7D+hONKHV
         Cbm4AwlUeulVBGFCmQJJaLvOjq78G96fbnjz7jCjymecNWQTB41TSzFCP9ZjtzPu6ViF
         m3dw==
X-Gm-Message-State: AOAM530AbhnovemaUdmw9+JgDmzmMHlOjoS909Fiir5aQWeyEUi0Q/op
        /VMg4nXtt6gY6p+jseczQ886xg==
X-Google-Smtp-Source: ABdhPJxpyljfbXPxATlcHpARHjEIH7oeB91EwoMvWsvYfgqp1K5k09Ko2eLFP/1UgvQ1s0WMr1+EkA==
X-Received: by 2002:a17:906:e089:: with SMTP id gh9mr4309138ejb.80.1628160443331;
        Thu, 05 Aug 2021 03:47:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id p5sm1578809ejl.73.2021.08.05.03.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 03:47:22 -0700 (PDT)
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
Subject: [PATCH v5 13/20] drm/gem: Delete gem array fencing helpers
Date:   Thu,  5 Aug 2021 12:46:58 +0200
Message-Id: <20210805104705.862416-14-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
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
index 09c820045859..37e2e2820f08 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1272,99 +1272,3 @@ drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
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
index 35e7f44c2a75..e55a767188af 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -407,11 +407,6 @@ int drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
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

