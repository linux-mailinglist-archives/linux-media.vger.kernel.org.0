Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5033B2CD87C
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 15:06:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730609AbgLCOEa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 09:04:30 -0500
Received: from mx2.suse.de ([195.135.220.15]:35302 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726712AbgLCOE3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 09:04:29 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C2D9BADB3;
        Thu,  3 Dec 2020 14:03:08 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@redhat.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        hdegoede@redhat.com, christian.koenig@amd.com,
        sumit.semwal@linaro.org
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 5/7] drm/vram-helper: Remove vmap reference counting
Date:   Thu,  3 Dec 2020 15:02:57 +0100
Message-Id: <20201203140259.26580-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203140259.26580-1-tzimmermann@suse.de>
References: <20201203140259.26580-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Overlapping or nested mappings of the same BO are not allowed by the
semantics of the GEM vmap/vunmap operations. Concurent access to the
GEM object is prevented by reservation locks.

So we don't need the reference counter in the GEM VRAM object. Remove
it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 19 ++++---------------
 include/drm/drm_gem_vram_helper.h     | 17 +++--------------
 2 files changed, 7 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 760d77c6c3c0..276e8f8ea663 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -113,7 +113,6 @@ static void drm_gem_vram_cleanup(struct drm_gem_vram_object *gbo)
 	 * up; only release the GEM object.
 	 */
 
-	WARN_ON(gbo->vmap_use_count);
 	WARN_ON(dma_buf_map_is_set(&gbo->map));
 
 	drm_gem_object_release(&gbo->bo.base);
@@ -384,15 +383,10 @@ static int drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
 {
 	int ret;
 
-	if (gbo->vmap_use_count > 0)
-		goto out;
-
 	ret = ttm_bo_vmap(&gbo->bo, &gbo->map);
 	if (ret)
 		return ret;
 
-out:
-	++gbo->vmap_use_count;
 	*map = gbo->map;
 
 	return 0;
@@ -403,15 +397,9 @@ static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo,
 {
 	struct drm_device *dev = gbo->bo.base.dev;
 
-	if (drm_WARN_ON_ONCE(dev, !gbo->vmap_use_count))
-		return;
-
 	if (drm_WARN_ON_ONCE(dev, !dma_buf_map_is_equal(&gbo->map, map)))
 		return; /* BUG: map not mapped from this BO */
 
-	if (--gbo->vmap_use_count > 0)
-		return;
-
 	/*
 	 * Permanently mapping and unmapping buffers adds overhead from
 	 * updating the page tables and creates debugging output. Therefore,
@@ -545,12 +533,13 @@ static void drm_gem_vram_bo_driver_move_notify(struct drm_gem_vram_object *gbo,
 					       struct ttm_resource *new_mem)
 {
 	struct ttm_buffer_object *bo = &gbo->bo;
-	struct drm_device *dev = bo->base.dev;
+	struct dma_buf_map *map = &gbo->map;
 
-	if (drm_WARN_ON_ONCE(dev, gbo->vmap_use_count))
+	if (dma_buf_map_is_null(map))
 		return;
 
-	ttm_bo_vunmap(bo, &gbo->map);
+	ttm_bo_vunmap(bo, map);
+	dma_buf_map_clear(map);
 }
 
 static int drm_gem_vram_bo_driver_move(struct drm_gem_vram_object *gbo,
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index a4bac02249c2..48af238b5ca9 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -41,25 +41,14 @@ struct vm_area_struct;
  * dedicated memory. The buffer object can be evicted to system memory if
  * video memory becomes scarce.
  *
- * GEM VRAM objects perform reference counting for pin and mapping
- * operations. So a buffer object that has been pinned N times with
- * drm_gem_vram_pin() must be unpinned N times with
- * drm_gem_vram_unpin(). The same applies to pairs of
- * drm_gem_vram_kmap() and drm_gem_vram_kunmap(), as well as pairs of
- * drm_gem_vram_vmap() and drm_gem_vram_vunmap().
+ * GEM VRAM objects perform reference counting for pin operations. So a
+ * buffer object that has been pinned N times with drm_gem_vram_pin() must
+ * be unpinned N times with drm_gem_vram_unpin().
  */
 struct drm_gem_vram_object {
 	struct ttm_buffer_object bo;
 	struct dma_buf_map map;
 
-	/**
-	 * @vmap_use_count:
-	 *
-	 * Reference count on the virtual address.
-	 * The address are un-mapped when the count reaches zero.
-	 */
-	unsigned int vmap_use_count;
-
 	/* Supported placements are %TTM_PL_VRAM and %TTM_PL_SYSTEM */
 	struct ttm_placement placement;
 	struct ttm_place placements[2];
-- 
2.29.2

