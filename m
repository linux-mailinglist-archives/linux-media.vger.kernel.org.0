Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63B492CD87A
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 15:06:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730572AbgLCOE3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 09:04:29 -0500
Received: from mx2.suse.de ([195.135.220.15]:35306 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726112AbgLCOE3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 09:04:29 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id E2A74ADD7;
        Thu,  3 Dec 2020 14:03:09 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@redhat.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        hdegoede@redhat.com, christian.koenig@amd.com,
        sumit.semwal@linaro.org
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 7/7] dma-buf: Write down some rules for vmap usage
Date:   Thu,  3 Dec 2020 15:02:59 +0100
Message-Id: <20201203140259.26580-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203140259.26580-1-tzimmermann@suse.de>
References: <20201203140259.26580-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dma-buf's vmap and vunmap callbacks are undocumented and various
exporters currently have slightly different semantics for them. Add
documentation on how to implement and use these interfaces correctly.

v2:
	* document vmap semantics in struct dma_buf_ops
	* add TODO item for reviewing and maybe fixing dma-buf exporters

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/gpu/todo.rst | 15 +++++++++++++
 include/drm/drm_gem.h      |  4 ++++
 include/linux/dma-buf.h    | 45 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 009d8e6c7e3c..32bb797a84fc 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -505,6 +505,21 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>, Christian König, Daniel Vette
 Level: Intermediate
 
 
+Enforce rules for dma-buf vmap and pin ops
+------------------------------------------
+
+Exporter implementations of vmap and pin in struct dma_buf_ops (and consequently
+struct drm_gem_object_funcs) use a variety of locking semantics. Some rely on
+the caller holding the dma-buf's reservation lock, some do their own locking,
+some don't require any locking. VRAM helpers even used to pin as part of vmap.
+
+We need to review each exporter and enforce the documented rules.
+
+Contact: Christian König, Daniel Vetter, Thomas Zimmermann <tzimmermann@suse.de>
+
+Level: Advanced
+
+
 Core refactorings
 =================
 
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 5e6daa1c982f..1864c6a721b1 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -138,6 +138,8 @@ struct drm_gem_object_funcs {
 	 * drm_gem_dmabuf_vmap() helper.
 	 *
 	 * This callback is optional.
+	 *
+	 * See also struct dma_buf_ops.vmap
 	 */
 	int (*vmap)(struct drm_gem_object *obj, struct dma_buf_map *map);
 
@@ -148,6 +150,8 @@ struct drm_gem_object_funcs {
 	 * drm_gem_dmabuf_vunmap() helper.
 	 *
 	 * This callback is optional.
+	 *
+	 * See also struct dma_buf_ops.vunmap
 	 */
 	void (*vunmap)(struct drm_gem_object *obj, struct dma_buf_map *map);
 
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index cf72699cb2bc..dc81fdc01dda 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -267,7 +267,52 @@ struct dma_buf_ops {
 	 */
 	int (*mmap)(struct dma_buf *, struct vm_area_struct *vma);
 
+	/**
+	 * @vmap:
+	 *
+	 * Returns a virtual address for the buffer.
+	 *
+	 * Notes to callers:
+	 *
+	 * - Callers must hold the struct dma_buf.resv lock before calling
+	 *   this interface.
+	 *
+	 * - Callers must provide means to prevent the mappings from going
+	 *   stale, such as holding the reservation lock or providing a
+	 *   move-notify callback to the exporter.
+	 *
+	 * Notes to implementors:
+	 *
+	 * - Implementations must expect pairs of @vmap and @vunmap to be
+	 *   called frequently and should optimize for this case.
+	 *
+	 * - Implementations should avoid additional operations, such as
+	 *   pinning.
+	 *
+	 * - Implementations may expect the caller to hold the dma-buf's
+	 *   reservation lock to protect against concurrent calls and
+	 *   relocation.
+	 *
+	 * - Implementations may provide additional guarantees, such as working
+	 *   without holding the reservation lock.
+	 *
+	 * This callback is optional.
+	 *
+	 * Returns:
+	 *
+	 * 0 on success or a negative error code on failure.
+	 */
 	int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
+
+	/**
+	 * @vunmap:
+	 *
+	 * Releases the address previously returned by @vmap.
+	 *
+	 * This callback is optional.
+	 *
+	 * See also @vmap()
+	 */
 	void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
 };
 
-- 
2.29.2

