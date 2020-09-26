Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28CEA2796BA
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 06:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730028AbgIZEZD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 00:25:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730001AbgIZEZB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 00:25:01 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12703C0613CE
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 21:25:01 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id jw11so491660pjb.0
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 21:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q/YHFkJjnrzpougboI5H9Mm3RBmSahSsWVWvUb6SAeY=;
        b=pYshy51K50oZf9Caenwo7Vuah8DqJtbjU74d8OWrnajJ3wXbRD1+qQHDhBmzF5Qx0T
         0/iMUp5K7BYEV91ZGP3/iMCUyZoSahF377/2Nz+Z8xEwcPQdnKHkRmSmyCHxwoLjxgGA
         izkCHUHyzWUVeYuWKue9lojLJzZPeH7tAcNjuW7jXRpS5CAJ3GoaD7ip5+p8/z/qodl1
         QObOiQGpmp9x2dSHZv8QZv90j1qWpfNlKfGfUCyGxBg1XMMtSvCQA9Jz6WXghLzBbvFv
         9TUiXBFMnHxg8lklqJLcRLvXYySPlXDS5zNlERERZghAklqgyW148Ax8dBYBsVssF82E
         LoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q/YHFkJjnrzpougboI5H9Mm3RBmSahSsWVWvUb6SAeY=;
        b=CGK/2KkQoL2PWrSQVqqZMj8R5Ai2X8eXeU8g/jcmXtnnV0jg4lfxhs8bLT76DOFsuu
         YqG69WRddbVJvIBmFgoUTyqJOxo2i6HsxmEO5aKV1ldZRhMyuP65DWEsaauZJllxQFFs
         r8tgxETBPLPLKhq0DXsbsU5xEZkpiJwwrJL6IUkwgth7dvuHbjKyZXUlqp1TPqrj22kh
         1GN4DhnMMmaiBxRp0edKIRgPqzoevGcgbBigcSDhtBpwMesHnVAGi2Z6a6EUQnwQX4G2
         PNMKF4DnW8QhOeMTCTtXWgOprJPFMn3Wf434ernXuNTnQJ3MP5A9K58DmzWTdzM6/brv
         3NtQ==
X-Gm-Message-State: AOAM531RaH1TiCLD2++Wj2wtOCxIPl4dnW/4vIBTH+2HtUOUT0UQ59bL
        OjLExFP9A9psymuIsZ3UWJbI5w==
X-Google-Smtp-Source: ABdhPJyezNoUAo89S8cL5s0K0ZQlVU56nzJuFtG9yIunTjup+PAhqX2pDoDhIGA3V6oo0lGSUEQdyg==
X-Received: by 2002:a17:90a:3984:: with SMTP id z4mr659973pjb.131.1601094300525;
        Fri, 25 Sep 2020 21:25:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id a5sm3585886pgk.13.2020.09.25.21.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 21:24:59 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [RFC][PATCH 2/6] dma-buf: heaps: Move heap-helper logic into the cma_heap implementation
Date:   Sat, 26 Sep 2020 04:24:49 +0000
Message-Id: <20200926042453.67517-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200926042453.67517-1-john.stultz@linaro.org>
References: <20200926042453.67517-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since the heap-helpers logic ended up not being as generic as
hoped, move the heap-helpers dma_buf_ops implementations into
the cma_heap directly.

This will allow us to remove the heap_helpers code in a following
patch.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/dma-buf/heaps/cma_heap.c | 322 ++++++++++++++++++++++++++-----
 1 file changed, 270 insertions(+), 52 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 626cf7fd033a..3adfdbed0829 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -2,76 +2,291 @@
 /*
  * DMABUF CMA heap exporter
  *
- * Copyright (C) 2012, 2019 Linaro Ltd.
+ * Copyright (C) 2012, 2019, 2020 Linaro Ltd.
  * Author: <benjamin.gaignard@linaro.org> for ST-Ericsson.
+ *
+ * Also utilizing parts of Andrew Davis' SRAM heap:
+ * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ *	Andrew F. Davis <afd@ti.com>
  */
-
 #include <linux/cma.h>
-#include <linux/device.h>
 #include <linux/dma-buf.h>
-#include <linux/dma-heap.h>
 #include <linux/dma-contiguous.h>
+#include <linux/dma-heap.h>
+#include <linux/dma-mapping.h>
 #include <linux/err.h>
-#include <linux/errno.h>
 #include <linux/highmem.h>
+#include <linux/io.h>
+#include <linux/mm.h>
 #include <linux/module.h>
-#include <linux/slab.h>
 #include <linux/scatterlist.h>
-#include <linux/sched/signal.h>
+#include <linux/slab.h>
 
-#include "heap-helpers.h"
 
 struct cma_heap {
 	struct dma_heap *heap;
 	struct cma *cma;
 };
 
-static void cma_heap_free(struct heap_helper_buffer *buffer)
+struct cma_heap_buffer {
+	struct cma_heap *heap;
+	struct list_head attachments;
+	struct mutex lock;
+	unsigned long len;
+	struct page *cma_pages;
+	struct page **pages;
+	pgoff_t pagecount;
+	int vmap_cnt;
+	void *vaddr;
+};
+
+struct dma_heap_attachment {
+	struct device *dev;
+	struct sg_table table;
+	struct list_head list;
+};
+
+static int cma_heap_attach(struct dma_buf *dmabuf,
+			   struct dma_buf_attachment *attachment)
 {
-	struct cma_heap *cma_heap = dma_heap_get_drvdata(buffer->heap);
-	unsigned long nr_pages = buffer->pagecount;
-	struct page *cma_pages = buffer->priv_virt;
+	struct cma_heap_buffer *buffer = dmabuf->priv;
+	struct dma_heap_attachment *a;
+	int ret;
 
-	/* free page list */
-	kfree(buffer->pages);
-	/* release memory */
-	cma_release(cma_heap->cma, cma_pages, nr_pages);
+	a = kzalloc(sizeof(*a), GFP_KERNEL);
+	if (!a)
+		return -ENOMEM;
+
+	ret = sg_alloc_table_from_pages(&a->table, buffer->pages,
+					buffer->pagecount, 0,
+					buffer->pagecount << PAGE_SHIFT,
+					GFP_KERNEL);
+	if (ret) {
+		kfree(a);
+		return ret;
+	}
+
+	a->dev = attachment->dev;
+	INIT_LIST_HEAD(&a->list);
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
+static void cma_heap_detatch(struct dma_buf *dmabuf,
+			     struct dma_buf_attachment *attachment)
+{
+	struct cma_heap_buffer *buffer = dmabuf->priv;
+	struct dma_heap_attachment *a = attachment->priv;
+
+	mutex_lock(&buffer->lock);
+	list_del(&a->list);
+	mutex_unlock(&buffer->lock);
+
+	sg_free_table(&a->table);
+	kfree(a);
+}
+
+static struct sg_table *cma_heap_map_dma_buf(struct dma_buf_attachment *attachment,
+					     enum dma_data_direction direction)
+{
+	struct dma_heap_attachment *a = attachment->priv;
+	struct sg_table *table = &a->table;
+
+	if (!dma_map_sg(attachment->dev, table->sgl, table->nents,
+			direction))
+		table = ERR_PTR(-ENOMEM);
+	return table;
+}
+
+static void cma_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
+				   struct sg_table *table,
+				   enum dma_data_direction direction)
+{
+	dma_unmap_sg(attachment->dev, table->sgl, table->nents, direction);
+}
+
+static int cma_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
+					     enum dma_data_direction direction)
+{
+	struct cma_heap_buffer *buffer = dmabuf->priv;
+	struct dma_heap_attachment *a;
+	int ret = 0;
+
+	if (buffer->vmap_cnt)
+		invalidate_kernel_vmap_range(buffer->vaddr, buffer->len);
+
+	mutex_lock(&buffer->lock);
+	list_for_each_entry(a, &buffer->attachments, list) {
+		dma_sync_sg_for_cpu(a->dev, a->table.sgl, a->table.nents,
+				    direction);
+	}
+	mutex_unlock(&buffer->lock);
+
+	return ret;
+}
+
+static int cma_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
+					   enum dma_data_direction direction)
+{
+	struct cma_heap_buffer *buffer = dmabuf->priv;
+	struct dma_heap_attachment *a;
+
+	if (buffer->vmap_cnt)
+		flush_kernel_vmap_range(buffer->vaddr, buffer->len);
+
+	mutex_lock(&buffer->lock);
+	list_for_each_entry(a, &buffer->attachments, list) {
+		dma_sync_sg_for_device(a->dev, a->table.sgl, a->table.nents,
+				       direction);
+	}
+	mutex_unlock(&buffer->lock);
+
+	return 0;
+}
+
+static vm_fault_t cma_heap_vm_fault(struct vm_fault *vmf)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	struct cma_heap_buffer *buffer = vma->vm_private_data;
+
+	if (vmf->pgoff > buffer->pagecount)
+		return VM_FAULT_SIGBUS;
+
+	vmf->page = buffer->pages[vmf->pgoff];
+	get_page(vmf->page);
+
+	return 0;
+}
+
+static const struct vm_operations_struct dma_heap_vm_ops = {
+	.fault = cma_heap_vm_fault,
+};
+
+static int cma_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
+{
+	struct cma_heap_buffer *buffer = dmabuf->priv;
+
+	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
+		return -EINVAL;
+
+	vma->vm_ops = &dma_heap_vm_ops;
+	vma->vm_private_data = buffer;
+
+	return 0;
+}
+
+static void *cma_heap_do_vmap(struct cma_heap_buffer *buffer)
+{
+	void *vaddr;
+
+	vaddr = vmap(buffer->pages, buffer->pagecount, VM_MAP, PAGE_KERNEL);
+	if (!vaddr)
+		return ERR_PTR(-ENOMEM);
+
+	return vaddr;
+}
+
+static void *cma_heap_vmap(struct dma_buf *dmabuf)
+{
+	struct cma_heap_buffer *buffer = dmabuf->priv;
+	void *vaddr;
+
+	mutex_lock(&buffer->lock);
+	if (buffer->vmap_cnt) {
+		buffer->vmap_cnt++;
+		return buffer->vaddr;
+	}
+
+	vaddr = cma_heap_do_vmap(buffer);
+	if (IS_ERR(vaddr))
+		return vaddr;
+
+	buffer->vaddr = vaddr;
+	buffer->vmap_cnt++;
+	mutex_unlock(&buffer->lock);
+
+	return vaddr;
+}
+
+static void cma_heap_vunmap(struct dma_buf *dmabuf, void *vaddr)
+{
+	struct cma_heap_buffer *buffer = dmabuf->priv;
+
+	mutex_lock(&buffer->lock);
+	if (!--buffer->vmap_cnt) {
+		vunmap(buffer->vaddr);
+		buffer->vaddr = NULL;
+	}
+	mutex_unlock(&buffer->lock);
+}
+
+static void cma_heap_dma_buf_release(struct dma_buf *dmabuf)
+{
+	struct cma_heap_buffer *buffer = dmabuf->priv;
+	struct cma_heap *cma_heap = buffer->heap;
+
+	if (buffer->vmap_cnt > 0) {
+		WARN(1, "%s: buffer still mapped in the kernel\n", __func__);
+		vunmap(buffer->vaddr);
+	}
+
+	cma_release(cma_heap->cma, buffer->cma_pages, buffer->pagecount);
 	kfree(buffer);
 }
 
-/* dmabuf heap CMA operations functions */
+const struct dma_buf_ops cma_heap_buf_ops = {
+	.attach = cma_heap_attach,
+	.detach = cma_heap_detatch,
+	.map_dma_buf = cma_heap_map_dma_buf,
+	.unmap_dma_buf = cma_heap_unmap_dma_buf,
+	.begin_cpu_access = cma_heap_dma_buf_begin_cpu_access,
+	.end_cpu_access = cma_heap_dma_buf_end_cpu_access,
+	.mmap = cma_heap_mmap,
+	.vmap = cma_heap_vmap,
+	.vunmap = cma_heap_vunmap,
+	.release = cma_heap_dma_buf_release,
+};
+
 static int cma_heap_allocate(struct dma_heap *heap,
-			     unsigned long len,
-			     unsigned long fd_flags,
-			     unsigned long heap_flags)
+				  unsigned long len,
+				  unsigned long fd_flags,
+				  unsigned long heap_flags)
 {
 	struct cma_heap *cma_heap = dma_heap_get_drvdata(heap);
-	struct heap_helper_buffer *helper_buffer;
-	struct page *cma_pages;
+	struct cma_heap_buffer *buffer;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	size_t size = PAGE_ALIGN(len);
-	unsigned long nr_pages = size >> PAGE_SHIFT;
+	pgoff_t pagecount = size >> PAGE_SHIFT;
 	unsigned long align = get_order(size);
+	struct page *cma_pages;
 	struct dma_buf *dmabuf;
-	int ret = -ENOMEM;
 	pgoff_t pg;
+	int ret;
 
-	if (align > CONFIG_CMA_ALIGNMENT)
-		align = CONFIG_CMA_ALIGNMENT;
-
-	helper_buffer = kzalloc(sizeof(*helper_buffer), GFP_KERNEL);
-	if (!helper_buffer)
+	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
+	if (!buffer)
 		return -ENOMEM;
 
-	init_heap_helper_buffer(helper_buffer, cma_heap_free);
-	helper_buffer->heap = heap;
-	helper_buffer->size = len;
+	INIT_LIST_HEAD(&buffer->attachments);
+	mutex_init(&buffer->lock);
+	buffer->len = size;
 
-	cma_pages = cma_alloc(cma_heap->cma, nr_pages, align, false);
+	if (align > CONFIG_CMA_ALIGNMENT)
+		align = CONFIG_CMA_ALIGNMENT;
+
+	cma_pages = cma_alloc(cma_heap->cma, pagecount, align, false);
 	if (!cma_pages)
-		goto free_buf;
+		goto free_buffer;
 
+	/* Clear the cma pages */
 	if (PageHighMem(cma_pages)) {
-		unsigned long nr_clear_pages = nr_pages;
+		unsigned long nr_clear_pages = pagecount;
 		struct page *page = cma_pages;
 
 		while (nr_clear_pages > 0) {
@@ -85,7 +300,6 @@ static int cma_heap_allocate(struct dma_heap *heap,
 			 */
 			if (fatal_signal_pending(current))
 				goto free_cma;
-
 			page++;
 			nr_clear_pages--;
 		}
@@ -93,28 +307,30 @@ static int cma_heap_allocate(struct dma_heap *heap,
 		memset(page_address(cma_pages), 0, size);
 	}
 
-	helper_buffer->pagecount = nr_pages;
-	helper_buffer->pages = kmalloc_array(helper_buffer->pagecount,
-					     sizeof(*helper_buffer->pages),
-					     GFP_KERNEL);
-	if (!helper_buffer->pages) {
+	buffer->pages = kmalloc_array(pagecount, sizeof(*buffer->pages), GFP_KERNEL);
+	if (!buffer->pages) {
 		ret = -ENOMEM;
 		goto free_cma;
 	}
 
-	for (pg = 0; pg < helper_buffer->pagecount; pg++)
-		helper_buffer->pages[pg] = &cma_pages[pg];
+	for (pg = 0; pg < pagecount; pg++)
+		buffer->pages[pg] = &cma_pages[pg];
+
+	buffer->cma_pages = cma_pages;
+	buffer->heap = cma_heap;
+	buffer->pagecount = pagecount;
 
 	/* create the dmabuf */
-	dmabuf = heap_helper_export_dmabuf(helper_buffer, fd_flags);
+	exp_info.ops = &cma_heap_buf_ops;
+	exp_info.size = buffer->len;
+	exp_info.flags = fd_flags;
+	exp_info.priv = buffer;
+	dmabuf = dma_buf_export(&exp_info);
 	if (IS_ERR(dmabuf)) {
 		ret = PTR_ERR(dmabuf);
 		goto free_pages;
 	}
 
-	helper_buffer->dmabuf = dmabuf;
-	helper_buffer->priv_virt = cma_pages;
-
 	ret = dma_buf_fd(dmabuf, fd_flags);
 	if (ret < 0) {
 		dma_buf_put(dmabuf);
@@ -125,15 +341,16 @@ static int cma_heap_allocate(struct dma_heap *heap,
 	return ret;
 
 free_pages:
-	kfree(helper_buffer->pages);
+	kfree(buffer->pages);
 free_cma:
-	cma_release(cma_heap->cma, cma_pages, nr_pages);
-free_buf:
-	kfree(helper_buffer);
+	cma_release(cma_heap->cma, cma_pages, pagecount);
+free_buffer:
+	kfree(buffer);
+
 	return ret;
 }
 
-static const struct dma_heap_ops cma_heap_ops = {
+static struct dma_heap_ops cma_heap_ops = {
 	.allocate = cma_heap_allocate,
 };
 
@@ -175,3 +392,4 @@ static int add_default_cma_heap(void)
 module_init(add_default_cma_heap);
 MODULE_DESCRIPTION("DMA-BUF CMA Heap");
 MODULE_LICENSE("GPL v2");
+
-- 
2.17.1

