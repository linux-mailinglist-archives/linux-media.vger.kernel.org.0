Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3873E278675
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 13:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728391AbgIYL4O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 07:56:14 -0400
Received: from mx2.suse.de ([195.135.220.15]:45668 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727521AbgIYL4I (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 07:56:08 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 9EFF8AF4D;
        Fri, 25 Sep 2020 11:56:06 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     sumit.semwal@linaro.org, christian.koenig@amd.com, afd@ti.com,
        corbet@lwn.net, benjamin.gaignard@linaro.org, lmark@codeaurora.org,
        labbott@redhat.com, Brian.Starkey@arm.com, john.stultz@linaro.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, l.stach@pengutronix.de,
        linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, mchehab@kernel.org,
        matthew.auld@intel.com, robin.murphy@arm.com,
        thomas.hellstrom@intel.com, sam@ravnborg.org, kraxel@redhat.com,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        etnaviv@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v3 4/4] dma-buf: Document struct dma_buf_map
Date:   Fri, 25 Sep 2020 13:56:01 +0200
Message-Id: <20200925115601.23955-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200925115601.23955-1-tzimmermann@suse.de>
References: <20200925115601.23955-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds struct dma_buf_map and its helpers to the documentation. A
short tutorial is included.

v3:
	* update documentation in a separate patch
	* expand docs (Daniel)
	* carry-over acks from patch 1

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
---
 Documentation/driver-api/dma-buf.rst |  9 ++++
 include/linux/dma-buf-map.h          | 72 ++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
index 13ea0cc0a3fa..6dbcc4714b0b 100644
--- a/Documentation/driver-api/dma-buf.rst
+++ b/Documentation/driver-api/dma-buf.rst
@@ -115,6 +115,15 @@ Kernel Functions and Structures Reference
 .. kernel-doc:: include/linux/dma-buf.h
    :internal:
 
+Buffer Mapping Helpers
+~~~~~~~~~~~~~~~~~~~~~~
+
+.. kernel-doc:: include/linux/dma-buf-map.h
+   :doc: overview
+
+.. kernel-doc:: include/linux/dma-buf-map.h
+   :internal:
+
 Reservation Objects
 -------------------
 
diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
index c173a4abf4ba..fd1aba545fdf 100644
--- a/include/linux/dma-buf-map.h
+++ b/include/linux/dma-buf-map.h
@@ -8,6 +8,78 @@
 
 #include <linux/io.h>
 
+/**
+ * DOC: overview
+ *
+ * Calling dma-buf's vmap operation returns a pointer to the buffer's memory.
+ * Depending on the location of the buffer, users may have to access it with
+ * I/O operations or memory load/store operations. For example, copying to
+ * system memory could be done with memcpy(), copying to I/O memory would be
+ * done with memcpy_toio().
+ *
+ * .. code-block:: c
+ *
+ *	void *vaddr = ...; // pointer to system memory
+ *	memcpy(vaddr, src, len);
+ *
+ *	void *vaddr_iomem = ...; // pointer to I/O memory
+ *	memcpy_toio(vaddr, _iomem, src, len);
+ *
+ * When using dma-buf's vmap operation, the returned pointer is encoded as
+ * :c:type:`struct dma_buf_map <dma_buf_map>`.
+ * :c:type:`struct dma_buf_map <dma_buf_map>` stores the buffer's address in
+ * system or I/O memory and a flag that signals the required method of
+ * accessing the buffer. Use the returned instance and the helper functions
+ * to access the buffer's memory in the correct way.
+ *
+ * Open-coding access to :c:type:`struct dma_buf_map <dma_buf_map>` is
+ * considered bad style. Rather then accessing its fields directly, use one
+ * of the provided helper functions, or implement your own. For example,
+ * instances of :c:type:`struct dma_buf_map <dma_buf_map>` can be initialized
+ * statically with DMA_BUF_MAP_INIT_VADDR(), or at runtime with
+ * dma_buf_map_set_vaddr(). These helpers will set an address in system memory.
+ *
+ * .. code-block:: c
+ *
+ *	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(0xdeadbeaf);
+ *
+ *	dma_buf_map_set_vaddr(&map. 0xdeadbeaf);
+ *
+ * Test if a mapping is valid with either dma_buf_map_is_set() or
+ * dma_buf_map_is_null().
+ *
+ * .. code-block:: c
+ *
+ *	if (dma_buf_map_is_set(&map) != dma_buf_map_is_null(&map))
+ *		// always true
+ *
+ * Instances of :c:type:`struct dma_buf_map <dma_buf_map>` can be compared
+ * for equality with dma_buf_map_is_equal(). Mappings the point to different
+ * memory spaces, system or I/O, are never equal. That's even true if both
+ * spaces are located in the same address space, both mappings contain the
+ * same address value, or both mappings refer to NULL.
+ *
+ * .. code-block:: c
+ *
+ *	struct dma_buf_map sys_map; // refers to system memory
+ *	struct dma_buf_map io_map; // refers to I/O memory
+ *
+ *	if (dma_buf_map_is_equal(&sys_map, &io_map))
+ *		// always false
+ *
+ * Instances of struct dma_buf_map do not have to be cleaned up, but
+ * can be cleared to NULL with dma_buf_map_clear(). Cleared mappings
+ * always refer to system memory.
+ *
+ * The type :c:type:`struct dma_buf_map <dma_buf_map>` and its helpers are
+ * actually independent from the dma-buf infrastructure. When sharing buffers
+ * among devices, drivers have to know the location of the memory to access
+ * the buffers in a safe way. :c:type:`struct dma_buf_map <dma_buf_map>`
+ * solves this problem for dma-buf and its users. If other drivers or
+ * sub-systems require similar functionality, the type could be generalized
+ * and moved to a more prominent header file.
+ */
+
 /**
  * struct dma_buf_map - Pointer to vmap'ed dma-buf memory.
  * @vaddr_iomem:	The buffer's address if in I/O memory
-- 
2.28.0

