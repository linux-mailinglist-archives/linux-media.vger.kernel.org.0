Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 645722A400F
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 10:30:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727829AbgKCJaZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 04:30:25 -0500
Received: from mx2.suse.de ([195.135.220.15]:37260 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727716AbgKCJaY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Nov 2020 04:30:24 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 03F0AB190;
        Tue,  3 Nov 2020 09:30:23 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
        alexander.deucher@amd.com, christian.koenig@amd.com,
        kraxel@redhat.com, l.stach@pengutronix.de,
        linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        kgene@kernel.org, krzk@kernel.org, yuq825@gmail.com,
        bskeggs@redhat.com, robh@kernel.org, tomeu.vizoso@collabora.com,
        steven.price@arm.com, alyssa.rosenzweig@collabora.com,
        hjc@rock-chips.com, heiko@sntech.de, hdegoede@redhat.com,
        sean@poorly.run, eric@anholt.net, oleksandr_andrushchenko@epam.com,
        ray.huang@amd.com, sumit.semwal@linaro.org,
        emil.velikov@collabora.com, luben.tuikov@amd.com, apaneers@amd.com,
        linus.walleij@linaro.org, melissa.srw@gmail.com,
        chris@chris-wilson.co.uk, miaoqinglang@huawei.com
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        etnaviv@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v7 07/10] drm/gem: Update internal GEM vmap/vunmap interfaces to use struct dma_buf_map
Date:   Tue,  3 Nov 2020 10:30:12 +0100
Message-Id: <20201103093015.1063-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201103093015.1063-1-tzimmermann@suse.de>
References: <20201103093015.1063-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

GEM's vmap and vunmap interfaces now wrap memory pointers in struct
dma_buf_map.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Tested-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_client.c   | 18 +++++++++++-------
 drivers/gpu/drm/drm_gem.c      | 26 +++++++++++++-------------
 drivers/gpu/drm/drm_internal.h |  5 +++--
 drivers/gpu/drm/drm_prime.c    | 14 ++++----------
 4 files changed, 31 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 495f47d23d87..ac0082bed966 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -3,6 +3,7 @@
  * Copyright 2018 Noralf Trønnes
  */
 
+#include <linux/dma-buf-map.h>
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -304,7 +305,8 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u
  */
 void *drm_client_buffer_vmap(struct drm_client_buffer *buffer)
 {
-	void *vaddr;
+	struct dma_buf_map map;
+	int ret;
 
 	if (buffer->vaddr)
 		return buffer->vaddr;
@@ -317,13 +319,13 @@ void *drm_client_buffer_vmap(struct drm_client_buffer *buffer)
 	 * fd_install step out of the driver backend hooks, to make that
 	 * final step optional for internal users.
 	 */
-	vaddr = drm_gem_vmap(buffer->gem);
-	if (IS_ERR(vaddr))
-		return vaddr;
+	ret = drm_gem_vmap(buffer->gem, &map);
+	if (ret)
+		return ERR_PTR(ret);
 
-	buffer->vaddr = vaddr;
+	buffer->vaddr = map.vaddr;
 
-	return vaddr;
+	return map.vaddr;
 }
 EXPORT_SYMBOL(drm_client_buffer_vmap);
 
@@ -337,7 +339,9 @@ EXPORT_SYMBOL(drm_client_buffer_vmap);
  */
 void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
 {
-	drm_gem_vunmap(buffer->gem, buffer->vaddr);
+	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(buffer->vaddr);
+
+	drm_gem_vunmap(buffer->gem, &map);
 	buffer->vaddr = NULL;
 }
 EXPORT_SYMBOL(drm_client_buffer_vunmap);
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 4231fda26e70..eb2d23e04be9 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1206,32 +1206,32 @@ void drm_gem_unpin(struct drm_gem_object *obj)
 		obj->funcs->unpin(obj);
 }
 
-void *drm_gem_vmap(struct drm_gem_object *obj)
+int drm_gem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 {
-	struct dma_buf_map map;
 	int ret;
 
 	if (!obj->funcs->vmap)
-		return ERR_PTR(-EOPNOTSUPP);
+		return -EOPNOTSUPP;
 
-	ret = obj->funcs->vmap(obj, &map);
+	ret = obj->funcs->vmap(obj, map);
 	if (ret)
-		return ERR_PTR(ret);
-	else if (dma_buf_map_is_null(&map))
-		return ERR_PTR(-ENOMEM);
+		return ret;
+	else if (dma_buf_map_is_null(map))
+		return -ENOMEM;
 
-	return map.vaddr;
+	return 0;
 }
 
-void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr)
+void drm_gem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 {
-	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(vaddr);
-
-	if (!vaddr)
+	if (dma_buf_map_is_null(map))
 		return;
 
 	if (obj->funcs->vunmap)
-		obj->funcs->vunmap(obj, &map);
+		obj->funcs->vunmap(obj, map);
+
+	/* Always set the mapping to NULL. Callers may rely on this. */
+	dma_buf_map_clear(map);
 }
 
 /**
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 2bdac3557765..81d386b5b92a 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -33,6 +33,7 @@
 
 struct dentry;
 struct dma_buf;
+struct dma_buf_map;
 struct drm_connector;
 struct drm_crtc;
 struct drm_framebuffer;
@@ -187,8 +188,8 @@ void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
 
 int drm_gem_pin(struct drm_gem_object *obj);
 void drm_gem_unpin(struct drm_gem_object *obj);
-void *drm_gem_vmap(struct drm_gem_object *obj);
-void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr);
+int drm_gem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
+void drm_gem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
 
 /* drm_debugfs.c drm_debugfs_crc.c */
 #if defined(CONFIG_DEBUG_FS)
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 187b55ede62e..302e2bb3dfff 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -667,21 +667,15 @@ EXPORT_SYMBOL(drm_gem_unmap_dma_buf);
  *
  * Sets up a kernel virtual mapping. This can be used as the &dma_buf_ops.vmap
  * callback. Calls into &drm_gem_object_funcs.vmap for device specific handling.
+ * The kernel virtual address is returned in map.
  *
- * Returns the kernel virtual address or NULL on failure.
+ * Returns 0 on success or a negative errno code otherwise.
  */
 int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
 {
 	struct drm_gem_object *obj = dma_buf->priv;
-	void *vaddr;
 
-	vaddr = drm_gem_vmap(obj);
-	if (IS_ERR(vaddr))
-		return PTR_ERR(vaddr);
-
-	dma_buf_map_set_vaddr(map, vaddr);
-
-	return 0;
+	return drm_gem_vmap(obj, map);
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_vmap);
 
@@ -697,7 +691,7 @@ void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
 {
 	struct drm_gem_object *obj = dma_buf->priv;
 
-	drm_gem_vunmap(obj, map->vaddr);
+	drm_gem_vunmap(obj, map);
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_vunmap);
 
-- 
2.29.0

