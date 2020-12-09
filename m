Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3D602D4438
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 15:26:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732957AbgLIO01 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 09:26:27 -0500
Received: from mx2.suse.de ([195.135.220.15]:39682 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732953AbgLIO0O (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Dec 2020 09:26:14 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id AE327ACEB;
        Wed,  9 Dec 2020 14:25:32 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, christian.koenig@amd.com, airlied@linux.ie,
        sumit.semwal@linaro.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com,
        sean@poorly.run, eric@anholt.net, sam@ravnborg.org
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        virtualization@lists.linux-foundation.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 3/8] dma-buf: Add vmap_local and vnumap_local operations
Date:   Wed,  9 Dec 2020 15:25:22 +0100
Message-Id: <20201209142527.26415-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201209142527.26415-1-tzimmermann@suse.de>
References: <20201209142527.26415-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The existing dma-buf calls dma_buf_vmap() and dma_buf_vunmap() are
allowed to pin the buffer or acquire the buffer's reservation object
lock.

This is a problem for callers that only require a short-term mapping
of the buffer without the pinning, or callers that have special locking
requirements. These may suffer from unnecessary overhead or interfere
with regular pin operations.

The new interfaces dma_buf_vmap_local(), dma_buf_vunmapo_local(), and
their rsp callbacks in struct dma_buf_ops provide an alternative without
pinning or reservation locking. Callers are responsible for these
operations.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/dma-buf/dma-buf.c | 80 +++++++++++++++++++++++++++++++++++++++
 include/linux/dma-buf.h   | 34 +++++++++++++++++
 2 files changed, 114 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index e63684d4cd90..be9f80190a66 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1265,6 +1265,86 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
 }
 EXPORT_SYMBOL_GPL(dma_buf_vunmap);
 
+/**
+ * dma_buf_vmap_local - Create virtual mapping for the buffer object into kernel
+ * address space.
+ * @dmabuf:	[in]	buffer to vmap
+ * @map:	[out]	returns the vmap pointer
+ *
+ * This call may fail due to lack of virtual mapping address space.
+ * These calls are optional in drivers. The intended use for them
+ * is for mapping objects linear in kernel space for high use objects.
+ * Please attempt to use kmap/kunmap before thinking about these interfaces.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
+ */
+int dma_buf_vmap_local(struct dma_buf *dmabuf, struct dma_buf_map *map)
+{
+	struct dma_buf_map ptr;
+	int ret = 0;
+
+	dma_buf_map_clear(map);
+
+	if (WARN_ON(!dmabuf))
+		return -EINVAL;
+
+	dma_resv_assert_held(dmabuf->resv);
+
+	if (!dmabuf->ops->vmap_local)
+		return -EINVAL;
+
+	mutex_lock(&dmabuf->lock);
+	if (dmabuf->vmapping_counter) {
+		dmabuf->vmapping_counter++;
+		BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
+		*map = dmabuf->vmap_ptr;
+		goto out_unlock;
+	}
+
+	BUG_ON(dma_buf_map_is_set(&dmabuf->vmap_ptr));
+
+	ret = dmabuf->ops->vmap_local(dmabuf, &ptr);
+	if (WARN_ON_ONCE(ret))
+		goto out_unlock;
+
+	dmabuf->vmap_ptr = ptr;
+	dmabuf->vmapping_counter = 1;
+
+	*map = dmabuf->vmap_ptr;
+
+out_unlock:
+	mutex_unlock(&dmabuf->lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dma_buf_vmap_local);
+
+/**
+ * dma_buf_vunmap_local - Unmap a vmap obtained by dma_buf_vmap_local.
+ * @dmabuf:	[in]	buffer to vunmap
+ * @map:	[in]	vmap pointer to vunmap
+ */
+void dma_buf_vunmap_local(struct dma_buf *dmabuf, struct dma_buf_map *map)
+{
+	if (WARN_ON(!dmabuf))
+		return;
+
+	dma_resv_assert_held(dmabuf->resv);
+
+	BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
+	BUG_ON(dmabuf->vmapping_counter == 0);
+	BUG_ON(!dma_buf_map_is_equal(&dmabuf->vmap_ptr, map));
+
+	mutex_lock(&dmabuf->lock);
+	if (--dmabuf->vmapping_counter == 0) {
+		if (dmabuf->ops->vunmap_local)
+			dmabuf->ops->vunmap_local(dmabuf, map);
+		dma_buf_map_clear(&dmabuf->vmap_ptr);
+	}
+	mutex_unlock(&dmabuf->lock);
+}
+EXPORT_SYMBOL_GPL(dma_buf_vunmap_local);
+
 #ifdef CONFIG_DEBUG_FS
 static int dma_buf_debug_show(struct seq_file *s, void *unused)
 {
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index cf72699cb2bc..f66580d23a9b 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -269,6 +269,38 @@ struct dma_buf_ops {
 
 	int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
 	void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
+
+	/**
+	 * @vmap_local:
+	 *
+	 * Creates a virtual mapping for the buffer into kernel address space.
+	 *
+	 * This callback establishes short-term mappings for situations where
+	 * callers only use the buffer for a bounded amount of time; such as
+	 * updates to the framebuffer or reading back contained information.
+	 * In contrast to the regular @vmap callback, vmap_local does never pin
+	 * the buffer to a specific domain or acquire the buffer's reservation
+	 * lock.
+	 *
+	 * This is called with the dmabuf->resv object locked. Callers must hold
+	 * the lock until after removing the mapping with @vunmap_local.
+	 *
+	 * This callback is optional.
+	 *
+	 * Returns:
+	 *
+	 * 0 on success or a negative error code on failure.
+	 */
+	int (*vmap_local)(struct dma_buf *dmabuf, struct dma_buf_map *map);
+
+	/**
+	 * @vunmap_local:
+	 *
+	 * Removes a virtual mapping that wa sestablished by @vmap_local.
+	 *
+	 * This callback is optional.
+	 */
+	void (*vunmap_local)(struct dma_buf *dmabuf, struct dma_buf_map *map);
 };
 
 /**
@@ -506,4 +538,6 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
 		 unsigned long);
 int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
 void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
+int dma_buf_vmap_local(struct dma_buf *dmabuf, struct dma_buf_map *map);
+void dma_buf_vunmap_local(struct dma_buf *dmabuf, struct dma_buf_map *map);
 #endif /* __DMA_BUF_H__ */
-- 
2.29.2

