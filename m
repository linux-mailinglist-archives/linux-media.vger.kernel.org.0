Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB40B2458C8
	for <lists+linux-media@lfdr.de>; Sun, 16 Aug 2020 19:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729458AbgHPRXI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Aug 2020 13:23:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgHPRXF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Aug 2020 13:23:05 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EA72C061786
        for <linux-media@vger.kernel.org>; Sun, 16 Aug 2020 10:23:04 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D62A8291EFF
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        "Andrew F . Davis" <afd@ti.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Daniel Stone <daniels@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Robert Beckett <bob.beckett@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        James Jones <jajones@nvidia.com>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [RFC] Experimental DMA-BUF Device Heaps
Date:   Sun, 16 Aug 2020 14:22:46 -0300
Message-Id: <20200816172246.69146-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This heap is basically a wrapper around DMA-API dma_alloc_attrs,
which will allocate memory suitable for the given device.

The implementation is mostly a port of the Contiguous Videobuf2
memory allocator (see videobuf2/videobuf2-dma-contig.c)
over to the DMA-BUF Heap interface.

The intention of this allocator is to provide applications
with a more system-agnostic API: the only thing the application
needs to know is which device to get the buffer for.

Whether the buffer is backed by CMA, IOMMU or a DMA Pool
is unknown to the application.

I'm not really expecting this patch to be correct or even
a good idea, but just submitting it to start a discussion on DMA-BUF
heap discovery and negotiation.

Given Plumbers is just a couple weeks from now, I've submitted
a BoF proposal to discuss this, as perhaps it would make
sense to discuss this live?

Not-signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/dma-buf/heaps/Kconfig       |   9 +
 drivers/dma-buf/heaps/Makefile      |   1 +
 drivers/dma-buf/heaps/device_heap.c | 268 ++++++++++++++++++++++++++++
 include/linux/device.h              |   5 +
 include/linux/dma-heap.h            |   6 +
 5 files changed, 289 insertions(+)
 create mode 100644 drivers/dma-buf/heaps/device_heap.c

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c4226..2bb3604184bd 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -12,3 +12,12 @@ config DMABUF_HEAPS_CMA
 	  Choose this option to enable dma-buf CMA heap. This heap is backed
 	  by the Contiguous Memory Allocator (CMA). If your system has these
 	  regions, you should say Y here.
+
+config DMABUF_HEAPS_DEVICES
+	bool "DMA-BUF Device DMA Heap (Experimental)"
+	depends on DMABUF_HEAPS
+	help
+	  Choose this option to enable dma-buf per-device heap. This heap is backed
+	  by the DMA-API and it's an Experimental feature, meant mostly for testing
+	  and experimentation.
+	  Just say N here.
diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
index 6e54cdec3da0..c691d85b3044 100644
--- a/drivers/dma-buf/heaps/Makefile
+++ b/drivers/dma-buf/heaps/Makefile
@@ -2,3 +2,4 @@
 obj-y					+= heap-helpers.o
 obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
+obj-$(CONFIG_DMABUF_HEAPS_DEVICES)	+= device_heap.o
diff --git a/drivers/dma-buf/heaps/device_heap.c b/drivers/dma-buf/heaps/device_heap.c
new file mode 100644
index 000000000000..1803dc622dd8
--- /dev/null
+++ b/drivers/dma-buf/heaps/device_heap.c
@@ -0,0 +1,268 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DMABUF Device DMA heap exporter
+ *
+ * Copyright (C) 2020, Collabora Ltd.
+ *
+ * Based on:
+ *   videobuf2-dma-contig.c - DMA contig memory allocator for videobuf2
+ *   Copyright (C) 2010 Samsung Electronics
+ */
+
+#include <linux/device.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
+#include <linux/dma-mapping.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+
+struct dev_dmabuf_attachment {
+	struct sg_table sgt;
+	enum dma_data_direction dma_dir;
+};
+
+struct dev_dmabuf {
+	struct dma_heap *heap;
+	struct dma_buf *dmabuf;
+	struct device *dev;
+	size_t size;
+	void *vaddr;
+	dma_addr_t dma_addr;
+	unsigned long attrs;
+
+	struct sg_table sgt;
+};
+
+static struct sg_table *dev_dmabuf_ops_map(struct dma_buf_attachment *db_attach,
+					   enum dma_data_direction dma_dir)
+{
+	struct dev_dmabuf_attachment *attach = db_attach->priv;
+	/* stealing dmabuf mutex to serialize map/unmap operations */
+	struct mutex *lock = &db_attach->dmabuf->lock;
+	struct sg_table *sgt;
+
+	mutex_lock(lock);
+
+	sgt = &attach->sgt;
+	/* return previously mapped sg table */
+	if (attach->dma_dir == dma_dir) {
+		mutex_unlock(lock);
+		return sgt;
+	}
+
+	/* release any previous cache */
+	if (attach->dma_dir != DMA_NONE) {
+		dma_unmap_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
+				   attach->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
+		attach->dma_dir = DMA_NONE;
+	}
+
+	/*
+	 * mapping to the client with new direction, no cache sync
+	 * required see comment in .dmabuf_ops_detach()
+	 */
+	sgt->nents = dma_map_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
+				      dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
+	if (!sgt->nents) {
+		dev_err(db_attach->dev, "failed to map scatterlist\n");
+		mutex_unlock(lock);
+		return ERR_PTR(-EIO);
+	}
+
+	attach->dma_dir = dma_dir;
+
+	mutex_unlock(lock);
+
+	return sgt;
+}
+
+static void dev_dmabuf_ops_unmap(struct dma_buf_attachment *db_attach,
+				 struct sg_table *sgt,
+				 enum dma_data_direction dma_dir)
+{
+	/* nothing to be done here */
+}
+
+static int dev_dmabuf_ops_attach(struct dma_buf *dmabuf,
+				 struct dma_buf_attachment *dbuf_attach)
+{
+	struct dev_dmabuf_attachment *attach;
+	unsigned int i;
+	struct scatterlist *rd, *wr;
+	struct sg_table *sgt;
+	struct dev_dmabuf *buf = dmabuf->priv;
+	int ret;
+
+	attach = kzalloc(sizeof(*attach), GFP_KERNEL);
+	if (!attach)
+		return -ENOMEM;
+	sgt = &attach->sgt;
+
+	/*
+	 * Copy the buf->sgt scatter list to the attachment, as we can't
+	 * map the same scatter list to multiple attachments at the same time.
+	 */
+	ret = sg_alloc_table(sgt, buf->sgt.orig_nents, GFP_KERNEL);
+	if (ret) {
+		kfree(attach);
+		return -ENOMEM;
+	}
+
+	rd = buf->sgt.sgl;
+	wr = sgt->sgl;
+	for (i = 0; i < sgt->orig_nents; ++i) {
+		sg_set_page(wr, sg_page(rd), rd->length, rd->offset);
+		rd = sg_next(rd);
+		wr = sg_next(wr);
+	}
+
+	attach->dma_dir = DMA_NONE;
+	dbuf_attach->priv = attach;
+
+	return 0;
+}
+
+static void dev_dmabuf_ops_detach(struct dma_buf *dmabuf,
+				  struct dma_buf_attachment *db_attach)
+{
+	struct dev_dmabuf_attachment *attach = db_attach->priv;
+	struct sg_table *sgt;
+
+	if (!attach)
+		return;
+	sgt = &attach->sgt;
+
+	/* release the scatterlist cache */
+	if (attach->dma_dir != DMA_NONE)
+		/*
+		 * Cache sync can be skipped here, as the memory is
+		 * allocated from device coherent memory, which means the
+		 * memory locations do not require any explicit cache
+		 * maintenance prior or after being used by the device.
+		 *
+		 * XXX: This needs a revisit.
+		 */
+		dma_unmap_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
+				   attach->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
+	sg_free_table(sgt);
+	kfree(attach);
+	db_attach->priv = NULL;
+}
+
+
+static void *dev_dmabuf_ops_vmap(struct dma_buf *dmabuf)
+{
+	struct dev_dmabuf *buf = dmabuf->priv;
+
+	return buf->vaddr;
+}
+
+static void dev_dmabuf_ops_release(struct dma_buf *dmabuf)
+{
+	struct dev_dmabuf *buf = dmabuf->priv;
+
+	sg_free_table(&buf->sgt);
+	dma_free_attrs(buf->dev, buf->size, buf->vaddr,
+		       buf->dma_addr, buf->attrs);
+	put_device(buf->dev);
+	kfree(buf);
+}
+
+static int dev_dmabuf_ops_mmap(struct dma_buf *dmabuf,
+			       struct vm_area_struct *vma)
+{
+	struct dev_dmabuf *buf = dmabuf->priv;
+	int ret;
+
+	ret = dma_mmap_attrs(buf->dev, vma, buf->vaddr,
+			     buf->dma_addr, buf->size,
+			     buf->attrs);
+	if (ret) {
+		dev_err(buf->dev, "remapping memory failed, error: %d\n", ret);
+		return ret;
+	}
+	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
+
+	return 0;
+}
+
+static const struct dma_buf_ops dev_dmabuf_ops = {
+	.attach = dev_dmabuf_ops_attach,
+	.detach = dev_dmabuf_ops_detach,
+	.map_dma_buf = dev_dmabuf_ops_map,
+	.unmap_dma_buf = dev_dmabuf_ops_unmap,
+	.vmap = dev_dmabuf_ops_vmap,
+	.mmap = dev_dmabuf_ops_mmap,
+	.release = dev_dmabuf_ops_release,
+};
+
+static int dev_heap_allocate(struct dma_heap *heap,
+			unsigned long size,
+			unsigned long fd_flags,
+			unsigned long heap_flags)
+{
+	struct device *dev = dma_heap_get_drvdata(heap);
+	struct dev_dmabuf *buf;
+	struct dma_buf_export_info exp_info = {};
+	unsigned long attrs = 0;
+	int ret = -ENOMEM;
+
+	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	buf->vaddr = dma_alloc_attrs(dev, size, &buf->dma_addr,
+				     GFP_KERNEL, attrs);
+	/* Prevent the device from being released while the buffer is used */
+	buf->dev = get_device(dev);
+	buf->heap = heap;
+	buf->size = size;
+	buf->attrs = attrs;
+
+	/* XXX: This call is documented as unsafe. See dma_get_sgtable_attrs(). */
+	ret = dma_get_sgtable_attrs(buf->dev, &buf->sgt,
+				    buf->vaddr, buf->dma_addr,
+				    buf->size, buf->attrs);
+	if (ret < 0) {
+		dev_err(buf->dev, "failed to get scatterlist from DMA API\n");
+		return ret;
+	}
+
+	exp_info.exp_name = dev_name(dev);
+	exp_info.owner = THIS_MODULE;
+	exp_info.ops = &dev_dmabuf_ops;
+	exp_info.size = size;
+	exp_info.flags = fd_flags;
+	exp_info.priv = buf;
+
+	buf->dmabuf = dma_buf_export(&exp_info);
+	if (IS_ERR(buf->dmabuf)) {
+		dev_err(buf->dev, "failed to export dmabuf\n");
+		return PTR_ERR(buf->dmabuf);
+	}
+
+	ret = dma_buf_fd(buf->dmabuf, fd_flags);
+	if (ret < 0) {
+		dev_err(buf->dev, "failed to get dmabuf fd: %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static const struct dma_heap_ops dev_heap_ops = {
+	.allocate = dev_heap_allocate,
+};
+
+void dev_dma_heap_add(struct device *dev)
+{
+	struct dma_heap_export_info exp_info;
+
+	exp_info.name = dev_name(dev);
+	exp_info.ops = &dev_heap_ops;
+	exp_info.priv = dev;
+
+	dev->heap = dma_heap_add(&exp_info);
+}
+EXPORT_SYMBOL(dev_dma_heap_add);
diff --git a/include/linux/device.h b/include/linux/device.h
index ca18da4768e3..1fae95d55ea1 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -45,6 +45,7 @@ struct iommu_ops;
 struct iommu_group;
 struct dev_pin_info;
 struct dev_iommu;
+struct dma_heap;
 
 /**
  * struct subsys_interface - interfaces to device functions
@@ -597,6 +598,10 @@ struct device {
 	struct iommu_group	*iommu_group;
 	struct dev_iommu	*iommu;
 
+#ifdef CONFIG_DMABUF_HEAPS_DEVICES
+	struct dma_heap		*heap;
+#endif
+
 	bool			offline_disabled:1;
 	bool			offline:1;
 	bool			of_node_reused:1;
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 454e354d1ffb..dcf7cca2f487 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -56,4 +56,10 @@ void *dma_heap_get_drvdata(struct dma_heap *heap);
  */
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
 
+#ifdef CONFIG_DMABUF_HEAPS_DEVICES
+void dev_dma_heap_add(struct device *dev);
+#else
+static inline void dev_dma_heap_add(struct device *dev) {}
+#endif
+
 #endif /* _DMA_HEAPS_H */
-- 
2.27.0

