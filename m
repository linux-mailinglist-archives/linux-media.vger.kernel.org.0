Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89F052FF28F
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 18:56:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388980AbhAUR4R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 12:56:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389314AbhAURz6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 12:55:58 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 022D7C061786;
        Thu, 21 Jan 2021 09:55:18 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id y8so1697595plp.8;
        Thu, 21 Jan 2021 09:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sqZNw/T1J/E/9UGmlJLcTnXPapVNbINXggtl16AjclU=;
        b=LG0m86z96LUYGjLIwKd/UyY7/GUZ/3y4H0LtpJxW9mQZlFdbnuRSbo7S1Ilt1ddUCw
         GOuPXwsY1WLTSl4zTJVUHwMj3pgPCC6yXz38CIs4BPxbT7NffbRvdiPm8YvRUJooR85d
         9tRq4P6zTa56bZ9rMwnpUJwpRw1PR7xkzu1eEH5+8/iBXvpEEgIOu8psNbjG+KIuwiT1
         WEdZIKqNLXlmkRdSPb0qfXNeWibM+iM1cf/yC6z4Un4SyaB4pbKHxRx2qWuohe4qqKU2
         P16WHvRxPCeqLQ3bwT/n49QX0ESg2Ghs+kiGVWw7M6RJTjj1dThOrwxsvIvjvpnA/kIQ
         Bgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=sqZNw/T1J/E/9UGmlJLcTnXPapVNbINXggtl16AjclU=;
        b=cYHw8wyuWhbXfPrcpFI3HEQb2LRTaKVAyNF6idea/8vqOLSiJ9AWBO6TscX2qf1L74
         0TAmv4YSG2J0CJMAYLHBH91lVWDe3Jz57a3imwxlfX8sxfRX8ouddVlSv4cIhs0vLMz9
         HqUVBVCzD5tK+SXB1S0CoDTOsO8/pqQZan1OqtwoZhIf2biaC/Mlo9L3J23rCOTUHa2Q
         hEvZq4+OmarHBfIrIxy3Cc+/T3mMRmrdn/nEP4fGvBEvl/OIW1X0Zyi3id9xDBx2AQic
         h7TrP/RNcqvEgyq+wMIoFkemAVsBtT2qh9uNmA65mIGR/wDdDG9nsVzl2JlcXtzeD/aP
         vM4g==
X-Gm-Message-State: AOAM532BUSgu9k8i41FEBNA+ZoaMFDAdSJ9G+KqnOvEO5CC7vo+TsO0D
        uMcCa5GC/TP+oCneNA2XEXs=
X-Google-Smtp-Source: ABdhPJwcvbV7XJT44syWS5zibxqABA1MBF0Lh0RXbsqV2BWzbyFvIg56cOzQqhIvYUwdVeRTy/K02g==
X-Received: by 2002:a17:90a:fc6:: with SMTP id 64mr576038pjz.79.1611251717456;
        Thu, 21 Jan 2021 09:55:17 -0800 (PST)
Received: from bbox-1.mtv.corp.google.com ([2620:15c:211:201:74d0:bb24:e25e:dc4d])
        by smtp.gmail.com with ESMTPSA id t2sm6897317pju.19.2021.01.21.09.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 09:55:16 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
From:   Minchan Kim <minchan@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mm <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>,
        hyesoo.yu@samsung.com, david@redhat.com, mhocko@suse.com,
        surenb@google.com, pullip.cho@samsung.com, joaodias@google.com,
        hridya@google.com, john.stultz@linaro.org, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        hch@infradead.org, robh+dt@kernel.org,
        linaro-mm-sig@lists.linaro.org, Minchan Kim <minchan@kernel.org>
Subject: [PATCH v4 4/4] dma-buf: heaps: add chunk heap to dmabuf heaps
Date:   Thu, 21 Jan 2021 09:55:02 -0800
Message-Id: <20210121175502.274391-5-minchan@kernel.org>
X-Mailer: git-send-email 2.30.0.296.g2bfb1c46d8-goog
In-Reply-To: <20210121175502.274391-1-minchan@kernel.org>
References: <20210121175502.274391-1-minchan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hyesoo Yu <hyesoo.yu@samsung.com>

This patch supports chunk heap that allocates the buffers that
arranged into a list a fixed size chunks taken from CMA.

The chunk heap driver is bound directly to a reserved_memory
node by following Rob Herring's suggestion in [1].

[1] https://lore.kernel.org/lkml/20191025225009.50305-2-john.stultz@linaro.org/T/#m3dc63acd33fea269a584f43bb799a876f0b2b45d

Reviewed-by: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
Signed-off-by: Hridya Valsaraju <hridya@google.com>
Signed-off-by: Minchan Kim <minchan@kernel.org>
---
 drivers/dma-buf/heaps/Kconfig      |   8 +
 drivers/dma-buf/heaps/Makefile     |   1 +
 drivers/dma-buf/heaps/chunk_heap.c | 492 +++++++++++++++++++++++++++++
 3 files changed, 501 insertions(+)
 create mode 100644 drivers/dma-buf/heaps/chunk_heap.c

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c4226..e9595e26f831 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -12,3 +12,11 @@ config DMABUF_HEAPS_CMA
 	  Choose this option to enable dma-buf CMA heap. This heap is backed
 	  by the Contiguous Memory Allocator (CMA). If your system has these
 	  regions, you should say Y here.
+
+config DMABUF_HEAPS_CHUNK
+	bool "DMA-BUF CHUNK Heap"
+	depends on DMABUF_HEAPS && DMA_CMA
+	help
+	  Choose this option to enable dma-buf CHUNK heap. This heap is backed
+	  by the Contiguous Memory Allocator (CMA) and allocates the buffers that
+	  are arranged into a list of fixed size chunks taken from CMA.
diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
index 974467791032..8faa6cfdc0c5 100644
--- a/drivers/dma-buf/heaps/Makefile
+++ b/drivers/dma-buf/heaps/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
+obj-$(CONFIG_DMABUF_HEAPS_CHUNK)	+= chunk_heap.o
diff --git a/drivers/dma-buf/heaps/chunk_heap.c b/drivers/dma-buf/heaps/chunk_heap.c
new file mode 100644
index 000000000000..15df42acee4b
--- /dev/null
+++ b/drivers/dma-buf/heaps/chunk_heap.c
@@ -0,0 +1,492 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DMA-BUF chunk heap exporter
+ *
+ * Copyright (c) 2020 Samsung Electronics Co., Ltd.
+ * Author: <hyesoo.yu@samsung.com> for Samsung Electronics.
+ */
+
+#include <linux/cma.h>
+#include <linux/device.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
+#include <linux/dma-mapping.h>
+#include <linux/dma-map-ops.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/highmem.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/scatterlist.h>
+#include <linux/sched/signal.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+
+struct chunk_heap {
+	struct dma_heap *heap;
+	uint32_t order;
+	struct cma *cma;
+};
+
+struct chunk_heap_buffer {
+	struct chunk_heap *heap;
+	struct list_head attachments;
+	struct mutex lock;
+	struct sg_table sg_table;
+	unsigned long len;
+	int vmap_cnt;
+	void *vaddr;
+};
+
+struct chunk_heap_attachment {
+	struct device *dev;
+	struct sg_table *table;
+	struct list_head list;
+	bool mapped;
+};
+
+struct chunk_heap chunk_heaps[MAX_CMA_AREAS];
+unsigned int chunk_heap_count;
+
+static struct sg_table *dup_sg_table(struct sg_table *table)
+{
+	struct sg_table *new_table;
+	int ret, i;
+	struct scatterlist *sg, *new_sg;
+
+	new_table = kzalloc(sizeof(*new_table), GFP_KERNEL);
+	if (!new_table)
+		return ERR_PTR(-ENOMEM);
+
+	ret = sg_alloc_table(new_table, table->orig_nents, GFP_KERNEL);
+	if (ret) {
+		kfree(new_table);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	new_sg = new_table->sgl;
+	for_each_sgtable_sg(table, sg, i) {
+		sg_set_page(new_sg, sg_page(sg), sg->length, sg->offset);
+		new_sg = sg_next(new_sg);
+	}
+
+	return new_table;
+}
+
+static int chunk_heap_attach(struct dma_buf *dmabuf, struct dma_buf_attachment *attachment)
+{
+	struct chunk_heap_buffer *buffer = dmabuf->priv;
+	struct chunk_heap_attachment *a;
+	struct sg_table *table;
+
+	a = kzalloc(sizeof(*a), GFP_KERNEL);
+	if (!a)
+		return -ENOMEM;
+
+	table = dup_sg_table(&buffer->sg_table);
+	if (IS_ERR(table)) {
+		kfree(a);
+		return -ENOMEM;
+	}
+
+	a->table = table;
+	a->dev = attachment->dev;
+
+	attachment->priv = a;
+
+	mutex_lock(&buffer->lock);
+	list_add(&a->list, &buffer->attachments);
+	mutex_unlock(&buffer->lock);
+
+	return 0;
+}
+
+static void chunk_heap_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attachment)
+{
+	struct chunk_heap_buffer *buffer = dmabuf->priv;
+	struct chunk_heap_attachment *a = attachment->priv;
+
+	mutex_lock(&buffer->lock);
+	list_del(&a->list);
+	mutex_unlock(&buffer->lock);
+
+	sg_free_table(a->table);
+	kfree(a->table);
+	kfree(a);
+}
+
+static struct sg_table *chunk_heap_map_dma_buf(struct dma_buf_attachment *attachment,
+					       enum dma_data_direction direction)
+{
+	struct chunk_heap_attachment *a = attachment->priv;
+	struct sg_table *table = a->table;
+	int ret;
+
+	if (a->mapped)
+		return table;
+
+	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
+	if (ret)
+		return ERR_PTR(ret);
+
+	a->mapped = true;
+	return table;
+}
+
+static void chunk_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
+				     struct sg_table *table,
+				     enum dma_data_direction direction)
+{
+	struct chunk_heap_attachment *a = attachment->priv;
+
+	a->mapped = false;
+	dma_unmap_sgtable(attachment->dev, table, direction, 0);
+}
+
+static int chunk_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
+						enum dma_data_direction direction)
+{
+	struct chunk_heap_buffer *buffer = dmabuf->priv;
+	struct chunk_heap_attachment *a;
+
+	mutex_lock(&buffer->lock);
+
+	if (buffer->vmap_cnt)
+		invalidate_kernel_vmap_range(buffer->vaddr, buffer->len);
+
+	list_for_each_entry(a, &buffer->attachments, list) {
+		if (!a->mapped)
+			continue;
+		dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
+	}
+	mutex_unlock(&buffer->lock);
+
+	return 0;
+}
+
+static int chunk_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
+					      enum dma_data_direction direction)
+{
+	struct chunk_heap_buffer *buffer = dmabuf->priv;
+	struct chunk_heap_attachment *a;
+
+	mutex_lock(&buffer->lock);
+
+	if (buffer->vmap_cnt)
+		flush_kernel_vmap_range(buffer->vaddr, buffer->len);
+
+	list_for_each_entry(a, &buffer->attachments, list) {
+		if (!a->mapped)
+			continue;
+		dma_sync_sgtable_for_device(a->dev, a->table, direction);
+	}
+	mutex_unlock(&buffer->lock);
+
+	return 0;
+}
+
+static int chunk_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
+{
+	struct chunk_heap_buffer *buffer = dmabuf->priv;
+	struct sg_table *table = &buffer->sg_table;
+	unsigned long addr = vma->vm_start;
+	struct sg_page_iter piter;
+	int ret;
+
+	for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
+		struct page *page = sg_page_iter_page(&piter);
+
+		ret = remap_pfn_range(vma, addr, page_to_pfn(page), PAGE_SIZE,
+				      vma->vm_page_prot);
+		if (ret)
+			return ret;
+		addr += PAGE_SIZE;
+		if (addr >= vma->vm_end)
+			return 0;
+	}
+	return 0;
+}
+
+static void *chunk_heap_do_vmap(struct chunk_heap_buffer *buffer)
+{
+	struct sg_table *table = &buffer->sg_table;
+	int npages = PAGE_ALIGN(buffer->len) / PAGE_SIZE;
+	struct page **pages = vmalloc(sizeof(struct page *) * npages);
+	struct page **tmp = pages;
+	struct sg_page_iter piter;
+	void *vaddr;
+
+	if (!pages)
+		return ERR_PTR(-ENOMEM);
+
+	for_each_sgtable_page(table, &piter, 0) {
+		WARN_ON(tmp - pages >= npages);
+		*tmp++ = sg_page_iter_page(&piter);
+	}
+
+	vaddr = vmap(pages, npages, VM_MAP, PAGE_KERNEL);
+	vfree(pages);
+
+	if (!vaddr)
+		return ERR_PTR(-ENOMEM);
+
+	return vaddr;
+}
+
+static int chunk_heap_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
+{
+	struct chunk_heap_buffer *buffer = dmabuf->priv;
+	void *vaddr;
+
+	mutex_lock(&buffer->lock);
+	if (buffer->vmap_cnt) {
+		vaddr = buffer->vaddr;
+	} else {
+		vaddr = chunk_heap_do_vmap(buffer);
+		if (IS_ERR(vaddr)) {
+			mutex_unlock(&buffer->lock);
+
+			return PTR_ERR(vaddr);
+		}
+		buffer->vaddr = vaddr;
+	}
+	buffer->vmap_cnt++;
+	dma_buf_map_set_vaddr(map, vaddr);
+
+	mutex_unlock(&buffer->lock);
+
+	return 0;
+}
+
+static void chunk_heap_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
+{
+	struct chunk_heap_buffer *buffer = dmabuf->priv;
+
+	mutex_lock(&buffer->lock);
+	if (!--buffer->vmap_cnt) {
+		vunmap(buffer->vaddr);
+		buffer->vaddr = NULL;
+	}
+	mutex_unlock(&buffer->lock);
+}
+
+static void chunk_heap_dma_buf_release(struct dma_buf *dmabuf)
+{
+	struct chunk_heap_buffer *buffer = dmabuf->priv;
+	struct chunk_heap *chunk_heap = buffer->heap;
+	struct sg_table *table;
+	struct scatterlist *sg;
+	int i;
+
+	table = &buffer->sg_table;
+	for_each_sgtable_sg(table, sg, i)
+		cma_release(chunk_heap->cma, sg_page(sg), 1 << chunk_heap->order);
+	sg_free_table(table);
+	kfree(buffer);
+}
+
+static const struct dma_buf_ops chunk_heap_buf_ops = {
+	.attach = chunk_heap_attach,
+	.detach = chunk_heap_detach,
+	.map_dma_buf = chunk_heap_map_dma_buf,
+	.unmap_dma_buf = chunk_heap_unmap_dma_buf,
+	.begin_cpu_access = chunk_heap_dma_buf_begin_cpu_access,
+	.end_cpu_access = chunk_heap_dma_buf_end_cpu_access,
+	.mmap = chunk_heap_mmap,
+	.vmap = chunk_heap_vmap,
+	.vunmap = chunk_heap_vunmap,
+	.release = chunk_heap_dma_buf_release,
+};
+
+static int chunk_heap_allocate(struct dma_heap *heap, unsigned long len,
+			       unsigned long fd_flags, unsigned long heap_flags)
+{
+	struct chunk_heap *chunk_heap = dma_heap_get_drvdata(heap);
+	struct chunk_heap_buffer *buffer;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	struct dma_buf *dmabuf;
+	struct sg_table *table;
+	struct scatterlist *sg;
+	struct page **pages;
+	unsigned int chunk_size = PAGE_SIZE << chunk_heap->order;
+	unsigned int count, alloced = 0;
+	unsigned int alloc_order = max_t(unsigned int, pageblock_order, chunk_heap->order);
+	unsigned int nr_chunks_per_alloc = 1 << (alloc_order - chunk_heap->order);
+	gfp_t gfp_flags = GFP_KERNEL|__GFP_NORETRY;
+	int ret = -ENOMEM;
+	pgoff_t pg;
+
+	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
+	if (!buffer)
+		return ret;
+
+	INIT_LIST_HEAD(&buffer->attachments);
+	mutex_init(&buffer->lock);
+	buffer->heap = chunk_heap;
+	buffer->len = ALIGN(len, chunk_size);
+	count = buffer->len / chunk_size;
+
+	pages = kvmalloc_array(count, sizeof(*pages), GFP_KERNEL);
+	if (!pages)
+		goto err_pages;
+
+	while (alloced < count) {
+		struct page *page;
+		int i;
+
+		while (count - alloced < nr_chunks_per_alloc) {
+			alloc_order--;
+			nr_chunks_per_alloc >>= 1;
+		}
+
+		page = cma_alloc(chunk_heap->cma, 1 << alloc_order,
+					alloc_order, gfp_flags);
+		if (!page) {
+			if (gfp_flags & __GFP_NORETRY) {
+				gfp_flags &= ~__GFP_NORETRY;
+				continue;
+			}
+			break;
+		}
+
+		for (i = 0; i < nr_chunks_per_alloc; i++, alloced++) {
+			pages[alloced] = page;
+			page += 1 << chunk_heap->order;
+		}
+	}
+
+	if (alloced < count)
+		goto err_alloc;
+
+	table = &buffer->sg_table;
+	if (sg_alloc_table(table, count, GFP_KERNEL))
+		goto err_alloc;
+
+	sg = table->sgl;
+	for (pg = 0; pg < count; pg++) {
+		sg_set_page(sg, pages[pg], chunk_size, 0);
+		sg = sg_next(sg);
+	}
+
+	exp_info.ops = &chunk_heap_buf_ops;
+	exp_info.size = buffer->len;
+	exp_info.flags = fd_flags;
+	exp_info.priv = buffer;
+	dmabuf = dma_buf_export(&exp_info);
+	if (IS_ERR(dmabuf)) {
+		ret = PTR_ERR(dmabuf);
+		goto err_export;
+	}
+	kvfree(pages);
+
+	ret = dma_buf_fd(dmabuf, fd_flags);
+	if (ret < 0) {
+		dma_buf_put(dmabuf);
+		return ret;
+	}
+
+	return 0;
+err_export:
+	sg_free_table(table);
+err_alloc:
+	for (pg = 0; pg < alloced; pg++)
+		cma_release(chunk_heap->cma, pages[pg], 1 << chunk_heap->order);
+	kvfree(pages);
+err_pages:
+	kfree(buffer);
+
+	return ret;
+}
+
+static const struct dma_heap_ops chunk_heap_ops = {
+	.allocate = chunk_heap_allocate,
+};
+
+#define CHUNK_PREFIX "chunk-"
+
+static int register_chunk_heap(struct chunk_heap *chunk_heap_info)
+{
+	struct dma_heap_export_info exp_info;
+	const char *name = cma_get_name(chunk_heap_info->cma);
+	size_t len = strlen(CHUNK_PREFIX) + strlen(name) + 1;
+	char *buf = kmalloc(len, GFP_KERNEL);
+
+	if (!buf)
+		return -ENOMEM;
+
+	sprintf(buf, CHUNK_PREFIX"%s", cma_get_name(chunk_heap_info->cma));
+	buf[len] = '\0';
+
+	exp_info.name = buf;
+	exp_info.name = cma_get_name(chunk_heap_info->cma);
+	exp_info.ops = &chunk_heap_ops;
+	exp_info.priv = chunk_heap_info;
+
+	chunk_heap_info->heap = dma_heap_add(&exp_info);
+	if (IS_ERR(chunk_heap_info->heap)) {
+		kfree(buf);
+		return PTR_ERR(chunk_heap_info->heap);
+	}
+
+	return 0;
+}
+
+static int __init chunk_heap_init(void)
+{
+	unsigned int i;
+
+	for (i = 0; i < chunk_heap_count; i++)
+		register_chunk_heap(&chunk_heaps[i]);
+
+	return 0;
+}
+module_init(chunk_heap_init);
+
+#ifdef CONFIG_OF_EARLY_FLATTREE
+
+static int __init dmabuf_chunk_heap_area_init(struct reserved_mem *rmem)
+{
+	int ret;
+	struct cma *cma;
+	struct chunk_heap *chunk_heap_info;
+	const __be32 *chunk_order;
+
+	phys_addr_t align = PAGE_SIZE << max(MAX_ORDER - 1, pageblock_order);
+	phys_addr_t mask = align - 1;
+
+	if ((rmem->base & mask) || (rmem->size & mask)) {
+		pr_err("Incorrect alignment for CMA region\n");
+		return -EINVAL;
+	}
+
+	ret = cma_init_reserved_mem(rmem->base, rmem->size, 0, rmem->name, &cma);
+	if (ret) {
+		pr_err("Reserved memory: unable to setup CMA region\n");
+		return ret;
+	}
+
+	/* Architecture specific contiguous memory fixup. */
+	dma_contiguous_early_fixup(rmem->base, rmem->size);
+
+	chunk_heap_info = &chunk_heaps[chunk_heap_count];
+	chunk_heap_info->cma = cma;
+
+	chunk_order = of_get_flat_dt_prop(rmem->fdt_node, "chunk-order", NULL);
+
+	if (chunk_order)
+		chunk_heap_info->order = be32_to_cpu(*chunk_order);
+	else
+		chunk_heap_info->order = 4;
+
+	chunk_heap_count++;
+
+	return 0;
+}
+RESERVEDMEM_OF_DECLARE(dmabuf_chunk_heap, "dma_heap,chunk",
+		       dmabuf_chunk_heap_area_init);
+#endif
+
+MODULE_DESCRIPTION("DMA-BUF Chunk Heap");
+MODULE_LICENSE("GPL v2");
-- 
2.30.0.296.g2bfb1c46d8-goog

