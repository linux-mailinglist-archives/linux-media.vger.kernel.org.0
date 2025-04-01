Return-Path: <linux-media+bounces-29165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C84DA77EA7
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 17:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6097A3A745F
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 15:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2258C207670;
	Tue,  1 Apr 2025 15:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sTnjfXsD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5A9205510;
	Tue,  1 Apr 2025 15:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743520361; cv=none; b=hG9c/IUZgNRla6Q9rHcGTfj3F0jdKZBQyXNUMsRldYXklb4RHTVCUtKik6EWJX88/6skM1n0RtQpwPK9RUwGYScjWZyNg59VmfoUl3uZuq5Y753dtZga46BRmB2mUMvWRRgoYGey4kzBSb5XuBmRmbH1cBh1Xz+AzFYNhJAnMOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743520361; c=relaxed/simple;
	bh=y9uUCO5LiRtQLj6Fsm+YQo4CsMyHiN/s5Cd299WnI0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sV4OXfXs/G1G1lrzxPldoLlVjy3iD2idPrtVPhR19HUOPJ0A5vYxLZ7Pu2bByGJg7Qd9ENVDt6gZd8FHu3Vosqg2kJkW7SKJ1RxQe0E/2Cneot95MOENLNBsTdv4GkUubMPirIMOfX7IjC0klr99ot/3PIHLdzE+wQabCr869Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sTnjfXsD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D505C4CEE4;
	Tue,  1 Apr 2025 15:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743520360;
	bh=y9uUCO5LiRtQLj6Fsm+YQo4CsMyHiN/s5Cd299WnI0c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sTnjfXsD8tRSR4y8taH3NAbycapO9M7X27x1Ir32al2QBw6f0vZdZiqal16oK25kx
	 ShRflDKODNz1eG4wm0Up/WGasPqeZuUaaBhIp+jTxmky8+/QABwkIa/ewbPf054TKL
	 HYSXQIw1Iug9h154hiU0/cuks+scAGOsmvmCnWH/SttnvWyozyyJQhVe34usJR2ov9
	 dLhf/1SBkNslYjEvU80AWTEwid8Sj8Ar5+inmRUS+rh4lEeP523lXULCDzVQQnwSU2
	 XiM6svLfaitzfCbDsNmq6nax9cwxLO3rojjrZnGBiRkMvkNDqoTFmfD9W323UWZLBk
	 HwFSVLymcpOuQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 01 Apr 2025 17:12:22 +0200
Subject: [PATCH v2 2/2] dma-buf: heaps: Introduce a new heap for reserved
 memory
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-dma-buf-ecc-heap-v2-2-043fd006a1af@kernel.org>
References: <20250401-dma-buf-ecc-heap-v2-0-043fd006a1af@kernel.org>
In-Reply-To: <20250401-dma-buf-ecc-heap-v2-0-043fd006a1af@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10813; i=mripard@kernel.org;
 h=from:subject:message-id; bh=y9uUCO5LiRtQLj6Fsm+YQo4CsMyHiN/s5Cd299WnI0c=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOlvmCJe2G/89GTq7m+tjNovjkjsNtj5wPTWzTdpgZMWp
 jZs38Qb2lHKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJbA1l+B99NUqlX2CqVA0b
 P0/Y0rNiFc0NR3n3/V26TVnoctyD/aUMf7gOux/cM80n/WKX0R2FzJQXTWvOxt2pZ0r5w21VbJu
 hww4A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Some reserved memory regions might have particular memory setup or
attributes that make them good candidates for heaps.

Let's provide a heap type that will create a new heap for each reserved
memory region flagged as such.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/dma-buf/heaps/Kconfig         |   8 +
 drivers/dma-buf/heaps/Makefile        |   1 +
 drivers/dma-buf/heaps/carveout_heap.c | 360 ++++++++++++++++++++++++++++++++++
 3 files changed, 369 insertions(+)

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c422644e8aadaf5aff2bd9a33c49c1ba3..c6981d696733b4d8d0c3f6f5a37d967fd6a1a4a2 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -1,5 +1,13 @@
+config DMABUF_HEAPS_CARVEOUT
+	bool "Carveout Heaps"
+	depends on DMABUF_HEAPS
+	help
+	  Choose this option to enable the carveout dmabuf heap. The carveout
+	  heap is backed by pages from reserved memory regions flagged as
+	  exportable. If in doubt, say Y.
+
 config DMABUF_HEAPS_SYSTEM
 	bool "DMA-BUF System Heap"
 	depends on DMABUF_HEAPS
 	help
 	  Choose this option to enable the system dmabuf heap. The system heap
diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
index 974467791032ffb8a7aba17b1407d9a19b3f3b44..b734647ad5c84f449106748160258e372f153df2 100644
--- a/drivers/dma-buf/heaps/Makefile
+++ b/drivers/dma-buf/heaps/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_DMABUF_HEAPS_CARVEOUT)	+= carveout_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
diff --git a/drivers/dma-buf/heaps/carveout_heap.c b/drivers/dma-buf/heaps/carveout_heap.c
new file mode 100644
index 0000000000000000000000000000000000000000..f7198b781ea57f4f60e554d917c9277e9a716b16
--- /dev/null
+++ b/drivers/dma-buf/heaps/carveout_heap.c
@@ -0,0 +1,360 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
+#include <linux/genalloc.h>
+#include <linux/highmem.h>
+#include <linux/of_reserved_mem.h>
+
+struct carveout_heap_priv {
+	struct dma_heap *heap;
+	struct gen_pool *pool;
+};
+
+struct carveout_heap_buffer_priv {
+	struct mutex lock;
+	struct list_head attachments;
+
+	unsigned long num_pages;
+	struct carveout_heap_priv *heap;
+	dma_addr_t daddr;
+	void *vaddr;
+	unsigned int vmap_cnt;
+};
+
+struct carveout_heap_attachment {
+	struct list_head head;
+	struct sg_table table;
+
+	struct device *dev;
+	bool mapped;
+};
+
+static int carveout_heap_attach(struct dma_buf *buf,
+				struct dma_buf_attachment *attachment)
+{
+	struct carveout_heap_buffer_priv *priv = buf->priv;
+	struct carveout_heap_attachment *a;
+	struct sg_table *sgt;
+	unsigned long len = priv->num_pages * PAGE_SIZE;
+	int ret;
+
+	a = kzalloc(sizeof(*a), GFP_KERNEL);
+	if (!a)
+		return -ENOMEM;
+	INIT_LIST_HEAD(&a->head);
+	a->dev = attachment->dev;
+	attachment->priv = a;
+
+	sgt = &a->table;
+	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
+	if (ret)
+		goto err_cleanup_attach;
+
+	sg_dma_address(sgt->sgl) = priv->daddr;
+	sg_dma_len(sgt->sgl) = len;
+
+	mutex_lock(&priv->lock);
+	list_add(&a->head, &priv->attachments);
+	mutex_unlock(&priv->lock);
+
+	return 0;
+
+err_cleanup_attach:
+	kfree(a);
+	return ret;
+}
+
+static void carveout_heap_detach(struct dma_buf *dmabuf,
+				 struct dma_buf_attachment *attachment)
+{
+	struct carveout_heap_buffer_priv *priv = dmabuf->priv;
+	struct carveout_heap_attachment *a = attachment->priv;
+
+	mutex_lock(&priv->lock);
+	list_del(&a->head);
+	mutex_unlock(&priv->lock);
+
+	sg_free_table(&a->table);
+	kfree(a);
+}
+
+static struct sg_table *
+carveout_heap_map_dma_buf(struct dma_buf_attachment *attachment,
+			  enum dma_data_direction direction)
+{
+	struct carveout_heap_attachment *a = attachment->priv;
+	struct sg_table *table = &a->table;
+	int ret;
+
+	ret = dma_map_sgtable(a->dev, table, direction, 0);
+	if (ret)
+		return ERR_PTR(-ENOMEM);
+
+	a->mapped = true;
+
+	return table;
+}
+
+static void carveout_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
+					struct sg_table *table,
+					enum dma_data_direction direction)
+{
+	struct carveout_heap_attachment *a = attachment->priv;
+
+	a->mapped = false;
+	dma_unmap_sgtable(a->dev, table, direction, 0);
+}
+
+static int
+carveout_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
+				       enum dma_data_direction direction)
+{
+	struct carveout_heap_buffer_priv *priv = dmabuf->priv;
+	struct carveout_heap_attachment *a;
+	unsigned long len = priv->num_pages * PAGE_SIZE;
+
+	mutex_lock(&priv->lock);
+
+	if (priv->vmap_cnt > 0)
+		invalidate_kernel_vmap_range(priv->vaddr, len);
+
+	list_for_each_entry(a, &priv->attachments, head) {
+		if (!a->mapped)
+			continue;
+
+		dma_sync_sgtable_for_cpu(a->dev, &a->table, direction);
+	}
+
+	mutex_unlock(&priv->lock);
+
+	return 0;
+}
+
+static int
+carveout_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
+				     enum dma_data_direction direction)
+{
+	struct carveout_heap_buffer_priv *priv = dmabuf->priv;
+	struct carveout_heap_attachment *a;
+	unsigned long len = priv->num_pages * PAGE_SIZE;
+
+	mutex_lock(&priv->lock);
+
+	if (priv->vmap_cnt > 0)
+		flush_kernel_vmap_range(priv->vaddr, len);
+
+	list_for_each_entry(a, &priv->attachments, head) {
+		if (!a->mapped)
+			continue;
+
+		dma_sync_sgtable_for_device(a->dev, &a->table, direction);
+	}
+
+	mutex_unlock(&priv->lock);
+
+	return 0;
+}
+
+static int carveout_heap_mmap(struct dma_buf *dmabuf,
+			      struct vm_area_struct *vma)
+{
+	struct carveout_heap_buffer_priv *priv = dmabuf->priv;
+	unsigned long len = priv->num_pages * PAGE_SIZE;
+	struct page *page = virt_to_page(priv->vaddr);
+
+	return remap_pfn_range(vma, vma->vm_start, page_to_pfn(page),
+			       len, vma->vm_page_prot);
+}
+
+static int carveout_heap_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
+{
+	struct carveout_heap_buffer_priv *priv = dmabuf->priv;
+
+	mutex_lock(&priv->lock);
+
+	iosys_map_set_vaddr(map, priv->vaddr);
+	priv->vmap_cnt++;
+
+	mutex_unlock(&priv->lock);
+
+	return 0;
+}
+
+static void carveout_heap_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
+{
+	struct carveout_heap_buffer_priv *priv = dmabuf->priv;
+
+	mutex_lock(&priv->lock);
+
+	priv->vmap_cnt--;
+	mutex_unlock(&priv->lock);
+
+	iosys_map_clear(map);
+}
+
+static void carveout_heap_dma_buf_release(struct dma_buf *buf)
+{
+	struct carveout_heap_buffer_priv *buffer_priv = buf->priv;
+	struct carveout_heap_priv *heap_priv = buffer_priv->heap;
+	unsigned long len = buffer_priv->num_pages * PAGE_SIZE;
+
+	gen_pool_free(heap_priv->pool, (unsigned long)buffer_priv->vaddr, len);
+	kfree(buffer_priv);
+}
+
+static const struct dma_buf_ops carveout_heap_buf_ops = {
+	.attach		= carveout_heap_attach,
+	.detach		= carveout_heap_detach,
+	.map_dma_buf	= carveout_heap_map_dma_buf,
+	.unmap_dma_buf	= carveout_heap_unmap_dma_buf,
+	.begin_cpu_access	= carveout_heap_dma_buf_begin_cpu_access,
+	.end_cpu_access	= carveout_heap_dma_buf_end_cpu_access,
+	.mmap		= carveout_heap_mmap,
+	.vmap		= carveout_heap_vmap,
+	.vunmap		= carveout_heap_vunmap,
+	.release	= carveout_heap_dma_buf_release,
+};
+
+static struct dma_buf *carveout_heap_allocate(struct dma_heap *heap,
+					      unsigned long len,
+					      u32 fd_flags,
+					      u64 heap_flags)
+{
+	struct carveout_heap_priv *heap_priv = dma_heap_get_drvdata(heap);
+	struct carveout_heap_buffer_priv *buffer_priv;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	struct dma_buf *buf;
+	dma_addr_t daddr;
+	size_t size = PAGE_ALIGN(len);
+	void *vaddr;
+	int ret;
+
+	buffer_priv = kzalloc(sizeof(*buffer_priv), GFP_KERNEL);
+	if (!buffer_priv)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&buffer_priv->attachments);
+	mutex_init(&buffer_priv->lock);
+
+	vaddr = gen_pool_dma_zalloc(heap_priv->pool, size, &daddr);
+	if (!vaddr) {
+		ret = -ENOMEM;
+		goto err_free_buffer_priv;
+	}
+
+	buffer_priv->vaddr = vaddr;
+	buffer_priv->daddr = daddr;
+	buffer_priv->heap = heap_priv;
+	buffer_priv->num_pages = size >> PAGE_SHIFT;
+
+	/* create the dmabuf */
+	exp_info.exp_name = dma_heap_get_name(heap);
+	exp_info.ops = &carveout_heap_buf_ops;
+	exp_info.size = size;
+	exp_info.flags = fd_flags;
+	exp_info.priv = buffer_priv;
+
+	buf = dma_buf_export(&exp_info);
+	if (IS_ERR(buf)) {
+		ret = PTR_ERR(buf);
+		goto err_free_buffer;
+	}
+
+	return buf;
+
+err_free_buffer:
+	gen_pool_free(heap_priv->pool, (unsigned long)vaddr, len);
+err_free_buffer_priv:
+	kfree(buffer_priv);
+
+	return ERR_PTR(ret);
+}
+
+static const struct dma_heap_ops carveout_heap_ops = {
+	.allocate = carveout_heap_allocate,
+};
+
+static int __init carveout_heap_setup(struct device_node *node)
+{
+	struct dma_heap_export_info exp_info = {};
+	const struct reserved_mem *rmem;
+	struct carveout_heap_priv *priv;
+	struct dma_heap *heap;
+	struct gen_pool *pool;
+	void *base;
+	int ret;
+
+	rmem = of_reserved_mem_lookup(node);
+	if (!rmem)
+		return -EINVAL;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	pool = gen_pool_create(PAGE_SHIFT, NUMA_NO_NODE);
+	if (!pool) {
+		ret = -ENOMEM;
+		goto err_cleanup_heap;
+	}
+	priv->pool = pool;
+
+	base = memremap(rmem->base, rmem->size, MEMREMAP_WB);
+	if (!base) {
+		ret = -ENOMEM;
+		goto err_release_mem_region;
+	}
+
+	ret = gen_pool_add_virt(pool, (unsigned long)base, rmem->base,
+				rmem->size, NUMA_NO_NODE);
+	if (ret)
+		goto err_unmap;
+
+	exp_info.name = node->full_name;
+	exp_info.ops = &carveout_heap_ops;
+	exp_info.priv = priv;
+
+	heap = dma_heap_add(&exp_info);
+	if (IS_ERR(heap)) {
+		ret = PTR_ERR(heap);
+		goto err_cleanup_pool_region;
+	}
+	priv->heap = heap;
+
+	return 0;
+
+err_cleanup_pool_region:
+	gen_pool_free(pool, (unsigned long)base, rmem->size);
+err_unmap:
+	memunmap(base);
+err_release_mem_region:
+	gen_pool_destroy(pool);
+err_cleanup_heap:
+	kfree(priv);
+	return ret;
+}
+
+static int __init carveout_heap_init(void)
+{
+	struct device_node *rmem_node;
+	struct device_node *node;
+	int ret;
+
+	rmem_node = of_find_node_by_path("/reserved-memory");
+	if (!rmem_node)
+		return 0;
+
+	for_each_child_of_node(rmem_node, node) {
+		if (!of_property_read_bool(node, "export"))
+			continue;
+
+		ret = carveout_heap_setup(node);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+module_init(carveout_heap_init);

-- 
2.49.0


