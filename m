Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF4FC2CAA38
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 18:53:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404158AbgLARwk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 12:52:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391855AbgLARwj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 12:52:39 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0FBDC0617A7;
        Tue,  1 Dec 2020 09:51:59 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id o9so1554553pfd.10;
        Tue, 01 Dec 2020 09:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bYRnT6meiNHkxAgZPYwSbGdDS48Uvqnd+UI5WVDlRIo=;
        b=hWBXtKPmFreatgchOXPxb8I6zutB24f/ziw4eDAqHjbN0a+hiWJJdxgAW8NqnrnLqq
         v6SqcIafXQGiqd+NS6JkhDZpWGBKMWc3lIBk325OH7p2yTUp+WWhk33Qgm0mQu506ZRz
         434w2TTh093Y8mrW5fU27QDbN+Lcnngtij2H4KzLha+GOb+UswF9kZWy6Q41R5CUx/xf
         IiiQrdJbJBRnN3cAtj6bw9NqEnAL/ZKleL4c3Rzj1n/st3/kuAyjoO1yBBe4au0ZR4Zv
         pG4x0X9zOBCn58x3W675dSYXFLfhrceoFFDqJutASvmStsm36yHFw2eeSZAv7iIOtiL7
         IfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=bYRnT6meiNHkxAgZPYwSbGdDS48Uvqnd+UI5WVDlRIo=;
        b=EP+tyzZf5OHCsLIvw6RqG9TGYLf7GecAzdCIvfWIRXkXbjCJEwHHVQppdDWV6ogl6r
         3HJTMe8pPuFsElojqwIMI94SBGtdz6e3mI0rIN0yeeUwYIUruFdYVtQsfYzPY9JPyoaO
         Yj+1PUDk22YeSolaM4bqBqSiNlraIzO7XkdP5roJ0hHZiuUwRV1aQn5S/Wowr/sE+cPt
         Ptd3eVyEiYxdmCbQvQk+cZodT+fIhttQ1BWwCZDEvY50zaeAoBQKTEMhZRngm0CltGpa
         DEX1jbutfk1cEH1KDPXan2yJFLIYcyNMz4z5yARiT9J5xTzfcyzFE3HxTBykbBQwECSh
         fUSg==
X-Gm-Message-State: AOAM533iDY/Jgo8qa16UDd76f4YmfabtjzlG9FAdIDDfllGqtJiYNFi5
        5+mA+GeT0g1JsBD7a594f7w=
X-Google-Smtp-Source: ABdhPJxPMBUU5/Z5mNi1wm+3qVG2Z14gAaQt2uPUeLlEWWh2TAsg5KL2eW8/0LCEd/AJCDUVDQXCfg==
X-Received: by 2002:aa7:8595:0:b029:198:159e:52d4 with SMTP id w21-20020aa785950000b0290198159e52d4mr3509713pfn.7.1606845119118;
        Tue, 01 Dec 2020 09:51:59 -0800 (PST)
Received: from bbox-1.mtv.corp.google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id q23sm390082pfg.192.2020.12.01.09.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 09:51:58 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
From:   Minchan Kim <minchan@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        hyesoo.yu@samsung.com, willy@infradead.org, david@redhat.com,
        iamjoonsoo.kim@lge.com, vbabka@suse.cz, surenb@google.com,
        pullip.cho@samsung.com, joaodias@google.com, hridya@google.com,
        sumit.semwal@linaro.org, john.stultz@linaro.org,
        Brian.Starkey@arm.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
        Minchan Kim <minchan@kernel.org>
Subject: [PATCH v2 4/4] dma-buf: heaps: add chunk heap to dmabuf heaps
Date:   Tue,  1 Dec 2020 09:51:44 -0800
Message-Id: <20201201175144.3996569-5-minchan@kernel.org>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
In-Reply-To: <20201201175144.3996569-1-minchan@kernel.org>
References: <20201201175144.3996569-1-minchan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hyesoo Yu <hyesoo.yu@samsung.com>

This patch supports chunk heap that allocates the buffers that
arranged into a list a fixed size chunks taken from CMA.

The chunk heap doesn't use heap-helper although it can remove
duplicated code since heap-helper is under deprecated process.[1]

NOTE: This patch only adds the default CMA heap to allocate chunk
pages. We will add another CMA memory regions to the dmabuf heaps
interface with a later patch (which requires a dt binding)

[1] https://lore.kernel.org/patchwork/patch/1336002

Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
Signed-off-by: Minchan Kim <minchan@kernel.org>
---
 drivers/dma-buf/heaps/Kconfig      |  15 +
 drivers/dma-buf/heaps/Makefile     |   1 +
 drivers/dma-buf/heaps/chunk_heap.c | 429 +++++++++++++++++++++++++++++
 3 files changed, 445 insertions(+)
 create mode 100644 drivers/dma-buf/heaps/chunk_heap.c

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c4226..9153f83afed7 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -12,3 +12,18 @@ config DMABUF_HEAPS_CMA
 	  Choose this option to enable dma-buf CMA heap. This heap is backed
 	  by the Contiguous Memory Allocator (CMA). If your system has these
 	  regions, you should say Y here.
+
+config DMABUF_HEAPS_CHUNK
+	tristate "DMA-BUF CHUNK Heap"
+	depends on DMABUF_HEAPS && DMA_CMA
+	help
+	  Choose this option to enable dma-buf CHUNK heap. This heap is backed
+	  by the Contiguous Memory Allocator (CMA) and allocates the buffers that
+	  arranged into a list of fixed size chunks taken from CMA.
+
+config DMABUF_HEAPS_CHUNK_ORDER
+	int "Chunk page order for dmabuf chunk heap"
+	default 4
+	depends on DMABUF_HEAPS_CHUNK
+	help
+	  Set page order of fixed chunk size to allocate from CMA.
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
index 000000000000..0277707a93a9
--- /dev/null
+++ b/drivers/dma-buf/heaps/chunk_heap.c
@@ -0,0 +1,429 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ION Memory Allocator chunk heap exporter
+ *
+ * Copyright (c) 2020 Samsung Electronics Co., Ltd.
+ * Author: <hyesoo.yu@samsung.com> for Samsung Electronics.
+ */
+
+#include <linux/platform_device.h>
+#include <linux/cma.h>
+#include <linux/device.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
+#include <linux/dma-map-ops.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/highmem.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/scatterlist.h>
+#include <linux/sched/signal.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/of.h>
+
+struct chunk_heap {
+	struct dma_heap *heap;
+	unsigned int order;
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
+	INIT_LIST_HEAD(&a->list);
+	a->mapped = false;
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
+	int ret = 0;
+	void *vaddr;
+
+	mutex_lock(&buffer->lock);
+	if (buffer->vmap_cnt) {
+		vaddr = buffer->vaddr;
+		goto done;
+	}
+
+	vaddr = chunk_heap_do_vmap(buffer);
+	if (IS_ERR(vaddr)) {
+		ret = PTR_ERR(vaddr);
+		goto err;
+	}
+
+	buffer->vaddr = vaddr;
+done:
+	buffer->vmap_cnt++;
+	dma_buf_map_set_vaddr(map, vaddr);
+err:
+	mutex_unlock(&buffer->lock);
+
+	return ret;
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
+	unsigned int num_retry = 5;
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
+	while (num_retry--) {
+		unsigned long nr_pages;
+
+		ret = cma_alloc_bulk(chunk_heap->cma, chunk_heap->order,
+				     num_retry ? true : false,
+				     chunk_heap->order, count - alloced,
+				     pages + alloced, &nr_pages);
+		alloced += nr_pages;
+		if (alloced == count)
+			break;
+		if (ret != -EBUSY)
+			break;
+
+	}
+	if (ret < 0)
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
+#ifdef CONFIG_DMABUF_HEAPS_CHUNK_ORDER
+#define CHUNK_HEAP_ORDER (CONFIG_DMABUF_HEAPS_CHUNK_ORDER)
+#else
+#define CHUNK_HEAP_ORDER (0)
+#endif
+
+static int __init chunk_heap_init(void)
+{
+	struct cma *default_cma = dev_get_cma_area(NULL);
+	struct dma_heap_export_info exp_info;
+	struct chunk_heap *chunk_heap;
+
+	if (!default_cma)
+		return 0;
+
+	chunk_heap = kzalloc(sizeof(*chunk_heap), GFP_KERNEL);
+	if (!chunk_heap)
+		return -ENOMEM;
+
+	chunk_heap->order = CHUNK_HEAP_ORDER;
+	chunk_heap->cma = default_cma;
+
+	exp_info.name = cma_get_name(default_cma);
+	exp_info.ops = &chunk_heap_ops;
+	exp_info.priv = chunk_heap;
+
+	chunk_heap->heap = dma_heap_add(&exp_info);
+	if (IS_ERR(chunk_heap->heap)) {
+		int ret = PTR_ERR(chunk_heap->heap);
+
+		kfree(chunk_heap);
+		return ret;
+	}
+
+	return 0;
+}
+module_init(chunk_heap_init);
+MODULE_DESCRIPTION("DMA-BUF Chunk Heap");
+MODULE_LICENSE("GPL v2");
-- 
2.29.2.454.gaff20da3a2-goog

