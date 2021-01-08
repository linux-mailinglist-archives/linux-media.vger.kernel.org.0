Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9D252EEFFB
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 10:46:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728091AbhAHJpN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 04:45:13 -0500
Received: from mx2.suse.de ([195.135.220.15]:36788 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728002AbhAHJpK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Jan 2021 04:45:10 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 6C39FAFBF;
        Fri,  8 Jan 2021 09:43:51 +0000 (UTC)
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
Subject: [PATCH v4 11/13] drm/vboxvideo: Use drm_gem_vram_vmap_local() in cursor update
Date:   Fri,  8 Jan 2021 10:43:38 +0100
Message-Id: <20210108094340.15290-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210108094340.15290-1-tzimmermann@suse.de>
References: <20210108094340.15290-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Cursor updates in vboxvideo require a short-term mapping of the
source BO. Use drm_gem_vram_vmap_local() and avoid the pinning
operations.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vboxvideo/vbox_mode.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index dbc0dd53c69e..215b37c78c10 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -381,7 +381,8 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 		container_of(plane->dev, struct vbox_private, ddev);
 	struct vbox_crtc *vbox_crtc = to_vbox_crtc(plane->state->crtc);
 	struct drm_framebuffer *fb = plane->state->fb;
-	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(fb->obj[0]);
+	struct drm_gem_object *obj = fb->obj[0];
+	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(obj);
 	u32 width = plane->state->crtc_w;
 	u32 height = plane->state->crtc_h;
 	size_t data_size, mask_size;
@@ -401,11 +402,12 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 
 	vbox_crtc->cursor_enabled = true;
 
-	ret = drm_gem_vram_vmap(gbo, &map);
+	ret = dma_resv_lock(obj->resv, NULL);
+	if (ret)
+		return;
+	ret = drm_gem_vram_vmap_local(gbo, &map);
 	if (ret) {
-		/*
-		 * BUG: we should have pinned the BO in prepare_fb().
-		 */
+		dma_resv_unlock(obj->resv);
 		mutex_unlock(&vbox->hw_mutex);
 		DRM_WARN("Could not map cursor bo, skipping update\n");
 		return;
@@ -421,7 +423,8 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 	data_size = width * height * 4 + mask_size;
 
 	copy_cursor_image(src, vbox->cursor_data, width, height, mask_size);
-	drm_gem_vram_vunmap(gbo, &map);
+	drm_gem_vram_vunmap_local(gbo, &map);
+	dma_resv_unlock(obj->resv);
 
 	flags = VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
 		VBOX_MOUSE_POINTER_ALPHA;
-- 
2.29.2

