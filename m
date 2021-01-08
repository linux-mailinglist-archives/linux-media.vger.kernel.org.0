Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF962EEFF8
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 10:46:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728040AbhAHJpL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 04:45:11 -0500
Received: from mx2.suse.de ([195.135.220.15]:36782 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727986AbhAHJpK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Jan 2021 04:45:10 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id AFFABAFEF;
        Fri,  8 Jan 2021 09:43:50 +0000 (UTC)
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
Subject: [PATCH v4 10/13] drm/ast: Use drm_gem_vram_vmap_local() in cursor update
Date:   Fri,  8 Jan 2021 10:43:37 +0100
Message-Id: <20210108094340.15290-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210108094340.15290-1-tzimmermann@suse.de>
References: <20210108094340.15290-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Cursor updates in ast require a short-term mapping of the source and
destination BO. Use drm_gem_vram_vmap_local() and avoid the pinning
operations.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c | 37 +++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index fac1ee79c372..c38f435bcde2 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -159,6 +159,8 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 	struct drm_device *dev = &ast->base;
 	struct drm_gem_vram_object *dst_gbo = ast->cursor.gbo[ast->cursor.next_index];
 	struct drm_gem_vram_object *src_gbo = drm_gem_vram_of_gem(fb->obj[0]);
+	struct drm_gem_object *objs[] = {&src_gbo->bo.base, &dst_gbo->bo.base};
+	struct ww_acquire_ctx ctx;
 	struct dma_buf_map src_map, dst_map;
 	void __iomem *dst;
 	void *src;
@@ -168,26 +170,34 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 	    drm_WARN_ON_ONCE(dev, fb->height > AST_MAX_HWC_HEIGHT))
 		return -EINVAL;
 
-	ret = drm_gem_vram_vmap(src_gbo, &src_map);
+	ret = drm_gem_lock_reservations(objs, ARRAY_SIZE(objs), &ctx);
 	if (ret)
 		return ret;
+
+	ret = drm_gem_vram_vmap_local(src_gbo, &src_map);
+	if (ret)
+		goto err_drm_gem_unlock_reservations;
 	src = src_map.vaddr; /* TODO: Use mapping abstraction properly */
 
-	ret = drm_gem_vram_vmap(dst_gbo, &dst_map);
+	ret = drm_gem_vram_vmap_local(dst_gbo, &dst_map);
 	if (ret)
-		goto err_drm_gem_vram_vunmap;
+		goto err_drm_gem_vram_vunmap_local;
 	dst = dst_map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
 
 	/* do data transfer to cursor BO */
 	update_cursor_image(dst, src, fb->width, fb->height);
 
-	drm_gem_vram_vunmap(dst_gbo, &dst_map);
-	drm_gem_vram_vunmap(src_gbo, &src_map);
+	drm_gem_vram_vunmap_local(dst_gbo, &dst_map);
+	drm_gem_vram_vunmap_local(src_gbo, &src_map);
+
+	drm_gem_unlock_reservations(objs, ARRAY_SIZE(objs), &ctx);
 
 	return 0;
 
-err_drm_gem_vram_vunmap:
-	drm_gem_vram_vunmap(src_gbo, &src_map);
+err_drm_gem_vram_vunmap_local:
+	drm_gem_vram_vunmap_local(src_gbo, &src_map);
+err_drm_gem_unlock_reservations:
+	drm_gem_unlock_reservations(objs, ARRAY_SIZE(objs), &ctx);
 	return ret;
 }
 
@@ -241,6 +251,7 @@ void ast_cursor_show(struct ast_private *ast, int x, int y,
 {
 	struct drm_device *dev = &ast->base;
 	struct drm_gem_vram_object *gbo = ast->cursor.gbo[ast->cursor.next_index];
+	struct drm_gem_object *obj = &gbo->bo.base;
 	struct dma_buf_map map;
 	u8 x_offset, y_offset;
 	u8 __iomem *dst;
@@ -248,16 +259,22 @@ void ast_cursor_show(struct ast_private *ast, int x, int y,
 	u8 jreg;
 	int ret;
 
-	ret = drm_gem_vram_vmap(gbo, &map);
-	if (drm_WARN_ONCE(dev, ret, "drm_gem_vram_vmap() failed, ret=%d\n", ret))
+	ret = dma_resv_lock(obj->resv, NULL);
+	if (ret)
+		return;
+	ret = drm_gem_vram_vmap_local(gbo, &map);
+	if (drm_WARN_ONCE(dev, ret, "drm_gem_vram_vmap_local() failed, ret=%d\n", ret)) {
+		dma_resv_unlock(obj->resv);
 		return;
+	}
 	dst = map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
 
 	sig = dst + AST_HWC_SIZE;
 	writel(x, sig + AST_HWC_SIGNATURE_X);
 	writel(y, sig + AST_HWC_SIGNATURE_Y);
 
-	drm_gem_vram_vunmap(gbo, &map);
+	drm_gem_vram_vunmap_local(gbo, &map);
+	dma_resv_unlock(obj->resv);
 
 	if (x < 0) {
 		x_offset = (-x) + offset_x;
-- 
2.29.2

