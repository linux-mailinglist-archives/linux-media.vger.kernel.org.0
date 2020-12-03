Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6FB92CD87B
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 15:06:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730737AbgLCOEa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 09:04:30 -0500
Received: from mx2.suse.de ([195.135.220.15]:35304 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727242AbgLCOE3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 09:04:29 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 5A9A1ADC1;
        Thu,  3 Dec 2020 14:03:09 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@redhat.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        hdegoede@redhat.com, christian.koenig@amd.com,
        sumit.semwal@linaro.org
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 6/7] drm/vram-helper: Simplify vmap implementation
Date:   Thu,  3 Dec 2020 15:02:58 +0100
Message-Id: <20201203140259.26580-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203140259.26580-1-tzimmermann@suse.de>
References: <20201203140259.26580-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After removing the pinning operations, the vmap/vunmap code as been
reduced to what used to be an internal helper. Inline the helper to
simplify the implementation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 52 +++++++++++----------------
 1 file changed, 20 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 276e8f8ea663..6159f5dc8f1f 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -378,36 +378,6 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
 }
 EXPORT_SYMBOL(drm_gem_vram_unpin);
 
-static int drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
-				    struct dma_buf_map *map)
-{
-	int ret;
-
-	ret = ttm_bo_vmap(&gbo->bo, &gbo->map);
-	if (ret)
-		return ret;
-
-	*map = gbo->map;
-
-	return 0;
-}
-
-static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo,
-				       struct dma_buf_map *map)
-{
-	struct drm_device *dev = gbo->bo.base.dev;
-
-	if (drm_WARN_ON_ONCE(dev, !dma_buf_map_is_equal(&gbo->map, map)))
-		return; /* BUG: map not mapped from this BO */
-
-	/*
-	 * Permanently mapping and unmapping buffers adds overhead from
-	 * updating the page tables and creates debugging output. Therefore,
-	 * we delay the actual unmap operation until the BO gets evicted
-	 * from memory. See drm_gem_vram_bo_driver_move_notify().
-	 */
-}
-
 /**
  * drm_gem_vram_vmap() - Pins and maps a GEM VRAM object into kernel address
  *                       space
@@ -426,9 +396,17 @@ static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo,
  */
 int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
 {
+	int ret;
+
 	dma_resv_assert_held(gbo->bo.base.resv);
 
-	return drm_gem_vram_kmap_locked(gbo, map);
+	ret = ttm_bo_vmap(&gbo->bo, &gbo->map);
+	if (ret)
+		return ret;
+
+	*map = gbo->map;
+
+	return 0;
 }
 EXPORT_SYMBOL(drm_gem_vram_vmap);
 
@@ -442,9 +420,19 @@ EXPORT_SYMBOL(drm_gem_vram_vmap);
  */
 void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
 {
+	struct drm_device *dev = gbo->bo.base.dev;
+
 	dma_resv_assert_held(gbo->bo.base.resv);
 
-	drm_gem_vram_kunmap_locked(gbo, map);
+	if (drm_WARN_ON_ONCE(dev, !dma_buf_map_is_equal(&gbo->map, map)))
+		return; /* BUG: map not mapped from this BO */
+
+	/*
+	 * Permanently mapping and unmapping buffers adds overhead from
+	 * updating the page tables and creates debugging output. Therefore,
+	 * we delay the actual unmap operation until the BO gets evicted
+	 * from memory. See drm_gem_vram_bo_driver_move_notify().
+	 */
 }
 EXPORT_SYMBOL(drm_gem_vram_vunmap);
 
-- 
2.29.2

