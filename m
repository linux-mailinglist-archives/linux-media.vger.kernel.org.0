Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9C12ACC1E
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 04:50:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731131AbgKJDuY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 22:50:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730035AbgKJDtm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 22:49:42 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0F1FC0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 19:49:41 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id 62so8969378pgg.12
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 19:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OmsT0T4sZQ5qfYwtasILv6pAOqrhf0OxNN9/C1pO7z0=;
        b=sJtkig7dniR6SLSiAM+DXO2Ea5X4qd3nZU2gqVvwNDHoICOjajRMUf+yVGY1qj/Tjg
         Pehgno3gZKHDJU9imDJijrOPNXqVj0Rt6OasXZfc5WCpXuRLmoXtiBQxBLqmuaH9QxlV
         LrMsyCe+4wopeYR5N78yEG2m0j4oIyiUbMZbrL2TtKWuk88EVY57sbmv9hDMztrBjIHi
         RJ/qGPZB10dkM+QMzFMaOHrolq0KnMcqgPYlorFMwgI3CQjpFzP35VGcbLhzZiN20ShG
         k8N2W7zxM0BlTQiBJHQApJecZqyZoJQDmZ72WGPCtT0GDckbhtNVlSZ2zIfu8ICkPtni
         R3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OmsT0T4sZQ5qfYwtasILv6pAOqrhf0OxNN9/C1pO7z0=;
        b=ss55fNjYof/Qbxq/7n/S1GtRJTT28KZ5cSRK/eyoxtHt83rcwxGJC99E1zjqAleXCT
         Lv8XNFLPZNLtGvC7ZCeOFA9DJ4oYk3up+GqUxnrL8WRHGq9POp6g1HYnnpCHZ7txhAIW
         tDMkGT4c/T9YSYB9WRyG+5eVpWcR15701I1WHbS22955dMurd8s2+MNZAY96OE/T4SW0
         W5SudBzztdo3WNub6DmVFbAuN6nk/QFwO3bNlf0sCi8X7Zs9l4x2GCJQkdcpCZUVkQWT
         1j7BJ9PZXeeoGG3YZpd8Skq4Ty5YLXqnLvf26EfN9QCAHaHLXzQiPEHYksbAQkNEqM/U
         O+7Q==
X-Gm-Message-State: AOAM533NC+/O0pEY35MJk2klEidJZ3Xa6vvgxWjV7vzeZc604UvVpSZJ
        aZsQaiAom6YufN2uanIXRKlkcmzRRFh7nw==
X-Google-Smtp-Source: ABdhPJx/Ojfx97b38KOrhidguwbQ21oTCusnXXKkEGbGRRpCijiDGKWP1xE6P8O2Tc0jWlJZ2lNCKQ==
X-Received: by 2002:a17:90a:6283:: with SMTP id d3mr2702275pjj.96.1604980181312;
        Mon, 09 Nov 2020 19:49:41 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id b4sm12380693pfi.208.2020.11.09.19.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 19:49:40 -0800 (PST)
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
        Daniel Mentz <danielmentz@google.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v5 2/7] dma-buf: heaps: Move heap-helper logic into the cma_heap implementation
Date:   Tue, 10 Nov 2020 03:49:29 +0000
Message-Id: <20201110034934.70898-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201110034934.70898-1-john.stultz@linaro.org>
References: <20201110034934.70898-1-john.stultz@linaro.org>
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
Cc: Daniel Mentz <danielmentz@google.com>
Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Brian Starkey <brian.starkey@arm.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v2:
* Fix unused return value and locking issue Reported-by:
    kernel test robot <lkp@intel.com>
    Julia Lawall <julia.lawall@inria.fr>
* Make cma_heap_buf_ops static suggested by
    kernel test robot <lkp@intel.com>
* Fix uninitialized return in cma Reported-by:
    kernel test robot <lkp@intel.com>
* Minor cleanups
v3:
* Use the new sgtable mapping functions, as Suggested-by:
     Daniel Mentz <danielmentz@google.com>
v4:
* Spelling fix suggested by BrianS
---
 drivers/dma-buf/heaps/cma_heap.c | 314 ++++++++++++++++++++++++++-----
 1 file changed, 265 insertions(+), 49 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index e55384dc115b..5341e5e226d5 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -2,76 +2,290 @@
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
 #include <linux/dma-heap.h>
 #include <linux/dma-map-ops.h>
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
+static void cma_heap_detach(struct dma_buf *dmabuf,
+			    struct dma_buf_attachment *attachment)
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
+	int ret;
+
+	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
+	if (ret)
+		return ERR_PTR(-ENOMEM);
+	return table;
+}
+
+static void cma_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
+				   struct sg_table *table,
+				   enum dma_data_direction direction)
+{
+	dma_unmap_sgtable(attachment->dev, table, direction, 0);
+}
+
+static int cma_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
+					     enum dma_data_direction direction)
+{
+	struct cma_heap_buffer *buffer = dmabuf->priv;
+	struct dma_heap_attachment *a;
+
+	if (buffer->vmap_cnt)
+		invalidate_kernel_vmap_range(buffer->vaddr, buffer->len);
+
+	mutex_lock(&buffer->lock);
+	list_for_each_entry(a, &buffer->attachments, list) {
+		dma_sync_sgtable_for_cpu(a->dev, &a->table, direction);
+	}
+	mutex_unlock(&buffer->lock);
+
+	return 0;
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
+		dma_sync_sgtable_for_device(a->dev, &a->table, direction);
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
+		vaddr = buffer->vaddr;
+		goto out;
+	}
+
+	vaddr = cma_heap_do_vmap(buffer);
+	if (IS_ERR(vaddr))
+		goto out;
+
+	buffer->vaddr = vaddr;
+	buffer->vmap_cnt++;
+out:
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
+static const struct dma_buf_ops cma_heap_buf_ops = {
+	.attach = cma_heap_attach,
+	.detach = cma_heap_detach,
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
 	int ret = -ENOMEM;
 	pgoff_t pg;
 
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
+
+	if (align > CONFIG_CMA_ALIGNMENT)
+		align = CONFIG_CMA_ALIGNMENT;
 
-	cma_pages = cma_alloc(cma_heap->cma, nr_pages, align, false);
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
@@ -85,7 +299,6 @@ static int cma_heap_allocate(struct dma_heap *heap,
 			 */
 			if (fatal_signal_pending(current))
 				goto free_cma;
-
 			page++;
 			nr_clear_pages--;
 		}
@@ -93,28 +306,30 @@ static int cma_heap_allocate(struct dma_heap *heap,
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
@@ -125,11 +340,12 @@ static int cma_heap_allocate(struct dma_heap *heap,
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
 
-- 
2.17.1

