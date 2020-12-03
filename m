Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1F922CD871
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 15:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436468AbgLCODt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 09:03:49 -0500
Received: from mx2.suse.de ([195.135.220.15]:34768 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389078AbgLCODt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 09:03:49 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 36AC4AD8D;
        Thu,  3 Dec 2020 14:03:08 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@redhat.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        hdegoede@redhat.com, christian.koenig@amd.com,
        sumit.semwal@linaro.org
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 4/7] drm/vram-helper: Remove pinning from drm_gem_vram_{vmap,vunmap}()
Date:   Thu,  3 Dec 2020 15:02:56 +0100
Message-Id: <20201203140259.26580-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203140259.26580-1-tzimmermann@suse.de>
References: <20201203140259.26580-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

BO pinning was never meant to be part of a GEM object's vmap operation.
Remove it from the related code in VRAM helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 35a30dafccce..760d77c6c3c0 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -438,22 +438,9 @@ static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo,
  */
 int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
 {
-	int ret;
-
 	dma_resv_assert_held(gbo->bo.base.resv);
 
-	ret = drm_gem_vram_pin_locked(gbo, 0);
-	if (ret)
-		return ret;
-	ret = drm_gem_vram_kmap_locked(gbo, map);
-	if (ret)
-		goto err_drm_gem_vram_unpin_locked;
-
-	return 0;
-
-err_drm_gem_vram_unpin_locked:
-	drm_gem_vram_unpin_locked(gbo);
-	return ret;
+	return drm_gem_vram_kmap_locked(gbo, map);
 }
 EXPORT_SYMBOL(drm_gem_vram_vmap);
 
@@ -470,7 +457,6 @@ void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *ma
 	dma_resv_assert_held(gbo->bo.base.resv);
 
 	drm_gem_vram_kunmap_locked(gbo, map);
-	drm_gem_vram_unpin_locked(gbo);
 }
 EXPORT_SYMBOL(drm_gem_vram_vunmap);
 
-- 
2.29.2

