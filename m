Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 263993BA522
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 23:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbhGBVlF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 17:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbhGBVlE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jul 2021 17:41:04 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A4BC061762
        for <linux-media@vger.kernel.org>; Fri,  2 Jul 2021 14:38:31 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id u8so14026036wrq.8
        for <linux-media@vger.kernel.org>; Fri, 02 Jul 2021 14:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XxhWhpRR03d+PrHVptGLMLYKJMMuUhi3Y5JYvtQzYIw=;
        b=WAUBZlZpe9fWTKAJ5gaKImZU0PkgMXzz6dP+ZtFpcCOXRRp82R2No6jGw6Z9vpCQT0
         NiRqjizm2oqCwzVKyMPWTS6HzPl4LMygFg4akDtkuHs5lKeawWBb4alDJ+quzS0hXQVy
         ZhztoeEs2rb4GMbzNefLHcb0QMH/FhtT6mRR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XxhWhpRR03d+PrHVptGLMLYKJMMuUhi3Y5JYvtQzYIw=;
        b=pYdersJYjXh+IpLh0ItsCoYbyoHdPPgcwjnNAF9/BYKG+wL7syQwMLJ7++dKpG8YmS
         tDJ1mk0Dv/1Uo2imnhB5QeOXZOTYvBnx3RPswQXUuDEuIhC0E0wyLUavh6NdagxzyhuB
         unZkSJToVrJxstVXP3wMOCgknP+9zrlfXp0oKj2C5kPVGt8ouhYU6bezq7ylne+SaLNe
         Ii+HDUB/TwsF1DGRgg3UM/r9iE/6uy8lFJJRv0+tj97b8e00C5TCuYQVDXXKhoK9RDch
         +DUqXYQPBtxNeHDNkknnA8za0jEpZFHPRliXXZfsM4u5D3bFo/kJdWafK1/MSCkffkF5
         rCbw==
X-Gm-Message-State: AOAM532pDdrrsaGXxrTW1k1cH3UNtmsW98KTCY4zf3/47Sv0g5c7OJRF
        6f7aBsSYUVkrpv87CMMrZIHXkg==
X-Google-Smtp-Source: ABdhPJzwJIAZ7agdEqmbqT6BoOFT/2mevaiYxrFJEDDIKm33LnGU+KTnDWd4qh66XrDfs/LaXQx/hw==
X-Received: by 2002:adf:e605:: with SMTP id p5mr1880464wrm.396.1625261909979;
        Fri, 02 Jul 2021 14:38:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id n19sm4007222wms.4.2021.07.02.14.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 14:38:29 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2 09/11] drm/gem: Delete gem array fencing helpers
Date:   Fri,  2 Jul 2021 23:38:13 +0200
Message-Id: <20210702213815.2249499-10-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210702213815.2249499-1-daniel.vetter@ffwll.ch>
References: <20210702213815.2249499-1-daniel.vetter@ffwll.ch>
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
2.32.0.rc2

