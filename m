Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C92342D443A
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 15:26:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732959AbgLIO02 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 09:26:28 -0500
Received: from mx2.suse.de ([195.135.220.15]:39640 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732952AbgLIO0N (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Dec 2020 09:26:13 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id F0EA6ACE1;
        Wed,  9 Dec 2020 14:25:31 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, christian.koenig@amd.com, airlied@linux.ie,
        sumit.semwal@linaro.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com,
        sean@poorly.run, eric@anholt.net, sam@ravnborg.org
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        virtualization@lists.linux-foundation.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 2/8] drm/ast: Only map cursor BOs during updates
Date:   Wed,  9 Dec 2020 15:25:21 +0100
Message-Id: <20201209142527.26415-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201209142527.26415-1-tzimmermann@suse.de>
References: <20201209142527.26415-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The HW cursor's BO used to be mapped permanently into the kernel's
address space. GEM's vmap operation will be protected by locks, and
we don't want to lock the BO's for an indefinate period of time.

Change the cursor code to map the HW BOs only during updates. The
vmap operation in VRAM helpers is cheap, as a once estabished mapping
is being reused until the BO actually moves. As the HW cursor BOs are
permanently pinned, they never move at all.

v2:
	* fix typos in commit description

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ast/ast_cursor.c | 51 ++++++++++++++++++--------------
 drivers/gpu/drm/ast/ast_drv.h    |  2 --
 2 files changed, 28 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 68bf3d33f1ed..fac1ee79c372 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -39,7 +39,6 @@ static void ast_cursor_fini(struct ast_private *ast)
 
 	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
 		gbo = ast->cursor.gbo[i];
-		drm_gem_vram_vunmap(gbo, &ast->cursor.map[i]);
 		drm_gem_vram_unpin(gbo);
 		drm_gem_vram_put(gbo);
 	}
@@ -53,14 +52,13 @@ static void ast_cursor_release(struct drm_device *dev, void *ptr)
 }
 
 /*
- * Allocate cursor BOs and pins them at the end of VRAM.
+ * Allocate cursor BOs and pin them at the end of VRAM.
  */
 int ast_cursor_init(struct ast_private *ast)
 {
 	struct drm_device *dev = &ast->base;
 	size_t size, i;
 	struct drm_gem_vram_object *gbo;
-	struct dma_buf_map map;
 	int ret;
 
 	size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
@@ -77,15 +75,7 @@ int ast_cursor_init(struct ast_private *ast)
 			drm_gem_vram_put(gbo);
 			goto err_drm_gem_vram_put;
 		}
-		ret = drm_gem_vram_vmap(gbo, &map);
-		if (ret) {
-			drm_gem_vram_unpin(gbo);
-			drm_gem_vram_put(gbo);
-			goto err_drm_gem_vram_put;
-		}
-
 		ast->cursor.gbo[i] = gbo;
-		ast->cursor.map[i] = map;
 	}
 
 	return drmm_add_action_or_reset(dev, ast_cursor_release, NULL);
@@ -94,7 +84,6 @@ int ast_cursor_init(struct ast_private *ast)
 	while (i) {
 		--i;
 		gbo = ast->cursor.gbo[i];
-		drm_gem_vram_vunmap(gbo, &ast->cursor.map[i]);
 		drm_gem_vram_unpin(gbo);
 		drm_gem_vram_put(gbo);
 	}
@@ -168,31 +157,38 @@ static void update_cursor_image(u8 __iomem *dst, const u8 *src, int width, int h
 int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 {
 	struct drm_device *dev = &ast->base;
-	struct drm_gem_vram_object *gbo;
-	struct dma_buf_map map;
-	int ret;
-	void *src;
+	struct drm_gem_vram_object *dst_gbo = ast->cursor.gbo[ast->cursor.next_index];
+	struct drm_gem_vram_object *src_gbo = drm_gem_vram_of_gem(fb->obj[0]);
+	struct dma_buf_map src_map, dst_map;
 	void __iomem *dst;
+	void *src;
+	int ret;
 
 	if (drm_WARN_ON_ONCE(dev, fb->width > AST_MAX_HWC_WIDTH) ||
 	    drm_WARN_ON_ONCE(dev, fb->height > AST_MAX_HWC_HEIGHT))
 		return -EINVAL;
 
-	gbo = drm_gem_vram_of_gem(fb->obj[0]);
-
-	ret = drm_gem_vram_vmap(gbo, &map);
+	ret = drm_gem_vram_vmap(src_gbo, &src_map);
 	if (ret)
 		return ret;
-	src = map.vaddr; /* TODO: Use mapping abstraction properly */
+	src = src_map.vaddr; /* TODO: Use mapping abstraction properly */
 
-	dst = ast->cursor.map[ast->cursor.next_index].vaddr_iomem;
+	ret = drm_gem_vram_vmap(dst_gbo, &dst_map);
+	if (ret)
+		goto err_drm_gem_vram_vunmap;
+	dst = dst_map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
 
 	/* do data transfer to cursor BO */
 	update_cursor_image(dst, src, fb->width, fb->height);
 
-	drm_gem_vram_vunmap(gbo, &map);
+	drm_gem_vram_vunmap(dst_gbo, &dst_map);
+	drm_gem_vram_vunmap(src_gbo, &src_map);
 
 	return 0;
+
+err_drm_gem_vram_vunmap:
+	drm_gem_vram_vunmap(src_gbo, &src_map);
+	return ret;
 }
 
 static void ast_cursor_set_base(struct ast_private *ast, u64 address)
@@ -243,17 +239,26 @@ static void ast_cursor_set_location(struct ast_private *ast, u16 x, u16 y,
 void ast_cursor_show(struct ast_private *ast, int x, int y,
 		     unsigned int offset_x, unsigned int offset_y)
 {
+	struct drm_device *dev = &ast->base;
+	struct drm_gem_vram_object *gbo = ast->cursor.gbo[ast->cursor.next_index];
+	struct dma_buf_map map;
 	u8 x_offset, y_offset;
 	u8 __iomem *dst;
 	u8 __iomem *sig;
 	u8 jreg;
+	int ret;
 
-	dst = ast->cursor.map[ast->cursor.next_index].vaddr;
+	ret = drm_gem_vram_vmap(gbo, &map);
+	if (drm_WARN_ONCE(dev, ret, "drm_gem_vram_vmap() failed, ret=%d\n", ret))
+		return;
+	dst = map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
 
 	sig = dst + AST_HWC_SIZE;
 	writel(x, sig + AST_HWC_SIGNATURE_X);
 	writel(y, sig + AST_HWC_SIGNATURE_Y);
 
+	drm_gem_vram_vunmap(gbo, &map);
+
 	if (x < 0) {
 		x_offset = (-x) + offset_x;
 		x = 0;
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index ccaff81924ee..f871fc36c2f7 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -28,7 +28,6 @@
 #ifndef __AST_DRV_H__
 #define __AST_DRV_H__
 
-#include <linux/dma-buf-map.h>
 #include <linux/i2c.h>
 #include <linux/i2c-algo-bit.h>
 #include <linux/io.h>
@@ -133,7 +132,6 @@ struct ast_private {
 
 	struct {
 		struct drm_gem_vram_object *gbo[AST_DEFAULT_HWC_NUM];
-		struct dma_buf_map map[AST_DEFAULT_HWC_NUM];
 		unsigned int next_index;
 	} cursor;
 
-- 
2.29.2

