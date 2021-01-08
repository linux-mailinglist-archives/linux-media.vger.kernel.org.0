Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0541E2EEFF7
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 10:46:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbhAHJpL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 04:45:11 -0500
Received: from mx2.suse.de ([195.135.220.15]:36792 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728004AbhAHJpK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Jan 2021 04:45:10 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 27ECFAFF1;
        Fri,  8 Jan 2021 09:43:53 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     sumit.semwal@linaro.org, christian.koenig@amd.com,
        airlied@redhat.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        kraxel@redhat.com, hdegoede@redhat.com, sean@poorly.run,
        eric@anholt.net, sam@ravnborg.org
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org,
        virtualization@lists.linux-foundation.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 13/13] drm/vram-helper: Remove unused drm_gem_vram_{vmap,vunmap}()
Date:   Fri,  8 Jan 2021 10:43:40 +0100
Message-Id: <20210108094340.15290-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210108094340.15290-1-tzimmermann@suse.de>
References: <20210108094340.15290-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VRAM-helper BO's cannot be exported, so calls for vmap and vunmap
can only come from the BO's drivers or a kernel client. These are
supposed use vmap_local functionality.

The vmap and vunmap operations in VRAM helpers are therefore unused
and can be removed.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 98 ---------------------------
 include/drm/drm_gem_vram_helper.h     |  2 -
 2 files changed, 100 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index c7fba3a0758e..c7d166cd16df 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -379,72 +379,6 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
 }
 EXPORT_SYMBOL(drm_gem_vram_unpin);
 
-/**
- * drm_gem_vram_vmap() - Pins and maps a GEM VRAM object into kernel address
- *                       space
- * @gbo: The GEM VRAM object to map
- * @map: Returns the kernel virtual address of the VRAM GEM object's backing
- *       store.
- *
- * The vmap function pins a GEM VRAM object to its current location, either
- * system or video memory, and maps its buffer into kernel address space.
- * As pinned object cannot be relocated, you should avoid pinning objects
- * permanently. Call drm_gem_vram_vunmap() with the returned address to
- * unmap and unpin the GEM VRAM object.
- *
- * Returns:
- * 0 on success, or a negative error code otherwise.
- */
-int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
-{
-	int ret;
-
-	ret = ttm_bo_reserve(&gbo->bo, true, false, NULL);
-	if (ret)
-		return ret;
-
-	ret = drm_gem_vram_pin_locked(gbo, 0);
-	if (ret)
-		goto err_ttm_bo_unreserve;
-	ret = drm_gem_vram_vmap_local(gbo, map);
-	if (ret)
-		goto err_drm_gem_vram_unpin_locked;
-
-	ttm_bo_unreserve(&gbo->bo);
-
-	return 0;
-
-err_drm_gem_vram_unpin_locked:
-	drm_gem_vram_unpin_locked(gbo);
-err_ttm_bo_unreserve:
-	ttm_bo_unreserve(&gbo->bo);
-	return ret;
-}
-EXPORT_SYMBOL(drm_gem_vram_vmap);
-
-/**
- * drm_gem_vram_vunmap() - Unmaps and unpins a GEM VRAM object
- * @gbo: The GEM VRAM object to unmap
- * @map: Kernel virtual address where the VRAM GEM object was mapped
- *
- * A call to drm_gem_vram_vunmap() unmaps and unpins a GEM VRAM buffer. See
- * the documentation for drm_gem_vram_vmap() for more information.
- */
-void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
-{
-	int ret;
-
-	ret = ttm_bo_reserve(&gbo->bo, false, false, NULL);
-	if (WARN_ONCE(ret, "ttm_bo_reserve_failed(): ret=%d\n", ret))
-		return;
-
-	drm_gem_vram_vunmap_local(gbo, map);
-	drm_gem_vram_unpin_locked(gbo);
-
-	ttm_bo_unreserve(&gbo->bo);
-}
-EXPORT_SYMBOL(drm_gem_vram_vunmap);
-
 /**
  * drm_gem_vram_vmap_local() - Maps a GEM VRAM object into kernel address space
  * @gbo: The GEM VRAM object to map
@@ -870,36 +804,6 @@ static void drm_gem_vram_object_unpin(struct drm_gem_object *gem)
 	drm_gem_vram_unpin(gbo);
 }
 
-/**
- * drm_gem_vram_object_vmap() -
- *	Implements &struct drm_gem_object_funcs.vmap
- * @gem: The GEM object to map
- * @map: Returns the kernel virtual address of the VRAM GEM object's backing
- *       store.
- *
- * Returns:
- * 0 on success, or a negative error code otherwise.
- */
-static int drm_gem_vram_object_vmap(struct drm_gem_object *gem, struct dma_buf_map *map)
-{
-	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
-
-	return drm_gem_vram_vmap(gbo, map);
-}
-
-/**
- * drm_gem_vram_object_vunmap() -
- *	Implements &struct drm_gem_object_funcs.vunmap
- * @gem: The GEM object to unmap
- * @map: Kernel virtual address where the VRAM GEM object was mapped
- */
-static void drm_gem_vram_object_vunmap(struct drm_gem_object *gem, struct dma_buf_map *map)
-{
-	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
-
-	drm_gem_vram_vunmap(gbo, map);
-}
-
 static int drm_gem_vram_object_vmap_local(struct drm_gem_object *gem, struct dma_buf_map *map)
 {
 	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
@@ -922,8 +826,6 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs = {
 	.free = drm_gem_vram_object_free,
 	.pin = drm_gem_vram_object_pin,
 	.unpin = drm_gem_vram_object_unpin,
-	.vmap = drm_gem_vram_object_vmap,
-	.vunmap	= drm_gem_vram_object_vunmap,
 	.vmap_local = drm_gem_vram_object_vmap_local,
 	.vunmap_local = drm_gem_vram_object_vunmap_local,
 	.mmap = drm_gem_ttm_mmap,
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index bd6a60e7c22b..e571867f4069 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -97,8 +97,6 @@ u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo);
 s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo);
 int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag);
 int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo);
-int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
-void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
 int drm_gem_vram_vmap_local(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
 void drm_gem_vram_vunmap_local(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
 
-- 
2.29.2

